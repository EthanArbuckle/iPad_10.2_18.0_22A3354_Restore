@implementation MRMediaRemoteApplicationIsSystemMediaApplication

void __MRMediaRemoteApplicationIsSystemMediaApplication_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.NanoMusic"), CFSTR("com.apple.TVMusic"), CFSTR("com.apple.Music"), CFSTR("com.apple.iTunes"), CFSTR("com.apple.sonic.music"), CFSTR("(System Media Application)"), CFSTR("(System Classical Room Application)"), 0);
  v1 = (void *)MRMediaRemoteApplicationIsSystemMediaApplication___allKnownSystemMediaApplications;
  MRMediaRemoteApplicationIsSystemMediaApplication___allKnownSystemMediaApplications = v0;

}

@end
