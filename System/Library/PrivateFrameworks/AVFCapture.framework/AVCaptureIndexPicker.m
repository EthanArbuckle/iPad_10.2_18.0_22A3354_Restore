@implementation AVCaptureIndexPicker

+ (void)initialize
{
  objc_opt_class();
}

- (AVCaptureIndexPicker)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 numberOfIndexes:(int64_t)a5
{
  AVCaptureIndexPicker *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVCaptureIndexPicker;
  v8 = -[AVCaptureControl initSubclass](&v11, sel_initSubclass);
  if (v8)
  {
    if (a5 <= 0)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v9);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v9);
      return 0;
    }
    else
    {
      v8->_localizedTitle = (NSString *)objc_msgSend(a3, "copy");
      v8->_symbolName = (NSString *)objc_msgSend(a4, "copy");
      v8->_numberOfIndexes = a5;
      v8->_localizedIndexTitles = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v8->_actionLock._os_unfair_lock_opaque = 0;
    }
  }
  return v8;
}

- (AVCaptureIndexPicker)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 localizedIndexTitles:(id)a5
{
  AVCaptureIndexPicker *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVCaptureIndexPicker;
  v8 = -[AVCaptureControl initSubclass](&v11, sel_initSubclass);
  if (v8)
  {
    if (objc_msgSend(a5, "count"))
    {
      v8->_localizedTitle = (NSString *)objc_msgSend(a3, "copy");
      v8->_symbolName = (NSString *)objc_msgSend(a4, "copy");
      v8->_numberOfIndexes = objc_msgSend(a5, "count");
      v8->_localizedIndexTitles = (NSArray *)objc_msgSend(a5, "copy");
      v8->_actionLock._os_unfair_lock_opaque = 0;
    }
    else
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v9);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v9);
      return 0;
    }
  }
  return v8;
}

- (AVCaptureIndexPicker)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 numberOfIndexes:(int64_t)a5 localizedTitleTransform:(id)a6
{
  AVCaptureIndexPicker *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVCaptureIndexPicker;
  v10 = -[AVCaptureControl initSubclass](&v15, sel_initSubclass);
  if (v10)
  {
    if (a5 <= 0)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v13);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
      return 0;
    }
    else
    {
      v10->_localizedTitle = (NSString *)objc_msgSend(a3, "copy");
      v10->_symbolName = (NSString *)objc_msgSend(a4, "copy");
      v10->_numberOfIndexes = a5;
      v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = 0;
      do
        objc_msgSend(v11, "addObject:", (*((uint64_t (**)(id, uint64_t))a6 + 2))(a6, v12++));
      while (a5 != v12);
      v10->_localizedIndexTitles = (NSArray *)objc_msgSend(v11, "copy");
      v10->_actionLock._os_unfair_lock_opaque = 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  os_unfair_lock_lock(&self->_actionLock);
  os_unfair_lock_unlock(&self->_actionLock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureIndexPicker;
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

- (id)overlayControl
{
  os_unfair_lock_s *p_actionLock;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  if (!self->_overlayControl)
    self->_overlayControl = (CAMOverlayServicePicker *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D178]), "initWithIdentifier:title:imageName:valueTitles:", -[AVCaptureControl identifier](self, "identifier"), -[AVCaptureIndexPicker localizedTitle](self, "localizedTitle"), -[AVCaptureIndexPicker symbolName](self, "symbolName"), -[AVCaptureIndexPicker localizedIndexTitles](self, "localizedIndexTitles"));
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (id)overlayUpdate
{
  CAMOverlayServicePicker *overlayControl;

  overlayControl = self->_overlayControl;
  if (overlayControl)
    return (id)-[CAMOverlayServicePicker updateWithIndexValue:](overlayControl, "updateWithIndexValue:", -[AVCaptureIndexPicker selectedIndex](self, "selectedIndex"));
  else
    return 0;
}

- (void)setSelectedIndex:(int64_t)a3
{
  OS_dispatch_queue *v5;
  int64_t numberOfIndexes;
  void *v7;
  uint64_t v8;

  v5 = -[AVCaptureIndexPicker actionQueue](self, "actionQueue");
  if (v5)
    dispatch_assert_queue_V2((dispatch_queue_t)v5);
  if (self->_selectedIndex != a3)
  {
    if (a3 < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Selected index %ld is less than 0"), a3, v8);
    }
    else
    {
      numberOfIndexes = self->_numberOfIndexes;
      if (numberOfIndexes > a3)
      {
        self->_selectedIndex = a3;
        objc_msgSend(-[AVCaptureIndexPicker overlay](self, "overlay"), "updateControl:", -[AVCaptureIndexPicker overlayUpdate](self, "overlayUpdate"));
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Selected index %ld is larger than the largest supported index %ld"), a3, numberOfIndexes - 1);
    }
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
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

  v5 = -[AVCaptureIndexPicker actionQueue](self, "actionQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__AVCaptureIndexPicker_enqueueActionWithUpdate___block_invoke;
  v6[3] = &unk_1E4216408;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)v5, v6);
}

uint64_t __48__AVCaptureIndexPicker_enqueueActionWithUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "indexValue");
  objc_msgSend(*(id *)(a1 + 40), "willChangeValueForKey:", CFSTR("selectedIndex"));
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) = v2;
  objc_msgSend(*(id *)(a1 + 40), "didChangeValueForKey:", CFSTR("selectedIndex"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 96) + 16))();
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (int64_t)numberOfIndexes
{
  return self->_numberOfIndexes;
}

- (NSArray)localizedIndexTitles
{
  return self->_localizedIndexTitles;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setActionQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

@end
