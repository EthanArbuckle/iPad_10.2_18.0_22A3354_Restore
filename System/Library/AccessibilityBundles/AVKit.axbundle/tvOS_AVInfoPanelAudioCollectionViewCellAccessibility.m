@implementation tvOS_AVInfoPanelAudioCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVInfoPanelAudioCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVInfoPanelAudioCollectionViewCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVInfoPanelAudioCollectionViewCell"), CFSTR("_checkmarkImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVInfoPanelAudioCollectionViewCell"), CFSTR("_mediaOption"), "AVInfoPanelMediaOption");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVInfoPanelAudioCollectionViewCell"), CFSTR("_displayAsSelected"), "B");
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("AVInfoPanelMediaOption"), CFSTR("_imageForRoute:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVInfoPanelMediaOption"), CFSTR("route"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("AVInfoPanelCollectionReusableHeaderView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVInfoPanelCollectionReusableHeaderView"), CFSTR("UIView"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[tvOS_AVInfoPanelAudioCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[tvOS_AVInfoPanelAudioCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mediaOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v9 = MEMORY[0x24BDAC760];
  v4 = v3;
  AXPerformSafeBlock();
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  objc_msgSend(v5, "accessibilityLabel", v9, 3221225472, __74__tvOS_AVInfoPanelAudioCollectionViewCellAccessibility_accessibilityValue__block_invoke, &unk_250141528);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[tvOS_AVInfoPanelAudioCollectionViewCellAccessibility accessibilityLabel](self, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "isEqualToString:", v7);

  if ((_DWORD)v5)
  {

    v6 = 0;
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[tvOS_AVInfoPanelAudioCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_displayAsSelected"));
  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (id)accessibilityHeaderElements
{
  void *v2;
  void *v3;
  void *v4;

  -[tvOS_AVInfoPanelAudioCollectionViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityFindDescendant:", &__block_literal_global_7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
