@implementation BWStartupCalibrationAnalyticsPayload

- (BWStartupCalibrationAnalyticsPayload)init
{
  BWStartupCalibrationAnalyticsPayload *v2;
  BWStartupCalibrationAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStartupCalibrationAnalyticsPayload;
  v2 = -[BWStartupCalibrationAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWStartupCalibrationAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStartupCalibrationAnalyticsPayload;
  -[BWStartupCalibrationAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{

  *(_OWORD *)((char *)&self->_maxAcceleration + 1) = 0u;
  *(_OWORD *)&self->_sessionOffset = 0u;
  *(_OWORD *)&self->_portType = 0u;
  *(_QWORD *)&self->_gravityX = 0;
  *(_QWORD *)&self->_gravityZ = 0;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.StartupCalibration");
}

- (id)eventDictionary
{
  void *v3;
  double v4;
  void *v5;
  NSString *portType;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = v3;
  portType = self->_portType;
  if (portType)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", portType, CFSTR("portType"));
  *(float *)&v4 = self->_accelStandardDeviation;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4), CFSTR("accelStd"));
  *(float *)&v7 = self->_gyroStandardDeviation;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7), CFSTR("gyroStd"));
  *(float *)&v8 = self->_sessionOffset;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8), CFSTR("sessionOffset"));
  *(float *)&v9 = self->_deltaOffset;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9), CFSTR("deltaOffset"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_apsVoltage), CFSTR("apsVoltage"));
  *(float *)&v10 = self->_maxAcceleration;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10), CFSTR("maxAccel"));
  *(float *)&v11 = self->_deltaAcceleration;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11), CFSTR("deltaAccel"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_headroomErrorOccurred), CFSTR("headroomErrorOccurred"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_convergeErrorOccurred), CFSTR("convergeErrorOccurred"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_motionErrorOccurred), CFSTR("motionErrorOccurred"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_confidenceErrorOccurred), CFSTR("confidenceErrorOccurred"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_largeOffsetErrorOccurred), CFSTR("largeOffsetErrorOccurred"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_saturationErrorOccurred), CFSTR("saturationErrorOccurred"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_success), CFSTR("successOccurred"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_gcolEntry), CFSTR("gcolEntry"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_closedLoopEntry), CFSTR("closedLoopEntry"));
  *(float *)&v12 = self->_gravityX;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12), CFSTR("gravityX"));
  *(float *)&v13 = self->_gravityY;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13), CFSTR("gravityY"));
  *(float *)&v14 = self->_gravityZ;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14), CFSTR("gravityZ"));
  *(float *)&v15 = self->_completionTime;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15), CFSTR("completionTime"));
  return v5;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (float)accelStandardDeviation
{
  return self->_accelStandardDeviation;
}

- (void)setAccelStandardDeviation:(float)a3
{
  self->_accelStandardDeviation = a3;
}

- (float)gyroStandardDeviation
{
  return self->_gyroStandardDeviation;
}

- (void)setGyroStandardDeviation:(float)a3
{
  self->_gyroStandardDeviation = a3;
}

- (float)sessionOffset
{
  return self->_sessionOffset;
}

- (void)setSessionOffset:(float)a3
{
  self->_sessionOffset = a3;
}

- (float)deltaOffset
{
  return self->_deltaOffset;
}

- (void)setDeltaOffset:(float)a3
{
  self->_deltaOffset = a3;
}

- (int)apsVoltage
{
  return self->_apsVoltage;
}

- (void)setApsVoltage:(int)a3
{
  self->_apsVoltage = a3;
}

- (float)maxAcceleration
{
  return self->_maxAcceleration;
}

- (void)setMaxAcceleration:(float)a3
{
  self->_maxAcceleration = a3;
}

- (float)deltaAcceleration
{
  return self->_deltaAcceleration;
}

- (void)setDeltaAcceleration:(float)a3
{
  self->_deltaAcceleration = a3;
}

- (BOOL)headroomErrorOccurred
{
  return self->_headroomErrorOccurred;
}

- (void)setHeadroomErrorOccurred:(BOOL)a3
{
  self->_headroomErrorOccurred = a3;
}

- (BOOL)convergeErrorOccurred
{
  return self->_convergeErrorOccurred;
}

- (void)setConvergeErrorOccurred:(BOOL)a3
{
  self->_convergeErrorOccurred = a3;
}

- (BOOL)motionErrorOccurred
{
  return self->_motionErrorOccurred;
}

- (void)setMotionErrorOccurred:(BOOL)a3
{
  self->_motionErrorOccurred = a3;
}

- (BOOL)confidenceErrorOccurred
{
  return self->_confidenceErrorOccurred;
}

- (void)setConfidenceErrorOccurred:(BOOL)a3
{
  self->_confidenceErrorOccurred = a3;
}

- (BOOL)largeOffsetErrorOccurred
{
  return self->_largeOffsetErrorOccurred;
}

- (void)setLargeOffsetErrorOccurred:(BOOL)a3
{
  self->_largeOffsetErrorOccurred = a3;
}

- (BOOL)saturationErrorOccurred
{
  return self->_saturationErrorOccurred;
}

- (void)setSaturationErrorOccurred:(BOOL)a3
{
  self->_saturationErrorOccurred = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)gcolEntry
{
  return self->_gcolEntry;
}

- (void)setGcolEntry:(BOOL)a3
{
  self->_gcolEntry = a3;
}

- (BOOL)closedLoopEntry
{
  return self->_closedLoopEntry;
}

- (void)setClosedLoopEntry:(BOOL)a3
{
  self->_closedLoopEntry = a3;
}

- (float)gravityX
{
  return self->_gravityX;
}

- (void)setGravityX:(float)a3
{
  self->_gravityX = a3;
}

- (float)gravityY
{
  return self->_gravityY;
}

- (void)setGravityY:(float)a3
{
  self->_gravityY = a3;
}

- (float)gravityZ
{
  return self->_gravityZ;
}

- (void)setGravityZ:(float)a3
{
  self->_gravityZ = a3;
}

- (float)completionTime
{
  return self->_completionTime;
}

- (void)setCompletionTime:(float)a3
{
  self->_completionTime = a3;
}

@end
