@implementation AXAssistiveTouchAccessibilityIcons

void __AXAssistiveTouchAccessibilityIcons_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];

  v2[15] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("AXAssistiveTouchIconTypeAssistiveTouch");
  v2[1] = CFSTR("AXAssistiveTouchIconTypeClassicInvert");
  v2[2] = CFSTR("AXAssistiveTouchIconTypeColorFilters");
  v2[3] = CFSTR("AXAssistiveTouchIconTypeMagnifier");
  v2[4] = CFSTR("AXAssistiveTouchIconTypeVoiceOver");
  v2[5] = CFSTR("AXAssistiveTouchIconTypeSmartInvert");
  v2[6] = CFSTR("AXAssistiveTouchIconTypeZoom");
  v2[7] = CFSTR("AXAssistiveTouchIconTypeZoomController");
  v2[8] = CFSTR("AXAssistiveTouchIconTypeSwitchControl");
  v2[9] = CFSTR("AXAssistiveTouchIconTypeFullKeyboardAccess");
  v2[10] = CFSTR("AXAssistiveTouchIconTypeCommandAndControl");
  v2[11] = CFSTR("AXAssistiveTouchIconTypeSpeakScreen");
  v2[12] = CFSTR("AXAssistiveTouchIconTypeTripleClick");
  v2[13] = CFSTR("AXAssistiveTouchIconTypeDetectionMode");
  v2[14] = CFSTR("AXAssistiveTouchIconTypeBackgroundSounds");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXAssistiveTouchAccessibilityIcons_Array;
  AXAssistiveTouchAccessibilityIcons_Array = v0;

}

@end
