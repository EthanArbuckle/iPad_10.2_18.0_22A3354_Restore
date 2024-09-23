@implementation AVCaptureDepthDataOutputInternal

- (AVCaptureDepthDataOutputInternal)init
{
  AVCaptureDepthDataOutputInternal *v2;
  AVCaptureDepthDataOutputInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureDepthDataOutputInternal;
  v2 = -[AVCaptureDepthDataOutputInternal init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->alwaysDiscardsLateDepthData = 257;
    v2->delegateCallbackHelper = -[AVCaptureDataOutputDelegateCallbackHelper initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:]([AVCaptureDataOutputDelegateCallbackHelper alloc], "initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:", CFSTR("com.apple.avfoundation.depthdataoutput.queue"), 0);
    FigFlatDictionaryGetMakerNoteKeySpace();
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDepthDataOutputInternal;
  -[AVCaptureDepthDataOutputInternal dealloc](&v3, sel_dealloc);
}

@end
