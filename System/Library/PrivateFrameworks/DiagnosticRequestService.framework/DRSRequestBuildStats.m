@implementation DRSRequestBuildStats

+ (id)keyName
{
  return CFSTR("Build");
}

+ (id)descriptionStringForRequest:(id)a3
{
  return (id)objc_msgSend(a3, "build");
}

+ (Class)childStatsClass
{
  return (Class)objc_opt_class();
}

@end
