@implementation HFCharacteristicNotificationManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HFCharacteristicNotificationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED379948 != -1)
    dispatch_once(&qword_1ED379948, block);
  return (id)_MergedGlobals_291;
}

- (NSDate)lastNotificationsEnableRequestDate
{
  return self->_lastNotificationsEnableRequestDate;
}

- (void)enableNotificationsForSelectedHomeWithReason:(id)a3
{
  -[HFCharacteristicNotificationManager enableNotificationsForSelectedHomeWithReason:numberOfAppleMediaAccessories:](self, "enableNotificationsForSelectedHomeWithReason:numberOfAppleMediaAccessories:", a3, 0);
}

- (void)enableNotificationsForSelectedHomeWithReason:(id)a3 numberOfAppleMediaAccessories:(unint64_t)a4
{
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicNotificationManager.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason != nil"));

  }
  -[HFCharacteristicNotificationManager notificationsEnabledReasons](self, "notificationsEnabledReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v11);

  if (v8)
    NSLog(CFSTR("Attempt to enable notifications multiple times for reason: %@"), v11);
  -[HFCharacteristicNotificationManager notificationsEnabledReasons](self, "notificationsEnabledReasons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v11);

  -[HFCharacteristicNotificationManager _updateNotificationsEnabledWithNumberOfAppleMediaAccessories:](self, "_updateNotificationsEnabledWithNumberOfAppleMediaAccessories:", a4);
}

- (void)_updateNotificationsEnabledWithNumberOfAppleMediaAccessories:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  id v36;
  HFCharacteristicNotificationManager *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCharacteristicNotificationManager notificationsEnabledHome](self, "notificationsEnabledHome");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[HFCharacteristicNotificationManager notificationsEnabledHome](self, "notificationsEnabledHome");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isEqual:", v9);

    if ((v10 & 1) == 0)
    {
      HFLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[HFCharacteristicNotificationManager notificationsEnabledHome](self, "notificationsEnabledHome");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = v12;
        v40 = 2112;
        v41 = v6;
        _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Asking HomeKit to disable notifications for home <%@> because the selected home changed to <%@>", buf, 0x16u);

      }
      -[HFCharacteristicNotificationManager notificationsEnabledHome](self, "notificationsEnabledHome");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "enableNotifications:completionHandler:", 0, &__block_literal_global_173);

      -[HFCharacteristicNotificationManager setNotificationsEnabledHome:](self, "setNotificationsEnabledHome:", 0);
      -[HFCharacteristicNotificationManager setLastNotificationsEnableRequestDate:](self, "setLastNotificationsEnableRequestDate:", 0);
    }
  }
  -[HFCharacteristicNotificationManager notificationsEnabledHome](self, "notificationsEnabledHome");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

    goto LABEL_8;
  }
  -[HFCharacteristicNotificationManager notificationsEnabledReasons](self, "notificationsEnabledReasons");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (!v23 || !v6)
  {
LABEL_8:
    -[HFCharacteristicNotificationManager notificationsEnabledHome](self, "notificationsEnabledHome");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[HFCharacteristicNotificationManager notificationsEnabledReasons](self, "notificationsEnabledReasons");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (!v18)
      {
        HFLogForCategory(0);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          -[HFCharacteristicNotificationManager notificationsEnabledHome](self, "notificationsEnabledHome");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v39 = v20;
          _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "Asking HomeKit to disable notifications for home <%@> because the last enabledReason was removed", buf, 0xCu);

        }
        -[HFCharacteristicNotificationManager notificationsEnabledHome](self, "notificationsEnabledHome");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "enableNotifications:includeAppleMediaAccessoryNotifications:completionHandler:", 0, 1, &__block_literal_global_24_6);

        -[HFCharacteristicNotificationManager setNotificationsEnabledHome:](self, "setNotificationsEnabledHome:", 0);
        -[HFCharacteristicNotificationManager setLastNotificationsEnableRequestDate:](self, "setLastNotificationsEnableRequestDate:", 0);
      }
    }
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicNotificationManager setLastNotificationsEnableRequestDate:](self, "setLastNotificationsEnableRequestDate:", v24);

  -[HFCharacteristicNotificationManager notificationsEnabledReasons](self, "notificationsEnabledReasons");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "containsObject:", CFSTR("HUCCNotificationsEnabledReasonForeground"));

  if (a3)
    v27 = 1;
  else
    v27 = v26 ^ 1u;
  HFLogForCategory(0);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCharacteristicNotificationManager notificationsEnabledReasons](self, "notificationsEnabledReasons");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v39 = v6;
    v40 = 2112;
    v41 = v29;
    v42 = 1024;
    v43 = v27;
    v44 = 2112;
    v45 = v30;
    _os_log_impl(&dword_1DD34E000, v28, OS_LOG_TYPE_DEFAULT, "Asking HomeKit to enable notifications for home <%@> for reason: %@ enableNotificationsForAppleMediaAccessories = %{BOOL}d, numberOfAppleMediaAccessories = %@", buf, 0x26u);

  }
  v32 = MEMORY[0x1E0C809B0];
  v33 = 3221225472;
  v34 = __100__HFCharacteristicNotificationManager__updateNotificationsEnabledWithNumberOfAppleMediaAccessories___block_invoke_20;
  v35 = &unk_1EA726360;
  v31 = v6;
  v36 = v31;
  v37 = self;
  objc_msgSend(v31, "enableNotifications:includeAppleMediaAccessoryNotifications:completionHandler:", 1, v27, &v32);
  -[HFCharacteristicNotificationManager setNotificationsEnabledHome:](self, "setNotificationsEnabledHome:", v31, v32, v33, v34, v35);

LABEL_21:
}

- (BOOL)notificationsEnabled
{
  void *v2;
  BOOL v3;

  -[HFCharacteristicNotificationManager notificationsEnabledHome](self, "notificationsEnabledHome");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (HMHome)notificationsEnabledHome
{
  return self->_notificationsEnabledHome;
}

- (NSMutableSet)notificationsEnabledReasons
{
  return self->_notificationsEnabledReasons;
}

- (void)setNotificationsEnabledHome:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsEnabledHome, a3);
}

- (void)setLastNotificationsEnableRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastNotificationsEnableRequestDate, a3);
}

void __52__HFCharacteristicNotificationManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_291;
  _MergedGlobals_291 = (uint64_t)v1;

}

- (HFCharacteristicNotificationManager)init
{
  HFCharacteristicNotificationManager *v2;
  uint64_t v3;
  NSMutableSet *notificationsEnabledReasons;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFCharacteristicNotificationManager;
  v2 = -[HFCharacteristicNotificationManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    notificationsEnabledReasons = v2->_notificationsEnabledReasons;
    v2->_notificationsEnabledReasons = (NSMutableSet *)v3;

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addHomeManagerObserver:", v2);

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addHomeObserver:", v2);

  }
  return v2;
}

- (void)disableNotificationsForSelectedHomeWithReason:(id)a3
{
  __CFString *v5;
  __CFString **v6;
  __CFString *v7;
  int v8;
  __CFString *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  __CFString *v14;

  v5 = (__CFString *)a3;
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicNotificationManager.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v5 = 0;
  }
  if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("HCSNotificationsEnabledReasonBackground")))
  {
    v6 = HCSNotificationsEnabledReasonForeground;
LABEL_7:
    v7 = *v6;
    goto LABEL_10;
  }
  if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("HOAppDelegateNotificationsEnabledReasonBackground")))
  {
    v6 = HOAppDelegateNotificationsEnabledReasonForeground;
    goto LABEL_7;
  }
  v8 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("HUCCNotificationsEnabledReasonBackground "));
  v7 = CFSTR("HUCCNotificationsEnabledReasonForeground");
  if (!v8)
    v7 = v14;
LABEL_10:
  v9 = v7;
  -[HFCharacteristicNotificationManager notificationsEnabledReasons](self, "notificationsEnabledReasons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v9);

  if ((v11 & 1) == 0)
    NSLog(CFSTR("Attempt to disable notifications without a matching call to enable for reason: %@"), v14);
  -[HFCharacteristicNotificationManager notificationsEnabledReasons](self, "notificationsEnabledReasons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObject:", v9);

  -[HFCharacteristicNotificationManager _updateNotificationsEnabled](self, "_updateNotificationsEnabled");
}

- (BOOL)notificationsReasonsExist
{
  void *v2;
  BOOL v3;

  -[HFCharacteristicNotificationManager notificationsEnabledReasons](self, "notificationsEnabledReasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)notificationsEnabledForCharacteristic:(id)a3 inHome:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[HFCharacteristicNotificationManager notificationsEnabledHome](self, "notificationsEnabledHome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v7, "isEqual:", v8);
  return (_DWORD)v5 && -[HFCharacteristicNotificationManager notificationsEnabled](self, "notificationsEnabled");
}

- (id)lastNotificationsEnableRequestDateForCharacteristic:(id)a3 forHome:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[HFCharacteristicNotificationManager notificationsEnabledHome](self, "notificationsEnabledHome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v7, "isEqual:", v8);
  if ((_DWORD)v5)
  {
    -[HFCharacteristicNotificationManager lastNotificationsEnableRequestDate](self, "lastNotificationsEnableRequestDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)cacheUpToDateWithNotificationsEnabledForCharacteristic:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  -[HFCharacteristicNotificationManager notificationsEnabledHome](self, "notificationsEnabledHome");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v9, "isEqual:", v10);
  if ((_DWORD)v7)
  {
    -[HFCharacteristicNotificationManager lastNotificationsEnableRequestDate](self, "lastNotificationsEnableRequestDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueUpdatedTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "laterDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != v11;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (void)setOverrideNotificationsStateContainer:(id)a3
{
  id v4;
  void *v5;
  id obj;

  v4 = a3;
  obj = a1;
  objc_sync_enter(obj);
  v5 = (void *)_notificationsStateContainer;
  _notificationsStateContainer = (uint64_t)v4;

  objc_sync_exit(obj);
}

+ (HFCharacteristicNotificationStateContaining)notificationsStateContainer
{
  id v2;
  id v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (_notificationsStateContainer)
  {
    v3 = (id)_notificationsStateContainer;
  }
  else
  {
    objc_msgSend(v2, "sharedManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_sync_exit(v2);

  return (HFCharacteristicNotificationStateContaining *)v4;
}

- (void)_updateNotificationsEnabled
{
  -[HFCharacteristicNotificationManager _updateNotificationsEnabledWithNumberOfAppleMediaAccessories:](self, "_updateNotificationsEnabledWithNumberOfAppleMediaAccessories:", 0);
}

void __100__HFCharacteristicNotificationManager__updateNotificationsEnabledWithNumberOfAppleMediaAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("disableHomeNotificationsForChangeHomes"));

}

void __100__HFCharacteristicNotificationManager__updateNotificationsEnabledWithNumberOfAppleMediaAccessories___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Enabled notifications call for home <%@> finished with error: %@", (uint8_t *)&v7, 0x16u);
  }

  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logError:operationDescription:", v3, CFSTR("enableHomeNotifications"));

  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setNotificationsEnabledHome:", 0);

}

void __100__HFCharacteristicNotificationManager__updateNotificationsEnabledWithNumberOfAppleMediaAccessories___block_invoke_23(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("disableHomeNotifications"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsEnabledHome, 0);
  objc_storeStrong((id *)&self->_notificationsEnabledReasons, 0);
  objc_storeStrong((id *)&self->_lastNotificationsEnableRequestDate, 0);
}

@end
