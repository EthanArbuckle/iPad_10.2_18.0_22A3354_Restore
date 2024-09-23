@implementation UIView(CCUIAdditions_Private)

- (void)_controlCenterApplyPrimaryContentShadow
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setShadowColor:", objc_msgSend(v3, "CGColor"));

  objc_msgSend(a1, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1045220557;
  objc_msgSend(v4, "setShadowOpacity:", v5);

  objc_msgSend(a1, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowRadius:", 20.0);

  objc_msgSend(a1, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShadowOffset:", 0.0, 2.0);

}

@end
