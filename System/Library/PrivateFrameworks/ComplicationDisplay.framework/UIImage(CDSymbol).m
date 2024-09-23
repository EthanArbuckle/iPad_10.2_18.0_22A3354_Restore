@implementation UIImage(CDSymbol)

- (double)cd_baselineOffsetFromBottom
{
  double result;

  if (!objc_msgSend(a1, "_hasBaseline"))
    return 0.0;
  objc_msgSend(a1, "_baselineOffsetFromBottom");
  return result;
}

@end
