@implementation FCDefaultToLargeArticleThumbnails

void ___FCDefaultToLargeArticleThumbnails_block_invoke()
{
  id v0;

  NFGeneralDeviceString();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_170 = objc_msgSend(v0, "isEqualToString:", CFSTR("iPhone")) ^ 1;

}

@end
