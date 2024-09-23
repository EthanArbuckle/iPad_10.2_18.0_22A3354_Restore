@implementation SUBannerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUBannerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_reloadButtons
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)SUBannerCellAccessibility;
  -[SUBannerCellAccessibility _reloadButtons](&v22, sel__reloadButtons);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SUBannerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "setIsAccessibilityElement:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  -[SUBannerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_leftButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsAccessibilityElement:", 1);

  -[SUBannerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_leftButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUBannerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configurationView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("_configuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityTableViewCellText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v12);

  -[SUBannerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_rightButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIsAccessibilityElement:", 1);

  -[SUBannerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_rightButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUBannerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configurationView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeValueForKey:", CFSTR("_configuration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessibilityTableViewCellText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityLabel:", v17);

}

@end
