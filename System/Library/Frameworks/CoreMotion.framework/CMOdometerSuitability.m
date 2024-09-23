@implementation CMOdometerSuitability

- (CMOdometerSuitability)initWithStartDate:(id)a3 suitableForRunning:(BOOL)a4 suitableForWalking:(BOOL)a5
{
  CMOdometerSuitability *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMOdometerSuitability;
  v8 = -[CMOdometerSuitability init](&v10, sel_init);
  if (v8)
  {
    v8->_startDate = (NSDate *)a3;
    v8->_suitableForRunning = a4;
    v8->_suitableForWalking = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMOdometerSuitability;
  -[CMOdometerSuitability dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)objc_msgSend_initWithStartDate_suitableForRunning_suitableForWalking_(v9, v10, (uint64_t)self->_startDate, self->_suitableForRunning, self->_suitableForWalking);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMOdometerSuitability)initWithCoder:(id)a3
{
  CMOdometerSuitability *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CMOdometerSuitability;
  v4 = -[CMOdometerSuitability init](&v25, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_startDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMOdometerSuitabilityCodingKeyStartDate"), v7);
    v8 = objc_opt_class();
    v11 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMOdometerSuitabilityCodingKeySuitableForRunning"), v10);
    v4->_suitableForRunning = objc_msgSend_BOOLValue(v11, v12, v13, v14, v15);
    v16 = objc_opt_class();
    v19 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCMOdometerSuitabilityCodingKeySuitableForWalking"), v18);
    v4->_suitableForWalking = objc_msgSend_BOOLValue(v19, v20, v21, v22, v23);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_startDate, (uint64_t)CFSTR("kCMOdometerSuitabilityCodingKeyStartDate"), v3);
  v9 = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v6, self->_suitableForRunning, v7, v8);
  objc_msgSend_encodeObject_forKey_(a3, v10, v9, (uint64_t)CFSTR("kCMOdometerSuitabilityCodingKeySuitableForRunning"), v11);
  v15 = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v12, self->_suitableForWalking, v13, v14);
  objc_msgSend_encodeObject_forKey_(a3, v16, v15, (uint64_t)CFSTR("kCMOdometerSuitabilityCodingKeySuitableForWalking"), v17);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v9 = "true";
  if (self->_suitableForRunning)
    v10 = "true";
  else
    v10 = "false";
  if (!self->_suitableForWalking)
    v9 = "false";
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("%@,<startDate %@, suitableForRunning %s, suitableForWalking %s>"), v7, v8, v5, self->_startDate, v10, v9);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (BOOL)suitableForRunning
{
  return self->_suitableForRunning;
}

- (BOOL)suitableForWalking
{
  return self->_suitableForWalking;
}

- (id)binarySampleRepresentation
{
  void *v3;
  const char *v4;
  id v5;

  v3 = (void *)MEMORY[0x194001B4C](self, a2);
  v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v4, (uint64_t)self, 1, 0);
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (CMOdometerSuitability)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMOdometerSuitability *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (!objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
    return 0;
  v15.receiver = self;
  v15.super_class = (Class)CMOdometerSuitability;
  v8 = -[CMOdometerSuitability init](&v15, sel_init);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3710];
    v10 = objc_opt_class();
    v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
    if (v12)
    {
      v13 = (void *)v12;

      return (CMOdometerSuitability *)v13;
    }
  }
  return v8;
}

@end
