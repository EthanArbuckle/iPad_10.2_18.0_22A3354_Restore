@implementation UIColor(AVAdditions)

+ (id)AV_indicatorBackgroundColor
{
  if (AV_indicatorBackgroundColor_onceToken != -1)
    dispatch_once(&AV_indicatorBackgroundColor_onceToken, &__block_literal_global_11589);
  return (id)AV_indicatorBackgroundColor__indicatorBackgroundColor;
}

+ (id)AV_indicatorForegroundColor
{
  if (AV_indicatorForegroundColor_onceToken != -1)
    dispatch_once(&AV_indicatorForegroundColor_onceToken, &__block_literal_global_1);
  return (id)AV_indicatorForegroundColor__indicatorForegroundColor;
}

+ (uint64_t)avkit_traitCollectionControlsColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_3_11587);
}

+ (uint64_t)avkit_liveContentAccessoryViewColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.99609375, 0.17578125, 0.33203125, 1.0);
}

@end
