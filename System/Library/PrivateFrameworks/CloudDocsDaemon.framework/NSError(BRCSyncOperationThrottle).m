@implementation NSError(BRCSyncOperationThrottle)

- (uint64_t)brc_syncOperationErrorKind
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {
    v3 = objc_msgSend(a1, "code");

    if (v3 == 25)
    {
      v4 = 2;
      goto LABEL_10;
    }
  }
  else
  {

  }
  if ((objc_msgSend(a1, "brc_isCloudKitCancellationError") & 1) != 0
    || objc_msgSend(a1, "br_isCloudDocsErrorCode:", 23))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[NSError(BRCSyncOperationThrottle) brc_syncOperationErrorKind].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

    v4 = 1;
  }
  else if (objc_msgSend(a1, "brc_isCloudKitAtomicFailure")
         && (+[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0),
             v14 = (void *)objc_claimAutoreleasedReturnValue(),
             v15 = objc_msgSend(v14, "considerSyncUpBatchFailuresAsSuccessForThrottling"),
             v14,
             v15))
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[NSError(BRCSyncOperationThrottle) brc_syncOperationErrorKind].cold.2((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);

    v4 = 0xFFFFFFFFLL;
  }
  else
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __63__NSError_BRCSyncOperationThrottle__brc_syncOperationErrorKind__block_invoke;
    v24[3] = &unk_1E8761DD8;
    v24[4] = &v25;
    objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", v24);
    v4 = *((unsigned int *)v26 + 6);
  }
LABEL_10:
  _Block_object_dispose(&v25, 8);
  return v4;
}

- (void)brc_syncOperationErrorKind
{
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, a2, a3, "[DEBUG] this is a batch failure, consider this as a success%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
