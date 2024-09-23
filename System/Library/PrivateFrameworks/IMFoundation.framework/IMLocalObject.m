@implementation IMLocalObject

- (void)setProcessName:(id)a3
{
  id v3;

  v3 = (id)*((_QWORD *)self->_internal + 7);
  if (v3 != a3)
  {

    *((_QWORD *)self->_internal + 7) = a3;
  }
}

- (BOOL)wasInterrupted
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = *((_BYTE *)self->_internal + 103);
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

+ (void)initialize
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    qword_1ECD90F00 = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3740]);
    qword_1ECD90F38 = (uint64_t)(id)objc_msgSend_nonRetainingArray(MEMORY[0x1E0C99DE8], v3, v4, v5);
    IMRemoteObjectsRunLoopModes = (uint64_t)(id)objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v6, *MEMORY[0x1E0C99860], v7, *MEMORY[0x1E0C99748], CFSTR("IMRemoteObjectsRunLoopMode"), 0);
    objc_msgSend_sharedInstance(IMSystemMonitor, v8, v9, v10);
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
  }
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *internal;
  void **p_cache;
  const char *v16;
  uint64_t v17;
  _QWORD *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  const void *v22;
  __CFRunLoopSource *v23;
  NSObject *v24;
  objc_super v25;

  v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, 0, 0);
  internal = self->_internal;
  if (!internal)
    goto LABEL_18;
  p_cache = IMTimer.cache;
  if (dword_1ECD90A78 < 0)
  {
    if (qword_1ECD90F20 != -1)
    {
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
      p_cache = (void **)(IMTimer + 16);
    }
    internal = self->_internal;
    if (*((int *)p_cache + 670) <= 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (dword_1ECD90A78)
LABEL_4:
    _IMLog(CFSTR("* Dealloc IMLocalObject: %@"), v7, v8, v9, v10, v11, v12, v13, internal[6]);
LABEL_5:
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend__clearPort_(self, v16, 0, v17);
  v18 = self->_internal;
  v19 = (const void *)v18[7];
  if (v19)
  {
    CFRelease(v19);
    v18 = self->_internal;
  }
  v20 = (const void *)v18[6];
  if (v20)
  {
    CFRelease(v20);
    v18 = self->_internal;
  }
  v21 = (const void *)v18[8];
  if (v21)
  {
    CFRelease(v21);
    v18 = self->_internal;
  }
  v22 = (const void *)v18[9];
  if (v22)
  {
    CFRelease(v22);
    v18 = self->_internal;
  }
  v23 = (__CFRunLoopSource *)v18[10];
  if (v23)
  {
    CFRunLoopSourceInvalidate(v23);
    CFRelease(*((CFTypeRef *)self->_internal + 10));
    v18 = self->_internal;
  }
  v24 = v18[5];
  if (v24)
    dispatch_release(v24);
  os_unfair_recursive_lock_unlock();

  self->_internal = 0;
LABEL_18:
  v25.receiver = self;
  v25.super_class = (Class)IMLocalObject;
  -[IMLocalObject dealloc](&v25, sel_dealloc);
}

- (void)invalidate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *internal;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  qos_class_t v20;
  dispatch_qos_class_t v21;
  dispatch_block_t v22;
  NSObject *v23;
  __CFRunLoop *Main;
  __CFRunLoop *v25;
  const char *v26;
  const char *v27;
  uint8_t buf[16];
  _QWORD v29[5];
  _QWORD block[5];

  os_unfair_recursive_lock_lock_with_options();
  internal = self->_internal;
  if (!*((_WORD *)internal + 50))
  {
    internal[3] = 0;
    if (dword_1ECD90A78 < 0)
    {
      if (qword_1ECD90F20 != -1)
        dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
      if (dword_1ECD90A78 <= 0)
        goto LABEL_18;
    }
    else if (!dword_1ECD90A78)
    {
LABEL_18:
      objc_msgSend__clearPort_signalRunLoopIfNeeded_(self, v3, 0, 1);
      os_unfair_recursive_lock_unlock();
      return;
    }
    _IMLog(CFSTR("* Invalidating IMLocalObject: %@ (connection=%p) busy: %d"), (uint64_t)v3, v4, v5, v6, v7, v8, v9, *((_QWORD *)self->_internal + 6));
    goto LABEL_18;
  }
  if (*((_BYTE *)internal + 102))
  {
    if (_os_feature_enabled_impl() && im_primary_base_queue())
    {
      v11 = (void *)objc_opt_class();
      v15 = objc_msgSend__imLocalObjectQueueTargetingWorkloop(v11, v12, v13, v14);
    }
    else
    {
      v16 = (void *)objc_opt_class();
      v15 = objc_msgSend__imLocalObjectQueue(v16, v17, v18, v19);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19069A4DC;
    block[3] = &unk_1E2C45490;
    block[4] = self;
    dispatch_async(v15, block);
  }
  else
  {
    v20 = qos_class_self();
    if (v20 <= QOS_CLASS_DEFAULT)
      v21 = QOS_CLASS_DEFAULT;
    else
      v21 = v20;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_19069A4E4;
    v29[3] = &unk_1E2C45490;
    v29[4] = self;
    v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v21, 0, v29);
    v23 = OSLogHandleForIDSCategory("IMLocalObject");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19066D000, v23, OS_LOG_TYPE_DEFAULT, "******* trying to invalidate connection. Let's signal the runloop in case there is a pending history query", buf, 2u);
    }
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)IMRemoteObjectsRunLoopModes, v22);
    CFRunLoopSourceSignal(*((CFRunLoopSourceRef *)self->_internal + 10));
    v25 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v25);
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E0DE7910], v26, (uint64_t)self, (uint64_t)sel_invalidate, 0);
    objc_msgSend_performSelector_withObject_afterDelay_inModes_(self, v27, (uint64_t)sel_invalidate, 0, IMRemoteObjectsRunLoopModes, 0.0);
  }
  os_unfair_recursive_lock_unlock();
}

- (void)_clearPort:(BOOL)a3 signalRunLoopIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  unsigned __int8 *internal;
  _xpc_connection_s *v8;
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  __CFRunLoop *Main;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  __CFRunLoop *v32;
  __CFString *v33;
  const char *v34;
  uint64_t v35;
  qos_class_t v36;
  dispatch_qos_class_t v37;
  dispatch_block_t v38;
  NSObject *v39;
  __CFRunLoop *v40;
  __CFRunLoop *v41;
  void *v42;
  const char *v43;
  uint8_t buf[16];
  _QWORD v45[5];
  _QWORD block[5];

  v4 = a4;
  v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  *((_QWORD *)self->_internal + 3) = 0;
  internal = (unsigned __int8 *)self->_internal;
  v8 = (_xpc_connection_s *)*((_QWORD *)internal + 4);
  if (!v8
    || (v9 = internal[102],
        xpc_connection_cancel(v8),
        xpc_release(*((xpc_object_t *)self->_internal + 4)),
        *((_QWORD *)self->_internal + 4) = 0,
        objc_msgSend__unregisterIMLocalObject_(IMLocalObject, v10, (uint64_t)self, v11),
        v5))
  {
    os_unfair_recursive_lock_unlock();
    return;
  }
  if (dword_1ECD90A78 < 0)
  {
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    if (dword_1ECD90A78 <= 0)
      goto LABEL_7;
  }
  else if (!dword_1ECD90A78)
  {
    goto LABEL_7;
  }
  _IMLog(CFSTR("* IMLocalObject posting death notification: %@"), v12, v13, v14, v15, v16, v17, v18, (char)self);
LABEL_7:
  os_unfair_recursive_lock_unlock();
  if (v9)
  {
    if (_os_feature_enabled_impl() && im_primary_base_queue())
    {
      v19 = (void *)objc_opt_class();
      v23 = objc_msgSend__imLocalObjectQueueTargetingWorkloop(v19, v20, v21, v22);
    }
    else
    {
      v24 = (void *)objc_opt_class();
      v23 = objc_msgSend__imLocalObjectQueue(v24, v25, v26, v27);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19066EF4C;
    block[3] = &unk_1E2C45490;
    block[4] = self;
    dispatch_async(v23, block);
  }
  else
  {
    Main = CFRunLoopGetMain();
    if (v4
      && (v32 = Main, CFRunLoopIsWaiting(Main))
      && (v33 = (__CFString *)CFRunLoopCopyCurrentMode(v32),
          objc_msgSend_isEqualToString_(v33, v34, (uint64_t)CFSTR("IMRemoteObjectsRunLoopMode"), v35)))
    {
      v36 = qos_class_self();
      if (v36 <= QOS_CLASS_DEFAULT)
        v37 = QOS_CLASS_DEFAULT;
      else
        v37 = v36;
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = sub_190699B8C;
      v45[3] = &unk_1E2C45490;
      v45[4] = self;
      v38 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v37, 0, v45);
      v39 = OSLogHandleForIDSCategory("IMLocalObject");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19066D000, v39, OS_LOG_TYPE_DEFAULT, "_clearPort trying to wake up main thread", buf, 2u);
      }
      v40 = CFRunLoopGetMain();
      CFRunLoopPerformBlock(v40, (CFTypeRef)IMRemoteObjectsRunLoopModes, v38);
      CFRunLoopSourceSignal(*((CFRunLoopSourceRef *)self->_internal + 10));
      v41 = CFRunLoopGetMain();
      CFRunLoopWakeUp(v41);
    }
    else
    {
      v42 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v29, v30, v31);
      objc_msgSend___mainThreadPostNotificationName_object_(v42, v43, (uint64_t)CFSTR("IMLocalObjectDidDisconnect"), (uint64_t)self);
    }
  }
}

- (void)_clearPort:(BOOL)a3
{
  objc_msgSend__clearPort_signalRunLoopIfNeeded_(self, a2, a3, 0);
}

+ (void)_unregisterIMLocalObject:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_lock((void *)qword_1ECD90F00, a2, (uint64_t)a3, v3);
  objc_msgSend_removeObjectIdenticalTo_((void *)qword_1ECD90F38, v5, (uint64_t)a3, v6);
  objc_msgSend_unlock((void *)qword_1ECD90F00, v7, v8, v9);
}

+ (id)_imLocalObjectQueue
{
  if (qword_1ECD90EA0 != -1)
    dispatch_once(&qword_1ECD90EA0, &unk_1E2C42D88);
  return (id)qword_1ECD90E98;
}

- (IMLocalObject)initWithTarget:(id)a3 connection:(id)a4 protocol:(id)a5 forceSecureCoding:(BOOL)a6 offMainThread:(BOOL)a7
{
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  IMLocalObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  xpc_object_t v53;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  __CFRunLoop *Main;
  _xpc_connection_s *v59;
  id v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  _QWORD *internal;
  NSObject *v66;
  char v67;
  CFRunLoopSourceContext context;
  objc_super v69;

  v13 = (void *)objc_msgSend_sharedInstance(IMSystemMonitor, a2, (uint64_t)a3, (uint64_t)a4);
  if (!objc_msgSend_systemIsShuttingDown(v13, v14, v15, v16))
  {
    if (!a6)
    {
      _IMWarn(CFSTR("IMLocalObject is created without forcing secure coding, RETURNING NIL! Please adopt NSSecureCoding for all arguments in the protocol, pass in YES for forceSecureCoding, and use this method instead [IMLocalObject initWithTarget:connection:protocol:forceSecureCoding:offMainThread:]"), v17, v18, v19, v20, v21, v22, v23, v67);
      goto LABEL_11;
    }
    v69.receiver = self;
    v69.super_class = (Class)IMLocalObject;
    v29 = -[IMLocalObject init](&v69, sel_init);
    if (!v29)
    {
      objc_msgSend__unregisterIMLocalObject_(IMLocalObject, v27, 0, v28);
      objc_msgSend_dealloc(0, v55, v56, v57);
      return v29;
    }
    objc_msgSend__registerIMLocalObject_(IMLocalObject, v27, (uint64_t)v29, v28);
    v29->_internal = objc_alloc_init(IMLocalObjectInternal);
    if (dword_1ECD90A78 < 0)
    {
      if (qword_1ECD90F20 != -1)
        dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
      if (dword_1ECD90A78 <= 0)
        goto LABEL_8;
    }
    else if (!dword_1ECD90A78)
    {
LABEL_8:
      *((_BYTE *)v29->_internal + 102) = a7;
      v37 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v41 = (void *)objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v38, v39, v40);
      v45 = (const char *)objc_msgSend_UTF8String(v41, v42, v43, v44);
      *((_QWORD *)v29->_internal + 5) = dispatch_queue_create(v45, v37);
      if (a4)
        v53 = xpc_retain(a4);
      else
        v53 = 0;
      *((_QWORD *)v29->_internal + 4) = v53;
      if (!a7)
      {
        context.version = 0;
        context.info = v29;
        memset(&context.retain, 0, 64);
        *((_QWORD *)v29->_internal + 10) = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &context);
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, *((CFRunLoopSourceRef *)v29->_internal + 10), CFSTR("IMRemoteObjectsRunLoopMode"));
      }
      v59 = (_xpc_connection_s *)*((_QWORD *)v29->_internal + 4);
      if (v59)
      {
        im_configure_connection_with_local_object(v59, (const char *)v29, v47, v48);
        *((_QWORD *)v29->_internal + 3) = a3;
        v60 = objc_alloc(MEMORY[0x1E0CB38C0]);
        *((_QWORD *)v29->_internal + 8) = objc_msgSend_initWithProtocol_(v60, v61, (uint64_t)a5, v62);
        *((_QWORD *)v29->_internal + 6) = 0;
        *((_QWORD *)v29->_internal + 2) = 0;
        *((_DWORD *)v29->_internal + 24) = 0;
        os_unfair_lock_lock((os_unfair_lock_t)v29->_internal + 24);
        *((_QWORD *)v29->_internal + 11) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        os_unfair_lock_unlock((os_unfair_lock_t)v29->_internal + 24);
        return v29;
      }
      _IMWarn(CFSTR("IMLocalObject: Could not create server for listener: %@"), v46, v47, v48, v49, v50, v51, v52, (char)a3);
      objc_msgSend__unregisterIMLocalObject_(IMLocalObject, v63, (uint64_t)v29, v64);
      internal = v29->_internal;
      v66 = internal[5];
      if (v66)
      {
        dispatch_release(v66);
        internal = v29->_internal;
      }

      v29->_internal = 0;
      return 0;
    }
    NSStringFromProtocol((Protocol *)a5);
    _IMLog(CFSTR("* Creating IMLocalObject with target: %@  protocol: %@"), v30, v31, v32, v33, v34, v35, v36, (char)a3);
    goto LABEL_8;
  }
  _IMWarn(CFSTR("System is shutting down, no listener will be created for: %@"), v17, v18, v19, v20, v21, v22, v23, (char)a3);
LABEL_11:
  objc_msgSend_dealloc(self, v24, v25, v26);
  return 0;
}

+ (void)_registerIMLocalObject:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_lock((void *)qword_1ECD90F00, a2, (uint64_t)a3, v3);
  objc_msgSend_addObject_((void *)qword_1ECD90F38, v5, (uint64_t)a3, v6);
  objc_msgSend_unlock((void *)qword_1ECD90F00, v7, v8, v9);
}

- (void)_enqueueInvocation:(id)a3 xpcMessage:(id)a4 submitToComponentQueue:(BOOL)a5 isSync:(BOOL)a6 isReply:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  _BOOL4 v9;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  void *v24;
  uint64_t second;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  IMMessageContext *v32;

  if (a3)
  {
    v7 = a7;
    v8 = a6;
    v9 = a5;
    v32 = objc_alloc_init(IMMessageContext);
    kdebug_trace();
    if (a4)
      objc_msgSend_setXpcMessage_(v32, v13, (uint64_t)a4, v14);
    objc_msgSend_setLocalObject_(v32, v13, (uint64_t)self, v14);
    if (v7)
      objc_msgSend_setReply_(v32, v15, 1, v17);
    v18 = (char *)objc_msgSend_selector(a3, v15, v16, v17);
    if (v18 != sel_release
      && v18 != sel_retain
      && v18 != sel_init
      && v18 != sel_copy
      && v18 != sel_dealloc
      && v18 != sel_invalidate)
    {
      objc_msgSend_retainArguments(a3, v19, v20, v21);
      if (v9)
      {
        os_unfair_lock_lock((os_unfair_lock_t)self->_internal + 24);
        v24 = (void *)*((_QWORD *)self->_internal + 11);
        if (!v24)
        {
          *((_QWORD *)self->_internal + 11) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
          v24 = (void *)*((_QWORD *)self->_internal + 11);
        }
        second = objc_msgSend_pairWithFirst_second_(IMPair, v23, (uint64_t)a3, (uint64_t)v32);
        objc_msgSend_addObject_(v24, v26, second, v27);
        os_unfair_lock_unlock((os_unfair_lock_t)self->_internal + 24);
        objc_msgSend__noteNewInvocation_(self, v28, v8, v29);
      }
      else
      {
        v30 = objc_msgSend_pairWithFirst_second_(IMPair, v22, (uint64_t)a3, (uint64_t)v32);
        objc_msgSend__handleInvocation_processingComponentQueue_(self, v31, v30, 0);
      }
    }

  }
}

- (BOOL)_handleInvocation:(id)a3 processingComponentQueue:(BOOL)a4
{
  _BOOL4 v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *internal;
  BOOL v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  _QWORD v41[7];
  BOOL v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  uint64_t v54;

  v4 = a4;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3052000000;
  v52 = sub_190699E60;
  v53 = sub_190699E70;
  v54 = 0xAAAAAAAAAAAAAAAALL;
  v54 = objc_msgSend_first(a3, a2, (uint64_t)a3, a4);
  v43 = 0;
  v44 = &v43;
  v45 = 0x3052000000;
  v46 = sub_190699E60;
  v47 = sub_190699E70;
  v48 = 0xAAAAAAAAAAAAAAAALL;
  v48 = objc_msgSend_second(a3, v7, v8, v9);
  internal = self->_internal;
  if (!internal[3])
    goto LABEL_14;
  if (!v4)
    goto LABEL_6;
  if (!*((_BYTE *)internal + 101))
  {
    if ((char *)objc_msgSend_selector((void *)v50[5], v10, v11, v12) != sel_terminated)
    {
LABEL_6:
      CFRetain(self);
      v21 = objc_msgSend_selector((void *)v50[5], v18, v19, v20);
      if (objc_msgSend_isValidSelector_(self, v22, v21, v23)
        && objc_msgSend_isValid(self, v24, v25, v26))
      {
        if (v4)
        {
          *((_BYTE *)self->_internal + 101) = 1;
          *((_QWORD *)self->_internal + 1) = v44[5];
        }
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = sub_190675830;
        v41[3] = &unk_1E2C454E0;
        v41[4] = self;
        v41[5] = &v49;
        v41[6] = &v43;
        v42 = v4;
        if (v4)
        {
          objc_msgSend_voucher((void *)v44[5], v24, v25, v26);
          voucher_adopt();
        }
        sub_190675830((uint64_t)v41);
        if (v4)
        {
          v37 = (void *)v44[5];
          v38 = voucher_adopt();
          objc_msgSend_setVoucher_(v37, v39, v38, v40);
          *((_BYTE *)self->_internal + 101) = 0;
        }
      }
      else
      {
        v27 = (void *)v50[5];
        v28 = (const char *)objc_msgSend_selector(v27, v24, v25, v26);
        NSStringFromSelector(v28);
        _IMLog(CFSTR("Incoming invocation [%@:%@] does not conform to protocol"), v29, v30, v31, v32, v33, v34, v35, (char)v27);
      }
      CFRelease(self);
      goto LABEL_14;
    }
    objc_msgSend_terminated(self, v15, v16, v17);
LABEL_14:
    v14 = 1;
    goto LABEL_15;
  }
  v14 = 0;
LABEL_15:
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  return v14;
}

- (BOOL)isValid
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = *((_QWORD *)self->_internal + 4) != 0;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)isValidSelector:(SEL)a3
{
  uint64_t v3;
  SEL v5;
  Protocol *v7;
  SEL name;

  if (sel_terminated == a3 || sel_respondsToSelector_ == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v7 = (Protocol *)objc_msgSend_protocol(*((void **)self->_internal + 8), a2, (uint64_t)a3, v3);
    name = protocol_getMethodDescription(v7, a3, 1, 1).name;
    if (name || (v5 = protocol_getMethodDescription(v7, a3, 0, 1).name) != 0)
    {
      if ((unint64_t)protocol_getMethodDescription((Protocol *)&unk_1EE1DF6F0, a3, 1, 1).name)
        LOBYTE(v5) = 0;
      else
        LOBYTE(v5) = (unint64_t)protocol_getMethodDescription((Protocol *)&unk_1EE1DF6F0, a3, 0, 1).name == 0;
    }
  }
  return (char)v5;
}

- (NSProtocolChecker)protocolChecker
{
  return (NSProtocolChecker *)*((_QWORD *)self->_internal + 8);
}

- (NSString)processName
{
  return (NSString *)*((_QWORD *)self->_internal + 7);
}

- (void)_enqueueInvocationWithSync:(id)a3 xpcMessage:(id)a4 submitToComponentQueue:(BOOL)a5
{
  MEMORY[0x1E0DE7D20](self, sel__enqueueInvocation_xpcMessage_submitToComponentQueue_isSync_isReply_, a3, a4);
}

- (void)_enqueueInvocationWithSync:(id)a3 xpcMessage:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__enqueueInvocationWithSync_xpcMessage_submitToComponentQueue_, a3, a4);
}

- (void)setTarget:(id)a3
{
  *((_QWORD *)self->_internal + 3) = a3;
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)*((_QWORD *)self->_internal + 4);
}

- (void)_portDidBecomeInvalid
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (dword_1ECD90A78 < 0)
  {
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    if (dword_1ECD90A78 > 0)
      goto LABEL_3;
  }
  else if (dword_1ECD90A78)
  {
LABEL_3:
    _IMLog(CFSTR("* IMLocalObject invalidation callback: %@"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, *((_QWORD *)self->_internal + 6));
  }
  objc_msgSend__clearPort_(self, a2, 0, v3);
}

+ (id)_imLocalObjectQueueTargetingWorkloop
{
  if (qword_1EE1DDB58 != -1)
    dispatch_once(&qword_1EE1DDB58, &unk_1E2C45468);
  return (id)qword_1EE1DDB60;
}

+ (void)_setExceptionHandlingDisabled:(BOOL)a3
{
  byte_1EE1DD358 = a3;
}

+ (id)_registeredIMLocalObjectForPort:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  objc_msgSend_lock((void *)qword_1ECD90F00, a2, *(uint64_t *)&a3, v3);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = (void *)qword_1ECD90F38;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_((void *)qword_1ECD90F38, v6, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v7)
  {
    v15 = v7;
    v16 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v5);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend__port(v18, v8, v9, v10) == a3)
        {
          v22 = v18;
          goto LABEL_12;
        }
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v24, (uint64_t)v28, 16);
      if (v15)
        continue;
      break;
    }
  }
  _IMWarn(CFSTR("No listener for port: %d     Candidates were: %@"), (uint64_t)v8, v9, v10, v11, v12, v13, v14, a3);
  v18 = 0;
LABEL_12:
  objc_msgSend_unlock((void *)qword_1ECD90F00, v19, v20, v21);
  return v18;
}

- (IMLocalObject)initWithTarget:(id)a3 protocol:(id)a4
{
  return (IMLocalObject *)MEMORY[0x1E0DE7D20](self, sel_initWithTarget_portName_protocol_, a3, 0);
}

- (IMLocalObject)initWithTarget:(id)a3 connection:(id)a4 protocol:(id)a5
{
  return (IMLocalObject *)MEMORY[0x1E0DE7D20](self, sel_initWithTarget_connection_protocol_forceSecureCoding_, a3, a4);
}

- (IMLocalObject)initWithTarget:(id)a3 connection:(id)a4 protocol:(id)a5 forceSecureCoding:(BOOL)a6
{
  return (IMLocalObject *)MEMORY[0x1E0DE7D20](self, sel_initWithTarget_connection_protocol_forceSecureCoding_offMainThread_, a3, a4);
}

- (void)setWhitelistedClasses:(id)a3
{
  ((void (*)(IMLocalObject *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_setAllowlistedClasses_, a3);
}

- (IMLocalObject)initWithTarget:(id)a3 portName:(id)a4 protocol:(id)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _xpc_connection_s *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v60;
  uint64_t v61;
  _QWORD *internal;
  NSObject *v63;
  _QWORD v64[5];
  _QWORD v65[5];
  objc_super v66;

  v9 = (void *)objc_msgSend_sharedInstance(IMSystemMonitor, a2, (uint64_t)a3, (uint64_t)a4);
  if (objc_msgSend_systemIsShuttingDown(v9, v10, v11, v12))
  {
    _IMWarn(CFSTR("System is shutting down, no listener will be created for: %@"), v13, v14, v15, v16, v17, v18, v19, (char)a3);
    goto LABEL_3;
  }
  v66.receiver = self;
  v66.super_class = (Class)IMLocalObject;
  self = -[IMLocalObject init](&v66, sel_init);
  if (!self)
  {
    objc_msgSend__unregisterIMLocalObject_(IMLocalObject, v23, 0, v24);
    objc_msgSend_dealloc(0, v56, v57, v58);
    return self;
  }
  objc_msgSend__registerIMLocalObject_(IMLocalObject, v23, (uint64_t)self, v24);
  self->_internal = objc_alloc_init(IMLocalObjectInternal);
  if (dword_1ECD90A78 < 0)
  {
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    if (dword_1ECD90A78 <= 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (dword_1ECD90A78)
  {
LABEL_7:
    NSStringFromProtocol((Protocol *)a5);
    _IMLog(CFSTR("* Creating IMLocalObject with target: %@  protocol: %@"), v25, v26, v27, v28, v29, v30, v31, (char)a3);
  }
LABEL_8:
  v64[4] = self;
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = sub_1906999DC;
  v65[3] = &unk_1E2C45490;
  v65[4] = self;
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = sub_190699AC4;
  v64[3] = &unk_1E2C454B8;
  v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v36 = (void *)objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v33, v34, v35);
  v40 = (const char *)objc_msgSend_UTF8String(v36, v37, v38, v39);
  *((_QWORD *)self->_internal + 5) = dispatch_queue_create(v40, v32);
  v44 = (const char *)objc_msgSend_UTF8String(a4, v41, v42, v43);
  *((_QWORD *)self->_internal + 4) = IMXPCCreateServerConnection(v44, v65, 0, v64, *((void **)self->_internal + 5));
  v52 = (_xpc_connection_s *)*((_QWORD *)self->_internal + 4);
  if (v52)
  {
    im_configure_connection_with_local_object(v52, (const char *)self, v46, v47);
    xpc_connection_resume(*((xpc_connection_t *)self->_internal + 4));
    *((_QWORD *)self->_internal + 3) = a3;
    v53 = objc_alloc(MEMORY[0x1E0CB38C0]);
    *((_QWORD *)self->_internal + 8) = objc_msgSend_initWithProtocol_(v53, v54, (uint64_t)a5, v55);
    *((_QWORD *)self->_internal + 6) = a4;
    *((_QWORD *)self->_internal + 2) = 0;
    *((_DWORD *)self->_internal + 24) = 0;
    os_unfair_lock_lock((os_unfair_lock_t)self->_internal + 24);
    *((_QWORD *)self->_internal + 11) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)self->_internal + 24);
    return self;
  }
  _IMWarn(CFSTR("IMLocalObject: Could not create server for listener: %@"), v45, v46, v47, v48, v49, v50, v51, (char)a3);
  objc_msgSend__unregisterIMLocalObject_(IMLocalObject, v60, (uint64_t)self, v61);
  internal = self->_internal;
  v63 = internal[5];
  if (v63)
  {
    dispatch_release(v63);
    internal = self->_internal;
  }

  self->_internal = 0;
LABEL_3:
  objc_msgSend_dealloc(self, v20, v21, v22);
  return 0;
}

- (id)target
{
  return (id)*((_QWORD *)self->_internal + 3);
}

- (void)_portInterrupted
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  if (dword_1ECD90A78 < 0)
  {
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    if (dword_1ECD90A78 > 0)
      goto LABEL_3;
  }
  else if (dword_1ECD90A78)
  {
LABEL_3:
    _IMLog(CFSTR("* IMLocalObject interrupted callback: %@"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, *((_QWORD *)self->_internal + 6));
  }
  os_unfair_recursive_lock_lock_with_options();
  *((_BYTE *)self->_internal + 103) = 1;
  objc_msgSend_invalidate(self, v9, v10, v11);
  os_unfair_recursive_lock_unlock();
}

- (void)terminated
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (dword_1ECD90A78 < 0)
  {
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    if (dword_1ECD90A78 > 0)
      goto LABEL_3;
  }
  else if (dword_1ECD90A78)
  {
LABEL_3:
    _IMLog(CFSTR("* Received termination notice for IMLocalObject: %@ (connection=%p) busy: %d"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, *((_QWORD *)self->_internal + 6));
  }
  objc_msgSend__clearPort_(self, a2, 0, v3);
}

- (void)_systemShutdown:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (dword_1ECD90A78 < 0)
  {
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    if (dword_1ECD90A78 > 0)
      goto LABEL_3;
  }
  else if (dword_1ECD90A78)
  {
LABEL_3:
    _IMLog(CFSTR("* Received shutdown notice for IMLocalObject: %@ (connection=%p) busy: %d"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, *((_QWORD *)self->_internal + 6));
  }
  objc_msgSend__clearPort_(self, a2, 1, v3);
}

- (NSString)portName
{
  return (NSString *)*((_QWORD *)self->_internal + 6);
}

- (void)setPortName:(id)a3
{
  id v3;

  v3 = (id)*((_QWORD *)self->_internal + 6);
  if (v3 != a3)
  {

    *((_QWORD *)self->_internal + 6) = a3;
  }
}

- (id)_currentMessageContext
{
  return (id)*((_QWORD *)self->_internal + 1);
}

- (BOOL)_handleInvocation:(id)a3
{
  return objc_msgSend__handleInvocation_processingComponentQueue_(self, a2, (uint64_t)a3, 1);
}

- (BOOL)handleInvocation:(id)a3
{
  uint64_t v3;
  _BYTE *internal;
  int v5;

  internal = self->_internal;
  v5 = internal[101];
  if (!internal[101])
    objc_msgSend__handleInvocation_(self, a2, (uint64_t)a3, v3);
  return v5 == 0;
}

- (void)_handleNewInvocations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  if (dword_1ECD90A78 < 0)
  {
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    if (dword_1ECD90A78 <= 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (dword_1ECD90A78)
LABEL_3:
    _IMLog(CFSTR("** Begin Handling available components (Local object: %@)"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, (char)self);
LABEL_4:
  v9 = (id)objc_msgSend__peekInvocation(self, a2, v2, v3);
  v17 = v9 == 0;
  if (!v9)
    goto LABEL_23;
  v18 = v9;
  while (1)
  {
    objc_msgSend__popInvocation(self, v10, v11, v12);
    if ((dword_1ECD90A78 & 0x80000000) == 0)
    {
      if (!dword_1ECD90A78)
        goto LABEL_9;
LABEL_8:
      v22 = (void *)objc_msgSend_first(v18, v19, v20, v21);
      v26 = (const char *)objc_msgSend_selector(v22, v23, v24, v25);
      v27 = NSStringFromSelector(v26);
      _IMLog(CFSTR("** Incoming Invocation: %@ (Local object: %@)"), v28, v29, v30, v31, v32, v33, v34, v27);
      goto LABEL_9;
    }
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    if (dword_1ECD90A78 > 0)
      goto LABEL_8;
LABEL_9:
    if ((objc_msgSend_handleInvocation_(self, v19, (uint64_t)v18, v21) & 1) == 0)
      break;

    v18 = (id)objc_msgSend__peekInvocation(self, v35, v36, v37);
    v17 = v18 == 0;
    if (!v18)
      goto LABEL_23;
  }
  os_unfair_lock_lock((os_unfair_lock_t)self->_internal + 24);
  v39 = (void *)*((_QWORD *)self->_internal + 11);
  if (!v39)
  {
    *((_QWORD *)self->_internal + 11) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    v39 = (void *)*((_QWORD *)self->_internal + 11);
  }
  objc_msgSend_insertObject_atIndex_(v39, v38, (uint64_t)v18, 0);
  os_unfair_lock_unlock((os_unfair_lock_t)self->_internal + 24);
  v43 = (void *)objc_msgSend_first(v18, v40, v41, v42);
  v47 = (const char *)objc_msgSend_selector(v43, v44, v45, v46);
  v48 = NSStringFromSelector(v47);
  _IMLog(CFSTR("**** FAILED DELIVERY (Will retry) Incoming Invocation: %@ (Local object: %@)"), v49, v50, v51, v52, v53, v54, v55, v48);

LABEL_23:
  if (dword_1ECD90A78 < 0)
  {
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    if (dword_1ECD90A78 > 0)
LABEL_25:
      _IMLog(CFSTR("** End Handling available components (Local object: %@)"), (uint64_t)v10, v11, v12, v13, v14, v15, v16, (char)self);
  }
  else if (dword_1ECD90A78)
  {
    goto LABEL_25;
  }
  *((_BYTE *)self->_internal + 100) = 0;
  if (!v17)
    objc_msgSend__noteNewInvocation_(self, v10, 0, v12);
}

- (void)_noteNewInvocation:(BOOL)a3
{
  _BOOL4 v3;
  _BYTE *internal;
  qos_class_t v6;
  dispatch_qos_class_t v7;
  dispatch_block_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  __CFRunLoop *Main;
  __CFRunLoop *v21;
  _QWORD block[5];

  v3 = a3;
  if (!a3)
  {
    internal = self->_internal;
    if (internal[100])
      return;
    internal[100] = 1;
  }
  v6 = qos_class_self();
  if (v6 <= QOS_CLASS_DEFAULT)
    v7 = QOS_CLASS_DEFAULT;
  else
    v7 = v6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19069A268;
  block[3] = &unk_1E2C45490;
  block[4] = self;
  v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7, 0, block);
  v9 = v8;
  if (*((_BYTE *)self->_internal + 102))
  {
    if (_os_feature_enabled_impl() && im_primary_base_queue())
    {
      v10 = (void *)objc_opt_class();
      v14 = objc_msgSend__imLocalObjectQueueTargetingWorkloop(v10, v11, v12, v13);
    }
    else
    {
      v15 = (void *)objc_opt_class();
      v14 = objc_msgSend__imLocalObjectQueue(v15, v16, v17, v18);
    }
    v19 = v14;
    if (v3 && _os_feature_enabled_impl())
      dispatch_sync(v19, v9);
    else
      dispatch_async(v19, v9);
  }
  else if (v3)
  {
    (*((void (**)(dispatch_block_t))v8 + 2))(v8);
  }
  else
  {
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)IMRemoteObjectsRunLoopModes, v9);
    CFRunLoopSourceSignal(*((CFRunLoopSourceRef *)self->_internal + 10));
    v21 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v21);
  }
  _Block_release(v9);
}

- (id)_peekInvocation
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  id v8;

  os_unfair_lock_lock((os_unfair_lock_t)self->_internal + 24);
  if (objc_msgSend_count(*((void **)self->_internal + 11), v3, v4, v5))
    v8 = (id)objc_msgSend_objectAtIndex_(*((void **)self->_internal + 11), v6, 0, v7);
  else
    v8 = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)self->_internal + 24);
  return v8;
}

- (void)_popInvocation
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  os_unfair_lock_lock((os_unfair_lock_t)self->_internal + 24);
  if (objc_msgSend_count(*((void **)self->_internal + 11), v3, v4, v5))
  {
    objc_msgSend_removeObjectAtIndex_(*((void **)self->_internal + 11), v6, 0, v7);
    if (!objc_msgSend_count(*((void **)self->_internal + 11), v8, v9, v10))
    {

      *((_QWORD *)self->_internal + 11) = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)self->_internal + 24);
}

- (void)_enqueueInvocation:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__enqueueInvocation_xpcMessage_, a3, 0);
}

- (void)_enqueueInvocation:(id)a3 xpcMessage:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__enqueueInvocation_xpcMessage_submitToComponentQueue_isSync_isReply_, a3, a4);
}

- (void)_enqueueInvocationWithPriority:(id)a3 priority:(int)a4
{
  MEMORY[0x1E0DE7D20](self, sel__enqueueInvocationWithPriority_xpcMessage_priority_, a3, 0);
}

- (void)_enqueueInvocationWithPriority:(id)a3 xpcMessage:(id)a4 priority:(int)a5
{
  if (a3)
  {
    if ((char *)objc_msgSend_selector(a3, a2, (uint64_t)a3, (uint64_t)a4, *(_QWORD *)&a5) != sel_sendMessageWithSendParameters_)
      sub_1906B6F40();
    MEMORY[0x1E0DE7D20](self, sel__enqueueInvocation_xpcMessage_submitToComponentQueue_isSync_isReply_, a3, a4);
  }
}

- (void)_enqueueInvocationWithSync:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__enqueueInvocationWithSync_xpcMessage_, a3, 0);
}

- (void)_enqueueInvocationWithSync:(id)a3 xpcMessage:(id)a4 submitToComponentQueue:(BOOL)a5 isReply:(BOOL)a6
{
  MEMORY[0x1E0DE7D20](self, sel__enqueueInvocation_xpcMessage_submitToComponentQueue_isSync_isReply_, a3, a4);
}

- (BOOL)isSameConnection:(id)a3
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(a3) = *((_QWORD *)self->_internal + 4) == (_QWORD)a3;
  os_unfair_recursive_lock_unlock();
  return (char)a3;
}

- (NSArray)allowlistedClasses
{
  NSArray *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = (NSArray *)*((_QWORD *)self->_internal + 9);
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setAllowlistedClasses:(id)a3
{
  id v5;

  os_unfair_recursive_lock_lock_with_options();
  v5 = (id)*((_QWORD *)self->_internal + 9);
  if (v5 != a3)
  {

    *((_QWORD *)self->_internal + 9) = a3;
  }
  os_unfair_recursive_lock_unlock();
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v9 = objc_msgSend_portName(self, v6, v7, v8);
  v13 = objc_msgSend_processName(self, v10, v11, v12);
  return (id)objc_msgSend_stringWithFormat_(v3, v14, (uint64_t)CFSTR("[%@] Port Name: %@ Process Name: %@"), v15, v5, v9, v13);
}

@end
