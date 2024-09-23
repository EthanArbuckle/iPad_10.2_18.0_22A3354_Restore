@implementation BKUIPearlMovieLoopView

- (BKUIPearlMovieLoopView)initWithFrame:(CGRect)a3 player:(id)a4 asset:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  BKUIPearlMovieLoopView *v14;
  BKUIPearlMovieLoopView *v15;
  uint64_t v16;
  UIImageView *imageView;
  void *v18;
  void *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)BKUIPearlMovieLoopView;
  v14 = -[BKUIPearlMovieLoopView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_player, a4);
    objc_storeStrong((id *)&v15->_assets, a5);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", x, y, width, height);
    imageView = v15->_imageView;
    v15->_imageView = (UIImageView *)v16;

    -[BKUIPearlMovieLoopView selfPortrait](v15, "selfPortrait");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v15->_imageView, "setImage:", v18);

    -[BKUIPearlMovieLoopView playerLayer](v15, "playerLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPlayer:", v12);

    -[BKUIPearlMovieLoopView addAnimatedSelfPotraitIfNeeded](v15, "addAnimatedSelfPotraitIfNeeded");
  }

  return v15;
}

- (void)addAnimatedSelfPotraitIfNeeded
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DB281000, log, OS_LOG_TYPE_FAULT, "BKUIPearlMovieLoopView: adding subview: animated self potrait", v1, 2u);
}

- (void)unhideAVPlayerRemoveSnapshot
{
  id v2;

  -[BKUIPearlMovieLoopView imageView](self, "imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

}

- (void)hideAVPlayerReplaceWithSnapshot
{
  id v3;

  -[BKUIPearlMovieLoopView imageView](self, "imageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlMovieLoopView addSubview:](self, "addSubview:", v3);

}

- (BOOL)portrait
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom"))
  {
    v4 = 0;
  }
  else
  {
    -[BKUIPearlMovieLoopView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "horizontalSizeClass") == 1;

  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "orientation") == 1
    || +[BKUIUtils activeInterfaceOrientationForView:](BKUIUtils, "activeInterfaceOrientationForView:", self) == 1|| v4;

  return v7;
}

- (BOOL)landscape
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "orientation") == 3
    || +[BKUIUtils activeInterfaceOrientationForView:](BKUIUtils, "activeInterfaceOrientationForView:", self) == 3;

  return v4;
}

- (void)setAlphaHideOnZero:(double)a3
{
  -[BKUIPearlMovieLoopView setAlpha:](self, "setAlpha:");
  -[BKUIPearlMovieLoopView setHidden:](self, "setHidden:", a3 == 0.0);
}

- (id)selfPortrait
{
  UIImage *selfPortraite;
  void *v4;
  void *v5;
  UIImage *v6;
  id v7;
  UIImage *v8;
  NSObject *v10;
  id v11;
  CMTime v12;

  selfPortraite = self->_selfPortraite;
  if (!selfPortraite)
  {
    -[BKUIPearlMovieLoopView player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v12, 0, 1);
    -[BKUIPearlMovieLoopView assets](self, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v4, "bkui_snapshotImageAt:asset:error:", &v12, v5, &v11);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v8 = self->_selfPortraite;
    self->_selfPortraite = v6;

    if (v7)
    {
      _BKUILoggingFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BKUIPearlMovieLoopView selfPortrait].cold.1(v7, v10);

      __assert_rtn("-[BKUIPearlMovieLoopView selfPortrait]", "BKUIPearlMovieLoopView.m", 115, "false");
    }
    selfPortraite = self->_selfPortraite;
  }
  return selfPortraite;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (AVAsset)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (UIImage)selfPortraite
{
  return self->_selfPortraite;
}

- (void)setSelfPortraite:(id)a3
{
  objc_storeStrong((id *)&self->_selfPortraite, a3);
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
  objc_storeStrong((id *)&self->_selfPortraite, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

- (void)selfPortrait
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2048;
  v8 = objc_msgSend(a1, "code");
  _os_log_fault_impl(&dword_1DB281000, a2, OS_LOG_TYPE_FAULT, "error could not grab image clip of the av clip description:/n%@ code: %li", (uint8_t *)&v5, 0x16u);

}

@end
