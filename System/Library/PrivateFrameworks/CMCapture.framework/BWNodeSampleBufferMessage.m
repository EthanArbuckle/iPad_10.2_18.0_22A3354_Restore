@implementation BWNodeSampleBufferMessage

- (_QWORD)_initWithSampleBuffer:(void *)a3 stillImageSettings:(void *)a4 recordingSettings:
{
  _QWORD *v7;
  _QWORD *v8;
  CFTypeRef v9;
  int *v10;
  objc_super v12;

  if (!a1)
    return 0;
  v12.receiver = a1;
  v12.super_class = (Class)BWNodeSampleBufferMessage;
  v7 = objc_msgSendSuper2(&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7[1] = 0x100000002;
    if (a2)
      v9 = CFRetain(a2);
    else
      v9 = 0;
    v8[2] = v9;
    if (a3)
    {
      v10 = &OBJC_IVAR___BWNodeSampleBufferMessage__stillImageSettings;
LABEL_10:
      *(_QWORD *)((char *)v8 + *v10) = a3;
      return v8;
    }
    if (a4)
    {
      v10 = &OBJC_IVAR___BWNodeSampleBufferMessage__recordingSettings;
      a3 = a4;
      goto LABEL_10;
    }
  }
  return v8;
}

+ (id)newMessageWithSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return -[BWNodeSampleBufferMessage _initWithSampleBuffer:stillImageSettings:recordingSettings:]([BWNodeSampleBufferMessage alloc], a3, 0, 0);
}

- (void)dealloc
{
  opaqueCMSampleBuffer *sampleBuffer;
  objc_super v4;

  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer)
    CFRelease(sampleBuffer);

  v4.receiver = self;
  v4.super_class = (Class)BWNodeSampleBufferMessage;
  -[BWNodeSampleBufferMessage dealloc](&v4, sel_dealloc);
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

+ (id)newMessageWithSampleBuffer:(opaqueCMSampleBuffer *)a3 stillImageSettings:(id)a4
{
  return -[BWNodeSampleBufferMessage _initWithSampleBuffer:stillImageSettings:recordingSettings:]([BWNodeSampleBufferMessage alloc], a3, a4, 0);
}

+ (id)newMessageWithSampleBuffer:(opaqueCMSampleBuffer *)a3 recordingSettings:(id)a4
{
  return -[BWNodeSampleBufferMessage _initWithSampleBuffer:stillImageSettings:recordingSettings:]([BWNodeSampleBufferMessage alloc], a3, 0, a4);
}

- (FigCaptureStillImageSettings)stillImageSettings
{
  return self->_stillImageSettings;
}

- (FigCaptureRecordingSettings)recordingSettings
{
  return self->_recordingSettings;
}

@end
