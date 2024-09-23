@implementation CPUIListSectionHeaderView

- (CPUIListSectionHeaderView)initWithReuseIdentifier:(id)a3
{
  CPUIListSectionHeaderView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIImageView *artworkImageView;
  void *v11;
  uint64_t v12;
  UILabel *titleLabel;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UILabel *subtitleLabel;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CPUIMediaButton *mediaButton;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CPUIListSectionHeaderView;
  v3 = -[CPUIListSectionHeaderView initWithReuseIdentifier:](&v28, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
    artworkImageView = v3->_artworkImageView;
    v3->_artworkImageView = (UIImageView *)v9;

    -[UIImageView setContentMode:](v3->_artworkImageView, "setContentMode:", 1);
    -[CPUIListSectionHeaderView contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v3->_artworkImageView);

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v5, v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v12;

    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 16.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v14);

    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemPrimaryColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v15);

    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusPrimaryColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setHighlightedTextColor:](v3->_titleLabel, "setHighlightedTextColor:", v16);

    -[CPUIListSectionHeaderView contentView](v3, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v3->_titleLabel);

    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v5, v6, v7, v8);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v18;

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 12.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_subtitleLabel, "setFont:", v20);

    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_subtitleLabel, "setTextColor:", v21);

    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusSecondaryColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setHighlightedTextColor:](v3->_subtitleLabel, "setHighlightedTextColor:", v22);

    -[CPUIListSectionHeaderView contentView](v3, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v3->_subtitleLabel);

    -[CPUIListSectionHeaderView setShowsButton:](v3, "setShowsButton:", 0);
    +[CPUIMediaButton buttonWithType:](CPUIMediaButton, "buttonWithType:", 0);
    v24 = objc_claimAutoreleasedReturnValue();
    mediaButton = v3->_mediaButton;
    v3->_mediaButton = (CPUIMediaButton *)v24;

    -[CPUIListSectionHeaderView contentView](v3, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v3->_mediaButton);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  UIImageView *artworkImageView;
  UIImageView *v13;
  void *v14;
  _BOOL4 v15;
  double *v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double Width;
  double v27;
  CGFloat v28;
  void *v29;
  CGFloat MaxX;
  double MinX;
  CGFloat v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat y;
  CGFloat v37;
  CGFloat v38;
  CGFloat Height;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat x;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  CGFloat MinY;
  CGFloat v61;
  CGRect rect;
  __objc2_class *v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  *(_QWORD *)&rect.size.height = self;
  v63 = CPUIListSectionHeaderView;
  -[CGFloat layoutSubviews]((objc_super *)&rect.size.height, sel_layoutSubviews);
  -[CPUIListSectionHeaderView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  artworkImageView = self->_artworkImageView;
  MPURectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIImageView setFrame:](artworkImageView, "setFrame:");
  v13 = self->_artworkImageView;
  -[UIImageView image](v13, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setHidden:](v13, "setHidden:", v14 == 0);

  v15 = -[CPUIListSectionHeaderView showsButton](self, "showsButton");
  v16 = (double *)MEMORY[0x24BDBF148];
  if (v15)
    -[CPUIMediaButton sizeThatFits:](self->_mediaButton, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  UIRectCenteredYInRect();
  v17 = v5;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v64.origin.x = v17;
  v64.origin.y = v7;
  v64.size.width = v9;
  v64.size.height = v11;
  rect.size.width = v11;
  Width = CGRectGetWidth(v64);
  v65.origin.x = v19;
  v65.origin.y = v21;
  v65.size.width = v23;
  v65.size.height = v25;
  v27 = Width - CGRectGetWidth(v65);
  v28 = rect.size.width;
  MPURectByApplyingUserInterfaceLayoutDirectionInRect();
  -[CPUIMediaButton setFrame:](self->_mediaButton, "setFrame:");
  -[CPUIMediaButton setHidden:](self->_mediaButton, "setHidden:", -[CPUIListSectionHeaderView showsButton](self, "showsButton") ^ 1);
  -[UIImageView image](self->_artworkImageView, "image");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  rect.origin.y = v17;
  if (v29)
  {
    v66.origin.x = 0.0;
    v66.origin.y = 4.0;
    v66.size.width = 36.0;
    v66.size.height = 36.0;
    MaxX = CGRectGetMaxX(v66);
    v67.size.width = v9;
    v59 = MaxX + 9.0;
    v67.origin.x = v17;
    v67.origin.y = v7;
    v67.size.height = rect.size.width;
    MinY = CGRectGetMinY(v67);
    v68.origin.x = v27;
    v68.origin.y = v21;
    v68.size.width = v23;
    v68.size.height = v25;
    MinX = CGRectGetMinX(v68);
    v69.origin.x = 0.0;
    v69.origin.y = 4.0;
    v69.size.width = 36.0;
    v69.size.height = 36.0;
    v28 = rect.size.width;
    v32 = CGRectGetMaxX(v69);
    v33 = v7;
    v34 = MinX - v32 + -18.0;
  }
  else
  {
    v70.origin.x = v17;
    v70.origin.y = v7;
    v70.size.width = v9;
    v70.size.height = rect.size.width;
    MinY = CGRectGetMinY(v70);
    v71.origin.x = v27;
    v71.origin.y = v21;
    v71.size.width = v23;
    v71.size.height = v25;
    v35 = CGRectGetMinX(v71);
    v33 = v7;
    v34 = v35 + -9.0;
    v59 = 0.0;
  }
  y = rect.origin.y;
  v37 = v9;
  v38 = v28;
  Height = CGRectGetHeight(*(CGRect *)(&v33 - 1));
  v72.origin.x = v59;
  v72.origin.y = MinY;
  v72.size.width = v34;
  v72.size.height = Height;
  rect.origin.x = CGRectGetMinX(v72);
  v40 = *v16;
  v41 = v16[1];
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", *v16, v41);
  v73.size.width = v42;
  v73.size.height = v43;
  v61 = v43;
  v73.origin.y = 0.0;
  v73.origin.x = rect.origin.x;
  v44 = CGRectGetWidth(v73);
  v74.origin.x = v59;
  v74.origin.y = MinY;
  v74.size.width = v34;
  v74.size.height = Height;
  v45 = CGRectGetWidth(v74);
  if (v44 >= v45)
    v46 = v45;
  else
    v46 = v44;
  v75.origin.x = v59;
  v75.origin.y = MinY;
  v75.size.width = v34;
  v75.size.height = Height;
  v47 = CGRectGetMinX(v75);
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v40, v41);
  v76.size.width = v48;
  v76.size.height = v49;
  v76.origin.y = 0.0;
  v76.origin.x = v47;
  v50 = v47;
  v51 = v76.size.height;
  v52 = CGRectGetWidth(v76);
  v77.origin.x = v59;
  v77.origin.y = MinY;
  v77.size.width = v34;
  v77.size.height = Height;
  v53 = CGRectGetWidth(v77);
  if (v52 >= v53)
    v54 = v53;
  else
    v54 = v52;
  v78.origin.y = 0.0;
  v78.origin.x = rect.origin.x;
  v78.size.width = v46;
  v78.size.height = v61;
  CGRectGetHeight(v78);
  v79.origin.y = 0.0;
  v79.origin.x = v50;
  v79.size.width = v54;
  v79.size.height = v51;
  CGRectGetHeight(v79);
  UIRectCenteredYInRect();
  x = v80.origin.x;
  v56 = v80.origin.y;
  v57 = v80.size.width;
  v58 = v80.size.height;
  CGRectGetMinY(v80);
  v81.origin.x = x;
  v81.origin.y = v56;
  v81.size.width = v57;
  v81.size.height = v58;
  CGRectGetMaxY(v81);
  v82.origin.y = 0.0;
  v82.origin.x = v50;
  v82.size.width = v54;
  v82.size.height = v51;
  CGRectGetHeight(v82);
  MPURectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  MPURectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:");
}

- (id)artworkImage
{
  return -[UIImageView image](self->_artworkImageView, "image");
}

- (void)setImage:(id)a3
{
  id v5;
  uint64_t v6;
  double v7;
  id v8;

  v8 = a3;
  -[CPUIListSectionHeaderView artworkImage](self, "artworkImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v8)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[UIImageView setImage:](self->_artworkImageView, "setImage:", v8);
    -[UIImageView setTintColor:](self->_artworkImageView, "setTintColor:", 0);
    -[UIImageView setClipsToBounds:](self->_artworkImageView, "setClipsToBounds:", 1);
    v6 = objc_msgSend(v8, "renderingMode");
    v7 = 3.0;
    if (v6 == 2)
      v7 = 0.0;
    -[UIImageView _setContinuousCornerRadius:](self->_artworkImageView, "_setContinuousCornerRadius:", v7);
    -[CPUIListSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTemplateImage:(id)a3
{
  id v4;

  -[CPUIListSectionHeaderView setImage:](self, "setImage:", a3);
  objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_artworkImageView, "setTintColor:", v4);

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[CPUIListSectionHeaderView title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
    -[UILabel setText:](self->_titleLabel, "setText:", v6);

}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[CPUIListSectionHeaderView subtitle](self, "subtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
    -[UILabel setText:](self->_subtitleLabel, "setText:", v6);

}

- (void)configureButton:(id)a3
{
  void *v4;
  double v5;

  if (a3)
    (*((void (**)(id, CPUIMediaButton *))a3 + 2))(a3, self->_mediaButton);
  -[CPUIMediaButton currentImage](self->_mediaButton, "currentImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIListSectionHeaderView setShowsButton:](self, "setShowsButton:", v4 != 0);

  LODWORD(v5) = -1097229926;
  -[CPUIMediaButton setCharge:](self->_mediaButton, "setCharge:", v5);
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)artworkImageView
{
  return self->_artworkImageView;
}

- (void)setArtworkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (CPUIMediaButton)mediaButton
{
  return self->_mediaButton;
}

- (void)setMediaButton:(id)a3
{
  objc_storeStrong((id *)&self->_mediaButton, a3);
}

- (BOOL)showsButton
{
  return self->_showsButton;
}

- (void)setShowsButton:(BOOL)a3
{
  self->_showsButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_artworkImageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
