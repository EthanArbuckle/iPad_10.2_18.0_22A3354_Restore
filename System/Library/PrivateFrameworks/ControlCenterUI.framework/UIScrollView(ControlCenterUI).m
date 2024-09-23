@implementation UIScrollView(ControlCenterUI)

- (uint64_t)ccui_setContentInsetPreservingOffset:()ControlCenterUI
{
  uint64_t result;
  double v11;
  double v12;
  double v13;
  double v14;
  double v18;
  double v19;
  double v20;
  double v21;

  result = objc_msgSend(a1, "contentInset");
  if (a3 != v14 || a2 != v11 || a5 != v13 || a4 != v12)
  {
    objc_msgSend(a1, "ccui_relativeContentOffset");
    v19 = v18;
    v21 = v20;
    objc_msgSend(a1, "setContentInset:", a2, a3, a4, a5);
    return objc_msgSend(a1, "ccui_setRelativeContentOffset:", v19, v21);
  }
  return result;
}

- (double)ccui_relativeContentOffset
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "contentOffset");
  v3 = v2;
  objc_msgSend(a1, "contentInset");
  return v3 + v4;
}

- (uint64_t)ccui_setRelativeContentOffset:()ControlCenterUI
{
  double v6;
  double v7;

  objc_msgSend(a1, "contentInset");
  return objc_msgSend(a1, "setContentOffset:", a2 - v6, a3 - v7);
}

@end
