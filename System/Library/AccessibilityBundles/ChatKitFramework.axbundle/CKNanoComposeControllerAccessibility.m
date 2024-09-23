@implementation CKNanoComposeControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKNanoComposeController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("PUICQuickboardViewControllerDelegate"), CFSTR("extraButtonImage"));
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("PUICQuickboardViewControllerDelegate"), CFSTR("extraButtonTapped"));

}

- (id)_accessibilityLabelForExtraButton
{
  return accessibilityLocalizedString(CFSTR("nano.reply.digital.touch"));
}

@end
