@implementation UIFindNavigatorViewControllerAccessibility

void __77___UIFindNavigatorViewControllerAccessibility__axAnnounceCurrentSearchResult__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_rangeOfEnclosingWord:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

void __77___UIFindNavigatorViewControllerAccessibility__axAnnounceCurrentSearchResult__block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_rangeOfSentenceEnclosingPosition:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

@end
