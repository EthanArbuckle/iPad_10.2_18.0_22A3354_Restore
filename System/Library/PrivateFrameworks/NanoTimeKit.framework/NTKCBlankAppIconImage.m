@implementation NTKCBlankAppIconImage

void __NTKCBlankAppIconImage_block_invoke()
{
  uint64_t v0;
  void *v1;

  NTKCImageNamed(CFSTR("NoContentIcon"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKCBlankAppIconImage_blankIcon;
  NTKCBlankAppIconImage_blankIcon = v0;

}

@end
