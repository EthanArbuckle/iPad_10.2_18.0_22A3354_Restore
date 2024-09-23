@implementation CALNUNNotificationRequestMapper

- (CALNUNNotificationRequestMapper)initWithNotificationContentMapper:(id)a3 notificationIconMapper:(id)a4
{
  id v7;
  id v8;
  CALNUNNotificationRequestMapper *v9;
  CALNUNNotificationRequestMapper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CALNUNNotificationRequestMapper;
  v9 = -[CALNUNNotificationRequestMapper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationContentMapper, a3);
    objc_storeStrong((id *)&v10->_notificationIconMapper, a4);
  }

  return v10;
}

- (id)unNotificationRequestFromCALNNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[CALNUNNotificationRequestMapper notificationContentMapper](self, "notificationContentMapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unNotificationContentFromCALNNotificationContent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDF8858];
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "requestWithIdentifier:content:trigger:", v9, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)calnNotificationRequestFromUNNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CALNUNNotificationRequestMapper notificationContentMapper](self, "notificationContentMapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calnNotificationContentFromUNNotificationContent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNNotificationRequest requestWithIdentifier:content:](CALNNotificationRequest, "requestWithIdentifier:content:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CALNUNNotificationContentMapper)notificationContentMapper
{
  return self->_notificationContentMapper;
}

- (CALNUNNotificationIconMapper)notificationIconMapper
{
  return self->_notificationIconMapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationIconMapper, 0);
  objc_storeStrong((id *)&self->_notificationContentMapper, 0);
}

@end
