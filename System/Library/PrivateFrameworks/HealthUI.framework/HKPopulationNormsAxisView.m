@implementation HKPopulationNormsAxisView

- (HKPopulationNormsAxisView)initWithOrientation:(int64_t)a3 axisLabels:(id)a4
{
  id v8;
  HKPopulationNormsAxisView *v9;
  HKPopulationNormsAxisView *v10;
  id *p_axisLabelValues;
  void *v12;
  uint64_t v13;
  NSDictionary *axisLabelAttributes;
  uint64_t v15;
  NSMutableArray *axisLabelViews;
  unint64_t v17;
  _HKPopulationNormsAxisLabelView *v18;
  void *v19;
  _HKPopulationNormsAxisLabelView *v20;
  void *v21;
  void *v23;
  objc_super v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HKPopulationNormsAxisView;
  v9 = -[HKPopulationNormsAxisView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    v9->_orientation = a3;
    p_axisLabelValues = (id *)&v9->_axisLabelValues;
    objc_storeStrong((id *)&v9->_axisLabelValues, a4);
    if (!v10->_orientation && (unint64_t)objc_msgSend(*p_axisLabelValues, "count") <= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("HKPopulationNormsAxisView.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_axisLabelValues.count > 1"));

    }
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0DC1138];
    v26[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    axisLabelAttributes = v10->_axisLabelAttributes;
    v10->_axisLabelAttributes = (NSDictionary *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    axisLabelViews = v10->_axisLabelViews;
    v10->_axisLabelViews = (NSMutableArray *)v15;

    if (objc_msgSend(v8, "count"))
    {
      v17 = 0;
      do
      {
        v18 = [_HKPopulationNormsAxisLabelView alloc];
        objc_msgSend(*p_axisLabelValues, "objectAtIndexedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[_HKPopulationNormsAxisLabelView initWithLabel:](v18, "initWithLabel:", v19);

        -[_HKPopulationNormsAxisLabelView setFont:](v20, "setFont:", v12);
        objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisLabelColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HKPopulationNormsAxisLabelView setTextColor:](v20, "setTextColor:", v21);

        -[HKPopulationNormsAxisView addSubview:](v10, "addSubview:", v20);
        -[NSMutableArray addObject:](v10->_axisLabelViews, "addObject:", v20);

        ++v17;
      }
      while (objc_msgSend(v8, "count") > v17);
    }

  }
  return v10;
}

- (void)layoutSubviews
{
  int64_t orientation;
  void *v4;
  double Height;
  void *v6;
  double Width;
  uint64_t v8;
  unint64_t v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v21.receiver = self;
  v21.super_class = (Class)HKPopulationNormsAxisView;
  -[HKPopulationNormsAxisView layoutSubviews](&v21, sel_layoutSubviews);
  orientation = self->_orientation;
  -[HKPopulationNormsAxisView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  Height = CGRectGetHeight(v22);

  -[HKPopulationNormsAxisView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  Width = CGRectGetWidth(v23);

  if (!orientation)
    Width = Height;
  v8 = -[NSMutableArray count](self->_axisLabelViews, "count");
  if (-[NSMutableArray count](self->_axisLabelViews, "count"))
  {
    v9 = 0;
    v10 = Width / (double)((__PAIR128__(v8, orientation) - 1) >> 64);
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_axisLabelViews, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10 * (double)(int)v9;
      objc_msgSend(v11, "axisLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sizeWithAttributes:", self->_axisLabelAttributes);
      v16 = v15;
      v18 = v17;

      v19 = v12 + 5.0;
      if (!orientation)
        v19 = 5.0;
      v20 = Height - v12 + v18 * -0.5;
      if (orientation)
        v20 = 6.0;
      objc_msgSend(v11, "setFrame:", v19, v20, v16, v18);
      objc_msgSend(v11, "setNeedsLayout");

      ++v9;
    }
    while (-[NSMutableArray count](self->_axisLabelViews, "count") > v9);
  }
}

- (double)minorDimensionSize
{
  int64_t orientation;
  unint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  orientation = self->_orientation;
  if (!-[NSMutableArray count](self->_axisLabelViews, "count"))
    return 0.0;
  v4 = 0;
  v5 = 0.0;
  do
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_axisLabelViews, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axisLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeWithAttributes:", self->_axisLabelAttributes);
    v10 = v9;
    v12 = v11;

    v13 = v10 + 5.0;
    if (orientation)
      v13 = v12 + 6.0;
    v5 = fmax(v5, v13);

    ++v4;
  }
  while (-[NSMutableArray count](self->_axisLabelViews, "count") > v4);
  return v5;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (NSArray)axisLabelValues
{
  return self->_axisLabelValues;
}

- (void)setAxisLabelValues:(id)a3
{
  objc_storeStrong((id *)&self->_axisLabelValues, a3);
}

- (NSDictionary)axisLabelAttributes
{
  return self->_axisLabelAttributes;
}

- (void)setAxisLabelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_axisLabelAttributes, a3);
}

- (NSMutableArray)axisLabelViews
{
  return self->_axisLabelViews;
}

- (void)setAxisLabelViews:(id)a3
{
  objc_storeStrong((id *)&self->_axisLabelViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisLabelViews, 0);
  objc_storeStrong((id *)&self->_axisLabelAttributes, 0);
  objc_storeStrong((id *)&self->_axisLabelValues, 0);
}

@end
