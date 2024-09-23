@implementation SOPreferences

+ (BOOL)BOOLValueForKey:(__CFString *)a3 defaultValue:(BOOL)a4
{
  void *v5;
  void *v6;

  v5 = (void *)CFPreferencesCopyValue(a3, CFSTR("com.apple.AppSSO"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

+ (BOOL)isExtensionSignatureValidated
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SOPreferences_isExtensionSignatureValidated__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isExtensionSignatureValidated_onceToken != -1)
    dispatch_once(&isExtensionSignatureValidated_onceToken, block);
  return isExtensionSignatureValidated_extensionSignatureValidated;
}

void __46__SOPreferences_isExtensionSignatureValidated__block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(getSOUtilsClass_0(), "isInternalBuild"))
  {
    CFPreferencesSynchronize(CFSTR("com.apple.AppSSO"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
    v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValueForKey:defaultValue:", CFSTR("ExtensionSignatureValidated"), 1);
  }
  else
  {
    v2 = 1;
  }
  isExtensionSignatureValidated_extensionSignatureValidated = v2;
  SO_LOG_SOPreferences();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (isExtensionSignatureValidated_extensionSignatureValidated)
      v4 = "YES";
    else
      v4 = "NO";
    v5 = 136446210;
    v6 = v4;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "extensionSignatureValidated=%{public}s", (uint8_t *)&v5, 0xCu);
  }

}

+ (BOOL)isAssociatedDomainValidated
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SOPreferences_isAssociatedDomainValidated__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isAssociatedDomainValidated_onceToken != -1)
    dispatch_once(&isAssociatedDomainValidated_onceToken, block);
  return isAssociatedDomainValidated_associatedDomainValidated;
}

void __44__SOPreferences_isAssociatedDomainValidated__block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(getSOUtilsClass_0(), "isInternalBuild"))
  {
    CFPreferencesSynchronize(CFSTR("com.apple.AppSSO"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
    v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValueForKey:defaultValue:", CFSTR("AssociatedDomainValidated"), 1);
  }
  else
  {
    v2 = 1;
  }
  isAssociatedDomainValidated_associatedDomainValidated = v2;
  SO_LOG_SOPreferences();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (isAssociatedDomainValidated_associatedDomainValidated)
      v4 = "YES";
    else
      v4 = "NO";
    v5 = 136446210;
    v6 = v4;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "associatedDomainValidated=%{public}s", (uint8_t *)&v5, 0xCu);
  }

}

@end
