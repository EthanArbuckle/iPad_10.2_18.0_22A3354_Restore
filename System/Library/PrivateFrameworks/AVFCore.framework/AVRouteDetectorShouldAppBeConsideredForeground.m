@implementation AVRouteDetectorShouldAppBeConsideredForeground

SEL __AVRouteDetectorShouldAppBeConsideredForeground_block_invoke()
{
  SEL result;

  AVRouteDetectorShouldAppBeConsideredForeground_uiApplicationClass = (uint64_t)NSClassFromString(CFSTR("UIApplication"));
  AVRouteDetectorShouldAppBeConsideredForeground_sharedApplicationSelector = (uint64_t)NSSelectorFromString(CFSTR("sharedApplication"));
  result = NSSelectorFromString(CFSTR("applicationState"));
  AVRouteDetectorShouldAppBeConsideredForeground_applicationStateSelector = (uint64_t)result;
  return result;
}

@end
