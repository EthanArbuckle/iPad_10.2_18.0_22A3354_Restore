@implementation _HKFitnessFriendWorkout(CloudKitCodingSupport)

- (ASCodableCloudKitWorkout)codableWorkout
{
  ASCodableCloudKitWorkout *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int IsValidForGoal;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v2 = objc_alloc_init(ASCodableCloudKitWorkout);
  _ASCodableCloudKitSampleForSample(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitWorkout setSample:](v2, "setSample:", v3);

  -[ASCodableCloudKitWorkout setType:](v2, "setType:", objc_msgSend(a1, "workoutActivityType"));
  objc_msgSend(a1, "duration");
  -[ASCodableCloudKitWorkout setDuration:](v2, "setDuration:");
  objc_msgSend(a1, "totalEnergyBurned");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "totalEnergyBurned");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _HKWorkoutCanonicalEnergyBurnedUnit();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValueForUnit:", v6);
    -[ASCodableCloudKitWorkout setTotalEnergyBurnedInCanonicalUnit:](v2, "setTotalEnergyBurnedInCanonicalUnit:");

  }
  objc_msgSend(a1, "totalBasalEnergyBurned");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "totalBasalEnergyBurned");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _HKWorkoutCanonicalEnergyBurnedUnit();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValueForUnit:", v9);
    -[ASCodableCloudKitWorkout setTotalBasalEnergyBurnedInCanonicalUnit:](v2, "setTotalBasalEnergyBurnedInCanonicalUnit:");

  }
  objc_msgSend(a1, "totalDistance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "totalDistance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _HKWorkoutCanonicalDistanceUnit();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValueForUnit:", v12);
    -[ASCodableCloudKitWorkout setTotalDistanceInCanonicalUnit:](v2, "setTotalDistanceInCanonicalUnit:");

  }
  -[ASCodableCloudKitWorkout setGoalType:](v2, "setGoalType:", objc_msgSend(a1, "goalType"));
  objc_msgSend(a1, "goal");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(a1, "goalType");
    IsValidForGoal = _HKWorkoutGoalTypeIsValidForGoal();

    if (IsValidForGoal)
    {
      objc_msgSend(a1, "goal");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "goalType");
      _HKWorkoutCanonicalUnitForGoalType();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValueForUnit:", v17);
      -[ASCodableCloudKitWorkout setGoalInCanonicalUnit:](v2, "setGoalInCanonicalUnit:");

    }
  }
  objc_msgSend(a1, "bundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitWorkout setBundleID:](v2, "setBundleID:", v18);

  -[ASCodableCloudKitWorkout setIsWatchWorkout:](v2, "setIsWatchWorkout:", objc_msgSend(a1, "isWatchWorkout"));
  -[ASCodableCloudKitWorkout setIsIndoorWorkout:](v2, "setIsIndoorWorkout:", objc_msgSend(a1, "isIndoorWorkout"));
  objc_msgSend(a1, "deviceManufacturer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitWorkout setDeviceManufacturer:](v2, "setDeviceManufacturer:", v19);

  objc_msgSend(a1, "deviceModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitWorkout setDeviceModel:](v2, "setDeviceModel:", v20);

  objc_msgSend(a1, "seymourCatalogWorkoutIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitWorkout setSeymourCatalogWorkoutIdentifier:](v2, "setSeymourCatalogWorkoutIdentifier:", v21);

  objc_msgSend(a1, "seymourMediaType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitWorkout setSeymourMediaType:](v2, "setSeymourMediaType:", v22);

  return v2;
}

- (id)recordWithZoneID:()CloudKitCodingSupport recordEncryptionType:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(a1, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ASWorkoutRecordIDForUUID(v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("ActivitySharingWorkout"), v8);
  _ASUpdateSchemaVersionOnRecord(2, v9, a4);
  objc_msgSend(a1, "codableWorkout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encryptedValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("EncryptedData"));

  ASLoggingInitialize();
  if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_DEBUG))
    -[_HKFitnessFriendWorkout(CloudKitCodingSupport) recordWithZoneID:recordEncryptionType:].cold.2();
  ASLoggingInitialize();
  v13 = (void *)ASLogCloudKit;
  if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_DEBUG))
    -[_HKFitnessFriendWorkout(CloudKitCodingSupport) recordWithZoneID:recordEncryptionType:].cold.1(v13);

  return v9;
}

+ (id)fitnessFriendWorkoutWithRecord:()CloudKitCodingSupport friendUUID:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  ASCodableCloudKitWorkout *v12;

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
      v12 = -[ASCodableCloudKitWorkout initWithData:]([ASCodableCloudKitWorkout alloc], "initWithData:", v10);
      objc_msgSend(a1, "fitnessFriendWorkoutWithCodableWorkout:friendUUID:", v12, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
        +[_HKFitnessFriendWorkout(CloudKitCodingSupport) fitnessFriendWorkoutWithRecord:friendUUID:].cold.1();
      v11 = 0;
    }

  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
      +[_HKFitnessFriendWorkout(CloudKitCodingSupport) fitnessFriendWorkoutWithRecord:friendUUID:].cold.2();
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)fitnessFriendWorkoutWithCodableWorkout:()CloudKitCodingSupport
{
  return objc_msgSend(a1, "_fitnessFriendWorkoutWithCodableWorkout:friendUUID:", a3, 0);
}

+ (id)_fitnessFriendWorkoutWithCodableWorkout:()CloudKitCodingSupport friendUUID:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  char v32;
  double v33;
  double v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD1880];
  v51 = a4;
  objc_msgSend(v5, "sample");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_UUIDWithData:", v8);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = objc_msgSend(v5, "type");
  v9 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v5, "sample");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v5, "sample");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endDate");
  objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
  v14 = objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasTotalEnergyBurnedInCanonicalUnit"))
  {
    v15 = (void *)MEMORY[0x24BDD3E50];
    _HKWorkoutCanonicalEnergyBurnedUnit();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "quantityWithUnit:doubleValue:", v16, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "isAmm") & 1) == 0)
    {
      v18 = (void *)MEMORY[0x24BDD3E50];
      _HKWorkoutCanonicalEnergyBurnedUnit();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "totalEnergyBurnedInCanonicalUnit");
      objc_msgSend(v18, "quantityWithUnit:doubleValue:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v20;
    }
  }
  else
  {
    v17 = 0;
  }
  if (objc_msgSend(v5, "hasTotalBasalEnergyBurnedInCanonicalUnit"))
  {
    v21 = (void *)MEMORY[0x24BDD3E50];
    _HKWorkoutCanonicalEnergyBurnedUnit();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "quantityWithUnit:doubleValue:", v22, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "isAmm") & 1) == 0)
    {
      v24 = (void *)MEMORY[0x24BDD3E50];
      _HKWorkoutCanonicalEnergyBurnedUnit();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "totalBasalEnergyBurnedInCanonicalUnit");
      objc_msgSend(v24, "quantityWithUnit:doubleValue:", v25);
      v26 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v26;
    }
  }
  else
  {
    v23 = 0;
  }
  if (objc_msgSend(v5, "hasTotalDistanceInCanonicalUnit"))
  {
    v27 = (void *)MEMORY[0x24BDD3E50];
    _HKWorkoutCanonicalDistanceUnit();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "totalDistanceInCanonicalUnit");
    objc_msgSend(v27, "quantityWithUnit:doubleValue:", v28);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v55 = 0;
  }
  v57 = (void *)v11;
  v52 = v17;
  v53 = (void *)v14;
  v56 = v23;
  v48 = objc_msgSend(v5, "goalType");
  if (objc_msgSend(v5, "hasGoalInCanonicalUnit"))
  {
    v29 = (void *)MEMORY[0x24BDD3E50];
    _HKWorkoutCanonicalUnitForGoalType();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "goalInCanonicalUnit");
    objc_msgSend(v29, "quantityWithUnit:doubleValue:", v30);
    v31 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = 0;
  }
  v32 = objc_msgSend(v5, "isIndoorWorkout");
  v47 = (void *)MEMORY[0x24BDD41F8];
  objc_msgSend(v5, "duration");
  v34 = v33;
  objc_msgSend(v5, "bundleID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v5, "isWatchWorkout");
  objc_msgSend(v5, "deviceManufacturer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceModel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v5, "amm");
  objc_msgSend(v5, "seymourCatalogWorkoutIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "seymourMediaType");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v46) = v32;
  LOBYTE(v46) = v36;
  v49 = (void *)v31;
  objc_msgSend(v47, "fitnessFriendworkoutWithActivityType:friendUUID:startDate:endDate:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:goalType:goal:bundleID:isWatchWorkout:isIndoorWorkout:deviceManufacturer:deviceModel:amm:seymourCatalogWorkoutIdentifier:seymourMediaType:", v50, v51, v57, v53, v52, v56, v34, v55, v48, v31, v35, v46, v37, v38, v39,
    v40,
    v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "_setUUID:", v54);
  objc_msgSend(v42, "workoutActivityType");
  if ((_HKWorkoutActivityTypeIsValid() & 1) == 0)
    objc_msgSend(v42, "setWorkoutActivityType:", 3000);
  ASLoggingInitialize();
  v43 = (void *)ASLogCloudKit;
  if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_DEBUG))
    +[_HKFitnessFriendWorkout(CloudKitCodingSupport) _fitnessFriendWorkoutWithCodableWorkout:friendUUID:].cold.2(v43, v42);
  ASLoggingInitialize();
  v44 = (void *)ASLogCloudKit;
  if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_DEBUG))
    +[_HKFitnessFriendWorkout(CloudKitCodingSupport) _fitnessFriendWorkoutWithCodableWorkout:friendUUID:].cold.1(v44);
  objc_msgSend(v42, "goalType");
  if ((_HKWorkoutGoalTypeIsValidForGoal() & 1) == 0)
    objc_msgSend(v42, "setGoal:", 0);

  return v42;
}

- (void)recordWithZoneID:()CloudKitCodingSupport recordEncryptionType:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "bundleID");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_14(&dword_21381F000, v3, v4, "BundleID: %@, isWatchWorkout: %{BOOL}d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

- (void)recordWithZoneID:()CloudKitCodingSupport recordEncryptionType:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_21381F000, v0, OS_LOG_TYPE_DEBUG, "Creating record for sending to cloud", v1, 2u);
  OUTLINED_FUNCTION_7();
}

+ (void)fitnessFriendWorkoutWithRecord:()CloudKitCodingSupport friendUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21381F000, v0, v1, "Workout does not have any encrypted data, not decoding.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)fitnessFriendWorkoutWithRecord:()CloudKitCodingSupport friendUUID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21381F000, v0, v1, "Workout record schema version (%ld) is not current schema version (%ld), ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)_fitnessFriendWorkoutWithCodableWorkout:()CloudKitCodingSupport friendUUID:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "bundleID");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_14(&dword_21381F000, v3, v4, "bundleID: %@, isWatchWorkout: %{BOOL}d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

+ (void)_fitnessFriendWorkoutWithCodableWorkout:()CloudKitCodingSupport friendUUID:.cold.2(void *a1, void *a2)
{
  NSObject *v2;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "friendUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_21381F000, v2, OS_LOG_TYPE_DEBUG, "Deserializing workout from CKRecord with entity UUID %{public}@ from CK: friendUUID: %{public}@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_5();
}

@end
