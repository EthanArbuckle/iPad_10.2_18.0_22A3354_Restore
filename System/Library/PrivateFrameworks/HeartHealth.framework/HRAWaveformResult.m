@implementation HRAWaveformResult

- (HRAWaveformResult)initWithSamples:(const float *)a3 count:(unint64_t)a4 samplingRate:(float)a5 startDate:(double)a6 heartRate:(id)a7 classification:(unint64_t)a8
{
  HRAWaveformResult *v10;
  uint64_t v11;
  NSData *sampleData;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HRAWaveformResult;
  v10 = -[HRAWaveformResult init](&v14, sel_init, a3, a4, a7, a8);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, a4);
    v11 = objc_claimAutoreleasedReturnValue();
    sampleData = v10->_sampleData;
    v10->_sampleData = (NSData *)v11;

  }
  return v10;
}

- (unint64_t)classification
{
  return self->_classification;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (float)samplingFrequencyHz
{
  return self->_samplingFrequencyHz;
}

- (NSData)sampleData
{
  return self->_sampleData;
}

- (NSNumber)heartRateBPM
{
  return self->_heartRateBPM;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateBPM, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_sampleData, 0);
}

@end
