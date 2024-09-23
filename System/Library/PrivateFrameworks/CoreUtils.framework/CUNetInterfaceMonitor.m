@implementation CUNetInterfaceMonitor

- (CUNetInterfaceMonitor)init
{
  CUNetInterfaceMonitor *v2;
  CUNetInterfaceMonitor *v3;
  CUNetInterfaceMonitor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUNetInterfaceMonitor;
  v2 = -[CUNetInterfaceMonitor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUNetInterfaceMonitor;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUNetInterfaceMonitor;
  -[CUNetInterfaceMonitor dealloc](&v4, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return NSPrintF((uint64_t)"CUNetInterfaceMonitor", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  v7 = qword_1EE066108;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CUNetInterfaceMonitor_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CUNetInterfaceMonitor_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  uint64_t v8;

  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_6;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v8);
    }
LABEL_6:
    self->_invalidateCalled = 1;
    -[CUNetInterfaceMonitor _ensureStopped](self, "_ensureStopped");
    -[CUNetInterfaceMonitor _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id flagsChangedHandler;
  id interfacesChangedHandler;
  id v6;
  id primaryIPChangedHandler;
  id primaryNetworkChangedHandler;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  LogCategory *ucat;
  uint64_t v14;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    flagsChangedHandler = self->_flagsChangedHandler;
    self->_flagsChangedHandler = 0;

    interfacesChangedHandler = self->_interfacesChangedHandler;
    self->_interfacesChangedHandler = 0;

    v6 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    primaryIPChangedHandler = self->_primaryIPChangedHandler;
    self->_primaryIPChangedHandler = 0;

    primaryNetworkChangedHandler = self->_primaryNetworkChangedHandler;
    self->_primaryNetworkChangedHandler = 0;

    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_9;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_9;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v9, v10, v11, v12, v14);
LABEL_9:
    self->_invalidateDone = 1;
  }
}

- (void)_ensureStartedSC
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  LogCategory *ucat;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  SCDynamicStoreRef v18;
  CFMutableArrayRef Mutable;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __CFArray *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  CFStringRef NetworkInterfaceEntity;
  CFStringRef v29;
  const __CFString *v30;
  CFStringRef v31;
  CFStringRef v32;
  CFStringRef NetworkGlobalEntity;
  CFStringRef v34;
  CFStringRef v35;
  CFStringRef v36;
  uint64_t v37;
  uint64_t v38;
  LogCategory *v39;
  uint64_t v40;
  const char *v41;
  SCDynamicStoreContext context;

  if (!self->_scStore)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_6;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
LABEL_6:
        context.version = 0;
        context.info = self;
        context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E0C98BD0];
        context.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
        context.copyDescription = 0;
        if (self->_label)
        {
          NSPrintF((uint64_t)"CUNetInterfaceMonitor-%@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_label);
        }
        else
        {
          v41 = getprogname();
          NSPrintF((uint64_t)"CUNetInterfaceMonitor-%s", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v41);
        }
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v18 = SCDynamicStoreCreate(0, v17, (SCDynamicStoreCallBack)_networkInterfacesChanged, &context);
        if (!v18)
        {
          if (!SCError())
          {
            v37 = 4294960596;
            goto LABEL_33;
          }
          v37 = SCError();
          if ((_DWORD)v37)
            goto LABEL_33;
        }
        Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        if (!Mutable)
        {
          v37 = 4294960568;
          if (!v18)
          {
LABEL_30:
            if (!(_DWORD)v37)
              goto LABEL_38;
LABEL_33:
            v39 = self->_ucat;
            if (v39->var0 <= 90)
            {
              if (v39->var0 == -1)
              {
                if (!_LogCategory_Initialize((uint64_t)v39, 0x5Au))
                  goto LABEL_37;
                v39 = self->_ucat;
              }
              LogPrintF((uint64_t)v39, (uint64_t)"-[CUNetInterfaceMonitor _ensureStartedSC]", 0x5Au, (uint64_t)"### Monitoring start failed: %#m\n", v20, v21, v22, v23, v37);
            }
LABEL_37:
            -[CUNetInterfaceMonitor _ensureStopped](self, "_ensureStopped");
LABEL_38:

            return;
          }
LABEL_29:
          CFRelease(v18);
          goto LABEL_30;
        }
        v24 = Mutable;
        v25 = (const __CFString *)*MEMORY[0x1E0CE8B30];
        v26 = (const __CFString *)*MEMORY[0x1E0CE8B20];
        v27 = (const __CFString *)*MEMORY[0x1E0CE8B78];
        NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B20], (CFStringRef)*MEMORY[0x1E0CE8B78]);
        if (!NetworkInterfaceEntity)
          goto LABEL_40;
        v29 = NetworkInterfaceEntity;
        CFArrayAppendValue(v24, NetworkInterfaceEntity);
        CFRelease(v29);
        v30 = (const __CFString *)*MEMORY[0x1E0CE8B80];
        v31 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, v25, v26, (CFStringRef)*MEMORY[0x1E0CE8B80]);
        if (!v31)
          goto LABEL_40;
        v32 = v31;
        CFArrayAppendValue(v24, v31);
        CFRelease(v32);
        NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, v25, v27);
        if (!NetworkGlobalEntity
          || (v34 = NetworkGlobalEntity,
              CFArrayAppendValue(v24, NetworkGlobalEntity),
              CFRelease(v34),
              (v35 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, v25, v30)) == 0))
        {
LABEL_40:
          v37 = 4294960568;
LABEL_28:
          CFRelease(v24);
          if (!v18)
            goto LABEL_30;
          goto LABEL_29;
        }
        v36 = v35;
        CFArrayAppendValue(v24, v35);
        CFRelease(v36);
        if (!SCDynamicStoreSetNotificationKeys(v18, 0, v24))
        {
          if (!SCError())
          {
LABEL_27:
            v37 = 4294960596;
            goto LABEL_28;
          }
          v38 = SCError();
          if ((_DWORD)v38)
          {
LABEL_26:
            v37 = v38;
            goto LABEL_28;
          }
        }
        if (SCDynamicStoreSetDispatchQueue(v18, (dispatch_queue_t)self->_dispatchQueue))
        {
LABEL_17:
          self->_scStore = v18;
          -[CUNetInterfaceMonitor _networkInterfacesChanged:](self, "_networkInterfacesChanged:", 1);
          -[CUNetInterfaceMonitor _primaryIPChanged:](self, "_primaryIPChanged:", 1);
          v18 = 0;
          v37 = 0;
          goto LABEL_28;
        }
        if (SCError())
        {
          v38 = SCError();
          if (!(_DWORD)v38)
            goto LABEL_17;
          goto LABEL_26;
        }
        goto LABEL_27;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _ensureStartedSC]", 0x1Eu, (uint64_t)"Monitoring start SC", v4, v5, v6, v7, v40);
    goto LABEL_6;
  }
}

- (void)_ensureStartedNW
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  LogCategory *ucat;
  NSObject *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  OS_nw_path_evaluator *evaluator_for_endpoint;
  OS_nw_path_evaluator *nwPathEvaluator;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  if (self->_nwPathEvaluator)
    v6 = 1;
  else
    v6 = MEMORY[0x1E0CCF938] == 0;
  if (v6)
    return;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_9;
      ucat = self->_ucat;
    }
    LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _ensureStartedNW]", 0x1Eu, (uint64_t)"Monitoring start NW", v2, v3, v4, v5, v14);
  }
LABEL_9:
  v9 = nw_parameters_create();
  v10 = xpc_array_create(0, 0);
  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "NetworkExtension");
  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "NetworkExtension");
  v11 = xpc_array_create(0, 0);
  xpc_array_set_string(v11, 0xFFFFFFFFFFFFFFFFLL, "VPN");
  xpc_array_set_string(v11, 0xFFFFFFFFFFFFFFFFLL, "AppVPN");
  nw_parameters_set_avoided_netagent_classes();
  nw_parameters_prohibit_interface_type(v9, nw_interface_type_other);
  evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
  nwPathEvaluator = self->_nwPathEvaluator;
  self->_nwPathEvaluator = evaluator_for_endpoint;

  if (self->_nwPathEvaluator)
  {
    objc_initWeak(&location, self);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __41__CUNetInterfaceMonitor__ensureStartedNW__block_invoke;
    v17 = &unk_1E25DCF58;
    objc_copyWeak(&v18, &location);
    nw_path_evaluator_set_update_handler();
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  -[CUNetInterfaceMonitor _primaryIPChangedNW:](self, "_primaryIPChangedNW:", 1, v14, v15, v16, v17);

}

- (void)_ensureStopped
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  LogCategory *v8;
  OS_nw_path_evaluator *nwPathEvaluator;
  uint64_t v10;

  if (self->_scStore)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_6;
        ucat = self->_ucat;
      }
      LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _ensureStopped]", 0x1Eu, (uint64_t)"Monitoring stop SC", v2, v3, v4, v5, v10);
    }
LABEL_6:
    SCDynamicStoreSetDispatchQueue(self->_scStore, 0);
    CFRelease(self->_scStore);
    self->_scStore = 0;
  }
  if (self->_nwPathEvaluator)
  {
    v8 = self->_ucat;
    if (v8->var0 <= 30)
    {
      if (v8->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v8, 0x1Eu))
          goto LABEL_13;
        v8 = self->_ucat;
      }
      LogPrintF_safe((uint64_t)v8, (uint64_t)"-[CUNetInterfaceMonitor _ensureStopped]", 0x1Eu, (uint64_t)"Monitoring stop NW", v2, v3, v4, v5, v10);
    }
LABEL_13:
    nw_path_evaluator_cancel();
    nwPathEvaluator = self->_nwPathEvaluator;
    self->_nwPathEvaluator = 0;

  }
}

- (void)_networkInterfacesChanged:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  LogCategory *v18;
  LogCategory *ucat;
  void (**v20)(_QWORD);
  id v21;
  ifaddrs *v22;
  unsigned int v23;
  unsigned int ifa_flags;
  uint64_t ifa_addr;
  int v26;
  char *ifa_name;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  LogCategory *v33;
  CUNetInterfaceInfo *v34;
  void *v35;
  void *v36;
  NSArray *v37;
  NSArray *interfaces;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t flags;
  LogCategory *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  int v50;
  _QWORD v51[5];
  ifaddrs *v52;
  _QWORD aBlock[4];
  int v54;
  char v55[128];
  uint64_t v56;

  v3 = a3;
  v56 = *MEMORY[0x1E0C80C00];
  v5 = socket(2, 2, 0);
  if (v5 < 0)
  {
    if (*__error())
    {
      v17 = *__error();
      if (!(_DWORD)v17)
        goto LABEL_2;
    }
    else
    {
      v17 = 4294960596;
    }
    ucat = self->_ucat;
    if (ucat->var0 > 90)
      return;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
        return;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _networkInterfacesChanged:]", 0x5Au, (uint64_t)"### Open socket failed: %#m\n", v13, v14, v15, v16, v17);
    return;
  }
LABEL_2:
  v49 = v3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CUNetInterfaceMonitor__networkInterfacesChanged___block_invoke;
  aBlock[3] = &__block_descriptor_36_e5_v8__0l;
  v54 = v5;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  v52 = 0;
  if (!getifaddrs(&v52))
  {
    v12 = 0;
LABEL_10:
    if (v52)
      goto LABEL_21;
    goto LABEL_13;
  }
  if (!*__error())
  {
    v12 = 4294960596;
    goto LABEL_13;
  }
  v12 = *__error();
  if (!(_DWORD)v12)
    goto LABEL_10;
LABEL_13:
  v18 = self->_ucat;
  if (v18->var0 > 90)
    goto LABEL_21;
  if (v18->var0 != -1)
    goto LABEL_15;
  if (_LogCategory_Initialize((uint64_t)v18, 0x5Au))
  {
    v18 = self->_ucat;
LABEL_15:
    LogPrintF((uint64_t)v18, (uint64_t)"-[CUNetInterfaceMonitor _networkInterfacesChanged:]", 0x5Au, (uint64_t)"### Get interface list failed: %#m\n", v8, v9, v10, v11, v12);
  }
LABEL_21:
  v51[0] = v6;
  v51[1] = 3221225472;
  v51[2] = __51__CUNetInterfaceMonitor__networkInterfacesChanged___block_invoke_2;
  v51[3] = &__block_descriptor_40_e5_v8__0l;
  v51[4] = v52;
  v20 = (void (**)(_QWORD))_Block_copy(v51);
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = v52;
  if (v52)
  {
    v23 = 0;
    while (1)
    {
      ifa_flags = v22->ifa_flags;
      if ((ifa_flags & 1) != 0 && ((ifa_flags & 8) == 0 || (self->_controlFlags & 2) != 0))
      {
        ifa_addr = (uint64_t)v22->ifa_addr;
        if (ifa_addr)
        {
          v26 = *(unsigned __int8 *)(ifa_addr + 1);
          if (v26 == 30 || v26 == 2)
          {
            ifa_name = v22->ifa_name;
            if (ifa_name)
              break;
          }
        }
      }
LABEL_44:
      v22 = v22->ifa_next;
      if (!v22)
        goto LABEL_47;
    }
    v50 = 0;
    SocketGetInterfaceInfo(v5, ifa_name, 0, 0, 0, 0, 0, 0, 0, (uint64_t)&v50);
    v33 = self->_ucat;
    if (v33->var0 <= 9)
    {
      if (v33->var0 != -1)
      {
LABEL_37:
        LogPrintF((uint64_t)v33, (uint64_t)"-[CUNetInterfaceMonitor _networkInterfacesChanged:]", 9u, (uint64_t)"Network interface: Nm '%s', Type %s\n", v29, v30, v31, v32, (uint64_t)ifa_name);
        goto LABEL_38;
      }
      if (_LogCategory_Initialize((uint64_t)v33, 9u))
      {
        v33 = self->_ucat;
        goto LABEL_37;
      }
    }
LABEL_38:
    if ((v50 & 8) != 0)
      v23 = 1;
    v34 = objc_alloc_init(CUNetInterfaceInfo);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ifa_name);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUNetInterfaceInfo setInterfaceName:](v34, "setInterfaceName:", v35);
    if (*(_BYTE *)(ifa_addr + 1) == 2)
    {
      v55[0] = 0;
      SockAddrToString(ifa_addr, 1, v55);
      if (v55[0])
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v55);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUNetInterfaceInfo setIpv4String:](v34, "setIpv4String:", v36);

      }
    }
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v34, v35);

    goto LABEL_44;
  }
  v23 = 0;
LABEL_47:
  objc_msgSend(v21, "allValues");
  v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
  interfaces = self->_interfaces;
  self->_interfaces = v37;

  v39 = _Block_copy(self->_interfacesChangedHandler);
  v40 = v39;
  if (v39)
    (*((void (**)(void *))v39 + 2))(v39);

  flags = self->_flags;
  if (v23 == (_DWORD)flags)
    goto LABEL_61;
  if (!v49)
  {
    v46 = self->_ucat;
    if (v46->var0 <= 30)
    {
      if (v46->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v46, 0x1Eu))
          goto LABEL_58;
        v46 = self->_ucat;
        flags = self->_flags;
      }
      LogPrintF((uint64_t)v46, (uint64_t)"-[CUNetInterfaceMonitor _networkInterfacesChanged:]", 0x1Eu, (uint64_t)"Network interface flags changed: %#{flags} -> %#{flags}\n", v41, v42, v43, v44, flags);
    }
LABEL_58:
    self->_flags = v23;
    v47 = _Block_copy(self->_flagsChangedHandler);
    v48 = v47;
    if (v47)
      (*((void (**)(void *))v47 + 2))(v47);

    goto LABEL_61;
  }
  self->_flags = v23;
LABEL_61:

  v20[2](v20);
  v7[2](v7);

}

- (void)_primaryIPChanged:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __SCDynamicStore *scStore;
  uint64_t PrimaryIPAddress;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  LogCategory *v16;
  LogCategory *ucat;
  $44BD70775D1F109969B0EA4A2EBA0B0B *p_primaryIPv4Addr;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  LogCategory *v24;
  $44BD70775D1F109969B0EA4A2EBA0B0B *p_primaryIPv6Addr;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  LogCategory *v30;
  void *v31;
  void *v32;
  void *active;
  void *v34;
  NSString *primaryNetworkSignature;
  NSString *v36;
  NSString *v37;
  NSString *v38;
  char v39;
  NSString *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  LogCategory *v45;
  NSString *v46;
  _OWORD v47[2];
  _OWORD v48[2];
  uint64_t v49;

  scStore = self->_scStore;
  if (!scStore)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 90)
      return;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
        return;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChanged:]", 0x5Au, (uint64_t)"### PrimaryIP changed with no SCStore\n", v3, v4, v5, v6, v49);
    return;
  }
  memset(v48, 0, 28);
  memset(v47, 0, 28);
  PrimaryIPAddress = GetPrimaryIPAddressEx(scStore, (uint64_t)v48, (uint64_t)v47);
  if (!(_DWORD)PrimaryIPAddress)
  {
    p_primaryIPv4Addr = &self->_primaryIPv4Addr;
    if (!SockAddrCompareAddrEx(v48, (uint64_t)&self->_primaryIPv4Addr, 1))
      goto LABEL_21;
    if (BYTE1(v48[0]))
    {
      if (BYTE1(v48[0]) == 30)
      {
        p_primaryIPv4Addr->sa = (sockaddr)v48[0];
        *(in6_addr *)((char *)&self->_primaryIPv4Addr.v6.sin6_addr + 4) = *(in6_addr *)((char *)v48 + 12);
        if (!a3)
          goto LABEL_23;
        goto LABEL_21;
      }
      if (BYTE1(v48[0]) == 2)
      {
        p_primaryIPv4Addr->sa = (sockaddr)v48[0];
        if (!a3)
        {
LABEL_23:
          v24 = self->_ucat;
          if (v24->var0 <= 30)
          {
            if (v24->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v24, 0x1Eu))
                goto LABEL_27;
              v24 = self->_ucat;
            }
            LogPrintF((uint64_t)v24, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChanged:]", 0x1Eu, (uint64_t)"PrimaryIPv4 changed: %##a\n", v19, v20, v21, v22, (uint64_t)v48);
          }
LABEL_27:
          v23 = 1;
LABEL_28:
          p_primaryIPv6Addr = &self->_primaryIPv6Addr;
          if (!SockAddrCompareAddrEx(v47, (uint64_t)&self->_primaryIPv6Addr, 1))
            goto LABEL_36;
          if (BYTE1(v47[0]))
          {
            if (BYTE1(v47[0]) == 30)
            {
              p_primaryIPv6Addr->sa = (sockaddr)v47[0];
              *(in6_addr *)((char *)&self->_primaryIPv6Addr.v6.sin6_addr + 4) = *(in6_addr *)((char *)v47 + 12);
              if (!a3)
                goto LABEL_39;
              goto LABEL_36;
            }
            if (BYTE1(v47[0]) == 2)
            {
              p_primaryIPv6Addr->sa = (sockaddr)v47[0];
              if (!a3)
              {
LABEL_39:
                v30 = self->_ucat;
                if (v30->var0 <= 30)
                {
                  if (v30->var0 == -1)
                  {
                    if (!_LogCategory_Initialize((uint64_t)v30, 0x1Eu))
                      goto LABEL_43;
                    v30 = self->_ucat;
                  }
                  LogPrintF((uint64_t)v30, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChanged:]", 0x1Eu, (uint64_t)"PrimaryIPv6 changed: %##a\n", v26, v27, v28, v29, (uint64_t)v47);
                }
LABEL_43:
                v31 = _Block_copy(self->_primaryIPChangedHandler);
                v32 = v31;
                if (v31)
                  (*((void (**)(void *))v31 + 2))(v31);

LABEL_46:
                if (!self->_primaryNetworkChangedHandler)
                  return;
                active = (void *)SCNetworkSignatureCopyActiveIdentifiers();
                objc_msgSend(active, "firstObject");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                primaryNetworkSignature = self->_primaryNetworkSignature;
                v36 = v34;
                v37 = primaryNetworkSignature;
                if (v36 == v37)
                {

                  v40 = v36;
LABEL_60:

                  goto LABEL_61;
                }
                v38 = v37;
                if ((v36 == 0) != (v37 != 0))
                {
                  v39 = -[NSString isEqual:](v36, "isEqual:", v37);

                  if ((v39 & 1) != 0)
                    goto LABEL_61;
                }
                else
                {

                }
                objc_storeStrong((id *)&self->_primaryNetworkSignature, v34);
                if (a3)
                {
LABEL_61:

                  return;
                }
                v45 = self->_ucat;
                if (v45->var0 <= 30)
                {
                  if (v45->var0 != -1)
                  {
LABEL_56:
                    LogPrintF((uint64_t)v45, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChanged:]", 0x1Eu, (uint64_t)"PrimaryNetwork changed: %@\n", v41, v42, v43, v44, (uint64_t)v36);
                    goto LABEL_58;
                  }
                  if (_LogCategory_Initialize((uint64_t)v45, 0x1Eu))
                  {
                    v45 = self->_ucat;
                    goto LABEL_56;
                  }
                }
LABEL_58:
                v46 = (NSString *)_Block_copy(self->_primaryNetworkChangedHandler);
                v40 = v46;
                if (v46)
                  ((void (*)(NSString *))v46[2])(v46);
                goto LABEL_60;
              }
LABEL_36:
              if (!v23)
                goto LABEL_46;
              goto LABEL_43;
            }
          }
          else
          {
            self->_primaryIPv6Addr.sa.sa_family = 0;
          }
          if (!a3)
            goto LABEL_39;
          goto LABEL_36;
        }
LABEL_21:
        v23 = 0;
        goto LABEL_28;
      }
    }
    else
    {
      self->_primaryIPv4Addr.sa.sa_family = 0;
    }
    if (!a3)
      goto LABEL_23;
    goto LABEL_21;
  }
  v15 = PrimaryIPAddress;
  v16 = self->_ucat;
  if (v16->var0 <= 90)
  {
    if (v16->var0 != -1)
    {
LABEL_5:
      LogPrintF((uint64_t)v16, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChanged:]", 0x5Au, (uint64_t)"### GetPrimaryIP failed: %#m\n", v11, v12, v13, v14, v15);
      return;
    }
    if (_LogCategory_Initialize((uint64_t)v16, 0x5Au))
    {
      v16 = self->_ucat;
      goto LABEL_5;
    }
  }
}

- (void)_primaryIPChangedNW:(BOOL)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *name;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  LogCategory *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  LogCategory *ucat;
  LogCategory *v41;
  LogCategory *v42;
  LogCategory *v43;
  $44BD70775D1F109969B0EA4A2EBA0B0B *p_primaryIPv4Addr;
  $44BD70775D1F109969B0EA4A2EBA0B0B *p_primaryIPv6Addr;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  signed int v54;
  LogCategory *v55;
  const char *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (**primaryIPChangedHandler)(void);
  uint64_t v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  _OWORD v75[2];
  sockaddr v76[2];

  v4 = nw_path_evaluator_copy_path();
  if (!v4)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
          goto LABEL_25;
        ucat = self->_ucat;
      }
      LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChangedNW:]", 0x5Au, (uint64_t)"### No NW path", v5, v6, v7, v8, v71);
    }
LABEL_25:
    v19 = 0;
    v9 = 0;
    goto LABEL_26;
  }
  v9 = v4;
  if (nw_path_get_status(v4) != nw_path_status_satisfied)
  {
    v41 = self->_ucat;
    if (v41->var0 <= 30)
    {
      if (v41->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v41, 0x1Eu))
          goto LABEL_24;
        v41 = self->_ucat;
      }
      LogPrintF_safe((uint64_t)v41, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChangedNW:]", 0x1Eu, (uint64_t)"Path not satisfied", v10, v11, v12, v13, v71);
    }
LABEL_24:

    goto LABEL_25;
  }
  v14 = nw_path_copy_interface();
  if (!v14)
  {
    v42 = self->_ucat;
    if (v42->var0 <= 90)
    {
      if (v42->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v42, 0x5Au))
          goto LABEL_58;
        v42 = self->_ucat;
      }
      LogPrintF_safe((uint64_t)v42, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChangedNW:]", 0x5Au, (uint64_t)"### No primary interface", v15, v16, v17, v18, v71);
    }
LABEL_58:
    v19 = 0;
    goto LABEL_26;
  }
  v19 = v14;
  name = nw_interface_get_name(v14);
  if (!name)
  {
    v43 = self->_ucat;
    if (v43->var0 <= 90)
    {
      if (v43->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v43, 0x5Au))
          goto LABEL_26;
        v43 = self->_ucat;
      }
      LogPrintF_safe((uint64_t)v43, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChangedNW:]", 0x5Au, (uint64_t)"### No interface name", v21, v22, v23, v24, v71);
    }
LABEL_26:
    memset(v76, 0, 28);
    memset(v75, 0, 28);
    goto LABEL_27;
  }
  v25 = (uint64_t)name;
  memset(v76, 0, 28);
  memset(v75, 0, 28);
  v26 = CUGetInterfaceAddresses((self->_controlFlags >> 2) & 2, name, v76, (uint64_t)v75, 0);
  if ((_DWORD)v26)
  {
    v34 = self->_ucat;
    if (v34->var0 <= 90)
    {
      v35 = v26;
      if (v34->var0 != -1)
      {
LABEL_8:
        NSPrintF((uint64_t)"%#m", v27, v28, v29, v30, v31, v32, v33, v35);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe((uint64_t)v34, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChangedNW:]", 0x5Au, (uint64_t)"### Get interface addresses failed: interface=%s, error=%@", v36, v37, v38, v39, v25);

        goto LABEL_27;
      }
      if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
      {
        v34 = self->_ucat;
        goto LABEL_8;
      }
    }
  }
LABEL_27:
  p_primaryIPv4Addr = &self->_primaryIPv4Addr;
  if (SockAddrCompareAddrEx(v76, (uint64_t)&self->_primaryIPv4Addr, 1))
  {
    if (v76[0].sa_family)
    {
      if (v76[0].sa_family == 30)
      {
        p_primaryIPv4Addr->sa = v76[0];
        *(sockaddr *)((char *)&self->_primaryIPv4Addr.v6.sin6_addr + 4) = *(sockaddr *)&v76[0].sa_data[10];
      }
      else if (v76[0].sa_family == 2)
      {
        p_primaryIPv4Addr->sa = v76[0];
      }
    }
    else
    {
      self->_primaryIPv4Addr.sa.sa_family = 0;
    }
    p_primaryIPv6Addr = &self->_primaryIPv6Addr;
    v53 = 1;
    if (!SockAddrCompareAddrEx(v75, (uint64_t)&self->_primaryIPv6Addr, 1))
    {
      v54 = 30;
      goto LABEL_45;
    }
  }
  else
  {
    p_primaryIPv6Addr = &self->_primaryIPv6Addr;
    if (!SockAddrCompareAddrEx(v75, (uint64_t)&self->_primaryIPv6Addr, 1))
    {
      v53 = 0;
      v54 = 20;
      goto LABEL_45;
    }
  }
  if (BYTE1(v75[0]))
  {
    if (BYTE1(v75[0]) == 30)
    {
      p_primaryIPv6Addr->sa = (sockaddr)v75[0];
      *(in6_addr *)((char *)&p_primaryIPv6Addr->v6.sin6_addr + 4) = *(in6_addr *)((char *)v75 + 12);
    }
    else if (BYTE1(v75[0]) == 2)
    {
      p_primaryIPv6Addr->sa = (sockaddr)v75[0];
    }
  }
  else
  {
    self->_primaryIPv6Addr.sa.sa_family = 0;
  }
  v54 = 30;
  v53 = 1;
LABEL_45:
  v55 = self->_ucat;
  if (v54 >= v55->var0)
  {
    if (v55->var0 != -1)
    {
      v73 = v9;
      v74 = v19;
LABEL_48:
      if (v53)
        v56 = "changed";
      else
        v56 = "unchanged";
      NSPrintF((uint64_t)"%##a", v46, v47, v48, v49, v50, v51, v52, (uint64_t)&self->_primaryIPv4Addr);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      NSPrintF((uint64_t)"%##a", v58, v59, v60, v61, v62, v63, v64, (uint64_t)p_primaryIPv6Addr);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe((uint64_t)v55, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChangedNW:]", v54, (uint64_t)"Primary IPs %s: interface=%s, IPv4=%@, IPv6=%@ %s", v66, v67, v68, v69, (uint64_t)v56);

      v9 = v73;
      v19 = v74;
      goto LABEL_53;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, v54))
    {
      v73 = v9;
      v74 = v19;
      v55 = self->_ucat;
      goto LABEL_48;
    }
  }
LABEL_53:
  if (v53)
  {
    primaryIPChangedHandler = (void (**)(void))self->_primaryIPChangedHandler;
    if (primaryIPChangedHandler)
      primaryIPChangedHandler[2]();
  }

}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_controlFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)label
{
  return self->_label;
}

- (unsigned)flags
{
  return self->_flags;
}

- (id)flagsChangedHandler
{
  return self->_flagsChangedHandler;
}

- (void)setFlagsChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)interfacesChangedHandler
{
  return self->_interfacesChangedHandler;
}

- (void)setInterfacesChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- ($9D4F243E34B80324A1B90A38B57CFE16)primaryIPv4Addr
{
  retstr->var0 = (sockaddr)self[4].var2.sin6_addr;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[4].var2.sin6_addr + 12);
  return self;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)primaryIPv6Addr
{
  retstr->var0 = (sockaddr)self[5].var2.sin6_addr;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[5].var2.sin6_addr + 12);
  return self;
}

- (id)primaryIPChangedHandler
{
  return self->_primaryIPChangedHandler;
}

- (void)setPrimaryIPChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)primaryNetworkChangedHandler
{
  return self->_primaryNetworkChangedHandler;
}

- (void)setPrimaryNetworkChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)primaryNetworkSignature
{
  return self->_primaryNetworkSignature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryNetworkSignature, 0);
  objc_storeStrong(&self->_primaryNetworkChangedHandler, 0);
  objc_storeStrong(&self->_primaryIPChangedHandler, 0);
  objc_storeStrong(&self->_interfacesChangedHandler, 0);
  objc_storeStrong((id *)&self->_interfaces, 0);
  objc_storeStrong(&self->_flagsChangedHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_nwPathEvaluator, 0);
}

uint64_t __51__CUNetInterfaceMonitor__networkInterfacesChanged___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t __51__CUNetInterfaceMonitor__networkInterfacesChanged___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    JUMPOUT(0x18D78E7C0);
  return result;
}

void __41__CUNetInterfaceMonitor__ensureStartedNW__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_primaryIPChangedNW:", 0);

}

uint64_t __35__CUNetInterfaceMonitor_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __48__CUNetInterfaceMonitor_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  uint64_t result;
  uint64_t v13;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(int **)(v9 + 32);
  if (*v10 > 30)
    goto LABEL_5;
  if (*v10 != -1)
    goto LABEL_3;
  v11 = _LogCategory_Initialize(*(_QWORD *)(v9 + 32), 0x1Eu);
  v9 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    v10 = *(int **)(v9 + 32);
LABEL_3:
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUNetInterfaceMonitor activateWithCompletion:]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v13);
    v9 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  if ((*(_BYTE *)(v9 + 40) & 4) != 0)
    objc_msgSend((id)v9, "_ensureStartedNW");
  else
    objc_msgSend((id)v9, "_ensureStartedSC");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
