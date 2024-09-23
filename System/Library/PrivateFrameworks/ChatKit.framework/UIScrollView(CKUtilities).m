@implementation UIScrollView(CKUtilities)

- (double)__ck_bottomOffset
{
  double v2;
  double v3;

  objc_msgSend(a1, "contentOffset");
  v3 = v2;
  objc_msgSend(a1, "__ck_contentSize");
  objc_msgSend(a1, "contentInset");
  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "__ck_scrollToTopContentOffset");
  return v3;
}

- (BOOL)__ck_isScrolledToBottom
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "contentOffset");
  v3 = v2;
  objc_msgSend(a1, "__ck_bottomOffset");
  return v3 >= v4 + -1.0;
}

- (uint64_t)__ck_scrollToBottom:()CKUtilities
{
  objc_msgSend(a1, "__ck_bottomOffset");
  return objc_msgSend(a1, "setContentOffset:animated:", a3);
}

- (double)__ck_scrollToTopContentOffset
{
  double v2;
  double v3;

  objc_msgSend(a1, "contentOffset");
  v3 = v2;
  objc_msgSend(a1, "adjustedContentInset");
  return v3;
}

- (BOOL)__ck_isScrolledToTop
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "contentOffset");
  v3 = v2;
  objc_msgSend(a1, "__ck_scrollToTopContentOffset");
  return v3 <= v4 + 1.0;
}

- (uint64_t)__ck_scrollToTop:()CKUtilities
{
  objc_msgSend(a1, "__ck_scrollToTopContentOffset");
  return objc_msgSend(a1, "setContentOffset:animated:", a3);
}

- (BOOL)__ck_isVerticallyRubberBanding
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  CGRect v13;
  CGRect v14;

  objc_msgSend(a1, "contentInset");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "contentSize");
  v7 = v6;
  objc_msgSend(a1, "bounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  if (ceil(v3 + CGRectGetMinY(v13)) < 0.0)
    return 1;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  return floor(CGRectGetMaxY(v14) - fmax(v5 + v7, height - v3)) > 0.0;
}

@end
