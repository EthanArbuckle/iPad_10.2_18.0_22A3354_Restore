@implementation IMExtensionNotificationManager

+ (id)sharedInstance
{
  if (qword_1ED0D3A80 != -1)
    dispatch_once(&qword_1ED0D3A80, &unk_1E5AAF0A8);
  return (id)qword_1ED0D3868;
}

- (IMExtensionNotificationManager)init
{
  IMExtensionNotificationManager *v2;
  id v3;
  IMDFamilyInviteNotificationContext *v4;
  void *v5;
  IMDScreenTimeAskNotificationContext *v6;
  void *v7;
  void *v8;
  IMDSafetyMonitorNotificationContext *v9;
  void *v10;
  IMDAskToBuyNotificationContext *v11;
  void *v12;
  IMDCustomPluginNotificationContext *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)IMExtensionNotificationManager;
  v2 = -[IMExtensionNotificationManager init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[IMExtensionNotificationManager setNotificationsContext:](v2, "setNotificationsContext:", v3);

    v4 = objc_alloc_init(IMDFamilyInviteNotificationContext);
    -[IMExtensionNotificationManager notificationsContext](v2, "notificationsContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

    v6 = objc_alloc_init(IMDScreenTimeAskNotificationContext);
    -[IMExtensionNotificationManager notificationsContext](v2, "notificationsContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v6);

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isCriticalAlertingEnabled");

    v9 = objc_alloc_init(IMDSafetyMonitorNotificationContext);
    -[IMExtensionNotificationManager notificationsContext](v2, "notificationsContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v9);

    v11 = objc_alloc_init(IMDAskToBuyNotificationContext);
    -[IMExtensionNotificationManager notificationsContext](v2, "notificationsContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v11);

    v13 = objc_alloc_init(IMDCustomPluginNotificationContext);
    -[IMExtensionNotificationManager notificationsContext](v2, "notificationsContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v13);

  }
  return v2;
}

- (void)populateUserInfoForNotificationContent:(id)a3 messageBalloonBundleID:(id)a4 payloadData:(id)a5 chatIdentifier:(id)a6 isUrgentMessageTrigger:(BOOL *)a7 shouldSuppressNotification:(BOOL *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  BOOL *v22;
  BOOL *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v22 = a7;
  v23 = a8;
  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = self->_notificationsContext;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v21, "canPopulateUserInfoForMessageBalloonBundleID:", v13, v22, v23, (_QWORD)v24))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v21, "populateUserInfoForNotificationContent:messageBalloonBundleID:payloadData:chatIdentifier:isUrgentMessageTrigger:shouldSuppressNotification:", v12, v13, v14, v15, v22, v23);
          else
            objc_msgSend(v21, "populateUserInfoForNotificationContent:messageBalloonBundleID:payloadData:", v12, v13, v14);
        }
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v18);
  }

}

- (id)notificationCategories
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_notificationsContext;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "notificationCategories", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)canPopulateUserInfoForMessageBalloonBundleID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_notificationsContext;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "canPopulateUserInfoForMessageBalloonBundleID:", v4, (_QWORD)v11) & 1) != 0)
        {
          LOBYTE(v6) = objc_msgSend(v9, "canPopulateUserInfoForMessageBalloonBundleID:", v4);
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)shouldRetractedMessageForBalloonBundleID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_notificationsContext;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "canPopulateUserInfoForMessageBalloonBundleID:", v4, (_QWORD)v12) & 1) != 0)
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (NSMutableArray)notificationsContext
{
  return self->_notificationsContext;
}

- (void)setNotificationsContext:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsContext, 0);
}

@end
