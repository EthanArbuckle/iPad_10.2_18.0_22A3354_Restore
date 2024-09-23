@implementation CDRichComplicationCornerView

- (CDRichComplicationCornerView)init
{
  return -[CDRichComplicationCornerView initWithFontFallback:](self, "initWithFontFallback:", 0);
}

- (CDRichComplicationCornerView)initWithFontFallback:(int64_t)a3
{
  CDRichComplicationCornerView *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationCornerView;
  result = -[CDRichComplicationView initWithFamily:](&v5, sel_initWithFamily_, 8);
  if (result)
    result->_fontFallback = a3;
  return result;
}

- (CDRichComplicationCornerView)initWithFamily:(int64_t)a3
{
  CDRichComplicationCornerView *v3;

  if (a3 == 8)
  {
    self = -[CDRichComplicationCornerView init](self, "init");
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  _BOOL4 v7;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  -[CDRichComplicationCornerView _createHitTestPathIfNecessary](self, "_createHitTestPathIfNecessary", a4);
  -[CDRichComplicationCornerView bounds](self, "bounds");
  v9.x = x;
  v9.y = y;
  v7 = CGRectContainsPoint(v10, v9);
  if (v7)
    LOBYTE(v7) = -[UIBezierPath containsPoint:](self->_hitTestPath, "containsPoint:", x, y);
  return v7;
}

- (void)_createHitTestPathIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t cornerComplicationPosition;
  void *v12;
  UIBezierPath *v13;
  UIBezierPath *hitTestPath;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect v19;

  if (!self->_hitTestPath
    || (-[CDRichComplicationCornerView bounds](self, "bounds"), !CGRectEqualToRect(v19, self->_hitTestBounds)))
  {
    -[CDRichComplicationCornerView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    cornerComplicationPosition = self->_cornerComplicationPosition;
    -[CDRichComplicationView device](self, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDRichComplicationCornerUtilities hitTestPathWithViewBounds:position:forDevice:](CDRichComplicationCornerUtilities, "hitTestPathWithViewBounds:position:forDevice:", cornerComplicationPosition, v12, v4, v6, v8, v10);
    v13 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
    hitTestPath = self->_hitTestPath;
    self->_hitTestPath = v13;

    -[CDRichComplicationCornerView bounds](self, "bounds");
    self->_hitTestBounds.origin.x = v15;
    self->_hitTestBounds.origin.y = v16;
    self->_hitTestBounds.size.width = v17;
    self->_hitTestBounds.size.height = v18;
  }
}

- (id)_createAndAddColoringLabelWithFontSize:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = (void *)objc_opt_new();
  -[CDRichComplicationCornerView _fontWithSize:fontWeight:](self, "_fontWithSize:fontWeight:", a3, *MEMORY[0x24BEBB610]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);
  objc_msgSend(v5, "setUsesLegibility:", 0);
  objc_msgSend(v5, "setUppercase:", 1);
  objc_msgSend(v5, "setAlpha:", 1.0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v7);

  objc_msgSend(v5, "setUsesTextProviderTintColoring:", 1);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__CDRichComplicationCornerView__createAndAddColoringLabelWithFontSize___block_invoke;
  v12[3] = &unk_24CF215B8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "setNowProvider:", v12);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __71__CDRichComplicationCornerView__createAndAddColoringLabelWithFontSize___block_invoke_2;
  v10[3] = &unk_24CF215E0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "setNeedsResizeHandler:", v10);
  objc_msgSend(v5, "setFilterProvider:", self);
  -[CDRichComplicationCornerView addSubview:](self, "addSubview:", v5);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v5;
}

id __71__CDRichComplicationCornerView__createAndAddColoringLabelWithFontSize___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = (id)MEMORY[0x24BDB8720];
  objc_msgSend(WeakRetained, "complicationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __71__CDRichComplicationCornerView__createAndAddColoringLabelWithFontSize___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");
  objc_msgSend(WeakRetained, "displayObserver");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "complicationDisplayNeedsResize:", WeakRetained);

}

- (void)_updateColoringLabel:(id)a3 withFontWeight:(double)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  -[CDRichComplicationCornerView _fontWithSize:fontWeight:](self, "_fontWithSize:fontWeight:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v7);

  -[CDRichComplicationCornerView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_fontWithSize:(double)a3 fontWeight:(double)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDB8748], "systemFontOfSize:weight:design:", *MEMORY[0x24BDB8650], a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CLKFontWithAlternativePunctuation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_fontFallback == 1)
  {
    objc_msgSend(v6, "CLKFontWithLooplessThaiFallback");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (id)_fontWithSize:(double)a3 withFontDescriptor:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CDRichComplicationCornerView;
  -[CDRichComplicationView _fontWithSize:withFontDescriptor:](&v9, sel__fontWithSize_withFontDescriptor_, a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_fontFallback == 1)
  {
    objc_msgSend(v5, "CLKFontWithLooplessThaiFallback");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (void)_layoutCurvedLabel:(id)a3 centerAngleInDegree:(double)a4 editingRotationInDegree:(double)a5
{
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MidX;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  __int128 v28;
  double v29;
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
  __int128 v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double MidY;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  __int128 v58;
  _OWORD v59[3];
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v6 = a3;
  objc_msgSend(v6, "textProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    objc_msgSend(v6, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_12;
  }
  v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v59[0] = *MEMORY[0x24BDBD8B8];
  v59[1] = v9;
  v59[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v6, "setTransform:", v59);
  objc_msgSend(v6, "frame");
  objc_msgSend(v6, "sizeThatFits:", v10, v11);
  objc_msgSend(v6, "setFrame:");
  v58 = *MEMORY[0x24BDBEFB0];
  objc_msgSend(v6, "getTextCenter:startAngle:endAngle:", &v58, 0, 0);
  -[CDRichComplicationView device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "screenBounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v60.origin.x = v14;
  v60.origin.y = v16;
  v60.size.width = v18;
  v60.size.height = v20;
  MidX = CGRectGetMidX(v60);
  v61.origin.x = v14;
  v61.origin.y = v16;
  v61.size.width = v18;
  v61.size.height = v20;
  MidY = CGRectGetMidY(v61);
  -[CDRichComplicationView device](self, "device");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = CDCornerComplicationSize(v22);
  v52 = v23;

  v24 = 0.0;
  v25 = 0.0;
  v26 = 0.0;
  v27 = 0.0;
  switch(self->_cornerComplicationPosition)
  {
    case 0:
      v28 = v58;
      v29 = MidX - *(double *)&v58;
      v26 = MidY - *((double *)&v58 + 1);
      objc_msgSend(v6, "frame");
      v25 = *(double *)&v28 - v30 * 0.5;
      v31 = *((double *)&v58 + 1);
      objc_msgSend(v6, "frame");
      v24 = v31 - v32 * 0.5;
      goto LABEL_10;
    case 1:
      v44 = MidX - *(double *)&v58;
      v65.origin.x = v14;
      v65.origin.y = v16;
      v65.size.width = v18;
      v65.size.height = v20;
      v29 = v44 - (CGRectGetWidth(v65) - v50);
      v45 = v58;
      v26 = MidY - *((double *)&v58 + 1);
      objc_msgSend(v6, "frame");
      v25 = *(double *)&v45 - v46 * 0.5;
      v47 = *((double *)&v58 + 1);
      objc_msgSend(v6, "frame");
      v24 = v47 - v48 * 0.5;
LABEL_10:
      v27 = v29;
      break;
    case 2:
      v51 = MidX - *(double *)&v58;
      v33 = MidY - *((double *)&v58 + 1);
      v62.origin.x = v14;
      v62.origin.y = v16;
      v62.size.width = v18;
      v62.size.height = v20;
      v26 = v33 - (CGRectGetHeight(v62) - v52);
      v34 = *(double *)&v58;
      objc_msgSend(v6, "frame");
      v25 = v34 - v35 * 0.5;
      v36 = *((double *)&v58 + 1);
      objc_msgSend(v6, "frame");
      v24 = v36 - v37 * 0.5;
      goto LABEL_8;
    case 3:
      v38 = MidX - *(double *)&v58;
      v63.origin.x = v14;
      v63.origin.y = v16;
      v63.size.width = v18;
      v63.size.height = v20;
      v51 = v38 - (CGRectGetWidth(v63) - v50);
      v39 = MidY - *((double *)&v58 + 1);
      v64.origin.x = v14;
      v64.origin.y = v16;
      v64.size.width = v18;
      v64.size.height = v20;
      v26 = v39 - (CGRectGetHeight(v64) - v52);
      v40 = *(double *)&v58;
      objc_msgSend(v6, "frame");
      v25 = v40 - v41 * 0.5;
      v42 = *((double *)&v58 + 1);
      objc_msgSend(v6, "frame");
      v24 = v42 - v43 * 0.5;
LABEL_8:
      v27 = v51;
      break;
    default:
      break;
  }
  memset(&v57, 0, sizeof(v57));
  CGAffineTransformMakeTranslation(&v57, v27, v26);
  v55 = v57;
  CGAffineTransformTranslate(&v56, &v55, v25, v24);
  v57 = v56;
  CLKDegreesToRadians();
  v55 = v57;
  CGAffineTransformRotate(&v56, &v55, v49);
  v57 = v56;
  v55 = v56;
  CGAffineTransformTranslate(&v56, &v55, -v25, -v24);
  v57 = v56;
  v54 = v56;
  objc_msgSend(v6, "setTransform:", &v54);
LABEL_12:

}

- (void)_layoutView:(id)a3 origin:(CGPoint)a4 editingTranslation:(CGPoint)a5 editingRotationInDegree:(double)a6
{
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  __int128 v10;
  id v11;
  CGFloat v12;
  double v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  y = a4.y;
  x = a4.x;
  v8 = a5.y;
  v9 = a5.x;
  switch(self->_cornerComplicationPosition)
  {
    case 0:
      break;
    case 1:
      v9 = -a5.x;
      break;
    case 2:
      goto LABEL_5;
    case 3:
      v9 = -a5.x;
LABEL_5:
      v8 = -a5.y;
      break;
    default:
      v9 = *MEMORY[0x24BDBEFB0];
      v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      break;
  }
  v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v17.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v17.c = v10;
  *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v16.a = *(_OWORD *)&v17.a;
  *(_OWORD *)&v16.c = v10;
  *(_OWORD *)&v16.tx = *(_OWORD *)&v17.tx;
  v11 = a3;
  CGAffineTransformTranslate(&v17, &v16, x, y);
  v15 = v17;
  CGAffineTransformTranslate(&v16, &v15, v9, v8);
  v17 = v16;
  CLKDegreesToRadians();
  v15 = v17;
  CGAffineTransformRotate(&v16, &v15, v12);
  v17 = v16;
  v15 = v16;
  CGAffineTransformTranslate(&v16, &v15, -v9, -v8);
  v17 = v16;
  CLKDegreesToRadians();
  v15 = v17;
  CGAffineTransformRotate(&v16, &v15, -v13);
  v17 = v16;
  v14 = v16;
  objc_msgSend(v11, "setTransform:", &v14);

}

- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4
{
  CGFloat v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  CLKInterpolateBetweenFloatsClipped();
  CGAffineTransformMakeScale(&v7, v5, v5);
  v6 = v7;
  -[CDRichComplicationCornerView setTransform:](self, "setTransform:", &v6);
}

+ (CGSize)viewSizeForDevice:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = CDCornerComplicationSize(a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)cornerComplicationPosition
{
  return self->_cornerComplicationPosition;
}

- (void)setCornerComplicationPosition:(int64_t)a3
{
  self->_cornerComplicationPosition = a3;
}

- (double)innerComponentRotationInDegree
{
  return self->_innerComponentRotationInDegree;
}

- (void)setInnerComponentRotationInDegree:(double)a3
{
  self->_innerComponentRotationInDegree = a3;
}

- (double)outerComponentRotationInDegree
{
  return self->_outerComponentRotationInDegree;
}

- (void)setOuterComponentRotationInDegree:(double)a3
{
  self->_outerComponentRotationInDegree = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitTestPath, 0);
}

@end
