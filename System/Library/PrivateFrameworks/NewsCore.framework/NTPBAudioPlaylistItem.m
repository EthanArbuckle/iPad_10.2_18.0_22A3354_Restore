@implementation NTPBAudioPlaylistItem

void __39__NTPBAudioPlaylistItem_CK__asCKRecord__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  v1 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("AudioPlaylist"), *MEMORY[0x1E0C94730]);
  v2 = (void *)_MergedGlobals_189;
  _MergedGlobals_189 = v1;

}

@end
