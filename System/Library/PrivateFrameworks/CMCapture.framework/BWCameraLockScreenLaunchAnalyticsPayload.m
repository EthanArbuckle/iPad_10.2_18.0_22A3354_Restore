@implementation BWCameraLockScreenLaunchAnalyticsPayload

- (BWCameraLockScreenLaunchAnalyticsPayload)init
{
  BWCameraLockScreenLaunchAnalyticsPayload *v2;
  BWCameraLockScreenLaunchAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWCameraLockScreenLaunchAnalyticsPayload;
  v2 = -[BWCameraLockScreenLaunchAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWCameraLockScreenLaunchAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)reset
{
  *(_WORD *)&self->_completed = 0;
  self->_ispStreamingStarted = 0;
  self->_launchError = 0;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.CameraAppLockScreenLaunch");
}

- (id)eventDictionary
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_completed), CFSTR("completed"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_prewarmed), CFSTR("prewarmed"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ispStreamingStarted), CFSTR("ispStreamingStarted"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_launchError), CFSTR("launchError"));
  return v3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)prewarmed
{
  return self->_prewarmed;
}

- (void)setPrewarmed:(BOOL)a3
{
  self->_prewarmed = a3;
}

- (BOOL)ispStreamingStarted
{
  return self->_ispStreamingStarted;
}

- (void)setIspStreamingStarted:(BOOL)a3
{
  self->_ispStreamingStarted = a3;
}

- (int)launchError
{
  return self->_launchError;
}

- (void)setLaunchError:(int)a3
{
  self->_launchError = a3;
}

@end
