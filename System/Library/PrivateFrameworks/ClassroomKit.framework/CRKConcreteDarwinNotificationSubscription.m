@implementation CRKConcreteDarwinNotificationSubscription

- (void)dealloc
{
  objc_super v3;

  -[CRKConcreteDarwinNotificationSubscription cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteDarwinNotificationSubscription;
  -[CRKConcreteDarwinNotificationSubscription dealloc](&v3, sel_dealloc);
}

- (CRKConcreteDarwinNotificationSubscription)initWithNotificationToken:(int)a3
{
  CRKConcreteDarwinNotificationSubscription *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRKConcreteDarwinNotificationSubscription;
  result = -[CRKConcreteDarwinNotificationSubscription init](&v5, sel_init);
  if (result)
    result->_notificationToken = a3;
  return result;
}

+ (id)subscriptionWithNotificationName:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  int out_token;

  v6 = a4;
  out_token = -1;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __86__CRKConcreteDarwinNotificationSubscription_subscriptionWithNotificationName_handler___block_invoke;
  v18 = &unk_24D9CA2E0;
  v19 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x219A226E8](&v15);
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "UTF8String", v15, v16, v17, v18);

  if (notify_register_dispatch(v11, &out_token, MEMORY[0x24BDAC9B8], v9))
  {
    v12 = 0;
  }
  else
  {
    v13 = objc_alloc((Class)a1);
    v12 = (void *)objc_msgSend(v13, "initWithNotificationToken:", out_token);
  }

  return v12;
}

uint64_t __86__CRKConcreteDarwinNotificationSubscription_subscriptionWithNotificationName_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancel
{
  if (-[CRKConcreteDarwinNotificationSubscription notificationToken](self, "notificationToken") != -1)
  {
    notify_cancel(-[CRKConcreteDarwinNotificationSubscription notificationToken](self, "notificationToken"));
    -[CRKConcreteDarwinNotificationSubscription setNotificationToken:](self, "setNotificationToken:", 0xFFFFFFFFLL);
  }
}

- (int)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(int)a3
{
  self->_notificationToken = a3;
}

@end
