@implementation UIViewController

uint64_t __68__UIViewController_AXMapsGlue___accessibilityFirstNonGrabberElement__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEBADC8], "options");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_accessibilityFirstNonGrabberElement_Options;
  _accessibilityFirstNonGrabberElement_Options = v0;

  return objc_msgSend((id)_accessibilityFirstNonGrabberElement_Options, "setLeafNodePredicate:", &__block_literal_global_287);
}

uint64_t __68__UIViewController_AXMapsGlue___accessibilityFirstNonGrabberElement__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Card grabber"));

  if ((v4 & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend(v2, "isAccessibilityElement");

  return v5;
}

@end
