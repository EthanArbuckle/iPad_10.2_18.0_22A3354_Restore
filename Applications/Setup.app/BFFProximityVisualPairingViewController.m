@implementation BFFProximityVisualPairingViewController

- (void)dealloc
{
  AVPlayer *v2;
  objc_super v3;
  SEL v4;
  BFFProximityVisualPairingViewController *v5;

  v5 = self;
  v4 = a2;
  v2 = -[BFFProximityVisualPairingViewController videoPlayer](self, "videoPlayer");
  -[AVPlayer removeObserver:forKeyPath:](v2, "removeObserver:forKeyPath:", v5, CFSTR("status"));

  v3.receiver = v5;
  v3.super_class = (Class)BFFProximityVisualPairingViewController;
  -[BFFProximityVisualPairingViewController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  id v2;
  AVPlayerViewController *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  UIImage *v11;
  id v12;
  VPPresenterView *v13;
  VPPresenterView *v14;
  id v15;
  VPPresenterView *v16;
  VPPresenterView *v17;
  id v18;
  VPPresenterView *v19;
  NSDictionary *v20;
  NSArray *v21;
  id v22;
  VPPresenterView *v23;
  NSDictionary *v24;
  NSArray *v25;
  NSNotificationCenter *v26;
  NSNotificationCenter *v27;
  id v28[5];
  objc_super v29;
  SEL v30;
  BFFProximityVisualPairingViewController *v31;
  const __CFString *v32;
  VPPresenterView *v33;
  const __CFString *v34;
  VPPresenterView *v35;

  v31 = self;
  v30 = a2;
  v29.receiver = self;
  v29.super_class = (Class)BFFProximityVisualPairingViewController;
  -[BFFProximityVisualPairingViewController viewDidLoad](&v29, "viewDidLoad");
  v2 = objc_alloc((Class)VPPresenterView);
  v3 = -[BFFProximityVisualPairingViewController videoViewController](v31, "videoViewController");
  v4 = -[AVPlayerViewController view](v3, "view");
  objc_msgSend(v4, "frame");
  v28[2] = v5;
  v28[1] = v6;
  v28[4] = v7;
  v28[3] = v8;
  v9 = objc_msgSend(v2, "initWithFrame:", *(double *)&v6, *(double *)&v5, *(double *)&v8, *(double *)&v7);
  -[BFFProximityVisualPairingViewController setVisualPairingView:](v31, "setVisualPairingView:", v9);

  v10 = objc_alloc((Class)UIImageView);
  v11 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("ProximityPairingMask"));
  v28[0] = objc_msgSend(v10, "initWithImage:", v11);

  objc_msgSend(v28[0], "setContentMode:", 1);
  v12 = +[UIColor _systemBackgroundColor](UIColor, "_systemBackgroundColor");
  v13 = -[BFFProximityVisualPairingViewController visualPairingView](v31, "visualPairingView");
  -[VPPresenterView setBackgroundColor:](v13, "setBackgroundColor:", v12);

  v14 = -[BFFProximityVisualPairingViewController visualPairingView](v31, "visualPairingView");
  -[VPPresenterView setMaskView:](v14, "setMaskView:", v28[0]);

  -[BFFProximityVisualPairingViewController createPlayer](v31, "createPlayer");
  -[BFFProximityVisualPairingViewController setRetryAttempts:](v31, "setRetryAttempts:", 0);
  v15 = -[BFFProximityVisualPairingViewController view](v31, "view");
  v16 = -[BFFProximityVisualPairingViewController visualPairingView](v31, "visualPairingView");
  objc_msgSend(v15, "addSubview:", v16);

  -[BFFProximityVisualPairingViewController addPlayer](v31, "addPlayer");
  v17 = -[BFFProximityVisualPairingViewController visualPairingView](v31, "visualPairingView");
  -[VPPresenterView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v18 = -[BFFProximityVisualPairingViewController view](v31, "view");
  v34 = CFSTR("visualPairingView");
  v19 = -[BFFProximityVisualPairingViewController visualPairingView](v31, "visualPairingView");
  v35 = v19;
  v20 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v21 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[visualPairingView]-0-|"), 0, 0, v20);
  objc_msgSend(v18, "addConstraints:", v21);

  v22 = -[BFFProximityVisualPairingViewController view](v31, "view");
  v32 = CFSTR("visualPairingView");
  v23 = -[BFFProximityVisualPairingViewController visualPairingView](v31, "visualPairingView");
  v33 = v23;
  v24 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v25 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[visualPairingView]-0-|"), 0, 0, v24);
  objc_msgSend(v22, "addConstraints:", v25);

  v26 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v26, "addObserver:selector:name:object:", v31, "didBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);

  v27 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v27, "addObserver:selector:name:object:", v31, "willResignActive:", UIApplicationWillResignActiveNotification, 0);

  objc_storeStrong(v28, 0);
}

- (void)createPlayer
{
  VPPresenterView *v2;
  id v3;
  id v4;
  id v5;
  AVPlayer *v6;
  AVPlayer *v7;
  NSNotificationCenter *v8;
  AVPlayer *v9;
  AVPlayerItem *v10;
  id v11;
  AVPlayerViewController *v12;
  AVPlayer *v13;
  AVPlayerViewController *v14;
  id v15;
  AVPlayerViewController *v16;
  id v17;
  AVPlayerViewController *v18;
  AVPlayerViewController *v19;
  AVPlayerViewController *v20;
  id v21;
  AVPlayerViewController *v22;
  id v23;
  char v24;
  id location[2];
  BFFProximityVisualPairingViewController *v26;

  v26 = self;
  location[1] = (id)a2;
  location[0] = objc_msgSend(objc_alloc((Class)UISUserInterfaceStyleMode), "initWithDelegate:", 0);
  v24 = 1;
  if (_AXSInvertColorsEnabled() || objc_msgSend(location[0], "modeValue") == (id)2)
  {
    v24 = 0;
    v2 = -[BFFProximityVisualPairingViewController visualPairingView](v26, "visualPairingView");
    -[VPPresenterView setMaskView:](v2, "setMaskView:", 0);

  }
  v3 = objc_alloc((Class)AVPlayer);
  v4 = +[SASUIProximityCloudPlayerItem configuredPlayerForLightMode:](SASUIProximityCloudPlayerItem, "configuredPlayerForLightMode:", v24 & 1);
  v5 = objc_msgSend(v3, "initWithPlayerItem:", v4);
  -[BFFProximityVisualPairingViewController setVideoPlayer:](v26, "setVideoPlayer:", v5);

  v6 = -[BFFProximityVisualPairingViewController videoPlayer](v26, "videoPlayer");
  -[AVPlayer setMuted:](v6, "setMuted:", 1);

  v7 = -[BFFProximityVisualPairingViewController videoPlayer](v26, "videoPlayer");
  -[AVPlayer addObserver:forKeyPath:options:context:](v7, "addObserver:forKeyPath:options:context:", v26, CFSTR("status"), 0, 0);

  v8 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  v9 = -[BFFProximityVisualPairingViewController videoPlayer](v26, "videoPlayer");
  v10 = -[AVPlayer currentItem](v9, "currentItem");
  -[NSNotificationCenter addObserver:selector:name:object:](v8, "addObserver:selector:name:object:", v26, "videoReachedEnd:", AVPlayerItemDidPlayToEndTimeNotification, v10);

  v11 = objc_alloc_init((Class)AVPlayerViewController);
  -[BFFProximityVisualPairingViewController setVideoViewController:](v26, "setVideoViewController:", v11);

  v12 = -[BFFProximityVisualPairingViewController videoViewController](v26, "videoViewController");
  -[AVPlayerViewController setUpdatesNowPlayingInfoCenter:](v12, "setUpdatesNowPlayingInfoCenter:", 0);

  v13 = -[BFFProximityVisualPairingViewController videoPlayer](v26, "videoPlayer");
  v14 = -[BFFProximityVisualPairingViewController videoViewController](v26, "videoViewController");
  -[AVPlayerViewController setPlayer:](v14, "setPlayer:", v13);

  v15 = +[UIColor _systemBackgroundColor](UIColor, "_systemBackgroundColor");
  v16 = -[BFFProximityVisualPairingViewController videoViewController](v26, "videoViewController");
  v17 = -[AVPlayerViewController view](v16, "view");
  objc_msgSend(v17, "setBackgroundColor:", v15);

  v18 = -[BFFProximityVisualPairingViewController videoViewController](v26, "videoViewController");
  -[AVPlayerViewController setShowsPlaybackControls:](v18, "setShowsPlaybackControls:", 0);

  v19 = -[BFFProximityVisualPairingViewController videoViewController](v26, "videoViewController");
  -[AVPlayerViewController setAllowsPictureInPicturePlayback:](v19, "setAllowsPictureInPicturePlayback:", 0);

  v20 = -[BFFProximityVisualPairingViewController videoViewController](v26, "videoViewController");
  v21 = -[AVPlayerViewController view](v20, "view");
  objc_msgSend(v21, "setContentMode:", 1);

  v22 = -[BFFProximityVisualPairingViewController videoViewController](v26, "videoViewController");
  v23 = -[AVPlayerViewController view](v22, "view");
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_storeStrong(location, 0);
}

- (void)addPlayer
{
  VPPresenterView *v2;
  AVPlayerViewController *v3;
  id v4;
  VPPresenterView *v5;
  AVPlayerViewController *v6;
  id v7;
  NSDictionary *v8;
  NSArray *v9;
  VPPresenterView *v10;
  AVPlayerViewController *v11;
  id v12;
  NSDictionary *v13;
  NSArray *v14;
  const __CFString *v16;
  id v17;
  const __CFString *v18;
  id v19;

  v2 = -[BFFProximityVisualPairingViewController visualPairingView](self, "visualPairingView");
  v3 = -[BFFProximityVisualPairingViewController videoViewController](self, "videoViewController");
  v4 = -[AVPlayerViewController view](v3, "view");
  -[VPPresenterView addSubview:](v2, "addSubview:", v4);

  v5 = -[BFFProximityVisualPairingViewController visualPairingView](self, "visualPairingView");
  v18 = CFSTR("pairingView");
  v6 = -[BFFProximityVisualPairingViewController videoViewController](self, "videoViewController");
  v7 = -[AVPlayerViewController view](v6, "view");
  v19 = v7;
  v8 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v9 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[pairingView]-0-|"), 0, 0, v8);
  -[VPPresenterView addConstraints:](v5, "addConstraints:", v9);

  v10 = -[BFFProximityVisualPairingViewController visualPairingView](self, "visualPairingView");
  v16 = CFSTR("pairingView");
  v11 = -[BFFProximityVisualPairingViewController videoViewController](self, "videoViewController");
  v12 = -[AVPlayerViewController view](v11, "view");
  v17 = v12;
  v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v14 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[pairingView]-0-|"), 0, 0, v13);
  -[VPPresenterView addConstraints:](v10, "addConstraints:", v14);

}

- (void)resetPlayer
{
  AVPlayer *v2;
  AVPlayer *v3;
  AVPlayerViewController *v4;
  id v5;
  AVPlayerViewController *v6;
  id v7;
  id v8;
  BFFProximityVisualPairingViewController *v9;
  AVPlayer *v10;

  v2 = -[BFFProximityVisualPairingViewController videoPlayer](self, "videoPlayer", a2);

  if (v2)
  {
    v3 = -[BFFProximityVisualPairingViewController videoPlayer](self, "videoPlayer");
    -[AVPlayer removeObserver:forKeyPath:](v3, "removeObserver:forKeyPath:", self, CFSTR("status"));

    -[BFFProximityVisualPairingViewController setVideoPlayer:](self, "setVideoPlayer:", 0);
  }
  v4 = -[BFFProximityVisualPairingViewController videoViewController](self, "videoViewController");
  v5 = -[AVPlayerViewController view](v4, "view");

  if (v5)
  {
    v6 = -[BFFProximityVisualPairingViewController videoViewController](self, "videoViewController");
    v7 = -[AVPlayerViewController view](v6, "view");
    objc_msgSend(v7, "removeFromSuperview");

    -[BFFProximityVisualPairingViewController setVideoViewController:](self, "setVideoViewController:", 0);
  }
  -[BFFProximityVisualPairingViewController createPlayer](self, "createPlayer");
  -[BFFProximityVisualPairingViewController addPlayer](self, "addPlayer");
  v8 = -[BFFProximityVisualPairingViewController navigationController](self, "navigationController");
  v9 = (BFFProximityVisualPairingViewController *)objc_msgSend(v8, "presentedViewController");

  if (v9 == self)
  {
    v10 = -[BFFProximityVisualPairingViewController videoPlayer](self, "videoPlayer");
    -[AVPlayer play](v10, "play");

  }
}

- (void)setPairingCode:(id)a3
{
  id v3;
  VPPresenterView *v4;
  id location[2];
  BFFProximityVisualPairingViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = -[BFFProximityVisualPairingViewController visualPairingView](v6, "visualPairingView");
  -[VPPresenterView setVerificationCode:](v4, "setVerificationCode:", v3);

  objc_storeStrong(location, 0);
}

- (void)viewDidLayoutSubviews
{
  VPPresenterView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  VPPresenterView *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (-[BFFProximityVisualPairingViewController started](self, "started"))
  {
    -[BFFProximityVisualPairingViewController stop](self, "stop");
    -[BFFProximityVisualPairingViewController start](self, "start");
  }
  v2 = -[BFFProximityVisualPairingViewController visualPairingView](self, "visualPairingView");
  -[VPPresenterView frame](v2, "frame");
  v10 = v3;
  v9 = v4;
  v12 = v5;
  v11 = v6;
  v7 = -[BFFProximityVisualPairingViewController visualPairingView](self, "visualPairingView");
  v8 = -[VPPresenterView maskView](v7, "maskView");
  objc_msgSend(v8, "setFrame:", v9, v10, v11, v12, *(_QWORD *)&v9, *(_QWORD *)&v10, *(_QWORD *)&v11, *(_QWORD *)&v12);

}

- (void)start
{
  VPPresenterView *v2;
  AVPlayer *v3;

  -[BFFProximityVisualPairingViewController setStarted:](self, "setStarted:", 1, a2);
  v2 = -[BFFProximityVisualPairingViewController visualPairingView](self, "visualPairingView");
  -[VPPresenterView start](v2, "start");

  v3 = -[BFFProximityVisualPairingViewController videoPlayer](self, "videoPlayer");
  -[AVPlayer play](v3, "play");

}

- (void)stop
{
  -[BFFProximityVisualPairingViewController setStarted:](self, "setStarted:", 0, a2);
  -[BFFProximityVisualPairingViewController _stopPairingInterface](self, "_stopPairingInterface");
}

- (void)videoReachedEnd:(id)a3
{
  AVPlayer *v3;
  AVPlayer *v4;
  _BYTE v5[24];
  id location[2];
  BFFProximityVisualPairingViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BFFProximityVisualPairingViewController videoPlayer](v7, "videoPlayer");
  memcpy(v5, &kCMTimeZero, sizeof(v5));
  -[AVPlayer seekToTime:](v3, "seekToTime:", v5);

  v4 = -[BFFProximityVisualPairingViewController videoPlayer](v7, "videoPlayer");
  -[AVPlayer play](v4, "play");

  objc_storeStrong(location, 0);
}

- (void)didBecomeActive:(id)a3
{
  id location[2];
  BFFProximityVisualPairingViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[BFFProximityVisualPairingViewController started](v4, "started"))
    -[BFFProximityVisualPairingViewController resetPlayer](v4, "resetPlayer");
  objc_storeStrong(location, 0);
}

- (void)willResignActive:(id)a3
{
  id location[2];
  BFFProximityVisualPairingViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BFFProximityVisualPairingViewController _stopPairingInterface](v4, "_stopPairingInterface");
  objc_storeStrong(location, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  AVPlayer *v9;
  AVPlayer *v10;
  BOOL v11;
  char v12;
  AVPlayer *v13;
  BOOL v14;
  void *v15;
  void **block;
  int v17;
  int v18;
  id (*v19)(uint64_t);
  void *v20;
  id v21[2];
  id v22;
  id v23;
  id location[2];
  BFFProximityVisualPairingViewController *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21[1] = a6;
  v9 = (AVPlayer *)v23;
  v10 = -[BFFProximityVisualPairingViewController videoPlayer](v25, "videoPlayer");
  v11 = v9 == v10;
  v12 = 0;
  if (v11)
  {
    v12 = 0;
    if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("status")) & 1) != 0)
      v12 = !-[BFFProximityVisualPairingViewController started](v25, "started");
  }

  if ((v12 & 1) != 0)
  {
    v13 = -[BFFProximityVisualPairingViewController videoPlayer](v25, "videoPlayer");
    v14 = 0;
    if ((id)-[AVPlayer status](v13, "status") == (id)2)
      v14 = -[BFFProximityVisualPairingViewController retryAttempts](v25, "retryAttempts") < 3;

    if (v14)
    {
      v15 = &_dispatch_main_q;
      block = _NSConcreteStackBlock;
      v17 = -1073741824;
      v18 = 0;
      v19 = sub_1001533CC;
      v20 = &unk_100280730;
      v21[0] = v25;
      dispatch_async((dispatch_queue_t)v15, &block);

      objc_storeStrong(v21, 0);
    }
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)_stopPairingInterface
{
  VPPresenterView *v2;
  AVPlayer *v3;
  AVAudioSession *v4;

  v2 = -[BFFProximityVisualPairingViewController visualPairingView](self, "visualPairingView", a2);
  -[VPPresenterView stop](v2, "stop");

  v3 = -[BFFProximityVisualPairingViewController videoPlayer](self, "videoPlayer");
  -[AVPlayer pause](v3, "pause");

  v4 = +[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance");
  -[AVAudioSession setCategory:error:](v4, "setCategory:error:", AVAudioSessionCategoryAmbient, 0);

}

- (VPPresenterView)visualPairingView
{
  return (VPPresenterView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVisualPairingView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (AVPlayer)videoPlayer
{
  return (AVPlayer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVideoPlayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (AVPlayerViewController)videoViewController
{
  return (AVPlayerViewController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVideoViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (int64_t)retryAttempts
{
  return self->_retryAttempts;
}

- (void)setRetryAttempts:(int64_t)a3
{
  self->_retryAttempts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoViewController, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_visualPairingView, 0);
}

@end
