@implementation LANotificationProxy

- (LANotificationProxy)initWithTarget:(id)a3
{
  id v4;
  LANotificationProxy *v5;
  LANotificationProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LANotificationProxy;
  v5 = -[LANotificationProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_target, v4);

  return v6;
}

- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[LANotificationProxy target](self, "target");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "newValue:oldValue:completionHandler:", v10, v9, v8);

}

- (LANotificationObserverXPC)target
{
  return (LANotificationObserverXPC *)objc_loadWeakRetained((id *)&self->_target);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end
