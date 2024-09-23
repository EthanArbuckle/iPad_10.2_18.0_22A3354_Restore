@implementation HDHeadphoneAudioExposurePolicyDeterminer

+ (id)determinePreviousFireDateWithStore:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v24 = 0;
  objc_msgSend(v5, "_fetchPreviousSevenDayLocalNotificationFireDateWithError:", &v24);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v24;
  if (!v7)
  {
    v23 = 0;
    objc_msgSend(v5, "_fetchPreviousSevenDayRemoteNotificationFireDateWithError:", &v23);
    v10 = objc_claimAutoreleasedReturnValue();
    v8 = v23;
    if (v8)
    {
      if (a4)
      {
        v9 = 0;
        *a4 = objc_retainAutorelease(v8);
LABEL_29:

        goto LABEL_30;
      }
      _HKLogDroppedError();
LABEL_12:
      v9 = 0;
      goto LABEL_29;
    }
    if (!(v6 | v10))
    {
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v26 = v13;
        _os_log_impl(&dword_21A0AA000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Determiner returning nil", buf, 0xCu);

      }
      goto LABEL_12;
    }
    if (v6 && !v10)
    {
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      goto LABEL_24;
    }
    if (v6 || !v10)
    {
      v15 = objc_msgSend((id)v6, "hk_isAfterDate:", v10);
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x24BDD3000];
      v16 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v16)
        {
LABEL_23:
          v17 = v14;
          v18 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v26 = v18;
          _os_log_impl(&dword_21A0AA000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Determiner returning local notification fire date", buf, 0xCu);

        }
LABEL_24:
        v19 = (id)v6;
LABEL_28:
        v9 = v19;
        goto LABEL_29;
      }
      if (v16)
        goto LABEL_26;
    }
    else
    {
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:
        v20 = v14;
        v21 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v26 = v21;
        _os_log_impl(&dword_21A0AA000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Determiner returning remote notification fire date", buf, 0xCu);

      }
    }
    v19 = (id)v10;
    goto LABEL_28;
  }
  v8 = v7;
  if (a4)
  {
    v8 = objc_retainAutorelease(v7);
    v9 = 0;
    *a4 = v8;
  }
  else
  {
    _HKLogDroppedError();
    v9 = 0;
  }
LABEL_30:

  return v9;
}

@end
