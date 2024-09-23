@implementation _TVCollectionViewLockupCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVCollectionViewLockupCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("_TVListTemplateView"));
  objc_msgSend(v3, "validateClass:", CFSTR("_TVStackingPosterView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVListTemplateView"), CFSTR("listView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVStackingPosterView"), CFSTR("animatedLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewCell"), CFSTR("contentView"), "@", 0);

}

- (id)_accessibilityFrameDelegate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;
  char v11;

  v11 = 0;
  objc_opt_class();
  -[_TVCollectionViewLockupCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    objc_msgSend(v4, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_TVCollectionViewLockupCellAccessibility;
    -[_TVCollectionViewLockupCellAccessibility _accessibilityFrameDelegate](&v10, sel__accessibilityFrameDelegate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (CGRect)_accessibilityFocusableFrameForZoom
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  char v28;
  CGRect v29;
  CGRect result;

  -[_TVCollectionViewLockupCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("subviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "axFilterObjectsUsingBlock:", &__block_literal_global_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safeValueForKey:", CFSTR("animatedLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_3;
  objc_msgSend(v8, "safeValueForKey:", CFSTR("layer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v29.origin.x = v12;
  v29.origin.y = v14;
  v29.size.width = v16;
  v29.size.height = v18;
  if (CGRectIsEmpty(v29))
  {
LABEL_3:
    v27.receiver = self;
    v27.super_class = (Class)_TVCollectionViewLockupCellAccessibility;
    -[_TVCollectionViewLockupCellAccessibility _accessibilityFocusableFrameForZoom](&v27, sel__accessibilityFocusableFrameForZoom);
    v12 = v19;
    v14 = v20;
    v16 = v21;
    v18 = v22;
  }

  v23 = v12;
  v24 = v14;
  v25 = v16;
  v26 = v18;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
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
  uint64_t v11;
  void *v12;
  objc_super v14;
  char v15;

  -[_TVCollectionViewLockupCellAccessibility _atvaccessibilityITMLAccessibilityContent](self, "_atvaccessibilityITMLAccessibilityContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[_TVCollectionViewLockupCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  objc_opt_class();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "axFilterObjectsUsingBlock:", &__block_literal_global_203);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "_accessibilityLabelIncludingFallbackPlaceholder:usesSubviewsForComponents:", 0, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (!objc_msgSend(v10, "length"))
  {
    v14.receiver = self;
    v14.super_class = (Class)_TVCollectionViewLockupCellAccessibility;
    -[_TVCollectionViewLockupCellAccessibility accessibilityLabel](&v14, sel_accessibilityLabel);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  objc_msgSend(MEMORY[0x24BDFFA80], "textByReconcilingClientText:withServerText:", v10, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
