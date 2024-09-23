@implementation APBrokerHTTPSendRequest

void __APBrokerHTTPSendRequest_block_invoke(uint64_t a1, CFTypeRef cf, _OWORD *a3, int a4, int a5)
{
  uint64_t v8;
  const __CFString *v9;
  int v10;
  BOOL v11;
  const __CFString *v12;
  CFIndex Length;
  uint64_t v14;
  int CharacterAtIndex;
  const void *v16;
  const void *v17;
  _BYTE v18[28];
  CFRange v19;

  v8 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)v18 = *a3;
  *(_OWORD *)&v18[12] = *(_OWORD *)((char *)a3 + 12);
  if (gLogCategory_APBrokerHTTPUtils <= 30
    && (gLogCategory_APBrokerHTTPUtils != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (a5)
  {
    APSLogErrorAt();
    if (v8)
    {
LABEL_25:
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(v8 + 56) + 16))(*(_QWORD *)(v8 + 56), 0, 0, 0);
      _APBrokerHTTPReleaseRequestData(v8);
    }
  }
  else
  {
    v9 = (const __CFString *)CFRetain(cf);
    *(_QWORD *)(v8 + 64) = v9;
    *(_OWORD *)(v8 + 72) = *(_OWORD *)v18;
    *(_OWORD *)(v8 + 84) = *(_OWORD *)&v18[12];
    *(_DWORD *)(v8 + 100) = a4;
    if (v9 && ((v10 = *(unsigned __int8 *)(v8 + 73), v10 != 2) ? (v11 = v10 == 30) : (v11 = 1), v11))
    {
      v12 = v9;
      Length = CFStringGetLength(v9);
      v14 = Length;
      while (v14 >= 1)
      {
        CharacterAtIndex = CFStringGetCharacterAtIndex(v12, v14 - 1);
        if (CharacterAtIndex == 37)
        {
          if (v14 < Length)
          {
            v19.location = 0;
            v19.length = v14 - 1;
            v16 = CFStringCreateWithSubstring(0, v12, v19);
            if (!v16)
            {
              APSLogErrorAt();
              goto LABEL_17;
            }
            goto LABEL_22;
          }
          break;
        }
        --v14;
        if ((CharacterAtIndex - 58) <= 0xFFFFFFF5)
          break;
      }
      v16 = CFRetain(v12);
      if (!v16)
        goto LABEL_17;
LABEL_22:
      v17 = (const void *)CFStringCreateF();
      CFRelease(v16);
      _APBrokerHTTPSendRequestToURL(v8, (uint64_t)v17);
      v8 = 0;
      if (v17)
        CFRelease(v17);
    }
    else
    {
LABEL_17:
      APSLogErrorAt();
      APSLogErrorAt();
    }
    if (v8)
      goto LABEL_25;
  }
}

@end
