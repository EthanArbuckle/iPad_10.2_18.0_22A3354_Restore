@implementation CEKWheelScrubberUtilities

+ (double)dotIndicatorDiameter
{
  int v2;
  double result;

  v2 = CEKIsSmallPhone();
  result = 5.0;
  if (v2)
    return 4.0;
  return result;
}

+ (UIColor)dotIndicatorBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

@end
