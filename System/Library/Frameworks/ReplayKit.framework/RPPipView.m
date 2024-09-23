@implementation RPPipView

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
  id v11;

  -[RPPipView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[RPPipView previewLayer](self, "previewLayer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)addPreviewLayer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[RPPipView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", 1);

  -[RPPipView setPreviewLayer:](self, "setPreviewLayer:", v4);
  -[RPPipView layer](self, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSublayer:", v4);

}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (void)setPreviewLayer:(id)a3
{
  objc_storeStrong((id *)&self->_previewLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewLayer, 0);
}

@end
