@implementation CKRecord

id __100__CKRecord_BRCSerializationAdditions___locateSideCarServerZone_withShareAliasReference_withSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newServerItemFromPQLResultSet:error:", a2, a3);
}

void __102__CKRecord_BRCSerializationAdditions__processAppLibraryDataWithMovedZoneNames_serverZone_isDeltaSync___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "clientZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPrivateZone");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asPrivateClientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultAppLibrary");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(a1 + 40), "hasChainPCS") & 1) != 0)
    {
      v6 = 134217730;
    }
    else
    {
      objc_msgSend(v11, "clearStateBits:", 0x8000000);
      v6 = 2;
    }
    objc_msgSend(v11, "setStateBits:", v6);
    objc_msgSend(*(id *)(a1 + 40), "_processSaltingOnAppLibrary:", v11);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("countMetrics"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "rootQuotaUsage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9 || (v10 = *(unsigned __int8 *)(a1 + 48), v9, v10))
          objc_msgSend(v11, "setRootQuotaUsage:", v8);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "_saveAppLibraryIfNecessary:", v11);

  }
}

void __102__CKRecord_BRCSerializationAdditions__processAppLibraryDataWithMovedZoneNames_serverZone_isDeltaSync___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  id v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasChainPCS") & 1) != 0)
  {
    v2 = 134217730;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "clearStateBits:", 0x8000000);
    v2 = 2;
  }
  objc_msgSend(*(id *)(a1 + 40), "setStateBits:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_processSaltingOnAppLibrary:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("countMetrics"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "rootQuotaUsage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4 || (v5 = *(unsigned __int8 *)(a1 + 48), v4, v5))
        objc_msgSend(*(id *)(a1 + 40), "setRootQuotaUsage:", v3);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_saveAppLibraryIfNecessary:", *(_QWORD *)(a1 + 40));

}

void __84__CKRecord_BRCContainerMetadataAdditions__brc_containerMetadataRecordWithContainer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  NSObject *v15;
  __int16 v16;
  NSObject *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (-[NSObject isFileURL](v6, "isFileURL") & 1) != 0)
  {
    v13 = 0;
    v7 = -[NSObject checkResourceIsReachableAndReturnError:](v6, "checkResourceIsReachableAndReturnError:", &v13);
    v8 = v13;
    if ((v7 & 1) != 0)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94BB8]), "initWithFileURL:", v6);
      if (v9)
      {
        v10 = *(void **)(a1 + 32);
        BRContainerIconCKAssetKeyForName();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

      }
    }
    else
    {
      brc_bread_crumbs();
      v9 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v15 = v6;
        v16 = 2112;
        v17 = v8;
        v18 = 2112;
        v19 = v9;
        _os_log_fault_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: icon doesn't exist anymore at %@ - %@%@", buf, 0x20u);
      }

    }
  }
  else
  {
    brc_bread_crumbs();
    v8 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v8;
      _os_log_fault_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid key %@ and obj %@%@", buf, 0x20u);
    }
  }

}

@end
