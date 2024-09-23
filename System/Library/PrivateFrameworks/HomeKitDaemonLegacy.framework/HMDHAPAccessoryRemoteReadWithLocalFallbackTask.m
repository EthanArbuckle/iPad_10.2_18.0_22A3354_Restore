@implementation HMDHAPAccessoryRemoteReadWithLocalFallbackTask

- (id)_makeRemoteTaskWithRequests:(id)a3 delegateDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDHAPAccessoryRemoteReadTask *v11;
  void *v12;
  HMDHAPAccessoryRemoteReadTask *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [HMDHAPAccessoryRemoteReadTask alloc];
  -[HMDHAPAccessoryTask context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDHAPAccessoryRemoteReadTask initWithContext:requests:delegateDevice:completion:](v11, "initWithContext:requests:delegateDevice:completion:", v12, v10, v9, v8);

  return v13;
}

- (id)_makeLocalTaskWithRequests:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HMDHAPAccessoryLocalReadTask *v8;
  void *v9;
  HMDHAPAccessoryLocalReadTask *v10;

  v6 = a4;
  v7 = a3;
  v8 = [HMDHAPAccessoryLocalReadTask alloc];
  -[HMDHAPAccessoryTask context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDHAPAccessoryTask initWithContext:requests:completion:](v8, "initWithContext:requests:completion:", v9, v7, v6);

  return v10;
}

@end
