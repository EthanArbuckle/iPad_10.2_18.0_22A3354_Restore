@implementation HMFMutableMessage(HMXPC)

- (void)hm_setXPCTimeoutDisabled:()HMXPC
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setHeaderValue:forKey:", v2, CFSTR("HMXPCMessageHeaderKeyIsXPCTimeoutDisabled"));

}

@end
