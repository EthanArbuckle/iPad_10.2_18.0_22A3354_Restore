@implementation NPKPassUserNotificationFactory

- (NPKPassUserNotificationFactory)init
{
  return -[NPKPassUserNotificationFactory initWithDataSource:](self, "initWithDataSource:", 0);
}

- (NPKPassUserNotificationFactory)initWithDataSource:(id)a3
{
  id v4;
  NPKPassUserNotificationFactory *v5;
  NPKPassUserNotificationFactory *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NPKPassUserNotificationFactory;
  v5 = -[NPKPassUserNotificationFactory init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSource, v4);

  return v6;
}

- (id)passNotificationWithType:(unint64_t)a3 passUniqueID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NPKUserNotificationExpressModeEnabled *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[NPKPassUserNotificationFactory dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passWithUniqueID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Warning: Fail to find pass for notification with uniqueID:%@", (uint8_t *)&v14, 0xCu);
      }

    }
    goto LABEL_8;
  }
  if (a3)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v9 = -[NPKUserNotificationExpressModeEnabled initWithPass:]([NPKUserNotificationExpressModeEnabled alloc], "initWithPass:", v8);
LABEL_9:

  return v9;
}

- (NPKPassUserNotificationFactoryDataSource)dataSource
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NPKPassUserNotificationFactoryDataSource *)v5;
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
