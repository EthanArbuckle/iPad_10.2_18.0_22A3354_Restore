@implementation UIScrollView(WebKitInternal)

- (uint64_t)_wk_isZoomAnimating
{
  int v2;
  void *v3;

  if ((byte_1ECE72C33 & 1) != 0)
  {
    if (byte_1ECE72C32)
      return objc_msgSend(a1, "isZoomAnimating");
  }
  else
  {
    v3 = a1;
    v2 = objc_msgSend(MEMORY[0x1E0CEA970], "instancesRespondToSelector:", sel_isZoomAnimating);
    a1 = v3;
    byte_1ECE72C32 = v2;
    byte_1ECE72C33 = 1;
    if (v2)
      return objc_msgSend(a1, "isZoomAnimating");
  }
  return 0;
}

- (uint64_t)_wk_isScrollAnimating
{
  int v2;
  void *v3;

  if ((byte_1ECE72C31 & 1) != 0)
  {
    if (_MergedGlobals_101)
      return objc_msgSend(a1, "isScrollAnimating");
  }
  else
  {
    v3 = a1;
    v2 = objc_msgSend(MEMORY[0x1E0CEA970], "instancesRespondToSelector:", sel_isScrollAnimating);
    a1 = v3;
    _MergedGlobals_101 = v2;
    byte_1ECE72C31 = 1;
    if (v2)
      return objc_msgSend(a1, "isScrollAnimating");
  }
  return 0;
}

- (BOOL)_wk_isScrolledBeyondExtents
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  objc_msgSend(a1, "contentOffset");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "adjustedContentInset");
  v10 = -v9;
  if (v3 < -v8 || v5 < v10)
    return 1;
  v13 = v6;
  v14 = v7;
  objc_msgSend(a1, "contentSize");
  v16 = v15;
  v18 = v17;
  objc_msgSend(a1, "bounds");
  v20 = v19;
  v22 = v21;
  v23 = v14 + v16;
  objc_msgSend(a1, "_wk_contentWidthIncludingInsets");
  if (v24 >= v20)
    v24 = v20;
  v25 = v23 - v24;
  v26 = v13 + v18;
  objc_msgSend(a1, "_wk_contentHeightIncludingInsets");
  if (v27 >= v22)
    v27 = v22;
  return v5 > v26 - v27 || v3 > v25;
}

- (double)_wk_contentWidthIncludingInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(a1, "adjustedContentInset");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "contentSize");
  return v5 + v3 + v6;
}

- (double)_wk_contentHeightIncludingInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(a1, "adjustedContentInset");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "contentSize");
  return v5 + v3 + v6;
}

- (uint64_t)_wk_setTransfersHorizontalScrollingToParent:()WebKitInternal
{
  int v2;
  void *v3;

  if ((byte_1ECE72C37 & 1) != 0)
  {
    if (byte_1ECE72C36)
      return objc_msgSend(a1, "setTransfersHorizontalScrollingToParent:");
  }
  else
  {
    v3 = a1;
    v2 = objc_msgSend(MEMORY[0x1E0CEA970], "instancesRespondToSelector:", sel_setTransfersHorizontalScrollingToParent_);
    a1 = v3;
    byte_1ECE72C36 = v2;
    byte_1ECE72C37 = 1;
    if (v2)
      return objc_msgSend(a1, "setTransfersHorizontalScrollingToParent:");
  }
  return objc_msgSend(a1, "_setAllowsParentToBeginHorizontally:");
}

- (uint64_t)_wk_setTransfersVerticalScrollingToParent:()WebKitInternal
{
  int v2;
  void *v3;

  if ((byte_1ECE72C39 & 1) != 0)
  {
    if (byte_1ECE72C38)
      return objc_msgSend(a1, "setTransfersVerticalScrollingToParent:");
  }
  else
  {
    v3 = a1;
    v2 = objc_msgSend(MEMORY[0x1E0CEA970], "instancesRespondToSelector:", sel_setTransfersVerticalScrollingToParent_);
    a1 = v3;
    byte_1ECE72C38 = v2;
    byte_1ECE72C39 = 1;
    if (v2)
      return objc_msgSend(a1, "setTransfersVerticalScrollingToParent:");
  }
  return objc_msgSend(a1, "_setAllowsParentToBeginVertically:");
}

- (uint64_t)_wk_isInterruptingDeceleration
{
  uint64_t result;

  result = objc_msgSend(a1, "isDecelerating");
  if ((_DWORD)result)
    return objc_msgSend(a1, "isTracking");
  return result;
}

- (void)_wk_stopScrollingAndZooming
{
  int v1;
  void *v2;

  if ((byte_1ECE72C35 & 1) != 0)
  {
    if (!byte_1ECE72C34)
      return result;
    return (void *)objc_msgSend(result, "stopScrollingAndZooming");
  }
  v2 = result;
  v1 = objc_msgSend(MEMORY[0x1E0CEA970], "instancesRespondToSelector:", sel_stopScrollingAndZooming);
  result = v2;
  byte_1ECE72C34 = v1;
  byte_1ECE72C35 = 1;
  if (v1)
    return (void *)objc_msgSend(result, "stopScrollingAndZooming");
  return result;
}

- (CGFloat)_wk_clampToScrollExtents:()WebKitInternal
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double Width;
  double v23;
  double v24;
  double Height;
  double v26;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  objc_msgSend(a1, "bounds");
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "adjustedContentInset");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if ((objc_msgSend(a1, "isZoomBouncing") & 1) == 0 && (objc_msgSend(a1, "isZooming") & 1) != 0)
    return a2;
  v28 = v17;
  v30 = v15;
  v18 = -v13;
  objc_msgSend(a1, "contentSize");
  v20 = v19;
  v29 = v21;
  v31.origin.x = a2;
  v31.origin.y = a3;
  v31.size.width = v7;
  v31.size.height = v9;
  Width = CGRectGetWidth(v31);
  objc_msgSend(a1, "_wk_contentWidthIncludingInsets");
  if (Width < v23)
  {
    v32.origin.x = a2;
    v32.origin.y = a3;
    v32.size.width = v7;
    v32.size.height = v9;
    if (CGRectGetMinX(v32) >= v18)
    {
      v24 = v28 + v20;
      v33.origin.x = a2;
      v33.origin.y = a3;
      v33.size.width = v7;
      v33.size.height = v9;
      v18 = a2;
      if (CGRectGetMaxX(v33) > v24)
      {
        v34.origin.x = a2;
        v34.origin.y = a3;
        v34.size.width = v7;
        v34.size.height = v9;
        v18 = v24 - CGRectGetWidth(v34);
      }
    }
  }
  v35.origin.x = a2;
  v35.origin.y = a3;
  v35.size.width = v7;
  v35.size.height = v9;
  Height = CGRectGetHeight(v35);
  objc_msgSend(a1, "_wk_contentHeightIncludingInsets");
  if (Height < v26)
  {
    v36.origin.x = a2;
    v36.origin.y = a3;
    v36.size.width = v7;
    v36.size.height = v9;
    if (CGRectGetMinY(v36) >= -v11)
    {
      v37.origin.x = a2;
      v37.origin.y = a3;
      v37.size.width = v7;
      v37.size.height = v9;
      if (CGRectGetMaxY(v37) > v30 + v29)
      {
        v38.origin.x = a2;
        v38.origin.y = a3;
        v38.size.width = v7;
        v38.size.height = v9;
        CGRectGetHeight(v38);
      }
    }
  }
  return v18;
}

- (BOOL)_wk_canScrollHorizontallyWithoutBouncing
{
  double v2;
  double v3;
  CGRect v5;

  objc_msgSend(a1, "_wk_contentWidthIncludingInsets");
  v3 = v2;
  objc_msgSend(a1, "bounds");
  return v3 - CGRectGetWidth(v5) > 0.0001;
}

- (BOOL)_wk_canScrollVerticallyWithoutBouncing
{
  double v2;
  double v3;
  CGRect v5;

  objc_msgSend(a1, "_wk_contentHeightIncludingInsets");
  v3 = v2;
  objc_msgSend(a1, "bounds");
  return v3 - CGRectGetHeight(v5) > 0.0001;
}

- (uint64_t)_wk_setContentOffsetAndShowScrollIndicators:()WebKitInternal animated:
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  char v12;
  float v13[2];
  float v14[2];
  _QWORD v15[4];
  char v16;
  _BYTE v17[23];
  void *v18;
  CGPoint v19;
  _BYTE v20[23];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.x = a2;
  v19.y = a3;
  if ((byte_1ECE72C3B & 1) != 0)
  {
    if (byte_1ECE72C3A)
    {
LABEL_3:
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3321888768;
      v15[2] = __85__UIScrollView_WebKitInternal___wk_setContentOffsetAndShowScrollIndicators_animated___block_invoke;
      v15[3] = &__block_descriptor_64_e8_32c98_ZTSKZ85__UIScrollView_WebKitInternal___wk_setContentOffsetAndShowScrollIndicators_animated__E3__0_e5_v8__0l;
      *(CGPoint *)&v20[7] = v19;
      v16 = a5;
      *(_OWORD *)v17 = *(_OWORD *)v20;
      *(CGFloat *)&v17[15] = v19.y;
      v18 = a1;
      return objc_msgSend(a1, "showScrollIndicatorsForContentOffsetChanges:", v15);
    }
  }
  else
  {
    v12 = a5;
    v7 = objc_msgSend(MEMORY[0x1E0CEA970], "instancesRespondToSelector:", sel_showScrollIndicatorsForContentOffsetChanges_);
    a5 = v12;
    byte_1ECE72C3A = v7;
    byte_1ECE72C3B = 1;
    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(a1, "setContentOffset:animated:");
  objc_msgSend(a1, "contentOffset");
  *(_QWORD *)v20 = v8;
  *(_QWORD *)&v20[8] = v9;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v14, (const CGPoint *)v20);
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v13, &v19);
  if ((float)(v14[1] - v13[1]) == 0.0)
    v11 = (float)(v14[0] - v13[0]) != 0.0;
  else
    v11 = ((float)(v14[0] - v13[0]) != 0.0) | 2;
  *(float *)&v10 = v14[0] - v13[0];
  return objc_msgSend(a1, "_flashScrollIndicatorsForAxes:persistingPreviousFlashes:", v11, 1, v10);
}

@end
