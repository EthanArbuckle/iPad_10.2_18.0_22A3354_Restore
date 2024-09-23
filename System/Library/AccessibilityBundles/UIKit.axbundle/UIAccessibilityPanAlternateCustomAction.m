@implementation UIAccessibilityPanAlternateCustomAction

- (uint64_t)isSecondAlternate
{
  char v2;

  if (a1)
    v2 = *(_BYTE *)(a1 + 56) & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)setIsSecondAlternate:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 56) = a2 & 1;
  return result;
}

@end
