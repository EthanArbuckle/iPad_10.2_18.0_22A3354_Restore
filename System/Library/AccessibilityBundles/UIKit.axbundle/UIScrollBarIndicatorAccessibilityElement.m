@implementation UIScrollBarIndicatorAccessibilityElement

- (BOOL)_accessibilityIsScrollBarIndicator
{
  return 1;
}

- (int64_t)_accessibilityOrientation
{
  return -[UIScrollBarIndicatorAccessibilityElement orientation]((uint64_t)self);
}

- (uint64_t)orientation
{
  if (a1)
    return *(_QWORD *)(a1 + 56);
  else
    return 0;
}

- (uint64_t)setOrientation:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 56) = a2;
  return result;
}

@end
