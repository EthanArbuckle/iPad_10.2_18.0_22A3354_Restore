@implementation APMediaSenderSetVideoPassthroughMode

uint64_t __APMediaSenderSetVideoPassthroughMode_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6709;
    return APSLogErrorAt();
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = APMediaSenderFDVSourceSetWritebackMode(*(_QWORD *)(v2 + 48), 0);
  result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((_DWORD)result)
    return APSLogErrorAt();
  if (gLogCategory_AirPlaySenderKit <= 50)
  {
    if (gLogCategory_AirPlaySenderKit != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

@end
