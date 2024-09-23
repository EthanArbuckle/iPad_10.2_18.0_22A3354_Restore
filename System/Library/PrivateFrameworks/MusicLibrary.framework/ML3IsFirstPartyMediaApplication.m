@implementation ML3IsFirstPartyMediaApplication

void __ML3IsFirstPartyMediaApplication_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.Music"), CFSTR("com.apple.videos"), CFSTR("com.apple.MobileStore"), CFSTR("com.apple.AppStore"), CFSTR("com.apple.tv"), 0);
  v1 = (void *)ML3IsFirstPartyMediaApplication___firstPartyBundleIDs;
  ML3IsFirstPartyMediaApplication___firstPartyBundleIDs = v0;

}

@end
