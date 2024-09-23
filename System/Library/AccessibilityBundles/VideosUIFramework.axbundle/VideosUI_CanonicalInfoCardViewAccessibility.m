@implementation VideosUI_CanonicalInfoCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.CanonicalInfoCardView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalInfoCardView"), CFSTR("accessibilityTitleLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalInfoCardView"), CFSTR("accessibilitySubtitleLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalInfoCardView"), CFSTR("accessibilityImageView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CanonicalInfoCardView"), CFSTR("accessibilityTableView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.TomatometerTableView"), CFSTR("accessibilityItemViews"), "@");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)VideosUI_CanonicalInfoCardViewAccessibility;
  -[VideosUI_CanonicalInfoCardViewAccessibility _accessibilityLoadAccessibilityInformation](&v15, sel__accessibilityLoadAccessibilityInformation);
  -[VideosUI_CanonicalInfoCardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("accessibilityItemViews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        AXLabelForElements();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setAccessibilityLabel:", v4);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[VideosUI_CanonicalInfoCardViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilitySubtitleLabel, accessibilityImageView, accessibilityTableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_CanonicalInfoCardViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x2349244BC](CFSTR("VUITextView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_accessibilityGetValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 2, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosUI_CanonicalInfoCardViewAccessibility;
  -[VideosUI_CanonicalInfoCardViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[VideosUI_CanonicalInfoCardViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
