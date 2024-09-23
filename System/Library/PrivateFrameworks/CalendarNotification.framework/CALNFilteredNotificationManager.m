@implementation CALNFilteredNotificationManager

- (CALNFilteredNotificationManager)initWithWrappedNotificationManager:(id)a3 predicate:(id)a4
{
  id v7;
  id v8;
  CALNFilteredNotificationManager *v9;
  CALNFilteredNotificationManager *v10;
  uint64_t v11;
  id predicate;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CALNFilteredNotificationManager;
  v9 = -[CALNFilteredNotificationManager init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_wrappedNotificationManager, a3);
    v11 = objc_msgSend(v8, "copy");
    predicate = v10->_predicate;
    v10->_predicate = (id)v11;

  }
  return v10;
}

- (BOOL)isProtectedDataAvailable
{
  void *v2;
  char v3;

  -[CALNFilteredNotificationManager wrappedNotificationManager](self, "wrappedNotificationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isProtectedDataAvailable");

  return v3;
}

- (void)addRecord:(id)a3
{
  uint64_t (**v4)(void);
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CALNFilteredNotificationManager predicate](self, "predicate");
  v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v5 = v4[2]();

  if (v5)
  {
    -[CALNFilteredNotificationManager wrappedNotificationManager](self, "wrappedNotificationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addRecord:", v7);

  }
}

- (id)fetchRecordsWithSourceIdentifier:(id)a3
{
  id v4;
  uint64_t (**v5)(void);
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CALNFilteredNotificationManager predicate](self, "predicate");
  v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v6 = v5[2]();

  if (v6)
  {
    -[CALNFilteredNotificationManager wrappedNotificationManager](self, "wrappedNotificationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchRecordsWithSourceIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)removeRecordWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4
{
  id v6;
  uint64_t (**v7)(void);
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CALNFilteredNotificationManager predicate](self, "predicate");
  v7 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v8 = v7[2]();

  if (v8)
  {
    -[CALNFilteredNotificationManager wrappedNotificationManager](self, "wrappedNotificationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeRecordWithSourceIdentifier:sourceClientIdentifier:", v10, v6);

  }
}

- (void)updateRecord:(id)a3
{
  uint64_t (**v4)(void);
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CALNFilteredNotificationManager predicate](self, "predicate");
  v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v5 = v4[2]();

  if (v5)
  {
    -[CALNFilteredNotificationManager wrappedNotificationManager](self, "wrappedNotificationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateRecord:", v7);

  }
}

- (CALNNotificationManager)wrappedNotificationManager
{
  return self->_wrappedNotificationManager;
}

- (id)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_predicate, 0);
  objc_storeStrong((id *)&self->_wrappedNotificationManager, 0);
}

@end
