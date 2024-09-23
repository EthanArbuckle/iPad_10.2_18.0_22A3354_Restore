@implementation CRKConcreteNotificationCenterSubscription

- (void)dealloc
{
  objc_super v3;

  -[CRKConcreteNotificationCenterSubscription cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteNotificationCenterSubscription;
  -[CRKConcreteNotificationCenterSubscription dealloc](&v3, sel_dealloc);
}

- (CRKConcreteNotificationCenterSubscription)initWithNotificationCenter:(id)a3 object:(id)a4 notificationHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKConcreteNotificationCenterSubscription *v12;
  CRKConcreteNotificationCenterSubscription *v13;
  uint64_t v14;
  id notificationHandler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKConcreteNotificationCenterSubscription;
  v12 = -[CRKConcreteNotificationCenterSubscription init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_notificationCenter, a3);
    objc_storeStrong(&v13->_object, a4);
    v14 = MEMORY[0x219A226E8](v11);
    notificationHandler = v13->_notificationHandler;
    v13->_notificationHandler = (id)v14;

  }
  return v13;
}

+ (id)subscriptionWithNotificationCenter:(id)a3 notificationName:(id)a4 object:(id)a5 notificationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNotificationCenter:object:notificationHandler:", v13, v11, v10);

  objc_msgSend(v13, "addObserver:selector:name:object:", v14, sel_notificationDidFire_, v12, v11);
  return v14;
}

- (void)cancel
{
  void *v3;

  -[CRKConcreteNotificationCenterSubscription notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CRKConcreteNotificationCenterSubscription setNotificationHandler:](self, "setNotificationHandler:", 0);
  -[CRKConcreteNotificationCenterSubscription setObject:](self, "setObject:", 0);
}

- (void)notificationDidFire:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CRKConcreteNotificationCenterSubscription notificationHandler](self, "notificationHandler");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (id)notificationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setNotificationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationHandler, 0);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
