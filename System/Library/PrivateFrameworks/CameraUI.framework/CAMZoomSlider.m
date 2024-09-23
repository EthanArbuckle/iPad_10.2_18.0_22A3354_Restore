@implementation CAMZoomSlider

+ (BOOL)shouldFadeOutZoomSliderForLayoutStyle:(int64_t)a3
{
  return a3 != 1;
}

- (void)_commonCAMZoomSliderInitializationWithLayoutStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  self->_layoutStyle = a3;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomSlider setBackgroundColor:](self, "setBackgroundColor:", v4);

  self->__autozooming = 0;
  self->_minimumAutozooming = 0;
  self->_maximumAutozooming = 0;
  -[CAMZoomSlider _updateForLayoutStyle](self, "_updateForLayoutStyle");
  -[CAMZoomSlider addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel__handleTouchUpInside_, 64);
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "allowHaptics"))
  {
    objc_msgSend(MEMORY[0x1E0DC4140], "sliderConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tweakedConfigurationForCaller:usage:", self, CFSTR("zoomSlider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC4100], "feedbackWithDictionaryRepresentation:", &unk_1EA3B2DB8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractingThresholdFeedback:", v7);

    objc_msgSend(v6, "setUserInteractingThresholdFeedbackUpdateBlock:", &__block_literal_global);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4138]), "initWithConfiguration:", v6);
    objc_msgSend(v8, "_setOutputMode:", 5);
    -[CAMZoomSlider _setEdgeFeedbackGenerator:](self, "_setEdgeFeedbackGenerator:", v8);

  }
}

void __67__CAMZoomSlider__commonCAMZoomSliderInitializationWithLayoutStyle___block_invoke(double a1, uint64_t a2, void *a3)
{
  double v3;
  float v4;
  double v5;
  id v6;

  if (a1 < 0.0)
    a1 = -a1;
  v3 = fmin(a1 * 0.0005, 0.475);
  if (v3 < 0.35)
    v3 = 0.35;
  v4 = v3;
  objc_msgSend(a3, "hapticParameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = v4;
  objc_msgSend(v6, "setVolume:", v5);

}

- (CAMZoomSlider)initWithLayoutStyle:(int64_t)a3
{
  CAMZoomSlider *v4;
  CAMZoomSlider *v5;
  CAMZoomSlider *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMZoomSlider;
  v4 = -[CAMZoomSlider initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[CAMZoomSlider _commonCAMZoomSliderInitializationWithLayoutStyle:](v4, "_commonCAMZoomSliderInitializationWithLayoutStyle:", a3);
    v6 = v5;
  }

  return v5;
}

- (CAMZoomSlider)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMZoomSlider initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (CAMZoomSlider)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMZoomSlider initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (void)dealloc
{
  NSTimer *visibilityTimer;
  objc_super v4;

  -[NSTimer invalidate](self->__visibilityTimer, "invalidate");
  visibilityTimer = self->__visibilityTimer;
  self->__visibilityTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)CAMZoomSlider;
  -[CAMZoomSlider dealloc](&v4, sel_dealloc);
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[CAMZoomSlider thumbImageForState:](self, "thumbImageForState:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DC55F0];
  objc_msgSend(v2, "size");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
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
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  UIView *minTrackMaskView;
  id v24;
  UIView *v25;
  UIView *v26;
  void *v27;
  void *v28;
  void *v29;
  UIView *maxTrackMaskView;
  id v31;
  UIView *v32;
  UIView *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
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
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  uint64_t v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  objc_super v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v95.receiver = self;
  v95.super_class = (Class)CAMZoomSlider;
  -[CAMZoomSlider layoutSubviews](&v95, sel_layoutSubviews);
  -[CAMZoomSlider bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMZoomSlider trackRectForBounds:](self, "trackRectForBounds:");
  v93 = v11;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = -[CAMZoomSlider _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[CAMZoomSlider value](self, "value");
  v20 = v19;
  -[CAMZoomSlider _minTrackView](self, "_minTrackView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomSlider _maxTrackView](self, "_maxTrackView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    minTrackMaskView = self->__minTrackMaskView;
    if (!minTrackMaskView)
    {
      v24 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v25 = (UIView *)objc_msgSend(v24, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v26 = self->__minTrackMaskView;
      self->__minTrackMaskView = v25;

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->__minTrackMaskView, "setBackgroundColor:", v27);

      minTrackMaskView = self->__minTrackMaskView;
    }
    -[UIView layer](minTrackMaskView, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setMask:", v28);

  }
  if (v22)
  {
    maxTrackMaskView = self->__maxTrackMaskView;
    if (!maxTrackMaskView)
    {
      v31 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v32 = (UIView *)objc_msgSend(v31, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v33 = self->__maxTrackMaskView;
      self->__maxTrackMaskView = v32;

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->__maxTrackMaskView, "setBackgroundColor:", v34);

      maxTrackMaskView = self->__maxTrackMaskView;
    }
    -[UIView layer](maxTrackMaskView, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setMask:", v35);

  }
  LODWORD(v88) = v20;
  -[CAMZoomSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v93, v13, v15, v17, v88);
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  objc_msgSend(v21, "bounds");
  objc_msgSend(v21, "convertRect:toView:", self);
  v46 = v45;
  v92 = v48;
  v94 = v47;
  v89 = v49;
  objc_msgSend(v22, "bounds");
  objc_msgSend(v22, "convertRect:toView:", self);
  v51 = v50;
  v90 = v53;
  v91 = v52;
  v55 = v54;
  v96.origin.x = v38;
  v96.origin.y = v40;
  v96.size.width = v42;
  v96.size.height = v44;
  v56 = CGRectGetMinX(v96) + 1.0;
  v97.origin.x = v38;
  v97.origin.y = v40;
  v97.size.width = v42;
  v97.size.height = v44;
  v57 = CGRectGetMaxX(v97) + -1.0;
  v58 = v46;
  if (v18)
  {
    v60 = v92;
    v59 = v94;
    v61 = v89;
    v62 = v89;
    v63 = v57 - CGRectGetMinX(*(CGRect *)&v58);
    v64 = fmax(v63, 0.0);
    if (v63 <= 0.0)
      v63 = -0.0;
    v46 = v46 + v63;
    v98.origin.x = v51;
    v98.size.height = v90;
    v98.origin.y = v91;
    v98.size.width = v55;
    v65 = fmax(CGRectGetMaxX(v98) - v56, 0.0);
  }
  else
  {
    v67 = v92;
    v66 = v94;
    v61 = v89;
    v68 = v89;
    v64 = fmax(CGRectGetMaxX(*(CGRect *)&v58) - v56, 0.0);
    v99.origin.x = v51;
    v99.size.height = v90;
    v99.origin.y = v91;
    v99.size.width = v55;
    v69 = v57 - CGRectGetMinX(v99);
    v70 = -0.0;
    if (v69 > 0.0)
      v70 = v69;
    v51 = v51 + v70;
    v65 = fmax(v69, 0.0);
  }
  v71 = v55 - v65;
  -[CAMZoomSlider convertRect:toView:](self, "convertRect:toView:", v21, v46, v94, v92 - v64, v61);
  v73 = v72;
  v75 = v74;
  v77 = v76;
  v79 = v78;
  -[CAMZoomSlider convertRect:toView:](self, "convertRect:toView:", v22, v51, v91, v71, v90);
  v81 = v80;
  v83 = v82;
  v85 = v84;
  v87 = v86;
  -[UIView setFrame:](self->__minTrackMaskView, "setFrame:", v73, v75, v77, v79);
  -[UIView setFrame:](self->__maxTrackMaskView, "setFrame:", v81, v83, v85, v87);

}

- (CGRect)minimumValueImageRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
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
  CGRect v30;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CAMZoomSlider minimumValueImage](self, "minimumValueImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v29 = v9;
  v11 = v10;
  -[CAMZoomSlider trackRectForBounds:](self, "trackRectForBounds:", x, y, width, height);
  CGRectGetMidY(v30);
  UIRoundToViewScale();
  v13 = v12;
  -[CAMZoomSlider alignmentRectInsets](self, "alignmentRectInsets");
  v15 = v14;
  v17 = v16;
  v18 = -[CAMZoomSlider _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  if ((v18 & 1) != 0)
  {
    v23 = v29;
    v24 = CGRectGetMaxX(*(CGRect *)&v19) - v29 - v17;
  }
  else
  {
    v24 = v15 + CGRectGetMinX(*(CGRect *)&v19);
    v23 = v29;
  }

  v25 = v24;
  v26 = v13;
  v27 = v23;
  v28 = v11;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)maximumValueImageRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
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
  CGRect v30;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CAMZoomSlider maximumValueImage](self, "maximumValueImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v29 = v9;
  v11 = v10;
  -[CAMZoomSlider trackRectForBounds:](self, "trackRectForBounds:", x, y, width, height);
  CGRectGetMidY(v30);
  UIRoundToViewScale();
  v13 = v12;
  -[CAMZoomSlider alignmentRectInsets](self, "alignmentRectInsets");
  v15 = v14;
  v17 = v16;
  v18 = -[CAMZoomSlider _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  if ((v18 & 1) != 0)
  {
    v23 = v15 + CGRectGetMinX(*(CGRect *)&v19);
    v24 = v29;
  }
  else
  {
    v24 = v29;
    v23 = CGRectGetMaxX(*(CGRect *)&v19) - v29 - v17;
  }

  v25 = v23;
  v26 = v13;
  v27 = v24;
  v28 = v11;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double width;
  double height;
  CGRect v39;
  CGRect result;

  width = a3.size.width;
  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CAMZoomSlider alignmentRectInsets](self, "alignmentRectInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CAMZoomSlider minimumValueImage](self, "minimumValueImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomSlider maximumValueImage](self, "maximumValueImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "size");
  v17 = v16;
  objc_msgSend(v15, "size");
  v19 = v18;
  v20 = -[CAMZoomSlider _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v20)
    v21 = v19;
  else
    v21 = v17;
  if (v20)
    v22 = v17;
  else
    v22 = v19;
  v23 = v9 + v21 + 20.0;
  v24 = x + v23;
  v25 = y + v7;
  v26 = width - (v23 + v13 + v22 + 20.0);
  v27 = height - (v7 + v11);
  -[CAMZoomSlider minimumTrackImageForState:](self, "minimumTrackImageForState:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "size");
  v30 = v29;
  v39.origin.x = v24;
  v39.origin.y = v25;
  v39.size.width = v26;
  v39.size.height = v27;
  CGRectGetMidY(v39);
  UIRoundToViewScale();
  v32 = v31;

  v33 = v24;
  v34 = v32;
  v35 = v26;
  v36 = v30;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double height;
  double width;
  double y;
  double x;
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
  __int128 v25;
  double v26;
  double v27;
  double v28;
  double MidY;
  CGRect v30;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[CAMZoomSlider thumbImageForState:](self, "thumbImageForState:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = v11;
  v14 = v13;
  *(float *)&v11 = a5;
  -[CAMZoomSlider _thumbCenterXForValue:trackRect:](self, "_thumbCenterXForValue:trackRect:", v11, x, y, width, height);
  v16 = v15;
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v28 = v16;
  MidY = CGRectGetMidY(v30);
  v25 = *MEMORY[0x1E0C9D538];
  v26 = v12;
  v27 = v14;
  +[CAMView ceilBounds:andRoundCenter:toViewScale:](CAMView, "ceilBounds:andRoundCenter:toViewScale:", &v25, &v28, self);
  v17 = v26;
  v18 = v27;
  v19 = v28 - v26 * 0.5;
  v20 = MidY - v27 * 0.5;

  v21 = v19;
  v22 = v20;
  v23 = v17;
  v24 = v18;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (double)_thumbCenterXForValue:(float)a3 trackRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[CAMZoomSlider minimumValue](self, "minimumValue");
  v11 = v10;
  -[CAMZoomSlider maximumValue](self, "maximumValue");
  v13 = (float)(a3 - v11) / (float)(v12 - v11);
  if (v13 < 0.0)
    v13 = 0.0;
  if (v13 <= 1.0)
    v14 = v13;
  else
    v14 = 1.0;
  if (-[CAMZoomSlider _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v14 = 1.0 - v14;
  -[CAMZoomSlider _thumbCenterMinimumXForTrackRect:](self, "_thumbCenterMinimumXForTrackRect:", x, y, width, height);
  v16 = v15;
  -[CAMZoomSlider _thumbCenterMaximumXForTrackRect:](self, "_thumbCenterMaximumXForTrackRect:", x, y, width, height);
  return v16 + v14 * (v17 - v16);
}

- (float)_valueForThumbCenterX:(double)a3 trackRect:(CGRect)a4
{
  double height;
  CGFloat width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  float result;
  float v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[CAMZoomSlider _thumbCenterMinimumXForTrackRect:](self, "_thumbCenterMinimumXForTrackRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v11 = v10;
  -[CAMZoomSlider _thumbCenterMaximumXForTrackRect:](self, "_thumbCenterMaximumXForTrackRect:", x, y, width, height);
  *(float *)&width = (a3 - v11) / (v12 - v11);
  -[CAMZoomSlider minimumValue](self, "minimumValue");
  v14 = v13;
  -[CAMZoomSlider maximumValue](self, "maximumValue");
  v16 = v14 + (float)(*(float *)&width * (float)(result - v14));
  if (v16 < v14)
    v16 = v14;
  if (v16 <= result)
    return v16;
  return result;
}

- (double)_thumbCenterMinimumXForTrackRect:(CGRect)a3
{
  return CGRectGetMinX(a3) + 3.0;
}

- (double)_thumbCenterMaximumXForTrackRect:(CGRect)a3
{
  return CGRectGetMaxX(a3) + -3.0;
}

- (int64_t)locationOfTouch:(id)a3
{
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
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  int v39;
  int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  CGPoint v52;
  CGPoint v53;
  CGPoint v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  objc_msgSend(a3, "locationInView:", self);
  v50 = v5;
  v51 = v4;
  -[CAMZoomSlider bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CAMZoomSlider minimumValueImageRectForBounds:](self, "minimumValueImageRectForBounds:");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v48 = v9;
  v49 = v7;
  v46 = v13;
  v47 = v11;
  -[CAMZoomSlider maximumValueImageRectForBounds:](self, "maximumValueImageRectForBounds:", v7, v9, v11, v13);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v55.origin.x = v15;
  v55.origin.y = v17;
  v55.size.width = v19;
  v55.size.height = v21;
  v56 = CGRectInset(v55, -15.0, -15.0);
  x = v56.origin.x;
  y = v56.origin.y;
  width = v56.size.width;
  height = v56.size.height;
  v56.origin.x = v23;
  v56.origin.y = v25;
  v56.size.width = v27;
  v56.size.height = v29;
  v57 = CGRectInset(v56, -15.0, -15.0);
  v34 = v57.origin.x;
  v35 = v57.origin.y;
  v36 = v57.size.width;
  v37 = v57.size.height;
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  v52.x = v51;
  v52.y = v50;
  if (CGRectContainsPoint(v57, v52))
    return 3;
  v58.origin.x = v34;
  v58.origin.y = v35;
  v58.size.width = v36;
  v58.size.height = v37;
  v53.x = v51;
  v53.y = v50;
  if (CGRectContainsPoint(v58, v53))
    return 4;
  v59.origin.x = v49;
  v59.origin.y = v48;
  v59.size.width = v47;
  v59.size.height = v46;
  v54.x = v51;
  v54.y = v50;
  if (!CGRectContainsPoint(v59, v54))
    return 0;
  -[CAMZoomSlider value](self, "value");
  v40 = v39;
  -[CAMZoomSlider trackRectForBounds:](self, "trackRectForBounds:", v49, v48, v47, v46);
  LODWORD(v45) = v40;
  -[CAMZoomSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v49, v48, v47, v46, v41, v42, v43, v44, v45);
  if (vabdd_f64(CGRectGetMidX(v60), v51) > 40.0)
    return 1;
  else
    return 2;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  int64_t v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMZoomSlider;
  if (-[CAMZoomSlider beginTrackingWithTouch:withEvent:](&v10, sel_beginTrackingWithTouch_withEvent_, v6, a4))
    goto LABEL_7;
  v7 = -[CAMZoomSlider locationOfTouch:](self, "locationOfTouch:", v6);
  switch(v7)
  {
    case 2:
      goto LABEL_7;
    case 4:
      -[CAMZoomSlider _setMaximumAutozooming:](self, "_setMaximumAutozooming:", 1);
      goto LABEL_7;
    case 3:
      -[CAMZoomSlider _setMinimumAutozooming:](self, "_setMinimumAutozooming:", 1);
LABEL_7:
      v8 = 1;
      -[CAMZoomSlider setVisibilityTimerSuspended:](self, "setVisibilityTimerSuspended:", 1);
      goto LABEL_8;
  }
  if (-[NSTimer isValid](self->__visibilityTimer, "isValid"))
    -[CAMZoomSlider _startVisibilityTimer](self, "_startVisibilityTimer");
  v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  if (-[CAMZoomSlider isAutozooming](self, "isAutozooming"))
  {
    objc_msgSend(v6, "previousLocationInView:", self);
    v9 = v8;
    v11 = v10;
    objc_msgSend(v6, "locationInView:", self);
    v13 = v12;
    v14 = vabdd_f64(v12, v9);
    if (v14 > vabdd_f64(v15, v11) && v14 > 20.0)
    {
      if (-[CAMZoomSlider isMinimumAutozooming](self, "isMinimumAutozooming") && v13 > v9)
      {
        -[CAMZoomSlider _setMinimumAutozooming:](self, "_setMinimumAutozooming:", 0);
      }
      else if (-[CAMZoomSlider isMaximumAutozooming](self, "isMaximumAutozooming") && v13 < v9)
      {
        -[CAMZoomSlider _setMaximumAutozooming:](self, "_setMaximumAutozooming:", 0);
      }
    }
  }
  if (-[CAMZoomSlider isAutozooming](self, "isAutozooming"))
  {
    v17 = 1;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)CAMZoomSlider;
    v17 = -[CAMZoomSlider continueTrackingWithTouch:withEvent:](&v19, sel_continueTrackingWithTouch_withEvent_, v6, v7);
  }

  return v17;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[CAMZoomSlider isAutozooming](self, "isAutozooming"))
  {
    -[CAMZoomSlider _setMinimumAutozooming:](self, "_setMinimumAutozooming:", 0);
    -[CAMZoomSlider _setMaximumAutozooming:](self, "_setMaximumAutozooming:", 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CAMZoomSlider;
    -[CAMZoomSlider endTrackingWithTouch:withEvent:](&v8, sel_endTrackingWithTouch_withEvent_, v6, v7);
  }
  -[CAMZoomSlider setVisibilityTimerSuspended:](self, "setVisibilityTimerSuspended:", 0);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CAMZoomSlider setVisibilityTimerSuspended:](self, "setVisibilityTimerSuspended:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CAMZoomSlider;
  -[CAMZoomSlider cancelTrackingWithEvent:](&v5, sel_cancelTrackingWithEvent_, v4);

}

- (void)_setMinimumAutozooming:(BOOL)a3
{
  if (self->_minimumAutozooming != a3)
  {
    self->_minimumAutozooming = a3;
    -[CAMZoomSlider _updateAutozooming](self, "_updateAutozooming");
  }
}

- (void)_setMaximumAutozooming:(BOOL)a3
{
  if (self->_maximumAutozooming != a3)
  {
    self->_maximumAutozooming = a3;
    -[CAMZoomSlider _updateAutozooming](self, "_updateAutozooming");
  }
}

- (BOOL)isAutozooming
{
  return -[CAMZoomSlider isMinimumAutozooming](self, "isMinimumAutozooming")
      || -[CAMZoomSlider isMaximumAutozooming](self, "isMaximumAutozooming");
}

- (void)_beginAutozooming
{
  CAMZoomSliderDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  if (!self->__autozooming)
  {
    self->__autozooming = 1;
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      v6 = objc_loadWeakRetained((id *)p_delegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v8, "zoomSliderDidBeginAutozooming:", self);

      }
    }
  }
}

- (void)_updateAutozooming
{
  if (-[CAMZoomSlider isAutozooming](self, "isAutozooming"))
    -[CAMZoomSlider _beginAutozooming](self, "_beginAutozooming");
  else
    -[CAMZoomSlider _endAutozooming](self, "_endAutozooming");
}

- (void)_endAutozooming
{
  CAMZoomSliderDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  if (self->__autozooming)
  {
    self->__autozooming = 0;
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      v6 = objc_loadWeakRetained((id *)p_delegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v8, "zoomSliderDidEndAutozooming:", self);

      }
    }
  }
}

- (BOOL)shouldHideForExpiredVisibilityTimer
{
  char v3;
  BOOL v4;

  v3 = objc_msgSend((id)objc_opt_class(), "shouldFadeOutZoomSliderForLayoutStyle:", -[CAMZoomSlider layoutStyle](self, "layoutStyle"));
  v4 = -[CAMZoomSlider isVisibilityTimerSuspended](self, "isVisibilityTimerSuspended");
  return v3 & ((v4 | -[NSTimer isValid](self->__visibilityTimer, "isValid")) ^ 1);
}

- (void)setVisibilityTimerSuspended:(BOOL)a3
{
  if (self->_visibilityTimerSuspended != a3)
  {
    self->_visibilityTimerSuspended = a3;
    if (a3)
      -[CAMZoomSlider _stopVisibilityTimer](self, "_stopVisibilityTimer");
    else
      -[CAMZoomSlider _startVisibilityTimer](self, "_startVisibilityTimer");
  }
}

- (void)_startVisibilityTimer
{
  id v3;
  void *v4;
  NSTimer *v5;
  NSTimer *visibilityTimer;
  id v7;

  -[CAMZoomSlider _stopVisibilityTimer](self, "_stopVisibilityTimer");
  if (objc_msgSend((id)objc_opt_class(), "shouldFadeOutZoomSliderForLayoutStyle:", -[CAMZoomSlider layoutStyle](self, "layoutStyle")))
  {
    if (!-[CAMZoomSlider isVisibilityTimerSuspended](self, "isVisibilityTimerSuspended"))
    {
      v3 = objc_alloc(MEMORY[0x1E0C99E88]);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (NSTimer *)objc_msgSend(v3, "initWithFireDate:interval:target:selector:userInfo:repeats:", v4, self, sel__hideZoomSlider_, 0, 0, 0.0);
      visibilityTimer = self->__visibilityTimer;
      self->__visibilityTimer = v5;

      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addTimer:forMode:", self->__visibilityTimer, *MEMORY[0x1E0C9B280]);

    }
  }
}

- (void)_stopVisibilityTimer
{
  NSTimer *visibilityTimer;
  NSTimer *v4;

  visibilityTimer = self->__visibilityTimer;
  if (visibilityTimer)
  {
    if (-[NSTimer isValid](visibilityTimer, "isValid"))
    {
      -[NSTimer invalidate](self->__visibilityTimer, "invalidate");
      v4 = self->__visibilityTimer;
      self->__visibilityTimer = 0;

    }
  }
}

- (void)makeVisibleAnimated:(BOOL)a3
{
  double v4;
  id WeakRetained;
  char v6;
  id v7;
  _QWORD v8[5];

  if (a3)
    v4 = 0.05;
  else
    v4 = 0.0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__CAMZoomSlider_makeVisibleAnimated___block_invoke;
  v8[3] = &unk_1EA328868;
  v8[4] = self;
  +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v8, v4);
  -[CAMZoomSlider _startVisibilityTimer](self, "_startVisibilityTimer");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "willShowZoomSlider:withAnimationDuration:", self, v4);

  }
}

uint64_t __37__CAMZoomSlider_makeVisibleAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)makeInvisibleAnimated:(BOOL)a3
{
  double v3;

  v3 = 0.1;
  if (!a3)
    v3 = 0.0;
  -[CAMZoomSlider _makeInvisibleAnimationDuration:](self, "_makeInvisibleAnimationDuration:", v3);
}

- (void)_makeInvisibleAnimationDuration:(double)a3
{
  BOOL v5;
  double v6;
  id WeakRetained;
  char v8;
  id v9;
  _QWORD v10[5];

  -[CAMZoomSlider _stopVisibilityTimer](self, "_stopVisibilityTimer");
  if ((-[CAMZoomSlider isHidden](self, "isHidden") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[CAMZoomSlider alpha](self, "alpha");
    v5 = v6 == 0.0;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__CAMZoomSlider__makeInvisibleAnimationDuration___block_invoke;
  v10[3] = &unk_1EA328868;
  v10[4] = self;
  +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v10, a3);
  if (!v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "willHideZoomSlider:withAnimationDuration:", self, a3);

    }
  }
}

uint64_t __49__CAMZoomSlider__makeInvisibleAnimationDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (void)_hideZoomSlider:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  _QWORD v7[5];

  if ((-[CAMZoomSlider isTracking](self, "isTracking", a3) & 1) == 0)
  {
    -[CAMZoomSlider _stopVisibilityTimer](self, "_stopVisibilityTimer");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__CAMZoomSlider__hideZoomSlider___block_invoke;
    v7[3] = &unk_1EA328868;
    v7[4] = self;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v7, 0.5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "willHideZoomSlider:withAnimationDuration:", self, 0.5);

    }
  }
}

uint64_t __33__CAMZoomSlider__hideZoomSlider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (void)_handleTouchUpInside:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "zoomSliderDidEndZooming:", self);

}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CAMZoomSlider _updateForLayoutStyle](self, "_updateForLayoutStyle");
  }
}

- (void)_updateForLayoutStyle
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;

  v3 = -[CAMZoomSlider layoutStyle](self, "layoutStyle");
  if (v3 == 1)
    v4 = 3;
  else
    v4 = 0;
  -[CAMZoomSlider setSemanticContentAttribute:](self, "setSemanticContentAttribute:", v4);
  v5 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("CAMZoomSliderThumb"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:", v8);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageNamed:inBundle:", CFSTR("CAMZoomSliderTrack"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageNamed:inBundle:", CFSTR("CAMZoomSliderPlus"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageWithTintColor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageNamed:inBundle:", CFSTR("CAMZoomSliderMinus"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "size");
  objc_msgSend(v11, "resizableImageWithCapInsets:resizingMode:", 1, v20 * 0.5, v21 * 0.5, v20 * 0.5, v21 * 0.5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 1)
  {
    v23 = (void *)MEMORY[0x1E0DC3870];
    v24 = objc_retainAutorelease(v19);
    v25 = objc_msgSend(v24, "CGImage");
    objc_msgSend(v24, "scale");
    objc_msgSend(v23, "imageWithCGImage:scale:orientation:", v25, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "imageWithTintColor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMZoomSlider setThumbImage:forState:](self, "setThumbImage:forState:", v28, 0);
  -[CAMZoomSlider setMinimumTrackImage:forState:](self, "setMinimumTrackImage:forState:", v22, 0);
  -[CAMZoomSlider setMaximumTrackImage:forState:](self, "setMaximumTrackImage:forState:", v22, 0);
  -[CAMZoomSlider setMaximumValueImage:](self, "setMaximumValueImage:", v16);
  -[CAMZoomSlider setMinimumValueImage:](self, "setMinimumValueImage:", v27);
  -[CAMZoomSlider setNeedsLayout](self, "setNeedsLayout");

}

- (void)setOrientation:(int64_t)a3
{
  -[CAMZoomSlider setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v6[5];

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMZoomSlider setNeedsLayout](self, "setNeedsLayout");
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __41__CAMZoomSlider_setOrientation_animated___block_invoke;
      v6[3] = &unk_1EA328868;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v6, 0, 0.3, 0.0);
    }
  }
}

uint64_t __41__CAMZoomSlider_setOrientation_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (CAMZoomSliderDelegate)delegate
{
  return (CAMZoomSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentRectInsets.top;
  left = self->_alignmentRectInsets.left;
  bottom = self->_alignmentRectInsets.bottom;
  right = self->_alignmentRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  self->_alignmentRectInsets = a3;
}

- (BOOL)isMinimumAutozooming
{
  return self->_minimumAutozooming;
}

- (BOOL)isMaximumAutozooming
{
  return self->_maximumAutozooming;
}

- (BOOL)isVisibilityTimerSuspended
{
  return self->_visibilityTimerSuspended;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (NSTimer)_visibilityTimer
{
  return self->__visibilityTimer;
}

- (BOOL)_isAutozooming
{
  return self->__autozooming;
}

- (void)_setAutozooming:(BOOL)a3
{
  self->__autozooming = a3;
}

- (UIView)_minTrackMaskView
{
  return self->__minTrackMaskView;
}

- (UIView)_maxTrackMaskView
{
  return self->__maxTrackMaskView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__maxTrackMaskView, 0);
  objc_storeStrong((id *)&self->__minTrackMaskView, 0);
  objc_storeStrong((id *)&self->__visibilityTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
