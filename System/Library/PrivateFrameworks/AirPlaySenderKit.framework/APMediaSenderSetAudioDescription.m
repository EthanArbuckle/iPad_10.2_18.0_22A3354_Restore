@implementation APMediaSenderSetAudioDescription

uint64_t __APMediaSenderSetAudioDescription_block_invoke(uint64_t result)
{
  uint64_t v1;
  __int128 *v2;
  __int128 v3;
  __int128 v4;

  v1 = *(_QWORD *)(result + 40);
  if (*(_BYTE *)(v1 + 182))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = -6709;
    return APSLogErrorAt();
  }
  else
  {
    v2 = *(__int128 **)(result + 48);
    v3 = *v2;
    v4 = v2[1];
    *(_QWORD *)(v1 + 96) = *((_QWORD *)v2 + 4);
    *(_OWORD *)(v1 + 64) = v3;
    *(_OWORD *)(v1 + 80) = v4;
    *(_BYTE *)(*(_QWORD *)(result + 40) + 180) = *(_BYTE *)(result + 56);
    if (gLogCategory_AirPlaySenderKit <= 50)
    {
      if (gLogCategory_AirPlaySenderKit != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

@end
