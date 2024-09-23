@implementation NSDictionary(CoreCDP)

- (id)cdp_sanitizedCopy
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "removeObjectForKey:", *MEMORY[0x24BE0AB68]);
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

@end
