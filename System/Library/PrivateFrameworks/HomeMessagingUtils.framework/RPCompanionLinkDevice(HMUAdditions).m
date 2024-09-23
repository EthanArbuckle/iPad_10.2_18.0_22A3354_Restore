@implementation RPCompanionLinkDevice(HMUAdditions)

- (unint64_t)hmu_isOwnerDevice
{
  return ((unint64_t)objc_msgSend(a1, "statusFlags") >> 19) & 1;
}

- (BOOL)hmu_isAccessory
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "homeKitIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (unint64_t)hmu_isPairedCompanion
{
  if ((objc_msgSend(a1, "statusFlags") & 0x40) != 0)
    return ((unint64_t)objc_msgSend(a1, "statusFlags") >> 19) & 1;
  else
    return 0;
}

@end
