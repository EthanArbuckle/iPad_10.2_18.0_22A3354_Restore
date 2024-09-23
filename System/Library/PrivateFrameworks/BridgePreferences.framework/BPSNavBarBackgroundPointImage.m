@implementation BPSNavBarBackgroundPointImage

void __BPSNavBarBackgroundPointImage_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDF6950], "_secondarySystemGroupedBackgroundColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _BPSPointImageWithColor(v2, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BPSNavBarBackgroundPointImage___backgroundPointImage;
  BPSNavBarBackgroundPointImage___backgroundPointImage = v0;

}

@end
