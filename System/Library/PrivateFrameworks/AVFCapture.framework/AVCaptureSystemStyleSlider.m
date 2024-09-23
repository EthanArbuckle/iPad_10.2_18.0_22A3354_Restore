@implementation AVCaptureSystemStyleSlider

+ (void)initialize
{
  objc_opt_class();
}

- (AVCaptureSystemStyleSlider)initWithSession:(id)a3 parameter:(int64_t)a4
{
  return -[AVCaptureSystemStyleSlider initWithSession:parameter:action:](self, "initWithSession:parameter:action:", a3, a4, 0);
}

- (AVCaptureSystemStyleSlider)initWithSession:(id)a3 parameter:(int64_t)a4 action:(id)a5
{
  AVCaptureSystemStyleSlider *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVCaptureSystemStyleSlider;
  v8 = -[AVCaptureControl initSubclass](&v10, sel_initSubclass);
  if (v8)
  {
    v8->_sessionReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", a3);
    v8->_action = (id)objc_msgSend(a5, "copy");
    v8->_parameter = a4;
    v8->_actionLock._os_unfair_lock_opaque = 0;
    v8->_changeSmartStyleInProcess = 1;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  os_unfair_lock_lock(&self->_actionLock);
  os_unfair_lock_unlock(&self->_actionLock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSystemStyleSlider;
  -[AVCaptureControl dealloc](&v3, sel_dealloc);
}

- (id)overlayControl
{
  os_unfair_lock_s *p_actionLock;
  int64_t parameter;
  void *v5;
  void *v6;
  id v7;
  NSString *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  CAMOverlayServiceSlider *v13;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  if (!self->_overlayControl)
  {
    parameter = self->_parameter;
    switch(parameter)
    {
      case 0:
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D138]), "initWithMinimum:maximum:", -1.0, 1.0);
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D148]), "initWithValues:", &unk_1E424D9C0);
        v7 = objc_alloc(MEMORY[0x1E0D0D180]);
        v8 = -[AVCaptureControl identifier](self, "identifier");
        v9 = CFSTR("INTENSITY");
        v10 = CFSTR("lifepreserver");
        goto LABEL_7;
      case 2:
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D138]), "initWithMinimum:maximum:", -1.0, 1.0);
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D148]), "initWithValues:", &unk_1E424D9A8);
        AVCaptureBundleIdentifier();
        v11 = AVLocalizedStringFromTableWithBundleIdentifier();
        AVCaptureBundleIdentifier();
        v12 = AVLocalizedStringFromTableWithBundleIdentifier();
        v13 = (CAMOverlayServiceSlider *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D180]), "initWithIdentifier:title:imageName:rangeScale:valueRange:primaryValues:", -[AVCaptureControl identifier](self, "identifier"), v11, CFSTR("dot.grid.bottomrighthalf.app"), 0, v5, v6);
        self->_overlayControl = v13;
        -[CAMOverlayServiceSlider setValueFormat:](v13, "setValueFormat:", v12);
        goto LABEL_9;
      case 1:
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D138]), "initWithMinimum:maximum:", -1.0, 1.0);
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D148]), "initWithValues:", &unk_1E424D990);
        v7 = objc_alloc(MEMORY[0x1E0D0D180]);
        v8 = -[AVCaptureControl identifier](self, "identifier");
        v9 = CFSTR("COLOR");
        v10 = CFSTR("swirl.circle.righthalf.filled");
LABEL_7:
        self->_overlayControl = (CAMOverlayServiceSlider *)objc_msgSend(v7, "initWithIdentifier:title:imageName:rangeScale:valueRange:primaryValues:", v8, v9, v10, 0, v5, v6);
LABEL_9:

        break;
    }
  }
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (id)overlayUpdate
{
  void *v3;
  double v4;
  int64_t parameter;

  if (!self->_overlayControl)
    return 0;
  v3 = (void *)objc_msgSend((id)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject"), "activeSmartStyle");
  parameter = self->_parameter;
  if (parameter)
  {
    if (parameter == 2)
    {
      objc_msgSend(v3, "toneBias");
    }
    else
    {
      LODWORD(v4) = 0;
      if (parameter == 1)
        objc_msgSend(v3, "colorBias", v4);
    }
  }
  else
  {
    objc_msgSend(v3, "intensity");
  }
  return (id)-[CAMOverlayServiceSlider updateWithFloatValue:](self->_overlayControl, "updateWithFloatValue:", v4);
}

- (void)enqueueActionWithUpdate:(id)a3
{
  int v4;
  int v5;
  void *v6;
  void *v7;
  AVCaptureSmartStyle *v8;
  AVCaptureSmartStyle *v9;
  int64_t parameter;
  uint64_t v11;
  int v12;
  int v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  _QWORD v24[6];

  objc_msgSend(a3, "floatValue");
  v5 = v4;
  v6 = (void *)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject");
  if (!v6)
    return;
  v7 = v6;
  v8 = (AVCaptureSmartStyle *)objc_msgSend(v6, "activeSmartStyle");
  v9 = v8;
  parameter = self->_parameter;
  switch(parameter)
  {
    case 0:
      v18 = -[AVCaptureSmartStyle cast](v8, "cast");
      -[AVCaptureSmartStyle toneBias](v9, "toneBias");
      v20 = v19;
      -[AVCaptureSmartStyle colorBias](v9, "colorBias");
      LODWORD(v17) = LODWORD(v16);
      v15 = v18;
      LODWORD(v16) = v5;
      LODWORD(v14) = v20;
      goto LABEL_8;
    case 2:
      v21 = -[AVCaptureSmartStyle cast](v8, "cast");
      -[AVCaptureSmartStyle intensity](v9, "intensity");
      v23 = v22;
      -[AVCaptureSmartStyle colorBias](v9, "colorBias");
      LODWORD(v17) = LODWORD(v16);
      v15 = v21;
      LODWORD(v16) = v23;
      LODWORD(v14) = v5;
      goto LABEL_8;
    case 1:
      v11 = -[AVCaptureSmartStyle cast](v8, "cast");
      -[AVCaptureSmartStyle intensity](v9, "intensity");
      v13 = v12;
      -[AVCaptureSmartStyle toneBias](v9, "toneBias");
      LODWORD(v14) = LODWORD(v16);
      v15 = v11;
      LODWORD(v16) = v13;
      LODWORD(v17) = v5;
LABEL_8:
      v9 = +[AVCaptureSmartStyle styleWithCast:intensity:toneBias:colorBias:](AVCaptureSmartStyle, "styleWithCast:intensity:toneBias:colorBias:", v15, v16, v14, v17);
      break;
  }
  if (self->_changeSmartStyleInProcess)
  {
    objc_msgSend(v7, "setSmartStyle:", v9);
    self->_smartStyleHasChanged = 1;
  }
  if (self->_action)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __54__AVCaptureSystemStyleSlider_enqueueActionWithUpdate___block_invoke;
    v24[3] = &unk_1E4216408;
    v24[4] = self;
    v24[5] = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v24);
  }
}

uint64_t __54__AVCaptureSystemStyleSlider_enqueueActionWithUpdate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
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
    objc_msgSend((id)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject"), "addObserver:forKeyPath:options:context:", self, CFSTR("smartStyle"), 5, 0);
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
    objc_msgSend((id)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject"), "removeObserver:forKeyPath:", self, CFSTR("smartStyle"));
  os_unfair_lock_lock(p_actionLock);
  self->_observing = 0;
  os_unfair_lock_unlock(p_actionLock);
}

- (void)overlayVisibilityDidChange:(BOOL)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVCaptureSystemStyleSlider;
  -[AVCaptureControl overlayVisibilityDidChange:](&v6, sel_overlayVisibilityDidChange_);
  if (!a3)
  {
    v5 = (void *)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject");
    if (v5)
    {
      if (self->_changeSmartStyleInProcess && self->_smartStyleHasChanged)
      {
        objc_msgSend(v5, "saveSystemStyleOverrideToDefaults:", objc_msgSend(v5, "smartStyle"));
        self->_smartStyleHasChanged = 0;
      }
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  os_unfair_lock_s *p_actionLock;
  _BOOL4 observing;
  uint64_t v12;
  void *v14;
  double v15;
  int64_t parameter;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  observing = self->_observing;
  os_unfair_lock_unlock(p_actionLock);
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("smartStyle"))
    && (id)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject") == a4)
  {
    v12 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    if (observing && v12 != 0)
    {
      v14 = (void *)v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        parameter = self->_parameter;
        if (parameter)
        {
          if (parameter == 2)
          {
            objc_msgSend(v14, "toneBias");
          }
          else
          {
            LODWORD(v15) = 0;
            if (parameter == 1)
              objc_msgSend(v14, "colorBias", v15);
          }
        }
        else
        {
          objc_msgSend(v14, "intensity");
        }
        objc_msgSend(-[AVCaptureSystemStyleSlider overlay](self, "overlay"), "updateControl:", -[CAMOverlayServiceSlider updateWithFloatValue:](self->_overlayControl, "updateWithFloatValue:", v15));
      }
    }
  }
}

@end
