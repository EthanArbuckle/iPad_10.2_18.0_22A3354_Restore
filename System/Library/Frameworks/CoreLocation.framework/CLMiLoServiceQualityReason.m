@implementation CLMiLoServiceQualityReason

- (CLMiLoServiceQualityReason)initWithQualityReasonEnum:(unint64_t)a3
{
  CLMiLoServiceQualityReason *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLMiLoServiceQualityReason;
  result = -[CLMiLoServiceQualityReason init](&v5, sel_init);
  if (result)
    result->_qualityReasonEnum = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithQualityReasonEnum_, self->_qualityReasonEnum, v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoServiceQualityReason)initWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_decodeIntegerForKey_(a3, a2, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceQualityReason"), v3);
  return (CLMiLoServiceQualityReason *)MEMORY[0x1E0DE7D20](self, sel_initWithQualityReasonEnum_, v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_qualityReasonEnum, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceQualityReason"));
}

- (unint64_t)qualityReasonEnum
{
  return self->_qualityReasonEnum;
}

@end
