@implementation FigCaptureSessionParsedMetadataSinkConfiguration

- (_QWORD)initWithMetadataObjectConnectionConfiguration:(void *)a3 sceneClassifierConnectionConfiguration:(void *)a4 videoDataConnectionConfiguration:(void *)a5 videoPreviewSinkConnectionConfiguration:(void *)a6 movieFileVideoConnectionConfiguration:(void *)a7 movieFileDetectedObjectMetadataConnectionConfigurations:
{
  _QWORD *v13;
  objc_super v15;

  if (!a1)
    return 0;
  v15.receiver = a1;
  v15.super_class = (Class)FigCaptureSessionParsedMetadataSinkConfiguration;
  v13 = objc_msgSendSuper2(&v15, sel_init);
  if (v13)
  {
    v13[1] = a2;
    v13[2] = a3;
    v13[3] = a4;
    v13[4] = a5;
    v13[5] = a6;
    v13[6] = a7;
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedMetadataSinkConfiguration;
  -[FigCaptureSessionParsedMetadataSinkConfiguration dealloc](&v3, sel_dealloc);
}

- (FigMetadataObjectCaptureConnectionConfiguration)metadataObjectConnectionConfiguration
{
  return self->_metadataObjectConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)sceneClassifierConnectionConfiguration
{
  return self->_sceneClassifierConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)videoPreviewSinkConnectionConfiguration
{
  return self->_videoPreviewSinkConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)videoDataConnectionConfiguration
{
  return self->_videoDataConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)movieFileVideoConnectionConfiguration
{
  return self->_movieFileVideoConnectionConfiguration;
}

- (NSArray)movieFileDetectedObjectMetadataConnectionConfigurations
{
  return self->_movieFileDetectedObjectMetadataConnectionConfigurations;
}

@end
