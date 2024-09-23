@implementation AXHACHearingAidCapabilities

uint64_t __AXHACHearingAidCapabilities_block_invoke()
{
  void *v0;
  char v1;
  int v2;
  uint64_t result;

  if (MGGetBoolAnswer())
  {
    _accessibilityHWModel();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "hasPrefix:", CFSTR("n92"));

    if ((v1 & 1) != 0)
      goto LABEL_7;
    v2 = 2;
  }
  else
  {
    if (!MGGetBoolAnswer())
      goto LABEL_7;
    v2 = 4;
  }
  AXHACHearingAidCapabilities__kAXDeviceHearingAidCapabilitiesCache = v2;
LABEL_7:
  result = MGGetBoolAnswer();
  if ((_DWORD)result)
    AXHACHearingAidCapabilities__kAXDeviceHearingAidCapabilitiesCache |= 0x10u;
  return result;
}

@end
