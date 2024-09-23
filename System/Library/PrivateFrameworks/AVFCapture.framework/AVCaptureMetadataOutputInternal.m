@implementation AVCaptureMetadataOutputInternal

- (AVCaptureMetadataOutputInternal)init
{
  AVCaptureMetadataOutputInternal *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureMetadataOutputInternal;
  v2 = -[AVCaptureMetadataOutputInternal init](&v4, sel_init);
  if (v2)
  {
    v2->delegateCallbackHelper = -[AVCaptureDataOutputDelegateCallbackHelper initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:]([AVCaptureDataOutputDelegateCallbackHelper alloc], "initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:", CFSTR("com.apple.avfoundation.metadataoutput.queue"), 0);
    v2->faceTrackingMaxFaces = 0;
    v2->faceTrackingUsesFaceRecognition = MGGetBoolAnswer();
    v2->previousTwoCMTimesByDetectorType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->faceTrackingFailureFieldOfViewModifier = -1.0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureMetadataOutputInternal;
  -[AVCaptureMetadataOutputInternal dealloc](&v3, sel_dealloc);
}

@end
