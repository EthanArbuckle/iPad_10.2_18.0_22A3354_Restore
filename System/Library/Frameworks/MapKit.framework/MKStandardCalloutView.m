@implementation MKStandardCalloutView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MKCalloutView annotationView](self, "annotationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKStandardCalloutView _stopObservingAnnotationView:](self, "_stopObservingAnnotationView:", v3);

  v4.receiver = self;
  v4.super_class = (Class)MKStandardCalloutView;
  -[MKStandardCalloutView dealloc](&v4, sel_dealloc);
}

- (void)setLeftView:(id)a3 backgroundColor:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;

  v5 = a5;
  v9 = a3;
  -[MKSmallCalloutView leftView](self->_calloutView, "leftView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7 != v9)
  {
    -[MKSmallCalloutView setLeftView:animated:](self->_calloutView, "setLeftView:animated:", v9, v5);
    v8 = v9;
  }

}

- (void)setRightView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[MKSmallCalloutView rightView](self->_calloutView, "rightView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6 != v8)
  {
    -[MKSmallCalloutView setRightView:animated:](self->_calloutView, "setRightView:animated:", v8, v4);
    v7 = v8;
  }

}

- (void)setDetailView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[MKSmallCalloutView detailView](self->_calloutView, "detailView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6 != v8)
  {
    -[MKSmallCalloutView setDetailView:animated:](self->_calloutView, "setDetailView:animated:", v8, v4);
    v7 = v8;
  }

}

- (void)setSubtitle:(id)a3 animated:(BOOL)a4
{
  -[MKSmallCalloutView setCalloutSubtitle:animated:](self->_calloutView, "setCalloutSubtitle:animated:", a3, a4);
}

+ (double)defaultHeight
{
  return 50.0;
}

- (MKStandardCalloutView)initWithAnnotationView:(id)a3
{
  id v4;
  MKStandardCalloutView *v5;
  MKStandardCalloutView *v6;
  uint64_t v7;
  int64_t *p_style;
  __int128 *p_metrics;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double v19;
  char v20;
  _MKStandardCalloutMaskView *v21;
  uint64_t v22;
  _MKStandardCalloutMaskView *maskView;
  uint64_t v24;
  _MKCalloutLayer *maskLayer;
  _MKCalloutLayer *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _MKCalloutLayer *contentStrokeLayer;
  _MKCalloutLayer *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  UIVisualEffectView *backdropView;
  void *v50;
  uint64_t v51;
  UIView *contentView;
  MKSmallCalloutView *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  MKSmallCalloutView *calloutView;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  _OWORD v66[6];
  _BYTE v67[96];
  _BYTE __dst[98];
  int v69;
  __int16 v70;
  objc_super v71;
  uint64_t v72;
  const __CFString *v73;
  _QWORD v74[2];

  v74[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)MKStandardCalloutView;
  v5 = -[MKCalloutView initWithAnnotationView:](&v71, sel_initWithAnnotationView_, v4);
  v6 = v5;
  if (v5)
  {
    -[MKStandardCalloutView setAutoresizesSubviews:](v5, "setAutoresizesSubviews:", 1);
    if (v4)
    {
      v7 = objc_msgSend(v4, "_calloutStyle");
      p_style = &v6->_style;
      v6->_style = v7;
      p_metrics = (__int128 *)&v6->_metrics;
      if (v7 == 2)
      {
        v10 = 0;
        v11 = xmmword_18B2A9600;
        v12 = xmmword_18B2A9610;
        v13 = xmmword_18B2A9620;
        __asm { FMOV            V2.2D, #11.0 }
        v19 = 4.0;
        v20 = 1;
        goto LABEL_7;
      }
    }
    else
    {
      p_style = &v6->_style;
      v6->_style = 0;
      p_metrics = (__int128 *)&v6->_metrics;
    }
    v20 = 0;
    v11 = xmmword_18B2A9630;
    v12 = xmmword_18B2A9640;
    v13 = xmmword_18B2A9650;
    v10 = 1;
    v19 = 0.666666687;
    _Q2 = xmmword_18B2A9630;
LABEL_7:
    *p_metrics = v13;
    p_metrics[1] = v12;
    *((_BYTE *)p_metrics + 32) = v20;
    *(_DWORD *)((char *)p_metrics + 33) = v66[0];
    *((_DWORD *)p_metrics + 9) = *(_DWORD *)((char *)v66 + 3);
    *((_QWORD *)p_metrics + 5) = 0x4018000000000000;
    *((double *)p_metrics + 6) = v19;
    *((_BYTE *)p_metrics + 56) = v10;
    *((_BYTE *)p_metrics + 57) = v10;
    *(_DWORD *)((char *)p_metrics + 58) = v69;
    *((_WORD *)p_metrics + 31) = v70;
    p_metrics[4] = v11;
    p_metrics[5] = _Q2;
    v21 = [_MKStandardCalloutMaskView alloc];
    -[MKStandardCalloutView bounds](v6, "bounds");
    v22 = -[_MKStandardCalloutMaskView initWithFrame:](v21, "initWithFrame:");
    maskView = v6->_maskView;
    v6->_maskView = (_MKStandardCalloutMaskView *)v22;

    -[_MKStandardCalloutMaskView layer](v6->_maskView, "layer");
    v24 = objc_claimAutoreleasedReturnValue();
    maskLayer = v6->_maskLayer;
    v6->_maskLayer = (_MKCalloutLayer *)v24;

    v26 = v6->_maskLayer;
    memmove(__dst, p_metrics, 0x60uLL);
    -[_MKCalloutLayer setMetrics:](v26, "setMetrics:", __dst);
    -[MKStandardCalloutView layer](v6, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sizeSublayerToBounds:", v6->_maskLayer);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKStandardCalloutView setBackgroundColor:](v6, "setBackgroundColor:", v28);

    -[MKStandardCalloutView setClipsToBounds:](v6, "setClipsToBounds:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = objc_msgSend(v29, "CGColor");
    -[MKStandardCalloutView layer](v6, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setShadowColor:", v30);

    if (*p_style == 2)
    {
      -[MKStandardCalloutView layer](v6, "layer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setShadowOffset:", 0.0, 1.0);

      -[MKStandardCalloutView layer](v6, "layer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setShadowRadius:", 12.0);

      -[MKStandardCalloutView layer](v6, "layer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      LODWORD(v44) = 1041865114;
    }
    else
    {
      if (*p_style)
      {
LABEL_12:
        v47 = objc_alloc(MEMORY[0x1E0CEABE8]);
        -[UIView bounds](v6->_contentView, "bounds");
        v48 = objc_msgSend(v47, "initWithFrame:");
        backdropView = v6->_backdropView;
        v6->_backdropView = (UIVisualEffectView *)v48;

        -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v6->_backdropView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIVisualEffectView setEffect:](v6->_backdropView, "setEffect:", v50);

        -[UIVisualEffectView setInsetsLayoutMarginsFromSafeArea:](v6->_backdropView, "setInsetsLayoutMarginsFromSafeArea:", 0);
        -[UIVisualEffectView _setUseLiveMasking:](v6->_backdropView, "_setUseLiveMasking:", 1);
        -[MKStandardCalloutView addSubview:](v6, "addSubview:", v6->_backdropView);
        -[UIVisualEffectView setMaskView:](v6->_backdropView, "setMaskView:", v6->_maskView);
        -[UIVisualEffectView contentView](v6->_backdropView, "contentView");
        v51 = objc_claimAutoreleasedReturnValue();
        contentView = v6->_contentView;
        v6->_contentView = (UIView *)v51;

        v53 = [MKSmallCalloutView alloc];
        -[UIView bounds](v6->_contentView, "bounds");
        v54 = p_metrics[1];
        v66[0] = *p_metrics;
        v66[1] = v54;
        v55 = p_metrics[2];
        v56 = p_metrics[3];
        v57 = p_metrics[5];
        v66[4] = p_metrics[4];
        v66[5] = v57;
        v66[2] = v55;
        v66[3] = v56;
        v58 = -[MKSmallCalloutView initWithFrame:metrics:](v53, "initWithFrame:metrics:", v66);
        calloutView = v6->_calloutView;
        v6->_calloutView = (MKSmallCalloutView *)v58;

        -[MKSmallCalloutView setTranslatesAutoresizingMaskIntoConstraints:](v6->_calloutView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[MKSmallCalloutView setInsetsLayoutMarginsFromSafeArea:](v6->_calloutView, "setInsetsLayoutMarginsFromSafeArea:", 0);
        -[MKSmallCalloutView setPreservesSuperviewLayoutMargins:](v6->_calloutView, "setPreservesSuperviewLayoutMargins:", 0);
        -[UIView addSubview:](v6->_contentView, "addSubview:", v6->_calloutView);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKStandardCalloutView _adaptToUserInterfaceStyle](v6, "_adaptToUserInterfaceStyle");
        -[UIView _mapkit_constraintsPinningSubviewToBounds:](v6, "_mapkit_constraintsPinningSubviewToBounds:", v6->_backdropView);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "addObjectsFromArray:", v61);

        -[UIView _mapkit_constraintsPinningSubviewToBounds:](v6->_contentView, "_mapkit_constraintsPinningSubviewToBounds:", v6->_calloutView);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "addObjectsFromArray:", v62);

        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v60);
        v6->_anchor.offset = (CGPoint)*MEMORY[0x1E0C9D538];
        v6->_anchor.position = 0;
        -[MKStandardCalloutView _updateCalloutAnimated:](v6, "_updateCalloutAnimated:", 0);
        v72 = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = (id)-[MKStandardCalloutView registerForTraitChanges:withAction:](v6, "registerForTraitChanges:withAction:", v63, sel_traitEnvironment_didChangeTraitCollection_);

        goto LABEL_13;
      }
      +[_MKCalloutLayer layer](_MKCalloutLayer, "layer");
      v32 = objc_claimAutoreleasedReturnValue();
      contentStrokeLayer = v6->_contentStrokeLayer;
      v6->_contentStrokeLayer = (_MKCalloutLayer *)v32;

      v34 = v6->_contentStrokeLayer;
      memmove(v67, p_metrics, 0x60uLL);
      -[_MKCalloutLayer setMetrics:](v34, "setMetrics:", v67);
      -[_MKCalloutLayer setFillColor:](v6->_contentStrokeLayer, "setFillColor:", 0);
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.5, 0.300000012);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKCalloutLayer setStrokeColor:](v6->_contentStrokeLayer, "setStrokeColor:", v35);

      v73 = CFSTR("transform");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKCalloutLayer setActions:](v6->_contentStrokeLayer, "setActions:", v37);

      -[MKStandardCalloutView layer](v6, "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addSublayer:", v6->_contentStrokeLayer);

      -[_MKCalloutLayer setZPosition:](v6->_contentStrokeLayer, "setZPosition:", 10000.0);
      -[MKStandardCalloutView layer](v6, "layer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "sizeSublayerToBounds:", v6->_contentStrokeLayer);

      -[MKStandardCalloutView layer](v6, "layer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setShadowOffset:", 0.0, 4.0);

      -[MKStandardCalloutView layer](v6, "layer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setShadowRadius:", 6.0);

      -[MKStandardCalloutView layer](v6, "layer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      LODWORD(v44) = 1036831949;
    }
    objc_msgSend(v42, "setShadowOpacity:", v44);

    goto LABEL_12;
  }
LABEL_13:

  return v6;
}

- (void)setTitle:(id)a3
{
  -[MKSmallCalloutView setCalloutTitle:](self->_calloutView, "setCalloutTitle:", a3);
}

- (void)setSubtitle:(id)a3
{
  -[MKStandardCalloutView setSubtitle:animated:](self, "setSubtitle:animated:", a3, 0);
}

- (id)subtitle
{
  return -[MKSmallCalloutView calloutSubtitle](self->_calloutView, "calloutSubtitle");
}

- (void)setOffset:(CGPoint)a3
{
  self->_anchor.offset = a3;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchor.offset.x;
  y = self->_anchor.offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)anchorPoint
{
  double *v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  double v8;
  double v9;
  CGPoint result;
  CGRect v11;
  CGRect v12;

  v2 = (double *)self;
  -[MKStandardCalloutView frame](self, "frame");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v2 += 54;
  v7 = CGRectGetMinX(v11) + *v2;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v8 = CGRectGetMinY(v12) + v2[1];
  v9 = v7;
  result.y = v8;
  result.x = v9;
  return result;
}

- (void)_calculateActualAnchorPoint:(CGPoint *)a3 frame:(CGRect *)a4 forDesiredAnchorPoint:(CGPoint)a5 boundaryRect:(CGRect)a6
{
  CGFloat width;
  CGFloat y;
  double v8;
  double v9;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  $E0CD17A120EE6D90D6AA8034B435FD1B *p_metrics;
  double v31;
  CGFloat v32;
  double MaxX;
  double v34;
  CGFloat v35;
  BOOL v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double MinX;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat rect;
  CGFloat recta;
  CGFloat x;
  CGFloat height;
  double v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  x = a6.origin.x;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  v8 = a5.y;
  v9 = a5.x;
  -[MKStandardCalloutView frame](self, "frame");
  v14 = v13;
  v16 = v15;
  *(float *)&v13 = v9;
  v17 = roundf(*(float *)&v13);
  *(float *)&v13 = v8;
  v52 = roundf(*(float *)&v13);
  -[MKSmallCalloutView preferredContentSize](self->_calloutView, "preferredContentSize");
  v19 = v18;
  v21 = v20;
  switch(self->_anchor.position)
  {
    case 1:
      v16 = v52;
      goto LABEL_8;
    case 2:
      v58.origin.x = v14;
      v58.origin.y = v16;
      v58.size.width = v19;
      v58.size.height = v21;
      v16 = v52 - CGRectGetHeight(v58);
      goto LABEL_8;
    case 3:
      v22 = y;
      v23 = v18 + v17 + self->_metrics.margin;
      v53.size.width = width;
      v53.origin.x = x;
      v53.origin.y = v22;
      v53.size.height = height;
      if (v23 > CGRectGetMaxX(v53))
      {
        v54.origin.x = x;
        v54.origin.y = v22;
        v54.size.width = width;
        v54.size.height = height;
        y = v22;
        v24 = CGRectGetMaxX(v54) - (v19 + self->_metrics.margin);
LABEL_11:
        v14 = v17;
        goto LABEL_18;
      }
      v27 = v17 - self->_metrics.margin;
      v59.origin.x = x;
      v59.origin.y = v22;
      v59.size.width = width;
      v59.size.height = height;
      if (v27 < CGRectGetMinX(v59))
      {
        v60.origin.x = x;
        v60.origin.y = v22;
        v60.size.width = width;
        v60.size.height = height;
        y = v22;
        v24 = CGRectGetMinX(v60) + self->_metrics.margin;
        goto LABEL_11;
      }
      v14 = v17;
      y = v22;
      v24 = v17;
      goto LABEL_18;
    case 4:
      v55.origin.x = v14;
      v55.origin.y = v16;
      v55.size.width = v19;
      v55.size.height = v21;
      v14 = v17 - CGRectGetWidth(v55);
      v56.origin.y = y;
      v25 = v17 - v19 - self->_metrics.margin;
      v56.origin.x = x;
      rect = v56.origin.y;
      v56.size.width = width;
      v56.size.height = height;
      if (v25 < CGRectGetMinX(v56))
      {
        v57.origin.x = x;
        v57.origin.y = rect;
        v26 = width;
        v57.size.width = width;
        v57.size.height = height;
        v24 = v19 + CGRectGetMinX(v57) + self->_metrics.margin;
LABEL_14:
        width = v26;
        goto LABEL_17;
      }
      v28 = self->_metrics.margin + v17;
      v61.origin.x = x;
      v61.origin.y = rect;
      v61.size.width = width;
      v61.size.height = height;
      if (v28 > CGRectGetMaxX(v61))
      {
        v62.origin.x = x;
        v62.origin.y = rect;
        v26 = width;
        v62.size.width = width;
        v62.size.height = height;
        v24 = CGRectGetMaxX(v62) - self->_metrics.margin;
        goto LABEL_14;
      }
      v24 = v17;
LABEL_17:
      y = rect;
LABEL_18:
      if ((unint64_t)(self->_anchor.position - 1) > 1)
      {
        v68.origin.x = v14;
        v68.origin.y = v16;
        v68.size.width = v19;
        v68.size.height = v21;
        v16 = round(v52 + CGRectGetHeight(v68) * -0.5);
        if (!a3)
          goto LABEL_36;
        goto LABEL_35;
      }
      v47 = v24;
      v63.origin.x = v14;
      v63.origin.y = v16;
      v63.size.width = v19;
      v63.size.height = v21;
      v29 = round(v17 - CGRectGetWidth(v63) * 0.5);
      p_metrics = &self->_metrics;
      v31 = 0.0;
      v46 = fmax((v19- (p_metrics->arrowBase+ (p_metrics->var0.radialSmoothing.arrowBaseRadius + p_metrics->cornerRadius) * 2.0))* 0.5, 0.0);
      recta = v29;
      v64.origin.x = v29;
      v64.origin.y = v16;
      v64.size.width = v19;
      v64.size.height = v21;
      v32 = CGRectGetMaxX(v64) + p_metrics->margin;
      v65.origin.x = x;
      v65.origin.y = y;
      v65.size.width = width;
      v65.size.height = height;
      if (v32 <= CGRectGetMaxX(v65))
      {
        v69.origin.x = recta;
        v43 = v19;
        v44 = v16;
        v69.origin.y = v16;
        v69.size.width = v19;
        v45 = v21;
        v69.size.height = v21;
        v35 = CGRectGetMinX(v69) - p_metrics->margin;
        v70.origin.x = x;
        v70.origin.y = y;
        v70.size.width = width;
        v70.size.height = height;
        v36 = v35 < CGRectGetMinX(v70);
        v37 = x;
        v24 = v47;
        v34 = recta;
        if (!v36)
          goto LABEL_31;
        v38 = y;
        v39 = width;
        v40 = height;
        MinX = CGRectGetMinX(*(CGRect *)&v37);
        v71.origin.x = recta;
        v71.origin.y = v16;
        v71.size.width = v19;
        v71.size.height = v21;
        v31 = MinX - (CGRectGetMinX(v71) - p_metrics->margin);
      }
      else
      {
        v66.origin.x = x;
        v66.origin.y = y;
        v66.size.width = width;
        v66.size.height = height;
        MaxX = CGRectGetMaxX(v66);
        v34 = recta;
        v67.origin.x = recta;
        v67.origin.y = v16;
        v67.size.width = v19;
        v67.size.height = v21;
        v31 = MaxX - (CGRectGetMaxX(v67) + p_metrics->margin);
        v24 = v47;
      }
      if (v31 > 0.0)
      {
        v42 = v46;
        if (v31 < v46)
          v42 = v31;
        goto LABEL_34;
      }
      v43 = v19;
      v44 = v16;
      v45 = v21;
LABEL_31:
      v21 = v45;
      v42 = -v46;
      if (v31 > -v46)
        v42 = v31;
      v19 = v43;
      v16 = v44;
LABEL_34:
      v14 = v34 + v42;
      if (!a3)
        goto LABEL_36;
LABEL_35:
      a3->x = v24;
      a3->y = v52;
LABEL_36:
      if (a4)
      {
        a4->origin.x = v14;
        a4->origin.y = v16;
        a4->size.width = v19;
        a4->size.height = v21;
      }
      return;
    default:
LABEL_8:
      v24 = v17;
      goto LABEL_18;
  }
}

- (CGPoint)_originForScale:(double)a3
{
  CGRect *p_frame;
  double MidX;
  double MidY;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  p_frame = &self->_frame;
  MidX = CGRectGetMidX(self->_frame);
  MidY = CGRectGetMidY(*p_frame);
  v8 = MidX - CGRectGetMinX(*p_frame);
  v9 = MidY - CGRectGetMinY(*p_frame);
  v10 = round(MidX - (a3 + -1.0) * (self->_anchor.origin.x - v8));
  v11 = round(MidY - (a3 + -1.0) * (self->_anchor.origin.y - v9));
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)_setOriginForScale:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[MKStandardCalloutView _originForScale:](self, "_originForScale:", a3);
  v5 = v4;
  v7 = v6;
  -[MKStandardCalloutView layer](self, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPosition:", v5, v7);

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MKStandardCalloutView frame](self, "frame");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    -[MKStandardCalloutView _frameDidChange](self, "_frameDidChange");
    v8.receiver = self;
    v8.super_class = (Class)MKStandardCalloutView;
    -[MKStandardCalloutView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (void)_frameDidChange
{
  $9C28CB1D698B8D3406FED1795F3A03C2 *p_anchor;
  int64_t position;

  p_anchor = &self->_anchor;
  position = self->_anchor.position;
  if ((unint64_t)(position - 1) < 2)
  {
    -[_MKCalloutLayer setArrowOffset:](self->_maskLayer, "setArrowOffset:", p_anchor->origin.x + self->_frame.size.width * -0.5);
    position = p_anchor->position;
  }
  -[_MKCalloutLayer setArrowPosition:](self->_maskLayer, "setArrowPosition:", position);
  -[_MKCalloutLayer setArrowPosition:](self->_contentStrokeLayer, "setArrowPosition:", p_anchor->position);
  -[_MKCalloutLayer arrowOffset](self->_maskLayer, "arrowOffset");
  -[_MKCalloutLayer setArrowOffset:](self->_contentStrokeLayer, "setArrowOffset:");
}

- (void)forceAnchorPosition:(int64_t)a3
{
  double arrowHeight;
  double v5;
  double v6;
  double v7;

  if (self->_anchor.position != a3)
  {
    self->_anchor.position = a3;
    arrowHeight = 0.0;
    switch(a3)
    {
      case 1:
        arrowHeight = self->_metrics.arrowHeight;
        goto LABEL_4;
      case 2:
        v6 = self->_metrics.arrowHeight;
        v5 = 0.0;
        goto LABEL_9;
      case 3:
        v7 = self->_metrics.arrowHeight;
        v5 = 0.0;
        v6 = 0.0;
        goto LABEL_10;
      case 4:
        v5 = self->_metrics.arrowHeight;
        goto LABEL_8;
      default:
LABEL_4:
        v5 = 0.0;
LABEL_8:
        v6 = 0.0;
LABEL_9:
        v7 = 0.0;
LABEL_10:
        -[MKSmallCalloutView setLayoutMargins:](self->_calloutView, "setLayoutMargins:", arrowHeight, v7, v6, v5);
        -[MKStandardCalloutView _layoutSubviews:](self, "_layoutSubviews:", 0);
        break;
    }
  }
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MKStandardCalloutView;
  -[MKStandardCalloutView didMoveToWindow](&v14, sel_didMoveToWindow);
  -[MKStandardCalloutView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MKStandardCalloutView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v8 = v7;
    -[UIView layer](self->_contentView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentsScale:", v8);

    -[MKStandardCalloutView window](self, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "screen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    -[_MKCalloutLayer setContentsScale:](self->_maskLayer, "setContentsScale:");

    -[MKStandardCalloutView window](self, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    -[_MKCalloutLayer setContentsScale:](self->_contentStrokeLayer, "setContentsScale:");

  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
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
  objc_super v15;

  -[MKCalloutView annotationView](self, "annotationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_visibleCenteringRectInView:", v3);
  v6 = v5;

  v7 = v6 + self->_metrics.margin * -2.0;
  if ((unint64_t)(-[MKStandardCalloutView anchorPosition](self, "anchorPosition") - 3) <= 1)
  {
    if (-[MKStandardCalloutView anchorPosition](self, "anchorPosition") == 4
      && (objc_msgSend(v3, "leftCalloutOffset"), v8 < 0.0))
    {
      objc_msgSend(v3, "leftCalloutOffset");
      v7 = v7 + v9;
    }
    else if (-[MKStandardCalloutView anchorPosition](self, "anchorPosition") == 3)
    {
      objc_msgSend(v3, "rightCalloutOffset");
      if (v10 > 0.0)
      {
        objc_msgSend(v3, "rightCalloutOffset");
        v7 = v7 - v11;
      }
    }
  }
  v12 = fmin(v7, 390.0);
  -[MKSmallCalloutView minimumWidth](self->_calloutView, "minimumWidth");
  if (v12 <= v13)
  {
    -[MKSmallCalloutView minimumWidth](self->_calloutView, "minimumWidth");
    v12 = v14;
  }
  -[MKSmallCalloutView setMaximumWidth:](self->_calloutView, "setMaximumWidth:", v12);
  v15.receiver = self;
  v15.super_class = (Class)MKStandardCalloutView;
  -[MKStandardCalloutView updateConstraints](&v15, sel_updateConstraints);

}

- (void)_layoutSubviews:(BOOL)a3
{
  _BOOL4 v3;
  $A0210CD9D506E42BFA64C98EA1A83F0A flags;
  double x;
  CGFloat v7;
  double y;
  CGFloat MinY;
  void *v10;
  float v11;
  _QWORD v12[5];
  CGPoint desiredPoint;

  v3 = a3;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0 || !a3)
  {
    -[MKStandardCalloutView updateConstraints](self, "updateConstraints");
    desiredPoint = self->_anchor.desiredPoint;
    -[MKStandardCalloutView _calculateActualAnchorPoint:frame:forDesiredAnchorPoint:boundaryRect:](self, "_calculateActualAnchorPoint:frame:forDesiredAnchorPoint:boundaryRect:", &desiredPoint, &self->_frame, self->_anchor.desiredPoint.x, self->_anchor.desiredPoint.y, self->_anchor.desiredBounds.origin.x, self->_anchor.desiredBounds.origin.y, self->_anchor.desiredBounds.size.width, self->_anchor.desiredBounds.size.height);
    x = desiredPoint.x;
    v7 = x - CGRectGetMinX(self->_frame);
    y = desiredPoint.y;
    MinY = CGRectGetMinY(self->_frame);
    self->_anchor.origin.x = v7;
    self->_anchor.origin.y = y - MinY;
    if (v3)
    {
      v10 = (void *)MEMORY[0x1E0CEABB0];
      UIAnimationDragCoefficient();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __41__MKStandardCalloutView__layoutSubviews___block_invoke;
      v12[3] = &unk_1E20D7D98;
      v12[4] = self;
      objc_msgSend(v10, "_mapkit_animateFromCurrentStateWithDuration:animations:completion:", v12, 0, v11 * 0.349999994);
    }
    else
    {
      -[MKStandardCalloutView setFrame:](self, "setFrame:", self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
      -[UIView _mapkit_layoutBelowIfNeeded](self, "_mapkit_layoutBelowIfNeeded");
    }
  }
  else
  {
    self->_flags = ($A0210CD9D506E42BFA64C98EA1A83F0A)(*(_DWORD *)&flags | 4);
  }
}

uint64_t __41__MKStandardCalloutView__layoutSubviews___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 520), *(double *)(*(_QWORD *)(a1 + 32) + 528), *(double *)(*(_QWORD *)(a1 + 32) + 536), *(double *)(*(_QWORD *)(a1 + 32) + 544));
  return objc_msgSend(*(id *)(a1 + 32), "_mapkit_layoutBelowIfNeeded");
}

- (void)_runBounceAnimationWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
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
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  CATransform3D v33;
  CATransform3D v34;
  CATransform3D v35;
  CATransform3D v36;
  _QWORD v37[8];

  v37[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemovedOnCompletion:", 1);
  objc_msgSend(v5, "setDuration:", 0.300000012);
  CATransform3DMakeScale(&v36, 0.120481931, 0.120481931, 1.0);
  CATransform3DMakeScale(&v35, 1.11244977, 1.11244977, 1.0);
  -[MKStandardCalloutView _originForScale:](self, "_originForScale:", 0.120481931);
  v7 = v6;
  v9 = v8;
  -[MKStandardCalloutView _originForScale:](self, "_originForScale:", 1.11244977);
  v11 = v10;
  v13 = v12;
  v34 = v36;
  v33 = v35;
  _transformAnim((__int128 *)&v34, (__int128 *)&v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _positionAnim(v7, v9, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDuration:", 0.13333334);
  objc_msgSend(v15, "setDuration:", 0.13333334);
  v36 = v35;
  CATransform3DMakeScale(&v34, 0.951807201, 0.951807201, 1.0);
  v35 = v34;
  -[MKStandardCalloutView _originForScale:](self, "_originForScale:", 0.951807201);
  v17 = v16;
  v19 = v18;
  v34 = v36;
  v33 = v35;
  _transformAnim((__int128 *)&v34, (__int128 *)&v33);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _positionAnim(v11, v13, v17, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBeginTime:", 0.13333334);
  objc_msgSend(v21, "setBeginTime:", 0.13333334);
  objc_msgSend(v20, "setDuration:", 0.0833333358);
  objc_msgSend(v21, "setDuration:", 0.0833333358);
  v36 = v35;
  CATransform3DMakeScale(&v34, 1.0, 1.0, 1.0);
  v35 = v34;
  -[MKStandardCalloutView _originForScale:](self, "_originForScale:", 1.0);
  v23 = v22;
  v25 = v24;
  v34 = v36;
  v33 = v35;
  _transformAnim((__int128 *)&v34, (__int128 *)&v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  _positionAnim(v17, v19, v23, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBeginTime:", 0.216666676);
  objc_msgSend(v27, "setBeginTime:", 0.216666676);
  objc_msgSend(v26, "setDuration:", 0.0833333358);
  objc_msgSend(v27, "setDuration:", 0.0833333358);
  v37[0] = v14;
  v37[1] = v15;
  v37[2] = v20;
  v37[3] = v21;
  v37[4] = v26;
  v37[5] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimations:", v28);

  -[MKStandardCalloutView layer](self, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __64__MKStandardCalloutView__runBounceAnimationWithCompletionBlock___block_invoke;
  v31[3] = &unk_1E20D91C8;
  v31[4] = self;
  v32 = v4;
  v30 = v4;
  objc_msgSend(v29, "_mapkit_addAnimation:forKey:completion:", v5, CFSTR("MKCalloutViewBubbleAnimation"), v31);

}

uint64_t __64__MKStandardCalloutView__runBounceAnimationWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationDidStop:finished:context:", CFSTR("MKCalloutViewBubbleAnimation"), v4, 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (int64_t)anchorPosition
{
  return self->_anchor.position;
}

- (BOOL)isLeftAnchored
{
  return self->_anchor.position == 3;
}

- (void)annotationViewFrameDidChange
{
  void *v3;
  int v4;
  objc_super v5;
  _QWORD v6[5];

  -[MKCalloutView annotationView](self, "annotationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldKeepCalloutVisible");

  if (v4)
  {
    if ((unint64_t)(self->_anchor.position - 1) <= 1)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __53__MKStandardCalloutView_annotationViewFrameDidChange__block_invoke;
      v6[3] = &unk_1E20D7D98;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_performWithoutAnimation:", v6);
      v5.receiver = self;
      v5.super_class = (Class)MKStandardCalloutView;
      -[MKCalloutView annotationViewFrameDidChange](&v5, sel_annotationViewFrameDidChange);
    }
  }
}

uint64_t __53__MKStandardCalloutView_annotationViewFrameDidChange__block_invoke(uint64_t a1)
{
  float64x2_t v2;
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  __int128 v7;
  __int128 v8;
  float64x2_t v9;

  v2 = *(float64x2_t *)MEMORY[0x1E0C9D538];
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *MEMORY[0x1E0C9D648];
  v8 = v3;
  v9 = v2;
  objc_msgSend(*(id *)(a1 + 32), "forceAnchorPosition:", objc_msgSend(*(id *)(a1 + 32), "_calculateAnchorPosition:visibleRect:", &v9, &v7));
  v9 = vrndaq_f64(v9);
  *(float64x2_t *)(*(_QWORD *)(a1 + 32) + 472) = v9;
  v4 = *(_QWORD *)(a1 + 32) + 432;
  v5 = v7;
  *(_OWORD *)(v4 + 72) = v8;
  *(_OWORD *)(v4 + 56) = v5;
  objc_msgSend(*(id *)(a1 + 32), "_layoutSubviews:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "_mapkit_layoutIfNeeded");
}

- (void)_showFromAnchorPoint:(CGPoint)a3 boundaryRect:(CGRect)a4 animate:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL4 v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v11;
  CGFloat v12;
  void (**v14)(_QWORD);
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);

  v6 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3.y;
  v12 = a3.x;
  v14 = (void (**)(_QWORD))a6;
  -[MKStandardCalloutView completeBounceAnimation](self, "completeBounceAnimation");
  self->_anchor.desiredPoint.x = v12;
  self->_anchor.desiredPoint.y = v11;
  self->_anchor.desiredBounds.origin.x = x;
  self->_anchor.desiredBounds.origin.y = y;
  self->_anchor.desiredBounds.size.width = width;
  self->_anchor.desiredBounds.size.height = height;
  self->_flags = ($A0210CD9D506E42BFA64C98EA1A83F0A)(*(_DWORD *)&self->_flags & 0xFFFFFFFC | v6);
  -[MKCalloutView annotationView](self, "annotationView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self);

  -[MKStandardCalloutView _layoutSubviews:](self, "_layoutSubviews:", 0);
  -[UIView _mapkit_layoutIfNeeded](self->_calloutView, "_mapkit_layoutIfNeeded");
  -[UIView _mapKit_setNeedsDisplay](self, "_mapKit_setNeedsDisplay");
  -[MKStandardCalloutView setAlpha:](self, "setAlpha:", 1.0);
  if (v6)
  {
    -[UIView _mapkit_layoutIfNeeded](self, "_mapkit_layoutIfNeeded");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__MKStandardCalloutView__showFromAnchorPoint_boundaryRect_animate_completionBlock___block_invoke;
    v16[3] = &unk_1E20D7EF8;
    v17 = v14;
    -[MKStandardCalloutView _runBounceAnimationWithCompletionBlock:](self, "_runBounceAnimationWithCompletionBlock:", v16);

  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    -[MKStandardCalloutView _markDidMoveCalled](self, "_markDidMoveCalled");
    v14[2](v14);
  }

}

uint64_t __83__MKStandardCalloutView__showFromAnchorPoint_boundaryRect_animate_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)animationDidStop:(id)a3 finished:(id)a4 context:(void *)a5
{
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  if ((objc_msgSend(a4, "BOOLValue") & 1) != 0)
  {
    if (a3 != CFSTR("MKCalloutViewBubbleAnimation"))
      return;
    -[MKStandardCalloutView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v13 = *MEMORY[0x1E0C9BAA8];
    v14 = v8;
    v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v7, "setAffineTransform:", &v13);
  }
  else
  {
    -[MKStandardCalloutView setAlpha:](self, "setAlpha:", 1.0);
    if (a3 != CFSTR("MKCalloutViewBubbleAnimation"))
      return;
    -[MKStandardCalloutView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v18 = v9;
    v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v20 = v10;
    v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v13 = *MEMORY[0x1E0CD2610];
    v14 = v11;
    v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v16 = v12;
    objc_msgSend(v7, "setTransform:", &v13);
  }

  -[MKStandardCalloutView setFrame:](self, "setFrame:", self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    -[MKStandardCalloutView _markDidMoveCalled](self, "_markDidMoveCalled");
}

- (void)_markDidMoveCalled
{
  $A0210CD9D506E42BFA64C98EA1A83F0A flags;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
    self->_flags = ($A0210CD9D506E42BFA64C98EA1A83F0A)(*(_DWORD *)&flags | 2);
    if ((*(_BYTE *)&flags & 4) != 0)
    {
      self->_flags = ($A0210CD9D506E42BFA64C98EA1A83F0A)(*(_DWORD *)&flags & 0xFFFFFFF9 | 2);
      -[MKStandardCalloutView _layoutSubviews:](self, "_layoutSubviews:", 1);
    }
  }
}

- (void)completeBounceAnimation
{
  CGRect *p_frame;
  void *v4;
  void *v5;
  __int128 v6;
  _OWORD v7[3];

  p_frame = &self->_frame;
  if (!CGRectIsEmpty(self->_frame))
  {
    -[MKStandardCalloutView layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllAnimations");

    -[MKStandardCalloutView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v7[0] = *MEMORY[0x1E0C9BAA8];
    v7[1] = v6;
    v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v5, "setAffineTransform:", v7);

    -[MKStandardCalloutView setFrame:](self, "setFrame:", p_frame->origin.x, p_frame->origin.y, p_frame->size.width, p_frame->size.height);
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      -[MKStandardCalloutView _markDidMoveCalled](self, "_markDidMoveCalled");
  }
}

- (void)motionEffectDidUpdate:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  _OWORD v19[8];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[8];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v4 = a3;
  -[MKSmallCalloutView bounds](self->_calloutView, "bounds");
  if (v5 <= v6)
    v7 = v6;
  else
    v7 = v5;
  v8 = v7 / 1920.0;
  v9 = v8 <= 0.0;
  v10 = 1.0;
  v11 = v8 < 1.0 || v8 <= 0.0;
  if (v8 >= 1.0)
    v9 = 1;
  if (v11)
    v10 = 0.0;
  if (v9)
    v8 = v10;
  v12 = fmin(fmax(v8 * -0.25 + 0.119999997, 0.0250000004), 1.20000005);
  v13 = fmin(fmax(v8 * 30.0 + 6.0, 0.0), 10.0);
  if (v4)
  {
    objc_msgSend(v4, "transformWithTranslationScale:rotationScale:", v13, v13, v12, v12);
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
  }
  -[UIView layer](self->_contentView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v33;
  v28[5] = v34;
  v28[6] = v35;
  v28[7] = v36;
  v28[0] = v29;
  v28[1] = v30;
  v28[2] = v31;
  v28[3] = v32;
  objc_msgSend(v14, "setTransform:", v28);

  if (v4)
  {
    objc_msgSend(v4, "transformWithTranslationScale:rotationScale:", v13 / -3.0, v13 / -3.0, v12 / -3.0, v12 / -3.0);
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
  }
  -[MKSmallCalloutView titlesContainerView](self->_calloutView, "titlesContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v24;
  v19[5] = v25;
  v19[6] = v26;
  v19[7] = v27;
  v19[0] = v20;
  v19[1] = v21;
  v19[2] = v22;
  v19[3] = v23;
  objc_msgSend(v16, "setTransform:", v19);

  objc_msgSend(v4, "offsetWithScale:", v13, 0.0);
  v18 = v17;
  -[_MKCalloutLayer setArrowOffset:](self->_maskLayer, "setArrowOffset:");
  -[_MKCalloutLayer setArrowOffset:](self->_contentStrokeLayer, "setArrowOffset:", v18);

}

- (BOOL)hasPendingVisibility
{
  return self->_animatingMapToShow;
}

- (int64_t)_calculateAnchorPosition:(CGPoint *)a3 visibleRect:(CGRect *)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  char v14;
  char v15;
  char v16;
  char v17;
  id v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v24;
  double v25;
  double v26;
  id v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double MaxX;
  double v33;
  double v34;
  double v35;
  _BOOL4 v36;
  int v37;
  id v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  double MidY;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  int64_t v56;
  id v57;
  double v58;
  double MidX;
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
  id v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  double v76;
  double MaxY;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  -[MKCalloutView annotationView](self, "annotationView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_visibleCenteringRectInView:", v6);
  v82 = v8;
  v83 = v9;
  v11 = v10;
  v13 = v12;

  v14 = objc_msgSend(v6, "_allowedCalloutEdges");
  v15 = objc_msgSend(v6, "_allowedCalloutEdges");
  v16 = objc_msgSend(v6, "_allowedCalloutEdges");
  v17 = objc_msgSend(v6, "_allowedCalloutEdges");
  if ((v14 & 1) != 0)
    goto LABEL_10;
  if (v15 & 2 | (unint64_t)(v16 & 8))
  {
    v18 = v6;
    objc_msgSend(v18, "bounds");
    x = v84.origin.x;
    y = v84.origin.y;
    width = v84.size.width;
    height = v84.size.height;
    MinX = CGRectGetMinX(v84);
    v85.origin.x = x;
    v85.origin.y = y;
    v85.size.width = width;
    v85.size.height = height;
    objc_msgSend(v18, "leftCalloutOffset", CGRectGetMidY(v85));
    v25 = v24;

    v26 = MinX + v25;
    v27 = v18;
    objc_msgSend(v27, "bounds");
    v28 = v86.origin.x;
    v29 = v86.origin.y;
    v30 = v86.size.width;
    v31 = v86.size.height;
    MaxX = CGRectGetMaxX(v86);
    v87.origin.x = v28;
    v87.origin.y = v29;
    v87.size.width = v30;
    v87.size.height = v31;
    objc_msgSend(v27, "rightCalloutOffset", CGRectGetMidY(v87));
    v34 = v33;

    v88.origin.x = v82;
    v88.origin.y = v83;
    v88.size.width = v11;
    v88.size.height = v13;
    v35 = vabdd_f64(v26, CGRectGetMinX(v88));
    v89.origin.x = v82;
    v89.origin.y = v83;
    v89.size.width = v11;
    v89.size.height = v13;
    v36 = v35 > vabdd_f64(MaxX + v34, CGRectGetMaxX(v89));
    v37 = (v16 & 8) == 0 || v36;
    v38 = v27;
    objc_msgSend(v38, "bounds");
    v43 = v39;
    v44 = v40;
    v45 = v41;
    v46 = v42;
    if ((v15 & 2) != 0 && v37)
    {
      v47 = CGRectGetMinX(*(CGRect *)&v39);
      v90.origin.x = v43;
      v90.origin.y = v44;
      v90.size.width = v45;
      v90.size.height = v46;
      MidY = CGRectGetMidY(v90);
      objc_msgSend(v38, "leftCalloutOffset");
      v50 = v49;
      v52 = v51;

      v53 = v47 + v50;
      v54 = MidY + v52;
      objc_msgSend(v38, "frame");
      v55 = CGRectGetWidth(v91);
      v56 = 4;
    }
    else
    {
      v64 = CGRectGetMaxX(*(CGRect *)&v39);
      v94.origin.x = v43;
      v94.origin.y = v44;
      v94.size.width = v45;
      v94.size.height = v46;
      v65 = CGRectGetMidY(v94);
      objc_msgSend(v38, "rightCalloutOffset");
      v67 = v66;
      v69 = v68;

      v53 = v64 + v67;
      v54 = v65 + v69;
      objc_msgSend(v38, "frame");
      v55 = CGRectGetWidth(v95);
      objc_msgSend(v38, "frame");
      v82 = v82 + CGRectGetWidth(v96);
      v56 = 3;
    }
    v11 = v11 - v55;
    if (!a3)
      goto LABEL_15;
    goto LABEL_14;
  }
  if ((v17 & 4) == 0)
  {
LABEL_10:
    v57 = v6;
    objc_msgSend(v57, "bounds");
    v58 = v92.origin.y;
    MidX = CGRectGetMidX(v92);
    objc_msgSend(v57, "calloutOffset");
    v61 = v60;
    v63 = v62;

    v53 = MidX + v61;
    v54 = v58 + v63;
    objc_msgSend(v57, "frame");
    v13 = v13 - CGRectGetHeight(v93);
    v56 = 2;
    if (!a3)
      goto LABEL_15;
LABEL_14:
    a3->x = v53;
    a3->y = v54;
    goto LABEL_15;
  }
  v71 = v6;
  objc_msgSend(v71, "bounds");
  v72 = v97.origin.x;
  v73 = v97.origin.y;
  v74 = v97.size.width;
  v75 = v97.size.height;
  v76 = CGRectGetMidX(v97);
  v98.origin.x = v72;
  v98.origin.y = v73;
  v98.size.width = v74;
  v98.size.height = v75;
  MaxY = CGRectGetMaxY(v98);
  objc_msgSend(v71, "_bottomCalloutOffset");
  v79 = v78;
  v81 = v80;

  v53 = v76 + v79;
  v54 = MaxY + v81;
  objc_msgSend(v71, "frame");
  v83 = v83 + CGRectGetHeight(v99);
  objc_msgSend(v71, "frame");
  v13 = v13 - CGRectGetHeight(v100);
  v56 = 1;
  if (a3)
    goto LABEL_14;
LABEL_15:
  if (a4)
  {
    a4->origin.x = v82;
    a4->origin.y = v83;
    a4->size.width = v11;
    a4->size.height = v13;
  }

  return v56;
}

- (void)showAnimated:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double *v8;
  int64_t v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  $E0CD17A120EE6D90D6AA8034B435FD1B *p_metrics;
  double v21;
  double margin;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double arrowHeight;
  double Height;
  double v30;
  double v31;
  double MinY;
  CGRect v33;
  double v34;
  double MaxX;
  CGRect v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  MKStandardCalloutView *v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  _BYTE v64[32];
  double v65;
  __int128 v66;
  double v67;
  _QWORD v68[5];
  id v69;
  id v70;
  __int128 v71;
  BOOL v72;
  CGRect v73;
  __int128 v74;
  CGRect v75;
  __int128 v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v4 = a3;
  v6 = a4;
  -[MKCalloutView annotationView](self, "annotationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_dismissed = 0;
  self->_animatingMapToShow = 0;
  -[MKStandardCalloutView _updateCalloutAnimated:](self, "_updateCalloutAnimated:", 0);
  v8 = (double *)MEMORY[0x1E0C9D538];
  v76 = *MEMORY[0x1E0C9D538];
  v66 = v76;
  *(_OWORD *)&v64[16] = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v75.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  *(CGPoint *)v64 = v75.origin;
  v75.size = *(CGSize *)&v64[16];
  v9 = -[MKStandardCalloutView _calculateAnchorPosition:visibleRect:](self, "_calculateAnchorPosition:visibleRect:", &v76, &v75);
  -[MKStandardCalloutView forceAnchorPosition:](self, "forceAnchorPosition:", v9);
  -[MKStandardCalloutView updateConstraints](self, "updateConstraints");
  v73 = *(CGRect *)v64;
  v74 = v66;
  -[MKStandardCalloutView _calculateActualAnchorPoint:frame:forDesiredAnchorPoint:boundaryRect:](self, "_calculateActualAnchorPoint:frame:forDesiredAnchorPoint:boundaryRect:", &v74, &v73, v76, *(_OWORD *)&v75.origin, *(_OWORD *)&v75.size);
  v81 = CGRectOffset(v73, *(double *)&v76 - *(double *)&v74, *((double *)&v76 + 1) - *((double *)&v74 + 1));
  v77 = CGRectUnion(v75, v81);
  CGRectIntegral(v77);
  objc_msgSend(v7, "frame");
  v14 = v10;
  v65 = *v8;
  v67 = v8[1];
  if (!v4)
  {
    v26 = *v8;
    v27 = v8[1];
    goto LABEL_25;
  }
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v19 = *((double *)&v76 + 1);
  v18 = *(double *)&v76;
  if ((unint64_t)(v9 - 3) < 2)
  {
    p_metrics = &self->_metrics;
    margin = self->_metrics.margin;
    arrowHeight = self->_metrics.arrowHeight;
    v63 = margin + arrowHeight + CGRectGetHeight(v73) * 0.5;
    v79.origin.x = v14;
    v79.origin.y = v15;
    v79.size.width = v16;
    v79.size.height = v17;
    Height = CGRectGetHeight(v79);
    if (Height <= CGRectGetHeight(v73) * 0.5)
    {
      v25 = CGRectGetHeight(v73) * 0.5;
    }
    else
    {
      v80.origin.x = v14;
      v80.origin.y = v15;
      v80.size.width = v16;
      v80.size.height = v17;
      v25 = CGRectGetHeight(v80);
    }
    v24 = v63;
    goto LABEL_11;
  }
  if ((unint64_t)(v9 - 1) <= 1)
  {
    p_metrics = &self->_metrics;
    v21 = self->_metrics.arrowHeight;
    margin = self->_metrics.margin + (self->_metrics.arrowBase + -1.0) * 0.5 + 8.0;
    v23 = v21 + CGRectGetHeight(*(CGRect *)&v10);
    v24 = v23 + CGRectGetHeight(v73) + self->_metrics.margin;
    v78.origin.x = v14;
    v78.origin.y = v15;
    v78.size.width = v16;
    v78.size.height = v17;
    v25 = CGRectGetHeight(v78);
LABEL_11:
    v31 = v18 - margin;
    v18 = v18 + margin;
    v30 = v19 + v25 + p_metrics->margin;
    v19 = v19 - v24;
    goto LABEL_12;
  }
  v30 = *((double *)&v76 + 1);
  v31 = *(double *)&v76;
LABEL_12:
  if (v9 == 4)
  {
    v31 = v31 - CGRectGetWidth(v73);
  }
  else if (v9 == 3)
  {
    v18 = v18 + CGRectGetWidth(v73);
  }
  MinY = CGRectGetMinY(v75);
  v33 = v75;
  if (v19 >= MinY)
  {
    v34 = v67;
    if (v30 > CGRectGetMaxY(v33))
      v34 = CGRectGetMaxY(v75) - v30;
  }
  else
  {
    v34 = CGRectGetMinY(v33) - v19;
  }
  MaxX = CGRectGetMaxX(v75);
  v36 = v75;
  if (v18 <= MaxX)
  {
    v37 = v65;
    if (v31 < CGRectGetMinX(v36))
      v37 = CGRectGetMinX(v75) - v31;
  }
  else
  {
    v37 = CGRectGetMaxX(v36) - v18;
  }
  -[MKCalloutView annotationView](self, "annotationView", *(_QWORD *)&v63);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCalloutView annotationView](self, "annotationView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "superview");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "convertPoint:toView:", v40, v65, v67);
  v42 = v41;
  v44 = v43;

  -[MKCalloutView annotationView](self, "annotationView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCalloutView annotationView](self, "annotationView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "superview");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "convertPoint:toView:", v47, v37, v34);
  v49 = v48;
  v51 = v50;

  v26 = v42 - v49;
  v27 = v44 - v51;
LABEL_25:
  *(_QWORD *)&v76 = round(*(double *)&v76);
  *((_QWORD *)&v76 + 1) = round(*((double *)&v76 + 1));
  if (v4)
  {
    if (fabs(v26) >= 1.0 || fabs(v27) >= 1.0)
    {
      self->_animatingMapToShow = 1;
      objc_msgSend(v7, "_mapView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_containerView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKCalloutView annotationView](self, "annotationView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "annotation");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "coordinate");
      v60 = v59;
      v62 = v61;
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __54__MKStandardCalloutView_showAnimated_completionBlock___block_invoke;
      v68[3] = &unk_1E20D91F0;
      v68[4] = self;
      v69 = v7;
      v71 = v76;
      v72 = v4;
      v70 = v6;
      objc_msgSend(v55, "annotationContainer:scrollToRevealCalloutWithOffset:annotationCoordinate:completionHandler:", v56, v68, round(v26), round(v27), v60, v62);

      goto LABEL_32;
    }
    v52 = self;
    v53 = v6;
    v54 = 1;
  }
  else
  {
    v52 = self;
    v54 = 0;
    v53 = v6;
  }
  -[MKStandardCalloutView _showFromAnchorPoint:boundaryRect:animate:completionBlock:](v52, "_showFromAnchorPoint:boundaryRect:animate:completionBlock:", v54, v53);
LABEL_32:
  -[MKStandardCalloutView _startObservingAnnotationView:](self, "_startObservingAnnotationView:", v7);

}

void __54__MKStandardCalloutView_showAnimated_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(*(id *)(a1 + 32), "annotationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 557);

    if (!v3)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 556) = 0;
      objc_msgSend(*(id *)(a1 + 40), "_containerView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_visibleCenteringRectInView:", *(_QWORD *)(a1 + 40));
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;

      objc_msgSend(*(id *)(a1 + 32), "_showFromAnchorPoint:boundaryRect:animate:completionBlock:", *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v6, v8, v10, v12);
    }
  }
}

- (void)dismissAnimated:(BOOL)a3 completionBlock:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  void (**v17)(_QWORD);
  _QWORD v18[5];

  v6 = (void (**)(_QWORD))a4;
  -[MKCalloutView annotationView](self, "annotationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKStandardCalloutView _stopObservingAnnotationView:](self, "_stopObservingAnnotationView:", v7);
  self->_dismissed = 1;
  if (a3)
  {
    v8 = (void *)MEMORY[0x1E0CEABB0];
    UIAnimationDragCoefficient();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v10 = (float)(v9 * 0.1);
    v18[2] = __57__MKStandardCalloutView_dismissAnimated_completionBlock___block_invoke;
    v18[3] = &unk_1E20D7D98;
    v18[4] = self;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __57__MKStandardCalloutView_dismissAnimated_completionBlock___block_invoke_2;
    v16 = &unk_1E20D8688;
    v17 = v6;
    objc_msgSend(v8, "_mapkit_animateWithDuration:animations:completion:", v18, &v13, v10);

    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[MKStandardCalloutView setAlpha:](self, "setAlpha:", 0.0);
  v6[2](v6);
  if (v7)
  {
LABEL_5:
    objc_msgSend(v7, "leftCalloutAccessoryView", v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKStandardCalloutView _removeAccessoryTargetForView:](self, "_removeAccessoryTargetForView:", v11);

    objc_msgSend(v7, "rightCalloutAccessoryView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKStandardCalloutView _removeAccessoryTargetForView:](self, "_removeAccessoryTargetForView:", v12);

  }
LABEL_6:

}

uint64_t __57__MKStandardCalloutView_dismissAnimated_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __57__MKStandardCalloutView_dismissAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_calloutAccessoryControlTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MKCalloutView annotationView](self, "annotationView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "annotationContainer:annotationView:calloutAccessoryControlTapped:", v6, v7, v4);

}

- (void)_addAccessoryTargetForView:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__calloutAccessoryControlTapped_, 64);

}

- (void)_removeAccessoryTargetForView:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, sel__calloutAccessoryControlTapped_, 64);

}

- (void)_updateCallout
{
  -[MKStandardCalloutView _updateCalloutAnimated:](self, "_updateCalloutAnimated:", 1);
}

- (void)_updateCalloutAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _BOOL4 v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  -[MKCalloutView annotationView](self, "annotationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&self->_flags &= ~8u;
  v17 = v5;
  if (v3)
  {
    -[UIView _mapkit_layoutBelowIfNeeded](self, "_mapkit_layoutBelowIfNeeded");
    v5 = v17;
  }
  objc_msgSend(v5, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MKStandardCalloutView hideTitle](self, "hideTitle");
  if (-[MKStandardCalloutView hideTitle](self, "hideTitle"))
  {
    v8 = !v7;
    -[MKStandardCalloutView setTitle:](self, "setTitle:", 0);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0
         && (objc_msgSend(v6, "title"),
             v9 = (void *)objc_claimAutoreleasedReturnValue(),
             v10 = objc_msgSend(v9, "length"),
             v9,
             v10))
  {
    objc_msgSend(v6, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKStandardCalloutView setTitle:](self, "setTitle:", v11);

    v8 = 1;
  }
  else
  {
    -[MKStandardCalloutView setTitle:](self, "setTitle:", 0);
    v8 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "subtitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v17, "leftCalloutAccessoryView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rightCalloutAccessoryView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKStandardCalloutView setLeftView:backgroundColor:animated:](self, "setLeftView:backgroundColor:animated:", v13, 0, v3);
  -[MKStandardCalloutView setRightView:animated:](self, "setRightView:animated:", v14, v3);
  objc_msgSend(v17, "detailCalloutAccessoryView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v17, "detailCalloutAccessoryView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKStandardCalloutView setDetailView:animated:](self, "setDetailView:animated:", v16, v3);

  }
  else if (v8)
  {
    -[MKStandardCalloutView setDetailView:animated:](self, "setDetailView:animated:", 0, v3);
    -[MKStandardCalloutView setSubtitle:animated:](self, "setSubtitle:animated:", v12, v3);
  }
  -[MKStandardCalloutView _addAccessoryTargetForView:](self, "_addAccessoryTargetForView:", v13);
  -[MKStandardCalloutView _addAccessoryTargetForView:](self, "_addAccessoryTargetForView:", v14);
  if (v3)
    -[MKStandardCalloutView _layoutSubviews:](self, "_layoutSubviews:", 1);

}

- (void)_setNeedsCalloutUpdate
{
  $A0210CD9D506E42BFA64C98EA1A83F0A flags;
  _QWORD block[5];

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
    self->_flags = ($A0210CD9D506E42BFA64C98EA1A83F0A)(*(_DWORD *)&flags | 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__MKStandardCalloutView__setNeedsCalloutUpdate__block_invoke;
    block[3] = &unk_1E20D7D98;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

_BYTE *__47__MKStandardCalloutView__setNeedsCalloutUpdate__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if ((result[552] & 8) != 0)
    return (_BYTE *)objc_msgSend(result, "_updateCalloutAnimated:", 1);
  return result;
}

- (void)_startObservingAnnotationView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    v4 = a3;
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("annotation.title"), 3, 0);
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("annotation.subtitle"), 3, 0);
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, 0x1E20E6560, 3, 0);
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, 0x1E20E6580, 3, 0);
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, 0x1E20E65A0, 3, 0);
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, 0x1E20E6540, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "annotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__updateCallout, CFSTR("MKAnnotationCalloutInfoDidChangeNotification"), v6);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
}

- (void)_stopObservingAnnotationView:(id)a3
{
  id v4;
  void *v5;

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    v4 = a3;
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("annotation.title"));
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("annotation.subtitle"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("MKAnnotationCalloutInfoDidChangeNotification"), 0);

    objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E20E6560);
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E20E6580);
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E20E65A0);
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E20E6540);

    *(_DWORD *)&self->_flags &= ~0x10u;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *MEMORY[0x1E0CB2CC8];
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 != v15)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("annotation.title")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToString:", CFSTR("annotation.subtitle")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToString:", 0x1E20E65A0) & 1) != 0
      || objc_msgSend(v10, "isEqualToString:", 0x1E20E6540))
    {
      -[MKStandardCalloutView _setNeedsCalloutUpdate](self, "_setNeedsCalloutUpdate");
    }
    else if ((objc_msgSend(v10, "isEqualToString:", 0x1E20E6560) & 1) != 0
           || objc_msgSend(v10, "isEqualToString:", 0x1E20E6580))
    {
      objc_msgSend(v12, "objectForKey:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKStandardCalloutView _removeAccessoryTargetForView:](self, "_removeAccessoryTargetForView:", v16);
      -[MKStandardCalloutView _setNeedsCalloutUpdate](self, "_setNeedsCalloutUpdate");

    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)MKStandardCalloutView;
      -[MKStandardCalloutView observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
    }
  }

}

- (void)_adaptToUserInterfaceStyle
{
  int64_t style;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  style = self->_style;
  if (style == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 9);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](self->_backdropView, "setEffect:", v9);

    -[UIVisualEffectView setBackgroundColor:](self->_backdropView, "setBackgroundColor:", 0);
    -[MKStandardCalloutView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceStyle");

    -[MKStandardCalloutView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    if (v11 == 2)
      LODWORD(v8) = 1050253722;
    else
      LODWORD(v8) = 1041865114;
    goto LABEL_10;
  }
  if (!style)
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](self->_backdropView, "setEffect:", v4);

    -[UIVisualEffectView setBackgroundColor:](self->_backdropView, "setBackgroundColor:", 0);
    -[MKStandardCalloutView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");

    -[MKStandardCalloutView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    if (v6 == 2)
      LODWORD(v8) = 1051931443;
    else
      LODWORD(v8) = 1036831949;
LABEL_10:
    objc_msgSend(v7, "setShadowOpacity:", v8);

  }
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a4;
  -[MKStandardCalloutView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = objc_msgSend(v5, "userInterfaceStyle");

  if (v7 != v8)
    -[MKStandardCalloutView _adaptToUserInterfaceStyle](self, "_adaptToUserInterfaceStyle");
}

- (BOOL)hideTitle
{
  return self->_hideTitle;
}

- (void)setHideTitle:(BOOL)a3
{
  self->_hideTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionEffect, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_calloutView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentStrokeLayer, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
}

@end
