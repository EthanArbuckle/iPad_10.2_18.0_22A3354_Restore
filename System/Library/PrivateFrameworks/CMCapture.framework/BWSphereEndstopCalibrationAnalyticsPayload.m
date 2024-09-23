@implementation BWSphereEndstopCalibrationAnalyticsPayload

- (BWSphereEndstopCalibrationAnalyticsPayload)init
{
  BWSphereEndstopCalibrationAnalyticsPayload *v2;
  BWSphereEndstopCalibrationAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWSphereEndstopCalibrationAnalyticsPayload;
  v2 = -[BWSphereEndstopCalibrationAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWSphereEndstopCalibrationAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSphereEndstopCalibrationAnalyticsPayload;
  -[BWSphereEndstopCalibrationAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  __int128 v3;

  self->_magneticFieldMagnitude = -1;

  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  *(_OWORD *)&self->_deltaSphereYPosEndstop = v3;
  *(_OWORD *)&self->_sphereYNegEndstop = v3;
  *(_OWORD *)&self->_calibrationStatus = v3;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.SphereEndstopCalibration");
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
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereXPosEndstop), CFSTR("xPosEndstop"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereXNegEndstop), CFSTR("xNegEndstop"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereYPosEndstop), CFSTR("yPosEndstop"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereYNegEndstop), CFSTR("yNegEndstop"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deltaSphereXPosEndstop), CFSTR("deltaXPosEndstop"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deltaSphereXNegEndstop), CFSTR("deltaXNegEndstop"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deltaSphereYPosEndstop), CFSTR("deltaYPosEndstop"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deltaSphereYNegEndstop), CFSTR("deltaYNegEndstop"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereXStroke), CFSTR("xStroke"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sphereYStroke), CFSTR("yStroke"));
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

- (int)sphereXPosEndstop
{
  return self->_sphereXPosEndstop;
}

- (void)setSphereXPosEndstop:(int)a3
{
  self->_sphereXPosEndstop = a3;
}

- (int)sphereXNegEndstop
{
  return self->_sphereXNegEndstop;
}

- (void)setSphereXNegEndstop:(int)a3
{
  self->_sphereXNegEndstop = a3;
}

- (int)sphereYPosEndstop
{
  return self->_sphereYPosEndstop;
}

- (void)setSphereYPosEndstop:(int)a3
{
  self->_sphereYPosEndstop = a3;
}

- (int)sphereYNegEndstop
{
  return self->_sphereYNegEndstop;
}

- (void)setSphereYNegEndstop:(int)a3
{
  self->_sphereYNegEndstop = a3;
}

- (int)deltaSphereXPosEndstop
{
  return self->_deltaSphereXPosEndstop;
}

- (void)setDeltaSphereXPosEndstop:(int)a3
{
  self->_deltaSphereXPosEndstop = a3;
}

- (int)deltaSphereXNegEndstop
{
  return self->_deltaSphereXNegEndstop;
}

- (void)setDeltaSphereXNegEndstop:(int)a3
{
  self->_deltaSphereXNegEndstop = a3;
}

- (int)deltaSphereYPosEndstop
{
  return self->_deltaSphereYPosEndstop;
}

- (void)setDeltaSphereYPosEndstop:(int)a3
{
  self->_deltaSphereYPosEndstop = a3;
}

- (int)deltaSphereYNegEndstop
{
  return self->_deltaSphereYNegEndstop;
}

- (void)setDeltaSphereYNegEndstop:(int)a3
{
  self->_deltaSphereYNegEndstop = a3;
}

- (int)sphereXStroke
{
  return self->_sphereXStroke;
}

- (void)setSphereXStroke:(int)a3
{
  self->_sphereXStroke = a3;
}

- (int)sphereYStroke
{
  return self->_sphereYStroke;
}

- (void)setSphereYStroke:(int)a3
{
  self->_sphereYStroke = a3;
}

@end
