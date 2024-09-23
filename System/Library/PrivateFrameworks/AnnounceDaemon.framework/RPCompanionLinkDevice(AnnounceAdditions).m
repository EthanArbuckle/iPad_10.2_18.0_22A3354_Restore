@implementation RPCompanionLinkDevice(AnnounceAdditions)

- (uint64_t)supportsAnnounce
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "serviceTypes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsObject:", *MEMORY[0x1E0CF79F8]);

  return v2;
}

- (unint64_t)isOwnerDevice
{
  return ((unint64_t)objc_msgSend(a1, "statusFlags") >> 19) & 1;
}

- (BOOL)isAccessory
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "homeKitIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (unint64_t)isPairedCompanion
{
  if ((objc_msgSend(a1, "statusFlags") & 0x40) != 0)
    return ((unint64_t)objc_msgSend(a1, "statusFlags") >> 19) & 1;
  else
    return 0;
}

@end
