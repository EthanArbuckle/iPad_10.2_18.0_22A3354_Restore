@implementation ProductReviewCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BridgeStoreExtension.ProductReviewCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityProductReviewCollectionViewCellElements
{
  JUMPOUT(0x2349095C0);
}

- (void)_setAccessibilityProductReviewCollectionViewCellElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BridgeStoreExtension.ProductReviewCollectionViewCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BridgeStoreExtension.ProductReviewCollectionViewCell"), CFSTR("accessibilityDateLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BridgeStoreExtension.ProductReviewCollectionViewCell"), CFSTR("accessibilityRatingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BridgeStoreExtension.ProductReviewCollectionViewCell"), CFSTR("accessibilityAuthorLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BridgeStoreExtension.ProductReviewCollectionViewCell"), CFSTR("accessibilityBodyLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BridgeStoreExtension.ProductReviewCollectionViewCell"), CFSTR("accessibilityResponseTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BridgeStoreExtension.ProductReviewCollectionViewCell"), CFSTR("accessibilityResponseDateLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BridgeStoreExtension.ProductReviewCollectionViewCell"), CFSTR("accessibilityResponseBodyLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ProductReviewCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[ProductReviewCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  -[ProductReviewCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityResponseTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");
  if (v4)
  {
    -[ProductReviewCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityResponseTitleLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[ProductReviewCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityResponseDateLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_accessibilityViewIsVisible");
  if (v7)
  {
    -[ProductReviewCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityResponseDateLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[ProductReviewCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityResponseBodyLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "_accessibilityViewIsVisible") & 1) != 0)
  {
    -[ProductReviewCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityResponseBodyLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    __UIAXStringForVariables();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
    v14 = v8;
    __UIAXStringForVariables();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7)
  if (v4)

  -[ProductReviewCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilityDateLabel, accessibilityRatingView, accessibilityAuthorLabel, accessibilityBodyLabel"), v14, v15, CFSTR("__AXStringForVariablesSentinel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
