@implementation CacheDeletePerformOperation

void __CacheDeletePerformOperation_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __CacheDeletePerformOperation_block_invoke_2;
  v6[3] = &unk_1E4A32868;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(a2, "clientPerformOperation:replyBlock:", v3, v6);

}

void __CacheDeletePerformOperation_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v3 = v5;
  }

}

void __CacheDeletePerformOperation_block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_error_impl(&dword_1A3662000, v4, OS_LOG_TYPE_ERROR, "Failed to perform operation: %@", buf, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v5 + 24))
  {
    *(_BYTE *)(v5 + 24) = 1;
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v8 = CFSTR("CACHE_DELETE_ERROR");
      v9 = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

    }
  }

}

@end
