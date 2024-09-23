@implementation __AVPlayerLayerView

- (CGRect)videoBounds
{
  void *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  void *v12;
  double v13;
  double v14;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGSize v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;
  CGRect v42;

  -[__AVPlayerLayerView playerLayer](self, "playerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoRect");
  x = v4;
  y = v6;
  width = v8;
  height = v10;

  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  if (CGRectIsEmpty(v38))
  {
    -[__AVPlayerLayerView bounds](self, "bounds");
    if (!CGRectIsEmpty(v39))
    {
      -[__AVPlayerLayerView playerController](self, "playerController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentDimensions");
      if (v14 != *MEMORY[0x1E0C9D820] || v13 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        -[__AVPlayerLayerView playerController](self, "playerController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "contentDimensions");

        if (-[__AVPlayerLayerView videoGravity](self, "videoGravity") != 1)
        {
          -[__AVPlayerLayerView bounds](self, "bounds");
          x = v29;
          y = v30;
          width = v31;
          height = v32;
          goto LABEL_11;
        }
        -[__AVPlayerLayerView playerController](self, "playerController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "contentDimensions");
        v18 = v17;
        v20 = v19;
        -[__AVPlayerLayerView bounds](self, "bounds");
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v37.width = v18;
        v37.height = v20;
        v42.origin.x = v22;
        v42.origin.y = v24;
        v42.size.width = v26;
        v42.size.height = v28;
        v40 = AVMakeRectWithAspectRatioInsideRect(v37, v42);
        x = v40.origin.x;
        y = v40.origin.y;
        width = v40.size.width;
        height = v40.size.height;
      }

    }
  }
LABEL_11:
  v33 = x;
  v34 = y;
  v35 = width;
  v36 = height;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (int64_t)videoGravity
{
  void *v2;
  void *v3;
  int64_t v4;

  -[__AVPlayerLayerView playerLayer](self, "playerLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoGravity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AVVideoGravityFromString(v3);

  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (id)keyPathsForValuesAffectingVideoBounds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("playerLayer.videoRect"), CFSTR("bounds"), CFSTR("playerController.contentDimensions"), CFSTR("videoGravity"), 0);
}

+ (id)keyPathsForValuesAffectingReadyForDisplay
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("playerLayer.readyForDisplay"));
}

- (void)setPlayerController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AVPlayerController *v9;

  v9 = (AVPlayerController *)a3;
  if (self->_playerController != v9)
  {
    objc_storeStrong((id *)&self->_playerController, a3);
    -[__AVPlayerLayerView playerLayer](self, "playerLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerController player](v9, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlayer:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[__AVPlayerLayerView pictureInPicturePlayerLayerView](self, "pictureInPicturePlayerLayerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

  }
}

- (BOOL)isReadyForDisplay
{
  void *v2;
  char v3;

  -[__AVPlayerLayerView playerLayer](self, "playerLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReadyForDisplay");

  return v3;
}

- (void)setPixelBufferAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[__AVPlayerLayerView playerLayer](self, "playerLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPixelBufferAttributes:", v4);

}

- (AVPictureInPicturePlayerLayerView)pictureInPicturePlayerLayerView
{
  AVPictureInPicturePlayerLayerView *pictureInPicturePlayerLayerView;
  AVPictureInPicturePlayerLayerView *v4;
  AVPictureInPicturePlayerLayerView *v5;
  AVPictureInPicturePlayerLayerView *v6;

  pictureInPicturePlayerLayerView = self->_pictureInPicturePlayerLayerView;
  if (!pictureInPicturePlayerLayerView)
  {
    v4 = [AVPictureInPicturePlayerLayerView alloc];
    v5 = -[AVPictureInPicturePlayerLayerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_pictureInPicturePlayerLayerView;
    self->_pictureInPicturePlayerLayerView = v5;

    pictureInPicturePlayerLayerView = self->_pictureInPicturePlayerLayerView;
  }
  return pictureInPicturePlayerLayerView;
}

- (void)setVideoGravity:(int64_t)a3
{
  void *v4;
  id v5;

  -[__AVPlayerLayerView playerLayer](self, "playerLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromVideoGravity(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVideoGravity:", v4);

}

+ (id)keyPathsForValuesAffectingPlayerLayer
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("layer"));
}

- (CGSize)videoDisplaySize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[__AVPlayerLayerView pictureInPicturePlayerLayer](self, "pictureInPicturePlayerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoRect");
  v5 = v4;
  v7 = v6;

  if (v5 == *MEMORY[0x1E0C9D820] && v7 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[__AVPlayerLayerView videoBounds](self, "videoBounds");
    v5 = v9;
    v7 = v10;
  }
  v11 = v5;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (AVPlayerLayer)pictureInPicturePlayerLayer
{
  return self->_pictureInPicturePlayerLayer;
}

+ (id)keyPathsForValuesAffectingVideoGravity
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("playerLayer.videoGravity"));
}

+ (id)keyPathsForValuesAffectingVideoDisplaySize
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("videoBounds"), CFSTR("pictureInPicturePlayerLayer.videoRect"), 0);
}

+ (id)keyPathsForValuesAffectingVideoScaled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("videoGravity"));
}

+ (id)keyPathsForValuesAffectingPixelBufferAttributes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("playerLayer.pixelBufferAttributes"));
}

- (BOOL)isVideoScaled
{
  return -[__AVPlayerLayerView videoGravity](self, "videoGravity") == 2;
}

- (void)setVideoScaled:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 1;
  -[__AVPlayerLayerView setVideoGravity:](self, "setVideoGravity:", v3);
}

- (NSDictionary)pixelBufferAttributes
{
  void *v2;
  void *v3;

  -[__AVPlayerLayerView playerLayer](self, "playerLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pixelBufferAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)startRoutingVideoToPictureInPicturePlayerLayerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[5];

  -[__AVPlayerLayerView pictureInPicturePlayerLayerView](self, "pictureInPicturePlayerLayerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachPlayerLayer");

  -[__AVPlayerLayerView pictureInPicturePlayerLayerView](self, "pictureInPicturePlayerLayerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[__AVPlayerLayerView setPictureInPicturePlayerLayer:](self, "setPictureInPicturePlayerLayer:", v5);

  -[__AVPlayerLayerView playerLayer](self, "playerLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[__AVPlayerLayerView pictureInPicturePlayerLayerView](self, "pictureInPicturePlayerLayerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startRedirectingVideoToLayer:forMode:", v8, 0);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73____AVPlayerLayerView_startRoutingVideoToPictureInPicturePlayerLayerView__block_invoke;
  block[3] = &unk_1E5BB4CA0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)stopRoutingVideoToPictureInPicturePlayerLayerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[__AVPlayerLayerView pictureInPicturePlayerLayerView](self, "pictureInPicturePlayerLayerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[__AVPlayerLayerView playerLayer](self, "playerLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[__AVPlayerLayerView pictureInPicturePlayerLayerView](self, "pictureInPicturePlayerLayerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopRedirectingVideoToLayer:", v7);

    -[__AVPlayerLayerView playerLayer](self, "playerLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v8, "isLegibleDisplayEnabled");

    if ((_DWORD)v6)
    {
      -[__AVPlayerLayerView playerLayer](self, "playerLayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLegibleDisplayEnabled:", 0);

      -[__AVPlayerLayerView playerLayer](self, "playerLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLegibleDisplayEnabled:", 1);

    }
    -[__AVPlayerLayerView pictureInPicturePlayerLayerView](self, "pictureInPicturePlayerLayerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playerLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLegibleDisplayEnabled:", 1);

  }
  -[__AVPlayerLayerView setPictureInPicturePlayerLayer:](self, "setPictureInPicturePlayerLayer:", 0);
  -[__AVPlayerLayerView pictureInPicturePlayerLayerView](self, "pictureInPicturePlayerLayerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "detachPlayerLayer");

  -[__AVPlayerLayerView playerLayer](self, "playerLayer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPlaceholderContentLayerDuringPIPMode:", 0);

}

- (void)setPictureInPicturePlayerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_pictureInPicturePlayerLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureInPicturePlayerLayer, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_pictureInPicturePlayerLayerView, 0);
}

@end
