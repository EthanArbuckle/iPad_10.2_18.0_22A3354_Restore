@implementation REAudioGeneratorAssetGetSupportedFileExtensions

void __REAudioGeneratorAssetGetSupportedFileExtensions_block_invoke()
{
  CFStringRef v0;

  _MergedGlobals_511 = (uint64_t)CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v0 = CFStringCreateWithCString(0, "reaudiogenerator", 0x8000100u);
  CFArrayAppendValue((CFMutableArrayRef)_MergedGlobals_511, v0);
  CFRelease(v0);
}

@end
