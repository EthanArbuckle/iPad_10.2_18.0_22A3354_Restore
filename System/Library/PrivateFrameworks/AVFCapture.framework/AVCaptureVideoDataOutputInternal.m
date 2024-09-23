@implementation AVCaptureVideoDataOutputInternal

- (AVCaptureVideoDataOutputInternal)init
{
  AVCaptureVideoDataOutputInternal *v2;
  AVCaptureVideoDataOutputInternal *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVCaptureVideoDataOutputInternal;
  v2 = -[AVCaptureVideoDataOutputInternal init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&v2->deprecatedMinFrameDuration.value = *MEMORY[0x1E0CA2E18];
    v2->deprecatedMinFrameDuration.epoch = *(_QWORD *)(v4 + 16);
    v2->alwaysDiscardsLateVideoFrames = 1;
    v2->delegateCallbackHelper = -[AVCaptureDataOutputDelegateCallbackHelper initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:]([AVCaptureDataOutputDelegateCallbackHelper alloc], "initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:", CFSTR("com.apple.avfoundation.videodataoutput.queue"), 0);
    FigFlatDictionaryGetMakerNoteKeySpace();
    v3->automaticallyConfiguresOutputBufferDimensions = 1;
    if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureMultipleVideoDataOutputsSupported")))
      v3->videoSettingsDimensionsOverrideEnabled = 1;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureVideoDataOutputInternal;
  -[AVCaptureVideoDataOutputInternal dealloc](&v3, sel_dealloc);
}

@end
