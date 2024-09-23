@implementation FMDMovieProxCardMovieView

- (FMDMovieProxCardMovieView)initWithMovieURL:(id)a3 adjustmentsURL:(id)a4
{
  id v6;
  id v7;
  FMDMovieProxCardMovieView *v8;
  FMDMovieProxCardMovieView *v9;
  uint64_t v10;
  AVPlayer *player;
  AVPlayer *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FMDMovieProxCardMovieView;
  v8 = -[FMDMovieProxCardMovieView initWithFrame:](&v15, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_adjustmentsURL, a4);
    v10 = objc_claimAutoreleasedReturnValue(+[AVPlayer playerWithURL:](AVPlayer, "playerWithURL:", v6));
    player = v9->_player;
    v9->_player = (AVPlayer *)v10;

    -[AVPlayer setActionAtItemEnd:](v9->_player, "setActionAtItemEnd:", 2);
    v12 = v9->_player;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardMovieView layer](v9, "layer"));
    objc_msgSend(v13, "setPlayer:", v12);

    -[FMDMovieProxCardMovieView updateAdjustments](v9, "updateAdjustments");
  }

  return v9;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class(AVPlayerLayer);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(a3, "userInterfaceStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  if (v4 != v6)
    -[FMDMovieProxCardMovieView updateAdjustments](self, "updateAdjustments");
}

- (void)updateAdjustments
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v4 = (unint64_t)objc_msgSend(v3, "userInterfaceStyle");

  if (v4 > 2)
    v5 = 0;
  else
    v5 = dword_100025F88[v4];
  v9 = (id)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardMovieView adjustmentsURL](self, "adjustmentsURL"));
  v6 = SFAdjustmentFiltersForAssetTypeAndURL(v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMovieProxCardMovieView layer](self, "layer"));
  objc_msgSend(v8, "setFilters:", v7);

}

- (NSURL)adjustmentsURL
{
  return self->_adjustmentsURL;
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_adjustmentsURL, 0);
}

@end
