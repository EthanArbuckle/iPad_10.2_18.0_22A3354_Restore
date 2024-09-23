@implementation AVPictureInPictureControllerContentSource

- (AVPictureInPictureControllerContentSource)init
{
  return -[AVPictureInPictureControllerContentSource initWithPlayerLayer:](self, "initWithPlayerLayer:", 0);
}

- (AVPictureInPictureControllerContentSource)initWithPlayerLayer:(AVPlayerLayer *)playerLayer
{
  AVPlayerLayer *v5;
  AVPictureInPictureControllerContentSource *v6;
  AVPictureInPictureControllerContentSource *v7;
  objc_super v9;

  v5 = playerLayer;
  v9.receiver = self;
  v9.super_class = (Class)AVPictureInPictureControllerContentSource;
  v6 = -[AVPictureInPictureControllerContentSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_playerLayer, playerLayer);

  return v7;
}

- (AVPictureInPictureContentSource)source
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[AVPictureInPictureControllerContentSource sampleBufferDisplayLayer](self, "sampleBufferDisplayLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[AVPictureInPictureControllerContentSource playerLayer](self, "playerLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5 = v6;
    }
    else
    {
      -[AVPictureInPictureControllerContentSource _activeVideoCallContentViewController](self, "_activeVideoCallContentViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        -[AVPictureInPictureControllerContentSource activeContentViewController](self, "activeContentViewController");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v10;

    }
  }

  return (AVPictureInPictureContentSource *)v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AVPictureInPictureControllerContentSource sampleBufferDisplayLayer](self, "sampleBufferDisplayLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avkit_removePictureInPicturePlayerController");

  v4.receiver = self;
  v4.super_class = (Class)AVPictureInPictureControllerContentSource;
  -[AVPictureInPictureControllerContentSource dealloc](&v4, sel_dealloc);
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (id)_activeVideoCallSourceView
{
  return objc_loadWeakRetained(&self->__activeVideoCallSourceView);
}

- (AVPictureInPictureContentSource)_activeVideoCallContentViewController
{
  return self->__activeVideoCallContentViewController;
}

- (BOOL)hasInitialRenderSize
{
  return self->_hasInitialRenderSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeVideoCallContentViewController, 0);
  objc_destroyWeak(&self->__activeVideoCallSourceView);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_activeContentViewController, 0);
  objc_destroyWeak((id *)&self->_activeSourceView);
  objc_storeStrong((id *)&self->_sampleBufferPlaybackDelegate, 0);
  objc_storeStrong((id *)&self->_sampleBufferDisplayLayer, 0);
}

+ (int64_t)version
{
  return 2;
}

- (AVPictureInPictureControllerContentSource)initWithActiveVideoCallSourceView:(UIView *)sourceView contentViewController:(AVPictureInPictureVideoCallViewController *)contentViewController
{
  UIView *v6;
  AVPictureInPictureVideoCallViewController *v7;
  AVPictureInPictureControllerContentSource *v8;
  AVPictureInPictureControllerContentSource *v9;
  objc_super v11;

  v6 = sourceView;
  v7 = contentViewController;
  v11.receiver = self;
  v11.super_class = (Class)AVPictureInPictureControllerContentSource;
  v8 = -[AVPictureInPictureControllerContentSource init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->__activeVideoCallSourceView, v6);
    objc_storeStrong((id *)&v9->__activeVideoCallContentViewController, contentViewController);
  }

  return v9;
}

- (AVPictureInPictureControllerContentSource)initWithSampleBufferDisplayLayer:(id)a3 initialRenderSize:(CGSize)a4 playbackDelegate:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  AVPictureInPictureControllerContentSource *v12;
  AVPictureInPictureControllerContentSource *v13;
  objc_super v15;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVPictureInPictureControllerContentSource;
  v12 = -[AVPictureInPictureControllerContentSource init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_initialRenderSize.width = width;
    v12->_initialRenderSize.height = height;
    objc_storeStrong((id *)&v12->_sampleBufferDisplayLayer, a3);
    objc_storeStrong((id *)&v13->_sampleBufferPlaybackDelegate, a5);
    v13->_hasInitialRenderSize = 1;
  }

  return v13;
}

- (CGSize)initialRenderSize
{
  double width;
  double height;
  CGSize result;

  width = self->_initialRenderSize.width;
  height = self->_initialRenderSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (AVPictureInPictureControllerContentSource)initWithSourceView:(id)a3 contentViewController:(id)a4 playerController:(id)a5
{
  id v8;
  id v9;
  id v10;
  AVPictureInPictureControllerContentSource *v11;
  AVPictureInPictureControllerContentSource *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AVPictureInPictureControllerContentSource;
  v11 = -[AVPictureInPictureControllerContentSource init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_activeSourceView, v8);
    objc_storeStrong((id *)&v12->_activeContentViewController, a4);
    objc_msgSend(v9, "setPlayerController:", v10);
  }

  return v12;
}

- (UIView)activeSourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_activeSourceView);
}

- (AVPictureInPictureContentViewController)activeContentViewController
{
  return self->_activeContentViewController;
}

- (AVPictureInPictureControllerContentSource)initWithSampleBufferDisplayLayer:(AVSampleBufferDisplayLayer *)sampleBufferDisplayLayer playbackDelegate:(id)playbackDelegate
{
  AVSampleBufferDisplayLayer *v7;
  id v8;
  AVPictureInPictureControllerContentSource *v9;
  AVPictureInPictureControllerContentSource *v10;
  objc_super v12;

  v7 = sampleBufferDisplayLayer;
  v8 = playbackDelegate;
  v12.receiver = self;
  v12.super_class = (Class)AVPictureInPictureControllerContentSource;
  v9 = -[AVPictureInPictureControllerContentSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sampleBufferDisplayLayer, sampleBufferDisplayLayer);
    objc_storeStrong((id *)&v10->_sampleBufferPlaybackDelegate, playbackDelegate);
  }

  return v10;
}

- (AVSampleBufferDisplayLayer)sampleBufferDisplayLayer
{
  return self->_sampleBufferDisplayLayer;
}

- (id)sampleBufferPlaybackDelegate
{
  return self->_sampleBufferPlaybackDelegate;
}

@end
