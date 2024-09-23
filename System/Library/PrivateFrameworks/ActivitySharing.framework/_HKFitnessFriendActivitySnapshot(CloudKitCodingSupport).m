@implementation _HKFitnessFriendActivitySnapshot(CloudKitCodingSupport)

- (ASCodableCloudKitActivitySnapshot)codableSnapshot
{
  ASCodableCloudKitActivitySnapshot *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(ASCodableCloudKitActivitySnapshot);
  _ASCodableCloudKitSampleForSample(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitActivitySnapshot setSample:](v2, "setSample:", v3);

  objc_msgSend(a1, "sourceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_dataForUUIDBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitActivitySnapshot setSourceUUID:](v2, "setSourceUUID:", v5);

  -[ASCodableCloudKitActivitySnapshot setSnapshotIndex:](v2, "setSnapshotIndex:", objc_msgSend(a1, "snapshotIndex"));
  objc_msgSend(a1, "timeZoneOffsetFromUTCForNoon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitActivitySnapshot setTimeZoneOffsetFromUTCForNoon:](v2, "setTimeZoneOffsetFromUTCForNoon:", objc_msgSend(v6, "longLongValue"));

  objc_msgSend(a1, "energyBurned");
  -[ASCodableCloudKitActivitySnapshot setEnergyBurned:](v2, "setEnergyBurned:");
  objc_msgSend(a1, "energyBurnedGoal");
  -[ASCodableCloudKitActivitySnapshot setEnergyBurnedGoal:](v2, "setEnergyBurnedGoal:");
  objc_msgSend(a1, "mmv");
  -[ASCodableCloudKitActivitySnapshot setMmv:](v2, "setMmv:");
  objc_msgSend(a1, "mmg");
  -[ASCodableCloudKitActivitySnapshot setMmg:](v2, "setMmg:");
  objc_msgSend(a1, "briskMinutes");
  -[ASCodableCloudKitActivitySnapshot setBriskMinutes:](v2, "setBriskMinutes:");
  objc_msgSend(a1, "briskMinutesGoal");
  -[ASCodableCloudKitActivitySnapshot setBriskMinutesGoal:](v2, "setBriskMinutesGoal:");
  objc_msgSend(a1, "activeHours");
  -[ASCodableCloudKitActivitySnapshot setActiveHours:](v2, "setActiveHours:");
  objc_msgSend(a1, "activeHoursGoal");
  -[ASCodableCloudKitActivitySnapshot setActiveHoursGoal:](v2, "setActiveHoursGoal:");
  objc_msgSend(a1, "walkingAndRunningDistance");
  -[ASCodableCloudKitActivitySnapshot setWalkingAndRunningDistance:](v2, "setWalkingAndRunningDistance:");
  objc_msgSend(a1, "stepCount");
  -[ASCodableCloudKitActivitySnapshot setStepCount:](v2, "setStepCount:");
  objc_msgSend(a1, "pushCount");
  -[ASCodableCloudKitActivitySnapshot setPushCount:](v2, "setPushCount:");
  -[ASCodableCloudKitActivitySnapshot setWheelchairUse:](v2, "setWheelchairUse:", objc_msgSend(a1, "wheelchairUse"));
  -[ASCodableCloudKitActivitySnapshot setAmm:](v2, "setAmm:", objc_msgSend(a1, "amm"));
  return v2;
}

- (id)recordWithZoneID:()CloudKitCodingSupport recordEncryptionType:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithLongLong:", objc_msgSend(a1, "snapshotIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sourceUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%lld-%@"), CFSTR("ActivitySharingActivitySnapshot"), objc_msgSend(v8, "longLongValue"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:zoneID:", v11, v7);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("ActivitySharingActivitySnapshot"), v12);
  _ASUpdateSchemaVersionOnRecord(2, v13, a4);
  objc_msgSend(a1, "codableSnapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encryptedValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("EncryptedData"));

  return v13;
}

+ (id)fitnessFriendActivitySnapshotWithRecord:()CloudKitCodingSupport friendUUID:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  ASCodableCloudKitActivitySnapshot *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (_ASCloudKitSchemaVersionForRecord(v6) == 2)
  {
    objc_msgSend(v6, "encryptedValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("EncryptedData"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (v10)
    {
      v12 = -[ASCodableCloudKitActivitySnapshot initWithData:]([ASCodableCloudKitActivitySnapshot alloc], "initWithData:", v10);
      objc_msgSend(v6, "modificationDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "fitnessFriendActivitySnapshotWithCodableSnapshot:friendUUID:uploadedDate:", v12, v7, v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
        +[_HKFitnessFriendActivitySnapshot(CloudKitCodingSupport) fitnessFriendActivitySnapshotWithRecord:friendUUID:].cold.1();
      v11 = 0;
    }

  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
      +[_HKFitnessFriendActivitySnapshot(CloudKitCodingSupport) fitnessFriendActivitySnapshotWithRecord:friendUUID:].cold.2();
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)fitnessFriendActivitySnapshotWithCodableSnapshot:()CloudKitCodingSupport
{
  return objc_msgSend(a1, "_fitnessFriendActivitySnapshotWithCodableSnapshot:friendUUID:uploadedDate:", a3, 0, 0);
}

+ (uint64_t)fitnessFriendActivitySnapshotWithCodableSnapshot:()CloudKitCodingSupport friendUUID:
{
  return objc_msgSend(a1, "_fitnessFriendActivitySnapshotWithCodableSnapshot:friendUUID:uploadedDate:", a3, a4, 0);
}

+ (id)_fitnessFriendActivitySnapshotWithCodableSnapshot:()CloudKitCodingSupport friendUUID:uploadedDate:
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v7 = (void *)MEMORY[0x24BDBCE60];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "sample");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v10, "sample");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endDate");
  objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v10, "sourceUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hk_UUIDWithData:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD41F0], "_fitnessFriendActivitySnapshotWithSnapshotIndex:startDate:endDate:sourceUUID:", objc_msgSend(v10, "snapshotIndex"), v12, v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFriendUUID:", v9);

  objc_msgSend(v19, "setSnapshotUploadedDate:", v8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v10, "timeZoneOffsetFromUTCForNoon"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTimeZoneOffsetFromUTCForNoon:", v20);

  objc_msgSend(v10, "energyBurned");
  objc_msgSend(v19, "setEnergyBurned:");
  objc_msgSend(v10, "energyBurnedGoal");
  objc_msgSend(v19, "setEnergyBurnedGoal:");
  objc_msgSend(v10, "mmv");
  objc_msgSend(v19, "setMmv:");
  objc_msgSend(v10, "mmg");
  objc_msgSend(v19, "setMmg:");
  objc_msgSend(v10, "briskMinutes");
  objc_msgSend(v19, "setBriskMinutes:");
  objc_msgSend(v10, "briskMinutesGoal");
  objc_msgSend(v19, "setBriskMinutesGoal:");
  objc_msgSend(v10, "activeHours");
  objc_msgSend(v19, "setActiveHours:");
  objc_msgSend(v10, "activeHoursGoal");
  objc_msgSend(v19, "setActiveHoursGoal:");
  objc_msgSend(v10, "walkingAndRunningDistance");
  objc_msgSend(v19, "setWalkingAndRunningDistance:");
  objc_msgSend(v10, "stepCount");
  objc_msgSend(v19, "setStepCount:");
  objc_msgSend(v10, "pushCount");
  objc_msgSend(v19, "setPushCount:");
  objc_msgSend(v19, "setWheelchairUse:", objc_msgSend(v10, "wheelchairUse"));
  v21 = objc_msgSend(v10, "amm");

  objc_msgSend(v19, "setAmm:", v21);
  return v19;
}

+ (void)fitnessFriendActivitySnapshotWithRecord:()CloudKitCodingSupport friendUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21381F000, v0, v1, "Activity Snapshot does not have any encrypted data, not decoding.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)fitnessFriendActivitySnapshotWithRecord:()CloudKitCodingSupport friendUUID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21381F000, v0, v1, "Activity Snapshot record schema version (%ld) is not current schema version (%ld), ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
