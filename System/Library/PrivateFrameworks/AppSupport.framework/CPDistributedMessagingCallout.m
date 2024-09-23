@implementation CPDistributedMessagingCallout

- (CPDistributedMessagingCallout)initWithTarget:(id)a3 selector:(SEL)a4
{
  CPDistributedMessagingCallout *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPDistributedMessagingCallout;
  v6 = -[CPDistributedMessagingCallout init](&v9, sel_init);
  if (v6)
  {
    v7 = a3;
    v6->_target = v7;
    v6->_selector = a4;
    v6->_returnsVoid = objc_msgSend((id)objc_msgSend(v7, "methodSignatureForSelector:", a4), "methodReturnLength") == 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPDistributedMessagingCallout;
  -[CPDistributedMessagingCallout dealloc](&v3, sel_dealloc);
}

- (id)target
{
  return self->_target;
}

- (SEL)selector
{
  return self->_selector;
}

- (BOOL)returnsVoid
{
  return self->_returnsVoid;
}

@end
