@implementation APMediaSenderSetVideoOverrides

void __APMediaSenderSetVideoOverrides_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  const void *v2;
  const void *v3;

  v1 = a1[5];
  if (*(_BYTE *)(v1 + 182))
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -6709;
    APSLogErrorAt();
  }
  else
  {
    v2 = *(const void **)(v1 + 104);
    v3 = (const void *)a1[6];
    *(_QWORD *)(v1 + 104) = v3;
    if (v3)
      CFRetain(v3);
    if (v2)
      CFRelease(v2);
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

@end
