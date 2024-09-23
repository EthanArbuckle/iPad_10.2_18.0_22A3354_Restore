@implementation MCConfigurationProfilesSystemGroupContainer

void __MCConfigurationProfilesSystemGroupContainer_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MCSystemGroupContainerPathWithGroupIdentifier(CFSTR("systemgroup.com.apple.configurationprofiles"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
  MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath = v0;

  if (MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath)
  {
    if ((objc_msgSend((id)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath, "isEqualToString:", CFSTR("/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles")) & 1) != 0)return;
    v2 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v9 = 138543618;
      *(_QWORD *)&v9[4] = CFSTR("/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles");
      *(_WORD *)&v9[12] = 2114;
      *(_QWORD *)&v9[14] = MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
      v3 = "Received a profile system group container path we weren't expecting\n"
           "Expected: %{public}@\n"
           "Actual: %{public}@\n"
           "Overriding MCM with expected path";
      v4 = v2;
      v5 = 22;
LABEL_7:
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_FAULT, v3, v9, v5);
    }
  }
  else
  {
    v6 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v9 = 138543362;
      *(_QWORD *)&v9[4] = CFSTR("/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles");
      v3 = "Failed to get profile system group container path. Overriding with expected path: %{public}@";
      v4 = v6;
      v5 = 12;
      goto LABEL_7;
    }
  }
  v7 = objc_msgSend(CFSTR("/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles"), "copy", *(_OWORD *)v9, *(_QWORD *)&v9[16], v10);
  v8 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
  MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath = v7;

}

@end
