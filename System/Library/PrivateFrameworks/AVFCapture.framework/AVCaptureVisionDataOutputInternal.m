@implementation AVCaptureVisionDataOutputInternal

- (AVCaptureVisionDataOutputInternal)init
{
  AVCaptureVisionDataOutputInternal *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureVisionDataOutputInternal;
  v2 = -[AVCaptureVisionDataOutputInternal init](&v4, sel_init);
  if (v2)
    v2->delegateCallbackHelper = -[AVCaptureDataOutputDelegateCallbackHelper initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:]([AVCaptureDataOutputDelegateCallbackHelper alloc], "initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:", CFSTR("com.apple.avfoundation.visiondataoutput.queue"), 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureVisionDataOutputInternal;
  -[AVCaptureVisionDataOutputInternal dealloc](&v3, sel_dealloc);
}

@end
