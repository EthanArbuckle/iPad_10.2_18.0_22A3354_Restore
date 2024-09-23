@implementation MRMessageReplyIdentifier

- (unint64_t)messageNumber
{
  return self->_messageNumber;
}

- (void)setMessageNumber:(unint64_t)a3
{
  self->_messageNumber = a3;
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reply, 0);
}

@end
