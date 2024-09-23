@implementation CKVibrantBalloonContainerView

- (CKVibrantBalloonContainerView)initWithTextBalloonView:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CKVibrantBalloonContainerView *v10;
  CKVibrantBalloonContainerView *v11;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKVibrantBalloonContainerView;
  v10 = -[CKVibrantBalloonContainerView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
    -[CKVibrantBalloonContainerView _commonInitWithVibrantBalloon:](v10, "_commonInitWithVibrantBalloon:", v9);

  return v11;
}

- (CKVibrantBalloonContainerView)initWithAudioBallonView:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CKVibrantBalloonContainerView *v10;
  CKVibrantBalloonContainerView *v11;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKVibrantBalloonContainerView;
  v10 = -[CKVibrantBalloonContainerView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
    -[CKVibrantBalloonContainerView _commonInitWithVibrantBalloon:](v10, "_commonInitWithVibrantBalloon:", v9);

  return v11;
}

- (void)_commonInitWithVibrantBalloon:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantBalloonView, a3);
  -[CKVibrantBalloonContainerView _setupVisualEffectViews](self, "_setupVisualEffectViews");
}

- (void)layoutSubviews
{
  UIVisualEffectView *blurView;
  UIVisualEffectView *vibrantView;
  CKBalloonVibrancy *vibrantBalloonView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKVibrantBalloonContainerView;
  -[CKVibrantBalloonContainerView layoutSubviews](&v6, sel_layoutSubviews);
  blurView = self->_blurView;
  -[CKVibrantBalloonContainerView bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](blurView, "setFrame:");
  vibrantView = self->_vibrantView;
  -[CKVibrantBalloonContainerView bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](vibrantView, "setFrame:");
  vibrantBalloonView = self->_vibrantBalloonView;
  -[CKVibrantBalloonContainerView bounds](self, "bounds");
  -[CKBalloonVibrancy setFrame:](vibrantBalloonView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[CKBalloonVibrancy sizeThatFits:](self->_vibrantBalloonView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CKBalloonVibrancy intrinsicContentSize](self->_vibrantBalloonView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_setupVisualEffectViews
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CEABE8]);
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 10);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEffect:", v4);
  v17 = v3;
  objc_storeStrong((id *)&self->_blurView, v3);
  -[CKVibrantBalloonContainerView addSubview:](self, "addSubview:", self->_blurView);
  v5 = objc_alloc_init(MEMORY[0x1E0CEABE8]);
  v16 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v4, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEffect:", v6);

  objc_storeStrong((id *)&self->_vibrantView, v5);
  -[UIVisualEffectView contentView](self->_blurView, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_vibrantView);

  -[CKBalloonVibrancy nonVibrantSubViews](self->_vibrantBalloonView, "nonVibrantSubViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonVibrancy vibrantContainerWillReparentNonVibrantSubviews:](self->_vibrantBalloonView, "vibrantContainerWillReparentNonVibrantSubviews:", v8);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "removeFromSuperview");
        -[CKVibrantBalloonContainerView addSubview:](self, "addSubview:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  -[UIVisualEffectView contentView](self->_vibrantView, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_vibrantBalloonView);

  -[UIVisualEffectView setMaskView:](self->_blurView, "setMaskView:", self->_vibrantBalloonView);
}

- (void)setBlurEffect:(id)a3
{
  UIVisualEffectView *blurView;
  id v5;

  blurView = self->_blurView;
  v5 = a3;
  -[UIVisualEffectView setEffect:](blurView, "setEffect:", v5);
  -[UIVisualEffectView setEffect:](self->_vibrantView, "setEffect:", v5);

}

- (void)setVibrancyEffect:(id)a3
{
  -[UIVisualEffectView setEffect:](self->_vibrantView, "setEffect:", a3);
}

- (void)setColorOverlay:(id)a3
{
  -[UIVisualEffectView setBackgroundColor:](self->_blurView, "setBackgroundColor:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_vibrantBalloonView, 0);
}

@end
