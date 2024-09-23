@implementation SUUIItemTableViewCell

- (void)configureForItem:(id)a3 rowIndex:(int64_t)a4
{
  -[SUUIItemTableViewCell configureForItem:clientContext:rowIndex:](self, "configureForItem:clientContext:rowIndex:", a3, 0, a4);
}

- (SUUIItemCellLayout)layout
{
  return 0;
}

- (void)setCellLayoutNeedsLayout
{
  self->_layoutNeedsLayout = 1;
  -[SUUIItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[SUUIItemTableViewCell layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

  v4.receiver = self;
  v4.super_class = (Class)SUUIItemTableViewCell;
  -[SUUITableViewCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  -[SUUIItemTableViewCell layout](self, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHighlighted:", v5);

  v8.receiver = self;
  v8.super_class = (Class)SUUIItemTableViewCell;
  -[SUUITableViewCell setHighlighted:animated:](&v8, sel_setHighlighted_animated_, v5, v4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  -[SUUIItemTableViewCell layout](self, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelected:", v5);

  v8.receiver = self;
  v8.super_class = (Class)SUUIItemTableViewCell;
  -[SUUITableViewCell setSelected:animated:](&v8, sel_setSelected_animated_, v5, v4);
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

  -[SUUIItemTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v12.receiver = self;
  v12.super_class = (Class)SUUIItemTableViewCell;
  -[SUUITableViewCell layoutSubviews](&v12, sel_layoutSubviews);
  if (self->_layoutNeedsLayout || ((objc_msgSend(v3, "frame"), v9 == v5) ? (v10 = v8 == v7) : (v10 = 0), !v10))
  {
    -[SUUIItemTableViewCell layout](self, "layout");
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

  v4 = a3;
  -[SUUIItemTableViewCell layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6.receiver = self;
  v6.super_class = (Class)SUUIItemTableViewCell;
  -[SUUIItemTableViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);

}

@end
