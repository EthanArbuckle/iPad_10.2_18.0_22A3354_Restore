@implementation SUUIFontDescriptorGetCache

uint64_t ___SUUIFontDescriptorGetCache_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)_SUUIFontDescriptorGetCache_fontDescriptorCache;
  _SUUIFontDescriptorGetCache_fontDescriptorCache = (uint64_t)v0;

  return objc_msgSend((id)_SUUIFontDescriptorGetCache_fontDescriptorCache, "setName:", CFSTR("com.apple.iTunesStoreUI.SUUIFontDescriptor.cache"));
}

@end
