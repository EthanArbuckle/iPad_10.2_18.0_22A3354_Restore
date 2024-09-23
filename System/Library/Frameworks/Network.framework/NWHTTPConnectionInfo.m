@implementation NWHTTPConnectionInfo

void __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD *v7;
  id *v8;
  void *v9;
  int v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];
  _QWORD v14[4];
  id v15;
  int v16;

  v4 = *(_QWORD *)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    if (v4)
      v6 = *(_QWORD *)(v4 + 16);
    else
      v6 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_3;
    v12[3] = &unk_1E14AB060;
    v7 = v12;
    v8 = (id *)v13;
    v13[0] = *(id *)(a1 + 40);
    v13[1] = a3;
    if (!v6)
      goto LABEL_15;
LABEL_14:
    -[NWURLSessionDelegateQueue runDelegateBlock:](*(_QWORD **)(v6 + 48), v7);
    goto LABEL_15;
  }
  if (v4)
    v9 = *(void **)(v4 + 8);
  else
    v9 = 0;
  if (nw_http_connection_metadata_get_is_closed(v9))
    v10 = 57;
  else
    v10 = 45;
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v6 = *(_QWORD *)(v11 + 16);
  else
    v6 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_2;
  v14[3] = &unk_1E14AC408;
  v7 = v14;
  v8 = &v15;
  v15 = *(id *)(a1 + 40);
  v16 = v10;
  if (v6)
    goto LABEL_14;
LABEL_15:

}

void __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 40), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, double))(v1 + 16))(v1, v2, 0.0);

}

uint64_t __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = dword_1ECD84D64;
  if (!dword_1ECD84D64)
  {
    mach_timebase_info((mach_timebase_info_t)&time_base);
    v3 = dword_1ECD84D64;
  }
  return (*(uint64_t (**)(uint64_t, _QWORD, double))(v1 + 16))(v1, 0, (double)(v2 * (unint64_t)time_base / v3) * 0.000000001);
}

@end
