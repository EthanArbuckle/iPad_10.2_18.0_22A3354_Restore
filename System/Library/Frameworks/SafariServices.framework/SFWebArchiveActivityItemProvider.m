@implementation SFWebArchiveActivityItemProvider

void __60___SFWebArchiveActivityItemProvider__webArchiveItemProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60___SFWebArchiveActivityItemProvider__webArchiveItemProvider__block_invoke_2;
  v6[3] = &unk_1E4AC0CD8;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "generateWebArchiveWithCompletionHandler:", v6);

}

void __60___SFWebArchiveActivityItemProvider__webArchiveItemProvider__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __60___SFWebArchiveActivityItemProvider__webArchiveItemProvider__block_invoke_2_cold_1(v8, v7);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "setSize:", objc_msgSend(v5, "fileSize"));
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "savedURLWithProperExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

}

void __60___SFWebArchiveActivityItemProvider__webArchiveItemProvider__block_invoke_2_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Unable to generate SFQuickLookDocument for saving: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
