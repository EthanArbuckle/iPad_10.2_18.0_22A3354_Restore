@implementation MCHasMigrated

void __MCHasMigrated_block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (!kMCMetaStopFilteringGrandfatheredRestrictions_block_invoke_migrationCheckQueueHasMigrated)
  {
    MCProductBuildVersion();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MCLegacyMetadataFilePath();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    if (v6)
    {
      kMCMetaStopFilteringGrandfatheredRestrictions_block_invoke_migrationCheckQueueHasMigrated = 0;
LABEL_19:

      v2 = kMCMetaStopFilteringGrandfatheredRestrictions_block_invoke_migrationCheckQueueHasMigrated;
      goto LABEL_20;
    }
    v7 = (void *)MEMORY[0x1E0C99D50];
    MCSystemMetadataFilePath();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataWithContentsOfFile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v9, 0, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
LABEL_10:
        objc_msgSend(v10, "objectForKey:", CFSTR("LastMigratedBuild"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v11, "isEqualToString:", v3))
        {
          kMCMetaStopFilteringGrandfatheredRestrictions_block_invoke_migrationCheckQueueHasMigrated = 0;
          goto LABEL_18;
        }
        v12 = (void *)MEMORY[0x1E0C99D50];
        MCUserMetadataFilePath();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dataWithContentsOfFile:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v14, 0, 0, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
            goto LABEL_16;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_16;

        }
        v15 = 0;
LABEL_16:
        objc_msgSend(v15, "objectForKey:", CFSTR("LastMigratedBuild"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        kMCMetaStopFilteringGrandfatheredRestrictions_block_invoke_migrationCheckQueueHasMigrated = objc_msgSend(v16, "isEqualToString:", v3);
LABEL_18:

        goto LABEL_19;
      }

    }
    v10 = 0;
    goto LABEL_10;
  }
  v2 = 1;
LABEL_20:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
}

@end
