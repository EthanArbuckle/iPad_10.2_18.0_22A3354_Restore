@implementation HKGraphRenderView

- (HKGraphRenderView)initWithFrame:(CGRect)a3
{
  char *v3;
  HKGraphRenderView *v4;
  __int128 v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKGraphRenderView;
  v3 = -[HKGraphRenderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (HKGraphRenderView *)v3;
  if (v3)
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v3 + 424) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v3 + 440) = v5;
    objc_msgSend(v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDrawsAsynchronously:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphRenderView setBackgroundColor:](v4, "setBackgroundColor:", v7);

  }
  return v4;
}

- (void)drawPath:(id)a3 strokeColor:(id)a4 fillColor:(id)a5 markerImage:(id)a6 useGradientFill:(BOOL)a7 blendMode:(int)a8 clipToAxes:(BOOL)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  const __CFArray *v22;
  CGGradient *v23;
  CGContext *v24;
  double v25;
  double v26;
  double v27;
  CGColorSpace *space;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  CGContextRef CurrentContext;
  _QWORD v40[3];
  CGPoint v41;

  v10 = a7;
  v40[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  CurrentContext = 0;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState((CGContextRef)v37[3]);
  if (a9 && !CGRectEqualToRect(self->_axisRect, *MEMORY[0x1E0C9D628]))
    CGContextClipToRect((CGContextRef)v37[3], self->_axisRect);
  if (a8)
    CGContextSetBlendMode((CGContextRef)v37[3], (CGBlendMode)a8);
  if (v16)
  {
    objc_msgSend(v16, "setStroke");
    objc_msgSend(v15, "stroke");
  }
  if (v17)
  {
    objc_msgSend(v15, "addClip");
    if (v10)
    {
      space = CGColorSpaceCreateDeviceRGB();
      objc_msgSend(v17, "colorWithAlphaComponent:", 0.5);
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v40[0] = objc_msgSend(v19, "CGColor");
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "colorWithAlphaComponent:", 0.5);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v40[1] = objc_msgSend(v21, "CGColor");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
      v22 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
      v23 = CGGradientCreateWithColors(space, v22, 0);

      v24 = (CGContext *)v37[3];
      -[HKGraphRenderView bounds](self, "bounds");
      v41.y = v25 * 0.5;
      v41.x = 0.0;
      CGContextDrawLinearGradient(v24, v23, v41, *MEMORY[0x1E0C9D538], 3u);
      CGColorSpaceRelease(space);
      CGGradientRelease(v23);
    }
    else
    {
      objc_msgSend(v17, "setFill");
      objc_msgSend(v15, "fill");
    }
  }
  if (v18)
  {
    objc_msgSend(v18, "size");
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __101__HKGraphRenderView_drawPath_strokeColor_fillColor_markerImage_useGradientFill_blendMode_clipToAxes___block_invoke;
    v29[3] = &unk_1E9C45C78;
    v31 = &v36;
    v32 = v26 * -0.5;
    v33 = v27 * -0.5;
    v34 = v26;
    v35 = v27;
    v30 = v18;
    objc_msgSend(v15, "hk_applyBlock:", v29);

  }
  CGContextRestoreGState((CGContextRef)v37[3]);
  _Block_object_dispose(&v36, 8);

}

void __101__HKGraphRenderView_drawPath_strokeColor_fillColor_markerImage_useGradientFill_blendMode_clipToAxes___block_invoke(uint64_t a1, int a2, CGFloat a3, CGFloat a4)
{
  CGContext *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGImage *v10;
  CGRect v11;
  CGRect v12;

  if (a2 != 4)
  {
    v5 = *(CGContext **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v11 = CGRectOffset(*(CGRect *)(a1 + 48), a3, a4);
    x = v11.origin.x;
    y = v11.origin.y;
    width = v11.size.width;
    height = v11.size.height;
    v10 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage");
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    CGContextDrawImage(v5, v12, v10);
  }
}

- (void)fillRect:(CGRect)a3 withFillStyle:(id)a4 axisRect:(CGRect)a5 alpha:(double)a6
{
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGContextRef CurrentContext;
  id v15;
  double height;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v13 = a4;
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v12, v11, v10, v9);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "renderPath:context:axisRect:alpha:", objc_msgSend(v15, "CGPath"), CurrentContext, x, y, width, height, a6);

}

- (CGSize)drawText:(id)a3 atPoint:(CGPoint)a4 spaceAvailable:(id)a5 horizontalAlignment:(int64_t)a6 verticalAlignment:(int64_t)a7 hyphenationFactor:(id)a8 textColor:(id)a9 font:(id)a10 clipToAxis:(BOOL)a11 exclusion:(id)a12 isSystemSymbol:(BOOL)a13 isTallText:(BOOL)a14
{
  double y;
  double x;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  BOOL v40;
  double v41;
  double v42;
  CGContext *CurrentContext;
  double v44;
  double v45;
  uint64_t v47;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[3];
  _QWORD v54[5];
  CGSize result;

  y = a4.y;
  x = a4.x;
  v54[3] = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v52 = a5;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a12;
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setAlignment:", a6);
  if (v21)
  {
    objc_msgSend(v21, "floatValue");
    objc_msgSend(v25, "setHyphenationFactor:");
  }
  v50 = v22;
  v51 = v21;
  v49 = v23;
  if (a13)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v23, -1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v20, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "imageWithTintColor:", v22);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(v29, "setImage:", v28);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v29);
    v30 = v20;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E9C4C428);
    objc_msgSend(v32, "appendAttributedString:", v31);
    v33 = (void *)objc_msgSend(v32, "copy");

    v20 = v30;
  }
  else
  {
    v34 = *MEMORY[0x1E0DC1140];
    v53[0] = *MEMORY[0x1E0DC1138];
    v53[1] = v34;
    v54[0] = v23;
    v54[1] = v22;
    v53[2] = *MEMORY[0x1E0DC1178];
    v54[2] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v20, v26);
  }

  if (v52)
  {
    objc_msgSend(v52, "doubleValue");
    v36 = v35;
  }
  else
  {
    v36 = 1.79769313e308;
  }
  objc_msgSend(v33, "size", self);
  v39 = v38;
  if (v37 <= v36)
  {
    v36 = v37;
  }
  else
  {
    v40 = v37 < floor(v36 + v36);
    v41 = 3.0;
    if (v40)
      v41 = 2.0;
    v39 = v38 * v41;
  }
  if (a6 == 1)
  {
    x = x + v36 * -0.5;
  }
  else if (a6 == 2)
  {
    x = x - v36;
  }
  if (a7 == 3)
  {
    v42 = 0.0;
    if (a14)
      v42 = 2.0;
    y = y - (v42 + v39);
    if (!v24)
      goto LABEL_28;
  }
  else
  {
    if (a7 == 2)
      y = y + v39 * -0.5;
    if (!v24)
      goto LABEL_28;
  }
  if (objc_msgSend(v24, "excludeRect:", x, y, v36, v39))
  {
    v36 = *MEMORY[0x1E0C9D820];
    v39 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_31;
  }
LABEL_28:
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  if (a11)
  {
    CGContextAddRect(CurrentContext, *(CGRect *)(v47 + 424));
    CGContextClip(CurrentContext);
  }
  objc_msgSend(v33, "drawInRect:", x, y, v36, v39);
  CGContextRestoreGState(CurrentContext);
LABEL_31:

  v44 = v36;
  v45 = v39;
  result.height = v45;
  result.width = v44;
  return result;
}

- (CGSize)drawAttributedText:(id)a3 atPoint:(CGPoint)a4 axisRect:(CGRect)a5 horizontalAlignment:(int64_t)a6 verticalAlignment:(int64_t)a7 exclusion:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  double v15;
  double v16;
  id v18;
  id v19;
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
  double v32;
  double v33;
  double v34;
  double v35;
  CGContext *CurrentContext;
  double v37;
  double v38;
  CGSize result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a4.y;
  v16 = a4.x;
  v18 = a3;
  v19 = a8;
  objc_msgSend(v18, "size");
  v21 = v20;
  v23 = v22;
  v24 = v16 + v20 * -0.5;
  v25 = v16 - v21;
  if (a6 != 2)
    v25 = v16;
  if (a6 == 1)
    v26 = v24;
  else
    v26 = v25;
  v27 = v23 * 0.5;
  v28 = v27 + v27;
  v29 = v15 - v23 * 0.5;
  if (a7 == 2)
  {
    v30 = 0.0;
  }
  else
  {
    v29 = v15;
    v30 = v23 * 0.5;
  }
  if (a7 == 2)
    v31 = v27 + v27;
  else
    v31 = v23 * 0.5;
  if (a7 == 3)
    v32 = v15 - (v27 + v27);
  else
    v32 = v29;
  if (a7 == 3)
  {
    v33 = 0.0;
  }
  else
  {
    v28 = v30;
    v33 = v31;
  }
  -[HKGraphRenderView _verticalPosition:withTopMargin:bottomMargin:boundedByAxisRect:](self, "_verticalPosition:withTopMargin:bottomMargin:boundedByAxisRect:", v32, v28, v33, x, y, width, height);
  v35 = v34;
  -[HKGraphRenderView _tightBoundingRectForText:inTextRect:axisRect:](self, "_tightBoundingRectForText:inTextRect:axisRect:", v18, v26, v34, v21, v23, x, y, width, height);
  if (v19 && objc_msgSend(v19, "excludeRect:"))
  {
    v21 = *MEMORY[0x1E0C9D820];
    v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    objc_msgSend(v18, "drawInRect:", v26, v35, v21, v23);
    CGContextRestoreGState(CurrentContext);
  }

  v37 = v21;
  v38 = v23;
  result.height = v38;
  result.width = v37;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContext *CurrentContext;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  -[HKGraphRenderView renderDelegate](self, "renderDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "graphRenderer:shouldRenderSceneWithContext:chartRect:", self, CurrentContext, x, y, width, height);

  CGContextRestoreGState(CurrentContext);
}

- (double)_verticalPosition:(double)a3 withTopMargin:(double)a4 bottomMargin:(double)a5 boundedByAxisRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v13;
  double MaxY;
  double v15;
  CGRect v17;
  CGRect v18;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  if (!CGRectIsNull(a6))
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v13 = a4 - a3 - CGRectGetMinY(v17);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    MaxY = CGRectGetMaxY(v18);
    if (v13 <= 0.0)
    {
      v15 = a5 - MaxY - a3;
      if (v15 > 0.0)
        return a3 - v15;
    }
    else
    {
      return v13 + a3;
    }
  }
  return a3;
}

- (CGRect)_tightBoundingRectForText:(id)a3 inTextRect:(CGRect)a4 axisRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  double v7;
  CGFloat v8;
  CGFloat y;
  double x;
  id v11;
  id v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double MidX;
  double v26;
  double MidY;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat rect_8;
  CGSize v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  v7 = a4.size.height;
  v8 = a4.size.width;
  y = a4.origin.y;
  rect_8 = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v34.width = width;
  v34.height = height;
  UIGraphicsBeginImageContextWithOptions(v34, 1, 0.0);
  v12 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
  objc_msgSend(v12, "setWantsMultilineDeviceMetrics:", 1);
  v13 = y;
  v14 = v8;
  v15 = v8;
  v16 = v7;
  objc_msgSend(v11, "drawWithRect:options:context:", 9, v12, x, v13, v14, v7);

  objc_msgSend(v12, "multilineDeviceMetricsRect");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v35.origin.x = x;
  v35.origin.y = rect_8;
  v35.size.width = v15;
  v35.size.height = v7;
  MidX = CGRectGetMidX(v35);
  v36.origin.x = v18;
  v36.origin.y = v20;
  v36.size.width = v22;
  v36.size.height = v24;
  v26 = MidX - CGRectGetWidth(v36) * 0.5;
  v37.origin.x = x;
  v37.origin.y = rect_8;
  v37.size.width = v15;
  v37.size.height = v16;
  MidY = CGRectGetMidY(v37);
  v38.origin.x = v18;
  v38.origin.y = v20;
  v38.size.width = v22;
  v38.size.height = v24;
  v28 = MidY - CGRectGetHeight(v38) * 0.5;
  UIGraphicsEndImageContext();

  v29 = v26;
  v30 = v28;
  v31 = v22;
  v32 = v24;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (HKGraphRenderDelegate)renderDelegate
{
  return (HKGraphRenderDelegate *)objc_loadWeakRetained((id *)&self->renderDelegate);
}

- (void)setRenderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->renderDelegate, a3);
}

- (CGRect)axisRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_axisRect.origin.x;
  y = self->_axisRect.origin.y;
  width = self->_axisRect.size.width;
  height = self->_axisRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAxisRect:(CGRect)a3
{
  self->_axisRect = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->renderDelegate);
}

@end
