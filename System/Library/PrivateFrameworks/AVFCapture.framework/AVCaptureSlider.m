@implementation AVCaptureSlider

+ (void)initialize
{
  objc_opt_class();
}

- (AVCaptureSlider)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 values:(id)a5
{
  AVCaptureSlider *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVCaptureSlider;
  v8 = -[AVCaptureControl initSubclass](&v14, sel_initSubclass);
  if (v8)
  {
    v9 = (void *)objc_msgSend(a5, "sortedArrayUsingSelector:", sel_compare_);
    objc_msgSend((id)objc_msgSend(v9, "firstObject"), "floatValue");
    v8->_minValue = v10;
    objc_msgSend((id)objc_msgSend(v9, "lastObject"), "floatValue");
    v8->_maxValue = v11;
    v8->_value = v8->_minValue;
    v8->_prominentValues = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v8->_localizedTitle = (NSString *)objc_msgSend(a3, "copy");
    v8->_symbolName = (NSString *)objc_msgSend(a4, "copy");
    v12 = (void *)objc_msgSend(a5, "copy");
    v8->_discreteRange = (CAMOverlayDiscreteFloatRange *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D148]), "initWithValues:", v12);

    v8->_actionLock._os_unfair_lock_opaque = 0;
  }
  return v8;
}

- (AVCaptureSlider)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 minValue:(float)a5 maxValue:(float)a6
{
  AVCaptureSlider *v10;
  AVCaptureSlider *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVCaptureSlider;
  v10 = -[AVCaptureControl initSubclass](&v14, sel_initSubclass);
  v11 = v10;
  if (v10)
  {
    if (a5 >= a6)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, a5, a6);

      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v12);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
      return 0;
    }
    else
    {
      v10->_value = a5;
      v10->_prominentValues = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v11->_minValue = a5;
      v11->_maxValue = a6;
      v11->_localizedTitle = (NSString *)objc_msgSend(a3, "copy");
      v11->_symbolName = (NSString *)objc_msgSend(a4, "copy");
      v11->_continuousRange = (CAMOverlayContinuousFloatRange *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D138]), "initWithMinimum:maximum:", a5, a6);
      v11->_actionLock._os_unfair_lock_opaque = 0;
    }
  }
  return v11;
}

- (AVCaptureSlider)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 minValue:(float)a5 maxValue:(float)a6 step:(float)a7
{
  AVCaptureSlider *v12;
  AVCaptureSlider *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AVCaptureSlider;
  v12 = -[AVCaptureControl initSubclass](&v19, sel_initSubclass);
  v13 = v12;
  if (v12)
  {
    if (a5 >= a6)
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99778];
      v18 = a5;
    }
    else
    {
      if (a7 > 0.0)
      {
        v12->_value = a5;
        v12->_prominentValues = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
        v13->_minValue = a5;
        v13->_maxValue = a6;
        v13->_localizedTitle = (NSString *)objc_msgSend(a3, "copy");
        v13->_symbolName = (NSString *)objc_msgSend(a4, "copy");
        v13->_discreteRange = (CAMOverlayDiscreteFloatRange *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D148]), "initWithMinimum:maximum:step:", a5, a6, a7);
        v13->_actionLock._os_unfair_lock_opaque = 0;
        return v13;
      }
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99778];
      v18 = a7;
    }
    v16 = (void *)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector(), 0, *(_QWORD *)&v18);

    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v16);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v16);
    return 0;
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  os_unfair_lock_lock(&self->_actionLock);
  os_unfair_lock_unlock(&self->_actionLock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSlider;
  -[AVCaptureControl dealloc](&v3, sel_dealloc);
}

- (id)description
{
  NSString *accessibilityIdentifier;
  const __CFString *v4;
  void *v5;
  objc_class *v6;

  accessibilityIdentifier = self->_accessibilityIdentifier;
  if (accessibilityIdentifier)
    v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), accessibilityIdentifier);
  else
    v4 = &stru_1E421DB28;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p [%@]%@>"), NSStringFromClass(v6), self, self->_localizedTitle, v4);
}

- (id)overlayUpdate
{
  CAMOverlayServiceSlider *overlayControl;

  overlayControl = self->_overlayControl;
  if (!overlayControl)
    return 0;
  -[AVCaptureSlider value](self, "value");
  return (id)-[CAMOverlayServiceSlider updateWithFloatValue:](overlayControl, "updateWithFloatValue:");
}

- (id)overlayControl
{
  os_unfair_lock_s *p_actionLock;
  void *v4;
  CAMOverlayDiscreteFloatRange **p_discreteRange;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  if (!self->_overlayControl)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D148]), "initWithValues:", -[AVCaptureSlider prominentValues](self, "prominentValues"));
    p_discreteRange = &self->_discreteRange;
    if (self->_discreteRange || (p_discreteRange = &self->_continuousRange, self->_continuousRange))
      self->_overlayControl = (CAMOverlayServiceSlider *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D180]), "initWithIdentifier:title:imageName:rangeScale:valueRange:primaryValues:", -[AVCaptureControl identifier](self, "identifier"), -[AVCaptureSlider localizedTitle](self, "localizedTitle"), -[AVCaptureSlider symbolName](self, "symbolName"), 0, *p_discreteRange, v4);
    if (self->_localizedValueFormat)
      -[CAMOverlayServiceSlider setValueFormat:](self->_overlayControl, "setValueFormat:");

  }
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (void)setValue:(float)a3
{
  OS_dispatch_queue *v5;
  float minValue;
  const __CFString *v7;
  void *v8;

  v5 = -[AVCaptureSlider actionQueue](self, "actionQueue");
  if (v5)
    dispatch_assert_queue_V2((dispatch_queue_t)v5);
  if (self->_value != a3)
  {
    minValue = self->_minValue;
    if (minValue <= a3)
    {
      minValue = self->_maxValue;
      if (minValue >= a3)
      {
        self->_value = a3;
        objc_msgSend(-[AVCaptureSlider overlay](self, "overlay"), "updateControl:", -[AVCaptureSlider overlayUpdate](self, "overlayUpdate"));
        return;
      }
      v7 = CFSTR("Value %.2f is greater than the slider's maximum value %.2f");
    }
    else
    {
      v7 = CFSTR("Value %.2f is less than the slider's minimum value %.2f");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v7, a3, minValue);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

- (void)setLocalizedValueValueFormat:(id)a3
{
  NSString *localizedValueFormat;

  localizedValueFormat = self->_localizedValueFormat;
  if (localizedValueFormat != a3 && !-[NSString isEqualToString:](localizedValueFormat, "isEqualToString:"))
  {

    self->_localizedValueFormat = (NSString *)objc_msgSend(a3, "copy");
    os_unfair_lock_lock(&self->_actionLock);

    self->_overlayControl = 0;
    os_unfair_lock_unlock(&self->_actionLock);
    if (!-[AVCaptureSession isBeingConfigured](-[AVCaptureControl session](self, "session"), "isBeingConfigured"))
      objc_msgSend(-[AVCaptureSlider overlay](self, "overlay"), "rebuildControls");
  }
}

- (void)setProminentValues:(id)a3
{
  if (!-[NSArray isEqualToArray:](self->_prominentValues, "isEqualToArray:"))
  {

    self->_prominentValues = (NSArray *)objc_msgSend(a3, "copy");
    os_unfair_lock_lock(&self->_actionLock);

    self->_overlayControl = 0;
    os_unfair_lock_unlock(&self->_actionLock);
    if (!-[AVCaptureSession isBeingConfigured](-[AVCaptureControl session](self, "session"), "isBeingConfigured"))
      objc_msgSend(-[AVCaptureSlider overlay](self, "overlay"), "rebuildControls");
  }
}

- (OS_dispatch_queue)actionQueue
{
  os_unfair_lock_s *p_actionLock;
  OS_dispatch_queue *v4;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  v4 = self->_actionQueue;
  os_unfair_lock_unlock(p_actionLock);
  return v4;
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

- (void)setActionQueue:(id)a3 action:(id)a4
{
  os_unfair_lock_s *p_actionLock;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);

  self->_actionQueue = (OS_dispatch_queue *)a3;
  self->_action = (id)objc_msgSend(a4, "copy");
  os_unfair_lock_unlock(p_actionLock);
}

- (void)enqueueActionWithUpdate:(id)a3
{
  OS_dispatch_queue *v5;
  _QWORD v6[6];

  v5 = -[AVCaptureSlider actionQueue](self, "actionQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__AVCaptureSlider_enqueueActionWithUpdate___block_invoke;
  v6[3] = &unk_1E4216408;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

uint64_t __43__AVCaptureSlider_enqueueActionWithUpdate___block_invoke(uint64_t a1)
{
  int v2;

  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("value"));
  objc_msgSend(*(id *)(a1 + 40), "floatValue");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = v2;
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("value"));
  return (*(uint64_t (**)(float))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) + 16))(*(float *)(*(_QWORD *)(a1 + 32) + 32));
}

- (float)value
{
  return self->_value;
}

- (NSString)localizedValueFormat
{
  return self->_localizedValueFormat;
}

- (void)setLocalizedValueFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)prominentValues
{
  return self->_prominentValues;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setActionQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

@end
