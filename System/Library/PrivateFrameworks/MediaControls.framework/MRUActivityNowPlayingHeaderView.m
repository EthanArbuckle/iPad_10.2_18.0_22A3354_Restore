@implementation MRUActivityNowPlayingHeaderView

- (MRUActivityNowPlayingHeaderView)init
{
  MRUActivityNowPlayingHeaderView *v2;
  MRUNowPlayingLabelView *v3;
  MRUNowPlayingLabelView *labelView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUActivityNowPlayingHeaderView;
  v2 = -[MRUActivityNowPlayingHeaderView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = objc_alloc_init(MRUNowPlayingLabelView);
    labelView = v2->_labelView;
    v2->_labelView = v3;

    -[MRUNowPlayingLabelView setLayout:](v2->_labelView, "setLayout:", 2);
    -[MRUNowPlayingLabelView setShowRoute:](v2->_labelView, "setShowRoute:", 1);
    -[MRUNowPlayingLabelView setShowSubtitle:](v2->_labelView, "setShowSubtitle:", 1);
    -[MRUActivityNowPlayingHeaderView addSubview:](v2, "addSubview:", v2->_labelView);
  }
  return v2;
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
  uint64_t v11;
  MRUNowPlayingLabelView *labelView;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)MRUActivityNowPlayingHeaderView;
  -[MRUActivityNowPlayingHeaderView layoutSubviews](&v17, sel_layoutSubviews);
  -[MRUActivityNowPlayingHeaderView updateVisibilty](self, "updateVisibilty");
  -[MRUActivityNowPlayingHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[MRUActivityNowPlayingHeaderView SBUISA_layoutMode](self, "SBUISA_layoutMode");
  labelView = self->_labelView;
  if (v11 == 4)
  {
    -[MRUNowPlayingLabelView sizeThatFits:](labelView, "sizeThatFits:", v8, v10);
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    CGRectGetMinX(v18);
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = v10;
    CGRectGetWidth(v19);
    UIRectCenteredYInRect();
    v4 = v13;
    v6 = v14;
    v8 = v15;
    v10 = v16;
    labelView = self->_labelView;
  }
  -[MRUNowPlayingLabelView setFrame:](labelView, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[MRUNowPlayingLabelView sizeThatFits:](self->_labelView, "sizeThatFits:", a3.width, a3.height);
  if (v4 < 66.0)
    v4 = 66.0;
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;

  v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUNowPlayingLabelView setStylingProvider:](self->_labelView, "setStylingProvider:", v5);
  }

}

- (double)labelInset
{
  void *v3;
  double v4;
  double v5;
  CGRect v7;

  -[MRUNowPlayingLabelView viewForFirstBaselineLayout](self->_labelView, "viewForFirstBaselineLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingLabelView sizeThatFits:](self->_labelView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "mr_tightBoundingRectOfFirstLine");
    v5 = v5 - CGRectGetMinY(v7);
  }

  return (66.0 - v5) * 0.5;
}

- (void)updateVisibilty
{
  id *p_labelView;
  id v4;
  __int128 v5;
  double v6;
  id v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  _OWORD v10[3];

  if (-[MRUActivityNowPlayingHeaderView SBUISA_layoutMode](self, "SBUISA_layoutMode") == 4)
  {
    p_labelView = (id *)&self->_labelView;
    v4 = *p_labelView;
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v10[0] = *MEMORY[0x1E0C9BAA8];
    v10[1] = v5;
    v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v4, "setTransform:", v10);
    v6 = 1.0;
  }
  else
  {
    CGAffineTransformMakeScale(&v9, 0.5, 0.5);
    p_labelView = (id *)&self->_labelView;
    v7 = *p_labelView;
    v8 = v9;
    objc_msgSend(v7, "setTransform:", &v8);
    v6 = 0.0;
  }
  objc_msgSend(*p_labelView, "setAlpha:", v6);
}

- (MRUNowPlayingLabelView)labelView
{
  return self->_labelView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end
