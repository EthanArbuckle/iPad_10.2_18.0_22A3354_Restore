@implementation SKUICarouselPageSectionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUICarouselPageSection");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUICarouselPageSection"), CFSTR("_carouselCollectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUICarouselPageSection"), CFSTR("_modelObjects"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUICarouselPageSection"), CFSTR("willAppearInContext:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUICarouselPageSection"), CFSTR("willTransitionToSize: withTransitionCoordinator:"), "v", "{CGSize=dd}", "@", 0);

}

- (void)_fireCycleTimer
{
  objc_super v3;

  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v3.receiver = self;
    v3.super_class = (Class)SKUICarouselPageSectionAccessibility;
    -[SKUICarouselPageSectionAccessibility _fireCycleTimer](&v3, sel__fireCycleTimer);
  }
}

- (void)willAppearInContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUICarouselPageSectionAccessibility;
  -[SKUICarouselPageSectionAccessibility willAppearInContext:](&v4, sel_willAppearInContext_, a3);
  -[SKUICarouselPageSectionAccessibility _accessibilityUpdateValidIndices](self, "_accessibilityUpdateValidIndices");
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUICarouselPageSectionAccessibility;
  -[SKUICarouselPageSectionAccessibility willTransitionToSize:withTransitionCoordinator:](&v5, sel_willTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[SKUICarouselPageSectionAccessibility _accessibilityUpdateValidIndices](self, "_accessibilityUpdateValidIndices");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUICarouselPageSectionAccessibility;
  -[SKUICarouselPageSectionAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SKUICarouselPageSectionAccessibility _accessibilityUpdateValidIndices](self, "_accessibilityUpdateValidIndices");
}

- (void)_accessibilityUpdateValidIndices
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v8;
  id v9;
  CGRect v10;
  CGRect v11;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[SKUICarouselPageSectionAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_carouselCollectionView"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    x = v10.origin.x;
    y = v10.origin.y;
    width = v10.size.width;
    height = v10.size.height;
    MidX = CGRectGetMidX(v10);
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    objc_msgSend(v9, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v11));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICarouselPageSectionAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v8, CFSTR("kAXStartingIndexPath"));

  }
  else
  {
    -[SKUICarouselPageSectionAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("kAXStartingIndexPath"));
  }
}

- (BOOL)_accessibilityDescendantElementAtIndexPathIsValid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  -[SKUICarouselPageSectionAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXStartingIndexPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (v7 = objc_msgSend(v5, "section"), v7 == objc_msgSend(v4, "section")))
  {
    -[SKUICarouselPageSectionAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_modelObjects"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v15 = MEMORY[0x24BDAC760];
    v9 = v8;
    AXPerformSafeBlock();
    v10 = v17[3];

    _Block_object_dispose(&v16, 8);
    v11 = objc_msgSend(v4, "item", v15, 3221225472, __90__SKUICarouselPageSectionAccessibility__accessibilityDescendantElementAtIndexPathIsValid___block_invoke, &unk_24FF2BDC8);
    v13 = 0;
    if (v11 >= objc_msgSend(v6, "item") || objc_msgSend(v4, "item") < v10)
    {
      v12 = objc_msgSend(v4, "item");
      if (v12 < objc_msgSend(v6, "item") + v10 || objc_msgSend(v4, "item") < v10)
        v13 = 1;
    }

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

uint64_t __90__SKUICarouselPageSectionAccessibility__accessibilityDescendantElementAtIndexPathIsValid___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
