@implementation CIDocSetIteratorProcessPositionsUpdates

int *___CIDocSetIteratorProcessPositionsUpdates_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void (*v13)(_QWORD);
  int v14;
  NSObject *v15;
  int *result;
  unsigned int v17;
  int v18;
  unint64_t v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void (*v25)(_QWORD);
  _DWORD *v26;
  int v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(_QWORD);
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD);
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  makeThreadId();
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * a2) + 56);
  if (*(_BYTE *)(v4 + 8))
  {
    do
    {
      v5 = __ldxr(exceptionSequenceNum);
      v6 = v5 + 1;
    }
    while (__stxr(v5 + 1, exceptionSequenceNum));
    v7 = setThreadIdAndInfo(-1, (__int128 *)sIndexExceptionCallbacks, v4, 0, v6);
    v44 = HIDWORD(v7);
    v45 = v7;
    v42 = v9;
    v43 = v8;
    v10 = *(_QWORD *)&threadData[18 * v7 + 2];
    v11 = v10 + 320 * HIDWORD(v7);
    *(_BYTE *)(v11 + 216) = 0;
    v12 = *(_DWORD *)(v11 + 312);
    v13 = *(void (**)(_QWORD))(v11 + 224);
    if (v13)
      v13(*(_QWORD *)(v10 + 320 * HIDWORD(v7) + 288));
    if (_setjmp((int *)v11))
    {
      v14 = *__error();
      v15 = _SILogForLogForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "_CIDocSetIteratorProcessPositionsUpdates_block_invoke";
        v48 = 1024;
        v49 = 2978;
        _os_log_error_impl(&dword_1B8270000, v15, OS_LOG_TYPE_ERROR, "%s:%d: Caught mach exception", buf, 0x12u);
      }
      *__error() = v14;
      *(_DWORD *)(v11 + 312) = v12;
      CIOnThreadCleanUpReset(v42);
      dropThreadId(v45, 1, v6);
      return (int *)CICleanUpReset(v45, v43);
    }
    else
    {
      do
      {
        v17 = __ldxr(exceptionSequenceNum);
        v18 = v17 + 1;
      }
      while (__stxr(v17 + 1, exceptionSequenceNum));
      v19 = setThreadIdAndInfo(-1, sAssertExceptionCallbacks, 0, 0, v18);
      v40 = HIDWORD(v19);
      v41 = v19;
      v38 = v21;
      v39 = v20;
      v22 = *(_QWORD *)&threadData[18 * v19 + 2];
      v23 = v22 + 320 * HIDWORD(v19);
      v24 = *(_DWORD *)(v23 + 312);
      v25 = *(void (**)(_QWORD))(v23 + 224);
      if (v25)
        v25(*(_QWORD *)(v22 + 320 * HIDWORD(v19) + 288));
      if (_setjmp((int *)v23))
      {
        v26 = (_DWORD *)(v23 + 312);
        v27 = *__error();
        v28 = _SILogForLogForCategory(0);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v47 = "_CIDocSetIteratorProcessPositionsUpdates_block_invoke";
          v48 = 1024;
          v49 = 2977;
          _os_log_error_impl(&dword_1B8270000, v28, OS_LOG_TYPE_ERROR, "%s:%d: Caught mach exception", buf, 0x12u);
        }
        *__error() = v27;
        *v26 = v24;
        CIOnThreadCleanUpReset(v38);
        dropThreadId(v41, 1, v18);
        CICleanUpReset(v41, v39);
      }
      else
      {
        _CIDocSetIteratorProcessPositionsUpdatesForNode(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * a2), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), *(_DWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 60));
        v32 = *(_QWORD *)&threadData[18 * v41 + 2];
        v33 = v32 + 320 * v40;
        *(_DWORD *)(v33 + 312) = v24;
        v34 = *(void (**)(_QWORD))(v33 + 232);
        if (v34)
          v34(*(_QWORD *)(v32 + 320 * v40 + 288));
        dropThreadId(v41, 0, v18);
      }
      v35 = *(_QWORD *)&threadData[18 * v45 + 2];
      v36 = v35 + 320 * v44;
      *(_DWORD *)(v36 + 312) = v12;
      v37 = *(void (**)(_QWORD))(v36 + 232);
      if (v37)
        v37(*(_QWORD *)(v35 + 320 * v44 + 288));
      return (int *)dropThreadId(v45, 0, v6);
    }
  }
  else
  {
    v29 = *__error();
    v30 = _SILogForLogForCategory(0);
    v31 = 2 * (gSILogLevels[0] < 4);
    if (os_log_type_enabled(v30, v31))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8270000, v30, v31, "Skipping because index is shut down", buf, 2u);
    }
    result = __error();
    *result = v29;
  }
  return result;
}

@end
