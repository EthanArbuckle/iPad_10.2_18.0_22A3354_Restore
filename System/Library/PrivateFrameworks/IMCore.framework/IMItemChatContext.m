@implementation IMItemChatContext

- (void)setSenderHandle:(id)a3
{
  objc_storeStrong((id *)&self->_senderHandle, a3);
}

- (void)setOtherHandle:(id)a3
{
  objc_storeStrong((id *)&self->_otherHandle, a3);
}

- (IMHandle)senderHandle
{
  return self->_senderHandle;
}

- (IMHandle)otherHandle
{
  return self->_otherHandle;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IMItemChatContext;
  -[IMItemChatContext dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherHandle, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
}

@end
