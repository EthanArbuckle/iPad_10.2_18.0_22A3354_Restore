@implementation APTransportStreamEnableReverseControl

void __APTransportStreamEnableReverseControl_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t DerivedStorage;
  int v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t CMBaseObject;
  uint64_t (*v11)(uint64_t, const __CFString *, uint64_t);
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t);
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, const void *, uint64_t, uint64_t, uint64_t);
  int v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  int v26;

  v2 = *(const void **)(a1 + 40);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_APTransportStream <= 30
    && (gLogCategory_APTransportStream != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_BYTE *)(DerivedStorage + 72))
  {
    APSLogErrorAt();
    v26 = -16617;
    goto LABEL_31;
  }
  v4 = *(_DWORD *)(DerivedStorage + 24);
  v5 = 48;
  if (!v4)
    v5 = 56;
  v6 = *(_QWORD *)(DerivedStorage + v5);
  if (*(_BYTE *)(v6 + 9))
  {
    v26 = 0;
    goto LABEL_31;
  }
  v7 = v4 == 0;
  v8 = 56;
  if (v7)
    v8 = 48;
  v9 = *(_QWORD *)(*(_QWORD *)(DerivedStorage + v8) + 40);
  if (v9)
  {
    CMBaseObject = APTransportConnectionGetCMBaseObject(*(_QWORD *)(v6 + 24));
    v11 = *(uint64_t (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 56);
    if (!v11)
    {
      v26 = -12782;
      goto LABEL_30;
    }
    v12 = v11(CMBaseObject, CFSTR("RemoteNetworkIPAddress"), v9);
    if (v12)
    {
      v26 = v12;
      goto LABEL_30;
    }
  }
  v13 = *(_QWORD *)(DerivedStorage + 120);
  if (v13)
  {
    v14 = *(_QWORD *)(DerivedStorage + 128);
    if (v14)
    {
      v15 = *(_QWORD *)(v6 + 24);
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
      if (!v16)
      {
        v26 = -12782;
        goto LABEL_30;
      }
      v17 = v16(v15, v13, v14);
      if (v17)
      {
        v26 = v17;
        goto LABEL_30;
      }
    }
  }
  v19 = *(_QWORD *)(v6 + 24);
  v18 = *(_QWORD *)(v6 + 32);
  v20 = *(_QWORD *)(DerivedStorage + 184);
  v21 = *(_QWORD *)(DerivedStorage + 96);
  v22 = *(uint64_t (**)(uint64_t, const void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 16);
  if (!v22)
  {
    v26 = -12782;
    goto LABEL_30;
  }
  v23 = v22(v19, v2, v18, v20, v21);
  if (v23)
  {
    v26 = v23;
    goto LABEL_30;
  }
  v24 = *(_QWORD *)(v6 + 24);
  v25 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v25)
  {
    v26 = -12782;
    goto LABEL_30;
  }
  v26 = v25(v24);
  if (v26)
  {
LABEL_30:
    APSLogErrorAt();
    goto LABEL_31;
  }
  *(_BYTE *)(v6 + 9) = 1;
  stream_postCachedConnectionEvent(v2, v6);
LABEL_31:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v26;
}

@end
