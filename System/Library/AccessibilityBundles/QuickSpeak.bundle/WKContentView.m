@implementation WKContentView

uint64_t __103__WKContentView_QSExtras__axWaitForSpeakSelectionRectResultsForGuanularity_atSelectionOffset_wordText___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2 != 1)
    return objc_msgSend(v3, "_accessibilityRetrieveRectsEnclosingSelectionOffset:withGranularity:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "accessibilitySetQSWordRects:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityRetrieveRectsAtSelectionOffset:withText:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

@end
