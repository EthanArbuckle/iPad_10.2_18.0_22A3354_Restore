@implementation NSTimeZone(VSAdditions)

+ (uint64_t)vs_isTimeZoneSet
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("timezoneset"), CFSTR("com.apple.preferences.datetime"));
  v1 = v0;
  if (v0)
  {
    v2 = v0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v3 = (void *)MEMORY[0x1E0C99DA0];
        v4 = *MEMORY[0x1E0C99778];
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "raise:format:", v4, CFSTR("Unexpectedly, value was %@, instead of NSNumber."), v6);

      }
      v7 = objc_msgSend(v2, "BOOLValue");
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
