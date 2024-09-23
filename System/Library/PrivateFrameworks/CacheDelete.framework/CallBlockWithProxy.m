@implementation CallBlockWithProxy

void __CallBlockWithProxy_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __CallBlockWithProxy_block_invoke_2;
  v6[3] = &unk_1E4A32E88;
  v7 = v3;
  v4 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(v4, v6);

}

void __CallBlockWithProxy_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (objc_msgSend(v2, "code") == 4097)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "NSXPCConnectionInterrupted");
    }
    else
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "code");
      v5 = (void *)MEMORY[0x1E0CB3940];
      if (v4 == 4099)
      {
        v15 = "NSXPCConnectionInvalid";
        v6 = CFSTR("%s");
      }
      else
      {
        v15 = (const char *)objc_msgSend(*(id *)(a1 + 32), "code");
        v6 = CFSTR("%ld");
      }
      objc_msgSend(v5, "stringWithFormat:", v6, v15);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CDGetLogHandle((uint64_t)"client");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v19 = v7;
      v20 = 2114;
      v21 = v13;
      _os_log_error_impl(&dword_1A3662000, v8, OS_LOG_TYPE_ERROR, "remoteObjectProxyWithErrorHandler error: %{public}@ : %{public}@", buf, 0x16u);
    }

    v9 = *(_QWORD *)(a1 + 32);
    v3 = (void *)MEMORY[0x1E0CB35C8];
    if (v9)
    {
      v16 = *MEMORY[0x1E0CB3388];
      v17 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("CacheDeleteErrorDomain"), 2, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
  }
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("CacheDeleteErrorDomain"), 2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  if (*(_QWORD *)(a1 + 56))
  {
    CDGetLogHandle((uint64_t)"client");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2112;
      v21 = v11;
      _os_log_error_impl(&dword_1A3662000, v12, OS_LOG_TYPE_ERROR, "CallBlockWithProxy remoteObjectProxyWithErrorHandler(%{public}@) error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __CallBlockWithProxy_block_invoke_219(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8)
                                                                            + 24);
  return result;
}

@end
