@implementation AXCertInfoGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __47__AXCertInfoGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_183, &__block_literal_global_214, 0, &__block_literal_global_220);

}

uint64_t __47__AXCertInfoGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CertInfoSheetViewController"), CFSTR("_pushDetailsView"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CertInfoCertificateSummaryDescriptionCell"), CFSTR("_customContentView"), "CertInfoDescriptionCellContentView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CertInfoDescriptionCellContentView"), CFSTR("_labelsAndValues"), "NSArray");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CertInfoGradientLabel"), CFSTR("_text"), "NSString");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CertInfoCertificateHeaderCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CertInfoCertificateHeaderCell"), CFSTR("_subtitleLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CertInfoCertificateHeaderCell"), CFSTR("_trustedLabel"), "CertInfoGradientLabel");

  return 1;
}

uint64_t __47__AXCertInfoGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("CertInfo AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("CertInfo"));

  return AXPerformValidationChecks();
}

void __47__AXCertInfoGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CertInfoCertificateSummaryDescriptionCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CertInfoGradientLabelAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CertInfoSheetViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CertInfoCertificateHeaderCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CertUIItemDetailsSummaryCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CertUIKeyValueViewAccessibility"), 1);

}

@end
