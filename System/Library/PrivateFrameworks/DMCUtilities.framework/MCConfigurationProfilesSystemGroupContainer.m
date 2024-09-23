@implementation MCConfigurationProfilesSystemGroupContainer

void __MCConfigurationProfilesSystemGroupContainer_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (+[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad"))
  {
    v0 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
    MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath = (uint64_t)CFSTR("/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles");

  }
  v1 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
  if (MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath
    || (DMCSystemGroupContainerPathWithGroupIdentifier(CFSTR("systemgroup.com.apple.configurationprofiles")),
        v2 = objc_claimAutoreleasedReturnValue(),
        v3 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath,
        MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath = v2,
        v3,
        (v1 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath) != 0))
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles")) & 1) != 0)return;
    v4 = *DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v11 = 138543618;
      *(_QWORD *)&v11[4] = CFSTR("/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles");
      *(_WORD *)&v11[12] = 2114;
      *(_QWORD *)&v11[14] = MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
      v5 = "Received a profile system group container path we weren't expecting\n"
           "Expected: %{public}@\n"
           "Actual: %{public}@\n"
           "Overriding MCM with expected path";
      v6 = v4;
      v7 = 22;
LABEL_10:
      _os_log_impl(&dword_1A4951000, v6, OS_LOG_TYPE_FAULT, v5, v11, v7);
    }
  }
  else
  {
    v8 = *DMCLogObjects();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v11 = 138543362;
      *(_QWORD *)&v11[4] = CFSTR("/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles");
      v5 = "Failed to get profile system group container path. Overriding with expected path: %{public}@";
      v6 = v8;
      v7 = 12;
      goto LABEL_10;
    }
  }
  v9 = objc_msgSend(CFSTR("/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles"), "copy", *(_OWORD *)v11, *(_QWORD *)&v11[16]);
  v10 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
  MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath = v9;

}

@end
