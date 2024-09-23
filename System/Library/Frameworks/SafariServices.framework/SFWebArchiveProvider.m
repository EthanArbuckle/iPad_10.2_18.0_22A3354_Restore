@implementation SFWebArchiveProvider

void __65___SFWebArchiveProvider_generateWebArchiveWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  __CFString *v7;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 16))
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)v2, "_quickLookDocument");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);

    return;
  }
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 40));
  v5 = WeakRetained;
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_SFWebArchiveErrorDomain"), 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_8;
  }
  objc_msgSend(WeakRetained, "_MIMEType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_webViewUTI");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!UTTypeEqual(v7, (CFStringRef)*MEMORY[0x1E0CA5B78]))
  {
    v10 = UTTypeConformsTo(v7, (CFStringRef)*MEMORY[0x1E0CA5C88]);
    v11 = WBS_LOG_CHANNEL_PREFIXDownloads();
    v12 = v11;
    if (!v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v19 = v5;
        v20 = 2114;
        v21 = v6;
        _os_log_impl(&dword_1A3B2D000, v12, OS_LOG_TYPE_DEFAULT, "Not generating web archive for web view %p because the current document isn't a text-based document; mime type is %{public}@",
          buf,
          0x16u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_SFWebArchiveErrorDomain"), 2, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_6;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v6;
      _os_log_impl(&dword_1A3B2D000, v12, OS_LOG_TYPE_INFO, "Webpage is of mime type '%{public}@' instead of HTML, but will still generate a web archive", buf, 0xCu);
    }
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65___SFWebArchiveProvider_generateWebArchiveWithCompletionHandler___block_invoke_3;
  v14[3] = &unk_1E4AC13B0;
  v15 = v5;
  v8 = *(id *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v8;
  objc_msgSend(v15, "_getWebArchiveDataWithCompletionHandler:", v14);

  v9 = v15;
LABEL_6:

LABEL_8:
}

void __65___SFWebArchiveProvider_generateWebArchiveWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  id *v9;
  uint64_t v10;
  void *v11;

  v6 = a2;
  v7 = a3;
  if (v7 || !objc_msgSend(v6, "length"))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __65___SFWebArchiveProvider_generateWebArchiveWithCompletionHandler___block_invoke_3_cold_1(a1, v8, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = *(id **)(a1 + 40);
    if (!v9[2])
    {
      objc_storeStrong(v9 + 2, a2);
      v9 = *(id **)(a1 + 40);
    }
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v9, "_quickLookDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

  }
}

void __65___SFWebArchiveProvider_generateWebArchiveWithCompletionHandler___block_invoke_3_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = v4;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_ERROR, "Error generating web archive for web view %p: %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
