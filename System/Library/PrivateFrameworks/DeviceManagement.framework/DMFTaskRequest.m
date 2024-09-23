@implementation DMFTaskRequest

+ (NSArray)permittedPlatforms
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 0;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)isPermittedOnCurrentPlatform
{
  return objc_msgSend(a1, "isPermittedOnPlatform:", 1);
}

+ (BOOL)isPermittedOnPlatform:(unint64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a1, "permittedPlatforms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

@end
