@implementation NSBundle(GC)

+ (id)GameControllerFoundationBundle
{
  if (GameControllerFoundationBundle_onceToken != -1)
    dispatch_once(&GameControllerFoundationBundle_onceToken, &__block_literal_global_2);
  return (id)GameControllerFoundationBundle_Bundle;
}

+ (id)GameControllerFrameworkBundle
{
  if (GameControllerFrameworkBundle_onceToken != -1)
    dispatch_once(&GameControllerFrameworkBundle_onceToken, &__block_literal_global_2);
  return (id)GameControllerFrameworkBundle_Bundle;
}

+ (id)gc_bundleForExecutableAtURL:()GC
{
  void *v0;
  void *v1;

  v0 = (void *)_CFBundleCopyBundleURLForExecutableURL();
  if (v0)
  {
    +[NSBundle bundleWithURL:](NSBundle_0, "bundleWithURL:", v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

+ (id)gc_bundleForExecutableAtPath:()GC
{
  void *v2;
  void *v3;

  +[NSURL fileURLWithPath:](&off_1F03AA4A8, "fileURLWithPath:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "gc_bundleForExecutableAtURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
