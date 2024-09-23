@implementation BCSPreviewContainerView

- (void)setPreviewLayer:(id)a3
{
  AVCaptureVideoPreviewLayer *v5;
  AVCaptureVideoPreviewLayer **p_previewLayer;
  void *v7;
  AVCaptureVideoPreviewLayer *v8;

  v5 = (AVCaptureVideoPreviewLayer *)a3;
  p_previewLayer = &self->_previewLayer;
  if (self->_previewLayer != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_previewLayer, a3);
    -[AVCaptureVideoPreviewLayer setVideoGravity:](*p_previewLayer, "setVideoGravity:", *MEMORY[0x24BDB1C80]);
    -[BCSPreviewContainerView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", *p_previewLayer);

    v5 = v8;
  }

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

  v12.receiver = self;
  v12.super_class = (Class)BCSPreviewContainerView;
  -[BCSPreviewContainerView layoutSubviews](&v12, sel_layoutSubviews);
  -[BCSPreviewContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BCSPreviewContainerView previewLayer](self, "previewLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewLayer, 0);
}

@end
