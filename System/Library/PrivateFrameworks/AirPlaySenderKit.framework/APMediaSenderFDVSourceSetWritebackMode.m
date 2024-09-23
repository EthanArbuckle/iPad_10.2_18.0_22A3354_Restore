@implementation APMediaSenderFDVSourceSetWritebackMode

uint64_t __APMediaSenderFDVSourceSetWritebackMode_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (*(_DWORD *)(v1 + 112))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = -12070;
  }
  else
  {
    *(_BYTE *)(v1 + 116) = *(_BYTE *)(result + 48);
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
