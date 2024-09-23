@implementation FigCameraUsageListener

+ (void)initialize
{
  objc_opt_class();
}

- (FigCameraUsageListener)initWithChangeHandler:(id)a3
{
  id v4;
  pthread_mutex_t *v5;
  objc_super v7;

  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)FigCameraUsageListener;
    v4 = -[FigCameraUsageListener init](&v7, sel_init);
    if (v4)
    {
      *((_QWORD *)v4 + 3) = objc_msgSend(a3, "copy");
      v5 = (pthread_mutex_t *)FigSimpleMutexCreate();
      *((_QWORD *)v4 + 2) = v5;
      pthread_mutex_lock(v5);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection"), "registerObserver:", v4);
      *((_BYTE *)v4 + 8) = FigCameraUsageProhibited();
      pthread_mutex_unlock(*((pthread_mutex_t **)v4 + 2));
    }
  }
  else
  {

    return 0;
  }
  return (FigCameraUsageListener *)v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection"), "unregisterObserver:", self);

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)FigCameraUsageListener;
  -[FigCameraUsageListener dealloc](&v3, sel_dealloc);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  _BOOL4 v5;

  v5 = FigCameraUsageProhibited();
  pthread_mutex_lock((pthread_mutex_t *)self->_isProhibitedLock);
  if (v5 != self->_isProhibited)
  {
    self->_isProhibited = v5;
    (*((void (**)(void))self->_changeHandler + 2))();
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_isProhibitedLock);
}

@end
