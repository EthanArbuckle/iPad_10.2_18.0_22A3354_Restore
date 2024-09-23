@implementation OTRCreateActivityStreamForPID

void __OTRCreateActivityStreamForPID_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint32_t v9;
  int *v10;
  char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int *p_size;
  unsigned int v16;
  unsigned int v17;
  unsigned __int8 *v18;
  CFTypeID TypeID;
  CFTypeID v20;
  _BOOL4 v21;
  int *v22;
  char *v23;
  unsigned __int8 *v24;
  unint64_t v25;
  uint64_t v26;
  signed int v27;
  uint64_t v28;
  unsigned __int8 *v29;
  unsigned int v30;
  unsigned int v31;
  NSObject *v32;
  const char *v33;
  uint32_t v34;
  unsigned int v35;
  int *v36;
  char *v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  int *v42;
  char *v43;
  uint64_t v44;
  int v45;
  unsigned int size;
  unsigned __int8 size_7;
  CFTypeRef cf;
  uint8_t buf[4];
  _DWORD v50[7];

  *(_QWORD *)&v50[5] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  cf = 0;
  size_7 = 0;
  v3 = (*(uint64_t (**)(_QWORD, unsigned __int8 *, uint64_t))(mobdevtab + 8))(*v2, &size_7, 1);
  if (!v3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v7 = MEMORY[0x1E0C81028];
    v8 = "Failed to receive message type: remote side closed connection";
    goto LABEL_10;
  }
  if (v3 < 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    v10 = __error();
    v11 = strerror(*v10);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v50 = v11;
    v7 = MEMORY[0x1E0C81028];
    v8 = "receive got -1 when getting message type: %s";
    goto LABEL_13;
  }
  v4 = size_7;
  if (size_7 != 2)
  {
    if (size_7 != 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v50[0] = v4;
        v7 = MEMORY[0x1E0C81028];
        v8 = "Unknown message type: %d";
        goto LABEL_23;
      }
      goto LABEL_25;
    }
    v5 = (*(uint64_t (**)(_QWORD, CFTypeRef *, _QWORD, _QWORD))(mobdevtab + 16))(*v2, &cf, 0, 0);
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v50[0] = v6;
        v7 = MEMORY[0x1E0C81028];
        v8 = "Failed to receive response: %x";
        goto LABEL_23;
      }
      goto LABEL_25;
    }
    TypeID = CFDictionaryGetTypeID();
    v20 = CFGetTypeID(cf);
    v21 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    if (TypeID == v20)
    {
      if (!v21)
        goto LABEL_25;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v50 = cf;
      v7 = MEMORY[0x1E0C81028];
      v8 = "Got error: %p";
LABEL_13:
      v9 = 12;
      goto LABEL_24;
    }
    if (!v21)
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v7 = MEMORY[0x1E0C81028];
    v8 = "Incorrect response type";
LABEL_10:
    v9 = 2;
    goto LABEL_24;
  }
  v12 = 0;
  v13 = 0;
  size = 0;
  v14 = *v2;
  p_size = &size;
  do
  {
    v16 = (*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(mobdevtab + 8))(v14, p_size, 4 - v12);
    if (!v16)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      *(_WORD *)buf = 0;
      v7 = MEMORY[0x1E0C81028];
      v8 = "Failed to receive message size: remote side closed connection";
      goto LABEL_10;
    }
    if ((v16 & 0x80000000) != 0)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      v22 = __error();
      v23 = strerror(*v22);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v50 = v23;
      v7 = MEMORY[0x1E0C81028];
      v8 = "receive got -1 when getting message size: %s";
      goto LABEL_13;
    }
    v12 = v16 + v13;
    p_size = (unsigned int *)((char *)p_size + v16);
    v13 = v12;
  }
  while (v12 < 4);
  v17 = size;
  if (size > 0x80)
  {
    v24 = (unsigned __int8 *)malloc_type_malloc(size, 0x869AE6AFuLL);
    if (!v24)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      v35 = size;
      v36 = __error();
      v37 = strerror(*v36);
      *(_DWORD *)buf = 67109378;
      v50[0] = v35;
      LOWORD(v50[1]) = 2080;
      *(_QWORD *)((char *)&v50[1] + 2) = v37;
      v7 = MEMORY[0x1E0C81028];
      v8 = "Failed to allocate message of size %d: %s";
      v9 = 18;
      goto LABEL_24;
    }
    v18 = v24;
    v25 = size;
    if (size)
    {
      v26 = 0;
      v27 = 0;
      v28 = *v2;
      v29 = v24;
      do
      {
        v30 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, unint64_t))(mobdevtab + 8))(v28, v29, v25 - v26);
        if (!v30)
          break;
        if ((v30 & 0x80000000) != 0)
          goto LABEL_53;
        v27 += v30;
        v29 += v30;
        v26 = v27;
      }
      while (v27 < v25);
      if ((v27 & 0x80000000) == 0)
      {
        v31 = size;
        if (v27 >= (int)size)
          goto LABEL_51;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v32 = MEMORY[0x1E0C81028];
          v33 = "Failed to receive stream message: remote side closed connection";
          v34 = 2;
          goto LABEL_67;
        }
        goto LABEL_26;
      }
LABEL_53:
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      v42 = __error();
      v43 = strerror(*v42);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v50 = v43;
      v32 = MEMORY[0x1E0C81028];
      v33 = "receive got -1 when getting stream message: %s";
      v34 = 12;
    }
    else
    {
      v31 = 0;
LABEL_51:
      v38 = *(_DWORD *)(v18 + 1);
      HIDWORD(v39) = v38;
      LODWORD(v39) = v38 - 2;
      v40 = *(unsigned __int16 *)(v18 + 37) + (unint64_t)*(unsigned __int16 *)(v18 + 107) + 129;
      switch((v39 >> 1))
      {
        case 0u:
        case 7u:
          v41 = *(unsigned __int16 *)(v18 + 109);
          goto LABEL_59;
        case 1u:
          v40 += *(unsigned int *)(v18 + 109);
          v41 = *(unsigned int *)(v18 + 113);
          goto LABEL_59;
        case 3u:
          v40 += *(unsigned int *)(v18 + 109);
          v41 = *(unsigned int *)(v18 + 117) + (unint64_t)*(unsigned int *)(v18 + 121);
LABEL_59:
          v44 = v40 + v41 + 8 * *(unsigned int *)(v18 + 125);
          break;
        default:
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            v50[0] = v38;
            _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unknown message type: %u", buf, 8u);
            v44 = 0;
            v31 = size;
          }
          else
          {
            v44 = 0;
          }
          break;
      }
      if (v44 == v31)
      {
        v45 = *v18;
        if (v45 == 2)
        {
          (*(void (**)(uint64_t, unsigned __int8 *))(v1 + 16))(v1, v18);
          free(v18);
          return;
        }
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
        *(_DWORD *)buf = 67109120;
        v50[0] = v45;
        v32 = MEMORY[0x1E0C81028];
        v33 = "Received unknown message version: %hhu";
        v34 = 8;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
        *(_DWORD *)buf = 67109376;
        v50[0] = v31;
        LOWORD(v50[1]) = 2048;
        *(_QWORD *)((char *)&v50[1] + 2) = v44;
        v32 = MEMORY[0x1E0C81028];
        v33 = "Got message of size %u but expected size %zu";
        v34 = 18;
      }
    }
LABEL_67:
    _os_log_impl(&dword_19EA26000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, v34);
    goto LABEL_26;
  }
  if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    goto LABEL_25;
  *(_DWORD *)buf = 67109120;
  v50[0] = v17;
  v7 = MEMORY[0x1E0C81028];
  v8 = "Got a message size that's too small to be an OTRActivityStreamMessage: %u";
LABEL_23:
  v9 = 8;
LABEL_24:
  _os_log_impl(&dword_19EA26000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
LABEL_25:
  v18 = 0;
LABEL_26:
  dispatch_source_cancel((dispatch_source_t)v2[1]);
  free(v18);
  if (cf)
    CFRelease(cf);
}

intptr_t __OTRCreateActivityStreamForPID_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 24));
}

@end
