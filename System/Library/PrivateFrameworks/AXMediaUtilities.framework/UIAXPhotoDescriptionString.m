@implementation UIAXPhotoDescriptionString

void __UIAXPhotoDescriptionString_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend((id)MEMORY[0x1B5E12488](), "stringByAppendingPathComponent:", CFSTR("/System/Library/PrivateFrameworks/ScreenReaderCore.framework"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "load");

}

@end
