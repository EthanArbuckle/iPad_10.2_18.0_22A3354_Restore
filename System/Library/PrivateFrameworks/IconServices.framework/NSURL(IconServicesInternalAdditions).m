@implementation NSURL(IconServicesInternalAdditions)

+ (id)_is_unregisteredPersonlityFileExtensions
{
  if (_is_unregisteredPersonlityFileExtensions_onceToken != -1)
    dispatch_once(&_is_unregisteredPersonlityFileExtensions_onceToken, &__block_literal_global_37);
  return (id)_is_unregisteredPersonlityFileExtensions_personalityMap;
}

- (id)__is_canonicalURL
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C999D0];
  v11[0] = *MEMORY[0x1E0C998C8];
  v2 = v11[0];
  v11[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(a1, "__is_resourceValuesForKeys:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_IF_stringForKey:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "_IF_BOOLForKey:", v3);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)__is__contentModifiedDate
{
  int v1;
  id v2;
  uint64_t v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C998D8], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v3;
  }
  return v2;
}

- (id)__is__attributeModifiedDate
{
  int v1;
  id v2;
  uint64_t v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C998C0], 0);
  v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v3;
  }
  return v2;
}

- (id)__is__modifiedDate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "__is__attributeModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "__is__contentModifiedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "compare:", v2) == -1)
    v4 = v2;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (uint64_t)__is_packageTypeCode
{
  return 0;
}

+ (uint64_t)__is__isNetBoot
{
  if (__is__isNetBoot_once != -1)
    dispatch_once(&__is__isNetBoot_once, &__block_literal_global_39);
  return __is__isNetBoot_result;
}

+ (uint64_t)__is__volumeTypeCodeFromURLProperties:()IconServicesInternalAdditions
{
  return 0;
}

- (uint64_t)__is__volumeTypeCode
{
  return 0;
}

@end
