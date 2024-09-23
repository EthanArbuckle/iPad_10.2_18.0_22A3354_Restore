@implementation LSPlugInKitProxy

void __62__LSPlugInKitProxy_IconServicesAdditions____IS_canProvideIcon__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = _kISWatchKitExtensionPointIdentifier;
  v4[1] = _kISMessagesExtensionPointIdentifier;
  v4[2] = _kISServicesExtensionPointIdentifier;
  v4[3] = _kISUIServicesExtensionPointIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__IS_canProvideIcon_extensionPointsWithIcons;
  __IS_canProvideIcon_extensionPointsWithIcons = v2;

}

void __58__LSPlugInKitProxy_IconServicesAdditions____IS_isWatchApp__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = _kISWatchKitExtensionPointIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__IS_isWatchApp_extensionPointsWithIcons;
  __IS_isWatchApp_extensionPointsWithIcons = v2;

}

void __61__LSPlugInKitProxy_IconServicesAdditions____IS_isMessagesApp__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = _kISMessagesExtensionPointIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__IS_isMessagesApp_extensionPointsWithIcons;
  __IS_isMessagesApp_extensionPointsWithIcons = v2;

}

@end
