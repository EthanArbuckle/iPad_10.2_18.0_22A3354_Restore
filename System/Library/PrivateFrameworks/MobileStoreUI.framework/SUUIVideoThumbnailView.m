@implementation SUUIVideoThumbnailView

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  UIImageView *v12;
  UIImageView *playControlView;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;
  UIImageView *v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SUUIVideoThumbnailView;
  -[SUUIImageView layoutSubviews](&v27, sel_layoutSubviews);
  if (!layoutSubviews_sPlayButtonImage)
  {
    v3 = (void *)MEMORY[0x24BEBD640];
    SUUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("PlayControlPressed"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)layoutSubviews_sPlayButtonHighlightedImage;
    layoutSubviews_sPlayButtonHighlightedImage = v5;

    v7 = (void *)MEMORY[0x24BEBD640];
    SUUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("PlayControl"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)layoutSubviews_sPlayButtonImage;
    layoutSubviews_sPlayButtonImage = v9;

  }
  if (!self->_playControlView)
  {
    v11 = objc_alloc(MEMORY[0x24BEBD668]);
    v12 = (UIImageView *)objc_msgSend(v11, "initWithImage:highlightedImage:", layoutSubviews_sPlayButtonImage, layoutSubviews_sPlayButtonHighlightedImage);
    playControlView = self->_playControlView;
    self->_playControlView = v12;

    -[UIImageView setContentMode:](self->_playControlView, "setContentMode:", 1);
    -[SUUIVideoThumbnailView addSubview:](self, "addSubview:", self->_playControlView);
  }
  -[SUUIVideoThumbnailView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  objc_msgSend((id)layoutSubviews_sPlayButtonImage, "size");
  v20 = v17 + -8.0;
  if (v19 < v17 + -8.0)
    v20 = v19;
  if (v18 >= v15 + -8.0)
    v21 = v15 + -8.0;
  else
    v21 = v18;
  v22 = (v15 - v21) * 0.5;
  v23 = (v17 - v20) * 0.5;
  -[UIImageView setFrame:](self->_playControlView, "setFrame:", floorf(v22), floorf(v23));
  v24 = self->_playControlView;
  -[SUUIVideoThumbnailView transform](self, "transform");
  CGAffineTransformInvert(&v26, &v25);
  -[UIImageView setTransform:](v24, "setTransform:", &v26);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playControlView, 0);
}

@end
