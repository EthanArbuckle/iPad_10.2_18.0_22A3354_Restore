@implementation NTKHeartRateComplicationUtilties

+ (id)heartrateTintColor
{
  if (heartrateTintColor_onceToken != -1)
    dispatch_once(&heartrateTintColor_onceToken, &__block_literal_global_77);
  return (id)heartrateTintColor__heartRateColor;
}

void __54__NTKHeartRateComplicationUtilties_heartrateTintColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.219607845, 0.0980392173, 255.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)heartrateTintColor__heartRateColor;
  heartrateTintColor__heartRateColor = v0;

}

@end
