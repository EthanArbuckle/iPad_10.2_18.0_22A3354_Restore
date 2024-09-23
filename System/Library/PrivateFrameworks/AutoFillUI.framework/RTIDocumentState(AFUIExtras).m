@implementation RTIDocumentState(AFUIExtras)

- (double)_popoverAnchorRectForPopoverPresentedFromVerticalEdge:()AFUIExtras
{
  double x;
  double v3;
  CGRect v5;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(a1, "firstSelectionRectInEntitySpace"), x = v5.origin.x, CGRectIsNull(v5)))
  {
    objc_msgSend(a1, "clientFrameInEntitySpace");
    return v3;
  }
  return x;
}

- (double)_popoverAnchorRectInClientFrameForPopoverPresentedFromVerticalEdge:()AFUIExtras
{
  double v2;
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  BOOL v10;
  double v11;
  double v12;
  CGRect v14;
  CGRect v15;

  objc_msgSend(a1, "_popoverAnchorRectForPopoverPresentedFromVerticalEdge:");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "clientFrameInEntitySpace");
  v15.origin.x = v3;
  v15.origin.y = v5;
  v15.size.width = v7;
  v15.size.height = v9;
  v10 = CGRectIntersectsRect(v14, v15);
  objc_msgSend(a1, "clientFrameInEntitySpace");
  if (v10)
  {
    v12 = v3 - v11;
    objc_msgSend(a1, "clientFrameInEntitySpace");
  }
  else
  {
    objc_msgSend(a1, "clientFrameInEntitySpace");
    return 0.0;
  }
  return v12;
}

@end
