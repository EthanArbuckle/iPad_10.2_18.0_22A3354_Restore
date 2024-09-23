@implementation CALNUNNotificationResponseMapper

- (CALNUNNotificationResponseMapper)initWithNotificationMapper:(id)a3
{
  id v5;
  CALNUNNotificationResponseMapper *v6;
  CALNUNNotificationResponseMapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNUNNotificationResponseMapper;
  v6 = -[CALNUNNotificationResponseMapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_notificationMapper, a3);

  return v7;
}

- (id)calnNotificationResponseFromUNNotificationResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CALNUNNotificationResponseMapper notificationMapper](self, "notificationMapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calnNotificationFromUNNotification:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_class();
  objc_msgSend(v4, "actionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_calnNotificationActionIdentifierFromUNNotificationActionIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "originIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetConnectionEndpoint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNNotificationResponse responseWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:](CALNNotificationResponse, "responseWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:", v7, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_calnNotificationActionIdentifierFromUNNotificationActionIdentifier:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  int v5;
  __CFString *v6;

  v3 = (__CFString *)a3;
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BDF8A60]))
  {
    v4 = CFSTR("com.apple.CALNNotificationDefaultActionIdentifier");
  }
  else
  {
    v5 = -[__CFString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BDF8A70]);
    v4 = CFSTR("com.apple.CALNNotificationDismissActionIdentifier");
    if (!v5)
      v4 = v3;
  }
  v6 = v4;

  return v6;
}

- (CALNUNNotificationMapper)notificationMapper
{
  return self->_notificationMapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationMapper, 0);
}

@end
