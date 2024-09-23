@implementation MUGetPhotoInfo

void ___MUGetPhotoInfo_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D271D8], "defaultPhotoOptionsWithAllowSmaller:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v0;

}

@end
