@implementation FigCaptureThermalMonitor

void __32__FigCaptureThermalMonitor_init__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  uint64_t v5;
  uint64_t state64;

  v4 = (void *)MEMORY[0x1A858DD40]();
  state64 = 0;
  if (!notify_get_state(a2, &state64))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "referencedObject");
    -[FigCaptureThermalMonitor _thermalNotification:](v5, state64);
  }
  objc_autoreleasePoolPop(v4);
}

- (uint64_t)_thermalNotification:(uint64_t)result
{
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v5;
  float v6;
  float v7;
  int v8;
  NSObject *v10;

  if (result)
  {
    v3 = result;
    if (dword_1ECFE9950)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    pthread_mutex_lock(*(pthread_mutex_t **)(v3 + 32));
    if (a2 <= 0x1D)
      v5 = a2 == 20;
    else
      v5 = 2;
    if (a2 <= 0x1D)
      v6 = 1.0;
    else
      v6 = 0.0;
    v7 = *(float *)(v3 + 40);
    *(float *)(v3 + 40) = v6;
    v8 = *(_DWORD *)(v3 + 44);
    *(_DWORD *)(v3 + 44) = v5;
    result = pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 32));
    if (v6 != v7 || v5 != v8)
    {
      if (dword_1ECFE9950)
      {
        v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      result = *(_QWORD *)(v3 + 24);
      if (result)
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
    }
  }
  return result;
}

- (void)dealloc
{
  int registrationToken;
  objc_super v4;

  registrationToken = self->_registrationToken;
  if ((registrationToken & 0x80000000) == 0)
    notify_cancel(registrationToken);

  FigSimpleMutexDestroy();
  v4.receiver = self;
  v4.super_class = (Class)FigCaptureThermalMonitor;
  -[FigCaptureThermalMonitor dealloc](&v4, sel_dealloc);
}

- (FigCaptureThermalMonitor)init
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[6];
  _QWORD handler[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FigCaptureThermalMonitor;
  v2 = -[FigCaptureThermalMonitor init](&v11, sel_init);
  if (v2)
  {
    v3 = FigSimpleMutexCreate();
    *((_QWORD *)v2 + 4) = v3;
    if (!v3)
      goto LABEL_7;
    *((_DWORD *)v2 + 4) = -1;
    *((_DWORD *)v2 + 10) = 1065353216;
    v4 = FigDispatchQueueCreateWithPriority();
    *((_QWORD *)v2 + 1) = v4;
    if (!v4)
      goto LABEL_7;
    v5 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", v2);
    v6 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __32__FigCaptureThermalMonitor_init__block_invoke;
    handler[3] = &unk_1E491FB78;
    handler[4] = v5;
    if (!notify_register_dispatch((const char *)*MEMORY[0x1E0C83A00], (int *)v2 + 4, *((dispatch_queue_t *)v2 + 1), handler))
    {
      v7 = *((_QWORD *)v2 + 1);
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __32__FigCaptureThermalMonitor_init__block_invoke_2;
      block[3] = &unk_1E491F480;
      block[4] = v2;
      block[5] = handler;
      dispatch_sync(v7, block);
    }
    else
    {
LABEL_7:
      FigDebugAssert3();

      return 0;
    }
  }
  return (FigCaptureThermalMonitor *)v2;
}

- (float)maxTorchLevel
{
  float maxTorchLevel;

  pthread_mutex_lock((pthread_mutex_t *)self->_thermalNotificationLock);
  maxTorchLevel = self->_maxTorchLevel;
  pthread_mutex_unlock((pthread_mutex_t *)self->_thermalNotificationLock);
  return maxTorchLevel;
}

- (int)thermalLevel
{
  int thermalLevel;

  pthread_mutex_lock((pthread_mutex_t *)self->_thermalNotificationLock);
  thermalLevel = self->_thermalLevel;
  pthread_mutex_unlock((pthread_mutex_t *)self->_thermalNotificationLock);
  return thermalLevel;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

uint64_t __32__FigCaptureThermalMonitor_init__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)setThermalHandler:(id)a3
{
  self->_thermalHandler = (id)objc_msgSend(a3, "copy");
}

@end
