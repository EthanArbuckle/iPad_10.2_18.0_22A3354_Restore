@implementation TVLabelAccessibility

BOOL __44___TVLabelAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  uint64_t v4;

  v2 = a2;
  NSClassFromString(CFSTR("_TVShelfViewHeaderView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v4 = objc_msgSend(v2, "accessibilityTraits");
    v3 = (*MEMORY[0x24BDF73C0] & ~v4) == 0;
  }

  return v3;
}

@end
