@implementation HFCachedValueReadPolicy

- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id *v32;
  const __CFString *v33;
  void *v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hf_characteristicValueManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[HFCharacteristicNotificationManager notificationsStateContainer](HFCharacteristicNotificationManager, "notificationsStateContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastNotificationsEnableRequestDateForCharacteristic:forHome:", v5, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cachedValueForCharacteristic:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (objc_msgSend(v5, "isNotificationEnabled"))
      {
        objc_msgSend(v5, "valueUpdatedTime");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_6;
        v14 = (void *)v13;
        objc_msgSend(v5, "valueUpdatedTime");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToDate:", v16);

        if ((v17 & 1) == 0)
        {
          if (objc_msgSend(v10, "notificationsEnabledForCharacteristic:inHome:", v5, v8))
          {
            v18 = objc_msgSend(v10, "cacheUpToDateWithNotificationsEnabledForCharacteristic:inHome:", v5, v8);
            if (v18)
              v19 = CFSTR("CacheUpToDate");
            else
              v19 = CFSTR("NotificationsEnabledAfterLastRead");
          }
          else
          {
            v18 = 0;
            v19 = CFSTR("HomeNotificationsDisabled");
          }
        }
        else
        {
LABEL_6:
          v18 = 0;
          v19 = CFSTR("CacheNeverUpdated");
        }
      }
      else
      {
        v18 = 0;
        v19 = CFSTR("CharacteristicNotificationsDisabled");
      }
    }
    else
    {
      v18 = 0;
      v19 = CFSTR("CacheMissing");
    }
    if (+[HFUtilities hasInternalDiagnostics](HFUtilities, "hasInternalDiagnostics"))
    {
      HFLogForCategory(0x38uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "hf_prettyDescription");
        v32 = a4;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cachedValueForCharacteristic:", v5);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "value");
        v34 = v11;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "valueUpdatedTime");
        v33 = v19;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110658;
        v36 = v18;
        v37 = 2112;
        v38 = v26;
        v39 = 2112;
        v40 = v27;
        v41 = 2112;
        v42 = v28;
        v43 = 2112;
        v44 = v29;
        v45 = 2112;
        v46 = v34;
        v47 = 2112;
        v48 = v10;
        _os_log_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_DEFAULT, "HFCachedValueReadPolicy: cacheUpToDate=%{BOOL}d for characteristic %@\ncachedValue=%@, value=%@, valueUpdatedTime=%@, lastNotificationsEnableRequestDate=%@, notificationStateContainer=%@", buf, 0x44u);

        v19 = v33;
        v11 = v34;

        a4 = v32;
      }

    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v19);
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v30;

    }
    v24 = v18 ^ 1u;

  }
  else
  {
    if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
    {
      objc_msgSend(v5, "hf_prettyDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "service");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "accessory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "home");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Missing value manager for characteristic: %@ in home: %@"), v20, v23);

    }
    v24 = 1;
  }

  return v24;
}

@end
