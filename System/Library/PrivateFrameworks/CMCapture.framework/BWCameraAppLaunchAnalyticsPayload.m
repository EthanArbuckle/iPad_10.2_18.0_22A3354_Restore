@implementation BWCameraAppLaunchAnalyticsPayload

- (void)setThermalLevel:(int)a3
{
  self->_thermalLevel = a3;
}

- (void)setPrewarmReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setNumberOfGraphStartsDuringLaunch:(int)a3
{
  self->_numberOfGraphStartsDuringLaunch = a3;
}

- (void)setMemoryStatusLevel:(int)a3
{
  self->_memoryStatusLevel = a3;
}

- (void)setLaunchMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setLaunchDuration:(int)a3
{
  self->_launchDuration = a3;
}

- (void)setIspStartDuration:(int)a3
{
  self->_ispStartDuration = a3;
}

- (void)setIsPrewarmed:(BOOL)a3
{
  self->_isPrewarmed = a3;
}

- (void)setIsColdLaunch:(BOOL)a3
{
  self->_isColdLaunch = a3;
}

- (void)setDeviceStolenDuration:(int)a3
{
  self->_deviceStolenDuration = a3;
}

- (void)setDeviceStolenCondition:(int)a3
{
  self->_deviceStolenCondition = a3;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (void)setDeviceIsLocked:(BOOL)a3
{
  self->_deviceIsLocked = a3;
}

- (BWCameraAppLaunchAnalyticsPayload)init
{
  BWCameraAppLaunchAnalyticsPayload *v2;
  BWCameraAppLaunchAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWCameraAppLaunchAnalyticsPayload;
  v2 = -[BWCameraAppLaunchAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWCameraAppLaunchAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)reset
{

  self->_isPrewarmed = 0;
  self->_launchMode = (NSString *)CFSTR("Unknown");
  self->_devicePosition = 0;
  self->_prewarmReason = (NSString *)CFSTR("Unknown");
  *(_OWORD *)&self->_launchDuration = xmmword_1A32B1890;
  self->_deviceIsLocked = 0;
  self->_deviceStolenDuration = 0;
  self->_deviceStolenCondition = 0;
  self->_isColdLaunch = 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWCameraAppLaunchAnalyticsPayload;
  -[BWCameraAppLaunchAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.CameraAppLaunch");
}

- (id)eventDictionary
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPrewarmed), CFSTR("isPrewarmed"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_launchMode, CFSTR("launchMode"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_devicePosition), CFSTR("devicePosition"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_prewarmReason, CFSTR("prewarmReason"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_ispStartDuration), CFSTR("ispStartDuration"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numberOfGraphStartsDuringLaunch), CFSTR("numberOfGraphStartsDuringLaunch"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deviceIsLocked), CFSTR("deviceIsLocked"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deviceStolenDuration), CFSTR("deviceStolenDuration"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deviceStolenCondition), CFSTR("deviceStolenCondition"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isColdLaunch), CFSTR("isColdLaunch"));
  if (self->_launchDuration)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("launchDuration"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (self->_launchDuration - self->_ispStartDuration)), CFSTR("launchDurationExcludingISP"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (self->_launchDuration - (self->_ispStartDuration + self->_deviceStolenDuration))), CFSTR("netLaunchDuration"));
  }
  if ((self->_memoryStatusLevel & 0x80000000) == 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("memoryStatusLevel"));
  if ((self->_thermalLevel & 0x80000000) == 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("thermalLevel"));
  return v3;
}

- (BOOL)isPrewarmed
{
  return self->_isPrewarmed;
}

- (NSString)launchMode
{
  return self->_launchMode;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (NSString)prewarmReason
{
  return self->_prewarmReason;
}

- (int)launchDuration
{
  return self->_launchDuration;
}

- (int)memoryStatusLevel
{
  return self->_memoryStatusLevel;
}

- (int)thermalLevel
{
  return self->_thermalLevel;
}

- (int)ispStartDuration
{
  return self->_ispStartDuration;
}

- (int)numberOfGraphStartsDuringLaunch
{
  return self->_numberOfGraphStartsDuringLaunch;
}

- (BOOL)deviceIsLocked
{
  return self->_deviceIsLocked;
}

- (int)deviceStolenDuration
{
  return self->_deviceStolenDuration;
}

- (int)deviceStolenCondition
{
  return self->_deviceStolenCondition;
}

- (BOOL)isColdLaunch
{
  return self->_isColdLaunch;
}

@end
