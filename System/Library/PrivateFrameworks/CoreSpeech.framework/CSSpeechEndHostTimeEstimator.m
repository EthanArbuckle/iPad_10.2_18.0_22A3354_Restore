@implementation CSSpeechEndHostTimeEstimator

- (CSSpeechEndHostTimeEstimator)init
{
  CSSpeechEndHostTimeEstimator *v2;
  CSSpeechEndHostTimeEstimator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSSpeechEndHostTimeEstimator;
  v2 = -[CSSpeechEndHostTimeEstimator init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CSSpeechEndHostTimeEstimator reset](v2, "reset");
  return v3;
}

- (void)reset
{
  self->_endPointNotified = 0;
  self->_lastAudioChunkHostTime = 0;
  self->_trailingSilenceDurationAtEndpoint = 0.0;
  self->_numAudioSampleForwarded = 0;
}

- (void)addNumSamples:(unint64_t)a3 hostTime:(unint64_t)a4
{
  self->_numAudioSampleForwarded += a3;
  self->_lastAudioChunkHostTime = a4;
}

- (void)notifyTrailingSilenceDurationAtEndpoint:(double)a3
{
  os_log_t *v5;
  NSObject *v6;
  double v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  double v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (os_log_t *)MEMORY[0x1E0D18F60];
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[CSSpeechEndHostTimeEstimator notifyTrailingSilenceDurationAtEndpoint:]";
    v11 = 2050;
    v12 = a3;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation: trailingSilenceDuration = %{public}f", (uint8_t *)&v9, 0x16u);
  }
  if (a3 >= 2.5)
  {
    v8 = *v5;
    v7 = 0.0;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = "-[CSSpeechEndHostTimeEstimator notifyTrailingSilenceDurationAtEndpoint:]";
      v11 = 2050;
      v12 = a3;
      v13 = 2050;
      v14 = 0x4004000000000000;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation: TrailingSilenceDuration at endpointer(%{public}f) is longer than threshold(%{public}f), force to make 0", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    v7 = a3;
  }
  self->_trailingSilenceDurationAtEndpoint = v7;
}

- (unint64_t)estimatedSpeechEndHostTime
{
  return -[CSSpeechEndHostTimeEstimator estimatedSpeechEndHostTimeWithLastAudioChunkHostTime:](self, "estimatedSpeechEndHostTimeWithLastAudioChunkHostTime:", self->_lastAudioChunkHostTime);
}

- (unint64_t)estimatedSpeechEndHostTimeWithLastAudioChunkHostTime:(unint64_t)a3
{
  double trailingSilenceDurationAtEndpoint;
  unint64_t v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  trailingSilenceDurationAtEndpoint = self->_trailingSilenceDurationAtEndpoint;
  *(float *)&trailingSilenceDurationAtEndpoint = trailingSilenceDurationAtEndpoint;
  v5 = a3 - objc_msgSend(MEMORY[0x1E0D19118], "secondsToHostTime:", trailingSilenceDurationAtEndpoint);
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[CSSpeechEndHostTimeEstimator estimatedSpeechEndHostTimeWithLastAudioChunkHostTime:]";
    v10 = 2050;
    v11 = a3;
    v12 = 2050;
    v13 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation: lastAudioChunkHostTime = %{public}llu, estimatedSpeechEndHostTime = %{public}llu", (uint8_t *)&v8, 0x20u);
  }
  return v5;
}

- (unint64_t)numAudioSampleForwarded
{
  return self->_numAudioSampleForwarded;
}

- (void)setNumAudioSampleForwarded:(unint64_t)a3
{
  self->_numAudioSampleForwarded = a3;
}

- (unint64_t)lastAudioChunkHostTime
{
  return self->_lastAudioChunkHostTime;
}

- (void)setLastAudioChunkHostTime:(unint64_t)a3
{
  self->_lastAudioChunkHostTime = a3;
}

- (BOOL)endPointNotified
{
  return self->_endPointNotified;
}

- (void)setEndPointNotified:(BOOL)a3
{
  self->_endPointNotified = a3;
}

- (double)trailingSilenceDurationAtEndpoint
{
  return self->_trailingSilenceDurationAtEndpoint;
}

- (void)setTrailingSilenceDurationAtEndpoint:(double)a3
{
  self->_trailingSilenceDurationAtEndpoint = a3;
}

@end
