@implementation INAccountNotificationPlugin

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id *v16;
  id v17;
  BOOL v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  int v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  double v26;
  double v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _QWORD v33[4];
  void *v34;
  _QWORD v35[4];
  void *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  switch(a4)
  {
    case 1:
      _INLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v10;
        _os_log_impl(&dword_230F2C000, v19, OS_LOG_TYPE_DEFAULT, "iCloud account %@ will be added! Will notify ind...", buf, 0xCu);
      }

      -[INAccountNotificationPlugin notifyCloudSubscriptionFeatures](self, "notifyCloudSubscriptionFeatures");
      v18 = 0;
      v20 = 1;
      break;
    case 2:
      objc_msgSend(v10, "dirtyProperties");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "containsObject:", *MEMORY[0x24BDB42D0]);

      _INLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = CFSTR("NO");
        if (v22)
          v24 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v38 = v10;
        v39 = 2112;
        v40 = v24;
        _os_log_impl(&dword_230F2C000, v23, OS_LOG_TYPE_DEFAULT, "iCloud account %@ will be modifed! enabled dataclasses changed %@", buf, 0x16u);
      }

      objc_msgSend(v10, "accountPropertyForKey:", CFSTR("iCloudNotificationLastRegisterDate"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "timeIntervalSinceDate:", v15);
        v27 = v26;

        v28 = v27 > 86400.0 ? 1 : v22;
        if (v28 != 1)
        {
          v18 = 0;
          goto LABEL_24;
        }
      }
      _INLogSystem();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v10;
        _os_log_impl(&dword_230F2C000, v29, OS_LOG_TYPE_DEFAULT, "iCloud account %@ will change, and it has been 24 hours! Will notify ind...", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAccountProperty:forKey:", v30, CFSTR("iCloudNotificationLastRegisterDate"));

      v18 = 1;
      v20 = 3;
      break;
    case 3:
      _INLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v12;
        _os_log_impl(&dword_230F2C000, v13, OS_LOG_TYPE_DEFAULT, "iCloud account %@ is going away! Will notify ind...", buf, 0xCu);
      }

      v14 = (void *)os_transaction_create();
      v15 = objc_alloc_init(MEMORY[0x24BEC70A8]);
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = nullsub_1;
      v35[3] = &unk_24FFB5698;
      v16 = &v36;
      v36 = v14;
      v17 = v14;
      objc_msgSend(v15, "unregisterAccount:fromiCloudNotificationsWithCompletion:", v12, v35);
      v18 = 0;
      goto LABEL_23;
    default:
      v18 = 0;
      goto LABEL_26;
  }
  v31 = (void *)os_transaction_create();
  v15 = objc_alloc_init(MEMORY[0x24BEC70A8]);
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = nullsub_2;
  v33[3] = &unk_24FFB5698;
  v16 = &v34;
  v34 = v31;
  v17 = v31;
  objc_msgSend(v15, "registerAccount:foriCloudNotificationsWithReason:completion:", v10, v20, v33);
LABEL_23:

LABEL_24:
LABEL_26:

  return v18;
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = a6;
  if (a4 == 3)
  {
    _INLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_230F2C000, v9, OS_LOG_TYPE_DEFAULT, "iCloud account %@ was removed! Will notify ind", (uint8_t *)&v11, 0xCu);
    }

    -[INAccountNotificationPlugin notifyCloudSubscriptionFeatures](self, "notifyCloudSubscriptionFeatures");
    v10 = objc_alloc_init(MEMORY[0x24BEC70A8]);
    objc_msgSend(v10, "teardownOffersForAccount:withCompletion:", v8, &unk_24FFB56D8);

  }
}

- (void)notifyCloudSubscriptionFeatures
{
  MEMORY[0x24BEDD108](MEMORY[0x24BE17DC8], sel_clearCacheAndNotify);
}

@end
