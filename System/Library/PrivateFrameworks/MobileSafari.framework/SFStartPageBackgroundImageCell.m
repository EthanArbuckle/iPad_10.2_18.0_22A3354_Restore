@implementation SFStartPageBackgroundImageCell

- (SFStartPageBackgroundImageCell)initWithFrame:(CGRect)a3
{
  SFStartPageBackgroundImageCell *v3;
  SFStartPageBackgroundImageCell *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  UIImageView *imageView;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  UIView *highlightView;
  void *v16;
  SFCloseButton *v17;
  UIButton *clearButton;
  id v19;
  uint64_t v20;
  UIView *selectionIndicator;
  double v22;
  void *v23;
  UIActivityIndicatorView *v24;
  UIActivityIndicatorView *downloadProgressIndicator;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  UIImageView *v35;
  UIImageView *downloadButtonImage;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  SFStartPageBackgroundImageCell *v57;
  void *v59;
  void *v60;
  void *v61;
  objc_super v62;
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[3];

  v65[2] = *MEMORY[0x1E0C80C00];
  v62.receiver = self;
  v62.super_class = (Class)SFStartPageBackgroundImageCell;
  v3 = -[SFStartPageBackgroundImageCell initWithFrame:](&v62, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFStartPageBackgroundImageCell setTintAdjustmentMode:](v3, "setTintAdjustmentMode:", 1);
    -[SFStartPageBackgroundImageCell contentView](v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setContinuousCornerRadius:", 10.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    v7 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(v5, "bounds");
    v8 = objc_msgSend(v7, "initWithFrame:");
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v8;

    -[UIImageView _setContinuousCornerRadius:](v4->_imageView, "_setContinuousCornerRadius:", 10.0);
    -[UIImageView setAutoresizingMask:](v4->_imageView, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v4->_imageView, "setBackgroundColor:", v10);

    -[UIImageView setClipsToBounds:](v4->_imageView, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4B50]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v4->_imageView, "setPreferredSymbolConfiguration:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v4->_imageView, "setTintColor:", v12);

    objc_msgSend(v5, "addSubview:", v4->_imageView);
    v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v5, "bounds");
    v14 = objc_msgSend(v13, "initWithFrame:");
    highlightView = v4->_highlightView;
    v4->_highlightView = (UIView *)v14;

    -[UIView _setContinuousCornerRadius:](v4->_highlightView, "_setContinuousCornerRadius:", 10.0);
    -[UIView setAlpha:](v4->_highlightView, "setAlpha:", 0.0);
    -[UIView setAutoresizingMask:](v4->_highlightView, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_highlightView, "setBackgroundColor:", v16);

    -[UIView setClipsToBounds:](v4->_highlightView, "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](v4->_highlightView, "setUserInteractionEnabled:", 0);
    objc_msgSend(v5, "addSubview:", v4->_highlightView);
    v17 = -[SFCloseButton initWithStyle:primaryAction:]([SFCloseButton alloc], "initWithStyle:primaryAction:", 1, 0);
    clearButton = v4->_clearButton;
    v4->_clearButton = &v17->super;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_clearButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v4->_clearButton, "addTarget:action:forControlEvents:", v4, sel_didSelectClearButton_, 0x2000);
    objc_msgSend(v5, "addSubview:", v4->_clearButton);
    v19 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v5, "bounds");
    v20 = objc_msgSend(v19, "initWithFrame:");
    selectionIndicator = v4->_selectionIndicator;
    v4->_selectionIndicator = (UIView *)v20;

    -[UIView _setContinuousCornerRadius:](v4->_selectionIndicator, "_setContinuousCornerRadius:", 10.0);
    -[UIView setAutoresizingMask:](v4->_selectionIndicator, "setAutoresizingMask:", 18);
    v22 = _SFRoundFloatToPixels(2.5);
    -[UIView layer](v4->_selectionIndicator, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBorderWidth:", v22);

    -[UIView setUserInteractionEnabled:](v4->_selectionIndicator, "setUserInteractionEnabled:", 0);
    v61 = v5;
    objc_msgSend(v5, "addSubview:", v4->_selectionIndicator);
    v24 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x1E0DC3438]);
    downloadProgressIndicator = v4->_downloadProgressIndicator;
    v4->_downloadProgressIndicator = v24;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v4->_downloadProgressIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setActivityIndicatorViewStyle:](v4->_downloadProgressIndicator, "setActivityIndicatorViewStyle:", 100);
    -[UIActivityIndicatorView setHidesWhenStopped:](v4->_downloadProgressIndicator, "setHidesWhenStopped:", 1);
    objc_msgSend(v5, "addSubview:", v4->_downloadProgressIndicator);
    v59 = (void *)MEMORY[0x1E0CB3718];
    -[UIActivityIndicatorView centerXAnchor](v4->_downloadProgressIndicator, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageBackgroundImageCell contentView](v4, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v29;
    -[UIActivityIndicatorView centerYAnchor](v4->_downloadProgressIndicator, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageBackgroundImageCell contentView](v4, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "activateConstraints:", v34);

    v35 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    downloadButtonImage = v4->_downloadButtonImage;
    v4->_downloadButtonImage = v35;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_downloadButtonImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v4->_downloadButtonImage, "setTintColor:", v37);

    objc_msgSend(v61, "addSubview:", v4->_downloadButtonImage);
    v60 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView centerXAnchor](v4->_downloadButtonImage, "centerXAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageBackgroundImageCell contentView](v4, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v41;
    -[UIImageView centerYAnchor](v4->_downloadButtonImage, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageBackgroundImageCell contentView](v4, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "centerYAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "activateConstraints:", v46);

    v47 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton trailingAnchor](v4->_clearButton, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, -5.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v50;
    -[UIButton topAnchor](v4->_clearButton, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, 5.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "activateConstraints:", v54);

    -[SFStartPageBackgroundImageCell setShowsCustomImageControls:](v4, "setShowsCustomImageControls:", 0);
    -[SFStartPageBackgroundImageCell setShowsSelectionRing:](v4, "setShowsSelectionRing:", 0);
    v4->_downloadState = 2;
    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (id)-[SFStartPageBackgroundImageCell registerForTraitChanges:withTarget:action:](v4, "registerForTraitChanges:withTarget:action:", v55, v4, sel_updateSelectionIndicatorColor);

    v57 = v4;
  }

  return v4;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFStartPageBackgroundImageCell;
  -[SFStartPageBackgroundImageCell tintColorDidChange](&v3, sel_tintColorDidChange);
  -[SFStartPageBackgroundImageCell updateSelectionIndicatorColor](self, "updateSelectionIndicatorColor");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SFStartPageBackgroundImageCell;
  -[SFStartPageBackgroundImageCell setHighlighted:](&v6, sel_setHighlighted_);
  v5 = 0.2;
  if (!v3)
    v5 = 0.0;
  -[UIView setAlpha:](self->_highlightView, "setAlpha:", v5);
}

- (void)updateSelectionIndicatorColor
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[SFStartPageBackgroundImageCell tintColor](self, "tintColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SFStartPageBackgroundImageCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvedColorWithTraitCollection:", v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  -[UIView layer](self->_selectionIndicator, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderColor:", v5);

}

- (void)didSelectClearButton:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "backgroundImageCellDidSelectClearButton:", self);

}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  UIImageView *imageView;
  id v5;
  uint64_t v6;

  imageView = self->_imageView;
  v5 = a3;
  -[UIImageView setImage:](imageView, "setImage:", v5);
  LODWORD(imageView) = objc_msgSend(v5, "_isSymbolImage");

  if ((_DWORD)imageView)
    v6 = 4;
  else
    v6 = 2;
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", v6);
}

- (BOOL)showsCustomImageControls
{
  return -[UIButton isHidden](self->_clearButton, "isHidden") ^ 1;
}

- (void)setShowsCustomImageControls:(BOOL)a3
{
  -[UIButton setHidden:](self->_clearButton, "setHidden:", !a3);
}

- (BOOL)showsSelectionRing
{
  return !-[UIView isHidden](self->_selectionIndicator, "isHidden");
}

- (void)setShowsSelectionRing:(BOOL)a3
{
  -[UIView setHidden:](self->_selectionIndicator, "setHidden:", !a3);
}

- (void)setDownloadState:(int64_t)a3
{
  UIActivityIndicatorView *downloadProgressIndicator;
  void *v6;

  downloadProgressIndicator = self->_downloadProgressIndicator;
  if (a3 == 1)
    -[UIActivityIndicatorView startAnimating](downloadProgressIndicator, "startAnimating");
  else
    -[UIActivityIndicatorView stopAnimating](downloadProgressIndicator, "stopAnimating");
  -[SFStartPageBackgroundImageCell _downloadImageForState:](self, "_downloadImageForState:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_downloadButtonImage, "setImage:", v6);

  self->_downloadState = a3;
}

- (id)_downloadImageForState:(int64_t)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 4, 25.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    if (a3 != 3)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = CFSTR("exclamationmark.icloud.fill");
  }
  else
  {
    v5 = CFSTR("square.and.arrow.down");
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v6;
}

- (SFStartPageBackgroundImageCellDelegate)delegate
{
  return (SFStartPageBackgroundImageCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)mobileAssetFileName
{
  return self->_mobileAssetFileName;
}

- (void)setMobileAssetFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 704);
}

- (int64_t)downloadState
{
  return self->_downloadState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetFileName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_downloadButtonImage, 0);
  objc_storeStrong((id *)&self->_downloadProgressIndicator, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_selectionIndicator, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
