@implementation CLMiLoPredictionDeviceDistanceIndication

- (CLMiLoPredictionDeviceDistanceIndication)initWithDeviceIdentifier:(id)a3 uwbRange:(id)a4 bleRSSI:(id)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CLMiLoPredictionDeviceDistanceIndication *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CLMiLoPredictionDeviceDistanceIndication;
  v11 = -[CLMiLoPredictionDeviceDistanceIndication init](&v19, sel_init);
  if (v11)
  {
    v11->_deviceIdentifier = (NSString *)objc_msgSend_copy(a3, v8, v9, v10);
    v11->_uwbRange = (NSNumber *)objc_msgSend_copy(a4, v12, v13, v14);
    v11->_bleRSSI = (NSNumber *)objc_msgSend_copy(a5, v15, v16, v17);
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMiLoPredictionDeviceDistanceIndication;
  -[CLMiLoPredictionDeviceDistanceIndication dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithDeviceIdentifier_uwbRange_bleRSSI_, self->_deviceIdentifier, self->_uwbRange);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoPredictionDeviceDistanceIndication)initWithCoder:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;

  v5 = objc_opt_class();
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyDeviceDistanceIndicationDeviceIdentifier"));
  v8 = objc_opt_class();
  v10 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyDeviceDistanceIndicationUwbRange"));
  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyDeviceDistanceIndicationBleRSSI"));
  return (CLMiLoPredictionDeviceDistanceIndication *)MEMORY[0x1E0DE7D20](self, sel_initWithDeviceIdentifier_uwbRange_bleRSSI_, v7, v10);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_deviceIdentifier, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyDeviceDistanceIndicationDeviceIdentifier"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_uwbRange, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyDeviceDistanceIndicationUwbRange"));
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_bleRSSI, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyDeviceDistanceIndicationBleRSSI"));
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSNumber)uwbRange
{
  return self->_uwbRange;
}

- (NSNumber)bleRSSI
{
  return self->_bleRSSI;
}

@end
