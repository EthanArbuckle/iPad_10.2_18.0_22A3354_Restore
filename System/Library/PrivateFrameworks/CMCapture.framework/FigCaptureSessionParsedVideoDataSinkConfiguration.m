@implementation FigCaptureSessionParsedVideoDataSinkConfiguration

- (FigCaptureSourceConfiguration)cameraConfiguration
{
  return self->_cameraConfiguration;
}

- (id)_setMetadataObjectConnectionConfiguration:(id *)result
{
  id *v3;

  if (result)
  {
    v3 = result;

    result = a2;
    v3[2] = result;
    if (!v3[1])
    {
      v3[3] = (id)objc_msgSend(result, "sourceConfiguration");
      result = (id *)objc_msgSend(v3[2], "underlyingDeviceType");
      *((_DWORD *)v3 + 8) = (_DWORD)result;
    }
  }
  return result;
}

- (int)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (id)initWithVideoDataConnectionConfiguration:(void *)a1
{
  id v3;
  id v4;
  id v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)FigCaptureSessionParsedVideoDataSinkConfiguration;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  v4 = v3;
  if (a2 && v3)
  {
    v5 = a2;
    *((_QWORD *)v4 + 1) = v5;
    *((_QWORD *)v4 + 3) = (id)objc_msgSend(v5, "sourceConfiguration");
    *((_DWORD *)v4 + 8) = objc_msgSend(*((id *)v4 + 1), "underlyingDeviceType");
  }
  return v4;
}

- (FigVideoCaptureConnectionConfiguration)videoDataConnectionConfiguration
{
  return self->_videoDataConnectionConfiguration;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedVideoDataSinkConfiguration;
  -[FigCaptureSessionParsedVideoDataSinkConfiguration dealloc](&v3, sel_dealloc);
}

- (FigMetadataObjectCaptureConnectionConfiguration)metadataObjectConnectionConfiguration
{
  return self->_metadataObjectConnectionConfiguration;
}

@end
