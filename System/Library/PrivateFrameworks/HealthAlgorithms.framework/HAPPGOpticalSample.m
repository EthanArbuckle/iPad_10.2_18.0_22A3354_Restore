@implementation HAPPGOpticalSample

- (HAPPGOpticalSample)initWithPPGProcessorOutputSignal:(const void *)a3
{
  HAPPGOpticalSample *v4;
  double v5;
  uint64_t v6;
  NSNumber *normalizedReflectance;
  uint64_t v8;
  NSNumber *estimatedDeviceWhiteNoise;
  uint64_t v10;
  NSNumber *estimatedDevicePinkNoise;
  uint64_t v12;
  NSNumber *backgroundNoise;
  uint64_t v14;
  NSNumber *estimatedDeviceNoiseOffset;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HAPPGOpticalSample;
  v4 = -[HAPPGOpticalSample init](&v17, sel_init);
  v4->_emitter = *((_BYTE *)a3 + 8);
  v4->_photodiodes = *((_BYTE *)a3 + 9);
  v4->_hardwareSetting = *((_BYTE *)a3 + 10);
  v4->_samplingFrequency = *((_WORD *)a3 + 6);
  v4->_timestamp = *(_QWORD *)a3;
  v4->_nominalWavelength = *((_WORD *)a3 + 7);
  v4->_effectiveWavelength = *((float *)a3 + 4);
  if (*((_BYTE *)a3 + 24))
  {
    LODWORD(v5) = *((_DWORD *)a3 + 5);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    normalizedReflectance = v4->_normalizedReflectance;
    v4->_normalizedReflectance = (NSNumber *)v6;

  }
  if (*((_BYTE *)a3 + 36))
  {
    LODWORD(v5) = *((_DWORD *)a3 + 8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    estimatedDeviceWhiteNoise = v4->_estimatedDeviceWhiteNoise;
    v4->_estimatedDeviceWhiteNoise = (NSNumber *)v8;

  }
  if (*((_BYTE *)a3 + 44))
  {
    LODWORD(v5) = *((_DWORD *)a3 + 10);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    estimatedDevicePinkNoise = v4->_estimatedDevicePinkNoise;
    v4->_estimatedDevicePinkNoise = (NSNumber *)v10;

  }
  if (*((_BYTE *)a3 + 52))
  {
    LODWORD(v5) = *((_DWORD *)a3 + 12);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
    v12 = objc_claimAutoreleasedReturnValue();
    backgroundNoise = v4->_backgroundNoise;
    v4->_backgroundNoise = (NSNumber *)v12;

  }
  if (*((_BYTE *)a3 + 60))
  {
    LODWORD(v5) = *((_DWORD *)a3 + 14);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
    v14 = objc_claimAutoreleasedReturnValue();
    estimatedDeviceNoiseOffset = v4->_estimatedDeviceNoiseOffset;
    v4->_estimatedDeviceNoiseOffset = (NSNumber *)v14;

  }
  v4->_saturated = *((_BYTE *)a3 + 28);
  v4->_noiseIsUnreliable = *((_BYTE *)a3 + 29);
  return v4;
}

- (unsigned)emitter
{
  return self->_emitter;
}

- (unsigned)photodiodes
{
  return self->_photodiodes;
}

- (unsigned)hardwareSetting
{
  return self->_hardwareSetting;
}

- (unsigned)nominalWavelength
{
  return self->_nominalWavelength;
}

- (float)effectiveWavelength
{
  return self->_effectiveWavelength;
}

- (unsigned)samplingFrequency
{
  return self->_samplingFrequency;
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (NSNumber)normalizedReflectance
{
  return self->_normalizedReflectance;
}

- (NSNumber)estimatedDeviceWhiteNoise
{
  return self->_estimatedDeviceWhiteNoise;
}

- (NSNumber)estimatedDevicePinkNoise
{
  return self->_estimatedDevicePinkNoise;
}

- (NSNumber)backgroundNoise
{
  return self->_backgroundNoise;
}

- (NSNumber)estimatedDeviceNoiseOffset
{
  return self->_estimatedDeviceNoiseOffset;
}

- (BOOL)saturated
{
  return self->_saturated;
}

- (BOOL)noiseIsUnreliable
{
  return self->_noiseIsUnreliable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedDeviceNoiseOffset, 0);
  objc_storeStrong((id *)&self->_backgroundNoise, 0);
  objc_storeStrong((id *)&self->_estimatedDevicePinkNoise, 0);
  objc_storeStrong((id *)&self->_estimatedDeviceWhiteNoise, 0);
  objc_storeStrong((id *)&self->_normalizedReflectance, 0);
}

@end
