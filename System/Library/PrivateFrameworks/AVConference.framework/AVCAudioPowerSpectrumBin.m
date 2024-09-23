@implementation AVCAudioPowerSpectrumBin

- (void)encodeWithCoder:(id)a3
{
  double v3;
  double v6;
  double v7;

  *(float *)&v3 = self->_minFrequency;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("minFrequency"), v3);
  *(float *)&v6 = self->_maxFrequency;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("maxFrequency"), v6);
  *(float *)&v7 = self->_powerLevel;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("powerLevel"), v7);
}

- (AVCAudioPowerSpectrumBin)initWithCoder:(id)a3
{
  AVCAudioPowerSpectrumBin *v4;
  float v5;
  float v6;
  float v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)AVCAudioPowerSpectrumBin;
  v4 = -[AVCAudioPowerSpectrumBin init](&v9, sel_init);
  if (v4)
  {
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("minFrequency"));
    v4->_minFrequency = v5;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("maxFrequency"));
    v4->_maxFrequency = v6;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("powerLevel"));
    v4->_powerLevel = v7;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)minFrequency
{
  return self->_minFrequency;
}

- (float)maxFrequency
{
  return self->_maxFrequency;
}

- (float)powerLevel
{
  return self->_powerLevel;
}

- (void)assign:(const _VCAudioPowerSpectrumEntry *)a3
{
  *(_VCAudioPowerSpectrumEntry *)&self->_minFrequency = *a3;
}

@end
