@implementation InterceptConfig

- (int)interceptLevel
{
  return self->_interceptLevel;
}

uint64_t __40__InterceptConfig_loadExperimentsConfig__block_invoke()
{
  uint64_t result;

  loadExperimentsConfig_waitUntilCompleted = FigGetCFPreferenceNumberWithDefault() != 0;
  loadExperimentsConfig_waitUntilScheduled = FigGetCFPreferenceNumberWithDefault() != 0;
  loadExperimentsConfig_notifyPostOnGPUError = FigGetCFPreferenceNumberWithDefault() != 0;
  loadExperimentsConfig_processTexture = FigGetCFPreferenceNumberWithDefault();
  result = FigGetCFPreferenceNumberWithDefault();
  loadExperimentsConfig_validateCommandBuffers = (_DWORD)result != 0;
  return result;
}

- (BOOL)waitUntilScheduled
{
  return self->_waitUntilScheduled;
}

- (BOOL)waitUntilCompleted
{
  return self->_waitUntilCompleted;
}

- (void)setWaitUntilScheduled:(BOOL)a3
{
  self->_waitUntilScheduled = a3;
}

- (void)setWaitUntilCompleted:(BOOL)a3
{
  self->_waitUntilCompleted = a3;
}

- (void)loadExperimentsConfig
{
  if (loadExperimentsConfig_sOnceToken != -1)
    dispatch_once(&loadExperimentsConfig_sOnceToken, &__block_literal_global_5);
  -[InterceptConfig setWaitUntilCompleted:](self, "setWaitUntilCompleted:", loadExperimentsConfig_waitUntilCompleted);
  -[InterceptConfig setWaitUntilScheduled:](self, "setWaitUntilScheduled:", loadExperimentsConfig_waitUntilScheduled);
  -[InterceptConfig setNotifyPostOnGPUError:](self, "setNotifyPostOnGPUError:", loadExperimentsConfig_notifyPostOnGPUError);
  -[InterceptConfig setProcessTexture:](self, "setProcessTexture:", loadExperimentsConfig_processTexture);
  -[InterceptConfig setValidateCommandBuffers:](self, "setValidateCommandBuffers:", loadExperimentsConfig_validateCommandBuffers);
}

- (InterceptConfig)initWithLevel:(int)a3
{
  InterceptConfig *v4;
  InterceptConfig *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)InterceptConfig;
  v4 = -[InterceptConfig init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_interceptLevel = a3;
    -[InterceptConfig loadExperimentsConfig](v4, "loadExperimentsConfig");
  }
  return v5;
}

- (FigMetalExecutionStatus)executionStatus
{
  return self->_executionStatus;
}

- (void)setInterceptLevel:(int)a3
{
  self->_interceptLevel = a3;
}

- (void)setExecutionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_executionStatus, a3);
}

- (BOOL)notifyPostOnGPUError
{
  return self->_notifyPostOnGPUError;
}

- (void)setNotifyPostOnGPUError:(BOOL)a3
{
  self->_notifyPostOnGPUError = a3;
}

- (unsigned)processTexture
{
  return self->_processTexture;
}

- (void)setProcessTexture:(unsigned int)a3
{
  self->_processTexture = a3;
}

- (BOOL)validateCommandBuffers
{
  return self->_validateCommandBuffers;
}

- (void)setValidateCommandBuffers:(BOOL)a3
{
  self->_validateCommandBuffers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionStatus, 0);
}

@end
