@implementation CKImportStatusManager

- (int64_t)importStateForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  dispatch_semaphore_t v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  uint64_t v22;
  uint64_t v23;
  intptr_t (*v24)(uint64_t, uint64_t);
  void *v25;
  NSObject *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[32];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v4 = a3;
  objc_msgSend(v4, "mediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "syndicationIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0C99E60]);
      v33[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "initWithArray:", v9);

      v11 = dispatch_semaphore_create(0);
      objc_msgSend(MEMORY[0x1E0D358C0], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __45__CKImportStatusManager_importStateForAsset___block_invoke;
      v25 = &unk_1E274DC18;
      v27 = &v28;
      v13 = v11;
      v26 = v13;
      objc_msgSend(v12, "fetchInfoForSyndicationIdentifiersSavedToSystemPhotoLibrary:completion:", v10, &v22);

      v14 = dispatch_time(0, 1000000000);
      if (dispatch_semaphore_wait(v13, v14))
      {
        IMLogHandleForCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "syndicationIdentifier", v22, v23, v24, v25);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKImportStatusManager importStateForAsset:].cold.3(v16, v17, buf, v15);
        }

      }
    }
    else
    {
      IMLogHandleForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKImportStatusManager importStateForAsset:].cold.2(v19, (uint64_t)buf, v10);
      }
    }

  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKImportStatusManager importStateForAsset:].cold.1(v18, (uint64_t)buf, v7);
    }
  }

  v20 = v29[3];
  _Block_object_dispose(&v28, 8);

  return v20;
}

intptr_t __45__CKImportStatusManager_importStateForAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)importStateForAsset:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_18DFCD000, a2, a3, "%@ - media object was nil. Assuming NOT saved.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_1();
}

- (void)importStateForAsset:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_18DFCD000, a2, a3, "%@ - syndicationIdentifier for media object was nil. Assuming NOT saved.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_1();
}

- (void)importStateForAsset:(uint8_t *)buf .cold.3(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "%@ - Timed out while fetching %@ saved state. Assuming NOT saved.", buf, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

@end
