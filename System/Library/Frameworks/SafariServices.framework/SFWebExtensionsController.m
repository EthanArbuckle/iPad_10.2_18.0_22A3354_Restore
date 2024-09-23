@implementation SFWebExtensionsController

id __169__SFWebExtensionsController_SafariServicesExtras__showAccessRequestDialogForExtension_URLs_callingAPIName_showMoreOptionsForAlwaysAllow_includeDenyButton_responseBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_stringByRemovingWwwAndWildcardDotPrefixes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __145__SFWebExtensionsController_SafariServicesExtras___showPromptForExtensionDisabledBecauseItHasRequestedAdditionalPermissions_extensionIdentifier___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=SAFARI&path=WEB_EXTENSIONS"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

  }
}

@end
