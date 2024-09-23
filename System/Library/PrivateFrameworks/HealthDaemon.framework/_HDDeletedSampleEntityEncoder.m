@implementation _HDDeletedSampleEntityEncoder

- (id)orderedProperties
{
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("uuid");
  v3[1] = CFSTR("creation_date");
  v3[2] = CFSTR("provenance");
  v3[3] = CFSTR("data_type");
  v3[4] = CFSTR("start_date");
  v3[5] = CFSTR("end_date");
  v3[6] = CFSTR("external_sync_ids.sid");
  v3[7] = CFSTR("external_sync_ids.version");
  v3[8] = CFSTR("external_sync_ids.object_code");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  HDCodableHealthObject *v6;
  void *v7;
  void *v8;
  void *v9;
  HDCodableSample *v10;
  uint64_t v11;
  uint64_t v12;
  HDCodableDeletedSample *v13;

  v6 = objc_alloc_init(HDCodableHealthObject);
  +[HDDeletedSampleEntity _externalSyncMetadataForRow:]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_codableMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableHealthObject setMetadataDictionary:](v6, "setMetadataDictionary:", v8);

  HDSQLiteColumnWithNameAsData();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableHealthObject setUuid:](v6, "setUuid:", v9);

  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableHealthObject setCreationDate:](v6, "setCreationDate:");
  if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    -[HDCodableHealthObject setExternalSyncObjectCode:](v6, "setExternalSyncObjectCode:", HDSQLiteColumnWithNameAsInt64());
  v10 = objc_alloc_init(HDCodableSample);
  -[HDCodableSample setObject:](v10, "setObject:", v6);
  -[HDCodableSample setDataType:](v10, "setDataType:", HDSQLiteColumnWithNameAsInt64());
  v11 = (int)HDSQLiteColumnWithName();
  if ((MEMORY[0x1BCCAB204](a4, v11) & 1) == 0)
  {
    MEMORY[0x1BCCAB1A4](a4, v11);
    -[HDCodableSample setStartDate:](v10, "setStartDate:");
  }
  v12 = (int)HDSQLiteColumnWithName();
  if ((MEMORY[0x1BCCAB204](a4, v12) & 1) == 0)
  {
    MEMORY[0x1BCCAB1A4](a4, v12);
    -[HDCodableSample setEndDate:](v10, "setEndDate:");
  }
  v13 = objc_alloc_init(HDCodableDeletedSample);
  -[HDCodableDeletedSample setSample:](v13, "setSample:", v10);

  return v13;
}

+ (int64_t)estimatedEncodedSize
{
  return 100;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  HDSQLiteColumnWithNameAsUUID();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB65B8];
  +[HDDeletedSampleEntity _externalSyncMetadataForRow:]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_deletedObjectWithUUID:metadata:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  return (char)a6;
}

@end
