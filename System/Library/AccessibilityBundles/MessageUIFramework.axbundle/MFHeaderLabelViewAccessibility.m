@implementation MFHeaderLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFHeaderLabelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v2;

  -[MFHeaderLabelViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("MFComposeMultiView")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 != 0;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  void *v3;
  objc_super v5;

  -[MFHeaderLabelViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("MFComposeMultiView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)MFHeaderLabelViewAccessibility;
  return -[MFHeaderLabelViewAccessibility accessibilityRespondsToUserInteraction](&v5, sel_accessibilityRespondsToUserInteraction);
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  -[MFHeaderLabelViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("MFComposeMultiView")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    accessibilityLocalizedString(CFSTR("combined.header.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
