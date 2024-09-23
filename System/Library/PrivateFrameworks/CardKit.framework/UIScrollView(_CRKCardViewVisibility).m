@implementation UIScrollView(_CRKCardViewVisibility)

- (BOOL)_crk_subviewIsVisible:()_CRKCardViewVisibility
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v4 = a3;
  objc_msgSend(a1, "contentOffset");
  v6 = v5;
  v8 = v7;
  objc_msgSend(a1, "bounds");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  v13 = CGRectGetWidth(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v14 = CGRectGetHeight(v25);
  objc_msgSend(v4, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v13;
  v26.size.height = v14;
  v27.origin.x = v16;
  v27.origin.y = v18;
  v27.size.width = v20;
  v27.size.height = v22;
  return CGRectIntersectsRect(v26, v27);
}

@end
