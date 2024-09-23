@implementation VUIBaseCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIBaseCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("VideosUI.FlowcaseViewCell"));
}

- (BOOL)isAccessibilityElement
{
  MEMORY[0x2349244BC](CFSTR("VideosUI.FlowcaseViewCell"), a2);
  return objc_opt_isKindOfClass() & 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  objc_super v6;

  MEMORY[0x2349244BC](CFSTR("VideosUI.FlowcaseViewCell"), a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VUIBaseCollectionViewCellAccessibility _accessibilityStackingView](self, "_accessibilityStackingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VUIBaseCollectionViewCellAccessibility;
    -[VUIBaseCollectionViewCellAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIBaseCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[VUIBaseCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilityStackingView
{
  uint64_t v3;
  _QWORD v5[5];

  v3 = MEMORY[0x2349244BC](CFSTR("VideosUI.VerticalStackView"), a2);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__VUIBaseCollectionViewCellAccessibility__accessibilityStackingView__block_invoke;
  v5[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v5[4] = v3;
  -[VUIBaseCollectionViewCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __68__VUIBaseCollectionViewCellAccessibility__accessibilityStackingView__block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
