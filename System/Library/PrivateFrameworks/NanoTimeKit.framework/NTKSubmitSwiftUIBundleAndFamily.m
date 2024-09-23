@implementation NTKSubmitSwiftUIBundleAndFamily

void __NTKSubmitSwiftUIBundleAndFamily_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CA5870]);
  v3 = *(_QWORD *)(a1 + 32);
  v15 = 0;
  v4 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v15);
  v5 = v15;
  if (objc_msgSend(v4, "isAppStoreVendable") && !objc_msgSend(v4, "isBeta"))
  {
    _NTKLoggingObjectForDomain(29, (uint64_t)"NTKLoggingDomainMetrics");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v19 = v10;
      v20 = 2048;
      v21 = v11;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "NTKSubmitSwiftUIBundleAndFamily - Submitting %@ %li", buf, 0x16u);
    }

    v13 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v16[0] = CFSTR("bundleId");
    v16[1] = CFSTR("family");
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v6 = objc_claimAutoreleasedReturnValue();

    AnalyticsSendEvent();
  }
  else
  {
    _NTKLoggingObjectForDomain(29, (uint64_t)"NTKLoggingDomainMetrics");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 2048;
      v21 = v8;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "NTKSubmitSwiftUIBundleAndFamily - Holding out on %@ %li", buf, 0x16u);
    }
  }

}

@end
