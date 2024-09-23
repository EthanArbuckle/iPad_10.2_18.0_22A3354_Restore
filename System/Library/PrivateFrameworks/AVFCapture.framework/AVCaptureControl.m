@implementation AVCaptureControl

- (id)initSubclass
{
  AVCaptureControl *v2;
  AVCaptureControl *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureControl;
  v2 = -[AVCaptureControl init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    v2->_identifier = (NSString *)AVIdentifierForObject((uint64_t)v2);
    v3->_lock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureControl;
  -[AVCaptureControl dealloc](&v3, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  _BOOL4 enabled;
  id v7;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  enabled = self->_enabled;
  self->_enabled = v3;
  os_unfair_lock_unlock(p_lock);
  if (enabled != v3)
  {
    v7 = -[AVCaptureControl _enabledUpdateWithEnabled:](self, "_enabledUpdateWithEnabled:", v3);
    if (v7)
      -[AVCaptureControlsOverlay updateControl:](-[AVCaptureControl overlay](self, "overlay"), "updateControl:", v7);
  }
}

- (OS_dispatch_queue)actionQueue
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v2);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v2);
  return 0;
}

- (void)setOverlay:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (AVCaptureControlsOverlay)overlay
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v2);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v2);
  return 0;
}

- (void)setSession:(id)a3
{

  self->_sessionReference = 0;
  if (a3)
    self->_sessionReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", a3);
}

- (AVCaptureSession)session
{
  return (AVCaptureSession *)(id)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject");
}

- (AVCaptureDevice)device
{
  return 0;
}

- (CAMAbstractOverlayServiceControl)overlayControl
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v2);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v2);
  return 0;
}

- (id)overlayUpdate
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v2);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v2);
  return 0;
}

- (id)enabledUpdate
{
  os_unfair_lock_s *p_lock;
  _BOOL8 enabled;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  enabled = self->_enabled;
  os_unfair_lock_unlock(p_lock);
  return -[AVCaptureControl _enabledUpdateWithEnabled:](self, "_enabledUpdateWithEnabled:", enabled);
}

- (id)_enabledUpdateWithEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[AVCaptureControl overlayControl](self, "overlayControl");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[CAMAbstractOverlayServiceControl updateWithEnabled:](-[AVCaptureControl overlayControl](self, "overlayControl"), "updateWithEnabled:", v3);
  else
    return 0;
}

- (void)enqueueActionWithUpdate:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (void)overlayVisibilityDidChange:(BOOL)a3
{
  if (a3)
    -[AVCaptureControl removeObservers](self, "removeObservers");
  else
    -[AVCaptureControl installObservers](self, "installObservers");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

@end
