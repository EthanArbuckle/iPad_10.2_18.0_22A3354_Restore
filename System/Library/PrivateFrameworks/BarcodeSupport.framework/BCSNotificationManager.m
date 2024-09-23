@implementation BCSNotificationManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__BCSNotificationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_sharedManager;
}

void __39__BCSNotificationManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v1;

}

- (BCSNotificationManager)init
{
  BCSNotificationManager *v2;
  BCSNotificationManager *v3;
  uint64_t v4;
  NSMutableSet *notifications;
  BCSNotificationManager *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BCSNotificationManager;
  v2 = -[BCSNotificationManager init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BCSNotificationManager _configureUserNotificationCenter](v2, "_configureUserNotificationCenter");
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    notifications = v3->_notifications;
    v3->_notifications = (NSMutableSet *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)_configureUserNotificationCenter
{
  UNUserNotificationCenter *v3;
  UNUserNotificationCenter *qrCodeUserNotificationCenter;
  UNUserNotificationCenter *v5;
  UNUserNotificationCenter *nfcUserNotificationCenter;

  v3 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.barcodesupport.qrcode"));
  qrCodeUserNotificationCenter = self->_qrCodeUserNotificationCenter;
  self->_qrCodeUserNotificationCenter = v3;

  -[UNUserNotificationCenter setDelegate:](self->_qrCodeUserNotificationCenter, "setDelegate:", self);
  -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](self->_qrCodeUserNotificationCenter, "setWantsNotificationResponsesDelivered");
  v5 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.barcodesupport.nfc"));
  nfcUserNotificationCenter = self->_nfcUserNotificationCenter;
  self->_nfcUserNotificationCenter = v5;

  -[UNUserNotificationCenter setDelegate:](self->_nfcUserNotificationCenter, "setDelegate:", self);
  -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](self->_nfcUserNotificationCenter, "setWantsNotificationResponsesDelivered");
}

- (void)invalidate
{
  UNUserNotificationCenter *qrCodeUserNotificationCenter;
  UNUserNotificationCenter *nfcUserNotificationCenter;

  -[UNUserNotificationCenter removeAllPendingNotificationRequests](self->_qrCodeUserNotificationCenter, "removeAllPendingNotificationRequests");
  qrCodeUserNotificationCenter = self->_qrCodeUserNotificationCenter;
  self->_qrCodeUserNotificationCenter = 0;

  -[UNUserNotificationCenter removeAllPendingNotificationRequests](self->_nfcUserNotificationCenter, "removeAllPendingNotificationRequests");
  nfcUserNotificationCenter = self->_nfcUserNotificationCenter;
  self->_nfcUserNotificationCenter = 0;

}

- (id)_userNotificationCenterForCodeType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 2)
    a2 = (SEL)*(id *)((char *)&self->super.isa + qword_2174BF6E8[a3 - 1]);
  return (id)(id)a2;
}

- (void)scheduleNotification:(id)a3 codeType:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "shouldSkipBanner"))
  {
    objc_msgSend(v7, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleActionWithIdentifier:notificationResponseOriginID:", v6, &stru_24D788C60);

  }
  else
  {
    -[BCSNotificationManager _addRequestForNotification:codeType:](self, "_addRequestForNotification:codeType:", v7, a4);
  }

}

- (void)_addRequestForNotification:(id)a3 codeType:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[BCSNotificationManager _userNotificationCenterForCodeType:](self, "_userNotificationCenterForCodeType:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addNotificationRequest:withCompletionHandler:", v6, &__block_literal_global_4);

    -[NSMutableSet addObject:](self->_notifications, "addObject:", v8);
  }

}

void __62__BCSNotificationManager__addRequestForNotification_codeType___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __62__BCSNotificationManager__addRequestForNotification_codeType___block_invoke_cold_1(v2);

}

- (id)_notificationWithIdentifier:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_notifications;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)withdrawNotificationsWithProcessID:(int)a3 codeType:(int64_t)a4
{
  void *v6;
  void *v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = self->_notifications;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v13, "requestingProcessID") == a3)
        {
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

          objc_msgSend(v6, "addObject:", v13);
        }
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  -[BCSNotificationManager _userNotificationCenterForCodeType:](self, "_userNotificationCenterForCodeType:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removePendingNotificationRequestsWithIdentifiers:", v7);
  objc_msgSend(v15, "removeDeliveredNotificationsWithIdentifiers:", v7);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        -[NSMutableSet removeObject:](self->_notifications, "removeObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
  }

}

- (void)didReceiveNotificationResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v12 = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSNotificationManager: did receive notification response with action identifier %{public}@ and request identifier %{public}@", (uint8_t *)&v12, 0x16u);
  }
  -[BCSNotificationManager _notificationWithIdentifier:](self, "_notificationWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[NSMutableSet removeObject:](self->_notifications, "removeObject:", v9);
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF8A70]) & 1) == 0)
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF8A60]))
    {
      v10 = v8;

      v5 = v10;
    }
    if (objc_msgSend(v9, "shouldHandleBulletinActionWithIdentifier:", v5))
    {
      objc_msgSend(v4, "originIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleActionWithIdentifier:notificationResponseOriginID:", v5, v11);

    }
    objc_msgSend(v9, "didHandleBulletinActionWithIdentifier:", v5);
  }

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void (**v7)(void);

  v7 = (void (**)(void))a5;
  -[BCSNotificationManager didReceiveNotificationResponse:](self, "didReceiveNotificationResponse:", a4);
  v7[2]();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_nfcUserNotificationCenter, 0);
  objc_storeStrong((id *)&self->_qrCodeUserNotificationCenter, 0);
}

void __62__BCSNotificationManager__addRequestForNotification_codeType___block_invoke_cold_1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138543362;
  v3 = v1;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSNotificationManager: error adding notification request: %{public}@", (uint8_t *)&v2, 0xCu);

}

@end
