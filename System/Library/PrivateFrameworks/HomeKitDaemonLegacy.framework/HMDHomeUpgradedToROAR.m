@implementation HMDHomeUpgradedToROAR

+ (id)modelIDForHome:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(CFSTR("HMDROARModelUUIDSalt"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "hmf_UUIDWithNamespace:data:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)defaultModelForHome:(id)a3
{
  id v4;
  HMDHomeUpgradedToROAR *v5;
  void *v6;
  void *v7;
  HMDHomeUpgradedToROAR *v8;

  v4 = a3;
  v5 = [HMDHomeUpgradedToROAR alloc];
  objc_msgSend(a1, "modelIDForHome:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v7);
  return v8;
}

+ (id)properties
{
  return (id)MEMORY[0x1E0C9AA70];
}

@end
