@implementation ASCMediaCollectionViewCell

- (ASCMediaCollectionViewCell)initWithFrame:(CGRect)a3
{
  ASCMediaCollectionViewCell *v3;
  ASCBorderedScreenshotView *v4;
  void *v5;
  uint64_t v6;
  ASCBorderedScreenshotView *screenshotView;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ASCMediaCollectionViewCell;
  v3 = -[ASCMediaCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [ASCBorderedScreenshotView alloc];
    +[ASCScreenshotDisplayConfiguration defaultConfiguration](ASCScreenshotDisplayConfiguration, "defaultConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ASCBorderedScreenshotView initWithFrame:screenshotDisplayConfiguration:](v4, "initWithFrame:screenshotDisplayConfiguration:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    screenshotView = v3->_screenshotView;
    v3->_screenshotView = (ASCBorderedScreenshotView *)v6;

    -[ASCBorderedScreenshotView setIsAccessibilityElement:](v3->_screenshotView, "setIsAccessibilityElement:", 1);
    -[ASCBorderedScreenshotView setAccessibilityTraits:](v3->_screenshotView, "setAccessibilityTraits:", *MEMORY[0x1E0DC4678]);
    ASCLocalizedString(CFSTR("AX_ARTWORK"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCBorderedScreenshotView setAccessibilityLabel:](v3->_screenshotView, "setAccessibilityLabel:", v9);

    -[ASCMediaCollectionViewCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v3->_screenshotView);

  }
  return v3;
}

- (void)applyArtwork:(id)a3 image:(id)a4 screenshotDisplayConfiguration:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  -[ASCMediaCollectionViewCell setArtwork:](self, "setArtwork:", a3);
  -[ASCMediaCollectionViewCell screenshotView](self, "screenshotView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "artworkView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v9);

  -[ASCMediaCollectionViewCell screenshotView](self, "screenshotView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "artworkView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setScreenshotDisplayConfiguration:", v8);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCMediaCollectionViewCell;
  -[ASCMediaCollectionViewCell prepareForReuse](&v8, sel_prepareForReuse);
  -[ASCMediaCollectionViewCell setArtwork:](self, "setArtwork:", 0);
  -[ASCMediaCollectionViewCell screenshotView](self, "screenshotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

  +[ASCScreenshotDisplayConfiguration defaultConfiguration](ASCScreenshotDisplayConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMediaCollectionViewCell screenshotView](self, "screenshotView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artworkView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScreenshotDisplayConfiguration:", v5);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ASCMediaCollectionViewCell;
  -[ASCMediaCollectionViewCell layoutSubviews](&v20, sel_layoutSubviews);
  -[ASCMediaCollectionViewCell artwork](self, "artwork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMediaCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  -[ASCMediaCollectionViewCell traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCMediaCollectionViewCell sizeForArtwork:thatFits:usingTraitCollection:](ASCMediaCollectionViewCell, "sizeForArtwork:thatFits:usingTraitCollection:", v3, v9, v6, v8);
  v11 = v10;
  v13 = v12;

  -[ASCMediaCollectionViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;

  -[ASCMediaCollectionViewCell screenshotView](self, "screenshotView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", (v16 - v11) * 0.5, (v18 - v13) * 0.5, v11, v13);

}

+ (double)minimumLineSpacing
{
  return 15.0;
}

+ (CGSize)sizeForArtwork:(id)a3 thatFits:(CGSize)a4 usingTraitCollection:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = a5;
  if ((objc_msgSend(v8, "isPortrait") & 1) != 0 || objc_msgSend(v9, "userInterfaceIdiom"))
  {
    objc_msgSend(v8, "width");
    v11 = v10;
    objc_msgSend(v8, "height");
  }
  else
  {
    objc_msgSend(v8, "height");
    v11 = v13;
    objc_msgSend(v8, "width");
  }
  if (v11 / v12 <= width / height)
    v14 = height / v12;
  else
    v14 = width / v11;
  v15 = v12 * v14;
  v16 = v11 * v14;

  v17 = v16;
  v18 = v15;
  result.height = v18;
  result.width = v17;
  return result;
}

- (ASCBorderedScreenshotView)screenshotView
{
  return self->_screenshotView;
}

- (ASCArtwork)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_screenshotView, 0);
}

@end
