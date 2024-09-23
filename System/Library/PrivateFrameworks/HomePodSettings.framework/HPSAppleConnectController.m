@implementation HPSAppleConnectController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HPSAppleConnectController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken[0] != -1)
    dispatch_once(sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __43__HPSAppleConnectController_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (HPSAppleConnectController)init
{
  HPSAppleConnectController *v2;
  HPSAppleConnectController *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HPSAppleConnectController;
  v2 = -[HPSAppleConnectController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HPSAppleConnectController _readCachedCredentials](v2, "_readCachedCredentials");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_settingsChanged, CFSTR("com.apple.hps.appleconnect.didchange"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.hps.appleconnect.didchange"), 0);
  v4.receiver = self;
  v4.super_class = (Class)HPSAppleConnectController;
  -[HPSAppleConnectController dealloc](&v4, sel_dealloc);
}

- (BOOL)isEnabled
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HPSAppleConnectController accountID](self, "accountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[HPSAppleConnectController password](self, "password");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setAccountID:(id)a3 password:(id)a4 syncToKeychain:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;

  v5 = a5;
  v15 = a4;
  v8 = (void *)MEMORY[0x24BDBCEA0];
  v9 = a3;
  objc_msgSend(v8, "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseStringWithLocale:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HPSAppleConnectController accountID](self, "accountID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
  {
    -[HPSAppleConnectController password](self, "password");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
      goto LABEL_7;
  }
  else
  {

  }
  -[HPSAppleConnectController setAccountID:](self, "setAccountID:", v11);
  -[HPSAppleConnectController setPassword:](self, "setPassword:", v15);
  if (v5)
    -[HPSAppleConnectController _saveCredentials](self, "_saveCredentials");
LABEL_7:

}

- (void)clearCredentialsSyncToKeychain:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[HPSAppleConnectController setAccountID:](self, "setAccountID:", 0);
  -[HPSAppleConnectController setPassword:](self, "setPassword:", 0);
  if (v3)
    -[HPSAppleConnectController _saveCredentials](self, "_saveCredentials");
}

- (BOOL)isCarryOrLiveOnUser
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = -[HPSAppleConnectController isEnabled](self, "isEnabled");
  -[HPSAppleConnectController accountID](self, "accountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSAppleConnectController password](self, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (objc_msgSend(v4, "length"))
      LOBYTE(v3) = objc_msgSend(v5, "length") != 0;
    else
      LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)validateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__HPSAppleConnectController_validateWithCompletionHandler___block_invoke;
  v6[3] = &unk_24F9AF450;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __59__HPSAppleConnectController_validateWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  NSObject *v7;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "accountID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
  {

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "password");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HPSAppleConnectControllerErrorDomain"), -1100, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "accountID");
  objc_msgSend(*(id *)(a1 + 32), "password");
  v5 = ACMobileShimCopyTicket();
  HPSLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v10 = v5;
    v11 = 2112;
    v12 = 0;
    _os_log_impl(&dword_22DF16000, v7, OS_LOG_TYPE_DEFAULT, "AppleConnect credentials invalid: status:%d error:%@", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HPSAppleConnectControllerErrorDomain"), -1101, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)tokenWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__HPSAppleConnectController_tokenWithError___block_invoke;
  v6[3] = &unk_24F9AF450;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __44__HPSAppleConnectController_tokenWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "accountID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "password");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ACMobileShimCopyTicket();
  HPSLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v11 = v4;
    v12 = 2112;
    v13 = (uint64_t)v9;
    _os_log_impl(&dword_22DF16000, v5, OS_LOG_TYPE_DEFAULT, "copyTicket returned %d %@", buf, 0x12u);
  }

  HPSLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __44__HPSAppleConnectController_tokenWithError___block_invoke_cold_1((uint64_t *)&v9, v4, v6);

  v7 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HPSAppleConnectControllerErrorDomain"), -1101, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_readCachedCredentials
{
  OUTLINED_FUNCTION_2(&dword_22DF16000, a1, a3, "Failed to allocate keychain item ID.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_saveCredentials
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22DF16000, v0, v1, "Failed to add AppleConnect data [%d]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAccountID:(id)a3
{
  NSString *v4;
  NSString *accountID;
  HPSAppleConnectController *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  accountID = obj->_accountID;
  obj->_accountID = v4;

  objc_sync_exit(obj);
}

- (void)setPassword:(id)a3
{
  NSString *v4;
  NSString *password;
  HPSAppleConnectController *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  password = obj->_password;
  obj->_password = v4;

  objc_sync_exit(obj);
}

- (NSString)accountID
{
  HPSAppleConnectController *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_accountID;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)password
{
  HPSAppleConnectController *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_password;
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

void __44__HPSAppleConnectController_tokenWithError___block_invoke_cold_1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109378;
  v4[1] = a2;
  v5 = 2112;
  v6 = v3;
  _os_log_error_impl(&dword_22DF16000, log, OS_LOG_TYPE_ERROR, "AppleConnect credentials invalid: status:%d error:%@", (uint8_t *)v4, 0x12u);
}

@end
