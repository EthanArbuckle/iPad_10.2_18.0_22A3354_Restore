@implementation ATTrackingManager

void __60__ATTrackingManager__applicationHasDisqualifyingEntitlement__block_invoke()
{
  const __CFAllocator *Default;
  __SecTask *v1;
  __SecTask *v2;
  const __CFBoolean *v3;
  const __CFBoolean *v4;

  Default = CFAllocatorGetDefault();
  v1 = SecTaskCreateFromSelf(Default);
  if (v1)
  {
    v2 = v1;
    v3 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.security.on-demand-install-capable"), 0);
    if (v3)
    {
      v4 = v3;
      _applicationHasDisqualifyingEntitlement_isDimSumApp = CFBooleanGetValue(v3) != 0;
      CFRelease(v4);
    }
    CFRelease(v2);
  }
}

+ (void)_sendRequestTrackingAnalytic:(unint64_t)a3 prompted:(BOOL)a4 deniedReason:(unint64_t)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v8, CFSTR("result"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v9, CFSTR("userWasPrompted"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v10, CFSTR("reasonDenied"));

  AnalyticsSendEvent();
}

void __48__ATTrackingManager__performTCCPreflightRequest__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (!v5 || a3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = (id)objc_opt_class();
      v6 = v8;
      _os_log_impl(&dword_20AE55000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] Received error invoking TCC preflight request.", (uint8_t *)&v7, 0xCu);

    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = tcc_authorization_record_get_authorization_right();
  }

}

+ (ATTrackingManagerAuthorizationStatus)trackingAuthorizationStatus
{
  id v3;
  double Current;
  double v5;
  BOOL v6;
  void *v7;
  id v8;
  ATTrackingManagerAuthorizationStatus v9;
  id v10;
  uint64_t v11;
  _QWORD v13[6];
  __int128 buf;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v3 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_20AE55000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] trackingAuthorizationStatus API call invoked.", (uint8_t *)&buf, 0xCu);

  }
  ++kRateLimitCounter;
  Current = CFAbsoluteTimeGetCurrent();
  if (kRateLimitCounter >= 6
    && ((v5 = Current - *(double *)&_lastTrackingAuthTimestamp, *(double *)&_lastTrackingAuthTimestamp != 0.0)
      ? (v6 = v5 < 1.0)
      : (v6 = 0),
        v6))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      v8 = v7;
      _os_log_impl(&dword_20AE55000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] Call to trackingAuthorizationStatus eligible for rate limiting", (uint8_t *)&buf, 0xCu);

    }
    return _lastAuthorizationStatus;
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x2020000000;
    v16 = 0;
    v10 = a1;
    objc_sync_enter(v10);
    v11 = objc_msgSend(v10, "_trackingAuthorizationStatus");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v11;
    objc_sync_exit(v10);

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __48__ATTrackingManager_trackingAuthorizationStatus__block_invoke;
    v13[3] = &unk_24C3DAB00;
    v13[4] = &buf;
    v13[5] = v10;
    if (trackingAuthorizationStatus_onceToken != -1)
      dispatch_once(&trackingAuthorizationStatus_onceToken, v13);
    _lastTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
    v9 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    _lastAuthorizationStatus = v9;
    _Block_object_dispose(&buf, 8);
  }
  return v9;
}

+ (unint64_t)_trackingAuthorizationStatus
{
  id v2;
  int v3;
  unint64_t v4;
  uint64_t v6;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = objc_msgSend(v2, "_restrictionProfileInstalled");
  if (((v3 | objc_msgSend(v2, "_userAllowedToChangeSettings") ^ 1) & 1) != 0
    || (objc_msgSend(v2, "_applicationHasDisqualifyingEntitlement") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6 = objc_msgSend(v2, "_performTCCPreflightRequest");
    if (v6)
    {
      if (v6 == 2)
      {
        v4 = 3;
      }
      else if (v6 == 1)
      {
        if (objc_msgSend(v2, "_isCrossAppTrackingAllowed"))
          v4 = 0;
        else
          v4 = 2;
      }
      else
      {
        v4 = 0;
      }
    }
    else
    {
      v4 = 2;
    }
  }
  objc_sync_exit(v2);

  return v4;
}

+ (BOOL)_applicationHasDisqualifyingEntitlement
{
  if (_applicationHasDisqualifyingEntitlement_once != -1)
    dispatch_once(&_applicationHasDisqualifyingEntitlement_once, &__block_literal_global);
  return _applicationHasDisqualifyingEntitlement_isDimSumApp;
}

+ (BOOL)_restrictionProfileInstalled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE639A0]);

  return v3;
}

+ (unint64_t)_performTCCPreflightRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[6];
  __int128 buf;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v3 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_20AE55000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] Performing TCC Access Preflight Request.", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(a1, "_TCCServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  tcc_service_singleton_for_CF_name();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  tcc_message_options_set_request_prompt_policy();
  tcc_credential_singleton_for_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x2020000000;
  v14 = 1;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__ATTrackingManager__performTCCPreflightRequest__block_invoke;
  v11[3] = &unk_24C3DAAB0;
  v11[4] = &buf;
  v11[5] = a1;
  v8 = (void *)MEMORY[0x20BD331EC](v11);
  tcc_server_message_request_authorization();
  v9 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v9;
}

+ (id)_TCCServer
{
  if (_TCCServer_onceToken != -1)
    dispatch_once(&_TCCServer_onceToken, &__block_literal_global_21);
  return (id)_TCCServer_server;
}

+ (BOOL)_userAllowedToChangeSettings
{
  void *v2;
  char v3;
  BOOL v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSharedIPad");

  if ((v3 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63978]) == 1;

  return v4;
}

+ (BOOL)_isCrossAppTrackingAllowed
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE639A0]) != 1;

  return v3;
}

uint64_t __48__ATTrackingManager_trackingAuthorizationStatus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_sendRequestTrackingAnalytic:prompted:deniedReason:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0, 0);
}

void __31__ATTrackingManager__TCCServer__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = tcc_server_create();
  v1 = (void *)_TCCServer_server;
  _TCCServer_server = v0;

}

+ (void)_sendTrackingStatusAnalytic:(unint64_t)a3 prompted:(BOOL)a4 deniedReason:(unint64_t)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v8, CFSTR("result"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v9, CFSTR("userWasPrompted"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v10, CFSTR("reasonDenied"));

  AnalyticsSendEvent();
}

+ (void)_performTCCAccessRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = (id)objc_opt_class();
    v5 = v16;
    _os_log_impl(&dword_20AE55000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] Performing TCC Access Request.", buf, 0xCu);

  }
  objc_msgSend(a1, "_TCCServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  tcc_service_singleton_for_CF_name();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  tcc_message_options_set_request_prompt_policy();
  tcc_credential_singleton_for_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__ATTrackingManager__performTCCAccessRequest___block_invoke;
  v12[3] = &unk_24C3DAAD8;
  v13 = v4;
  v14 = a1;
  v10 = v4;
  v11 = (void *)MEMORY[0x20BD331EC](v12);
  tcc_server_message_request_authorization();

}

void __46__ATTrackingManager__performTCCAccessRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t authorization_right;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (!v5 || a3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = (id)objc_opt_class();
      v7 = v9;
      _os_log_impl(&dword_20AE55000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] Received error invoking TCC access request.", (uint8_t *)&v8, 0xCu);

    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1);
  }
  else
  {
    authorization_right = tcc_authorization_record_get_authorization_right();
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), authorization_right);
  }

}

+ (BOOL)applicationStateActive
{
  BOOL result;

  if (applicationStateActive_once != -1)
    dispatch_once(&applicationStateActive_once, &__block_literal_global_23);
  result = applicationStateActive_application;
  if (applicationStateActive_application)
    return objc_msgSend((id)applicationStateActive_application, "performSelector:", applicationStateActive_applicationStateSelector) == 0;
  return result;
}

void __43__ATTrackingManager_applicationStateActive__block_invoke()
{
  Class v0;
  SEL v1;
  id obj;

  v0 = NSClassFromString(CFSTR("UIApplication"));
  v1 = NSSelectorFromString(CFSTR("sharedApplication"));
  applicationStateActive_applicationStateSelector = (uint64_t)NSSelectorFromString(CFSTR("applicationState"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class performSelector:](v0, "performSelector:", v1);
    obj = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_storeStrong((id *)&applicationStateActive_application, obj);

  }
}

+ (BOOL)isApplicationExtension
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(".appex"));

  return v4;
}

+ (void)requestTrackingAuthorizationWithCompletionHandler:(void *)completion
{
  void (**v4)(void *, uint64_t);
  id v5;
  double Current;
  BOOL v7;
  void *v8;
  id v9;
  int v10;
  char v11;
  uint64_t v12;
  int v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  void (**v17)(void *, uint64_t);
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = completion;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = (id)objc_opt_class();
    v5 = v20;
    _os_log_impl(&dword_20AE55000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] requestTrackingAuthorizationWithCompletionHandler API call invoked.", buf, 0xCu);

  }
  if (v4)
  {
    ++requestRateLimitCounter;
    Current = CFAbsoluteTimeGetCurrent();
    if (requestRateLimitCounter >= 6
      && ((Current = Current - *(double *)&_lastRequestTrackingAuthTimestamp,
           *(double *)&_lastRequestTrackingAuthTimestamp != 0.0)
        ? (v7 = Current < 1.0)
        : (v7 = 0),
          v7))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        v9 = v8;
        _os_log_impl(&dword_20AE55000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] Call to requestTrackingAuthorizationWithCompletionHandler eligible for rate limiting", buf, 0xCu);

      }
      v4[2](v4, _lastAuthorizationStatus);
    }
    else
    {
      v10 = objc_msgSend(a1, "_restrictionProfileInstalled", Current);
      v11 = objc_msgSend(a1, "_userAllowedToChangeSettings");
      if (v10)
      {
        objc_msgSend(a1, "_sendRequestTrackingAnalytic:prompted:deniedReason:", 1, 0, 2);
        _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
        _lastAuthorizationStatus = 1;
        v4[2](v4, 1);
      }
      else if ((v11 & 1) != 0)
      {
        if (objc_msgSend(a1, "_applicationHasDisqualifyingEntitlement"))
        {
          objc_msgSend(a1, "_sendRequestTrackingAnalytic:prompted:deniedReason:", 1, 0, 4);
          _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
          _lastAuthorizationStatus = 1;
          v4[2](v4, 1);
        }
        else
        {
          v12 = objc_msgSend(a1, "_performTCCPreflightRequest");
          if (v12 == 2)
          {
            objc_msgSend(a1, "_sendRequestTrackingAnalytic:prompted:deniedReason:", 3, 0, 0);
            _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
            _lastAuthorizationStatus = 3;
            v4[2](v4, 3);
          }
          else if (v12 == 1 && (objc_msgSend(a1, "_isCrossAppTrackingAllowed") & 1) != 0)
          {
            v13 = objc_msgSend(a1, "applicationStateActive");
            if (((v13 ^ 1 | objc_msgSend(a1, "isApplicationExtension")) & 1) != 0)
            {
              v14 = a1;
              objc_sync_enter(v14);
              v15 = objc_msgSend(v14, "_trackingAuthorizationStatus");
              objc_sync_exit(v14);

              objc_msgSend(v14, "_sendRequestTrackingAnalytic:prompted:deniedReason:", v15, 0, 0);
              _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
              _lastAuthorizationStatus = v15;
              v4[2](v4, v15);
            }
            else
            {
              v16[0] = MEMORY[0x24BDAC760];
              v16[1] = 3221225472;
              v16[2] = __71__ATTrackingManager_requestTrackingAuthorizationWithCompletionHandler___block_invoke;
              v16[3] = &unk_24C3DAB48;
              v18 = a1;
              v17 = v4;
              objc_msgSend(a1, "_performTCCAccessRequest:", v16);

            }
          }
          else
          {
            objc_msgSend(a1, "_sendRequestTrackingAnalytic:prompted:deniedReason:", 2, 0, 1);
            _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
            _lastAuthorizationStatus = 2;
            v4[2](v4, 2);
          }
        }
      }
      else
      {
        objc_msgSend(a1, "_sendRequestTrackingAnalytic:prompted:deniedReason:", 1, 0, 3);
        _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
        _lastAuthorizationStatus = 1;
        v4[2](v4, 1);
      }
    }
  }

}

uint64_t __71__ATTrackingManager_requestTrackingAuthorizationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    if (a2 == 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "_sendRequestTrackingAnalytic:prompted:deniedReason:", 3, 1, 0);
      _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
      _lastAuthorizationStatus = 3;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_sendRequestTrackingAnalytic:prompted:deniedReason:", 0, 1, 0);
      _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
      _lastAuthorizationStatus = 0;
    }
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_sendRequestTrackingAnalytic:prompted:deniedReason:", 2, 1, 1);
    _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
    _lastAuthorizationStatus = 2;
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  return v3();
}

@end
