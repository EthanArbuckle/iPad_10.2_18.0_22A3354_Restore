@implementation VCAudioPowerSpectrumBin

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%f;%f;%f]"),
               self->_powerLevel,
               self->_frequencyRange.min,
               self->_frequencyRange.max);
}

- (VCAudioPowerSpectrumBin)initWithFrequencyRange:(_VCRange)a3
{
  float max;
  float min;
  VCAudioPowerSpectrumBin *result;
  objc_super v6;
  uint64_t v7;

  max = a3.max;
  min = a3.min;
  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCAudioPowerSpectrumBin;
  result = -[VCAudioPowerSpectrumBin init](&v6, sel_init);
  if (result)
  {
    result->_powerLevel = -120.0;
    result->_frequencyRange.min = min;
    result->_frequencyRange.max = max;
  }
  return result;
}

- (_VCRange)frequencyRange
{
  float min;
  float max;
  _VCRange result;

  min = self->_frequencyRange.min;
  max = self->_frequencyRange.max;
  result.max = max;
  result.min = min;
  return result;
}

- (void)setFrequencyRange:(_VCRange)a3
{
  self->_frequencyRange = a3;
}

- (float)powerLevel
{
  return self->_powerLevel;
}

- (void)setPowerLevel:(float)a3
{
  self->_powerLevel = a3;
}

@end
