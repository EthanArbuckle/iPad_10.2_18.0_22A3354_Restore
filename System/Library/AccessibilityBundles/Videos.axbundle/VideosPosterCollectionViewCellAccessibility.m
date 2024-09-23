@implementation VideosPosterCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosPosterCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("VideosCollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosPosterCollectionViewCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosPosterCollectionViewCell"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosPosterCollectionViewCell"), CFSTR("editingButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosPosterCollectionViewCell"), CFSTR("showCloudIcon"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosPosterCollectionViewCell"), CFSTR("artworkView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosPosterCollectionViewCell"), CFSTR("badgeCount"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosArtworkView"), CFSTR("placeholderTitle"), "@", 0);

}

- (BOOL)_axIsDeletable
{
  void *v2;
  char v3;

  -[VideosPosterCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("editingButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");

  return v3;
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
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;

  -[VideosPosterCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosPosterCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length", v20, CFSTR("__AXStringForVariablesSentinel")))
  {
    -[VideosPosterCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("artworkView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("placeholderTitle"));
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  -[VideosPosterCollectionViewCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXArtistName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[VideosPosterCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showCloudIcon"), v21, CFSTR("__AXStringForVariablesSentinel")))
  {
    accessibilityLocalizedString(CFSTR("in.icloud.badge"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (-[VideosPosterCollectionViewCellAccessibility _axIsDeletable](self, "_axIsDeletable", v22, v24))
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("video.thumbnail.delete"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v9);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  v14 = -[VideosPosterCollectionViewCellAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("badgeCount"));
  if (v14)
  {
    v15 = v14;
    v16 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("unplayed.episodes.count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v17, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v18 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v18;
  }
  return v9;
}

- (id)accessibilityHint
{
  void *v2;

  if (-[VideosPosterCollectionViewCellAccessibility _axIsDeletable](self, "_axIsDeletable"))
  {
    accessibilityLocalizedString(CFSTR("video.thumbnail.delete.hint"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  if (-[VideosPosterCollectionViewCellAccessibility _axIsDeletable](self, "_axIsDeletable"))
  {
    -[VideosPosterCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("editingButton"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityActivationPoint");
    v5 = v4;
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VideosPosterCollectionViewCellAccessibility;
    -[VideosPosterCollectionViewCellAccessibility accessibilityActivationPoint](&v10, sel_accessibilityActivationPoint);
  }
  result.y = v9;
  result.x = v8;
  return result;
}

@end
