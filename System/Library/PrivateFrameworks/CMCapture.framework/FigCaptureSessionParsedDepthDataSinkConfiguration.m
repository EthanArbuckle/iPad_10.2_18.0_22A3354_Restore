@implementation FigCaptureSessionParsedDepthDataSinkConfiguration

- (_QWORD)initWithDepthDataConnectionConfiguration:(void *)a3 videoDataConnectionConfiguration:(void *)a4 metadataObjectConnectionConfiguration:
{
  _QWORD *v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)FigCaptureSessionParsedDepthDataSinkConfiguration;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  if (v7)
  {
    v7[1] = a2;
    v7[2] = a3;
    v7[3] = a4;
  }
  return v7;
}

- (FigVideoCaptureConnectionConfiguration)videoDataConnectionConfiguration
{
  return self->_videoDataConnectionConfiguration;
}

- (FigMetadataObjectCaptureConnectionConfiguration)metadataObjectConnectionConfiguration
{
  return self->_metadataObjectConnectionConfiguration;
}

- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration
{
  return self->_depthDataConnectionConfiguration;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedDepthDataSinkConfiguration;
  -[FigCaptureSessionParsedDepthDataSinkConfiguration dealloc](&v3, sel_dealloc);
}

@end
