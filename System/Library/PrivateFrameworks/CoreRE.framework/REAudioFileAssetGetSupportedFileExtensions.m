@implementation REAudioFileAssetGetSupportedFileExtensions

uint64_t __REAudioFileAssetGetSupportedFileExtensions_block_invoke()
{
  const char **v0;
  uint64_t v1;
  const char *v2;
  CFStringRef v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  const char **v7;

  _MergedGlobals_515 = (uint64_t)CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  re::AudioFileAsset::supportedExtensions((uint64_t)&v5);
  if (v6)
  {
    v0 = v7;
    v1 = 8 * v6;
    do
    {
      v2 = *v0++;
      v3 = CFStringCreateWithCString(0, v2, 0x8000100u);
      CFArrayAppendValue((CFMutableArrayRef)_MergedGlobals_515, v3);
      CFRelease(v3);
      v1 -= 8;
    }
    while (v1);
  }
  result = v5;
  if (v5)
  {
    if (v7)
      return (*(uint64_t (**)(void))(*(_QWORD *)v5 + 40))();
  }
  return result;
}

@end
