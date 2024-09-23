@implementation UIView(MKInternalAdditions)

- (double)_mapkit_leadingMargin
{
  int IsRightToLeft;
  double v3;
  double v4;

  IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  objc_msgSend(a1, "layoutMargins");
  if (IsRightToLeft)
    return v4;
  else
    return v3;
}

- (double)_mapkit_trailingMargin
{
  int IsRightToLeft;
  double v3;
  double v4;

  IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  objc_msgSend(a1, "layoutMargins");
  if (IsRightToLeft)
    return v3;
  else
    return v4;
}

@end
