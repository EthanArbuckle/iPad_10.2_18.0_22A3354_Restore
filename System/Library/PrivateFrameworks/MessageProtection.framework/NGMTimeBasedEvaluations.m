@implementation NGMTimeBasedEvaluations

+ (id)sharedManager
{
  id v2;
  id v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!sharedManager_sharedMyManager)
  {
    v3 = objc_alloc_init((Class)v2);
    v4 = (void *)sharedManager_sharedMyManager;
    sharedManager_sharedMyManager = (uint64_t)v3;

  }
  objc_sync_exit(v2);

  return (id)sharedManager_sharedMyManager;
}

+ (id)nowDate
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (void)setNowDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDate:", v4);

}

+ (id)oldestDateAllowedToSendTo
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a1, "nowDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  objc_msgSend(v2, "dateWithTimeIntervalSince1970:", v4 + -2678400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (double)timeIntervalAllowedForAction:(unint64_t)a3
{
  double result;

  result = dbl_20BB40370[a3 == 1];
  if (a3 == 2)
    return 12355200.0;
  return result;
}

+ (id)debugDescriptionForAction:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("registering");
  if (a3 == 1)
    v3 = CFSTR("encrypting to");
  if (a3 == 2)
    return CFSTR("validating signature of message");
  else
    return (id)v3;
}

+ (BOOL)validateFetchedPrekeyTimestamp:(double)a3 forEvaluationType:(unint64_t)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "nowDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8 - a3;

  objc_msgSend(a1, "timeIntervalAllowedForAction:", a4);
  v11 = v9 < 0.0;
  if (v9 >= 0.0)
  {
    v20 = v10;
    if (v9 <= v10)
      return 1;
    MessageProtectionLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", a3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(a1, "nowDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timeIntervalSince1970");
      objc_msgSend(v23, "dateWithTimeIntervalSince1970:", v25 - v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "nowDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "description");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "debugDescriptionForAction:", a4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v33 = v22;
      v34 = 2112;
      v35 = v27;
      v36 = 2112;
      v37 = v29;
      v38 = 2112;
      v39 = v30;
      _os_log_error_impl(&dword_20BABB000, v12, OS_LOG_TYPE_ERROR, "The encryption prekey is older (%@) than the last allowed date (%@) for %@ at %@.", buf, 0x2Au);

    }
  }
  else
  {
    MessageProtectionLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[NGMTimeBasedEvaluations validateFetchedPrekeyTimestamp:forEvaluationType:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  }

  return v11;
}

+ (BOOL)shouldRekeyIfLastRekeyFrom:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  BOOL v13;
  const char *v14;
  uint8_t *v15;
  _BOOL4 v16;
  __int16 v18;
  uint8_t buf[2];
  __int16 v20;
  __int16 v21;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "nowDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    v7 = v6;
    objc_msgSend(v4, "timeIntervalSince1970");
    v9 = v7 - v8;

    if (v9 < 0.0)
    {
      MessageProtectionLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v20 = 0;
        v11 = "A KEM rekeying happened with a date logged in the future.";
        v12 = (uint8_t *)&v20;
LABEL_13:
        _os_log_impl(&dword_20BABB000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    MessageProtectionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9 <= 604800.0)
    {
      if (v16)
      {
        v18 = 0;
        v11 = "We have rekeyed less than a week ago.";
        v12 = (uint8_t *)&v18;
        goto LABEL_13;
      }
LABEL_14:
      v13 = 0;
      goto LABEL_15;
    }
    if (!v16)
    {
      v13 = 1;
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v14 = "A week or more has passed since our last KEM rekeying, should rekey again.";
    v13 = 1;
    v15 = buf;
    goto LABEL_10;
  }
  MessageProtectionLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v13 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v21 = 0;
    v14 = "Rekeying since we don't have a last rekey date.";
    v15 = (uint8_t *)&v21;
LABEL_10:
    _os_log_impl(&dword_20BABB000, v10, OS_LOG_TYPE_INFO, v14, v15, 2u);
  }
LABEL_15:

  return v13;
}

+ (BOOL)prekeyCanBeDeleted:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "nowDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;
  objc_msgSend(v4, "publicPrekey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timestamp");
  v10 = v7 - v9;

  v11 = v10 >= 0.0;
  if (v10 < 0.0)
  {
    MessageProtectionLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      v13 = "The encryption prekey appears to have been signed with a date in the future.                    The time was"
            " probably rolled back on the phone.";
      v14 = v12;
      v15 = 2;
      goto LABEL_7;
    }
  }
  else
  {
    if (v10 <= 10368000.0)
    {
      v11 = 0;
      goto LABEL_10;
    }
    MessageProtectionLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v4;
      v13 = "Removing prekey %@ since it's safe to delete it now (expired).";
      v14 = v12;
      v15 = 12;
LABEL_7:
      _os_log_impl(&dword_20BABB000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v17, v15);
    }
  }

LABEL_10:
  return v11;
}

+ (BOOL)prekeyShouldBeRolled:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  objc_msgSend(a1, "nowDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;
  objc_msgSend(v4, "publicPrekey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timestamp");
  v10 = v7 - v9;

  if (v10 < 0.0)
  {
    MessageProtectionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[NGMTimeBasedEvaluations prekeyShouldBeRolled:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_7:

    return 1;
  }
  if (v10 > 604800.0)
  {
    MessageProtectionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[NGMTimeBasedEvaluations prekeyShouldBeRolled:].cold.2(v11, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_7;
  }
  return 0;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

+ (void)validateFetchedPrekeyTimestamp:(uint64_t)a3 forEvaluationType:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20BABB000, a1, a3, "The encryption prekey appears to have been signed with a date in the future", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

+ (void)prekeyShouldBeRolled:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20BABB000, a1, a3, "Time has been rolled back since the last time we registered a key.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

+ (void)prekeyShouldBeRolled:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20BABB000, a1, a3, "It's been a week since the last registration, let's roll.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

@end
