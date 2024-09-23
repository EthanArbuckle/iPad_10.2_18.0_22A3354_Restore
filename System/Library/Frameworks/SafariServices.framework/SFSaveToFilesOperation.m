@implementation SFSaveToFilesOperation

uint64_t __32___SFSaveToFilesOperation_start__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32___SFSaveToFilesOperation_start__block_invoke_2;
  v3[3] = &unk_1E4AC7100;
  v3[4] = v1;
  return objc_msgSend(v1, "_copyFileData:", v3);
}

void __32___SFSaveToFilesOperation_start__block_invoke_2(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;

  v7 = a2;
  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32___SFSaveToFilesOperation_start__block_invoke_3;
  v12[3] = &unk_1E4AC3978;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v9;
  v15 = v8;
  v16 = a4;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

uint64_t __32___SFSaveToFilesOperation_start__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
    return objc_msgSend(v2, "_showDocumentPickerForFileURL:sourceURL:willStartDownload:", v3, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  else
    return objc_msgSend(v2, "_finishWithURL:");
}

void __41___SFSaveToFilesOperation__copyFileData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___SFSaveToFilesOperation__copyFileData___block_invoke_2;
  block[3] = &unk_1E4AC1A08;
  v7 = v3;
  v4 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __41___SFSaveToFilesOperation__copyFileData___block_invoke_2(uint64_t a1)
{
  char isKindOfClass;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = *(id *)(a1 + 32);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(_QWORD *)(a1 + 48);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_committedURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, _QWORD))(v3 + 16))(v3, v6, v5, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 48), 0, 0, 0);
  }

}

void __41___SFSaveToFilesOperation__copyFileData___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __41___SFSaveToFilesOperation__copyFileData___block_invoke_3_cold_2(v7);
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1[4], "suggestedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.pdf"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "_temporaryFileWithName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  v12 = objc_msgSend(v5, "writeToURL:options:error:", v11, 0, &v21);
  v13 = v21;

  if (v12)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41___SFSaveToFilesOperation__copyFileData___block_invoke_21;
    block[3] = &unk_1E4AC14A0;
    v20 = a1[6];
    v14 = v11;
    v15 = a1[5];
    v18 = v14;
    v19 = v15;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v16 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __41___SFSaveToFilesOperation__copyFileData___block_invoke_3_cold_1(v16);
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __41___SFSaveToFilesOperation__copyFileData___block_invoke_21(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = a1[6];
  v2 = a1[4];
  objc_msgSend(*(id *)(a1[5] + 8), "webView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_committedURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v1 + 16))(v1, v2, v3, 0);

}

void __41___SFSaveToFilesOperation__copyFileData___block_invoke_3_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v3, v4, "Failed to save PDF data to disk: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

void __41___SFSaveToFilesOperation__copyFileData___block_invoke_3_cold_2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v3, v4, "Unable to generate a PDF representation of the webpage: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

@end
