@implementation LKStartupSupport

+ (BOOL)inUserSessionLoginUI
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isLoginSession"))
  {
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentUser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLoginUser") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (void)postStartupActions
{
  void *v2;
  int v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiUser");

  if (v3 && _vproc_set_global_on_demand())
  {
    v4 = LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2167FC000, v4, OS_LOG_TYPE_DEFAULT, "_vproc_set_global_on_demand failed", v5, 2u);
    }
  }
}

+ (void)postStartupTransitionActions
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiUser");

  if (v3)
  {
    LKRegisterLoginKitLogging();
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLoginSession");

    if (v5)
    {
      kdebug_trace();
      v6 = LKLogDefault;
      v7 = 0;
      if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2167FC000, v6, OS_LOG_TYPE_DEFAULT, "LoginKit: Logout ended.", buf, 2u);
        v7 = 0;
      }
    }
    else
    {
      kdebug_trace();
      v8 = LKLogDefault;
      if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2167FC000, v8, OS_LOG_TYPE_DEFAULT, "LoginKit: Login ended.", buf, 2u);
      }
      LKAnalyticsSendLoginEvent();
      v7 = 1;
    }
    +[LKLoginController sharedController](LKLoginController, "sharedController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__LKStartupSupport_postStartupTransitionActions__block_invoke;
    v10[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v10[4] = v7;
    objc_msgSend(v9, "checkInWithCurrentEnvironment:completionHandler:", v7, v10);

  }
}

void __48__LKStartupSupport_postStartupTransitionActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = LKLogDefault;
  v5 = os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v8 = 138412290;
      v9 = v3;
      v6 = "Error checking in with logind: %@";
LABEL_6:
      _os_log_impl(&dword_2167FC000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = 134217984;
    v9 = v7;
    v6 = "Successfully checked in with current environment: %lu";
    goto LABEL_6;
  }

}

@end
