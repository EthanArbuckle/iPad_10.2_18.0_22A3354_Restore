@implementation AMSPushPayload

- (AMSPushPayload)initWithPayload:(id)a3
{
  id v5;
  AMSPushPayload *v6;
  AMSPushPayload *v7;
  void **p_payload;
  dispatch_queue_t v9;
  OS_dispatch_queue *internalQueue;
  uint64_t v11;
  NSString *logKey;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  BOOL v31;
  id v32;
  void *v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)AMSPushPayload;
  v6 = -[AMSPushPayload init](&v35, sel_init);
  v7 = v6;
  if (v6)
  {
    p_payload = (void **)&v6->_payload;
    objc_storeStrong((id *)&v6->_payload, a3);
    v9 = dispatch_queue_create("com.apple.AppleMediaServices.notification", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v9;

    AMSGenerateLogCorrelationKey();
    v11 = objc_claimAutoreleasedReturnValue();
    logKey = v7->_logKey;
    v7->_logKey = (NSString *)v11;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("10"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aps"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = 0;
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }
    v16 = v15;

    if (!v16 || !objc_msgSend(v14, "containsString:", CFSTR("gzip")))
      goto LABEL_22;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v16, 0);
    objc_msgSend(v15, "ams_decompressedData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
LABEL_20:

      goto LABEL_21;
    }
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v17, 0, &v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v34;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v18;

      v21 = v20 == 0;
      if (!v19 && v20)
      {
LABEL_19:
        v27 = (void *)objc_msgSend(v5, "mutableCopy");
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v20, CFSTR("aps"));
        v28 = objc_msgSend(v27, "copy");
        v29 = *p_payload;
        *p_payload = (void *)v28;

        goto LABEL_20;
      }
    }
    else
    {

      v20 = 0;
      v21 = 1;
    }
    v31 = v21;
    v32 = v20;
    v33 = v19;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_opt_class();
      AMSLogKey();
      v25 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v24;
      v38 = 2114;
      v39 = v25;
      v26 = (void *)v25;
      v40 = 2114;
      v41 = v33;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to deserialize APS. %{public}@", buf, 0x20u);

    }
    v20 = v32;
    if (v31)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_23:

  return v7;
}

- (ACAccount)account
{
  NSObject *internalQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__60;
  v10 = __Block_byref_object_dispose__60;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__AMSPushPayload_account__block_invoke;
  v5[3] = &unk_1E2542338;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (void *)objc_msgSend((id)v7[5], "copy");
  _Block_object_dispose(&v6, 8);

  return (ACAccount *)v3;
}

void __25__AMSPushPayload_account__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = v3;
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;
  }
  else
  {
    objc_msgSend(v2, "accountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v12 = v6;
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ams_iTunesAccountWithDSID:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 8);
      *(_QWORD *)(v10 + 8) = v9;

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
      v6 = v12;
    }
  }

}

- (NSNumber)accountIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[AMSPushPayload payload](self, "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSNumber *)v4;
}

- (ACAccountType)accountType
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v3 = objc_alloc(MEMORY[0x1E0C8F2C8]);
  v4 = (void *)objc_msgSend(v3, "initWithIdentifier:description:", *MEMORY[0x1E0C8F170], &stru_1E2548760);
  -[AMSPushPayload payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("12"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == 1)
  {
    v8 = objc_alloc(MEMORY[0x1E0C8F2C8]);
    v9 = objc_msgSend(v8, "initWithIdentifier:description:", *MEMORY[0x1E0C8F030], &stru_1E2548760);

    v4 = (void *)v9;
  }
  return (ACAccountType *)v4;
}

- (NSString)actionType
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[AMSPushPayload payload](self, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionTypeFromPayload:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int64_t)alertType
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[AMSPushPayload payload](self, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("7"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  -[AMSPushPayload payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("7"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8)
    return 2 * (v8 == 1);
  else
    return 1;
}

- (NSDictionary)aps
{
  void *v2;
  void *v3;
  id v4;

  -[AMSPushPayload payload](self, "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("aps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSDictionary *)v4;
}

- (NSString)clientIdentifier
{
  void *v2;
  void *v3;
  id v4;

  -[AMSPushPayload payload](self, "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (BOOL)isAccountTypeActive
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  -[AMSPushPayload accountType](self, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 == (void *)*MEMORY[0x1E0C8F170])
  {
    -[AMSPushPayload account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isActive");

    if ((v7 & 1) != 0)
      return 1;
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ams_activeiCloudAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "ams_DSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPushPayload account](self, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ams_DSID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqual:", v13);

  return v14;
}

- (int64_t)priority
{
  void *v2;
  void *v3;
  int64_t v4;

  -[AMSPushPayload payload](self, "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("11"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (NSString)URLString
{
  void *v2;
  void *v3;
  id v4;

  -[AMSPushPayload payload](self, "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("3"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AMSPushPayload payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)actionTypeFromPayload:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = &unk_1E25AF9C8;
  if (v5)
    v6 = v5;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
