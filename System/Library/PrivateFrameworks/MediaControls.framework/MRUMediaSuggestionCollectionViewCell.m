@implementation MRUMediaSuggestionCollectionViewCell

- (MRUMediaSuggestionCollectionViewCell)initWithFrame:(CGRect)a3
{
  MRUMediaSuggestionCollectionViewCell *v3;
  MRUArtworkView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  MRUArtworkView *artworkView;
  void *v11;
  void *v12;
  MRUShadowView *v13;
  MRUShadowView *iconShadowView;
  void *v15;
  double v16;
  uint64_t v17;
  UIImageView *iconView;
  uint64_t v19;
  UIActivityIndicatorView *activityView;
  UILabel *v21;
  UILabel *titleLabel;
  void *v23;
  BSUIEmojiLabelView *v24;
  BSUIEmojiLabelView *subtitleLabel;
  void *v26;
  void *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)MRUMediaSuggestionCollectionViewCell;
  v3 = -[MRUMediaSuggestionCollectionViewCell initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MRUArtworkView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[MRUArtworkView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    artworkView = v3->_artworkView;
    v3->_artworkView = (MRUArtworkView *)v9;

    -[MRUArtworkView pointerInteraction](v3->_artworkView, "pointerInteraction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 1);

    -[MRUArtworkView setStyle:](v3->_artworkView, "setStyle:", 4);
    -[MRUArtworkView setUserInteractionEnabled:](v3->_artworkView, "setUserInteractionEnabled:", 0);
    -[MRUMediaSuggestionCollectionViewCell contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v3->_artworkView);

    v13 = objc_alloc_init(MRUShadowView);
    iconShadowView = v3->_iconShadowView;
    v3->_iconShadowView = v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUShadowView setColor:](v3->_iconShadowView, "setColor:", v15);

    HIDWORD(v16) = 1070176665;
    *(float *)&v16 = 0.2;
    -[MRUShadowView setOpacity:](v3->_iconShadowView, "setOpacity:", v16);
    -[MRUMediaSuggestionCollectionViewCell addSubview:](v3, "addSubview:", v3->_iconShadowView);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v5, v6, v7, v8);
    iconView = v3->_iconView;
    v3->_iconView = (UIImageView *)v17;

    -[UIImageView setUserInteractionEnabled:](v3->_iconView, "setUserInteractionEnabled:", 0);
    -[UIImageView setContentMode:](v3->_iconView, "setContentMode:", 1);
    -[UIImageView setClipsToBounds:](v3->_iconView, "setClipsToBounds:", 1);
    -[MRUMediaSuggestionCollectionViewCell addSubview:](v3, "addSubview:", v3->_iconView);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    activityView = v3->_activityView;
    v3->_activityView = (UIActivityIndicatorView *)v19;

    -[MRUMediaSuggestionCollectionViewCell addSubview:](v3, "addSubview:", v3->_activityView);
    v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v21;

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[MRUMediaSuggestionCollectionViewCell contentView](v3, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v3->_titleLabel);

    v24 = (BSUIEmojiLabelView *)objc_alloc_init(MEMORY[0x1E0D01920]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v24;

    -[BSUIEmojiLabelView setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 1);
    -[BSUIEmojiLabelView setTextAlignment:](v3->_subtitleLabel, "setTextAlignment:", 1);
    -[MRUMediaSuggestionCollectionViewCell contentView](v3, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v3->_subtitleLabel);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v3, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRUMediaSuggestionCollectionViewCell updateContentSizeCategory](v3, "updateContentSizeCategory");
    -[MRUMediaSuggestionCollectionViewCell updateIconView](v3, "updateIconView");
    -[MRUMediaSuggestionCollectionViewCell updateVisiblity](v3, "updateVisiblity");
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
  double v11;
  double v12;
  double v13;
  double v14;
  double MinX;
  double MinY;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double Width;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  objc_super v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v50.receiver = self;
  v50.super_class = (Class)MRUMediaSuggestionCollectionViewCell;
  -[MRUMediaSuggestionCollectionViewCell layoutSubviews](&v50, sel_layoutSubviews);
  -[MRUMediaSuggestionCollectionViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v7, v9);
  v12 = v11;
  v14 = v13;
  v51.origin.x = v4;
  v51.origin.y = v6;
  v51.size.width = v8;
  v51.size.height = v10;
  MinX = CGRectGetMinX(v51);
  v52.origin.x = v4;
  v52.origin.y = v6;
  v52.size.width = v8;
  v52.size.height = v10;
  MinY = CGRectGetMinY(v52);
  -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:", MinX, MinY, v12, v14);
  -[UIActivityIndicatorView setFrame:](self->_activityView, "setFrame:", MinX, MinY, v12, v14);
  MRUMediaSuggestionsIconSize(self->_layout);
  v53.origin.x = MinX;
  v53.origin.y = MinY;
  v53.size.width = v12;
  v53.size.height = v14;
  CGRectGetMaxX(v53);
  v54.origin.x = MinX;
  v54.origin.y = MinY;
  v54.size.width = v12;
  v54.size.height = v14;
  CGRectGetMaxY(v54);
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[MRUShadowView setFrame:](self->_iconShadowView, "setFrame:");
  -[UIImageView setFrame:](self->_iconView, "setFrame:", v18, v20, v22, v24);
  v55.origin.x = MinX;
  v55.origin.y = MinY;
  v55.size.width = v12;
  v55.size.height = v14;
  CGRectGetHeight(v55);
  UIRectInset();
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v29, v31);
  MRUSizeCeilToViewScale(self);
  v34 = v33;
  v56.origin.x = v26;
  v56.origin.y = v28;
  v56.size.width = v30;
  v56.size.height = v32;
  v35 = CGRectGetMinX(v56);
  v57.origin.x = v26;
  v57.origin.y = v28;
  v57.size.width = v30;
  v57.size.height = v32;
  v36 = CGRectGetMinY(v57);
  v58.origin.x = v26;
  v58.origin.y = v28;
  v58.size.width = v30;
  v58.size.height = v32;
  Width = CGRectGetWidth(v58);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v35, v36, Width, v34);
  v59.origin.x = v35;
  v59.origin.y = v36;
  v59.size.width = Width;
  v59.size.height = v34;
  CGRectGetHeight(v59);
  UIRectInset();
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  -[BSUIEmojiLabelView sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v42, v44);
  MRUSizeCeilToViewScale(self);
  v47 = v46;
  v60.origin.x = v39;
  v60.origin.y = v41;
  v60.size.width = v43;
  v60.size.height = v45;
  v48 = CGRectGetMinX(v60);
  v61.origin.x = v39;
  v61.origin.y = v41;
  v61.size.width = v43;
  v61.size.height = v45;
  v49 = CGRectGetMinY(v61);
  v62.origin.x = v39;
  v62.origin.y = v41;
  v62.size.width = v43;
  v62.size.height = v45;
  -[BSUIEmojiLabelView setFrame:](self->_subtitleLabel, "setFrame:", v48, v49, CGRectGetWidth(v62), v47);
}

- (void)setArtworkImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_artworkImage, a3);
  v5 = a3;
  -[MRUArtworkView setArtworkImage:](self->_artworkView, "setArtworkImage:", v5);

  -[MRUMediaSuggestionCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setIconImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_iconImage, a3);
  v5 = a3;
  -[UIImageView setImage:](self->_iconView, "setImage:", v5);

  -[MRUMediaSuggestionCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  -[MRUMediaSuggestionCollectionViewCell updateVisiblity](self, "updateVisiblity");
}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  -[MRUMediaSuggestionCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubtitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_subtitle, a3);
  v5 = a3;
  -[BSUIEmojiLabelView setText:](self->_subtitleLabel, "setText:", v5);

  -[MRUMediaSuggestionCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v4;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v6;
  id v7;

  v4 = (MRUVisualStylingProvider *)a3;
  -[MRUVisualStylingProvider removeObserver:](self->_stylingProvider, "removeObserver:", self);
  stylingProvider = self->_stylingProvider;
  self->_stylingProvider = v4;
  v6 = v4;

  -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
  -[MRUMediaSuggestionCollectionViewCell updateVisualStyling](self, "updateVisualStyling");
  -[MRUMediaSuggestionCollectionViewCell artworkView](self, "artworkView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStylingProvider:", v6);

}

- (void)setLayout:(int64_t)a3
{
  uint64_t v4;

  if (self->_layout != a3)
  {
    self->_layout = a3;
    if (a3 == 1)
      v4 = 5;
    else
      v4 = 4;
    -[MRUArtworkView setStyle:](self->_artworkView, "setStyle:", v4);
    -[MRUMediaSuggestionCollectionViewCell updateIconView](self, "updateIconView");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUMediaSuggestionCollectionViewCell;
  -[MRUMediaSuggestionCollectionViewCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[MRUMediaSuggestionCollectionViewCell updateVisiblity](self, "updateVisiblity");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUMediaSuggestionCollectionViewCell;
  -[MRUMediaSuggestionCollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[MRUMediaSuggestionCollectionViewCell updateVisiblity](self, "updateVisiblity");
}

- (void)updateVisualStyling
{
  id v3;

  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_titleLabel);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 1, self->_subtitleLabel);
  -[MRUVisualStylingProvider colorForStyle:](self->_stylingProvider, "colorForStyle:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setColor:](self->_activityView, "setColor:", v3);

}

- (void)updateContentSizeCategory
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_suggestionsTitleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_suggestionsSubtitleFont");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSUIEmojiLabelView setFont:](self->_subtitleLabel, "setFont:", v4);

}

- (void)updateIconView
{
  double v3;

  v3 = MRUMediaSuggestionsIconCornerRadius(self->_layout);
  -[UIImageView _setContinuousCornerRadius:](self->_iconView, "_setContinuousCornerRadius:");
  -[MRUShadowView _setContinuousCornerRadius:](self->_iconShadowView, "_setContinuousCornerRadius:", v3);
  -[MRUShadowView setOffset:](self->_iconShadowView, "setOffset:", MRUMediaSuggestionsIconShadowOffset());
  -[MRUShadowView setRadius:](self->_iconShadowView, "setRadius:", MRUMediaSuggestionsIconShadowRadius(self->_layout));
}

- (void)updateVisiblity
{
  double v3;
  double v4;
  int v5;
  UIActivityIndicatorView *activityView;
  uint64_t v7;

  if (self->_iconImage)
    v3 = 1.0;
  else
    v3 = 0.0;
  -[MRUShadowView setAlpha:](self->_iconShadowView, "setAlpha:", v3);
  if (self->_iconImage)
    v4 = 1.0;
  else
    v4 = 0.0;
  -[UIImageView setAlpha:](self->_iconView, "setAlpha:", v4);
  if ((-[MRUMediaSuggestionCollectionViewCell isHighlighted](self, "isHighlighted") & 1) == 0)
  {
    v5 = -[MRUMediaSuggestionCollectionViewCell isSelected](self, "isSelected");
    activityView = self->_activityView;
    if (!v5)
    {
      -[UIActivityIndicatorView stopAnimating](activityView, "stopAnimating");
      v7 = 0;
      goto LABEL_12;
    }
    -[UIActivityIndicatorView startAnimating](activityView, "startAnimating");
  }
  v7 = 1;
LABEL_12:
  -[MRUArtworkView setHighlighted:](self->_artworkView, "setHighlighted:", v7);
}

- (NSString)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

- (void)setSuggestionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (MRUArtworkView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkView, a3);
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (MRUShadowView)iconShadowView
{
  return self->_iconShadowView;
}

- (void)setIconShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_iconShadowView, a3);
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
  objc_storeStrong((id *)&self->_activityView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (BSUIEmojiLabelView)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_storeStrong((id *)&self->_iconShadowView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_suggestionIdentifier, 0);
}

@end
