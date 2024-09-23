@implementation UIScene(AVSecondScreenAdditions)

+ (id)avkit_secondScreenScenes
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "connectedScenes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_20152);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "filteredSetUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)avkit_asWindowScene
{
  return 0;
}

- (uint64_t)avkit_screenType
{
  return 0;
}

- (BOOL)avkit_isForeground
{
  return !objc_msgSend(a1, "activationState") || objc_msgSend(a1, "activationState") == 1;
}

- (uint64_t)avkit_screenHasWindowsExcludingWindow:()AVSecondScreenAdditions
{
  return 0;
}

- (uint64_t)avkit_resetPreferredModeSwitchRequest
{
  return objc_msgSend(a1, "_avkit_setPreferredRefreshRate:HDRMode:overscanCompensation:", -1, -1, 0.0);
}

- (uint64_t)avkit_setPreferredRefreshRate:()AVSecondScreenAdditions HDRMode:
{
  return objc_msgSend(a1, "_avkit_setPreferredRefreshRate:HDRMode:overscanCompensation:", a3, 0);
}

- (void)_avkit_setPreferredRefreshRate:()AVSecondScreenAdditions HDRMode:overscanCompensation:
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[UIScene(AVSecondScreenAdditions) _avkit_setPreferredRefreshRate:HDRMode:overscanCompensation:]";
    _os_log_impl(&dword_1AC4B1000, v0, OS_LOG_TYPE_DEFAULT, "%s This feature requires a UIWindowScene.", (uint8_t *)&v1, 0xCu);
  }

}

@end
