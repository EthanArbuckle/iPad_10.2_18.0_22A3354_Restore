@implementation MCUMUserManagerClass

void __MCUMUserManagerClass_block_invoke()
{
  void *v0;
  NSObject *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  UserManagementBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  MCUMUserManagerClass_theClass = objc_msgSend(v0, "classNamed:", CFSTR("UMUserManager"));

  if (!MCUMUserManagerClass_theClass)
  {
    v1 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v2 = 138543362;
      v3 = CFSTR("UMUserManager");
      _os_log_impl(&dword_19ECC4000, v1, OS_LOG_TYPE_ERROR, "Could not load %{public}@", (uint8_t *)&v2, 0xCu);
    }
  }
}

@end
