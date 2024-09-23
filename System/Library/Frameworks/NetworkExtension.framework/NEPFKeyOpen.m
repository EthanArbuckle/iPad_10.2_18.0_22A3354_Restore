@implementation NEPFKeyOpen

uint64_t __NEPFKeyOpen_block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __NEPFKeyOpen_block_invoke_2(uint64_t a1)
{
  ssize_t v2;
  ssize_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  NSObject *v8;
  int v9;
  char *v10;
  msghdr v11;
  uint8_t buf[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _BYTE v28[8192];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27[0] = v28;
  v27[1] = 0x2000;
  *(_OWORD *)&v11.msg_control = 0u;
  *(_OWORD *)&v11.msg_name = 0u;
  v11.msg_iov = (iovec *)v27;
  *(_QWORD *)&v11.msg_iovlen = 1;
  while (1)
  {
    bzero(v28, 0x2000uLL);
    v2 = recvmsg(*(_DWORD *)(a1 + 48), &v11, 0);
    v3 = v2;
    if (v2 < 1)
      break;
    if ((unint64_t)v2 <= 0xF)
    {
      v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        return;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v3;
      v5 = "Invalid PFKey message size: %zu";
LABEL_16:
      v6 = v8;
      v7 = 12;
LABEL_17:
      _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
      return;
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    *(_OWORD *)buf = 0u;
    if (!pfkey_align((uint64_t)v28, (uint64_t)buf) && !pfkey_check((unsigned __int8 **)buf))
      (*(void (**)(uint8_t *, uint64_t, _QWORD))(a1 + 32))(buf, 30, *(_QWORD *)(a1 + 40));
  }
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return;
    *(_WORD *)buf = 0;
    v5 = "PFKey socket received EOF";
    v6 = v4;
    v7 = 2;
    goto LABEL_17;
  }
  v9 = *__error();
  if (v9 != 35)
  {
    v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = strerror(v9);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v10;
      v5 = "PFKey socket received error: %s";
      goto LABEL_16;
    }
  }
}

@end
