@implementation CDRichComplicationCornerBaseGaugeView

+ (BOOL)isMeteredProgressView
{
  return CDRichComplicationProgressFillStyleIsMetered(objc_msgSend(a1, "progressFillStyle"));
}

+ (int64_t)progressFillStyle
{
  return 0;
}

- (CDRichComplicationCornerBaseGaugeView)initWithFontFallback:(int64_t)a3
{
  CDRichComplicationCornerBaseGaugeView *v3;
  CDRichComplicationCornerBaseGaugeView *v4;
  void *v5;
  double v6;
  uint64_t v7;
  CLKUICurvedColoringLabel *leftLabel;
  uint64_t v9;
  CLKUICurvedColoringLabel *rightLabel;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CDRichComplicationCornerBaseGaugeView;
  v3 = -[CDRichComplicationCornerView initWithFontFallback:](&v17, sel_initWithFontFallback_, a3);
  v4 = v3;
  if (v3)
  {
    v16 = 0;
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    -[CDRichComplicationView device](v3, "device", 0, 0, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_1(v5, (uint64_t)&v12);

    -[CDRichComplicationCornerBaseGaugeView _replaceProgressView:](v4, "_replaceProgressView:", objc_msgSend((id)objc_opt_class(), "progressFillStyle"));
    v6 = *((double *)&v13 + 1);
    -[CDRichComplicationCornerView _createAndAddColoringLabelWithFontSize:](v4, "_createAndAddColoringLabelWithFontSize:", *((double *)&v13 + 1));
    v7 = objc_claimAutoreleasedReturnValue();
    leftLabel = v4->_leftLabel;
    v4->_leftLabel = (CLKUICurvedColoringLabel *)v7;

    -[CLKUICurvedColoringLabel setImagePlacement:](v4->_leftLabel, "setImagePlacement:", 1);
    -[CDRichComplicationCornerView _createAndAddColoringLabelWithFontSize:](v4, "_createAndAddColoringLabelWithFontSize:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    rightLabel = v4->_rightLabel;
    v4->_rightLabel = (CLKUICurvedColoringLabel *)v9;

    -[CLKUICurvedColoringLabel setImagePlacement:](v4->_rightLabel, "setImagePlacement:", 2);
  }
  return v4;
}

- (void)_replaceProgressView:(int64_t)a3
{
  void *v5;
  double *v6;
  double v7;
  CDRichComplicationCurvedProgressView *v8;
  void *v9;
  CDRichComplicationCurvedProgressView *v10;
  CDRichComplicationCurvedProgressView *progressView;
  __int128 v12;
  __int128 v13;

  -[CDRichComplicationCurvedProgressView removeFromSuperview](self->_progressView, "removeFromSuperview");
  -[CDRichComplicationView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_1(v5, (uint64_t)&v12);

  if (objc_msgSend((id)objc_opt_class(), "isMeteredProgressView"))
    v6 = (double *)&v13;
  else
    v6 = (double *)&v12;
  v7 = *v6;
  v8 = [CDRichComplicationCurvedProgressView alloc];
  -[CDRichComplicationView device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CDRichComplicationCurvedProgressView initWithFamily:curveWidth:padding:beginAngle:endAngle:forDevice:withFilterStyle:progressFillStyle:](v8, "initWithFamily:curveWidth:padding:beginAngle:endAngle:forDevice:withFilterStyle:progressFillStyle:", 10, v9, 2, a3, v7, 0.0, 0.0, 0.0);
  progressView = self->_progressView;
  self->_progressView = v10;

  -[CDRichComplicationCornerBaseGaugeView addSubview:](self, "addSubview:", self->_progressView);
  -[CDRichComplicationProgressView setFilterProvider:](self->_progressView, "setFilterProvider:", self);
  -[CDRichComplicationCornerBaseGaugeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  id v5;
  double var2;
  id v7;
  double v8;
  double *v9;
  double v10;
  objc_super v11;
  BOOL v12[8];
  id v13;
  double v14;

  v12[0] = a3->var0;
  v5 = a3->var1;
  var2 = a3->var2;
  v13 = v5;
  v14 = var2;
  v11.receiver = self;
  v11.super_class = (Class)CDRichComplicationCornerBaseGaugeView;
  -[CDRichComplicationView _setFontConfiguration:](&v11, sel__setFontConfiguration_, v12);
  v7 = a3->var1;
  if (v7)
  {
    v8 = a3->var2;
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_leftLabel, v7, v8);
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_rightLabel, v7, v8);
  }
  else
  {
    if (a3->var0)
      v9 = (double *)MEMORY[0x24BEBB600];
    else
      v9 = (double *)MEMORY[0x24BEBB610];
    v10 = *v9;
    -[CDRichComplicationCornerView _updateColoringLabel:withFontWeight:](self, "_updateColoringLabel:withFontWeight:", self->_leftLabel, *v9);
    -[CDRichComplicationCornerView _updateColoringLabel:withFontWeight:](self, "_updateColoringLabel:withFontWeight:", self->_rightLabel, v10);
  }

}

- (void)layoutSubviews
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDRichComplicationCornerBaseGaugeView;
  -[CDRichComplicationCornerBaseGaugeView layoutSubviews](&v4, sel_layoutSubviews);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__CDRichComplicationCornerBaseGaugeView_layoutSubviews__block_invoke;
  v3[3] = &unk_24CF21410;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v3);
}

uint64_t __55__CDRichComplicationCornerBaseGaugeView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutSubviewsWithoutAnimation");
}

- (void)setCornerComplicationPosition:(int64_t)a3
{
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(void *, CLKUICurvedColoringLabel *);
  _QWORD aBlock[6];
  char v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CDRichComplicationCornerBaseGaugeView;
  -[CDRichComplicationCornerView setCornerComplicationPosition:](&v18, sel_setCornerComplicationPosition_);
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  memset(v14, 0, sizeof(v14));
  -[CDRichComplicationView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_1(v5, (uint64_t)v14);

  switch(a3)
  {
    case 0:
    case 1:
      v6 = 0;
      v7 = v15;
      v8 = (uint64_t *)&v16;
      v9 = 1;
      goto LABEL_4;
    case 2:
    case 3:
      v9 = 0;
      v7 = *((_QWORD *)&v15 + 1);
      v8 = (uint64_t *)&v16 + 1;
      v6 = 1;
LABEL_4:
      v10 = *v8;
      -[CDRichComplicationCurvedProgressView setClockwise:](self->_progressView, "setClockwise:", v9);
      break;
    default:
      v6 = 0;
      v10 = 0;
      v7 = 0;
      break;
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CDRichComplicationCornerBaseGaugeView_setCornerComplicationPosition___block_invoke;
  aBlock[3] = &__block_descriptor_49_e34_v16__0__CLKUICurvedColoringLabel_8l;
  v13 = v6;
  aBlock[4] = v7;
  aBlock[5] = v10;
  v11 = (void (**)(void *, CLKUICurvedColoringLabel *))_Block_copy(aBlock);
  v11[2](v11, self->_leftLabel);
  v11[2](v11, self->_rightLabel);

}

void __71__CDRichComplicationCornerBaseGaugeView_setCornerComplicationPosition___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setCircleRadius:", v3);
  objc_msgSend(v4, "setInterior:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v4, "setTracking:", *(double *)(a1 + 40));
  objc_msgSend(v4, "setCenterAngle:", 0.0);

}

- (id)progressView
{
  return self->_progressView;
}

- (id)leftLabel
{
  return self->_leftLabel;
}

- (id)rightLabel
{
  return self->_rightLabel;
}

- (void)handleGaugeProvider:(id)a3 leftTextProvider:(id)a4 rightTextProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  CDLabelProvider *v11;
  CDLabelProvider *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = -[CDLabelProvider initWithTextProvider:imageProvider:]([CDLabelProvider alloc], "initWithTextProvider:imageProvider:", v9, 0);

  v11 = -[CDLabelProvider initWithTextProvider:imageProvider:]([CDLabelProvider alloc], "initWithTextProvider:imageProvider:", v8, 0);
  -[CDRichComplicationCornerBaseGaugeView handleGaugeProvider:leftLabelProvider:rightLabelProvider:](self, "handleGaugeProvider:leftLabelProvider:rightLabelProvider:", v10, v12, v11);

}

- (void)handleGaugeProvider:(id)a3 leftLabelProvider:(id)a4 rightLabelProvider:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  CLKUICurvedColoringLabel *leftLabel;
  uint64_t v12;
  void *v13;
  void *v14;
  CLKUICurvedColoringLabel *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  CLKUICurvedColoringLabel *rightLabel;
  uint64_t v23;
  void *v24;
  void *v25;
  CLKUICurvedColoringLabel *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;

  v31 = a4;
  v8 = a5;
  -[CDRichComplicationProgressView setGaugeProvider:](self->_progressView, "setGaugeProvider:", a3);
  objc_msgSend(v31, "textProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v31, "textProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUICurvedColoringLabel setTextProvider:](self->_leftLabel, "setTextProvider:", v10);

    -[CLKUICurvedColoringLabel setImageView:](self->_leftLabel, "setImageView:", 0);
    leftLabel = self->_leftLabel;
    v12 = 0;
LABEL_3:
    -[CLKUICurvedColoringLabel setHidden:](leftLabel, "setHidden:", v12);
    goto LABEL_11;
  }
  objc_msgSend(v31, "imageProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[CLKUICurvedColoringLabel setTextProvider:](self->_leftLabel, "setTextProvider:", 0);
    -[CLKUICurvedColoringLabel setImageView:](self->_leftLabel, "setImageView:", 0);
    leftLabel = self->_leftLabel;
    v12 = 1;
    goto LABEL_3;
  }
  objc_msgSend(v31, "imageProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_254B86A80))
  {
    v15 = self->_leftLabel;
    v16 = v14;
    -[CLKUICurvedColoringLabel font](v15, "font");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v17);

    objc_msgSend(v16, "setScale:", 2);
  }
  -[CLKUICurvedColoringLabel imageView](self->_leftLabel, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "conformsToProtocol:", &unk_254B855A0)
    || !+[CDComplicationImageViewProvider existingImageView:supportsImageProvider:](CDComplicationImageViewProvider, "existingImageView:supportsImageProvider:", v18, v14))
  {
    +[CDComplicationImageViewProvider viewForImageProvider:](CDComplicationImageViewProvider, "viewForImageProvider:", v14);
    v19 = objc_claimAutoreleasedReturnValue();

    -[CLKUICurvedColoringLabel setImageView:](self->_leftLabel, "setImageView:", v19);
    v18 = (void *)v19;
  }
  objc_msgSend(v18, "setImageProvider:", v14);
  -[CLKUICurvedColoringLabel setTextProvider:](self->_leftLabel, "setTextProvider:", 0);
  -[CLKUICurvedColoringLabel setText:](self->_leftLabel, "setText:", CFSTR("​"));
  -[CLKUICurvedColoringLabel setHidden:](self->_leftLabel, "setHidden:", 0);

LABEL_11:
  objc_msgSend(v8, "textProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v8, "textProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUICurvedColoringLabel setTextProvider:](self->_rightLabel, "setTextProvider:", v21);

    -[CLKUICurvedColoringLabel setImageView:](self->_rightLabel, "setImageView:", 0);
    rightLabel = self->_rightLabel;
    v23 = 0;
LABEL_13:
    -[CLKUICurvedColoringLabel setHidden:](rightLabel, "setHidden:", v23);
    goto LABEL_21;
  }
  objc_msgSend(v8, "imageProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    -[CLKUICurvedColoringLabel setTextProvider:](self->_rightLabel, "setTextProvider:", 0);
    -[CLKUICurvedColoringLabel setImageView:](self->_rightLabel, "setImageView:", 0);
    rightLabel = self->_rightLabel;
    v23 = 1;
    goto LABEL_13;
  }
  objc_msgSend(v8, "imageProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "conformsToProtocol:", &unk_254B86A80))
  {
    v26 = self->_rightLabel;
    v27 = v25;
    -[CLKUICurvedColoringLabel font](v26, "font");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFont:", v28);

    objc_msgSend(v27, "setScale:", 2);
  }
  -[CLKUICurvedColoringLabel imageView](self->_rightLabel, "imageView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v29, "conformsToProtocol:", &unk_254B855A0)
    || !+[CDComplicationImageViewProvider existingImageView:supportsImageProvider:](CDComplicationImageViewProvider, "existingImageView:supportsImageProvider:", v29, v25))
  {
    +[CDComplicationImageViewProvider viewForImageProvider:](CDComplicationImageViewProvider, "viewForImageProvider:", v25);
    v30 = objc_claimAutoreleasedReturnValue();

    -[CLKUICurvedColoringLabel setImageView:](self->_rightLabel, "setImageView:", v30);
    v29 = (void *)v30;
  }
  objc_msgSend(v29, "setImageProvider:", v25);
  -[CLKUICurvedColoringLabel setTextProvider:](self->_rightLabel, "setTextProvider:", 0);
  -[CLKUICurvedColoringLabel setText:](self->_rightLabel, "setText:", CFSTR("​"));
  -[CLKUICurvedColoringLabel setHidden:](self->_rightLabel, "setHidden:", 0);

LABEL_21:
}

- (double)_progressViewHorizontalPaddingInRadius
{
  void *v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = 0;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  -[CDRichComplicationView device](self, "device", 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_1(v2, (uint64_t)&v4);

  return *((double *)&v5 + 1);
}

- (double)_layoutProgressViewWithBeginAngle:(double)a3 widthInRadius:(double)a4 bottomPadding:(double)a5
{
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double MidX;
  double v27;
  double v28;
  int v29;
  double *v30;
  double v32;
  double v33;
  double v34;
  _OWORD v36[2];
  _OWORD v37[3];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v38 = 0;
  memset(v37, 0, sizeof(v37));
  memset(v36, 0, sizeof(v36));
  -[CDRichComplicationView device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_1(v8, (uint64_t)v36);

  -[CDRichComplicationView device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screenBounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[CDRichComplicationView device](self, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CDCornerComplicationSize(v18);
  v21 = v20;

  switch(-[CDRichComplicationCornerView cornerComplicationPosition](self, "cornerComplicationPosition"))
  {
    case 0:
      v22 = a3 + a4;
      a3 = a3 + 3.14159265;
      v33 = a3 + a4;
      v34 = v22;
      v23 = 0.0;
      v24 = 0.0;
      break;
    case 1:
      v32 = a3 + 3.14159265;
      v33 = a3 + 3.14159265 + a4;
      v39.origin.x = v11;
      v39.origin.y = v13;
      v39.size.width = v15;
      v39.size.height = v17;
      v24 = CGRectGetWidth(v39) - v19;
      v34 = a3 + a4;
      v23 = 0.0;
      a3 = a3 + 3.14159265;
      break;
    case 2:
      v25 = a3 - a4;
      v40.origin.x = v11;
      v40.origin.y = v13;
      v40.size.width = v15;
      v40.size.height = v17;
      v23 = CGRectGetHeight(v40) - v21;
      v24 = 0.0;
      goto LABEL_7;
    case 3:
      v25 = a3 - a4;
      v41.origin.x = v11;
      v41.origin.y = v13;
      v41.size.width = v15;
      v41.size.height = v17;
      v24 = CGRectGetWidth(v41) - v19;
      v42.origin.x = v11;
      v42.origin.y = v13;
      v42.size.width = v15;
      v42.size.height = v17;
      v23 = CGRectGetHeight(v42) - v21;
LABEL_7:
      v33 = v25;
      v34 = v25;
      break;
    default:
      v24 = *MEMORY[0x24BDBEFB0];
      v23 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v33 = 0.0;
      v34 = 0.0;
      a3 = 0.0;
      break;
  }
  v43.origin.x = v11;
  v43.origin.y = v13;
  v43.size.width = v15;
  v43.size.height = v17;
  MidX = CGRectGetMidX(v43);
  v44.origin.x = v11;
  v44.origin.y = v13;
  v44.size.width = v15;
  v44.size.height = v17;
  v27 = MidX - v24;
  v28 = CGRectGetMidY(v44) - v23;
  v29 = objc_msgSend((id)objc_opt_class(), "isMeteredProgressView");
  v30 = (double *)v37;
  if (!v29)
    v30 = (double *)v36;
  -[CDRichComplicationCurvedProgressView setFrame:](self->_progressView, "setFrame:", v27 - (*v30 + *((double *)v36 + 1) + a5) * 0.5, v28 - (*v30 + *((double *)v36 + 1) + a5) * 0.5, *v30 + *((double *)v36 + 1) + a5, *v30 + *((double *)v36 + 1) + a5, *(_QWORD *)&v32);
  -[CDRichComplicationCurvedProgressView setBeginAngle:](self->_progressView, "setBeginAngle:", a3);
  -[CDRichComplicationCurvedProgressView setEndAngle:](self->_progressView, "setEndAngle:", v33);
  return v34;
}

- (void)_calculateLabel:(id)a3 center:(CGPoint *)a4 widthInRadius:(double *)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v7 = a3;
  objc_msgSend(v7, "textProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    objc_msgSend(v7, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      *a4 = *(CGPoint *)MEMORY[0x24BDBEFB0];
      *a5 = 0.0;
      goto LABEL_10;
    }
  }
  objc_msgSend(v7, "sizeToFit");
  v13 = 0.0;
  v14 = 0.0;
  objc_msgSend(v7, "getTextCenter:startAngle:endAngle:", a4, &v14, &v13);
  v10 = fabs(v14);
  v11 = fabs(v13);
  if (v10 >= v11)
    v12 = v10;
  else
    v12 = v11;
  if (v10 >= v11)
    v10 = v11;
  *a5 = v12 - v10;
LABEL_10:

}

- (double)_calculateProgressWidthWithLeftLabelWidth:(double)a3 rightLabelWidth:(double)a4
{
  double v7;
  double v8;
  double v9;
  double result;
  double v11;
  double v12;
  double v13;
  double v14;

  if (a3 > 0.0 && a4 > 0.0)
  {
    CLKDegreesToRadians();
    v8 = v7 - a3 - a4;
    -[CDRichComplicationCornerBaseGaugeView _progressViewHorizontalPaddingInRadius](self, "_progressViewHorizontalPaddingInRadius");
    return v8 + v9 * -2.0;
  }
  if (a3 > 0.0)
  {
    CLKDegreesToRadians();
    v12 = v11 - a3;
LABEL_8:
    -[CDRichComplicationCornerBaseGaugeView _progressViewHorizontalPaddingInRadius](self, "_progressViewHorizontalPaddingInRadius");
    return v12 - v14;
  }
  if (a4 > 0.0)
  {
    CLKDegreesToRadians();
    v12 = v13 - a4;
    goto LABEL_8;
  }
  CLKDegreesToRadians();
  return result;
}

- (double)_layoutLabel:(id)a3 withLabelCenter:(CGPoint)a4 labelWidthInRadius:(double)a5 leftInRadius:(double)a6
{
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  __int128 v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  int64_t v22;
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
  double x;
  double v35;
  double v36;
  double v37;
  double v39;
  double v40;
  double MidX;
  double v42;
  double MidY;
  double v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  _OWORD v52[3];
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v7 = a3;
  -[CDRichComplicationView device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screenBounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v53.origin.x = v10;
  v53.origin.y = v12;
  v53.size.width = v14;
  v53.size.height = v16;
  MidX = CGRectGetMidX(v53);
  v54.origin.x = v10;
  v54.origin.y = v12;
  v54.size.width = v14;
  v54.size.height = v16;
  MidY = CGRectGetMidY(v54);
  v17 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v52[0] = *MEMORY[0x24BDBD8B8];
  v52[1] = v17;
  v52[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v7, "setTransform:", v52);
  objc_msgSend(v7, "frame");
  objc_msgSend(v7, "sizeThatFits:", v18, v19);
  v47 = 0.0;
  objc_msgSend(v7, "setFrame:");
  -[CDRichComplicationView device](self, "device");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = CDCornerComplicationSize(v20);
  v40 = v21;

  v22 = -[CDRichComplicationCornerView cornerComplicationPosition](self, "cornerComplicationPosition");
  v23 = 0.0;
  v24 = 0.0;
  v25 = 0.0;
  v26 = 0.0;
  v27 = 0.0;
  switch(v22)
  {
    case 0:
      v26 = MidY - a4.y;
      objc_msgSend(v7, "frame");
      v25 = a4.x - v28 * 0.5;
      objc_msgSend(v7, "frame");
      v24 = a4.y - v29 * 0.5;
      v23 = a5 * 0.5 + a6;
      v30 = a5 + a6;
      v27 = MidX - a4.x;
      goto LABEL_7;
    case 1:
      v55.origin.x = v10;
      v55.origin.y = v12;
      v55.size.width = v14;
      v55.size.height = v16;
      v31 = MidX - a4.x - (CGRectGetWidth(v55) - v39);
      v26 = MidY - a4.y;
      objc_msgSend(v7, "frame");
      v25 = a4.x - v32 * 0.5;
      objc_msgSend(v7, "frame");
      v24 = a4.y - v33 * 0.5;
      v23 = a5 * 0.5 + a6;
      v30 = a5 + a6;
      v27 = v31;
      goto LABEL_7;
    case 2:
      x = a4.x;
      v35 = MidX - a4.x;
      goto LABEL_6;
    case 3:
      x = a4.x;
      v56.origin.x = v10;
      v56.origin.y = v12;
      v56.size.width = v14;
      v56.size.height = v16;
      v35 = MidX - a4.x - (CGRectGetWidth(v56) - v39);
LABEL_6:
      v42 = v35;
      v57.origin.x = v10;
      v57.origin.y = v12;
      v57.size.width = v14;
      v57.size.height = v16;
      v26 = MidY - a4.y - (CGRectGetHeight(v57) - v40);
      objc_msgSend(v7, "frame");
      v25 = x - v36 * 0.5;
      objc_msgSend(v7, "frame");
      v24 = a4.y - v37 * 0.5;
      v23 = a6 - a5 * 0.5;
      v30 = a6 - a5;
      v27 = v42;
LABEL_7:
      v47 = v30;
      break;
    default:
      break;
  }
  memset(&v51, 0, sizeof(v51));
  CGAffineTransformMakeTranslation(&v51, v27, v26);
  v49 = v51;
  CGAffineTransformTranslate(&v50, &v49, v25, v24);
  v51 = v50;
  v49 = v50;
  CGAffineTransformRotate(&v50, &v49, v23);
  v51 = v50;
  v49 = v50;
  CGAffineTransformTranslate(&v50, &v49, -v25, -v24);
  v51 = v50;
  v48 = v50;
  objc_msgSend(v7, "setTransform:", &v48);

  return v47;
}

- (void)_layoutSubviewsWithoutAnimation
{
  void *v3;
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
  unint64_t v14;
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
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  double v32;

  v32 = 0.0;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_1(v3, (uint64_t)&v27);

  -[CDRichComplicationCornerBaseGaugeView _updateLabelMaxWidths](self, "_updateLabelMaxWidths");
  switch(-[CDRichComplicationCornerView cornerComplicationPosition](self, "cornerComplicationPosition"))
  {
    case 0:
    case 3:
      v4 = -v32;
      break;
    case 1:
    case 2:
      v4 = v32;
      break;
    default:
      v4 = 0.0;
      break;
  }
  -[CDRichComplicationCornerView innerComponentRotationInDegree](self, "innerComponentRotationInDegree");
  CLKDegreesToRadians();
  v6 = v5;
  v25 = 0.0;
  v26 = 0.0;
  v24 = 0.0;
  -[CDRichComplicationCornerBaseGaugeView _calculateLabel:center:widthInRadius:](self, "_calculateLabel:center:widthInRadius:", self->_leftLabel, &v25, &v24);
  v22 = 0.0;
  v23 = 0.0;
  v21 = 0.0;
  -[CDRichComplicationCornerBaseGaugeView _calculateLabel:center:widthInRadius:](self, "_calculateLabel:center:widthInRadius:", self->_rightLabel, &v22, &v21);
  -[CDRichComplicationCornerBaseGaugeView _calculateProgressWidthWithLeftLabelWidth:rightLabelWidth:](self, "_calculateProgressWidthWithLeftLabelWidth:rightLabelWidth:", v24, v21);
  v8 = v7;
  v9 = v21;
  v10 = v8 + v24 + v21;
  if (v24 > 0.0)
  {
    -[CDRichComplicationCornerBaseGaugeView _progressViewHorizontalPaddingInRadius](self, "_progressViewHorizontalPaddingInRadius");
    v10 = v10 + v11;
    v9 = v21;
  }
  if (v9 > 0.0)
  {
    -[CDRichComplicationCornerBaseGaugeView _progressViewHorizontalPaddingInRadius](self, "_progressViewHorizontalPaddingInRadius");
    v10 = v10 + v12;
  }
  v13 = v4 + v6;
  v14 = -[CDRichComplicationCornerView cornerComplicationPosition](self, "cornerComplicationPosition");
  if (v14 - 2 < 2)
  {
    v15 = v13 + v10 * 0.5;
    -[CDRichComplicationCornerBaseGaugeView _progressViewHorizontalPaddingInRadius](self, "_progressViewHorizontalPaddingInRadius");
    v17 = -v18;
  }
  else if (v14 > 1)
  {
    v15 = 0.0;
    v17 = 0.0;
  }
  else
  {
    v15 = v13 + v10 * -0.5;
    -[CDRichComplicationCornerBaseGaugeView _progressViewHorizontalPaddingInRadius](self, "_progressViewHorizontalPaddingInRadius");
    v17 = v16;
  }
  if (v24 > 0.0)
  {
    -[CDRichComplicationCornerBaseGaugeView _layoutLabel:withLabelCenter:labelWidthInRadius:leftInRadius:](self, "_layoutLabel:withLabelCenter:labelWidthInRadius:leftInRadius:", self->_leftLabel, v25, v26, v24, v15);
    v15 = v17 + v19;
  }
  -[CDRichComplicationCornerBaseGaugeView _layoutProgressViewWithBeginAngle:widthInRadius:bottomPadding:](self, "_layoutProgressViewWithBeginAngle:widthInRadius:bottomPadding:", v15, v8, *(double *)&v28);
  if (v21 > 0.0)
    -[CDRichComplicationCornerBaseGaugeView _layoutLabel:withLabelCenter:labelWidthInRadius:leftInRadius:](self, "_layoutLabel:withLabelCenter:labelWidthInRadius:leftInRadius:", self->_rightLabel, v22, v23, v21, v17 + v20);
}

- (void)_updateLabelMaxWidths
{
  CLKUICurvedColoringLabel **p_leftLabel;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  p_leftLabel = &self->_leftLabel;
  -[CLKUICurvedColoringLabel textProvider](self->_leftLabel, "textProvider");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CLKUICurvedColoringLabel textProvider](self->_rightLabel, "textProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      CLKDegreesToRadians();
      -[CLKUICurvedColoringLabel setMaxAngularWidth:](*p_leftLabel, "setMaxAngularWidth:");
      p_leftLabel = &self->_rightLabel;
LABEL_6:
      CLKDegreesToRadians();
      -[CLKUICurvedColoringLabel setMaxAngularWidth:](*p_leftLabel, "setMaxAngularWidth:");
      return;
    }
  }
  -[CLKUICurvedColoringLabel textProvider](*p_leftLabel, "textProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_6;
  p_leftLabel = &self->_rightLabel;
  -[CLKUICurvedColoringLabel textProvider](self->_rightLabel, "textProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_6;
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  void (**v4)(id, CLKUICurvedColoringLabel *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationCornerBaseGaugeView;
  v4 = (void (**)(id, CLKUICurvedColoringLabel *))a3;
  -[CDRichComplicationView _enumerateLabelsWithBlock:](&v5, sel__enumerateLabelsWithBlock_, v4);
  v4[2](v4, self->_leftLabel);
  v4[2](v4, self->_rightLabel);

}

- (void)_editingDidEnd
{
  -[CLKUICurvedColoringLabel editingDidEnd](self->_leftLabel, "editingDidEnd");
  -[CLKUICurvedColoringLabel editingDidEnd](self->_rightLabel, "editingDidEnd");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CLKUICurvedColoringLabel transitionToMonochromeWithFraction:style:](self->_leftLabel, "transitionToMonochromeWithFraction:style:", 2);
  -[CLKUICurvedColoringLabel transitionToMonochromeWithFraction:style:](self->_rightLabel, "transitionToMonochromeWithFraction:style:", 2, a3);
  -[CDRichComplicationProgressView transitionToMonochromeWithFraction:](self->_progressView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  -[CLKUICurvedColoringLabel updateMonochromeColorWithStyle:](self->_leftLabel, "updateMonochromeColorWithStyle:", 2);
  -[CLKUICurvedColoringLabel updateMonochromeColorWithStyle:](self->_rightLabel, "updateMonochromeColorWithStyle:", 2);
  -[CDRichComplicationProgressView updateMonochromeColor](self->_progressView, "updateMonochromeColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_leftLabel, 0);
}

@end
