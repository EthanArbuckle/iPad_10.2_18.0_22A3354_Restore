@implementation AMSPaymentSheetMetricsEvent

+ (id)dictionaryForBiometricMatchState:(int64_t)a3 didBiometricsLockout:(BOOL)a4 biometricsType:(int64_t)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v6 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v9;
  switch(a3)
  {
    case 0:
      objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("error"), CFSTR("reason"));
      v11 = CFSTR("failure");
      v12 = CFSTR("result");
      goto LABEL_15;
    case 1:
      objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("authenticate"), CFSTR("actionType"));
      v13 = CFSTR("success");
      goto LABEL_6;
    case 2:
      objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("enterPassword"), CFSTR("actionType"));
      v11 = CFSTR("EnterPassword");
      goto LABEL_14;
    case 3:
      v14 = CFSTR("cancelClicked");
      goto LABEL_13;
    case 4:
      v14 = CFSTR("cancelOutside");
      goto LABEL_13;
    case 5:
      v14 = CFSTR("cancelHomeButton");
      goto LABEL_13;
    case 6:
      v14 = CFSTR("cancelPhysicalButton");
      goto LABEL_13;
    case 7:
      v14 = CFSTR("cancelSwipe");
LABEL_13:
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("actionType"));
      v11 = CFSTR("Cancel");
      goto LABEL_14;
    default:
      if (a3 == 100)
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("authenticate"), CFSTR("actionType"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("invalidCredentials"), CFSTR("reason"));
        v13 = CFSTR("failure");
LABEL_6:
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("result"));
        v11 = CFSTR("Biometric");
LABEL_14:
        v12 = CFSTR("targetId");
LABEL_15:
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v12);
        if (v6)
          goto LABEL_16;
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v24, "OSLogObject");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = objc_opt_class();
          AMSSetLogKeyIfNeeded();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543874;
          v30 = v26;
          v31 = 2114;
          v32 = v27;
          v33 = 2114;
          v34 = v28;
          _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown biometric match state: %{public}@", (uint8_t *)&v29, 0x20u);

        }
        if (v6)
LABEL_16:
          objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E25AF878, CFSTR("bioLockout"));
      }
      switch(a5)
      {
        case 1:
          break;
        case 2:
          v15 = CFSTR("touchId");
          goto LABEL_27;
        case 3:
          v15 = CFSTR("faceId");
          goto LABEL_27;
        case 4:
          v15 = CFSTR("passcode");
          goto LABEL_27;
        case 7:
          v15 = CFSTR("opticId");
LABEL_27:
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("biometricType"));
          break;
        default:
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v16, "OSLogObject");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = objc_opt_class();
            AMSSetLogKeyIfNeeded();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 138543874;
            v30 = v18;
            v31 = 2114;
            v32 = v19;
            v33 = 2114;
            v34 = v20;
            _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown biometric type: %{public}@", (uint8_t *)&v29, 0x20u);

          }
          break;
      }
      objc_msgSend(a1, "_timestamp");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("responseTime"));

      v22 = (void *)objc_msgSend(v10, "copy");
      return v22;
  }
}

+ (id)dictionaryForCancellationEvent:(unint64_t)a3 didBiometricsLockout:(BOOL)a4 biometricsType:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id result;

  v7 = a3 - 1;
  v8 = 4;
  switch(v7)
  {
    case 0uLL:
      goto LABEL_6;
    case 1uLL:
      v8 = 3;
      goto LABEL_6;
    case 2uLL:
      v8 = 5;
      goto LABEL_6;
    case 3uLL:
      v8 = 6;
      goto LABEL_6;
    case 4uLL:
      v8 = 7;
LABEL_6:
      objc_msgSend(a1, "dictionaryForBiometricMatchState:didBiometricsLockout:biometricsType:", v8, a4, a5, v5, v6);
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (id)dictionaryForUserAction:(int64_t)a3 didBiometricsLockout:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v7;
  switch(a3)
  {
    case 1:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("ok"), CFSTR("actionType"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("success"), CFSTR("result"));
      v9 = CFSTR("Ok");
      goto LABEL_20;
    case 2:
      v15 = CFSTR("cancel");
      goto LABEL_11;
    case 3:
      v15 = CFSTR("open");
LABEL_11:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("actionType"));
      v9 = CFSTR("IForgot");
      goto LABEL_20;
    case 4:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("cancel"), CFSTR("actionType"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Cancel"), CFSTR("targetId"));
      v9 = CFSTR("authenticate");
      v16 = v8;
      goto LABEL_21;
    case 5:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("invalidCredentials"), CFSTR("reason"));
      v17 = CFSTR("failure");
      goto LABEL_15;
    case 6:
      v17 = CFSTR("success");
LABEL_15:
      v18 = CFSTR("result");
      goto LABEL_19;
    case 7:
      v17 = CFSTR("enterPasswordCancelled");
      goto LABEL_18;
    case 8:
      v17 = CFSTR("enterPasswordPressed");
LABEL_18:
      v18 = CFSTR("actionType");
LABEL_19:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v18);
      v9 = CFSTR("authenticate");
      goto LABEL_20;
    case 9:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("cancelHomeButton"), CFSTR("actionType"));
      v9 = CFSTR("Cancel");
LABEL_20:
      v16 = v8;
LABEL_21:
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, CFSTR("targetId"));
      if (v4)
        goto LABEL_22;
      goto LABEL_23;
    default:
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = objc_opt_class();
        AMSSetLogKeyIfNeeded();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543874;
        v23 = v12;
        v24 = 2114;
        v25 = v13;
        v26 = 2114;
        v27 = v14;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown user action: %{public}@", (uint8_t *)&v22, 0x20u);

      }
      if (v4)
LABEL_22:
        objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E25AF878, CFSTR("bioLockout"));
LABEL_23:
      objc_msgSend(a1, "_timestamp");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("responseTime"));

      v20 = (void *)objc_msgSend(v8, "copy");
      return v20;
  }
}

- (void)addBiometricMatchState:(int64_t)a3
{
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      v5 = CFSTR("failure");
      v6 = CFSTR("result");
      goto LABEL_10;
    case 1:
      -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", CFSTR("biometricsAnalyze"), CFSTR("actionType"));
      v7 = CFSTR("success");
      goto LABEL_6;
    case 2:
      -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", CFSTR("enterPassword"), CFSTR("actionType"));
      -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", CFSTR("success"), CFSTR("result"));
      v5 = CFSTR("EnterPassword");
      goto LABEL_9;
    case 3:
      -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", CFSTR("cancel"), CFSTR("actionType"));
      -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", CFSTR("failure"), CFSTR("result"));
      v5 = CFSTR("Cancel");
      goto LABEL_9;
    default:
      if (a3 == 100)
      {
        -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", CFSTR("biometricsAnalyze"), CFSTR("actionType"));
        v7 = CFSTR("failure");
LABEL_6:
        -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v7, CFSTR("result"));
        v5 = CFSTR("Biometric");
LABEL_9:
        v6 = CFSTR("targetId");
LABEL_10:
        -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v5, v6);
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v8, "OSLogObject");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = objc_opt_class();
          AMSSetLogKeyIfNeeded();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138543874;
          v14 = v10;
          v15 = 2114;
          v16 = v11;
          v17 = 2114;
          v18 = v12;
          _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown match state: %{public}@", (uint8_t *)&v13, 0x20u);

        }
      }
      return;
  }
}

- (void)addBiometricsState:(int64_t)a3
{
  const __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("on");
  }
  else
  {
    if (a3 != 2)
      return;
    v3 = CFSTR("off");
  }
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v3, CFSTR("bioAuthCommerceSetting"));
}

- (void)addClientMetadataForPaymentSheetRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "salableInfoLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "salableInfoLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPaymentSheetRequest attributedStringByRemovingPlaceholderTagsFromAttributedString:](AMSPaymentSheetRequest, "attributedStringByRemovingPlaceholderTagsFromAttributedString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v7, CFSTR("message"));
  }

}

- (void)addClientMetadataForPurchaseInfo:(id)a3 metricsDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "buyParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v24 = CFSTR("buyParams");
    v25[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v10, CFSTR("details"));

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mtClientId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;

    if (v12)
      -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v12, CFSTR("clientId"));
  }
  else
  {

    v12 = 0;
  }
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", CFSTR("SignIn"), CFSTR("dialogType"));
  objc_msgSend(v6, "clientInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUserAgent userAgentForProcessInfo:](AMSUserAgent, "userAgentForProcessInfo:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v14, CFSTR("userAgent"));
  objc_msgSend(v6, "clientInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "proxyAppBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_12;
  objc_msgSend(v6, "clientInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "mappedBundleInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16
    || (objc_msgSend(v6, "clientInfo"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "bundleIdentifier"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v16))
  {
LABEL_12:
    -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v16, CFSTR("hostApp"));

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("titleType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v20;

    if (v21)
      -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v21, CFSTR("titleType"));
  }
  else
  {

    v21 = 0;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("titleValue"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v22;

    if (v23)
      -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v23, CFSTR("titleValue"));
  }
  else
  {

    v23 = 0;
  }

}

- (void)addDualActionSuccess:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("success");
  else
    v3 = CFSTR("failure");
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v3, CFSTR("dualAction"));
}

- (void)addUserActions:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("userActions"));
}

+ (id)_propertyValueClassesForKnownProperties
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[19];
  _QWORD v9[20];

  v9[19] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("clientId");
  v9[0] = objc_opt_class();
  v8[1] = CFSTR("message");
  v9[1] = objc_opt_class();
  v8[2] = CFSTR("dialogType");
  v9[2] = objc_opt_class();
  v8[3] = CFSTR("mtClientId");
  v9[3] = objc_opt_class();
  v8[4] = CFSTR("titleType");
  v9[4] = objc_opt_class();
  v8[5] = CFSTR("titleValue");
  v9[5] = objc_opt_class();
  v8[6] = CFSTR("details");
  v9[6] = objc_opt_class();
  v8[7] = CFSTR("hostApp");
  v9[7] = objc_opt_class();
  v8[8] = CFSTR("userAgent");
  v9[8] = objc_opt_class();
  v8[9] = CFSTR("userActions");
  v9[9] = objc_opt_class();
  v8[10] = CFSTR("bioLockout");
  v9[10] = objc_opt_class();
  v8[11] = CFSTR("biometricType");
  v9[11] = objc_opt_class();
  v8[12] = CFSTR("dualAction");
  v9[12] = objc_opt_class();
  v8[13] = CFSTR("reason");
  v9[13] = objc_opt_class();
  v8[14] = CFSTR("responseTime");
  v9[14] = objc_opt_class();
  v8[15] = CFSTR("result");
  v9[15] = objc_opt_class();
  v8[16] = CFSTR("targetId");
  v9[16] = objc_opt_class();
  v8[17] = CFSTR("actionType");
  v9[17] = objc_opt_class();
  v8[18] = CFSTR("bioAuthCommerceSetting");
  v9[18] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AMSPaymentSheetMetricsEvent;
  objc_msgSendSuper2(&v7, sel__propertyValueClassesForKnownProperties);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  return v4;
}

+ (id)_timestamp
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
