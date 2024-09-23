@implementation CDPUIInheritanceAccessCodeScannerView

- (CDPUIInheritanceAccessCodeScannerView)initWithFrame:(CGRect)a3
{
  CDPUIInheritanceAccessCodeScannerView *v3;
  CDPUIInheritanceAccessCodeScannerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPUIInheritanceAccessCodeScannerView;
  v3 = -[CDPUIInheritanceAccessCodeScannerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CDPUIInheritanceAccessCodeScannerView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  return v4;
}

- (void)didMoveToSuperview
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20DC8F000, a2, OS_LOG_TYPE_ERROR, "\"Error creating capture input: %@\", (uint8_t *)&v2, 0xCu);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDPUIInheritanceAccessCodeScannerView;
  -[CDPUIInheritanceAccessCodeScannerView layoutSubviews](&v3, sel_layoutSubviews);
  -[CDPUIInheritanceAccessCodeScannerView _setupLivePreview](self, "_setupLivePreview");
}

- (void)_setupLivePreview
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"Setting up a live view layer for camera scanner.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__CDPUIInheritanceAccessCodeScannerView__setupLivePreview__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "captureSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startRunning");

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__CDPUIInheritanceAccessCodeScannerView__setupLivePreview__block_invoke_2;
    block[3] = &unk_24C8541C0;
    v5 = v2;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __58__CDPUIInheritanceAccessCodeScannerView__setupLivePreview__block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "previewLayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

}

- (void)_setupPreviewIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"Updating preview layer for the camera scanner.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)_spotOverlayLayerWithBezierRect:(CGRect)a3 CircleRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  double v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, 90.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPath:", v9);
  objc_msgSend(v8, "setUsesEvenOddFillRule:", 1);
  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "setPath:", objc_msgSend(v11, "CGPath"));
  objc_msgSend(v10, "setFillRule:", *MEMORY[0x24BDE5988]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setFillColor:", objc_msgSend(v12, "CGColor"));

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

  objc_msgSend(v10, "setLineWidth:", 2.0);
  LODWORD(v14) = 1060320051;
  objc_msgSend(v10, "setOpacity:", v14);

  return v10;
}

- (CGRect)_circleRectForCenter:(CGPoint)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = a3.x + -90.0;
  v4 = a3.y + -90.0;
  v5 = 180.0;
  v6 = 180.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_bezierRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[CDPUIInheritanceAccessCodeScannerView bounds](self, "bounds");
  v4 = v3 + 2.0;
  -[CDPUIInheritanceAccessCodeScannerView bounds](self, "bounds");
  v6 = v5 + 2.0;
  v7 = -1.0;
  v8 = -1.0;
  v9 = v4;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CDPUIInheritanceAccessCodeScannerView captureSession](self, "captureSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopRunning");

  -[CDPUIInheritanceAccessCodeScannerView setCaptureSession:](self, "setCaptureSession:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CDPUIInheritanceAccessCodeScannerView;
  -[CDPUIInheritanceAccessCodeScannerView dealloc](&v4, sel_dealloc);
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v6 = a4;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CDPUIInheritanceAccessCodeScannerView captureOutput:didOutputMetadataObjects:fromConnection:].cold.1();

  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "type");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 != (id)*MEMORY[0x24BDB1EC8])
    goto LABEL_4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_5;
  v9 = v8;
  objc_msgSend(v9, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length"))
    goto LABEL_10;
  -[CDPUIInheritanceAccessCodeScannerView delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "accessCodeScanner:didScanCode:", self, v13);

  if (v14)
  {
    -[CDPUIInheritanceAccessCodeScannerView captureSession](self, "captureSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopRunning");
LABEL_10:

  }
LABEL_4:

LABEL_5:
}

- (CDPUIInheritanceAccessCodeScannerViewDelegate)delegate
{
  return (CDPUIInheritanceAccessCodeScannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
  objc_storeStrong((id *)&self->_captureSession, a3);
}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (void)setPreviewLayer:(id)a3
{
  objc_storeStrong((id *)&self->_previewLayer, a3);
}

- (CALayer)spotlightLayer
{
  return self->_spotlightLayer;
}

- (void)setSpotlightLayer:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightLayer, a3);
}

- (AVCaptureMetadataOutput)metadataOutput
{
  return self->_metadataOutput;
}

- (void)setMetadataOutput:(id)a3
{
  objc_storeStrong((id *)&self->_metadataOutput, a3);
}

- (CGSize)lastKnownDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_lastKnownDimensions.width;
  height = self->_lastKnownDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastKnownDimensions:(CGSize)a3
{
  self->_lastKnownDimensions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_spotlightLayer, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)captureOutput:didOutputMetadataObjects:fromConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"Camera scanner received an input.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
