@implementation BSPathProviderFactory

+ (id)pathProviderForCurrentContainer
{
  return (id)objc_opt_new();
}

+ (id)pathProviderForSystemContainerForCurrentProcess
{
  return (id)objc_opt_new();
}

@end
