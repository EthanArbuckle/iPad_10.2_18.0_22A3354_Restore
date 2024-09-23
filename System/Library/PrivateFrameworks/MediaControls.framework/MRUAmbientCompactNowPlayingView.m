@implementation MRUAmbientCompactNowPlayingView

- (MRUAmbientCompactNowPlayingView)initWithWaveformView:(id)a3
{
  id v5;
  MRUAmbientCompactNowPlayingView *v6;
  MRUAmbientCompactNowPlayingView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUAmbientCompactNowPlayingView;
  v6 = -[MRUAmbientCompactNowPlayingView init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_waveformView, a3);
    -[MRUAmbientCompactNowPlayingView addSubview:](v7, "addSubview:", v7->_waveformView);
  }

  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;
  CGRect v13;

  v12.receiver = self;
  v12.super_class = (Class)MRUAmbientCompactNowPlayingView;
  -[MRUAmbientCompactNowPlayingView layoutSubviews](&v12, sel_layoutSubviews);
  -[MRUAmbientCompactNowPlayingView bounds](self, "bounds");
  CGRectGetWidth(v13);
  -[MRUAmbientCompactNowPlayingView bounds](self, "bounds");
  UIRectCenteredRect();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUAmbientCompactNowPlayingView waveformView](self, "waveformView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (MRUWaveformView)waveformView
{
  return self->_waveformView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformView, 0);
}

@end
