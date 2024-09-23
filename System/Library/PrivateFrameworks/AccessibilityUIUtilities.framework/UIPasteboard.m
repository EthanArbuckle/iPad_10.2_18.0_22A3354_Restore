@implementation UIPasteboard

uint64_t __81__UIPasteboard_QSExtras__accessibilityShouldSwapReceiverWithQuickSpeakPasteboard__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "_accessibilityUseQuickSpeakPasteBoard");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
