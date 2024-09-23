@implementation AXMobileStoreGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_237, 0, &__block_literal_global_243);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXMobileStoreGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __50__AXMobileStoreGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("MSTrackListCellConfiguration"));
  objc_msgSend(v2, "validateClass:", CFSTR("MSTrackListCopyrightFooterView"));
  objc_msgSend(v2, "validateClass:", CFSTR("MSTrackListHeaderView"));
  objc_msgSend(v2, "validateClass:", CFSTR("MPMoviePlayerViewController"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SUTableCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUTableCell"), CFSTR("configuration"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MSTrackListCopyrightFooterView"), CFSTR("text"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPMoviePlayerViewController"), CFSTR("moviePlayer"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUItem"), CFSTR("artistName"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUItem"), CFSTR("reviewStatistics"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUItemReviewStatistics"), CFSTR("numberOfUserRatings"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUItemReviewStatistics"), CFSTR("averageUserRating"), "f", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUItem"), CFSTR("contentRating"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUItemContentRating"), CFSTR("isExplicitContent"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPMoviePlayerViewController"), CFSTR("moviePlayer"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCellAccessibility"), CFSTR("_accessibilityClearChildren"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSDownloadStatus"), CFSTR("isPaused"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSDownloadStatus"), CFSTR("isFailed"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MSTrackListHeaderView"), CFSTR("_offerButton"), "SUItemOfferButton");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MSTrackListHeaderView"), CFSTR("_albumLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MSTrackListHeaderView"), CFSTR("_artistLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MSTrackListHeaderView"), CFSTR("_releaseDateLabel"), "UILabel");

  return 1;
}

uint64_t __50__AXMobileStoreGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("MobileStore AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("MobileStore"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __50__AXMobileStoreGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIMobileStoreApplicationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MSTrackListCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MSTrackListHeaderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MSTrackListCopyrightFooterViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MSTrackListLinkCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MSTableCellAccessibility"), 1);

}

@end
