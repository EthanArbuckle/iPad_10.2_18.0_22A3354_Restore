@implementation UIView(MFPopoverPresentationSource)

- (void)mui_setAsSourceForPopoverPresentationController:()MFPopoverPresentationSource
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v8;
  CGRect v9;
  CGRect v10;

  v8 = a3;
  objc_msgSend(v8, "setSourceView:", a1);
  objc_msgSend(a1, "bounds");
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  CGRectGetMidX(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  CGRectGetMidY(v10);
  UIRectCenteredAboutPoint();
  objc_msgSend(v8, "setSourceRect:");

}

- (void)mui_setAsSourceWithExtendedRectForPopoverPresentationController:()MFPopoverPresentationSource
{
  id v4;
  CGRect v5;
  CGRect v6;

  v4 = a3;
  objc_msgSend(v4, "setSourceView:", a1);
  objc_msgSend(a1, "bounds");
  v6 = CGRectInset(v5, -5.0, -5.0);
  objc_msgSend(v4, "setSourceRect:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);

}

- (void)mui_setAsTargetedSourceOnSceneConfiguration:()MFPopoverPresentationSource
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0DC3D90];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithView:", a1);
  objc_msgSend(v5, "setPreview:", v6);

}

@end
