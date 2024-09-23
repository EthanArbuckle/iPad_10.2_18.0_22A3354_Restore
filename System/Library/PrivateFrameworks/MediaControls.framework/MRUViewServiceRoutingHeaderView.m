@implementation MRUViewServiceRoutingHeaderView

- (MRUViewServiceRoutingHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRUViewServiceRoutingHeaderView *v7;
  uint64_t v8;
  UIImageView *imageView;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  UILabel *titleLabel;
  uint64_t v17;
  UIView *separatorView;
  void *v19;
  void *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)MRUViewServiceRoutingHeaderView;
  v7 = -[MRUViewServiceRoutingHeaderView initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", x, y, width, height);
    imageView = v7->_imageView;
    v7->_imageView = (UIImageView *)v8;

    -[UIImageView setContentMode:](v7->_imageView, "setContentMode:", 1);
    -[MRUViewServiceRoutingHeaderView addSubview:](v7, "addSubview:", v7->_imageView);
    v10 = objc_alloc(MEMORY[0x1E0DC3990]);
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v15;

    -[UILabel setNumberOfLines:](v7->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel setTextAlignment:](v7->_titleLabel, "setTextAlignment:", 1);
    -[MRUViewServiceRoutingHeaderView addSubview:](v7, "addSubview:", v7->_titleLabel);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v11, v12, v13, v14);
    separatorView = v7->_separatorView;
    v7->_separatorView = (UIView *)v17;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7->_separatorView, "setBackgroundColor:", v19);

    -[MRUViewServiceRoutingHeaderView addSubview:](v7, "addSubview:", v7->_separatorView);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v7, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRUViewServiceRoutingHeaderView updateContentSizeCategory](v7, "updateContentSizeCategory");
  }
  return v7;
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
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double MinY;
  objc_super v42;
  _QWORD v43[2];
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v43[1] = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)MRUViewServiceRoutingHeaderView;
  -[MRUViewServiceRoutingHeaderView layoutSubviews](&v42, sel_layoutSubviews);
  -[MRUViewServiceRoutingHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUViewServiceRoutingHeaderView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = 1.0 / v12;

  v44.origin.x = v4;
  v44.origin.y = v6;
  v44.size.width = v8;
  v44.size.height = v10;
  MinX = CGRectGetMinX(v44);
  v45.origin.x = v4;
  v45.origin.y = v6;
  v45.size.width = v8;
  v45.size.height = v10;
  v15 = CGRectGetMaxY(v45) - v13;
  v46.origin.x = v4;
  v46.origin.y = v6;
  v46.size.width = v8;
  v46.size.height = v10;
  -[UIView setFrame:](self->_separatorView, "setFrame:", MinX, v15, CGRectGetWidth(v46), v13);
  UIRectInset();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  if (self->_title)
  {
    -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 3, 17.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "configurationWithPaletteColors:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "configurationByApplyingConfiguration:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v29);

  }
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v21, v23);
  v47.origin.x = v17;
  v47.origin.y = v19;
  v47.size.width = v21;
  v47.size.height = v23;
  CGRectGetMinY(v47);
  UIRectCenteredXInRect();
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  UIRectInset();
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v34, v36);
  MRUSizeCeilToViewScale(self);
  v39 = v38;
  v48.origin.x = v31;
  v48.origin.y = v33;
  v48.size.width = v35;
  v48.size.height = v37;
  v40 = CGRectGetMinX(v48);
  v49.origin.x = v31;
  v49.origin.y = v33;
  v49.size.width = v35;
  v49.size.height = v37;
  MinY = CGRectGetMinY(v49);
  v50.origin.x = v31;
  v50.origin.y = v33;
  v50.size.width = v35;
  v50.size.height = v37;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v40, MinY, CGRectGetWidth(v50), v39);
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
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[MRUViewServiceRoutingHeaderView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  v8 = 1.0 / v7;

  v9 = v8 + 18.0 + 9.0 + 13.0;
  v10 = height - v9;
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", width, v10);
  v12 = v10 - v11;
  v13 = v9 + v11;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, v12);
  MRUSizeCeilToViewScale(self);
  v15 = v13 + v14;
  v16 = width;
  result.height = v15;
  result.width = v16;
  return result;
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  title = self->_title;
  self->_title = v5;

  -[UILabel setText:](self->_titleLabel, "setText:", v4);
  -[MRUViewServiceRoutingHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_image, a3);
  v5 = a3;
  -[UIImageView setImage:](self->_imageView, "setImage:", v5);

  -[MRUViewServiceRoutingHeaderView setNeedsLayout](self, "setNeedsLayout");
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
    -[MRUViewServiceRoutingHeaderView updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_titleLabel);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_imageView);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 4, self->_separatorView);
}

- (void)updateContentSizeCategory
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_titleFont");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
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
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
