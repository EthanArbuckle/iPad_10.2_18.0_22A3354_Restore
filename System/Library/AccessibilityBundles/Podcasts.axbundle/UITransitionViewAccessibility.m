@implementation UITransitionViewAccessibility

void __84__UITransitionViewAccessibility__Podcasts__UIKit__isSuperviewOfSearchControllerView__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char isKindOfClass;

  v6 = a2;
  MEMORY[0x234919BBC](CFSTR("_UISearchControllerView"));
  isKindOfClass = objc_opt_isKindOfClass();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = isKindOfClass & 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;
}

uint64_t __83__UITransitionViewAccessibility__Podcasts__UIKit__foundSearchControllerDimmingView__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("AXUISearchControllerDimmingView"));

  return v3;
}

@end
