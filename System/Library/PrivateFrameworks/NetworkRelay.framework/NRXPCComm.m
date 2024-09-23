@implementation NRXPCComm

- (NRXPCComm)initWithDeviceIdentifier:(id)a3 notificationQueue:(id)a4 notificationBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NRXPCComm *v13;
  NRXPCComm *v14;
  uint64_t v15;
  id notificationBlock;
  unint64_t v17;
  uint64_t v18;
  NSUUID *nrUUID;
  os_log_t v20;
  os_log_t v21;
  _BOOL4 v22;
  os_log_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  NSObject *v34;
  _BOOL4 v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  objc_super v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    v30 = nrCopyLogObj_322();
    v31 = v30;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v32 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

      if (!v32)
        goto LABEL_18;
    }
    v36 = nrCopyLogObj_322();
    _NRLogWithArgs((uint64_t)v36, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceIdentifier", v37, v38, v39, v40, v41, (uint64_t)");

LABEL_18:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v42 = _os_log_pack_fill();
    *(_DWORD *)v42 = 136446466;
    *(_QWORD *)(v42 + 4) = "-[NRXPCComm initWithDeviceIdentifier:notificationQueue:notificationBlock:]";
    *(_WORD *)(v42 + 12) = 2080;
    *(_QWORD *)(v42 + 14) = "-[NRXPCComm initWithDeviceIdentifier:notificationQueue:notificationBlock:]";
    goto LABEL_22;
  }
  v12 = v11;
  v51.receiver = self;
  v51.super_class = (Class)NRXPCComm;
  v13 = -[NRXPCComm init](&v51, sel_init);
  if (!v13)
  {
    v33 = nrCopyLogObj_322();
    v34 = v33;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v35 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);

      if (!v35)
        goto LABEL_21;
    }
    v43 = nrCopyLogObj_322();
    _NRLogWithArgs((uint64_t)v43, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v44, v45, v46, v47, v48, (uint64_t)");

LABEL_21:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v49 = _os_log_pack_fill();
    *(_DWORD *)v49 = 136446210;
    *(_QWORD *)(v49 + 4) = "-[NRXPCComm initWithDeviceIdentifier:notificationQueue:notificationBlock:]";
LABEL_22:
    v50 = nrCopyLogObj_322();
    _NRLogAbortWithPack(v50);
  }
  v14 = v13;
  objc_storeStrong((id *)&v13->_deviceIdentifier, a3);
  objc_storeStrong((id *)&v14->_notificationQueue, a4);
  v15 = MEMORY[0x1DF0BA328](v12);
  notificationBlock = v14->_notificationBlock;
  v14->_notificationBlock = (id)v15;

  v14->_lock._os_unfair_lock_opaque = 0;
  do
    v17 = __ldxr(&initWithDeviceIdentifier_notificationQueue_notificationBlock__sNRDevicePreferencesIndex);
  while (__stxr(v17 + 1, &initWithDeviceIdentifier_notificationQueue_notificationBlock__sNRDevicePreferencesIndex));
  v14->_identifier = v17;
  -[NRDeviceIdentifier nrDeviceIdentifier](v14->_deviceIdentifier, "nrDeviceIdentifier");
  v18 = objc_claimAutoreleasedReturnValue();
  nrUUID = v14->_nrUUID;
  v14->_nrUUID = (NSUUID *)v18;

  _NRAddEligibleNRUUIDForLogObject(v14->_nrUUID);
  v20 = _NRCopyLogObjectForNRUUID(v14->_nrUUID);
  v21 = v20;
  if (sNRCopyLogToStdErr)
  {

LABEL_8:
    v23 = _NRCopyLogObjectForNRUUID(v14->_nrUUID);
    _NRLogWithArgs((uint64_t)v23, 0, (uint64_t)"%s%.30s:%-4d Init for %@", v24, v25, v26, v27, v28, (uint64_t)");

    goto LABEL_9;
  }
  v22 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if (v22)
    goto LABEL_8;
LABEL_9:

  return v14;
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  os_log_t v4;
  os_log_t v5;
  _BOOL4 v6;
  os_log_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  OS_xpc_object *connection;
  OS_xpc_object *v14;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  v5 = v4;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (!v6)
      goto LABEL_5;
  }
  v7 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  _NRLogWithArgs((uint64_t)v7, 0, (uint64_t)"%s%.30s:%-4d Cancel", v8, v9, v10, v11, v12, (uint64_t)");

LABEL_5:
  self->_cancelled = 1;
  os_unfair_lock_assert_owner(p_lock);
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    v14 = self->_connection;
    self->_connection = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  os_log_t v3;
  os_log_t v4;
  _BOOL4 v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUUID *v12;
  objc_super v13;

  v3 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  v4 = v3;
  if (sNRCopyLogToStdErr)
  {

LABEL_4:
    v6 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
    _NRLogWithArgs((uint64_t)v6, 0, (uint64_t)"%s%.30s:%-4d Dealloc", v7, v8, v9, v10, v11, (uint64_t)");

    goto LABEL_5;
  }
  v5 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v5)
    goto LABEL_4;
LABEL_5:
  -[NRXPCComm cancel](self, "cancel");
  v12 = self->_nrUUID;
  os_unfair_lock_lock(&sNRLogLock);
  objc_msgSend((id)sNRUUIDsEligibleForLogObject, "removeObject:", v12);

  os_unfair_lock_unlock(&sNRLogLock);
  v13.receiver = self;
  v13.super_class = (Class)NRXPCComm;
  -[NRXPCComm dealloc](&v13, sel_dealloc);
}

- (id)description
{
  id v3;
  unint64_t identifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
    identifier = self->_identifier;
  else
    identifier = 0;
  -[NRXPCComm deviceIdentifier](self, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nrDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("XPCComm[%llu %@]"), identifier, v7);

  return v8;
}

- (void)sendXPCCommDictionary:(id)a3
{
  os_unfair_lock_s *p_lock;
  os_log_t v5;
  os_log_t v6;
  NRXPCComm *v7;
  _BOOL4 v8;
  os_log_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self)
  {
    v7 = 0;
    goto LABEL_6;
  }
  if (!self->_cancelled)
  {
    v7 = self;
LABEL_6:
    -[NRXPCComm sendMessageLocked:]((uint64_t)v7, v15);
    goto LABEL_9;
  }
  v5 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  v6 = v5;
  if (sNRCopyLogToStdErr)
  {

LABEL_8:
    v9 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
    _NRLogWithArgs((uint64_t)v9, 0, (uint64_t)"%s%.30s:%-4d not sending message as cancelled", v10, v11, v12, v13, v14, (uint64_t)");

    goto LABEL_9;
  }
  v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v8)
    goto LABEL_8;
LABEL_9:
  os_unfair_lock_unlock(p_lock);

}

- (void)activate
{
  os_unfair_lock_s *p_lock;
  os_log_t v4;
  os_log_t v5;
  _BOOL4 v6;
  os_log_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self)
  {
    if (self->_cancelled)
    {
      v4 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
      v5 = v4;
      if (sNRCopyLogToStdErr)
      {

LABEL_7:
        v7 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
        _NRLogWithArgs((uint64_t)v7, 0, (uint64_t)"%s%.30s:%-4d not activating as cancelled", v8, v9, v10, v11, v12, (uint64_t)");

        goto LABEL_8;
      }
      v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

      if (v6)
        goto LABEL_7;
    }
    else
    {
      -[NRXPCComm activateLocked]((uint64_t)self);
    }
  }
LABEL_8:
  os_unfair_lock_unlock(p_lock);
}

- (NRDeviceIdentifier)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong(&self->_notificationBlock, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (void)activateLocked
{
  NSObject *v2;
  xpc_connection_t mach_service;
  void *v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 12));
    if (!*(_QWORD *)(a1 + 32))
    {
      if (nrXPCCopyQueue_onceToken != -1)
        dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2127);
      v2 = (id)nrXPCCopyQueue_nrXPCQueue;
      mach_service = xpc_connection_create_mach_service("com.apple.terminusd", v2, 2uLL);
      v4 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = mach_service;

      objc_initWeak(&location, (id)a1);
      v5 = (_xpc_connection_s *)*(id *)(a1 + 32);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __27__NRXPCComm_activateLocked__block_invoke;
      v7[3] = &unk_1EA3F7400;
      objc_copyWeak(&v8, &location);
      xpc_connection_set_event_handler(v5, v7);

      v6 = (_xpc_connection_s *)*(id *)(a1 + 32);
      xpc_connection_activate(v6);

      -[NRXPCComm sendMessageLocked:](a1, 0);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __27__NRXPCComm_activateLocked__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  os_log_t v7;
  os_log_t v8;
  id v9;
  os_log_t v10;
  os_log_t v11;
  os_log_t v12;
  os_log_t v13;
  _BOOL4 v14;
  os_log_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_log_t v21;
  os_log_t v22;
  _BOOL4 v23;
  os_log_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  os_log_t v32;
  os_log_t v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  _BOOL4 v39;
  os_log_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL4 v46;
  os_log_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BOOL4 v53;
  os_log_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  _BOOL4 v61;
  void *v62;
  id v63;
  NSObject *v64;
  id v65;
  uint64_t v66;
  _QWORD block[4];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_42;
  v5 = MEMORY[0x1DF0BA7A8](v3);
  if (v5 == MEMORY[0x1E0C81310])
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 3);
    *((_BYTE *)WeakRetained + 8) = 0;
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      v21 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
      v22 = v21;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v53 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

        if (!v53)
          goto LABEL_38;
      }
      v54 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
      v40 = v54;
      v60 = "%s%.30s:%-4d xpc connection interrupted";
    }
    else
    {
      v9 = (id)MEMORY[0x1E0C81260];
      v10 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
      v11 = v10;
      if (v3 != v9)
      {
        if (sNRCopyLogToStdErr)
        {

LABEL_27:
          v40 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
          _NRLogWithArgs((uint64_t)v40, 16, (uint64_t)"%s%.30s:%-4d received unknown XPC error: %@", v41, v42, v43, v44, v45, (uint64_t)");
LABEL_37:

          goto LABEL_38;
        }
        v39 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

        if (v39)
          goto LABEL_27;
LABEL_38:
        v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v30, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("teardown"));
        v62 = (void *)*((_QWORD *)WeakRetained + 5);
        if (v62)
        {
          v63 = v62;
          v64 = *((_QWORD *)WeakRetained + 6);
          v70[0] = MEMORY[0x1E0C809B0];
          v70[1] = 3221225472;
          v70[2] = __27__NRXPCComm_activateLocked__block_invoke_2;
          v70[3] = &unk_1EA3F7278;
          v72 = v63;
          v71 = v30;
          v65 = v63;
          dispatch_async(v64, v70);

        }
        os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 3);
        goto LABEL_41;
      }
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v61 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

        if (!v61)
          goto LABEL_38;
      }
      v54 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
      v40 = v54;
      v60 = "%s%.30s:%-4d received XPC error invalid";
    }
    _NRLogWithArgs((uint64_t)v54, 0, (uint64_t)v60, v55, v56, v57, v58, v59, (uint64_t)"");
    goto LABEL_37;
  }
  v6 = MEMORY[0x1E0C812F8];
  if (v5 == MEMORY[0x1E0C812F8])
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 3);
    v12 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
    v13 = v12;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v23 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

      if (!v23)
        goto LABEL_20;
    }
    v24 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
    _NRLogWithArgs((uint64_t)v24, 2, (uint64_t)"%s%.30s:%-4d Received XPC dict: %@", v25, v26, v27, v28, v29, (uint64_t)");

LABEL_20:
    xpc_dictionary_get_dictionary(v3, "XPCCommNotification");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v30, "XPCCommDictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1DF0BA7A8]() == v6)
    {
      v34 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      v35 = (void *)*((_QWORD *)WeakRetained + 5);
      if (v35)
      {
        v36 = v35;
        v37 = *((_QWORD *)WeakRetained + 6);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __27__NRXPCComm_activateLocked__block_invoke_3;
        block[3] = &unk_1EA3F7278;
        v69 = v36;
        v68 = v34;
        v38 = v36;
        dispatch_async(v37, block);

      }
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 3);

      goto LABEL_31;
    }
    v32 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
    v33 = v32;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v46 = os_log_type_enabled(v32, OS_LOG_TYPE_FAULT);

      if (!v46)
      {
LABEL_30:
        os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 3);
LABEL_31:

LABEL_41:
        goto LABEL_42;
      }
    }
    v47 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
    _NRLogWithArgs((uint64_t)v47, 17, (uint64_t)"Invalid notification format", v48, v49, v50, v51, v52, v66);

    goto LABEL_30;
  }
  v7 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
  v8 = v7;
  if (sNRCopyLogToStdErr)
  {

LABEL_13:
    v15 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 3));
    _NRLogWithArgs((uint64_t)v15, 16, (uint64_t)"%s%.30s:%-4d received unexpected XPC message %@", v16, v17, v18, v19, v20, (uint64_t)");

    goto LABEL_42;
  }
  v14 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

  if (v14)
    goto LABEL_13;
LABEL_42:

}

- (void)sendMessageLocked:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  xpc_object_t v6;
  void *v7;
  xpc_object_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _xpc_connection_s *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  _QWORD handler[4];
  id v31;
  id v32;
  id location;
  unsigned __int8 uuid[8];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
    goto LABEL_12;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 12));
  -[NRXPCComm activateLocked](a1);
  *(_QWORD *)uuid = 0;
  v35 = 0;
  objc_msgSend((id)a1, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nrDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getUUIDBytes:", uuid);

  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = v6;
  if (!v6)
  {
    v16 = nrCopyLogObj_322();
    v17 = v16;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v18 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

      if (!v18)
        goto LABEL_23;
    }
    goto LABEL_22;
  }
  xpc_dictionary_set_uint64(v6, "Type", 0x29uLL);
  xpc_dictionary_set_uuid(v7, "DeviceIdentifier", uuid);
  v8 = xpc_dictionary_create(0, 0, 0);
  if (!v8)
  {
    v19 = nrCopyLogObj_322();
    v20 = v19;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v21)
      {
LABEL_23:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v28 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v28, (uint64_t)"nr_xpc_dictionary_create");
        v29 = nrCopyLogObj_322();
        _NRLogAbortWithPack(v29);
      }
    }
LABEL_22:
    v22 = nrCopyLogObj_322();
    _NRLogWithArgs((uint64_t)v22, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v23, v24, v25, v26, v27, (uint64_t)");

    goto LABEL_23;
  }
  if (v3)
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v3);
  else
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v9;
  if (!*(_BYTE *)(a1 + 8))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("checkin"));
  v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_dictionary_set_value(v8, "XPCCommDictionary", v11);
  xpc_dictionary_set_value(v7, "XPCCommNotification", v8);
  objc_initWeak(&location, (id)a1);
  objc_msgSend(v10, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (_xpc_connection_s *)*(id *)(a1 + 32);
  if (nrXPCCopyQueue_onceToken != -1)
    dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2127);
  v14 = (id)nrXPCCopyQueue_nrXPCQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __31__NRXPCComm_sendMessageLocked___block_invoke;
  handler[3] = &unk_1EA3F6E98;
  objc_copyWeak(&v32, &location);
  v15 = v12;
  v31 = v15;
  xpc_connection_send_message_with_reply(v13, v7, v14, handler);

  *(_BYTE *)(a1 + 8) = 1;
  objc_destroyWeak(&v32);

  objc_destroyWeak(&location);
LABEL_12:

}

void __31__NRXPCComm_sendMessageLocked___block_invoke(uint64_t a1, void *a2)
{
  void **WeakRetained;
  uint64_t v4;
  uint64_t v5;
  os_log_t v6;
  os_log_t v7;
  _BOOL4 v8;
  os_log_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = MEMORY[0x1DF0BA7A8](v21);
    v5 = MEMORY[0x1E0C81310];
    v6 = _NRCopyLogObjectForNRUUID(WeakRetained[3]);
    v7 = v6;
    if (v4 == v5)
    {
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v15 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

        if (!v15)
          goto LABEL_12;
      }
      v9 = _NRCopyLogObjectForNRUUID(WeakRetained[3]);
      _NRLogWithArgs((uint64_t)v9, 16, (uint64_t)"%s%.30s:%-4d failed to send %@ due to error %@", v16, v17, v18, v19, v20, (uint64_t)");
      goto LABEL_11;
    }
    if (sNRCopyLogToStdErr)
    {

LABEL_8:
      v9 = _NRCopyLogObjectForNRUUID(WeakRetained[3]);
      _NRLogWithArgs((uint64_t)v9, 0, (uint64_t)"%s%.30s:%-4d sent %@", v10, v11, v12, v13, v14, (uint64_t)");
LABEL_11:

      goto LABEL_12;
    }
    v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v8)
      goto LABEL_8;
  }
LABEL_12:

}

uint64_t __27__NRXPCComm_activateLocked__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __27__NRXPCComm_activateLocked__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
