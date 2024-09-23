@implementation EFLogRegisterStateCaptureBlock

_DWORD *__EFLogRegisterStateCaptureBlock_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  BOOL v5;
  _DWORD *v6;
  void *v7;
  void *v8;
  id v9;
  size_t v10;
  _DWORD *v11;
  void *v12;
  id v14;
  uint8_t buf[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_DWORD *)(a2 + 16);
  if ((v3 & 1) != 0 && v4 == 1
    || (v3 & 2) != 0 && v4 == 2
    || ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 0 ? (v5 = v4 == 3) : (v5 = 0), v5))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
    {
      v6 = 0;
LABEL_23:

      return v6;
    }
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    if (v8)
    {
      v10 = objc_msgSend(v8, "length");
      v11 = malloc_type_calloc(1uLL, v10 + 200, 0xACC82145uLL);
      v6 = v11;
      if (v11)
      {
        *v11 = 1;
        v11[1] = v10;
        if (objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"))
          __strlcpy_chk();
        memcpy(v6 + 50, (const void *)objc_msgSend(objc_retainAutorelease(v8), "bytes"), v10);
        goto LABEL_22;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __EFLogRegisterStateCaptureBlock_block_invoke_cold_2();
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "ef_publicDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      __EFLogRegisterStateCaptureBlock_block_invoke_cold_1((uint64_t)v7, v12, buf);
    }
    v6 = 0;
LABEL_22:

    goto LABEL_23;
  }
  return 0;
}

uint64_t __EFLogRegisterStateCaptureBlock_block_invoke_12()
{
  return os_state_remove_handler();
}

void __EFLogRegisterStateCaptureBlock_block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B106E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Looks like this failed to transform state dictionary %@ into a property list, please check previous logging: %{public}@", buf, 0x16u);

}

void __EFLogRegisterStateCaptureBlock_block_invoke_cold_2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1B106E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "no state data could be collected, see previous logging", v0, 2u);
}

@end
