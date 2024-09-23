@implementation NSError

void __35__NSError_BRCAdditions__initialize__block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  objc_method *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel_description);
  v2 = class_getInstanceMethod(v0, sel_brc_description);
  method_exchangeImplementations(InstanceMethod, v2);
}

uint64_t __63__NSError_BRCSyncOperationThrottle__brc_syncOperationErrorKind__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "brc_isCloudKitErrorConsideredAsSuccessForZoneThrottle");
  if ((_DWORD)result)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -1;
  return result;
}

uint64_t __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void **v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void **v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D10B70]);

  if (v5)
  {
    if (objc_msgSend(v3, "code") == 18)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      if (*(_QWORD *)(v6 + 24) <= 1uLL)
      {
        *(_QWORD *)(v6 + 24) = 2;
        if (*(_QWORD *)(a1 + 40))
        {
          v7 = (void *)MEMORY[0x1E0CB3940];
          v8 = "BRErrorNeedsReset";
LABEL_6:
          objc_msgSend(v7, "stringWithUTF8String:", v8);
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = *(void ***)(a1 + 40);
          v11 = *v10;
          *v10 = (void *)v9;

          goto LABEL_40;
        }
      }
    }
    goto LABEL_40;
  }
  objc_msgSend(v3, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (!v13)
    goto LABEL_40;
  if (objc_msgSend(v3, "code") == 21)
  {
    objc_msgSend(v3, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C94878]))
    {
      v17 = objc_msgSend(v15, "code");

      if (v17 == 2026)
      {
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_1();

        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        if (*(_QWORD *)(v20 + 24) > 1uLL)
          goto LABEL_30;
        *(_QWORD *)(v20 + 24) = 2;
        if (!*(_QWORD *)(a1 + 40))
          goto LABEL_30;
        v21 = (void *)MEMORY[0x1E0CB3940];
        v22 = "CKErrorInternalContainerReset";
LABEL_29:
        objc_msgSend(v21, "stringWithUTF8String:", v22);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(void ***)(a1 + 40);
        v32 = *v31;
        *v31 = (void *)v30;

LABEL_30:
        goto LABEL_40;
      }
    }
    else
    {

    }
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_2();

    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v29 + 24) > 1uLL)
      goto LABEL_30;
    *(_QWORD *)(v29 + 24) = 2;
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_30;
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = "CKErrorChangeTokenExpired";
    goto LABEL_29;
  }
  if (objc_msgSend(v3, "code") == 26)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_3();

    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v26 = *(_QWORD *)(v25 + 24);
    if (*(_BYTE *)(a1 + 48))
    {
      if (v26 <= 2)
      {
        *(_QWORD *)(v25 + 24) = 3;
        if (*(_QWORD *)(a1 + 40))
        {
          v7 = (void *)MEMORY[0x1E0CB3940];
          v8 = "CKErrorSharedZoneNotFound";
          goto LABEL_6;
        }
      }
    }
    else if (v26 <= 1)
    {
      *(_QWORD *)(v25 + 24) = 2;
      if (*(_QWORD *)(a1 + 40))
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        v8 = "CKErrorZoneNotFound";
        goto LABEL_6;
      }
    }
  }
  else if (objc_msgSend(v3, "code") == 28)
  {
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_4();

    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v35 + 24) <= 2uLL)
    {
      *(_QWORD *)(v35 + 24) = 3;
      if (*(_QWORD *)(a1 + 40))
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        v8 = "CKErrorUserDeletedZone";
        goto LABEL_6;
      }
    }
  }
LABEL_40:

  return 0;
}

uint64_t __40__NSError_BRCAdditions__brc_isRetriable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v2 = a2;
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB32E8]) & 1) != 0)
  {
LABEL_3:
    v4 = 1;
    goto LABEL_4;
  }
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D10B70]) & 1) != 0)
    {
LABEL_9:
      v4 = 0;
      goto LABEL_4;
    }
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D10C90]) & 1) == 0)
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __40__NSError_BRCAdditions__brc_isRetriable__block_invoke_cold_1();

    }
    goto LABEL_3;
  }
  v6 = objc_msgSend(v2, "code");
  v4 = 1;
  switch(v6)
  {
    case 10:
    case 15:
    case 16:
    case 17:
      goto LABEL_9;
    case 11:
      v4 = objc_msgSend(v2, "_brc_isCloudKitInternalErrorCode:", 2003) ^ 1;
      break;
    case 12:
    case 13:
    case 14:
      break;
    default:
      v4 = v6 != 1 && v6 != 25;
      break;
  }
LABEL_4:

  return v4;
}

uint64_t __55__NSError_BRCAdditions__brc_containsCloudKitErrorCode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_brc_isCloudKitErrorCode:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__NSError_BRCAdditions__brc_containsCloudKitInternalErrorCode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_brc_isCloudKitInternalErrorCode:", *(_QWORD *)(a1 + 32));
}

uint64_t __54__NSError_BRCAdditions__brc_isRetriableForPCSChaining__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "_brc_isCloudKitErrorCode:", 11) & 1) != 0
    || (objc_msgSend(v2, "_brc_isCloudKitInternalErrorCode:", 2041) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "_brc_isCloudKitInternalErrorCode:", 2044);
  }

  return v3;
}

uint64_t __46__NSError_BRCAdditions__brc_isOutOfSpaceError__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  BOOL v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v2 = a2;
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if (v4)
  {
    v5 = objc_msgSend(v2, "code") == 640;
    goto LABEL_6;
  }
  objc_msgSend(v2, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

  if (!v7)
  {
    if ((objc_msgSend(v2, "isSqliteErrorCode:", 13) & 1) == 0)
    {
      if (!objc_msgSend(v2, "isSqliteErrorCode:", 10)
        || (objc_msgSend(v2, "userInfo"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SqliteExtendedCode")),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "longLongValue"),
            v10,
            v9,
            (v11 & 0xFFFFFFFFFFFFFEFFLL) != 0x120A))
      {
        v8 = 0;
        goto LABEL_14;
      }
    }
    goto LABEL_12;
  }
  if (objc_msgSend(v2, "code") == 28)
  {
LABEL_12:
    v8 = 1;
    goto LABEL_14;
  }
  v5 = objc_msgSend(v2, "code") == 69;
LABEL_6:
  v8 = v5;
LABEL_14:

  return v8;
}

uint64_t __67__NSError_BRCAdditions__brc_isCloudKitErrorZoneUndergoingMigration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_brc_isCloudKitPluginErrorCode:", 3);
}

uint64_t __56__NSError_BRCAdditions__brc_isCloudKitErrorZoneMigrated__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_brc_isCloudKitPluginErrorCode:", 4);
}

uint64_t __56__NSError_BRCAdditions__brc_isCloudKitErrorNeedsPCSPrep__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_brc_isCloudKitPluginErrorCode:", 5);
}

void __42__NSError_BRCAdditions__brc_strippedError__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "zoneName");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v5, "brc_isCloudKitAtomicFailure") & 1) == 0)
    {
      objc_msgSend(v5, "brc_strippedError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v6);

    }
  }

}

void __42__NSError_BRCAdditions__brc_strippedError__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "brc_strippedError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);
  }

}

void __68__NSError_BRCAdditions__brc_telemetryReportableErrorWithRecordName___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  if ((objc_msgSend(v7, "brc_isCloudKitAtomicFailure") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "recordName");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      *a4 = 1;
    }
  }

}

void __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Server container was reset, we need to reset ourselves%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Server change token expired, we need to reset ourselves%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Server container was reset, zone not found, we need to reset ourselves%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Server container was reset, user deleted zone, we need to reset ourselves%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __40__NSError_BRCAdditions__brc_isRetriable__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] unknown error domain: %@, we should retry%@");
  OUTLINED_FUNCTION_2();
}

@end
