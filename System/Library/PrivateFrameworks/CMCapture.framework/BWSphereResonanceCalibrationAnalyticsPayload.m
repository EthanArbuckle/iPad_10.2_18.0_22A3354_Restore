@implementation BWSphereResonanceCalibrationAnalyticsPayload

- (BWSphereResonanceCalibrationAnalyticsPayload)init
{
  BWSphereResonanceCalibrationAnalyticsPayload *v2;
  BWSphereResonanceCalibrationAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWSphereResonanceCalibrationAnalyticsPayload;
  v2 = -[BWSphereResonanceCalibrationAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWSphereResonanceCalibrationAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSphereResonanceCalibrationAnalyticsPayload;
  -[BWSphereResonanceCalibrationAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  __int128 v3;

  self->_magneticFieldMagnitude = -1;

  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  *(_OWORD *)&self->_deltaSphereXAxisDampingCoefficient = v3;
  *(_OWORD *)&self->_deltaSphereYAxisResonantFrequency = v3;
  *(_OWORD *)&self->_calibrationStatus = v3;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.SphereResonanceCalibration");
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
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereXAxisResonantFrequency), CFSTR("xAxisResonantFrequency"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereYAxisResonantFrequency), CFSTR("yAxisResonantFrequency"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deltaSphereXAxisResonantFrequency), CFSTR("deltaXAxisResonantFrequency"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deltaSphereYAxisResonantFrequency), CFSTR("deltaYAxisResonantFrequency"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereXAxisDampingCoefficient), CFSTR("xAxisDampingCoefficient"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereYAxisDampingCoefficient), CFSTR("yAxisDampingCoefficient"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deltaSphereXAxisDampingCoefficient), CFSTR("deltaXAxisDampingCoefficient"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deltaSphereYAxisDampingCoefficient), CFSTR("deltaYAxisDampingCoefficient"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereXAxisLoopGain), CFSTR("xAxisLoopGain"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereYAxisLoopGain), CFSTR("yAxisLoopGain"));
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)calibrationStatus
{
  return self->_calibrationStatus;
}

- (void)setCalibrationStatus:(unsigned int)a3
{
  self->_calibrationStatus = a3;
}

- (int)sphereXAxisResonantFrequency
{
  return self->_sphereXAxisResonantFrequency;
}

- (void)setSphereXAxisResonantFrequency:(int)a3
{
  self->_sphereXAxisResonantFrequency = a3;
}

- (int)sphereYAxisResonantFrequency
{
  return self->_sphereYAxisResonantFrequency;
}

- (void)setSphereYAxisResonantFrequency:(int)a3
{
  self->_sphereYAxisResonantFrequency = a3;
}

- (int)deltaSphereXAxisResonantFrequency
{
  return self->_deltaSphereXAxisResonantFrequency;
}

- (void)setDeltaSphereXAxisResonantFrequency:(int)a3
{
  self->_deltaSphereXAxisResonantFrequency = a3;
}

- (int)deltaSphereYAxisResonantFrequency
{
  return self->_deltaSphereYAxisResonantFrequency;
}

- (void)setDeltaSphereYAxisResonantFrequency:(int)a3
{
  self->_deltaSphereYAxisResonantFrequency = a3;
}

- (int)sphereXAxisDampingCoefficient
{
  return self->_sphereXAxisDampingCoefficient;
}

- (void)setSphereXAxisDampingCoefficient:(int)a3
{
  self->_sphereXAxisDampingCoefficient = a3;
}

- (int)sphereYAxisDampingCoefficient
{
  return self->_sphereYAxisDampingCoefficient;
}

- (void)setSphereYAxisDampingCoefficient:(int)a3
{
  self->_sphereYAxisDampingCoefficient = a3;
}

- (int)deltaSphereXAxisDampingCoefficient
{
  return self->_deltaSphereXAxisDampingCoefficient;
}

- (void)setDeltaSphereXAxisDampingCoefficient:(int)a3
{
  self->_deltaSphereXAxisDampingCoefficient = a3;
}

- (int)deltaSphereYAxisDampingCoefficient
{
  return self->_deltaSphereYAxisDampingCoefficient;
}

- (void)setDeltaSphereYAxisDampingCoefficient:(int)a3
{
  self->_deltaSphereYAxisDampingCoefficient = a3;
}

- (int)sphereXAxisLoopGain
{
  return self->_sphereXAxisLoopGain;
}

- (void)setSphereXAxisLoopGain:(int)a3
{
  self->_sphereXAxisLoopGain = a3;
}

- (int)sphereYAxisLoopGain
{
  return self->_sphereYAxisLoopGain;
}

- (void)setSphereYAxisLoopGain:(int)a3
{
  self->_sphereYAxisLoopGain = a3;
}

@end
