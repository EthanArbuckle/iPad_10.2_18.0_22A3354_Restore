@implementation UIView(MTUIAdditions)

- (double)mtui_boundsCenter
{
  double MidX;
  CGRect v4;
  CGRect v5;

  objc_msgSend(a1, "bounds");
  MidX = CGRectGetMidX(v4);
  objc_msgSend(a1, "bounds");
  CGRectGetMidY(v5);
  return MidX;
}

@end
