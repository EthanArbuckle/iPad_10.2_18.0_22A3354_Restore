@implementation CLMiLoGenericEventResponse

- (CLMiLoGenericEventResponse)initWithEventType:(unint64_t)a3 withDescription:(id)a4 withError:(id)a5
{
  CLMiLoGenericEventResponse *v8;
  CLMiLoGenericEventResponse *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLMiLoGenericEventResponse;
  v8 = -[CLMiLoGenericEventResponse init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_eventType = a3;
    v8->_genericEventDescription = (NSString *)a4;
    v9->_error = (NSError *)a5;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMiLoGenericEventResponse;
  -[CLMiLoGenericEventResponse dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithEventType_withDescription_withError_, self->_eventType, self->_genericEventDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoGenericEventResponse)initWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;

  v6 = objc_msgSend_decodeIntegerForKey_(a3, a2, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyGenericEventType"), v3);
  v7 = objc_opt_class();
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyGenericEventDescription"));
  v10 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyGenericEventError"));
  return (CLMiLoGenericEventResponse *)MEMORY[0x1E0DE7D20](self, sel_initWithEventType_withDescription_withError_, v6, v9);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_eventType, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyGenericEventType"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_genericEventDescription, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyGenericEventDescription"));
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_error, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyGenericEventError"));
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (NSString)genericEventDescription
{
  return self->_genericEventDescription;
}

- (NSError)error
{
  return self->_error;
}

@end
