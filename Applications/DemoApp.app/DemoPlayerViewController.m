@implementation DemoPlayerViewController

- (void)loadView
{
  void *v3;
  void *v4;
  DemoPlayerView *v5;
  DemoPlayerView *v6;
  DemoPlayerView *playerView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DemoPlayerViewController;
  -[DemoPlayerViewController loadView](&v8, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DemoPlayerViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = [DemoPlayerView alloc];
  objc_msgSend(v3, "bounds");
  v6 = -[DemoPlayerView initWithFrame:](v5, "initWithFrame:");
  playerView = self->_playerView;
  self->_playerView = v6;

  objc_msgSend(v3, "addSubview:", self->_playerView);
  self->_duration = NAN;

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DemoPlayerViewController;
  -[DemoPlayerViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[DemoPlayerViewController _prepareMovie](self, "_prepareMovie");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  double v13;
  long double v14;
  long double v15;
  AVPlayer *player;
  objc_super v17;
  __int128 v18;
  CMTimeEpoch v19;
  __int128 v20;
  CMTimeEpoch epoch;
  CMTime v22;
  CMTime v23;

  if (a6 == &unk_100009038)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem", a3, a4, a5));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
      v10 = objc_msgSend(v9, "status");

      if (v10 == (id)1)
      {
        if (self->_sync)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          objc_msgSend(v12, "timeIntervalSince1970");
          v14 = v13;

          v15 = fmod(v14, self->_duration + 1.0);
          memset(&v23, 0, sizeof(v23));
          CMTimeMakeWithSeconds(&v23, v15, 1);
          player = self->_player;
          v22 = v23;
          v20 = *(_OWORD *)&kCMTimeZero.value;
          epoch = kCMTimeZero.epoch;
          v18 = v20;
          v19 = epoch;
          -[AVPlayer seekToTime:toleranceBefore:toleranceAfter:](player, "seekToTime:toleranceBefore:toleranceAfter:", &v22, &v20, &v18);
        }
        LODWORD(v11) = 1.0;
        -[AVPlayer setRate:](self->_player, "setRate:", v11);
      }
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)DemoPlayerViewController;
    -[DemoPlayerViewController observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)_playerItemDidPlayToEndTime:(id)a3
{
  double duration;
  double v5;
  void *v6;
  double v7;
  long double v8;
  double v9;
  dispatch_time_t v10;
  long double v11;
  AVPlayer *player;
  __int128 v13;
  CMTimeEpoch v14;
  __int128 v15;
  CMTimeEpoch epoch;
  CMTime v17;
  CMTime v18;
  _QWORD block[5];

  duration = self->_duration;
  v5 = 1.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", a3));
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  if (self->_sync && (v9 = duration + 1.0, v5 = fmod(v9 * ceil(v8 / v9) - v8, v9), v5 >= 2.0))
  {
    v11 = fmod(v8, v9);
    memset(&v18, 0, sizeof(v18));
    CMTimeMakeWithSeconds(&v18, v11, 1);
    player = self->_player;
    v17 = v18;
    v15 = *(_OWORD *)&kCMTimeZero.value;
    epoch = kCMTimeZero.epoch;
    v13 = v15;
    v14 = epoch;
    -[AVPlayer seekToTime:toleranceBefore:toleranceAfter:](player, "seekToTime:toleranceBefore:toleranceAfter:", &v17, &v15, &v13);
  }
  else
  {
    v10 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000018EC;
    block[3] = &unk_100004168;
    block[4] = self;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_prepareMovie
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  DemoPlayerViewController *v14;

  self->_sync = 1;
  v3 = NSHomeDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("DemoSync.mov")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 0));

  if ((objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    v7 = NSHomeDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Demo.mov")));
    v10 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v9, 0));

    self->_sync = 0;
    v6 = (void *)v10;
  }
  if ((objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    NSLog(CFSTR("movie %@ not found"), v6);
    abort();
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100001AB4;
  v12[3] = &unk_100004190;
  v13 = objc_msgSend(objc_alloc((Class)AVURLAsset), "initWithURL:options:", v6, 0);
  v14 = self;
  v11 = v13;
  objc_msgSend(v11, "loadValuesAsynchronouslyForKeys:completionHandler:", &off_100004320, v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
