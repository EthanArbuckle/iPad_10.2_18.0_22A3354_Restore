@implementation CacheDeleteServiceRequest

void __CacheDeleteServiceRequest_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__0;
  v8[4] = __Block_byref_object_dispose__0;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __CacheDeleteServiceRequest_block_invoke_2;
  v5[3] = &unk_1E4A32868;
  v7 = v8;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "clientPerformServiceRequest:replyBlock:", v4, v5);

  _Block_object_dispose(v8, 8);
}

void __CacheDeleteServiceRequest_block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  CDGetLogHandle((uint64_t)"client");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = 138412290;
    v9 = v7;
    _os_log_debug_impl(&dword_1A3662000, v5, OS_LOG_TYPE_DEBUG, "ServiceCallback results: %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __CacheDeleteServiceRequest_block_invoke_161(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  const __CFString *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_error_impl(&dword_1A3662000, v4, OS_LOG_TYPE_ERROR, "Failed to perform service request: %@", buf, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v7 = CFSTR("CACHE_DELETE_ERROR");
    v8 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
}

@end
