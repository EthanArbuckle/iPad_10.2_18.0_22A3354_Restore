@implementation AirPlayReceiverSessionRemoveMuteRequest

uint64_t __AirPlayReceiverSessionRemoveMuteRequest_block_invoke(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;

  if (!cf)
    return 0;
  v4 = CFGetTypeID(cf);
  if (v4 != CFBooleanGetTypeID() || *(_BYTE *)(a1 + 40) != (*MEMORY[0x24BDBD270] == (_QWORD)cf))
    return 0;
  if (gLogCategory_AirPlayReceiverCore <= 50
    && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return 1;
}

@end
