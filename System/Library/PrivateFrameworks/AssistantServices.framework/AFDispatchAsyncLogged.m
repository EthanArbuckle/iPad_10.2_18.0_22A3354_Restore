@implementation AFDispatchAsyncLogged

void __AFDispatchAsyncLogged_block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)AFSiriLogContextDispatch;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDispatch, OS_LOG_TYPE_INFO))
  {
    v3 = a1[5];
    v4 = a1[6];
    v5 = a1[7];
    v6 = v2;
    v7 = mach_absolute_time();
    v8 = _AFConvertMachTimeToMilliseconds(v7 - a1[8]);
    v17 = 136316162;
    v18 = "AFDispatchAsyncLogged_block_invoke";
    v19 = 2080;
    v20 = v3;
    v21 = 2048;
    v22 = v4;
    v23 = 2080;
    v24 = v5;
    v25 = 2048;
    v26 = v8;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s Enter block at %s line %lu (queue: %s, waitingTime: %llums)", (uint8_t *)&v17, 0x34u);

  }
  v9 = mach_absolute_time();
  (*(void (**)(void))(a1[4] + 16))();
  v10 = (void *)AFSiriLogContextDispatch;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDispatch, OS_LOG_TYPE_INFO))
  {
    v11 = a1[5];
    v12 = a1[6];
    v13 = a1[7];
    v14 = v10;
    v15 = mach_absolute_time();
    v16 = _AFConvertMachTimeToMilliseconds(v15 - v9);
    v17 = 136316162;
    v18 = "AFDispatchAsyncLogged_block_invoke";
    v19 = 2080;
    v20 = v11;
    v21 = 2048;
    v22 = v12;
    v23 = 2080;
    v24 = v13;
    v25 = 2048;
    v26 = v16;
    _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s Leave block at %s line %lu (queue: %s, executionTime: %llums)", (uint8_t *)&v17, 0x34u);

  }
}

@end
