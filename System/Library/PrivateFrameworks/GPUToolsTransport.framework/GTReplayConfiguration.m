@implementation GTReplayConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayConfiguration)init
{
  char *v2;
  GTReplayConfiguration *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTReplayConfiguration;
  v2 = -[GTReplayConfiguration init](&v6, sel_init);
  v3 = (GTReplayConfiguration *)v2;
  if (v2)
  {
    *(_DWORD *)(v2 + 15) = 0;
    *((_QWORD *)v2 + 1) = 0;
    v4 = v2;
  }

  return v3;
}

- (GTReplayConfiguration)initWithCoder:(id)a3
{
  id v4;
  GTReplayConfiguration *v5;
  GTReplayConfiguration *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayConfiguration;
  v5 = -[GTReplayConfiguration init](&v8, sel_init);
  if (v5)
  {
    v5->_forceLoadActionClear = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceLoadActionClear"));
    v5->_forceLoadUnusedResources = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceLoadUnusedResources"));
    v5->_forceWaitUntilCompleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceWaitUntilCompleted"));
    v5->_disableOptimizeRestores = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableOptimizeRestores"));
    v5->_disableHeapTextureCompression = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableHeapTextureCompression"));
    v5->_enableStopOnError = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableStopOnError"));
    v5->_enableDisplayOnDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableDisplayOnDevice"));
    v5->_enableReplayFromOtherPlatforms = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableReplayFromOtherPlatforms"));
    v5->_enableValidation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableValidation"));
    v5->_enableCapture = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableCapture"));
    v5->_enableHUD = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableHUD"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 forceLoadActionClear;
  id v5;

  forceLoadActionClear = self->_forceLoadActionClear;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", forceLoadActionClear, CFSTR("forceLoadActionClear"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forceLoadUnusedResources, CFSTR("forceLoadUnusedResources"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forceWaitUntilCompleted, CFSTR("forceWaitUntilCompleted"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_disableOptimizeRestores, CFSTR("disableOptimizeRestores"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_disableHeapTextureCompression, CFSTR("disableHeapTextureCompression"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableStopOnError, CFSTR("enableStopOnError"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableDisplayOnDevice, CFSTR("enableDisplayOnDevice"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableReplayFromOtherPlatforms, CFSTR("enableReplayFromOtherPlatforms"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableValidation, CFSTR("enableValidation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableCapture, CFSTR("enableCapture"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableHUD, CFSTR("enableHUD"));

}

- (BOOL)forceLoadActionClear
{
  return self->_forceLoadActionClear;
}

- (void)setForceLoadActionClear:(BOOL)a3
{
  self->_forceLoadActionClear = a3;
}

- (BOOL)forceLoadUnusedResources
{
  return self->_forceLoadUnusedResources;
}

- (void)setForceLoadUnusedResources:(BOOL)a3
{
  self->_forceLoadUnusedResources = a3;
}

- (BOOL)forceWaitUntilCompleted
{
  return self->_forceWaitUntilCompleted;
}

- (void)setForceWaitUntilCompleted:(BOOL)a3
{
  self->_forceWaitUntilCompleted = a3;
}

- (BOOL)disableOptimizeRestores
{
  return self->_disableOptimizeRestores;
}

- (void)setDisableOptimizeRestores:(BOOL)a3
{
  self->_disableOptimizeRestores = a3;
}

- (BOOL)disableHeapTextureCompression
{
  return self->_disableHeapTextureCompression;
}

- (void)setDisableHeapTextureCompression:(BOOL)a3
{
  self->_disableHeapTextureCompression = a3;
}

- (BOOL)enableStopOnError
{
  return self->_enableStopOnError;
}

- (void)setEnableStopOnError:(BOOL)a3
{
  self->_enableStopOnError = a3;
}

- (BOOL)enableDisplayOnDevice
{
  return self->_enableDisplayOnDevice;
}

- (void)setEnableDisplayOnDevice:(BOOL)a3
{
  self->_enableDisplayOnDevice = a3;
}

- (BOOL)enableReplayFromOtherPlatforms
{
  return self->_enableReplayFromOtherPlatforms;
}

- (void)setEnableReplayFromOtherPlatforms:(BOOL)a3
{
  self->_enableReplayFromOtherPlatforms = a3;
}

- (BOOL)enableValidation
{
  return self->_enableValidation;
}

- (void)setEnableValidation:(BOOL)a3
{
  self->_enableValidation = a3;
}

- (BOOL)enableCapture
{
  return self->_enableCapture;
}

- (void)setEnableCapture:(BOOL)a3
{
  self->_enableCapture = a3;
}

- (BOOL)enableHUD
{
  return self->_enableHUD;
}

- (void)setEnableHUD:(BOOL)a3
{
  self->_enableHUD = a3;
}

@end
