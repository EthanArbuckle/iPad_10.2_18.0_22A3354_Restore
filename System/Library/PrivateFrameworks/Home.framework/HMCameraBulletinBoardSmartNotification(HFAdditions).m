@implementation HMCameraBulletinBoardSmartNotification(HFAdditions)

- (uint64_t)hf_enabledSignificantEventTypes
{
  if (objc_msgSend(a1, "isEnabled"))
    return objc_msgSend(a1, "significantEventTypes");
  else
    return 0;
}

- (uint64_t)hf_enabledPersonFamiliarityOptions
{
  if (objc_msgSend(a1, "isEnabled"))
    return objc_msgSend(a1, "personFamiliarityOptions");
  else
    return 0;
}

@end
