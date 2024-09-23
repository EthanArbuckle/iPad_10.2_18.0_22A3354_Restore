@implementation CSProminentEmptyElementView

- (CSProminentEmptyElementView)initWithContentView:(id)a3
{
  UIView *v4;
  CSProminentEmptyElementView *v5;
  CSProminentEmptyElementView *v6;
  objc_super v8;

  v4 = (UIView *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CSProminentEmptyElementView;
  v5 = -[CSProminentEmptyElementView init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_contentView = v4;
    -[CSProminentEmptyElementView addSubview:](v5, "addSubview:", v4);
  }

  return v6;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSProminentEmptyElementView;
  -[CSProminentEmptyElementView layoutSubviews](&v3, sel_layoutSubviews);
  -[CSProminentEmptyElementView _layoutContentIfNeeded](self, "_layoutContentIfNeeded");
}

- (void)_layoutContentIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *contentView;
  double MidX;
  CGRect v14;
  CGRect v15;

  if (self->_contentView)
  {
    -[CSProminentEmptyElementView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    -[UIView frame](self->_contentView, "frame");
    if (v7 >= v4)
      v7 = v4;
    if (v8 >= v6)
      v8 = v6;
    -[UIView setFrame:](self->_contentView, "setFrame:", (v4 - v7) * 0.5, (v6 - v8) * 0.5);
    -[UIView frame](self->_contentView, "frame");
    if (v10 > v4 || v9 > v6)
    {
      contentView = self->_contentView;
      -[CSProminentEmptyElementView bounds](self, "bounds");
      MidX = CGRectGetMidX(v14);
      -[CSProminentEmptyElementView bounds](self, "bounds");
      -[UIView setCenter:](contentView, "setCenter:", MidX, CGRectGetMidY(v15));
    }
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  self->_contentView = (UIView *)a3;
}

@end
