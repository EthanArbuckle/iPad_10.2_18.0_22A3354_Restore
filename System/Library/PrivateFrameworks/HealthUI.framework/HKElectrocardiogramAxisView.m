@implementation HKElectrocardiogramAxisView

- (HKElectrocardiogramAxisView)initWithAxisSpacing:(double)a3 lineColor:(id)a4 lineWidth:(double)a5
{
  id v8;
  HKElectrocardiogramAxisOptions *v9;
  void *v10;
  void *v11;
  HKElectrocardiogramAxisOptions *v12;
  HKElectrocardiogramAxisView *v13;

  v8 = a4;
  v9 = [HKElectrocardiogramAxisOptions alloc];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_roundedSystemFontWithSize:weight:", 13.0, *MEMORY[0x1E0DC1438]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKElectrocardiogramAxisOptions initWithAxisLabelFont:axisLabelTextColor:scaleMetricsAutomatically:lineColor:lineWidth:axisLineToLabelSpacing:topBaselineMargin:bottomBaselineMargin:](v9, "initWithAxisLabelFont:axisLabelTextColor:scaleMetricsAutomatically:lineColor:lineWidth:axisLineToLabelSpacing:topBaselineMargin:bottomBaselineMargin:", v10, v11, 1, v8, a5, 5.0, 18.0, 2.0);

  v13 = -[HKElectrocardiogramAxisView initWithAxisSpacing:options:startingIndex:](self, "initWithAxisSpacing:options:startingIndex:", v12, 0, a3);
  return v13;
}

- (HKElectrocardiogramAxisView)initWithAxisSpacing:(double)a3 options:(id)a4 startingIndex:(int64_t)a5
{
  id v9;
  HKElectrocardiogramAxisView *v10;
  HKElectrocardiogramAxisView *v11;
  CAReplicatorLayer *v12;
  CAReplicatorLayer *ticksLayer;
  uint64_t v14;
  UIFontMetrics *metrics;
  objc_super v17;

  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKElectrocardiogramAxisView;
  v10 = -[HKElectrocardiogramAxisView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v11 = v10;
  if (v10)
  {
    v10->_axisSpacing = a3;
    objc_storeStrong((id *)&v10->_options, a4);
    v12 = (CAReplicatorLayer *)objc_alloc_init(MEMORY[0x1E0CD2828]);
    ticksLayer = v11->_ticksLayer;
    v11->_ticksLayer = v12;

    objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v14 = objc_claimAutoreleasedReturnValue();
    metrics = v11->_metrics;
    v11->_metrics = (UIFontMetrics *)v14;

    v11->_startingIndex = a5;
    -[HKElectrocardiogramAxisView _drawAxis](v11, "_drawAxis");
  }

  return v11;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKElectrocardiogramAxisView;
  -[HKElectrocardiogramAxisView layoutSubviews](&v12, sel_layoutSubviews);
  -[HKElectrocardiogramAxisView lastBoundsSize](self, "lastBoundsSize");
  v4 = v3;
  v6 = v5;
  -[HKElectrocardiogramAxisView bounds](self, "bounds");
  if (v4 != v8 || v6 != v7)
  {
    -[HKElectrocardiogramAxisView bounds](self, "bounds");
    -[HKElectrocardiogramAxisView setLastBoundsSize:](self, "setLastBoundsSize:", v10, v11);
    -[HKElectrocardiogramAxisView _drawAxis](self, "_drawAxis");
  }
}

- (void)_drawAxis
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  CGFloat v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  CATransform3D v53;
  CATransform3D v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  -[HKElectrocardiogramAxisView bounds](self, "bounds");
  v4 = v3;
  -[HKElectrocardiogramAxisView axisSpacing](self, "axisSpacing");
  v6 = v4 / v5;
  v7 = round(v6);
  if (vabdd_f64(v6, v7) < 0.01)
    v6 = v7;
  v8 = ceil(v6);
  v59 = 0u;
  v60 = 0u;
  if (v8 >= 1.0)
    v9 = v8;
  else
    v9 = 1.0;
  v61 = 0uLL;
  v62 = 0uLL;
  -[HKElectrocardiogramAxisView ticksLayer](self, "ticksLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sublayers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v60 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "removeFromSuperlayer");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v13);
  }
  v16 = (uint64_t)v9;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[HKElectrocardiogramAxisView subviews](self, "subviews");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v56 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * j), "removeFromSuperview");
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v19);
  }

  v22 = (void *)MEMORY[0x1E0CD2840];
  -[HKElectrocardiogramAxisView bounds](self, "bounds");
  v24 = v23;
  -[HKElectrocardiogramAxisView options](self, "options");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lineWidth");
  objc_msgSend(v22, "verticalLineLayerWithLength:lineWidth:", v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setFillColor:", 0);
  -[HKElectrocardiogramAxisView lineColor](self, "lineColor");
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v27, "setStrokeColor:", objc_msgSend(v28, "CGColor"));

  -[HKElectrocardiogramAxisView ticksLayer](self, "ticksLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSublayer:", v27);

  -[HKElectrocardiogramAxisView ticksLayer](self, "ticksLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setInstanceCount:", v16 + 1);

  -[HKElectrocardiogramAxisView axisSpacing](self, "axisSpacing");
  CATransform3DMakeTranslation(&v54, v31, 0.0, 0.0);
  -[HKElectrocardiogramAxisView ticksLayer](self, "ticksLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v54;
  objc_msgSend(v32, "setInstanceTransform:", &v53);

  -[HKElectrocardiogramAxisView layer](self, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramAxisView ticksLayer](self, "ticksLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSublayer:", v34);

  v35 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  objc_msgSend(v35, "setUnitsStyle:", 1);
  objc_msgSend(v35, "setAllowedUnits:", 128);
  v36 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  -[HKElectrocardiogramAxisView options](self, "options");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v37, "scaleMetricsAutomatically") & 1) != 0)
  {
    -[HKElectrocardiogramAxisView metrics](self, "metrics");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramAxisView options](self, "options");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "axisLineToLabelSpacing");
    v41 = v40;
    -[HKElectrocardiogramAxisView traitCollection](self, "traitCollection");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "scaledValueForValue:compatibleWithTraitCollection:", v42, v41);
    v44 = v43;

  }
  else
  {
    -[HKElectrocardiogramAxisView options](self, "options");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "axisLineToLabelSpacing");
    v44 = v45;
  }

  if (v16 >= 1)
  {
    for (k = 0; k != v16; ++k)
    {
      -[HKElectrocardiogramAxisView _createLabel](self, "_createLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "leftAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKElectrocardiogramAxisView leftAnchor](self, "leftAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKElectrocardiogramAxisView axisSpacing](self, "axisSpacing");
      objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, v44 + v50 * (double)k);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setActive:", 1);

      objc_msgSend(v36, "setSecond:", -[HKElectrocardiogramAxisView startingIndex](self, "startingIndex") + k);
      objc_msgSend(v35, "stringFromDateComponents:", v36);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setText:", v52);

    }
  }

}

- (id)_createLabel
{
  void *v2;
  id v4;
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
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;

  v4 = objc_alloc(MEMORY[0x1E0DC3990]);
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HKElectrocardiogramAxisView options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "scaleMetricsAutomatically") & 1) != 0)
  {
    -[HKElectrocardiogramAxisView metrics](self, "metrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramAxisView options](self, "options");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "axisLabelFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramAxisView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scaledFontForFont:compatibleWithTraitCollection:", v9, v10);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v2);

  }
  else
  {
    -[HKElectrocardiogramAxisView options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "axisLabelFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v8);
  }

  -[HKElectrocardiogramAxisView options](self, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "axisLabelTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v12);

  objc_msgSend(v5, "setTextAlignment:", 0);
  -[HKElectrocardiogramAxisView options](self, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", objc_msgSend(v13, "scaleMetricsAutomatically"));

  -[HKElectrocardiogramAxisView addSubview:](self, "addSubview:", v5);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "firstBaselineAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramAxisView topAnchor](self, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramAxisView options](self, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "scaleMetricsAutomatically");
  if (v17)
  {
    -[HKElectrocardiogramAxisView metrics](self, "metrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramAxisView options](self, "options");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "topBaselineMargin");
    objc_msgSend(v18, "scaledValueForValue:");
  }
  else
  {
    -[HKElectrocardiogramAxisView options](self, "options");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topBaselineMargin");
  }
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  if (v17)
  -[HKElectrocardiogramAxisView bottomAnchor](self, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastBaselineAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramAxisView options](self, "options");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "scaleMetricsAutomatically");
  if (v23)
  {
    -[HKElectrocardiogramAxisView metrics](self, "metrics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramAxisView options](self, "options");
    self = (HKElectrocardiogramAxisView *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramAxisView bottomBaselineMargin](self, "bottomBaselineMargin");
    objc_msgSend(v24, "scaledValueForValue:");
  }
  else
  {
    -[HKElectrocardiogramAxisView options](self, "options");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomBaselineMargin");
  }
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  if (v23)
  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKElectrocardiogramAxisView;
  -[HKElectrocardiogramAxisView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[HKElectrocardiogramAxisView setNeedsLayout](self, "setNeedsLayout");
}

- (UIFont)axisLabelFont
{
  void *v2;
  void *v3;

  -[HKElectrocardiogramAxisView options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axisLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (double)lineWidth
{
  void *v2;
  double v3;
  double v4;

  -[HKElectrocardiogramAxisView options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineWidth");
  v4 = v3;

  return v4;
}

- (UIColor)lineColor
{
  void *v2;
  void *v3;

  -[HKElectrocardiogramAxisView options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (double)axisSpacing
{
  return self->_axisSpacing;
}

- (void)setAxisSpacing:(double)a3
{
  self->_axisSpacing = a3;
}

- (HKElectrocardiogramAxisOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (CAReplicatorLayer)ticksLayer
{
  return self->_ticksLayer;
}

- (void)setTicksLayer:(id)a3
{
  objc_storeStrong((id *)&self->_ticksLayer, a3);
}

- (UIFontMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (int64_t)startingIndex
{
  return self->_startingIndex;
}

- (void)setStartingIndex:(int64_t)a3
{
  self->_startingIndex = a3;
}

- (CGSize)lastBoundsSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastBoundsSize.width;
  height = self->_lastBoundsSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastBoundsSize:(CGSize)a3
{
  self->_lastBoundsSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_ticksLayer, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
