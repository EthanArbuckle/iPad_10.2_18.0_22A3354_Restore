@implementation NSKeyedUnarchiver(LaunchServicesAdditions)

+ (id)ls_unarchivedObjectOfClass:()LaunchServicesAdditions fromData:error:
{
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _LSIsKindOfClasses(v7, v8);

    if ((v9 & 1) == 0)
    {

      if (a5)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB28A8], 4864, (uint64_t)"+[NSKeyedUnarchiver(LaunchServicesAdditions) ls_unarchivedObjectOfClass:fromData:error:]", 161, 0);
        v7 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
    }
  }
  return v7;
}

@end
