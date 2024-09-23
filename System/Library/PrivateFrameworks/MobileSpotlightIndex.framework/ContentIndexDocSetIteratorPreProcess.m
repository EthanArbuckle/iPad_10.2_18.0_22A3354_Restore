@implementation ContentIndexDocSetIteratorPreProcess

int *__ContentIndexDocSetIteratorPreProcess_block_invoke(uint64_t a1, uint64_t a2)
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
  void *v16;
  void *v17;
  uint64_t v18;
  _DWORD *v19;
  unsigned int *v20;
  unsigned int v21;
  int *result;
  unsigned int v23;
  int v24;
  unint64_t v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void (*v31)(_QWORD);
  _DWORD *v32;
  int v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _DWORD *v38;
  unsigned int *v39;
  unsigned int v40;
  int v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(_QWORD);
  uint64_t v47;
  uint64_t v48;
  void (*v49)(_QWORD);
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
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
    v56 = HIDWORD(v7);
    v57 = v7;
    v54 = v9;
    v55 = v8;
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
        v59 = "ContentIndexDocSetIteratorPreProcess_block_invoke";
        v60 = 1024;
        v61 = 3457;
        _os_log_error_impl(&dword_1B8270000, v15, OS_LOG_TYPE_ERROR, "%s:%d: Caught mach exception", buf, 0x12u);
      }
      *__error() = v14;
      *(_DWORD *)(v11 + 312) = v12;
      if (__THREAD_SLOT_KEY)
      {
        v16 = pthread_getspecific(__THREAD_SLOT_KEY);
        if (!v16)
          goto LABEL_36;
      }
      else
      {
        makeThreadId();
        v16 = pthread_getspecific(__THREAD_SLOT_KEY);
        if (!v16)
          goto LABEL_36;
      }
      v17 = v16;
      if ((unint64_t)v16 < 0x801)
      {
LABEL_11:
        v18 = (uint64_t)v17 - 1;
        v19 = &threadData[18 * ((uint64_t)v17 - 1)];
        v21 = v19[14];
        v20 = v19 + 14;
        if (v21 > v54)
        {
          do
            CIOnThreadCleanUpPop(v18);
          while (*v20 > v54);
        }
        dropThreadId(v57, 1, v6);
        return (int *)CICleanUpReset(v57, v55);
      }
LABEL_36:
      makeThreadId();
      v17 = pthread_getspecific(__THREAD_SLOT_KEY);
      goto LABEL_11;
    }
    do
    {
      v23 = __ldxr(exceptionSequenceNum);
      v24 = v23 + 1;
    }
    while (__stxr(v23 + 1, exceptionSequenceNum));
    v25 = setThreadIdAndInfo(-1, sAssertExceptionCallbacks, 0, 0, v24);
    v52 = HIDWORD(v25);
    v53 = v25;
    v50 = v27;
    v51 = v26;
    v28 = *(_QWORD *)&threadData[18 * v25 + 2];
    v29 = v28 + 320 * HIDWORD(v25);
    v30 = *(_DWORD *)(v29 + 312);
    v31 = *(void (**)(_QWORD))(v29 + 224);
    if (v31)
      v31(*(_QWORD *)(v28 + 320 * HIDWORD(v25) + 288));
    if (!_setjmp((int *)v29))
    {
      ContentIndexDocSetIteratorPreProcessNode(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * a2), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), *(_DWORD *)(a1 + 56));
      v44 = *(_QWORD *)&threadData[18 * v53 + 2];
      v45 = v44 + 320 * v52;
      *(_DWORD *)(v45 + 312) = v30;
      v46 = *(void (**)(_QWORD))(v45 + 232);
      if (v46)
        v46(*(_QWORD *)(v44 + 320 * v52 + 288));
      dropThreadId(v53, 0, v24);
      goto LABEL_32;
    }
    v32 = (_DWORD *)(v29 + 312);
    v33 = *__error();
    v34 = _SILogForLogForCategory(0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "ContentIndexDocSetIteratorPreProcess_block_invoke";
      v60 = 1024;
      v61 = 3456;
      _os_log_error_impl(&dword_1B8270000, v34, OS_LOG_TYPE_ERROR, "%s:%d: Caught mach exception", buf, 0x12u);
    }
    *__error() = v33;
    *v32 = v30;
    if (__THREAD_SLOT_KEY)
    {
      v35 = pthread_getspecific(__THREAD_SLOT_KEY);
      if (!v35)
        goto LABEL_38;
    }
    else
    {
      makeThreadId();
      v35 = pthread_getspecific(__THREAD_SLOT_KEY);
      if (!v35)
        goto LABEL_38;
    }
    v36 = v35;
    if ((unint64_t)v35 < 0x801)
    {
LABEL_23:
      v37 = (uint64_t)v36 - 1;
      v38 = &threadData[18 * ((uint64_t)v36 - 1)];
      v40 = v38[14];
      v39 = v38 + 14;
      if (v40 > v50)
      {
        do
          CIOnThreadCleanUpPop(v37);
        while (*v39 > v50);
      }
      dropThreadId(v53, 1, v24);
      CICleanUpReset(v53, v51);
LABEL_32:
      v47 = *(_QWORD *)&threadData[18 * v57 + 2];
      v48 = v47 + 320 * v56;
      *(_DWORD *)(v48 + 312) = v12;
      v49 = *(void (**)(_QWORD))(v48 + 232);
      if (v49)
        v49(*(_QWORD *)(v47 + 320 * v56 + 288));
      return (int *)dropThreadId(v57, 0, v6);
    }
LABEL_38:
    makeThreadId();
    v36 = pthread_getspecific(__THREAD_SLOT_KEY);
    goto LABEL_23;
  }
  v41 = *__error();
  v42 = _SILogForLogForCategory(0);
  v43 = 2 * (gSILogLevels[0] < 4);
  if (os_log_type_enabled(v42, v43))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8270000, v42, v43, "Skipping because index is shut down", buf, 2u);
  }
  result = __error();
  *result = v41;
  return result;
}

@end
