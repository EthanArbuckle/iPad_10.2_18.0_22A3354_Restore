@implementation DMCHasMDMMigrated

void __DMCHasMDMMigrated_block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  if (kMDMMetaLastMigratedBuildKey_block_invoke_migrationCheckQueueHasMDMMigrated)
  {
    v2 = 1;
    goto LABEL_12;
  }
  v3 = (void *)MEMORY[0x1E0C99D50];
  MCSystemMetadataFilePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0CB38B0], "DMCSafePropertyListWithData:options:format:error:", v5, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_7:
      v6 = 0;
    }
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("LastMDMMigratedBuild"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MCLegacyMetadataFilePath();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (v10)
  {
    kMDMMetaLastMigratedBuildKey_block_invoke_migrationCheckQueueHasMDMMigrated = 0;
  }
  else
  {
    +[DMCMobileGestalt buildVersion](DMCMobileGestalt, "buildVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    kMDMMetaLastMigratedBuildKey_block_invoke_migrationCheckQueueHasMDMMigrated = objc_msgSend(v7, "isEqualToString:", v11);

  }
  v2 = kMDMMetaLastMigratedBuildKey_block_invoke_migrationCheckQueueHasMDMMigrated;
LABEL_12:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
}

@end
