@implementation _SUUICounterTimeFieldView

- (_SUUICounterTimeFieldView)initWithFrame:(CGRect)a3
{
  _SUUICounterTimeFieldView *v3;
  UILabel *v4;
  UILabel *labelLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  UILabel *valueLabel;
  UILabel *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_SUUICounterTimeFieldView;
  v3 = -[_SUUICounterTimeFieldView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    labelLabel = v3->_labelLabel;
    v3->_labelLabel = v4;

    v6 = v3->_labelLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithName:size:", CFSTR("HelveticaNeue-CondensedBold"), 14.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setTextAlignment:](v3->_labelLabel, "setTextAlignment:", 1);
    -[_SUUICounterTimeFieldView addSubview:](v3, "addSubview:", v3->_labelLabel);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    valueLabel = v3->_valueLabel;
    v3->_valueLabel = v8;

    v10 = v3->_valueLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithName:size:", CFSTR("HelveticaNeue-CondensedBold"), 28.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    -[UILabel setTextAlignment:](v3->_valueLabel, "setTextAlignment:", 1);
    -[_SUUICounterTimeFieldView addSubview:](v3, "addSubview:", v3->_valueLabel);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  float v11;
  double v12;
  uint64_t v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  float v22;
  CGFloat v23;
  double MaxY;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[_SUUICounterTimeFieldView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UILabel frame](self->_valueLabel, "frame");
  -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v4, v6);
  v9 = v8;
  if (v7 >= v4)
    v10 = v4;
  else
    v10 = v7;
  v11 = (v4 - v10) * 0.5;
  v12 = floorf(v11);
  v13 = 0;
  v26 = CGRectIntegral(*(CGRect *)(&v9 - 3));
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  -[UILabel setFrame:](self->_valueLabel, "setFrame:");
  -[UILabel frame](self->_labelLabel, "frame");
  -[UILabel sizeThatFits:](self->_labelLabel, "sizeThatFits:", v4, v6);
  v20 = v19;
  if (v18 >= v4)
    v21 = v4;
  else
    v21 = v18;
  v22 = (v4 - v21) * 0.5;
  v23 = floorf(v22);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxY = CGRectGetMaxY(v27);
  -[UILabel _baselineOffsetFromBottom](self->_valueLabel, "_baselineOffsetFromBottom");
  *(float *)&v25 = MaxY - v25 + 2.0;
  v28.origin.y = roundf(*(float *)&v25);
  v28.origin.x = v23;
  v28.size.width = v21;
  v28.size.height = v20;
  v29 = CGRectIntegral(v28);
  -[UILabel setFrame:](self->_labelLabel, "setFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *labelLabel;
  id v5;
  objc_super v6;

  labelLabel = self->_labelLabel;
  v5 = a3;
  -[UILabel setBackgroundColor:](labelLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_valueLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)_SUUICounterTimeFieldView;
  -[_SUUICounterTimeFieldView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
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
  float v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UILabel sizeThatFits:](self->_labelLabel, "sizeThatFits:");
  v7 = v6;
  v9 = v8;
  -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", width, height);
  v11 = v10;
  v13 = v9 + v12;
  -[UILabel _baselineOffsetFromBottom](self->_valueLabel, "_baselineOffsetFromBottom");
  *(float *)&v14 = v13 - v14 + 2.0;
  v15 = ceilf(*(float *)&v14);
  if (v7 >= v11)
    v16 = v7;
  else
    v16 = v11;
  if (width < v16)
    v16 = width;
  v17 = v16;
  v18 = ceilf(v17);
  result.height = v15;
  result.width = v18;
  return result;
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (unint64_t)visibilityField
{
  return self->_visibilityField;
}

- (void)setVisibilityField:(unint64_t)a3
{
  self->_visibilityField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
}

@end
