@implementation CacheDeleteRegisterInfoCallbacksForProcess

void ___CacheDeleteRegisterInfoCallbacksForProcess_block_invoke(uint64_t a1)
{
  unsigned __int8 v1;
  int v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
  if ((v1 & 1) != 0)
  {
    CDGetLogHandle((uint64_t)"client");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      v6 = "deleted has launched";
      v7 = v4;
      v8 = 2;
      goto LABEL_6;
    }
  }
  else
  {
    v3 = _CacheDeleteRegister(*(void **)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 72), *(void **)(a1 + 80), *(void **)(a1 + 88), *(void **)(a1 + 40));
    CDGetLogHandle((uint64_t)"client");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138543874;
      v10 = v5;
      v11 = 2082;
      v12 = "_Anonymous";
      v13 = 1024;
      v14 = v3;
      v6 = "deleted has been relaunched, re-registered %{public}@%{public}s, result: %d";
      v7 = v4;
      v8 = 28;
LABEL_6:
      _os_log_impl(&dword_1A3662000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }

}

@end
