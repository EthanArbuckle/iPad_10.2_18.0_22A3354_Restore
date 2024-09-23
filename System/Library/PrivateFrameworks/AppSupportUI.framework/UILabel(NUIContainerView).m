@implementation UILabel(NUIContainerView)

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&off_1EEB9E8A0;
  return (objc_msgSendSuper2(&v3, sel_isLayoutSizeDependentOnPerpendicularAxis) & 1) != 0
      || objc_msgSend(a1, "numberOfLines") != 1;
}

- (BOOL)canUseFastLayoutSizeCalulation
{
  return objc_msgSend(a1, "numberOfLines") == 1;
}

@end
