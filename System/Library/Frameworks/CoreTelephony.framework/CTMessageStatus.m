@implementation CTMessageStatus

- (CTMessageStatus)initWithMessageId:(unsigned int)a3 messageType:(int)a4 result:(int)a5
{
  CTMessageStatus *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTMessageStatus;
  result = -[CTMessageStatus init](&v9, sel_init);
  if (result)
  {
    result->_messageId = a3;
    result->_messageType = a4;
    result->_result = a5;
  }
  return result;
}

- (unsigned)messageId
{
  return self->_messageId;
}

- (int)messageType
{
  return self->_messageType;
}

- (int)result
{
  return self->_result;
}

@end
