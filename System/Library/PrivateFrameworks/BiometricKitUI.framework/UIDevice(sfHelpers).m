@implementation UIDevice(sfHelpers)

- (uint64_t)bkui_IsInternalInstall
{
  if (bkui_IsInternalInstall___onceToken != -1)
    dispatch_once(&bkui_IsInternalInstall___onceToken, &__block_literal_global_10);
  return bkui_IsInternalInstall___internalInstall;
}

- (BOOL)bkui_isRTL
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceLayoutDirection") == 1;

  return v1;
}

@end
