@implementation BulkPositionIterator

void __BulkPositionIterator_Step_Compressed_block_invoke(uint64_t a1, uint64_t a2)
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
  unsigned int v16;
  int v17;
  unint64_t v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD);
  int v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  os_log_type_t v28;
  unsigned int *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  unsigned int *v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(_QWORD);
  uint64_t v40;
  uint64_t v41;
  void (*v42)(_QWORD);
  int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  char v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  makeThreadId();
  v4 = *(_QWORD *)(a1 + 40);
  v53 = *(_QWORD *)(a1 + 32);
  v54 = 0u;
  v55 = 0u;
  v56 = 0;
  v52 = 1;
  if (*(_BYTE *)(v4 + 8))
  {
    do
    {
      v5 = __ldxr(exceptionSequenceNum);
      v6 = v5 + 1;
    }
    while (__stxr(v5 + 1, exceptionSequenceNum));
    v7 = setThreadIdAndInfo(-1, (__int128 *)sIndexExceptionCallbacks, v4, 0, v6);
    v50 = HIDWORD(v7);
    v51 = v7;
    v48 = v9;
    v49 = v8;
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
        v58 = "BulkPositionIterator_Step_Compressed_block_invoke";
        v59 = 1024;
        v60 = 5072;
        _os_log_error_impl(&dword_1B8270000, v15, OS_LOG_TYPE_ERROR, "%s:%d: Caught mach exception", buf, 0x12u);
      }
      *__error() = v14;
      *(_DWORD *)(v11 + 312) = v12;
      CIOnThreadCleanUpReset(v48);
      dropThreadId(v51, 1, v6);
      CICleanUpReset(v51, v49);
    }
    else
    {
      do
      {
        v16 = __ldxr(exceptionSequenceNum);
        v17 = v16 + 1;
      }
      while (__stxr(v16 + 1, exceptionSequenceNum));
      v18 = setThreadIdAndInfo(-1, sAssertExceptionCallbacks, 0, 0, v17);
      v46 = HIDWORD(v18);
      v47 = v18;
      v44 = v20;
      v45 = v19;
      v21 = *(_QWORD *)&threadData[18 * v18 + 2];
      v22 = v21 + 320 * HIDWORD(v18);
      v43 = *(_DWORD *)(v22 + 312);
      v23 = *(void (**)(_QWORD))(v22 + 224);
      if (v23)
        v23(*(_QWORD *)(v21 + 320 * HIDWORD(v18) + 288));
      if (_setjmp((int *)v22))
      {
        v24 = *__error();
        v25 = _SILogForLogForCategory(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v58 = "BulkPositionIterator_Step_Compressed_block_invoke";
          v59 = 1024;
          v60 = 5071;
          _os_log_error_impl(&dword_1B8270000, v25, OS_LOG_TYPE_ERROR, "%s:%d: Caught mach exception", buf, 0x12u);
        }
        *__error() = v24;
        *(_DWORD *)(v22 + 312) = v43;
        CIOnThreadCleanUpReset(v44);
        dropThreadId(v47, 1, v17);
        CICleanUpReset(v47, v45);
      }
      else
      {
        v29 = *(unsigned int **)(a1 + 48);
        do
          v30 = __ldxr(v29);
        while (__stxr(v30 + 1, v29));
        if (v30 < *(_DWORD *)(a1 + 160))
        {
          do
          {
            v31 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v30);
            v32 = v30;
            v33 = *(_QWORD *)(a1 + 120) + 392 * a2 + 24;
            do
              v34 = PositionIterate_Compressed(v31, (uint64_t)&v53, v33, *(_DWORD **)(a1 + 128), *(_DWORD *)(a1 + 164), *(_DWORD *)(a1 + 168), *(_BYTE **)(a1 + 136));
            while (v34 == 1);
            if (v34 == 2)
              *(_BYTE *)(*(_QWORD *)(a1 + 144) + v32) = 1;
            v35 = *(unsigned int **)(a1 + 48);
            do
              v36 = __ldxr(v35);
            while (__stxr(v36 + 1, v35));
            v30 = v36;
          }
          while (v36 < *(_DWORD *)(a1 + 160));
        }
        v52 = 0;
        v37 = *(_QWORD *)&threadData[18 * v47 + 2];
        v38 = v37 + 320 * v46;
        *(_DWORD *)(v38 + 312) = v43;
        v39 = *(void (**)(_QWORD))(v38 + 232);
        if (v39)
          v39(*(_QWORD *)(v37 + 320 * v46 + 288));
        dropThreadId(v47, 0, v17);
      }
      v40 = *(_QWORD *)&threadData[18 * v51 + 2];
      v41 = v40 + 320 * v50;
      *(_DWORD *)(v41 + 312) = v12;
      v42 = *(void (**)(_QWORD))(v41 + 232);
      if (v42)
        v42(*(_QWORD *)(v40 + 320 * v50 + 288));
      dropThreadId(v51, 0, v6);
    }
  }
  else
  {
    v26 = *__error();
    v27 = _SILogForLogForCategory(0);
    v28 = 2 * (gSILogLevels[0] < 4);
    if (os_log_type_enabled(v27, v28))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8270000, v27, v28, "Skipping because index is shut down", buf, 2u);
    }
    *__error() = v26;
  }
  if (v52)
    **(_BYTE **)(a1 + 152) = 1;
  CIIndexSetDisposePerThreadCache(&v53);
}

@end
