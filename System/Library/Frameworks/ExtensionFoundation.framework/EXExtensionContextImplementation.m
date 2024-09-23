@implementation EXExtensionContextImplementation

- (NSXPCConnection)_auxiliaryConnection
{
  return self->__auxiliaryConnection;
}

- (void)dealloc
{
  EXExtensionRequest *extensionRequest;
  objc_super v4;

  self->__principalObject = 0;
  extensionRequest = self->_extensionRequest;
  self->_extensionRequest = 0;

  -[EXExtensionContextImplementation invalidate](self, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)EXExtensionContextImplementation;
  -[EXExtensionContextImplementation dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "invalidated extension context: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)_setExtensionHostProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)_setProcessAssertion:(id)a3
{
  id v4;
  EXExtensionRequest *extensionRequest;
  NSObject *v6;
  id v7;

  v4 = a3;
  extensionRequest = self->_extensionRequest;
  if (extensionRequest)
  {
    v7 = v4;
    -[EXExtensionRequest setAssertion:](extensionRequest, "setAssertion:", v4);

  }
  else
  {
    _EXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[EXExtensionContextImplementation _setProcessAssertion:].cold.1();

    __break(1u);
  }
}

- (id)_processAssertion
{
  EXExtensionRequest *extensionRequest;
  id result;
  NSObject *v4;

  extensionRequest = self->_extensionRequest;
  if (extensionRequest)
    return -[EXExtensionRequest assertion](extensionRequest, "assertion");
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[EXExtensionContextImplementation _processAssertion].cold.1();

  __break(1u);
  return result;
}

- (NSUUID)_pkUUID
{
  EXExtensionRequest *extensionRequest;
  NSUUID *result;
  NSObject *v4;

  extensionRequest = self->_extensionRequest;
  if (extensionRequest)
    return -[EXExtensionRequest pkUUID](extensionRequest, "pkUUID");
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[EXExtensionContextImplementation _pkUUID].cold.1();

  __break(1u);
  return result;
}

void __91__EXExtensionContextImplementation__derivedExtensionAuxiliaryHostProtocolWithContextClass___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.extension.protocol-creation", 0);
  v1 = (void *)_derivedExtensionAuxiliaryHostProtocolWithContextClass__protocol_creation_queue;
  _derivedExtensionAuxiliaryHostProtocolWithContextClass__protocol_creation_queue = (uint64_t)v0;

}

void __91__EXExtensionContextImplementation__extensionContextVendorProtocolWithAllowedErrorClasses___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_defaultExtensionContextVendorProtocol");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_extensionContextVendorProtocolWithAllowedErrorClasses____xpcInterface;
  _extensionContextVendorProtocolWithAllowedErrorClasses____xpcInterface = v1;

}

+ (id)_extensionContextVendorProtocolWithAllowedErrorClasses:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD block[5];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "_defaultExtensionContextVendorProtocol");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setByAddingObject:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion_, 1, 1);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__EXExtensionContextImplementation__extensionContextVendorProtocolWithAllowedErrorClasses___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (_extensionContextVendorProtocolWithAllowedErrorClasses__onceToken != -1)
      dispatch_once(&_extensionContextVendorProtocolWithAllowedErrorClasses__onceToken, block);
    v5 = (id)_extensionContextVendorProtocolWithAllowedErrorClasses____xpcInterface;
  }

  return v5;
}

- (EXExtensionContextImplementation)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5 extensionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  EXExtensionContextImplementation *v14;
  EXExtensionContextImplementation *v15;
  NSUUID *v16;
  NSUUID *UUID;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  _EXLoadOperator *v36;
  _EXLoadOperator *v37;
  NSObject *v38;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  NSArray *obj;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  id v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v61.receiver = self;
  v61.super_class = (Class)EXExtensionContextImplementation;
  v14 = -[EXExtensionContextImplementation init](&v61, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_extensionContext, v13);
    v43 = v12;
    if (v12)
      v16 = (NSUUID *)objc_msgSend(v12, "copy");
    else
      v16 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    UUID = v15->__UUID;
    v15->__UUID = v16;

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v44 = v10;
    v19 = v10;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v58 != v22)
            objc_enumerationMutation(v19);
          v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "copy");
          objc_msgSend(v18, "addObject:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
      }
      while (v21);
    }
    v42 = v13;
    v41 = v19;

    objc_storeStrong((id *)&v15->_inputItems, v18);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v15->_inputItems;
    v47 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
    if (v47)
    {
      v46 = *(_QWORD *)v54;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v54 != v46)
            objc_enumerationMutation(obj);
          v48 = v25;
          v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v25);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          objc_msgSend(v26, "attachments");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v72, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v50;
            do
            {
              for (j = 0; j != v29; ++j)
              {
                if (*(_QWORD *)v50 != v30)
                  objc_enumerationMutation(v27);
                v32 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v32, "_loadOperator");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v33)
                  {
                    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = objc_msgSend(v34, "useItemProviderXPCConnection");

                    if (v35)
                      v36 = -[_EXLoadOperator initWithItemProvider:]([_EXLoadOperator alloc], "initWithItemProvider:", v32);
                    else
                      v36 = -[_EXItemProviderExtensionVendorLoadOperator initWithExtensionContextIdentifier:]([_EXItemProviderExtensionVendorLoadOperator alloc], "initWithExtensionContextIdentifier:", v15->__UUID);
                    v37 = v36;
                    objc_msgSend(v32, "set_loadOperator:", v36);

                  }
                }
              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v72, 16);
            }
            while (v29);
          }

          v25 = v48 + 1;
        }
        while (v48 + 1 != v47);
        v47 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
      }
      while (v47);
    }

    _EXLegacyLog();
    v38 = objc_claimAutoreleasedReturnValue();
    v12 = v43;
    v13 = v42;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v40 = objc_opt_class();
      *(_DWORD *)buf = 138413314;
      v63 = v40;
      v64 = 2112;
      v65 = v41;
      v66 = 2114;
      v67 = v11;
      v68 = 2114;
      v69 = v43;
      v70 = 2114;
      v71 = v42;
      _os_log_debug_impl(&dword_190C25000, v38, OS_LOG_TYPE_DEBUG, "%@ initialized with inputItems: %@ endpoint: %{public}@ UUID: %{public}@ extensionContext: %{public}@", buf, 0x34u);
    }

    -[EXExtensionContextImplementation _initializeAuxillaryConnectionWithListenerEndpoint:](v15, "_initializeAuxillaryConnectionWithListenerEndpoint:", v11);
    v10 = v44;
  }

  return v15;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  char v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EXExtensionContextImplementation extensionContext](self, "extensionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_derivedExtensionAuxiliaryHostProtocol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_extensionAuxiliaryVendorProtocol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v10);

  objc_msgSend(v7, "setExportedInterface:", v9);
  objc_msgSend(v7, "setExportedObject:", v8);
  if (self->__auxiliaryConnection)
  {
    _EXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[EXExtensionContextImplementation listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_storeStrong((id *)&self->__auxiliaryConnection, a4);
  objc_msgSend(v7, "resume");
  _EXLegacyLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412802;
    v18 = v7;
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = v9;
    _os_log_debug_impl(&dword_190C25000, v12, OS_LOG_TYPE_DEBUG, "New connection: %@ for listener: %{public}@ interface: %{public}@", (uint8_t *)&v17, 0x20u);
  }

  -[EXExtensionContextImplementation extensionContext](self, "extensionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[EXExtensionContextImplementation extensionContext](self, "extensionContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didConnectToVendor:", v7);

  }
  return 1;
}

- (void)_initializeAuxillaryConnectionWithListenerEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id *p_auxiliaryConnection;
  NSObject *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  NSXPCListener *v25;
  NSXPCListener *auxiliaryListener;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EXExtensionContextImplementation extensionContext](self, "extensionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_extensionAuxiliaryVendorProtocol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_extensionAuxiliaryHostProtocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _EXLegacyLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v33 = 138413058;
    v34 = v4;
    v35 = 2112;
    v36 = v5;
    v37 = 2112;
    v38 = v6;
    v39 = 2112;
    v40 = v7;
    _os_log_debug_impl(&dword_190C25000, v8, OS_LOG_TYPE_DEBUG, "_initializeAuxillaryConnectionWithListenerEndpoint: %@ - extensionContext: %@ auxVendorProtocol: %@ auxHostProtocol:%@", (uint8_t *)&v33, 0x2Au);
  }

  if (v4)
  {
    p_auxiliaryConnection = (id *)&self->__auxiliaryConnection;
    if (self->__auxiliaryConnection)
    {
      _EXLegacyLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[EXExtensionContextImplementation _initializeAuxillaryConnectionWithListenerEndpoint:].cold.6();
    }
    else
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v4);
      v12 = *p_auxiliaryConnection;
      *p_auxiliaryConnection = (id)v11;

      if (!v6 || !v7)
      {
        _EXDefaultLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          -[EXExtensionContextImplementation _initializeAuxillaryConnectionWithListenerEndpoint:].cold.5();

      }
      objc_msgSend(*p_auxiliaryConnection, "setExportedInterface:", v6);
      objc_msgSend(*p_auxiliaryConnection, "setExportedObject:", v5);
      objc_msgSend(v5, "_derivedExtensionAuxiliaryHostProtocol");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_auxiliaryConnection, "setRemoteObjectInterface:", v14);

      objc_msgSend(*p_auxiliaryConnection, "resume");
      _EXLegacyLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[EXExtensionContextImplementation _initializeAuxillaryConnectionWithListenerEndpoint:].cold.4((uint64_t)p_auxiliaryConnection, v10, v15, v16, v17, v18, v19, v20);
    }
LABEL_25:

    goto LABEL_26;
  }
  if (v7 && v6)
  {
    if (self->__auxiliaryListener)
    {
      _EXLegacyLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[EXExtensionContextImplementation _initializeAuxillaryConnectionWithListenerEndpoint:].cold.3();
    }
    else
    {
      -[EXExtensionContextImplementation extensionContext](self, "extensionContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "protocol");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "conformsToProtocol:", v22);

      if ((v23 & 1) == 0)
      {
        _EXDefaultLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          -[EXExtensionContextImplementation _initializeAuxillaryConnectionWithListenerEndpoint:].cold.2((uint64_t)v5, v7, v24);

      }
      objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
      v25 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
      auxiliaryListener = self->__auxiliaryListener;
      self->__auxiliaryListener = v25;

      -[NSXPCListener setDelegate:](self->__auxiliaryListener, "setDelegate:", self);
      -[NSXPCListener resume](self->__auxiliaryListener, "resume");
      _EXLegacyLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[EXExtensionContextImplementation _initializeAuxillaryConnectionWithListenerEndpoint:].cold.1((uint64_t)&self->__auxiliaryListener, v10, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_25;
  }
LABEL_26:

}

- (NSExtensionContext)extensionContext
{
  return (NSExtensionContext *)objc_loadWeakRetained((id *)&self->_extensionContext);
}

void __91__EXExtensionContextImplementation__derivedExtensionAuxiliaryHostProtocolWithContextClass___block_invoke_77(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  Protocol *v6;
  NSObject *v7;
  const char *Name;
  size_t v9;
  char *v10;
  Protocol *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(*(id *)(a1 + 40), "_extensionAuxiliaryHostProtocol");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v5)
  {
    objc_msgSend(v5, "protocol");
    v6 = (Protocol *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      _EXDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        __91__EXExtensionContextImplementation__derivedExtensionAuxiliaryHostProtocolWithContextClass___block_invoke_77_cold_1();

    }
    Name = protocol_getName(v6);
    v9 = strlen(Name) + 24;
    v10 = (char *)malloc_type_malloc(v9, 0xC25FCA84uLL);
    strlcpy(v10, "__NSX__HOST__PROTOCOL__", v9);
    strlcat(v10, Name, v9);
    objc_getProtocol(v10);
    v11 = (Protocol *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_allocateProtocol(v10);
      v11 = (Protocol *)objc_claimAutoreleasedReturnValue();
      protocol_addProtocol(v11, v6);
      protocol_addProtocol(v11, (Protocol *)&unk_1EE2115B0);
      objc_registerProtocol(v11);
    }
    free(v10);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

+ (id)_derivedExtensionAuxiliaryHostProtocolWithContextClass:(Class)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (_derivedExtensionAuxiliaryHostProtocolWithContextClass__onceToken != -1)
    dispatch_once(&_derivedExtensionAuxiliaryHostProtocolWithContextClass__onceToken, &__block_literal_global_1);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__EXExtensionContextImplementation__derivedExtensionAuxiliaryHostProtocolWithContextClass___block_invoke_77;
  v6[3] = &unk_1E2CFCBA0;
  v6[4] = &v7;
  v6[5] = a3;
  dispatch_sync((dispatch_queue_t)_derivedExtensionAuxiliaryHostProtocolWithContextClass__protocol_creation_queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_willPerformHostCallback:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[4];
  void (**v7)(_QWORD);
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  if (self->__auxiliaryConnection && !-[EXExtensionContextImplementation _isHost](self, "_isHost"))
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->__auxiliaryConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_119);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __61__EXExtensionContextImplementation__willPerformHostCallback___block_invoke_121;
      v6[3] = &unk_1E2CFCCA8;
      v7 = v4;
      objc_msgSend(v5, "___nsx_pingHost:", v6);

    }
    else
    {
      v4[2](v4);
    }

  }
  else
  {
    v4[2](v4);
  }

}

- (void)_setExtensionHostAuditToken:(id *)a3
{
  objc_copyStruct(&self->104, a3, 32, 1, 0);
}

- (BOOL)_isHost
{
  void *v2;
  BOOL v3;

  -[EXExtensionContextImplementation _extensionHostProxy](self, "_extensionHostProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (EXExtensionContextHosting)_extensionHostProxy
{
  return (EXExtensionContextHosting *)objc_getProperty(self, a2, 40, 1);
}

- (void)_setPrincipalObject:(id)a3
{
  self->__principalObject = a3;
}

- (void)setExtensionRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSUUID)_UUID
{
  return self->__UUID;
}

- (NSArray)inputItems
{
  return self->_inputItems;
}

- (void)_setExtensionVendorProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSXPCListener)_auxiliaryListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 72, 1);
}

+ (id)_defaultExtensionContextVendorProtocol
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2132D0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionItemTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion_, 0, 0);

  return v2;
}

+ (id)_extensionContextHostProtocolWithAllowedErrorClasses:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3B50];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_1EE21C958);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionItemTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel__completeRequestReturningItems_forExtensionContextWithUUID_completion_, 0, 0);
  v8 = v4;
  if (!v4)
    v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setByAddingObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel__cancelRequestWithError_forExtensionContextWithUUID_completion_, 0, 0);
  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "useItemProviderXPCConnection");

  if ((v11 & 1) == 0)
  {
    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itemProviderTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "plistAndValueTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setByAddingObject:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel__loadItemForPayload_contextIdentifier_completionHandler_, 0, 0);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel__loadItemForPayload_contextIdentifier_completionHandler_, 0, 1);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel__loadItemForPayload_contextIdentifier_completionHandler_, 1, 1);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel__loadPreviewImageForPayload_contextIdentifier_completionHandler_, 0, 0);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel__loadPreviewImageForPayload_contextIdentifier_completionHandler_, 0, 1);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel__loadPreviewImageForPayload_contextIdentifier_completionHandler_, 1, 1);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__auxiliaryConnection, 0);
  objc_storeStrong((id *)&self->_inputItems, 0);
  objc_storeStrong((id *)&self->__UUID, 0);
  objc_storeStrong((id *)&self->__auxiliaryListener, 0);
  objc_storeStrong((id *)&self->__extensionVendorProxy, 0);
  objc_storeStrong((id *)&self->__transaction, 0);
  objc_storeStrong((id *)&self->__extensionHostProxy, 0);
  objc_storeStrong((id *)&self->_extensionRequest, 0);
  objc_destroyWeak((id *)&self->_extensionContext);
  objc_storeStrong(&self->__requestCleanUpBlock, 0);
}

- (void)set_pkUUID:(id)a3
{
  id v4;
  EXExtensionRequest *extensionRequest;
  NSObject *v6;
  id v7;

  v4 = a3;
  extensionRequest = self->_extensionRequest;
  if (extensionRequest)
  {
    v7 = v4;
    -[EXExtensionRequest setPkUUID:](extensionRequest, "setPkUUID:", v4);

  }
  else
  {
    _EXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[EXExtensionContextImplementation set_pkUUID:].cold.1();

    __break(1u);
  }
}

+ (id)_extensionContextHostProtocolAllowedClassesForItems
{
  void *v2;
  void *v3;

  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionItemTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_extensionContextForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[_NSExtensionContextVendor _sharedExtensionContextVendor](EXConcreteExtensionContextVendor, "_sharedExtensionContextVendor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_extensionContextForUUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EXExtensionContextImplementation)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *UUID;
  NSArray *v7;
  NSArray *inputItems;
  NSObject *v9;
  NSArray *v11;
  NSUUID *v12;
  int v13;
  EXExtensionContextImplementation *v14;
  __int16 v15;
  NSArray *v16;
  __int16 v17;
  NSUUID *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  UUID = self->__UUID;
  self->__UUID = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputItems"));
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  inputItems = self->_inputItems;
  self->_inputItems = v7;

  _EXLegacyLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12 = self->__UUID;
    v11 = self->_inputItems;
    v13 = 138412802;
    v14 = self;
    v15 = 2112;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_debug_impl(&dword_190C25000, v9, OS_LOG_TYPE_DEBUG, "{public}%@ initialized with inputItems: %@ UUID: %{public}@ ", (uint8_t *)&v13, 0x20u);
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  NSArray *inputItems;
  id v6;

  UUID = self->__UUID;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", UUID, CFSTR("uuid"));
  if (self->_inputItems)
    inputItems = self->_inputItems;
  else
    inputItems = (NSArray *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v6, "encodeObject:forKey:", inputItems, CFSTR("inputItems"));

}

- (void)_completeRequestReturningItemsSecondHalf:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)completeRequestReturningItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  NSUUID *UUID;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  char *v21;
  __objc2_class **v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  NSObject *v32;
  os_activity_t v33;
  os_activity_t v34;
  id v35;
  NSObject *v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD block[4];
  os_activity_t v42;
  id v43;
  id v44;
  EXExtensionContextImplementation *v45;
  os_activity_t v46;
  id v47;
  uint8_t v48[16];
  char v49;
  char v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  os_activity_scope_state_s buf;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = a4;
  _EXLegacyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    UUID = self->__UUID;
    LODWORD(buf.opaque[0]) = 138543362;
    *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)UUID;
    _os_log_impl(&dword_190C25000, v7, OS_LOG_TYPE_DEFAULT, "preparing to call _completeRequestReturningItems:forExtensionContextWithUUID: UUID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v9 = _os_activity_create(&dword_190C25000, "completing request", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  v10 = _os_activity_create(&dword_190C25000, "completing request - consume items", v9, OS_ACTIVITY_FLAG_DEFAULT);
  v34 = _os_activity_create(&dword_190C25000, "completing request - completion part 1", v9, OS_ACTIVITY_FLAG_DEFAULT);
  v33 = _os_activity_create(&dword_190C25000, "completing request - completion part 2", v9, OS_ACTIVITY_FLAG_DEFAULT);
  v36 = v10;
  os_activity_scope_enter(v10, &buf);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v6;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v56;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v56 != v38)
          objc_enumerationMutation(obj);
        v40 = v11;
        v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v11);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        objc_msgSend(v12, "attachments");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v52 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "useItemProviderXPCConnection");

                if (v20)
                  v21 = &v50;
                else
                  v21 = &v49;
                v22 = off_1E2CFA7B8;
                if (!v20)
                  v22 = off_1E2CFA7F0;
                v23 = objc_alloc(*v22);
                -[EXExtensionContextImplementation _extensionHostAuditToken](self, "_extensionHostAuditToken");
                v24 = (void *)objc_msgSend(v23, "initWithItemProvider:destinationProcessAuditToken:", v18, v21);
                objc_msgSend(v18, "set_loadOperator:", v24);

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          }
          while (v15);
        }

        v11 = v40 + 1;
      }
      while (v40 + 1 != v39);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v39);
  }

  os_activity_scope_leave(&buf);
  _EXLegacyLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v48 = 0;
    _os_log_impl(&dword_190C25000, v25, OS_LOG_TYPE_DEFAULT, "call _completeRequestReturningItems:forExtensionContextWithUUID:", v48, 2u);
  }

  -[EXExtensionContextImplementation _extensionHostProxy](self, "_extensionHostProxy");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(25, 0);
  v27 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__EXExtensionContextImplementation_completeRequestReturningItems_completionHandler___block_invoke;
  block[3] = &unk_1E2CFCBC8;
  v42 = v34;
  v43 = v26;
  v44 = obj;
  v45 = self;
  v46 = v33;
  v47 = v35;
  v28 = v35;
  v29 = v33;
  v30 = obj;
  v31 = v26;
  v32 = v34;
  dispatch_async(v27, block);

}

void __84__EXExtensionContextImplementation_completeRequestReturningItems_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  v3 = *(void **)(a1 + 40);
  v2 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(v4 + 80);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__EXExtensionContextImplementation_completeRequestReturningItems_completionHandler___block_invoke_2;
  v6[3] = &unk_1E2CFC778;
  v6[4] = v4;
  v7 = v2;
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  objc_msgSend(v3, "_completeRequestReturningItems:forExtensionContextWithUUID:completion:", v7, v5, v6);

  os_activity_scope_leave(&state);
}

void __84__EXExtensionContextImplementation_completeRequestReturningItems_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  uint8_t buf[16];

  _EXLegacyLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190C25000, v2, OS_LOG_TYPE_DEFAULT, "calling out to _completeRequestReturningItemsSecondHalf", buf, 2u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__EXExtensionContextImplementation_completeRequestReturningItems_completionHandler___block_invoke_104;
  v4[3] = &unk_1E2CFC778;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v5, "_completeRequestReturningItemsSecondHalf:", v4);

}

void __84__EXExtensionContextImplementation_completeRequestReturningItems_completionHandler___block_invoke_104(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
  v4 = v1;
  v5 = v2;
  v6 = v3;
  _EXLegacyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl(&dword_190C25000, v7, OS_LOG_TYPE_DEFAULT, "in _NSExtensionCompleteRequestReturningItemsContinuation", (uint8_t *)v12, 2u);
  }

  _EXExtensionGetGlobalStateQueue(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __EXExtensionCompleteRequestReturningItemsContinuation_block_invoke;
  v12[3] = &unk_1E2CFC958;
  v14 = v4;
  v15 = v6;
  v13 = v5;
  v9 = v5;
  v10 = v6;
  v11 = v4;
  dispatch_async(v8, v12);

}

- (void)cancelRequestWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *UUID;
  NSObject *v7;
  os_activity_t v8;
  void *v9;
  NSUUID *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  EXExtensionContextImplementation *v14;
  os_activity_scope_state_s buf;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _EXLegacyLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    UUID = self->__UUID;
    LODWORD(buf.opaque[0]) = 138543362;
    *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)UUID;
    _os_log_impl(&dword_190C25000, v5, OS_LOG_TYPE_DEFAULT, "preparing to call _cancelRequestWithError:forExtensionContextWithUUID: UUID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v7 = _os_activity_create(&dword_190C25000, "cancelling request", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8 = _os_activity_create(&dword_190C25000, "cancelling request - teardown", v7, OS_ACTIVITY_FLAG_DEFAULT);
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v7, &buf);
  -[EXExtensionContextImplementation _extensionHostProxy](self, "_extensionHostProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->__UUID;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__EXExtensionContextImplementation_cancelRequestWithError___block_invoke;
  v12[3] = &unk_1E2CFC638;
  v11 = v8;
  v13 = v11;
  v14 = self;
  objc_msgSend(v9, "_cancelRequestWithError:forExtensionContextWithUUID:completion:", v4, v10, v12);

  os_activity_scope_leave(&buf);
}

void __59__EXExtensionContextImplementation_cancelRequestWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  _EXExtensionGetGlobalStateQueue(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__EXExtensionContextImplementation_cancelRequestWithError___block_invoke_2;
  v5[3] = &unk_1E2CFC638;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_async(v2, v5);

}

void __59__EXExtensionContextImplementation_cancelRequestWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  os_activity_scope_state_s v3;

  v3.opaque[0] = 0;
  v3.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v3);
  objc_msgSend(MEMORY[0x1E0CB3B70], "_sharedExtensionContextVendor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_tearDownContextWithUUID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80));

  os_activity_scope_leave(&v3);
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_activity_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_190C25000, "opening URL", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9 = _os_activity_create(&dword_190C25000, "opening URL completion", v8, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  -[EXExtensionContextImplementation _extensionHostProxy](self, "_extensionHostProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__EXExtensionContextImplementation_openURL_completionHandler___block_invoke;
  v13[3] = &unk_1E2CFCC18;
  v11 = v7;
  v15 = v11;
  v12 = v9;
  v14 = v12;
  objc_msgSend(v10, "_openURL:completion:", v6, v13);

  os_activity_scope_leave(&state);
}

void __62__EXExtensionContextImplementation_openURL_completionHandler___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  os_activity_scope_state_s state;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  if (*(_QWORD *)(a1 + 40))
  {
    _EXExtensionGetGlobalStateQueue(0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__EXExtensionContextImplementation_openURL_completionHandler___block_invoke_2;
    block[3] = &unk_1E2CFCBF0;
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v9 = a2;
    dispatch_async(v4, block);

  }
  else
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
    os_activity_scope_leave(&state);
  }
}

void __62__EXExtensionContextImplementation_openURL_completionHandler___block_invoke_2(uint64_t a1)
{
  os_activity_scope_state_s v2;

  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_activity_scope_leave(&v2);
}

- (void)_loadItemForPayload:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  EXExtensionContextImplementation *v26;
  id v27;

  v6 = a3;
  v7 = a4;
  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "useItemProviderXPCConnection");

  if (v9)
  {
    _EXDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[EXExtensionContextImplementation _loadItemForPayload:completionHandler:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    __break(1u);
  }
  else
  {
    -[EXExtensionContextImplementation _extensionHostProxy](self, "_extensionHostProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(25, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __74__EXExtensionContextImplementation__loadItemForPayload_completionHandler___block_invoke;
    v23[3] = &unk_1E2CFC778;
    v24 = v10;
    v25 = v6;
    v26 = self;
    v27 = v7;
    v12 = v7;
    v13 = v6;
    v14 = v10;
    dispatch_async(v11, v23);

  }
}

void __74__EXExtensionContextImplementation__loadItemForPayload_completionHandler___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  v4 = (void *)a1[7];
  v5 = *(_QWORD *)(v3 + 80);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__EXExtensionContextImplementation__loadItemForPayload_completionHandler___block_invoke_2;
  v6[3] = &unk_1E2CFCC40;
  v6[4] = v3;
  v7 = v4;
  objc_msgSend(v1, "_loadItemForPayload:contextIdentifier:completionHandler:", v2, v5, v6);

}

void __74__EXExtensionContextImplementation__loadItemForPayload_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "extensionContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  _NSExtensionContextCompleteItemLoading(v8, v7, v6, *(void **)(a1 + 40));

}

- (void)_loadPreviewImageForPayload:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  NSUUID *UUID;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;

  v6 = a3;
  v7 = a4;
  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "useItemProviderXPCConnection");

  if (v9)
  {
    _EXDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[EXExtensionContextImplementation _loadPreviewImageForPayload:completionHandler:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    __break(1u);
  }
  else
  {
    -[EXExtensionContextImplementation _extensionHostProxy](self, "_extensionHostProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UUID = self->__UUID;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __82__EXExtensionContextImplementation__loadPreviewImageForPayload_completionHandler___block_invoke;
    v21[3] = &unk_1E2CFCC40;
    v21[4] = self;
    v22 = v7;
    v12 = v7;
    objc_msgSend(v10, "_loadPreviewImageForPayload:contextIdentifier:completionHandler:", v6, UUID, v21);

  }
}

void __82__EXExtensionContextImplementation__loadPreviewImageForPayload_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "extensionContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  _NSExtensionContextCompleteItemLoading(v8, v7, v6, *(void **)(a1 + 40));

}

- (void)_openURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[EXExtensionContextImplementation extensionContext](self, "extensionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__EXExtensionContextImplementation__openURL_completion___block_invoke;
    block[3] = &unk_1E2CFC750;
    block[4] = self;
    v11 = v6;
    v12 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __56__EXExtensionContextImplementation__openURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "extensionContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  v3 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v4, "performSelector:withObject:withObject:", sel___UI_upcall_openURL_completion_, v2, v3);

}

- (NSString)description
{
  void *v3;
  void *v4;
  NSUUID *UUID;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)EXExtensionContextImplementation;
  -[EXExtensionContextImplementation description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UUID = self->__UUID;
  if (-[EXExtensionContextImplementation _isHost](self, "_isHost"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[EXExtensionContextImplementation _isDummyExtension](self, "_isDummyExtension"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - UUID: %@ - _isHost: %@\n_isDummyExtension:%@\ninputItems:\n%@"), v4, UUID, v6, v7, self->_inputItems);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

void __61__EXExtensionContextImplementation__willPerformHostCallback___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _EXLegacyLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __61__EXExtensionContextImplementation__willPerformHostCallback___block_invoke_cold_1(v2, v3);

}

uint64_t __61__EXExtensionContextImplementation__willPerformHostCallback___block_invoke_121(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)___nsx_pingHost:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)_requestCleanUpBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)_setRequestCleanUpBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (EXExtensionRequest)extensionRequest
{
  return (EXExtensionRequest *)objc_getProperty(self, a2, 32, 1);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)_extensionHostAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  objc_copyStruct(retstr, &self->104, 32, 1, 0);
  return result;
}

- (OS_os_transaction)_transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 48, 1);
}

- (id)_principalObject
{
  return self->__principalObject;
}

- (EXExtensionContextVending)_extensionVendorProxy
{
  return (EXExtensionContextVending *)objc_getProperty(self, a2, 64, 1);
}

- (void)_setAuxiliaryListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)set_UUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)_setInputItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)_setAuxiliaryConnection:(id)a3
{
  objc_storeStrong((id *)&self->__auxiliaryConnection, a3);
}

- (BOOL)_isDummyExtension
{
  return self->__dummyExtension;
}

- (void)_setDummyExtension:(BOOL)a3
{
  self->__dummyExtension = a3;
}

- (void)set_pkUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7();
}

- (void)_pkUUID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7();
}

- (void)_setProcessAssertion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7();
}

- (void)_processAssertion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7();
}

void __91__EXExtensionContextImplementation__derivedExtensionAuxiliaryHostProtocolWithContextClass___block_invoke_77_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: unexpected nil subclass aux host protocol!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_initializeAuxillaryConnectionWithListenerEndpoint:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_190C25000, a2, a3, "AUX Listener created: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)_initializeAuxillaryConnectionWithListenerEndpoint:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  id v6;
  Protocol *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v6 = v5;
  objc_msgSend(a2, "protocol");
  v7 = (Protocol *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 136316162;
  v10 = "[self.extensionContext conformsToProtocol:auxHostProtocol.protocol]";
  v11 = 2080;
  v12 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSupp"
        "ort/EXExtensionContextImplementation.m";
  v13 = 1024;
  v14 = 283;
  v15 = 2112;
  v16 = v5;
  v17 = 2112;
  v18 = v8;
  _os_log_fault_impl(&dword_190C25000, a3, OS_LOG_TYPE_FAULT, "%s - %s:%d: Class %@ does not conform to aux host protocol: %@", (uint8_t *)&v9, 0x30u);

}

- (void)_initializeAuxillaryConnectionWithListenerEndpoint:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_190C25000, v0, v1, "%{public}@ : AUX Listener has already been created.", v2);
  OUTLINED_FUNCTION_6();
}

- (void)_initializeAuxillaryConnectionWithListenerEndpoint:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_190C25000, a2, a3, "AUX connection created: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)_initializeAuxillaryConnectionWithListenerEndpoint:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: must define both host and vendor aux protocols!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_initializeAuxillaryConnectionWithListenerEndpoint:.cold.6()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_190C25000, v1, OS_LOG_TYPE_ERROR, "%{public}@ : AUX connectino has already been created for endpoint '%{public}@'.", v2, 0x16u);
  OUTLINED_FUNCTION_6();
}

- (void)_loadItemForPayload:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7();
}

- (void)_loadPreviewImageForPayload:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7();
}

- (void)_willPerformHostCallback:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;

}

void __61__EXExtensionContextImplementation__willPerformHostCallback___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_190C25000, a2, v4, "failed to ping host: %{public}@", v5);

  OUTLINED_FUNCTION_7();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: listener is one-shot!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
