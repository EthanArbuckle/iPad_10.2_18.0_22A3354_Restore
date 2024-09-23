@implementation CelestialShouldAllowHTPCIOSurfacesForHDRPlaybackToCA

void __CelestialShouldAllowHTPCIOSurfacesForHDRPlaybackToCA_block_invoke()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const void *v2;

  v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = (const void *)*MEMORY[0x1E0C9AE50];
    if (v2 == CFDictionaryGetValue(v0, CFSTR("buffer-compression"))
      && v2 == CFDictionaryGetValue(v1, CFSTR("media-compression")))
    {
      CelestialShouldAllowHTPCIOSurfacesForHDRPlaybackToCA_result = 1;
    }
    CFRelease(v1);
  }
}

@end
