@implementation IMRemoteObject

- (void)setPid:(int)a3
{
  os_unfair_recursive_lock_lock_with_options();
  *((_DWORD *)self->_internal + 14) = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setProcessName:(id)a3
{
  id v3;

  v3 = (id)*((_QWORD *)self->_internal + 5);
  if (v3 != a3)
  {

    *((_QWORD *)self->_internal + 5) = a3;
  }
}

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)MEMORY[0x19400E788]();
  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    qword_1ECD90F08 = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3740]);
    qword_1ECD90EF8 = (uint64_t)(id)objc_msgSend_nonRetainingArray(MEMORY[0x1E0C99DE8], v4, v5, v6);
    objc_msgSend_sharedInstance(IMSystemMonitor, v7, v8, v9);
  }
  objc_autoreleasePoolPop(v2);
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  IMRemoteObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  _xpc_connection_s *v14;
  const char *v15;
  IMRemoteObject *v16;

  v16 = self;
  if ((dword_1ECD90A78 & 0x80000000) == 0)
  {
    if (!dword_1ECD90A78)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (qword_1ECD90F20 != -1)
  {
    dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    self = v16;
  }
  if (dword_1ECD90A78 > 0)
LABEL_3:
    _IMLog(CFSTR("* Invalidating IMRemoteObject: %@ (connection=%p)"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, *((_QWORD *)self->_internal + 4));
LABEL_4:
  os_unfair_recursive_lock_lock_with_options();
  v8 = v16;
  v12 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v9, v10, v11);
  objc_msgSend_removeObserver_name_object_(v12, v13, (uint64_t)v16, (uint64_t)CFSTR("IMSystemShuttingDownNotification"), 0);
  v14 = (_xpc_connection_s *)*((_QWORD *)v16->_internal + 1);
  if (v14)
  {
    xpc_connection_cancel(v14);
    xpc_release(*((xpc_object_t *)v16->_internal + 1));
    *((_QWORD *)v16->_internal + 1) = 0;
  }
  os_unfair_recursive_lock_unlock();
  objc_msgSend__cleanupMachBitsCanPost_locked_(v16, v15, 1, 0);

}

- (int)pid
{
  os_unfair_recursive_lock_lock_with_options();
  LODWORD(self) = *((_DWORD *)self->_internal + 14);
  os_unfair_recursive_lock_unlock();
  return (int)self;
}

- (id)_initWithConnection:(id)a3 portName:(id)a4 protocol:(id)a5 alreadyConfigured:(BOOL)a6 forceSecureCoding:(BOOL)a7
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  IMRemoteObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  IMRemoteObjectInternal *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __CFString *v40;
  const char *v42;
  NSObject *v43;
  NSObject *v44;
  dispatch_queue_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  char v53;
  _QWORD v54[5];
  objc_super v55;

  if (!a3 && !objc_msgSend_length(a4, a2, 0, (uint64_t)a4))
  {
    v40 = CFSTR("Empty connection passed to remote object, not creating");
    goto LABEL_15;
  }
  v17 = (void *)objc_msgSend_sharedInstance(IMSystemMonitor, a2, (uint64_t)a3, (uint64_t)a4);
  if (objc_msgSend_systemIsShuttingDown(v17, v18, v19, v20))
  {
    _IMWarn(CFSTR("System is shutting down, no listener will be created for: %p"), (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v13, v14, v15, v16, (char)a3);
LABEL_16:
    objc_msgSend_dealloc(self, v21, v22, v23);
    return 0;
  }
  if (!a7)
  {
    v40 = CFSTR("IMRemoteObject is created without forcing secure coding, RETURNING NIL! Please adopt NSSecureCoding for all arguments in the protocol, pass in YES for forceSecureCoding, and use this method instead [IMRemoteObject initWithConnection:protocol:alreadyConfigured:forceSecureCoding:]");
LABEL_15:
    _IMWarn(v40, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v13, v14, v15, v16, v53);
    goto LABEL_16;
  }
  v55.receiver = self;
  v55.super_class = (Class)IMRemoteObject;
  v27 = -[IMRemoteObject init](&v55, sel_init);
  if (!v27)
  {
    objc_msgSend_dealloc(0, v24, v25, v26);
    return v27;
  }
  if (dword_1ECD90A78 < 0)
  {
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    if (dword_1ECD90A78 <= 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (dword_1ECD90A78)
  {
LABEL_9:
    NSStringFromProtocol((Protocol *)a5);
    _IMLog(CFSTR("* Creating IMRemoteObject with connection: %p  protocol: %@"), v28, v29, v30, v31, v32, v33, v34, (char)a3);
  }
LABEL_10:
  v35 = objc_alloc_init(IMRemoteObjectInternal);
  v39 = MEMORY[0x1E0C809B0];
  v27->_internal = v35;
  v54[0] = v39;
  v54[1] = 3221225472;
  v54[2] = sub_19069A660;
  v54[3] = &unk_1E2C45490;
  v54[4] = v27;
  if (a3)
  {
    *((_QWORD *)v27->_internal + 1) = xpc_retain(a3);
    if (!a6)
      IMXPCConfigureConnection(a3, v54, 0);
  }
  else
  {
    v42 = (const char *)objc_msgSend_UTF8String(a4, v36, v37, v38);
    *((_QWORD *)v27->_internal + 1) = IMXPCCreateConnectionForService(1, v42, v54, 0);
  }
  *((_QWORD *)v27->_internal + 3) = a5;
  v43 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  if (_os_feature_enabled_impl() && im_primary_base_queue())
  {
    v44 = im_primary_base_queue();
    v45 = dispatch_queue_create_with_target_V2(0, v43, v44);
  }
  else
  {
    v45 = dispatch_queue_create(0, v43);
  }
  *((_QWORD *)v27->_internal + 2) = v45;
  *((_QWORD *)v27->_internal + 6) = 0;
  objc_msgSend__registerIMRemoteObject_(IMRemoteObject, v46, (uint64_t)v27, v47);
  v51 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v48, v49, v50);
  objc_msgSend_addObserver_selector_name_object_(v51, v52, (uint64_t)v27, (uint64_t)sel__systemShutdown_, CFSTR("IMSystemShuttingDownNotification"), 0);
  return v27;
}

+ (void)_registerIMRemoteObject:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
  {
    objc_msgSend_lock((void *)qword_1ECD90F08, a2, (uint64_t)a3, v3);
    objc_msgSend_addObject_((void *)qword_1ECD90EF8, v5, (uint64_t)a3, v6);
    objc_msgSend_unlock((void *)qword_1ECD90F08, v7, v8, v9);
  }
}

- (void)dealloc
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id internal;
  const char *v19;
  _QWORD *v20;
  const void *v21;
  const void *v22;
  const void *v23;
  NSObject *v24;
  objc_super v25;

  objc_msgSend__unregisterIMRemoteObject_(IMRemoteObject, a2, (uint64_t)self, v2);
  if ((dword_1ECD90A78 & 0x80000000) == 0)
  {
    if (!dword_1ECD90A78)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (qword_1ECD90F20 != -1)
    dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
  if (dword_1ECD90A78 > 0)
  {
LABEL_3:
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    _IMLog(CFSTR("* Dealloc %@ with name: %@"), v9, v10, v11, v12, v13, v14, v15, v8);
  }
LABEL_4:
  v16 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v4, v5, v6);
  objc_msgSend_removeObserver_name_object_(v16, v17, (uint64_t)self, 0, 0);
  internal = self->_internal;
  if (internal)
  {
    os_unfair_recursive_lock_lock_with_options();
    objc_msgSend__cleanupMachBitsCanPost_locked_(self, v19, 0, 1);
    v20 = self->_internal;
    v21 = (const void *)v20[3];
    if (v21)
    {
      CFRelease(v21);
      v20 = self->_internal;
    }
    v22 = (const void *)v20[4];
    if (v22)
    {
      CFRelease(v22);
      v20 = self->_internal;
    }
    v23 = (const void *)v20[5];
    if (v23)
    {
      CFRelease(v23);
      v20 = self->_internal;
    }
    v24 = v20[2];
    if (v24)
    {
      dispatch_release(v24);
      *((_QWORD *)self->_internal + 2) = 0;
    }
    os_unfair_recursive_lock_unlock();
    internal = self->_internal;
  }

  self->_internal = 0;
  v25.receiver = self;
  v25.super_class = (Class)IMRemoteObject;
  -[IMRemoteObject dealloc](&v25, sel_dealloc);
}

- (void)_cleanupMachBitsCanPost:(BOOL)a3 locked:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  const char *v9;
  _BYTE *internal;

  v5 = a3;
  if (!a4)
    os_unfair_recursive_lock_lock_with_options();
  v7 = (void *)*((_QWORD *)self->_internal + 1);
  if (!v7)
    goto LABEL_9;
  xpc_release(v7);
  *((_QWORD *)self->_internal + 1) = 0;
  if (v5)
  {
    internal = self->_internal;
    if (!internal[61])
    {
      v5 = 1;
      internal[61] = 1;
      if (!a4)
        goto LABEL_12;
      goto LABEL_6;
    }
LABEL_9:
    v5 = 0;
    if (!a4)
      goto LABEL_12;
LABEL_6:
    if (!v5)
      return;
    goto LABEL_7;
  }
  if (a4)
    goto LABEL_6;
LABEL_12:
  os_unfair_recursive_lock_unlock();
  if (v5)
  {
LABEL_7:
    v8 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, a3, a4);
    objc_msgSend___mainThreadPostNotificationName_object_(v8, v9, (uint64_t)CFSTR("IMRemoteObjectDidDisconnect"), (uint64_t)self);
  }
}

+ (void)_unregisterIMRemoteObject:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
  {
    objc_msgSend_lock((void *)qword_1ECD90F08, a2, (uint64_t)a3, v3);
    objc_msgSend_removeObjectIdenticalTo_((void *)qword_1ECD90EF8, v5, (uint64_t)a3, v6);
    objc_msgSend_unlock((void *)qword_1ECD90F08, v7, v8, v9);
  }
}

- (unint64_t)forwardXPCObject:(id)a3 messageContext:(id)a4 locked:(BOOL)a5
{
  _xpc_connection_s *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t v16;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  xpc_object_t reply;
  void *v35;
  xpc_object_t value;
  int64_t int64;
  _QWORD handler[5];

  if (!a3)
    return 0;
  if (!a5)
    os_unfair_recursive_lock_lock_with_options();
  v9 = (_xpc_connection_s *)*((_QWORD *)self->_internal + 1);
  if (!v9)
    goto LABEL_12;
  if (!a4 || !objc_msgSend_shouldBoost(a4, a2, (uint64_t)a3, (uint64_t)a4))
  {
    xpc_connection_send_notification();
LABEL_12:
    if (a5)
      return 0;
    goto LABEL_13;
  }
  if (objc_msgSend_isSync(a4, v10, v11, v12))
  {
    v16 = xpc_connection_send_message_with_reply_sync(v9, a3);
    if (!a5)
      os_unfair_recursive_lock_unlock();
    im_local_object_peer_event_handler_is_syncReply(v9, v16, 1);
    xpc_release(v16);
    return 0;
  }
  if (objc_msgSend_needReply(a4, v13, v14, v15))
  {
    if (qword_1EE1DD6A8 != -1)
      dispatch_once(&qword_1EE1DD6A8, &unk_1E2C45520);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_19069A964;
    handler[3] = &unk_1E2C45548;
    handler[4] = v9;
    xpc_connection_send_message_with_reply(v9, a3, (dispatch_queue_t)qword_1EE1DD6B0, handler);
  }
  else if (objc_msgSend_isReply(a4, v18, v19, v20)
         && objc_msgSend_xpcMessage(a4, v21, v22, v23)
         && (v27 = (void *)objc_msgSend_localObject(a4, v24, v25, v26),
             objc_msgSend_isSameConnection_(v27, v28, (uint64_t)v9, v29)))
  {
    v33 = (void *)objc_msgSend_xpcMessage(a4, v30, v31, v32);
    reply = xpc_dictionary_create_reply(v33);
    if (reply)
    {
      v35 = reply;
      value = xpc_dictionary_get_value(a3, "invocation");
      xpc_dictionary_set_value(v35, "invocation", value);
      int64 = xpc_dictionary_get_int64(a3, "priority");
      xpc_dictionary_set_int64(v35, "priority", int64);
      xpc_connection_send_message(v9, v35);
      xpc_release(v35);
    }
  }
  else
  {
    xpc_connection_send_message(v9, a3);
  }
  kdebug_trace();
  if (!a5)
LABEL_13:
    os_unfair_recursive_lock_unlock();
  return 0;
}

- (BOOL)isValid
{
  BOOL v3;
  _QWORD *internal;

  os_unfair_recursive_lock_lock_with_options();
  v3 = 0;
  internal = self->_internal;
  if (!*((_BYTE *)internal + 60))
    v3 = internal[1] != 0;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)_queue
{
  return (id)*((_QWORD *)self->_internal + 2);
}

+ (id)_remoteObjects
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend_lock((void *)qword_1ECD90F08, a2, v2, v3);
  v4 = objc_alloc(MEMORY[0x1E0C99D20]);
  v7 = (void *)objc_msgSend_initWithArray_(v4, v5, qword_1ECD90EF8, v6);
  objc_msgSend_unlock((void *)qword_1ECD90F08, v8, v9, v10);
  return v7;
}

- (IMRemoteObject)initWithConnection:(id)a3 protocol:(id)a4 alreadyConfigured:(BOOL)a5 forceSecureCoding:(BOOL)a6
{
  return (IMRemoteObject *)MEMORY[0x1E0DE7D20](self, sel__initWithConnection_portName_protocol_alreadyConfigured_forceSecureCoding_, a3, 0);
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)*((_QWORD *)self->_internal + 1);
}

- (IMRemoteObject)initWithConnection:(id)a3 protocol:(id)a4
{
  return (IMRemoteObject *)MEMORY[0x1E0DE7D20](self, sel__initWithConnection_portName_protocol_alreadyConfigured_forceSecureCoding_, a3, 0);
}

- (IMRemoteObject)initWithPortName:(id)a3 protocol:(id)a4
{
  return (IMRemoteObject *)MEMORY[0x1E0DE7D20](self, sel__initWithConnection_portName_protocol_alreadyConfigured_forceSecureCoding_, 0, a3);
}

- (IMRemoteObject)initWithConnection:(id)a3 protocol:(id)a4 alreadyConfigured:(BOOL)a5
{
  return (IMRemoteObject *)MEMORY[0x1E0DE7D20](self, sel__initWithConnection_portName_protocol_alreadyConfigured_forceSecureCoding_, a3, 0);
}

- (void)_portDidBecomeInvalid
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  IMRemoteObject *v8;
  const char *v9;
  IMRemoteObject *v10;

  v10 = self;
  if (dword_1ECD90A78 < 0)
  {
    if (qword_1ECD90F20 != -1)
    {
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
      self = v10;
    }
    if (dword_1ECD90A78 > 0)
      goto LABEL_3;
  }
  else if (dword_1ECD90A78)
  {
LABEL_3:
    _IMLog(CFSTR("* IMRemoteObject invalidation callback: %@"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, *((_QWORD *)self->_internal + 4));
  }
  v8 = v10;
  objc_msgSend__cleanupMachBitsCanPost_locked_(v10, v9, 1, 0);

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
    _IMLog(CFSTR("* Received shutdown notice for IMLocalObject: %@ (connection=%p)"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, *((_QWORD *)self->_internal + 4));
  }
  objc_msgSend_invalidate(self, a2, (uint64_t)a3, v3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  Protocol *v4;
  char *types;
  uint64_t v6;
  objc_method_description MethodDescription;

  if (sel_terminated == a3)
    return (id)((uint64_t (*)(__objc2_class *, char *, SEL))MEMORY[0x1E0DE7D20])(IMLocalObject, sel_instanceMethodSignatureForSelector_, a3);
  v4 = (Protocol *)*((_QWORD *)self->_internal + 3);
  MethodDescription = protocol_getMethodDescription(v4, a3, 1, 1);
  types = MethodDescription.types;
  if (MethodDescription.name)
  {
    if (MethodDescription.types)
      return (id)objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], types, (uint64_t)types, v6);
  }
  else
  {
    types = protocol_getMethodDescription(v4, a3, 0, 1).types;
    if (types)
      return (id)objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], types, (uint64_t)types, v6);
  }
  return 0;
}

- (void)blockUntilSendQueueIsEmpty
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;

  if (objc_msgSend__queue(self, a2, v2, v3))
  {
    v8 = objc_msgSend__queue(self, v5, v6, v7);
    dispatch_sync(v8, &unk_1E2C45500);
  }
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  if (!*((_QWORD *)self->_internal + 1))
  {
    if (dword_1ECD90A78 < 0)
    {
      if (qword_1ECD90F20 != -1)
        dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
      if (dword_1ECD90A78 <= 0)
        goto LABEL_11;
    }
    else if (!dword_1ECD90A78)
    {
LABEL_11:
      v35 = objc_msgSend_callStackSymbols(MEMORY[0x1E0CB3978], a2, (uint64_t)a3, v3);
      NSLog(CFSTR("IMRemoteObjectDied - %@"), v35);
      return;
    }
    v25 = (const char *)objc_msgSend_selector(a3, a2, (uint64_t)a3, v3);
    v26 = NSStringFromSelector(v25);
    _IMLog(CFSTR("Messaging invalid remote port: %@"), v27, v28, v29, v30, v31, v32, v33, v26);
    goto LABEL_11;
  }
  os_unfair_recursive_lock_lock_with_options();
  if (dword_1ECD90A78 < 0)
  {
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    if (dword_1ECD90A78 <= 0)
      goto LABEL_5;
  }
  else if (!dword_1ECD90A78)
  {
    goto LABEL_5;
  }
  v9 = (const char *)objc_msgSend_selector(a3, v6, v7, v8);
  v10 = NSStringFromSelector(v9);
  _IMLog(CFSTR("*** Forwarding invocation: %@"), v11, v12, v13, v14, v15, v16, v17, v10);
LABEL_5:
  v18 = IMCreateXPCObjectFromInvocation((uint64_t)a3);
  if (v18)
  {
    v20 = (void *)v18;
    v21 = objc_msgSend_forwardXPCObject_messageContext_locked_(self, v19, v18, 0, 1);
    xpc_release(v20);
    os_unfair_recursive_lock_unlock();
    if (v21 == 1)
    {
      v34 = objc_msgSend_callStackSymbols(MEMORY[0x1E0CB3978], v22, v23, v24);
      NSLog(CFSTR("IMRemoteObjectDied SendDeadObject - %@"), v34);
    }
  }
  else
  {
    os_unfair_recursive_lock_unlock();
  }
}

- (NSString)processName
{
  return (NSString *)*((_QWORD *)self->_internal + 5);
}

- (NSString)portName
{
  return (NSString *)*((_QWORD *)self->_internal + 4);
}

- (void)setPortName:(id)a3
{
  id v3;

  v3 = (id)*((_QWORD *)self->_internal + 4);
  if (v3 != a3)
  {

    *((_QWORD *)self->_internal + 4) = a3;
  }
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
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v9 = objc_msgSend_portName(self, v6, v7, v8);
  v13 = objc_msgSend_pid(self, v10, v11, v12);
  v17 = objc_msgSend_processName(self, v14, v15, v16);
  return (id)objc_msgSend_stringWithFormat_(v3, v18, (uint64_t)CFSTR("[%@] Port Name: %@  Pid: %d   Process: %@"), v19, v5, v9, v13, v17);
}

@end
