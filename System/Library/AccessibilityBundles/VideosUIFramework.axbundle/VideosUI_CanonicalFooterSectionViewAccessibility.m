@implementation VideosUI_CanonicalFooterSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.CanonicalFooterSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("VUIImageView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIImageView"), CFSTR("image"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalFooterSectionView"), CFSTR("accessibilityHeaderView"), "@");

}

- (id)_axHeaderView
{
  return (id)-[VideosUI_CanonicalFooterSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityHeaderView"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)VideosUI_CanonicalFooterSectionViewAccessibility;
  -[VideosUI_CanonicalFooterSectionViewAccessibility _accessibilityLoadAccessibilityInformation](&v19, sel__accessibilityLoadAccessibilityInformation);
  -[VideosUI_CanonicalFooterSectionViewAccessibility _axHeaderView](self, "_axHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        MEMORY[0x2349244BC](CFSTR("VUIImageView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "safeValueForKey:", CFSTR("image"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "accessibilityIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "accessibilityLabelForID:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setAccessibilityLabel:", v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v7);
  }

}

- (id)accessibilityHeaderElements
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[VideosUI_CanonicalFooterSectionViewAccessibility _axHeaderView](self, "_axHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosUI_CanonicalFooterSectionViewAccessibility;
  -[VideosUI_CanonicalFooterSectionViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[VideosUI_CanonicalFooterSectionViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
