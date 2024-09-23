@implementation AMSAuthenticateMetrics

- (AMSAuthenticateMetrics)init
{
  void *v3;
  AMSAuthenticateMetrics *v4;

  objc_msgSend((id)objc_opt_class(), "createBagForSubProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AMSAuthenticateMetrics initWithBag:](self, "initWithBag:", v3);

  return v4;
}

- (AMSAuthenticateMetrics)initWithBag:(id)a3
{
  id v5;
  AMSAuthenticateMetrics *v6;
  AMSAuthenticateMetrics *v7;
  NSDate *beginDate;
  uint64_t v9;
  AMSMetrics *metrics;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSAuthenticateMetrics;
  v6 = -[AMSAuthenticateMetrics init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    beginDate = v7->_beginDate;
    v7->_beginDate = 0;

    +[AMSAuthenticateMetrics _metricsInstanceWithBag:](AMSAuthenticateMetrics, "_metricsInstanceWithBag:", v7->_bag);
    v9 = objc_claimAutoreleasedReturnValue();
    metrics = v7->_metrics;
    v7->_metrics = (AMSMetrics *)v9;

  }
  return v7;
}

- (id)enqueueWithEvent:(unint64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(v6, "options");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isServerRequested");
      objc_msgSend(v7, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAuthenticateMetrics enqueueAuthenticationBeginEventWithOptions:serverRequested:account:](self, "enqueueAuthenticationBeginEventWithOptions:serverRequested:account:", v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 1uLL:
      objc_msgSend(v6, "options");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAuthenticateMetrics enqueueAuthKitBeginEventWithOptions:account:](self, "enqueueAuthKitBeginEventWithOptions:account:", v8, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(v6, "options");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAuthenticateMetrics enqueueAuthKitFinishEventWithOptions:account:error:](self, "enqueueAuthKitFinishEventWithOptions:account:error:", v8, v12, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3uLL:
      objc_msgSend(v6, "options");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAuthenticateMetrics enqueueVerifyCredentialsBeginEventWithOptions:account:](self, "enqueueVerifyCredentialsBeginEventWithOptions:account:", v8, v12);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v11 = (void *)v13;
      goto LABEL_10;
    case 4uLL:
      objc_msgSend(v6, "options");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAuthenticateMetrics enqueueVerifyCredentialsFinishEventWithOptions:account:error:](self, "enqueueVerifyCredentialsFinishEventWithOptions:account:error:", v8, v12, v14);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v11 = (void *)v15;

LABEL_10:
      break;
    default:
      AMSError(2, CFSTR("Unrecognized metrics event"), CFSTR("The provided AMSAuthenticateMetricsEvent was not recognized"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }

  return v11;
}

- (void)flushEvents
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[AMSAuthenticateMetrics metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flush");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AMSAuthenticateMetrics_flushEvents__block_invoke;
  v5[3] = &unk_1E253DF98;
  v5[4] = self;
  objc_msgSend(v4, "addFinishBlock:", v5);

}

void __37__AMSAuthenticateMetrics_flushEvents__block_invoke()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v0, "OSLogObject");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    v2 = objc_opt_class();
    AMSLogKey();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543618;
    v5 = v2;
    v6 = 2114;
    v7 = v3;
    _os_log_impl(&dword_18C849000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Flushing Authentication Metrics", (uint8_t *)&v4, 0x16u);

  }
}

- (id)enqueueAuthenticationBeginEventWithOptions:(id)a3 serverRequested:(BOOL)a4 account:(id)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  _QWORD v21[5];

  v5 = a4;
  v21[4] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99E08];
  v20[0] = CFSTR("authenticationType");
  v9 = a5;
  v10 = a3;
  -[AMSAuthenticateMetrics _authenticationTypeStringFor:](self, "_authenticationTypeStringFor:", objc_msgSend(v10, "authenticationType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = CFSTR("AuthenticationBegin");
  v20[1] = CFSTR("eventType");
  v20[2] = CFSTR("isServerRequested");
  v21[2] = MEMORY[0x1E0C9AAA0];
  v20[3] = CFSTR("supportsUI");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "allowServerDialogs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "metricsIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "ams_setNullableObject:forKey:", v15, CFSTR("canaryIdenifier"));
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("isServerRequested"));

  }
  v17 = (void *)objc_msgSend(v14, "copy");
  -[AMSAuthenticateMetrics _enqueueProperties:account:](self, "_enqueueProperties:account:", v17, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)enqueueAuthKitBeginEventWithOptions:(id)a3 account:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateMetrics setBeginDate:](self, "setBeginDate:", v9);

  v10 = (void *)MEMORY[0x1E0C99E08];
  v18[0] = CFSTR("authenticationType");
  -[AMSAuthenticateMetrics _authenticationTypeStringFor:](self, "_authenticationTypeStringFor:", objc_msgSend(v8, "authenticationType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = CFSTR("AuthKitAuthenticationBegin");
  v18[1] = CFSTR("eventType");
  v18[2] = CFSTR("supportsUI");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "allowServerDialogs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "metricsIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "ams_setNullableObject:forKey:", v15, CFSTR("canaryIdenifier"));
  -[AMSAuthenticateMetrics _enqueueProperties:account:](self, "_enqueueProperties:account:", v14, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)enqueueAuthKitFinishEventWithOptions:(id)a3 account:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v22[0] = CFSTR("authenticationType");
  v10 = a4;
  v11 = a3;
  -[AMSAuthenticateMetrics _authenticationTypeStringFor:](self, "_authenticationTypeStringFor:", objc_msgSend(v11, "authenticationType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("duration");
  v23[0] = v12;
  -[AMSAuthenticateMetrics beginDate](self, "beginDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateMetrics _durationSinceDate:](self, "_durationSinceDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "metricsIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "ams_setNullableObject:forKey:", v17, CFSTR("canaryIdenifier"));
  if (v8)
  {
    objc_msgSend(v16, "setObject:forKey:", CFSTR("AuthKitAuthenticationFailure"), CFSTR("eventType"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "code"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("errorCode"));

  }
  else
  {
    objc_msgSend(v16, "setObject:forKey:", CFSTR("AuthKitAuthenticationSuccess"), CFSTR("eventType"));
  }
  v19 = (void *)objc_msgSend(v16, "copy");
  -[AMSAuthenticateMetrics _enqueueProperties:account:](self, "_enqueueProperties:account:", v19, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)enqueueVerifyCredentialsBeginEventWithOptions:(id)a3 account:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateMetrics setBeginDate:](self, "setBeginDate:", v9);

  v10 = (void *)MEMORY[0x1E0C99E08];
  v18[0] = CFSTR("credentialSource");
  -[AMSAuthenticateMetrics _credentialSourceStringFor:](self, "_credentialSourceStringFor:", objc_msgSend(v8, "credentialSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = CFSTR("CommerceAuthenticationBegin");
  v18[1] = CFSTR("eventType");
  v18[2] = CFSTR("supportsUI");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "allowServerDialogs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "metricsIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "ams_setNullableObject:forKey:", v15, CFSTR("canaryIdenifier"));
  -[AMSAuthenticateMetrics _enqueueProperties:account:](self, "_enqueueProperties:account:", v14, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)enqueueVerifyCredentialsFinishEventWithOptions:(id)a3 account:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v22[0] = CFSTR("credentialSource");
  v10 = a4;
  v11 = a3;
  -[AMSAuthenticateMetrics _credentialSourceStringFor:](self, "_credentialSourceStringFor:", objc_msgSend(v11, "credentialSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("duration");
  v23[0] = v12;
  -[AMSAuthenticateMetrics beginDate](self, "beginDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateMetrics _durationSinceDate:](self, "_durationSinceDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "metricsIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "ams_setNullableObject:forKey:", v17, CFSTR("canaryIdenifier"));
  if (v8)
  {
    objc_msgSend(v16, "setObject:forKey:", CFSTR("CommerceAuthenticationFailure"), CFSTR("eventType"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "code"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("errorCode"));

  }
  else
  {
    objc_msgSend(v16, "setObject:forKey:", CFSTR("CommerceAuthenticationSuccess"), CFSTR("eventType"));
  }
  v19 = (void *)objc_msgSend(v16, "copy");
  -[AMSAuthenticateMetrics _enqueueProperties:account:](self, "_enqueueProperties:account:", v19, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)bagSubProfile
{
  if (_MergedGlobals_81 != -1)
    dispatch_once(&_MergedGlobals_81, &__block_literal_global_9);
  return (id)qword_1ECEACF58;
}

void __39__AMSAuthenticateMetrics_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACF58;
  qword_1ECEACF58 = (uint64_t)CFSTR("AMSCore");

}

+ (id)bagSubProfileVersion
{
  if (qword_1ECEACF60 != -1)
    dispatch_once(&qword_1ECEACF60, &__block_literal_global_55);
  return (id)qword_1ECEACF68;
}

void __46__AMSAuthenticateMetrics_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACF68;
  qword_1ECEACF68 = (uint64_t)CFSTR("1");

}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_metricsInstanceWithBag:(id)a3
{
  id v3;
  AMSMetrics *v4;

  v3 = a3;
  v4 = -[AMSMetrics initWithContainerID:bag:]([AMSMetrics alloc], "initWithContainerID:bag:", 0x1E254DC20, v3);

  return v4;
}

+ (id)_eventWithTopic:(id)a3
{
  id v3;
  AMSMetricsEvent *v4;

  v3 = a3;
  v4 = -[AMSMetricsEvent initWithTopic:]([AMSMetricsEvent alloc], "initWithTopic:", v3);

  -[AMSMetricsEvent setCheckDiagnosticsAndUsageSetting:](v4, "setCheckDiagnosticsAndUsageSetting:", 1);
  return v4;
}

- (id)_topicFromBag
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AMSAuthenticateMetrics bag](self, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AMSAuthenticateMetrics bag](self, "bag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDefaultValue:forKey:", CFSTR("_topic_not_defined_"), CFSTR("authPerfTopicName"));

  }
  -[AMSAuthenticateMetrics bag](self, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForKey:", CFSTR("authPerfTopicName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valuePromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_accountIsSecondaryHomeUser:(id)a3
{
  return 0;
}

- (id)_authenticationTypeStringFor:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("unrecognized");
  else
    return off_1E253DFE0[a3];
}

- (id)_clampTimeStampValue:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "longLongValue");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 4000 * (v3 / 4000));
}

- (id)_eventTime
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics serverTimeFromDate:](AMSMetrics, "serverTimeFromDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateMetrics _clampTimeStampValue:](self, "_clampTimeStampValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_credentialSourceStringFor:(unint64_t)a3
{
  if (a3 > 6)
    return CFSTR("unrecognized");
  else
    return off_1E253E000[a3];
}

- (id)_durationSinceDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  if (!a3)
    return &unk_1E25AEF78;
  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_enqueueEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AMSAuthenticateMetrics metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "promiseForEnqueueingEvents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_enqueueProperties:(id)a3 account:(id)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  AMSMutableBinaryPromise *v15;
  void *v16;
  AMSMutableBinaryPromise *v17;
  id v18;
  void *v19;
  AMSMutableBinaryPromise *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[4];
  AMSMutableBinaryPromise *v27;
  AMSAuthenticateMetrics *v28;
  __CFString *v29;
  void *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    v7 = (void *)objc_msgSend(a3, "mutableCopy");
    if (-[AMSAuthenticateMetrics _accountIsSecondaryHomeUser:](self, "_accountIsSecondaryHomeUser:", v6))
      v8 = CFSTR("authPerformanceSecondary");
    else
      v8 = CFSTR("authPerformance");
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v32 = v11;
      v33 = 2114;
      v34 = v12;
      v35 = 2114;
      v36 = v13;
      v37 = 2114;
      v38 = v14;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Creating Event with properties = %{public}@ using account = %{public}@", buf, 0x2Au);

    }
    v15 = objc_alloc_init(AMSMutableBinaryPromise);
    -[AMSAuthenticateMetrics _topicFromBag](self, "_topicFromBag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __53__AMSAuthenticateMetrics__enqueueProperties_account___block_invoke;
    v26[3] = &unk_1E253DFC0;
    v17 = v15;
    v27 = v17;
    v28 = self;
    v29 = (__CFString *)v8;
    v30 = v7;
    v18 = v7;
    objc_msgSend(v16, "resultWithCompletion:", v26);

    v19 = v30;
    v20 = v17;

  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      v33 = 2114;
      v34 = v24;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempted to enqueue event without properties.", buf, 0x16u);

    }
    AMSError(2, CFSTR("Missing Properties"), 0, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v18);
    v20 = (AMSMutableBinaryPromise *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

void __53__AMSAuthenticateMetrics__enqueueProperties_account___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int8x16_t v14;
  _QWORD v15[4];
  int8x16_t v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a3);
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "_isTopicDefined:", v5))
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v8;
      v21 = 2114;
      v22 = v9;
      v23 = 2114;
      v24 = v5;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Queue Metrics Event for topic %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_userIdForBagNamespace:", *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__AMSAuthenticateMetrics__enqueueProperties_account___block_invoke_81;
    v15[3] = &unk_1E253DFC0;
    v14 = *(int8x16_t *)(a1 + 32);
    v11 = (id)v14.i64[0];
    v16 = vextq_s8(v14, v14, 8uLL);
    v17 = *(id *)(a1 + 56);
    v18 = v5;
    objc_msgSend(v10, "resultWithCompletion:", v15);

  }
  else
  {
    v12 = *(void **)(a1 + 32);
    AMSError(2, CFSTR("Topic string not found"), 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishWithError:", v13);

  }
}

void __53__AMSAuthenticateMetrics__enqueueProperties_account___block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create metrics event due to an error while fetching userId. error = %{public}@", buf, 0x20u);

    }
    v12 = *(void **)(a1 + 40);
    AMSError(2, CFSTR("Unable to enqueue event"), CFSTR("Failed to create event, userId key not found in store"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishWithError:", v13);
  }
  else
  {
    v14 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_eventTime", CFSTR("userId"), 0x1E255B7A0, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ams_dictionaryByAddingEntriesFromDictionary:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_enqueueEventWithTopic:properties:", *(_QWORD *)(a1 + 56), v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "finishWithPromise:", v18);

  }
}

- (id)_enqueueEventWithTopic:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_msgSend((id)objc_opt_class(), "_eventWithTopic:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addPropertiesWithDictionary:", v8);
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v12;
      v24 = 2114;
      v25 = v13;
      v26 = 2114;
      v27 = v9;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Queueing Metrics Event = %{public}@", (uint8_t *)&v22, 0x20u);

    }
    v30[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateMetrics _enqueueEvents:](self, "_enqueueEvents:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138544130;
      v23 = v18;
      v24 = 2114;
      v25 = v19;
      v26 = 2114;
      v27 = v6;
      v28 = 2114;
      v29 = v20;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempted to enqueue event without topic or properties. topic = %{public}@ properties = %{public}@", (uint8_t *)&v22, 0x2Au);

    }
    AMSError(2, CFSTR("Missing topic or properties"), 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (BOOL)_isTopicDefined:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "isEqualToString:", CFSTR("_topic_not_defined_")) ^ 1;
  if (a3)
    return v4;
  else
    return 0;
}

- (id)_userIdForBagNamespace:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AMSAuthenticateMetrics bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsIdentifierStore identifierForAccount:bag:bagNamespace:keyName:](AMSMetricsIdentifierStore, "identifierForAccount:bag:bagNamespace:keyName:", 0, v5, v4, CFSTR("userId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSMetrics)metrics
{
  return self->_metrics;
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (void)setBeginDate:(id)a3
{
  objc_storeStrong((id *)&self->_beginDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
