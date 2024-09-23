@implementation UIMapsNavigationButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UINavigationButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  objc_super v9;

  -[UIMapsNavigationButtonAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("swapDirectionsButton")))
  {
    -[UIMapsNavigationButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityImagePath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("DirectionsListView"))
      || objc_msgSend(v5, "hasPrefix:", CFSTR("UIButtonBarListIcon")))
    {
      v6 = CFSTR("LIST_BUTTON");
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("DirectionsSwitch.png")))
      {
        v9.receiver = self;
        v9.super_class = (Class)UIMapsNavigationButtonAccessibility;
        -[UIMapsNavigationButtonAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      v6 = CFSTR("MINIMIZE_BUTTON");
    }
    AXMapsLocString(v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v4 = (void *)v7;

    goto LABEL_8;
  }
  AXMapsLocString(CFSTR("SWAP_DIRECTIONS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

@end
