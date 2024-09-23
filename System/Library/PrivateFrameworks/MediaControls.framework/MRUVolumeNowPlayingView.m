@implementation MRUVolumeNowPlayingView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  void *v7;
  double v8;
  double v9;
  int64_t axis;
  NSUInteger v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = 20.0;
  objc_msgSend(MEMORY[0x1E0DC1350], "mru_volumeButtonSubtitleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineHeight");
  UICeilToViewScale();
  v9 = v8;

  axis = self->_axis;
  if (axis == 1)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height - 8.0);
    v16 = MRUSizeCeilToViewScale(self);
    if (v16 < 20.0)
      v16 = 20.0;
    v6 = v9 + 20.0 + 8.0;
  }
  else if (axis)
  {
    v16 = 20.0;
  }
  else
  {
    v11 = -[NSString length](self->_title, "length");
    v12 = 8.0;
    v13 = 0.0;
    if (v11)
      v13 = 8.0;
    v14 = width - v13;
    if (!v11)
      v12 = -0.0;
    v15 = v12 + 20.0;
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v14, height);
    v16 = v15 + MRUSizeCeilToViewScale(self);
    if (v9 >= 20.0)
      v6 = v9;
  }
  if (v16 >= width)
    v16 = width;
  if (v6 >= height)
    v17 = height;
  else
    v17 = v6;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

- (void)layoutSubviews
{
  int64_t axis;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  UILabel **p_titleLabel;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v37.receiver = self;
  v37.super_class = (Class)MRUVolumeNowPlayingView;
  -[MRUVolumeNowPlayingView layoutSubviews](&v37, sel_layoutSubviews);
  -[MRUVolumeNowPlayingView bounds](self, "bounds");
  axis = self->_axis;
  if (axis == 1)
  {
    UIRectCenteredXInRect();
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[UIImageView setFrame:](self->_imageView, "setFrame:");
    v40.origin.x = v22;
    v40.origin.y = v24;
    v40.size.width = v26;
    v40.size.height = v28;
    CGRectGetHeight(v40);
    UIRectInset();
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    p_titleLabel = &self->_titleLabel;
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v33, v35);
    MRUSizeCeilToViewScale(self);
    v41.origin.x = v30;
    v41.origin.y = v32;
    v41.size.width = v34;
    v41.size.height = v36;
    CGRectGetMinY(v41);
    UIRectCenteredYInRect();
  }
  else
  {
    if (axis)
      return;
    UIRectCenteredYInRect();
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[MRUVolumeNowPlayingView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[UIImageView setFrame:](self->_imageView, "setFrame:");
    v38.origin.x = v5;
    v38.origin.y = v7;
    v38.size.width = v9;
    v38.size.height = v11;
    CGRectGetWidth(v38);
    UIRectInset();
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    p_titleLabel = &self->_titleLabel;
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v16, v18);
    MRUSizeCeilToViewScale(self);
    v39.origin.x = v13;
    v39.origin.y = v15;
    v39.size.width = v17;
    v39.size.height = v19;
    CGRectGetMinX(v39);
    UIRectCenteredYInRect();
    -[MRUVolumeNowPlayingView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  }
  -[UILabel setFrame:](*p_titleLabel, "setFrame:");
}

- (void)setIcon:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_icon, a3);
  v5 = a3;
  -[UIImageView setImage:](self->_imageView, "setImage:", v5);

  -[MRUVolumeNowPlayingView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  -[MRUVolumeNowPlayingView setNeedsLayout](self, "setNeedsLayout");
}

- (MRUVolumeNowPlayingView)initWithFrame:(CGRect)a3
{
  MRUVolumeNowPlayingView *v3;
  UIImageView *v4;
  UIImageView *imageView;
  UILabel *v6;
  UILabel *titleLabel;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MRUVolumeNowPlayingView;
  v3 = -[MRUVolumeNowPlayingView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[UIImageView setUserInteractionEnabled:](v3->_imageView, "setUserInteractionEnabled:", 0);
    -[MRUVolumeNowPlayingView addSubview:](v3, "addSubview:", v3->_imageView);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v6;

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel controlCenterApplyPrimaryContentShadow](v3->_titleLabel, "controlCenterApplyPrimaryContentShadow");
    -[MRUVolumeNowPlayingView addSubview:](v3, "addSubview:", v3->_titleLabel);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRUVolumeNowPlayingView updateContentSizeCategory](v3, "updateContentSizeCategory");
  }
  return v3;
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
    -[MRUVolumeNowPlayingView updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_titleLabel);
}

- (void)updateContentSizeCategory
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_volumeButtonSubtitleFont");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

}

- (UIImage)icon
{
  return self->_icon;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)axis
{
  return self->_axis;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
