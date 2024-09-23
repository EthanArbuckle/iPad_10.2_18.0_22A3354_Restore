@implementation _AMSNotificationObservable

- (_AMSNotificationObservable)initWithNotification:(id)a3 object:(id)a4
{
  id v6;
  id v7;
  _AMSNotificationObservable *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_AMSNotificationObservable;
  v8 = -[AMSObservable init](&v11, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel__receivedNotification_, v6, v7);

  }
  return v8;
}

- (BOOL)cancel
{
  _BOOL4 v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_AMSNotificationObservable;
  v3 = -[AMSObservable cancel](&v6, sel_cancel);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

  }
  return v3;
}

- (BOOL)sendCompletion
{
  _BOOL4 v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_AMSNotificationObservable;
  v3 = -[AMSObservable sendCompletion](&v6, sel_sendCompletion);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

  }
  return v3;
}

@end
