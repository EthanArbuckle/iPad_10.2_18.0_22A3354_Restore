@implementation CALNNotificationStorageWrapper

- (CALNNotificationStorageWrapper)initWithWrappedStorage:(id)a3
{
  id v5;
  CALNNotificationStorageWrapper *v6;
  CALNNotificationStorageWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNNotificationStorageWrapper;
  v6 = -[CALNNotificationStorageWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrappedStorage, a3);

  return v7;
}

- (void)addNotificationRecord:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CALNNotificationStorageWrapper wrappedStorage](self, "wrappedStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addNotificationRecord:", v4);

}

- (id)notificationRecords
{
  void *v2;
  void *v3;

  -[CALNNotificationStorageWrapper wrappedStorage](self, "wrappedStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)removeNotificationRecordsPassingTest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CALNNotificationStorageWrapper wrappedStorage](self, "wrappedStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeNotificationRecordsPassingTest:", v4);

}

- (void)addNotificationRecords:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CALNNotificationStorageWrapper wrappedStorage](self, "wrappedStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addNotificationRecords:", v4);

}

- (void)removeAllNotificationRecords
{
  id v2;

  -[CALNNotificationStorageWrapper wrappedStorage](self, "wrappedStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllNotificationRecords");

}

- (CALNNotificationStorage)wrappedStorage
{
  return (CALNNotificationStorage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWrappedStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedStorage, 0);
}

@end
