@implementation CNFRegStripedAppearanceController

- (id)webViewBackgroundView
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F0]), "initWithFrame:style:", 1, 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(v2, "setAutoresizingMask:", 18);
  return v2;
}

- (id)webViewBackgroundColor
{
  return 0;
}

- (BOOL)webViewIsOpaque
{
  return 0;
}

- (BOOL)webViewDrawsShadows
{
  return 0;
}

@end
