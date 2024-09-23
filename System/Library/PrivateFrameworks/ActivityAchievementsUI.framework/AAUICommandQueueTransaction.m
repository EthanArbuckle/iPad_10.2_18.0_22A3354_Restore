@implementation AAUICommandQueueTransaction

- (AAUICommandQueueTransaction)init
{
  AAUICommandQueueTransaction *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAUICommandQueueTransaction;
  v2 = -[AAUICommandQueueTransaction init](&v5, sel_init);
  if (v2)
  {
    +[AAUICommandQueueRegistry sharedRegistry](AAUICommandQueueRegistry, "sharedRegistry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addCommandQueueTransaction:", v2);

  }
  return v2;
}

+ (id)sharedDevice
{
  void *v2;
  void *v3;

  +[AAUICommandQueueRegistry sharedRegistry](AAUICommandQueueRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)commandQueue
{
  void *v2;
  void *v3;

  +[AAUICommandQueueRegistry sharedRegistry](AAUICommandQueueRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[AAUICommandQueueRegistry sharedRegistry](AAUICommandQueueRegistry, "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeCommandQueueTransaction:", self);

  v4.receiver = self;
  v4.super_class = (Class)AAUICommandQueueTransaction;
  -[AAUICommandQueueTransaction dealloc](&v4, sel_dealloc);
}

@end
