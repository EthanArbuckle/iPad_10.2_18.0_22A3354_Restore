@implementation HFStaleCachedValueReadPolicy

- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  const __CFString *v27;
  uint8_t buf[4];
  _BOOL4 v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
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
    +[HFCharacteristicNotificationManager sharedManager](HFCharacteristicNotificationManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cachedValueForCharacteristic:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = CFSTR("ExplicitlyDisallowed");
    else
      v12 = CFSTR("CacheMissing");
    if (+[HFUtilities hasInternalDiagnostics](HFUtilities, "hasInternalDiagnostics"))
    {
      HFLogForCategory(0x38uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "hf_prettyDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cachedValueForCharacteristic:", v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "value");
        v27 = v12;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "valueUpdatedTime");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastNotificationsEnableRequestDate");
        v26 = v10;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110402;
        v29 = v11 != 0;
        v30 = 2112;
        v31 = v14;
        v32 = 2112;
        v33 = v15;
        v34 = 2112;
        v35 = v16;
        v36 = 2112;
        v37 = v17;
        v38 = 2112;
        v39 = v18;
        _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "HFStaleCachedValueReadPolicy: isCached=%{BOOL}d for characteristic %@\ncachedValue=%@, value=%@, valueUpdatedTime=%@, lastNotificationsEnableRequestDate=%@", buf, 0x3Au);

        v10 = v26;
        v12 = v27;

      }
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v19;

    }
    v20 = v11 == 0;

  }
  else
  {
    if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
    {
      objc_msgSend(v5, "hf_prettyDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "service");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "accessory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "home");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Missing value manager for characteristic: %@ in home: %@"), v21, v24);

    }
    v20 = 1;
  }

  return v20;
}

@end
