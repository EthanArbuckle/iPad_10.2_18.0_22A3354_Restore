@implementation HRAWaveformProcessor

- (HRAWaveformProcessor)initWithMinimumUsableDuration:(double)a3 minimumContinuousUsableDuration:(double)a4 minimumSaveableDuration:(double)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HRAWaveformProcessor;
  return -[HRAWaveformProcessor init](&v6, sel_init, a3, a4, a5);
}

- (id)processWaveform:(id)a3
{
  return 0;
}

- (id)processSamples:(const float *)a3 flags:(const char *)a4 count:(unint64_t)a5 samplingRate:(float)a6 startDate:(id)a7
{
  id v10;
  HRAWaveformResult *v11;
  double v12;
  double v13;
  double v14;

  v10 = a7;
  v11 = [HRAWaveformResult alloc];
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v13 = v12;

  *(float *)&v14 = a6;
  return -[HRAWaveformResult initWithSamples:count:samplingRate:startDate:heartRate:classification:](v11, "initWithSamples:count:samplingRate:startDate:heartRate:classification:", a3, a5, &unk_1E9C2EA40, 2, v14, v13);
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (HRAWaveformProcessorLoggingDelegate)logDelegate
{
  return (HRAWaveformProcessorLoggingDelegate *)objc_loadWeakRetained((id *)&self->_logDelegate);
}

- (void)setLogDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_logDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_logDelegate);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
