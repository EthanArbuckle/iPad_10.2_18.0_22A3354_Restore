@implementation _HKFitnessFriendAchievement(HDCodingSupport)

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "codableRepresentationForSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addFitnessFriendAchievements:", v5);

  return v5 != 0;
}

- (HDCodableFitnessFriendAchievement)codableRepresentationForSync
{
  HDCodableFitnessFriendAchievement *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v2 = objc_alloc_init(HDCodableFitnessFriendAchievement);
  v11.receiver = a1;
  v11.super_class = (Class)&off_1EF223928;
  objc_msgSendSuper2(&v11, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableFitnessFriendAchievement setSample:](v2, "setSample:", v3);
  objc_msgSend(a1, "friendUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_dataForUUIDBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableFitnessFriendAchievement setFriendUUID:](v2, "setFriendUUID:", v5);

  objc_msgSend(a1, "templateUniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableFitnessFriendAchievement setTemplateUniqueName:](v2, "setTemplateUniqueName:", v6);

  objc_msgSend(a1, "completedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  -[HDCodableFitnessFriendAchievement setCompletedDate:](v2, "setCompletedDate:");

  objc_msgSend(a1, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "hk_hasFloatingPointValue"))
    {
      objc_msgSend(v9, "doubleValue");
      -[HDCodableFitnessFriendAchievement setDoubleValue:](v2, "setDoubleValue:");
    }
    else
    {
      -[HDCodableFitnessFriendAchievement setIntValue:](v2, "setIntValue:", objc_msgSend(v9, "longLongValue"));
    }
  }

  return v2;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend([a1 alloc], "_init");
    if (objc_msgSend(v5, "applyToObject:", v6))
    {
      v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      objc_msgSend(v6, "_validateWithConfiguration:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = 0;
      else
        v10 = v6;
      v11 = v10;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
