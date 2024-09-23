@implementation BLSDiagnostics

+ (id)defaultEndpoint
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_opt_self();
  v0 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLSDiagnosticsXPCServiceSpecification identifier](BLSDiagnosticsXPCServiceSpecification, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "endpointForMachName:service:instance:", v1, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D03458];
    +[BLSDiagnosticsXPCServiceSpecification identifier](BLSDiagnosticsXPCServiceSpecification, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nullEndpointForService:instance:", v7, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BLSDiagnostics)init
{
  void *v3;
  BLSDiagnostics *v4;

  +[BLSDiagnostics defaultEndpoint]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (BLSDiagnostics *)-[BLSDiagnostics initWithEndpoint:](self, v3);

  return v4;
}

- (id)initWithEndpoint:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    NSClassFromString(CFSTR("BSServiceConnectionEndpoint"));
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[BLSDiagnostics initWithEndpoint:].cold.1(sel_initWithEndpoint_);
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1B0C800D8);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[BLSDiagnostics initWithEndpoint:].cold.1(sel_initWithEndpoint_);
      objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1B0C8013CLL);
    }

    v25.receiver = a1;
    v25.super_class = (Class)BLSDiagnostics;
    v6 = objc_msgSendSuper2(&v25, sel_init);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)*((_QWORD *)v6 + 2);
      *((_QWORD *)v6 + 2) = v7;

      +[BLSDiagnosticsXPCServiceSpecification serviceQuality](BLSDiagnosticsXPCServiceSpecification, "serviceQuality");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D01760], "serial");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serviceClass:relativePriority:", objc_msgSend(v9, "serviceClass"), objc_msgSend(v9, "relativePriority"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = BSDispatchQueueCreate();
      v13 = (void *)*((_QWORD *)v6 + 1);
      *((_QWORD *)v6 + 1) = v12;

      v14 = (void *)*((_QWORD *)v6 + 2);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __35__BLSDiagnostics_initWithEndpoint___block_invoke;
      v22[3] = &unk_1E621A720;
      v15 = v9;
      v23 = v15;
      v16 = v6;
      v24 = v16;
      objc_msgSend(v14, "configureConnection:", v22);
      objc_msgSend(*((id *)v6 + 2), "activate");
      bls_diagnostics_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v19 = *((_QWORD *)v6 + 2);
        *(_DWORD *)buf = 134218498;
        v27 = v16;
        v28 = 2114;
        v29 = v19;
        v30 = 2114;
        v31 = v5;
        _os_log_debug_impl(&dword_1B0C75000, v17, OS_LOG_TYPE_DEBUG, "%p did activate connection:%{public}@ for endpoint:%{public}@", buf, 0x20u);
      }

    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __35__BLSDiagnostics_initWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setServiceQuality:", v3);
  objc_msgSend(v5, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  +[BLSDiagnosticsXPCServiceSpecification interface](BLSDiagnosticsXPCServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v4);

  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_2);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_19_0);

}

uint64_t __35__BLSDiagnostics_initWithEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activate");
}

- (void)invalidate
{
  -[BSServiceConnection invalidate](self->_connection, "invalidate");
}

- (id)allFlipbookFrames
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allFlipbookFrames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setSurfaceProvider:", self, (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)frameWithUUID:(id)a3
{
  return 0;
}

- (id)frameOnGlassNow
{
  void *v3;
  void *v4;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frameOnGlassNow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSurfaceProvider:", self);
  return v4;
}

- (id)frameOnGlassWhenFlipbookLastCancelled
{
  void *v3;
  void *v4;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frameOnGlassWhenFlipbookLastCancelled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSurfaceProvider:", self);
  return v4;
}

- (__IOSurface)surfaceForFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __IOSurface *v8;
  NSObject *v9;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  BLSDiagnostics *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  __IOSurface *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __34__BLSDiagnostics_surfaceForFrame___block_invoke;
  v13[3] = &unk_1E621A748;
  v13[4] = &v14;
  objc_msgSend(v5, "surfaceForFrameUUID:reply:", v6, v13);

  v7 = (void *)v15[5];
  if (v7)
    v8 = IOSurfaceLookupFromXPCObject(v7);
  else
    v8 = 0;
  bls_diagnostics_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "bls_shortLoggingString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15[5];
    *(_DWORD *)buf = 134218754;
    v21 = self;
    v22 = 2114;
    v23 = v11;
    v24 = 2114;
    v25 = v8;
    v26 = 2114;
    v27 = v12;
    _os_log_debug_impl(&dword_1B0C75000, v9, OS_LOG_TYPE_DEBUG, "%p surfaceForFrame:%{public}@ surface:%{public}@ surfaceXPC:%{public}@", buf, 0x2Au);

  }
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __34__BLSDiagnostics_surfaceForFrame___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (__IOSurface)rawSurfaceForFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __IOSurface *v8;
  NSObject *v9;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  BLSDiagnostics *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  __IOSurface *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__BLSDiagnostics_rawSurfaceForFrame___block_invoke;
  v13[3] = &unk_1E621A748;
  v13[4] = &v14;
  objc_msgSend(v5, "rawSurfaceForFrameUUID:reply:", v6, v13);

  v7 = (void *)v15[5];
  if (v7)
    v8 = IOSurfaceLookupFromXPCObject(v7);
  else
    v8 = 0;
  bls_diagnostics_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "bls_shortLoggingString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15[5];
    *(_DWORD *)buf = 134218754;
    v21 = self;
    v22 = 2114;
    v23 = v11;
    v24 = 2114;
    v25 = v8;
    v26 = 2114;
    v27 = v12;
    _os_log_debug_impl(&dword_1B0C75000, v9, OS_LOG_TYPE_DEBUG, "%p rawSurfaceForFrame:%{public}@ surface:%{public}@ surfaceXPC:%{public}@", buf, 0x2Au);

  }
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __37__BLSDiagnostics_rawSurfaceForFrame___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)initWithEndpoint:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1B0C75000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
