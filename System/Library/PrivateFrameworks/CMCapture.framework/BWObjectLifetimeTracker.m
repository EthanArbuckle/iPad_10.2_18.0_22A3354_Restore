@implementation BWObjectLifetimeTracker

+ (id)trackerWithDeallocHandler:(id)a3
{
  BWObjectLifetimeTracker *v4;
  _QWORD *v5;
  objc_super v7;

  v4 = [BWObjectLifetimeTracker alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)BWObjectLifetimeTracker;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    if (v5)
      v5[1] = objc_msgSend(a3, "copy");
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)dealloc
{
  void (**deallocHandler)(id, SEL);
  objc_super v4;

  deallocHandler = (void (**)(id, SEL))self->_deallocHandler;
  if (deallocHandler)
  {
    deallocHandler[2](deallocHandler, a2);

  }
  v4.receiver = self;
  v4.super_class = (Class)BWObjectLifetimeTracker;
  -[BWObjectLifetimeTracker dealloc](&v4, sel_dealloc);
}

+ (void)trackAttachmentBearer:(void *)a3 deallocHandler:(id)a4
{
  BWObjectLifetimeTracker *v6;
  _QWORD *v7;
  objc_super v8;

  v6 = [BWObjectLifetimeTracker alloc];
  if (v6)
  {
    v8.receiver = v6;
    v8.super_class = (Class)BWObjectLifetimeTracker;
    v7 = objc_msgSendSuper2(&v8, sel_init);
    if (v7)
      v7[1] = objc_msgSend(a4, "copy");
  }
  else
  {
    v7 = 0;
  }
  CMSetAttachment(a3, CFSTR("BWObjectLifetimeTracker"), v7, 0);

}

@end
