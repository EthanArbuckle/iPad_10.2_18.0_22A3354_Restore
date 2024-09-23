@implementation NRDeviceMonitor

- (NRDeviceMonitor)initWithDeviceIdentifier:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NRDeviceMonitor *v13;
  NRDeviceMonitor *v14;
  NSString *internalProxySvcIntfName;
  NSObject *v16;
  xpc_connection_t mach_service;
  OS_xpc_object *connection;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _xpc_connection_s *v24;
  _xpc_connection_s *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NRDeviceMonitor *v37;
  NSObject *v39;
  NSObject *v40;
  _BOOL4 v41;
  NSObject *v42;
  NSObject *v43;
  _BOOL4 v44;
  NSObject *v45;
  NSObject *v46;
  _BOOL4 v47;
  NSObject *v48;
  NSObject *v49;
  _BOOL4 v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  objc_super v80;
  _QWORD handler[4];
  id v82;
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    v39 = nrCopyLogObj_222();
    v40 = v39;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v41 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);

      if (!v41)
        goto LABEL_40;
    }
    v51 = nrCopyLogObj_222();
    _NRLogWithArgs((uint64_t)v51, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceIdentifier", v52, v53, v54, v55, v56, (uint64_t)");

    goto LABEL_40;
  }
  if (!v10)
  {
    v42 = nrCopyLogObj_222();
    v43 = v42;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v44 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);

      if (!v44)
        goto LABEL_40;
    }
    v57 = nrCopyLogObj_222();
    _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL delegate", v58, v59, v60, v61, v62, (uint64_t)");

    goto LABEL_40;
  }
  v12 = v11;
  if (!v11)
  {
    v45 = nrCopyLogObj_222();
    v46 = v45;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v47 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);

      if (!v47)
      {
LABEL_40:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v69 = _os_log_pack_fill();
        *(_DWORD *)v69 = 136446466;
        *(_QWORD *)(v69 + 4) = "-[NRDeviceMonitor initWithDeviceIdentifier:delegate:queue:]";
        *(_WORD *)(v69 + 12) = 2080;
        *(_QWORD *)(v69 + 14) = "-[NRDeviceMonitor initWithDeviceIdentifier:delegate:queue:]";
        v70 = nrCopyLogObj_222();
        _NRLogAbortWithPack(v70);
      }
    }
    v63 = nrCopyLogObj_222();
    _NRLogWithArgs((uint64_t)v63, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL queue", v64, v65, v66, v67, v68, (uint64_t)");

    goto LABEL_40;
  }
  v80.receiver = self;
  v80.super_class = (Class)NRDeviceMonitor;
  v13 = -[NRDeviceMonitor init](&v80, sel_init);
  v14 = v13;
  if (!v13)
  {
    v48 = nrCopyLogObj_222();
    v49 = v48;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v50 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);

      if (!v50)
      {
LABEL_43:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v77 = _os_log_pack_fill();
        *(_DWORD *)v77 = 136446210;
        *(_QWORD *)(v77 + 4) = "-[NRDeviceMonitor initWithDeviceIdentifier:delegate:queue:]";
        v78 = nrCopyLogObj_222();
        _NRLogAbortWithPack(v78);
      }
    }
    v71 = nrCopyLogObj_222();
    _NRLogWithArgs((uint64_t)v71, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v72, v73, v74, v75, v76, (uint64_t)");

    goto LABEL_43;
  }
  objc_storeStrong((id *)&v13->_internalDeviceIdentifier, a3);
  objc_storeWeak((id *)&v14->_delegate, v10);
  objc_storeStrong((id *)&v14->_delegateQueue, a5);
  *(_WORD *)&v14->_internalLinkType = 0;
  *(_QWORD *)&v14->_internalIsRegistered = 0;
  internalProxySvcIntfName = v14->_internalProxySvcIntfName;
  v14->_internalProxySvcIntfName = 0;

  v14->_internalThermalPressureLevel = 0;
  v14->_lock._os_unfair_lock_opaque = 0;
  v16 = v14->_delegateQueue;
  mach_service = xpc_connection_create_mach_service("com.apple.terminusd", v16, 2uLL);
  connection = v14->_connection;
  v14->_connection = mach_service;

  if (!v14->_connection)
  {
    if (nrCopyLogObj_onceToken_215 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
    if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_FAULT))
      && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 17, (uint64_t)"Failed to create NRDeviceMonitor XPC connection", v19, v20, v21, v22, v23, v79), nrCopyLogObj_onceToken_215 != -1))
    {
      dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
      if (sNRCopyLogToStdErr)
        goto LABEL_19;
    }
    else if (sNRCopyLogToStdErr)
    {
      goto LABEL_19;
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_ERROR))
    {
LABEL_20:
      v37 = 0;
      goto LABEL_21;
    }
LABEL_19:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 16, (uint64_t)"%s%.30s:%-4d Failed to start %@ for %@", v19, v20, v21, v22, v23, (uint64_t)");
    goto LABEL_20;
  }
  objc_initWeak(location, v14);
  v24 = v14->_connection;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __24__NRDeviceMonitor_start__block_invoke;
  handler[3] = &unk_1EA3F7400;
  objc_copyWeak(&v82, location);
  xpc_connection_set_event_handler(v24, handler);

  v25 = v14->_connection;
  xpc_connection_activate(v25);

  -[NRDeviceMonitor checkInWithRetryCount:]((id *)&v14->super.isa, 0, v26, v27, v28, v29, v30, v31, v79);
  objc_destroyWeak(&v82);
  objc_destroyWeak(location);
  if (nrCopyLogObj_onceToken_215 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 0, (uint64_t)"%s%.30s:%-4d Started %@ for %@", v32, v33, v34, v35, v36, (uint64_t)");
  v37 = v14;
LABEL_21:

  return v37;
}

- (void)dealloc
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  OS_xpc_object *connection;
  OS_xpc_object *v10;
  void *v11;
  objc_super v12;

  if (nrCopyLogObj_onceToken_215 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (id)nrCopyLogObj_sNRLogObj_217;
    -[NRDeviceMonitor deviceIdentifier](self, "deviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _NRLogWithArgs((uint64_t)v3, 0, (uint64_t)"%s%.30s:%-4d Dealloc %@ for %@", v4, v5, v6, v7, v8, (uint64_t)");

  }
  if (self)
  {
    connection = self->_connection;
    if (connection)
    {
      xpc_connection_cancel(connection);
      v10 = self->_connection;
      self->_connection = 0;

    }
  }
  v12.receiver = self;
  v12.super_class = (Class)NRDeviceMonitor;
  -[NRDeviceMonitor dealloc](&v12, sel_dealloc);
}

- (NRDeviceIdentifier)deviceIdentifier
{
  if (self)
    self = (NRDeviceMonitor *)self->_internalDeviceIdentifier;
  return (NRDeviceIdentifier *)self;
}

- (BOOL)isRegistered
{
  NRDeviceMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2)
    LOBYTE(v2) = v2->_internalIsRegistered;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isEnabled
{
  NRDeviceMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2)
    LOBYTE(v2) = v2->_internalIsEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isNearby
{
  NRDeviceMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2)
    LOBYTE(v2) = v2->_internalIsNearby;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isConnected
{
  NRDeviceMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2)
    LOBYTE(v2) = v2->_internalIsConnected;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isCloudConnected
{
  NRDeviceMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2)
    LOBYTE(v2) = v2->_internalIsCloudConnected;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isAsleep
{
  NRDeviceMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2)
    LOBYTE(v2) = v2->_internalIsAsleep;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isClassCConnected
{
  NRDeviceMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2)
    LOBYTE(v2) = v2->_internalIsClassCConnected;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unsigned)linkType
{
  NRDeviceMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2)
    LOBYTE(v2) = v2->_internalLinkType;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (NSString)proxyServiceInterfaceName
{
  os_unfair_lock_s *p_lock;
  NSString *internalProxySvcIntfName;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self)
    internalProxySvcIntfName = self->_internalProxySvcIntfName;
  else
    internalProxySvcIntfName = 0;
  v5 = (void *)-[NSString copy](internalProxySvcIntfName, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v5;
}

- (unsigned)linkSubtype
{
  NRDeviceMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2)
    LOBYTE(v2) = v2->_internalLinkSubtype;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (int)thermalPressureLevel
{
  NRDeviceMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2)
    LODWORD(v2) = v2->_internalThermalPressureLevel;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (BOOL)pluggedIn
{
  NRDeviceMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2)
    LOBYTE(v2) = v2->_internalPluggedIn;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_internalProxySvcIntfName, 0);
  objc_storeStrong((id *)&self->_internalDeviceIdentifier, 0);
}

void __24__NRDeviceMonitor_start__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = MEMORY[0x1DF0BA7A8](v14);
    if (v4 == MEMORY[0x1E0C812F8])
    {
      if (nrCopyLogObj_onceToken_215 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
      if (sNRCopyLogToStdErr
        || (v10 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_DEBUG), v11 = v14, v10))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 2, (uint64_t)"%s%.30s:%-4d Received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)");
        v11 = v14;
      }
      -[NRDeviceMonitor updateStateFromResponse:]((uint64_t)WeakRetained, v11);
    }
    else if (v4 == MEMORY[0x1E0C81310])
    {
      if (nrCopyLogObj_onceToken_215 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 16, (uint64_t)"%s%.30s:%-4d Received XPC error: %@, retrying", v5, v6, v7, v8, v9, (uint64_t)");
      -[NRDeviceMonitor checkInWithRetryCount:](WeakRetained, 0, v12, v5, v6, v7, v8, v9, v13);
    }
    else
    {
      if (nrCopyLogObj_onceToken_215 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 16, (uint64_t)"%s%.30s:%-4d Received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)"), nrCopyLogObj_onceToken_215 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
        if (sNRCopyLogToStdErr)
          goto LABEL_11;
      }
      else if (sNRCopyLogToStdErr)
      {
LABEL_11:
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 17, (uint64_t)"Received unexpected XPC object", v5, v6, v7, v8, v9, v13);
        goto LABEL_24;
      }
      if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_FAULT))
        goto LABEL_11;
    }
  }
LABEL_24:

}

- (void)checkInWithRetryCount:(uint64_t)a3
{
  uint64_t v9;
  const char *v10;
  void *v13;
  xpc_object_t v14;
  void *v15;
  _xpc_connection_s *v16;
  NSObject *v17;
  id v18;
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
  unsigned int v33;
  id location;
  unsigned __int8 uuid[8];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a2 >= 6)
  {
    if (nrCopyLogObj_onceToken_215 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_FAULT))
    {
      v9 = nrCopyLogObj_sNRLogObj_217;
      v10 = "Failed to checkin NRDeviceMonitor after retries";
LABEL_16:
      _NRLogWithArgs(v9, 17, (uint64_t)v10, a4, a5, a6, a7, a8, a9);
      return;
    }
    return;
  }
  if (a1[8])
  {
    *(_QWORD *)uuid = 0;
    v36 = 0;
    objc_msgSend(a1[4], "nrDeviceIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getUUIDBytes:", uuid);

    v14 = xpc_dictionary_create(0, 0, 0);
    v15 = v14;
    if (v14)
    {
      xpc_dictionary_set_uint64(v14, "Type", 0xAuLL);
      xpc_dictionary_set_uuid(v15, "DeviceIdentifier", uuid);
      objc_initWeak(&location, a1);
      v16 = (_xpc_connection_s *)a1[8];
      v17 = a1[6];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __41__NRDeviceMonitor_checkInWithRetryCount___block_invoke;
      handler[3] = &unk_1EA3F7428;
      objc_copyWeak(&v32, &location);
      v18 = v15;
      v31 = v18;
      v33 = a2;
      xpc_connection_send_message_with_reply(v16, v18, v17, handler);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);

      return;
    }
    v19 = nrCopyLogObj_222();
    v20 = v19;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v21)
      {
LABEL_22:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v28 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v28, (uint64_t)"nr_xpc_dictionary_create");
        v29 = nrCopyLogObj_222();
        _NRLogAbortWithPack(v29);
      }
    }
    v22 = nrCopyLogObj_222();
    _NRLogWithArgs((uint64_t)v22, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v23, v24, v25, v26, v27, (uint64_t)");

    goto LABEL_22;
  }
  if (nrCopyLogObj_onceToken_215 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_FAULT))
  {
    v9 = nrCopyLogObj_sNRLogObj_217;
    v10 = "Could not check in with server as no connection found";
    goto LABEL_16;
  }
}

void __41__NRDeviceMonitor_checkInWithRetryCount___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = MEMORY[0x1DF0BA7A8](v13);
    if (v4 == MEMORY[0x1E0C812F8])
    {
      if (nrCopyLogObj_onceToken_215 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
      if (sNRCopyLogToStdErr
        || (v10 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_DEBUG), v11 = v13, v10))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 2, (uint64_t)"%s%.30s:%-4d Checkin received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)");
        v11 = v13;
      }
      -[NRDeviceMonitor updateStateFromResponse:]((uint64_t)WeakRetained, v11);
    }
    else if (v4 == MEMORY[0x1E0C81310])
    {
      if (nrCopyLogObj_onceToken_215 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 16, (uint64_t)"%s%.30s:%-4d Checkin could not deliver message %@, error %@, retrying", v5, v6, v7, v8, v9, (uint64_t)");
      -[NRDeviceMonitor checkInWithRetryCount:](WeakRetained, (*(_DWORD *)(a1 + 48) + 1));
    }
    else
    {
      if (nrCopyLogObj_onceToken_215 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 16, (uint64_t)"%s%.30s:%-4d Checkin received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)"), nrCopyLogObj_onceToken_215 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
        if (sNRCopyLogToStdErr)
          goto LABEL_11;
      }
      else if (sNRCopyLogToStdErr)
      {
LABEL_11:
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 17, (uint64_t)"Checkin received unexpected XPC object", v5, v6, v7, v8, v9, v12);
        goto LABEL_24;
      }
      if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_FAULT))
        goto LABEL_11;
    }
  }
LABEL_24:

}

- (void)updateStateFromResponse:(uint64_t)a1
{
  id v3;
  int8x8_t v4;
  unint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  unsigned __int8 uint64;
  unsigned int v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned __int8 v70;
  unsigned int v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *string;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  int8x8_t v95;
  BOOL v96;
  BOOL v97;
  BOOL v98;
  BOOL v99;
  char v100;
  void *v101;
  unint64_t v102;
  BOOL v103;
  char v104;
  int v105;
  int8x8_t v106;
  int8x8_t v107;
  char v108;
  char v109;
  char v110;
  char v111;
  char v112;
  char v113;
  char v114;
  char v115;
  char v116;
  unsigned int v117;
  id v118;
  void *v119;
  void *v120;
  uint64_t v121;
  id v122;
  __CFString *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  NSObject *v129;
  int8x8_t v130;
  int8x8_t v131;
  NSObject *v132;
  NSObject *v133;
  _BOOL4 v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *StringFromNRLinkType;
  void *StringFromNRLinkSubtype;
  __CFString *StringFromThermalPressureLevel;
  void *v144;
  void *v145;
  __CFString *v146;
  __int8 v147;
  __int8 v148;
  __int8 v149;
  __int8 v150;
  __int8 v151;
  __int8 v152;
  unsigned __int8 v153;
  char v154;
  char v155;
  char v156;
  BOOL v157;
  __int8 v158;
  int8x8_t v159;
  int v160;
  int v161;
  char v162;
  int v163;
  BOOL v164;
  int v165;
  int8x8_t v166;
  void *v167;
  _QWORD block[5];
  __int32 v169;
  __int16 v170;
  __int8 v171;
  char v172;
  BOOL v173;
  BOOL v174;
  char v175;
  BOOL v176;
  char v177;

  v3 = a2;
  if (!v3)
  {
    v132 = nrCopyLogObj_222();
    v133 = v132;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v134 = os_log_type_enabled(v132, OS_LOG_TYPE_FAULT);

      if (!v134)
        goto LABEL_89;
    }
    v135 = nrCopyLogObj_222();
    _NRLogWithArgs((uint64_t)v135, 17, (uint64_t)"%s called with null object", v136, v137, v138, v139, v140, (uint64_t)"-[NRDeviceMonitor updateStateFromResponse:]");

    goto LABEL_89;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v4.i32[0] = *(_DWORD *)(a1 + 9);
  v4.i16[2] = *(_WORD *)(a1 + 13);
  v159 = v4;
  v158 = *(_BYTE *)(a1 + 15);
  v163 = *(unsigned __int8 *)(a1 + 17);
  v165 = *(unsigned __int8 *)(a1 + 18);
  v5 = (unint64_t)*(id *)(a1 + 40);
  v161 = *(_DWORD *)(a1 + 20);
  v160 = *(unsigned __int8 *)(a1 + 19);
  v6 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusIsRegistered");
  if (*(unsigned __int8 *)(a1 + 9) != v6)
  {
    v12 = v6;
    if (nrCopyLogObj_onceToken_215 == -1)
    {
      if (sNRCopyLogToStdErr)
        goto LABEL_6;
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
      if (sNRCopyLogToStdErr)
        goto LABEL_6;
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_INFO))
    {
LABEL_7:
      *(_BYTE *)(a1 + 9) = v12;
      goto LABEL_8;
    }
LABEL_6:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 1, (uint64_t)"%s%.30s:%-4d isRegistered: %d -> %d", v7, v8, v9, v10, v11, (uint64_t)");
    goto LABEL_7;
  }
LABEL_8:
  v13 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusIsEnabled");
  if (*(unsigned __int8 *)(a1 + 10) == v13)
    goto LABEL_14;
  v19 = v13;
  if (nrCopyLogObj_onceToken_215 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_12:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 1, (uint64_t)"%s%.30s:%-4d isEnabled: %d -> %d", v14, v15, v16, v17, v18, (uint64_t)");
      goto LABEL_13;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
    if (sNRCopyLogToStdErr)
      goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_INFO))
    goto LABEL_12;
LABEL_13:
  *(_BYTE *)(a1 + 10) = v19;
LABEL_14:
  v20 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusIsNearby");
  if (*(unsigned __int8 *)(a1 + 11) == v20)
    goto LABEL_20;
  v26 = v20;
  if (nrCopyLogObj_onceToken_215 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_18:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 1, (uint64_t)"%s%.30s:%-4d isNearby: %d -> %d", v21, v22, v23, v24, v25, (uint64_t)");
      goto LABEL_19;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
    if (sNRCopyLogToStdErr)
      goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_INFO))
    goto LABEL_18;
LABEL_19:
  *(_BYTE *)(a1 + 11) = v26;
LABEL_20:
  v27 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusIsConnected");
  if (*(unsigned __int8 *)(a1 + 12) == v27)
    goto LABEL_26;
  v33 = v27;
  if (nrCopyLogObj_onceToken_215 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_24:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 1, (uint64_t)"%s%.30s:%-4d isConnected: %d -> %d", v28, v29, v30, v31, v32, (uint64_t)");
      goto LABEL_25;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
    if (sNRCopyLogToStdErr)
      goto LABEL_24;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_INFO))
    goto LABEL_24;
LABEL_25:
  *(_BYTE *)(a1 + 12) = v33;
LABEL_26:
  v34 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusIsCloudConnected");
  if (*(unsigned __int8 *)(a1 + 13) == v34)
    goto LABEL_32;
  v40 = v34;
  if (nrCopyLogObj_onceToken_215 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_30:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 1, (uint64_t)"%s%.30s:%-4d isCloudConnected: %d -> %d", v35, v36, v37, v38, v39, (uint64_t)");
      goto LABEL_31;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
    if (sNRCopyLogToStdErr)
      goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_INFO))
    goto LABEL_30;
LABEL_31:
  *(_BYTE *)(a1 + 13) = v40;
LABEL_32:
  v41 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusIsAsleep");
  if (*(unsigned __int8 *)(a1 + 14) == v41)
    goto LABEL_38;
  v47 = v41;
  if (nrCopyLogObj_onceToken_215 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_36:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 1, (uint64_t)"%s%.30s:%-4d isAsleep: %d -> %d", v42, v43, v44, v45, v46, (uint64_t)");
      goto LABEL_37;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
    if (sNRCopyLogToStdErr)
      goto LABEL_36;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_INFO))
    goto LABEL_36;
LABEL_37:
  *(_BYTE *)(a1 + 14) = v47;
LABEL_38:
  v48 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusIsClassCConnected");
  if (*(unsigned __int8 *)(a1 + 15) == v48)
    goto LABEL_44;
  v54 = v48;
  if (nrCopyLogObj_onceToken_215 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_42:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 1, (uint64_t)"%s%.30s:%-4d isClassCConnected: %d -> %d", v49, v50, v51, v52, v53, (uint64_t)");
      goto LABEL_43;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
    if (sNRCopyLogToStdErr)
      goto LABEL_42;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_INFO))
    goto LABEL_42;
LABEL_43:
  *(_BYTE *)(a1 + 15) = v54;
LABEL_44:
  v55 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusHasUnpairedBluetooth");
  if (*(unsigned __int8 *)(a1 + 16) == v55)
    goto LABEL_50;
  v61 = v55;
  if (nrCopyLogObj_onceToken_215 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_48:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 1, (uint64_t)"%s%.30s:%-4d hasUnpairedBluetooth: %d -> %d", v56, v57, v58, v59, v60, (uint64_t)");
      goto LABEL_49;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
    if (sNRCopyLogToStdErr)
      goto LABEL_48;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_INFO))
    goto LABEL_48;
LABEL_49:
  *(_BYTE *)(a1 + 16) = v61;
LABEL_50:
  uint64 = xpc_dictionary_get_uint64(v3, "DeviceMonitorStatusLinkType");
  if (*(unsigned __int8 *)(a1 + 17) == uint64)
    goto LABEL_56;
  if (nrCopyLogObj_onceToken_215 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_54:
      v63 = *(unsigned __int8 *)(a1 + 17);
      v64 = (id)nrCopyLogObj_sNRLogObj_217;
      StringFromNRLinkType = (void *)createStringFromNRLinkType(v63);
      v144 = (void *)createStringFromNRLinkType(uint64);
      _NRLogWithArgs((uint64_t)v64, 1, (uint64_t)"%s%.30s:%-4d link type: %@ -> %@", v65, v66, v67, v68, v69, (uint64_t)");

      goto LABEL_55;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
    if (sNRCopyLogToStdErr)
      goto LABEL_54;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_INFO))
    goto LABEL_54;
LABEL_55:
  *(_BYTE *)(a1 + 17) = uint64;
LABEL_56:
  v70 = xpc_dictionary_get_uint64(v3, "DeviceMonitorStatusLinkSubtype");
  if (*(unsigned __int8 *)(a1 + 18) == v70)
    goto LABEL_62;
  if (nrCopyLogObj_onceToken_215 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_60:
      v71 = *(unsigned __int8 *)(a1 + 18);
      v72 = (id)nrCopyLogObj_sNRLogObj_217;
      StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype(v71);
      v145 = (void *)createStringFromNRLinkSubtype(v70);
      _NRLogWithArgs((uint64_t)v72, 1, (uint64_t)"%s%.30s:%-4d link subtype: %@ -> %@", v73, v74, v75, v76, v77, (uint64_t)");

      goto LABEL_61;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
    if (sNRCopyLogToStdErr)
      goto LABEL_60;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_INFO))
    goto LABEL_60;
LABEL_61:
  *(_BYTE *)(a1 + 18) = v70;
LABEL_62:
  string = xpc_dictionary_get_string(v3, "DeviceMonitorStatusProxySvcIntfName");
  -[NRDeviceMonitor setInternalProxySvcIntfName:](a1, 0);
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRDeviceMonitor setInternalProxySvcIntfName:](a1, v79);

  }
  v80 = xpc_dictionary_get_uint64(v3, "DeviceMonitorStatusThermalPressureLevel");
  if (*(_DWORD *)(a1 + 20) != (_DWORD)v80)
  {
    if (nrCopyLogObj_onceToken_215 == -1)
    {
      if (sNRCopyLogToStdErr)
        goto LABEL_68;
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
      if (sNRCopyLogToStdErr)
        goto LABEL_68;
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_INFO))
    {
LABEL_69:
      *(_DWORD *)(a1 + 20) = v80;
      goto LABEL_70;
    }
LABEL_68:
    v81 = *(unsigned int *)(a1 + 20);
    v82 = (id)nrCopyLogObj_sNRLogObj_217;
    StringFromThermalPressureLevel = (__CFString *)createStringFromThermalPressureLevel(v81);
    v146 = (__CFString *)createStringFromThermalPressureLevel(v80);
    _NRLogWithArgs((uint64_t)v82, 1, (uint64_t)"%s%.30s:%-4d thermal pressure level: %@ -> %@", v83, v84, v85, v86, v87, (uint64_t)");

    goto LABEL_69;
  }
LABEL_70:
  v88 = xpc_dictionary_get_BOOL(v3, "DeviceMonitorStatusPluggedIn");
  if (*(unsigned __int8 *)(a1 + 19) == v88)
    goto LABEL_76;
  v94 = v88;
  if (nrCopyLogObj_onceToken_215 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_74:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 1, (uint64_t)"%s%.30s:%-4d plugged in: %d -> %d", v89, v90, v91, v92, v93, (uint64_t)");
      goto LABEL_75;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
    if (sNRCopyLogToStdErr)
      goto LABEL_74;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_INFO))
    goto LABEL_74;
LABEL_75:
  *(_BYTE *)(a1 + 19) = v94;
LABEL_76:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  v95.i32[0] = *(_DWORD *)(a1 + 9);
  v95.i16[2] = *(_WORD *)(a1 + 13);
  v95.i8[6] = *(_BYTE *)(a1 + 15);
  v96 = v163 != *(unsigned __int8 *)(a1 + 17);
  v97 = v165 != *(unsigned __int8 *)(a1 + 18);
  v98 = v161 != *(_DWORD *)(a1 + 20);
  v99 = *(_BYTE *)(a1 + 19) != 0;
  if (v5 | *(_QWORD *)(a1 + 40))
  {
    v101 = (void *)v5;
    v102 = v5;
    v103 = v161 != *(_DWORD *)(a1 + 20);
    v166 = v95;
    v104 = objc_msgSend(v101, "isEqualToString:");
    v95 = v166;
    v98 = v103;
    v5 = v102;
    v100 = v104 ^ 1;
  }
  else
  {
    v100 = 0;
  }
  v105 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 8))
  {
    v106 = v159;
    *(__int32 *)((char *)v106.i32 + 2) = *(__int32 *)((char *)v159.i32 + 2);
    v106.i8[6] = v158;
    v107 = veor_s8(vceqz_s8(v95), vceqz_s8(v106));
    v108 = v107.i8[6];
    v109 = v107.i8[5];
    v110 = v107.i8[4];
    v111 = v107.i8[3];
    v112 = v107.i8[2];
    v113 = v107.i8[1];
    v114 = v107.i8[0];
    v115 = (v160 != 0) ^ v99;
  }
  else
  {
    v96 = 1;
    v97 = 1;
    *(_BYTE *)(a1 + 8) = 1;
    v98 = 1;
    v115 = 1;
    v100 = 1;
    v114 = 1;
    v113 = 1;
    v112 = 1;
    v111 = 1;
    v110 = 1;
    v109 = 1;
    v108 = 1;
  }
  v155 = v105;
  v156 = v100;
  v148 = v113;
  v149 = v112;
  v150 = v111;
  v151 = v110;
  v147 = v114;
  v152 = v109;
  v153 = v108;
  v157 = v98;
  v154 = v115;
  v116 = (v105 != 0 || v96 || v97) | v100 | v98 | v115 | v114 | v111 | v113 | v112 | v110 | v109 | v108;
  v167 = (void *)v5;
  if (nrCopyLogObj_onceToken_215 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_85:
      v164 = v96;
      v117 = *(unsigned __int8 *)(a1 + 17);
      v162 = v116;
      v118 = (id)nrCopyLogObj_sNRLogObj_217;
      v119 = (void *)createStringFromNRLinkType(v117);
      v120 = (void *)createStringFromNRLinkSubtype(*(unsigned __int8 *)(a1 + 18));
      v121 = *(unsigned int *)(a1 + 20);
      v122 = *(id *)(a1 + 40);
      v123 = (__CFString *)createStringFromThermalPressureLevel(v121);
      _NRLogWithArgs((uint64_t)v118, 0, (uint64_t)"%s%.30s:%-4d Received %supdate %sregistered %sabled %snearby %sconnected %scloudConnected %sclassCConnected %shasUnpairedBluetooth %s %@(%@) prx %@ thermal %@ %spluggedIn for %@", v124, v125, v126, v127, v128, (uint64_t)");

      v116 = v162;
      v96 = v164;
      goto LABEL_86;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
    if (sNRCopyLogToStdErr)
      goto LABEL_85;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_DEFAULT))
    goto LABEL_85;
LABEL_86:
  if ((v116 & 1) != 0)
  {
    v129 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__NRDeviceMonitor_updateStateFromResponse___block_invoke;
    block[3] = &unk_1EA3F6E48;
    block[4] = a1;
    v130.i8[0] = v147;
    v130.i8[1] = v148;
    v130.i8[2] = v149;
    v130.i8[3] = v150;
    v130.i8[4] = v151;
    v130.i8[5] = v152;
    v130.i16[3] = v153;
    v131 = vand_s8(v130, (int8x8_t)0x101010101010101);
    v171 = v131.i8[6];
    v170 = v131.i16[2];
    v169 = v131.i32[0];
    v172 = v155;
    v173 = v96;
    v174 = v97;
    v175 = v156;
    v176 = v157;
    v177 = v154;
    dispatch_async(v129, block);
  }

LABEL_89:
}

- (void)setInternalProxySvcIntfName:(uint64_t)a1
{
  id v4;
  id *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a2;
  v6 = *(void **)(a1 + 40);
  v5 = (id *)(a1 + 40);
  v12 = v4;
  if ((objc_msgSend(v6, "isEqualToString:") & 1) == 0)
  {
    if (nrCopyLogObj_onceToken_215 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_INFO))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 1, (uint64_t)"%s%.30s:%-4d proxy-svc intf name: %@ -> %@", v7, v8, v9, v10, v11, (uint64_t)");
    objc_storeStrong(v5, a2);
  }

}

void __43__NRDeviceMonitor_updateStateFromResponse___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  id WeakRetained;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  _BOOL4 v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  _BOOL4 v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  _BOOL4 v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  _BOOL4 v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  _BOOL4 v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  NSObject *v73;
  _BOOL4 v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  NSObject *v83;
  _BOOL4 v84;
  id v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  NSObject *v93;
  _BOOL4 v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  NSObject *v102;
  _BOOL4 v103;
  id v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  NSObject *v111;
  NSObject *v112;
  _BOOL4 v113;
  id v114;
  void *v115;
  _QWORD *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  id v124;
  void *v125;
  NSObject *v126;
  NSObject *v127;
  _BOOL4 v128;
  id v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  NSObject *v140;
  NSObject *v141;
  _BOOL4 v142;
  id v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  _BOOL8 v151;
  void *v152;
  void *v153;
  void *StringFromNRLinkType;
  _QWORD *v155;
  __CFString *StringFromThermalPressureLevel;
  void *StringFromNRLinkSubtype;
  id v158;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v8 + 56));
    if (WeakRetained)
    {
      v158 = WeakRetained;
      if (!*(_BYTE *)(a1 + 40) || (objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_19:
        if (!*(_BYTE *)(a1 + 41) || (objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_30:
          if (!*(_BYTE *)(a1 + 42) || (objc_opt_respondsToSelector() & 1) == 0)
          {
LABEL_41:
            if (!*(_BYTE *)(a1 + 43) || (objc_opt_respondsToSelector() & 1) == 0)
            {
LABEL_52:
              if (!*(_BYTE *)(a1 + 44) || (objc_opt_respondsToSelector() & 1) == 0)
              {
LABEL_63:
                if (!*(_BYTE *)(a1 + 45) || (objc_opt_respondsToSelector() & 1) == 0)
                {
LABEL_74:
                  if (!*(_BYTE *)(a1 + 46) || (objc_opt_respondsToSelector() & 1) == 0)
                  {
LABEL_85:
                    if (!*(_BYTE *)(a1 + 47) || (objc_opt_respondsToSelector() & 1) == 0)
                    {
LABEL_96:
                      if (!*(_BYTE *)(a1 + 48) || (objc_opt_respondsToSelector() & 1) == 0)
                      {
LABEL_107:
                        if (!*(_BYTE *)(a1 + 49) || (objc_opt_respondsToSelector() & 1) == 0)
                        {
LABEL_118:
                          if (!*(_BYTE *)(a1 + 50) || (objc_opt_respondsToSelector() & 1) == 0)
                            goto LABEL_133;
                          if (nrCopyLogObj_onceToken_215 != -1)
                            dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                          v111 = (id)nrCopyLogObj_sNRLogObj_217;
                          v112 = v111;
                          if (sNRCopyLogToStdErr)
                          {

                          }
                          else
                          {
                            v113 = os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT);

                            if (!v113)
                            {
LABEL_130:
                              v122 = *(_QWORD *)(a1 + 32);
                              if (v122)
                                v123 = *(void **)(v122 + 40);
                              else
                                v123 = 0;
                              v124 = v123;
                              v125 = (void *)objc_msgSend(v124, "copy");
                              objc_msgSend(v158, "deviceProxyServiceInterfaceNameDidChange:interfaceName:", v122, v125);

LABEL_133:
                              if (!*(_BYTE *)(a1 + 51) || (objc_opt_respondsToSelector() & 1) == 0)
                                goto LABEL_148;
                              if (nrCopyLogObj_onceToken_215 != -1)
                                dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                              v126 = (id)nrCopyLogObj_sNRLogObj_217;
                              v127 = v126;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                v128 = os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT);

                                if (!v128)
                                {
LABEL_145:
                                  v138 = *(_QWORD *)(a1 + 32);
                                  if (v138)
                                    v139 = *(unsigned int *)(v138 + 20);
                                  else
                                    v139 = 0;
                                  objc_msgSend(v158, "deviceThermalPressureLevelDidChange:thermalPressureLevel:", v138, v139);
LABEL_148:
                                  if (!*(_BYTE *)(a1 + 52) || (objc_opt_respondsToSelector() & 1) == 0)
                                  {
LABEL_161:
                                    v13 = v158;
                                    goto LABEL_162;
                                  }
                                  if (nrCopyLogObj_onceToken_215 != -1)
                                    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                                  v140 = (id)nrCopyLogObj_sNRLogObj_217;
                                  v141 = v140;
                                  if (sNRCopyLogToStdErr)
                                  {

                                  }
                                  else
                                  {
                                    v142 = os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT);

                                    if (!v142)
                                    {
LABEL_158:
                                      v150 = *(_QWORD *)(a1 + 32);
                                      if (v150)
                                        v151 = *(_BYTE *)(v150 + 19) != 0;
                                      else
                                        v151 = 0;
                                      objc_msgSend(v158, "devicePluggedInStateDidChange:pluggedIn:", v150, v151);
                                      goto LABEL_161;
                                    }
                                  }
                                  if (nrCopyLogObj_onceToken_215 != -1)
                                    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                                  v143 = (id)nrCopyLogObj_sNRLogObj_217;
                                  objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
                                  v144 = (void *)objc_claimAutoreleasedReturnValue();
                                  _NRLogWithArgs((uint64_t)v143, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %spluggedIn", v145, v146, v147, v148, v149, (uint64_t)");

                                  goto LABEL_158;
                                }
                              }
                              if (nrCopyLogObj_onceToken_215 != -1)
                                dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                              v129 = (id)nrCopyLogObj_sNRLogObj_217;
                              objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
                              v130 = (void *)objc_claimAutoreleasedReturnValue();
                              v131 = *(_QWORD *)(a1 + 32);
                              if (v131)
                                v132 = *(unsigned int *)(v131 + 20);
                              else
                                v132 = 0;
                              StringFromThermalPressureLevel = (__CFString *)createStringFromThermalPressureLevel(v132);
                              _NRLogWithArgs((uint64_t)v129, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ has thermal pressure level %@", v133, v134, v135, v136, v137, (uint64_t)");

                              goto LABEL_145;
                            }
                          }
                          if (nrCopyLogObj_onceToken_215 != -1)
                            dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                          v114 = (id)nrCopyLogObj_sNRLogObj_217;
                          objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
                          v115 = (void *)objc_claimAutoreleasedReturnValue();
                          v116 = *(_QWORD **)(a1 + 32);
                          if (v116)
                            v116 = (_QWORD *)v116[5];
                          v155 = v116;
                          _NRLogWithArgs((uint64_t)v114, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ has proxy svc interface name %@", v117, v118, v119, v120, v121, (uint64_t)");

                          goto LABEL_130;
                        }
                        if (nrCopyLogObj_onceToken_215 != -1)
                          dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                        v101 = (id)nrCopyLogObj_sNRLogObj_217;
                        v102 = v101;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          v103 = os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT);

                          if (!v103)
                          {
LABEL_117:
                            objc_msgSend(v158, "deviceLinkTypeDidChange:linkType:linkSubtype:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "linkType"), objc_msgSend(*(id *)(a1 + 32), "linkSubtype"));
                            goto LABEL_118;
                          }
                        }
                        if (nrCopyLogObj_onceToken_215 != -1)
                          dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                        v104 = (id)nrCopyLogObj_sNRLogObj_217;
                        objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
                        v105 = (void *)objc_claimAutoreleasedReturnValue();
                        StringFromNRLinkType = (void *)createStringFromNRLinkType(objc_msgSend(*(id *)(a1 + 32), "linkType"));
                        StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype(objc_msgSend(*(id *)(a1 + 32), "linkSubtype"));
                        _NRLogWithArgs((uint64_t)v104, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ has link type %@ subtype %@", v106, v107, v108, v109, v110, (uint64_t)");

                        goto LABEL_117;
                      }
                      if (nrCopyLogObj_onceToken_215 != -1)
                        dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                      v92 = (id)nrCopyLogObj_sNRLogObj_217;
                      v93 = v92;
                      if (sNRCopyLogToStdErr)
                      {

                      }
                      else
                      {
                        v94 = os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT);

                        if (!v94)
                        {
LABEL_106:
                          objc_msgSend(v158, "deviceLinkTypeDidChange:linkType:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "linkType"));
                          goto LABEL_107;
                        }
                      }
                      if (nrCopyLogObj_onceToken_215 != -1)
                        dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                      v95 = (id)nrCopyLogObj_sNRLogObj_217;
                      objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
                      v152 = (void *)objc_claimAutoreleasedReturnValue();
                      v153 = (void *)createStringFromNRLinkType(objc_msgSend(*(id *)(a1 + 32), "linkType"));
                      _NRLogWithArgs((uint64_t)v95, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ has link type %@", v96, v97, v98, v99, v100, (uint64_t)");

                      goto LABEL_106;
                    }
                    if (nrCopyLogObj_onceToken_215 != -1)
                      dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                    v82 = (id)nrCopyLogObj_sNRLogObj_217;
                    v83 = v82;
                    if (sNRCopyLogToStdErr)
                    {

                    }
                    else
                    {
                      v84 = os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);

                      if (!v84)
                      {
LABEL_95:
                        objc_msgSend(v158, "deviceHasUnpairedBluetooth:", *(_QWORD *)(a1 + 32));
                        goto LABEL_96;
                      }
                    }
                    if (nrCopyLogObj_onceToken_215 != -1)
                      dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                    v85 = (id)nrCopyLogObj_sNRLogObj_217;
                    objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    _NRLogWithArgs((uint64_t)v85, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ %shasUnpairedBluetooth", v87, v88, v89, v90, v91, (uint64_t)");

                    goto LABEL_95;
                  }
                  if (nrCopyLogObj_onceToken_215 != -1)
                    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                  v72 = (id)nrCopyLogObj_sNRLogObj_217;
                  v73 = v72;
                  if (sNRCopyLogToStdErr)
                  {

                  }
                  else
                  {
                    v74 = os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);

                    if (!v74)
                    {
LABEL_84:
                      objc_msgSend(v158, "deviceIsClassCConnectedDidChange:isClassCConnected:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isClassCConnected"));
                      goto LABEL_85;
                    }
                  }
                  if (nrCopyLogObj_onceToken_215 != -1)
                    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                  v75 = (id)nrCopyLogObj_sNRLogObj_217;
                  objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  _NRLogWithArgs((uint64_t)v75, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %sclassCConnected", v77, v78, v79, v80, v81, (uint64_t)");

                  goto LABEL_84;
                }
                if (nrCopyLogObj_onceToken_215 != -1)
                  dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                v62 = (id)nrCopyLogObj_sNRLogObj_217;
                v63 = v62;
                if (sNRCopyLogToStdErr)
                {

                }
                else
                {
                  v64 = os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);

                  if (!v64)
                  {
LABEL_73:
                    objc_msgSend(v158, "deviceIsAsleepDidChange:isAsleep:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isAsleep"));
                    goto LABEL_74;
                  }
                }
                if (nrCopyLogObj_onceToken_215 != -1)
                  dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
                v65 = (id)nrCopyLogObj_sNRLogObj_217;
                objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 32), "isAsleep");
                _NRLogWithArgs((uint64_t)v65, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %s", v67, v68, v69, v70, v71, (uint64_t)");

                goto LABEL_73;
              }
              if (nrCopyLogObj_onceToken_215 != -1)
                dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
              v52 = (id)nrCopyLogObj_sNRLogObj_217;
              v53 = v52;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v54 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);

                if (!v54)
                {
LABEL_62:
                  objc_msgSend(v158, "deviceIsCloudConnectedDidChange:isCloudConnected:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isCloudConnected"));
                  goto LABEL_63;
                }
              }
              if (nrCopyLogObj_onceToken_215 != -1)
                dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
              v55 = (id)nrCopyLogObj_sNRLogObj_217;
              objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "isCloudConnected");
              _NRLogWithArgs((uint64_t)v55, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %scloudConnected", v57, v58, v59, v60, v61, (uint64_t)");

              goto LABEL_62;
            }
            if (nrCopyLogObj_onceToken_215 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
            v42 = (id)nrCopyLogObj_sNRLogObj_217;
            v43 = v42;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v44 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

              if (!v44)
              {
LABEL_51:
                objc_msgSend(v158, "deviceIsConnectedDidChange:isConnected:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isConnected"));
                goto LABEL_52;
              }
            }
            if (nrCopyLogObj_onceToken_215 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
            v45 = (id)nrCopyLogObj_sNRLogObj_217;
            objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "isConnected");
            _NRLogWithArgs((uint64_t)v45, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %sconnected", v47, v48, v49, v50, v51, (uint64_t)");

            goto LABEL_51;
          }
          if (nrCopyLogObj_onceToken_215 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
          v32 = (id)nrCopyLogObj_sNRLogObj_217;
          v33 = v32;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v34 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

            if (!v34)
            {
LABEL_40:
              objc_msgSend(v158, "deviceIsNearbyDidChange:isNearby:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isNearby"));
              goto LABEL_41;
            }
          }
          if (nrCopyLogObj_onceToken_215 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
          v35 = (id)nrCopyLogObj_sNRLogObj_217;
          objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "isNearby");
          _NRLogWithArgs((uint64_t)v35, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %snearby", v37, v38, v39, v40, v41, (uint64_t)");

          goto LABEL_40;
        }
        if (nrCopyLogObj_onceToken_215 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
        v22 = (id)nrCopyLogObj_sNRLogObj_217;
        v23 = v22;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v24 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

          if (!v24)
          {
LABEL_29:
            objc_msgSend(v158, "deviceIsEnabledDidChange:isEnabled:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isEnabled"));
            goto LABEL_30;
          }
        }
        if (nrCopyLogObj_onceToken_215 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
        v25 = (id)nrCopyLogObj_sNRLogObj_217;
        objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "isEnabled");
        _NRLogWithArgs((uint64_t)v25, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %sabled", v27, v28, v29, v30, v31, (uint64_t)");

        goto LABEL_29;
      }
      if (nrCopyLogObj_onceToken_215 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
      v11 = (id)nrCopyLogObj_sNRLogObj_217;
      v12 = v11;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v14 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

        if (!v14)
        {
LABEL_18:
          objc_msgSend(v158, "deviceIsRegisteredDidChange:isRegistered:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isRegistered"));
          goto LABEL_19;
        }
      }
      if (nrCopyLogObj_onceToken_215 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
      v15 = (id)nrCopyLogObj_sNRLogObj_217;
      objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "isRegistered");
      _NRLogWithArgs((uint64_t)v15, 0, (uint64_t)"%s%.30s:%-4d Informing client that %@ is %sregistered", v17, v18, v19, v20, v21, (uint64_t)");

      goto LABEL_18;
    }
  }
  if (nrCopyLogObj_onceToken_215 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_217, OS_LOG_TYPE_ERROR))
  {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_217, 16, (uint64_t)"%s%.30s:%-4d No delegate found", a4, a5, a6, a7, a8, (uint64_t)");
    v13 = 0;
  }
  else
  {
    v13 = 0;
  }
LABEL_162:

}

@end
