@implementation IDScanCameraReaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CoreIDVUI.IDScanCameraReader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CoreIDVUI.IDScanCameraReader"), CFSTR("timerAction"), "v", 0);
}

- (void)timerAction
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IDScanCameraReaderAccessibility;
  -[IDScanCameraReaderAccessibility timerAction](&v3, sel_timerAction);
  accessibilityLocalizedString(CFSTR("fallback.image.capture.occurred"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("id.scanner.hint"));
}

@end
