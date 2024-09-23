@implementation SBLogoutProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBLogoutProgressView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBLogoutProgressView"), CFSTR("_goodbyeLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBLogoutProgressView"), CFSTR("_savingDocumentsLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBLogoutProgressView"), CFSTR("_savingDocumentsMoreLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBLogoutProgressView"), CFSTR("_blameAppNameLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBLogoutProgressView"), CFSTR("_blameAppIconView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBLogoutProgressView"), CFSTR("_userAvatarView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBLogoutProgressView"), CFSTR("_userContact"), "CNContact");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLogoutProgressView"), CFSTR("_updateViewData"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUILegibilityLabel"), CFSTR("string"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)SBLogoutProgressViewAccessibility;
  -[SBLogoutProgressViewAccessibility _accessibilityLoadAccessibilityInformation](&v21, sel__accessibilityLoadAccessibilityInformation);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = objc_msgSend(&unk_250381880, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(&unk_250381880);
        -[SBLogoutProgressViewAccessibility safeValueForKey:](self, "safeValueForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setIsAccessibilityElement:", 1);

      }
      v4 = objc_msgSend(&unk_250381880, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }
  -[SBLogoutProgressViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_blameAppIconView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsAccessibilityElement:", 0);

  -[SBLogoutProgressViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_userAvatarView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[SBLogoutProgressViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_userContact"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_msgSend(MEMORY[0x24BDBAEB8], "monogramTypeForContact:", v11);
    objc_msgSend(v9, "setIsAccessibilityElement:", 1);
    objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == 1)
      v14 = CFSTR("contact.description.initials");
    else
      v14 = CFSTR("contact.description.photo");
    accessibilityLocalizedString(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityLabel:", v16);

  }
}

- (void)_updateViewData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBLogoutProgressViewAccessibility;
  -[SBLogoutProgressViewAccessibility _updateViewData](&v3, sel__updateViewData);
  -[SBLogoutProgressViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
