@implementation MRMediaRemoteGetNowPlayingInfoForOrigin

uint64_t __MRMediaRemoteGetNowPlayingInfoForOrigin_block_invoke(uint64_t a1, __CFDictionary *a2, uint64_t a3)
{
  void *v5;
  uint64_t result;

  if (a2 && a3)
  {
    v5 = (void *)MRNowPlayingArtworkCopyImageData(a3);
    CFDictionarySetValue(a2, CFSTR("kMRMediaRemoteNowPlayingInfoArtworkData"), v5);
    CFDictionarySetValue(a2, CFSTR("kMRMediaRemoteNowPlayingInfoArtworkMIMEType"), CFSTR("image/jpeg"));

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, __CFDictionary *))(result + 16))(result, a2);
  return result;
}

@end
