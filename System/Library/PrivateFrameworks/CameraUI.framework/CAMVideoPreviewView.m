@implementation CAMVideoPreviewView

- (CAMVideoPreviewView)initWithFrame:(CGRect)a3
{
  CAMVideoPreviewView *v3;
  id v4;
  uint64_t v5;
  UIView *previewLayerView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMVideoPreviewView;
  v3 = -[CAMVideoPreviewView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[CAMVideoPreviewView _frameForSubviewsAccountForSquare:](v3, "_frameForSubviewsAccountForSquare:", 1);
    v5 = objc_msgSend(v4, "initWithFrame:");
    previewLayerView = v3->_previewLayerView;
    v3->_previewLayerView = (UIView *)v5;

    -[CAMVideoPreviewView addSubview:](v3, "addSubview:", v3->_previewLayerView);
    v3->_previewViewAspectMode = 0;
    -[CAMVideoPreviewView _updateAspectModeForSublayers](v3, "_updateAspectModeForSublayers");
  }
  return v3;
}

- (void)_updateAspectModeForSublayers
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  +[CAMCaptureConversions previewLayerVideoGravityForPreviewViewAspectMode:](CAMCaptureConversions, "previewLayerVideoGravityForPreviewViewAspectMode:", -[CAMVideoPreviewView previewViewAspectMode](self, "previewViewAspectMode"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMVideoPreviewView videoPreviewLayer](self, "videoPreviewLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVideoGravity:", v4);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (int64_t)previewViewAspectMode
{
  return self->_previewViewAspectMode;
}

- (AVCaptureVideoPreviewLayer)videoPreviewLayer
{
  return self->_videoPreviewLayer;
}

- (void)setVideoPreviewLayer:(id)a3
{
  AVCaptureVideoPreviewLayer *v5;
  AVCaptureVideoPreviewLayer **p_videoPreviewLayer;
  AVCaptureVideoPreviewLayer *videoPreviewLayer;
  AVCaptureVideoPreviewLayer *v8;
  void *v9;
  AVCaptureVideoPreviewLayer *v10;

  v5 = (AVCaptureVideoPreviewLayer *)a3;
  p_videoPreviewLayer = &self->_videoPreviewLayer;
  videoPreviewLayer = self->_videoPreviewLayer;
  if (videoPreviewLayer != v5)
  {
    v10 = v5;
    -[AVCaptureVideoPreviewLayer removeFromSuperlayer](videoPreviewLayer, "removeFromSuperlayer");
    objc_storeStrong((id *)&self->_videoPreviewLayer, a3);
    v8 = *p_videoPreviewLayer;
    -[UIView bounds](self->_previewLayerView, "bounds");
    -[AVCaptureVideoPreviewLayer setFrame:](v8, "setFrame:");
    -[UIView layer](self->_previewLayerView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSublayer:", *p_videoPreviewLayer);

    -[CAMVideoPreviewView _updateAspectModeForSublayers](self, "_updateAspectModeForSublayers");
    -[CAMVideoPreviewView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (void)setSquare:(BOOL)a3 animated:(BOOL)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  if (self->_square != a3)
  {
    self->_square = a3;
    if (a4)
    {
      -[CAMVideoPreviewView _frameForSubviewsAccountForSquare:](self, "_frameForSubviewsAccountForSquare:", 1);
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v13 = *MEMORY[0x1E0C9D538];
      v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      -[UIView layer](self->_previewLayerView, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMAnimationHelper animateLayer:toFrame:fromCurrentState:](CAMAnimationHelper, "animateLayer:toFrame:fromCurrentState:", v15, 1, v6, v8, v10, v12);

      +[CAMAnimationHelper animateLayer:toFrame:fromCurrentState:](CAMAnimationHelper, "animateLayer:toFrame:fromCurrentState:", self->_videoPreviewLayer, 1, v13, v14, v10, v12);
    }
    else
    {
      -[CAMVideoPreviewView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setPreviewViewAspectMode:(int64_t)a3
{
  if (self->_previewViewAspectMode != a3)
  {
    self->_previewViewAspectMode = a3;
    -[CAMVideoPreviewView _updateAspectModeForSublayers](self, "_updateAspectModeForSublayers");
  }
}

- (void)layoutSubviews
{
  AVCaptureVideoPreviewLayer *videoPreviewLayer;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CAMVideoPreviewView _frameForSubviewsAccountForSquare:](self, "_frameForSubviewsAccountForSquare:", 1);
  -[UIView setFrame:](self->_previewLayerView, "setFrame:");
  videoPreviewLayer = self->_videoPreviewLayer;
  -[UIView bounds](self->_previewLayerView, "bounds");
  -[AVCaptureVideoPreviewLayer setFrame:](videoPreviewLayer, "setFrame:");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIView layer](self->_previewLayerView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCaptureVideoPreviewLayer superlayer](self->_videoPreviewLayer, "superlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    -[AVCaptureVideoPreviewLayer removeFromSuperlayer](self->_videoPreviewLayer, "removeFromSuperlayer");
  v5.receiver = self;
  v5.super_class = (Class)CAMVideoPreviewView;
  -[CAMVideoPreviewView dealloc](&v5, sel_dealloc);
}

- (void)setSquare:(BOOL)a3
{
  -[CAMVideoPreviewView setSquare:animated:](self, "setSquare:animated:", a3, 0);
}

- (UIView)previewLayerView
{
  return self->_previewLayerView;
}

- (BOOL)isSquare
{
  return self->_square;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewLayerView, 0);
  objc_storeStrong((id *)&self->_videoPreviewLayer, 0);
}

@end
