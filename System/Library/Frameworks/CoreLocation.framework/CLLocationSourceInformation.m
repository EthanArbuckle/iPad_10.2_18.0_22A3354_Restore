@implementation CLLocationSourceInformation

- (CLLocationSourceInformation)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CLLocationSourceInformation *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLLocationSourceInformation;
  v7 = -[CLLocationSourceInformation init](&v14, sel_init);
  if (v7)
  {
    if ((objc_msgSend_allowsKeyedCoding(a3, v4, v5, v6) & 1) != 0)
    {
      v7->isSimulatedBySoftware = objc_msgSend_decodeBoolForKey_(a3, v8, (uint64_t)CFSTR("kCLLocationCodingKeyFromSoftwareSimulator"), v9);
      v7->isProducedByAccessory = objc_msgSend_decodeBoolForKey_(a3, v10, (uint64_t)CFSTR("kCLLocationCodingKeyFromExternalAccessory"), v11);
    }
    else
    {
      objc_msgSend_decodeValueOfObjCType_at_(a3, v8, (uint64_t)"B", (uint64_t)&v7->isSimulatedBySoftware);
      objc_msgSend_decodeValueOfObjCType_at_(a3, v12, (uint64_t)"B", (uint64_t)&v7->isProducedByAccessory);
    }
  }
  return v7;
}

- (CLLocationSourceInformation)initWithSoftwareSimulationState:(BOOL)isSoftware andExternalAccessoryState:(BOOL)isAccessory
{
  CLLocationSourceInformation *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLLocationSourceInformation;
  result = -[CLLocationSourceInformation init](&v7, sel_init);
  if (result)
  {
    result->isSimulatedBySoftware = isSoftware;
    result->isProducedByAccessory = isAccessory;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  const char *v7;
  const char *v8;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) != 0)
  {
    objc_msgSend_encodeBool_forKey_(a3, v6, self->isSimulatedBySoftware, (uint64_t)CFSTR("kCLLocationCodingKeyFromSoftwareSimulator"));
    objc_msgSend_encodeBool_forKey_(a3, v7, self->isProducedByAccessory, (uint64_t)CFSTR("kCLLocationCodingKeyFromExternalAccessory"));
  }
  else
  {
    objc_msgSend_encodeValueOfObjCType_at_(a3, v6, (uint64_t)"B", (uint64_t)&self->isSimulatedBySoftware);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v8, (uint64_t)"B", (uint64_t)&self->isProducedByAccessory);
  }
}

- (BOOL)isSimulatedBySoftware
{
  return self->isSimulatedBySoftware;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)objc_msgSend_initWithSoftwareSimulationState_andExternalAccessoryState_(v8, v9, self->isSimulatedBySoftware, self->isProducedByAccessory);
}

- (BOOL)isProducedByAccessory
{
  return self->isProducedByAccessory;
}

@end
