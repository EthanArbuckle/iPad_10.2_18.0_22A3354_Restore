@implementation NTKPausedGradientLightColor

void __NTKPausedGradientLightColor_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CF51B0], "grayColors");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gradientLightColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKPausedGradientLightColor___color;
  NTKPausedGradientLightColor___color = v0;

}

@end
