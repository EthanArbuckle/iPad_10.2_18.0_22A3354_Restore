@implementation VUILibraryEpisodeListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUILibraryEpisodeListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUILibraryEpisodeListCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUILibraryEpisodeListCell"), CFSTR("releaseDateLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUILibraryEpisodeListCell"), CFSTR("durationLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUILibraryEpisodeListCell"), CFSTR("downloadButton"), "@", 0);

}

- (id)_accessibilityLabelAggregateElement
{
  JUMPOUT(0x234924588);
}

- (void)_accessibilitySetLabelAggregateElement:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)accessibilityElements
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

  -[VUILibraryEpisodeListCellAccessibility _accessibilityLabelAggregateElement](self, "_accessibilityLabelAggregateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x24BDBCE30];
    -[VUILibraryEpisodeListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryEpisodeListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("releaseDateLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryEpisodeListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("durationLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axArrayByIgnoringNilElementsWithCount:", 3, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBADA8]), "initWithAccessibilityContainer:representedElements:", self, v8);
    objc_msgSend(v9, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
    -[VUILibraryEpisodeListCellAccessibility _accessibilitySetLabelAggregateElement:](self, "_accessibilitySetLabelAggregateElement:", v9);

  }
  v10 = (void *)MEMORY[0x24BDBCE30];
  -[VUILibraryEpisodeListCellAccessibility _accessibilityLabelAggregateElement](self, "_accessibilityLabelAggregateElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryEpisodeListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("downloadButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "axArrayByIgnoringNilElementsWithCount:", 2, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
