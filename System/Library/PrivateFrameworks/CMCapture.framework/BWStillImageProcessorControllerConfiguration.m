@implementation BWStillImageProcessorControllerConfiguration

- (void)setStillImageProcessingMode:(int)a3
{
  self->_stillImageProcessingMode = a3;
}

- (void)setSensorConfigurationsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setMetalCommandQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setInferenceScheduler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setFigThreadPriority:(unsigned int)a3
{
  self->_figThreadPriority = a3;
}

- (BWInferenceScheduler)inferenceScheduler
{
  return self->_inferenceScheduler;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (unsigned)figThreadPriority
{
  return self->_figThreadPriority;
}

- (NSDictionary)sensorConfigurationsByPortType
{
  return self->_sensorConfigurationsByPortType;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageProcessorControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

- (BOOL)postponedProcessorSetupSupported
{
  return 0;
}

- (BOOL)postponeProcessorSetup
{
  return self->_postponeProcessorSetup;
}

- (void)setPostponeProcessorSetup:(BOOL)a3
{
  if (self->_postponeProcessorSetup != a3)
  {
    if (a3
      && !-[BWStillImageProcessorControllerConfiguration postponedProcessorSetupSupported](self, "postponedProcessorSetupSupported"))
    {
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Not supported - use -postponedProcessorSetupSupported."), 0));
    }
    self->_postponeProcessorSetup = a3;
  }
}

- (int)stillImageProcessingMode
{
  return self->_stillImageProcessingMode;
}

- (BOOL)deferredCaptureSupportEnabled
{
  return self->_deferredCaptureSupportEnabled;
}

- (void)setDeferredCaptureSupportEnabled:(BOOL)a3
{
  self->_deferredCaptureSupportEnabled = a3;
}

- (BOOL)deferredPhotoProcessorEnabled
{
  return self->_deferredPhotoProcessorEnabled;
}

- (void)setDeferredPhotoProcessorEnabled:(BOOL)a3
{
  self->_deferredPhotoProcessorEnabled = a3;
}

@end
