@implementation NSTextLayoutFragment(FragmentView)

- (void)_ck_getFragmentViewFrame:()FragmentView getBounds:textContainerInset:
{
  double v8;
  double v9;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  BOOL v15;
  double v16;
  double MinX;
  void *v18;
  void *v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKMentionsTextContainerOverlayView.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("frameOut"));

    if (a4)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKMentionsTextContainerOverlayView.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("boundsOut"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_8;
LABEL_3:
  objc_msgSend(a1, "layoutFragmentFrame");
  v9 = v8;
  objc_msgSend(a1, "renderingSurfaceBounds");
  v21 = CGRectIntegral(v20);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  v14 = v9 + v21.origin.y;
  v21.origin.y = v14;
  v15 = CGRectGetHeight(v21) <= 0.0;
  v16 = x;
  if (!v15)
  {
    v22.origin.x = x;
    v22.origin.y = v14;
    v22.size.width = width;
    v22.size.height = height;
    v15 = CGRectGetWidth(v22) <= 0.0;
    v16 = x;
    if (!v15)
    {
      v23.origin.x = x;
      v23.origin.y = v14;
      v23.size.width = width;
      v23.size.height = height;
      MinX = CGRectGetMinX(v23);
      v24.origin.x = x;
      v24.origin.y = v14;
      v24.size.width = width;
      v24.size.height = height;
      v16 = x + MinX - CGRectGetMinX(v24);
    }
  }
  *a4 = v16;
  a4[1] = y;
  a4[2] = width;
  a4[3] = height;
  *a3 = x;
  a3[1] = v14;
  a3[2] = width;
  a3[3] = height;
}

@end
