@implementation HUColorSwatchViewCollectionViewCell

- (HUColorSwatchViewCollectionViewCell)initWithFrame:(CGRect)a3
{
  HUColorSwatchViewCollectionViewCell *v3;
  HUColorSwatchView *v4;
  HUColorSwatchView *swatchView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUColorSwatchViewCollectionViewCell;
  v3 = -[HUColorSwatchViewCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(HUColorSwatchView);
    swatchView = v3->_swatchView;
    v3->_swatchView = v4;

    -[HUColorSwatchViewCollectionViewCell addSubview:](v3, "addSubview:", v3->_swatchView);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUColorSwatchViewCollectionViewCell;
  -[HUColorSwatchViewCollectionViewCell layoutSubviews](&v8, sel_layoutSubviews);
  -[HUColorSwatchViewCollectionViewCell frame](self, "frame");
  v4 = v3;
  -[HUColorSwatchViewCollectionViewCell frame](self, "frame");
  v6 = v5;
  -[HUColorSwatchViewCollectionViewCell swatchView](self, "swatchView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

}

- (HUColorSwatchView)swatchView
{
  return self->_swatchView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swatchView, 0);
}

@end
