@implementation AKBringDeviceCloseMicaView

- (AKBringDeviceCloseMicaView)init
{
  AKBringDeviceCloseMicaView *v2;
  AKBringDeviceCloseMicaView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKBringDeviceCloseMicaView;
  v2 = -[AKBringDeviceCloseMicaView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AKBringDeviceCloseMicaView loadMicaFile](v2, "loadMicaFile");
  return v3;
}

- (void)loadMicaFile
{
  AKUIMicaPlayer *v3;
  void *v4;
  AKUIMicaPlayer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = [AKUIMicaPlayer alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v5 = -[AKUIMicaPlayer initWithFileName:retinaScale:](v3, "initWithFileName:retinaScale:", CFSTR("SignInProximity"));
  -[AKBringDeviceCloseMicaView setMicaPlayer:](self, "setMicaPlayer:", v5);

  -[AKBringDeviceCloseMicaView micaPlayer](self, "micaPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBringDeviceCloseMicaView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addToLayer:onTop:gravity:", v7, 1, *MEMORY[0x1E0CD2F90]);

  -[AKBringDeviceCloseMicaView micaPlayer](self, "micaPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "play");

  -[AKBringDeviceCloseMicaView micaPlayer](self, "micaPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "publishedLayerWithKey:required:", CFSTR("Dot Cloud"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBringDeviceCloseMicaView setDotCloudLayer:](self, "setDotCloudLayer:", v10);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "CGColor");
  -[AKBringDeviceCloseMicaView dotCloudLayer](self, "dotCloudLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/AuthKitUI.framework"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(v19, "pathForResource:ofType:", CFSTR("DotCloud@2x"), CFSTR("png"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageWithContentsOfFile:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBringDeviceCloseMicaView dotCloudLayer](self, "dotCloudLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContents:", v16);

  -[AKBringDeviceCloseMicaView micaPlayer](self, "micaPlayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", self);

}

- (void)layoutSubviews
{
  AKUIMicaPlayer *micaPlayer;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKBringDeviceCloseMicaView;
  -[AKBringDeviceCloseMicaView layoutSubviews](&v5, sel_layoutSubviews);
  micaPlayer = self->_micaPlayer;
  -[AKBringDeviceCloseMicaView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKUIMicaPlayer moveAndResizeWithinParentLayer:usingGravity:animate:](micaPlayer, "moveAndResizeWithinParentLayer:usingGravity:animate:", v4, *MEMORY[0x1E0CD2F90], 0);

}

- (void)AKUIMicaPlayerDidChangePlaybackTime:(id)a3
{
  double v4;
  double v5;
  char **p_name;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (self->_shouldshowDotCloud)
  {
    if (!self->_didBeginShowingDotCloud)
    {
      if (-[AKBringDeviceCloseMicaView arePhonesTogether](self, "arePhonesTogether"))
      {
        -[AKUIMicaPlayer setPlaybackTime:](self->_micaPlayer, "setPlaybackTime:", 7.0);
        p_name = (char **)(&OBJC_PROTOCOL___AKAuthorizationPaneViewControllerDelegate + 8);
        v7 = 0x401F1EB851EB851FLL;
      }
      else
      {
        if (!-[AKBringDeviceCloseMicaView arePhonesApart](self, "arePhonesApart"))
          goto LABEL_12;
        -[AKUIMicaPlayer setPlaybackTime:](self->_micaPlayer, "setPlaybackTime:", 5.0);
        p_name = &OBJC_PROTOCOL___AKAuthorizationPaneViewControllerDelegate.name;
        v7 = 0x40171EB851EB851FLL;
      }
      p_name[95] = (char *)v7;
      self->_didBeginShowingDotCloud = 1;
      goto LABEL_12;
    }
    -[AKUIMicaPlayer playbackTime](self->_micaPlayer, "playbackTime");
    if (v4 >= *(double *)&timeToPauseAfterShowingDotCloud)
      -[AKUIMicaPlayer pause](self->_micaPlayer, "pause");
  }
  else
  {
    -[AKUIMicaPlayer playbackTime](self->_micaPlayer, "playbackTime");
    if (v5 >= 4.94999981)
      -[AKUIMicaPlayer setPlaybackTime:](self->_micaPlayer, "setPlaybackTime:", 0.0);
  }
LABEL_12:

}

- (BOOL)arePhonesTogether
{
  double v3;
  double v4;
  BOOL result;

  -[AKUIMicaPlayer playbackTime](self->_micaPlayer, "playbackTime");
  result = 0;
  if (v3 >= 1.5)
  {
    -[AKUIMicaPlayer playbackTime](self->_micaPlayer, "playbackTime");
    if (v4 <= 1.5)
      return 1;
  }
  return result;
}

- (BOOL)arePhonesApart
{
  double v3;
  double v4;
  BOOL result;

  -[AKUIMicaPlayer playbackTime](self->_micaPlayer, "playbackTime");
  result = 0;
  if (v3 >= 5.0)
  {
    -[AKUIMicaPlayer playbackTime](self->_micaPlayer, "playbackTime");
    if (v4 <= 5.78)
      return 1;
  }
  return result;
}

- (BOOL)shouldshowDotCloud
{
  return self->_shouldshowDotCloud;
}

- (void)setShouldshowDotCloud:(BOOL)a3
{
  self->_shouldshowDotCloud = a3;
}

- (AKUIMicaPlayer)micaPlayer
{
  return self->_micaPlayer;
}

- (void)setMicaPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_micaPlayer, a3);
}

- (CALayer)dotCloudLayer
{
  return self->_dotCloudLayer;
}

- (void)setDotCloudLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dotCloudLayer, a3);
}

- (BOOL)didBeginShowingDotCloud
{
  return self->_didBeginShowingDotCloud;
}

- (void)setDidBeginShowingDotCloud:(BOOL)a3
{
  self->_didBeginShowingDotCloud = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotCloudLayer, 0);
  objc_storeStrong((id *)&self->_micaPlayer, 0);
}

@end
