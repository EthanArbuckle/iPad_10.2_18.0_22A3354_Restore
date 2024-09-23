@implementation CSProminentLayoutController

- (void)setFourDigitTime:(BOOL)a3
{
  self->_fourDigitTime = a3;
}

- (CSProminentLayoutController)initWithTraitEnvironment:(id)a3
{
  id v4;
  CSProminentLayoutController *v5;
  CSProminentLayoutController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSProminentLayoutController;
  v5 = -[CSProminentLayoutController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_traitEnvironment, v4);

  return v6;
}

+ (CGRect)frameForElements:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "frameForElements:variant:", a3, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)boundsForElements:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "boundsForElements:variant:", a3, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(a1, "frameForElements:variant:forcePortraitBounds:", a3, a4, 0);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4 forcePortraitBounds:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  CSProminentLayoutController *v9;
  void *v10;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  v5 = a5;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!frameForElements_variant_forcePortraitBounds__mainScreenLayoutController)
  {
    v9 = -[CSProminentLayoutController initWithTraitEnvironment:]([CSProminentLayoutController alloc], "initWithTraitEnvironment:", v8);
    v10 = (void *)frameForElements_variant_forcePortraitBounds__mainScreenLayoutController;
    frameForElements_variant_forcePortraitBounds__mainScreenLayoutController = (uint64_t)v9;

  }
  objc_msgSend(v8, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = v11;
  if (v5 && v17 > v11)
  {
    v11 = v17;
    v19 = v13;
  }
  else
  {
    v18 = v17;
    v19 = v15;
    v15 = v13;
  }
  objc_msgSend((id)frameForElements_variant_forcePortraitBounds__mainScreenLayoutController, "frameForElements:variant:withBoundingRect:", a3, a4, v15, v19, v18, v11);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = v21;
  v29 = v23;
  v30 = v25;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

+ (CGRect)boundsForElements:(unint64_t)a3 variant:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(a1, "frameForElements:variant:", a3, a4);
  v6 = 0.0;
  v7 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)frameForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)boundsForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CSProminentLayoutController boundsForElements:variant:withBoundingRect:](self, "boundsForElements:variant:withBoundingRect:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4 withBoundingRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  char v10;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect result;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a3;
  v13 = *MEMORY[0x1E0C9D628];
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if ((a3 & 1) != 0)
  {
    -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", 1, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
    v64.origin.x = v24;
    v64.origin.y = v25;
    v64.size.width = v26;
    v64.size.height = v27;
    v50.origin.x = v13;
    v50.origin.y = v12;
    v50.size.width = v15;
    v50.size.height = v14;
    v51 = CGRectUnion(v50, v64);
    v13 = v51.origin.x;
    v12 = v51.origin.y;
    v15 = v51.size.width;
    v14 = v51.size.height;
    if ((v10 & 2) == 0)
    {
LABEL_3:
      if ((v10 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", 2, a4, x, y, width, height);
  v65.origin.x = v28;
  v65.origin.y = v29;
  v65.size.width = v30;
  v65.size.height = v31;
  v52.origin.x = v13;
  v52.origin.y = v12;
  v52.size.width = v15;
  v52.size.height = v14;
  v53 = CGRectUnion(v52, v65);
  v13 = v53.origin.x;
  v12 = v53.origin.y;
  v15 = v53.size.width;
  v14 = v53.size.height;
  if ((v10 & 4) == 0)
  {
LABEL_4:
    if ((v10 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", 4, a4, x, y, width, height);
  v66.origin.x = v32;
  v66.origin.y = v33;
  v66.size.width = v34;
  v66.size.height = v35;
  v54.origin.x = v13;
  v54.origin.y = v12;
  v54.size.width = v15;
  v54.size.height = v14;
  v55 = CGRectUnion(v54, v66);
  v13 = v55.origin.x;
  v12 = v55.origin.y;
  v15 = v55.size.width;
  v14 = v55.size.height;
  if ((v10 & 8) == 0)
  {
LABEL_5:
    if ((v10 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", 8, a4, x, y, width, height);
  v67.origin.x = v36;
  v67.origin.y = v37;
  v67.size.width = v38;
  v67.size.height = v39;
  v56.origin.x = v13;
  v56.origin.y = v12;
  v56.size.width = v15;
  v56.size.height = v14;
  v57 = CGRectUnion(v56, v67);
  v13 = v57.origin.x;
  v12 = v57.origin.y;
  v15 = v57.size.width;
  v14 = v57.size.height;
  if ((v10 & 0x10) == 0)
  {
LABEL_6:
    if ((v10 & 0x40) == 0)
      goto LABEL_7;
LABEL_15:
    -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", 64, a4, x, y, width, height);
    v69.origin.x = v44;
    v69.origin.y = v45;
    v69.size.width = v46;
    v69.size.height = v47;
    v60.origin.x = v13;
    v60.origin.y = v12;
    v60.size.width = v15;
    v60.size.height = v14;
    v61 = CGRectUnion(v60, v69);
    v13 = v61.origin.x;
    v12 = v61.origin.y;
    v15 = v61.size.width;
    v14 = v61.size.height;
    if ((v10 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", 16, a4, x, y, width, height);
  v68.origin.x = v40;
  v68.origin.y = v41;
  v68.size.width = v42;
  v68.size.height = v43;
  v58.origin.x = v13;
  v58.origin.y = v12;
  v58.size.width = v15;
  v58.size.height = v14;
  v59 = CGRectUnion(v58, v68);
  v13 = v59.origin.x;
  v12 = v59.origin.y;
  v15 = v59.size.width;
  v14 = v59.size.height;
  if ((v10 & 0x40) != 0)
    goto LABEL_15;
LABEL_7:
  if (v10 < 0)
  {
LABEL_8:
    -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", 128, a4, x, y, width, height);
    v63.origin.x = v16;
    v63.origin.y = v17;
    v63.size.width = v18;
    v63.size.height = v19;
    v48.origin.x = v13;
    v48.origin.y = v12;
    v48.size.width = v15;
    v48.size.height = v14;
    v49 = CGRectUnion(v48, v63);
    v13 = v49.origin.x;
    v12 = v49.origin.y;
    v15 = v49.size.width;
    v14 = v49.size.height;
  }
LABEL_9:
  v20 = v13;
  v21 = v12;
  v22 = v15;
  v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)boundsForElements:(unint64_t)a3 variant:(unint64_t)a4 withBoundingRect:(CGRect)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", a3, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v7 = 0.0;
  v8 = 0.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)normalizedFrameForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CSProminentLayoutController normalizedFrameForElements:variant:inBoundingRect:](self, "normalizedFrameForElements:variant:inBoundingRect:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)normalizedBoundsForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CSProminentLayoutController normalizedBoundsForElements:variant:inBoundingRect:](self, "normalizedBoundsForElements:variant:inBoundingRect:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)normalizedFrameForElements:(unint64_t)a3 variant:(unint64_t)a4 inBoundingRect:(CGRect)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", a3, a4, a5.origin.x, a5.origin.y);
  v8 = v7 / width;
  v10 = v9 / height;
  v12 = v11 / width;
  v14 = v13 / height;
  result.size.height = v14;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v8;
  return result;
}

- (CGRect)normalizedBoundsForElements:(unint64_t)a3 variant:(unint64_t)a4 inBoundingRect:(CGRect)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[CSProminentLayoutController normalizedFrameForElements:variant:inBoundingRect:](self, "normalizedFrameForElements:variant:inBoundingRect:", a3, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v7 = 0.0;
  v8 = 0.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

+ (CGRect)tightFrameForElements:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "frameForElements:variant:", a3, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)tightBoundsForElements:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "boundsForElements:variant:", a3, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)tightFrameForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", a3, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)tightBoundsForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CSProminentLayoutController boundsForElements:variant:withBoundingRect:](self, "boundsForElements:variant:withBoundingRect:", a3, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)tightNormalizedFrameForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CSProminentLayoutController normalizedFrameForElements:variant:inBoundingRect:](self, "normalizedFrameForElements:variant:inBoundingRect:", a3, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)tightNormalizedBoundsForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CSProminentLayoutController normalizedBoundsForElements:variant:inBoundingRect:](self, "normalizedBoundsForElements:variant:inBoundingRect:", a3, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)editingFrameForElements:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "frameForElements:variant:", a3, 2);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)editingBoundsForElements:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "boundsForElements:variant:", a3, 2);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)editingFrameForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", a3, 2, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)editingBoundsForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CSProminentLayoutController boundsForElements:variant:withBoundingRect:](self, "boundsForElements:variant:withBoundingRect:", a3, 2, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)editingNormalizedFrameForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CSProminentLayoutController normalizedFrameForElements:variant:inBoundingRect:](self, "normalizedFrameForElements:variant:inBoundingRect:", a3, 2, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)editingNormalizedBoundsForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CSProminentLayoutController normalizedBoundsForElements:variant:inBoundingRect:](self, "normalizedBoundsForElements:variant:inBoundingRect:", a3, 2, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_frameForElement:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_frameForElement:(unint64_t)a3 withBoundingRect:(CGRect)a4 variant:(unint64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double MinX;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  void *v26;
  int v27;
  _BOOL4 v28;
  _BOOL4 v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  CGFloat v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGAffineTransform v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (a5 == 3)
  {
    -[CSProminentLayoutController editingReticleFrameForElement:withBoundingRect:](self, "editingReticleFrameForElement:withBoundingRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    MinX = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    goto LABEL_44;
  }
  -[CSProminentLayoutController elementHorizontalFrameInBoundingRect:forElementType:](self, "elementHorizontalFrameInBoundingRect:forElementType:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v21 = v20;
  v91 = v22;
  v93 = v23;
  v25 = v24;
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "deviceClass");

  v28 = -[CSProminentLayoutController _isPortraitForBoundingRect:](self, "_isPortraitForBoundingRect:", x, y, width, height);
  if ((uint64_t)a3 <= 15)
  {
    v29 = v28;
    v14 = 0.0;
    v18 = 0.0;
    switch(a3)
    {
      case 0xFFFFFFFFFFFFFFFFLL:
      case 0uLL:
        goto LABEL_16;
      case 1uLL:
        objc_msgSend((id)objc_opt_class(), "timeElementBoundingHeight");
        v18 = v44;
        v45 = (void *)objc_opt_class();
        if (v29)
        {
          objc_msgSend(v45, "timeElementBoundingTopY");
LABEL_31:
          v14 = v46;
          goto LABEL_39;
        }
        if (v27 == 2)
        {
          objc_msgSend(v45, "landscapePadTimeElementBoundingTopY");
          goto LABEL_31;
        }
        objc_msgSend(v45, "timeElementBoundingTopY");
        v78 = v77;
        objc_msgSend((id)objc_opt_class(), "subtitleElementBoundingTopY");
        v80 = v78 - v79;
        -[CSProminentLayoutController leadingLandscapeLayoutInset](self, "leadingLandscapeLayoutInset");
        v14 = v80 + floor(v81 * 0.666666667);
LABEL_39:
        if (a5 == 1)
          objc_msgSend((id)objc_opt_class(), "timeTightBoundingHeight");
        goto LABEL_41;
      case 2uLL:
      case 4uLL:
        -[CSProminentLayoutController subtitleElementBoundingHeight](self, "subtitleElementBoundingHeight");
        v18 = v30;
        if (v29)
        {
          objc_msgSend((id)objc_opt_class(), "subtitleElementBoundingTopY");
LABEL_23:
          v14 = v31;
          goto LABEL_33;
        }
        if (v27 == 2)
        {
          objc_msgSend((id)objc_opt_class(), "landscapePadSubtitleElementBoundingTopY");
          goto LABEL_23;
        }
        -[CSProminentLayoutController leadingLandscapeLayoutInset](self, "leadingLandscapeLayoutInset");
        v14 = floor(v76 * 0.75);
LABEL_33:
        if (a5 == 2)
        {
          -[CSProminentLayoutController subtitleElementEditingOffset](self, "subtitleElementEditingOffset");
LABEL_35:
          v14 = v14 + v49;
        }
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        goto LABEL_41;
      case 8uLL:
        objc_msgSend((id)objc_opt_class(), "complicationElementBoundingHeight");
        v18 = v47;
        objc_msgSend((id)objc_opt_class(), "complicationElementBoundingTopY");
        v14 = v48;
        if (a5 != 2)
          goto LABEL_41;
        objc_msgSend((id)objc_opt_class(), "complicationElementEditingOffset");
        goto LABEL_35;
      default:
        v14 = 0.0;
        v18 = 0.0;
        goto LABEL_41;
    }
    goto LABEL_41;
  }
  if ((uint64_t)a3 > 62)
  {
    if (a3 != 63)
    {
      if (a3 == 64)
      {
        -[CSProminentLayoutController _quickActionsLeadingFrameWithBoundingRect:](self, "_quickActionsLeadingFrameWithBoundingRect:", x, y, width, height);
        v51 = v50;
        v14 = v52;
        v16 = v53;
        v18 = v54;
        -[CSProminentLayoutController _quickActionsTrailingFrameWithBoundingRect:](self, "_quickActionsTrailingFrameWithBoundingRect:", x, y, width, height);
        MinX = v55;
        v57 = v56;
        v59 = v58;
        v61 = v60;
        if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
        {
          v18 = v61;
          v16 = v59;
          v14 = v57;
        }
        else
        {
          MinX = v51;
        }
        goto LABEL_44;
      }
      v14 = 0.0;
      v18 = 0.0;
      if (a3 == 128)
      {
        -[CSProminentLayoutController _quickActionsLeadingFrameWithBoundingRect:](self, "_quickActionsLeadingFrameWithBoundingRect:", x, y, width, height);
        v33 = v32;
        v14 = v34;
        v16 = v35;
        v18 = v36;
        -[CSProminentLayoutController _quickActionsTrailingFrameWithBoundingRect:](self, "_quickActionsTrailingFrameWithBoundingRect:", x, y, width, height);
        MinX = v37;
        v39 = v38;
        v41 = v40;
        v43 = v42;
        if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
        {
          MinX = v33;
        }
        else
        {
          v18 = v43;
          v16 = v41;
          v14 = v39;
        }
        goto LABEL_44;
      }
      goto LABEL_41;
    }
LABEL_16:
    MinX = *MEMORY[0x1E0C9D628];
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    goto LABEL_44;
  }
  if (a3 == 16)
  {
    objc_msgSend((id)objc_opt_class(), "landscapePadSubtitleElementBoundingTopY");
    v14 = v62;
    +[CSGraphicComplicationLayoutProvider complicationEdgeInset](CSGraphicComplicationLayoutProvider, "complicationEdgeInset");
    v64 = v63 + v63;
    +[CSGraphicComplicationLayoutProvider gridUnitSize](CSGraphicComplicationLayoutProvider, "gridUnitSize");
    v66 = v64 + v65 * 2.0;
    +[CSGraphicComplicationLayoutProvider interComplicationSpacing](CSGraphicComplicationLayoutProvider, "interComplicationSpacing");
    v16 = v66 + v67;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "fixedCoordinateSpace");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "bounds");
    v92 = v71;
    v94 = v70;
    v73 = v72;
    v75 = v74;

    CGAffineTransformMakeRotation(&v95, 1.57079633);
    v96.origin.y = v92;
    v96.origin.x = v94;
    v96.size.width = v73;
    v96.size.height = v75;
    v97 = CGRectApplyAffineTransform(v96, &v95);
    v18 = v97.size.height - v14 * 2.0;
    if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
    {
      v98.origin.x = x;
      v98.origin.y = y;
      v98.size.width = width;
      v98.size.height = height;
      MinX = CGRectGetMaxX(v98) - (v16 + 44.0);
    }
    else
    {
      MinX = 44.0;
    }
    goto LABEL_44;
  }
  v14 = 0.0;
  v18 = 0.0;
  if (a3 == 32)
    goto LABEL_16;
LABEL_41:
  v99.origin.x = v21;
  v99.origin.y = v91;
  v99.size.width = v93;
  v99.size.height = v25;
  MinX = CGRectGetMinX(v99);
  v82 = v21;
  v100.origin.x = v21;
  v100.origin.y = v91;
  v100.size.width = v93;
  v100.size.height = v25;
  v16 = CGRectGetWidth(v100);
  if (a5 == 1 && (BSFloatIsZero() & 1) == 0)
  {
    -[CSProminentLayoutController traitEnvironment](self, "traitEnvironment");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "traitCollection");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "displayScale");

    UIRoundToScale();
    v14 = v85;
    UIRoundToScale();
    v18 = v86;
    v101.origin.x = v82;
    v101.origin.y = v91;
    v101.size.width = v93;
    v101.size.height = v25;
    MinX = CGRectGetMinX(v101);
    v102.origin.x = v82;
    v102.origin.y = v91;
    v102.size.width = v93;
    v102.size.height = v25;
    v16 = CGRectGetWidth(v102);
  }
LABEL_44:
  v87 = MinX;
  v88 = v14;
  v89 = v16;
  v90 = v18;
  result.size.height = v90;
  result.size.width = v89;
  result.origin.y = v88;
  result.origin.x = v87;
  return result;
}

- (CGRect)_quickActionsFrameWithMinX:(double)a3 boundingRect:(CGRect)a4
{
  CGFloat y;
  CGFloat x;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat width;
  CGFloat height;
  CGRect v25;
  CGRect result;

  width = a4.size.width;
  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  +[CSProminentButtonsView _buttonOutsets](CSProminentButtonsView, "_buttonOutsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  +[CSProminentButtonsView _buttonDiameter](CSProminentButtonsView, "_buttonDiameter");
  v15 = v14;
  +[CSProminentButtonsView _buttonInsetY](CSProminentButtonsView, "_buttonInsetY");
  v17 = v16;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v18 = CGRectGetHeight(v25) - v17 - (v7 + v15);
  v19 = v13 + v9 + v15;
  v20 = v11 + v7 + v15;
  v21 = a3;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v21;
  return result;
}

- (CGRect)_quickActionsLeadingFrameWithBoundingRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[CSProminentButtonsView _buttonInsetX](CSProminentButtonsView, "_buttonInsetX");
  v9 = v8;
  +[CSProminentButtonsView _leadingOutset](CSProminentButtonsView, "_leadingOutset");
  -[CSProminentLayoutController _quickActionsFrameWithMinX:boundingRect:](self, "_quickActionsFrameWithMinX:boundingRect:", v9 - v10, x, y, width, height);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_quickActionsTrailingFrameWithBoundingRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetWidth(a3);
  +[CSProminentButtonsView _buttonInsetX](CSProminentButtonsView, "_buttonInsetX");
  v10 = v8 - v9;
  +[CSProminentButtonsView _buttonDiameter](CSProminentButtonsView, "_buttonDiameter");
  v12 = v11;
  +[CSProminentButtonsView _leadingOutset](CSProminentButtonsView, "_leadingOutset");
  -[CSProminentLayoutController _quickActionsFrameWithMinX:boundingRect:](self, "_quickActionsFrameWithMinX:boundingRect:", v10 - (v12 + v13), x, y, width, height);
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (double)_landscapeReductionFactor
{
  _BOOL4 v2;
  double result;

  v2 = +[CSDeviceDetermination isCategoryPad:](CSDeviceDetermination, "isCategoryPad:", +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory"));
  result = 0.7;
  if (v2)
    return 1.0;
  return result;
}

+ (double)fontSizeForElementType:(unint64_t)a3 isLandscapeVariant:(BOOL)a4
{
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double result;

  if (a3 == 4 || a3 == 2)
  {
    objc_msgSend(a1, "subtitleElementFontSize");
  }
  else if (a3 == 1)
  {
    v5 = a4;
    objc_msgSend(a1, "timeElementFontSize");
    v7 = v6;
    v8 = 1.0;
    if (v5)
      objc_msgSend(a1, "_landscapeReductionFactor", 1.0);
    return round(v7 * v8);
  }
  else
  {
    return 0.0;
  }
  return result;
}

+ (double)fontWeightForElementType:(unint64_t)a3
{
  double *v3;
  double result;

  if ((uint64_t)a3 > 31)
  {
    if (a3 - 63 < 2 || a3 == 32 || a3 == 128)
    {
LABEL_9:
      v3 = (double *)MEMORY[0x1E0DC1440];
      return *v3;
    }
  }
  else
  {
    switch(a3)
    {
      case 0xFFFFFFFFFFFFFFFFLL:
      case 0uLL:
      case 8uLL:
        goto LABEL_9;
      case 1uLL:
        v3 = (double *)MEMORY[0x1E0DC1448];
        return *v3;
      case 2uLL:
      case 4uLL:
        v3 = (double *)MEMORY[0x1E0DC1438];
        return *v3;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return result;
      default:
        if (a3 == 16)
          goto LABEL_9;
        break;
    }
  }
  return result;
}

+ (double)fontWeightForElementType:(unint64_t)a3 familyName:(id)a4
{
  double v4;
  id v6;
  void *v7;
  double *v8;

  v6 = a4;
  v7 = v6;
  if ((uint64_t)a3 > 31)
  {
    if (a3 - 63 < 2 || a3 == 32 || a3 == 128)
    {
LABEL_9:
      v8 = (double *)MEMORY[0x1E0DC1440];
LABEL_10:
      v4 = *v8;
    }
  }
  else
  {
    switch(a3)
    {
      case 0xFFFFFFFFFFFFFFFFLL:
      case 0uLL:
      case 8uLL:
        goto LABEL_9;
      case 1uLL:
        if (objc_msgSend(v6, "containsString:", CFSTR("Rail")))
          v8 = (double *)MEMORY[0x1E0DC1420];
        else
          v8 = (double *)MEMORY[0x1E0DC1448];
        goto LABEL_10;
      case 2uLL:
      case 4uLL:
        v8 = (double *)MEMORY[0x1E0DC1438];
        goto LABEL_10;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      default:
        if (a3 == 16)
          goto LABEL_9;
        break;
    }
  }

  return v4;
}

+ (double)timeElementFontSize
{
  unint64_t v2;

  v2 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  if (v2 - 2 > 0x1D)
    return 84.0;
  else
    return dbl_1A9D46D80[v2 - 2];
}

+ (double)subtitleElementFontSize
{
  _BOOL4 v2;
  double result;

  v2 = +[CSDeviceDetermination isCategoryPhone:](CSDeviceDetermination, "isCategoryPhone:", +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory"));
  result = 23.0;
  if (v2)
    return 22.0;
  return result;
}

+ (double)timeElementBoundingHeight
{
  unint64_t v2;

  v2 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  if (v2 - 2 > 0x1D)
    return 100.0;
  else
    return dbl_1A9D46E70[v2 - 2];
}

+ (double)timeTightBoundingHeight
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(a1, "timeElementFontSize");
  v4 = v3;
  objc_msgSend(a1, "fontWeightForElementType:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "capHeight");
  v8 = v7;

  return v8;
}

+ (double)timeElementBoundingTopY
{
  unint64_t v3;
  double result;
  double v5;
  double v6;
  uint64_t v7;

  v3 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  result = 72.0;
  switch(v3)
  {
    case 0uLL:
    case 1uLL:
    case 0xCuLL:
    case 0xEuLL:
      return result;
    case 2uLL:
      return 71.0;
    case 3uLL:
      return 90.0;
    case 4uLL:
    case 8uLL:
    case 9uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", v3, 72.0);
      v6 = 55.0;
      goto LABEL_19;
    case 5uLL:
    case 7uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", v3, 72.0);
      v7 = 0x4051000000000000;
      goto LABEL_15;
    case 6uLL:
      return 101.0;
    case 0xAuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 10, 72.0);
      v7 = 0x404D000000000000;
      goto LABEL_15;
    case 0xBuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 11, 72.0);
      v6 = 65.0;
      goto LABEL_19;
    case 0xDuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 13, 72.0);
      v6 = 48.666666;
      goto LABEL_19;
    case 0xFuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 15, 72.0);
      v7 = 0x404A000000000000;
LABEL_15:
      v6 = *(double *)&v7;
      goto LABEL_19;
    case 0x10uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 16, 72.0);
      v6 = 70.0;
      goto LABEL_19;
    case 0x11uLL:
    case 0x13uLL:
      return 77.0;
    case 0x12uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 18, 72.0);
      v6 = 40.33333;
      goto LABEL_19;
    case 0x14uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 20, 72.0);
      v6 = 47.33333;
LABEL_19:
      result = v5 + v6;
      break;
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1FuLL:
      result = 122.0;
      break;
    case 0x18uLL:
    case 0x1DuLL:
    case 0x1EuLL:
      result = 134.0;
      break;
    default:
      result = 84.0;
      break;
  }
  return result;
}

+ (double)landscapePadTimeElementBoundingTopY
{
  unint64_t v3;
  double result;

  v3 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory") - 21;
  if (v3 < 0xB)
    return dbl_1A9D46F60[v3];
  objc_msgSend(a1, "timeElementBoundingTopY");
  return result;
}

- (double)padTimeElementBoundingWidth
{
  unint64_t v3;
  double result;
  _BOOL4 v5;
  double *v6;

  v3 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  result = 594.0;
  if (v3 <= 0x1F)
  {
    if (((1 << v3) & 0x9EE00000) != 0)
    {
      switch(self->_numberingSystem)
      {
        case 2:
          v5 = !self->_fourDigitTime;
          v6 = (double *)&unk_1A9D474E0;
          break;
        case 4:
          v5 = !self->_fourDigitTime;
          v6 = (double *)&unk_1A9D474D0;
          break;
        default:
          v5 = !self->_fourDigitTime;
          v6 = (double *)&unk_1A9D474F0;
          break;
      }
      return v6[v5];
    }
    else if (((1 << v3) & 0x61000000) != 0)
    {
      switch(self->_numberingSystem)
      {
        case 2:
          v5 = !self->_fourDigitTime;
          v6 = (double *)&unk_1A9D47500;
          return v6[v5];
        case 4:
          result = 594.0;
          if (!self->_fourDigitTime)
            result = 464.0;
          break;
        default:
          v5 = !self->_fourDigitTime;
          v6 = (double *)&unk_1A9D47510;
          return v6[v5];
      }
    }
  }
  return result;
}

- (double)subtitleElementBoundingHeight
{
  return 36.0;
}

- (double)subtitleElementEditingOffset
{
  unint64_t v2;
  double result;

  v2 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  result = -10.0;
  if (v2 <= 0x14)
    return dbl_1A9D46FB8[v2];
  return result;
}

+ (double)subtitleElementBoundingTopY
{
  unint64_t v3;
  double result;
  double v5;
  uint64_t v6;
  double v7;
  double v8;

  v3 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  result = 45.0;
  switch(v3)
  {
    case 0uLL:
    case 1uLL:
    case 0xCuLL:
    case 0xEuLL:
      return result;
    case 2uLL:
      v7 = 48.0;
      goto LABEL_9;
    case 3uLL:
      return 66.0;
    case 4uLL:
    case 6uLL:
    case 8uLL:
    case 9uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", v3, 45.0);
      *(double *)&v6 = 32.0;
      goto LABEL_13;
    case 5uLL:
    case 7uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", v3, 45.0);
      v8 = 47.0;
      goto LABEL_14;
    case 0xAuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 10, 45.0);
      v8 = 35.0;
      goto LABEL_14;
    case 0xBuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 11, 45.0);
      *(double *)&v6 = 42.0;
LABEL_13:
      v8 = *(double *)&v6;
      goto LABEL_14;
    case 0xDuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 13, 45.0);
      v8 = 24.0;
      goto LABEL_14;
    case 0xFuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 15, 45.0);
      v8 = 27.0;
      goto LABEL_14;
    case 0x10uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 16, 45.0);
      v8 = 49.0;
      goto LABEL_14;
    case 0x11uLL:
    case 0x13uLL:
      return 59.0;
    case 0x12uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 18, 45.0);
      v8 = 21.666666;
      goto LABEL_14;
    case 0x14uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 20, 45.0);
      v8 = 26.0;
LABEL_14:
      result = v5 + v8;
      break;
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1FuLL:
      result = 85.0;
      break;
    case 0x18uLL:
    case 0x1DuLL:
    case 0x1EuLL:
      v7 = 96.0;
LABEL_9:
      result = v7;
      break;
    default:
      result = 79.0;
      break;
  }
  return result;
}

+ (double)landscapePadSubtitleElementBoundingTopY
{
  unint64_t v3;
  double result;

  v3 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory") - 21;
  if (v3 < 0xB)
    return dbl_1A9D47060[v3];
  objc_msgSend(a1, "subtitleElementBoundingTopY");
  return result;
}

- (CGRect)editingReticleFrameForElement:(unint64_t)a3 withBoundingRect:(CGRect)result
{
  double v4;
  double v5;
  double v6;

  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 <= 62)
    {
      if (a3 == 16)
      {
        -[CSProminentLayoutController complicationSidebarElementEditingReticleFrameWithBoundingRect:](self, "complicationSidebarElementEditingReticleFrameWithBoundingRect:", result.origin.x, result.origin.y, result.size.width, result.size.height);
        goto LABEL_16;
      }
      if (a3 != 32)
        goto LABEL_17;
    }
    else if (a3 != 63)
    {
      if (a3 == 64)
      {
        -[CSProminentLayoutController _quickActionLeadingElementEditingReticleFrameWithBoundingRect:](self, "_quickActionLeadingElementEditingReticleFrameWithBoundingRect:", result.origin.x, result.origin.y, result.size.width, result.size.height);
      }
      else
      {
        if (a3 != 128)
          goto LABEL_17;
        -[CSProminentLayoutController _quickActionTrailingElementEditingReticleFrameWithBoundingRect:](self, "_quickActionTrailingElementEditingReticleFrameWithBoundingRect:", result.origin.x, result.origin.y, result.size.width, result.size.height);
      }
LABEL_16:
      v4 = v5;
      goto LABEL_17;
    }
LABEL_11:
    result.origin.x = *(CGFloat *)MEMORY[0x1E0C9D628];
    result.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D628] + 8);
    result.size.width = *(CGFloat *)(MEMORY[0x1E0C9D628] + 16);
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    goto LABEL_17;
  }
  switch(a3)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
    case 0uLL:
      goto LABEL_11;
    case 1uLL:
      -[CSProminentLayoutController timeElementEditingReticleFrameWithBoundingRect:](self, "timeElementEditingReticleFrameWithBoundingRect:", result.origin.x, result.origin.y, result.size.width, result.size.height);
      goto LABEL_16;
    case 2uLL:
    case 4uLL:
      -[CSProminentLayoutController subtitleElementEditingReticleFrameWithBoundingRect:](self, "subtitleElementEditingReticleFrameWithBoundingRect:", result.origin.x, result.origin.y, result.size.width, result.size.height);
      goto LABEL_16;
    case 8uLL:
      -[CSProminentLayoutController complicationRowElementEditingReticleFrameWithBoundingRect:](self, "complicationRowElementEditingReticleFrameWithBoundingRect:", result.origin.x, result.origin.y, result.size.width, result.size.height);
      goto LABEL_16;
    default:
      break;
  }
LABEL_17:
  v6 = v4;
  result.size.height = v6;
  return result;
}

- (CGRect)timeElementEditingReticleFrameWithBoundingRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  int v13;
  double Width;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGRect v20;
  CGRect v21;

  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", 1, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "deviceClass");

  if (v13 == 2)
  {
    v20.origin.x = v5;
    v20.origin.y = v7;
    v20.size.width = v9;
    v20.size.height = v11;
    Width = CGRectGetWidth(v20);
    -[CSProminentLayoutController padTimeElementBoundingWidth](self, "padTimeElementBoundingWidth");
    v16 = (Width - v15) * 0.5;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "reticlePortraitLayoutInset");
    v16 = v17 - v5;
  }
  objc_msgSend((id)objc_opt_class(), "timeElementReticleInset");
  v19 = v18;
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  return CGRectInset(v21, v16, v19);
}

- (CGRect)subtitleElementEditingReticleFrameWithBoundingRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  double Width;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;

  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", 2, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "deviceClass") == 2)
    v13 = 40.0;
  else
    v13 = 32.0;

  -[CSProminentLayoutController subtitleElementBoundingHeight](self, "subtitleElementBoundingHeight");
  v15 = v13 - v14;
  v16 = v11 + v15;
  v17 = v7 + v15 * -0.5;
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "deviceClass");

  if (v19 == 2)
  {
    v24.origin.x = v5;
    v24.origin.y = v17;
    v24.size.width = v9;
    v24.size.height = v16;
    Width = CGRectGetWidth(v24);
    -[CSProminentLayoutController _padElementWidth](self, "_padElementWidth");
    v22 = (Width - v21) * 0.5;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "reticlePortraitLayoutInset");
    v22 = v23 - v5;
  }
  v25.origin.x = v5;
  v25.origin.y = v17;
  v25.size.width = v9;
  v25.size.height = v16;
  return CGRectInset(v25, v22, 0.0);
}

- (CGRect)complicationRowElementEditingReticleFrameWithBoundingRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  int v13;
  double Width;
  double v15;
  double v16;
  double Height;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;

  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", 8, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "deviceClass");

  if (v13 == 2)
  {
    v28.origin.x = v5;
    v28.origin.y = v7;
    v28.size.width = v9;
    v28.size.height = v11;
    Width = CGRectGetWidth(v28);
    -[CSProminentLayoutController _padElementWidth](self, "_padElementWidth");
    v16 = (Width - v15) * 0.5;
    v29.origin.x = v5;
    v29.origin.y = v7;
    v29.size.width = v9;
    v29.size.height = v11;
    Height = CGRectGetHeight(v29);
    objc_msgSend((id)objc_opt_class(), "complicationElementBoundingHeight");
    v19 = (Height - v18) * 0.5;
    objc_msgSend((id)objc_opt_class(), "complicationElementEditingReticleInset");
    v21 = v19 - v20;
    v22 = v5;
    v23 = v7;
    v24 = v9;
    v25 = v11;
    v26 = v16;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "reticlePortraitLayoutInset");
    v26 = v27 - v5;
    v22 = v5;
    v23 = v7;
    v24 = v9;
    v25 = v11;
    v21 = v26;
  }
  return CGRectInset(*(CGRect *)&v22, v26, v21);
}

- (CGRect)complicationSidebarElementEditingReticleFrameWithBoundingRect:(CGRect)a3
{
  CGRect v3;

  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", 16, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectInset(v3, -8.0, -8.0);
}

- (CGRect)_quickActionLeadingElementEditingReticleFrameWithBoundingRect:(CGRect)a3
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGRect v13;

  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", 64, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[CSProminentButtonsView _reticleOutset](CSProminentButtonsView, "_reticleOutset");
  v12 = v11;
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  return CGRectInset(v13, v12, v12);
}

- (CGRect)_quickActionTrailingElementEditingReticleFrameWithBoundingRect:(CGRect)a3
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGRect v13;

  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", 128, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[CSProminentButtonsView _reticleOutset](CSProminentButtonsView, "_reticleOutset");
  v12 = v11;
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  return CGRectInset(v13, v12, v12);
}

+ (double)timeElementReticleInset
{
  unint64_t v2;
  double result;

  v2 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  result = 11.0;
  if (v2 - 2 <= 0x1D)
    return dbl_1A9D470B8[v2 - 2];
  return result;
}

+ (double)complicationElementEditingReticleInset
{
  void *v2;
  int v3;
  double result;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceClass");

  result = 0.0;
  if (v3 == 2)
    return 14.0;
  return result;
}

+ (double)reticleSpacing
{
  unint64_t v2;
  double result;

  v2 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  result = 5.0;
  if (v2 - 2 <= 0x12)
    return dbl_1A9D471A8[v2 - 2];
  return result;
}

+ (double)_safeAreaTopInset:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 - 3 <= 0x11)
    return dbl_1A9D47240[a3 - 3];
  return result;
}

+ (double)reticlePortraitLayoutInset
{
  double v3;
  double result;

  +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  objc_msgSend(a1, "leadingPortraitLayoutInset");
  result = v3 + -9.0;
  if (result < 0.0)
    return 0.0;
  return result;
}

+ (double)leadingLandscapeLayoutInset
{
  unint64_t v2;
  double result;

  v2 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  result = 0.0;
  if (v2 <= 0x14)
    return dbl_1A9D472D0[v2];
  return result;
}

+ (double)leadingPortraitLayoutInset
{
  unint64_t v2;
  double result;

  v2 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  result = 0.0;
  if (v2 <= 0x14)
    return dbl_1A9D47378[v2];
  return result;
}

- (double)leadingPortraitLayoutInset
{
  double result;

  objc_msgSend((id)objc_opt_class(), "leadingPortraitLayoutInset");
  return result;
}

- (double)leadingLandscapeLayoutInset
{
  double result;

  objc_msgSend((id)objc_opt_class(), "leadingLandscapeLayoutInset");
  return result;
}

- (double)_padElementWidth
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  BOOL v11;
  double result;

  +[CSGraphicComplicationLayoutProvider gridUnitSize](CSGraphicComplicationLayoutProvider, "gridUnitSize");
  v3 = v2;
  +[CSGraphicComplicationLayoutProvider complicationEdgeInset](CSGraphicComplicationLayoutProvider, "complicationEdgeInset");
  v5 = v4;
  +[CSGraphicComplicationLayoutProvider interComplicationSpacingExcludingInnerInset](CSGraphicComplicationLayoutProvider, "interComplicationSpacingExcludingInnerInset");
  v7 = v6;
  +[CSGraphicComplicationLayoutProvider complicationEdgeInset](CSGraphicComplicationLayoutProvider, "complicationEdgeInset");
  v9 = v8;
  v10 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  v11 = v10 == 29 || v10 == 24;
  result = 388.0;
  if (v11)
    result = 390.0;
  if ((v3 + v5 * 2.0) * (double)4 + v7 * (double)3 + v9 + v9 >= result)
    return (v3 + v5 * 2.0) * (double)4 + v7 * (double)3 + v9 + v9;
  return result;
}

- (BOOL)_isPortraitForBoundingRect:(CGRect)a3
{
  return a3.size.height >= a3.size.width;
}

- (BOOL)shouldCenterElementsInBoundingRect:(CGRect)a3
{
  BOOL v3;
  void *v4;
  int v5;

  v3 = -[CSProminentLayoutController _isPortraitForBoundingRect:](self, "_isPortraitForBoundingRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceClass");

  return v5 == 2 || v3;
}

- (CGRect)elementHorizontalFrameInBoundingRect:(CGRect)a3 forElementType:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect v37;
  CGRect v38;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CSProminentLayoutController traitEnvironment](self, "traitEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSProminentLayoutController leadingPortraitLayoutInset](self, "leadingPortraitLayoutInset");
  v13 = v12;
  -[CSProminentLayoutController leadingLandscapeLayoutInset](self, "leadingLandscapeLayoutInset");
  v15 = v14;
  if (-[CSProminentLayoutController shouldCenterElementsInBoundingRect:](self, "shouldCenterElementsInBoundingRect:", x, y, width, height))
  {
    objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "deviceClass");

    if (v17 == 2)
    {
      if (a4 == 1)
      {
        -[CSProminentLayoutController padTimeElementBoundingWidth](self, "padTimeElementBoundingWidth");
        v19 = (width - v18) * 0.5;
      }
      else
      {
        -[CSProminentLayoutController _padElementWidth](self, "_padElementWidth");
        v32 = width - (v31 + -16.0);
        if (v32 >= 0.0)
          v19 = v32 * 0.5;
        else
          v19 = 0.0;
      }
      v27 = x;
      v28 = y;
      v29 = width;
      v30 = height;
    }
    else
    {
      v27 = x;
      v28 = y;
      v29 = width;
      v30 = height;
      v19 = v13;
    }
    v38 = CGRectInset(*(CGRect *)&v27, v19, 0.0);
    v24 = v38.origin.x;
    v25 = v38.origin.y;
    v20 = v38.size.width;
    v26 = v38.size.height;
  }
  else
  {
    objc_msgSend(v11, "layoutDirection");
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v20 = CGRectGetWidth(v37) / 3.0 - v15;
    -[CSProminentLayoutController traitEnvironment](self, "traitEnvironment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "displayScale");

    UIRoundToScale();
    v24 = v23;
    v25 = 0.0;
    v26 = 0.0;
  }

  v33 = v24;
  v34 = v25;
  v35 = v20;
  v36 = v26;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

+ (double)complicationElementBoundingHeight
{
  double result;

  +[CSGraphicComplicationLayoutProvider complicationContainerHeight](CSGraphicComplicationLayoutProvider, "complicationContainerHeight");
  return result;
}

+ (double)complicationElementEditingOffset
{
  unint64_t v2;
  double result;

  v2 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  result = 10.0;
  if (v2 <= 0x14)
    return dbl_1A9D47420[v2];
  return result;
}

+ (double)complicationElementBoundingTopY
{
  unint64_t v3;
  double result;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  result = 173.0;
  switch(v3)
  {
    case 0uLL:
    case 0xCuLL:
      return result;
    case 1uLL:
      return 170.0;
    case 2uLL:
      return 188.0;
    case 3uLL:
      return 190.0;
    case 4uLL:
    case 9uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", v3, 173.0);
      v9 = 172.0;
      goto LABEL_20;
    case 5uLL:
    case 7uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", v3, 173.0);
      v9 = 192.0;
      goto LABEL_20;
    case 6uLL:
      return 214.0;
    case 8uLL:
      return 219.0;
    case 0xAuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 10, 173.0);
      v9 = 175.0;
      goto LABEL_20;
    case 0xBuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 11, 173.0);
      v9 = 182.0;
      goto LABEL_20;
    case 0xDuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 13, 173.0);
      v9 = 164.0;
      goto LABEL_20;
    case 0xEuLL:
      return 175.0;
    case 0xFuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 15, 173.0);
      v9 = 167.0;
      goto LABEL_20;
    case 0x10uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 16, 173.0);
      v9 = 194.0;
      goto LABEL_20;
    case 0x11uLL:
      return 194.0;
    case 0x12uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 18, 173.0);
      v9 = 162.0;
      goto LABEL_20;
    case 0x13uLL:
      v10 = 200.0;
      goto LABEL_23;
    case 0x14uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 20, 173.0);
      v9 = 170.0;
LABEL_20:
      result = v8 + v9;
      break;
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
      objc_msgSend(a1, "timeElementBoundingTopY", v3, 173.0);
      v6 = v5 + 13.0;
      objc_msgSend(a1, "timeElementBoundingHeight");
      result = v6 + v7;
      break;
    default:
      v10 = 84.0;
LABEL_23:
      result = v10;
      break;
  }
  return result;
}

- (UITraitEnvironment)traitEnvironment
{
  return (UITraitEnvironment *)objc_loadWeakRetained((id *)&self->_traitEnvironment);
}

- (void)setTraitEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_traitEnvironment, a3);
}

- (BOOL)fourDigitTime
{
  return self->_fourDigitTime;
}

- (int64_t)numberingSystem
{
  return self->_numberingSystem;
}

- (void)setNumberingSystem:(int64_t)a3
{
  self->_numberingSystem = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_traitEnvironment);
}

@end
