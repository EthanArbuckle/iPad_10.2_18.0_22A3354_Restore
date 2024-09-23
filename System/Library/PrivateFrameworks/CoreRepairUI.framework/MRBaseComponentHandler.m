@implementation MRBaseComponentHandler

- (MRBaseComponentHandler)init
{
  char *v2;
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  unsigned __int8 has_internal_content;
  double v15;
  NSObject *v16;
  uint64_t v17;
  dispatch_queue_t v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)MRBaseComponentHandler;
  v2 = -[MRBaseComponentHandler init](&v21, sel_init);
  v3 = v2;
  if (v2)
  {
    v2[21] = 0;
    *(_DWORD *)(v2 + 17) = 0;
    v4 = (void *)*((_QWORD *)v2 + 24);
    *((_QWORD *)v2 + 24) = 0;

    *(_QWORD *)(v3 + 28) = 0xF00000005;
    *((_WORD *)v3 + 11) = 1;
    v3[16] = 1;
    v5 = (void *)*((_QWORD *)v3 + 27);
    *((_QWORD *)v3 + 27) = 0;

    v3[24] = 0;
    v6 = (void *)*((_QWORD *)v3 + 20);
    *((_QWORD *)v3 + 20) = 0;

    v7 = (void *)*((_QWORD *)v3 + 29);
    *((_QWORD *)v3 + 29) = 0;

    v8 = (void *)*((_QWORD *)v3 + 31);
    *((_QWORD *)v3 + 31) = 0;

    v9 = (void *)*((_QWORD *)v3 + 30);
    *((_QWORD *)v3 + 30) = 0;

    v10 = (void *)MGCopyAnswer();
    *((_DWORD *)v3 + 9) = objc_msgSend(v10, "intValue");

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleForKey:", CFSTR("timeIntervalOverride"));
    v13 = v12;

    has_internal_content = os_variant_has_internal_content();
    v15 = (double)(uint64_t)*MEMORY[0x24BDAC600];
    if ((has_internal_content & (v13 != 0.0)) != 0)
      v15 = v13;
    *((double *)v3 + 22) = v15;
    sub_22AC82A9C(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *((_QWORD *)v3 + 22);
      *(_DWORD *)buf = 134217984;
      v23 = v17;
      _os_log_impl(&dword_22AC64000, v16, OS_LOG_TYPE_DEFAULT, "the XPC time internal will be %f", buf, 0xCu);
    }

    v18 = dispatch_queue_create("com.apple.mobilerepaird.asyncqueue", MEMORY[0x24BDAC9C0]);
    v19 = (void *)*((_QWORD *)v3 + 1);
    *((_QWORD *)v3 + 1) = v18;

  }
  return (MRBaseComponentHandler *)v3;
}

- (void)createRepairFollowUp
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  char *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  sub_22AC82A9C(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MRBaseComponentHandler componentName](self, "componentName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = v4;
    v10 = 2080;
    v11 = "-[MRBaseComponentHandler createRepairFollowUp]";
    _os_log_impl(&dword_22AC64000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  if (self->displayFollowup)
  {
    +[MRUINotificationHelper sharedSingleton](MRUINotificationHelper, "sharedSingleton");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject createRepairFollowUpWithNotification:actionURL:repairTitle:infoText:itemID:timeInterval:componentName:](v5, "createRepairFollowUpWithNotification:actionURL:repairTitle:infoText:itemID:timeInterval:componentName:", self->displayNotification, self->linkedSensitiveURL, self->popUpNotificationTitle, self->followUpInfoMessage, self->componentFollowupClientID, self->componentName, self->timeIntervalOverride);
  }
  else
  {
    sub_22AC82A9C(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[MRBaseComponentHandler componentName](self, "componentName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] followup skipped"), "-[MRBaseComponentHandler createRepairFollowUp]");
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_22AC64000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
  }

}

- (void)createFinishRepairFollowUpWithNotification:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  sub_22AC82A9C(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MRBaseComponentHandler componentName](self, "componentName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2080;
    v18 = "-[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:]";
    _os_log_impl(&dword_22AC64000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  if (self->displayFollowup)
  {
    +[MRUINotificationHelper sharedSingleton](MRUINotificationHelper, "sharedSingleton");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler finishRepairTitle](self, "finishRepairTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler finishRepairMessage](self, "finishRepairMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject createRepairFollowUpWithNotification:actionURL:repairTitle:infoText:itemID:timeInterval:componentName:](v7, "createRepairFollowUpWithNotification:actionURL:repairTitle:infoText:itemID:timeInterval:componentName:", v3, v10, v11, v12, self->finishRepairKey, self->componentName, 0.0);

  }
  else
  {
    sub_22AC82A9C(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[MRBaseComponentHandler componentName](self, "componentName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] followup skipped"), "-[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:]");
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_22AC64000, v7, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
  }

}

- (void)clearRepairFollowUp
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *finishRepairKey;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  sub_22AC82A9C(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MRBaseComponentHandler componentName](self, "componentName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = v4;
    v12 = 2080;
    v13 = "-[MRBaseComponentHandler clearRepairFollowUp]";
    _os_log_impl(&dword_22AC64000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  +[MRUINotificationHelper sharedSingleton](MRUINotificationHelper, "sharedSingleton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearRepairFollowUpForClientID:", self->componentFollowupClientID);

  if (self->finishRepairKey)
  {
    +[MRUINotificationHelper sharedSingleton](MRUINotificationHelper, "sharedSingleton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearRepairFollowUpForClientID:", self->finishRepairKey);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.Preferences"));
    finishRepairKey = self->finishRepairKey;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &finishRepairKey, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeDeliveredNotificationsWithIdentifiers:", v8);

  }
}

- (BOOL)clearStateFile:(BOOL *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSString *stateFilePath;
  char v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  char *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  sub_22AC82A9C(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MRBaseComponentHandler componentName](self, "componentName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v6;
    v24 = 2080;
    v25 = "-[MRBaseComponentHandler clearStateFile:]";
    _os_log_impl(&dword_22AC64000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", self->stateFilePath);

  if (!v8)
  {
    v12 = 0;
LABEL_10:
    v14 = 1;
    if (!a3)
      goto LABEL_12;
LABEL_11:
    *a3 = v8;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  stateFilePath = self->stateFilePath;
  v21 = 0;
  v11 = objc_msgSend(v9, "removeItemAtPath:error:", stateFilePath, &v21);
  v12 = v21;

  if ((v11 & 1) != 0)
    goto LABEL_10;
  sub_22AC82A9C(1uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    -[MRBaseComponentHandler componentName](self, "componentName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD17C8];
    v18 = self->stateFilePath;
    objc_msgSend(v12, "localizedDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("remove item at path %@ failed: %@"), v18, v19);
    v20 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v16;
    v24 = 2112;
    v25 = v20;
    _os_log_error_impl(&dword_22AC64000, v13, OS_LOG_TYPE_ERROR, "[%@][%@]", buf, 0x16u);

  }
  v14 = 0;
  if (a3)
    goto LABEL_11;
LABEL_12:

  return v14;
}

- (void)clearNSUserDefaults
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  sub_22AC82A9C(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MRBaseComponentHandler componentName](self, "componentName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v4;
    v9 = 2080;
    v10 = "-[MRBaseComponentHandler clearNSUserDefaults]";
    _os_log_impl(&dword_22AC64000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", self->componentUnLockCheckCountKey);
  objc_msgSend(v5, "removeObjectForKey:", self->componentLastCheckTimeKey);
  objc_msgSend(v5, "removeObjectForKey:", self->componentHasDisplayedFollowUpKey);
  objc_msgSend(v5, "removeObjectForKey:", self->componentFirstUIDisplayedTimeKey);
  objc_msgSend(v5, "removeObjectForKey:", self->componentSUCaseKey);
  objc_msgSend(v5, "removeObjectForKey:", self->componentRetriggerCountKey);
  if (self->componentHasNotifiedServerKey)
    objc_msgSend(v5, "removeObjectForKey:");
  objc_msgSend(v5, "removeObjectForKey:", self->finishRepairKey);
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("hasDisplayedFollowupForBluetooth"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("hasDisplayedFollowupForWifi"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("hasDisplayedFollowupForBaseband"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("hasDisplayedFollowupForNFC"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("hasDisplayedFollowupForUWB"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("hasDisplayedFollowupForAudio"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("hasDisplayedFollowupForTrueDepthIR"));
  objc_msgSend(v5, "synchronize");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
  objc_msgSend(v6, "removeObjectForKey:", self->componentFollowupClientID);

  -[MRBaseComponentHandler clearStateFile:](self, "clearStateFile:", 0);
}

- (void)popUpNotificationNowWithMessage
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  char *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  sub_22AC82A9C(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MRBaseComponentHandler componentName](self, "componentName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = v4;
    v12 = 2080;
    v13 = "-[MRBaseComponentHandler popUpNotificationNowWithMessage]";
    _os_log_impl(&dword_22AC64000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  if (!-[MRBaseComponentHandler displayModalPopup](self, "displayModalPopup"))
  {
    sub_22AC82A9C(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[MRBaseComponentHandler componentName](self, "componentName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] SU case skipped popup"), "-[MRBaseComponentHandler popUpNotificationNowWithMessage]");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_22AC64000, v7, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("settingsView"));

  if (!v6 || self->legacyPopup)
  {
    +[MRUINotificationHelper sharedSingleton](MRUINotificationHelper, "sharedSingleton");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject popUpNotificationNowWithMessage:title:openSensitiveURL:componentName:legacyPopup:](v7, "popUpNotificationNowWithMessage:title:openSensitiveURL:componentName:legacyPopup:", self->popUpNotificationMessage, self->popUpNotificationTitle, self->linkedSensitiveURL, self->componentName, self->legacyPopup);
LABEL_9:

  }
}

- (void)scheduleNetworkActivity
{
  NSObject *v3;
  void *v4;
  const char *v5;
  void *v6;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  sub_22AC82A9C(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MRBaseComponentHandler componentName](self, "componentName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = v4;
    v10 = 2080;
    v11 = "-[MRBaseComponentHandler scheduleNetworkActivity]";
    _os_log_impl(&dword_22AC64000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  v5 = -[NSString UTF8String](self->componentNtwkActivityName, "UTF8String");
  v6 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = sub_22AC70358;
  handler[3] = &unk_24F4D4C58;
  handler[4] = self;
  xpc_activity_register(v5, v6, handler);
}

- (void)unlockCheckerActivityBody
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double timeIntervalOverride;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  char v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRBaseComponentHandler componentUnLockCheckCountKey](self, "componentUnLockCheckCountKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "integerForKey:", v4);

  -[MRBaseComponentHandler componentHasNotifiedServerKey](self, "componentHasNotifiedServerKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "BOOLForKey:", v6);

  if ((objc_msgSend(v3, "BOOLForKey:", self->componentDataCollectionPresentedKey) & 1) != 0)
    v8 = 1;
  else
    v8 = !-[MRBaseComponentHandler notifyServer](self, "notifyServer");
  v42 = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10;

  objc_msgSend(v3, "doubleForKey:", self->componentLastCheckTimeKey);
  v13 = (double)(uint64_t)(v11 - v12);
  if (self->timeIntervalOverride <= v13)
    timeIntervalOverride = v13;
  else
    timeIntervalOverride = self->timeIntervalOverride;
  -[MRBaseComponentHandler componentRetriggerCountKey](self, "componentRetriggerCountKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "integerForKey:", v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
  v18 = objc_msgSend(v17, "integerForKey:", self->componentFollowupClientID);

  if (v5 < -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
  {
    ++v5;
    -[MRBaseComponentHandler componentUnLockCheckCountKey](self, "componentUnLockCheckCountKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInteger:forKey:", v5, v19);

    -[MRBaseComponentHandler componentLastCheckTimeKey](self, "componentLastCheckTimeKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDouble:forKey:", v20, v11);

    objc_msgSend(v3, "synchronize");
  }
  sub_22AC82A9C(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[MRBaseComponentHandler componentName](self, "componentName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Set count main body:%ld"), v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v44 = v22;
    v45 = 2112;
    v46 = v23;
    _os_log_impl(&dword_22AC64000, v21, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

  }
  if (!-[MRBaseComponentHandler isSUCaseForComponent](self, "isSUCaseForComponent"))
  {
    if (v5 == -[MRBaseComponentHandler componentFollowupRetriggerdays](self, "componentFollowupRetriggerdays"))
    {
      sub_22AC82A9C(0);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        -[MRBaseComponentHandler componentName](self, "componentName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] handling followup without notification"), "-[MRBaseComponentHandler unlockCheckerActivityBody]");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v44 = v30;
        v45 = 2112;
        v46 = v31;
        _os_log_impl(&dword_22AC64000, v29, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

      }
      -[MRBaseComponentHandler clearRepairFollowUp](self, "clearRepairFollowUp");
      -[MRBaseComponentHandler setDisplayNotification:](self, "setDisplayNotification:", 0);
      -[MRBaseComponentHandler createRepairFollowUp](self, "createRepairFollowUp");
    }
    else
    {
      if (v5 != -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
        goto LABEL_30;
      sub_22AC82A9C(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        -[MRBaseComponentHandler componentName](self, "componentName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] handling clear all followup"), "-[MRBaseComponentHandler unlockCheckerActivityBody]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v44 = v33;
        v45 = 2112;
        v46 = v34;
        _os_log_impl(&dword_22AC64000, v32, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

      }
      -[MRBaseComponentHandler clearRepairFollowUp](self, "clearRepairFollowUp");
      -[MRBaseComponentHandler clearStateFile:](self, "clearStateFile:", 0);
    }
    v28 = v5;
    goto LABEL_29;
  }
  if (v5 >= -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
    v24 = v8;
  else
    v24 = 0;
  if (v24 == 1)
  {
    sub_22AC82A9C(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      -[MRBaseComponentHandler componentName](self, "componentName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] SU handling clear all followup"), "-[MRBaseComponentHandler unlockCheckerActivityBody]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v44 = v26;
      v45 = 2112;
      v46 = v27;
      _os_log_impl(&dword_22AC64000, v25, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
    -[MRBaseComponentHandler clearRepairFollowUp](self, "clearRepairFollowUp");
    -[MRBaseComponentHandler clearStateFile:](self, "clearStateFile:", &v42);
    if (v42)
    {
      v28 = -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays");
LABEL_29:
      -[MRBaseComponentHandler sendAnalyticsForCount:](self, "sendAnalyticsForCount:", v28);
    }
  }
LABEL_30:
  if (v18)
  {
    if (v16 <= -[MRBaseComponentHandler componentFollowupRetriggerdays](self, "componentFollowupRetriggerdays"))
    {
      ++v16;
      -[MRBaseComponentHandler componentRetriggerCountKey](self, "componentRetriggerCountKey");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setInteger:forKey:", v16, v35);

    }
    if (v16 == -[MRBaseComponentHandler componentFollowupRetriggerdays](self, "componentFollowupRetriggerdays")
      && v5 < -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
    {
      sub_22AC82A9C(0);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        -[MRBaseComponentHandler componentName](self, "componentName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] handling followup retrigger"), "-[MRBaseComponentHandler unlockCheckerActivityBody]");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v44 = v37;
        v45 = 2112;
        v46 = v38;
        _os_log_impl(&dword_22AC64000, v36, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

      }
      -[MRBaseComponentHandler clearRepairFollowUp](self, "clearRepairFollowUp");
      -[MRBaseComponentHandler setDisplayNotification:](self, "setDisplayNotification:", 0);
      -[MRBaseComponentHandler createRepairFollowUp](self, "createRepairFollowUp");
    }
  }
  if (((-[MRBaseComponentHandler notifyServer](self, "notifyServer") & v8 ^ 1 | v7) & 1) == 0)
  {
    sub_22AC82A9C(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      -[MRBaseComponentHandler componentName](self, "componentName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] Scheduling network activity"), "-[MRBaseComponentHandler unlockCheckerActivityBody]");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v44 = v40;
      v45 = 2112;
      v46 = v41;
      _os_log_impl(&dword_22AC64000, v39, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
    -[MRBaseComponentHandler scheduleNetworkActivity](self, "scheduleNetworkActivity");
  }
  if (v5 < -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays")
    || (!-[MRBaseComponentHandler notifyServer](self, "notifyServer") | v7) != 1
    || ((!-[MRBaseComponentHandler isSUCaseForComponent](self, "isSUCaseForComponent") | v8) & 1) == 0)
  {
    -[MRBaseComponentHandler scheduleUnlockCheckerActivity:forFinishRepair:](self, "scheduleUnlockCheckerActivity:forFinishRepair:", 0, self->timeIntervalOverride - (double)((uint64_t)timeIntervalOverride % (uint64_t)self->timeIntervalOverride));
  }

}

- (void)unlockCheckerActivityBodyForFinishRepair
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double timeIntervalOverride;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSString *finishRepairKey;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRBaseComponentHandler componentUnLockCheckCountKey](self, "componentUnLockCheckCountKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "integerForKey:", v4);

  -[MRBaseComponentHandler componentRetriggerCountKey](self, "componentRetriggerCountKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "integerForKey:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
  v9 = objc_msgSend(v8, "integerForKey:", CFSTR("clearFinishRepairFollowup"));

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  v12 = v11;

  objc_msgSend(v3, "doubleForKey:", self->componentLastCheckTimeKey);
  v14 = (double)(uint64_t)(v12 - v13);
  if (self->timeIntervalOverride <= v14)
    timeIntervalOverride = v14;
  else
    timeIntervalOverride = self->timeIntervalOverride;
  if (v5 < -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
  {
    ++v5;
    -[MRBaseComponentHandler componentUnLockCheckCountKey](self, "componentUnLockCheckCountKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInteger:forKey:", v5, v16);

    -[MRBaseComponentHandler componentLastCheckTimeKey](self, "componentLastCheckTimeKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDouble:forKey:", v17, v12);

  }
  sub_22AC82A9C(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[MRBaseComponentHandler componentName](self, "componentName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Set count FinishRepair:%ld"), v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v38 = v19;
    v39 = 2112;
    v40 = v20;
    _os_log_impl(&dword_22AC64000, v18, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

  }
  sub_22AC82A9C(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[MRBaseComponentHandler componentName](self, "componentName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Retigger count:%ld"), v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v38 = v22;
    v39 = 2112;
    v40 = v23;
    _os_log_impl(&dword_22AC64000, v21, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

  }
  if (v5 == -[MRBaseComponentHandler componentFollowupRetriggerdays](self, "componentFollowupRetriggerdays"))
  {
    sub_22AC82A9C(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      -[MRBaseComponentHandler componentName](self, "componentName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] handling followup without notification"), "-[MRBaseComponentHandler unlockCheckerActivityBodyForFinishRepair]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v25;
      v39 = 2112;
      v40 = v26;
      _os_log_impl(&dword_22AC64000, v24, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
    if (self->finishRepairKey)
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.Preferences"));
      finishRepairKey = self->finishRepairKey;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &finishRepairKey, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeDeliveredNotificationsWithIdentifiers:", v28);

    }
  }
  else if (v5 >= -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
  {
    sub_22AC82A9C(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      -[MRBaseComponentHandler componentName](self, "componentName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] handling clear all followup"), "-[MRBaseComponentHandler unlockCheckerActivityBodyForFinishRepair]");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v30;
      v39 = 2112;
      v40 = v31;
      _os_log_impl(&dword_22AC64000, v29, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
    -[MRBaseComponentHandler clearRepairFollowUp](self, "clearRepairFollowUp");
    -[MRBaseComponentHandler sendAnalyticsForCount:](self, "sendAnalyticsForCount:", v5);
  }
  if (v9)
  {
    if (v7 <= -[MRBaseComponentHandler componentFollowupRetriggerdays](self, "componentFollowupRetriggerdays"))
    {
      ++v7;
      -[MRBaseComponentHandler componentRetriggerCountKey](self, "componentRetriggerCountKey");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setInteger:forKey:", v7, v32);

    }
    if (v7 == -[MRBaseComponentHandler componentFollowupRetriggerdays](self, "componentFollowupRetriggerdays")
      && v5 < -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
    {
      sub_22AC82A9C(0);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        -[MRBaseComponentHandler componentName](self, "componentName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] handling followup retrigger"), "-[MRBaseComponentHandler unlockCheckerActivityBodyForFinishRepair]");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v38 = v34;
        v39 = 2112;
        v40 = v35;
        _os_log_impl(&dword_22AC64000, v33, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

      }
      -[MRBaseComponentHandler clearRepairFollowUp](self, "clearRepairFollowUp");
      -[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:](self, "createFinishRepairFollowUpWithNotification:", 0);
    }
  }
  if (v5 < -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
    -[MRBaseComponentHandler scheduleUnlockCheckerActivity:forFinishRepair:](self, "scheduleUnlockCheckerActivity:forFinishRepair:", 1, self->timeIntervalOverride - (double)((uint64_t)timeIntervalOverride % (uint64_t)self->timeIntervalOverride));

}

- (id)createCriteriaForUnlockCheckerWithInterval:(double)a3
{
  xpc_object_t v4;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6B8], 0);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC598], 1);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x24BDAC5D8], 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x24BDAC5B8], (uint64_t)a3);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6C0], 1);
  return v4;
}

- (void)scheduleUnlockCheckerActivity:(double)a3 forFinishRepair:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  void *v8;
  id v9;
  const char *v10;
  void *v11;
  void (*v12)(uint64_t, void *);
  double *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  sub_22AC82A9C(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[MRBaseComponentHandler componentName](self, "componentName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v8;
    v18 = 2080;
    v19 = "-[MRBaseComponentHandler scheduleUnlockCheckerActivity:forFinishRepair:]";
    _os_log_impl(&dword_22AC64000, v7, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  if (-[MRBaseComponentHandler unlockCheckActivityRequired](self, "unlockCheckActivityRequired"))
  {
    -[MRBaseComponentHandler componentUnlockCheckerActivityName](self, "componentUnlockCheckerActivityName");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    v11 = (void *)*MEMORY[0x24BDAC5A0];
    if (v4)
    {
      v15 = MEMORY[0x24BDAC760];
      v12 = sub_22AC716F8;
      v13 = (double *)&v15;
    }
    else
    {
      v14 = MEMORY[0x24BDAC760];
      v12 = sub_22AC71760;
      v13 = (double *)&v14;
    }
    *((_QWORD *)v13 + 1) = 3221225472;
    *((_QWORD *)v13 + 2) = v12;
    *((_QWORD *)v13 + 3) = &unk_24F4D4AC8;
    *((_QWORD *)v13 + 4) = self;
    v13[5] = a3;
    xpc_activity_register(v10, v11, v13);

  }
}

- (void)mainNonAuthRepairFlow
{
  MRBaseComponentHandler *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  id v6;
  char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  char *v27;
  double v28;
  double v29;
  NSObject *v30;
  id v31;
  char *v32;
  NSObject *v33;
  id v34;
  char *v35;
  NSString *lastKnownComponentIdentifierValue;
  NSObject *v37;
  id v38;
  char *v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  sub_22AC82A9C(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MRBaseComponentHandler componentName](v2, "componentName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v41 = v4;
    v42 = 2080;
    v43 = "-[MRBaseComponentHandler mainNonAuthRepairFlow]";
    _os_log_impl(&dword_22AC64000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  sub_22AC82A9C(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MRBaseComponentHandler componentName](v2, "componentName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] component non authentic"), "-[MRBaseComponentHandler mainNonAuthRepairFlow]");
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v41 = v6;
    v42 = 2112;
    v43 = v7;
    _os_log_impl(&dword_22AC64000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRBaseComponentHandler componentUnLockCheckCountKey](v2, "componentUnLockCheckCountKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "integerForKey:", v9);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringForKey:", v2->lastKnownComponentIdentifierKey);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v13, "BOOLForKey:", CFSTR("ForceDisableUIFlowForInternalBuild"));

  if ((os_variant_has_internal_content() & v11 & 1) != 0 || v2->disableUIForComponent)
  {
    -[MRBaseComponentHandler clearRepairFollowUp](v2, "clearRepairFollowUp");
    -[MRBaseComponentHandler clearNSUserDefaults](v2, "clearNSUserDefaults");
  }
  else
  {
    if (v10 >= -[MRBaseComponentHandler componentfollowUpDisplaydays](v2, "componentfollowUpDisplaydays")
      && v12
      && v2->lastKnownComponentIdentifierValue
      && (objc_msgSend(v12, "isEqualToString:") & 1) == 0)
    {
      v2->displayNotification = 1;
      *(_WORD *)&v2->displayModalPopup = 1;
      -[MRBaseComponentHandler clearNSUserDefaults](v2, "clearNSUserDefaults");
    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLForKey:", v2->componentHasDisplayedFollowUpKey);
    v16 = objc_msgSend(v14, "BOOLForKey:", v2->componentHasNotifiedServerKey);
    v17 = objc_msgSend(v14, "BOOLForKey:", v2->componentDataCollectionPresentedKey);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSince1970");
    v20 = v19;

    -[MRBaseComponentHandler componentRetriggerCountKey](v2, "componentRetriggerCountKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v14, "integerForKey:", v21);

    if ((v15 & 1) != 0)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
      v24 = objc_msgSend(v23, "integerForKey:", v2->componentFollowupClientID);

      if (v24
        && (!v22
         || v22 >= -[MRBaseComponentHandler componentFollowupRetriggerdays](v2, "componentFollowupRetriggerdays")
         && v24 == 2))
      {
        -[MRBaseComponentHandler clearRepairFollowUp](v2, "clearRepairFollowUp");
      }
      sub_22AC82A9C(0);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        -[MRBaseComponentHandler componentName](v2, "componentName");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] handling xpc/reboot case"), "-[MRBaseComponentHandler mainNonAuthRepairFlow]");
        v27 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = v26;
        v42 = 2112;
        v43 = v27;
        _os_log_impl(&dword_22AC64000, v25, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

      }
      objc_msgSend(v14, "doubleForKey:", v2->componentLastCheckTimeKey);
      v29 = (double)(uint64_t)(v20 - v28);
      if (v2->timeIntervalOverride <= v29)
      {
        -[MRBaseComponentHandler unlockCheckerActivityBody](v2, "unlockCheckerActivityBody");
      }
      else
      {
        sub_22AC82A9C(0);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          -[MRBaseComponentHandler componentName](v2, "componentName");
          v31 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] scheduling unlock checker activity Interval:%f "), "-[MRBaseComponentHandler mainNonAuthRepairFlow]", v2->timeIntervalOverride - v29);
          v32 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v41 = v31;
          v42 = 2112;
          v43 = v32;
          _os_log_impl(&dword_22AC64000, v30, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

        }
        -[MRBaseComponentHandler scheduleUnlockCheckerActivity:forFinishRepair:](v2, "scheduleUnlockCheckerActivity:forFinishRepair:", 0, v2->timeIntervalOverride - v29);
      }
      if (((-[MRBaseComponentHandler notifyServer](v2, "notifyServer") & v17 ^ 1 | v16) & 1) == 0)
        -[MRBaseComponentHandler scheduleNetworkActivity](v2, "scheduleNetworkActivity");
    }
    else
    {
      sub_22AC82A9C(0);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        -[MRBaseComponentHandler componentName](v2, "componentName");
        v34 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] starting Followup and notification"), "-[MRBaseComponentHandler mainNonAuthRepairFlow]");
        v35 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = v34;
        v42 = 2112;
        v43 = v35;
        _os_log_impl(&dword_22AC64000, v33, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

      }
      -[MRBaseComponentHandler clearNSUserDefaults](v2, "clearNSUserDefaults");
      -[MRBaseComponentHandler clearRepairFollowUp](v2, "clearRepairFollowUp");
      -[MRBaseComponentHandler createRepairFollowUp](v2, "createRepairFollowUp");
      -[MRBaseComponentHandler popUpNotificationNowWithMessage](v2, "popUpNotificationNowWithMessage");
      objc_msgSend(v14, "setBool:forKey:", 1, v2->componentHasDisplayedFollowUpKey);
      objc_msgSend(v14, "setInteger:forKey:", (uint64_t)v20, v2->componentFirstUIDisplayedTimeKey);
      lastKnownComponentIdentifierValue = v2->lastKnownComponentIdentifierValue;
      if (lastKnownComponentIdentifierValue)
        objc_msgSend(v14, "setObject:forKey:", lastKnownComponentIdentifierValue, v2->lastKnownComponentIdentifierKey);
      objc_msgSend(v14, "synchronize");
      -[MRBaseComponentHandler sendAnalyticsForCount:](v2, "sendAnalyticsForCount:", 0);
      if (((-[MRBaseComponentHandler notifyServer](v2, "notifyServer") & v17 ^ 1 | v16) & 1) == 0)
      {
        sub_22AC82A9C(0);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          -[MRBaseComponentHandler componentName](v2, "componentName");
          v38 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] Scheduling network activity"), "-[MRBaseComponentHandler mainNonAuthRepairFlow]");
          v39 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v41 = v38;
          v42 = 2112;
          v43 = v39;
          _os_log_impl(&dword_22AC64000, v37, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

        }
        -[MRBaseComponentHandler scheduleNetworkActivity](v2, "scheduleNetworkActivity");
      }
      -[MRBaseComponentHandler scheduleUnlockCheckerActivity:forFinishRepair:](v2, "scheduleUnlockCheckerActivity:forFinishRepair:", 0, v2->timeIntervalOverride);
    }

  }
  objc_sync_exit(v2);

}

- (void)checkInAndHandleAuthStatus
{
  MRBaseComponentHandler *v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  NSString *lastKnownComponentIdentifierValue;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *asyncQueue;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  NSObject *v28;
  id v29;
  void *v30;
  _QWORD block[5];
  id v32;
  id location;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_msgSend(v2->componentAuthHandler, "copyComponentStatus");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", v2->finishRepairKey);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  -[MRBaseComponentHandler componentRetriggerCountKey](v2, "componentRetriggerCountKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "integerForKey:", v9);

  v11 = objc_msgSend(v4, "BOOLForKey:", v2->componentHasDisplayedFollowUpKey);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringForKey:", v2->lastKnownComponentIdentifierKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == 1)
  {
    -[MRBaseComponentHandler clearRepairFollowUp](v2, "clearRepairFollowUp");
    -[MRBaseComponentHandler sendAnalyticsForCount:](v2, "sendAnalyticsForCount:", 0x7FFFFFFFFFFFFFFFLL);
    -[MRBaseComponentHandler clearNSUserDefaults](v2, "clearNSUserDefaults");
  }
  else if (v3)
  {
    if (v3 == -3)
    {
      lastKnownComponentIdentifierValue = v2->lastKnownComponentIdentifierValue;
      if (lastKnownComponentIdentifierValue)
        objc_msgSend(v4, "setObject:forKey:", lastKnownComponentIdentifierValue, v2->lastKnownComponentIdentifierKey);
      if (v11)
      {
        -[MRBaseComponentHandler clearRepairFollowUp](v2, "clearRepairFollowUp");
        -[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:](v2, "createFinishRepairFollowUpWithNotification:", objc_msgSend(v13, "isEqualToString:", v2->lastKnownComponentIdentifierValue) ^ 1);
        objc_msgSend(v4, "setBool:forKey:", 1, v2->finishRepairKey);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
        objc_msgSend(v15, "removeObjectForKey:", CFSTR("clearFinishRepairFollowup"));
LABEL_28:

        goto LABEL_29;
      }
      if (!v5 || (objc_msgSend(v13, "isEqualToString:", v2->lastKnownComponentIdentifierValue) & 1) == 0)
      {
        -[MRBaseComponentHandler clearRepairFollowUp](v2, "clearRepairFollowUp");
        -[MRBaseComponentHandler clearNSUserDefaults](v2, "clearNSUserDefaults");
        -[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:](v2, "createFinishRepairFollowUpWithNotification:", 1);
        objc_msgSend(v4, "setBool:forKey:", 1, v2->finishRepairKey);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
        objc_msgSend(v15, "removeObjectForKey:", CFSTR("clearFinishRepairFollowup"));
        goto LABEL_28;
      }
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
      v22 = objc_msgSend(v21, "integerForKey:", CFSTR("clearFinishRepairFollowup"));

      if (v22
        && (!v10
         || v10 >= -[MRBaseComponentHandler componentFollowupRetriggerdays](v2, "componentFollowupRetriggerdays")
         && v22 == 2))
      {
        +[MRUINotificationHelper sharedSingleton](MRUINotificationHelper, "sharedSingleton");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "clearRepairFollowUpForClientID:", v2->finishRepairKey);

        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.Preferences"));
        v38[0] = v2->finishRepairKey;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeDeliveredNotificationsWithIdentifiers:", v25);

      }
      objc_msgSend(v4, "doubleForKey:", v2->componentLastCheckTimeKey);
      v27 = (double)(uint64_t)(v8 - v26);
      if (v2->timeIntervalOverride <= v27)
      {
        -[MRBaseComponentHandler unlockCheckerActivityBodyForFinishRepair](v2, "unlockCheckerActivityBodyForFinishRepair");
      }
      else
      {
        sub_22AC82A9C(0);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          -[MRBaseComponentHandler componentName](v2, "componentName");
          v29 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] scheduling finish repair unlock checker activity Interval:%f "), "-[MRBaseComponentHandler checkInAndHandleAuthStatus]", v2->timeIntervalOverride - v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v35 = v29;
          v36 = 2112;
          v37 = v30;
          _os_log_impl(&dword_22AC64000, v28, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

        }
        -[MRBaseComponentHandler scheduleUnlockCheckerActivity:forFinishRepair:](v2, "scheduleUnlockCheckerActivity:forFinishRepair:", 1, v2->timeIntervalOverride - v27);
      }
    }
    else if (v3 < 0)
    {
      sub_22AC82A9C(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        -[MRBaseComponentHandler componentName](v2, "componentName");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] IOREG Component Non authentic"), "-[MRBaseComponentHandler checkInAndHandleAuthStatus]");
        objc_claimAutoreleasedReturnValue();
        sub_22AC85938();
      }

      -[MRBaseComponentHandler mainNonAuthRepairFlow](v2, "mainNonAuthRepairFlow");
    }
  }
  else
  {
    sub_22AC82A9C(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[MRBaseComponentHandler componentName](v2, "componentName");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] IOREG Auth Component Not Populated"), "-[MRBaseComponentHandler checkInAndHandleAuthStatus]");
      objc_claimAutoreleasedReturnValue();
      sub_22AC85938();
    }

    objc_initWeak(&location, v2);
    asyncQueue = v2->asyncQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_22AC72514;
    block[3] = &unk_24F4D4C80;
    objc_copyWeak(&v32, &location);
    block[4] = v2;
    dispatch_async(asyncQueue, block);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
LABEL_29:

  objc_sync_exit(v2);
}

- (void)sendAnalyticsForCount:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");

  v7 = objc_msgSend(v5, "integerForKey:", self->componentFirstUIDisplayedTimeKey);
  if (!a3)
  {
    v9 = CFSTR("FirstUIDisplayed");
    goto LABEL_10;
  }
  v8 = v7;
  if (-[MRBaseComponentHandler componentFollowupRetriggerdays](self, "componentFollowupRetriggerdays") == a3)
  {
    v9 = CFSTR("lockscreenCleared");
LABEL_10:
    v13 = v9;
    AnalyticsSendEventLazy();
    v10 = v13;
    goto LABEL_11;
  }
  if (-[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays") == a3)
  {
    v9 = CFSTR("coreFollowUpCleared");
    goto LABEL_10;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8)
    {
      v9 = CFSTR("repairEvent");
      goto LABEL_10;
    }
    sub_22AC82A9C(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[MRBaseComponentHandler componentName](self, "componentName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] auth never fail before, bogus repair event"), "-[MRBaseComponentHandler sendAnalyticsForCount:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_22AC64000, v10, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
  }
  else
  {
    sub_22AC82A9C(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_22AC85984(self, a3);
  }
LABEL_11:

}

+ (void)handleComponentSUCase:(id)a3 lastAUthCheckBuildVersion:(id)a4 followUpItemID:(id)a5 queryString:(id)a6 suCasekey:(id)a7 startBuildVersion:(id)a8 componentAuth:(id)a9
{
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  uint8_t buf[4];
  NSObject *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = DMGetUserDataDisposition();
  sub_22AC82A9C(0);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if ((v19 & 2) != 0)
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AC64000, v20, OS_LOG_TYPE_DEFAULT, "Update install case", buf, 2u);
    }

    DMGetPreviousBuildVersion();
    v20 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)DMCopyCurrentBuildVersion();
    sub_22AC82A9C(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v41 = v20;
      v42 = 2112;
      v43 = v39;
      _os_log_impl(&dword_22AC64000, v22, OS_LOG_TYPE_DEFAULT, "Old version is %@:%@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLForKey:", v13);
    objc_msgSend(v23, "stringForKey:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v24)
    {
      sub_22AC82A9C(0);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v15;
        _os_log_impl(&dword_22AC64000, v27, OS_LOG_TYPE_DEFAULT, "[%@] User already seeing UI", buf, 0xCu);
      }

    }
    else if (!v25 || (objc_msgSend(v25, "isEqualToString:", v39) & 1) == 0)
    {
      sub_22AC82A9C(0);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v15;
        _os_log_impl(&dword_22AC64000, v28, OS_LOG_TYPE_DEFAULT, "[%@] first auth case", buf, 0xCu);
      }

      v29 = objc_msgSend(v18, "synchronouslycopyAuthStatus");
      if (v29 == 1)
      {
        sub_22AC82A9C(0);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v15;
          _os_log_impl(&dword_22AC64000, v30, OS_LOG_TYPE_DEFAULT, "[%@] is Trusted", buf, 0xCu);
        }

        objc_msgSend(v23, "setObject:forKey:", v39, v14);
        objc_msgSend(v23, "synchronize");
      }
      else
      {
        v31 = v29;
        v38 = v16;
        sub_22AC82A9C(0);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        if (v31 < 0)
        {
          if (v33)
          {
            *(_DWORD *)buf = 138412290;
            v41 = v15;
            _os_log_impl(&dword_22AC64000, v32, OS_LOG_TYPE_DEFAULT, "[%@] is not Trusted", buf, 0xCu);
          }

          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0850]), "initWithString:", v17);
          v16 = v38;
          v37 = v34;
          if (v20 && objc_msgSend(v34, "compareBuildVersionString:withPrecision:", v20, 2) == 1)
          {
            sub_22AC82A9C(0);
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v15;
              _os_log_impl(&dword_22AC64000, v35, OS_LOG_TYPE_DEFAULT, "SU case for %@", buf, 0xCu);
            }

            objc_msgSend(v23, "setBool:forKey:", 1, v38);
          }
          else
          {
            sub_22AC82A9C(0);
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v20;
              _os_log_impl(&dword_22AC64000, v36, OS_LOG_TYPE_DEFAULT, "ignoring setting the SU case: previousBuild:%@", buf, 0xCu);
            }

          }
          objc_msgSend(v23, "setObject:forKey:", v39, v14);
          objc_msgSend(v23, "synchronize");

        }
        else
        {
          if (v33)
          {
            *(_DWORD *)buf = 138412290;
            v41 = v15;
            _os_log_impl(&dword_22AC64000, v32, OS_LOG_TYPE_DEFAULT, "[%@] Auth timeout", buf, 0xCu);
          }

          v16 = v38;
        }
      }
    }

  }
  else if (v21)
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = v19;
    _os_log_impl(&dword_22AC64000, v20, OS_LOG_TYPE_DEFAULT, "Skipping SU update check:%d", buf, 8u);
  }

}

+ (id)getHwRevision
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  void *CFProperty;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    v5 = MatchingService;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("config-number"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", CFProperty, 4);
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("/-"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
        IOObjectRelease(v5);
        goto LABEL_13;
      }
    }
    else
    {
      sub_22AC82A9C(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_22AC85A6C(v21, v22, v23, v24, v25, v26, v27, v28);

      v7 = 0;
      v9 = 0;
    }
    v12 = 0;
    goto LABEL_12;
  }
  sub_22AC82A9C(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_22AC85A38(v13, v14, v15, v16, v17, v18, v19, v20);

  CFProperty = 0;
  v12 = 0;
  v9 = 0;
  v7 = 0;
LABEL_13:

  return v12;
}

- (NSString)popUpNotificationMessage
{
  return self->popUpNotificationMessage;
}

- (void)setPopUpNotificationMessage:(id)a3
{
  objc_storeStrong((id *)&self->popUpNotificationMessage, a3);
}

- (NSString)popUpNotificationTitle
{
  return self->popUpNotificationTitle;
}

- (void)setPopUpNotificationTitle:(id)a3
{
  objc_storeStrong((id *)&self->popUpNotificationTitle, a3);
}

- (NSString)followUpInfoMessage
{
  return self->followUpInfoMessage;
}

- (void)setFollowUpInfoMessage:(id)a3
{
  objc_storeStrong((id *)&self->followUpInfoMessage, a3);
}

- (BOOL)unlockCheckActivityRequired
{
  return self->unlockCheckActivityRequired;
}

- (void)setUnlockCheckActivityRequired:(BOOL)a3
{
  self->unlockCheckActivityRequired = a3;
}

- (NSURL)linkedSensitiveURL
{
  return self->linkedSensitiveURL;
}

- (void)setLinkedSensitiveURL:(id)a3
{
  objc_storeStrong((id *)&self->linkedSensitiveURL, a3);
}

- (NSString)componentFollowupClientID
{
  return self->componentFollowupClientID;
}

- (void)setComponentFollowupClientID:(id)a3
{
  objc_storeStrong((id *)&self->componentFollowupClientID, a3);
}

- (NSString)componentUnLockCheckCountKey
{
  return self->componentUnLockCheckCountKey;
}

- (void)setComponentUnLockCheckCountKey:(id)a3
{
  objc_storeStrong((id *)&self->componentUnLockCheckCountKey, a3);
}

- (NSString)componentSUCaseKey
{
  return self->componentSUCaseKey;
}

- (void)setComponentSUCaseKey:(id)a3
{
  objc_storeStrong((id *)&self->componentSUCaseKey, a3);
}

- (BOOL)displayNotification
{
  return self->displayNotification;
}

- (void)setDisplayNotification:(BOOL)a3
{
  self->displayNotification = a3;
}

- (BOOL)notifyServer
{
  return self->notifyServer;
}

- (void)setNotifyServer:(BOOL)a3
{
  self->notifyServer = a3;
}

- (BOOL)displayModalPopup
{
  return self->displayModalPopup;
}

- (void)setDisplayModalPopup:(BOOL)a3
{
  self->displayModalPopup = a3;
}

- (BOOL)isSUCaseForComponent
{
  return self->isSUCaseForComponent;
}

- (void)setIsSUCaseForComponent:(BOOL)a3
{
  self->isSUCaseForComponent = a3;
}

- (BOOL)disableUIForComponent
{
  return self->disableUIForComponent;
}

- (void)setDisableUIForComponent:(BOOL)a3
{
  self->disableUIForComponent = a3;
}

- (NSString)componentLastCheckTimeKey
{
  return self->componentLastCheckTimeKey;
}

- (void)setComponentLastCheckTimeKey:(id)a3
{
  objc_storeStrong((id *)&self->componentLastCheckTimeKey, a3);
}

- (NSString)componentHasNotifiedServerKey
{
  return self->componentHasNotifiedServerKey;
}

- (void)setComponentHasNotifiedServerKey:(id)a3
{
  objc_storeStrong((id *)&self->componentHasNotifiedServerKey, a3);
}

- (NSString)componentHasDisplayedFollowUpKey
{
  return self->componentHasDisplayedFollowUpKey;
}

- (void)setComponentHasDisplayedFollowUpKey:(id)a3
{
  objc_storeStrong((id *)&self->componentHasDisplayedFollowUpKey, a3);
}

- (NSString)componentDataCollectionPresentedKey
{
  return self->componentDataCollectionPresentedKey;
}

- (void)setComponentDataCollectionPresentedKey:(id)a3
{
  objc_storeStrong((id *)&self->componentDataCollectionPresentedKey, a3);
}

- (NSString)componentFirstUIDisplayedTimeKey
{
  return self->componentFirstUIDisplayedTimeKey;
}

- (void)setComponentFirstUIDisplayedTimeKey:(id)a3
{
  objc_storeStrong((id *)&self->componentFirstUIDisplayedTimeKey, a3);
}

- (NSString)lastKnownComponentIdentifierKey
{
  return self->lastKnownComponentIdentifierKey;
}

- (void)setLastKnownComponentIdentifierKey:(id)a3
{
  objc_storeStrong((id *)&self->lastKnownComponentIdentifierKey, a3);
}

- (NSString)lastKnownComponentIdentifierValue
{
  return self->lastKnownComponentIdentifierValue;
}

- (void)setLastKnownComponentIdentifierValue:(id)a3
{
  objc_storeStrong((id *)&self->lastKnownComponentIdentifierValue, a3);
}

- (NSString)componentUnlockCheckerActivityName
{
  return self->componentUnlockCheckerActivityName;
}

- (void)setComponentUnlockCheckerActivityName:(id)a3
{
  objc_storeStrong((id *)&self->componentUnlockCheckerActivityName, a3);
}

- (int)componentFollowupRetriggerdays
{
  return self->componentFollowupRetriggerdays;
}

- (void)setComponentFollowupRetriggerdays:(int)a3
{
  self->componentFollowupRetriggerdays = a3;
}

- (int)componentfollowUpDisplaydays
{
  return self->componentfollowUpDisplaydays;
}

- (void)setComponentfollowUpDisplaydays:(int)a3
{
  self->componentfollowUpDisplaydays = a3;
}

- (NSString)componentForceKey
{
  return self->componentForceKey;
}

- (void)setComponentForceKey:(id)a3
{
  objc_storeStrong((id *)&self->componentForceKey, a3);
}

- (NSString)componentEnableNonAuthUIKey
{
  return self->componentEnableNonAuthUIKey;
}

- (void)setComponentEnableNonAuthUIKey:(id)a3
{
  objc_storeStrong((id *)&self->componentEnableNonAuthUIKey, a3);
}

- (double)timeIntervalOverride
{
  return self->timeIntervalOverride;
}

- (void)setTimeIntervalOverride:(double)a3
{
  self->timeIntervalOverride = a3;
}

- (NSString)componentNtwkActivityName
{
  return self->componentNtwkActivityName;
}

- (void)setComponentNtwkActivityName:(id)a3
{
  objc_storeStrong((id *)&self->componentNtwkActivityName, a3);
}

- (id)componentAuthHandler
{
  return self->componentAuthHandler;
}

- (void)setComponentAuthHandler:(id)a3
{
  objc_storeStrong(&self->componentAuthHandler, a3);
}

- (int64_t)componentId
{
  return self->componentId;
}

- (void)setComponentId:(int64_t)a3
{
  self->componentId = a3;
}

- (NSString)componentName
{
  return self->componentName;
}

- (void)setComponentName:(id)a3
{
  objc_storeStrong((id *)&self->componentName, a3);
}

- (BOOL)displayFollowup
{
  return self->displayFollowup;
}

- (void)setDisplayFollowup:(BOOL)a3
{
  self->displayFollowup = a3;
}

- (BOOL)legacyPopup
{
  return self->legacyPopup;
}

- (void)setLegacyPopup:(BOOL)a3
{
  self->legacyPopup = a3;
}

- (NSString)stateFilePath
{
  return self->stateFilePath;
}

- (void)setStateFilePath:(id)a3
{
  objc_storeStrong((id *)&self->stateFilePath, a3);
}

- (int)deviceClass
{
  return self->deviceClass;
}

- (void)setDeviceClass:(int)a3
{
  self->deviceClass = a3;
}

- (BOOL)supportsRepair
{
  return self->supportsRepair;
}

- (void)setSupportsRepair:(BOOL)a3
{
  self->supportsRepair = a3;
}

- (NSString)componentRetriggerCountKey
{
  return self->componentRetriggerCountKey;
}

- (void)setComponentRetriggerCountKey:(id)a3
{
  objc_storeStrong((id *)&self->componentRetriggerCountKey, a3);
}

- (NSString)finishRepairKey
{
  return self->finishRepairKey;
}

- (void)setFinishRepairKey:(id)a3
{
  objc_storeStrong((id *)&self->finishRepairKey, a3);
}

- (NSString)finishRepairMessage
{
  return self->finishRepairMessage;
}

- (void)setFinishRepairMessage:(id)a3
{
  objc_storeStrong((id *)&self->finishRepairMessage, a3);
}

- (NSString)finishRepairTitle
{
  return self->finishRepairTitle;
}

- (void)setFinishRepairTitle:(id)a3
{
  objc_storeStrong((id *)&self->finishRepairTitle, a3);
}

- (NSString)componentStatusKey
{
  return self->_componentStatusKey;
}

- (void)setComponentStatusKey:(id)a3
{
  objc_storeStrong((id *)&self->_componentStatusKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentStatusKey, 0);
  objc_storeStrong((id *)&self->finishRepairTitle, 0);
  objc_storeStrong((id *)&self->finishRepairMessage, 0);
  objc_storeStrong((id *)&self->finishRepairKey, 0);
  objc_storeStrong((id *)&self->componentRetriggerCountKey, 0);
  objc_storeStrong((id *)&self->stateFilePath, 0);
  objc_storeStrong((id *)&self->componentName, 0);
  objc_storeStrong(&self->componentAuthHandler, 0);
  objc_storeStrong((id *)&self->componentNtwkActivityName, 0);
  objc_storeStrong((id *)&self->componentEnableNonAuthUIKey, 0);
  objc_storeStrong((id *)&self->componentForceKey, 0);
  objc_storeStrong((id *)&self->componentUnlockCheckerActivityName, 0);
  objc_storeStrong((id *)&self->lastKnownComponentIdentifierValue, 0);
  objc_storeStrong((id *)&self->lastKnownComponentIdentifierKey, 0);
  objc_storeStrong((id *)&self->componentFirstUIDisplayedTimeKey, 0);
  objc_storeStrong((id *)&self->componentDataCollectionPresentedKey, 0);
  objc_storeStrong((id *)&self->componentHasDisplayedFollowUpKey, 0);
  objc_storeStrong((id *)&self->componentHasNotifiedServerKey, 0);
  objc_storeStrong((id *)&self->componentLastCheckTimeKey, 0);
  objc_storeStrong((id *)&self->componentSUCaseKey, 0);
  objc_storeStrong((id *)&self->componentUnLockCheckCountKey, 0);
  objc_storeStrong((id *)&self->componentFollowupClientID, 0);
  objc_storeStrong((id *)&self->linkedSensitiveURL, 0);
  objc_storeStrong((id *)&self->followUpInfoMessage, 0);
  objc_storeStrong((id *)&self->popUpNotificationTitle, 0);
  objc_storeStrong((id *)&self->popUpNotificationMessage, 0);
  objc_storeStrong((id *)&self->asyncQueue, 0);
}

@end
