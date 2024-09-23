@implementation PKPassTileViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassTileView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassTileView"), CFSTR("_title"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassTileView"), CFSTR("_body"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassTileView"), CFSTR("_footer"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassTileView"), CFSTR("_hostedView"), "UIView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_TtGC9PassKitUI22PKEquatableHostingViewVS_20EventDetailsListView_"), CFSTR("PKEquatableHostingView"));

}

- (BOOL)isAccessibilityElement
{
  return !-[PKPassTileViewAccessibility _axIsEventDetailsListView](self, "_axIsEventDetailsListView");
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
  void *v11;

  -[PKPassTileViewAccessibility _axHostingView](self, "_axHostingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPassTileViewAccessibility _axHostingViewLabel](self, "_axHostingViewLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPassTileViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_title"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPassTileViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_body"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPassTileViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_footer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 3, v6, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AXLabelForElements();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_axHostingView
{
  return (id)-[PKPassTileViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_hostedView"));
}

- (BOOL)_axIsEventDetailsListView
{
  void *v2;
  char isKindOfClass;

  -[PKPassTileViewAccessibility _axHostingView](self, "_axHostingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("_TtGC9PassKitUI22PKEquatableHostingViewVS_20EventDetailsListView_"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axHostingViewLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[PKPassTileViewAccessibility _axHostingView](self, "_axHostingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityFindUnsortedDescendantsPassingTest:", &__block_literal_global_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  AXLabelForElements();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __50__PKPassTileViewAccessibility__axHostingViewLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "isAccessibilityElement"))
  {
    objc_msgSend(v2, "accessibilityLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
