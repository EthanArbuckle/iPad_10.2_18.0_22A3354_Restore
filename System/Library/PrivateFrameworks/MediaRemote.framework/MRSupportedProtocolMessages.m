@implementation MRSupportedProtocolMessages

- (MRSupportedProtocolMessages)initWithAllSupportedMessages
{
  return -[MRSupportedProtocolMessages initWithLastSupportedMessageType:](self, "initWithLastSupportedMessageType:", 134);
}

- (MRSupportedProtocolMessages)initWithLastSupportedMessageType:(unint64_t)a3
{
  MRSupportedProtocolMessages *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRSupportedProtocolMessages;
  result = -[MRSupportedProtocolMessages init](&v5, sel_init);
  if (result)
    result->_lastSupportedMessageType = a3;
  return result;
}

- (MRSupportedProtocolMessages)initWithCoder:(id)a3
{
  return -[MRSupportedProtocolMessages initWithLastSupportedMessageType:](self, "initWithLastSupportedMessageType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("lastSupportedMessageType")));
}

- (BOOL)isSupported:(unint64_t)a3
{
  return self->_lastSupportedMessageType > a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_lastSupportedMessageType, CFSTR("lastSupportedMessageType"));
}

- (unint64_t)lastSupportedMessageType
{
  return self->_lastSupportedMessageType;
}

@end
