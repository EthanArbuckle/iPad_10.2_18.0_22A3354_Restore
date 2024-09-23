@implementation AVCaptureSystemLensSelector

+ (void)initialize
{
  objc_opt_class();
}

- (AVCaptureSystemLensSelector)initWithDevice:(id)a3
{
  return (AVCaptureSystemLensSelector *)-[AVCaptureSystemLensSelector _initWithDevice:action:](self, "_initWithDevice:action:", a3, 0);
}

- (id)_initWithDevice:(id)a3 action:(id)a4
{
  _QWORD *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVCaptureSystemLensSelector;
  v6 = -[AVCaptureControl initSubclass](&v9, sel_initSubclass);
  if (v6)
  {
    if ((objc_msgSend(a3, "hasMediaType:", *MEMORY[0x1E0CF2B90]) & 1) != 0)
    {
      v6[4] = a3;
      v6[5] = objc_msgSend(a4, "copy");
      *((_DWORD *)v6 + 14) = 0;
      *((_BYTE *)v6 + 81) = 1;
    }
    else
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, objc_msgSend(a3, "localizedName"));

      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v7);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
      return 0;
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
  v3.super_class = (Class)AVCaptureSystemLensSelector;
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
  CAMOverlayServiceSlider *v4;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  if (!self->_overlayControl)
  {
    v4 = (CAMOverlayServiceSlider *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D180]), "initWithIdentifier:sliderType:captureUniqueID:", -[AVCaptureControl identifier](self, "identifier"), 7, -[AVCaptureDevice uniqueID](self->_device, "uniqueID"));
    self->_overlayControl = v4;
    if (self->_displayValuesByZoomFactorValue)
      -[CAMOverlayServiceSlider setDisplayValuesByValue:](v4, "setDisplayValuesByValue:");
  }
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (id)overlayUpdate
{
  CAMOverlayServiceSlider *overlayControl;
  double v3;

  overlayControl = self->_overlayControl;
  if (!overlayControl)
    return 0;
  -[AVCaptureDevice videoZoomFactor](self->_device, "videoZoomFactor");
  *(float *)&v3 = v3;
  return (id)-[CAMOverlayServiceSlider updateWithFloatValue:](overlayControl, "updateWithFloatValue:", v3);
}

- (id)device
{
  return self->_device;
}

- (NSDictionary)displayValuesByZoomFactorValue
{
  return (NSDictionary *)(id)-[NSDictionary copy](self->_displayValuesByZoomFactorValue, "copy");
}

- (void)setDisplayValuesByZoomFactorValue:(id)a3
{
  if ((-[NSDictionary isEqual:](self->_displayValuesByZoomFactorValue, "isEqual:") & 1) == 0)
  {

    self->_displayValuesByZoomFactorValue = (NSDictionary *)objc_msgSend(a3, "copy");
    os_unfair_lock_lock(&self->_actionLock);

    self->_overlayControl = 0;
    os_unfair_lock_unlock(&self->_actionLock);
    if (!-[AVCaptureSession isBeingConfigured](-[AVCaptureControl session](self, "session"), "isBeingConfigured"))
      objc_msgSend(-[AVCaptureSystemLensSelector overlay](self, "overlay"), "rebuildControls");
  }
}

- (void)setPickerChangesVideoZoomFactor:(BOOL)a3
{
  void *v3;

  if (a3 && !self->_action)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("AVCaptureSystemLensSelector must be initialized with an action for pickerChangesVideoZoomFactor to be set to YES"), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    self->_pickerChangesVideoZoomFactor = a3;
  }
}

- (void)enqueueActionWithUpdate:(id)a3
{
  float v4;
  float v5;
  double v6;
  double v7;
  _QWORD v8[6];

  objc_msgSend(a3, "floatValue");
  v5 = v4;
  if (v4 >= 1.0)
  {
    -[AVCaptureDeviceFormat videoMaxZoomFactor](-[AVCaptureDevice activeFormat](self->_device, "activeFormat"), "videoMaxZoomFactor");
    if (v6 >= v5)
    {
      if (self->_pickerChangesVideoZoomFactor)
      {
        -[AVCaptureDevice lockForConfiguration:](self->_device, "lockForConfiguration:", 0);
        *(float *)&v7 = v5;
        -[AVCaptureDevice rampToVideoZoomFactor:withTuning:](self->_device, "rampToVideoZoomFactor:withTuning:", 0, v7);
        -[AVCaptureDevice unlockForConfiguration](self->_device, "unlockForConfiguration");
      }
      if (self->_action)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __55__AVCaptureSystemLensSelector_enqueueActionWithUpdate___block_invoke;
        v8[3] = &unk_1E4216650;
        v8[4] = self;
        *(double *)&v8[5] = v5;
        dispatch_async(MEMORY[0x1E0C80D38], v8);
      }
    }
  }
}

uint64_t __55__AVCaptureSystemLensSelector_enqueueActionWithUpdate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(double *)(a1 + 40));
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
    -[AVCaptureDevice addObserver:forKeyPath:options:context:](self->_device, "addObserver:forKeyPath:options:context:", self, CFSTR("videoZoomFactor"), 5, AVCaptureSystemLensSelectorDeviceVideoZoomFactorChangedContext);
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
    -[AVCaptureDevice removeObserver:forKeyPath:context:](self->_device, "removeObserver:forKeyPath:context:", self, CFSTR("videoZoomFactor"), AVCaptureSystemLensSelectorDeviceVideoZoomFactorChangedContext);
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
  if ((void *)AVCaptureSystemLensSelectorDeviceVideoZoomFactorChangedContext == a6 && self->_device == a4)
  {
    v12 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    if (observing && v12 != 0)
    {
      overlayControl = self->_overlayControl;
      objc_msgSend(v12, "floatValue");
      objc_msgSend(-[AVCaptureSystemLensSelector overlay](self, "overlay"), "updateControl:", -[CAMOverlayServiceSlider updateWithFloatValue:](overlayControl, "updateWithFloatValue:"));
    }
  }
}

- (BOOL)pickerChangesVideoZoomFactor
{
  return self->_pickerChangesVideoZoomFactor;
}

@end
