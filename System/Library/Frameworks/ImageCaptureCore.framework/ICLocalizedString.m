@implementation ICLocalizedString

void __ICLocalizedString_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/Frameworks/ImageCaptureCore.framework"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ICLocalizedString_bundle;
  ICLocalizedString_bundle = v0;

}

@end
