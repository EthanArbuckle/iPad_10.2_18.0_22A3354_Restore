@implementation LPKUserSwitchCycleController

- (LPKUserSwitchCycleController)initWithDelegate:(id)a3
{
  id v4;
  LPKUserSwitchCycleController *v5;
  LPKUserSwitchCycleController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPKUserSwitchCycleController;
  v5 = -[LPKUserSwitchCycleController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (BOOL)startUserSwitchWithType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8
{
  __CFString *v14;
  __CFString *v15;
  dispatch_semaphore_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  int v27;
  _QWORD v29[5];
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _QWORD v36[7];
  _QWORD v37[7];
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  int64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v14 = (__CFString *)a5;
  v15 = (__CFString *)a6;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  if ((objc_msgSend(MEMORY[0x24BE60CB8], "isInternalBuild") & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v39 = a3;
      v40 = 2048;
      v41 = a4;
      _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Starting user switch cycle with type: %lu for %ld times", buf, 0x16u);
    }
    v16 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDBD1C8];
    v36[0] = CFSTR("LPKIsLocalUserSwitchTestOngoing");
    v36[1] = CFSTR("LPKLocalUserSwitchTestType");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v18;
    v36[2] = CFSTR("LPKLocalUserSwitchTestRemainCycleCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v21 = CFSTR("Local User");
    if (v14)
      v21 = v14;
    v37[2] = v19;
    v37[3] = v21;
    v36[3] = CFSTR("LPKLocalUserSwitchTestUsername");
    v36[4] = CFSTR("LPKLocalUserSwitchTestPassword");
    v22 = &stru_24F039FB0;
    if (v15)
      v22 = v15;
    v37[4] = v22;
    v36[5] = CFSTR("LPKLocalUserSwitchTestLoginDelay");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[5] = v23;
    v36[6] = CFSTR("LPKLocalUserSwitchTestLogoutDelay");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[6] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __103__LPKUserSwitchCycleController_startUserSwitchWithType_count_username_password_loginDelay_logoutDelay___block_invoke;
    v29[3] = &unk_24F039A50;
    v31 = &v32;
    v29[4] = self;
    v26 = v16;
    v30 = v26;
    objc_msgSend(v17, "saveKeyValuePairs:completionHandler:", v25, v29);

    dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
    v27 = *((unsigned __int8 *)v33 + 24);

  }
  else
  {
    v27 = *((unsigned __int8 *)v33 + 24);
  }
  _Block_object_dispose(&v32, 8);

  return v27 != 0;
}

intptr_t __103__LPKUserSwitchCycleController_startUserSwitchWithType_count_username_password_loginDelay_logoutDelay___block_invoke(uint64_t a1, int a2)
{
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "triggerTestUserSwitchIfNeeded");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)triggerTestUserSwitchIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  BOOL v25;
  void *v26;
  void *v27;
  int v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  _QWORD v39[5];
  __CFString *v40;
  id v41;
  uint64_t v42;
  char v43;
  _QWORD v44[5];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  uint64_t v48;
  const __CFString *v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE60CB8], "isInternalBuild"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
      _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "retrieveValueForKey:", CFSTR("LPKIsLocalUserSwitchTestOngoing"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (!v5)
      goto LABEL_31;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
      _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Local user switch test is ongoing", buf, 0xCu);
    }
    objc_msgSend(v3, "retrieveValueForKey:", CFSTR("LPKLocalUserSwitchTestRemainCycleCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    if (!-[LPKUserSwitchCycleController _validateUserSwitchExpectation](self, "_validateUserSwitchExpectation"))
    {
      objc_msgSend(v3, "retrieveValueForKey:", CFSTR("LPKLocalUserSwitchTestIsPerformanceTest"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      objc_msgSend(v3, "retrieveValueForKey:", CFSTR("LPKLocalUserSwitchTestRetryCount"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntValue");

      if (!v9 || !v11)
      {
        -[LPKUserSwitchCycleController _clearOutLocalPerfTestDefaults](self, "_clearOutLocalPerfTestDefaults");
        goto LABEL_31;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "We are doing performance test, try to recover", buf, 2u);
      }
      -[LPKUserSwitchCycleController _fixTestStatesForRetry](self, "_fixTestStatesForRetry");
    }
    if (v7)
    {
      objc_msgSend(v3, "retrieveValueForKey:", CFSTR("LPKLocalUserSwitchTestType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

      objc_msgSend(v3, "retrieveValueForKey:", CFSTR("LPKLocalUserSwitchTestUsername"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "retrieveValueForKey:", CFSTR("LPKLocalUserSwitchTestPassword"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "retrieveValueForKey:", CFSTR("LPKLocalUserSwitchTestLoginDelay"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      v18 = 5.0;
      if ((double)v17 >= 5.0)
        v19 = (double)v17;
      else
        v19 = 5.0;
      objc_msgSend(v3, "retrieveValueForKey:", CFSTR("LPKLocalUserSwitchTestLogoutDelay"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");

      if ((double)v21 >= 5.0)
        v18 = (double)v21;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
        v47 = 2048;
        v48 = v13;
        _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Will perform switch type: %ld", buf, 0x16u);
      }
      v22 = (void *)objc_opt_new();
      if (-[__CFString length](v14, "length"))
      {
        v23 = v22;
        v24 = v14;
      }
      else
      {
        v24 = CFSTR("Local User");
        v23 = v22;
      }
      objc_msgSend(v23, "setUsername:", v24);
      if (-[__CFString length](v14, "length") && objc_msgSend(v15, "length"))
      {
        v31 = 0;
      }
      else
      {

        v15 = 0;
        v31 = 1;
      }
      v32 = (uint64_t)v18;
      switch(v13)
      {
        case 0:
          if (!-[LPKUserSwitchCycleController _isLoginSession](self, "_isLoginSession"))
            goto LABEL_58;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
            _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Will trigger first time login", buf, 0xCu);
          }
          -[LPKUserSwitchCycleController _updateLocalPerfTestCycleCount:](self, "_updateLocalPerfTestCycleCount:", v7 - 1);
          objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "userExists:", v22);

          if (!v34)
            goto LABEL_54;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
            _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: User exist, we need to delete the user first", buf, 0xCu);
          }
          objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = MEMORY[0x24BDAC760];
          v39[1] = 3221225472;
          v39[2] = __61__LPKUserSwitchCycleController_triggerTestUserSwitchIfNeeded__block_invoke_33;
          v39[3] = &unk_24F039AA0;
          v39[4] = self;
          v40 = v14;
          v43 = v31;
          v41 = v15;
          v42 = (uint64_t)v19;
          objc_msgSend(v35, "deleteUser:completionHandler:", v22, v39);

          break;
        case 1:
          if (!-[LPKUserSwitchCycleController _isLoginSession](self, "_isLoginSession"))
            goto LABEL_58;
          objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "userExists:", v22);

          if (v37)
            -[LPKUserSwitchCycleController _updateLocalPerfTestCycleCount:](self, "_updateLocalPerfTestCycleCount:", v7 - 1);
          goto LABEL_54;
        case 2:
          if (-[LPKUserSwitchCycleController _isLoginSession](self, "_isLoginSession"))
            goto LABEL_54;
          -[LPKUserSwitchCycleController _updateLocalPerfTestCycleCount:](self, "_updateLocalPerfTestCycleCount:", v7 - 1);
          -[LPKUserSwitchCycleController _triggerFastLogoutWithDelay:](self, "_triggerFastLogoutWithDelay:", (double)v32);
          break;
        case 3:
          if (-[LPKUserSwitchCycleController _isLoginSession](self, "_isLoginSession"))
          {
LABEL_54:
            -[LPKUserSwitchCycleController _loginAccount:password:localLoginOnly:delay:](self, "_loginAccount:password:localLoginOnly:delay:", v14, v15, v31, (double)(uint64_t)v19);
          }
          else
          {
            -[LPKUserSwitchCycleController _updateLocalPerfTestCycleCount:](self, "_updateLocalPerfTestCycleCount:", v7 - 1);
LABEL_58:
            -[LPKUserSwitchCycleController _triggerFullLogoutWithDelay:](self, "_triggerFullLogoutWithDelay:", (double)v32);
          }
          break;
        default:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded].cold.1();
          break;
      }

LABEL_60:
      v25 = 1;
      goto LABEL_61;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
      _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: No more user switch to do", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "currentUser");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isLoginUser");

    v29 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (!v28)
    {
      if (v29)
      {
        *(_DWORD *)buf = 136315138;
        v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
        _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Not login user, trigger full logout", buf, 0xCu);
      }
      -[LPKUserSwitchCycleController _triggerFullLogoutWithDelay:](self, "_triggerFullLogoutWithDelay:", 5.0);
      goto LABEL_60;
    }
    if (v29)
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
      _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Is login user, dump result", buf, 0xCu);
    }
    -[LPKUserSwitchCycleController _clearOutLocalPerfTestDefaults](self, "_clearOutLocalPerfTestDefaults");
    v49 = CFSTR("LPKLocalUserSwitchTestHasFinishedSuccessfully");
    v50[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __61__LPKUserSwitchCycleController_triggerTestUserSwitchIfNeeded__block_invoke;
    v44[3] = &unk_24F039A78;
    v44[4] = self;
    objc_msgSend(v3, "saveKeyValuePairs:completionHandler:", v30, v44);

LABEL_31:
    v25 = 0;
LABEL_61:

    return v25;
  }
  return 0;
}

void __61__LPKUserSwitchCycleController_triggerTestUserSwitchIfNeeded__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performanceTestDidFinishSuccessfully");

}

uint64_t __61__LPKUserSwitchCycleController_triggerTestUserSwitchIfNeeded__block_invoke_33(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loginAccount:password:localLoginOnly:delay:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), (double)*(uint64_t *)(a1 + 56));
}

- (void)_clearOutLocalPerfTestDefaults
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[11];

  v6[10] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("LPKIsLocalUserSwitchTestOngoing");
  v6[1] = CFSTR("LPKLocalUserSwitchTestType");
  v6[2] = CFSTR("LPKLocalUserSwitchTestRemainCycleCount");
  v6[3] = CFSTR("LPKLocalUserSwitchTestUsername");
  v6[4] = CFSTR("LPKLocalUserSwitchTestPassword");
  v6[5] = CFSTR("LPKUserSwitchDestination");
  v6[6] = CFSTR("LPKLocalUserSwitchTestHasFinishedSuccessfully");
  v6[7] = CFSTR("LPKLocalUserSwitchTestIsPerformanceTest");
  v6[8] = CFSTR("TestHasBeenPrewarmed");
  v6[9] = CFSTR("LPKLocalUserSwitchTestRetryCount");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearKeys:completionHandler:", v4, 0);

  -[LPKUserSwitchCycleController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performanceTestWillTerminate");

}

- (void)_updateLocalPerfTestCycleCount:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("LPKLocalUserSwitchTestRemainCycleCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("TestHasBeenPrewarmed");
  v8[0] = v5;
  v8[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveKeyValuePairs:completionHandler:", v6, 0);

}

- (void)_loginAccount:(id)a3 password:(id)a4 localLoginOnly:(BOOL)a5 delay:(double)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[2];
  BOOL v18;
  id location;

  v10 = a3;
  v11 = a4;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke;
  v14[3] = &unk_24F039B18;
  objc_copyWeak(v17, &location);
  v17[1] = *(id *)&a6;
  v12 = v10;
  v15 = v12;
  v13 = v11;
  v16 = v13;
  v18 = a5;
  -[LPKUserSwitchCycleController _setUserSwitchDestinationExpectation:retryIfFailed:completionHandler:](self, "_setUserSwitchDestinationExpectation:retryIfFailed:completionHandler:", 2, 1, v14);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

}

void __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  dispatch_time_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  char v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_2;
      v7[3] = &unk_24F039AF0;
      v7[4] = v5;
      v8 = *(id *)(a1 + 32);
      v9 = *(id *)(a1 + 40);
      v10 = *(_BYTE *)(a1 + 64);
      dispatch_after(v6, MEMORY[0x24BDAC9B8], v7);

    }
    else
    {
      objc_msgSend(WeakRetained, "_clearOutLocalPerfTestDefaults");
    }
  }

}

void __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "retrieveValueForKey:", CFSTR("LPKIsLocalUserSwitchTestOngoing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = *(void **)(a1 + 32);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "_scheduleRetryWithTimeout:", 65.0);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v13 = "-[LPKUserSwitchCycleController _loginAccount:password:localLoginOnly:delay:]_block_invoke_2";
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Calling into LoginUI to login account: %@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(unsigned __int8 *)(a1 + 56);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_36;
    v11[3] = &unk_24F039AC8;
    v11[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "forceLoggingInAppleID:password:localLoginOnly:completionHandler:", v8, v9, v10, v11);

  }
  else
  {
    objc_msgSend(v5, "_clearOutLocalPerfTestDefaults");
  }
}

void __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_36_cold_2();
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v3, "code") == 4099)
      {

        goto LABEL_12;
      }
      v5 = objc_msgSend(v3, "code");

      if (v5 == 4097)
        goto LABEL_12;
    }
    else
    {

    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_36_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "_clearOutLocalPerfTestDefaults");
  }
LABEL_12:

}

- (void)_triggerFastLogoutWithDelay:(double)a3
{
  _QWORD v5[4];
  id v6[2];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!-[LPKUserSwitchCycleController _isLoginSession](self, "_isLoginSession"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[LPKUserSwitchCycleController _triggerFastLogoutWithDelay:]";
      _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __60__LPKUserSwitchCycleController__triggerFastLogoutWithDelay___block_invoke;
    v5[3] = &unk_24F039B68;
    objc_copyWeak(v6, (id *)buf);
    v6[1] = *(id *)&a3;
    -[LPKUserSwitchCycleController _setUserSwitchDestinationExpectation:retryIfFailed:completionHandler:](self, "_setUserSwitchDestinationExpectation:retryIfFailed:completionHandler:", 0, 1, v5);
    objc_destroyWeak(v6);
    objc_destroyWeak((id *)buf);
  }
}

void __60__LPKUserSwitchCycleController__triggerFastLogoutWithDelay___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__LPKUserSwitchCycleController__triggerFastLogoutWithDelay___block_invoke_2;
      block[3] = &unk_24F039B40;
      block[4] = v5;
      dispatch_after(v6, MEMORY[0x24BDAC9B8], block);
    }
    else
    {
      objc_msgSend(WeakRetained, "_clearOutLocalPerfTestDefaults");
    }
  }

}

void __60__LPKUserSwitchCycleController__triggerFastLogoutWithDelay___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "retrieveValueForKey:", CFSTR("LPKIsLocalUserSwitchTestOngoing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = *(void **)(a1 + 32);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "_scheduleRetryWithTimeout:", 370.0);
    objc_msgSend(MEMORY[0x24BE60CB0], "sharedController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logoutWithLogoutType:completionHandler:", 1, 0);

  }
  else
  {
    objc_msgSend(v5, "_clearOutLocalPerfTestDefaults");
  }
}

- (void)_triggerFullLogoutWithDelay:(double)a3
{
  void *v5;
  void *v6;
  char v7;
  _QWORD v8[4];
  id v9[2];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLoginUser");

  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[LPKUserSwitchCycleController _triggerFullLogoutWithDelay:]";
      _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__LPKUserSwitchCycleController__triggerFullLogoutWithDelay___block_invoke;
    v8[3] = &unk_24F039B68;
    objc_copyWeak(v9, (id *)buf);
    v9[1] = *(id *)&a3;
    -[LPKUserSwitchCycleController _setUserSwitchDestinationExpectation:retryIfFailed:completionHandler:](self, "_setUserSwitchDestinationExpectation:retryIfFailed:completionHandler:", 0, 1, v8);
    objc_destroyWeak(v9);
    objc_destroyWeak((id *)buf);
  }
}

void __60__LPKUserSwitchCycleController__triggerFullLogoutWithDelay___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__LPKUserSwitchCycleController__triggerFullLogoutWithDelay___block_invoke_2;
      block[3] = &unk_24F039B40;
      block[4] = v5;
      dispatch_after(v6, MEMORY[0x24BDAC9B8], block);
    }
    else
    {
      objc_msgSend(WeakRetained, "_clearOutLocalPerfTestDefaults");
    }
  }

}

void __60__LPKUserSwitchCycleController__triggerFullLogoutWithDelay___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "retrieveValueForKey:", CFSTR("LPKIsLocalUserSwitchTestOngoing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = *(void **)(a1 + 32);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "_scheduleRetryWithTimeout:", 370.0);
    objc_msgSend(MEMORY[0x24BE60CB0], "sharedController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logoutWithLogoutType:completionHandler:", 0, 0);

  }
  else
  {
    objc_msgSend(v5, "_clearOutLocalPerfTestDefaults");
  }
}

- (void)_setUserSwitchDestinationExpectation:(unint64_t)a3 retryIfFailed:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  unint64_t v15;
  BOOL v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("LPKUserSwitchDestination");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __101__LPKUserSwitchCycleController__setUserSwitchDestinationExpectation_retryIfFailed_completionHandler___block_invoke;
  v13[3] = &unk_24F039B90;
  v16 = a4;
  v14 = v8;
  v15 = a3;
  v13[4] = self;
  v12 = v8;
  objc_msgSend(v9, "saveKeyValuePairs:completionHandler:", v11, v13);

}

void __101__LPKUserSwitchCycleController__setUserSwitchDestinationExpectation_retryIfFailed_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint8_t v6[16];

  v5 = a3;
  if ((a2 & 1) != 0)
    goto LABEL_8;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __101__LPKUserSwitchCycleController__setUserSwitchDestinationExpectation_retryIfFailed_completionHandler___block_invoke_cold_1();
  if (!*(_BYTE *)(a1 + 56))
  {
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Retry setting user switch destination expectation", v6, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_setUserSwitchDestinationExpectation:retryIfFailed:completionHandler:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
  }

}

- (unint64_t)_currentEnvironment
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLoginUser");

  if ((v5 & 1) != 0)
    return 0;
  if (-[LPKUserSwitchCycleController _isLoginSession](self, "_isLoginSession"))
    return 1;
  return 2;
}

- (BOOL)_validateUserSwitchExpectation
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "retrieveValueForKey:", CFSTR("LPKUserSwitchDestination"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (v5 = objc_msgSend(v4, "integerValue"),
        v5 != -[LPKUserSwitchCycleController _currentEnvironment](self, "_currentEnvironment")))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[LPKUserSwitchCycleController _validateUserSwitchExpectation].cold.1();
    v7 = (void *)objc_opt_new();
    v8 = CFSTR("Logout");
    if (v5 == 2)
      v8 = CFSTR("Login");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ failed"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logErrorEventForTopic:reason:error:details:", CFSTR("Shared iPad User Switch Test"), v9, 0, 0);

    v6 = 0;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)_isLoginSession
{
  char IsLoginSession;

  IsLoginSession = MKBUserSessionIsLoginSession();

  return IsLoginSession;
}

- (void)_fixTestStatesForRetry
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[3];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[LPKUserSwitchCycleController _fixTestStatesForRetry]";
    _os_log_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "retrieveValueForKey:", CFSTR("LPKLocalUserSwitchTestRemainCycleCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "retrieveValueForKey:", CFSTR("LPKLocalUserSwitchTestRetryCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  objc_msgSend(v3, "retrieveValueForKey:", CFSTR("TestHasBeenPrewarmed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = -[LPKUserSwitchCycleController _currentEnvironment](self, "_currentEnvironment");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10, CFSTR("LPKUserSwitchDestination"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v15[1] = CFSTR("LPKLocalUserSwitchTestRemainCycleCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5 + v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  v15[2] = CFSTR("LPKLocalUserSwitchTestRetryCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7 - 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveKeyValuePairs:error:", v14, 0);

}

- (void)_scheduleRetryWithTimeout:(double)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__LPKUserSwitchCycleController__scheduleRetryWithTimeout___block_invoke;
  block[3] = &unk_24F039B40;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

uint64_t __58__LPKUserSwitchCycleController__scheduleRetryWithTimeout___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __58__LPKUserSwitchCycleController__scheduleRetryWithTimeout___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "_fixTestStatesForRetry");
  return objc_msgSend(*(id *)(a1 + 32), "triggerTestUserSwitchIfNeeded");
}

- (LPKUserSwitchCycleResponder)delegate
{
  return (LPKUserSwitchCycleResponder *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)triggerTestUserSwitchIfNeeded
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227B26000, MEMORY[0x24BDACB70], v0, "Unrecognized user switch type: %lu", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_36_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227B26000, MEMORY[0x24BDACB70], v0, "Stopping the user switch test due to error: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_36_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227B26000, MEMORY[0x24BDACB70], v0, "Failed to trigger user switch with error :%@.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __101__LPKUserSwitchCycleController__setUserSwitchDestinationExpectation_retryIfFailed_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227B26000, MEMORY[0x24BDACB70], v0, "Failed to set user switch destination expectation, error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_validateUserSwitchExpectation
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_227B26000, MEMORY[0x24BDACB70], v0, "Current environment: %lu doesn't match with expected destination: %lu", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_isLoginSession
{
  OUTLINED_FUNCTION_3(&dword_227B26000, MEMORY[0x24BDACB70], a3, "%s: Failed to retrive isLoginUI information due to error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __58__LPKUserSwitchCycleController__scheduleRetryWithTimeout___block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_227B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "User switch might have failed! Try again now...", v0, 2u);
}

@end
