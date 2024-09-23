@implementation HUIconPickerColorTintCell

- (HUIconPickerColorTintCell)initWithFrame:(CGRect)a3
{
  HUIconPickerColorTintCell *v3;
  HUColorSwatchView *v4;
  HUColorSwatchView *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUIconPickerColorTintCell;
  v3 = -[HUIconPickerColorTintCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [HUColorSwatchView alloc];
    -[HUIconPickerColorTintCell bounds](v3, "bounds");
    v5 = -[HUColorSwatchView initWithFrame:](v4, "initWithFrame:");
    -[HUIconPickerColorTintCell setColorSwatchView:](v3, "setColorSwatchView:", v5);

    -[HUIconPickerColorTintCell colorSwatchView](v3, "colorSwatchView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLabelHidden:", 1);

    -[HUIconPickerColorTintCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconPickerColorTintCell colorSwatchView](v3, "colorSwatchView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  uint64_t v3;
  id v4;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  -[HUIconPickerColorTintCell colorSwatchView](self, "colorSwatchView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectionState:", v3);

}

- (void)setColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUIconPickerColorTintCell colorSwatchView](self, "colorSwatchView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v4);

}

- (UIColor)color
{
  void *v2;
  void *v3;

  -[HUIconPickerColorTintCell colorSwatchView](self, "colorSwatchView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (HUColorSwatchView)colorSwatchView
{
  return self->_colorSwatchView;
}

- (void)setColorSwatchView:(id)a3
{
  objc_storeStrong((id *)&self->_colorSwatchView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSwatchView, 0);
}

@end
