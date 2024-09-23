@implementation MRUMediaControlsModuleBadge

- (MRUMediaControlsModuleBadge)initWithFrame:(CGRect)a3
{
  MRUMediaControlsModuleBadge *v3;
  void *v4;
  UILabel *v5;
  UILabel *label;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRUMediaControlsModuleBadge;
  v3 = -[MRUMediaControlsModuleBadge initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUMediaControlsModuleBadge setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v3->_label;
    v3->_label = v5;

    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 1);
    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    -[MRUMediaControlsModuleBadge addSubview:](v3, "addSubview:", v3->_label);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRUMediaControlsModuleBadge updateContentSizeCategory](v3, "updateContentSizeCategory");
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
  double Height;
  double Width;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)MRUMediaControlsModuleBadge;
  -[MRUMediaControlsModuleBadge layoutSubviews](&v13, sel_layoutSubviews);
  -[MRUMediaControlsModuleBadge bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel setFrame:](self->_label, "setFrame:");
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  Height = CGRectGetHeight(v14);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  Width = CGRectGetWidth(v15);
  if (Height < Width)
    Width = Height;
  -[MRUMediaControlsModuleBadge _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", Width * 0.5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  if (v3 < v4)
    v3 = v4;
  v5 = v3 + 8.0;
  v6 = v4 + 8.0;
  result.height = v6;
  result.width = v5;
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
    -[MRUMediaControlsModuleBadge updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)setCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringFromNumber:numberStyle:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_label, "setText:", v6);

  -[MRUMediaControlsModuleBadge setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 1, self->_label);
}

- (void)updateContentSizeCategory
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_controlCenterMoreButtonBadgeFont");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v3);

}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (unint64_t)count
{
  return self->_count;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
}

@end
