@implementation AXAssistiveTouchSpecificActionIcons

uint64_t __AXAssistiveTouchSpecificActionIcons_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t result;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("AXAssistiveTouchIconTypeTrackpad");
  v4[1] = CFSTR("AXAssistiveTouchIconTypeCalibrateOnDeviceEyeTracking");
  v4[2] = CFSTR("AXAssistiveTouchIconTypeOnDeviceEyeTrackingZoomScreen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)AXAssistiveTouchSpecificActionIcons_Array;
  AXAssistiveTouchSpecificActionIcons_Array = v1;

  if ((AXDeviceSupportsVirtualTrackpad() & 1) == 0)
    objc_msgSend((id)AXAssistiveTouchSpecificActionIcons_Array, "removeObject:", CFSTR("AXAssistiveTouchIconTypeTrackpad"));
  result = AXDeviceSupportsOnDeviceEyeTracking();
  if ((result & 1) == 0)
    return objc_msgSend((id)AXAssistiveTouchSpecificActionIcons_Array, "removeObject:", CFSTR("AXAssistiveTouchIconTypeCalibrateOnDeviceEyeTracking"));
  return result;
}

@end
