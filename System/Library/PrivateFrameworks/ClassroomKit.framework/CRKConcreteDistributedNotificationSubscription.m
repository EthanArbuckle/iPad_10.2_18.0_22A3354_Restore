@implementation CRKConcreteDistributedNotificationSubscription

- (void)dealloc
{
  objc_super v3;

  -[CRKConcreteDistributedNotificationSubscription cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteDistributedNotificationSubscription;
  -[CRKConcreteDistributedNotificationSubscription dealloc](&v3, sel_dealloc);
}

- (CRKConcreteDistributedNotificationSubscription)initWithNotificationName:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  CRKConcreteDistributedNotificationSubscription *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  id handler;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKConcreteDistributedNotificationSubscription;
  v8 = -[CRKConcreteDistributedNotificationSubscription init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = MEMORY[0x219A226E8](v7);
    handler = v8->_handler;
    v8->_handler = (id)v11;

  }
  return v8;
}

- (void)resume
{
  __CFNotificationCenter *v3;
  __CFString *v4;

  if (!-[CRKConcreteDistributedNotificationSubscription isActive](self, "isActive"))
  {
    -[CRKConcreteDistributedNotificationSubscription setActive:](self, "setActive:", 1);
    v3 = -[CRKConcreteDistributedNotificationSubscription center](self, "center");
    -[CRKConcreteDistributedNotificationSubscription name](self, "name");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v3, self, (CFNotificationCallback)notificationDidFireCFunction, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
}

- (void)notificationDidFire:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a3;
  if (-[CRKConcreteDistributedNotificationSubscription isActive](self, "isActive"))
  {
    -[CRKConcreteDistributedNotificationSubscription handler](self, "handler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

  }
}

- (void)cancel
{
  __CFNotificationCenter *v3;
  __CFString *v4;

  if (-[CRKConcreteDistributedNotificationSubscription isActive](self, "isActive"))
  {
    -[CRKConcreteDistributedNotificationSubscription setActive:](self, "setActive:", 0);
    v3 = -[CRKConcreteDistributedNotificationSubscription center](self, "center");
    -[CRKConcreteDistributedNotificationSubscription name](self, "name");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterRemoveObserver(v3, self, v4, 0);

  }
}

- (NSString)name
{
  return self->_name;
}

- (id)handler
{
  return self->_handler;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
