@implementation MPNowPlayingInfoPropertyForMRMediaRemoteNowPlayingInfoProperty

void ___MPNowPlayingInfoPropertyForMRMediaRemoteNowPlayingInfoProperty_block_invoke()
{
  id v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  _MPNowPlayingInfoPropertyToMRMediaRemoteNowPlayingInfoPropertyMapping();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___MPNowPlayingInfoPropertyForMRMediaRemoteNowPlayingInfoProperty_block_invoke_2;
  v5[3] = &unk_1E315F2B0;
  v6 = v0;
  v1 = v0;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)_MPNowPlayingInfoPropertyForMRMediaRemoteNowPlayingInfoProperty___reversePropertyMapping;
  _MPNowPlayingInfoPropertyForMRMediaRemoteNowPlayingInfoProperty___reversePropertyMapping = v2;

}

uint64_t ___MPNowPlayingInfoPropertyForMRMediaRemoteNowPlayingInfoProperty_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a2, a3);
}

@end
