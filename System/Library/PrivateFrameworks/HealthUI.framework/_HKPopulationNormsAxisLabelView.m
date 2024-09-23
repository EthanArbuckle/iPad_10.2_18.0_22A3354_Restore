@implementation _HKPopulationNormsAxisLabelView

- (_HKPopulationNormsAxisLabelView)initWithLabel:(id)a3
{
  id v5;
  _HKPopulationNormsAxisLabelView *v6;
  _HKPopulationNormsAxisLabelView *v7;
  UILabel *v8;
  UILabel *rangeStartLabel;
  void *v10;
  UILabel *v11;
  UILabel *rangeSeparatorLabel;
  UILabel *v13;
  UILabel *rangeEndLabel;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_HKPopulationNormsAxisLabelView;
  v6 = -[_HKPopulationNormsAxisLabelView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_axisLabel, a3);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    rangeStartLabel = v7->_rangeStartLabel;
    v7->_rangeStartLabel = v8;

    -[_HKPopulationNormsAxisLabelView addSubview:](v7, "addSubview:", v7->_rangeStartLabel);
    -[HKPopulationNormsAxisLabel rangeEnd](v7->_axisLabel, "rangeEnd");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      rangeSeparatorLabel = v7->_rangeSeparatorLabel;
      v7->_rangeSeparatorLabel = v11;

      -[_HKPopulationNormsAxisLabelView addSubview:](v7, "addSubview:", v7->_rangeSeparatorLabel);
      v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      rangeEndLabel = v7->_rangeEndLabel;
      v7->_rangeEndLabel = v13;

      -[_HKPopulationNormsAxisLabelView addSubview:](v7, "addSubview:", v7->_rangeEndLabel);
    }
  }

  return v7;
}

- (void)setTextColor:(id)a3
{
  UILabel *rangeStartLabel;
  id v5;

  rangeStartLabel = self->_rangeStartLabel;
  v5 = a3;
  -[UILabel setTextColor:](rangeStartLabel, "setTextColor:", v5);
  -[UILabel setTextColor:](self->_rangeSeparatorLabel, "setTextColor:", v5);
  -[UILabel setTextColor:](self->_rangeEndLabel, "setTextColor:", v5);

}

- (void)setFont:(id)a3
{
  UILabel *rangeStartLabel;
  id v5;

  rangeStartLabel = self->_rangeStartLabel;
  v5 = a3;
  -[UILabel setFont:](rangeStartLabel, "setFont:", v5);
  -[UILabel setFont:](self->_rangeSeparatorLabel, "setFont:", v5);
  -[UILabel setFont:](self->_rangeEndLabel, "setFont:", v5);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat MaxX;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  -[HKPopulationNormsAxisLabel stringRepresentation](self->_axisLabel, "stringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsAxisLabel separatorString](self->_axisLabel, "separatorString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", v4);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_rangeStartLabel, "setText:", v5);

  -[UILabel sizeToFit](self->_rangeStartLabel, "sizeToFit");
  if (self->_rangeEndLabel && objc_msgSend(v26, "count") == 2)
  {
    -[HKPopulationNormsAxisLabel separatorString](self->_axisLabel, "separatorString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_rangeSeparatorLabel, "setText:", v6);

    -[UILabel sizeToFit](self->_rangeSeparatorLabel, "sizeToFit");
    -[UILabel bounds](self->_rangeSeparatorLabel, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[UILabel frame](self->_rangeStartLabel, "frame");
    MaxX = CGRectGetMaxX(v27);
    v28.origin.x = v8;
    v28.origin.y = v10;
    v28.size.width = v12;
    v28.size.height = v14;
    v29 = CGRectOffset(v28, MaxX, 0.0);
    -[UILabel setFrame:](self->_rangeSeparatorLabel, "setFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
    objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_rangeEndLabel, "setText:", v16);

    -[UILabel sizeToFit](self->_rangeEndLabel, "sizeToFit");
    -[UILabel bounds](self->_rangeEndLabel, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[UILabel frame](self->_rangeSeparatorLabel, "frame");
    v25 = CGRectGetMaxX(v30);
    v31.origin.x = v18;
    v31.origin.y = v20;
    v31.size.width = v22;
    v31.size.height = v24;
    v32 = CGRectOffset(v31, v25, 0.0);
    -[UILabel setFrame:](self->_rangeEndLabel, "setFrame:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
  }

}

- (HKPopulationNormsAxisLabel)axisLabel
{
  return self->_axisLabel;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFont)font
{
  return self->_font;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_axisLabel, 0);
  objc_storeStrong((id *)&self->_rangeEndLabel, 0);
  objc_storeStrong((id *)&self->_rangeSeparatorLabel, 0);
  objc_storeStrong((id *)&self->_rangeStartLabel, 0);
}

@end
