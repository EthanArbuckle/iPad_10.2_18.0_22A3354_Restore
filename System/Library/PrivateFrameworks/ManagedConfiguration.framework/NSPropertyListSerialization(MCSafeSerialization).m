@implementation NSPropertyListSerialization(MCSafeSerialization)

+ (id)MCSafePropertyListWithData:()MCSafeSerialization options:format:error:
{
  id v10;
  void *v11;

  v10 = a3;
  if (v10)
  {
    objc_msgSend(a1, "propertyListWithData:options:format:error:", v10, a4, a5, a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (void)MCSafePropertyListWithData:()MCSafeSerialization options:format:error:.cold.1(void *a1)
{
  id v1;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = objc_begin_catch(a1);
  v2 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v3 = 138543362;
    v4 = v1;
    _os_log_impl(&dword_19ECC4000, v2, OS_LOG_TYPE_ERROR, "Ignoring exception thrown when encoding plist: %{public}@", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

@end
