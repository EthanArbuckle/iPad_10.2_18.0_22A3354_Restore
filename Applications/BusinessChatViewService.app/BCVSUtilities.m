@implementation BCVSUtilities

+ (id)classBundle
{
  uint64_t v2;

  v2 = objc_opt_class(BCVSUtilities, a2);
  return +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v2);
}

@end
