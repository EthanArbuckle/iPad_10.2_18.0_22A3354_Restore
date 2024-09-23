@implementation LSExtensionPointRecord(IconServicesAdditions)

- (uint64_t)_IS_extensionsCanProvideIcon
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (_IS_extensionsCanProvideIcon_onceToken != -1)
    dispatch_once(&_IS_extensionsCanProvideIcon_onceToken, &__block_literal_global);
  v2 = (void *)_IS_extensionsCanProvideIcon_extensionPointsWithIcons;
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (uint64_t)_IS_extensionsShouldFallbackToContainerIcon
{
  void *v2;
  void *v3;

  if (_IS_extensionsShouldFallbackToContainerIcon_onceToken != -1)
    dispatch_once(&_IS_extensionsShouldFallbackToContainerIcon_onceToken, &__block_literal_global_65);
  v2 = (void *)_IS_extensionsShouldFallbackToContainerIcon_extensionPointsHavingExtensionThatMustProvideIcons;
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "containsObject:", v3);

  return v2 ^ 1;
}

@end
