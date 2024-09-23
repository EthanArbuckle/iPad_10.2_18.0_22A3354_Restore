@implementation HKPopulationNormsAgeBucketBarView

- (HKPopulationNormsAgeBucketBarView)initWithReferenceMinY:(double)a3 referenceMaxY:(double)a4 highlightColor:(id)a5
{
  id v9;
  HKPopulationNormsAgeBucketBarView *v10;
  HKPopulationNormsAgeBucketBarView *v11;
  CALayer *v12;
  CALayer *underlyingBarLayer;
  id v14;
  void *v15;
  CALayer *v16;
  CALayer *segmentsLayer;
  CALayer *v18;
  CALayer *highlightedLayer;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSDictionary *highlightedTextLayerAttributes;
  CATextLayer *v28;
  CATextLayer *highlightedTopLabelLayer;
  void *v30;
  uint64_t v31;
  void *v32;
  CATextLayer *v33;
  CATextLayer *highlightedBottomLabelLayer;
  void *v35;
  void *v36;
  objc_super v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v38.receiver = self;
  v38.super_class = (Class)HKPopulationNormsAgeBucketBarView;
  v10 = -[HKPopulationNormsAgeBucketBarView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v11 = v10;
  if (v10)
  {
    v10->_referenceMinY = a3;
    v10->_referenceMaxY = a4;
    v12 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    underlyingBarLayer = v11->_underlyingBarLayer;
    v11->_underlyingBarLayer = v12;

    -[CALayer setCornerRadius:](v11->_underlyingBarLayer, "setCornerRadius:", 5.0);
    -[CALayer setMasksToBounds:](v11->_underlyingBarLayer, "setMasksToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v11->_underlyingBarLayer, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

    -[HKPopulationNormsAgeBucketBarView layer](v11, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSublayer:", v11->_underlyingBarLayer);

    v16 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    segmentsLayer = v11->_segmentsLayer;
    v11->_segmentsLayer = v16;

    -[CALayer addSublayer:](v11->_underlyingBarLayer, "addSublayer:", v11->_segmentsLayer);
    objc_storeStrong((id *)&v11->_highlightColor, a5);
    v18 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    highlightedLayer = v11->_highlightedLayer;
    v11->_highlightedLayer = v18;

    -[CALayer setCornerRadius:](v11->_highlightedLayer, "setCornerRadius:", 2.0);
    -[CALayer setMasksToBounds:](v11->_highlightedLayer, "setMasksToBounds:", 1);
    -[CALayer setBackgroundColor:](v11->_highlightedLayer, "setBackgroundColor:", -[UIColor CGColor](v11->_highlightColor, "CGColor"));
    -[CALayer addSublayer:](v11->_underlyingBarLayer, "addSublayer:", v11->_highlightedLayer);
    v20 = (void *)MEMORY[0x1E0DC1350];
    v21 = *MEMORY[0x1E0DC4AA0];
    v22 = *MEMORY[0x1E0DC13A8];
    v23 = *MEMORY[0x1E0DC4900];
    -[HKPopulationNormsAgeBucketBarView traitCollection](v11, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", v21, v22, 1024, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = *MEMORY[0x1E0DC1138];
    v40[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    highlightedTextLayerAttributes = v11->_highlightedTextLayerAttributes;
    v11->_highlightedTextLayerAttributes = (NSDictionary *)v26;

    v28 = (CATextLayer *)objc_alloc_init(MEMORY[0x1E0CD28A0]);
    highlightedTopLabelLayer = v11->_highlightedTopLabelLayer;
    v11->_highlightedTopLabelLayer = v28;

    -[CATextLayer setFont:](v11->_highlightedTopLabelLayer, "setFont:", v25);
    -[CATextLayer setFontSize:](v11->_highlightedTopLabelLayer, "setFontSize:", 12.0);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "scale");
    -[CATextLayer setContentsScale:](v11->_highlightedTopLabelLayer, "setContentsScale:");

    v31 = *MEMORY[0x1E0CD28F0];
    -[CATextLayer setAlignmentMode:](v11->_highlightedTopLabelLayer, "setAlignmentMode:", *MEMORY[0x1E0CD28F0]);
    -[HKPopulationNormsAgeBucketBarView layer](v11, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSublayer:", v11->_highlightedTopLabelLayer);

    v33 = (CATextLayer *)objc_alloc_init(MEMORY[0x1E0CD28A0]);
    highlightedBottomLabelLayer = v11->_highlightedBottomLabelLayer;
    v11->_highlightedBottomLabelLayer = v33;

    -[CATextLayer setFont:](v11->_highlightedBottomLabelLayer, "setFont:", v25);
    -[CATextLayer setFontSize:](v11->_highlightedBottomLabelLayer, "setFontSize:", 12.0);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "scale");
    -[CATextLayer setContentsScale:](v11->_highlightedBottomLabelLayer, "setContentsScale:");

    -[CATextLayer setAlignmentMode:](v11->_highlightedBottomLabelLayer, "setAlignmentMode:", v31);
    -[HKPopulationNormsAgeBucketBarView layer](v11, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSublayer:", v11->_highlightedBottomLabelLayer);

  }
  return v11;
}

- (void)updateWithAscendingThresholds:(id)a3 currentHighlightIndex:(unint64_t)a4
{
  id v8;
  NSArray **p_ascendingThresholds;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  double v24;
  void *v25;
  float v26;
  void *v27;
  float v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((unint64_t)objc_msgSend(v8, "count") <= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKPopulationNormsAgeBucketBarView.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ascendingThresholds.count > 2"));

  }
  p_ascendingThresholds = &self->_ascendingThresholds;
  if (-[NSArray count](self->_ascendingThresholds, "count") - 1 <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKPopulationNormsAgeBucketBarView.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("segmentIndex >= 0 && segmentIndex < _ascendingThresholds.count-1"));

  }
  objc_storeStrong((id *)&self->_ascendingThresholds, a3);
  self->_highlightedSegmentIndex = a4;
  v10 = -[NSArray count](*p_ascendingThresholds, "count");
  -[CALayer sublayers](self->_segmentsLayer, "sublayers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  v13 = v10 + ~v12;

  if (v13 < 1)
  {
    if (v13 < 0)
    {
      v15 = v12 - v10 + 1;
      do
      {
        -[CALayer sublayers](self->_segmentsLayer, "sublayers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeFromSuperlayer");

        --v15;
      }
      while (v15);
    }
  }
  else
  {
    do
    {
      v14 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
      objc_msgSend(v14, "setCornerRadius:", 2.0);
      -[CALayer addSublayer:](self->_segmentsLayer, "addSublayer:", v14);

      --v13;
    }
    while (v13);
  }
  self->_visibleBarMinY = 1.79769313e308;
  self->_visibleBarMaxY = 2.22507386e-308;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v37;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v22), "floatValue");
        v24 = v23;
        if (self->_visibleBarMinY > v24)
          self->_visibleBarMinY = v24;
        if (self->_visibleBarMaxY <= v24)
          self->_visibleBarMaxY = v24;
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v20);
  }

  -[NSArray objectAtIndexedSubscript:](*p_ascendingThresholds, "objectAtIndexedSubscript:", a4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  self->_highlightedSectionMinY = v26;

  -[NSArray objectAtIndexedSubscript:](*p_ascendingThresholds, "objectAtIndexedSubscript:", a4 + 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");
  self->_highlightedSectionMaxY = v28;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_highlightedSectionMinY);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForNumberWithDecimalPrecision(v29, 1, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATextLayer setString:](self->_highlightedBottomLabelLayer, "setString:", v30);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_highlightedSectionMaxY);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForNumberWithDecimalPrecision(v31, 1, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATextLayer setString:](self->_highlightedTopLabelLayer, "setString:", v32);

  -[HKPopulationNormsAgeBucketBarView layer](self, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layoutSublayers");

}

- (void)layoutSublayersOfLayer:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  CGColor *v9;
  id v10;
  id v11;
  double referenceMaxY;
  double v13;
  double visibleBarMaxY;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  CGFloat Width;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double MinY;
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
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  float v58;
  double v59;
  double v60;
  float v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  id v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v67 = a3;
  -[HKPopulationNormsAgeBucketBarView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v67, "isEqual:", v4);

  v6 = v67;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_populationChartSeriesColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");

    v9 = -[UIColor CGColor](self->_highlightColor, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_populationChartTextColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CATextLayer setForegroundColor:](self->_highlightedTopLabelLayer, "setForegroundColor:", objc_msgSend(v10, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "hk_populationChartTextColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CATextLayer setForegroundColor:](self->_highlightedBottomLabelLayer, "setForegroundColor:", objc_msgSend(v11, "CGColor"));

    referenceMaxY = self->_referenceMaxY;
    v13 = referenceMaxY - self->_referenceMinY;
    visibleBarMaxY = self->_visibleBarMaxY;
    v15 = visibleBarMaxY - self->_visibleBarMinY;
    v16 = v15 / v13;
    v17 = (referenceMaxY - visibleBarMaxY) / v13;
    -[HKPopulationNormsAgeBucketBarView layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v19 = CGRectGetWidth(v68) + -20.0;

    if (v19 > 30.0)
      v19 = 30.0;
    -[HKPopulationNormsAgeBucketBarView window](self, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v8;
    if (v20)
    {
      -[HKPopulationNormsAgeBucketBarView window](self, "window");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "traitCollection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "horizontalSizeClass");

      if (v24 == 2)
      {
        -[HKPopulationNormsAgeBucketBarView layer](self, "layer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "frame");
        v19 = CGRectGetWidth(v69) + -20.0;

        if (v19 > 60.0)
          v19 = 60.0;
      }
    }
    -[HKPopulationNormsAgeBucketBarView layer](self, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    Width = CGRectGetWidth(v70);
    v28 = HKUIFloorToScreenScale((Width - v19) * 0.5);

    -[HKPopulationNormsAgeBucketBarView layer](self, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");
    v30 = v17 * CGRectGetHeight(v71);
    -[HKPopulationNormsAgeBucketBarView layer](self, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "frame");
    -[CALayer setFrame:](self->_underlyingBarLayer, "setFrame:", v28, v30, v19, v16 * CGRectGetHeight(v72));

    -[CALayer frame](self->_underlyingBarLayer, "frame");
    MinY = CGRectGetMinY(v73);
    v33 = self->_visibleBarMaxY;
    v34 = (v33 - self->_highlightedSectionMinY) / v15;
    v35 = (v33 - self->_highlightedSectionMaxY) / v15;
    if (-[HKPopulationNormsAgeBucketBarView _bottomSegmentIsHighlighted](self, "_bottomSegmentIsHighlighted"))
      v36 = 0.0;
    else
      v36 = 1.0;
    if (-[HKPopulationNormsAgeBucketBarView _topSegmentIsHighlighted](self, "_topSegmentIsHighlighted"))
      v37 = 0.0;
    else
      v37 = 1.0;
    -[CALayer frame](self->_underlyingBarLayer, "frame");
    v38 = -(v36 - CGRectGetHeight(v74) * v34);
    -[CALayer frame](self->_underlyingBarLayer, "frame");
    v39 = v37 + CGRectGetHeight(v75) * v35;
    -[CALayer setBackgroundColor:](self->_highlightedLayer, "setBackgroundColor:", v9);
    -[CALayer frame](self->_underlyingBarLayer, "frame");
    -[CALayer setFrame:](self->_highlightedLayer, "setFrame:", 0.0, v38, CGRectGetWidth(v76), v39 - v38);
    -[CATextLayer string](self->_highlightedTopLabelLayer, "string");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "sizeWithAttributes:", self->_highlightedTextLayerAttributes);
    v41 = v40;
    v42 = MinY + v39 - v40 + -4.0;
    -[HKPopulationNormsAgeBucketBarView layer](self, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "frame");
    -[CATextLayer setFrame:](self->_highlightedTopLabelLayer, "setFrame:", 0.0, v42, CGRectGetWidth(v77), v41);

    -[CATextLayer setHidden:](self->_highlightedTopLabelLayer, "setHidden:", -[HKPopulationNormsAgeBucketBarView _topSegmentIsHighlighted](self, "_topSegmentIsHighlighted"));
    -[CATextLayer string](self->_highlightedBottomLabelLayer, "string");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "sizeWithAttributes:", self->_highlightedTextLayerAttributes);
    v45 = v44;
    -[HKPopulationNormsAgeBucketBarView layer](self, "layer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "frame");
    -[CATextLayer setFrame:](self->_highlightedBottomLabelLayer, "setFrame:", 0.0, MinY + v38 + 4.0, CGRectGetWidth(v78), v45);

    -[CATextLayer setHidden:](self->_highlightedBottomLabelLayer, "setHidden:", -[HKPopulationNormsAgeBucketBarView _bottomSegmentIsHighlighted](self, "_bottomSegmentIsHighlighted"));
    -[CALayer bounds](self->_underlyingBarLayer, "bounds");
    -[CALayer setFrame:](self->_segmentsLayer, "setFrame:");
    -[CALayer sublayers](self->_segmentsLayer, "sublayers");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");

    if (v48)
    {
      v49 = 0;
      do
      {
        -[CALayer sublayers](self->_segmentsLayer, "sublayers");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectAtIndexedSubscript:", v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v51, "setBackgroundColor:", v21);
        -[NSArray objectAtIndexedSubscript:](self->_ascendingThresholds, "objectAtIndexedSubscript:", v49);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v49 + 1;
        -[NSArray objectAtIndexedSubscript:](self->_ascendingThresholds, "objectAtIndexedSubscript:", v49 + 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
          v55 = 1.0;
        else
          v55 = 0.0;
        if (v49 == v48 - 1)
          v56 = 0.0;
        else
          v56 = 1.0;
        v57 = self->_visibleBarMaxY;
        objc_msgSend(v52, "floatValue");
        v59 = (v57 - v58) / v15;
        v60 = self->_visibleBarMaxY;
        objc_msgSend(v54, "floatValue");
        v62 = (v60 - v61) / v15;
        -[CALayer frame](self->_segmentsLayer, "frame");
        v63 = -(v55 - CGRectGetHeight(v79) * v59);
        -[CALayer frame](self->_segmentsLayer, "frame");
        v64 = v56 + CGRectGetHeight(v80) * v62;
        -[CALayer frame](self->_segmentsLayer, "frame");
        objc_msgSend(v51, "setFrame:", 0.0, v63, CGRectGetWidth(v81), v64 - v63);

        ++v49;
      }
      while (v53 != v48);
    }

    v6 = v67;
  }

}

- (BOOL)_bottomSegmentIsHighlighted
{
  return self->_highlightedSegmentIndex == 0;
}

- (BOOL)_topSegmentIsHighlighted
{
  unint64_t highlightedSegmentIndex;

  highlightedSegmentIndex = self->_highlightedSegmentIndex;
  return highlightedSegmentIndex == -[NSArray count](self->_ascendingThresholds, "count") - 2;
}

- (double)referenceMinY
{
  return self->_referenceMinY;
}

- (void)setReferenceMinY:(double)a3
{
  self->_referenceMinY = a3;
}

- (double)referenceMaxY
{
  return self->_referenceMaxY;
}

- (void)setReferenceMaxY:(double)a3
{
  self->_referenceMaxY = a3;
}

- (NSArray)ascendingThresholds
{
  return self->_ascendingThresholds;
}

- (void)setAscendingThresholds:(id)a3
{
  objc_storeStrong((id *)&self->_ascendingThresholds, a3);
}

- (CALayer)underlyingBarLayer
{
  return self->_underlyingBarLayer;
}

- (void)setUnderlyingBarLayer:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingBarLayer, a3);
}

- (CALayer)segmentsLayer
{
  return self->_segmentsLayer;
}

- (void)setSegmentsLayer:(id)a3
{
  objc_storeStrong((id *)&self->_segmentsLayer, a3);
}

- (double)visibleBarMinY
{
  return self->_visibleBarMinY;
}

- (void)setVisibleBarMinY:(double)a3
{
  self->_visibleBarMinY = a3;
}

- (double)visibleBarMaxY
{
  return self->_visibleBarMaxY;
}

- (void)setVisibleBarMaxY:(double)a3
{
  self->_visibleBarMaxY = a3;
}

- (CALayer)highlightedLayer
{
  return self->_highlightedLayer;
}

- (void)setHighlightedLayer:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedLayer, a3);
}

- (CATextLayer)highlightedTopLabelLayer
{
  return self->_highlightedTopLabelLayer;
}

- (void)setHighlightedTopLabelLayer:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedTopLabelLayer, a3);
}

- (CATextLayer)highlightedBottomLabelLayer
{
  return self->_highlightedBottomLabelLayer;
}

- (void)setHighlightedBottomLabelLayer:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBottomLabelLayer, a3);
}

- (NSDictionary)highlightedTextLayerAttributes
{
  return self->_highlightedTextLayerAttributes;
}

- (void)setHighlightedTextLayerAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedTextLayerAttributes, a3);
}

- (unint64_t)highlightedSegmentIndex
{
  return self->_highlightedSegmentIndex;
}

- (void)setHighlightedSegmentIndex:(unint64_t)a3
{
  self->_highlightedSegmentIndex = a3;
}

- (double)highlightedSectionMinY
{
  return self->_highlightedSectionMinY;
}

- (void)setHighlightedSectionMinY:(double)a3
{
  self->_highlightedSectionMinY = a3;
}

- (double)highlightedSectionMaxY
{
  return self->_highlightedSectionMaxY;
}

- (void)setHighlightedSectionMaxY:(double)a3
{
  self->_highlightedSectionMaxY = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_highlightedTextLayerAttributes, 0);
  objc_storeStrong((id *)&self->_highlightedBottomLabelLayer, 0);
  objc_storeStrong((id *)&self->_highlightedTopLabelLayer, 0);
  objc_storeStrong((id *)&self->_highlightedLayer, 0);
  objc_storeStrong((id *)&self->_segmentsLayer, 0);
  objc_storeStrong((id *)&self->_underlyingBarLayer, 0);
  objc_storeStrong((id *)&self->_ascendingThresholds, 0);
}

@end
