@implementation BWAFResonanceCalibrationAnalyticsPayload

- (BWAFResonanceCalibrationAnalyticsPayload)init
{
  BWAFResonanceCalibrationAnalyticsPayload *v2;
  BWAFResonanceCalibrationAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWAFResonanceCalibrationAnalyticsPayload;
  v2 = -[BWAFResonanceCalibrationAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWAFResonanceCalibrationAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWAFResonanceCalibrationAnalyticsPayload;
  -[BWAFResonanceCalibrationAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  __int128 v3;

  self->_magneticFieldMagnitude = -1;

  *(_QWORD *)&self->_afGelModelP1Coefficient = -1;
  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  *(_OWORD *)&self->_deltaAFAxisDampingCoefficient = v3;
  *(_OWORD *)&self->_calibrationStatus = v3;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.AFResonanceCalibration");
}

- (id)eventDictionary
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_magneticFieldMagnitude), CFSTR("magneticFieldMagnitude"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_portType, CFSTR("portType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_calibrationStatus), CFSTR("status"));
  if (!self->_calibrationStatus)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_afAxisResonantFreq), CFSTR("resonantFrequency"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deltaAFAxisResonantFreq), CFSTR("deltaResonantFrequency"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_afAxisDampingCoefficient), CFSTR("dampingCoefficient"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deltaAFAxisDampingCoefficient), CFSTR("deltaDampingCoefficient"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_afLoopGain), CFSTR("loopGain"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_afGelModelD1Coefficient), CFSTR("gelModelD1Coefficient"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_afGelModelD2Coefficient), CFSTR("gelModelD2Coefficient"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_afGelModelP1Coefficient), CFSTR("gelModelP1Coefficient"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_afGelModelP2Coefficient), CFSTR("gelModelP2Coefficient"));
  }
  return v3;
}

- (int64_t)magneticFieldMagnitude
{
  return self->_magneticFieldMagnitude;
}

- (void)setMagneticFieldMagnitude:(int64_t)a3
{
  self->_magneticFieldMagnitude = a3;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unsigned)calibrationStatus
{
  return self->_calibrationStatus;
}

- (void)setCalibrationStatus:(unsigned int)a3
{
  self->_calibrationStatus = a3;
}

- (int)afAxisResonantFreq
{
  return self->_afAxisResonantFreq;
}

- (void)setAfAxisResonantFreq:(int)a3
{
  self->_afAxisResonantFreq = a3;
}

- (int)deltaAFAxisResonantFreq
{
  return self->_deltaAFAxisResonantFreq;
}

- (void)setDeltaAFAxisResonantFreq:(int)a3
{
  self->_deltaAFAxisResonantFreq = a3;
}

- (int)afAxisDampingCoefficient
{
  return self->_afAxisDampingCoefficient;
}

- (void)setAfAxisDampingCoefficient:(int)a3
{
  self->_afAxisDampingCoefficient = a3;
}

- (int)deltaAFAxisDampingCoefficient
{
  return self->_deltaAFAxisDampingCoefficient;
}

- (void)setDeltaAFAxisDampingCoefficient:(int)a3
{
  self->_deltaAFAxisDampingCoefficient = a3;
}

- (int)afLoopGain
{
  return self->_afLoopGain;
}

- (void)setAfLoopGain:(int)a3
{
  self->_afLoopGain = a3;
}

- (int)afGelModelD1Coefficient
{
  return self->_afGelModelD1Coefficient;
}

- (void)setAfGelModelD1Coefficient:(int)a3
{
  self->_afGelModelD1Coefficient = a3;
}

- (int)afGelModelD2Coefficient
{
  return self->_afGelModelD2Coefficient;
}

- (void)setAfGelModelD2Coefficient:(int)a3
{
  self->_afGelModelD2Coefficient = a3;
}

- (int)afGelModelP1Coefficient
{
  return self->_afGelModelP1Coefficient;
}

- (void)setAfGelModelP1Coefficient:(int)a3
{
  self->_afGelModelP1Coefficient = a3;
}

- (int)afGelModelP2Coefficient
{
  return self->_afGelModelP2Coefficient;
}

- (void)setAfGelModelP2Coefficient:(int)a3
{
  self->_afGelModelP2Coefficient = a3;
}

@end
