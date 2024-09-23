@implementation APAdvertiserSetProperty

void __APAdvertiserSetProperty_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  const void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _QWORD block[6];
  _QWORD v18[3];
  int v19;

  if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("advertiserInfo")))
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(const void **)(a1 + 56);
    block[0] = 0;
    v4 = *(const void **)(v2 + 72);
    if (v4 == v3 || v3 && v4 && CFEqual(v4, v3))
    {
      v5 = 0;
    }
    else
    {
      v9 = APAdvertiserInfoCopy(*MEMORY[0x24BDBD240], (uint64_t)v3, block);
      if (v9)
      {
        v5 = v9;
      }
      else
      {
        v10 = *(const void **)(v2 + 72);
        if (v10)
          CFRelease(v10);
        *(_QWORD *)(v2 + 72) = block[0];
        *(_BYTE *)(v2 + 80) = 1;
        v5 = _APAdvertiserUpdate(v2);
        if (!v5)
          goto LABEL_15;
      }
      APSLogErrorAt();
    }
LABEL_15:
    *(_BYTE *)(v2 + 80) = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      APSLogErrorAt();
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("P2PConfig")))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _APAdvertiserProcessP2PConfig(*(_QWORD *)(a1 + 48));
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96);
      if (v6)
      {
        v18[0] = 0;
        v18[1] = v18;
        v18[2] = 0x2020000000;
        v19 = 0;
        v7 = *(void **)(v6 + 16);
        v8 = objc_msgSend(v7, "internalQueue");
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __APAdvertiserBTLEManagerUpdatePreferences_block_invoke;
        block[3] = &unk_24E21FCC8;
        block[4] = v7;
        block[5] = v18;
        dispatch_sync(v8, block);
        _Block_object_dispose(v18, 8);
      }
      return;
    }
LABEL_39:
    APSLogErrorAt();
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("enforceSolo")))
  {
    v11 = CFGetInt64();
    v12 = v11 != 0;
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      goto LABEL_39;
    v13 = *(_QWORD *)(a1 + 48);
    if (*(_BYTE *)(v13 + 181) || *(unsigned __int8 *)(v13 + 179) == v12)
    {
      v16 = 0;
    }
    else
    {
      if (gLogCategory_APAdvertiser <= 50
        && (gLogCategory_APAdvertiser != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(v13 + 179) = v12;
      v16 = _APAdvertiserUpdate(v13);
      if (v16)
        APSLogErrorAt();
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v16;
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      goto LABEL_39;
  }
  else
  {
    if (!CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("allowAssistedModeAdvertisingOverAWDL")))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6727;
      return;
    }
    v14 = CFGetInt64();
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      goto LABEL_39;
    v15 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)(v15 + 56) = *(_DWORD *)(v15 + 56) & 0xFFFFFEFF | ((v14 != 0) << 8);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _APAdvertiserUpdate(v15);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      goto LABEL_39;
  }
}

@end
