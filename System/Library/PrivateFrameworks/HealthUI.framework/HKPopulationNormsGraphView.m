@implementation HKPopulationNormsGraphView

- (HKPopulationNormsGraphView)initWithMaxYValue:(double)a3 minYValue:(double)a4 YSeriesTitle:(id)a5 XSeriesTitle:(id)a6 highlightedSegmentColor:(id)a7
{
  id v14;
  id v15;
  id v16;
  HKPopulationNormsGraphView *v17;
  uint64_t v18;
  UIFont *seriesTitleFont;
  void *v21;
  objc_super v22;

  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HKPopulationNormsGraphView;
  v17 = -[HKPopulationNormsGraphView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v17)
  {
    if (a3 <= a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("HKPopulationNormsGraphView.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maxChartYValue > minChartYValue"));

    }
    v17->_maxChartYValue = a3;
    v17->_minChartYValue = a4;
    objc_storeStrong((id *)&v17->_ySeriesTitle, a5);
    objc_storeStrong((id *)&v17->_xSeriesTitle, a6);
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
    v18 = objc_claimAutoreleasedReturnValue();
    seriesTitleFont = v17->_seriesTitleFont;
    v17->_seriesTitleFont = (UIFont *)v18;

    objc_storeStrong((id *)&v17->_highlightedSegmentColor, a7);
  }

  return v17;
}

- (unint64_t)_highlightIndexForClassificationIndex:(unint64_t)a3 numberOfSegments:(unint64_t)a4
{
  if (a3 >= a4)
    return 0;
  else
    return ~a3 + a4;
}

- (void)updateWithFlattenedLevelsByAgeBucket:(id)a3 currentClassificationIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  HKPopulationNormsUnboundedEndAxisLabel *v19;
  void *v20;
  HKPopulationNormsUnboundedEndAxisLabel *v21;
  HKPopulationNormsAxisLabel *v22;
  void *v23;
  void *v24;
  double minChartYValue;
  float v26;
  double maxChartYValue;
  float v28;
  HKPopulationNormsAxisLabel *v29;
  double v30;
  void *v31;
  HKPopulationNormsAxisLabel *v32;
  UILabel *v33;
  UILabel *ySeriesTitleLabel;
  void *v35;
  UILabel *v36;
  UILabel *xSeriesTitleLabel;
  void *v38;
  HKPopulationNormsChartGridView *v39;
  HKPopulationNormsChartGridView *gridView;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSMutableArray *ageBucketBarViews;
  unint64_t v51;
  HKPopulationNormsAgeBucketBarView *v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  HKPopulationNormsGraphView *v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[8];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = &OBJC_IVAR___HKGraphView__prefersOpaqueLegends;
  if (!self->_gridView)
  {
    v79 = v6;
    v80 = self;
    v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v78 = v8;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
    v81 = v10;
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v84;
      v14 = *MEMORY[0x1E0CB4868];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v84 != v13)
            objc_enumerationMutation(v10);
          v16 = objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * i), "rangeValue");
          v18 = v16 + v17;
          if (v16 + v17 == v14)
          {
            v19 = [HKPopulationNormsUnboundedEndAxisLabel alloc];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[HKPopulationNormsUnboundedEndAxisLabel initWithRangeStart:](v19, "initWithRangeStart:", v20);
          }
          else
          {
            v22 = [HKPopulationNormsAxisLabel alloc];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[HKPopulationNormsAxisLabel initWithRangeStart:end:](v22, "initWithRangeStart:end:", v20, v23);

            v10 = v81;
          }

          objc_msgSend(v82, "addObject:", v21);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
      }
      while (v12);
    }

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
    minChartYValue = v80->_minChartYValue;
    v26 = minChartYValue;
    maxChartYValue = v80->_maxChartYValue;
    if (maxChartYValue >= v26)
    {
      v28 = (maxChartYValue - minChartYValue) / 6.0;
      do
      {
        v29 = [HKPopulationNormsAxisLabel alloc];
        *(float *)&v30 = v26;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[HKPopulationNormsAxisLabel initWithValue:](v29, "initWithValue:", v31);

        objc_msgSend(v24, "addObject:", v32);
        v26 = v26 + v28;
      }
      while (v80->_maxChartYValue >= v26);
    }
    v33 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    ySeriesTitleLabel = v80->_ySeriesTitleLabel;
    v80->_ySeriesTitleLabel = v33;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v80->_ySeriesTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v80->_ySeriesTitleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisLabelColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v80->_ySeriesTitleLabel, "setTextColor:", v35);

    -[UILabel setText:](v80->_ySeriesTitleLabel, "setText:", v80->_ySeriesTitle);
    -[UILabel setFont:](v80->_ySeriesTitleLabel, "setFont:", v80->_seriesTitleFont);
    -[HKPopulationNormsGraphView addSubview:](v80, "addSubview:", v80->_ySeriesTitleLabel);
    v36 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    xSeriesTitleLabel = v80->_xSeriesTitleLabel;
    v80->_xSeriesTitleLabel = v36;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v80->_xSeriesTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v80->_xSeriesTitleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisLabelColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v80->_xSeriesTitleLabel, "setTextColor:", v38);

    -[UILabel setText:](v80->_xSeriesTitleLabel, "setText:", v80->_xSeriesTitle);
    -[UILabel setFont:](v80->_xSeriesTitleLabel, "setFont:", v80->_seriesTitleFont);
    -[HKPopulationNormsGraphView addSubview:](v80, "addSubview:", v80->_xSeriesTitleLabel);
    v77 = v24;
    v39 = -[HKPopulationNormsChartGridView initWithXAxisLabels:YAxisLabels:]([HKPopulationNormsChartGridView alloc], "initWithXAxisLabels:YAxisLabels:", v82, v24);
    gridView = v80->_gridView;
    v80->_gridView = v39;

    -[HKPopulationNormsChartGridView setTranslatesAutoresizingMaskIntoConstraints:](v80->_gridView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsChartGridView setBackgroundColor:](v80->_gridView, "setBackgroundColor:", v41);

    -[HKPopulationNormsGraphView addSubview:](v80, "addSubview:", v80->_gridView);
    v69 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v80->_ySeriesTitleLabel, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsGraphView topAnchor](v80, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v66);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v76;
    -[UILabel rightAnchor](v80->_ySeriesTitleLabel, "rightAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsGraphView rightAnchor](v80, "rightAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v74);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v73;
    -[HKPopulationNormsChartGridView topAnchor](v80->_gridView, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v80->_ySeriesTitleLabel, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, 10.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v87[2] = v70;
    -[HKPopulationNormsChartGridView leftAnchor](v80->_gridView, "leftAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsGraphView leftAnchor](v80, "leftAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v87[3] = v64;
    -[HKPopulationNormsChartGridView rightAnchor](v80->_gridView, "rightAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsGraphView rightAnchor](v80, "rightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v62);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v87[4] = v61;
    -[UILabel topAnchor](v80->_xSeriesTitleLabel, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsChartGridView bottomAnchor](v80->_gridView, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 3.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v87[5] = v58;
    -[UILabel leftAnchor](v80->_xSeriesTitleLabel, "leftAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsGraphView leftAnchor](v80, "leftAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 5.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v87[6] = v44;
    -[UILabel bottomAnchor](v80->_xSeriesTitleLabel, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsGraphView bottomAnchor](v80, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v87[7] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 8);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "activateConstraints:", v48);

    self = v80;
    v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v81, "count"));
    v9 = &OBJC_IVAR___HKGraphView__prefersOpaqueLegends;
    ageBucketBarViews = v80->_ageBucketBarViews;
    v80->_ageBucketBarViews = (NSMutableArray *)v49;

    if (objc_msgSend(v81, "count"))
    {
      v51 = 0;
      do
      {
        v52 = -[HKPopulationNormsAgeBucketBarView initWithReferenceMinY:referenceMaxY:highlightColor:]([HKPopulationNormsAgeBucketBarView alloc], "initWithReferenceMinY:referenceMaxY:highlightColor:", v80->_highlightedSegmentColor, v80->_minChartYValue, v80->_maxChartYValue);
        -[HKPopulationNormsChartGridView addSubview:](v80->_gridView, "addSubview:", v52);
        -[NSMutableArray addObject:](v80->_ageBucketBarViews, "addObject:", v52);

        ++v51;
      }
      while (objc_msgSend(v81, "count") > v51);
    }

    v6 = v79;
    v8 = v78;
  }
  if (objc_msgSend(v8, "count"))
  {
    v53 = 0;
    v54 = v9[1019];
    do
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v54), "objectAtIndexedSubscript:", v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v53);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v55, "updateWithAscendingThresholds:currentHighlightIndex:", v57, -[HKPopulationNormsGraphView _highlightIndexForClassificationIndex:numberOfSegments:](self, "_highlightIndexForClassificationIndex:numberOfSegments:", a4, objc_msgSend(v57, "count") - 1));
      ++v53;
    }
    while (objc_msgSend(v8, "count") > v53);
  }
  -[HKPopulationNormsGraphView setNeedsLayout](self, "setNeedsLayout");
  -[HKPopulationNormsChartGridView relocalizeAxisLabels](self->_gridView, "relocalizeAxisLabels");

}

- (void)_updateUserValueChartPointIfNecessary
{
  UIView *latestSampleHighlightView;
  UIView *v4;
  UIView *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIView *v13;

  if (self->_ageBucketIndex && self->_latestSampleValue)
  {
    latestSampleHighlightView = self->_latestSampleHighlightView;
    if (!latestSampleHighlightView)
    {
      v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v5 = self->_latestSampleHighlightView;
      self->_latestSampleHighlightView = v4;

      -[UIView setUserInteractionEnabled:](self->_latestSampleHighlightView, "setUserInteractionEnabled:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopStickColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_latestSampleHighlightView, "setBackgroundColor:", v6);

      objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = objc_msgSend(v7, "CGColor");
      -[UIView layer](self->_latestSampleHighlightView, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBorderColor:", v8);

      -[UIView layer](self->_latestSampleHighlightView, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBorderWidth:", 1.25);

      -[UIView layer](self->_latestSampleHighlightView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCornerRadius:", 5.0);

      -[UIView layer](self->_latestSampleHighlightView, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMasksToBounds:", 1);

      -[HKPopulationNormsChartGridView addSubview:](self->_gridView, "addSubview:", self->_latestSampleHighlightView);
      latestSampleHighlightView = self->_latestSampleHighlightView;
    }
    -[UIView setHidden:](latestSampleHighlightView, "setHidden:", 0);
    -[HKPopulationNormsGraphView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    v13 = self->_latestSampleHighlightView;
    if (v13)
      -[UIView setHidden:](v13, "setHidden:", 1);
  }
}

- (void)updateWithUserAgeBucketIndex:(id)a3 userLatestSampleValue:(id)a4
{
  NSNumber *v6;
  NSNumber *v7;
  NSNumber *ageBucketIndex;
  NSNumber *latestSampleValue;
  NSNumber *v10;

  v6 = (NSNumber *)a3;
  v7 = (NSNumber *)a4;
  ageBucketIndex = self->_ageBucketIndex;
  self->_ageBucketIndex = v6;
  v10 = v6;

  latestSampleValue = self->_latestSampleValue;
  self->_latestSampleValue = v7;

}

- (void)layoutSubviews
{
  double Width;
  float v4;
  void *v5;
  NSNumber *v6;
  NSNumber *currentViewWidth;
  double minChartYValue;
  double maxChartYValue;
  double v10;
  double v11;
  double v12;
  double v13;
  NSNumber *ageBucketIndex;
  unint64_t v15;
  float v16;
  unint64_t v17;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  if (!self->_currentViewWidth
    || (-[HKPopulationNormsGraphView frame](self, "frame"),
        Width = CGRectGetWidth(v20),
        -[NSNumber floatValue](self->_currentViewWidth, "floatValue"),
        Width != v4))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[HKPopulationNormsGraphView frame](self, "frame");
    objc_msgSend(v5, "numberWithDouble:", CGRectGetWidth(v21));
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    currentViewWidth = self->_currentViewWidth;
    self->_currentViewWidth = v6;

    -[HKPopulationNormsGraphView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  v19.receiver = self;
  v19.super_class = (Class)HKPopulationNormsGraphView;
  -[HKPopulationNormsGraphView layoutSubviews](&v19, sel_layoutSubviews);
  -[HKPopulationNormsChartGridView setNeedsDisplay](self->_gridView, "setNeedsDisplay");
  if (-[NSMutableArray count](self->_ageBucketBarViews, "count"))
  {
    minChartYValue = self->_minChartYValue;
    maxChartYValue = self->_maxChartYValue;
    -[HKPopulationNormsChartGridView determineCanvasRect](self->_gridView, "determineCanvasRect");
    v11 = v10;
    v13 = v12 / (double)(unint64_t)-[NSMutableArray count](self->_ageBucketBarViews, "count");
    ageBucketIndex = self->_ageBucketIndex;
    if (ageBucketIndex && self->_latestSampleValue)
    {
      v15 = -[NSNumber unsignedIntegerValue](ageBucketIndex, "unsignedIntegerValue");
      -[NSNumber floatValue](self->_latestSampleValue, "floatValue");
      -[UIView setFrame:](self->_latestSampleHighlightView, "setFrame:", ((double)v15 + 0.5) * v13 + -5.0, (maxChartYValue - v16) / (maxChartYValue - minChartYValue) * v11 + -5.0, 10.0, 10.0);
    }
    if (-[NSMutableArray count](self->_ageBucketBarViews, "count"))
    {
      v17 = 0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_ageBucketBarViews, "objectAtIndexedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFrame:", v13 * (double)(int)v17, 0.0, v13, v11);
        objc_msgSend(v18, "setNeedsLayout");

        ++v17;
      }
      while (-[NSMutableArray count](self->_ageBucketBarViews, "count") > v17);
    }
  }
}

- (CGSize)intrinsicContentSize
{
  NSNumber *currentViewWidth;
  float v3;
  double v4;
  double v5;
  CGSize result;

  currentViewWidth = self->_currentViewWidth;
  if (currentViewWidth)
  {
    -[NSNumber floatValue](currentViewWidth, "floatValue");
    v4 = v3 * 1.1;
  }
  else
  {
    v4 = 2.22507386e-308;
  }
  v5 = 0.0;
  result.height = v4;
  result.width = v5;
  return result;
}

- (double)maxChartYValue
{
  return self->_maxChartYValue;
}

- (void)setMaxChartYValue:(double)a3
{
  self->_maxChartYValue = a3;
}

- (double)minChartYValue
{
  return self->_minChartYValue;
}

- (void)setMinChartYValue:(double)a3
{
  self->_minChartYValue = a3;
}

- (NSString)ySeriesTitle
{
  return self->_ySeriesTitle;
}

- (void)setYSeriesTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSString)xSeriesTitle
{
  return self->_xSeriesTitle;
}

- (void)setXSeriesTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (UIFont)seriesTitleFont
{
  return self->_seriesTitleFont;
}

- (UIColor)highlightedSegmentColor
{
  return self->_highlightedSegmentColor;
}

- (UILabel)ySeriesTitleLabel
{
  return self->_ySeriesTitleLabel;
}

- (void)setYSeriesTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_ySeriesTitleLabel, a3);
}

- (UILabel)xSeriesTitleLabel
{
  return self->_xSeriesTitleLabel;
}

- (void)setXSeriesTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_xSeriesTitleLabel, a3);
}

- (NSMutableArray)ageBucketBarViews
{
  return self->_ageBucketBarViews;
}

- (void)setAgeBucketBarViews:(id)a3
{
  objc_storeStrong((id *)&self->_ageBucketBarViews, a3);
}

- (HKPopulationNormsChartGridView)gridView
{
  return self->_gridView;
}

- (void)setGridView:(id)a3
{
  objc_storeStrong((id *)&self->_gridView, a3);
}

- (NSNumber)currentViewWidth
{
  return self->_currentViewWidth;
}

- (void)setCurrentViewWidth:(id)a3
{
  objc_storeStrong((id *)&self->_currentViewWidth, a3);
}

- (unint64_t)sexSegmentIndex
{
  return self->_sexSegmentIndex;
}

- (void)setSexSegmentIndex:(unint64_t)a3
{
  self->_sexSegmentIndex = a3;
}

- (unint64_t)classificationIndex
{
  return self->_classificationIndex;
}

- (void)setClassificationIndex:(unint64_t)a3
{
  self->_classificationIndex = a3;
}

- (UIView)latestSampleHighlightView
{
  return self->_latestSampleHighlightView;
}

- (void)setLatestSampleHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_latestSampleHighlightView, a3);
}

- (NSNumber)ageBucketIndex
{
  return self->_ageBucketIndex;
}

- (void)setAgeBucketIndex:(id)a3
{
  objc_storeStrong((id *)&self->_ageBucketIndex, a3);
}

- (NSNumber)latestSampleValue
{
  return self->_latestSampleValue;
}

- (void)setLatestSampleValue:(id)a3
{
  objc_storeStrong((id *)&self->_latestSampleValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSampleValue, 0);
  objc_storeStrong((id *)&self->_ageBucketIndex, 0);
  objc_storeStrong((id *)&self->_latestSampleHighlightView, 0);
  objc_storeStrong((id *)&self->_currentViewWidth, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_ageBucketBarViews, 0);
  objc_storeStrong((id *)&self->_xSeriesTitleLabel, 0);
  objc_storeStrong((id *)&self->_ySeriesTitleLabel, 0);
  objc_storeStrong((id *)&self->_highlightedSegmentColor, 0);
  objc_storeStrong((id *)&self->_seriesTitleFont, 0);
  objc_storeStrong((id *)&self->_xSeriesTitle, 0);
  objc_storeStrong((id *)&self->_ySeriesTitle, 0);
}

@end
