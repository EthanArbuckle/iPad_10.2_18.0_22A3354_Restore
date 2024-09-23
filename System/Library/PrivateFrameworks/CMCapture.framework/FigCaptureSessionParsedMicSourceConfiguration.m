@implementation FigCaptureSessionParsedMicSourceConfiguration

- (_QWORD)initWithMicConnectionConfigurations:(void *)a3 cameraConfigurationForStereoAudioCapture:(void *)a4 movieFileVideoConnectionConfigurationForStereoAudioCapture:
{
  _QWORD *v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)FigCaptureSessionParsedMicSourceConfiguration;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  if (v7)
  {
    v7[1] = a2;
    v7[2] = a3;
    v7[3] = a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedMicSourceConfiguration;
  -[FigCaptureSessionParsedMicSourceConfiguration dealloc](&v3, sel_dealloc);
}

- (NSArray)micConnectionConfigurations
{
  return self->_micConnectionConfigurations;
}

- (FigCaptureSourceConfiguration)cameraConfigurationForStereoAudioCapture
{
  return self->_cameraConfigurationForStereoAudioCapture;
}

- (FigVideoCaptureConnectionConfiguration)movieFileVideoConnectionConfigurationForStereoAudioCapture
{
  return self->_movieFileVideoConnectionConfigurationForStereoAudioCapture;
}

@end
