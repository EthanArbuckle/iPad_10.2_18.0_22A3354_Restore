@implementation HDDeviceUnprotectedKeyValueStorageEntryEntity

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDDeviceKeyValueStorageEntryEntityColumnDefinitions_258;
}

+ (id)databaseTable
{
  return CFSTR("kv_device_storage");
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)_propertiesForEntity
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("sync_identity_id");
  v3[1] = CFSTR("device_record_id");
  v3[2] = CFSTR("domain");
  v3[3] = CFSTR("key");
  v3[4] = CFSTR("value");
  v3[5] = CFSTR("date_modified");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("device_record_id");
  +[HDHealthEntity defaultForeignKey](HDDeviceContextEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)binderHandlerForBinder:(HDSQLiteStatementBinder *)a3 key:(id)a4 domain:(id)a5 object:(id)a6 syncEntityIdentity:(int64_t)a7 deviceContext:(int64_t)a8 modificationDate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;

  v15 = a9;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  MEMORY[0x1BCCAB114](a3, CFSTR("sync_identity_id"), a7);
  MEMORY[0x1BCCAB114](a3, CFSTR("device_record_id"), a8);
  MEMORY[0x1BCCAB144](a3, CFSTR("domain"), v17);

  MEMORY[0x1BCCAB144](a3, CFSTR("key"), v18);
  MEMORY[0x1BCCAB0D8](a3, CFSTR("value"), v16);

  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  JUMPOUT(0x1BCCAB0F0);
}

+ (void)binderHandlerForBinder:(HDSQLiteStatementBinder *)a3 syncEntityIdentity:(int64_t)a4 deviceContext:(int64_t)a5
{
  MEMORY[0x1BCCAB114](a3, CFSTR("sync_identity_id"), a4);
  JUMPOUT(0x1BCCAB114);
}

@end
