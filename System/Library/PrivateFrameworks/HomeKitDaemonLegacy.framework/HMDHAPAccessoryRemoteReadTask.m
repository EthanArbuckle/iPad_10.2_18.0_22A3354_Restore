@implementation HMDHAPAccessoryRemoteReadTask

- (HMDHAPAccessoryRemoteReadTask)initWithContext:(id)a3 requests:(id)a4 completion:(id)a5
{
  return -[HMDHAPAccessoryRemoteReadTask initWithContext:requests:delegateDevice:completion:](self, "initWithContext:requests:delegateDevice:completion:", a3, a4, 0, a5);
}

- (HMDHAPAccessoryRemoteReadTask)initWithContext:(id)a3 requests:(id)a4 delegateDevice:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  HMDHAPAccessoryRemoteReadTask *v20;
  objc_super v22;

  v10 = (void *)MEMORY[0x1E0D28678];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "sharedPreferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferenceForKey:", CFSTR("AccessoryReaderWriterMessageDefaultTimeout"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  v22.receiver = self;
  v22.super_class = (Class)HMDHAPAccessoryRemoteReadTask;
  v20 = -[HMDHAPAccessoryRemoteOperationTask initWithContext:remoteMessageName:requests:delegateDevice:timeout:completion:](&v22, sel_initWithContext_remoteMessageName_requests_delegateDevice_timeout_completion_, v14, CFSTR("kMultipleCharacteristicReadRequestKey"), v13, v12, v11, v19);

  return v20;
}

- (BOOL)_appendServiceListWithRequest:(id)a3 serviceList:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "characteristic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_mutableArrayForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v12, v13);

  }
  objc_msgSend(v12, "addObject:", v10);

  return 0;
}

@end
