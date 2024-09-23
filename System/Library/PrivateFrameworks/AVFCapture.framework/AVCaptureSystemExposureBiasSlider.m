@implementation AVCaptureSystemExposureBiasSlider

- (AVCaptureSystemExposureBiasSlider)initWithDevice:(id)a3
{
  AVCaptureSystemExposureBiasSlider *v4;
  float v5;
  float v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVCaptureSystemExposureBiasSlider;
  v4 = -[AVCaptureControl initSubclass](&v9, sel_initSubclass);
  if (v4)
  {
    objc_msgSend(a3, "minExposureTargetBias");
    if (v5 == 0.0 || (objc_msgSend(a3, "maxExposureTargetBias"), v6 == 0.0))
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, objc_msgSend(a3, "localizedName"));

      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v7);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
      return 0;
    }
    else
    {
      v4->_device = (AVCaptureDevice *)a3;
      v4->_actionLock._os_unfair_lock_opaque = 0;
      v4->_changeExposureBiasInProcess = 1;
    }
  }
  return v4;
}

- (AVCaptureSystemExposureBiasSlider)initWithDevice:(id)a3 action:(id)a4
{
  AVCaptureSystemExposureBiasSlider *v6;
  float v7;
  float v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVCaptureSystemExposureBiasSlider;
  v6 = -[AVCaptureControl initSubclass](&v11, sel_initSubclass);
  if (v6)
  {
    objc_msgSend(a3, "minExposureTargetBias");
    if (v7 == 0.0 || (objc_msgSend(a3, "maxExposureTargetBias"), v8 == 0.0))
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, objc_msgSend(a3, "localizedName"));

      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v9);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v9);
      return 0;
    }
    else
    {
      v6->_device = (AVCaptureDevice *)a3;
      v6->_action = (id)objc_msgSend(a4, "copy");
      v6->_actionLock._os_unfair_lock_opaque = 0;
      v6->_changeExposureBiasInProcess = 1;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  os_unfair_lock_lock(&self->_actionLock);
  os_unfair_lock_unlock(&self->_actionLock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSystemExposureBiasSlider;
  -[AVCaptureControl dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p [%@]>"), NSStringFromClass(v4), self, -[AVCaptureDevice localizedName](self->_device, "localizedName"));
}

- (id)overlayControl
{
  os_unfair_lock_s *p_actionLock;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  if (!self->_overlayControl)
    self->_overlayControl = (CAMOverlayServiceSlider *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D180]), "initWithIdentifier:sliderType:captureUniqueID:", -[AVCaptureControl identifier](self, "identifier"), 1, -[AVCaptureDevice uniqueID](self->_device, "uniqueID"));
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (id)overlayUpdate
{
  CAMOverlayServiceSlider *overlayControl;

  overlayControl = self->_overlayControl;
  if (!overlayControl)
    return 0;
  -[AVCaptureDevice exposureTargetBias](self->_device, "exposureTargetBias");
  return (id)-[CAMOverlayServiceSlider updateWithFloatValue:](overlayControl, "updateWithFloatValue:");
}

- (id)device
{
  return self->_device;
}

- (void)enqueueActionWithUpdate:(id)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  double v8;
  _QWORD v9[5];
  float v10;

  objc_msgSend(a3, "floatValue");
  v5 = v4;
  -[AVCaptureDevice minExposureTargetBias](self->_device, "minExposureTargetBias");
  if (v5 >= v6)
  {
    -[AVCaptureDevice maxExposureTargetBias](self->_device, "maxExposureTargetBias");
    if (v5 <= v7)
    {
      if (self->_changeExposureBiasInProcess)
      {
        -[AVCaptureDevice lockForConfiguration:](self->_device, "lockForConfiguration:", 0);
        *(float *)&v8 = v5;
        -[AVCaptureDevice setExposureTargetBias:completionHandler:](self->_device, "setExposureTargetBias:completionHandler:", 0, v8);
        -[AVCaptureDevice unlockForConfiguration](self->_device, "unlockForConfiguration");
      }
      if (self->_action)
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __61__AVCaptureSystemExposureBiasSlider_enqueueActionWithUpdate___block_invoke;
        v9[3] = &unk_1E4217D58;
        v9[4] = self;
        v10 = v5;
        dispatch_async(MEMORY[0x1E0C80D38], v9);
      }
    }
  }
}

uint64_t __61__AVCaptureSystemExposureBiasSlider_enqueueActionWithUpdate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, float))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(float *)(a1 + 40));
}

- (id)actionQueue
{
  os_unfair_lock_s *p_actionLock;
  id v3;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  v3 = MEMORY[0x1E0C80D38];
  os_unfair_lock_unlock(p_actionLock);
  return v3;
}

- (void)setOverlay:(id)a3
{
  os_unfair_lock_s *p_actionLock;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);

  self->_overlayReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", a3);
  os_unfair_lock_unlock(p_actionLock);
}

- (id)overlay
{
  os_unfair_lock_s *p_actionLock;
  id v4;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  v4 = (id)-[AVWeakReference referencedObject](self->_overlayReference, "referencedObject");
  os_unfair_lock_unlock(p_actionLock);
  return v4;
}

- (void)installObservers
{
  os_unfair_lock_s *p_actionLock;
  _BOOL4 observing;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  observing = self->_observing;
  os_unfair_lock_unlock(p_actionLock);
  if (!observing)
    -[AVCaptureDevice addObserver:forKeyPath:options:context:](self->_device, "addObserver:forKeyPath:options:context:", self, CFSTR("exposureTargetBias"), 5, 0);
  os_unfair_lock_lock(p_actionLock);
  self->_observing = 1;
  os_unfair_lock_unlock(p_actionLock);
}

- (void)removeObservers
{
  os_unfair_lock_s *p_actionLock;
  _BOOL4 observing;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  observing = self->_observing;
  os_unfair_lock_unlock(p_actionLock);
  if (observing)
    -[AVCaptureDevice removeObserver:forKeyPath:](self->_device, "removeObserver:forKeyPath:", self, CFSTR("exposureTargetBias"));
  os_unfair_lock_lock(p_actionLock);
  self->_observing = 0;
  os_unfair_lock_unlock(p_actionLock);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  os_unfair_lock_s *p_actionLock;
  _BOOL4 observing;
  void *v12;
  CAMOverlayServiceSlider *overlayControl;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  observing = self->_observing;
  os_unfair_lock_unlock(p_actionLock);
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("exposureTargetBias")) && self->_device == a4)
  {
    v12 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    if (observing && v12 != 0)
    {
      overlayControl = self->_overlayControl;
      objc_msgSend(v12, "floatValue");
      objc_msgSend(-[AVCaptureSystemExposureBiasSlider overlay](self, "overlay"), "updateControl:", -[CAMOverlayServiceSlider updateWithFloatValue:](overlayControl, "updateWithFloatValue:"));
    }
  }
}

@end
