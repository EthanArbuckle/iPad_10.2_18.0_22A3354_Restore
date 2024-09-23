@implementation AsyncConnection

void ___AsyncConnection_StartNANDataSession_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int *v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[3];
  int v22;

  v9 = *(int **)(*(_QWORD *)(a1 + 40) + 144);
  v10 = *v9;
  if (a2)
  {
    if (v10 <= 90)
    {
      if (v10 == -1)
      {
        if (!_LogCategory_Initialize(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 144), 0x5Au))
          goto LABEL_9;
        v9 = *(int **)(*(_QWORD *)(a1 + 40) + 144);
      }
      v12 = objc_msgSend(*(id *)(a1 + 32), "peerEndpoint");
      LogPrintF((uint64_t)v9, (uint64_t)"OSStatus _AsyncConnection_StartNANDataSession(AsyncConnectionRef, CFTypeRef)_block_invoke", 0x5Au, (uint64_t)"### NAN data session failed: %@, %{error}\n", v13, v14, v15, v16, v12);
    }
LABEL_9:
    v17 = *(_QWORD *)(a1 + 48);
    v18 = objc_msgSend(a2, "code");
    if (v18)
      v19 = v18;
    else
      v19 = 4294960596;
    _AsyncConnection_ErrorHandler(v17, v19);
    _AsyncConnection_ReleaseOperation(*(_DWORD **)(a1 + 48));
    return;
  }
  if (v10 <= 50)
  {
    if (v10 == -1)
    {
      if (!_LogCategory_Initialize(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 144), 0x32u))
        goto LABEL_14;
      v9 = *(int **)(*(_QWORD *)(a1 + 40) + 144);
    }
    LogPrintF((uint64_t)v9, (uint64_t)"OSStatus _AsyncConnection_StartNANDataSession(AsyncConnectionRef, CFTypeRef)_block_invoke", 0x32u, (uint64_t)"NAN data session started: %@\n", a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  }
LABEL_14:
  memset(v21, 0, sizeof(v21));
  v22 = 0;
  v20 = *(void **)(a1 + 32);
  if (v20)
  {
    objc_msgSend(v20, "peerAddress");
    v20 = *(void **)(a1 + 32);
  }
  _AsyncConnection_StartConnectNow(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (uint64_t)v21, objc_msgSend(v20, "localInterfaceIndex"), *(_DWORD *)(*(_QWORD *)(a1 + 40) + 16));
  _AsyncConnection_ReleaseOperation(*(_DWORD **)(a1 + 48));
}

@end
