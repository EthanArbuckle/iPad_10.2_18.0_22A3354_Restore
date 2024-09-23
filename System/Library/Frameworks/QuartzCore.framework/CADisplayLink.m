@implementation CADisplayLink

+ (BOOL)supportsExpectedWakeupBeforeCommitDeadline
{
  return CA::Transaction::_update_cycle_support_enabled;
}

- (CFTimeInterval)timestamp
{
  return CATimeWithHostTime(*((_QWORD *)self->_impl + 35));
}

+ (double)expectedWakeupBeforeCommitDeadline:(double)a3
{
  unint64_t v3;
  id v4;
  double v5;
  unint64_t v6;
  __CFRunLoop *Main;
  CFRunLoopMode v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  int v12;
  const void *v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  CFTypeRef *v17;
  unint64_t v18;
  unint64_t v19;
  int v21;
  unint64_t v22;

  v3 = CAHostTimeWithTime(a3);
  v4 = +[CADisplay mainDisplay](CADisplay, "mainDisplay");
  if (v4)
  {
    objc_msgSend(v4, "refreshRate");
    v6 = CAHostTimeWithTime(v5);
    Main = CFRunLoopGetMain();
    v8 = CFRunLoopCopyCurrentMode(Main);
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Display::DisplayLink::_next_wakeup_info_lock);
    if (CA::Display::DisplayLink::_next_wakeup_info_count)
    {
      v9 = 0;
      v22 = 0;
      v10 = v3 - v6 + (v6 >> 3);
      if (Main)
        v11 = v8 == 0;
      else
        v11 = 1;
      v12 = !v11;
      v13 = (const void *)*MEMORY[0x1E0C9B270];
      v21 = v12;
      do
      {
        v14 = *((_QWORD *)&CA::Display::DisplayLink::_next_wakeup_info_list + 5 * v9 + 1);
        if (v14 < v10)
        {
          v15 = *((_QWORD *)&CA::Display::DisplayLink::_next_wakeup_info_list + 5 * v9 + 3);
          if (v15)
          {
            v16 = (char *)&CA::Display::DisplayLink::_next_wakeup_info_list + 40 * v9;
            if (v15 == 1)
            {
              v17 = (CFTypeRef *)(v16 + 32);
              if (v12)
              {
LABEL_16:
                while (*v17)
                {
                  if (CFEqual(*v17, v8) || CFEqual(*v17, v13) && _CFRunLoop01())
                  {
                    v18 = v22;
                    if (v22 <= v14)
                      v18 = v14;
                    v22 = v18;
                    break;
                  }
                  ++v17;
                  if (!--v15)
                    break;
                }
                v12 = v21;
              }
            }
            else
            {
              v17 = (CFTypeRef *)*((_QWORD *)v16 + 4);
              if (v12)
                goto LABEL_16;
            }
          }
        }
        ++v9;
      }
      while (v9 < CA::Display::DisplayLink::_next_wakeup_info_count);
      CFRelease(v8);
      v19 = v22;
    }
    else
    {
      v19 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&CA::Display::DisplayLink::_next_wakeup_info_lock);
  }
  else
  {
    v19 = 0;
  }
  return CATimeWithHostTime(v19);
}

- (CAFrameRateRange)preferredFrameRateRange
{
  float *impl;
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  impl = (float *)self->_impl;
  v3 = impl[19];
  v4 = impl[20];
  v5 = impl[21];
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

+ (void)dispatchDeferredDisplayLinks
{
  if (_CFRunLoopCurrentIsMain())
    CA::Display::DisplayLink::dispatch_deferred_display_links((CA::Display::DisplayLink *)0xFFFFFFFFLL);
  else
    CA_ABORT_ON_NON_MAIN_THREAD_DEFERRED_DISPLAY_LINK_ACTION();
}

- (BOOL)isPaused
{
  return *((_BYTE *)self->_impl + 316) & 1;
}

- (void)setPaused:(BOOL)paused
{
  CA::Display::DisplayLinkItem::set_paused((CA::Display::DisplayLinkItem *)self->_impl, paused);
}

- (unsigned)highFrameRateReason
{
  return *((_DWORD *)self->_impl + 22);
}

- (void)dealloc
{
  void *impl;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
    (*(void (**)(void *, SEL))(*(_QWORD *)impl + 8))(impl, a2);
  v4.receiver = self;
  v4.super_class = (Class)CADisplayLink;
  -[CADisplayLink dealloc](&v4, sel_dealloc);
}

- (void)setHighFrameRateReasons:(const unsigned int *)a3 count:(unint64_t)a4
{
  CA::Display::DisplayLinkItem::set_reasons((CA::Display::DisplayLinkItem *)self->_impl, a3, a4);
}

- (CFTimeInterval)targetTimestamp
{
  return CATimeWithHostTime(*((_QWORD *)self->_impl + 36));
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)preferredFrameRateRange
{
  float preferred;
  float maximum;
  float minimum;
  uint64_t v7;
  CAFrameRateRange v8;

  preferred = preferredFrameRateRange.preferred;
  maximum = preferredFrameRateRange.maximum;
  minimum = preferredFrameRateRange.minimum;
  if (!CAFrameRateRangeIsValid(preferredFrameRateRange.minimum, preferredFrameRateRange.maximum, preferredFrameRateRange.preferred))
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid range (minimum: %.2f maximum: %.2f preferred: %.2f)"), minimum, maximum, preferred);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v7, 0));
  }
  v8.minimum = minimum;
  v8.maximum = maximum;
  v8.preferred = preferred;
  CA::Display::DisplayLinkItem::set_preferred_fps_range((CA::Display::DisplayLink **)self->_impl, v8, 1, 1);
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Display::DisplayLinkItem::set_reasons((CA::Display::DisplayLinkItem *)self->_impl, &v3, 1u);
}

- (NSInteger)preferredFramesPerSecond
{
  return (int)*((float *)self->_impl + 21);
}

- (CFTimeInterval)duration
{
  void *impl;
  uint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  double v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int v10;
  double v11;
  double v13;

  impl = self->_impl;
  os_unfair_lock_lock((os_unfair_lock_t)impl + 2);
  v3 = *((_QWORD *)impl + 2);
  if ((*(_BYTE *)(v3 + 697) & 1) == 0)
  {
LABEL_23:
    v11 = CATimeWithHostTime(*((_QWORD *)impl + 38));
    goto LABEL_24;
  }
  if (CADeviceIsPhone::once[0] != -1)
    dispatch_once(CADeviceIsPhone::once, &__block_literal_global_134);
  v4 = CADeviceIsPhone::phone;
  if ((*(_BYTE *)(v3 + 697) & 2) == 0
    || (!CADeviceIsPhone::phone || (dyld_program_sdk_at_least() & 1) == 0) && !dyld_program_sdk_at_least())
  {
    if ((dyld_program_sdk_at_least() & 1) == 0 && (v4 || !dyld_program_sdk_at_least()))
    {
      v13 = CATimeWithHostTime(*((_QWORD *)impl + 38));
      v11 = v13 + v13;
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  v5 = CA::Display::DisplayTimingsControl::server_frame_interval((CA::Display::DisplayTimingsControl *)(v3 + 464), 0);
  if (!v5)
  {
    if ((*(_BYTE *)(v3 + 697) & 1) != 0)
      v6 = 2;
    else
      v6 = 1;
    if (v6 <= *(_DWORD *)(v3 + 520))
      v6 = *(_DWORD *)(v3 + 520);
    if (v6 <= *(_DWORD *)(v3 + 552))
      v6 = *(_DWORD *)(v3 + 552);
    if (v6 <= *(_DWORD *)(v3 + 524))
      v5 = *(_DWORD *)(v3 + 524);
    else
      v5 = v6;
  }
  v7 = (double)v5;
  v8 = 528;
  if ((*(_BYTE *)(v3 + 697) & 8) == 0)
    v8 = 512;
  v9 = CAHostTimeWithTime(*(double *)(v3 + v8));
  v10 = CA::Display::DisplayTimingsControl::granularity((CA::Display::DisplayTimingsControl *)(v3 + 464), v9);
  v11 = CATimeWithHostTime(v10) * v7;
LABEL_24:
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 2);
  return v11;
}

- (void)removeFromRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode
{
  CA::Display::DisplayLinkItem::unschedule((CA::Display::DisplayLinkItem *)self->_impl, -[NSRunLoop getCFRunLoop](runloop, "getCFRunLoop"), (const __CFString *)mode);
}

- (void)addToRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode
{
  CA::Display::DisplayLinkItem::schedule((CA::Display::DisplayLinkItem *)self->_impl, -[NSRunLoop getCFRunLoop](runloop, "getCFRunLoop"), (const __CFString *)mode);
}

- (void)invalidate
{
  (*(void (**)(void *))(*(_QWORD *)self->_impl + 16))(self->_impl);
}

- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond
{
  CAFrameRateRange v3;

  v3.minimum = (float)(int)preferredFramesPerSecond;
  v3.maximum = (float)(int)preferredFramesPerSecond;
  v3.preferred = (float)(int)preferredFramesPerSecond;
  CA::Display::DisplayLinkItem::set_preferred_fps_range((CA::Display::DisplayLink **)self->_impl, v3, 1, 0);
}

+ (CADisplayLink)displayLinkWithTarget:(id)target selector:(SEL)sel
{
  CADisplayLink *result;

  result = +[CADisplay mainDisplay](CADisplay, "mainDisplay");
  if (result)
    return (CADisplayLink *)objc_msgSend(a1, "displayLinkWithDisplay:target:selector:", result, target, sel);
  return result;
}

+ (CADisplayLink)displayLinkWithDisplay:(id)a3 target:(id)a4 selector:(SEL)a5
{
  CA::Display::DisplayLinkItem *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = (CA::Display::DisplayLinkItem *)operator new();
  CA::Display::DisplayLinkItem::DisplayLinkItem(v8, *((id **)a3 + 1), a4, (objc_selector *)a5);
  if (objc_msgSend(a3, "isExternal"))
  {
    if (x_log_hook_p())
    {
      objc_msgSend(a3, "displayId");
      x_log_();
    }
    else
    {
      v9 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v14 = objc_msgSend(a3, "displayId");
        _os_log_impl(&dword_184457000, v9, OS_LOG_TYPE_DEFAULT, "CADisplayLink: new link for external display id %u", buf, 8u);
      }
    }
  }
  if ((*(_WORD *)(*((_QWORD *)a3 + 1) + 760) & 0x800) != 0)
  {
    if (x_log_hook_p())
    {
      objc_msgSend(a3, "displayId");
      x_log_();
    }
    else
    {
      v10 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend(a3, "displayId");
        *(_DWORD *)buf = 67109120;
        v14 = v11;
        _os_log_impl(&dword_184457000, v10, OS_LOG_TYPE_DEFAULT, "CADisplayLink is created from an immutable display (display_id = %u) and will not receive vsync timings.", buf, 8u);
      }
    }
  }
  return (CADisplayLink *)-[CADisplayLink _initWithDisplayLinkItem:]([CADisplayLink alloc], "_initWithDisplayLinkItem:", v8);
}

- (id)_initWithDisplayLinkItem:(void *)a3
{
  CADisplayLink *v4;
  CADisplayLink *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CADisplayLink;
  v4 = -[CADisplayLink init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_impl = a3;
    *((_QWORD *)a3 + 32) = v4;
  }
  else if (a3)
  {
    (*(void (**)(void *))(*(_QWORD *)a3 + 8))(a3);
  }
  return v5;
}

+ (void)setWillFireHandler:(id)a3
{
  if (_CFRunLoopCurrentIsMain())
  {
    _Block_release((const void *)CA::Display::DisplayLink::_will_fire_handler_external);
    CA::Display::DisplayLink::_will_fire_handler_external = (uint64_t)_Block_copy(a3);
  }
  else
  {
    CA_ABORT_ON_NON_MAIN_THREAD_DEFERRED_DISPLAY_LINK_ACTION();
  }
}

- (CADisplay)display
{
  os_unfair_lock_s *impl;
  os_unfair_lock_s *v3;
  CADisplay *v4;

  impl = (os_unfair_lock_s *)self->_impl;
  v3 = impl + 2;
  os_unfair_lock_lock(impl + 2);
  v4 = *(CADisplay **)(*(_QWORD *)&impl[4]._os_unfair_lock_opaque + 80);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (double)maximumRefreshRate
{
  os_unfair_lock_s *impl;
  uint64_t v3;
  uint64_t v4;
  double v5;

  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl + 2);
  v3 = *(_QWORD *)&impl[4]._os_unfair_lock_opaque;
  v4 = 528;
  if ((*(_BYTE *)(v3 + 697) & 8) == 0)
    v4 = 496;
  v5 = *(double *)(v3 + v4);
  os_unfair_lock_unlock(impl + 2);
  return v5;
}

- (int64_t)priority
{
  return *((_QWORD *)self->_impl + 6);
}

- (void)setPriority:(int64_t)a3
{
  char *impl;
  uint64_t v4;
  char *v5;
  void **v6;
  void **v7;
  int64_t v8;
  NSObject *v9;
  char *v10;
  uint8_t buf[8];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  impl = (char *)self->_impl;
  if (*((_QWORD *)impl + 6) != a3)
  {
    *((_QWORD *)impl + 6) = a3;
    if (*((_QWORD *)impl + 33))
    {
      pthread_mutex_lock((pthread_mutex_t *)(impl + 136));
      v4 = *((_QWORD *)impl + 33);
      v10 = impl;
      pthread_mutex_lock((pthread_mutex_t *)(v4 + 56));
      v5 = *(char **)(v4 + 120);
      v6 = *(void ***)(v4 + 128);
      v7 = (void **)v5;
      if (v5 != (char *)v6)
      {
        while (*v7 != impl)
        {
          if (++v7 == v6)
          {
            v7 = *(void ***)(v4 + 128);
            break;
          }
        }
      }
      if (v7 == v6)
      {
        if (x_log_hook_p())
        {
          x_log_();
        }
        else
        {
          v9 = x_log_category_windowserver;
          if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_184457000, v9, OS_LOG_TYPE_ERROR, "CADisplayLink: reload_item, item does not exist", buf, 2u);
          }
        }
      }
      else
      {
        v8 = (char *)v6 - (char *)(v7 + 1);
        if (v6 != v7 + 1)
        {
          memmove(v7, v7 + 1, (char *)v6 - (char *)(v7 + 1));
          v5 = *(char **)(v4 + 120);
        }
        *(_QWORD *)(v4 + 128) = (char *)v7 + v8;
        if (v5 != (char *)v7 + v8)
        {
          while (*(_QWORD *)(*(_QWORD *)v5 + 48) >= *((_QWORD *)impl + 6))
          {
            v5 += 8;
            if (v5 == (char *)v7 + v8)
            {
              v5 = (char *)v7 + v8;
              break;
            }
          }
        }
        std::vector<CA::Display::DisplayLinkItem *>::insert(v4 + 120, v5, (char *)&v10);
      }
      pthread_mutex_unlock((pthread_mutex_t *)(v4 + 56));
      pthread_mutex_unlock((pthread_mutex_t *)(impl + 136));
    }
  }
}

- (void)setFrameInterval:(NSInteger)frameInterval
{
  CA::Display::DisplayLink **impl;
  int v4;
  CAFrameRateRange v5;

  impl = (CA::Display::DisplayLink **)self->_impl;
  if (frameInterval <= 1)
    v4 = 1;
  else
    v4 = frameInterval;
  v5.minimum = (float)(int)(60.0 / (double)v4);
  v5.maximum = v5.minimum;
  v5.preferred = v5.minimum;
  CA::Display::DisplayLinkItem::set_preferred_fps_range(impl, v5, 1, 0);
}

- (NSInteger)frameInterval
{
  int v3;
  int v4;

  v3 = CA::Display::DisplayLinkItem::display_minimum_frame_duration((os_unfair_lock_s *)self->_impl);
  v4 = *((_DWORD *)self->_impl + 14);
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    if (v4 / v3 <= 1)
      return 1;
    else
      v4 /= v3;
  }
  return v4;
}

- (void)setUserInfo:(id)a3
{
  char *impl;
  _opaque_pthread_t *v5;
  id v6;

  impl = (char *)self->_impl;
  pthread_mutex_lock((pthread_mutex_t *)(impl + 136));
  while (1)
  {
    v5 = (_opaque_pthread_t *)*((_QWORD *)impl + 31);
    if (!v5 || v5 == pthread_self())
      break;
    pthread_cond_wait((pthread_cond_t *)(impl + 200), (pthread_mutex_t *)(impl + 136));
  }
  v6 = (id)*((_QWORD *)impl + 5);
  if (v6 != a3)
  {
    if (v6)
      CFRelease(v6);
    *((_QWORD *)impl + 5) = a3;
    if (a3)
      CFRetain(a3);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(impl + 136));
}

- (id)userInfo
{
  return (id)*((_QWORD *)self->_impl + 5);
}

- (double)heartbeatRate
{
  os_unfair_lock_s *impl;
  uint64_t v3;
  uint64_t v4;
  double v5;

  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl + 2);
  v3 = *(_QWORD *)&impl[4]._os_unfair_lock_opaque;
  v4 = 528;
  if ((*(_BYTE *)(v3 + 697) & 8) == 0)
    v4 = 512;
  v5 = *(double *)(v3 + v4);
  os_unfair_lock_unlock(impl + 2);
  return v5;
}

- (int64_t)minimumFrameDuration
{
  return CA::Display::DisplayLinkItem::display_minimum_frame_duration((os_unfair_lock_s *)self->_impl);
}

- (int64_t)actualFramesPerSecond
{
  os_unfair_lock_s *impl;
  uint64_t v3;
  uint64_t v4;
  double v5;
  float v6;

  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl + 2);
  v3 = *(_QWORD *)&impl[4]._os_unfair_lock_opaque;
  v4 = 528;
  if ((*(_BYTE *)(v3 + 697) & 8) == 0)
    v4 = 512;
  v5 = *(double *)(v3 + v4);
  os_unfair_lock_unlock(impl + 2);
  v6 = 1.0 / v5;
  return (int)(float)(roundf(v6) / (float)(int)impl[14]._os_unfair_lock_opaque);
}

- (BOOL)active
{
  _QWORD *impl;
  _BOOL4 v3;

  impl = self->_impl;
  if (impl[33])
    return (*((unsigned __int8 *)impl + 316) >> 3) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

+ (int64_t)willFireInfoVersion
{
  return 2;
}

+ (void)dispatchDeferredDisplayLinksWithDisplayId:(unsigned int)a3
{
  CA::Display::DisplayLink *v3;

  v3 = *(CA::Display::DisplayLink **)&a3;
  if (_CFRunLoopCurrentIsMain())
    CA::Display::DisplayLink::dispatch_deferred_display_links(v3);
  else
    CA_ABORT_ON_NON_MAIN_THREAD_DEFERRED_DISPLAY_LINK_ACTION();
}

+ (void)dispatchDeferredDisplayLink:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  CFArrayRef v9;
  __CFRunLoop *v10;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  os_unfair_lock_lock((os_unfair_lock_t)&CA::Display::DisplayLink::_list_lock);
  v4 = CA::Display::DisplayLink::_list;
  if (!CA::Display::DisplayLink::_list)
    goto LABEL_5;
  while (1)
  {
    v5 = *(_QWORD *)(v4 + 232);
    if (v5)
    {
      if ((*(unsigned int (**)(uint64_t, unint64_t))(v5 + 16))(v5, a3))
        break;
    }
    v4 = *(_QWORD *)(v4 + 48);
    if (!v4)
      goto LABEL_5;
  }
  if (!*(_BYTE *)(v4 + 200))
    goto LABEL_5;
  *(_BYTE *)(v4 + 200) = 0;
  v6 = (unsigned int *)(v4 + 40);
LABEL_8:
  v7 = *v6;
  if (*v6)
  {
    do
    {
      v8 = __ldaxr(v6);
      if (v8 != v7)
      {
        __clrex();
        goto LABEL_8;
      }
    }
    while (__stlxr(v7 + 1, v6));
    os_unfair_lock_unlock((os_unfair_lock_t)&CA::Display::DisplayLink::_list_lock);
    v9 = *(CFArrayRef *)(v4 + 32);
    if (!v9)
    {
      *(_QWORD *)(v4 + 32) = v9;
    }
    v10 = *(__CFRunLoop **)(v4 + 16);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = ___ZN2CA7Display11DisplayLink30dispatch_deferred_display_linkEy_block_invoke;
    v11[3] = &__block_descriptor_40_e5_v8__0l;
    v11[4] = v4;
    CFRunLoopPerformBlock(v10, v9, v11);
    CFRunLoopWakeUp(*(CFRunLoopRef *)(v4 + 16));
  }
  else
  {
LABEL_5:
    os_unfair_lock_unlock((os_unfair_lock_t)&CA::Display::DisplayLink::_list_lock);
  }
}

+ (void)notifyDisplayChange:(unint64_t)a3
{
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id *v8;
  uint64_t v9;
  __CFRunLoop *v10;

  os_unfair_lock_lock(&CA::Display::MetalLinkItem::_list_lock);
  for (i = (uint64_t *)CA::Display::MetalLinkItem::_list; i != (uint64_t *)qword_1EDD0FCD8; ++i)
  {
    v5 = *i;
    if (*i == a3)
    {
      if (v5)
      {
        pthread_mutex_lock((pthread_mutex_t *)(v5 + 136));
        v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 320) + 32) + 16) + 48);
        if (v6)
          v7 = *(_DWORD *)(*(_QWORD *)(v6 + 24) + 24);
        else
          v7 = 0;
        v8 = (id *)*((_QWORD *)CADisplayLookupFromDisplayId(v7) + 1);
        os_unfair_lock_lock((os_unfair_lock_t)(v5 + 8));
        CA::Display::DisplayLinkItem::hot_swap_display((id)v5, v8);
        os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 8));
        CA::Display::DisplayLinkItem::set_preferred_fps_range_locked((CA::Display::DisplayLinkItem *)v5, *(CAFrameRateRange *)(v5 + 76), 0);
        v9 = *(_QWORD *)(v5 + 264);
        if (v9)
        {
          v10 = *(__CFRunLoop **)(v9 + 16);
          pthread_mutex_unlock((pthread_mutex_t *)(v5 + 136));
          if (v10)
            CA::Display::DisplayLinkItem::update_link((CA::Display::DisplayLinkItem *)v5, v10);
        }
        else
        {
          pthread_mutex_unlock((pthread_mutex_t *)(v5 + 136));
        }
      }
      break;
    }
  }
  os_unfair_lock_unlock(&CA::Display::MetalLinkItem::_list_lock);
}

@end
