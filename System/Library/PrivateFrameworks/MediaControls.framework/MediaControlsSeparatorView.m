@implementation MediaControlsSeparatorView

- (MediaControlsSeparatorView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MediaControlsSeparatorView *v7;
  uint64_t v8;
  UIView *separatorView;
  void *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)MediaControlsSeparatorView;
  v7 = -[MediaControlsSeparatorView initWithFrame:](&v12, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
    separatorView = v7->_separatorView;
    v7->_separatorView = (UIView *)v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7->_separatorView, "setBackgroundColor:", v10);

    -[MediaControlsSeparatorView addSubview:](v7, "addSubview:", v7->_separatorView);
  }
  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MediaControlsSeparatorView;
  -[MediaControlsSeparatorView layoutSubviews](&v3, sel_layoutSubviews);
  -[MediaControlsSeparatorView bounds](self, "bounds");
  -[UIView setFrame:](self->_separatorView, "setFrame:");
}

- (void)setVisualStylingProvider:(id)a3
{
  MTVisualStylingProvider *v5;
  MTVisualStylingProvider *visualStylingProvider;
  MTVisualStylingProvider *v7;

  v5 = (MTVisualStylingProvider *)a3;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    v7 = v5;
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](visualStylingProvider, "stopAutomaticallyUpdatingView:", self->_separatorView);
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", self->_separatorView, 5);
    v5 = v7;
  }

}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

@end
