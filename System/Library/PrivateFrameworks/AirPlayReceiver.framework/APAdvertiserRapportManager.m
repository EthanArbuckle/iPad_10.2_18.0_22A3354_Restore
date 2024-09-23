@implementation APAdvertiserRapportManager

void __APAdvertiserRapportManager_startAdvertising_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t active;
  const void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  _QWORD block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -6709;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (gLogCategory_APAdvertiserRapportManager <= 50
    && (gLogCategory_APAdvertiserRapportManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  active = _APAdvertiserRapportManager_lookupAndRetainActiveManagerWithKey();
  v6 = (const void *)active;
  if (active)
  {
    v7 = *(NSObject **)(active + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __APAdvertiserRapportManager_startAdvertising_block_invoke_2;
    block[3] = &unk_24E21FAD8;
    block[4] = &v16;
    block[5] = &v12;
    block[6] = v6;
    dispatch_sync(v7, block);
  }
  v8 = *((int *)v17 + 6);
  if ((_DWORD)v8)
    v9 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v8, 0);
  else
    v9 = 0;
  (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(a4 + 16))(a4, v13[3], 0, v9);
  v10 = (const void *)v13[3];
  if (v10)
    CFRelease(v10);
  if (v6)
    CFRelease(v6);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
}

void __APAdvertiserRapportManager_startAdvertising_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t active;
  const void *v4;
  NSObject *v5;
  _QWORD block[6];

  if (a2
    && gLogCategory_APAdvertiserRapportManager <= 90
    && (gLogCategory_APAdvertiserRapportManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  active = _APAdvertiserRapportManager_lookupAndRetainActiveManagerWithKey();
  if (active)
  {
    v4 = (const void *)active;
    v5 = *(NSObject **)(active + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __APAdvertiserRapportManager_startAdvertising_block_invoke_4;
    block[3] = &unk_24E21FD90;
    block[4] = a2;
    block[5] = v4;
    dispatch_sync(v5, block);
    CFRelease(v4);
  }
  else
  {
    APSLogErrorAt();
  }
}

void __APAdvertiserRapportManager_startAdvertising_block_invoke_4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v1 + 24))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(v1 + 64), "deregisterRequestID:", CFSTR("com.apple.airplay.discovery.getinfo"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "invalidate");

      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) = 0;
    }
    else
    {
      *(_BYTE *)(v1 + 80) = 1;
    }
  }
}

void __APAdvertiserRapportManager_startAdvertising_block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  int v6;

  v1 = a1[6];
  if (!*(_BYTE *)(v1 + 24))
  {
    if (*(_QWORD *)(v1 + 48))
    {
      v3 = *(_QWORD *)(a1[5] + 8);
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (Mutable)
      {
        v5 = Mutable;
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE037E8], *(const void **)(v1 + 48));
        v6 = 0;
        *(_QWORD *)(v3 + 24) = v5;
      }
      else
      {
        APSLogErrorAt();
        v6 = -6728;
      }
    }
    else
    {
      APSLogErrorAt();
      v6 = -6709;
    }
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v6;
  }
}

uint64_t ___APAdvertiserRapportManager_getActiveManagers_block_invoke()
{
  uint64_t result;

  result = FigCFWeakReferenceTableCreate();
  if ((_DWORD)result)
  {
    if (gLogCategory_APAdvertiserRapportManager <= 100)
    {
      if (gLogCategory_APAdvertiserRapportManager != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        result = LogPrintF();
    }
    __break(1u);
  }
  return result;
}

@end
