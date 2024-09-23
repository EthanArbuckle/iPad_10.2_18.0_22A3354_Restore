@implementation MFAtomTextViewAccessibility

uint64_t __71___MFAtomTextViewAccessibility__ChatKit__MessageUI_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isUserInteractionEnabled") ^ 1;
  else
    v3 = 0;

  return v3;
}

@end
