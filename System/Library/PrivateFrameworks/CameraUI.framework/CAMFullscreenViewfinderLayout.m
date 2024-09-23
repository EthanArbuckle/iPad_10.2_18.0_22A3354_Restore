@implementation CAMFullscreenViewfinderLayout

- (CAMFullscreenViewfinderLayout)initWithReferenceBounds:(CGRect)a3 shutterIntrinsicSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat v6;
  CGFloat v7;
  CGFloat y;
  CGFloat x;
  CAMFullscreenViewfinderLayout *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  v6 = a3.size.height;
  v7 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)CAMFullscreenViewfinderLayout;
  v10 = -[CAMFullscreenViewfinderLayout init](&v16, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v10->_screenScale = v12;

    v10->_referenceBounds.origin.x = x;
    v10->_referenceBounds.origin.y = y;
    v10->_referenceBounds.size.width = v7;
    v10->_referenceBounds.size.height = v6;
    v10->_shutterIntrinsicSize.width = width;
    v10->_shutterIntrinsicSize.height = height;
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frontCameraInset");
    v10->_frontCameraInset = v14;

    -[CAMFullscreenViewfinderLayout _updateSafeAreaInsets](v10, "_updateSafeAreaInsets");
  }
  return v10;
}

- (void)setReferenceBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_referenceBounds))
  {
    self->_referenceBounds.origin.x = x;
    self->_referenceBounds.origin.y = y;
    self->_referenceBounds.size.width = width;
    self->_referenceBounds.size.height = height;
    -[CAMFullscreenViewfinderLayout _updateSafeAreaInsets](self, "_updateSafeAreaInsets");
  }
}

- (void)setScreenScale:(double)a3
{
  if (self->_screenScale != a3)
  {
    self->_screenScale = a3;
    -[CAMFullscreenViewfinderLayout _updateSafeAreaInsets](self, "_updateSafeAreaInsets");
  }
}

- (void)setFrontCameraInset:(double)a3
{
  if (self->_frontCameraInset != a3)
  {
    self->_frontCameraInset = a3;
    -[CAMFullscreenViewfinderLayout _updateSafeAreaInsets](self, "_updateSafeAreaInsets");
  }
}

- (void)_updateSafeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double *v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  -[CAMFullscreenViewfinderLayout referenceBounds](self, "referenceBounds");
  v4 = v3;
  -[CAMFullscreenViewfinderLayout viewportSizeForAspectRatio:](self, "viewportSizeForAspectRatio:", 1);
  v6 = v4 - v5;
  v7 = (double *)MEMORY[0x1E0DC49E8];
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v9 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[CAMFullscreenViewfinderLayout screenScale](self, "screenScale");
  UIRoundToScale();
  v11 = v10;
  v12 = v6 - v10;
  -[CAMFullscreenViewfinderLayout frameForControlStatusBar](self, "frameForControlStatusBar");
  if (v12 >= v13 + 33.0)
  {
    -[CAMFullscreenViewfinderLayout frontCameraInset](self, "frontCameraInset");
    if (v15 <= 45.0)
    {
      v14 = 33.0;
    }
    else
    {
      v11 = v11 + -15.0;
      v14 = 48.0;
    }
  }
  else
  {
    v14 = *v7;
  }
  self->__safeAreaInsets.top = v14;
  self->__safeAreaInsets.left = v8;
  self->__safeAreaInsets.bottom = v11;
  self->__safeAreaInsets.right = v9;
}

- (CGSize)viewportSizeForAspectRatio:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CAMFullscreenViewfinderLayout referenceBounds](self, "referenceBounds");
  v5 = v4;
  -[CAMFullscreenViewfinderLayout screenScale](self, "screenScale");
  UIRoundToScale();
  v7 = v6;
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (CGRect)viewportFrameForAspectRatio:(int64_t)a3 accessoryAreaExpanded:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CAMFullscreenViewfinderLayout viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:](self, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", a3, 0, a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)viewportFrameForAspectRatio:(int64_t)a3 usingAppDrawer:(BOOL)a4 accessoryAreaExpanded:(BOOL)a5
{
  _BOOL4 v5;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
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
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect result;

  v5 = a5;
  -[CAMFullscreenViewfinderLayout referenceBounds](self, "referenceBounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CAMFullscreenViewfinderLayout viewportSizeForAspectRatio:](self, "viewportSizeForAspectRatio:", a3);
  v17 = v16;
  v19 = v18;
  if ((unint64_t)(a3 - 2) >= 2 && a3)
  {
    if (a3 == 1)
    {
      -[CAMFullscreenViewfinderLayout _safeAreaInsets](self, "_safeAreaInsets");
      v11 = v15 - v19 - v20;
    }
  }
  else
  {
    v40 = v13;
    v42 = v15;
    if (v5)
    {
      +[CAMControlDrawerButton buttonSize](CAMControlDrawerButton, "buttonSize");
      v22 = v21 + 30.0;
    }
    else
    {
      -[CAMFullscreenViewfinderLayout screenScale](self, "screenScale", v13, *(_QWORD *)&v15);
      UIRoundToScale();
    }
    v23 = fmax(v22, 31.0);
    -[CAMFullscreenViewfinderLayout alignmentRectForShutterControl](self, "alignmentRectForShutterControl", v40, *(_QWORD *)&v42);
    v25 = v24;
    -[CAMFullscreenViewfinderLayout viewportSizeForAspectRatio:](self, "viewportSizeForAspectRatio:", 0);
    v27 = v25 - v23 - v26;
    -[CAMFullscreenViewfinderLayout frameForControlStatusBar](self, "frameForControlStatusBar");
    x = v44.origin.x;
    y = v44.origin.y;
    width = v44.size.width;
    height = v44.size.height;
    if (v27 >= CGRectGetMidY(v44))
    {
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = width;
      v46.size.height = height;
      if (v27 < CGRectGetMaxY(v46))
      {
        v47.origin.x = x;
        v47.origin.y = y;
        v47.size.width = width;
        v47.size.height = height;
        CGRectGetMaxY(v47);
      }
    }
    else
    {
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = width;
      v45.size.height = height;
      CGRectGetMinY(v45);
    }
    v48.size.width = v41;
    v48.size.height = v43;
    v48.origin.x = v9;
    v48.origin.y = v11;
    CGRectGetMidX(v48);
    -[CAMFullscreenViewfinderLayout screenScale](self, "screenScale");
    UIRectCenteredAboutPointScale();
    v9 = v32;
    v11 = v33;
    v17 = v34;
    v19 = v35;
  }
  v36 = v9;
  v37 = v11;
  v38 = v17;
  v39 = v19;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (CGRect)frameForShutterControl:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  -[CAMFullscreenViewfinderLayout referenceBounds](self, "referenceBounds");
  -[CAMFullscreenViewfinderLayout alignmentRectForShutterControl](self, "alignmentRectForShutterControl");
  objc_msgSend(v4, "frameForAlignmentRect:availableWidth:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)alignmentRectForShutterControl
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double MaxY;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  CGRect v27;
  CGRect result;

  -[CAMFullscreenViewfinderLayout referenceBounds](self, "referenceBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMFullscreenViewfinderLayout shutterIntrinsicSize](self, "shutterIntrinsicSize");
  -[CAMFullscreenViewfinderLayout screenScale](self, "screenScale");
  v26 = v11;
  UIRectCenteredXInRectScale();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  CEKClamp();
  -[CAMFullscreenViewfinderLayout screenScale](self, "screenScale", v26);
  UIRoundToScale();
  v19 = v18;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  MaxY = CGRectGetMaxY(v27);
  -[CAMFullscreenViewfinderLayout _safeAreaInsets](self, "_safeAreaInsets");
  v22 = MaxY - v21 - v17 - v19;
  v23 = v13;
  v24 = v15;
  v25 = v17;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v22;
  result.origin.x = v23;
  return result;
}

- (CGRect)frameForControlStatusBar
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[CAMFullscreenViewfinderLayout referenceBounds](self, "referenceBounds");
  v4 = v3;
  v6 = v5;
  CEKClamp();
  -[CAMFullscreenViewfinderLayout screenScale](self, "screenScale");
  UIRoundToScale();
  v8 = v7;
  -[CAMFullscreenViewfinderLayout _safeAreaInsets](self, "_safeAreaInsets");
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v11;
  return result;
}

- (CGRect)frameForBottomLeftControl:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  -[CAMFullscreenViewfinderLayout alignmentRectForShutterControl](self, "alignmentRectForShutterControl");
  objc_msgSend(v4, "intrinsicContentSize");
  UIRectCenteredYInRectScale();
  objc_msgSend(v4, "frameForAlignmentRect:", 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)frameForBottomControl:(id)a3 betweenShutterAndLeftControl:(id)a4
{
  id v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat rect;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect result;

  v6 = a4;
  v7 = a3;
  -[CAMFullscreenViewfinderLayout alignmentRectForShutterControl](self, "alignmentRectForShutterControl");
  v9 = v8;
  rect = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CAMFullscreenViewfinderLayout frameForBottomLeftControl:](self, "frameForBottomLeftControl:", v6);
  objc_msgSend(v6, "alignmentRectForFrame:");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v37.origin.x = v9;
  v37.origin.y = v11;
  v37.size.width = v13;
  v37.size.height = v15;
  CGRectGetMinX(v37);
  v38.origin.x = v17;
  v38.origin.y = v19;
  v38.size.width = v21;
  v38.size.height = v23;
  CGRectGetMaxX(v38);
  v39.origin.x = rect;
  v39.origin.y = v11;
  v39.size.width = v13;
  v39.size.height = v15;
  CGRectGetMidY(v39);
  objc_msgSend(v7, "intrinsicContentSize");
  UIRectCenteredAboutPointScale();
  objc_msgSend(v7, "frameForAlignmentRect:");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = v25;
  v33 = v27;
  v34 = v29;
  v35 = v31;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CGRect)frameForBottomRightControl:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  v4 = a3;
  -[CAMFullscreenViewfinderLayout alignmentRectForShutterControl](self, "alignmentRectForShutterControl");
  objc_msgSend(v4, "intrinsicContentSize");
  -[CAMFullscreenViewfinderLayout referenceBounds](self, "referenceBounds");
  CGRectGetMaxX(v17);
  UIRectCenteredYInRectScale();
  objc_msgSend(v4, "frameForAlignmentRect:", 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)frameForBottomControl:(id)a3 betweenShutterAndRightControl:(id)a4
{
  id v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat rect;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect result;

  v6 = a4;
  v7 = a3;
  -[CAMFullscreenViewfinderLayout alignmentRectForShutterControl](self, "alignmentRectForShutterControl");
  v9 = v8;
  rect = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CAMFullscreenViewfinderLayout frameForBottomRightControl:](self, "frameForBottomRightControl:", v6);
  objc_msgSend(v6, "alignmentRectForFrame:");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v37.origin.x = v9;
  v37.origin.y = v11;
  v37.size.width = v13;
  v37.size.height = v15;
  CGRectGetMaxX(v37);
  v38.origin.x = v17;
  v38.origin.y = v19;
  v38.size.width = v21;
  v38.size.height = v23;
  CGRectGetMinX(v38);
  v39.origin.x = rect;
  v39.origin.y = v11;
  v39.size.width = v13;
  v39.size.height = v15;
  CGRectGetMidY(v39);
  objc_msgSend(v7, "intrinsicContentSize");
  UIRectCenteredAboutPointScale();
  objc_msgSend(v7, "frameForAlignmentRect:");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = v25;
  v33 = v27;
  v34 = v29;
  v35 = v31;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)geometryForElapsedTimeView:(SEL)a3 viewportFrame:(id)a4 orientation:(CGRect)a5
{
  return -[CAMFullscreenViewfinderLayout geometryForElapsedTimeView:viewportFrame:orientation:systemOverlayVisible:](self, "geometryForElapsedTimeView:viewportFrame:orientation:systemOverlayVisible:", a4, a6, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)geometryForElapsedTimeView:(SEL)a3 viewportFrame:(id)a4 orientation:(CGRect)a5 systemOverlayVisible:(int64_t)a6
{
  _BOOL4 v7;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGSize v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double MidY;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double MinY;
  __int128 v43;
  __int128 v44;
  CGSize size;
  double v46;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
  CGPoint origin;
  CGSize v49;
  CGPoint var1;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v7 = a7;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a4;
  *retstr = *($3B1716E7537CC2F16D6737AAC3CCCADB *)CAMViewGeometryZero;
  objc_msgSend(v15, "intrinsicContentSize");
  v17 = v16;
  retstr->var0.size.width = v18;
  retstr->var0.size.height = v16;
  CAMOrientationTransform(a6, (uint64_t)&origin);
  v19 = v49;
  *(CGPoint *)&retstr->var2.a = origin;
  *(CGSize *)&retstr->var2.c = v19;
  *(CGPoint *)&retstr->var2.tx = var1;
  UIRectGetCenter();
  v21 = v20;
  retstr->var1.x = v22;
  retstr->var1.y = v20;
  v23 = v17 * 0.5;
  UIRoundToViewScale();
  if ((unint64_t)a6 < 3)
  {
    -[CAMFullscreenViewfinderLayout frameForControlStatusBar](self, "frameForControlStatusBar");
    v25 = v54.origin.y;
    MidY = CGRectGetMidY(v54);
    retstr->var1.y = MidY;
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frontCameraInset");
    v29 = v28 + 2.0;

    v30 = MidY - v23 + v25;
    if (v29 > v30)
      retstr->var1.y = MidY + v29 - v30;
    UIRoundToViewScale();
    goto LABEL_5;
  }
  v32 = v24;
  if (a6 == 3)
  {
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    retstr->var1.x = CGRectGetMaxX(v56) - v32 + -8.0;
    if (v7)
    {
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "frameForPhysicalButton:", 6);
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;

      v57.origin.x = v35;
      v57.origin.y = v37;
      v57.size.width = v39;
      v57.size.height = v41;
      MinY = CGRectGetMinY(v57);
      v43 = *(_OWORD *)&retstr->var2.a;
      var1 = retstr->var1;
      v51 = v43;
      v44 = *(_OWORD *)&retstr->var2.tx;
      v52 = *(_OWORD *)&retstr->var2.c;
      v53 = v44;
      size = retstr->var0.size;
      origin = retstr->var0.origin;
      v49 = size;
      CAMFrameForGeometry((uint64_t)&origin);
      v46 = CGRectGetMaxY(v58) + 64.0;
      if (v46 > MinY)
      {
        v31 = v21 - (v46 - MinY);
LABEL_5:
        retstr->var1.y = v31;
      }
    }
  }
  else if (a6 == 4)
  {
    v55.origin.x = x;
    v55.origin.y = y;
    v55.size.width = width;
    v55.size.height = height;
    retstr->var1.x = v32 + CGRectGetMinX(v55) + 8.0;
  }

  return result;
}

- (CGRect)referenceBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceBounds.origin.x;
  y = self->_referenceBounds.origin.y;
  width = self->_referenceBounds.size.width;
  height = self->_referenceBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)shutterIntrinsicSize
{
  double width;
  double height;
  CGSize result;

  width = self->_shutterIntrinsicSize.width;
  height = self->_shutterIntrinsicSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setShutterIntrinsicSize:(CGSize)a3
{
  self->_shutterIntrinsicSize = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (UIEdgeInsets)_safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__safeAreaInsets.top;
  left = self->__safeAreaInsets.left;
  bottom = self->__safeAreaInsets.bottom;
  right = self->__safeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)frontCameraInset
{
  return self->_frontCameraInset;
}

@end
