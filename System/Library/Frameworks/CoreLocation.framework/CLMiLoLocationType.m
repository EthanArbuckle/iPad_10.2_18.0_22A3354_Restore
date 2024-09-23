@implementation CLMiLoLocationType

- (CLMiLoLocationType)initWithLocationTypeEnum:(unint64_t)a3
{
  CLMiLoLocationType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLMiLoLocationType;
  result = -[CLMiLoLocationType init](&v5, sel_init);
  if (result)
    result->_locationType = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_locationType(self, v9, v10, v11);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithLocationTypeEnum_, v12, v13);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoLocationType)initWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_decodeIntegerForKey_(a3, a2, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyLocationType"), v3);
  return (CLMiLoLocationType *)MEMORY[0x1E0DE7D20](self, sel_initWithLocationTypeEnum_, v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_locationType, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyLocationType"));
}

- (unint64_t)locationType
{
  return self->_locationType;
}

@end
