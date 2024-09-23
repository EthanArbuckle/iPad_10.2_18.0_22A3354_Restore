@implementation UITextView(NUIContainerView)

- (uint64_t)isLayoutSizeDependentOnPerpendicularAxis
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&off_1EEBAEAC8;
  if ((objc_msgSendSuper2(&v3, sel_isLayoutSizeDependentOnPerpendicularAxis) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isScrollEnabled") ^ 1;
}

- (uint64_t)_nui_baselineViewType
{
  return 0;
}

@end
