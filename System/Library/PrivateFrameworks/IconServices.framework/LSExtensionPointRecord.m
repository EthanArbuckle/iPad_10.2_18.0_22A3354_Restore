@implementation LSExtensionPointRecord

void __77__LSExtensionPointRecord_IconServicesAdditions___IS_extensionsCanProvideIcon__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.watchkit");
  v4[1] = CFSTR("com.apple.message-payload-provider");
  v4[2] = CFSTR("com.apple.services");
  v4[3] = CFSTR("com.apple.ui-services");
  v4[4] = CFSTR("com.apple.fileprovider-nonui");
  v4[5] = CFSTR("com.apple.fileprovider-actionsui");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_IS_extensionsCanProvideIcon_extensionPointsWithIcons;
  _IS_extensionsCanProvideIcon_extensionPointsWithIcons = v2;

}

void __92__LSExtensionPointRecord_IconServicesAdditions___IS_extensionsShouldFallbackToContainerIcon__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.watchkit");
  v4[1] = CFSTR("com.apple.message-payload-provider");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_IS_extensionsShouldFallbackToContainerIcon_extensionPointsHavingExtensionThatMustProvideIcons;
  _IS_extensionsShouldFallbackToContainerIcon_extensionPointsHavingExtensionThatMustProvideIcons = v2;

}

@end
