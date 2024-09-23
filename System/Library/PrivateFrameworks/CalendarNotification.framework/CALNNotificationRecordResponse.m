@implementation CALNNotificationRecordResponse

+ (id)responseWithNotificationRecord:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6
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
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNotificationRecord:actionIdentifier:originIdentifier:targetConnectionEndpoint:", v13, v12, v11, v10);

  return v14;
}

- (CALNNotificationRecordResponse)initWithNotificationRecord:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CALNNotificationRecordResponse *v15;
  CALNNotificationRecordResponse *v16;
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
  v22.super_class = (Class)CALNNotificationRecordResponse;
  v15 = -[CALNNotificationRecordResponse init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_notificationRecord, a3);
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
  -[CALNNotificationRecordResponse notificationRecord](self, "notificationRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationRecordResponse actionIdentifier](self, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationRecordResponse originIdentifier](self, "originIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationRecordResponse targetConnectionEndpoint](self, "targetConnectionEndpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(notificationRecord = %@, actionIdentifier = %@, originIdentifier = %@, targetConnectionEndpoint = %@)"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CALNNotificationRecord)notificationRecord
{
  return self->_notificationRecord;
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
  objc_storeStrong((id *)&self->_notificationRecord, 0);
}

@end
