@implementation UIView(NUIContainerViewHack)

- (uint64_t)_isContainerView
{
  return 0;
}

- (uint64_t)_intrinsicContentSizeInvalidatedForChildView:()NUIContainerViewHack
{
  uint64_t result;

  result = objc_msgSend(a3, "invalidatingIntrinsicContentSizeAlsoInvalidatesSuperview");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "invalidateIntrinsicContentSize");
    return objc_msgSend(a1, "setNeedsLayout");
  }
  return result;
}

@end
