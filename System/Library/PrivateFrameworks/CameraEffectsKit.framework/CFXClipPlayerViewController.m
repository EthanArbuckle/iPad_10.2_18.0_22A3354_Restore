@implementation CFXClipPlayerViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  -[CFXClipPlayerViewController clip](self, "clip");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[CFXClipPlayerViewController clipDataSource](self, "clipDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clip");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXClipPlayerViewController clip](self, "clip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
      -[CFXClipPlayerViewController reloadClip](self, "reloadClip");
  }
  v10.receiver = self;
  v10.super_class = (Class)CFXClipPlayerViewController;
  -[CFXClipPlayerViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
}

- (void)reloadClipAndSeekToStart:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CFXClipCompositionDataSource *v9;
  void *v10;
  CFXClipCompositionDataSource *v11;
  id v12;

  v3 = a3;
  -[CFXClipPlayerViewController clipDataSource](self, "clipDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CFXClipPlayerViewController clip](self, "clip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    -[CFXClipPlayerViewController clipDataSource](self, "clipDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClip:", v7);

    -[JFXCompositionPlayerViewController setNeedsCompositionUpdate](self, "setNeedsCompositionUpdate");
    if (v3)
      -[JFXCompositionPlayerViewController seekToTime:](self, "seekToTime:", 0);
  }
  else
  {

    if (v7)
    {
      v9 = [CFXClipCompositionDataSource alloc];
      -[CFXClipPlayerViewController clip](self, "clip");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CFXClipCompositionDataSource initWithClip:](v9, "initWithClip:", v10);
      -[CFXClipPlayerViewController setClipDataSource:](self, "setClipDataSource:", v11);

      -[CFXClipPlayerViewController clipDataSource](self, "clipDataSource");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[JFXCompositionPlayerViewController setClipsDataSource:](self, "setClipsDataSource:", v12);

    }
  }
}

- (void)reloadClip
{
  -[CFXClipPlayerViewController reloadClipAndSeekToStart:](self, "reloadClipAndSeekToStart:", 1);
}

- (void)setClip:(id)a3
{
  void *v5;

  objc_storeStrong((id *)&self->_clip, a3);
  if (a3)
  {
    -[CFXClipPlayerViewController reloadClip](self, "reloadClip");
  }
  else
  {
    -[CFXClipPlayerViewController clipDataSource](self, "clipDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClip:", 0);

    -[CFXClipPlayerViewController setClipDataSource:](self, "setClipDataSource:", 0);
    -[JFXCompositionPlayerViewController setClipsDataSource:](self, "setClipsDataSource:", 0);
  }
}

- (void)updateCompositionForEffectChange
{
  id v3;

  -[CFXClipPlayerViewController clip](self, "clip");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXCompositionPlayerViewController setNeedsCompositionUpdateForClip:](self, "setNeedsCompositionUpdateForClip:", v3);

}

- (void)displayCompositionUpdateLoadingView:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_3;
  v5 = (void *)v4;
  -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_3:
    -[CFXClipPlayerViewController placeholderContainerView](self, "placeholderContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v20, "removeFromSuperview");
      objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
      -[JFXCompositionPlayerViewController setPlaceHolderView:](self, "setPlaceHolderView:", v20);
      -[CFXClipPlayerViewController playerContainerView](self, "playerContainerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

      -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAutoresizingMask:", 18);

    }
  }

}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("clipPlayer_embedAVPlayerViewer"));

  if (v6)
  {
    objc_msgSend(v10, "destinationViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "conformsToProtocol:", &unk_2558D1D70);

    if (v8)
    {
      objc_msgSend(v10, "destinationViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXClipPlayerViewController setAvPlayerView:](self, "setAvPlayerView:", v9);

    }
  }

}

- (CFXClip)clip
{
  return self->_clip;
}

- (UIView)playerContainerView
{
  return self->_playerContainerView;
}

- (void)setPlayerContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_playerContainerView, a3);
}

- (UIView)placeholderContainerView
{
  return self->_placeholderContainerView;
}

- (void)setPlaceholderContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderContainerView, a3);
}

- (JFXAVPlayerViewer)avPlayerView
{
  return (JFXAVPlayerViewer *)objc_loadWeakRetained((id *)&self->_avPlayerView);
}

- (void)setAvPlayerView:(id)a3
{
  objc_storeWeak((id *)&self->_avPlayerView, a3);
}

- (CFXClipCompositionDataSource)clipDataSource
{
  return self->_clipDataSource;
}

- (void)setClipDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_clipDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipDataSource, 0);
  objc_destroyWeak((id *)&self->_avPlayerView);
  objc_storeStrong((id *)&self->_placeholderContainerView, 0);
  objc_storeStrong((id *)&self->_playerContainerView, 0);
  objc_storeStrong((id *)&self->_clip, 0);
}

@end
