@implementation AVCaptureAudioDataOutputInternal

- (AVCaptureAudioDataOutputInternal)init
{
  AVCaptureAudioDataOutputInternal *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureAudioDataOutputInternal;
  v2 = -[AVCaptureAudioDataOutputInternal init](&v4, sel_init);
  if (v2)
    v2->delegateCallbackHelper = -[AVCaptureDataOutputDelegateCallbackHelper initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:]([AVCaptureDataOutputDelegateCallbackHelper alloc], "initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:", CFSTR("com.apple.avfoundation.audiodataoutput.queue"), 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureAudioDataOutputInternal;
  -[AVCaptureAudioDataOutputInternal dealloc](&v3, sel_dealloc);
}

@end
