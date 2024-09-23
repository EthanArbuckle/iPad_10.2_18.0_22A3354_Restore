@implementation UIView(CCUIAdditions)

- (void)controlCenterApplyPrimaryContentShadow
{
  id v2;

  objc_msgSend(a1, "_controlCenterApplyPrimaryContentShadow");
  objc_msgSend(a1, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShadowPathIsBounds:", 1);

}

@end
