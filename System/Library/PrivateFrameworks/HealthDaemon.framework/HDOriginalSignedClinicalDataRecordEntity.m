@implementation HDOriginalSignedClinicalDataRecordEntity

+ (id)databaseTable
{
  return CFSTR("original_signed_clinical_data_records");
}

+ (id)allColumns
{
  return &unk_1E6DFA580;
}

+ (id)allProperties
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E6DFA598);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", CFSTR("gateway.external_id"));
  return v2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 19;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_95;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("gateway.external_id")))
  {
    v5 = (void *)MEMORY[0x1E0D29870];
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDOriginalSignedClinicalDataRecordEntity, "disambiguatedDatabaseTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = *MEMORY[0x1E0D29618];
    objc_msgSend(v5, "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v6, v7, CFSTR("account"), CFSTR("account_id"), *MEMORY[0x1E0D29618]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D29870], "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", CFSTR("account"), objc_opt_class(), CFSTR("gateway"), CFSTR("gateway_id"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v9, v10, 0);

  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___HDOriginalSignedClinicalDataRecordEntity;
    objc_msgSendSuper2(&v13, sel_joinClausesForProperty_, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  +[HDHealthEntity defaultForeignKey](HDClinicalAccountEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("account_id");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("account_id");
  v3[1] = CFSTR("uniqueness_checksum");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (id)checkConstraints
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D298A8], "checkConstraintWithSQL:", CFSTR("(raw_content IS NULL AND deleted == 1) OR (raw_content IS NOT NULL AND deleted == 0)"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)existingEntityWithSyncIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v14;

  v8 = a3;
  v14 = 0;
  objc_msgSend(a1, "entityWithSyncIdentifier:database:error:", v8, a4, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  v11 = v10;
  if (v9)
  {
    v12 = v9;
  }
  else if (v10)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 118, CFSTR("original signed clinical data record with sync identifier %@ not found"), v8);
  }

  return v9;
}

+ (id)entityWithSyncIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = a4;
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("sync_identifier"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "anyInDatabase:predicate:error:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = v11;

  return v11;
}

@end
