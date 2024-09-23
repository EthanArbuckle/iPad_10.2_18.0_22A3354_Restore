@implementation MediaControlsMaterialView

- (MediaControlsMaterialView)initWithFrame:(CGRect)a3
{
  MediaControlsMaterialView *v3;
  uint64_t v4;
  UIView *backgroundView;
  id v6;
  uint64_t v7;
  UIView *highlightView;
  UIView *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MediaControlsMaterialView;
  v3 = -[MediaControlsMaterialView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D14790], "controlCenterDarkMaterial");
    v4 = objc_claimAutoreleasedReturnValue();
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIView *)v4;

    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[MediaControlsMaterialView bounds](v3, "bounds");
    v7 = objc_msgSend(v6, "initWithFrame:");
    highlightView = v3->_highlightView;
    v3->_highlightView = (UIView *)v7;

    v9 = v3->_highlightView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[UIView setHidden:](v3->_highlightView, "setHidden:", 1);
    -[MediaControlsMaterialView addSubview:](v3, "addSubview:", v3->_backgroundView);
    -[MediaControlsMaterialView addSubview:](v3, "addSubview:", v3->_highlightView);
  }
  return v3;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
  -[UIView _setContinuousCornerRadius:](self->_highlightView, "_setContinuousCornerRadius:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[UIView setHidden:](self->_highlightView, "setHidden:", !a3);
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MediaControlsMaterialView;
  -[MediaControlsMaterialView layoutSubviews](&v11, sel_layoutSubviews);
  -[MediaControlsMaterialView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_highlightView, "setFrame:");
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  void *v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIView visualStylingProviderForCategory:](self->_backgroundView, "visualStylingProviderForCategory:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
