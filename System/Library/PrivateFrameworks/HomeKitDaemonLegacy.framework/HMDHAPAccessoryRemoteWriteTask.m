@implementation HMDHAPAccessoryRemoteWriteTask

- (HMDHAPAccessoryRemoteWriteTask)initWithContext:(id)a3 requests:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  HMDHAPAccessoryRemoteWriteTask *v17;

  v8 = (void *)MEMORY[0x1E0D28678];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferenceForKey:", CFSTR("AccessoryReaderWriterMessageDefaultTimeout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v17 = -[HMDHAPAccessoryRemoteWriteTask initWithContext:requests:delegateDevice:timeout:completion:](self, "initWithContext:requests:delegateDevice:timeout:completion:", v11, v10, 0, v9, v16);
  return v17;
}

- (HMDHAPAccessoryRemoteWriteTask)initWithContext:(id)a3 requests:(id)a4 timeout:(double)a5 completion:(id)a6
{
  return -[HMDHAPAccessoryRemoteWriteTask initWithContext:requests:delegateDevice:timeout:completion:](self, "initWithContext:requests:delegateDevice:timeout:completion:", a3, a4, 0, a6, a5);
}

- (HMDHAPAccessoryRemoteWriteTask)initWithContext:(id)a3 requests:(id)a4 delegateDevice:(id)a5 timeout:(double)a6 completion:(id)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDHAPAccessoryRemoteWriteTask;
  return -[HMDHAPAccessoryRemoteOperationTask initWithContext:remoteMessageName:requests:delegateDevice:timeout:completion:](&v8, sel_initWithContext_remoteMessageName_requests_delegateDevice_timeout_completion_, a3, CFSTR("kMultipleCharacteristicWriteRequestKey"), a4, a5, a7, a6);
}

- (BOOL)_appendServiceListWithRequest:(id)a3 serviceList:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  id v30;
  void *v31;
  id v32;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "characteristic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "instanceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "instanceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "hmf_mutableDictionaryForKey:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v13);
    }
    v30 = v5;
    v31 = (void *)v13;
    v32 = v6;
    objc_msgSend(v10, "authorizationData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v15, CFSTR("kAuthorizationDataKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v18);

    }
    objc_msgSend(v10, "accessory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "home");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "currentUser");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "notificationContextHAPIdentifier");
    v22 = (void *)v15;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contextDataForWriteRequestWithIdentifier:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v22, CFSTR("kCharacteristicContextDataForWriteKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, v25);

    }
    objc_msgSend(v9, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, v22);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "includeResponseValue"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v27, CFSTR("HMDCharacteristicWriteRequestIncludeResponseValueKey"));

    v28 = objc_msgSend(v9, "requestType") == 1;
    v6 = v32;
    v5 = v30;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

@end
