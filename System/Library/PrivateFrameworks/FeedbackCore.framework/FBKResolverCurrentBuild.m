@implementation FBKResolverCurrentBuild

+ (id)name
{
  return CFSTR("current_build");
}

- (int64_t)expectedArguments
{
  return 0;
}

- (id)run
{
  return +[FBKSSharedConstants swVers](FBKSharedConstants, "swVers");
}

@end
