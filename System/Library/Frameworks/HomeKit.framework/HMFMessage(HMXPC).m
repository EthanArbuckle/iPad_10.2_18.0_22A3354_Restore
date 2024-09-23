@implementation HMFMessage(HMXPC)

- (uint64_t)hm_isXPCTimeoutDisabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "headers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hmf_BOOLForKey:", CFSTR("HMXPCMessageHeaderKeyIsXPCTimeoutDisabled"));

  return v2;
}

@end
