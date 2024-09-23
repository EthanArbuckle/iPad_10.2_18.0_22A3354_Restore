@implementation CALNUNNotificationIconMapper

- (CALNUNNotificationIconMapper)initWithNotificationIconCache:(id)a3
{
  id v5;
  CALNUNNotificationIconMapper *v6;
  CALNUNNotificationIconMapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNUNNotificationIconMapper;
  v6 = -[CALNUNNotificationIconMapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_notificationIconCache, a3);

  return v7;
}

- (id)iconIdentifierFromUNNotificationIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNUNNotificationIconMapper notificationIconCache](self, "notificationIconCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconIdentifierForCachedIconPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CALNUNNotificationIconMapper iconIdentifierFromUNNotificationIcon:].cold.1((uint64_t)v5, (uint64_t)v4, v8);

  }
  return v7;
}

- (id)unNotificationIconFromIconIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  -[CALNUNNotificationIconMapper notificationIconCache](self, "notificationIconCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedIconPathForIconIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDF8850], "iconAtPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CALNUNNotificationIconMapper unNotificationIconFromIconIdentifier:].cold.1((uint64_t)v4, v8);

    v7 = 0;
  }

  return v7;
}

- (CALNNotificationIconCache)notificationIconCache
{
  return self->_notificationIconCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationIconCache, 0);
}

- (void)iconIdentifierFromUNNotificationIcon:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "Could not get icon identifier from icon path = %{public}@, notification icon = %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)unNotificationIconFromIconIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Could not get icon path for icon identifier = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
