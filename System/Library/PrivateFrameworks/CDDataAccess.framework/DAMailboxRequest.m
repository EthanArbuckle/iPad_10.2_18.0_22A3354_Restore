@implementation DAMailboxRequest

- (DAMailboxRequest)init
{
  DAMailboxRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DAMailboxRequest;
  result = -[DAMailboxRequest init](&v3, sel_init);
  if (result)
    result->_bodyFormat = -1;
  return result;
}

- (int)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int)a3
{
  self->_requestType = a3;
}

- (int)bodyFormat
{
  return self->_bodyFormat;
}

- (void)setBodyFormat:(int)a3
{
  self->_bodyFormat = a3;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);
}

@end
