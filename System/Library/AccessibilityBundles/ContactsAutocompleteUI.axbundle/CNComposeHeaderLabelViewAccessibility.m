@implementation CNComposeHeaderLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNComposeHeaderLabelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  void *v3;
  objc_super v5;

  -[CNComposeHeaderLabelViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("MFComposeMultiView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)CNComposeHeaderLabelViewAccessibility;
  return -[CNComposeHeaderLabelViewAccessibility accessibilityRespondsToUserInteraction](&v5, sel_accessibilityRespondsToUserInteraction);
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  objc_super v6;

  -[CNComposeHeaderLabelViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("MFComposeMultiView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    accessibilityLocalizedString(CFSTR("combined.header.hint"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CNComposeHeaderLabelViewAccessibility;
    -[CNComposeHeaderLabelViewAccessibility accessibilityHint](&v6, sel_accessibilityHint);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
