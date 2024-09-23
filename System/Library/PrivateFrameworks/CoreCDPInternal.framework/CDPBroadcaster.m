@implementation CDPBroadcaster

+ (void)broadcastWalrusStateChangeNotification
{
  objc_msgSend(a1, "_broadcastNotificationName:userInfo:", *MEMORY[0x24BE1A588], 0);
}

+ (void)broadcastWebAccessStateChangeNotification
{
  objc_msgSend(a1, "_broadcastNotificationName:userInfo:", *MEMORY[0x24BE1A590], 0);
}

- (CDPBroadcaster)init
{
  CDPBroadcaster *v3;
  id *p_isa;
  void *v5;
  void *v6;
  CDPBroadcaster *v7;
  NSObject *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CDPBroadcaster;
  v3 = -[CDPBroadcaster init](&v10, sel_init);
  p_isa = (id *)&v3->super.isa;
  if (!v3)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CDPBroadcaster init].cold.1(a2);
    goto LABEL_8;
  }

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CDPBroadcaster init].cold.2((uint64_t)p_isa, a2);
LABEL_8:

    v7 = 0;
    goto LABEL_9;
  }
  v6 = v5;
  objc_storeStrong(p_isa + 1, v5);

  v7 = p_isa;
LABEL_9:

  return v7;
}

- (void)sendNotification:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CDPBroadcaster broadcaster](self, "broadcaster");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:deliverImmediately:", v7, 0, v6, 1);

}

+ (void)_broadcastNotificationName:(id)a3 userInfo:(id)a4
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v9;
  __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (__CFString *)a3;
  v6 = a4;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Broadcasting notification: %{public}@, with userInfo: %{public}@\", (uint8_t *)&v9, 0x16u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v5, v6, 0, 1u);

}

- (NSDistributedNotificationCenter)broadcaster
{
  return self->_broadcaster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcaster, 0);
}

- (void)init
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (id)objc_opt_class();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_20DB2C000, v5, v6, "\"[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init\", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

@end
