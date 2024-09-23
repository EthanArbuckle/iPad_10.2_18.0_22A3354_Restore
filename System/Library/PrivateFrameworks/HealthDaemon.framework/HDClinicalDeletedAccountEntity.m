@implementation HDClinicalDeletedAccountEntity

+ (id)databaseTable
{
  return CFSTR("clinical_deleted_accounts");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_62;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)uniquedColumns
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("sync_identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
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

@end
