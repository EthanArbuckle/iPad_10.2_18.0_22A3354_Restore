@implementation CUIKIntegrationAlert

- (CUIKIntegrationAlert)initWithTitle:(id)a3 message:(id)a4 actions:(id)a5 cancelBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CUIKIntegrationAlert *v15;
  CUIKIntegrationAlert *v16;
  void *v17;
  id cancelBlock;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CUIKIntegrationAlert;
  v15 = -[CUIKIntegrationAlert init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_message, a4);
    objc_storeStrong((id *)&v16->_actions, a5);
    v17 = _Block_copy(v14);
    cancelBlock = v16->_cancelBlock;
    v16->_cancelBlock = v17;

  }
  return v16;
}

- (void)cancel
{
  (*((void (**)(void))self->_cancelBlock + 2))();
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
}

@end
