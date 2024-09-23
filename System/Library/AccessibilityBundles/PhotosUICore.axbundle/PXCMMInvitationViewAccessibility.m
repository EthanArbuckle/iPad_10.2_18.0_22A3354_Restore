@implementation PXCMMInvitationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXCMMInvitationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXCMMInvitationView"), CFSTR("_headerView"), "PXCMMPosterHeaderView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXCMMInvitationView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXCMMInvitationView"), CFSTR("_subtitle1Label"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXCMMInvitationView"), CFSTR("_subtitle2Label"), "UILabel");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PXCMMInvitationView"), CFSTR("UIView"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PXCMMInvitationViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_headerView, _titleLabel, _subtitle1Label, _subtitle2Label"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCMMInvitationViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PXCMMInvitationViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
