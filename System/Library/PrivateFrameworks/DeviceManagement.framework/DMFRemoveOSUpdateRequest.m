@implementation DMFRemoveOSUpdateRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4CA0;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

@end
