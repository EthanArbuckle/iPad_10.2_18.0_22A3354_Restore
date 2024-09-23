@implementation NEIPSecDBCreateStatsTimer

void __NEIPSecDBCreateStatsTimer_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  int v3;
  int v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  unsigned int v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 104);
  if (v2)
  {
    v3 = *(_DWORD *)(a1 + 48);
    v4 = *(_DWORD *)(a1 + 52);
    while (1)
    {
      v5 = *v2;
      if (v3)
      {
        if (*((_DWORD *)v2 + 4) == v3)
          break;
      }
      if (v4 && *((_DWORD *)v2 + 5) == v4)
        break;
      v2 = (_QWORD *)*v2;
      if (!v5)
        goto LABEL_8;
    }
    v8 = 0;
    v7 = (unsigned int *)v2;
  }
  else
  {
LABEL_8:
    v6 = (unsigned int *)malloc_type_calloc(1uLL, 0x58uLL, 0x10A0040BC06665BuLL);
    if (!v6)
      return;
    v7 = v6;
    v2 = 0;
    v6[4] = *(_DWORD *)(a1 + 48);
    v6[5] = *(_DWORD *)(a1 + 52);
    v8 = 1;
  }
  v9 = *(_DWORD *)(a1 + 56) / 0x14u;
  if (v9 <= 2)
    v9 = 2;
  v10 = v7[10];
  v11 = v10 - 1;
  if (v10 - 1 >= v9)
  {
    v7[10] = v9;
    v10 = v9;
  }
  v12 = *(_DWORD *)(a1 + 60);
  if (v12 == 1)
  {
    if (*(_DWORD *)(a1 + 56) > v10)
      v10 = *(_DWORD *)(a1 + 56);
    v7[9] = v10;
  }
  else if (!v12)
  {
    if (*(_DWORD *)(a1 + 56) > v10)
      v10 = *(_DWORD *)(a1 + 56);
    v7[8] = v10;
  }
  if (v11 < v9)
    goto LABEL_35;
  v13 = *((_QWORD *)v7 + 3);
  if (v13)
  {
    if (!dispatch_source_testcancel(*((dispatch_source_t *)v7 + 3)))
      dispatch_source_cancel(v13);
    *((_QWORD *)v7 + 3) = 0;
  }
  v14 = ne_log_obj();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_DWORD *)(a1 + 48);
    v16 = *(_DWORD *)(a1 + 52);
    v17 = v7[10];
    *(_DWORD *)buf = 136315906;
    v26 = "NEIPSecDBCreateStatsTimer_block_invoke";
    v27 = 1024;
    v28 = v15;
    v29 = 1024;
    v30 = v16;
    v31 = 1024;
    v32 = v17;
    _os_log_impl(&dword_19BD16000, v14, OS_LOG_TYPE_DEFAULT, "%s: Starting stat timeout (SAs in:%d out:%d) Polling: every %d", buf, 0x1Eu);
  }
  v18 = _NEIPSecDBGetQueue();
  v19 = 1000 * v7[10];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 0x40000000;
  v24[2] = __NEIPSecDBCreateStatsTimer_block_invoke_164;
  v24[3] = &__block_descriptor_tmp_165;
  v20 = *(_QWORD *)(a1 + 40);
  v24[4] = v7;
  v24[5] = v20;
  v24[6] = *(_QWORD *)(a1 + 48);
  v21 = NERepeatingEventCreate(v18, 0, 0, v19, 0, 0, v24, 0);
  *((_QWORD *)v7 + 3) = v21;
  if (v21)
  {
    if (v8)
    {
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104);
      *(_QWORD *)v7 = v22;
      if (v22)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) + 8) = v7;
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) = v7;
      *((_QWORD *)v7 + 1) = *(_QWORD *)(a1 + 40) + 104;
    }
LABEL_35:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return;
  }
  if ((v8 & 1) == 0)
  {
    v23 = *v2;
    if (*v2)
      *(_QWORD *)(v23 + 8) = v2[1];
    *(_QWORD *)v2[1] = v23;
  }
  free(v7);
}

void __NEIPSecDBCreateStatsTimer_block_invoke_164(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v4;
  int v5;
  _OWORD *v6;
  _OWORD *v7;
  UInt8 *v8;
  UInt8 *v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  UInt8 *v12;
  const __CFDictionary *v13;
  int v14;
  UInt8 *v15;
  int v16;
  int v17;
  char v18;
  NSObject *v19;
  dispatch_queue_t v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  const char *v27;
  uint8_t buf[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v1 + 72) = 0;
  *(_QWORD *)(v1 + 64) = 0;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v5 = *(_DWORD *)(a1 + 48);
    v4 = *(_DWORD *)(a1 + 52);
    *(_DWORD *)buf = 0;
    v6 = malloc_type_calloc(1uLL, 0x28uLL, 0x10000400A747E1EuLL);
    if (!v6)
      return;
    v7 = v6;
    v8 = (UInt8 *)malloc_type_calloc(1uLL, 0x28uLL, 0x10000400A747E1EuLL);
    if (!v8)
    {
      free(v7);
      return;
    }
    v9 = v8;
    *((_QWORD *)v7 + 4) = 0;
    *v7 = 0u;
    v7[1] = 0u;
    *((_QWORD *)v8 + 4) = 0;
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    v10 = NEGetValueFromIntKeyedDictionary(*(const __CFDictionary **)(v2 + 80), v5);
    v11 = v10;
    if (v10)
    {
      if (!NEIPSecDBFilloutBasicSAInfo(v10, 0, 0, buf, 0, 0, 0))
      {
        v14 = 0;
        v15 = 0;
        v12 = 0;
        goto LABEL_17;
      }
      *(_DWORD *)v7 = *(_DWORD *)buf;
      v12 = (UInt8 *)v7;
    }
    else
    {
      v12 = 0;
    }
    v13 = NEGetValueFromIntKeyedDictionary(*(const __CFDictionary **)(v2 + 80), v4);
    if (v13 && NEIPSecDBFilloutBasicSAInfo(v13, 0, 0, buf, 0, 0, 0))
    {
      *(_DWORD *)v9 = *(_DWORD *)buf;
      v14 = 1;
      v15 = v9;
      if (!v11)
      {
LABEL_17:
        free(v7);
        v16 = 0;
        if (v14)
          goto LABEL_18;
        goto LABEL_15;
      }
    }
    else
    {
      v15 = 0;
      v14 = 0;
      if (!v11)
        goto LABEL_17;
    }
    v16 = 1;
    if (v14)
    {
LABEL_18:
      v17 = 1;
      goto LABEL_19;
    }
LABEL_15:
    free(v9);
    v17 = 0;
LABEL_19:
    v18 = v16 ^ 1;
    if (!v12)
      v18 = 1;
    if ((v18 & 1) == 0)
    {
      *(_OWORD *)buf = *(unsigned int *)(a1 + 48);
      v19 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 64);
      v20 = _NEIPSecDBGetQueue();
      if (!NEPFKeySendGetStats(v19, (uint64_t)v20, 0, (unint64_t *)buf, 1, 1, v12, v16))
      {
        v21 = ne_log_obj();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v26 = 136315138;
          v27 = "NEIPSecDBCreateStatsTimer_block_invoke";
          _os_log_error_impl(&dword_19BD16000, v21, OS_LOG_TYPE_ERROR, "%s: failed to send stats request for inbound SA\n", (uint8_t *)&v26, 0xCu);
        }
      }
      free(v12);
      ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 64);
    }
    if (v14 && v15)
    {
      *(_OWORD *)buf = *(unsigned int *)(a1 + 52);
      v22 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 64);
      v23 = _NEIPSecDBGetQueue();
      if (!NEPFKeySendGetStats(v22, (uint64_t)v23, 0, (unint64_t *)buf, 1, 2, v15, v17))
      {
        v24 = ne_log_obj();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v26 = 136315138;
          v27 = "NEIPSecDBCreateStatsTimer_block_invoke";
          _os_log_error_impl(&dword_19BD16000, v24, OS_LOG_TYPE_ERROR, "%s: failed to send stats request for outbound SA\n", (uint8_t *)&v26, 0xCu);
        }
      }
      free(v15);
      ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 64);
    }
    return;
  }
  v25 = ne_log_obj();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "NEIPSecDBStatsCreateArrays";
    _os_log_fault_impl(&dword_19BD16000, v25, OS_LOG_TYPE_FAULT, "%s called with null session", buf, 0xCu);
  }
}

@end
