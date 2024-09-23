@implementation MRMediaRemoteGetNowPlayingArtwork

void __MRMediaRemoteGetNowPlayingArtwork_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *ArtworkData;
  CFTypeRef ArtworkMIMEType;
  uint64_t v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (v3 && (v4 = (void *)objc_msgSend(v3, "contentItemWithOffset:", 0)) != 0)
  {
    v5 = v4;
    ArtworkData = (void *)MRContentItemGetArtworkData(v4);
    ArtworkMIMEType = MRContentItemGetArtworkMIMEType(v5);
    if (ArtworkData)
      ArtworkData = MRNowPlayingArtworkCreateWithImageData((uint64_t)ArtworkData, (uint64_t)ArtworkMIMEType);
  }
  else
  {
    ArtworkData = 0;
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, ArtworkData);

}

@end
