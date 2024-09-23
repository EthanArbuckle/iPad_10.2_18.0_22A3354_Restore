@implementation HMDHAPAccessoryPrimaryResidentReadTask

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
