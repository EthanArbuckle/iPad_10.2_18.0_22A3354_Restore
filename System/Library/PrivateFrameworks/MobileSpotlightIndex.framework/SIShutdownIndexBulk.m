@implementation SIShutdownIndexBulk

uint64_t ___SIShutdownIndexBulk_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  unsigned int v6;
  int v7;
  unint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void (*v14)(_QWORD);
  int v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD);
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, _BYTE *);
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char *v33;
  char *v34;
  const char *v35;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  _BYTE buf[32];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  makeThreadId();
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(a1 + 72) != *(_DWORD *)(*(_QWORD *)v4 + 1404))
  {
    v33 = __si_assert_copy_extra_521(-1);
    v34 = v33;
    v35 = "";
    if (v33)
      v35 = v33;
    __message_assert("%s:%u: failed assertion '%s' %s ", "SpotlightIndex.c", 14724, "indexSpindleId==si_indices[0]->indexSpindleId", v35);
    free(v34);
    if (__valid_fs(-1))
      v36 = 2989;
    else
      v36 = 3072;
    *(_DWORD *)v36 = -559038737;
    abort();
  }
  result = *(_QWORD *)(v4 + 8 * a2);
  if (!*(_BYTE *)(result + 1280))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a2) = _SIShutdownSetup(result);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a2))
    {
      do
      {
        v6 = __ldxr(exceptionSequenceNum);
        v7 = v6 + 1;
      }
      while (__stxr(v6 + 1, exceptionSequenceNum));
      v8 = setThreadIdAndInfo(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * a2) + 32), sFdExceptionCallbacks, 0, 1, v7);
      v39 = HIDWORD(v8);
      v40 = v8;
      v37 = v10;
      v38 = v9;
      v11 = *(_QWORD *)&threadData[18 * v8 + 2];
      v12 = v11 + 320 * HIDWORD(v8);
      *(_BYTE *)(v12 + 216) = 0;
      v13 = *(_DWORD *)(v12 + 312);
      v14 = *(void (**)(_QWORD))(v12 + 224);
      if (v14)
        v14(*(_QWORD *)(v11 + 320 * HIDWORD(v8) + 288));
      if (_setjmp((int *)v12))
      {
        v15 = *__error();
        v16 = _SILogForLogForCategory(0);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "_SIShutdownIndexBulk_block_invoke";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 14739;
          _os_log_error_impl(&dword_1B8270000, v16, OS_LOG_TYPE_ERROR, "%s:%d: Caught mach exception", buf, 0x12u);
        }
        *__error() = v15;
        *(_DWORD *)(v12 + 312) = v13;
        CIOnThreadCleanUpReset(v37);
        dropThreadId(v40, 1, v7);
        CICleanUpReset(v40, v38);
      }
      else
      {
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a2);
        if (v17)
        {
          if (!_CISyncContextSync(v17, 0))
          {
            v22 = *(uint64_t **)(*(_QWORD *)(a1 + 40) + 8 * a2);
            if (v22)
            {
              if (!_CISyncContextCommitData(v22, 0, *(_QWORD *)(a1 + 48) + 104 * *(_QWORD *)(a1 + 56)))
              {
                v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a2);
                if (v23)
                {
                  if (!_CISyncContextCommitHeader(v23))
                  {
                    v24 = *(_QWORD *)(a1 + 48) + 104 * a2;
                    if (CIDocCountsNonEmpty((_QWORD *)v24))
                    {
                      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a2);
                      v27 = *(void (**)(uint64_t, _BYTE *))(v25 + 72);
                      v26 = *(_QWORD *)(v25 + 80);
                      v28 = *(_OWORD *)v24;
                      v29 = *(_OWORD *)(v24 + 32);
                      *(_OWORD *)&buf[16] = *(_OWORD *)(v24 + 16);
                      v42 = v29;
                      *(_OWORD *)buf = v28;
                      v30 = *(_OWORD *)(v24 + 48);
                      v31 = *(_OWORD *)(v24 + 64);
                      v32 = *(_OWORD *)(v24 + 80);
                      v46 = *(_QWORD *)(v24 + 96);
                      v44 = v31;
                      v45 = v32;
                      v43 = v30;
                      v27(v26, buf);
                    }
                  }
                }
              }
            }
          }
        }
        v18 = *(_QWORD *)&threadData[18 * v40 + 2];
        v19 = v18 + 320 * v39;
        *(_DWORD *)(v19 + 312) = v13;
        v20 = *(void (**)(_QWORD))(v19 + 232);
        if (v20)
          v20(*(_QWORD *)(v18 + 320 * v39 + 288));
        dropThreadId(v40, 0, v7);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a2);
      if (v21)
        _CISyncContextDestroy(v21);
    }
    result = _SIShutdownComplete(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * a2));
    *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * a2) = 0;
  }
  return result;
}

@end
