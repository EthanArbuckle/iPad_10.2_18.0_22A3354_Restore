@implementation OTRStartLegacyStreaming

void __OTRStartLegacyStreaming_block_invoke(_QWORD *a1)
{
  NSObject *v2;
  int64_t data;
  int64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  const char *v8;
  unint64_t v9;
  size_t v10;
  const char *v11;
  int v12;
  char *v13;
  time_t v14;
  uint64_t v15;
  time_t v16;
  char *v17;
  const char *v18;
  char *v19;
  char *v20;
  int v21;
  char *v22;
  const char *v23;
  char *v24;
  char *v25;
  const char *v26;
  char *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  size_t v34;
  char *__src;
  int v36;
  size_t v37;
  char *__endptr;
  tm v39;

  v2 = a1[6];
  data = dispatch_source_get_data(v2);
  if (data <= 0)
  {
    dispatch_source_cancel(v2);
  }
  else
  {
    v4 = data;
    v5 = (char *)_os_trace_malloc();
    (*(void (**)(_QWORD, char *, int64_t))(mobdevtab + 8))(a1[7], v5, v4);
    v6 = &v5[v4];
    v7 = *(_QWORD *)(a1[5] + 8);
    v8 = v5;
    if (*(_BYTE *)(v7 + 24))
    {
      v8 = &v5[strlen(v5) + 1];
      *(_BYTE *)(v7 + 24) = 0;
    }
    if (v8 < v6)
    {
      v9 = (unint64_t)(v6 - 1);
      while (1)
      {
        v10 = strlen(v8);
        if (*v8)
          break;
LABEL_28:
        v8 += v10 + 1;
        if (v8 >= v6)
          goto LABEL_33;
      }
      v11 = v8 - 1;
      do
        v12 = *(unsigned __int8 *)++v11;
      while (v12 == 10);
      if (v11 < v6)
      {
        memset(&v39, 0, sizeof(v39));
        v13 = strptime(v11, "%b %d %H:%M:%S ", &v39);
        v14 = mktime(&v39);
        v15 = 0;
        if (!v13)
          goto LABEL_27;
        if ((unint64_t)v13 >= v9)
          goto LABEL_27;
        v16 = v14;
        v17 = strchr(v13, 32);
        v15 = 0;
        if (!v17)
          goto LABEL_27;
        if ((unint64_t)v17 >= v9)
          goto LABEL_27;
        *v17 = 0;
        v18 = v17 + 1;
        v19 = strchr(v17 + 1, 91);
        v15 = 0;
        if (!v19)
          goto LABEL_27;
        v20 = v19;
        if ((unint64_t)v19 >= v9)
          goto LABEL_27;
        __endptr = 0;
        *v19 = 0;
        v37 = strlen(v18);
        v21 = strtol(v20 + 1, &__endptr, 10);
        v22 = strchr(__endptr, 60);
        v15 = 0;
        if (!v22)
          goto LABEL_27;
        v36 = v21;
        if ((unint64_t)v22 >= v9)
          goto LABEL_27;
        v23 = v22 + 1;
        v24 = strchr(v22 + 1, 62);
        v15 = 0;
        if (!v24)
          goto LABEL_27;
        if ((unint64_t)v24 >= v9)
          goto LABEL_27;
        *v24 = 0;
        v25 = strchr(v24 + 1, 58);
        v15 = 0;
        if (!v25 || (unint64_t)v25 >= v9)
          goto LABEL_27;
        v26 = v25 + 1;
        v27 = &v25[strlen(v25 + 1) + 1];
        if (v27 < v6)
        {
          *v27 = 0;
          __src = (char *)v26;
          v34 = strlen(v26) + 1;
          v15 = _os_trace_calloc();
          *(_QWORD *)(v15 + 55) = v16;
          *(_DWORD *)(v15 + 63) = 0;
          *(_QWORD *)(v15 + 1) = 0x8100000040;
          *(_DWORD *)(v15 + 9) = v36;
          if (!strcmp(v23, "Info"))
          {
            v32 = OTRParseLegacyLogLine_trace_id_counter++;
            v31 = (v32 << 32) | 0x104;
          }
          else
          {
            v28 = strcmp(v23, "Debug");
            v29 = OTRParseLegacyLogLine_trace_id_counter++;
            v30 = v29 << 32;
            if (v28)
              v31 = v30 | 4;
            else
              v31 = v30 | 0x204;
          }
          *(_QWORD *)(v15 + 67) = v31;
          *(_WORD *)(v15 + 37) = v37 + 1;
          v33 = strncpy((char *)(v15 + 129), v18, v37 + 1);
          *(_DWORD *)(v15 + 109) = v34;
          strncpy(&v33[v37 + 1], __src, v34);
          goto LABEL_27;
        }
      }
      v15 = 0;
LABEL_27:
      (*(void (**)(void))(a1[4] + 16))();
      free((void *)v15);
      goto LABEL_28;
    }
LABEL_33:
    free(v5);
  }
}

intptr_t __OTRStartLegacyStreaming_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 24));
}

@end
