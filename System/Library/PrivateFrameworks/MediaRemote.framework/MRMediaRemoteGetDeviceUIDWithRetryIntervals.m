@implementation MRMediaRemoteGetDeviceUIDWithRetryIntervals

void ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.mediaremote.utility.getDeviceUIDWithRetry", v2);
  v1 = (void *)_MRMediaRemoteGetDeviceUIDWithRetryIntervals_workerQueue;
  _MRMediaRemoteGetDeviceUIDWithRetryIntervals_workerQueue = (uint64_t)v0;

}

uint64_t ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke_248(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MRMediaRemoteCopyDeviceUID();
  if (v2)
  {
    v3 = *(NSObject **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke_3;
    v9[3] = &unk_1E30C6568;
    v11 = *(id *)(a1 + 48);
    v10 = v2;
    dispatch_async(v3, v9);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 56);
    _MRLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke_2_cold_1((uint64_t *)(a1 + 56), a1, v6);
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(*(id *)(a1 + 40), "count");
      objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", CFSTR(", "));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[GetDeviceUIDWithRetry] Unable to getDeviceUID - will retry up to %ld times with intervals [%@]", buf, 0x16u);

    }
    _MRMediaRemoteGetDeviceUIDWithRetryIntervals(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }

}

uint64_t ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke_249(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[5];
    v4 = a1[6];
    v6 = 134218240;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[GetDeviceUIDWithRetry] Retrying to getDeviceUID - retry #%ld after %f seconds", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

void ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke_2_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = objc_msgSend(*(id *)(a2 + 40), "count");
  v6 = 134218240;
  v7 = v4;
  v8 = 2048;
  v9 = v5;
  _os_log_error_impl(&dword_193827000, a3, OS_LOG_TYPE_ERROR, "[GetDeviceUIDWithRetry] Unable to getDeviceUID - retry %ld of up to %ld", (uint8_t *)&v6, 0x16u);
  OUTLINED_FUNCTION_2_6();
}

@end
