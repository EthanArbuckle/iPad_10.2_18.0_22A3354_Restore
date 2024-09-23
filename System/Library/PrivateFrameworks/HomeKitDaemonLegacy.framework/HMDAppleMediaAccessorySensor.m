@implementation HMDAppleMediaAccessorySensor

+ (Class)transactionClass
{
  return (Class)objc_opt_class();
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  HMDAppleMediaAccessorySensorModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAppleMediaAccessorySensorModel *v9;

  v5 = [HMDAppleMediaAccessorySensorModel alloc];
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  return v9;
}

@end
