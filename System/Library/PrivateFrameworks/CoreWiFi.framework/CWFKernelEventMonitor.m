@implementation CWFKernelEventMonitor

+ (id)descriptionForKernelEventCode:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 - 1 < 0x1E)
    return *(&off_1E61334E8 + a3 - 1);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("? (%lu)"), v3, v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CWFKernelEventMonitor)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  int v9;
  unsigned int v10;
  dispatch_source_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  CWFKernelEventMonitor *v16;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  int v24;
  int *v25;
  char *v26;
  id v27;
  int v28;
  int *v29;
  char *v30;
  id v31;
  _QWORD v32[4];
  CWFKernelEventMonitor *v33;
  unsigned int v34;
  _QWORD handler[4];
  unsigned int v36;
  uint64_t v37;
  int v38;
  objc_super v39;
  int v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)CWFKernelEventMonitor;
  v2 = -[CWFKernelEventMonitor init](&v39, sel_init);
  if (!v2)
    goto LABEL_29;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.corewifi.kevent-mutex", v3);
  v5 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v4;

  if (!*((_QWORD *)v2 + 1))
    goto LABEL_29;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create("com.apple.corewifi.kevent-event", v6);
  v8 = (void *)*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 2) = v7;

  if (!*((_QWORD *)v2 + 2))
    goto LABEL_29;
  v9 = socket(32, 3, 1);
  v10 = v9;
  if (v9 < 0)
  {
    CWFGetOSLog();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      CWFGetOSLog();
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = MEMORY[0x1E0C81028];
      v23 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v24 = *__error();
      v25 = __error();
      v26 = strerror(*v25);
      v40 = 136447234;
      v41 = "-[CWFKernelEventMonitor init]";
      v42 = 2082;
      v43 = "CWFKernelEventMonitor.m";
      v44 = 1024;
      v45 = 185;
      v46 = 1024;
      v47 = v24;
      v48 = 2082;
      v49 = v26;
      _os_log_send_and_compose_impl();
    }

    if (v10 == -1)
      goto LABEL_29;
    goto LABEL_28;
  }
  v38 = 2;
  v37 = 0x100000001;
  if (ioctl(v9, 0x800C6502uLL, &v37))
  {
    CWFGetOSLog();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      CWFGetOSLog();
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v27 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v28 = *__error();
    v29 = __error();
    v30 = strerror(*v29);
    v40 = 136447234;
    v41 = "-[CWFKernelEventMonitor init]";
    v42 = 2082;
    v43 = "CWFKernelEventMonitor.m";
    v44 = 1024;
    v45 = 188;
    v46 = 1024;
    v47 = v28;
    v48 = 2082;
    v49 = v30;
    goto LABEL_26;
  }
  v11 = dispatch_source_create(MEMORY[0x1E0C80DB8], v10, 0, *((dispatch_queue_t *)v2 + 2));
  v12 = (void *)*((_QWORD *)v2 + 3);
  *((_QWORD *)v2 + 3) = v11;

  v13 = *((_QWORD *)v2 + 3);
  if (!v13)
  {
    CWFGetOSLog();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      CWFGetOSLog();
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v31 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v40 = 136446722;
    v41 = "-[CWFKernelEventMonitor init]";
    v42 = 2082;
    v43 = "CWFKernelEventMonitor.m";
    v44 = 1024;
    v45 = 191;
LABEL_26:
    _os_log_send_and_compose_impl();
LABEL_27:

LABEL_28:
    close(v10);
LABEL_29:

    return 0;
  }
  v14 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_1B065DDE8;
  handler[3] = &unk_1E61334A0;
  v36 = v10;
  dispatch_source_set_cancel_handler(v13, handler);
  v15 = *((_QWORD *)v2 + 3);
  v32[0] = v14;
  v32[1] = 3221225472;
  v32[2] = sub_1B065DDF0;
  v32[3] = &unk_1E61334C8;
  v34 = v10;
  v16 = (CWFKernelEventMonitor *)v2;
  v33 = v16;
  dispatch_source_set_event_handler(v15, v32);

  dispatch_activate(*((dispatch_object_t *)v2 + 3));
  return v16;
}

- (void)dealloc
{
  NSObject *keventSource;
  objc_super v4;

  keventSource = self->_keventSource;
  if (keventSource)
    dispatch_source_cancel(keventSource);
  v4.receiver = self;
  v4.super_class = (Class)CWFKernelEventMonitor;
  -[CWFKernelEventMonitor dealloc](&v4, sel_dealloc);
}

- (void)startEventMonitoring
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B065E4C8;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B065E554;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  NSObject *mutexQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B065E614;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)interfaceFlagsWithInterfaceName:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  int v15;
  unint64_t v16;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = v3;
  v18 = 0u;
  v19 = 0u;
  if (v3
    && objc_msgSend_length(v3, v4, v5, v6, v7)
    && (unint64_t)objc_msgSend_length(v8, v9, v10, v11, v12) <= 0x10
    && (v13 = socket(30, 2, 0), v13 != -1))
  {
    v15 = v13;
    if (objc_msgSend_getCString_maxLength_encoding_(v8, v14, (uint64_t)&v18, 16, 4))
      ioctl(v15, 0xC0206911uLL, &v18);
    close(v15);
    v16 = (__int16)v19;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_keventSource, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end
