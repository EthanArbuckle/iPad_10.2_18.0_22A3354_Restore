@implementation BWSphereInteractionCalibrationAnalyticsPayload

- (BWSphereInteractionCalibrationAnalyticsPayload)init
{
  BWSphereInteractionCalibrationAnalyticsPayload *v2;
  BWSphereInteractionCalibrationAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWSphereInteractionCalibrationAnalyticsPayload;
  v2 = -[BWSphereInteractionCalibrationAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWSphereInteractionCalibrationAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSphereInteractionCalibrationAnalyticsPayload;
  -[BWSphereInteractionCalibrationAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  self->_magneticFieldMagnitude = -1;

  self->_sphereMacroPosition = -1;
  *(_QWORD *)&self->_calibrationStatus = -1;
  *(_QWORD *)&self->_sphereNeutralPosition = -1;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.SphereInteractionCalibration");
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
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereMacroPositionError), CFSTR("neutralPositionError"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereNeutralPosition), CFSTR("neutralPosition"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereMacroPositionError), CFSTR("macroPositionError"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereMacroPosition), CFSTR("macroPosition"));
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

- (int)sphereNeutralPositionError
{
  return self->_sphereNeutralPositionError;
}

- (void)setSphereNeutralPositionError:(int)a3
{
  self->_sphereNeutralPositionError = a3;
}

- (int)sphereNeutralPosition
{
  return self->_sphereNeutralPosition;
}

- (void)setSphereNeutralPosition:(int)a3
{
  self->_sphereNeutralPosition = a3;
}

- (int)sphereMacroPositionError
{
  return self->_sphereMacroPositionError;
}

- (void)setSphereMacroPositionError:(int)a3
{
  self->_sphereMacroPositionError = a3;
}

- (int)sphereMacroPosition
{
  return self->_sphereMacroPosition;
}

- (void)setSphereMacroPosition:(int)a3
{
  self->_sphereMacroPosition = a3;
}

@end
