@implementation UIView(CNGroupIdentityHeaderViewController)

- (void)addBackgroundVisualEffectView:()CNGroupIdentityHeaderViewController withCornerRadius:
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "setAutoresizingMask:", 18);
  objc_msgSend(a1, "bounds");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v8, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", a2);

  objc_msgSend(v8, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMasksToBounds:", 1);

  objc_msgSend(a1, "addSubview:", v8);
  objc_msgSend(a1, "sendSubviewToBack:", v8);

}

@end
