@implementation HFCameraPlaybackEngineObservationState

- (HFCameraPlaybackEngineObservationOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (id)timeObservationToken
{
  return self->_timeObservationToken;
}

- (void)setTimeObservationToken:(id)a3
{
  objc_storeStrong(&self->_timeObservationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeObservationToken, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
