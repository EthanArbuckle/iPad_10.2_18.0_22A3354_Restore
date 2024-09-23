@implementation HDOntologyMedsScanningResourcesImporter

+ (BOOL)canImportEntry:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "schemaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CB5748];
  if (v4 == (void *)*MEMORY[0x1E0CB5748])
  {
    LOBYTE(v5) = objc_msgSend(v3, "schemaVersion") == 2;
  }
  else if (v5)
  {
    objc_msgSend(v3, "schemaType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v5))
      LOBYTE(v5) = objc_msgSend(v3, "schemaVersion") == 2;
    else
      LOBYTE(v5) = 0;

  }
  return v5;
}

+ (BOOL)importOntologyShardEntry:(id)a3 shardRegistry:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  char v16;
  void *v17;
  uint64_t v18;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(a1, "canImportEntry:", v8) & 1) != 0)
  {
    objc_msgSend(a1, "_visionAssetPathWithRegistry:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    if (objc_msgSend(v11, "fileExistsAtPath:", v10)
      && !objc_msgSend(v11, "removeItemAtPath:error:", v10, a5))
    {
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, a5);

    if (!v13)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "unzipStagedShardFileForEntry:toURL:error:", v8, v14, a5);

    if (v15)
      v16 = objc_msgSend(a1, "_validateVisionAssetIntegrity:error:", v10, a5);
    else
LABEL_8:
      v16 = 0;

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = objc_opt_class();
    objc_msgSend(v8, "schemaType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hk_assignError:code:format:", a5, 3, CFSTR("%@ cannot import entry with schema type (%@, %ld)"), v18, v10, objc_msgSend(v8, "schemaVersion"));
    v16 = 0;
  }

  return v16;
}

+ (id)willPruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(a3, "hk_filter:", &__block_literal_global_5, a4, a5, a6);
}

uint64_t __88__HDOntologyMedsScanningResourcesImporter_willPruneEntries_options_shardRegistry_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "desiredState") == 3)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "schemaType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5748]);

  }
  return v3;
}

+ (id)pruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6
{
  id v9;
  id v10;

  v9 = a3;
  if (objc_msgSend(a1, "_deleteVisionAssetWithShardRegistry:reason:error:", a5, CFSTR("Prune request"), a6))v10 = v9;
  else
    v10 = 0;

  return v10;
}

+ (int64_t)purgeableSpaceForUrgency:(int)a3 shardRegistry:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3 != 4)
    return 0;
  objc_msgSend(a1, "_visionAssetPathWithRegistry:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "hk_fileSizeWithError:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = v8;
  if (v7 || (objc_msgSend(v8, "hk_isCocoaNoSuchFileError") & 1) != 0)
  {
    v10 = objc_msgSend(v7, "longLongValue");
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v15 = a1;
      v16 = 2114;
      v17 = v5;
      v18 = 2114;
      v19 = v9;
      _os_log_error_impl(&dword_1B815E000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Error getting size of '%{public}@': %{public}@", buf, 0x20u);
    }

    v10 = 0;
  }

  return v10;
}

+ (int64_t)purgeSpaceForUrgency:(int)a3 shardRegistry:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = objc_msgSend(a1, "purgeableSpaceForUrgency:shardRegistry:", v4, v6);
  if (v7 < 1)
  {
    v9 = 0;
  }
  else
  {
    v8 = v7;
    if (objc_msgSend(a1, "_deleteVisionAssetWithShardRegistry:reason:error:", v6, CFSTR("Max Cache Delete Urgency"), 0))v9 = v8;
    else
      v9 = 0;
  }

  return v9;
}

+ (id)_visionAssetPathWithRegistry:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("vision"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)_validateVisionAssetIntegrity:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (objc_class *)MEMORY[0x1E0CB3620];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6E11508);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isSubsetOfSet:", v10);
    if ((v11 & 1) == 0)
    {
      objc_msgSend(v9, "hk_minus:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(" - "));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 106, CFSTR("Vision asset missing required file: %@"), v14);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)_deleteVisionAssetWithShardRegistry:(id)a3 reason:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  char v12;
  id v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  id v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a1, "_visionAssetPathWithRegistry:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  _HKInitializeLogging();
  HKLogMedication();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v21 = a1;
    v22 = 2114;
    v23 = v9;
    v24 = 2114;
    v25 = v8;
    _os_log_impl(&dword_1B815E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing asset directory '%{public}@' for \"%{public}@\", buf, 0x20u);
  }

  v19 = 0;
  v12 = objc_msgSend(v10, "removeItemAtPath:error:", v9, &v19);
  v13 = v19;
  v14 = v13;
  if ((v12 & 1) != 0 || (objc_msgSend(v13, "hk_isCocoaNoSuchFileError") & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v21 = a1;
      v22 = 2114;
      v23 = v9;
      v24 = 2114;
      v25 = v8;
      v26 = 2114;
      v27 = v14;
      _os_log_error_impl(&dword_1B815E000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Error removing asset directory for \"%{public}@\" '%{public}@': %{public}@", buf, 0x2Au);
    }

    v17 = v14;
    if (v17)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v17);
      else
        _HKLogDroppedError();
    }

    v15 = 0;
  }

  return v15;
}

@end
