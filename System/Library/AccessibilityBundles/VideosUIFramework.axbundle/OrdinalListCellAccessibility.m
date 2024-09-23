@implementation OrdinalListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.OrdinalListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[OrdinalListCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __50__OrdinalListCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  MEMORY[0x2349244BC](CFSTR("VideosUI.OrdinalListCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isAccessibilityElement");

  return v3;
}

@end
