@implementation SFDevice(DEDSupport)

- (BOOL)isWithinDEDRange
{
  void *v1;
  unsigned int v2;

  objc_msgSend(a1, "bleDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "rssiEstimate");

  return v2 > 0xFFFFFFBF;
}

- (uint64_t)isValidDEDPingDevice
{
  if (objc_msgSend(a1, "deviceActionType") == 17 && objc_msgSend(a1, "needsSetup"))
    return objc_msgSend(a1, "isWithinDEDRange");
  else
    return 0;
}

- (uint64_t)isValidDEDPongDevice
{
  if (objc_msgSend(a1, "deviceActionType") == 18 && objc_msgSend(a1, "needsSetup"))
    return objc_msgSend(a1, "isWithinDEDRange");
  else
    return 0;
}

@end
