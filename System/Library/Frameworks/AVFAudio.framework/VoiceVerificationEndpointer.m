@implementation VoiceVerificationEndpointer

- (VoiceVerificationEndpointer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VoiceVerificationEndpointer;
  return -[VoiceVerificationEndpointer init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VoiceVerificationEndpointer;
  -[VoiceVerificationEndpointer dealloc](&v2, sel_dealloc);
}

- (BOOL)configureWithSampleRate:(double)a3 andFrameRate:(unsigned int)a4
{
  return 0;
}

- (BOOL)configureWithASBD:(AudioStreamBasicDescription *)a3 andFrameRate:(unsigned int)a4
{
  return 0;
}

- (int)getStatus:(AudioQueueBuffer *)a3
{
  return 0;
}

- (int)endpointMode
{
  return 1;
}

- (double)startWaitTime
{
  return 0.0;
}

- (double)interspeechWaitTime
{
  return 0.0;
}

- (double)endWaitTime
{
  return 0.0;
}

@end
