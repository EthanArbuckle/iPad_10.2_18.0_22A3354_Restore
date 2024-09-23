@implementation AXVectorKitGlue

+ (void)accessibilityInitializeBundle
{
  if (+[AXVectorKitGlue accessibilityInitializeBundle]::onceToken != -1)
    dispatch_once(&+[AXVectorKitGlue accessibilityInitializeBundle]::onceToken, &__block_literal_global_188);
}

void __48__AXVectorKitGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_191, &__block_literal_global_219, 0, &__block_literal_global_225);

}

uint64_t __48__AXVectorKitGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("VKMapCanvas"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("VKMapView"), CFSTR("CALayer"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapView"), CFSTR("convertPoint: toCoordinateFromLayer:"), "{?=dd}", "{CGPoint=dd}", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapView"), CFSTR("convertCoordinate: toPointToLayer:"), "{CGPoint=dd}", "{?=dd}", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapView"), CFSTR("roadLabelTilesInScene"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapView"), CFSTR("localizeLabels"), "B", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("_MKAnnotationViewCustomFeatureAnnotation"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MKAnnotationViewCustomFeatureAnnotation"), CFSTR("annotationView"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKRouteWaypointInfo"), CFSTR("waypointIndex"), "Q", 0);

  return 1;
}

uint64_t __48__AXVectorKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("VectorKit"));
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("VectorKit Accessibility Bundle"));
  v3 = AXPerformValidationChecks();

  return v3;
}

void __48__AXVectorKitGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("VKMapCanvasAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("VKMapViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("VKMapCameraControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("VKCameraDelegateMediatorAccessibility"), 1);

}

@end
