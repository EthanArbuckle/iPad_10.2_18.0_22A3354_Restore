@implementation CLMiLoPlaceConfidenceReason

- (CLMiLoPlaceConfidenceReason)initWithConfidenceReasonEnum:(unint64_t)a3
{
  CLMiLoPlaceConfidenceReason *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLMiLoPlaceConfidenceReason;
  result = -[CLMiLoPlaceConfidenceReason init](&v5, sel_init);
  if (result)
    result->_confidenceReasonEnum = a3;
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
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithConfidenceReasonEnum_, self->_confidenceReasonEnum, v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoPlaceConfidenceReason)initWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_decodeIntegerForKey_(a3, a2, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlaceConfidenceReasonEnum"), v3);
  return (CLMiLoPlaceConfidenceReason *)MEMORY[0x1E0DE7D20](self, sel_initWithConfidenceReasonEnum_, v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_confidenceReasonEnum, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlaceConfidenceReasonEnum"));
}

- (unint64_t)confidenceReasonEnum
{
  return self->_confidenceReasonEnum;
}

@end
