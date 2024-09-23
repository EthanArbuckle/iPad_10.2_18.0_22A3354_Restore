@implementation SendUDPPacketCList

BOOL __SendUDPPacketCList_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  size_t v5;
  size_t *v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t *v10;
  size_t *v11;
  size_t v12;
  int *v13;
  NSObject *v14;
  int *v15;
  char *v16;
  int v17;
  OSStatus v18;
  int v19;
  NSObject *v20;
  int v22;
  char *v23;
  __int16 v24;
  int v25;
  size_t processed[2];
  __int128 v27;
  __int128 v28;
  msghdr data;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!*(_DWORD *)(a1 + 64) || (v3 = *(_QWORD *)(a1 + 48), !*(_DWORD *)(v3 + 624)))
  {
    memset(&data.msg_namelen, 0, 40);
    *(_OWORD *)processed = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = *(unsigned int *)(a2 + 24);
    if ((int)v8 >= 1)
    {
      v9 = 0;
      v10 = (size_t *)(*(_QWORD *)(a2 + 16) + 8);
      v11 = &processed[1];
      do
      {
        *(v11 - 1) = *(v10 - 1);
        v12 = *v10;
        v10 += 2;
        *v11 = v12;
        v11 += 2;
        ++v9;
      }
      while (v8 != v9);
      data.msg_iovlen = v9;
    }
    data.msg_iov = (iovec *)processed;
    v13 = *(int **)(a1 + 48);
    data.msg_name = *(void **)(a1 + 56);
    data.msg_namelen = *(_DWORD *)(a1 + 68);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sendmsg(*v13, &data, 0);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == -1)
    {
      v14 = gcks_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = __error();
        v16 = strerror(*v15);
        v17 = *__error();
        v22 = 136315394;
        v23 = v16;
        v24 = 1024;
        v25 = v17;
        _os_log_impl(&dword_20DC1A000, v14, OS_LOG_TYPE_DEFAULT, "Sendmsg failed with error %s (%d).", (uint8_t *)&v22, 0x12u);
      }
      goto LABEL_18;
    }
LABEL_19:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *(double *)(*(_QWORD *)(a1 + 48) + 48) = micro();
    return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 0;
  }
  v4 = *(unsigned int *)(a2 + 24);
  if ((int)v4 < 1)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    v6 = (size_t *)(*(_QWORD *)(a2 + 16) + 8);
    do
    {
      memcpy((char *)&data + v5, (const void *)*(v6 - 1), *v6);
      v7 = *v6;
      v6 += 2;
      v5 += v7;
      --v4;
    }
    while (v4);
  }
  processed[0] = 0;
  v18 = SSLWrite(*(SSLContextRef *)(v3 + 632), &data, v5, processed);
  if (!v18)
    goto LABEL_19;
  v19 = v18;
  v20 = gcks_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    __SendUDPPacketCList_block_invoke_cold_1((uint64_t *)(a1 + 48), v19, v20);
LABEL_18:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *__error() | 0xC01A0000;
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 0;
}

void __SendUDPPacketCList_block_invoke_cold_1(uint64_t *a1, int a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  int *v11;
  char *v12;
  int v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v6 = *(_DWORD *)(*a1 + 88);
  v7 = *(_DWORD *)(*a1 + 72);
  v8 = *(_QWORD *)(*a1 + 632);
  v9 = DTLSErrorName(a2);
  v10 = a2;
  v11 = __error();
  v12 = strerror(*v11);
  v13 = *__error();
  v14[0] = 67110914;
  v14[1] = v6;
  v15 = 1024;
  v16 = v7;
  v17 = 2048;
  v18 = v8;
  v19 = 2048;
  v20 = v5;
  v21 = 2080;
  v22 = v9;
  v23 = 2048;
  v24 = v10;
  v25 = 2080;
  v26 = v12;
  v27 = 1024;
  v28 = v13;
  _os_log_error_impl(&dword_20DC1A000, a3, OS_LOG_TYPE_ERROR, "SSLWrite failed, packet was not sent for participant [%08X] channelID [%d] DTLS context [%p] pCList [%p]; SSLError ="
    " %s (%ld): errno = %s (%d).",
    (uint8_t *)v14,
    0x46u);
}

@end
