@implementation JFXAVPlayerViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JFXAVPlayerViewController;
  -[JFXAVPlayerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[JFXAVPlayerViewController setShowAVControls:](self, "setShowAVControls:", 0);
}

- (void)viewDidLoad
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXAVPlayerViewController;
  -[JFXAVPlayerViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = -[JFXAVPlayerViewController showAVControls](self, "showAVControls");
  -[JFXAVPlayerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

  -[JFXAVPlayerViewController setShowsPlaybackControls:](self, "setShowsPlaybackControls:", -[JFXAVPlayerViewController showAVControls](self, "showAVControls"));
  -[JFXAVPlayerViewController setAllowsPictureInPicturePlayback:](self, "setAllowsPictureInPicturePlayback:", -[JFXAVPlayerViewController showAVControls](self, "showAVControls"));
  -[JFXAVPlayerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[JFXAVPlayerViewController setAllowsVideoFrameAnalysis:](self, "setAllowsVideoFrameAnalysis:", 0);
}

- (CGSize)displaySize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[JFXAVPlayerViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)configureDisplayAttributesForColorSpace:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v6 = *MEMORY[0x24BDC56B8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a3, "jfx_getCVPixelFormatForExport"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAVPlayerViewController setPixelBufferAttributes:](self, "setPixelBufferAttributes:", v5);

  }
  else
  {
    -[JFXAVPlayerViewController setPixelBufferAttributes:](self, "setPixelBufferAttributes:", 0);
  }
}

- (BOOL)showAVControls
{
  return self->showAVControls;
}

- (void)setShowAVControls:(BOOL)a3
{
  self->showAVControls = a3;
}

@end
