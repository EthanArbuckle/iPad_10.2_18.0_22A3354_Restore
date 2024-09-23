@implementation VideosUI_FloatingCardHostingCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.FloatingCardHostingCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("VideosUI.TimedMetadataViewController"));
}

- (id)_axNode
{
  return (id)-[VideosUI_FloatingCardHostingCollectionViewCellAccessibility _accessibilityFindDescendant:](self, "_accessibilityFindDescendant:", &__block_literal_global_19);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD v10[5];

  v3 = MEMORY[0x2349244BC](CFSTR("VideosUI.TimedMetadataViewController"), a2);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __82__VideosUI_FloatingCardHostingCollectionViewCellAccessibility_accessibilityTraits__block_invoke;
  v10[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v10[4] = v3;
  -[VideosUI_FloatingCardHostingCollectionViewCellAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", v10, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VideosUI_FloatingCardHostingCollectionViewCellAccessibility _axNode](self, "_axNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accessibilityTraits");
  v7 = *MEMORY[0x24BDF73B0];
  if (!v4)
    v7 = 0;
  v8 = v7 | v6;

  return v8;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[VideosUI_FloatingCardHostingCollectionViewCellAccessibility _axNode](self, "_axNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
