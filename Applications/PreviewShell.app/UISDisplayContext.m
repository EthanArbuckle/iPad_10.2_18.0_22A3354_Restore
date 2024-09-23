@implementation UISDisplayContext

+ (id)uv_loadedInitialContext
{
  return +[UISDisplayContext _loadedInitialContext](UISDisplayContext, "_loadedInitialContext");
}

@end
