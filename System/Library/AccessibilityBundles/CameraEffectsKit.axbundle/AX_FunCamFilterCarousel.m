@implementation AX_FunCamFilterCarousel

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  -[AX_FunCamFilterCarousel accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isDisplayingExpandedLayout")) ^ 1;

  return v3;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("filter.carousel"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_opt_class();
  -[AX_FunCamFilterCarousel accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[AX_FunCamFilterCarousel accessibilityContainer](self, "accessibilityContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("indexPathForCenterOfCollectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cellForItemAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_opt_class();
  -[AX_FunCamFilterCarousel accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[AX_FunCamFilterCarousel accessibilityContainer](self, "accessibilityContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("indexPathForCenterOfCollectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cellForItemAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AX_FunCamFilterCarousel;
  return *MEMORY[0x24BDF73A0] | -[AX_FunCamFilterCarousel accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)accessibilityIncrement
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  -[AX_FunCamFilterCarousel accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("selectedIndex"));

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v4 + 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AX_FunCamFilterCarousel accessibilityContainer](self, "accessibilityContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "safeUnsignedIntegerForKey:", CFSTR("cachedEffectCount"));

  if ((objc_msgSend(v5, "item") & 0x8000000000000000) == 0 && objc_msgSend(v5, "item") < v7)
  {
    objc_opt_class();
    -[AX_FunCamFilterCarousel accessibilityContainer](self, "accessibilityContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("collectionView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v5;
    v11 = v10;
    AXPerformSafeBlock();

  }
}

- (void)accessibilityDecrement
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  -[AX_FunCamFilterCarousel accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("selectedIndex"));

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v4 - 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AX_FunCamFilterCarousel accessibilityContainer](self, "accessibilityContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "safeUnsignedIntegerForKey:", CFSTR("cachedEffectCount"));

  if ((objc_msgSend(v5, "item") & 0x8000000000000000) == 0 && objc_msgSend(v5, "item") < v7)
  {
    objc_opt_class();
    -[AX_FunCamFilterCarousel accessibilityContainer](self, "accessibilityContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("collectionView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v5;
    v11 = v10;
    AXPerformSafeBlock();

  }
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  -[AX_FunCamFilterCarousel accessibilityContainer](self, "accessibilityContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
  {
    v7 = objc_msgSend(v6, "accessibilityScrollRightPage");
  }
  else if (a3 == 2)
  {
    v7 = objc_msgSend(v6, "accessibilityScrollLeftPage");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)AX_FunCamFilterCarousel;
    v7 = -[AX_FunCamFilterCarousel accessibilityScroll:](&v10, sel_accessibilityScroll_, a3);
  }
  v8 = v7;

  return v8;
}

- (CGRect)accessibilityFrameInContainerSpace
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[AX_FunCamFilterCarousel accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

@end
