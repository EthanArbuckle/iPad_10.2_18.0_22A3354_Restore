@implementation AVSecondScreenViewController

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[AVSecondScreenViewController setPlayingOnSecondScreen:](self, "setPlayingOnSecondScreen:", 0);
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AVSecondScreenViewController dealloc]";
    v7 = 1024;
    v8 = 50;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVSecondScreenViewController;
  -[AVSecondScreenViewController dealloc](&v4, sel_dealloc);
}

- (void)loadPlayerLayerViewIfNeeded
{
  AVSecondScreenPlayerLayerView *v3;
  void *v4;
  AVSecondScreenPlayerLayerView *v5;
  AVSecondScreenPlayerLayerView *playerLayerView;
  id v7;

  if (!self->_playerLayerView)
  {
    v3 = [AVSecondScreenPlayerLayerView alloc];
    -[AVSecondScreenViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v5 = -[AVSecondScreenPlayerLayerView initWithFrame:](v3, "initWithFrame:");
    playerLayerView = self->_playerLayerView;
    self->_playerLayerView = v5;

    -[AVSecondScreenViewController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSubview:atIndex:", self->_playerLayerView, 0);

  }
}

- (void)setContentView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  -[AVSecondScreenViewController contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v10)
  {
    -[AVSecondScreenViewController contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenViewController viewIfLoaded](self, "viewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isDescendantOfView:", v7);

    if (v8)
    {
      -[AVSecondScreenViewController contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

    }
    objc_storeStrong((id *)&self->_contentView, a3);
    -[AVSecondScreenViewController _updateContentViewIfNeeded](self, "_updateContentViewIfNeeded");
  }

}

- (void)setPlayingOnSecondScreen:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_playingOnSecondScreen != a3)
  {
    v3 = a3;
    self->_playingOnSecondScreen = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVSecondScreenViewController setPlayingOnSecondScreen:]";
      v10 = "playingOnSecondScreen";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    -[AVSecondScreenViewController _updateContentViewIfNeeded](self, "_updateContentViewIfNeeded");
  }
}

- (void)setSourcePlayerLayer:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sourcePlayerLayer);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_sourcePlayerLayer, obj);
    -[AVSecondScreenViewController _updateContentViewIfNeeded](self, "_updateContentViewIfNeeded");
    v5 = obj;
  }

}

- (CGSize)videoDisplaySize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[AVSecondScreenViewController playerLayerView](self, "playerLayerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoRect");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setInitialScreenBoundsHint:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_initialScreenBoundsHint;
  CGSize v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_initialScreenBoundsHint = &self->_initialScreenBoundsHint;
  if (CGRectIsInfinite(a3)
    || (v9.origin.x = x, v9.origin.y = y, v9.size.width = width, v9.size.height = height, CGRectIsNull(v9)))
  {
    v8 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    p_initialScreenBoundsHint->origin = (CGPoint)*MEMORY[0x1E0C9D648];
    p_initialScreenBoundsHint->size = v8;
  }
  else
  {
    p_initialScreenBoundsHint->origin.x = x;
    p_initialScreenBoundsHint->origin.y = y;
    p_initialScreenBoundsHint->size.width = width;
    p_initialScreenBoundsHint->size.height = height;
  }
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[AVSecondScreenViewController initialScreenBoundsHint](self, "initialScreenBoundsHint");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:");
  -[AVSecondScreenViewController setView:](self, "setView:", v4);

  -[AVSecondScreenViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 18);

}

- (void)viewDidLoad
{
  UILabel *v3;
  UILabel *debugLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVSecondScreenViewController;
  -[AVSecondScreenViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[AVSecondScreenViewController _updateContentViewIfNeeded](self, "_updateContentViewIfNeeded");
  if (AVSecondScreenDebugHUDEnabled_onceToken != -1)
    dispatch_once(&AVSecondScreenDebugHUDEnabled_onceToken, &__block_literal_global_104);
  if (AVSecondScreenDebugHUDEnabled__Enabled)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    debugLabel = self->_debugLabel;
    self->_debugLabel = v3;

    -[UILabel setTextAlignment:](self->_debugLabel, "setTextAlignment:", 2);
    -[UILabel setNumberOfLines:](self->_debugLabel, "setNumberOfLines:", 0);
    v5 = self->_debugLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v6);

    v7 = self->_debugLabel;
    v8 = (void *)MEMORY[0x1E0DC1350];
    -[AVSecondScreenViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    objc_msgSend(v8, "monospacedDigitSystemFontOfSize:weight:", v10 * 0.025, *MEMORY[0x1E0DC1428]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v11);

    -[AVSecondScreenViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", self->_debugLabel);

  }
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVSecondScreenViewController;
  -[AVSecondScreenViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[AVSecondScreenViewController _updateLayout](self, "_updateLayout");
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVSecondScreenViewController;
  -[AVSecondScreenViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[AVSecondScreenViewController _updateContentViewIfNeeded](self, "_updateContentViewIfNeeded");
  -[AVSecondScreenViewController _updateLayout](self, "_updateLayout");
  -[AVSecondScreenViewController contentView](self, "contentView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[AVSecondScreenViewController contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isDescendantOfView:", v7);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__updateContentViewIfNeeded, *MEMORY[0x1E0DC5308], 0);

    }
  }
}

- (id)debugText
{
  void *v3;
  void *v4;

  -[AVSecondScreenViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[AVSecondScreenViewController debugLabel](self, "debugLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setDebugText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AVSecondScreenViewController debugText](self, "debugText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    -[AVSecondScreenViewController debugLabel](self, "debugLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

    -[AVSecondScreenViewController _updateLayout](self, "_updateLayout");
  }

}

- (void)_updateContentViewIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  if (-[AVSecondScreenViewController isPlayingOnSecondScreen](self, "isPlayingOnSecondScreen"))
  {
    -[AVSecondScreenViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    -[AVSecondScreenViewController sourcePlayerLayer](self, "sourcePlayerLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[AVSecondScreenViewController playerLayerView](self, "playerLayerView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stopShowingContentFromActiveSourcePlayerLayer");

    }
    -[AVSecondScreenViewController contentView](self, "contentView");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5,
          -[AVSecondScreenViewController sourcePlayerLayer](self, "sourcePlayerLayer"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          !v7))
    {
      -[AVSecondScreenViewController playerLayerView](self, "playerLayerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVSecondScreenViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isDescendantOfView:", v22);

      if (v23)
      {
        -[AVSecondScreenViewController playerLayerView](self, "playerLayerView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeFromSuperview");

      }
      -[AVSecondScreenViewController contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVSecondScreenViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isDescendantOfView:", v12))
      {
        -[AVSecondScreenViewController view](self, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "window");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "windowScene");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "avkit_isForeground");

        if (v28)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5308], 0);

          objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
          objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
          -[AVSecondScreenViewController view](self, "view");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVSecondScreenViewController contentView](self, "contentView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "insertSubview:atIndex:", v31, 0);

          -[AVSecondScreenViewController contentView](self, "contentView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVSecondScreenViewController view](self, "view");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "bounds");
          objc_msgSend(v32, "setFrame:");

          -[AVSecondScreenViewController contentView](self, "contentView");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setNeedsLayout");

          -[AVSecondScreenViewController contentView](self, "contentView");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "layoutIfNeeded");

          objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
        }
        goto LABEL_20;
      }
    }
    else
    {
      -[AVSecondScreenViewController sourcePlayerLayer](self, "sourcePlayerLayer");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_20;
      v9 = (void *)v8;
      -[AVSecondScreenViewController contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        goto LABEL_20;
      -[AVSecondScreenViewController loadPlayerLayerViewIfNeeded](self, "loadPlayerLayerViewIfNeeded");
      -[AVSecondScreenViewController playerLayerView](self, "playerLayerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVSecondScreenViewController sourcePlayerLayer](self, "sourcePlayerLayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startShowingContentFromSourcePlayerLayer:", v12);
    }

LABEL_20:
    -[AVSecondScreenViewController _updateLayout](self, "_updateLayout");
    return;
  }
  -[AVSecondScreenViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSecondScreenViewController viewIfLoaded](self, "viewIfLoaded");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isDescendantOfView:", v14);

  if (v15)
  {
    -[AVSecondScreenViewController contentView](self, "contentView");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeFromSuperview");
LABEL_14:

    return;
  }
  -[AVSecondScreenViewController sourcePlayerLayer](self, "sourcePlayerLayer");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[AVSecondScreenViewController playerLayerView](self, "playerLayerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenViewController viewIfLoaded](self, "viewIfLoaded");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isDescendantOfView:", v19);

    if (v20)
    {
      -[AVSecondScreenViewController playerLayerView](self, "playerLayerView");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stopShowingContentFromActiveSourcePlayerLayer");
      goto LABEL_14;
    }
  }
}

- (void)_updateLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UILabel *debugLabel;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  -[AVSecondScreenViewController playerLayerView](self, "playerLayerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSecondScreenViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  -[AVSecondScreenViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSecondScreenViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");

  debugLabel = self->_debugLabel;
  v8 = (void *)MEMORY[0x1E0DC1350];
  -[AVSecondScreenViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  objc_msgSend(v8, "monospacedDigitSystemFontOfSize:weight:", v10 * 0.025, *MEMORY[0x1E0DC1428]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](debugLabel, "setFont:", v11);

  -[AVSecondScreenViewController debugLabel](self, "debugLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeToFit");

  -[AVSecondScreenViewController debugLabel](self, "debugLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;

  -[AVSecondScreenViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17 + -40.0;

  -[AVSecondScreenViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v20 + -20.0;
  -[AVSecondScreenViewController debugLabel](self, "debugLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v24 = v21 - v23;
  v25 = 20.0;
  if (v24 >= 20.0)
  {
    -[AVSecondScreenViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v28 = v27 + -20.0;
    -[AVSecondScreenViewController debugLabel](self, "debugLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");
    v25 = v28 - v30;

  }
  -[AVSecondScreenViewController debugLabel](self, "debugLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", 20.0, v25, v18, v15);

  -[AVSecondScreenViewController debugLabel](self, "debugLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[AVSecondScreenViewController view](self, "view");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenViewController debugLabel](self, "debugLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bringSubviewToFront:", v33);

  }
}

- (BOOL)isPlayingOnSecondScreen
{
  return self->_playingOnSecondScreen;
}

- (CGRect)initialScreenBoundsHint
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialScreenBoundsHint.origin.x;
  y = self->_initialScreenBoundsHint.origin.y;
  width = self->_initialScreenBoundsHint.size.width;
  height = self->_initialScreenBoundsHint.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (AVPlayerLayer)sourcePlayerLayer
{
  return (AVPlayerLayer *)objc_loadWeakRetained((id *)&self->_sourcePlayerLayer);
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (AVSecondScreenPlayerLayerView)playerLayerView
{
  return self->_playerLayerView;
}

- (void)setPlayerLayerView:(id)a3
{
  objc_storeStrong((id *)&self->_playerLayerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerLayerView, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_destroyWeak((id *)&self->_sourcePlayerLayer);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
