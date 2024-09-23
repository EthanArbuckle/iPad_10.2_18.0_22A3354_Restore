@implementation CalLocationBundle

+ (id)bundle
{
  void *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend((id)objc_opt_class(), "_path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[CalLocationBundle bundle].cold.1((uint64_t)v2, v4);

  }
  return v3;
}

+ (id)_path
{
  void *v2;
  void *v3;

  __CalSystemRootDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("/System/Library/LocationBundles/CalendarLocation.bundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)bundle
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "Could not find location bundle at path: [%@].", (uint8_t *)&v2, 0xCu);
}

@end
