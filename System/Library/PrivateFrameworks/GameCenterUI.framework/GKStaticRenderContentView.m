@implementation GKStaticRenderContentView

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[UIView recursiveDescription](self->_contentView, "recursiveDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("DETACHED: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView **p_contentView;
  UIView *v7;

  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  if (self->_contentView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_contentView, a3);
    -[UIView setBackgroundColor:](*p_contentView, "setBackgroundColor:", 0);
    -[UIView setOpaque:](*p_contentView, "setOpaque:", 0);
    -[GKStaticRenderContentView addSubview:](self, "addSubview:", *p_contentView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    v5 = v7;
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKStaticRenderContentView;
  -[GKStaticRenderContentView layoutSubviews](&v3, sel_layoutSubviews);
  -[GKStaticRenderContentView bounds](self, "bounds");
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIView updateConstraintsIfNeeded](self->_contentView, "updateConstraintsIfNeeded");
  -[UIView layoutIfNeeded](self->_contentView, "layoutIfNeeded");
  -[GKStaticRenderContentView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setNeedsLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKStaticRenderContentView;
  -[GKStaticRenderContentView setNeedsLayout](&v3, sel_setNeedsLayout);
  -[UIView setNeedsLayout](self->_contentView, "setNeedsLayout");
}

- (void)prepareToReuseSubviewsOfView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "prepareForReuse");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v4, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[GKStaticRenderContentView prepareToReuseSubviewsOfView:](self, "prepareToReuseSubviewsOfView:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)prepareForReuse
{
  -[GKStaticRenderContentView prepareToReuseSubviewsOfView:](self, "prepareToReuseSubviewsOfView:", self);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
