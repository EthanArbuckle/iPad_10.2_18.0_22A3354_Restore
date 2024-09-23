@implementation AXAssistiveTouchScrollIcons

void __AXAssistiveTouchScrollIcons_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];

  v2[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("AXAssistiveTouchIconTypeScrollToTop");
  v2[1] = CFSTR("AXAssistiveTouchIconTypeScrollUp");
  v2[2] = CFSTR("AXAssistiveTouchIconTypeScrollToBottom");
  v2[3] = CFSTR("AXAssistiveTouchIconTypeScrollLeft");
  v2[4] = CFSTR("AXAssistiveTouchIconTypeScrollRight");
  v2[5] = CFSTR("AXAssistiveTouchIconTypeContinuousScrollHorizontal");
  v2[6] = CFSTR("AXAssistiveTouchIconTypeScrollDown");
  v2[7] = CFSTR("AXAssistiveTouchIconTypeContinuousScrollVertical");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXAssistiveTouchScrollIcons_Array;
  AXAssistiveTouchScrollIcons_Array = v0;

}

@end
