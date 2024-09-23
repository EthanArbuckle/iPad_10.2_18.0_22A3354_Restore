@implementation NTKDialView

- (NTKDialView)initWithNumberOfMarkers:(unint64_t)a3 markersFactory:(id)a4
{
  return -[NTKDialView initWithNumberOfMarkers:markersFactory:angleProvider:](self, "initWithNumberOfMarkers:markersFactory:angleProvider:", a3, a4, 0);
}

- (NTKDialView)initWithNumberOfMarkers:(unint64_t)a3 markersFactory:(id)a4 angleProvider:(id)a5
{
  id v8;
  id v9;
  NTKDialView *v10;
  void *v11;
  uint64_t v12;
  CLKDevice *device;
  void *v14;
  id angleProvider;
  void *v16;
  id markersFactory;
  uint64_t v18;
  NSMutableArray *markers;
  UIView *v20;
  UIView *markerContainerView;
  void *v22;
  objc_super v24;

  v8 = a4;
  v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)NTKDialView;
  v10 = -[NTKDialView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v10)
  {
    +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = objc_claimAutoreleasedReturnValue();
    device = v10->_device;
    v10->_device = (CLKDevice *)v12;

    v14 = _Block_copy(v9);
    angleProvider = v10->_angleProvider;
    v10->_angleProvider = v14;

    v10->_numberOfMarkers = a3;
    v16 = _Block_copy(v8);
    markersFactory = v10->_markersFactory;
    v10->_markersFactory = v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v18 = objc_claimAutoreleasedReturnValue();
    markers = v10->_markers;
    v10->_markers = (NSMutableArray *)v18;

    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    markerContainerView = v10->_markerContainerView;
    v10->_markerContainerView = v20;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10->_markerContainerView, "setBackgroundColor:", v22);

    -[NTKDialView addSubview:](v10, "addSubview:", v10->_markerContainerView);
    v10->_shouldPixelAlignCenterPoints = 1;
  }

  return v10;
}

- (void)layoutSubviews
{
  double Width;
  double Height;
  objc_super v5;
  CGRect v6;
  CGRect v7;

  v5.receiver = self;
  v5.super_class = (Class)NTKDialView;
  -[NTKDialView layoutSubviews](&v5, sel_layoutSubviews);
  -[NTKDialView bounds](self, "bounds");
  -[UIView setFrame:](self->_markerContainerView, "setFrame:");
  -[NTKDialView bounds](self, "bounds");
  Width = CGRectGetWidth(v6);
  -[NTKDialView bounds](self, "bounds");
  Height = CGRectGetHeight(v7);
  if (Width < Height)
    Height = Width;
  -[NTKDialView setDiameter:](self, "setDiameter:", Height);
  if (self->_needsLayoutMarkers)
  {
    self->_needsLayoutMarkers = 0;
    -[NTKDialView layoutMarkers](self, "layoutMarkers");
  }
}

- (void)replaceMarker:(id)a3 atIndex:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (-[NSMutableArray count](self->_markers, "count") > (unint64_t)a4)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_markers, "objectAtIndexedSubscript:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromParent");
    -[NSMutableArray setObject:atIndexedSubscript:](self->_markers, "setObject:atIndexedSubscript:", v7, a4);
    objc_msgSend(v7, "addToParentView:", self->_markerContainerView);
    -[NTKDialView layoutMarkers](self, "layoutMarkers");

  }
}

- (void)reloadMarkers
{
  -[NTKDialView enumerateMarkers:](self, "enumerateMarkers:", &__block_literal_global_23);
  -[NSMutableArray removeAllObjects](self->_markers, "removeAllObjects");
  -[NTKDialView layoutMarkers](self, "layoutMarkers");
}

uint64_t __28__NTKDialView_reloadMarkers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromParent");
}

- (void)enumerateMarkers:(id)a3
{
  id v4;
  NSMutableArray *markers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  markers = self->_markers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__NTKDialView_enumerateMarkers___block_invoke;
  v7[3] = &unk_1E6BCFA08;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](markers, "enumerateObjectsUsingBlock:", v7);

}

void __32__NTKDialView_enumerateMarkers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v3 != v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = v5;
  }

}

- (void)setDiameter:(double)a3
{
  double v5;

  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_diameter = a3;
    -[NTKDialView totalDiameter](self, "totalDiameter");
    if (v5 > 0.0)
      -[NTKDialView layoutMarkers](self, "layoutMarkers");
  }
}

- (void)setContentInset:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_contentInset = a3;
    self->_needsLayoutMarkers = 1;
    -[NTKDialView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)totalDiameter
{
  double diameter;

  -[NTKDialView contentDiameter](self, "contentDiameter");
  if (!(uint64_t)diameter)
    diameter = self->_diameter;
  return diameter - self->_contentInset;
}

- (void)setAngleOffset:(double)a3
{
  double v4;

  if (self->_angleOffset != a3)
  {
    self->_angleOffset = a3;
    -[NTKDialView totalDiameter](self, "totalDiameter");
    if (v4 > 0.0)
      -[NTKDialView layoutMarkers](self, "layoutMarkers");
  }
}

- (double)searchForClosestMarkerAngleAtAngle:(double)a3
{
  double result;

  -[NTKDialView angleForIndex:](self, "angleForIndex:", (double)-[NTKDialView searchForClosestIndexAtAngle:](self, "searchForClosestIndexAtAngle:", a3));
  return result;
}

- (unint64_t)searchForClosestIndexAtAngle:(double)a3
{
  double v4;
  uint64_t v5;

  v4 = 360.0 / (double)-[NTKDialView numberOfMarkers](self, "numberOfMarkers");
  if ((uint64_t)v4 - (uint64_t)a3 % (uint64_t)v4 > (uint64_t)a3 % (uint64_t)v4)
    v5 = (uint64_t)a3 / (uint64_t)v4;
  else
    v5 = (uint64_t)a3 / (uint64_t)v4 + 1;
  return (v5 % 24) & ~((v5 % 24) >> 63);
}

- (void)setDisableLayout:(BOOL)a3
{
  self->_disableLayout = a3;
  if (!a3 && self->_needsLayoutMarkers)
  {
    self->_needsLayoutMarkers = 0;
    -[NTKDialView layoutMarkers](self, "layoutMarkers");
  }
}

- (void)layoutMarkers
{
  void *v2;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Width;
  double Height;
  double contentInset;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  float64_t v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  _BOOL4 v41;
  char v42;
  void *v43;
  int v44;
  void *v45;
  void (**v46)(_QWORD, _QWORD);
  CGFloat v47;
  char isKindOfClass;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  float64x2_t v66;
  CGAffineTransform v67;
  CGAffineTransform v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGRect v71;
  CGRect v72;

  if (self->_disableLayout)
  {
    self->_needsLayoutMarkers = 1;
    return;
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[NTKDialView bounds](self, "bounds");
  v5 = v4;
  -[NTKDialView bounds](self, "bounds");
  v7 = v6;
  -[NTKDialView contentDiameter](self, "contentDiameter");
  v9 = v8;
  if (!(uint64_t)v8)
  {
    -[NTKDialView frame](self, "frame");
    Width = CGRectGetWidth(v71);
    -[NTKDialView frame](self, "frame");
    Height = CGRectGetHeight(v72);
    if (Width >= Height)
      v9 = Height;
    else
      v9 = Width;
  }
  contentInset = self->_contentInset;
  v13 = MEMORY[0x1BCCA72B8](-[NTKDialView bounds](self, "bounds"));
  v15 = v14;
  if (-[NTKDialView numberOfMarkers](self, "numberOfMarkers"))
  {
    v16 = 0;
    v17 = v5 * 0.5;
    v18 = v7 * 0.5;
    v19 = (uint64_t)((v9 - contentInset) * 0.5);
    v20 = 0x1EF15B000uLL;
    v21 = -180.0;
    v63 = v15;
    while (1)
    {
      v22 = (void *)MEMORY[0x1BCCA7FA8]();
      -[NTKDialView markerAtIndex:](self, "markerAtIndex:", v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        break;
LABEL_37:

      objc_autoreleasePoolPop(v22);
      if (++v16 >= -[NTKDialView numberOfMarkers](self, "numberOfMarkers"))
        goto LABEL_38;
    }
    -[NTKDialView angleForIndex:](self, "angleForIndex:", (double)v16);
    v25 = v24 + *(double *)((char *)&self->super.super.super.isa + *(int *)(v20 + 2668));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v23;
      v27 = objc_msgSend(v26, "interior");
      v28 = v25 + v21;
      if (!v27)
        v28 = v25;
      -[NTKDialView _layoutCurvedLabel:rotationAngle:](self, "_layoutCurvedLabel:rotationAngle:", v26, v28);
LABEL_36:

      goto LABEL_37;
    }
    -[NTKDialView centerPointForAngle:radius:](self, "centerPointForAngle:radius:", v19, v25);
    v64 = v30;
    v65 = v29;
    CGAffineTransformMakeTranslation(&v70, v18, v17);
    v66 = vaddq_f64(*(float64x2_t *)&v70.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v70.c, v64), *(float64x2_t *)&v70.a, v65));
    v31 = v66.f64[1];
    if (-[NTKDialView shouldPixelAlignCenterPoints](self, "shouldPixelAlignCenterPoints"))
    {
      -[NTKDialView device](self, "device");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      CLKPointRoundForDevice();
      v66.f64[0] = v33;
      v31 = v34;

    }
    objc_msgSend(v23, "setPosition:", v13, v15);
    v35 = v66.f64[0] - v13;
    v36 = v31 - v15;
    if (-[NTKDialView shouldPixelAlignCenterPoints](self, "shouldPixelAlignCenterPoints"))
    {
      -[NTKDialView device](self, "device");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      CLKRoundForDevice();
      v35 = v38;

      -[NTKDialView device](self, "device");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      CLKRoundForDevice();
      v36 = v40;

    }
    memset(&v69, 0, sizeof(v69));
    CGAffineTransformMakeTranslation(&v69, v35, v36);
    v41 = -[NTKDialView shouldRotateMarkers](self, "shouldRotateMarkers");
    if (v41)
    {
      -[NTKDialView markersToRotateIndexSet](self, "markersToRotateIndexSet");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v2, "containsIndex:", v16) & 1) == 0)
      {

        goto LABEL_30;
      }
      if (-[NTKDialView shouldRotateMarkers](self, "shouldRotateMarkers"))
      {

LABEL_23:
        v42 = 0;
        goto LABEL_33;
      }
    }
    else if (-[NTKDialView shouldRotateMarkers](self, "shouldRotateMarkers"))
    {
      goto LABEL_23;
    }
    -[NTKDialView markersToRotateIndexSet](self, "markersToRotateIndexSet");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "containsIndex:", v16);

    if (v41)
    {

      if ((v44 & 1) == 0)
      {
LABEL_26:
        v42 = 0;
        v20 = 0x1EF15B000;
LABEL_33:
        v68 = v69;
        objc_msgSend(v23, "_setAffineTransform:", &v68);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((v42 & 1) != 0 || (isKindOfClass & 1) == 0)
          goto LABEL_37;
        v26 = v23;
        objc_msgSend(v26, "frame");
        v50 = v49;
        v51 = v13;
        v52 = v21;
        v53 = v18;
        v54 = v17;
        v56 = v55;
        -[NTKDialView device](self, "device");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        CLKPointRoundForDevice();
        v59 = v58;
        v61 = v60;

        v62 = v56;
        v17 = v54;
        v18 = v53;
        v21 = v52;
        v13 = v51;
        v15 = v63;
        objc_msgSend(v26, "setFrame:", v59, v61, v50, v62);
        goto LABEL_36;
      }
    }
    else if (!v44)
    {
      goto LABEL_26;
    }
    v20 = 0x1EF15B000;
LABEL_30:
    -[NTKDialView markerRotationProvider](self, "markerRotationProvider");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      -[NTKDialView markerRotationProvider](self, "markerRotationProvider");
      v46 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v46[2](v46, v16);

    }
    CLKDegreesToRadians();
    v67 = v69;
    CGAffineTransformRotate(&v68, &v67, v47);
    v69 = v68;
    v42 = 1;
    goto LABEL_33;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
}

- (void)_layoutCurvedLabel:(id)a3 rotationAngle:(double)a4
{
  __int128 v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  __int128 v25;
  _OWORD v26[3];
  CGRect v27;
  CGRect v28;

  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v26[0] = *MEMORY[0x1E0C9BAA8];
  v26[1] = v5;
  v26[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v6 = a3;
  objc_msgSend(v6, "setTransform:", v26);
  objc_msgSend(v6, "frame");
  objc_msgSend(v6, "sizeThatFits:", v7, v8);
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, v9, v10);
  v11 = MEMORY[0x1BCCA72B8](-[NTKDialView bounds](self, "bounds"));
  v13 = v12;
  v25 = *MEMORY[0x1E0C9D538];
  objc_msgSend(v6, "getTextCenter:startAngle:endAngle:", &v25, 0, 0);
  v14 = v25;
  v15 = v11 - *(double *)&v25;
  v16 = v13 - *((double *)&v25 + 1);
  objc_msgSend(v6, "frame");
  v17 = *(double *)&v14 - CGRectGetMidX(v27);
  v18 = *((double *)&v25 + 1);
  objc_msgSend(v6, "frame");
  v19 = v18 - CGRectGetMidY(v28);
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeTranslation(&v24, v15, v16);
  v22 = v24;
  CGAffineTransformTranslate(&v23, &v22, v17, v19);
  v24 = v23;
  CLKDegreesToRadians();
  v22 = v24;
  CGAffineTransformRotate(&v23, &v22, v20);
  v24 = v23;
  v22 = v23;
  CGAffineTransformTranslate(&v23, &v22, -v17, -v19);
  v24 = v23;
  v21 = v23;
  objc_msgSend(v6, "setTransform:", &v21);

}

- (void)setMarkerRotationProvider:(id)a3
{
  void *v4;
  id markerRotationProvider;

  v4 = _Block_copy(a3);
  markerRotationProvider = self->_markerRotationProvider;
  self->_markerRotationProvider = v4;

  -[NTKDialView layoutMarkers](self, "layoutMarkers");
}

- (void)setHidingMaskStartAngle:(id)a3
{
  void *v4;
  uint64_t v5;
  float v6;
  NSNumber *v7;
  NSNumber *hidingMaskStartAngle;
  id v9;

  v9 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_hidingMaskStartAngle, "isEqualToNumber:"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = objc_msgSend(v9, "floatValue");
    NTKNormalizeAngle(v5, v6);
    objc_msgSend(v4, "numberWithDouble:");
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    hidingMaskStartAngle = self->_hidingMaskStartAngle;
    self->_hidingMaskStartAngle = v7;

    -[NTKDialView updateMarkersVisibility](self, "updateMarkersVisibility");
  }

}

- (void)setHidingMaskEndAngle:(id)a3
{
  void *v4;
  uint64_t v5;
  float v6;
  NSNumber *v7;
  NSNumber *hidingMaskEndAngle;
  id v9;

  v9 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_hidingMaskEndAngle, "isEqualToNumber:"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = objc_msgSend(v9, "floatValue");
    NTKNormalizeAngle(v5, v6);
    objc_msgSend(v4, "numberWithDouble:");
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    hidingMaskEndAngle = self->_hidingMaskEndAngle;
    self->_hidingMaskEndAngle = v7;

    -[NTKDialView updateMarkersVisibility](self, "updateMarkersVisibility");
  }

}

- (void)updateMarkersVisibility
{
  unint64_t v3;
  void *v4;
  int v5;

  if (-[NTKDialView numberOfMarkers](self, "numberOfMarkers"))
  {
    v3 = 0;
    do
    {
      -[NTKDialView markerAtIndex:](self, "markerAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = -[NTKDialView shouldHideMarkerAtIndex:](self, "shouldHideMarkerAtIndex:", v3);
        objc_msgSend(v4, "alpha");
        if (v5 != CLKFloatEqualsFloat())
          objc_msgSend(v4, "setAlpha:", (double)(-[NTKDialView shouldHideMarkerAtIndex:](self, "shouldHideMarkerAtIndex:", v3) ^ 1));
      }

      ++v3;
    }
    while (v3 < -[NTKDialView numberOfMarkers](self, "numberOfMarkers"));
  }
}

- (BOOL)shouldHideMarkerAtIndex:(int64_t)a3
{
  double v4;
  double v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v11;
  float v12;
  float v13;

  if (!self->_hidingMaskStartAngle && !self->_hidingMaskEndAngle)
    return 0;
  -[NTKDialView angleForIndex:](self, "angleForIndex:", (double)a3);
  v5 = v4;
  -[NSNumber floatValue](self->_hidingMaskStartAngle, "floatValue");
  v7 = v6;
  -[NSNumber floatValue](self->_hidingMaskEndAngle, "floatValue");
  if (v7 >= v8)
    return v5 < 0.0
        || (-[NSNumber floatValue](self->_hidingMaskStartAngle, "floatValue"), v5 > v11)
        || (-[NSNumber floatValue](self->_hidingMaskEndAngle, "floatValue"), v5 < v12)
        || v5 > 360.0;
  -[NSNumber floatValue](self->_hidingMaskStartAngle, "floatValue");
  if (v5 < v9)
    return 0;
  -[NSNumber floatValue](self->_hidingMaskEndAngle, "floatValue");
  return v5 <= v13;
}

- (id)markerAtIndex:(unint64_t)a3
{
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (-[NSMutableArray count](self->_markers, "count") <= a3)
  {
    -[NTKDialView markersFactory](self, "markersFactory");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NTKDialView markers](self, "markers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v6);

      objc_msgSend(v6, "addToParentView:", self->_markerContainerView);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKDialView markers](self, "markers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v8);

    }
  }
  -[NTKDialView markers](self, "markers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
    v13 = 0;
  else
    v13 = v11;

  return v13;
}

- (double)angleForIndex:(double)a3
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  uint64_t v8;
  float v9;
  double v10;
  unint64_t v12;

  -[NTKDialView angleProvider](self, "angleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (-[NTKDialView angleProvider](self, "angleProvider"),
        v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
        v6[2](v6, (unint64_t)a3),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    v8 = objc_msgSend(v7, "floatValue");
    v10 = NTKNormalizeAngle(v8, v9);

    return v10;
  }
  else
  {
    v12 = -[NTKDialView numberOfMarkers](self, "numberOfMarkers");
    return NTKNormalizeAngle(v12, 360.0 / (double)v12 * a3);
  }
}

- (CGPoint)positionForMarkerAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  float64x2_t v11;
  double v12;
  double v13;
  double v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  CGPoint result;

  -[NTKDialView markers](self, "markers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3
    && (-[NTKDialView markerAtIndex:](self, "markerAtIndex:", a3),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    objc_msgSend(v7, "position");
    v13 = v10;
    v14 = v9;
    objc_msgSend(v8, "_getAffineTransform");

    v11 = vaddq_f64(v17, vmlaq_n_f64(vmulq_n_f64(v16, v13), v15, v14));
  }
  else
  {
    v11 = *(float64x2_t *)MEMORY[0x1E0C9D538];
  }
  v12 = v11.f64[1];
  result.x = v11.f64[0];
  result.y = v12;
  return result;
}

- (CGPoint)centerPointForAngle:(double)a3 radius:(int64_t)a4
{
  CGFloat v5;
  float64x2_t v6;
  double v7;
  CGAffineTransform v8;
  CGPoint result;

  CLKDegreesToRadians();
  memset(&v8, 0, sizeof(v8));
  CGAffineTransformMakeRotation(&v8, v5);
  v6 = vaddq_f64(*(float64x2_t *)&v8.tx, vmlaq_f64(vmulq_n_f64(*(float64x2_t *)&v8.c, (double)-a4), (float64x2_t)0, *(float64x2_t *)&v8.a));
  v7 = v6.f64[1];
  result.x = v6.f64[0];
  result.y = v7;
  return result;
}

- (double)contentInset
{
  return self->_contentInset;
}

- (double)contentDiameter
{
  return self->_contentDiameter;
}

- (void)setContentDiameter:(double)a3
{
  self->_contentDiameter = a3;
}

- (double)angleOffset
{
  return self->_angleOffset;
}

- (unint64_t)numberOfMarkers
{
  return self->_numberOfMarkers;
}

- (void)setNumberOfMarkers:(unint64_t)a3
{
  self->_numberOfMarkers = a3;
}

- (BOOL)shouldRotateMarkers
{
  return self->_shouldRotateMarkers;
}

- (void)setShouldRotateMarkers:(BOOL)a3
{
  self->_shouldRotateMarkers = a3;
}

- (NSIndexSet)markersToRotateIndexSet
{
  return self->_markersToRotateIndexSet;
}

- (void)setMarkersToRotateIndexSet:(id)a3
{
  objc_storeStrong((id *)&self->_markersToRotateIndexSet, a3);
}

- (BOOL)shouldPixelAlignCenterPoints
{
  return self->_shouldPixelAlignCenterPoints;
}

- (void)setShouldPixelAlignCenterPoints:(BOOL)a3
{
  self->_shouldPixelAlignCenterPoints = a3;
}

- (NSNumber)hidingMaskStartAngle
{
  return self->_hidingMaskStartAngle;
}

- (NSNumber)hidingMaskEndAngle
{
  return self->_hidingMaskEndAngle;
}

- (UIView)markerContainerView
{
  return self->_markerContainerView;
}

- (void)setMarkerContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_markerContainerView, a3);
}

- (BOOL)disableLayout
{
  return self->_disableLayout;
}

- (id)markerRotationProvider
{
  return self->_markerRotationProvider;
}

- (id)markersFactory
{
  return self->_markersFactory;
}

- (void)setMarkersFactory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (id)angleProvider
{
  return self->_angleProvider;
}

- (void)setAngleProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (double)diameter
{
  return self->_diameter;
}

- (NSMutableArray)markers
{
  return self->_markers;
}

- (void)setMarkers:(id)a3
{
  objc_storeStrong((id *)&self->_markers, a3);
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (BOOL)needsLayoutMarkers
{
  return self->_needsLayoutMarkers;
}

- (void)setNeedsLayoutMarkers:(BOOL)a3
{
  self->_needsLayoutMarkers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_markers, 0);
  objc_storeStrong(&self->_angleProvider, 0);
  objc_storeStrong(&self->_markersFactory, 0);
  objc_storeStrong(&self->_markerRotationProvider, 0);
  objc_storeStrong((id *)&self->_markerContainerView, 0);
  objc_storeStrong((id *)&self->_hidingMaskEndAngle, 0);
  objc_storeStrong((id *)&self->_hidingMaskStartAngle, 0);
  objc_storeStrong((id *)&self->_markersToRotateIndexSet, 0);
}

@end
