@implementation HMDHAPAccessoryPrimaryResidentWriteTask

- (id)_makeRemoteWithFallbackTaskWithRequests:(id)a3 delegateDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDHAPAccessoryRemoteWriteWithLocalFallbackTask *v11;
  void *v12;
  uint64_t v13;
  HMDHAPAccessoryRemoteWriteWithLocalFallbackTask *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [HMDHAPAccessoryRemoteWriteWithLocalFallbackTask alloc];
  -[HMDHAPAccessoryTask context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "na_map:", &__block_literal_global_465);

  v14 = -[HMDHAPAccessoryRemoteOperationWithLocalFallbackTask initWithContext:requests:delegateDevice:completion:](v11, "initWithContext:requests:delegateDevice:completion:", v12, v13, v9, v8);
  return v14;
}

- (id)_makeLocalTaskWithRequests:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HMDHAPAccessoryLocalWriteTask *v8;
  void *v9;
  HMDHAPAccessoryLocalWriteTask *v10;

  v6 = a4;
  v7 = a3;
  v8 = [HMDHAPAccessoryLocalWriteTask alloc];
  -[HMDHAPAccessoryTask context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDHAPAccessoryTask initWithContext:requests:completion:](v8, "initWithContext:requests:completion:", v9, v7, v6);

  return v10;
}

@end
