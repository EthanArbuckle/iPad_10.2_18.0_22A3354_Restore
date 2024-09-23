@implementation CAEAGLLayer

+ (id)defaultValueForKey:(id)a3
{
  id *v5;
  id result;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("opaque")) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", CFSTR("allowsDisplayCompositing")))
  {
    v5 = (id *)MEMORY[0x1E0C9AE50];
    return *v5;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("presentsWithTransaction"))
    || objc_msgSend(a3, "isEqualToString:", CFSTR("lowLatency")))
  {
    v5 = (id *)MEMORY[0x1E0C9AE40];
    return *v5;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("maximumDrawableCount")))
  {
    result = (id)+[CAEAGLLayer defaultValueForKey:]::max_buffers;
    if (!+[CAEAGLLayer defaultValueForKey:]::max_buffers)
    {
      if (byte_1ECDC6AC8)
        v7 = 2;
      else
        v7 = 3;
      result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v7);
      +[CAEAGLLayer defaultValueForKey:]::max_buffers = (uint64_t)result;
    }
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___CAEAGLLayer;
    return objc_msgSendSuper2(&v8, sel_defaultValueForKey_, a3);
  }
  return result;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAEAGLLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (BOOL)shouldArchiveValueForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("contents")))
    return CAEncodeIOSurfacesAsCGImages != 0;
  v6.receiver = self;
  v6.super_class = (Class)CAEAGLLayer;
  return -[CALayer shouldArchiveValueForKey:](&v6, sel_shouldArchiveValueForKey_, a3);
}

- (void)didChangeValueForKey:(id)a3
{
  BOOL v5;
  _CAEAGLNativeWindow *win;
  char v7;
  _BOOL4 v8;
  char v9;
  char v10;
  _BOOL4 v11;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_win)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("opaque")))
    {
      v5 = -[CALayer isOpaque](self, "isOpaque");
      win = self->_win;
      v7 = *((_BYTE *)win + 256) & 0xFE | v5;
LABEL_15:
      *((_BYTE *)win + 256) = v7;
      goto LABEL_16;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("presentsWithTransaction")))
    {
      v8 = -[CAEAGLLayer presentsWithTransaction](self, "presentsWithTransaction");
      win = self->_win;
      if (v8)
        v9 = 4;
      else
        v9 = 0;
      v10 = *((_BYTE *)win + 256) & 0xFB;
LABEL_14:
      v7 = v10 | v9;
      goto LABEL_15;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("lowLatency")))
    {
      v11 = -[CAEAGLLayer lowLatency](self, "lowLatency");
      win = self->_win;
      if (v11)
        v9 = 8;
      else
        v9 = 0;
      v10 = *((_BYTE *)win + 256) & 0xF7;
      goto LABEL_14;
    }
  }
LABEL_16:
  v12.receiver = self;
  v12.super_class = (Class)CAEAGLLayer;
  -[CAEAGLLayer didChangeValueForKey:](&v12, sel_didChangeValueForKey_, a3);
}

- (_EAGLNativeWindowObject)nativeWindow
{
  _CAEAGLNativeWindow **p_win;
  _CAEAGLNativeWindow *win;
  int v5;
  int v6;
  unint64_t v7;
  objc_class *v8;
  _CAEAGLNativeWindow *v9;
  uint64_t (*v10)(_EAGLNativeWindowObject *, double);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  pthread_key_t v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    p_win = &self->_win;
    win = self->_win;
    if (win)
      return (_EAGLNativeWindowObject *)win;
    goto LABEL_7;
  }
  v5 = dyld_program_sdk_at_least();
  p_win = &self->_win;
  win = self->_win;
  if (win)
    return (_EAGLNativeWindowObject *)win;
  if (!v5)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  +[CATransaction begin](CATransaction, "begin");
  v6 = 1;
LABEL_8:
  +[CATransaction lock](CATransaction, "lock");
  win = *p_win;
  if (!*p_win)
  {
    if (byte_1ECDC6AC8)
      v7 = 2;
    else
      v7 = -[CAEAGLLayer maximumDrawableCount](self, "maximumDrawableCount");
    if ((native_window_new(unsigned long)::initialized & 1) == 0)
    {
      native_window_new(unsigned long)::initialized = 1;
      v8 = (objc_class *)objc_opt_class();
      if (class_getInstanceMethod(v8, sel_presentRenderbuffer_atTime_))
        native_window_new(unsigned long)::has_present_at_time_method = 1;
    }
    if (!collect_slot)
    {
      v18[0] = 0;
      pthread_key_create(v18, 0);
      collect_slot = v18[0];
    }
    v9 = (_CAEAGLNativeWindow *)malloc_type_calloc(1uLL, 0x108uLL, 0x10A0040BE3B53CFuLL);
    win = v9;
    *((_QWORD *)v9 + 1) = native_window_attach;
    *((_QWORD *)v9 + 2) = native_window_detach;
    v10 = native_window_swap_zero_time;
    if (native_window_new(unsigned long)::has_present_at_time_method)
      v10 = native_window_swap;
    *(_DWORD *)v9 = 5;
    *((_QWORD *)v9 + 3) = native_window_begin_iosurface;
    *((_QWORD *)v9 + 4) = v10;
    *((_QWORD *)v9 + 5) = native_window_collect;
    *((_QWORD *)v9 + 6) = native_window_begin_properties;
    *((_QWORD *)v9 + 7) = native_window_estimated_size;
    CA::Render::add_observer(0x32u, 0, (uint64_t)will_suspend_callback, (uint64_t)v9, 0);
    *((_DWORD *)win + 32) = 1;
    *((_QWORD *)win + 29) = dispatch_semaphore_create(0);
    *((_DWORD *)win + 60) = 0;
    v11 = CAImageQueueCreate_(0, v7);
    if (v11)
    {
      *(_QWORD *)(v11 + 32) = 0;
      *((_QWORD *)win + 18) = v11;
      *((_QWORD *)win + 31) = v7;
      *((_QWORD *)win + 21) = 0x3FF0000000000000;
      if (CADeviceSupportsAPT::once != -1)
        dispatch_once(&CADeviceSupportsAPT::once, &__block_literal_global_37);
      if (CADeviceSupportsAPT::supports_apt)
        v12 = 0x400000000008000;
      else
        v12 = 0x400000000000000;
      if (CADeviceSupportsAPT::supports_apt)
        v13 = 0x400000000008001;
      else
        v13 = 0x400000000000001;
      CAImageQueueSetFlagsInternal(*((int **)win + 18), v13, v12);
      CAImageQueueSetCollectableCallback(*((_QWORD *)win + 18), 0, (uint64_t)layer_collectable_signal, (uint64_t)win);
      *((_QWORD *)win + 19) = self;
      -[CALayer setContents:](self, "setContents:", *((_QWORD *)win + 18));
      *((_BYTE *)win + 256) = *((_BYTE *)win + 256) & 0xFE | -[CALayer isOpaque](self, "isOpaque");
      if (-[CAEAGLLayer presentsWithTransaction](self, "presentsWithTransaction"))
        v14 = 4;
      else
        v14 = 0;
      *((_BYTE *)win + 256) = *((_BYTE *)win + 256) & 0xFB | v14;
      if (-[CAEAGLLayer lowLatency](self, "lowLatency"))
        v15 = 8;
      else
        v15 = 0;
      v16 = *((_BYTE *)win + 256) & 0xF7 | v15;
      *((_BYTE *)win + 256) = v16;
      *((_BYTE *)win + 256) = v16 & 0xFD | (*((_DWORD *)self->super._attr.layer + 13) >> 19) & 2;
      *p_win = win;
    }
    else
    {
      free(win);
      win = 0;
    }
  }
  +[CATransaction unlock](CATransaction, "unlock");
  if (v6)
    +[CATransaction commit](CATransaction, "commit");
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    if (dyld_program_sdk_at_least()
      && +[CATransaction currentState](CATransaction, "currentState") == 1)
    {
      NSLog(&CFSTR("CoreAnimation: [EAGLContext renderbufferStorage:fromDrawable:] was called from a non-main thread in an impl"
                   "icit transaction! Note that this may be unsafe without an explicit CATransaction or a call to [CATransaction flush].").isa);
    }
    else
    {
      +[CATransaction flush](CATransaction, "flush");
    }
  }
  return (_EAGLNativeWindowObject *)win;
}

- (void)dealloc
{
  _CAEAGLNativeWindow *win;
  void *v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  win = self->_win;
  if (win)
  {
    +[CATransaction lock](CATransaction, "lock");
    *((_QWORD *)win + 19) = 0;
    +[CATransaction unlock](CATransaction, "unlock");
    native_window_release(win, v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)CAEAGLLayer;
  -[CALayer dealloc](&v5, sel_dealloc);
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  _CAEAGLNativeWindow *win;
  char v4;

  win = self->_win;
  if (win)
  {
    if (a3)
      v4 = 2;
    else
      v4 = 0;
    *((_BYTE *)win + 256) = *((_BYTE *)win + 256) & 0xFD | v4;
  }
}

- (BOOL)_defersDidBecomeVisiblePostCommit
{
  return 1;
}

- (void)_display
{
  -[CALayer setContents:](self, "setContents:", -[CALayer contents](self, "contents"));
}

- (void)_didCommitLayer:(void *)a3
{
  _CAEAGLNativeWindow *win;
  unsigned int *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  os_unfair_lock_s *v9;
  int v10;
  CA::Render::Encoder *os_unfair_lock_opaque;
  __CFString *v12;
  void *v13;
  unsigned int v14;
  objc_super v15;
  int valuePtr;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  win = self->_win;
  if (win)
  {
    v6 = (unsigned int *)((char *)win + 132);
    if ((*((_DWORD *)win + 33) & 4) != 0)
    {
      v7 = *((_QWORD *)a3 + 5);
      if (v7)
      {
        v8 = (os_unfair_lock_s *)*((_QWORD *)win + 18);
        if (v8)
        {
          v9 = v8 + 4;
          os_unfair_lock_lock(v8 + 4);
          v10 = v8[6]._os_unfair_lock_opaque + 1;
          v8[6]._os_unfair_lock_opaque = v10;
          os_unfair_lock_unlock(v8 + 4);
          os_unfair_lock_lock(v8 + 4);
          os_unfair_lock_opaque = (CA::Render::Encoder *)v8[7]._os_unfair_lock_opaque;
          os_unfair_lock_unlock(v9);
          valuePtr = v10;
          v12 = (__CFString *)CFNumberCreate(0, kCFNumberIntType, &valuePtr);
          CA::Context::commit_command((CA::Context *)0xE, os_unfair_lock_opaque, v12, *(const void **)(v7 + 208), v13);
          CFRelease(v12);
        }
        do
          v14 = __ldaxr(v6);
        while (__stlxr(v14 & 0xFFFFFFFB, v6));
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)CAEAGLLayer;
  -[CALayer _didCommitLayer:](&v15, sel__didCommitLayer_, a3);
}

- (BOOL)presentsWithTransaction
{
  unsigned int v3;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = presentsWithTransaction_atom;
  if (!presentsWithTransaction_atom)
  {
    v3 = CAInternAtomWithCString("presentsWithTransaction");
    presentsWithTransaction_atom = v3;
  }
  v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (void)setPresentsWithTransaction:(BOOL)presentsWithTransaction
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = presentsWithTransaction_atom;
  if (!presentsWithTransaction_atom)
  {
    v5 = CAInternAtomWithCString("presentsWithTransaction");
    presentsWithTransaction_atom = v5;
  }
  v6 = presentsWithTransaction;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (NSDictionary)drawableProperties
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xB8u, (const CGAffineTransform *)3, v3);
  return (NSDictionary *)v3[0];
}

- (void)setDrawableProperties:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xB8, (const CGAffineTransform *)3, v3);
}

- (BOOL)isDrawableAvailable
{
  uint64_t v3;
  double v4;
  BOOL v5;
  uint64_t v6;
  double v7;

  v3 = mach_absolute_time();
  v4 = CATimeWithHostTime(v3);
  while (1)
  {
    v5 = -[CAEAGLLayer isDrawableAvailableInternal](self, "isDrawableAvailableInternal");
    v6 = mach_absolute_time();
    v7 = CATimeWithHostTime(v6);
    if (v5 || v7 - v4 > 0.001)
      break;
    usleep(0x64u);
  }
  return v5;
}

- (BOOL)isDrawableAvailableInternal
{
  uint64_t *win;
  uint64_t v3;

  win = (uint64_t *)self->_win;
  if (!win)
    return 0;
  pthread_setspecific(collect_slot, win);
  v3 = CAImageQueueCollect_(win[18], 0, 0);
  pthread_setspecific(collect_slot, 0);
  return v3 != 0;
}

- (void)discardContents
{
  uint64_t *win;

  win = (uint64_t *)self->_win;
  if (win)
  {
    pthread_setspecific(collect_slot, win);
    CAImageQueueConsumeUnconsumed_(win[18], 1);
    CAImageQueueFlush(win[18]);
    pthread_setspecific(collect_slot, 0);
  }
}

- (void)setAsynchronous:(BOOL)a3
{
  -[CAEAGLLayer setPresentsWithTransaction:](self, "setPresentsWithTransaction:", !a3);
}

- (BOOL)isAsynchronous
{
  return !-[CAEAGLLayer presentsWithTransaction](self, "presentsWithTransaction");
}

- (unint64_t)maximumDrawableCount
{
  unsigned int v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = maximumDrawableCount_atom;
  if (!maximumDrawableCount_atom)
  {
    v3 = CAInternAtomWithCString("maximumDrawableCount");
    maximumDrawableCount_atom = v3;
  }
  v5[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)0xE, v5);
  return (unint64_t)v5[0];
}

- (void)setMaximumDrawableCount:(unint64_t)a3
{
  uint64_t v5;
  double v6[2];

  v6[1] = *(double *)MEMORY[0x1E0C80C00];
  v5 = maximumDrawableCount_atom;
  if (!maximumDrawableCount_atom)
  {
    v5 = CAInternAtomWithCString("maximumDrawableCount");
    maximumDrawableCount_atom = v5;
  }
  *(_QWORD *)&v6[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)0xE, v6);
}

- (BOOL)lowLatency
{
  unsigned int v3;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = lowLatency_atom;
  if (!lowLatency_atom)
  {
    v3 = CAInternAtomWithCString("lowLatency");
    lowLatency_atom = v3;
  }
  v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (void)setLowLatency:(BOOL)a3
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = lowLatency_atom;
  if (!lowLatency_atom)
  {
    v5 = CAInternAtomWithCString("lowLatency");
    lowLatency_atom = v5;
  }
  v6 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (void)setInputTime:(double)a3
{
  _CAEAGLNativeWindow *win;

  win = self->_win;
  if (win)
  {
    if (*((double *)win + 20) != 0.0)
      NSLog(CFSTR("[CAEAGLLayer setInputTime:] - non-zero time already exists!"), a2);
    *((double *)win + 20) = a3;
  }
}

- (double)inputTime
{
  _CAEAGLNativeWindow *win;

  win = self->_win;
  if (win)
    return *((double *)win + 20);
  else
    return 0.0;
}

- (void)setDrawableTimeoutSeconds:(double)a3
{
  _CAEAGLNativeWindow *win;

  win = self->_win;
  if (win)
    *((double *)win + 21) = a3;
}

- (double)drawableTimeoutSeconds
{
  _CAEAGLNativeWindow *win;

  win = self->_win;
  if (win)
    return *((double *)win + 21);
  else
    return 1.0;
}

@end
