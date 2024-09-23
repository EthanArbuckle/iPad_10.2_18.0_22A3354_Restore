@implementation _UNNotificationContentExtensionVendorViewControllerView

- (BOOL)delaysContentTouches
{
  return 1;
}

- (double)_touchDelayForScrollDetection
{
  return 0.15;
}

- (double)_scrollHysteresis
{
  return 10.0;
}

- (BOOL)_canScrollX
{
  return 1;
}

- (BOOL)_canScrollY
{
  return 1;
}

- (BOOL)touchesShouldBegin:(id)a3 withEvent:(id)a4 inContentView:(id)a5
{
  return 1;
}

@end
