@implementation HUNaturalLightColorSwatchCollectionViewCell

- (HUNaturalLightColorSwatchCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  HUNaturalLightColorSwatchCollectionViewCell *v5;
  HUNaturalLightColorSwatchView *v6;
  HUNaturalLightColorSwatchView *swatchView;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)HUNaturalLightColorSwatchCollectionViewCell;
  v5 = -[HUNaturalLightColorSwatchCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = -[HUNaturalLightColorSwatchView initWithFrame:]([HUNaturalLightColorSwatchView alloc], "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
    swatchView = v5->_swatchView;
    v5->_swatchView = v6;

    -[HUNaturalLightColorSwatchCollectionViewCell addSubview:](v5, "addSubview:", v5->_swatchView);
  }
  return v5;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUNaturalLightColorSwatchCollectionViewCell;
  -[HUNaturalLightColorSwatchCollectionViewCell layoutSubviews](&v10, sel_layoutSubviews);
  -[HUNaturalLightColorSwatchCollectionViewCell frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[HUNaturalLightColorSwatchCollectionViewCell swatchView](self, "swatchView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", v7, v8, v4, v6);

}

- (HUNaturalLightColorSwatchView)swatchView
{
  return self->_swatchView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swatchView, 0);
}

@end
