@implementation AXBValidateMethods

uint64_t ___AXBValidateMethods_block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKUserEventTimer"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUserEventTimer"), CFSTR("userEventOccurredOnDisplay:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKAccessibility"), CFSTR("_accessibilityProcessExternHIDEvent:"), "v", "^{__IOHIDEvent=}", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKAccessibility"), CFSTR("_accessibilitySetEventTapCallback:"), "v", "^?", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKAccessibility"), CFSTR("_accessibilityEventTapCallback"), "^?", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKAccessibility"), CFSTR("_accessibilityHIDEventTapCallback"), "^?", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKAccessibility"), CFSTR("_accessibilitySetHIDEventTapCallback:"), "v", "^?", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKAccessibility"), CFSTR("_displayConvertToCAScreen:"), "{CGPoint=dd}", "{CGPoint=dd}", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKAccessibility"), CFSTR("_displayConvertFromCAScreen:"), "{CGPoint=dd}", "{CGPoint=dd}", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKAccessibility"), CFSTR("_objectWithinProximity"), "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKAccessibility"), CFSTR("_isDisplayBacklightOff"), "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKAccessibility"), CFSTR("_setCapsLockLightOn:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKAccessibility"), CFSTR("_eventRoutingClientConnectionManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKAccessibility"), CFSTR("_authenticationMessageForLocationInCAScreenCoordinates:eventType:excludeContextIDsFromHitTest:"), "@", "{CGPoint=dd}", "I", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKAccessibility"), CFSTR("_authenticationMessageForLocationInCAScreenCoordinates:eventType:excludeContextIDsFromHitTest:secureName:"), "@", "{CGPoint=dd}", "I", "@", "I", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKSystemShellSentinel"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKSystemShellDescriptor"), CFSTR("bundleIdentifier"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKSystemShellDescriptor"), CFSTR("pid"), "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKSystemShellSentinel"), CFSTR("systemApplications"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKSystemShellSentinel"), CFSTR("primarySystemShell"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKHIDClientConnectionManager"), CFSTR("copyClientForDestination:"), "^{__IOHIDEventSystemConnection=}", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKHIDClientConnectionManager"), CFSTR("copyClientForTaskPort:"), "^{__IOHIDEventSystemConnection=}", "I", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKHIDClientConnectionManager"), CFSTR("pidForBundleID:"), "i", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("BKSHIDEventDeferringResolution"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKSHIDEventDeferringResolution"), CFSTR("build:"), "@", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKSMutableHIDEventDeferringResolution"), CFSTR("setPid:"), "v", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKHIDEventDeliveryManager"), CFSTR("destinationsForEvent:sender:"), "@", "^{__IOHIDEvent=}", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUserEventTimer"), CFSTR("_currentMode"), "i");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUserEventTimer"), CFSTR("_currentTimeout"), "d");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUserEventTimer"), CFSTR("_queue"), "NSObject<OS_dispatch_queue>");
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKHIDSystemInterface"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKHIDSystemInterface"), CFSTR("deliveryManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKSHIDEventDeferringResolution"), CFSTR("pid"), "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKSHIDEventDeferringResolution"), CFSTR("processDescription"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKBootUIPresenter"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKBootUIPresenter"), CFSTR("isShowingBootUI"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("BKBootUIPresenter"), CFSTR("_overlay"), "BKDisplayRenderOverlay");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("BKDisplayRenderOverlayAppleLogo"), CFSTR("_puiProgressWindow"), "PUIProgressWindow");

  return 1;
}

uint64_t ___AXBValidateMethods_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setDebugBuild:", 0);
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AX Backboard Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Backboard Bundle"));

  return AXPerformValidationChecks();
}

@end
