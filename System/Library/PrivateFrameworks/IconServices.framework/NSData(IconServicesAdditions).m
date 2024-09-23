@implementation NSData(IconServicesAdditions)

+ (id)__is__bookmarkDataWithContentsOfURL:()IconServicesAdditions
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v7;

  v3 = a3;
  v7 = 0;
  v4 = (void *)MEMORY[0x1AF422C40](0, v3, &v7);
  if (!v4)
  {
    _ISDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[NSData(IconServicesAdditions) __is__bookmarkDataWithContentsOfURL:].cold.1((uint64_t)v3, &v7, v5);

  }
  return v4;
}

- (id)__is__bookmarkResourcePropertyForKey:()IconServicesAdditions
{
  return (id)MEMORY[0x1AF422C4C](0, a3, a1);
}

+ (id)__is__dataWithContentsOfURL:()IconServicesAdditions
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "_IF_isOnBootVolume");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)__is__bookmarkDataWithContentsOfURL:()IconServicesAdditions .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_1AA928000, log, OS_LOG_TYPE_DEBUG, "Failed to read bookmarkm data from URL %@ with error: %@", (uint8_t *)&v4, 0x16u);
}

@end
