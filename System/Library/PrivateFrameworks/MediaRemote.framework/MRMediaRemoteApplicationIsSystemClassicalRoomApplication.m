@implementation MRMediaRemoteApplicationIsSystemClassicalRoomApplication

void __MRMediaRemoteApplicationIsSystemClassicalRoomApplication_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.music.classical"), CFSTR("(System Classical Room Application)"), 0);
  v1 = (void *)MRMediaRemoteApplicationIsSystemClassicalRoomApplication___allKnownSystemClassicalRoomApplications;
  MRMediaRemoteApplicationIsSystemClassicalRoomApplication___allKnownSystemClassicalRoomApplications = v0;

}

@end
