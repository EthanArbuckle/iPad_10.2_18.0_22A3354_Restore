@implementation AXRestaurantsAssistantGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __59__AXRestaurantsAssistantGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_183, &__block_literal_global_215, 0, &__block_literal_global_221);

}

uint64_t __59__AXRestaurantsAssistantGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriRestaurantsDetailDescriptionCell"), CFSTR("_priceLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriRestaurantsOpenHoursCell"), CFSTR("_dayRangeLabels"), "NSArray");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriRestaurantsOpenHoursCell"), CFSTR("_hoursLabelPerRange"), "NSArray");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriUIContentCollectionViewCell"), CFSTR("textLabel"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriRestaurantsDetailDescriptionCell"), CFSTR("_setPriceInfoWithRestaurant:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriRestaurantsOpenHoursCell"), CFSTR("configureWithParsedOpenHoursInfo:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriRestaurantsDetailViewController"), CFSTR("_configurePhoneCell: forItem:"), "v", "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriRestaurantsDetailViewController"), CFSTR("_configureURLCell: forItem:"), "v", "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriRestaurantsDetailViewController"), CFSTR("_configureReviewsCell: forItem:"), "v", "@", "q", 0);

  return 1;
}

uint64_t __59__AXRestaurantsAssistantGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Assistant Restaurants AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Assistant Restaurants"));

  return AXPerformValidationChecks();
}

void __59__AXRestaurantsAssistantGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriRestaurantsListItemCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriRestaurantsDetailDescriptionCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriRestaurantsOpenHoursCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriRestaurantsDetailViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriRestaurantsLogoButtonAccessibility"), 1);

}

@end
