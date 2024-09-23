@implementation SUUIItemCollectionViewCell

- (SUUIItemCellLayout)layout
{
  return 0;
}

- (void)setCellLayoutNeedsLayout
{
  self->_layoutNeedsLayout = 1;
  -[SUUIItemCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIItemCollectionViewCell;
  v4 = a3;
  -[SUUICollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);
  -[SUUIItemCollectionViewCell layout](self, "layout", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setBackgroundColor:", v6);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[SUUIItemCollectionViewCell layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

  v4.receiver = self;
  v4.super_class = (Class)SUUIItemCollectionViewCell;
  -[SUUIItemCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SUUIItemCollectionViewCell layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:", v3);

  v6.receiver = self;
  v6.super_class = (Class)SUUIItemCollectionViewCell;
  -[SUUICollectionViewCell setHighlighted:](&v6, sel_setHighlighted_, v3);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SUUIItemCollectionViewCell layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", v3);

  v6.receiver = self;
  v6.super_class = (Class)SUUIItemCollectionViewCell;
  -[SUUICollectionViewCell setSelected:](&v6, sel_setSelected_, v3);
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIItemCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  if (self->_layoutNeedsLayout)
  {
    -[SUUIItemCollectionViewCell layout](self, "layout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutSubviews");

  }
  self->_layoutNeedsLayout = 0;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SUUIItemCollectionViewCell bounds](self, "bounds");
  if (v9 != width || v8 != height)
    self->_layoutNeedsLayout = 1;
  v11.receiver = self;
  v11.super_class = (Class)SUUIItemCollectionViewCell;
  -[SUUIItemCollectionViewCell setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SUUIItemCollectionViewCell frame](self, "frame");
  if (v9 != width || v8 != height)
    self->_layoutNeedsLayout = 1;
  v11.receiver = self;
  v11.super_class = (Class)SUUIItemCollectionViewCell;
  -[SUUIItemCollectionViewCell setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

@end
