@implementation CNFRegGradientAppearanceController

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (int64_t)navigationBarActivityIndicatorStyle
{
  return 2;
}

- (BOOL)actionSheetsUsePopoverStyle
{
  return 1;
}

- (id)webViewBackgroundColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)webViewBackgroundColor_color;
  if (!webViewBackgroundColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.886274517, 0.898039222, 0.917647064, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)webViewBackgroundColor_color;
    webViewBackgroundColor_color = v3;

    v2 = (void *)webViewBackgroundColor_color;
  }
  return v2;
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
