@implementation _HKFitnessFriendActivitySnapshot(HDCodingSupport)

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "codableRepresentationForSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addFitnessFriendActivitySnapshots:", v5);

  return v5 != 0;
}

- (HDCodableFitnessFriendActivitySnapshot)codableRepresentationForSync
{
  HDCodableFitnessFriendActivitySnapshot *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v2 = objc_alloc_init(HDCodableFitnessFriendActivitySnapshot);
  v12.receiver = a1;
  v12.super_class = (Class)&off_1EF223E98;
  objc_msgSendSuper2(&v12, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableFitnessFriendActivitySnapshot setSample:](v2, "setSample:", v3);
  objc_msgSend(a1, "friendUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_dataForUUIDBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableFitnessFriendActivitySnapshot setFriendUUID:](v2, "setFriendUUID:", v5);

  objc_msgSend(a1, "sourceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_dataForUUIDBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableFitnessFriendActivitySnapshot setSourceUUID:](v2, "setSourceUUID:", v7);

  objc_msgSend(a1, "activeHours");
  -[HDCodableFitnessFriendActivitySnapshot setActiveHours:](v2, "setActiveHours:");
  objc_msgSend(a1, "activeHoursGoal");
  -[HDCodableFitnessFriendActivitySnapshot setActiveHoursGoal:](v2, "setActiveHoursGoal:");
  objc_msgSend(a1, "briskMinutes");
  -[HDCodableFitnessFriendActivitySnapshot setBriskMinutes:](v2, "setBriskMinutes:");
  objc_msgSend(a1, "briskMinutesGoal");
  -[HDCodableFitnessFriendActivitySnapshot setBriskMinutesGoal:](v2, "setBriskMinutesGoal:");
  objc_msgSend(a1, "energyBurned");
  -[HDCodableFitnessFriendActivitySnapshot setEnergyBurned:](v2, "setEnergyBurned:");
  objc_msgSend(a1, "energyBurnedGoal");
  -[HDCodableFitnessFriendActivitySnapshot setEnergyBurnedGoal:](v2, "setEnergyBurnedGoal:");
  objc_msgSend(a1, "mmv");
  -[HDCodableFitnessFriendActivitySnapshot setMmv:](v2, "setMmv:");
  objc_msgSend(a1, "mmg");
  -[HDCodableFitnessFriendActivitySnapshot setMmg:](v2, "setMmg:");
  -[HDCodableFitnessFriendActivitySnapshot setAmm:](v2, "setAmm:", objc_msgSend(a1, "amm"));
  objc_msgSend(a1, "walkingAndRunningDistance");
  -[HDCodableFitnessFriendActivitySnapshot setWalkingAndRunningDistance:](v2, "setWalkingAndRunningDistance:");
  objc_msgSend(a1, "stepCount");
  -[HDCodableFitnessFriendActivitySnapshot setStepCount:](v2, "setStepCount:");
  -[HDCodableFitnessFriendActivitySnapshot setSnapshotIndex:](v2, "setSnapshotIndex:", objc_msgSend(a1, "snapshotIndex"));
  objc_msgSend(a1, "snapshotUploadedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  -[HDCodableFitnessFriendActivitySnapshot setUploadedDate:](v2, "setUploadedDate:");

  objc_msgSend(a1, "pushCount");
  -[HDCodableFitnessFriendActivitySnapshot setPushCount:](v2, "setPushCount:");
  -[HDCodableFitnessFriendActivitySnapshot setWheelchairUse:](v2, "setWheelchairUse:", objc_msgSend(a1, "wheelchairUse"));
  objc_msgSend(a1, "timeZoneOffsetFromUTCForNoon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "timeZoneOffsetFromUTCForNoon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableFitnessFriendActivitySnapshot setTimeZoneOffsetFromUTCForNoon:](v2, "setTimeZoneOffsetFromUTCForNoon:", objc_msgSend(v10, "integerValue"));

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
