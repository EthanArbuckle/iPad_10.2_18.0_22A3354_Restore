@implementation IMMessageItemChatContext

- (IMMessage)message
{
  return self->_message;
}

- (BOOL)invitation
{
  return self->_invitation;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IMMessageItemChatContext;
  -[IMItemChatContext dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

- (void)setInvitation:(BOOL)a3
{
  self->_invitation = a3;
}

@end
