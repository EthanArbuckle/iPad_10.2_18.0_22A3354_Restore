@implementation BNBannerLayoutManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    BNRegisterBannerKitLogging();
}

- (BNBannerLayoutManager)init
{
  BNBannerLayoutManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BNBannerLayoutManager;
  result = -[BNBannerLayoutManager init](&v3, sel_init);
  if (result)
  {
    result->_layoutInfoV2.presentationEdge = 1;
    *(_OWORD *)&result->_layoutInfoV2.contentInsets.top = xmmword_1B9655050;
    *(_OWORD *)&result->_layoutInfoV2.contentInsets.bottom = xmmword_1B9655050;
    result->_layoutInfoV2.maximumContentSize = (CGSize)xmmword_1B9655060;
    result->_layoutInfoV2.interBannerSpacing = 8.0;
  }
  return result;
}

+ (CGRect)_useableContainerFrameInContainerBounds:(CGRect)a3 onScreen:(id)a4 interfaceOrientation:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend(a4, "_bn_portraitPeripheryInsets");
  UIEdgeInsetsRotate();
  UIRectInset();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (CGRect)_useableContainerFrameInContainerBounds:(CGRect)a3 onScreen:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(a4, "_peripheryInsets");
  UIRectInset();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)_useableContainerFrameInContainerBounds:(CGRect)a3 inWindow:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  uint64_t v11;
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
  double v22;
  double v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  objc_msgSend(v9, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "interfaceOrientation");

  objc_msgSend(a1, "_useableContainerFrameInContainerBounds:onScreen:interfaceOrientation:", v10, v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (CGRect)_presentedFrameForContentWithPreferredSize:(CGSize)a3 inUseableContainerFrame:(CGRect)a4 containerBounds:(CGRect)a5 layoutInfo:(BNBannerLayoutInfoV2 *)a6 scale:(double)a7
{
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat width;
  CGFloat height;
  CGFloat x;
  CGFloat y;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  width = a4.size.width;
  height = a4.size.height;
  x = a4.origin.x;
  y = a4.origin.y;
  v8 = a5.size.height;
  v10 = a5.origin.x;
  v9 = a5.origin.y;
  v11 = a5.size.width;
  CGRectGetWidth(a5);
  CGRectGetHeight(a5);
  UISizeRoundToScale();
  v13 = v12;
  v15 = v14;
  UISizeRoundToScale();
  if (v13 != v17 || v15 != v16)
  {
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    CGRectGetWidth(v33);
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    CGRectGetHeight(v34);
    BSRectWithSize();
    UIRectCenteredXInRectScale();
    v10 = v20;
    v11 = v21;
    v8 = v22;
    if (a6->presentationEdge == 4)
    {
      v23 = v19;
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      CGRectGetMaxY(v35);
      v36.origin.x = v10;
      v36.origin.y = v23;
      v36.size.width = v11;
      v36.size.height = v8;
      CGRectGetHeight(v36);
    }
    else
    {
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      CGRectGetMinY(v37);
    }
    UIRoundToScale();
    v9 = v24;
  }
  v25 = v10;
  v26 = v9;
  v27 = v11;
  v28 = v8;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

+ (CGRect)_dismissedFrameForContentWithPreferredSize:(CGSize)a3 inUseableContainerFrame:(CGRect)a4 containerBounds:(CGRect)a5 layoutInfo:(BNBannerLayoutInfoV2 *)a6 overshoot:(BOOL)a7 scale:(double)a8
{
  _BOOL4 v8;
  __int128 v10;
  __int128 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double Height;
  double v20;
  double v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  _OWORD v29[4];
  CGRect result;

  v8 = a7;
  v10 = *(_OWORD *)&a6->contentInsets.left;
  v29[0] = *(_OWORD *)&a6->presentationEdge;
  v29[1] = v10;
  v11 = *(_OWORD *)&a6->maximumContentSize.height;
  v29[2] = *(_OWORD *)&a6->contentInsets.right;
  v29[3] = v11;
  objc_msgSend(a1, "_presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:layoutInfo:scale:", v29, a3.width, a3.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(_QWORD *)&a5.origin.x, *(_QWORD *)&a5.origin.y, *(_QWORD *)&a5.size.width, *(_QWORD *)&a5.size.height, *(_QWORD *)&a8);
  v16 = v12;
  v17 = v14;
  v18 = v15;
  if ((v14 != a5.size.width || v15 != a5.size.height) && (a6->presentationEdge & 5) != 0)
  {
    Height = CGRectGetHeight(*(CGRect *)&v12);
    v20 = Height * 0.5;
    if (!v8)
      v20 = 0.0;
    v21 = Height + v20;
    x = a5.origin.x;
    y = a5.origin.y;
    width = a5.size.width;
    v25 = a5.size.height;
    if (a6->presentationEdge == 4)
      v13 = v21 + CGRectGetMaxY(*(CGRect *)&x);
    else
      v13 = CGRectGetMinY(*(CGRect *)&x) - v21;
  }
  v26 = v16;
  v27 = v17;
  v28 = v18;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v13;
  result.origin.x = v26;
  return result;
}

+ (CGRect)_presentedFrameForContentWithFrame:(CGRect)a3 afterContentWithFrame:(CGRect)a4 layoutInfo:(BNBannerLayoutInfoV2 *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  unint64_t presentationEdge;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v24;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.x;
  presentationEdge = a5->presentationEdge;
  if ((a5->presentationEdge & 5) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BNBannerLayoutManager.m"), 110, CFSTR("Only 'UIRectEdgeTop' and 'UIRectEdgeBottom' are currently supported"));

    presentationEdge = a5->presentationEdge;
  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  if (presentationEdge == 4)
    v18 = CGRectGetMinY(*(CGRect *)&v14) - a5->interBannerSpacing;
  else
    v18 = CGRectGetMaxY(*(CGRect *)&v14) + a5->interBannerSpacing;
  v19 = v12;
  v20 = v11;
  v21 = v10;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v18;
  result.origin.x = v19;
  return result;
}

- (CGRect)useableContainerFrameInContainerBounds:(CGRect)a3 onScreen:(id)a4 interfaceOrientation:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
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
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  objc_msgSend((id)objc_opt_class(), "_useableContainerFrameInContainerBounds:onScreen:interfaceOrientation:", v10, a5, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)useableContainerFrameInContainerBounds:(CGRect)a3 onScreen:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  double v9;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "_useableContainerFrameInContainerBounds:onScreen:", v8, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)useableContainerFrameInContainerBounds:(CGRect)a3 inWindow:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  double v9;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "_useableContainerFrameInContainerBounds:inWindow:", v8, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)dismissedFrameForContentWithPreferredSize:(CGSize)a3 inUseableContainerFrame:(CGRect)a4 containerBounds:(CGRect)a5 overshoot:(BOOL)a6 scale:(double)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BYTE v20[64];
  CGRect result;

  v7 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3.height;
  v13 = a3.width;
  v15 = (void *)objc_opt_class();
  -[BNBannerLayoutManager _effectiveLayoutInfo](self, "_effectiveLayoutInfo");
  objc_msgSend(v15, "_dismissedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:layoutInfo:overshoot:scale:", v20, v7, v13, v12, x, y, width, height, *(_QWORD *)&a5.origin.x, *(_QWORD *)&a5.origin.y, *(_QWORD *)&a5.size.width, *(_QWORD *)&a5.size.height, *(_QWORD *)&a7);
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)presentedFrameForContentWithPreferredSize:(CGSize)a3 inUseableContainerFrame:(CGRect)a4 containerBounds:(CGRect)a5 scale:(double)a6
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BYTE v18[64];
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.height;
  v11 = a3.width;
  v13 = (void *)objc_opt_class();
  -[BNBannerLayoutManager _effectiveLayoutInfo](self, "_effectiveLayoutInfo");
  objc_msgSend(v13, "_presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:layoutInfo:scale:", v18, v11, v10, x, y, width, height, *(_QWORD *)&a5.origin.x, *(_QWORD *)&a5.origin.y, *(_QWORD *)&a5.size.width, *(_QWORD *)&a5.size.height, *(_QWORD *)&a6);
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)presentedFrameForContentWithFrame:(CGRect)a3 afterContentWithFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v13 = (void *)objc_opt_class();
  -[BNBannerLayoutManager _effectiveLayoutInfo](self, "_effectiveLayoutInfo");
  objc_msgSend(v13, "_presentedFrameForContentWithFrame:afterContentWithFrame:layoutInfo:", &v18, v11, v10, v9, v8, x, y, width, height);
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)setLayoutInfo:(BNBannerLayoutInfo *)a3
{
  _OWORD *v3;
  __int128 v4;
  CGSize *v5;
  __int128 v6;
  __int128 v7;
  CGFloat height;

  v3 = (_OWORD *)MEMORY[0x1E0CEB4B0];
  self->_layoutInfoV2.presentationEdge = 0;
  v4 = v3[1];
  *(_OWORD *)&self->_layoutInfoV2.contentInsets.top = *v3;
  v5 = (CGSize *)MEMORY[0x1E0C9D820];
  *(_OWORD *)&self->_layoutInfoV2.contentInsets.bottom = v4;
  self->_layoutInfoV2.maximumContentSize = *v5;
  self->_layoutInfoV2.interBannerSpacing = 0.0;
  v7 = *(_OWORD *)&a3->contentInsets.left;
  v6 = *(_OWORD *)&a3->contentInsets.right;
  height = a3->maximumContentSize.height;
  *(_OWORD *)&self->_layoutInfo.presentationEdge = *(_OWORD *)&a3->presentationEdge;
  self->_layoutInfo.maximumContentSize.height = height;
  *(_OWORD *)&self->_layoutInfo.contentInsets.right = v6;
  *(_OWORD *)&self->_layoutInfo.contentInsets.left = v7;
}

- (BNBannerLayoutInfoV2)_effectiveLayoutInfo
{
  BNBannerLayoutInfoV2 *result;
  double v6;
  BOOL v7;
  CGSize v8;
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  uint64_t v12;
  float64x2_t v13;
  float64x2_t v14;
  double v15;
  double v16;
  double v17;

  -[BNBannerLayoutManager layoutInfoV2](self, "layoutInfoV2");
  if (v12
    || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v13, *MEMORY[0x1E0CEB4B0]), (int32x4_t)vceqq_f64(v14, *(float64x2_t *)(MEMORY[0x1E0CEB4B0] + 16)))), 0xFuLL))) & 1) == 0)
  {
    return -[BNBannerLayoutManager layoutInfoV2](self, "layoutInfoV2");
  }
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v7 = v15 == *MEMORY[0x1E0C9D820] && v16 == v6;
  if (!v7 || v17 != 0.0)
    return -[BNBannerLayoutManager layoutInfoV2](self, "layoutInfoV2");
  -[BNBannerLayoutManager layoutInfo](self, "layoutInfo", v17, v6, v15, v16);
  retstr->presentationEdge = v11;
  -[BNBannerLayoutManager layoutInfo](self, "layoutInfo");
  *(_OWORD *)&retstr->contentInsets.top = v9;
  *(_OWORD *)&retstr->contentInsets.bottom = v10;
  result = -[BNBannerLayoutManager layoutInfo](self, "layoutInfo");
  retstr->maximumContentSize = v8;
  retstr->interBannerSpacing = 8.0;
  return result;
}

- (BNBannerLayoutInfo)layoutInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self->contentInsets.bottom;
  *(_OWORD *)&retstr->presentationEdge = *(_OWORD *)&self->contentInsets.top;
  *(_OWORD *)&retstr->contentInsets.left = v3;
  *(CGSize *)&retstr->contentInsets.right = self->maximumContentSize;
  *(_QWORD *)&retstr->maximumContentSize.height = self[1].presentationEdge;
  return self;
}

- (BNBannerLayoutInfoV2)layoutInfoV2
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[1].contentInsets.left;
  *(_OWORD *)&retstr->presentationEdge = *(_OWORD *)&self[1].presentationEdge;
  *(_OWORD *)&retstr->contentInsets.left = v3;
  v4 = *(_OWORD *)&self[1].maximumContentSize.height;
  *(_OWORD *)&retstr->contentInsets.right = *(_OWORD *)&self[1].contentInsets.right;
  *(_OWORD *)&retstr->maximumContentSize.height = v4;
  return self;
}

- (void)setLayoutInfoV2:(BNBannerLayoutInfoV2 *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->presentationEdge;
  v4 = *(_OWORD *)&a3->contentInsets.left;
  v5 = *(_OWORD *)&a3->maximumContentSize.height;
  *(_OWORD *)&self->_layoutInfoV2.contentInsets.right = *(_OWORD *)&a3->contentInsets.right;
  *(_OWORD *)&self->_layoutInfoV2.maximumContentSize.height = v5;
  *(_OWORD *)&self->_layoutInfoV2.presentationEdge = v3;
  *(_OWORD *)&self->_layoutInfoV2.contentInsets.left = v4;
}

@end
