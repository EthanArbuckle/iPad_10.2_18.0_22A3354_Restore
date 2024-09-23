@implementation ARShouldNotReportToCoreAnalytics

BOOL __ARShouldNotReportToCoreAnalytics_block_invoke()
{
  _BOOL8 result;

  result = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.daemonMetrics.disableReporting"));
  ARShouldNotReportToCoreAnalytics_shouldNotReportToCoreAnalytics = result;
  return result;
}

@end
