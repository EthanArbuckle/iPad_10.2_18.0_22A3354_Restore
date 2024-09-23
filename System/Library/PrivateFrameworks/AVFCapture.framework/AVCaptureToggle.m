@implementation AVCaptureToggle

+ (void)initialize
{
  objc_opt_class();
}

- (AVCaptureToggle)initWithLocalizedTitle:(id)a3 onSymbolName:(id)a4 offSymbolName:(id)a5
{
  AVCaptureToggle *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVCaptureToggle;
  v8 = -[AVCaptureControl initSubclass](&v10, sel_initSubclass);
  if (v8)
  {
    v8->_localizedTitle = (NSString *)objc_msgSend(a3, "copy");
    v8->_onSymbolName = (NSString *)objc_msgSend(a4, "copy");
    v8->_offSymbolName = (NSString *)objc_msgSend(a5, "copy");
    v8->_actionLock._os_unfair_lock_opaque = 0;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  os_unfair_lock_lock(&self->_actionLock);
  os_unfair_lock_unlock(&self->_actionLock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureToggle;
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
    self->_overlayControl = (CAMOverlayServiceToggle *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D190]), "initWithIdentifier:title:imageName:onImageName:offImageName:", -[AVCaptureControl identifier](self, "identifier"), -[AVCaptureToggle localizedTitle](self, "localizedTitle"), -[AVCaptureToggle onSymbolName](self, "onSymbolName"), -[AVCaptureToggle onSymbolName](self, "onSymbolName"), -[AVCaptureToggle offSymbolName](self, "offSymbolName"));
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (id)overlayUpdate
{
  CAMOverlayServiceToggle *overlayControl;

  overlayControl = self->_overlayControl;
  if (overlayControl)
    return (id)-[CAMOverlayServiceToggle updateWithBooleanValue:](overlayControl, "updateWithBooleanValue:", -[AVCaptureToggle isOn](self, "isOn"));
  else
    return 0;
}

- (void)setOn:(BOOL)a3
{
  _BOOL4 v3;
  OS_dispatch_queue *v5;

  v3 = a3;
  v5 = -[AVCaptureToggle actionQueue](self, "actionQueue");
  if (v5)
    dispatch_assert_queue_V2((dispatch_queue_t)v5);
  if (self->_on != v3)
  {
    self->_on = v3;
    objc_msgSend(-[AVCaptureToggle overlay](self, "overlay"), "updateControl:", -[AVCaptureToggle overlayUpdate](self, "overlayUpdate"));
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

  v5 = -[AVCaptureToggle actionQueue](self, "actionQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__AVCaptureToggle_enqueueActionWithUpdate___block_invoke;
  v6[3] = &unk_1E4216408;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)v5, v6);
}

uint64_t __43__AVCaptureToggle_enqueueActionWithUpdate___block_invoke(uint64_t a1)
{
  char v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLeanValue");
  objc_msgSend(*(id *)(a1 + 40), "willChangeValueForKey:", CFSTR("on"));
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 56) = v2;
  objc_msgSend(*(id *)(a1 + 40), "didChangeValueForKey:", CFSTR("on"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) + 16))();
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)onSymbolName
{
  return self->_onSymbolName;
}

- (NSString)offSymbolName
{
  return self->_offSymbolName;
}

- (BOOL)isOn
{
  return self->_on;
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
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

@end
