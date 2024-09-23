@implementation NANowPlayingArtworkView

- (NANowPlayingArtworkView)initWithFrame:(CGRect)a3
{
  NANowPlayingArtworkView *v3;
  NANowPlayingArtworkView *v4;
  NANowPlayingArtworkView *v5;
  uint64_t v6;
  UIImageView *trackImageView;
  _QWORD v9[4];
  NANowPlayingArtworkView *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NANowPlayingArtworkView;
  v3 = -[NANowPlayingArtworkView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__NANowPlayingArtworkView_initWithFrame___block_invoke;
    v9[3] = &unk_1E71948B8;
    v5 = v3;
    v10 = v5;
    __41__NANowPlayingArtworkView_initWithFrame___block_invoke((uint64_t)v9);
    v6 = objc_claimAutoreleasedReturnValue();
    trackImageView = v5->_trackImageView;
    v5->_trackImageView = (UIImageView *)v6;

  }
  return v4;
}

id __41__NANowPlayingArtworkView_initWithFrame___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0DC3890]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setContentMode:", 1);
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityIgnoresInvertColors:", 1);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v3);
  return v3;
}

- (void)layoutSubviews
{
  double Width;
  double Height;
  void *v5;
  objc_super v6;
  CGRect v7;
  CGRect v8;

  v6.receiver = self;
  v6.super_class = (Class)NANowPlayingArtworkView;
  -[NANowPlayingArtworkView layoutSubviews](&v6, sel_layoutSubviews);
  -[NANowPlayingArtworkView bounds](self, "bounds");
  Width = CGRectGetWidth(v7);
  -[NANowPlayingArtworkView bounds](self, "bounds");
  Height = CGRectGetHeight(v8);
  -[NANowPlayingArtworkView trackImageView](self, "trackImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, Width, Height);

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double width;

  width = result.width;
  result.height = width;
  return result;
}

- (void)setTrackImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a4;
  v6 = a3;
  if (v4)
    v7 = 0.25;
  else
    v7 = 0.0;
  v8 = (void *)MEMORY[0x1E0DC3F10];
  -[NANowPlayingArtworkView trackImageView](self, "trackImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__NANowPlayingArtworkView_setTrackImage_animated___block_invoke;
  v11[3] = &unk_1E7194908;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", v9, 5242880, v11, 0, v7);

}

void __50__NANowPlayingArtworkView_setTrackImage_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "trackImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

- (CGSize)artworkSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[NANowPlayingArtworkView trackImageView](self, "trackImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)artworkSizeForTitleViewWidth:(double)a3
{
  CGSize result;

  result.height = a3;
  result.width = a3;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E0DC4678];
}

- (UIImageView)trackImageView
{
  return self->_trackImageView;
}

- (void)setTrackImageView:(id)a3
{
  objc_storeStrong((id *)&self->_trackImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackImageView, 0);
}

@end
