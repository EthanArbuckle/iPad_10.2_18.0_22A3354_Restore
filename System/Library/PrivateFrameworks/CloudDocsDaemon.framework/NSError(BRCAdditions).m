@implementation NSError(BRCAdditions)

- (id)brc_description
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "code");
  objc_msgSend(a1, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@:%p(%@:%ld) - %@>"), v3, a1, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__NSError_BRCAdditions__initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, block);
}

- (BOOL)brc_isResetError
{
  return objc_msgSend(a1, "brc_containerResetErrorForSharedZone:resetReason:", 0, 0) != 0;
}

- (uint64_t)brc_containerResetErrorForSharedZone:()BRCAdditions resetReason:
{
  uint64_t v4;
  _QWORD v6[6];
  char v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke;
  v6[3] = &unk_1E8766098;
  v6[4] = &v8;
  v6[5] = a4;
  v7 = a3;
  objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", v6);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (double)br_suggestedRetryTimeInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C94808]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  if (objc_msgSend(a1, "_brc_isCloudKitErrorCode:", 2))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a1, "userInfo", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "br_suggestedRetryTimeInterval");
          if (v13 > v5)
            v5 = v13;
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  return v5;
}

- (uint64_t)brc_isRetriable
{
  if ((objc_msgSend(a1, "brc_isResetError") & 1) != 0)
    return 0;
  if ((objc_msgSend(a1, "brc_isCloudKitErrorNeedsPCSPrep") & 1) != 0)
    return 1;
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", &__block_literal_global_53);
}

- (uint64_t)brc_isUserInitiatedRetriable
{
  if ((objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 23) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 7);
}

- (uint64_t)brc_shouldRetryLater
{
  if ((objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 9) & 1) != 0
    || (objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 6) & 1) != 0
    || (objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 3) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "br_isCloudDocsErrorCode:", 56);
  }
}

- (uint64_t)brc_shouldRetryBubbleLater
{
  if ((objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 9) & 1) != 0
    || (objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 6) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 3);
  }
}

- (uint64_t)brc_isEverRetriable
{
  if ((objc_msgSend(a1, "brc_isRetriable") & 1) != 0
    || (objc_msgSend(a1, "brc_isCloudKitErrorRequiringAssetRecheck") & 1) != 0
    || (objc_msgSend(a1, "brc_isCloudKitErrorRequiringAssetRescan") & 1) != 0
    || (objc_msgSend(a1, "brc_isCloudKitCancellationError") & 1) != 0
    || (objc_msgSend(a1, "brc_isCloudKitErrorRequiringAssetReupload") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown") ^ 1;
  }
}

- (uint64_t)brc_checkErrorsFromCloudKit:()BRCAdditions
{
  uint64_t (**v4)(id, _QWORD);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((((uint64_t (**)(id, void *))v4)[2](v4, a1) & 1) != 0)
  {
LABEL_2:
    v5 = 1;
  }
  else
  {
    objc_msgSend(a1, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C947D8]))
    {
      v7 = objc_msgSend(a1, "code");

      if (v7 == 2)
      {
        objc_msgSend(a1, "userInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        objc_msgSend(v9, "objectEnumerator", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
          while (2)
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v10);
              if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14)) & 1) != 0)
              {

                goto LABEL_2;
              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
            if (v12)
              continue;
            break;
          }
        }

      }
    }
    else
    {

    }
    v5 = 0;
  }

  return v5;
}

- (BOOL)_brc_isCloudKitErrorCode:()BRCAdditions
{
  void *v5;
  _BOOL8 v6;
  void *v8;
  NSObject *v9;

  if (a3 >= 1000)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[NSError(BRCAdditions) _brc_isCloudKitErrorCode:].cold.1();

  }
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (uint64_t)brc_containsCloudKitErrorCode:()BRCAdditions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__NSError_BRCAdditions__brc_containsCloudKitErrorCode___block_invoke;
  v4[3] = &__block_descriptor_40_e17_B16__0__NSError_8l;
  v4[4] = a3;
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", v4);
}

- (id)_brc_cloudKitInternalWithErrorCode:()BRCAdditions
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;

  v4 = a1;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v6)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }
  objc_msgSend(v4, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C94878];
  v11 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C94878]);

  if (!v11)
    goto LABEL_10;
  if (objc_msgSend(v4, "code") != a3)
  {
    if (objc_msgSend(v4, "code") == 2055)
    {
      objc_msgSend(v4, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", v10);

      if (!v16 || objc_msgSend(v14, "code") != a3)
      {
        v12 = 0;
        v4 = v14;
        goto LABEL_11;
      }
      v4 = v14;
      goto LABEL_5;
    }
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
LABEL_5:
  v12 = v4;
  v4 = v12;
LABEL_11:

  return v12;
}

- (BOOL)_brc_isCloudKitInternalErrorCode:()BRCAdditions
{
  void *v5;
  _BOOL8 v6;
  void *v8;
  NSObject *v9;

  if ((unint64_t)a3 >= 2 && a3 <= 999)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorCode:].cold.1();

  }
  objc_msgSend(a1, "_brc_cloudKitInternalWithErrorCode:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (uint64_t)brc_containsCloudKitInternalErrorCode:()BRCAdditions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__NSError_BRCAdditions__brc_containsCloudKitInternalErrorCode___block_invoke;
  v4[3] = &__block_descriptor_40_e17_B16__0__NSError_8l;
  v4[4] = a3;
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", v4);
}

- (id)br_cloudKitErrorForIdentifier:()BRCAdditions
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[NSError(BRCAdditions) br_cloudKitErrorForIdentifier:].cold.1();

    goto LABEL_8;
  }
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (!v6)
    goto LABEL_8;
  objc_msgSend(a1, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
LABEL_8:
    v9 = a1;

  return v9;
}

- (uint64_t)brc_isCloudKitCancellationError
{
  return objc_msgSend(a1, "_brc_isCloudKitErrorCode:", 20);
}

- (uint64_t)brc_isCloudKitAssetFileModified
{
  return objc_msgSend(a1, "_brc_isCloudKitErrorCode:", 17);
}

- (uint64_t)brc_isCloudKitOutOfQuota
{
  if ((objc_msgSend(a1, "_brc_isCloudKitInternalErrorCode:", 2035) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 25);
}

- (uint64_t)brc_isCloudKitErrorDataProtectionClass
{
  return objc_msgSend(a1, "br_isCKErrorCode:underlyingErrorCode:", 35, 3010);
}

- (uint64_t)brc_isCloudKitErrorNoNetwork
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "br_isCKErrorCode:", 3))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "underlyingErrors", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v6, "br_isNSURLErrorCode:", -1009) & 1) != 0)
        {
          objc_msgSend(v6, "userInfo");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3310]);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v8 == 0;

          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return v3;
}

- (uint64_t)brc_isCloudKitAtomicFailure
{
  return objc_msgSend(a1, "_brc_isCloudKitInternalErrorCode:", 2024);
}

- (uint64_t)brc_isCloudKitPCSChainingError
{
  if ((objc_msgSend(a1, "_brc_isCloudKitInternalErrorCode:", 2044) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 6);
}

- (uint64_t)brc_isCloudKitValidationKeyMismatchError
{
  return objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 11);
}

- (uint64_t)brc_isCloudKitParentValidationKeyMismatchErrorWithFieldName:()BRCAdditions
{
  uint64_t v5;
  void *v6;
  BRCExtensionErrorPayload *v7;
  BRCExtensionErrorPayload *v8;

  v5 = objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 12);
  if ((_DWORD)v5)
  {
    objc_msgSend(a1, "_brc_cloudKitPluginErrorPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BRCExtensionErrorPayload initWithData:]([BRCExtensionErrorPayload alloc], "initWithData:", v6);
    v8 = v7;
    if (a3)
    {
      -[BRCExtensionErrorPayload fieldName](v7, "fieldName");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (uint64_t)brc_isCloudKitHasUnsaltedChildrenWithUnsaltedRecord:()BRCAdditions zoneID:
{
  id v6;
  uint64_t v7;
  void *v8;
  BRCExtensionErrorPayload *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  BRCExtensionErrorPayload *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 10);
  if ((_DWORD)v7)
  {
    objc_msgSend(a1, "_brc_cloudKitPluginErrorPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v20 = v8;
      v9 = -[BRCExtensionErrorPayload initWithData:]([BRCExtensionErrorPayload alloc], "initWithData:", v8);
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v19 = v9;
      -[BRCExtensionErrorPayload recordIds](v9, "recordIds");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15), v6);
            objc_msgSend(v10, "addObject:", v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v13);
      }

      v17 = objc_retainAutorelease(v10);
      *a3 = v17;

      v8 = v20;
    }

  }
  return v7;
}

- (uint64_t)brc_isCloudKitDestinationNeedsSalting
{
  return objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 9);
}

- (uint64_t)brc_isCloudKitShouldBeUsingEnhancedDrivePrivacyWithFieldName:()BRCAdditions
{
  uint64_t v5;
  void *v6;
  BRCExtensionErrorPayload *v7;
  BRCExtensionErrorPayload *v8;

  v5 = objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 13);
  if ((_DWORD)v5)
  {
    objc_msgSend(a1, "_brc_cloudKitPluginErrorPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BRCExtensionErrorPayload initWithData:]([BRCExtensionErrorPayload alloc], "initWithData:", v6);
    v8 = v7;
    if (a3)
    {
      -[BRCExtensionErrorPayload fieldName](v7, "fieldName");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (uint64_t)brc_isSaltingError
{
  if ((objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 10) & 1) != 0
    || (objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 9) & 1) != 0
    || (objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 10) & 1) != 0
    || (objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 11) & 1) != 0
    || (objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 12) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 13);
  }
}

- (uint64_t)brc_isCloudKitUnknownItemError
{
  uint64_t result;

  result = objc_msgSend(a1, "_brc_isCloudKitErrorCode:", 11);
  if ((_DWORD)result)
    return objc_msgSend(a1, "_brc_isCloudKitInternalErrorCode:", 2003);
  return result;
}

- (uint64_t)brc_isCloudKitAccountTemporarilyUnavailable
{
  return objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 36);
}

- (BOOL)brc_isCloudKitRequestRejectedError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C947D8]))
    v3 = objc_msgSend(a1, "code") == 15;
  else
    v3 = 0;

  return v3;
}

- (uint64_t)brc_isCloudKitMMCSErrorChunksCouldNotBeRegisteredError
{
  return 0;
}

- (uint64_t)brc_isCloudKitErrorMissingContentRecordForNewStructureRecord
{
  return objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 14);
}

- (id)brc_ckPartialErrorsByItemID
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {
    v3 = objc_msgSend(a1, "code");

    if (v3 != 2)
    {
      v4 = 0;
      return v4;
    }
    objc_msgSend(a1, "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)brc_isCloudKitErrorRequiringAssetRecheck
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {
    v3 = objc_msgSend(a1, "code");

    if (v3 == 35)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (uint64_t)brc_isCloudKitErrorRequiringAssetRescan
{
  void *v2;
  int v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v3)
  {
    if ((objc_msgSend(a1, "code") & 0xFFFFFFFFFFFFFFFELL) == 0x10)
    {
      v4 = 0;
      v5 = 1;
      goto LABEL_11;
    }
    objc_msgSend(a1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = a1;
  }
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C94878]);

  if (!v8
    || ((v9 = objc_msgSend(v4, "code"), v5 = 1, (unint64_t)(v9 - 3002) > 7)
     || ((1 << (v9 + 70)) & 0x9F) == 0)
    && (unint64_t)(v9 - 7000) >= 5)
  {
    v5 = 0;
  }
LABEL_11:

  return v5;
}

- (uint64_t)brc_isCloudKitErrorRequiringAssetReupload
{
  id v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  if ((objc_msgSend(a1, "brc_isCloudKitErrorRequiringAssetRescan") & 1) != 0)
  {
    v2 = 0;
    v3 = 1;
    goto LABEL_14;
  }
  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v5)
  {
    objc_msgSend(a1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = a1;
  }
  objc_msgSend(v2, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C94878]);

  if (!v8)
  {
LABEL_13:
    v3 = 0;
    goto LABEL_14;
  }
  v9 = objc_msgSend(v2, "code");
  v3 = 1;
  if (v9 > 5002)
  {
    if ((unint64_t)(v9 - 5003) < 2)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (v9 != 1021 && v9 != 3005 && v9 != 3011)
    goto LABEL_13;
LABEL_14:

  return v3;
}

- (BOOL)_brc_isCloudKitPluginErrorCode:()BRCAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL8 v9;

  objc_msgSend(a1, "_brc_cloudKitInternalWithErrorCode:", 6000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("CloudDocsServerExtension"));

  if (v8)
    v9 = objc_msgSend(v6, "code") == a3;
  else
    v9 = 0;

  return v9;
}

- (id)_brc_cloudKitPluginErrorPayload
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_brc_cloudKitInternalWithErrorCode:", 6000);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C94830]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)brc_isCloudKitErrorUnsupportedOSForItemAndGetMinimumSupported:()BRCAdditions
{
  uint64_t v5;
  void *v6;
  BRCExtensionErrorPayload *v7;
  BRCExtensionErrorPayload *v8;

  v5 = objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 1);
  if ((_DWORD)v5)
  {
    objc_msgSend(a1, "_brc_cloudKitPluginErrorPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BRCExtensionErrorPayload initWithData:]([BRCExtensionErrorPayload alloc], "initWithData:", v6);
    v8 = v7;
    if (a3)
    {
      -[BRCExtensionErrorPayload minimumOSName](v7, "minimumOSName");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (uint64_t)brc_isCloudKitErrorUnsupportedOSForZoneAndGetMinimumSupported:()BRCAdditions
{
  uint64_t v5;
  void *v6;
  BRCExtensionErrorPayload *v7;
  BRCExtensionErrorPayload *v8;

  v5 = objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 2);
  if ((_DWORD)v5)
  {
    objc_msgSend(a1, "_brc_cloudKitPluginErrorPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BRCExtensionErrorPayload initWithData:]([BRCExtensionErrorPayload alloc], "initWithData:", v6);
    v8 = v7;
    if (a3)
    {
      -[BRCExtensionErrorPayload minimumOSName](v7, "minimumOSName");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (uint64_t)brc_isCloudKitErrorReparentedToNewParent:()BRCAdditions
{
  uint64_t v5;
  void *v6;
  BRCExtensionErrorPayload *v7;
  void *v9;
  NSObject *v10;

  v5 = objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 7);
  if ((_DWORD)v5)
  {
    objc_msgSend(a1, "_brc_cloudKitPluginErrorPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BRCExtensionErrorPayload initWithData:]([BRCExtensionErrorPayload alloc], "initWithData:", v6);
    if (-[BRCExtensionErrorPayload hasRecordId](v7, "hasRecordId"))
    {
      if (!a3)
      {
LABEL_5:

        return v5;
      }
    }
    else
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[NSError(BRCAdditions) brc_isCloudKitErrorReparentedToNewParent:].cold.1();

      if (!a3)
        goto LABEL_5;
    }
    -[BRCExtensionErrorPayload recordId](v7, "recordId");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v5;
}

- (uint64_t)brc_isCloudKitErrorRemappedToNewRecordName:()BRCAdditions
{
  uint64_t v5;
  void *v6;
  BRCExtensionErrorPayload *v7;
  void *v9;
  NSObject *v10;

  v5 = objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 8);
  if ((_DWORD)v5)
  {
    objc_msgSend(a1, "_brc_cloudKitPluginErrorPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BRCExtensionErrorPayload initWithData:]([BRCExtensionErrorPayload alloc], "initWithData:", v6);
    if (-[BRCExtensionErrorPayload hasRecordId](v7, "hasRecordId"))
    {
      if (!a3)
      {
LABEL_5:

        return v5;
      }
    }
    else
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[NSError(BRCAdditions) brc_isCloudKitErrorReparentedToNewParent:].cold.1();

      if (!a3)
        goto LABEL_5;
    }
    -[BRCExtensionErrorPayload recordId](v7, "recordId");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)brc_isIndividualItemBlacklistError
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  _BOOL8 v10;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v3)
  {
    objc_msgSend(a1, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = a1;
  }
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C94878]);

  if (v7)
  {
    v8 = objc_msgSend(v5, "code");
    v10 = v8 == 2052 || v8 == 2027;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)brc_isRetriableForPCSChaining
{
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", &__block_literal_global_16);
}

- (uint64_t)brc_isCloudKitErrorConsideredAsSuccessForZoneThrottle
{
  if ((objc_msgSend(a1, "_brc_isCloudKitInternalErrorCode:", 3005) & 1) != 0
    || (objc_msgSend(a1, "brc_isCloudKitErrorUnsupportedOSForItemAndGetMinimumSupported:", 0) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "brc_isCloudKitOutOfQuota");
  }
}

- (uint64_t)_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown
{
  void *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C94878];
  v4 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C94878]);

  if ((v4 & 1) == 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
LABEL_10:
    -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown].cold.1();
    goto LABEL_11;
  }
  v5 = objc_msgSend(a1, "code");
  if (v5 <= 2999)
  {
    if (v5 <= 1023)
    {
      if ((unint64_t)(v5 - 1000) < 0x18)
      {
        if (v5 == 1020)
          return 1;
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          goto LABEL_11;
        goto LABEL_53;
      }
      if (!v5)
      {
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          goto LABEL_11;
        goto LABEL_10;
      }
      if (v5 == 1)
      {
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          goto LABEL_11;
        goto LABEL_53;
      }
    }
    else
    {
      if ((unint64_t)(v5 - 2000) < 0x38)
      {
        v6 = 1;
        if (v5 > 2021)
        {
          switch(v5)
          {
            case 2022:
            case 2024:
            case 2029:
            case 2030:
            case 2031:
            case 2034:
            case 2035:
            case 2049:
              return v6;
            case 2036:
              brc_bread_crumbs();
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v8 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
                goto LABEL_53;
              goto LABEL_11;
            case 2037:
              brc_bread_crumbs();
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v8 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
                goto LABEL_53;
              goto LABEL_11;
            case 2040:
              brc_bread_crumbs();
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v8 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
                goto LABEL_53;
              goto LABEL_11;
            case 2041:
              brc_bread_crumbs();
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v8 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
                goto LABEL_53;
              goto LABEL_11;
            case 2044:
              brc_bread_crumbs();
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v8 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
                goto LABEL_53;
              goto LABEL_11;
            case 2055:
              objc_msgSend(a1, "userInfo");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v17, "domain");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqualToString:", v3);

              if (v19)
                v6 = objc_msgSend(v17, "_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown");
              else
                v6 = 1;

              break;
            default:
              goto LABEL_34;
          }
          return v6;
        }
        if (v5 != 2000)
        {
          if (v5 == 2002 || v5 == 2008)
            return v6;
LABEL_34:
          brc_bread_crumbs();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            goto LABEL_53;
LABEL_11:

          return 0;
        }
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          goto LABEL_11;
LABEL_53:
        -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown].cold.3();
        goto LABEL_11;
      }
      if (v5 == 1024)
      {
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          goto LABEL_11;
        goto LABEL_10;
      }
    }
    goto LABEL_61;
  }
  v6 = 1;
  if (v5 <= 5999)
  {
    if ((unint64_t)(v5 - 3000) < 0xC)
      return v6;
    if ((unint64_t)(v5 - 5000) < 0xC)
    {
      if (v5 != 5004)
        return v6;
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
      goto LABEL_53;
    }
    if ((unint64_t)(v5 - 4000) < 3)
      return v6;
    goto LABEL_61;
  }
  if ((unint64_t)(v5 - 8000) < 0xE || (unint64_t)(v5 - 7000) < 5)
    return v6;
  if (v5 != 6000)
  {
LABEL_61:
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    goto LABEL_10;
  }
  objc_msgSend(a1, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("CloudDocsServerExtension"));

  if (v13)
  {
    v6 = 1;
    switch(objc_msgSend(v11, "code"))
    {
      case 1:
      case 2:
      case 13:
      case 14:
        goto LABEL_66;
      case 3:
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          break;
        goto LABEL_86;
      case 4:
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          break;
        goto LABEL_86;
      case 5:
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          break;
        goto LABEL_86;
      case 6:
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          break;
        goto LABEL_86;
      case 7:
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          break;
        goto LABEL_86;
      case 8:
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          break;
        goto LABEL_86;
      case 9:
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          break;
        goto LABEL_86;
      case 10:
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          break;
        goto LABEL_86;
      case 11:
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          break;
        goto LABEL_86;
      case 12:
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          break;
LABEL_86:
        -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown].cold.3();
        break;
      default:
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          goto LABEL_64;
        break;
    }
  }
  else
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
LABEL_64:
      -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown].cold.1();
  }

  v6 = 0;
LABEL_66:

  return v6;
}

- (uint64_t)brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "brc_isXPCConnectionError"))
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[NSError(BRCAdditions) brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown].cold.2();

    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v9)
  {
    v6 = 1;
    switch(objc_msgSend(a1, "code"))
    {
      case 1:
        objc_msgSend(a1, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown");

        return v12;
      case 2:
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(a1, "userInfo", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectEnumerator");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (!v18)
          goto LABEL_26;
        v19 = v18;
        v20 = *(_QWORD *)v29;
        break;
      case 3:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 4:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 5:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          goto LABEL_6;
        goto LABEL_66;
      case 6:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 7:
      case 16:
      case 17:
      case 25:
      case 27:
      case 28:
      case 29:
      case 32:
      case 33:
      case 34:
      case 35:
        return v6;
      case 8:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          goto LABEL_6;
        goto LABEL_66;
      case 9:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 10:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 11:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 12:
        objc_msgSend(a1, "userInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          goto LABEL_51;
        brc_bread_crumbs();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown].cold.3();
        goto LABEL_79;
      case 13:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 14:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 15:
        objc_msgSend(a1, "userInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
LABEL_51:
          v6 = objc_msgSend(v17, "_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown");
          goto LABEL_80;
        }
        brc_bread_crumbs();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown].cold.1();
        goto LABEL_79;
      case 18:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          goto LABEL_6;
        goto LABEL_66;
      case 19:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 20:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 21:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 22:
        objc_msgSend(a1, "userInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
          v6 = objc_msgSend(v27, "_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown");

        return v6;
      case 23:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 24:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          goto LABEL_6;
LABEL_66:
        -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown].cold.1();
        goto LABEL_6;
      case 26:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 30:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 31:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      case 36:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
      default:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        goto LABEL_6;
    }
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown") & 1) == 0)
        {
          brc_bread_crumbs();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown].cold.3();
LABEL_79:

          v6 = 0;
          goto LABEL_80;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v19)
        continue;
      break;
    }
LABEL_26:
    v6 = 1;
LABEL_80:

    return v6;
  }
  objc_msgSend(a1, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C94878]);

  if (v14)
    return objc_msgSend(a1, "_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown");
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
LABEL_5:
    -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown].cold.3();
LABEL_6:

  return 0;
}

- (uint64_t)brc_isDenylistError
{
  return objc_msgSend(a1, "brc_containsCloudKitInternalErrorCode:", 2039);
}

- (uint64_t)brc_isOutOfSpaceError
{
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", &__block_literal_global_17_1);
}

- (BOOL)brc_isDatabaseRemovalError
{
  void *v2;
  void *v3;
  uint64_t v4;
  _BOOL8 result;

  result = 0;
  if (objc_msgSend(a1, "isSqliteErrorCode:", 10))
  {
    objc_msgSend(a1, "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SqliteExtendedCode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "longLongValue");

    if (v4 == 6922)
      return 1;
  }
  return result;
}

- (uint64_t)_brc_isCloudKitZoneNotFoundError
{
  return objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 26);
}

- (uint64_t)_brc_isCloudKitZoneUserDeletedError
{
  return objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 28);
}

- (uint64_t)brc_isCloudKitErrorImplyingZoneNeedsCreation
{
  if ((objc_msgSend(a1, "_brc_isCloudKitZoneNotFoundError") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "_brc_isCloudKitZoneUserDeletedError");
}

- (uint64_t)brc_isCloudKitErrorZoneUndergoingMigration
{
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", &__block_literal_global_20);
}

- (uint64_t)brc_isCloudKitErrorZoneMigrated
{
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", &__block_literal_global_21);
}

- (uint64_t)brc_isCloudKitErrorNeedsPCSPrep
{
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", &__block_literal_global_22_1);
}

- (uint64_t)brc_isStaleRecordUpdateError
{
  return objc_msgSend(a1, "brc_containsCloudKitInternalErrorCode:", 2041);
}

- (uint64_t)brc_isReferenceValidationError
{
  return objc_msgSend(a1, "brc_containsCloudKitInternalErrorCode:", 2025);
}

- (uint64_t)brc_isCloudKitPCSDecryptionFailure
{
  return objc_msgSend(a1, "brc_containsCloudKitInternalErrorCode:", 5004);
}

- (uint64_t)brc_isCloudKitMMCSItemNotAvailable
{
  return objc_msgSend(a1, "brc_containsCloudKitInternalErrorCode:", 3010);
}

- (BOOL)brc_isFrontBoardOpenApplicationRequestDenied
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D22DC0]))
    v3 = objc_msgSend(a1, "code") == 1;
  else
    v3 = 0;

  return v3;
}

- (id)brc_strippedError
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C947D8];
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {

  }
  else
  {
    objc_msgSend(a1, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C94878]);

    if ((v5 & 1) == 0)
    {
      v12 = a1;
      return v12;
    }
  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(a1, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v3);
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v10 = objc_msgSend(a1, "code");

    if (v10 == 2)
    {
      objc_msgSend(a1, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)*MEMORY[0x1E0C94940];
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v28[0] = v9;
      v28[1] = 3221225472;
      v28[2] = __42__NSError_BRCAdditions__brc_strippedError__block_invoke;
      v28[3] = &unk_1E8760160;
      v14 = (id)objc_opt_new();
      v29 = v14;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v28);
      v15 = objc_msgSend(v14, "count");
      if (v15 == 1)
      {
        objc_msgSend(v14, "allValues");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "brc_strippedError");
        v12 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);
      }

      if (v15 == 1)
        goto LABEL_10;
    }
  }
  else
  {

  }
  objc_msgSend(a1, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v9;
  v24 = 3221225472;
  v25 = __42__NSError_BRCAdditions__brc_strippedError__block_invoke_2;
  v26 = &unk_1E8760160;
  v19 = v6;
  v27 = v19;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", &v23);

  v20 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "domain", v23, v24, v25, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, objc_msgSend(a1, "code"), v19);
  v12 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v12;
}

+ (id)brc_errorWithDomain:()BRCAdditions code:underlyingError:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB35C8];
  if (v11)
  {
    v20[0] = *MEMORY[0x1E0CB3388];
    v20[1] = v10;
    v21[0] = v7;
    v21[1] = v11;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = v21;
    v15 = v20;
    v16 = 2;
  }
  else
  {
    v22 = *MEMORY[0x1E0CB3388];
    v23[0] = v7;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = v23;
    v15 = &v22;
    v16 = 1;
  }
  objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v8, a4, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)brc_wrappedError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x1E0D10B70];
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D10B70]))
  {

    goto LABEL_4;
  }
  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0CB28A8];
  v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if (v6)
    goto LABEL_4;
  objc_msgSend(a1, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {

LABEL_10:
    objc_msgSend(a1, "brc_strippedError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "brc_isCloudKitOutOfQuota"))
    {
      v14 = v5;
      v15 = 4354;
    }
    else
    {
      v14 = v3;
      v15 = 17;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorWithDomain:code:underlyingError:", v14, v15, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  objc_msgSend(a1, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C94878]);

  if (v12)
    goto LABEL_10;
  objc_msgSend(a1, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorWithDomain:code:underlyingError:", v5, 512, a1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(a1, "domain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D25D08]);

  if (!v19)
  {
LABEL_4:
    v7 = a1;
LABEL_5:
    v8 = v7;
    return v8;
  }
  v20 = v3;
  v21 = objc_msgSend(a1, "code");
  if (v21 == 6)
  {
    v23 = 8;
  }
  else if (v21 == 1)
  {
    v22 = v5;

    v23 = 512;
    v20 = v22;
  }
  else
  {
    v23 = 15;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorWithDomain:code:underlyingError:", v20, v23, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)brc_daemonAccessDisabledError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10B70], 16, CFSTR("Sync is restricted for this client"));
}

- (id)brc_cloudKitErrorMessage
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C94810]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C947C8]);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)brc_telemetryReportableErrorWithRecordName:()BRCAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__46;
  v34 = __Block_byref_object_dispose__46;
  v4 = a1;
  v35 = v4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__46;
  v28 = __Block_byref_object_dispose__46;
  v29 = 0;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {
LABEL_5:

    goto LABEL_6;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 == 2)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __68__NSError_BRCAdditions__brc_telemetryReportableErrorWithRecordName___block_invoke;
    v23[3] = &unk_1E87661A0;
    v23[4] = &v30;
    v23[5] = &v24;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v23);
    if (a3)
      *a3 = objc_retainAutorelease((id)v25[5]);
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend((id)v31[5], "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend((id)v31[5], "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v31[5];
    v31[5] = v13;

    objc_msgSend((id)v31[5], "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v17 = objc_opt_isKindOfClass();

    if ((v17 & 1) != 0)
    {
      objc_msgSend((id)v31[5], "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v9);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v31[5];
      v31[5] = v19;

    }
  }
  v21 = (id)v31[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v21;
}

- (BOOL)brc_isXPCConnectionError
{
  void *v2;
  int v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  return v3 && (unint64_t)(objc_msgSend(a1, "code") - 4225) > 0xFFFFFFFFFFFFFF7ELL;
}

- (void)brc_logUnderlineErrorsChain
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Printing Underline Errors Chain for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_brc_isCloudKitErrorCode:()BRCAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: code < CKErrorInternalGenericError%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_brc_isCloudKitInternalErrorCode:()BRCAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: code == CKErrorInternalSuccess || code == CKErrorInternalCancelled || code >= CKErrorInternalGenericError%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)br_cloudKitErrorForIdentifier:()BRCAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: there should be a recordID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)brc_isCloudKitErrorReparentedToNewParent:()BRCAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: errorPayload.hasRecordId%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] we should sync-down again after %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Cloudd crashed, our sync up could have been received by the server%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
