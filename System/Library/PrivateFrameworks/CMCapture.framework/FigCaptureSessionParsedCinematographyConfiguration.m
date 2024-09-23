@implementation FigCaptureSessionParsedCinematographyConfiguration

- (_QWORD)initWithVideoPreviewSinkConnectionConfiguration:(void *)a1
{
  _QWORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)FigCaptureSessionParsedCinematographyConfiguration;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
    v3[1] = a2;
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedCinematographyConfiguration;
  -[FigCaptureSessionParsedCinematographyConfiguration dealloc](&v3, sel_dealloc);
}

- (FigVideoCaptureConnectionConfiguration)videoPreviewSinkConnectionConfiguration
{
  return self->_videoPreviewSinkConnectionConfiguration;
}

@end
