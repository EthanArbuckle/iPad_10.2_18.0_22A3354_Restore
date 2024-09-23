@implementation CKTranscriptManagementNameFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTranscriptManagementNameField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptManagementNameField"), CFSTR("fieldLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptManagementNameField"), CFSTR("textField"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  return 1;
}

- (BOOL)accessibilityScrollToVisible
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;

  -[CKTranscriptManagementNameFieldAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("CKTranscriptManagementView")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("attachmentsCollectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilityDescendantOfType:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  objc_msgSend(v5, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 0, 0, 0.0, -v6);

  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptManagementNameFieldAccessibility;
  -[CKTranscriptManagementNameFieldAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[CKTranscriptManagementNameFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("fieldLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);
  -[CKTranscriptManagementNameFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilitySetIdentification:", CFSTR("GroupNameField"));

  -[CKTranscriptManagementNameFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptManagementNameFieldAccessibility;
  -[CKTranscriptManagementNameFieldAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[CKTranscriptManagementNameFieldAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
