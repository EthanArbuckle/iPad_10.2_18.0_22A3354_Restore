@implementation NPKUserNotification

+ (id)generateModelIdentifierWith:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), PKCombinedHash());
}

- (NSString)title
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "-[NPKUserNotification title]";
      v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/User Notifications/NPKUserNotification.m";
      v9 = 2048;
      v10 = 24;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (NSString)body
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "-[NPKUserNotification body]";
      v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/User Notifications/NPKUserNotification.m";
      v9 = 2048;
      v10 = 29;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (NSString)notificationCategoryIdentifier
{
  return (NSString *)CFSTR("PDUserNotificationTypeWallet");
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)MEMORY[0x24BDBD1B8];
}

- (NSArray)identifierHashComponents
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NPKUserNotification title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  -[NPKUserNotification body](self, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v5);

  -[NPKUserNotification notificationCategoryIdentifier](self, "notificationCategoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v6);

  return (NSArray *)v3;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[NPKUserNotification identifierHashComponents](self, "identifierHashComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateModelIdentifierWith:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isSuppressed
{
  return 0;
}

- (BOOL)wantsBadgedIcon
{
  return 0;
}

@end
