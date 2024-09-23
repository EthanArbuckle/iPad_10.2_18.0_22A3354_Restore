@implementation NSDictionary(ASDTIOPAudioConfig)

- (uint64_t)asdtIOPAudioCMEnablePropertyDirection
{
  return objc_msgSend(a1, "asdtFourCCForKey:withDefault:", CFSTR("Direction"), 0);
}

- (uint64_t)asdtIOPAudioCMPowerStatePropertyEnabled
{
  return objc_msgSend(a1, "asdtFourCCForKey:withDefault:", CFSTR("PowerStateEnabled"), 1886876260);
}

- (uint64_t)asdtIOPAudioCMPowerStatePropertyDisabled
{
  return objc_msgSend(a1, "asdtFourCCForKey:withDefault:", CFSTR("PowerStateDisabled"), 1768189029);
}

- (uint64_t)asdtIOPAudioCMPowerStatePropertyDirection
{
  return objc_msgSend(a1, "asdtFourCCForKey:withDefault:", CFSTR("PowerStateDirection"), 0);
}

@end
