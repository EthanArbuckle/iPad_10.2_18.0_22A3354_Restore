@implementation CWFEAP8021X

- (CWFEAP8021X)initWithInterfaceName:(id)a3
{
  id v4;
  CWFEAP8021X *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CWFEAP8021X *v10;
  uint64_t v11;
  NSString *interfaceName;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *mutexQueue;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *eventQueue;
  SCDynamicStoreRef v19;
  SCDynamicStoreContext v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CWFEAP8021X;
  v5 = -[CWFEAP8021X init](&v22, sel_init);
  v10 = v5;
  if (!v4)
    goto LABEL_6;
  if (!v5)
    goto LABEL_6;
  v11 = objc_msgSend_copy(v4, v6, v7, v8, v9);
  interfaceName = v10->_interfaceName;
  v10->_interfaceName = (NSString *)v11;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = dispatch_queue_create("com.apple.corewifi.EAP8021X-mutex", v13);
  mutexQueue = v10->_mutexQueue;
  v10->_mutexQueue = (OS_dispatch_queue *)v14;

  if (!v10->_mutexQueue)
    goto LABEL_6;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = dispatch_queue_create("com.apple.corewifi.EAP8021X-event", v16);
  eventQueue = v10->_eventQueue;
  v10->_eventQueue = (OS_dispatch_queue *)v17;

  if (!v10->_eventQueue
    || (v21.version = 0,
        memset(&v21.retain, 0, 24),
        v21.info = v10,
        v19 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("com.apple.corewifi.EAP8021X"), (SCDynamicStoreCallBack)sub_1B06E9C14, &v21), (v10->_storeRef = v19) == 0))
  {
LABEL_6:

    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  __SCDynamicStore *storeRef;
  objc_super v4;

  storeRef = self->_storeRef;
  if (storeRef)
    CFRelease(storeRef);
  v4.receiver = self;
  v4.super_class = (Class)CWFEAP8021X;
  -[CWFEAP8021X dealloc](&v4, sel_dealloc);
}

- (CWFEAP8021X)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("-[CWFEAP8021X init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)__startEventMonitoring
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const void *v21;
  const __CFArray *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  char *v28;
  const char *v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!qword_1ECFD6AE8)
  {
    v31 = xmmword_1E61354A8;
    v32 = 0;
    qword_1ECFD6AE8 = _sl_dlopen();
  }
  if (qword_1ECFD6AE8)
  {
    v6 = objc_msgSend_UTF8String(self->_interfaceName, a2, v2, v3, v4);
    v11 = v6;
    *(_QWORD *)&v31 = 0;
    *((_QWORD *)&v31 + 1) = &v31;
    v32 = 0x2020000000;
    v12 = off_1ECFD6AF0;
    v33 = off_1ECFD6AF0;
    if (!off_1ECFD6AF0)
    {
      v13 = sub_1B06EA89C(v6, v7, v8, v9, v10);
      v12 = dlsym(v13, "EAPOLControlKeyCreate");
      *(_QWORD *)(*((_QWORD *)&v31 + 1) + 24) = v12;
      off_1ECFD6AF0 = v12;
    }
    _Block_object_dispose(&v31, 8);
    if (!v12)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15, v16, v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v24, (uint64_t)"CFStringRef soft_EAPOLControlKeyCreate(const char *)", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = dlerror();
      objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v23, v29, (uint64_t)v27, (uint64_t)CFSTR("CWFEAP8021X.m"), 33, CFSTR("%s"), v28);

      __break(1u);
    }
    v18 = ((uint64_t (*)(uint64_t))v12)(v11);
    v21 = (const void *)v18;
    if (v18)
    {
      v30 = v18;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v19, (uint64_t)&v30, 1, v20);
      v22 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
      if (SCDynamicStoreSetNotificationKeys(self->_storeRef, v22, 0))
        SCDynamicStoreSetDispatchQueue(self->_storeRef, (dispatch_queue_t)self->_eventQueue);
      CFRelease(v21);

    }
  }
}

- (void)startEventMonitoring
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06EA0D0;
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
  block[2] = sub_1B06EA16C;
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
  v5[2] = sub_1B06EA258;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)controlState:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CFTypeRef cf;
  unsigned int v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  cf = 0;
  if (!qword_1ECFD6AE8)
  {
    v18 = xmmword_1E61354A8;
    v19 = 0;
    qword_1ECFD6AE8 = _sl_dlopen();
  }
  if (!qword_1ECFD6AE8)
    goto LABEL_11;
  v7 = objc_msgSend_UTF8String(self->_interfaceName, a2, (uint64_t)a3, v3, v4);
  sub_1B06EA3AC(v7, (const char *)&v17, (uint64_t)&cf, v8, v9);
  if (!v10)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v11, v17, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, *MEMORY[0x1E0CB2F90], v10, 0);
    v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    v14 = 0;
  }
LABEL_6:
  if (cf)
    CFRelease(cf);
  return v14;
}

- (id)supplicantState:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CFTypeRef cf;
  int v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  cf = 0;
  if (!qword_1ECFD6AE8)
  {
    v18 = xmmword_1E61354A8;
    v19 = 0;
    qword_1ECFD6AE8 = _sl_dlopen();
  }
  if (!qword_1ECFD6AE8)
    goto LABEL_11;
  v7 = objc_msgSend_UTF8String(self->_interfaceName, a2, (uint64_t)a3, v3, v4);
  sub_1B06EA3AC(v7, (const char *)&v17, (uint64_t)&cf, v8, v9);
  if (!v10)
  {
    objc_msgSend_objectForKeyedSubscript_((void *)cf, v11, (uint64_t)CFSTR("SupplicantState"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, *MEMORY[0x1E0CB2F90], v10, 0);
    v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    v14 = 0;
  }
LABEL_6:
  if (cf)
    CFRelease(cf);
  return v14;
}

- (id)controlMode:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CFTypeRef cf;
  int v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  cf = 0;
  if (!qword_1ECFD6AE8)
  {
    v18 = xmmword_1E61354A8;
    v19 = 0;
    qword_1ECFD6AE8 = _sl_dlopen();
  }
  if (!qword_1ECFD6AE8)
    goto LABEL_11;
  v7 = objc_msgSend_UTF8String(self->_interfaceName, a2, (uint64_t)a3, v3, v4);
  sub_1B06EA3AC(v7, (const char *)&v17, (uint64_t)&cf, v8, v9);
  if (!v10)
  {
    objc_msgSend_objectForKeyedSubscript_((void *)cf, v11, (uint64_t)CFSTR("Mode"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, *MEMORY[0x1E0CB2F90], v10, 0);
    v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    v14 = 0;
  }
LABEL_6:
  if (cf)
    CFRelease(cf);
  return v14;
}

- (id)clientStatus:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CFTypeRef cf;
  int v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  cf = 0;
  if (!qword_1ECFD6AE8)
  {
    v18 = xmmword_1E61354A8;
    v19 = 0;
    qword_1ECFD6AE8 = _sl_dlopen();
  }
  if (!qword_1ECFD6AE8)
    goto LABEL_11;
  v7 = objc_msgSend_UTF8String(self->_interfaceName, a2, (uint64_t)a3, v3, v4);
  sub_1B06EA3AC(v7, (const char *)&v17, (uint64_t)&cf, v8, v9);
  if (!v10)
  {
    objc_msgSend_objectForKeyedSubscript_((void *)cf, v11, (uint64_t)CFSTR("ClientStatus"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, *MEMORY[0x1E0CB2F90], v10, 0);
    v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    v14 = 0;
  }
LABEL_6:
  if (cf)
    CFRelease(cf);
  return v14;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end
