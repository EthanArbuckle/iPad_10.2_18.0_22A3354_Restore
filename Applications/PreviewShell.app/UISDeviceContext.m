@implementation UISDeviceContext

+ (id)uv_loadedInitialContext
{
  return +[UISDeviceContext _loadedInitialContext](UISDeviceContext, "_loadedInitialContext");
}

@end
