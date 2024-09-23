@implementation AirPlayReceiverSessionRemoveVolumeRequest

uint64_t __AirPlayReceiverSessionRemoveVolumeRequest_block_invoke(int a1, CFTypeRef cf)
{
  CFTypeID v3;
  int valuePtr;

  valuePtr = 0;
  if (!cf)
    return 0;
  v3 = CFGetTypeID(cf);
  if (v3 != CFNumberGetTypeID())
    return 0;
  CFNumberGetValue((CFNumberRef)cf, kCFNumberFloatType, &valuePtr);
  if (APSVolumeSliderValuesAreNoticeablyDifferent())
    return 0;
  if (gLogCategory_AirPlayReceiverCore <= 50
    && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return 1;
}

@end
