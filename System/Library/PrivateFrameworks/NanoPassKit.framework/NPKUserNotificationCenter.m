@implementation NPKUserNotificationCenter

- (NPKUserNotificationCenter)init
{
  return -[NPKUserNotificationCenter initWithNotificationBundleIdentifier:](self, "initWithNotificationBundleIdentifier:", *MEMORY[0x24BE6F9C0]);
}

- (NPKUserNotificationCenter)initWithNotificationBundleIdentifier:(id)a3
{
  id v4;
  NPKUserNotificationCenter *v5;
  uint64_t v6;
  UNUserNotificationCenter *notificationCenter;
  _QWORD v9[4];
  NPKUserNotificationCenter *v10;
  objc_super v11;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("bundle identifier is missing"));
  v11.receiver = self;
  v11.super_class = (Class)NPKUserNotificationCenter;
  v5 = -[NPKUserNotificationCenter init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", v4);
    notificationCenter = v5->_notificationCenter;
    v5->_notificationCenter = (UNUserNotificationCenter *)v6;

    -[UNUserNotificationCenter setPrivateDelegate:](v5->_notificationCenter, "setPrivateDelegate:", v5);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__NPKUserNotificationCenter_initWithNotificationBundleIdentifier___block_invoke;
    v9[3] = &unk_24CFEDE30;
    v10 = v5;
    -[NPKUserNotificationCenter fetchAuthorizationStatusWithCompletion:](v10, "fetchAuthorizationStatusWithCompletion:", v9);

  }
  return v5;
}

uint64_t __66__NPKUserNotificationCenter_initWithNotificationBundleIdentifier___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = a2;
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_30);
  return (id)sharedInstance_notificationCenter;
}

void __43__NPKUserNotificationCenter_sharedInstance__block_invoke()
{
  NPKUserNotificationCenter *v0;
  void *v1;

  v0 = objc_alloc_init(NPKUserNotificationCenter);
  v1 = (void *)sharedInstance_notificationCenter;
  sharedInstance_notificationCenter = (uint64_t)v0;

}

- (void)requestAuthorizationIfNecessaryForPassesManager:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __92__NPKUserNotificationCenter_requestAuthorizationIfNecessaryForPassesManager_withCompletion___block_invoke;
  v8[3] = &unk_24CFEDE78;
  v9 = v6;
  v7 = v6;
  -[NPKUserNotificationCenter _requestNotificationAuthorizationWithPreconditionCheck:completion:](self, "_requestNotificationAuthorizationWithPreconditionCheck:completion:", v8, a4);

}

uint64_t __92__NPKUserNotificationCenter_requestAuthorizationIfNecessaryForPassesManager_withCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "passes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");
  if (v2 == 1)
  {
    objc_msgSend(v1, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "secureElementPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "isPeerPaymentPass");
    if (objc_msgSend(v4, "contactlessActivationState") == 4)
      v6 = v5 ^ 1u;
    else
      v6 = 1;

  }
  else
  {
    v6 = v2 != 0;
  }

  return v6;
}

- (void)requestAuthorizationWithCompletion:(id)a3
{
  -[NPKUserNotificationCenter _requestNotificationAuthorizationWithPreconditionCheck:completion:](self, "_requestNotificationAuthorizationWithPreconditionCheck:completion:", &__block_literal_global_38_0, a3);
}

uint64_t __64__NPKUserNotificationCenter_requestAuthorizationWithCompletion___block_invoke()
{
  return 1;
}

- (void)fetchAuthorizationStatusWithCompletion:(id)a3
{
  id v4;
  UNUserNotificationCenter *notificationCenter;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  notificationCenter = self->_notificationCenter;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__NPKUserNotificationCenter_fetchAuthorizationStatusWithCompletion___block_invoke;
  v7[3] = &unk_24CFEDEE0;
  v8 = v4;
  v6 = v4;
  -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:](notificationCenter, "getNotificationSettingsWithCompletionHandler:", v7);

}

uint64_t __68__NPKUserNotificationCenter_fetchAuthorizationStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint64_t result;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a2, "authorizationStatus");
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      UNAuthorizationStatusString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Notification Authorization Status is: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  return result;
}

- (void)setNotificationCategoryWithIdentifier:(id)a3 intentIdentifier:(id)a4 actions:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  UNUserNotificationCenter *notificationCenter;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x24BDF8838];
  v13 = v11;
  if (v11)
  {
    if (v10)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "categoryWithIdentifier:actions:intentIdentifiers:options:", v18, v13, v17, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_7;
LABEL_3:
  objc_msgSend(v12, "categoryWithIdentifier:actions:intentIdentifiers:options:", v18, v13, v10, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
LABEL_4:

LABEL_5:
  notificationCenter = self->_notificationCenter;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter setNotificationCategories:](notificationCenter, "setNotificationCategories:", v16);

}

- (void)addNotification:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "body");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationCategoryIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v6, "wantsBadgedIcon");
    LOBYTE(v17) = objc_msgSend(v6, "isSuppressed");
    -[NPKUserNotificationCenter _addNotificationWithNotificationIdentifier:title:body:categoryIdentifier:userInfo:wantsBadgedIcon:suppressed:completion:](self, "_addNotificationWithNotificationIdentifier:title:body:categoryIdentifier:userInfo:wantsBadgedIcon:suppressed:completion:", v9, v10, v11, v12, v13, v14, v17, v8);

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FC8];
    v19[0] = CFSTR("Notification type not supported");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("NPKUserNotificationsErrorDomain"), -2001, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *))v8)[2](v8, v9);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  self->_authorizationStatus = objc_msgSend(a4, "authorizationStatus", a3);
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      UNAuthorizationStatusString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Notification Authorization Status did change: %@", (uint8_t *)&v8, 0xCu);

    }
  }
}

- (void)_addNotificationWithNotificationIdentifier:(id)a3 title:(id)a4 body:(id)a5 categoryIdentifier:(id)a6 userInfo:(id)a7 wantsBadgedIcon:(BOOL)a8 suppressed:(BOOL)a9 completion:(id)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  UNUserNotificationCenter *notificationCenter;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v10 = a8;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a10;
  LOBYTE(v28) = a9;
  -[NPKUserNotificationCenter _requestWithNotificationIdentifier:title:body:categoryIdentifier:userInfo:wantsBadgedIcon:suppressed:](self, "_requestWithNotificationIdentifier:title:body:categoryIdentifier:userInfo:wantsBadgedIcon:suppressed:", v16, v17, v18, a6, v19, v10, v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  notificationCenter = self->_notificationCenter;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __149__NPKUserNotificationCenter__addNotificationWithNotificationIdentifier_title_body_categoryIdentifier_userInfo_wantsBadgedIcon_suppressed_completion___block_invoke;
  v29[3] = &unk_24CFEDF08;
  v30 = v16;
  v31 = v17;
  v32 = v18;
  v33 = v19;
  v34 = v20;
  v23 = v20;
  v24 = v19;
  v25 = v18;
  v26 = v17;
  v27 = v16;
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](notificationCenter, "addNotificationRequest:withCompletionHandler:", v21, v29);

}

void __149__NPKUserNotificationCenter__addNotificationWithNotificationIdentifier_title_body_categoryIdentifier_userInfo_wantsBadgedIcon_suppressed_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      v8 = a1[5];
      v9 = a1[6];
      v10 = a1[7];
      v12 = 136316418;
      v13 = "-[NPKUserNotificationCenter _addNotificationWithNotificationIdentifier:title:body:categoryIdentifier:userInf"
            "o:wantsBadgedIcon:suppressed:completion:]_block_invoke";
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %s Scheduled notification with notification ID: %@, title: %@, body: %@, userInfo: %@. Error: %@", (uint8_t *)&v12, 0x3Eu);
    }

  }
  v11 = a1[8];
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

- (id)_requestWithNotificationIdentifier:(id)a3 title:(id)a4 body:(id)a5 categoryIdentifier:(id)a6 userInfo:(id)a7 wantsBadgedIcon:(BOOL)a8 suppressed:(BOOL)a9
{
  _BOOL8 v9;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v9 = a8;
  v14 = (objc_class *)MEMORY[0x24BDF8800];
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc_init(v14);
  objc_msgSend(v20, "setTitle:", v18);

  objc_msgSend(v20, "setBody:", v17);
  objc_msgSend(v20, "setCategoryIdentifier:", v16);

  objc_msgSend(v20, "setUserInfo:", v15);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDate:", v21);

  objc_msgSend(v20, "setShouldShowSubordinateIcon:", v9);
  objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAlertTopic:", *MEMORY[0x24BEB8D00]);
  objc_msgSend(v20, "setSound:", v22);
  objc_msgSend(MEMORY[0x24BDF8850], "iconForApplicationIdentifier:", CFSTR("com.apple.NanoPassbook"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIcon:", v23);

  objc_msgSend(v20, "setInterruptionLevel:", 1);
  if (a9)
    v24 = 4;
  else
    v24 = 15;
  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:destinations:", v19, v20, 0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)_requestNotificationAuthorizationWithPreconditionCheck:(id)a3 completion:(id)a4
{
  uint64_t (**v6)(_QWORD);
  id v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t (**)(_QWORD))a3;
  v7 = a4;
  switch(self->_authorizationStatus)
  {
    case 0:
    case 3:
    case 4:
      v8 = v6[2](v6);
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (!v8)
      {
        if (!v10)
          goto LABEL_16;
        pk_General_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          v14 = "Notice: Notification Authorization not required; precondition not satisfied.";
          goto LABEL_14;
        }
        goto LABEL_15;
      }
      if (v10)
      {
        pk_General_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          UNAuthorizationStatusString();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412290;
          v21 = v12;
          _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Notification Authorization status was: %@ Full Authorization being requested", (uint8_t *)&v20, 0xCu);

        }
      }
      -[NPKUserNotificationCenter _requestNotificationAuthorizationWithOptions:completion:](self, "_requestNotificationAuthorizationWithOptions:completion:", 7, v7);
      break;
    case 1:
      pk_General_log();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        pk_General_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          v14 = "Notice: Notification Authorization already denied";
LABEL_14:
          _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, 2u);
        }
LABEL_15:

      }
LABEL_16:
      if (v7)
        (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
      break;
    case 2:
      pk_General_log();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      if (v18)
      {
        pk_General_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Notice: Notification Authorization already authorized", (uint8_t *)&v20, 2u);
        }

      }
      if (v7)
        (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
      break;
    default:
      break;
  }

}

- (void)_requestNotificationAuthorizationWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  UNUserNotificationCenter *notificationCenter;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  notificationCenter = self->_notificationCenter;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __85__NPKUserNotificationCenter__requestNotificationAuthorizationWithOptions_completion___block_invoke;
  v9[3] = &unk_24CFEDF30;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:](notificationCenter, "requestAuthorizationWithOptions:completionHandler:", a3, v9);

}

void __85__NPKUserNotificationCenter__requestNotificationAuthorizationWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  __CFString *v13;
  uint64_t v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((_DWORD)a2)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 2;
  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("NO");
      if ((_DWORD)a2)
        v9 = CFSTR("YES");
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Notification Authorization was granted: %@ error: %@", (uint8_t *)&v15, 0x16u);
    }

  }
  pk_General_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      UNAuthorizationStatusString();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Notification Authorization Status is: %@", (uint8_t *)&v15, 0xCu);

    }
  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
