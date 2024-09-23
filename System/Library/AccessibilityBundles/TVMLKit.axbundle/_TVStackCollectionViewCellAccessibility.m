@implementation _TVStackCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVStackCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySupportsSemanticContext
{
  return 0;
}

- (BOOL)_accessibilityScrollingEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  BOOL v8;
  objc_super v10;
  char v11;

  NSClassFromString(CFSTR("TVCarouselView"));
  v11 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_TVStackCollectionViewCellAccessibility;
    v8 = -[_TVStackCollectionViewCellAccessibility _accessibilityScrollingEnabled](&v10, sel__accessibilityScrollingEnabled);
  }

  return v8;
}

@end
