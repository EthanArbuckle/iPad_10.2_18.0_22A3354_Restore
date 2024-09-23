@implementation BWNodeError

- (_QWORD)_initWithError:(void *)a3 sourceNode:(void *)a4 stillImageSettings:(void *)a5 recordingSettings:(void *)a6 metadata:
{
  _QWORD *v11;
  _QWORD *v12;
  unsigned int v13;
  signed int v14;
  objc_super v16;

  if (!a1)
    return 0;
  v16.receiver = a1;
  v16.super_class = (Class)BWNodeError;
  v11 = objc_msgSendSuper2(&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    do
    {
      v13 = __ldxr((unsigned int *)&uniqueIDCount);
      v14 = v13 + 1;
    }
    while (__stxr(v14, (unsigned int *)&uniqueIDCount));
    v11[1] = v14;
    *((_DWORD *)v11 + 4) = a2;
    v11[3] = objc_msgSend((id)objc_msgSend(a3, "description"), "copy");
    v12[4] = a4;
    v12[5] = a5;
    v12[6] = objc_msgSend(a6, "copy");
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNodeError;
  -[BWNodeError dealloc](&v3, sel_dealloc);
}

+ (id)newError:(int)a3 sourceNode:(id)a4
{
  return -[BWNodeError _initWithError:sourceNode:stillImageSettings:recordingSettings:metadata:]([BWNodeError alloc], a3, a4, 0, 0, 0);
}

+ (id)newError:(int)a3 sourceNode:(id)a4 stillImageSettings:(id)a5 metadata:(id)a6
{
  return -[BWNodeError _initWithError:sourceNode:stillImageSettings:recordingSettings:metadata:]([BWNodeError alloc], a3, a4, a5, 0, a6);
}

+ (id)newError:(int)a3 sourceNode:(id)a4 recordingSettings:(id)a5
{
  return -[BWNodeError _initWithError:sourceNode:stillImageSettings:recordingSettings:metadata:]([BWNodeError alloc], a3, a4, 0, a5, 0);
}

- (int)errorCode
{
  return self->_errorCode;
}

- (NSString)sourceNodeDescription
{
  return self->_sourceNodeDescription;
}

- (BWStillImageSettings)stillImageSettings
{
  return self->_stillImageSettings;
}

- (unint64_t)hash
{
  return self->_uniqueID;
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: err:%d captureID:%lld, captureType=%@"), v4, self, self->_errorCode, -[BWStillImageSettings settingsID](self->_stillImageSettings, "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureSettings captureType](-[BWStillImageSettings captureSettings](self->_stillImageSettings, "captureSettings"), "captureType")));
}

- (FigCaptureRecordingSettings)recordingSettings
{
  return self->_recordingSettings;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

@end
