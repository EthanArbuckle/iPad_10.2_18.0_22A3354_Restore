@implementation AXUIPoliteBannerView

- (BOOL)shouldMimicNotificationBannerTopOffset
{
  return 1;
}

- (double)defaultPlatterToTextVerticalSpacing
{
  return 15.0;
}

- (double)platterToTextHorizontalSpacing
{
  return 20.0;
}

- (double)defaultTitleToSubtitleVerticalSpacing
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXUIPoliteBannerView;
  -[AXUIBannerView defaultTitleToSubtitleVerticalSpacing](&v3, sel_defaultTitleToSubtitleVerticalSpacing);
  return result;
}

@end
