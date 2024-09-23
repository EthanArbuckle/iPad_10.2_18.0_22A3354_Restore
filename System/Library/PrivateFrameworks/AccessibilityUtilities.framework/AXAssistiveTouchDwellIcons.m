@implementation AXAssistiveTouchDwellIcons

void __AXAssistiveTouchDwellIcons_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("AXAssistiveTouchIconTypeDwellPauseToggle");
  v2[1] = CFSTR("AXAssistiveTouchIconTypeDwellClick");
  v2[2] = CFSTR("AXAssistiveTouchIconTypeDwellLockToggle");
  v2[3] = CFSTR("AXAssistiveTouchIconTypeMoveMenu");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXAssistiveTouchDwellIcons_Array;
  AXAssistiveTouchDwellIcons_Array = v0;

}

@end
