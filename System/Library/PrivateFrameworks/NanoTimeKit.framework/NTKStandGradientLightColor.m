@implementation NTKStandGradientLightColor

void __NTKStandGradientLightColor_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CF51B0], "sedentaryColors");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gradientLightColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKStandGradientLightColor___color;
  NTKStandGradientLightColor___color = v0;

}

@end
