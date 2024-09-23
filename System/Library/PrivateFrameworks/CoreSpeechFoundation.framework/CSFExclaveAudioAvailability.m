@implementation CSFExclaveAudioAvailability

- (CSFExclaveAudioAvailability)initWithNumChannels:(unint64_t)a3 numSamples:(unint64_t)a4 sampleByteDepth:(unint64_t)a5 startSampleCount:(unint64_t)a6 hostTime:(unint64_t)a7 arrivalHostTimeToAudioRecorder:(unint64_t)a8
{
  CSFExclaveAudioAvailability *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CSFExclaveAudioAvailability;
  result = -[CSFExclaveAudioAvailability init](&v15, sel_init);
  if (result)
  {
    result->_numChannels = a3;
    result->_numSamples = a4;
    result->_sampleByteDepth = a5;
    result->_startSampleCount = a6;
    result->_hostTime = a7;
    result->_arrivalHostTimeToAudioRecorder = a8;
  }
  return result;
}

- (unint64_t)numChannels
{
  return self->_numChannels;
}

- (unint64_t)numSamples
{
  return self->_numSamples;
}

- (unint64_t)sampleByteDepth
{
  return self->_sampleByteDepth;
}

- (unint64_t)startSampleCount
{
  return self->_startSampleCount;
}

- (unint64_t)hostTime
{
  return self->_hostTime;
}

- (unint64_t)arrivalHostTimeToAudioRecorder
{
  return self->_arrivalHostTimeToAudioRecorder;
}

@end
