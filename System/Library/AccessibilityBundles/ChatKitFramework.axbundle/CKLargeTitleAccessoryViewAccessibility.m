@implementation CKLargeTitleAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKLargeTitleAccessoryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKLargeTitleAccessoryView"), CFSTR("accessoryButtons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CKLargeTitleAccessoryView"), CFSTR("newComposeButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CKLargeTitleAccessoryView"), CFSTR("newOptionsButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  __CFString *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
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
  v21.super_class = (Class)CKLargeTitleAccessoryViewAccessibility;
  -[CKLargeTitleAccessoryViewAccessibility _accessibilityLoadAccessibilityInformation](&v21, sel__accessibilityLoadAccessibilityInformation);
  -[CKLargeTitleAccessoryViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessoryButtons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "accessibilityIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("composeButton"));

        v11 = CFSTR("compose.button.text");
        if ((v10 & 1) != 0)
          goto LABEL_9;
        objc_msgSend(v8, "accessibilityIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("optionsButton"));

        v11 = CFSTR("more.button.text");
        if ((v13 & 1) == 0)
        {
          objc_msgSend(v8, "accessibilityIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("quickHideButton"));

          v11 = CFSTR("quickhide.button.text");
          if (!v15)
            continue;
        }
LABEL_9:
        accessibilityLocalizedString(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAccessibilityLabel:", v16);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

}

+ (id)newComposeButton
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CKLargeTitleAccessoryViewAccessibility;
  v2 = objc_msgSendSuper2(&v5, sel_newComposeButton);
  accessibilityLocalizedString(CFSTR("compose.button.text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

+ (id)newOptionsButton
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CKLargeTitleAccessoryViewAccessibility;
  v2 = objc_msgSendSuper2(&v5, sel_newOptionsButton);
  accessibilityLocalizedString(CFSTR("more.button.text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

@end
