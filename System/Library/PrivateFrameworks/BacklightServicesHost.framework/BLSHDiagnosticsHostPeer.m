@implementation BLSHDiagnosticsHostPeer

- (BLSHDiagnosticsHostPeer)initWithFlipbookDiagnosticsProvider:(id)a3 peer:(id)a4
{
  id v7;
  id v8;
  BLSHDiagnosticsHostPeer *v9;
  BLSHDiagnosticsHostPeer *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BLSHDiagnosticsHostPeer;
  v9 = -[BLSHDiagnosticsHostPeer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_entitlements = 0;
    objc_msgSend(v8, "remoteProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "hasEntitlement:", CFSTR("com.apple.backlight.captureFrameOnGlass")))
      v10->_entitlements |= 1uLL;
    objc_storeStrong((id *)&v10->_flipbookDiagnosticsProvider, a3);
    v10->_valid = 1;
    objc_msgSend(v8, "remoteProcess");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_clientPid = objc_msgSend(v12, "pid");

  }
  return v10;
}

- (void)dealloc
{
  int v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 48);
  v3 = 134218240;
  v4 = a1;
  v5 = 1024;
  v6 = v2;
  _os_log_fault_impl(&dword_2145AC000, a2, OS_LOG_TYPE_FAULT, "%p must invalidate before deallocating service for pid:%d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt:withName:", self->_clientPid, CFSTR("clientPID"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isValid
{
  BLSHDiagnosticsHostPeer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_valid;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a1;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4(&dword_2145AC000, v1, v2, "%p invalidate %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (id)allFlipbookFrames
{
  void *v3;
  NSObject *v4;
  void *v5;

  if (-[BLSHDiagnosticsHostPeer isValid](self, "isValid"))
  {
    -[BLSFlipbookDiagnosticsProviding allFlipbookFrames](self->_flipbookDiagnosticsProvider, "allFlipbookFrames");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    bls_diagnostics_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[BLSHDiagnosticsHostPeer allFlipbookFrames].cold.1((uint64_t)self, v3, v4);
  }
  else
  {
    bls_diagnostics_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BLSHDiagnosticsHostPeer allFlipbookFrames].cold.2((uint64_t)self, v4);
    v3 = 0;
  }

  objc_msgSend(v3, "bs_mapNoNulls:", &__block_literal_global_8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __44__BLSHDiagnosticsHostPeer_allFlipbookFrames__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_shortLoggingString");
}

uint64_t __44__BLSHDiagnosticsHostPeer_allFlipbookFrames__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BE0B8B8], "createWithFrame:", a2);
}

- (id)frameOnGlassNow
{
  void *v3;
  os_unfair_lock_s *p_lock;
  BLSDiagnosticFlipbookFrame *v5;
  BLSDiagnosticFlipbookFrame *lock_cachedFrameOnGlassNow;
  BLSDiagnosticFlipbookFrame *v7;
  void *v8;

  -[BLSFlipbookDiagnosticsProviding frameOnGlassNow](self->_flipbookDiagnosticsProvider, "frameOnGlassNow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHDiagnosticsHostPeer _lock_validateHostFrame:source:](self, "_lock_validateHostFrame:source:", v3, CFSTR("frameOnGlassNow"));
  v5 = (BLSDiagnosticFlipbookFrame *)objc_claimAutoreleasedReturnValue();

  lock_cachedFrameOnGlassNow = self->_lock_cachedFrameOnGlassNow;
  self->_lock_cachedFrameOnGlassNow = v5;
  v7 = v5;

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x24BE0B8B8], "createWithFrame:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)frameOnGlassWhenFlipbookLastCancelled
{
  void *v3;
  os_unfair_lock_s *p_lock;
  BLSDiagnosticFlipbookFrame *v5;
  BLSDiagnosticFlipbookFrame *lock_cachedLastCancelledFrame;
  BLSDiagnosticFlipbookFrame *v7;
  void *v8;

  -[BLSFlipbookDiagnosticsProviding frameOnGlassWhenFlipbookLastCancelled](self->_flipbookDiagnosticsProvider, "frameOnGlassWhenFlipbookLastCancelled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHDiagnosticsHostPeer _lock_validateHostFrame:source:](self, "_lock_validateHostFrame:source:", v3, CFSTR("frameOnGlassWhenFlipbookLastCancelled"));
  v5 = (BLSDiagnosticFlipbookFrame *)objc_claimAutoreleasedReturnValue();

  lock_cachedLastCancelledFrame = self->_lock_cachedLastCancelledFrame;
  self->_lock_cachedLastCancelledFrame = v5;
  v7 = v5;

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x24BE0B8B8], "createWithFrame:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_lock_validateHostFrame:(id)a3 source:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  BLSHDiagnosticsHostPeer *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!self->_valid)
  {
    bls_diagnostics_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BLSHDiagnosticsHostPeer _lock_validateHostFrame:source:].cold.1((uint64_t)self, (uint64_t)v8, v12);
    goto LABEL_11;
  }
  v9 = v7;
  if (!v9)
  {
    bls_diagnostics_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v19 = self;
      v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_2145AC000, v12, OS_LOG_TYPE_INFO, "%p %{public}@ — no host frame", buf, 0x16u);
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v10 = v9;
  objc_msgSend(v9, "uuid");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("uuid != nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHDiagnosticsHostPeer _lock_validateHostFrame:source:].cold.2(a2, (uint64_t)self, (uint64_t)v17);
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145BDB74);
  }
  v12 = v11;
  bls_diagnostics_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    -[NSObject UUIDString](v12, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bls_shortLoggingString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v19 = self;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v15;
    v24 = 2114;
    v25 = v16;
    _os_log_debug_impl(&dword_2145AC000, v13, OS_LOG_TYPE_DEBUG, "%p %{public}@ uuid:%{public}@ frame:%{public}@", buf, 0x2Au);

  }
LABEL_12:

  return v10;
}

- (void)surfaceForFrameUUID:(id)a3 reply:(id)a4
{
  -[BLSHDiagnosticsHostPeer genericSurfaceForFrameUUID:reply:name:surfaceFromFrame:](self, "genericSurfaceForFrameUUID:reply:name:surfaceFromFrame:", a3, a4, CFSTR("surfaceForFrameUUID"), &__block_literal_global_24);
}

uint64_t __53__BLSHDiagnosticsHostPeer_surfaceForFrameUUID_reply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "surface");
}

- (void)rawSurfaceForFrameUUID:(id)a3 reply:(id)a4
{
  -[BLSHDiagnosticsHostPeer genericSurfaceForFrameUUID:reply:name:surfaceFromFrame:](self, "genericSurfaceForFrameUUID:reply:name:surfaceFromFrame:", a3, a4, CFSTR("rawSurfaceForFrameUUID"), &__block_literal_global_27);
}

uint64_t __56__BLSHDiagnosticsHostPeer_rawSurfaceForFrameUUID_reply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rawSurface");
}

- (void)genericSurfaceForFrameUUID:(id)a3 reply:(id)a4 name:(id)a5 surfaceFromFrame:(id)a6
{
  id v10;
  id v11;
  uint64_t (**v12)(id, void *);
  void (**v13)(id, xpc_object_t, void *);
  void *v14;
  __IOSurface *v15;
  __IOSurface *v16;
  xpc_object_t XPCObject;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  __IOSurface *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __IOSurface *v41;
  void *v42;
  __IOSurface *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint8_t buf[4];
  BLSHDiagnosticsHostPeer *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  __IOSurface *v61;
  __int16 v62;
  xpc_object_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = (uint64_t (**)(id, void *))a6;
  v13 = (void (**)(id, xpc_object_t, void *))a4;
  if (!-[BLSHDiagnosticsHostPeer isValid](self, "isValid"))
  {
    bls_diagnostics_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "UUIDString");
      v41 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v57 = self;
      v58 = 2114;
      v59 = v11;
      v60 = 2114;
      v61 = v41;
      _os_log_error_impl(&dword_2145AC000, v20, OS_LOG_TYPE_ERROR, "%p %{public}@, use after invalidation uuid:%{public}@", buf, 0x20u);

    }
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BE0B778];
    v48 = *MEMORY[0x24BDD0FC8];
    v23 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: use after invalidation uuid:%@"), v11, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 5, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  -[BLSHDiagnosticsHostPeer hostFrameForUUID:](self, "hostFrameForUUID:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    bls_diagnostics_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "UUIDString");
      v43 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v57 = self;
      v58 = 2114;
      v59 = v11;
      v60 = 2114;
      v61 = v43;
      _os_log_error_impl(&dword_2145AC000, v26, OS_LOG_TYPE_ERROR, "%p %{public}@ invalid (not found) frame uuid, not match any known frame(s) uuid:%{public}@", buf, 0x20u);

    }
    v27 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BE0B778];
    v50 = *MEMORY[0x24BDD0FC8];
    v29 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: unknown UUID, does not match any known frame(s) uuid:%@"), v11, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 31, v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v15 = (__IOSurface *)v12[2](v12, v14);
  if (!v15)
  {
    bls_diagnostics_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "UUIDString");
      v32 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bls_loggingString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v57 = self;
      v58 = 2114;
      v59 = v11;
      v60 = 2114;
      v61 = v32;
      v62 = 2114;
      v63 = v33;
      _os_log_impl(&dword_2145AC000, v31, OS_LOG_TYPE_INFO, "%p %{public}@ nil surface for frame with uuid:%{public}@ frame:%{public}@", buf, 0x2Au);

    }
    v45 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BE0B778];
    v52 = *MEMORY[0x24BDD0FC8];
    v35 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bls_loggingString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("%@: no saved surface (either never exited flipbook or has already been purged) uuid:%@ frame:%@"), v11, v24, v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v45;
    v38 = v34;
    v39 = 30;
    goto LABEL_18;
  }
  v16 = v15;
  XPCObject = IOSurfaceCreateXPCObject(v15);
  bls_diagnostics_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "UUIDString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bls_loggingString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v57 = self;
    v58 = 2114;
    v59 = v11;
    v60 = 2114;
    v61 = v16;
    v62 = 2114;
    v63 = XPCObject;
    v64 = 2114;
    v65 = v47;
    v66 = 2114;
    v67 = v42;
    _os_log_debug_impl(&dword_2145AC000, v18, OS_LOG_TYPE_DEBUG, "%p %{public}@ surface:%{public}@ surfaceXPC:%{public}@ uuid:%{public}@ frame:%{public}@", buf, 0x3Eu);

  }
  if (!XPCObject)
  {
    v46 = (void *)MEMORY[0x24BDD1540];
    v44 = *MEMORY[0x24BE0B778];
    v54 = *MEMORY[0x24BDD0FC8];
    v40 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bls_loggingString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringWithFormat:", CFSTR("%@: failed to create xpc object for uuid:%@ surface:%@ frame:%@"), v11, v24, v16, v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v44;
    v37 = v46;
    v39 = 1;
LABEL_18:
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, v39, v36);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
LABEL_20:

    XPCObject = 0;
    goto LABEL_21;
  }
  v19 = 0;
LABEL_21:

  v13[2](v13, XPCObject, v19);
}

- (id)hostFrameForUUID:(id)a3
{
  id v4;
  BLSDiagnosticFlipbookFrame **p_lock_cachedFrameOnGlassNow;
  void *v6;
  char v7;
  void *v8;
  char v9;
  BLSDiagnosticFlipbookFrame *v10;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  p_lock_cachedFrameOnGlassNow = &self->_lock_cachedFrameOnGlassNow;
  -[BLSDiagnosticFlipbookFrame uuid](self->_lock_cachedFrameOnGlassNow, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    p_lock_cachedFrameOnGlassNow = &self->_lock_cachedLastCancelledFrame;
    -[BLSDiagnosticFlipbookFrame uuid](self->_lock_cachedLastCancelledFrame, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      os_unfair_lock_unlock(&self->_lock);
LABEL_6:
      -[BLSFlipbookDiagnosticsProviding frameWithUUID:](self->_flipbookDiagnosticsProvider, "frameWithUUID:", v4);
      v10 = (BLSDiagnosticFlipbookFrame *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v10 = *p_lock_cachedFrameOnGlassNow;
  os_unfair_lock_unlock(&self->_lock);
  if (!v10)
    goto LABEL_6;
LABEL_7:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_cachedLastCancelledFrame, 0);
  objc_storeStrong((id *)&self->_lock_cachedFrameOnGlassNow, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_flipbookDiagnosticsProvider, 0);
}

- (void)allFlipbookFrames
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_2145AC000, a2, OS_LOG_TYPE_ERROR, "%p allFlipbookFrames, use after invalidation", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_lock_validateHostFrame:(os_log_t)log source:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_2145AC000, log, OS_LOG_TYPE_ERROR, "%p %{public}@, use after invalidation", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_lock_validateHostFrame:(uint64_t)a3 source:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  __int16 v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138544642;
  v10 = v5;
  OUTLINED_FUNCTION_1_2();
  v11 = 2048;
  v12 = a2;
  v13 = v8;
  v14 = CFSTR("BLSHDiagnosticsHostPeer.m");
  v15 = 1024;
  v16 = 133;
  v17 = v8;
  v18 = a3;
  _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

}

@end
