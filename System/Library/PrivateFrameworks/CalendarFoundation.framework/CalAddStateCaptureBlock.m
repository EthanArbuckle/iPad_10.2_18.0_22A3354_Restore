@implementation CalAddStateCaptureBlock

_DWORD *__CalAddStateCaptureBlock_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  _DWORD *v8;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  unsigned int v23;
  _DWORD *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;

  if (a2)
  {
    if (*(_DWORD *)(a2 + 16) == 3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v3 = objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v4 = (void *)v3;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_18;
        v5 = v4;
        if (objc_msgSend(v5, "canBeConvertedToEncoding:", 1))
        {
          if ((unint64_t)objc_msgSend(v5, "length") > 0x7F09)
          {
            +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
            v6 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
              __CalAddStateCaptureBlock_block_invoke_cold_3(v5, v6);

            objc_msgSend(v5, "substringToIndex:", 32522);
            v7 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
        }
        else
        {
          v10 = objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 2483028224);
          if (v10 > 0x7F09)
          {
            v11 = v10;
            +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              __CalAddStateCaptureBlock_block_invoke_cold_4(v11, v12, v13, v14, v15, v16, v17, v18);

            v19 = malloc_type_malloc(0x7F0AuLL, 0x1459434CuLL);
            v33 = 0;
            objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v19, 32522, &v33, 2483028224, 1, 0, objc_msgSend(v5, "length"), 0);
            v20 = objc_alloc(MEMORY[0x1E0CB3940]);
            v7 = (id)objc_msgSend(v20, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v19, v33, 2483028224, 1);
            goto LABEL_17;
          }
        }
        v7 = v5;
LABEL_17:
        v4 = v7;

LABEL_18:
        v32 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v32);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v32;
        if (v21)
        {
          v23 = objc_msgSend(v21, "length");
          v24 = malloc_type_calloc(1uLL, v23 + 200, 0xD0761611uLL);
          if (v24)
          {
            v8 = v24;
            __strlcpy_chk();
            *v8 = 1;
            v8[1] = v23;
            objc_msgSend(v21, "getBytes:range:", v8 + 50, 0, v23);
LABEL_26:

            return v8;
          }
          +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            __CalAddStateCaptureBlock_block_invoke_cold_2(a1, v25, v26, v27, v28, v29, v30, v31);
        }
        else
        {
          +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            __CalAddStateCaptureBlock_block_invoke_cold_1(a1, (uint64_t)v22, v25);
        }

        v8 = 0;
        goto LABEL_26;
      }
    }
  }
  return 0;
}

void __CalAddStateCaptureBlock_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 136315394;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_18FC12000, log, OS_LOG_TYPE_ERROR, "Failed to serialize state capture payload (%s): %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __CalAddStateCaptureBlock_block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18FC12000, a2, a3, "Failed to allocate state capture data (%s)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __CalAddStateCaptureBlock_block_invoke_cold_3(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = objc_msgSend(a1, "length");
  v5 = 1024;
  v6 = 32522;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "State dump is %lu ascii characters, truncating to %i", (uint8_t *)&v3, 0x12u);
}

void __CalAddStateCaptureBlock_block_invoke_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18FC12000, a2, a3, "State dump is %lu bytes in UTF-16; truncating", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
