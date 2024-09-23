@implementation CALNNotificationResponse

+ (id)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6
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
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:", v13, v12, v11, v10);

  return v14;
}

- (CALNNotificationResponse)initWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CALNNotificationResponse *v15;
  CALNNotificationResponse *v16;
  uint64_t v17;
  NSString *actionIdentifier;
  uint64_t v19;
  NSString *originIdentifier;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CALNNotificationResponse;
  v15 = -[CALNNotificationResponse init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_notification, a3);
    v17 = objc_msgSend(v12, "copy");
    actionIdentifier = v16->_actionIdentifier;
    v16->_actionIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    originIdentifier = v16->_originIdentifier;
    v16->_originIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v16->_targetConnectionEndpoint, a6);
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[CALNNotificationResponse notification](self, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[CALNNotificationResponse actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[CALNNotificationResponse originIdentifier](self, "originIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[CALNNotificationResponse targetConnectionEndpoint](self, "targetConnectionEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[CALNNotificationResponse isEqualToResponse:](self, "isEqualToResponse:", v4);

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  CALNNotificationResponse *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (CALNNotificationResponse *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    -[CALNNotificationResponse notification](self, "notification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationResponse notification](v4, "notification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CalEqualObjects();

    if (!v7)
      goto LABEL_6;
    -[CALNNotificationResponse actionIdentifier](self, "actionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationResponse actionIdentifier](v4, "actionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CalEqualStrings();

    if (!v10)
      goto LABEL_6;
    -[CALNNotificationResponse originIdentifier](self, "originIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationResponse originIdentifier](v4, "originIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CalEqualStrings();

    if (v13)
    {
      -[CALNNotificationResponse targetConnectionEndpoint](self, "targetConnectionEndpoint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALNNotificationResponse targetConnectionEndpoint](v4, "targetConnectionEndpoint");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CalEqualObjects();

    }
    else
    {
LABEL_6:
      v16 = 0;
    }
  }

  return v16;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CALNNotificationResponse notification](self, "notification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationResponse actionIdentifier](self, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationResponse originIdentifier](self, "originIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationResponse targetConnectionEndpoint](self, "targetConnectionEndpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(notification = %@, actionIdentifier = %@, originIdentifier = %@, targetConnectionEndpoint = %@)"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CALNNotification)notification
{
  return self->_notification;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)originIdentifier
{
  return self->_originIdentifier;
}

- (BSServiceConnectionEndpoint)targetConnectionEndpoint
{
  return self->_targetConnectionEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetConnectionEndpoint, 0);
  objc_storeStrong((id *)&self->_originIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end
