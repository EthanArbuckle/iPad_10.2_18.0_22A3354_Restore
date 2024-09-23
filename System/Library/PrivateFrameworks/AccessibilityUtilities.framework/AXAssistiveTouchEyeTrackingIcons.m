@implementation AXAssistiveTouchEyeTrackingIcons

void __AXAssistiveTouchEyeTrackingIcons_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("AXAssistiveTouchIconTypeEyeTrackingBubbleMode");
  v2[1] = CFSTR("AXAssistiveTouchIconTypeEyeTrackingAutoHide");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXAssistiveTouchEyeTrackingIcons_Array;
  AXAssistiveTouchEyeTrackingIcons_Array = v0;

}

@end
