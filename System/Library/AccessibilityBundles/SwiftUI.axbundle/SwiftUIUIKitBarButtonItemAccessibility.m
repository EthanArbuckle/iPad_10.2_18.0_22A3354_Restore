@implementation SwiftUIUIKitBarButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SwiftUI.UIKitBarButtonItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SwiftUI.UIKitBarButtonItem"), CFSTR("UIBarButtonItem"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SwiftUI.UIKitBarButtonItem"), CFSTR("host"), "UIKitBarItemHost<BarItemView>");

}

- (id)accessibilityIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  -[SwiftUIUIKitBarButtonItemAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("host"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SwiftUIUIKitBarButtonItemAccessibility;
    -[SwiftUIUIKitBarButtonItemAccessibility accessibilityIdentifier](&v11, sel_accessibilityIdentifier);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  -[SwiftUIUIKitBarButtonItemAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("host"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SwiftUIUIKitBarButtonItemAccessibility;
    -[SwiftUIUIKitBarButtonItemAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  -[SwiftUIUIKitBarButtonItemAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("host"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SwiftUIUIKitBarButtonItemAccessibility;
    -[SwiftUIUIKitBarButtonItemAccessibility accessibilityValue](&v11, sel_accessibilityValue);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  -[SwiftUIUIKitBarButtonItemAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("host"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityHint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SwiftUIUIKitBarButtonItemAccessibility;
    -[SwiftUIUIKitBarButtonItemAccessibility accessibilityHint](&v11, sel_accessibilityHint);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

@end
