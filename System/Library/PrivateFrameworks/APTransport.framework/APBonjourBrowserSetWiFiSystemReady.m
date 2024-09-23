@implementation APBonjourBrowserSetWiFiSystemReady

void __APBonjourBrowserSetWiFiSystemReady_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _WORD *v4;
  _WORD *v5;
  _QWORD *v6;
  uint64_t v7;
  int v8;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 32);
  if (v3)
  {
    do
    {
      v4 = (_WORD *)v3;
      v3 = *(_QWORD *)(v3 + 24);
    }
    while (v3);
    if (*(_BYTE *)(v2 + 211) || *v4 == 2)
      goto LABEL_14;
LABEL_7:
    if (*(_QWORD *)(v2 + 216))
    {
      v5 = malloc_type_calloc(1uLL, 0x20uLL, 0x10620408E24C83AuLL);
      v6 = v5;
      if (v5)
      {
        *v5 = 3;
        if (gLogCategory_APBonjourBrowser <= 30
          && (gLogCategory_APBonjourBrowser != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _APBonjourBrowserEnqueueOperation(*(_QWORD *)(a1 + 40), (uint64_t)v6);
        if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        {
          APSLogErrorAt();
          goto LABEL_15;
        }
        goto LABEL_14;
      }
      APSLogErrorAt();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = -72210;
    }
    else
    {
      APSLogErrorAt();
      v6 = 0;
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = -72211;
    }
    *(_DWORD *)(v7 + 24) = v8;
    goto LABEL_15;
  }
  if (!*(_BYTE *)(v2 + 211))
    goto LABEL_7;
LABEL_14:
  v6 = 0;
LABEL_15:
  _APBonjourBrowserOperationDisposeNullSafe(v6);
}

@end
