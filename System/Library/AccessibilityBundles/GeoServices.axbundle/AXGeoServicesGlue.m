@implementation AXGeoServicesGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __50__AXGeoServicesGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_198, 0, &__block_literal_global_204);

}

uint64_t __50__AXGeoServicesGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("GEOVectorTile"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOVectorTile"), CFSTR("buildingFootprints"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOVectorTile"), CFSTR("buildingFootprintsCount"), "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOVectorTile"), CFSTR("forEachRoad:"), "v", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOPlaceCollection"), CFSTR("publisherAttribution"), "@", 0);
  objc_msgSend(v2, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("GEOCollectionPublisherAttribution"), CFSTR("displayName"));

  return 1;
}

uint64_t __50__AXGeoServicesGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("GeoServices"));
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("GeoServices Accessibility Bundle"));

  return AXPerformValidationChecks();
}

void __50__AXGeoServicesGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("GEOVectorTileAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("GEOComposedRouteAccessibility"), 1);

}

@end
