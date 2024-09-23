@implementation HFCameraPlaybackEngineObservationOptions

+ (HFCameraPlaybackEngineObservationOptions)defaultOptions
{
  return (HFCameraPlaybackEngineObservationOptions *)objc_alloc_init((Class)a1);
}

- (NSNumber)periodicTimeUpdateInterval
{
  return self->_periodicTimeUpdateInterval;
}

- (void)setPeriodicTimeUpdateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicTimeUpdateInterval, 0);
}

@end
