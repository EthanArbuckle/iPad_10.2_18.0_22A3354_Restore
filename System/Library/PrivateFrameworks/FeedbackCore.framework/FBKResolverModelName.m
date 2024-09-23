@implementation FBKResolverModelName

+ (id)name
{
  return CFSTR("model_name");
}

- (int64_t)expectedArguments
{
  return 0;
}

- (id)run
{
  return +[FBKSharedConstants modelName](FBKSharedConstants, "modelName");
}

@end
