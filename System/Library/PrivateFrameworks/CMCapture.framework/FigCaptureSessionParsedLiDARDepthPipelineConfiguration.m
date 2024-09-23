@implementation FigCaptureSessionParsedLiDARDepthPipelineConfiguration

- (FigCaptureSessionParsedLiDARDepthPipelineConfiguration)initWithTimeOfFlightCameraConfiguration:(id)a3 depthDataConnectionConfiguration:(id)a4
{
  FigCaptureSessionParsedLiDARDepthPipelineConfiguration *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FigCaptureSessionParsedLiDARDepthPipelineConfiguration;
  v6 = -[FigCaptureSessionParsedLiDARDepthPipelineConfiguration init](&v8, sel_init);
  if (v6)
  {
    v6->_timeOfFlightCameraConfiguration = (FigCaptureSourceConfiguration *)a3;
    v6->_depthDataConnectionConfiguration = (FigDepthDataCaptureConnectionConfiguration *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedLiDARDepthPipelineConfiguration;
  -[FigCaptureSessionParsedLiDARDepthPipelineConfiguration dealloc](&v3, sel_dealloc);
}

- (FigCaptureSourceConfiguration)timeOfFlightCameraConfiguration
{
  return self->_timeOfFlightCameraConfiguration;
}

- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration
{
  return self->_depthDataConnectionConfiguration;
}

@end
