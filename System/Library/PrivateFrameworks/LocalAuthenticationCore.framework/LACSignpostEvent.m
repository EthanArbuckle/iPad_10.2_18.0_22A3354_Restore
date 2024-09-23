@implementation LACSignpostEvent

- (LACSignpostEvent)initWithSendBlock:(id)a3
{
  id v4;
  LACSignpostEvent *v5;
  void *v6;
  id sendBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACSignpostEvent;
  v5 = -[LACSignpostEvent init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    sendBlock = v5->_sendBlock;
    v5->_sendBlock = v6;

  }
  return v5;
}

- (void)send
{
  -[LACSignpostEvent _sendWithMessage:](self, "_sendWithMessage:", 0);
}

- (void)_sendWithMessage:(id)a3
{
  void (**sendBlock)(id, id);

  sendBlock = (void (**)(id, id))self->_sendBlock;
  if (sendBlock)
    sendBlock[2](sendBlock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sendBlock, 0);
}

@end
