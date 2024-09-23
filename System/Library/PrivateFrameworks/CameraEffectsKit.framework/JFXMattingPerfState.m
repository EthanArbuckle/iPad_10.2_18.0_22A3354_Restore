@implementation JFXMattingPerfState

- (JFXMattingPerfState)initWithStats:(id)a3 signpostToken:(id)a4
{
  id v7;
  PVTaskToken *v8;
  JFXMattingPerfState *v9;
  JFXMattingPerfState *v10;
  objc_super v12;

  v7 = a3;
  v8 = (PVTaskToken *)a4;
  v12.receiver = self;
  v12.super_class = (Class)JFXMattingPerfState;
  v9 = -[JFXMattingPerfState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_captureFrameStats, a3);
    v10->_signpostToken = v8;
  }

  return v10;
}

+ (CGSize)mattingDepthInputSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 640.0;
  v3 = 360.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (JFXCapturePreviewFrameStats)captureFrameStats
{
  return self->_captureFrameStats;
}

- (PVTaskToken)signpostToken
{
  return self->_signpostToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureFrameStats, 0);
}

@end
