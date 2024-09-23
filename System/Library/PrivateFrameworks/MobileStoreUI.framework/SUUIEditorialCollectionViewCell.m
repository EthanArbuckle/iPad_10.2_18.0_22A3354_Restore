@implementation SUUIEditorialCollectionViewCell

- (SUUIEditorialCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIEditorialCollectionViewCell *v3;
  SUUIEditorialCellLayout *v4;
  SUUIEditorialCellLayout *layout;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIEditorialCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[SUUIEditorialCellLayout initWithCollectionViewCell:]([SUUIEditorialCellLayout alloc], "initWithCollectionViewCell:", v3);
    layout = v3->_layout;
    v3->_layout = v4;

  }
  return v3;
}

- (void)setCellLayoutNeedsLayout
{
  self->_layoutNeedsLayout = 1;
  -[SUUIEditorialCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIEditorialCollectionViewCell;
  v4 = a3;
  -[SUUICollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);
  -[SUUIEditorialCollectionViewCell layout](self, "layout", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setBackgroundColor:", v6);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[SUUIEditorialCollectionViewCell layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

  v4.receiver = self;
  v4.super_class = (Class)SUUIEditorialCollectionViewCell;
  -[SUUIEditorialCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  void *v11;
  objc_super v12;

  -[SUUIEditorialCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v12.receiver = self;
  v12.super_class = (Class)SUUIEditorialCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v12, sel_layoutSubviews);
  if (self->_layoutNeedsLayout || ((objc_msgSend(v3, "frame"), v9 == v5) ? (v10 = v8 == v7) : (v10 = 0), !v10))
  {
    -[SUUIEditorialCollectionViewCell layout](self, "layout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutSubviews");

  }
  self->_layoutNeedsLayout = 0;

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorialCollectionViewCell;
  v4 = a3;
  -[SUUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
  -[SUUIEditorialCollectionViewCell layout](self, "layout", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (SUUIEditorialCellLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
