@implementation UIColor(CarPlayUIServices)

+ (id)crsui_dashboardWidgetBackgroundColor
{
  if (crsui_dashboardWidgetBackgroundColor_onceToken != -1)
    dispatch_once(&crsui_dashboardWidgetBackgroundColor_onceToken, &__block_literal_global);
  return (id)crsui_dashboardWidgetBackgroundColor_dashboardWidgetBackgroundColor;
}

@end
