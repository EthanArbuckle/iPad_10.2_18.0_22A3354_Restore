@implementation MRMediaRemoteApplicationIsSystemPodcastApplication

void __MRMediaRemoteApplicationIsSystemPodcastApplication_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.podcasts"), CFSTR("com.apple.iTunes"), CFSTR("com.apple.sonic.podcasts"), CFSTR("(System Podcast Application)"), 0);
  v1 = (void *)MRMediaRemoteApplicationIsSystemPodcastApplication___allKnownSystemPodcastApplications;
  MRMediaRemoteApplicationIsSystemPodcastApplication___allKnownSystemPodcastApplications = v0;

}

@end
