@implementation NANowPlayingBackgroundView

- (NANowPlayingBackgroundView)initWithFrame:(CGRect)a3
{
  NANowPlayingBackgroundView *v3;
  NANowPlayingBackgroundView *v4;
  uint64_t v5;
  NANowPlayingBackgroundView *v6;
  uint64_t v7;
  UIImageView *imageView;
  NANowPlayingBackgroundView *v9;
  uint64_t v10;
  UIVisualEffectView *visualEffectsView;
  _QWORD v13[4];
  NANowPlayingBackgroundView *v14;
  _QWORD v15[4];
  NANowPlayingBackgroundView *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NANowPlayingBackgroundView;
  v3 = -[NANowPlayingBackgroundView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__NANowPlayingBackgroundView_initWithFrame___block_invoke;
    v15[3] = &unk_1E71948B8;
    v6 = v3;
    v16 = v6;
    __44__NANowPlayingBackgroundView_initWithFrame___block_invoke((uint64_t)v15);
    v7 = objc_claimAutoreleasedReturnValue();
    imageView = v6->_imageView;
    v6->_imageView = (UIImageView *)v7;

    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __44__NANowPlayingBackgroundView_initWithFrame___block_invoke_2;
    v13[3] = &unk_1E71948E0;
    v9 = v6;
    v14 = v9;
    __44__NANowPlayingBackgroundView_initWithFrame___block_invoke_2((uint64_t)v13);
    v10 = objc_claimAutoreleasedReturnValue();
    visualEffectsView = v9->_visualEffectsView;
    v9->_visualEffectsView = (UIVisualEffectView *)v10;

  }
  return v4;
}

id __44__NANowPlayingBackgroundView_initWithFrame___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0DC3890]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setContentMode:", 2);
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v3);
  return v3;
}

id __44__NANowPlayingBackgroundView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEffect:", v3);

  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v4);
  return v4;
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3F10];
  -[NANowPlayingBackgroundView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__NANowPlayingBackgroundView_setImage___block_invoke;
  v8[3] = &unk_1E7194908;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "transitionWithView:duration:options:animations:completion:", v6, 5242880, v8, 0, 0.25);

}

void __39__NANowPlayingBackgroundView_setImage___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIVisualEffectView)visualEffectsView
{
  return self->_visualEffectsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectsView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
