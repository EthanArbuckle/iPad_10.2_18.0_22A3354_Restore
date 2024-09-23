@implementation SBHWidgetWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHWidgetWrapperView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHWidgetWrapperView"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHWidgetWrapperView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHWidgetWrapperView"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHWidgetWrapperViewController"), CFSTR("selectedSizeClass"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHWidgetWrapperViewController"), CFSTR("galleryItem"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBHAddWidgetSheetGalleryItem"), CFSTR("sbh_appName"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBHAddWidgetSheetGalleryItem"), CFSTR("sbh_widgetName"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBHAddWidgetSheetGalleryItem"), CFSTR("sbh_widgetDescription"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
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
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  const __CFString *v19;

  -[SBHWidgetWrapperViewAccessibility _accessibilityViewController](self, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("galleryItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHWidgetWrapperViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHWidgetWrapperViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = objc_claimAutoreleasedReturnValue();

  -[SBHWidgetWrapperViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeStringForKey:", CFSTR("sbh_appName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("sbh_widgetName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v14 = v13;
  if ((objc_msgSend(v13, "isEqualToString:", v8) & 1) == 0)
  {
    v14 = v13;
    if (objc_msgSend((id)v8, "length"))
    {
      v18 = v8;
      v19 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  if ((objc_msgSend((id)v8, "isEqualToString:", v10, v18, v19) & 1) == 0 && objc_msgSend((id)v10, "length"))
  {
    __UIAXStringForVariables();
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  if (!(v8 | v10) && objc_msgSend(v11, "length") && objc_msgSend(v12, "length"))
  {
    __UIAXStringForVariables();
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }

  return v14;
}

- (id)accessibilityCustomContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  -[SBHWidgetWrapperViewAccessibility _accessibilityViewController](self, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("galleryItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeStringForKey:", CFSTR("widgetDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)MEMORY[0x24BDB3D68];
    accessibilityLocalizedString(CFSTR("widget.description"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customContentWithLabel:value:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setImportance:", 1);
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBHWidgetWrapperViewAccessibility;
    -[SBHWidgetWrapperViewAccessibility accessibilityCustomContent](&v11, sel_accessibilityCustomContent);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[SBHWidgetWrapperViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHWidgetWrapperViewAccessibility _accessibilityViewController](self, "_accessibilityViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeIntegerForKey:", CFSTR("selectedSizeClass"));

  v7 = v6 - 1;
  if ((unint64_t)(v6 - 1) <= 0xA && ((0x607u >> v7) & 1) != 0)
  {
    accessibilityLocalizedString(off_250383928[v7]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[SBHWidgetWrapperViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBHAddWidgetSheetGalleryCollectionViewCell")));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    accessibilityLocalizedString(CFSTR("widget.value.suggested"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("widget.wrapper.view.hint"));
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end
