@implementation MRURoutingSeparatorHeaderView

- (MRURoutingSeparatorHeaderView)initWithReuseIdentifier:(id)a3
{
  MRURoutingSeparatorHeaderView *v3;
  void *v4;
  UIView *v5;
  UIView *separatorView;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MRURoutingSeparatorHeaderView;
  v3 = -[MRURoutingSeparatorHeaderView initWithReuseIdentifier:](&v10, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRURoutingSeparatorHeaderView setTintColor:](v3, "setTintColor:", v4);

    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v3->_separatorView;
    v3->_separatorView = v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_separatorView, "setBackgroundColor:", v7);

    -[MRURoutingSeparatorHeaderView contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3->_separatorView);

  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRURoutingSeparatorHeaderView;
  -[MRURoutingSeparatorHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[MRURoutingSeparatorHeaderView bounds](self, "bounds");
  -[UIView setFrame:](self->_separatorView, "setFrame:");
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    v7 = v5;
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRURoutingSeparatorHeaderView updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 4, self->_separatorView);
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
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
  objc_storeStrong((id *)&self->_stylingProvider, 0);
}

@end
