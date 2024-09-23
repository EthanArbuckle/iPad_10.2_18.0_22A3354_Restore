@implementation WFWallpaperModificationAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)name
{
  return WFLocalizedStringWithKey(CFSTR("Wallpaper (Service Name)"), CFSTR("Wallpaper"));
}

- (unint64_t)status
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x24BE19570], "defaultProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWallpaperModificationAllowed");

  if (v3)
    return 4;
  else
    return 3;
}

- (id)localizedAccessResourceErrorString
{
  return WFLocalizedString(CFSTR("Changing wallpaper is restricted on this device."));
}

@end
