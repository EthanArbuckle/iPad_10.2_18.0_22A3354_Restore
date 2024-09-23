@implementation NSUserDefaults(C2Defaults)

+ (id)c2DefaultsDomain
{
  if (c2DefaultsDomain_once != -1)
    dispatch_once(&c2DefaultsDomain_once, &__block_literal_global);
  return (id)c2DefaultsDomain_c2DefaultsDomain;
}

@end
