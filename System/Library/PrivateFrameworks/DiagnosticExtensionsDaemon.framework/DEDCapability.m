@implementation DEDCapability

+ (id)encodeCapabilitySet:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)decodeCapabilitiesString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", CFSTR("classic"));
  return v5;
}

+ (id)allCapabilities
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("classic"), CFSTR("enhanced-execution"), CFSTR("cloudkit"), CFSTR("mutable-bug-session"), CFSTR("session-state"), CFSTR("enhanced-execution-v2"), 0);
}

+ (id)defaultCapabilities
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("classic"));
}

@end
