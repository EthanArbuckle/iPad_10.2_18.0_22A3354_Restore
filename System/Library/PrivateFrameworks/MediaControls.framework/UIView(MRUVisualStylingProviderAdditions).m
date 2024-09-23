@implementation UIView(MRUVisualStylingProviderAdditions)

- (void)mru_applyVisualStylingWithColor:()MRUVisualStylingProviderAdditions alpha:blendMode:
{
  id v8;

  v8 = a4;
  objc_msgSend(a1, "setAlpha:", a2);
  objc_msgSend(a1, "_setDrawsAsBackdropOverlayWithBlendMode:", a5);
  objc_msgSend(a1, "setBackgroundColor:", v8);

}

@end
