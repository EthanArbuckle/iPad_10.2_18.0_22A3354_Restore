@implementation CLMiLoConnectionStatus

- (CLMiLoConnectionStatus)initWithConnectionState:(unint64_t)a3
{
  CLMiLoConnectionStatus *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLMiLoConnectionStatus;
  result = -[CLMiLoConnectionStatus init](&v5, sel_init);
  if (result)
    result->_connectionState = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)objc_msgSend_initWithConnectionState_(v8, v9, self->_connectionState, v10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoConnectionStatus)initWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v5 = objc_msgSend_decodeIntegerForKey_(a3, a2, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyConnectionState"), v3);
  return (CLMiLoConnectionStatus *)objc_msgSend_initWithConnectionState_(self, v6, v5, v7);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_connectionState, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyConnectionState"));
}

- (unint64_t)connectionState
{
  return self->_connectionState;
}

@end
