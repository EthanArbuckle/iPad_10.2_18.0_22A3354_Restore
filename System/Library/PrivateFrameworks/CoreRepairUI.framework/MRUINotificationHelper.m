@implementation MRUINotificationHelper

- (MRUINotificationHelper)init
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sharedSingleton);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Use +[%@ %@] instead of -%@."), v7, v8, v9);

  return 0;
}

- (id)_init
{
  MRUINotificationHelper *v2;
  MRUINotificationHelper *v3;
  dispatch_queue_t v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *clientIDtoFollowupItemCache;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRUINotificationHelper;
  v2 = -[MRUINotificationHelper init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->delay = 0;
    v4 = dispatch_queue_create("com.apple.mobilerepaird.notificationq", 0);
    v5 = (void *)qword_255B498E0;
    qword_255B498E0 = (uint64_t)v4;

    v6 = objc_opt_new();
    clientIDtoFollowupItemCache = v3->clientIDtoFollowupItemCache;
    v3->clientIDtoFollowupItemCache = (NSMutableDictionary *)v6;

  }
  return v3;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC7B28C;
  block[3] = &unk_24F4D4948;
  block[4] = a1;
  if (qword_255B498F0 != -1)
    dispatch_once(&qword_255B498F0, block);
  return (id)qword_255B498E8;
}

- (void)createRepairFollowUpWithNotification:(BOOL)a3 actionURL:(id)a4 repairTitle:(id)a5 infoText:(id)a6 itemID:(id)a7 timeInterval:(double)a8 componentName:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  MRUINotificationHelper *v32;
  BOOL v33;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v20 = qword_255B498E0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC7B3DC;
  block[3] = &unk_24F4D4CF0;
  v33 = a3;
  v27 = v15;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v31 = v19;
  v32 = self;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  dispatch_sync(v20, block);

}

- (void)popUpNotificationNowWithMessage:(id)a3 title:(id)a4 openSensitiveURL:(id)a5 componentName:(id)a6 legacyPopup:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  MRUINotificationHelper *v16;
  void *v17;
  int v18;
  NSObject *v19;
  char v20;
  void *v21;
  NSObject *v22;
  int delay;
  dispatch_semaphore_t v24;
  dispatch_time_t v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD block[4];
  dispatch_semaphore_t v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v7 = a7;
  v38 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = self;
  objc_sync_enter(v16);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLForKey:", CFSTR("settingsView"));

  sub_22AC82A9C(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v35) = v18;
    _os_log_impl(&dword_22AC64000, v19, OS_LOG_TYPE_DEFAULT, " value is:%d", buf, 8u);
  }

  if (!v18 || v7)
  {
    v20 = BYSetupAssistantNeedsToRun();
    while ((v20 & 1) != 0)
    {
      v21 = (void *)MEMORY[0x22E2E57B0]();
      v20 = BYSetupAssistantNeedsToRun();
      objc_autoreleasePoolPop(v21);
      sleep(3u);
    }
    sub_22AC82A9C(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      delay = v16->delay;
      *(_DWORD *)buf = 138412546;
      v35 = v13;
      v36 = 1024;
      v37 = delay;
      _os_log_impl(&dword_22AC64000, v22, OS_LOG_TYPE_DEFAULT, "Displaying %@ notification after %d delay", buf, 0x12u);
    }

    v24 = dispatch_semaphore_create(0);
    v25 = dispatch_time(0, 1000000000 * v16->delay);
    v26 = qword_255B498E0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_22AC7BB00;
    block[3] = &unk_24F4D4D18;
    v33 = v7;
    v29 = v24;
    v30 = v13;
    v31 = v12;
    v32 = v14;
    v27 = v24;
    dispatch_after(v25, v26, block);
    dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
    v16->delay += 5;

  }
  objc_sync_exit(v16);

}

- (void)clearRepairFollowUpForClientID:(id)a3
{
  NSMutableDictionary *clientIDtoFollowupItemCache;
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;

  clientIDtoFollowupItemCache = self->clientIDtoFollowupItemCache;
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](clientIDtoFollowupItemCache, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v15 = 0;
    v6 = objc_msgSend(0, "clearNotificationForItem:error:", v5, &v15);
    v7 = v15;
    if ((v6 & 1) == 0)
    {
      sub_22AC82A9C(1uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_22AC85D14(v7);

    }
  }
  else
  {
    v7 = 0;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", CFSTR("com.apple.mobilerepair"));
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v7;
  v11 = objc_msgSend(v9, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v10, &v14);
  v12 = v14;

  if ((v11 & 1) == 0)
  {
    sub_22AC82A9C(1uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_22AC85C98(v12);

  }
}

- (void)updateFollowupsToNewLocale
{
  dispatch_sync((dispatch_queue_t)qword_255B498E0, &unk_24F4D4D38);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->clientIDtoFollowupItemCache, 0);
}

@end
