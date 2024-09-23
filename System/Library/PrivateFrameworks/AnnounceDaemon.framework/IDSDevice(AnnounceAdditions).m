@implementation IDSDevice(AnnounceAdditions)

- (uint64_t)isHomePod
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "modelIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsString:", CFSTR("AudioAccessory"));

  return v2;
}

@end
