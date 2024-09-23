@implementation BPSNavBarShadowPointImage

void __BPSNavBarShadowPointImage_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDF6950], "_separatorColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _BPSPointImageWithColor(v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BPSNavBarShadowPointImage___shadowPointImage;
  BPSNavBarShadowPointImage___shadowPointImage = v0;

}

@end
