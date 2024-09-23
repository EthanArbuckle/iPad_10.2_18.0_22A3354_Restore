@implementation SBIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIcon");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIcon"), CFSTR("_observers"), "NSHashTable");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("displayNameForLocation:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconView"), CFSTR("_accessoryView"), "UIView<SBIconAccessoryView>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("badgeNumberOrString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("behaviorDelegate"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("SBIconViewBehaviorDelegate"), CFSTR("iconViewDisplaysBadges:"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("SBHLibraryViewController"), CFSTR("SBIconViewBehaviorDelegate"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBIconAccessoryView"), CFSTR("displayingAccessory"));

}

- (unint64_t)_accessibilityAutomationType
{
  return 44;
}

- (id)_axIconView
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  SBIconAccessibility *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  buf[0] = 0;
  objc_opt_class();
  -[SBIconAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_observers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("SBIconView"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "window", (_QWORD)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "safeStringForKey:", CFSTR("location"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (!SBAXIsIconViewIgnoreLocation(v12))
            {
              AXLogUIA();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v21 = v10;
                v22 = 2112;
                v23 = self;
                _os_log_impl(&dword_232A63000, v14, OS_LOG_TYPE_INFO, "return observer: %@ for this icon: %@", buf, 0x16u);
              }

              v13 = v10;
              goto LABEL_16;
            }

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (id)_axIconLabel
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__2;
  v8 = __Block_byref_object_dispose__2;
  v9 = 0;
  AXPerformSafeBlock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __35__SBIconAccessibility__axIconLabel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  getSBIconLocationNone();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayNameForLocation:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)accessibilityIdentifier
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__2;
  v8 = __Block_byref_object_dispose__2;
  v9 = 0;
  AXPerformSafeBlock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __46__SBIconAccessibility_accessibilityIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  getSBIconLocationNone();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayNameForLocation:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_axIconValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  uint8_t buf[8];
  _BYTE v24[20];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[SBIconAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("badgeNumberOrString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconAccessibility _axIconView](self, "_axIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  buf[0] = 0;
  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_accessoryView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("displayingAccessory"));
  }
  else
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("behaviorDelegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)v24 = buf;
      *(_QWORD *)&v24[8] = 0x2020000000;
      v24[16] = 0;
      v22 = v4;
      AXPerformSafeBlock();
      v7 = *(_BYTE *)(*(_QWORD *)v24 + 24) != 0;

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v7 = 0;
    }
  }
  AXLogAppAccessibility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = v7;
    *(_WORD *)v24 = 2112;
    *(_QWORD *)&v24[2] = v3;
    *(_WORD *)&v24[10] = 2112;
    *(_QWORD *)&v24[12] = v6;
    _os_log_impl(&dword_232A63000, v10, OS_LOG_TYPE_INFO, "Showing badge: %d[%@] -> %@", buf, 0x1Cu);
  }

  -[SBIconAccessibility _accessibilityBundleIdentifier](self, "_accessibilityBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v3)
    v13 = v7;
  else
    v13 = 0;
  if (v13 != 1)
  {
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE00530]))
    {
      accessibilityLocalizedString(CFSTR("mail.badge.none"));
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v18 = (void *)v15;
      goto LABEL_41;
    }
LABEL_26:
    v18 = 0;
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (int)objc_msgSend(v3, "intValue");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (v16 = objc_msgSend(v3, "intValue"), v16 < 1))
    {
LABEL_22:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "isEqualToString:", CFSTR("!")))
      {
        accessibilityLocalizedString(CFSTR("badge.exclamation"));
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    v14 = v16;
  }
  if (v14 < 1)
    goto LABEL_22;
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE00530]) & 1) != 0)
  {
    v17 = CFSTR("mail.badge.format");
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
  {
    v17 = CFSTR("messages.badge.format");
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.mobilecal")) & 1) != 0)
  {
    v17 = CFSTR("calendar.badge.format");
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) != 0)
  {
    v17 = CFSTR("photos.badge.format");
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.reminders")) & 1) != 0)
  {
    v17 = CFSTR("reminders.badge.format");
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.AppStore")) & 1) != 0)
  {
    v17 = CFSTR("appstore.badge.format");
  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.facetime")))
  {
    v17 = CFSTR("facetime.badge.format");
  }
  else
  {
    v17 = CFSTR("badge.format");
  }
  v19 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringWithFormat:", v20, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_41:
  return v18;
}

void __35__SBIconAccessibility__axIconValue__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("behaviorDelegate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "iconViewDisplaysBadges:", *(_QWORD *)(a1 + 32));

}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[SBIconAccessibility _accessibilityUnregister](self, "_accessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)SBIconAccessibility;
  -[SBIconAccessibility dealloc](&v3, sel_dealloc);
}

@end
