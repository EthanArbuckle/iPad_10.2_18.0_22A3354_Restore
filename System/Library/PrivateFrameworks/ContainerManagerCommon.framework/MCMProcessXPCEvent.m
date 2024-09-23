@implementation MCMProcessXPCEvent

id __MCMProcessXPCEvent_block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v26;
  _BYTE v27[24];
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  container_log_handle_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "codeSignInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("<unknown>");
    if (v9)
      v11 = (const __CFString *)v9;
    v26 = 134349315;
    *(_QWORD *)v27 = v7;
    *(_WORD *)&v27[8] = 2113;
    *(_QWORD *)&v27[10] = v11;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v5, OS_SIGNPOST_INTERVAL_END, v6, "XPCEventProcessing", " command=%{public, signpost.description:attribute}llu  clientIdentifier=%{private, signpost.description:attribute}@ ", (uint8_t *)&v26, 0x16u);

  }
  objc_msgSend(v3, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = containermanager_copy_global_configuration();
      objc_msgSend(v15, "currentUser");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "UID");
      v18 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "shortDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 67109890;
      *(_DWORD *)v27 = v17;
      *(_WORD *)&v27[4] = 2048;
      *(_QWORD *)&v27[6] = v18;
      *(_WORD *)&v27[14] = 2112;
      *(_QWORD *)&v27[16] = v19;
      v28 = 2112;
      v29 = v20;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "[%u] command=%llu, client=%@, error=%@", (uint8_t *)&v26, 0x26u);

LABEL_11:
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = containermanager_copy_global_configuration();
    objc_msgSend(v15, "currentUser");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v16, "UID");
    v22 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 67109634;
    *(_DWORD *)v27 = v21;
    *(_WORD *)&v27[4] = 2048;
    *(_QWORD *)&v27[6] = v22;
    *(_WORD *)&v27[14] = 2112;
    *(_QWORD *)&v27[16] = v19;
    _os_log_impl(&dword_1CF807000, v14, OS_LOG_TYPE_DEFAULT, "[%u] command=%llu, client=%@, error=(null)", (uint8_t *)&v26, 0x1Cu);
    goto LABEL_11;
  }

  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = 0;

  return v3;
}

void __MCMProcessXPCEvent_block_invoke(uint64_t a1)
{
  void *v2;
  MCMClientFactory *v3;
  void *v4;
  id v5;

  v5 = (id)objc_opt_new();
  v2 = (void *)objc_opt_new();
  v3 = -[MCMClientFactory initWithUserIdentityCache:clientCodeSignInfoCache:clientIdentityCache:]([MCMClientFactory alloc], "initWithUserIdentityCache:clientCodeSignInfoCache:clientIdentityCache:", *(_QWORD *)(a1 + 32), v5, v2);
  v4 = (void *)MCMProcessXPCEvent_clientFactory;
  MCMProcessXPCEvent_clientFactory = (uint64_t)v3;

}

@end
