@implementation WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WebAccessibilityObjectWrapper");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsAttachmentType
{
  void *v3;
  void *v4;
  char v5;

  -[WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("IsAttachmentType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    -[WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("IsAttachmentType"));
    v5 = 0;
  }

  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore _axIsAttachmentType](self, "_axIsAttachmentType"))
  {
    -[WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAttachment"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore;
    -[WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore accessibilityLabel](&v6, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore _axIsAttachmentType](self, "_axIsAttachmentType"))
  {
    -[WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAttachment"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore;
    -[WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore accessibilityValue](&v6, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore _axIsAttachmentType](self, "_axIsAttachmentType"))
  {
    -[WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAttachment"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityHint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore;
    -[WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore accessibilityHint](&v6, sel_accessibilityHint);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
