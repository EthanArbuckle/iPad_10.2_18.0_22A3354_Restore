@implementation VCMediaStreamRateControlConfig

- (VCMediaStreamRateControlConfig)init
{
  VCMediaStreamRateControlConfig *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamRateControlConfig;
  result = -[VCMediaStreamRateControlConfig init](&v3, sel_init);
  if (result)
    result->_mediaQueue = (tagHANDLE *)0xFFFFFFFFLL;
  return result;
}

- (void)setMediaControlInfoGenerator:(void *)a3
{
  void *mediaControlInfoGenerator;
  void *v6;

  mediaControlInfoGenerator = self->_mediaControlInfoGenerator;
  if (mediaControlInfoGenerator)
    CFRelease(mediaControlInfoGenerator);
  if (a3)
    v6 = (void *)CFRetain(a3);
  else
    v6 = 0;
  self->_mediaControlInfoGenerator = v6;
}

- (void)setVcMediaQueue:(tagVCMediaQueue *)a3
{
  tagVCMediaQueue *vcMediaQueue;
  tagVCMediaQueue *v6;

  vcMediaQueue = self->_vcMediaQueue;
  if (vcMediaQueue != a3)
  {
    if (vcMediaQueue)
      CFRelease(vcMediaQueue);
    if (a3)
      v6 = (tagVCMediaQueue *)CFRetain(a3);
    else
      v6 = 0;
    self->_vcMediaQueue = v6;
  }
}

- (void)dealloc
{
  void *mediaControlInfoGenerator;
  tagVCMediaQueue *vcMediaQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];

  mediaControlInfoGenerator = self->_mediaControlInfoGenerator;
  if (mediaControlInfoGenerator)
    CFRelease(mediaControlInfoGenerator);
  vcMediaQueue = self->_vcMediaQueue;
  if (vcMediaQueue)
    CFRelease(vcMediaQueue);
  v5.receiver = self;
  v5.super_class = (Class)VCMediaStreamRateControlConfig;
  -[VCMediaStreamRateControlConfig dealloc](&v5, sel_dealloc);
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (void)setStatisticsCollector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (AVCBasebandCongestionDetector)basebandCongestionDetector
{
  return self->_basebandCongestionDetector;
}

- (void)setBasebandCongestionDetector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (AVCRateControlFeedbackController)feedbackController
{
  return self->_feedbackController;
}

- (void)setFeedbackController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (VCRateControlMediaController)mediaController
{
  return self->_mediaController;
}

- (void)setMediaController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)shouldCreateMediaControlInfoGenerator
{
  return self->_shouldCreateMediaControlInfoGenerator;
}

- (void)setShouldCreateMediaControlInfoGenerator:(BOOL)a3
{
  self->_shouldCreateMediaControlInfoGenerator = a3;
}

- (BOOL)shouldRegisterMediaControlInfoGeneratorCallbacks
{
  return self->_shouldRegisterMediaControlInfoGeneratorCallbacks;
}

- (void)setShouldRegisterMediaControlInfoGeneratorCallbacks:(BOOL)a3
{
  self->_shouldRegisterMediaControlInfoGeneratorCallbacks = a3;
}

- (void)mediaControlInfoGenerator
{
  return self->_mediaControlInfoGenerator;
}

- (unsigned)mediaControlInfoGeneratorType
{
  return self->_mediaControlInfoGeneratorType;
}

- (void)setMediaControlInfoGeneratorType:(unsigned int)a3
{
  self->_mediaControlInfoGeneratorType = a3;
}

- (double)mediaQueueThrottlingInterval
{
  return self->_mediaQueueThrottlingInterval;
}

- (void)setMediaQueueThrottlingInterval:(double)a3
{
  self->_mediaQueueThrottlingInterval = a3;
}

- (tagHANDLE)mediaQueue
{
  return self->_mediaQueue;
}

- (void)setMediaQueue:(tagHANDLE *)a3
{
  self->_mediaQueue = a3;
}

- (tagVCMediaQueue)vcMediaQueue
{
  return self->_vcMediaQueue;
}

- (unsigned)mediaControlInfoVersion
{
  return self->_mediaControlInfoVersion;
}

- (void)setMediaControlInfoVersion:(unsigned __int8)a3
{
  self->_mediaControlInfoVersion = a3;
}

- (unsigned)mediaControlInfoGeneratorOptions
{
  return self->_mediaControlInfoGeneratorOptions;
}

- (void)setMediaControlInfoGeneratorOptions:(unsigned int)a3
{
  self->_mediaControlInfoGeneratorOptions = a3;
}

@end
