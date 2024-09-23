@implementation AXPassKitFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_281, 0, &__block_literal_global_287);

}

uint64_t __55__AXPassKitFrameworkGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassGroupStackView"), CFSTR("_groupViewsByGroupID"), "NSMutableDictionary");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassFieldView"), CFSTR("labelLabel"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassFieldView"), CFSTR("valueLabel"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupView"), CFSTR("frontmostPassView"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupView"), CFSTR("presentationState"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupView"), CFSTR("group"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKGroup"), CFSTR("passCount"), "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKGroup"), CFSTR("groupID"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKGroup"), CFSTR("passAtIndex:"), "@", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassView"), CFSTR("pass"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPass"), CFSTR("organizationName"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPass"), CFSTR("localizedDescription"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPass"), CFSTR("logoRect"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassFrontFaceView"), CFSTR("createBodyContentViews"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassFaceView"), CFSTR("setPass: colorProfile:"), "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassColorProfile"), CFSTR("_imageForGlyph: color:"), "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupStackView"), CFSTR("setModalGroupIndex:"), "v", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupStackView"), CFSTR("setPresentationState: animated:"), "v", "q", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupStackView"), CFSTR("datasource"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupStackView"), CFSTR("_indexOfGroupView:"), "Q", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupsViewController"), CFSTR("numberOfGroups"), "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassFaceView"), CFSTR("createBodyInvariantViews"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassGroupStackView"), CFSTR("_animatorsByGroupID"), "NSMutableDictionary");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassGroupStackView"), CFSTR("_modalGroupIndex"), "NSUInteger");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassGroupStackView"), CFSTR("_modallyPresentedGroupView"), "PKPassGroupView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassFaceView"), CFSTR("_backgroundView"), "UIImageView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassFaceView"), CFSTR("_pass"), "PKPass");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassGroupStackView"), CFSTR("_passPileViews"), "NSMutableArray");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PKBarcodeStickerView"), CFSTR("_altTextLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassGroupViewVerticalPanAnimator"), CFSTR("_gestureRecognizer"), "UIPanGestureRecognizer");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassFaceView"), CFSTR("createHeaderContentViews"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKLinkedAppUserRatingView"), CFSTR("userRating"), "f", 0);

  return 1;
}

uint64_t __55__AXPassKitFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("PassKit"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("PassKit Framework"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

@end
