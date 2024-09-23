@implementation CALNUNNotificationMapper

- (CALNUNNotificationMapper)initWithNotificationRequestMapper:(id)a3
{
  id v5;
  CALNUNNotificationMapper *v6;
  CALNUNNotificationMapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNUNNotificationMapper;
  v6 = -[CALNUNNotificationMapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_notificationRequestMapper, a3);

  return v7;
}

- (id)calnNotificationFromUNNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CALNUNNotificationMapper notificationRequestMapper](self, "notificationRequestMapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calnNotificationRequestFromUNNotificationRequest:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNNotification notificationWithRequest:date:](CALNNotification, "notificationWithRequest:date:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)calnNotificationsFromUNNotifications:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  CALNUNNotificationMapper *v14;
  id v15;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __65__CALNUNNotificationMapper_calnNotificationsFromUNNotifications___block_invoke;
  v13 = &unk_24D484858;
  v14 = self;
  v15 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return v8;
}

void __65__CALNUNNotificationMapper_calnNotificationsFromUNNotifications___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_calnNotificationFromUNNotification:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)_calnNotificationFromUNNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CALNUNNotificationMapper notificationRequestMapper](self, "notificationRequestMapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calnNotificationRequestFromUNNotificationRequest:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNNotification notificationWithRequest:date:](CALNNotification, "notificationWithRequest:date:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CALNUNNotificationRequestMapper)notificationRequestMapper
{
  return self->_notificationRequestMapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRequestMapper, 0);
}

@end
