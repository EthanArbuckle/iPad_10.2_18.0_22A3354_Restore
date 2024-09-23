@implementation AppStore

uint64_t __122__AppStore_UINavigationControllerAccessibility__navigationBarSizeForViewController_proposedHeight_allowRubberBandStretch___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "getValue:size:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32, 24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

void __76__AppStore_UITransitionViewAccessibility__isSuperviewOfSearchControllerView__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char isKindOfClass;

  v6 = a2;
  MEMORY[0x2349043FC](CFSTR("_UISearchControllerView"));
  isKindOfClass = objc_opt_isKindOfClass();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = isKindOfClass & 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;
}

@end
