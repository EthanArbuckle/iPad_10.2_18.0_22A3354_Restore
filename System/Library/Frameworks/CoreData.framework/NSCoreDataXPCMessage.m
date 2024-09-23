@implementation NSCoreDataXPCMessage

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_messageCode, CFSTR("NSCoreDataXPCMessageCode"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_messageBody, CFSTR("NSCoreDataXPCMessageBody"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_token, CFSTR("NSCoreDataXPCMessageToken"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_contextName, CFSTR("NSCoreDataXPCMessageContextName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_contextTransactionAuthor, CFSTR("NSCoreDataXPCMessageContextTransactionAuthor"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_processName, CFSTR("NSCoreDataXPCMessageProcessName"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_allowAncillary, CFSTR("NSCoreDataXPCMessageContextAllowAncillary"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSCoreDataXPCMessage)initWithCoder:(id)a3
{
  NSCoreDataXPCMessage *v4;

  v4 = -[NSCoreDataXPCMessage init](self, "init");
  if (v4)
  {
    v4->_messageCode = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSCoreDataXPCMessageCode"));
    v4->_messageBody = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSCoreDataXPCMessageBody"));
    v4->_token = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSCoreDataXPCMessageToken"));
    v4->_contextName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSCoreDataXPCMessageContextName"));
    v4->_contextTransactionAuthor = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSCoreDataXPCMessageContextTransactionAuthor"));
    v4->_processName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSCoreDataXPCMessageProcessName"));
    v4->_allowAncillary = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSCoreDataXPCMessageContextAllowAncillary"));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_messageBody = 0;
  self->_token = 0;

  self->_contextName = 0;
  self->_contextTransactionAuthor = 0;

  self->_processName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCoreDataXPCMessage;
  -[NSCoreDataXPCMessage dealloc](&v3, sel_dealloc);
}

@end
