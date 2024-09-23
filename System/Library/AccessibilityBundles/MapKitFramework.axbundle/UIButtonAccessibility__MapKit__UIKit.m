@implementation UIButtonAccessibility__MapKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
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
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  objc_super v12;

  -[UIButtonAccessibility__MapKit__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("AccessibilityMoreInfoButtonIdentifier")))
  {
    -[UIButtonAccessibility__MapKit__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityImagePath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("StreetView.png")))
    {
      v9 = CFSTR("STREET_VIEW_LABEL");
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("HideInfo.png")))
      {
        v12.receiver = self;
        v12.super_class = (Class)UIButtonAccessibility__MapKit__UIKit;
        -[UIButtonAccessibility__MapKit__UIKit accessibilityLabel](&v12, sel_accessibilityLabel);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      v9 = CFSTR("MORE_INFO");
    }
    AXMapKitLocString(v9);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v7 = (void *)v10;

    goto LABEL_10;
  }
  v4 = (void *)MEMORY[0x24BDD17C8];
  AXMapKitLocString(CFSTR("MORE_INFO_WITH_CONTEXT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButtonAccessibility__MapKit__UIKit _accessibilityInfoButtonContext](self, "_accessibilityInfoButtonContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v7;
}

- (id)_accessibilityInfoButtonContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[UIButtonAccessibility__MapKit__UIKit _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("CalloutView")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("_title"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
