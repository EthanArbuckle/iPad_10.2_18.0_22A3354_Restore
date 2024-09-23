@implementation HMActionSet(HFFavoritableAdoption)

- (uint64_t)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 3);
}

- (uint64_t)hf_isFavorite
{
  NSLog(CFSTR("ActionSet cannot be favorited."));
  return objc_msgSend(a1, "hf_showInHomeDashboard");
}

- (uint64_t)hf_hasSetFavorite
{
  NSLog(CFSTR("ActionSet cannot be setting favorite."));
  return 0;
}

- (uint64_t)hf_updateIsFavorite:()HFFavoritableAdoption
{
  NSLog(CFSTR("Attempting to update ActionSet's favorite."));
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (uint64_t)hf_showInHomeDashboard
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 3);
}

- (uint64_t)hf_hasSetShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 3);
}

- (uint64_t)hf_updateShowInHomeDashboard:()HFFavoritableAdoption
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 3);
}

@end
