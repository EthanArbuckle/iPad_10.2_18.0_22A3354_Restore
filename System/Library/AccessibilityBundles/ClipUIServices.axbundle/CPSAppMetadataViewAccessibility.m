@implementation CPSAppMetadataViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CPSAppMetadataView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSAppMetadataView"), CFSTR("_appNameVibrantLabel"), "CPSVibrantLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSAppMetadataView"), CFSTR("_appStoreButton"), "CPSAppStoreButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSAppMetadataView"), CFSTR("_contentRatingContainerView"), "CPSContentRatingContainerView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSContentRatingContainerView"), CFSTR("_contentRatingImageView"), "CPSScaledImageView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageView"), CFSTR("image"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImage"), CFSTR("imageAsset"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  -[CPSAppMetadataViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_appNameVibrantLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPSAppMetadataViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_contentRatingContainerView._contentRatingImageView.image.imageAsset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("assetName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPSAppMetadataViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_appStoreButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("appstore.poweredBy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("appstore.age.rating"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v13, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  __UIAXStringForVariables();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
