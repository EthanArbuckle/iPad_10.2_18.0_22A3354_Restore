@implementation _HKFitnessFriendAchievement(CloudKitCodingSupport)

- (ASCodableCloudKitAchievement)codableAchievement
{
  ASCodableCloudKitAchievement *v2;
  void *v3;
  void *v4;
  id v5;
  _BYTE *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = objc_alloc_init(ASCodableCloudKitAchievement);
  _ASCodableCloudKitSampleForSample(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitAchievement setSample:](v2, "setSample:", v3);

  objc_msgSend(a1, "completedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[ASCodableCloudKitAchievement setCompletedDate:](v2, "setCompletedDate:");

  objc_msgSend(a1, "value");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (_BYTE *)objc_msgSend(v5, "objCType");
  if (!v6)
  {

    goto LABEL_5;
  }
  v7 = *v6 & 0xFD;

  if (v7 != 100)
  {
LABEL_5:
    objc_msgSend(a1, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCodableCloudKitAchievement setIntValue:](v2, "setIntValue:", objc_msgSend(v8, "longLongValue"));
    goto LABEL_6;
  }
  objc_msgSend(a1, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  -[ASCodableCloudKitAchievement setDoubleValue:](v2, "setDoubleValue:");
LABEL_6:

  objc_msgSend(a1, "templateUniqueName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitAchievement setWorkoutActivityType:](v2, "setWorkoutActivityType:", ACHWorkoutActivityTypeForTemplateUniqueName());

  objc_msgSend(a1, "templateUniqueName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ACHLegacyDefinitionIdentifierForTemplateUniqueName();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitAchievement setDefinitionIdentifier:](v2, "setDefinitionIdentifier:", v11);

  objc_msgSend(a1, "templateUniqueName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitAchievement setTemplateUniqueName:](v2, "setTemplateUniqueName:", v12);

  return v2;
}

- (id)recordWithZoneID:()CloudKitCodingSupport recordEncryptionType:
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = (objc_class *)MEMORY[0x24BDB91E8];
  v7 = a3;
  v8 = [v6 alloc];
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("ActivitySharingAchievement"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithRecordName:zoneID:", v11, v7);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("ActivitySharingAchievement"), v12);
  _ASUpdateSchemaVersionOnRecord(2, v13, a4);
  objc_msgSend(a1, "codableAchievement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encryptedValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("EncryptedData"));

  return v13;
}

+ (id)fitnessFriendAchievementWithRecord:()CloudKitCodingSupport friendUUID:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  ASCodableCloudKitAchievement *v12;

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
      v12 = -[ASCodableCloudKitAchievement initWithData:]([ASCodableCloudKitAchievement alloc], "initWithData:", v10);
      objc_msgSend(a1, "fitnessFriendAchievementWithCodableAchievement:friendUUID:", v12, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
        +[_HKFitnessFriendAchievement(CloudKitCodingSupport) fitnessFriendAchievementWithRecord:friendUUID:].cold.1();
      v11 = 0;
    }

  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
      +[_HKFitnessFriendAchievement(CloudKitCodingSupport) fitnessFriendAchievementWithRecord:friendUUID:].cold.2();
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)fitnessFriendAchievementWithCodableAchievement:()CloudKitCodingSupport
{
  return objc_msgSend(a1, "_fitnessFriendAchievementWithCodableAchievement:friendUUID:", a3, 0);
}

+ (id)_fitnessFriendAchievementWithCodableAchievement:()CloudKitCodingSupport friendUUID:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v5, "completedDate");
  objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasTemplateUniqueName"))
  {
    objc_msgSend(v5, "templateUniqueName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
LABEL_3:
      v10 = objc_msgSend(v5, "hasDoubleValue");
      v11 = (void *)MEMORY[0x24BDD16E0];
      if ((v10 & 1) != 0)
      {
        objc_msgSend(v5, "doubleValue");
        objc_msgSend(v11, "numberWithDouble:");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v5, "intValue"));
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD41E8], "achievementWithTemplateUniqueName:completedDate:value:friendUUID:", v9, v8, v15, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BDD1880];
      objc_msgSend(v5, "sample");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hk_UUIDWithData:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "_setUUID:", v19);
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(v5, "definitionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workoutActivityType");
    ACHTemplateUniqueNameForLegacyAchievementInfo();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_3;
  }
  ASLoggingInitialize();
  v13 = (void *)ASLogCloudKit;
  if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
    +[_HKFitnessFriendAchievement(CloudKitCodingSupport) _fitnessFriendAchievementWithCodableAchievement:friendUUID:].cold.1(v13);
  v14 = 0;
LABEL_11:

  return v14;
}

+ (void)fitnessFriendAchievementWithRecord:()CloudKitCodingSupport friendUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21381F000, v0, v1, "Achievement does not have any encrypted data, not decoding.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)fitnessFriendAchievementWithRecord:()CloudKitCodingSupport friendUUID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21381F000, v0, v1, "Achievement record schema version (%ld) is not current schema version (%ld), ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)_fitnessFriendAchievementWithCodableAchievement:()CloudKitCodingSupport friendUUID:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "definitionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_21381F000, v1, v3, "Codable achievement had no templateUniqueName and an unknown or missing definitionIdentifier: %{public}@", v4);

  OUTLINED_FUNCTION_11();
}

@end
