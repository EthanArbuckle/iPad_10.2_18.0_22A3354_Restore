@implementation CPFreeSpaceRequestBytesAtPathWithCompletionBlock

uint64_t __CPFreeSpaceRequestBytesAtPathWithCompletionBlock_block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[24];
  void *v18;
  NSObject *v19;
  _QWORD v20[2];
  unint64_t v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)v17 = 134217984;
    *(_QWORD *)&v17[4] = v2;
    _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: processing enqueued request for block %p", v17, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 56) + 157286400;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)v17 = 134218240;
    *(_QWORD *)&v17[4] = v3;
    *(_WORD *)&v17[12] = 2048;
    *(_QWORD *)&v17[14] = v4;
    _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: will request CacheDelete of %llu bytes for block %p", v17, 0x16u);
  }
  if (_CPFreeupBytes_onceToken != -1)
    dispatch_once(&_CPFreeupBytes_onceToken, &__block_literal_global_9);
  v5 = dispatch_semaphore_create(0);
  v20[0] = CFSTR("CACHE_DELETE_VOLUME");
  v20[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v21[0] = (unint64_t)CFSTR("/private/var");
  v21[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3);
  v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  *(_QWORD *)v17 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v17[8] = 3221225472;
  *(_QWORD *)&v17[16] = ___CPFreeupBytes_block_invoke_2;
  v18 = &unk_1E2881358;
  v19 = v5;
  v7 = (const void *)_CPFreeupBytes__CacheDeletePurgeSpaceWithInfo(v6, v17);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  CFRelease(v7);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)v17 = 134218240;
    *(_QWORD *)&v17[4] = v3;
    *(_WORD *)&v17[12] = 2048;
    *(_QWORD *)&v17[14] = v8;
    _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: did finish CacheDelete of %llu bytes for block %p", v17, 0x16u);
  }
  v21[0] = 0;
  if (GetTotalCapacityAndAvailableCapacityForMountPoint(*(void **)(a1 + 32), 0, v21))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __CPFreeSpaceRequestBytesAtPathWithCompletionBlock_block_invoke_7_cold_1(a1);
    v9 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)v17 = 134218240;
      *(_QWORD *)&v17[4] = v21[0];
      *(_WORD *)&v17[12] = 2048;
      *(_QWORD *)&v17[14] = v10;
      _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: got available space %llu for block %p", v17, 0x16u);
    }
    v11 = v21[0];
    v12 = *(_QWORD *)(a1 + 56);
    v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
    if (v11 >= v12)
    {
      if (v13)
      {
        v15 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)v17 = 134218240;
        *(_QWORD *)&v17[4] = v11;
        *(_WORD *)&v17[12] = 2048;
        *(_QWORD *)&v17[14] = v15;
        _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: satisfied with new available space %llu for block %p", v17, 0x16u);
      }
      v9 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      if (v13)
      {
        v14 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)v17 = 134218240;
        *(_QWORD *)&v17[4] = v11;
        *(_WORD *)&v17[12] = 2048;
        *(_QWORD *)&v17[14] = v14;
        _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: not satisfied with new available space %llu for block %p", v17, 0x16u);
      }
      v9 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
  }
  return v9();
}

void __CPFreeSpaceRequestBytesAtPathWithCompletionBlock_block_invoke_7_cold_1(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "domain"), "UTF8String");
  objc_msgSend(*(id *)(a1 + 40), "code");
  OUTLINED_FUNCTION_0(&dword_18EB0F000, MEMORY[0x1E0C81028], v2, "free space request: failed to get capacity and available space with error domain %s code %lld for block %p", v3, v4, v5, v6, 2u);
}

@end
