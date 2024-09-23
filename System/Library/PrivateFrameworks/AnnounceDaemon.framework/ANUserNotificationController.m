@implementation ANUserNotificationController

- (ANUserNotificationController)init
{
  ANUserNotificationController *v2;
  uint64_t v3;
  UNUserNotificationCenter *notificationCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ANUserNotificationController;
  v2 = -[ANUserNotificationController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.Home"));
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v3;

  }
  return v2;
}

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ANUserNotificationController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, block);
  return (id)sharedController_sharedController;
}

void __48__ANUserNotificationController_sharedController__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = v0;

}

- (BOOL)canPostUserNotificationForAnnouncement:(id)a3 home:(id)a4
{
  void *v4;
  id v5;
  int v6;
  int v7;
  NSObject *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CF7E98];
  v5 = a4;
  v6 = objc_msgSend(v4, "isHomeAppInstalled");
  v7 = objc_msgSend(v5, "an_announceNotificationsEnabledForCurrentUserWithOverrideHomeLocationStatus:", 0);

  ANLogHandleUserNotificationsController();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138413058;
    v11 = &stru_1E93913D0;
    v12 = 1024;
    v13 = v7 & v6;
    v14 = 1024;
    v15 = v6;
    v16 = 1024;
    v17 = v7;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@Can Post User Notification: %d (Home App Installed: %d, Enabled for Home: %d)", (uint8_t *)&v10, 0x1Eu);
  }

  return v7 & v6;
}

- (void)postNotificationForAnnouncement:(id)a3 groupAnnouncements:(id)a4 home:(id)a5 groupID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _BOOL4 v23;
  _BOOL8 v24;
  _BOOL8 v25;
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  BOOL v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v26 = a4;
  v11 = a5;
  v12 = a6;
  if (-[ANUserNotificationController canPostUserNotificationForAnnouncement:home:](self, "canPostUserNotificationForAnnouncement:home:", v10, v11))
  {
    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLForDefault:", *MEMORY[0x1E0CF7C30]);

    if (v14)
    {
      v15 = v12;
    }
    else
    {
      objc_msgSend(v10, "identifier");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v15;
    -[ANUserNotificationController notificationCenter](self, "notificationCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deliveredNotifications");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __96__ANUserNotificationController_postNotificationForAnnouncement_groupAnnouncements_home_groupID___block_invoke;
    v31[3] = &unk_1E938F398;
    v21 = v17;
    v32 = v21;
    objc_msgSend(v19, "na_firstObjectPassingTest:", v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = -[ANUserNotificationController suspendNotificationExpiration](self, "suspendNotificationExpiration");
    objc_initWeak((id *)buf, self);
    v24 = -[ANUserNotificationController suspendNotificationExpiration](self, "suspendNotificationExpiration");
    if (v22)
      v25 = v23;
    else
      v25 = 0;
    v27[0] = v20;
    v27[1] = 3221225472;
    v27[2] = __96__ANUserNotificationController_postNotificationForAnnouncement_groupAnnouncements_home_groupID___block_invoke_2;
    v27[3] = &unk_1E938F3C0;
    objc_copyWeak(&v29, (id *)buf);
    v30 = v25;
    v16 = v21;
    v28 = v16;
    -[ANUserNotificationController contentWithAnnouncement:groupAnnouncements:home:threadIdentifier:isReplacement:suspendExpiration:completionHandler:](self, "contentWithAnnouncement:groupAnnouncements:home:threadIdentifier:isReplacement:suspendExpiration:completionHandler:", v10, v26, v11, v12, v25, v24, v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    ANLogHandleUserNotificationsController();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v16, OS_LOG_TYPE_DEFAULT, "%@Skip posting user notification", buf, 0xCu);
    }
  }

}

uint64_t __96__ANUserNotificationController_postNotificationForAnnouncement_groupAnnouncements_home_groupID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __96__ANUserNotificationController_postNotificationForAnnouncement_groupAnnouncements_home_groupID___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  id v7;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = WeakRetained;
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(WeakRetained, "_replaceContentForRequestWithRequestID:replacementContent:completionHandler:", v6, v4, 0);
  else
    objc_msgSend(WeakRetained, "_postNotificationWithContent:requestID:", v4, v6);

}

- (void)updateNotificationForAnnouncements:(id)a3 home:(id)a4 groupID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  char v19;
  void *v20;
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[ANUserNotificationController _canUpdateUserNotificationForHome:](self, "_canUpdateUserNotificationForHome:", v9))
  {
    ANLogHandleUserNotificationsController();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v14, OS_LOG_TYPE_DEFAULT, "%@Skip updating user notification", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLForDefault:", *MEMORY[0x1E0CF7C30]);

    if ((v12 & 1) != 0)
    {
      objc_msgSend(v8, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v14 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = v8;
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__ANUserNotificationController_updateNotificationForAnnouncements_home_groupID___block_invoke;
    v15[3] = &unk_1E938F410;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    v18 = v10;
    v19 = v12;
    -[NSObject enumerateObjectsUsingBlock:](v14, "enumerateObjectsUsingBlock:", v15);

LABEL_9:
  }

}

void __80__ANUserNotificationController_updateNotificationForAnnouncements_home_groupID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = objc_msgSend(v5, "suspendNotificationExpiration");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__ANUserNotificationController_updateNotificationForAnnouncements_home_groupID___block_invoke_2;
  v10[3] = &unk_1E938F3E8;
  objc_copyWeak(&v13, &location);
  v14 = *(_BYTE *)(a1 + 64);
  v11 = *(id *)(a1 + 56);
  v9 = v3;
  v12 = v9;
  objc_msgSend(v5, "contentWithAnnouncement:groupAnnouncements:home:threadIdentifier:isReplacement:suspendExpiration:completionHandler:", v9, v4, v6, v7, 1, v8, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __80__ANUserNotificationController_updateNotificationForAnnouncements_home_groupID___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_BYTE *)(a1 + 56))
  {
    v4 = *(id *)(a1 + 32);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(WeakRetained, "_replaceContentForRequestWithRequestID:replacementContent:completionHandler:", v4, v6, 0);

}

- (void)removeNotificationWithGroupID:(id)a3
{
  UNUserNotificationCenter *notificationCenter;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  notificationCenter = self->_notificationCenter;
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:](notificationCenter, "removePendingNotificationRequestsWithIdentifiers:", v6, v7, v8);

}

- (void)cleanForExit
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  ANUserNotificationController *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForDefault:", *MEMORY[0x1E0CF7B48]);

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_opt_new();
    v33 = self;
    v34 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[ANUserNotificationController notificationCenter](self, "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pendingNotificationRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v12, "content");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "categoryIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("ANAnnouncement"));

          if (v15)
          {
            objc_msgSend(v12, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v16);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v9);
    }
    v32 = v5;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[ANUserNotificationController notificationCenter](v33, "notificationCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deliveredNotifications");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          objc_msgSend(v23, "request");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "content");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "categoryIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("ANAnnouncement"));

          if (v27)
          {
            objc_msgSend(v23, "request");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "identifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v29);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v20);
    }

    -[ANUserNotificationController notificationCenter](v33, "notificationCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removePendingNotificationRequestsWithIdentifiers:", v32);

    -[ANUserNotificationController notificationCenter](v33, "notificationCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "removeDeliveredNotificationsWithIdentifiers:", v34);

  }
}

- (void)pauseExpirationForNotificationsWithGroupIDs:(id)a3
{
  id v4;

  v4 = a3;
  -[ANUserNotificationController setSuspendNotificationExpiration:](self, "setSuspendNotificationExpiration:", 1);
  -[ANUserNotificationController _setContentExpirationDate:forNotificationsWithThreadIDs:](self, "_setContentExpirationDate:forNotificationsWithThreadIDs:", 0, v4);

}

- (void)resumeExpirationForNotificationsWithGroupIDs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CF7E30];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberForDefault:", *MEMORY[0x1E0CF7B08]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v8, "integerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANUserNotificationController _setContentExpirationDate:forNotificationsWithThreadIDs:](self, "_setContentExpirationDate:forNotificationsWithThreadIDs:", v7, v5);

  -[ANUserNotificationController setSuspendNotificationExpiration:](self, "setSuspendNotificationExpiration:", 0);
}

- (void)postSendFailureNotificationForAnnouncement:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CF7E08];
  v5 = a3;
  objc_msgSend(v5, "remoteSessionDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextFromDictionary:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "homeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANUserNotificationController _contentForSendFailureForAnnouncement:homeName:](self, "_contentForSendFailureForAnnouncement:homeName:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ANUserNotificationController _postNotificationWithContent:requestID:](self, "_postNotificationWithContent:requestID:", v8, v9);
}

- (BOOL)hasDeliveredNotificationsWithGroupID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[ANUserNotificationController notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deliveredNotifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__ANUserNotificationController_hasDeliveredNotificationsWithGroupID___block_invoke;
  v11[3] = &unk_1E938F398;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  return v9;
}

uint64_t __69__ANUserNotificationController_hasDeliveredNotificationsWithGroupID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("ANAnnouncement")))
  {
    objc_msgSend(v3, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "threadIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)contentBodyForAnnouncers:(id)a3 inHome:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v27;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == 2)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isUser");
    objc_msgSend(v8, "nameInHome:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nameInHome:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v13;
    v15 = objc_msgSend(v13, "isUser");
    ANLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
    v18 = objc_msgSend(v12, "isEqualToString:", v16);

    ANLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v14, "isEqualToString:", v19);

    if (v11 && v15)
    {
      v21 = v17;
    }
    else if (((v11 | v15) & 1) != 0)
    {
      if ((v18 | v20) != 1)
      {
        v21 = v17;
        v25 = v27;
        ANLocalizedStringWithFormat();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      v21 = v17;
    }
    else
    {
      v21 = v17;
    }
    ANLocalizedStringWithFormat();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v27;
LABEL_18:

    goto LABEL_19;
  }
  if (v7 == 1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isUser");
    objc_msgSend(v8, "nameInHome:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ANLocalizedStringWithFormat();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

    goto LABEL_19;
  }
  if (v7)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v8, "isUser");
    objc_msgSend(v8, "nameInHome:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("USER_NOTIFICATION_THREE_OR_MORE_SENDER_BODY_LOCATION_%@_%lu");
    if (v22)
      v23 = CFSTR("USER_NOTIFICATION_THREE_OR_MORE_SENDER_BODY_PERSON_%@_%lu");
    v24 = v23;
    objc_msgSend(v5, "count");
    ANLocalizedStringWithFormat();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  ANLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ANLocalizedStringWithFormat();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v9;
}

- (BOOL)_canUpdateUserNotificationForHome:(id)a3
{
  int v3;
  NSObject *v4;
  int v6;
  const __CFString *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF7E98], "isHomeAppInstalled", a3);
  ANLogHandleUserNotificationsController();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412802;
    v7 = &stru_1E93913D0;
    v8 = 1024;
    v9 = v3;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "%@Can Update User Notification: %d (Home App Installed: %d)", (uint8_t *)&v6, 0x18u);
  }

  return v3;
}

- (id)_contentForSendFailureForAnnouncement:(id)a3 homeName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  ANLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  ANLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBody:", v8);

  objc_msgSend(v6, "setCategoryIdentifier:", CFSTR("ANAnnouncement"));
  objc_msgSend(MEMORY[0x1E0CEC760], "defaultSound");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSound:", v9);

  -[ANUserNotificationController _userInfoForFailedDeliveryForAnnouncement:](self, "_userInfoForFailedDeliveryForAnnouncement:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfo:", v10);

  objc_msgSend(v5, "defaultActionURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDefaultActionURL:", v11);
  objc_msgSend(v6, "setShouldBackgroundDefaultAction:", 1);
  objc_msgSend(v6, "setShouldSuppressDefaultAction:", 1);
  objc_msgSend(v6, "setShouldPreventNotificationDismissalAfterDefaultAction:", 1);
  v12 = (void *)objc_msgSend(v6, "copy");

  return v12;
}

- (id)_userInfoForFailedDeliveryForAnnouncement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E939CD68, *MEMORY[0x1E0CF7DA0]);
  objc_msgSend(v3, "sendFailureDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CF7D80]);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  +[ANHomeManager shared](ANHomeManager, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allHomes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CF7D88]);

  v10 = (void *)objc_msgSend(v4, "copy");
  return v10;
}

- (void)_postNotificationWithContent:(id)a3 requestID:(id)a4
{
  id v6;
  void *v7;
  UNUserNotificationCenter *notificationCenter;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", a4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  notificationCenter = self->_notificationCenter;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__ANUserNotificationController__postNotificationWithContent_requestID___block_invoke;
  v11[3] = &unk_1E938F438;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](notificationCenter, "addNotificationRequest:withCompletionHandler:", v10, v11);

}

void __71__ANUserNotificationController__postNotificationWithContent_requestID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ANLogHandleUserNotificationsController();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = &stru_1E93913D0;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_ERROR, "%@Failed to add notification: %@", (uint8_t *)&v8, 0x16u);
    }

    +[ANAnalytics shared](ANAnalytics, "shared");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject error:](v5, "error:", 5012);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "expirationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = &stru_1E93913D0;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@Added notification. ID = %@, Expiration = %@", (uint8_t *)&v8, 0x20u);

  }
}

- (void)_setContentExpirationDate:(id)a3 forNotificationsWithThreadIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  ANUserNotificationController *v14;

  v6 = a3;
  v7 = a4;
  -[ANUserNotificationController notificationCenter](self, "notificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__ANUserNotificationController__setContentExpirationDate_forNotificationsWithThreadIDs___block_invoke;
  v11[3] = &unk_1E938F460;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "getDeliveredNotificationsWithCompletionHandler:", v11);

}

void __88__ANUserNotificationController__setContentExpirationDate_forNotificationsWithThreadIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a2;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v20)
  {
    v2 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v25 != v2)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v4, "request");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "content");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "categoryIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ANAnnouncement")) & 1) != 0)
        {
          v8 = *(void **)(a1 + 32);
          objc_msgSend(v4, "request");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "content");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "threadIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v8) = objc_msgSend(v8, "containsObject:", v11);

          if (!(_DWORD)v8)
            continue;
          objc_msgSend(v4, "request");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "content");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = (void *)objc_msgSend(v13, "mutableCopy");

          objc_msgSend(v5, "setExpirationDate:", *(_QWORD *)(a1 + 40));
          v14 = *(void **)(a1 + 48);
          objc_msgSend(v4, "request");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v5, "copy");
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __88__ANUserNotificationController__setContentExpirationDate_forNotificationsWithThreadIDs___block_invoke_2;
          v21[3] = &unk_1E938F438;
          v22 = *(id *)(a1 + 40);
          v23 = v4;
          objc_msgSend(v14, "_replaceContentForRequestWithRequestID:replacementContent:completionHandler:", v16, v17, v21);

          v6 = v22;
        }
        else
        {

        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v20);
  }

}

void __88__ANUserNotificationController__setContentExpirationDate_forNotificationsWithThreadIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    ANLogHandleUserNotificationsController();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "request");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412802;
      v8 = &stru_1E93913D0;
      v9 = 2112;
      v10 = v4;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "%@Set Expiration to (%@) For Notification with Request Identifier: %@", (uint8_t *)&v7, 0x20u);

    }
  }
}

- (void)_replaceContentForRequestWithRequestID:(id)a3 replacementContent:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[ANUserNotificationController notificationCenter](self, "notificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __108__ANUserNotificationController__replaceContentForRequestWithRequestID_replacementContent_completionHandler___block_invoke;
  v14[3] = &unk_1E938F488;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v13, v10, v14);

}

void __108__ANUserNotificationController__replaceContentForRequestWithRequestID_replacementContent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ANLogHandleUserNotificationsController();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = &stru_1E93913D0;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_ERROR, "%@Failed to replace Notification Content For Request Identifier (%@). Error = %@", (uint8_t *)&v9, 0x20u);
    }

    +[ANAnalytics shared](ANAnalytics, "shared");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject error:](v5, "error:", 5013);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138412546;
    v10 = &stru_1E93913D0;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@Replaced Content for Notification with Request Identifier: %@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (void)_replaceContentForRequestsWithThreadID:(id)a3 replacementContent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  -[ANUserNotificationController notificationCenter](self, "notificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deliveredNotifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__ANUserNotificationController__replaceContentForRequestsWithThreadID_replacementContent___block_invoke;
  v16[3] = &unk_1E938F398;
  v17 = v6;
  v13 = v6;
  objc_msgSend(v9, "na_filter:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __90__ANUserNotificationController__replaceContentForRequestsWithThreadID_replacementContent___block_invoke_2;
  v14[3] = &unk_1E938F4B0;
  v14[4] = self;
  v15 = v7;
  v12 = v7;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

}

uint64_t __90__ANUserNotificationController__replaceContentForRequestsWithThreadID_replacementContent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v6;
}

void __90__ANUserNotificationController__replaceContentForRequestsWithThreadID_replacementContent___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_replaceContentForRequestWithRequestID:replacementContent:completionHandler:", v4, *(_QWORD *)(a1 + 40), 0);

}

- (ANUserNotificationControllerDelegate)delegate
{
  return (ANUserNotificationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (BOOL)suspendNotificationExpiration
{
  return self->_suspendNotificationExpiration;
}

- (void)setSuspendNotificationExpiration:(BOOL)a3
{
  self->_suspendNotificationExpiration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)contentWithAnnouncement:(ANAnnouncement *)a3 groupAnnouncements:(NSArray *)a4 home:(HMHome *)a5 threadIdentifier:(NSString *)a6 isReplacement:(BOOL)a7 suspendExpiration:(BOOL)a8 completionHandler:(id)a9
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  ANAnnouncement *v24;
  NSArray *v25;
  HMHome *v26;
  NSString *v27;
  ANUserNotificationController *v28;
  uint64_t v29;

  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C488);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a9);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a3;
  *(_QWORD *)(v20 + 24) = a4;
  *(_QWORD *)(v20 + 32) = a5;
  *(_QWORD *)(v20 + 40) = a6;
  *(_BYTE *)(v20 + 48) = a7;
  *(_BYTE *)(v20 + 49) = a8;
  *(_QWORD *)(v20 + 56) = v19;
  *(_QWORD *)(v20 + 64) = self;
  v21 = sub_1D23F2930();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EFC7C498;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EFC7C4A8;
  v23[5] = v22;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  v28 = self;
  sub_1D23E90C4((uint64_t)v18, (uint64_t)&unk_1EFC7C4B8, (uint64_t)v23);
  swift_release();
}

@end
