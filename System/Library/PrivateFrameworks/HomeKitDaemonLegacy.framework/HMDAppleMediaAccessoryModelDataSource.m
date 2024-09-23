@implementation HMDAppleMediaAccessoryModelDataSource

- (id)modelforAccessory:(id)a3 changeType:(unint64_t)a4 uuid:(id)a5 parentUUID:(id)a6
{
  id v9;
  id v10;
  id v11;
  char isKindOfClass;
  __objc2_class *v13;
  id v14;
  char v15;
  uint64_t v16;
  void *v17;
  id v19;
  char v20;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v9 && (isKindOfClass & 1) != 0)
  {
    v13 = HMDAppleHomePodAccessoryModel;
LABEL_7:
    -[__objc2_class homePodAccessoryModelWithChangeType:uuid:parentUUID:](v13, "homePodAccessoryModelWithChangeType:uuid:parentUUID:", a4, v10, v11);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v17 = (void *)v16;
    goto LABEL_9;
  }
  v14 = v9;
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if (v9 && (v15 & 1) != 0)
  {
    v13 = HMDAppleHomePod_6_1_AccessoryModel;
    goto LABEL_7;
  }
  v19 = v14;
  objc_opt_class();
  v20 = objc_opt_isKindOfClass();

  v17 = 0;
  if (v9 && (v20 & 1) != 0)
  {
    +[HMDAppleMediaAccessoryModel appleMediaAccessoryModelWithChangeType:uuid:parentUUID:](HMDAppleMediaAccessoryModel, "appleMediaAccessoryModelWithChangeType:uuid:parentUUID:", a4, v10, v11);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:

  return v17;
}

+ (id)shortDescription
{
  return CFSTR("HMDAppleMediaAccessoryModelDataSource");
}

@end
