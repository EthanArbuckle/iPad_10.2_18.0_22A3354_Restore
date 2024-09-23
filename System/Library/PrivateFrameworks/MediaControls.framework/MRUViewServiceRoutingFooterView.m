@implementation MRUViewServiceRoutingFooterView

- (MRUViewServiceRoutingFooterView)initWithFrame:(CGRect)a3
{
  MRUViewServiceRoutingFooterView *v3;
  id v4;
  uint64_t v5;
  UIView *separatorView;
  void *v7;
  uint64_t v8;
  UIButton *button;
  void *v10;
  void *v11;
  UIButton *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MRUViewServiceRoutingFooterView;
  v3 = -[MRUViewServiceRoutingFooterView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    separatorView = v3->_separatorView;
    v3->_separatorView = (UIView *)v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_separatorView, "setBackgroundColor:", v7);

    -[MRUViewServiceRoutingFooterView addSubview:](v3, "addSubview:", v3->_separatorView);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIButton *)v8;

    -[UIButton titleLabel](v3->_button, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumberOfLines:", 2);

    -[UIButton titleLabel](v3->_button, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextAlignment:", 1);

    -[UIButton setTitleEdgeInsets:](v3->_button, "setTitleEdgeInsets:", 0.0, 15.0, 0.0, 15.0);
    v12 = v3->_button;
    +[MRUStringsProvider controlOtherSpeakers](MRUStringsProvider, "controlOtherSpeakers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v12, "setTitle:forState:", v13, 0);

    -[MRUViewServiceRoutingFooterView addSubview:](v3, "addSubview:", v3->_button);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
    -[MRUViewServiceRoutingFooterView addInteraction:](v3, "addInteraction:", v14);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v3, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRUViewServiceRoutingFooterView updateContentSizeCategory](v3, "updateContentSizeCategory");
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double MinX;
  double MinY;
  objc_super v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v16.receiver = self;
  v16.super_class = (Class)MRUViewServiceRoutingFooterView;
  -[MRUViewServiceRoutingFooterView layoutSubviews](&v16, sel_layoutSubviews);
  -[MRUViewServiceRoutingFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUViewServiceRoutingFooterView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = 1.0 / v12;

  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  MinX = CGRectGetMinX(v17);
  -[MRUViewServiceRoutingFooterView bounds](self, "bounds");
  MinY = CGRectGetMinY(v18);
  -[MRUViewServiceRoutingFooterView bounds](self, "bounds");
  -[UIView setFrame:](self->_separatorView, "setFrame:", MinX, MinY, CGRectGetWidth(v19), v13);
  UIRectInset();
  -[UIButton setFrame:](self->_button, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[MRUViewServiceRoutingFooterView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  v8 = 1.0 / v7;

  v9 = v8 + 15.0 + 15.0;
  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", width, height - v9);
  v11 = v9 + v10;
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
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
    -[MRUViewServiceRoutingFooterView updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateVisualStyling
{
  id v3;

  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 4, self->_separatorView);
  -[MRUVisualStylingProvider colorForStyle:](self->_stylingProvider, "colorForStyle:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](self->_button, "setTintColor:", v3);

}

- (void)updateContentSizeCategory
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_titleFont");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_button, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

}

- (UIButton)button
{
  return self->_button;
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
  objc_storeStrong((id *)&self->_button, 0);
}

@end
