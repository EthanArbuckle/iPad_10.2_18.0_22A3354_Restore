@implementation BSLogAddStateCaptureBlockWithTitle

void ___BSLogAddStateCaptureBlockWithTitle_block_invoke()
{
  dispatch_queue_t Serial;
  void *v1;

  Serial = BSDispatchQueueCreateSerial(CFSTR("BSSharedStateCapturingQueue"));
  v1 = (void *)qword_1ECD39AE0;
  qword_1ECD39AE0 = (uint64_t)Serial;

}

_DWORD *___BSLogAddStateCaptureBlockWithTitle_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  size_t v7;
  _DWORD *v8;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48) && *(_DWORD *)(a2 + 16) != 3)
    return 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  BSLogStateCaptureEncodePlist(v3, 1, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v4, "length");
    v8 = malloc_type_calloc(1uLL, v7 + 200, 0x68029F96uLL);
    *v8 = 1;
    v8[1] = v7;
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
    __strlcpy_chk();
    memcpy(v8 + 50, (const void *)objc_msgSend(objc_retainAutorelease(v4), "bytes"), v7);
  }
  else
  {
    if (v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "descriptionWithMultilinePrefix:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error: BSLogAddStateCaptureBlockWithTitle(%@) state data format error: %@", buf, 0x16u);

    }
    v8 = 0;
  }

  return v8;
}

@end
