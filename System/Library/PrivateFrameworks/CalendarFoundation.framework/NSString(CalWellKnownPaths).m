@implementation NSString(CalWellKnownPaths)

- (id)stringByExpandingTildeToNonSandboxHome
{
  void *v2;
  void *v3;

  +[CalWellKnownPaths realHomeDirectoryPath](CalWellKnownPaths, "realHomeDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
