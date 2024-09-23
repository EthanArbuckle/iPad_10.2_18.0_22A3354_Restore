@implementation MRMediaRemoteApplicationIsSystemAppleTVApplication

void __MRMediaRemoteApplicationIsSystemAppleTVApplication_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.AppleTV"), CFSTR("com.apple.TVWatchList"), CFSTR("com.apple.TV"), CFSTR("com.apple.tv"), 0);
  v1 = (void *)MRMediaRemoteApplicationIsSystemAppleTVApplication___allKnownSystemAppleTVApplications;
  MRMediaRemoteApplicationIsSystemAppleTVApplication___allKnownSystemAppleTVApplications = v0;

}

@end
