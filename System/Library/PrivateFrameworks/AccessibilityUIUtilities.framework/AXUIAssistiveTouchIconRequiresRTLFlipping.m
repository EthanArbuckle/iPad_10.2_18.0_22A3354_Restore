@implementation AXUIAssistiveTouchIconRequiresRTLFlipping

void __AXUIAssistiveTouchIconRequiresRTLFlipping_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[23];

  v7[22] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("BackArrow");
  AXUIAssistiveTouchImageNameForName((void *)*MEMORY[0x1E0CF4BC0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v0;
  AXUIAssistiveTouchImageNameForName((void *)*MEMORY[0x1E0CF4A98]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v1;
  AXUIAssistiveTouchImageNameForName((void *)*MEMORY[0x1E0CF4CB8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v2;
  v7[4] = CFSTR("AT_LaunchFloatFromDock");
  v7[5] = CFSTR("AT_pinned_narrow");
  v7[6] = CFSTR("AT_pinned_narrow_for_flipping");
  v7[7] = CFSTR("AT_promote_sideapp_half");
  v7[8] = CFSTR("AT_dismiss_pinned_half");
  v7[9] = CFSTR("AT_PinFloatAppLeft");
  v7[10] = CFSTR("AT_PinFloatAppRight");
  v7[11] = CFSTR("AT_UnpinAppLeft");
  v7[12] = CFSTR("AT_UnpinAppRight");
  v7[13] = CFSTR("AT_SlideOpenFloatApp");
  v7[14] = CFSTR("AT_dismiss_overlay");
  v7[15] = CFSTR("AT_MoveFloatAppLeft");
  v7[16] = CFSTR("AT_MoveFloatAppRight");
  v7[17] = CFSTR("AT_Multitask");
  AXUIAssistiveTouchImageNameForName((void *)*MEMORY[0x1E0CF4CF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[18] = v3;
  AXUIAssistiveTouchImageNameForName((void *)*MEMORY[0x1E0CF4CF8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[19] = v4;
  v7[20] = CFSTR("SCATIcon_device_volumeDown");
  v7[21] = CFSTR("SCATIcon_device_volumeUp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 22);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)AXUIAssistiveTouchIconRequiresRTLFlipping_ImageNamesToFlip;
  AXUIAssistiveTouchIconRequiresRTLFlipping_ImageNamesToFlip = v5;

}

@end
