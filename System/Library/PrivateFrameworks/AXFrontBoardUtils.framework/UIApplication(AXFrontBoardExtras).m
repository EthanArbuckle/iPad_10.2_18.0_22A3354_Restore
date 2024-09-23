@implementation UIApplication(AXFrontBoardExtras)

- (void)_accessibilityAddRecentlyActivatedBundleIdFromSwitcher:()AXFrontBoardExtras
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  v3 = _accessibilityAddRecentlyActivatedBundleIdFromSwitcher__onceToken;
  v4 = a3;
  v6 = v4;
  if (v3 == -1)
  {
    v5 = v4;
  }
  else
  {
    dispatch_once(&_accessibilityAddRecentlyActivatedBundleIdFromSwitcher__onceToken, &__block_literal_global_0);
    v5 = v6;
  }
  objc_msgSend((id)_accessibilityBundleIdsRecentlyActivatedFromSwitcher, "addObject:", v5);

}

- (uint64_t)_accessibilityRemoveRecentlyActivatedBundleIdFromSwitcher:()AXFrontBoardExtras
{
  return objc_msgSend((id)_accessibilityBundleIdsRecentlyActivatedFromSwitcher, "removeObject:");
}

- (id)_accessibilityRecentlyActivatedApplicationBundleIdentifiers
{
  if (_accessibilityBundleIdsRecentlyActivatedFromSwitcher)
    return (id)_accessibilityBundleIdsRecentlyActivatedFromSwitcher;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
