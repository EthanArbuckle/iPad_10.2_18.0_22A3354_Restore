@implementation AVCaptureSynchronizedSampleBufferData

+ (void)initialize
{
  objc_opt_class();
}

- (id)_initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 sampleBufferWasDropped:(BOOL)a4
{
  _BOOL4 v5;
  _QWORD *v7;
  AVCaptureSynchronizedSampleBufferDataInternal *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  CMTime v16;
  objc_super v17;
  CMTime v18;

  if (!a3)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v14);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v14);
    return 0;
  }
  v5 = a4;
  memset(&v18, 0, sizeof(v18));
  CMSampleBufferGetPresentationTimeStamp(&v18, a3);
  v17.receiver = self;
  v17.super_class = (Class)AVCaptureSynchronizedSampleBufferData;
  v16 = v18;
  v7 = -[AVCaptureSynchronizedData _initWithTimestamp:](&v17, sel__initWithTimestamp_, &v16);
  if (!v7)
    return v7;
  v8 = objc_alloc_init(AVCaptureSynchronizedSampleBufferDataInternal);
  v7[2] = v8;
  if (!v8)
  {

    return 0;
  }
  *(_QWORD *)(v7[2] + 8) = CFRetain(a3);
  *(_BYTE *)(v7[2] + 16) = v5;
  if (v5)
    *(_QWORD *)(v7[2] + 24) = +[AVCaptureOutput dataDroppedReasonFromSampleBuffer:](AVCaptureOutput, "dataDroppedReasonFromSampleBuffer:", a3);
  v9 = (const __CFString *)*MEMORY[0x1E0D05460];
  *(_BYTE *)(v7[2] + 32) = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05460], 0), "BOOLValue");
  CMRemoveAttachment(a3, v9);
  v10 = (const __CFString *)*MEMORY[0x1E0D05468];
  *(_BYTE *)(v7[2] + 33) = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05468], 0), "BOOLValue");
  CMRemoveAttachment(a3, v10);
  v11 = (const __CFString *)*MEMORY[0x1E0D050B0];
  v12 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D050B0], 0);
  if (v12)
    v13 = objc_msgSend(v12, "intValue");
  else
    v13 = -1;
  *(_DWORD *)(v7[2] + 36) = v13;
  CMRemoveAttachment(a3, v11);
  return v7;
}

- (void)dealloc
{
  AVCaptureSynchronizedSampleBufferDataInternal *internal;
  opaqueCMSampleBuffer *sampleBuffer;
  objc_super v5;

  internal = self->_internal;
  if (internal)
  {
    sampleBuffer = internal->sampleBuffer;
    if (sampleBuffer)
    {
      CFRelease(sampleBuffer);
      internal = self->_internal;
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureSynchronizedSampleBufferData;
  -[AVCaptureSynchronizedData dealloc](&v5, sel_dealloc);
}

- (CMSampleBufferRef)sampleBuffer
{
  return self->_internal->sampleBuffer;
}

- (BOOL)sampleBufferWasDropped
{
  return self->_internal->sampleBufferWasDropped;
}

- (AVCaptureOutputDataDroppedReason)droppedReason
{
  return self->_internal->droppedReason;
}

- (BOOL)hasCorrespondingDepthData
{
  return self->_internal->hasCorrespondingDepthData;
}

- (BOOL)hasCorrespondingVisionData
{
  return self->_internal->hasCorrespondingVisionData;
}

- (int)constituentDeviceCaptureID
{
  return self->_internal->constituentDeviceCaptureID;
}

@end
