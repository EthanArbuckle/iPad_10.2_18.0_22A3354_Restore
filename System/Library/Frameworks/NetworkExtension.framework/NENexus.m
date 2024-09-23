@implementation NENexus

- (NENexus)initWithLevel:(unint64_t)a3 name:(id)a4 virtualInterfaceType:(int64_t)a5 delegate:(id)a6 channelCount:(unsigned int)a7
{
  return -[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:execUUID:](self, "initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:execUUID:", a3, a4, a5, a6, *(_QWORD *)&a7, 0, 0, 0);
}

- (NENexus)initWithLevel:(unint64_t)a3 name:(id)a4 virtualInterfaceType:(int64_t)a5 delegate:(id)a6 channelCount:(unsigned int)a7 netifRingSize:(unsigned int)a8 kernelPipeTxRingSize:(unsigned int)a9 kernelPipeRxRingSize:(unsigned int)a10 execUUID:(id)a11
{
  id v18;
  id v19;
  id v20;
  NENexus *v21;
  int v22;
  _QWORD *v23;
  _QWORD *v24;
  NENexusFlowManager *v25;
  SEL v26;
  SEL v27;
  const char *v28;
  SEL v29;
  _QWORD *Property;
  NEPolicySession *v31;
  SEL v32;
  SEL v33;
  OS_nw_nexus *v34;
  OS_nw_nexus *userNexus;
  const char *v36;
  id v37;
  NENexusFlowManager *flowManager;
  NSMutableDictionary *v39;
  NSMutableDictionary *userNexusInstances;
  NSMutableDictionary *v41;
  NSMutableDictionary *userNexusClientCount;
  NSMutableDictionary *v43;
  NSMutableDictionary *userNexusClientFlows;
  NSMutableDictionary *v45;
  NSMutableDictionary *kernelNexusClientFlows;
  NSMutableDictionary *v47;
  NSMutableDictionary *assertions;
  NENexusAgent *v49;
  NENexusAgent *agent;
  NENexusAgent *v51;
  void *v52;
  NENexusAgent *v53;
  NENexusAgent *v54;
  NENexusAgent *v55;
  const char *v56;
  void *v57;
  NENexusAgent *v58;
  const char *v59;
  NENexusAgent *v60;
  const char *v61;
  void *v62;
  NENexusAgent *v63;
  const __CFAllocator *v64;
  NEVirtualInterface_s *NexusExtendedWithOptions;
  const char *v66;
  char *virtualInterface;
  NENexusAgent *v68;
  id v69;
  id v70;
  char v71;
  NENexus *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v77;
  const char *v78;
  NSObject *v79;
  const char *v80;
  unsigned __int8 *v81;
  NSObject *v82;
  uint32_t v83;
  void *v84;
  __int16 v85;
  objc_super v86;
  uuid_t uu;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v18 = a4;
  v19 = a6;
  v20 = a11;
  if (!v18)
  {
    ne_log_obj();
    v73 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
      goto LABEL_48;
    *(_DWORD *)uu = 136315138;
    *(_QWORD *)&uu[4] = "-[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipe"
                        "TxRingSize:kernelPipeRxRingSize:execUUID:]";
    v78 = "%s called with null name";
    goto LABEL_78;
  }
  if (!v19)
  {
    ne_log_obj();
    v73 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
      goto LABEL_48;
    *(_DWORD *)uu = 136315138;
    *(_QWORD *)&uu[4] = "-[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipe"
                        "TxRingSize:kernelPipeRxRingSize:execUUID:]";
    v78 = "%s called with null delegate";
LABEL_78:
    v81 = uu;
    v82 = v73;
    v83 = 12;
    goto LABEL_66;
  }
  v86.receiver = self;
  v86.super_class = (Class)NENexus;
  v21 = -[NENexus init](&v86, sel_init);
  if (!v21)
  {
    ne_log_obj();
    self = (NENexus *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uu = 0;
      _os_log_fault_impl(&dword_19BD16000, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", uu, 2u);
    }
    goto LABEL_49;
  }
  self = v21;
  if (a3 == 2)
  {
    v22 = 2;
  }
  else
  {
    if (a3 != 4)
    {
      ne_log_obj();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uu = 67109120;
        *(_DWORD *)&uu[4] = a3;
        _os_log_error_impl(&dword_19BD16000, v73, OS_LOG_TYPE_ERROR, "Nexus level %u is invalid", uu, 8u);
      }
      goto LABEL_48;
    }
    v22 = 4;
  }
  v21->_level = a3;
  v21->_availability = 0;
  objc_storeStrong((id *)&v21->_name, a4);
  objc_storeWeak((id *)&self->_delegate, v19);
  v23 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A0040C9AB51B7uLL);
  if (!v23)
  {
    ne_log_obj();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uu = 134217984;
      *(_QWORD *)&uu[4] = 64;
      _os_log_fault_impl(&dword_19BD16000, v74, OS_LOG_TYPE_FAULT, "calloc(%zu) failed", uu, 0xCu);
    }

LABEL_47:
    ne_log_obj();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uu = 0;
      v78 = "setupFlowManager failed";
      goto LABEL_64;
    }
    goto LABEL_48;
  }
  v24 = v23;
  v84 = v20;
  if (setupFlowManager_onceToken != -1)
    dispatch_once(&setupFlowManager_onceToken, &__block_literal_global_16285);
  v24[2] = &NENexusFlowIdentifier;
  v24[3] = &NENexusFlowCallbacks;
  v25 = objc_alloc_init(NENexusFlowManager);
  objc_setProperty_atomic(self, v26, v25, 112);

  if (!objc_getProperty(self, v27, 112, 1))
  {
    ne_log_obj();
    v75 = objc_claimAutoreleasedReturnValue();
    v20 = v84;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uu = 0;
      _os_log_fault_impl(&dword_19BD16000, v75, OS_LOG_TYPE_FAULT, "[NENexusFlowManager init] failed", uu, 2u);
    }

    free(v24);
    goto LABEL_47;
  }
  v24[5] = objc_getProperty(self, v28, 112, 1);
  Property = objc_getProperty(self, v29, 112, 1);
  if (Property)
    Property[2] = v24;
  v31 = objc_alloc_init(NEPolicySession);
  objc_setProperty_atomic(self, v32, v31, 120);

  if (!objc_getProperty(self, v33, 120, 1))
  {
    ne_log_obj();
    v77 = objc_claimAutoreleasedReturnValue();
    v20 = v84;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uu = 0;
      _os_log_fault_impl(&dword_19BD16000, v77, OS_LOG_TYPE_FAULT, "[NEPolicySession init] failed", uu, 2u);
    }

    ne_log_obj();
    v73 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
      goto LABEL_48;
    *(_WORD *)uu = 0;
    v78 = "setupPolicySession failed";
    goto LABEL_64;
  }
  if (a3 == 4 || !a7)
  {
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    v34 = (OS_nw_nexus *)nw_nexus_create();
    userNexus = self->_userNexus;
    self->_userNexus = v34;

    if (!self->_userNexus)
    {
      ne_log_obj();
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uu = 0;
        v80 = "nw_nexus_create failed";
        goto LABEL_73;
      }
LABEL_60:

      v72 = 0;
      v20 = v84;
      goto LABEL_50;
    }
  }
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  flowManager = self->_flowManager;
  if (flowManager)
    objc_setProperty_atomic(flowManager, v36, v37, 32);

  v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  userNexusInstances = self->_userNexusInstances;
  self->_userNexusInstances = v39;

  v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  userNexusClientCount = self->_userNexusClientCount;
  self->_userNexusClientCount = v41;

  v43 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  userNexusClientFlows = self->_userNexusClientFlows;
  self->_userNexusClientFlows = v43;

  v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  kernelNexusClientFlows = self->_kernelNexusClientFlows;
  self->_kernelNexusClientFlows = v45;

  v47 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  assertions = self->_assertions;
  self->_assertions = v47;

  v49 = objc_alloc_init(NENexusAgent);
  agent = self->_agent;
  self->_agent = v49;

  v51 = self->_agent;
  if (!v51)
  {
    ne_log_obj();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uu = 0;
      v80 = "[NENexusAgent init] failed";
LABEL_73:
      _os_log_fault_impl(&dword_19BD16000, v79, OS_LOG_TYPE_FAULT, v80, uu, 2u);
      goto LABEL_60;
    }
    goto LABEL_60;
  }
  -[NENexusAgent setActive:](v51, "setActive:", 0);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[NENexusAgent setAgentUUID:](self->_agent, "setAgentUUID:", v52);

  -[NENexusAgent setAgentDescription:](self->_agent, "setAgentDescription:", v18);
  v53 = self->_agent;
  if (v53 && (v53->_frameType = v22, (v54 = self->_agent) != 0))
  {
    objc_storeWeak((id *)&v54->_delegate, self);
    v55 = self->_agent;
  }
  else
  {
    v55 = 0;
  }
  -[NENexusAgent setNexusProvider:](v55, "setNexusProvider:", a3 == 4);
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCEC90]), "initWithNetworkAgentClass:", objc_opt_class());
  v58 = self->_agent;
  if (v58)
    objc_setProperty_atomic(v58, v56, v57, 32);

  v60 = self->_agent;
  v20 = v84;
  if (!v60 || !objc_getProperty(v60, v59, 32, 1))
  {
    ne_log_obj();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uu = 0;
      v78 = "[NWNetworkAgentRegistration initWithNetworkAgentClass] failed";
LABEL_64:
      v81 = uu;
LABEL_65:
      v82 = v73;
      v83 = 2;
LABEL_66:
      _os_log_fault_impl(&dword_19BD16000, v82, OS_LOG_TYPE_FAULT, v78, v81, v83);
    }
LABEL_48:

LABEL_49:
    v72 = 0;
    goto LABEL_50;
  }
  v62 = self->_agent;
  if (v62)
  {
    v62 = objc_getProperty(v62, v61, 32, 1);
    v63 = self->_agent;
  }
  else
  {
    v63 = 0;
  }
  if ((objc_msgSend(v62, "registerNetworkAgent:", v63) & 1) == 0)
  {
    ne_log_obj();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uu = 0;
      v78 = "[NWNetworkAgentRegistration registerNetworkAgent] failed";
      goto LABEL_64;
    }
    goto LABEL_48;
  }
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  if (v84)
    objc_msgSend(v84, "getUUIDBytes:", uu);
  v64 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  NexusExtendedWithOptions = (NEVirtualInterface_s *)NEVirtualInterfaceCreateNexusExtendedWithOptions((const __CFAllocator *)*MEMORY[0x1E0C9AE00], a5, 0, 0, 1, 0, a7, 0, a8, a9, a10, uu, 0);
  self->_virtualInterface = NexusExtendedWithOptions;
  if (!NexusExtendedWithOptions)
  {
    ne_log_obj();
    v73 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
      goto LABEL_48;
    v85 = 0;
    v78 = "NEVirtualInterfaceCreateNexus failed";
    goto LABEL_71;
  }
  virtualInterface = (char *)NexusExtendedWithOptions;
  v68 = self->_agent;
  if (v68)
  {
    v69 = objc_getProperty(v68, v66, 32, 1);
    virtualInterface = (char *)self->_virtualInterface;
    v70 = v69;
    if (!virtualInterface)
      goto LABEL_37;
  }
  else
  {
    v70 = 0;
  }
  virtualInterface = (char *)CFStringCreateWithCString(v64, virtualInterface + 265, 0x600u);
LABEL_37:
  v71 = objc_msgSend(v70, "addNetworkAgentToInterfaceNamed:", virtualInterface);

  if ((v71 & 1) == 0)
  {
    ne_log_obj();
    v73 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
      goto LABEL_48;
    v85 = 0;
    v78 = "[NWNetworkAgentRegistration addNetworkAgentToInterfaceNamed] failed";
LABEL_71:
    v81 = (unsigned __int8 *)&v85;
    goto LABEL_65;
  }
  v72 = self;
LABEL_50:

  return v72;
}

- (NENexus)initWithName:(id)a3 delegate:(id)a4
{
  NSObject *v6;
  objc_super v8;
  uint8_t buf[16];

  ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "Cannot instantiate an NENexus directly", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)NENexus;
  -[NENexus doesNotRecognizeSelector:](&v8, sel_doesNotRecognizeSelector_, a2);

  return 0;
}

- (void)cancel
{
  NENexus *v2;
  NENexus *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  const char *v8;
  id v9;
  const char *v10;
  id v11;
  id Property;
  const char *v13;
  id v14;
  SEL v15;
  id v16;
  const char *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  SEL v22;
  id v23;
  const char *v24;
  void *v25;
  const char *v26;
  id v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v2 = self;
  v38 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  if (self)
    self = (NENexus *)objc_getProperty(self, a2, 88, 1);
  v3 = self;
  v4 = -[NENexus countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v3);
        -[NENexus closeFlowWithClientIdentifier:](v2, "closeFlowWithClientIdentifier:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
      }
      v5 = -[NENexus countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v5);
  }

  if (!v2)
  {
    v29 = 0;
    v27 = 0;
    goto LABEL_23;
  }
  v9 = objc_getProperty(v2, v8, 112, 1);
  v11 = v9;
  if (!v9)
    goto LABEL_18;
  Property = objc_getProperty(v9, v10, 8, 1);

  if (Property)
  {
    v14 = objc_getProperty(v2, v13, 112, 1);
    v16 = objc_getProperty(v2, v15, 112, 1);
    v18 = v16;
    if (v16)
      v16 = objc_getProperty(v16, v17, 8, 1);
    v19 = v16;

    v20 = (void *)nw_context_copy_implicit_context();
    v31 = v19;
    v32 = v14;
    v11 = v14;
    v21 = v19;
    nw_queue_context_async_if_needed();

    v23 = objc_getProperty(v2, v22, 112, 1);
    if (v23)
    {
      v25 = v23;
      objc_setProperty_atomic(v23, v24, 0, 8);

    }
LABEL_18:

  }
  if (objc_getProperty(v2, v13, 64, 1))
  {
    objc_getProperty(v2, v26, 64, 1);
    nw_nexus_close();
  }
  v27 = objc_getProperty(v2, v26, 128, 1);
  v29 = v27;
  if (v27)
    v27 = objc_getProperty(v27, v28, 32, 1);
LABEL_23:
  objc_msgSend(v27, "unregisterNetworkAgent");

  v30 = -[NENexus virtualInterface](v2, "virtualInterface");
  if (!v30 || *(_QWORD *)(v30 + 256) != 2)
    NEVirtualInterfaceInvalidate((uint64_t)-[NENexus virtualInterface](v2, "virtualInterface"));
}

- (void)dealloc
{
  const char *v3;
  id Property;
  const char *v5;
  void *v6;
  objc_super v7;

  if (-[NENexus virtualInterface](self, "virtualInterface"))
  {
    CFRelease(-[NENexus virtualInterface](self, "virtualInterface"));
    -[NENexus setVirtualInterface:](self, "setVirtualInterface:", 0);
  }
  if (self)
  {
    Property = objc_getProperty(self, v3, 128, 1);
    v6 = Property;
    if (Property)
      Property = objc_getProperty(Property, v5, 32, 1);
  }
  else
  {
    v6 = 0;
    Property = 0;
  }
  objc_msgSend(Property, "unregisterNetworkAgent");

  v7.receiver = self;
  v7.super_class = (Class)NENexus;
  -[NENexus dealloc](&v7, sel_dealloc);
}

- (NSString)interfaceName
{
  __CFString *v3;

  v3 = -[NENexus virtualInterface](self, "virtualInterface");
  if (v3)
  {
    v3 = -[NENexus virtualInterface](self, "virtualInterface");
    if (v3)
      v3 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const char *)&v3[8].info + 1, 0x600u);
  }
  return (NSString *)v3;
}

- (BOOL)handleRequestNexusFromClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  BOOL v9;
  id *v10;
  const char *v11;
  id Property;
  id WeakRetained;
  NSObject *v14;
  _QWORD v16[4];
  NSObject *v17;
  NENexus *v18;
  id v19;
  NSObject *v20;
  __int128 *p_buf;
  uint8_t v22[16];
  __int128 buf;
  uint64_t v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CCECA8], "pathForClientID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "parameters");
    v7 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v24 = 0x2020000000;
    v25 = 0;
    v25 = -[NSObject pid](v7, "pid");
    v8 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);
    v9 = v8 != 0;
    if (!v8)
    {
      ne_log_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v22 = 0;
        _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "Client has no pid, cannot assign nexus", v22, 2u);
      }
      goto LABEL_14;
    }
    v10 = -[NENexusPathFlow initWithPath:]((id *)[NENexusPathFlow alloc], v6);
    objc_msgSend(v10, "setState:", 1);
    if (self)
    {
      Property = objc_getProperty(self, v11, 112, 1);
      if (!v10)
      {
LABEL_6:
        if (self)
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        else
          WeakRetained = 0;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __40__NENexus_handleRequestNexusFromClient___block_invoke;
        v16[3] = &unk_1E3CC26B8;
        v14 = v10;
        v17 = v14;
        v18 = self;
        p_buf = &buf;
        v19 = v4;
        v20 = v7;
        objc_msgSend(WeakRetained, "acceptNewFlow:fromNexus:completionHandler:", v14, self, v16);

LABEL_14:
        _Block_object_dispose(&buf, 8);
        goto LABEL_15;
      }
    }
    else
    {
      Property = 0;
      if (!v10)
        goto LABEL_6;
    }
    objc_storeWeak(v10 + 4, Property);
    goto LABEL_6;
  }
  ne_log_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "Failed to get path for client %@", (uint8_t *)&buf, 0xCu);
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (void)closeFlowWithClientIdentifier:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  const char *v12;
  SEL v13;
  id v14;
  void *v15;
  unint64_t v16;
  const char *v17;
  SEL v18;
  id v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  void *v48;
  id v49;
  const char *v50;
  void *v51;
  const char *v52;
  id v53;
  id v54;
  void *v55;
  NSObject *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t);
  void *v68;
  id v69;
  NSObject *v70;
  _BYTE v71[128];
  uint8_t v72[128];
  uint8_t buf[4];
  const char *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (self)
      Property = objc_getProperty(self, v4, 88, 1);
    else
      Property = 0;
    objc_msgSend(Property, "objectForKeyedSubscript:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = v7;
    if (v7 && (v10 = objc_getProperty(v7, v8, 24, 1)) != 0)
    {
      v11 = v10;
      -[NSObject setState:](v9, "setState:", 3);
      if (self)
      {
        objc_msgSend(objc_getProperty(self, v12, 88, 1), "setObject:forKeyedSubscript:", 0, v5);
        v14 = objc_getProperty(self, v13, 80, 1);
      }
      else
      {
        objc_msgSend(0, "setObject:forKeyedSubscript:", 0, v5);
        v14 = 0;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedIntegerValue");
      if (v16 > 1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16 - 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (self)
          v53 = objc_getProperty(self, v52, 80, 1);
        else
          v53 = 0;
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v48, v11);
      }
      else
      {
        if (self)
        {
          objc_msgSend(objc_getProperty(self, v17, 80, 1), "setObject:forKeyedSubscript:", 0, v11);
          v19 = objc_getProperty(self, v18, 112, 1);
          v21 = v19;
          if (v19)
            v19 = objc_getProperty(v19, v20, 32, 1);
        }
        else
        {
          objc_msgSend(0, "setObject:forKeyedSubscript:", 0, v11);
          v21 = 0;
          v19 = 0;
        }
        objc_msgSend(v19, "objectForKeyedSubscript:", v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)nw_context_copy_implicit_context();
        v65 = MEMORY[0x1E0C809B0];
        v66 = 3221225472;
        v67 = __41__NENexus_closeFlowWithClientIdentifier___block_invoke;
        v68 = &unk_1E3CC2F98;
        v69 = v22;
        v70 = v9;
        nw_queue_context_async();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v56 = v9;
        v54 = v69;
        if (self)
          v26 = objc_getProperty(self, v24, 72, 1);
        else
          v26 = 0;
        v55 = v15;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
        if (v28)
        {
          v30 = v28;
          v31 = *(_QWORD *)v62;
          do
          {
            v32 = 0;
            do
            {
              if (*(_QWORD *)v62 != v31)
                objc_enumerationMutation(v27);
              v33 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v32);
              if (self)
                v34 = objc_getProperty(self, v29, 72, 1);
              else
                v34 = 0;
              objc_msgSend(v34, "objectForKeyedSubscript:", v33);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35 == v11)
                objc_msgSend(v25, "addObject:", v33);
              ++v32;
            }
            while (v30 != v32);
            v36 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
            v30 = v36;
          }
          while (v36);
        }

        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v37 = v25;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
        if (v38)
        {
          v40 = v38;
          v41 = *(_QWORD *)v58;
          do
          {
            v42 = 0;
            do
            {
              if (*(_QWORD *)v58 != v41)
                objc_enumerationMutation(v37);
              v43 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v42);
              if (self)
                v44 = objc_getProperty(self, v39, 72, 1);
              else
                v44 = 0;
              objc_msgSend(v44, "setObject:forKeyedSubscript:", 0, v43);
              ++v42;
            }
            while (v40 != v42);
            v45 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
            v40 = v45;
          }
          while (v45);
        }

        if (self)
        {
          v48 = v54;
          v15 = v55;
          if (objc_getProperty(self, v46, 64, 1))
          {
            objc_getProperty(self, v47, 64, 1);
            nw_nexus_close_channel_and_instance();
          }
          v49 = objc_getProperty(self, v47, 112, 1);
          v51 = v49;
          v9 = v56;
          if (v49)
            v49 = objc_getProperty(v49, v50, 32, 1);
        }
        else
        {
          v51 = 0;
          v49 = 0;
          v15 = v55;
          v9 = v56;
          v48 = v54;
        }
        objc_msgSend(v49, "setObject:forKeyedSubscript:", 0, v11);

        -[NENexus rejectFlowWithClientIdentifier:](self, v5);
      }

    }
    else
    {
      -[NENexus rejectFlowWithClientIdentifier:](self, v5);
    }
  }
  else
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v74 = "-[NENexus closeFlowWithClientIdentifier:]";
      _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, "%s called with null clientUUID", buf, 0xCu);
    }
  }

}

- (void)setAvailability:(unint64_t)a3
{
  SEL v5;
  id Property;
  const char *v7;
  id v8;
  SEL v9;
  NEVirtualInterface_s *v10;
  char v11;
  char v12;
  char v13;
  char v14;

  self->_availability = a3;
  objc_msgSend(objc_getProperty(self, a2, 128, 1), "setActive:", a3 != 0);
  Property = objc_getProperty(self, v5, 128, 1);
  if (Property)
    Property = objc_getProperty(Property, v7, 32, 1);
  v8 = Property;
  objc_msgSend(v8, "updateNetworkAgent:", objc_getProperty(self, v9, 128, 1));

  v10 = -[NENexus virtualInterface](self, "virtualInterface");
  if (v10 && !*((_BYTE *)v10 + 264))
  {
    v11 = *((_BYTE *)v10 + 312);
    if (((v11 & 1) == 0) == (a3 == 3))
      *((_BYTE *)v10 + 312) = v11 & 0xFE | (a3 == 3);
    v12 = *((_BYTE *)v10 + 312);
    if (((v12 & 2) == 0) == (a3 == 2))
      *((_BYTE *)v10 + 312) = v12 & 0xFD | (2 * (a3 == 2));
    v13 = *((_BYTE *)v10 + 312);
    if (((v13 & 4) == 0) == (a3 == 4))
      *((_BYTE *)v10 + 312) = v13 & 0xFB | (4 * (a3 == 4));
    v14 = *((_BYTE *)v10 + 312);
    if (((v14 & 8) == 0) == a3 < 2)
      *((_BYTE *)v10 + 312) = v14 & 0xF7 | (8 * (a3 < 2));
  }
  NEVirtualInterfaceUpdateAdHocServiceReturnChanges((uint64_t)v10, 0, 1);
}

- (void)handleStartFromClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id *v8;
  id WeakRetained;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CCECA8], "pathForClientID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "parameters");
    v7 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject pid](v7, "pid"))
    {
      v8 = -[NENexusPathFlow initWithPath:]((id *)[NENexusPathFlow alloc], v6);
      objc_msgSend(v8, "setState:", 1);
      if (self)
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      else
        WeakRetained = 0;
      objc_msgSend(WeakRetained, "handleRequestToActivateNexus:fromFlow:", self, v8);

    }
    else
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "Client has no pid, cannot assign nexus", (uint8_t *)&v11, 2u);
      }

    }
  }
  else
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "Failed to get path for client %@", (uint8_t *)&v11, 0xCu);
    }
  }

}

- (void)handleAssertFromClient:(id)a3
{
  const char *v4;
  id Property;
  id v6;
  const char *v7;
  id v8;
  id v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  id v17;
  id v18;
  const char *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 96, 1);
  else
    Property = 0;
  v6 = Property;
  objc_sync_enter(v6);
  if (self)
    v8 = objc_getProperty(self, v7, 96, 1);
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "objectForKeyedSubscript:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v13 = objc_getProperty(self, v11, 96, 1);
    else
      v13 = 0;
    v14 = v13;
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v17 = objc_getProperty(self, v15, 96, 1);
    else
      v17 = 0;
    v18 = v17;
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, v23);

    if (!-[NENexus isAsserted](self, "isAsserted"))
    {
      v20 = self ? objc_getProperty(self, v19, 96, 1) : 0;
      v21 = v20;
      v22 = objc_msgSend(v21, "count");

      if (v22)
        -[NENexus setAsserted:](self, "setAsserted:", 1);
    }
  }

  objc_sync_exit(v6);
}

- (void)handleUnassertFromClient:(id)a3
{
  const char *v4;
  id Property;
  id v6;
  const char *v7;
  id v8;
  id v9;
  void *v10;
  const char *v11;
  id v12;
  id v13;
  const char *v14;
  id v15;
  id v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  id v20;
  id v21;
  id v22;

  v22 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 96, 1);
  else
    Property = 0;
  v6 = Property;
  objc_sync_enter(v6);
  if (self)
    v8 = objc_getProperty(self, v7, 96, 1);
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "objectForKeyedSubscript:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if ((unint64_t)objc_msgSend(v10, "unsignedIntegerValue") > 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        v20 = objc_getProperty(self, v18, 96, 1);
      else
        v20 = 0;
      v21 = v20;
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, v22);

    }
    else
    {
      if (self)
        v12 = objc_getProperty(self, v11, 96, 1);
      else
        v12 = 0;
      v13 = v12;
      objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v22);

      if (-[NENexus isAsserted](self, "isAsserted"))
      {
        if (self)
          v15 = objc_getProperty(self, v14, 96, 1);
        else
          v15 = 0;
        v16 = v15;
        v17 = objc_msgSend(v16, "count");

        if (!v17)
          -[NENexus setAsserted:](self, "setAsserted:", 0);
      }
    }
  }

  objc_sync_exit(v6);
}

- (void)setLocalAddresses:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NEVirtualInterface_s *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __CFString *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v5);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_localAddresses);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusSet:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", self->_localAddresses);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v9);

  objc_storeStrong((id *)&self->_localAddresses, a3);
  v10 = -[NENexus virtualInterface](self, "virtualInterface");
  if (objc_msgSend(v8, "count"))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v17, "hostname");
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
            NEVirtualInterfaceRemoveAddress((uint64_t)v10, v18);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v14);
    }

    v8 = v11;
  }
  if (objc_msgSend(v6, "count"))
  {
    v30 = v8;
    v31 = v6;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = v6;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (!v20)
      goto LABEL_27;
    v21 = v20;
    v22 = *(_QWORD *)v33;
    while (1)
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = v24;
          if (objc_msgSend(v25, "addressFamily") == 2)
          {
            objc_msgSend(v25, "hostname");
            v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v27 = (uint64_t)v10;
            v28 = v26;
            v29 = CFSTR("255.255.255.255");
            goto LABEL_23;
          }
          if (objc_msgSend(v25, "addressFamily") == 30)
          {
            objc_msgSend(v25, "hostname");
            v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v27 = (uint64_t)v10;
            v28 = v26;
            v29 = CFSTR("FFFF:FFFF:FFFF:FFFF::");
LABEL_23:
            NEVirtualInterfaceAddAddressInternal(v27, v28, v29, 0);

          }
          continue;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (!v21)
      {
LABEL_27:

        v6 = v31;
        v8 = v30;
        break;
      }
    }
  }
  NEVirtualInterfaceUpdateAdHocServiceReturnChanges((uint64_t)v10, 0, 1);

}

- (void)setDnsServerAddresses:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NEVirtualInterface_s *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_dnsServerAddresses, a3);
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "hostname", (_QWORD)v15);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }
  v14 = -[NENexus virtualInterface](self, "virtualInterface", (_QWORD)v15);
  NEVirtualInterfaceSetDNSServers((uint64_t)v14, v6);
  NEVirtualInterfaceUpdateAdHocServiceReturnChanges((uint64_t)v14, 0, 1);

}

- (void)setMaximumTransmissionUnit:(unint64_t)a3
{
  self->_maximumTransmissionUnit = a3;
  NEVirtualInterfaceSetMTU((uint64_t)-[NENexus virtualInterface](self, "virtualInterface"), a3);
}

- (unint64_t)level
{
  return self->_level;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)availability
{
  return self->_availability;
}

- (BOOL)isAsserted
{
  return self->_asserted;
}

- (void)setAsserted:(BOOL)a3
{
  self->_asserted = a3;
}

- (NSArray)localAddresses
{
  return self->_localAddresses;
}

- (NSArray)dnsServerAddresses
{
  return self->_dnsServerAddresses;
}

- (unint64_t)maximumTransmissionUnit
{
  return self->_maximumTransmissionUnit;
}

- (NEVirtualInterface_s)virtualInterface
{
  return self->_virtualInterface;
}

- (void)setVirtualInterface:(NEVirtualInterface_s *)a3
{
  self->_virtualInterface = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kernelNexusClientFlows, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_storeStrong((id *)&self->_flowManager, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_userNexusClientFlows, 0);
  objc_storeStrong((id *)&self->_userNexusClientCount, 0);
  objc_storeStrong((id *)&self->_userNexusInstances, 0);
  objc_storeStrong((id *)&self->_userNexus, 0);
  objc_storeStrong((id *)&self->_dnsServerAddresses, 0);
  objc_storeStrong((id *)&self->_localAddresses, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)rejectFlowWithClientIdentifier:(void *)a1
{
  id v3;
  uint64_t assign_message;
  const char *v5;
  void *v6;
  id Property;
  const char *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint8_t v14[16];
  uint64_t v15;
  uuid_t uu;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v15 = 0;
    memset(uu, 0, sizeof(uu));
    uuid_clear(uu);
    assign_message = nw_path_create_assign_message();
    if (!assign_message)
    {
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_fault_impl(&dword_19BD16000, v13, OS_LOG_TYPE_FAULT, "nw_path_create_assign_message failed", v14, 2u);
      }
      goto LABEL_10;
    }
    v6 = (void *)assign_message;
    Property = objc_getProperty(a1, v5, 128, 1);
    if (Property)
      Property = objc_getProperty(Property, v8, 32, 1);
    v9 = (void *)MEMORY[0x1E0C99D50];
    v10 = Property;
    objc_msgSend(v9, "dataWithBytes:length:", v6, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "assignNexusData:toClient:", v11, v3);

    free(v6);
    if ((v12 & 1) == 0)
    {
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v14 = 0;
        _os_log_debug_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEBUG, "assignNexusData:toClient: failed", v14, 2u);
      }
LABEL_10:

    }
  }

}

uint64_t __41__NENexus_closeFlowWithClientIdentifier___block_invoke(uint64_t a1)
{
  uint64_t protocol_handler;
  uint64_t result;
  BOOL v4;

  protocol_handler = nw_channel_get_protocol_handler();
  result = objc_msgSend(*(id *)(a1 + 40), "protocol");
  if (protocol_handler)
    v4 = result == 0;
  else
    v4 = 1;
  if (!v4)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(protocol_handler + 24) + 8))(protocol_handler, result, 1);
  return result;
}

void __40__NENexus_handleRequestNexusFromClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  id Property;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  const char *v12;
  id v13;
  void *v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  uint64_t channel_to_new_instance;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  char v22;
  const char *v23;
  const char *v24;
  void *v25;
  id v26;
  const char *v27;
  id v28;
  const char *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t assign_message;
  const char *v44;
  void *v45;
  id v46;
  const char *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  const char *v53;
  id v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  const char *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  const char *v63;
  id v64;
  const char *v65;
  void *v66;
  const char *v67;
  id v68;
  void *v69;
  uint64_t v70;
  id v71;
  void *v72;
  const char *v73;
  id v74;
  NSObject *v75;
  int v76;
  uint64_t v77;
  id v78;
  id v79;
  uint8_t buf[8];
  uint64_t v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t);
  void *v84;
  NSObject *v85;
  uint64_t v86;
  id v87;
  id v88;
  int v89;
  uint8_t v90[8];
  uint64_t v91;
  uint8_t v92[8];
  uint64_t v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (!v3)
    goto LABEL_73;
  objc_msgSend(v4, "setState:", 2);
  v89 = 0;
  Property = *(id *)(a1 + 40);
  if (Property)
    Property = objc_getProperty(Property, v5, 72, 1);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v9 = Property;
  objc_msgSend(v7, "numberWithInt:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(id *)(a1 + 40);
  if (v11)
  {
    if (v13)
      v13 = objc_getProperty(v13, v12, 80, 1);
    objc_msgSend(v13, "objectForKeyedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v16 = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + 1);
      v17 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = &unk_1E3D03730;
    }
    v26 = *(id *)(a1 + 40);
    if (v26)
      v26 = objc_getProperty(v26, v15, 80, 1);
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v17, v11);
    v28 = *(id *)(a1 + 40);
    if (v28)
    {
      v28 = objc_getProperty(v28, v27, 112, 1);
      v30 = v28;
      if (v28)
        v28 = objc_getProperty(v28, v29, 32, 1);
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v28, "objectForKeyedSubscript:", v11);
    v31 = objc_claimAutoreleasedReturnValue();

    if (v31)
      nw_channel_get_key();
    v32 = (void *)nw_context_copy_implicit_context();
    v81 = MEMORY[0x1E0C809B0];
    v82 = 3221225472;
    v83 = __40__NENexus_handleRequestNexusFromClient___block_invoke_184;
    v84 = &unk_1E3CC2690;
    v33 = *(_QWORD *)(a1 + 40);
    v34 = *(void **)(a1 + 48);
    v85 = v31;
    v86 = v33;
    v87 = v34;
    v88 = *(id *)(a1 + 32);
    v20 = v31;
    nw_queue_context_async();

    v35 = v85;
    goto LABEL_27;
  }
  if (v13)
    objc_getProperty(v13, v12, 64, 1);
  channel_to_new_instance = nw_nexus_create_channel_to_new_instance();
  if (!channel_to_new_instance)
  {
    ne_log_obj();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v92 = 0;
      _os_log_fault_impl(&dword_19BD16000, v19, OS_LOG_TYPE_FAULT, "nw_nexus_create_channel_to_new_instance failed", v92, 2u);
    }
    goto LABEL_72;
  }
  v19 = channel_to_new_instance;
  *(_QWORD *)v92 = 0;
  v93 = 0;
  objc_msgSend(0, "getUUIDBytes:", v92);
  *(_DWORD *)buf = 0;
  if ((nw_channel_get_nexus_instance() & 1) == 0)
  {
    ne_log_obj();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v90 = 0;
      _os_log_fault_impl(&dword_19BD16000, v57, OS_LOG_TYPE_FAULT, "nw_channel_get_nexus_instance failed", v90, 2u);
    }

    goto LABEL_72;
  }
  nw_channel_get_key();
  objc_msgSend(*(id *)(a1 + 56), "processUUID");
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "effectiveProcessUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqual:", v20);

  if ((v22 & 1) != 0)
  {
    if (v20)
    {
      *(_QWORD *)v90 = 0;
      v91 = 0;
      -[NSObject getUUIDBytes:](v20, "getUUIDBytes:", v90);
      v25 = *(void **)(a1 + 40);
      if (v25)
        objc_getProperty(v25, v24, 64, 1);
    }
    else
    {
      v60 = *(void **)(a1 + 40);
      if (v60)
        objc_getProperty(v60, v23, 64, 1);
    }
  }
  else if (v20)
  {
    *(_QWORD *)v90 = 0;
    v91 = 0;
    -[NSObject getUUIDBytes:](v20, "getUUIDBytes:", v90);
    v59 = *(void **)(a1 + 40);
    if (v59)
      objc_getProperty(v59, v58, 64, 1);
  }
  else
  {
    v61 = *(void **)(a1 + 40);
    if (v61)
      objc_getProperty(v61, v23, 64, 1);
  }
  if ((nw_nexus_bind_client_port() & 1) == 0)
  {
    ne_log_obj();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      v76 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      *(_DWORD *)v90 = 67109120;
      *(_DWORD *)&v90[4] = v76;
      _os_log_error_impl(&dword_19BD16000, v75, OS_LOG_TYPE_ERROR, "Failed to bind nexus port for %d", v90, 8u);
    }

LABEL_72:
    v4 = *(void **)(a1 + 32);
LABEL_73:
    objc_msgSend(v4, "setState:", 3);
    goto LABEL_74;
  }
  v62 = (void *)nw_context_copy_implicit_context();
  v77 = MEMORY[0x1E0C809B0];
  v17 = v19;
  v78 = *(id *)(a1 + 48);
  v79 = *(id *)(a1 + 32);
  nw_queue_context_async();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v92, v77, 3221225472, __40__NENexus_handleRequestNexusFromClient___block_invoke_185, &unk_1E3CC2690);
  v64 = *(id *)(a1 + 40);
  if (v64)
  {
    v64 = objc_getProperty(v64, v63, 112, 1);
    v66 = v64;
    if (v64)
      v64 = objc_getProperty(v64, v65, 32, 1);
  }
  else
  {
    v66 = 0;
  }
  objc_msgSend(v64, "setObject:forKeyedSubscript:", v17, v11);

  v68 = *(id *)(a1 + 40);
  if (v68)
    v68 = objc_getProperty(v68, v67, 72, 1);
  v69 = (void *)MEMORY[0x1E0CB37E8];
  v70 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v71 = v68;
  objc_msgSend(v69, "numberWithInt:", v70);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v11, v72);

  v74 = *(id *)(a1 + 40);
  if (v74)
    v74 = objc_getProperty(v74, v73, 80, 1);
  objc_msgSend(v74, "setObject:forKeyedSubscript:", &unk_1E3D03730, v11);

  v35 = v17;
LABEL_27:

  v37 = *(void **)(a1 + 32);
  if (v37)
    objc_setProperty_atomic(v37, v36, v11, 24);
  objc_msgSend(v3, "localEndpoint");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    v40 = (void *)objc_msgSend(v38, "copyCEndpoint");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "localAddresses");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v42, "copyCEndpoint");

  }
  *(_QWORD *)v90 = 0;
  *(_QWORD *)v92 = 0;
  v93 = 0;
  objc_msgSend(v11, "getUUIDBytes:", v92);
  assign_message = nw_path_create_assign_message();
  if (assign_message)
  {
    v45 = (void *)assign_message;
    v46 = *(id *)(a1 + 40);
    if (v46)
    {
      v46 = objc_getProperty(v46, v44, 128, 1);
      v48 = v46;
      if (v46)
        v46 = objc_getProperty(v46, v47, 32, 1);
    }
    else
    {
      v48 = 0;
    }
    v49 = (void *)MEMORY[0x1E0C99D50];
    v50 = *(_QWORD *)v90;
    v51 = v46;
    objc_msgSend(v49, "dataWithBytes:length:", v45, v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v50) = objc_msgSend(v51, "assignNexusData:toClient:", v52, *(_QWORD *)(a1 + 48));

    free(v45);
    if ((v50 & 1) != 0)
    {
      v55 = *(_QWORD *)(a1 + 32);
      v54 = *(id *)(a1 + 40);
      if (v54)
        v54 = objc_getProperty(v54, v53, 88, 1);
      objc_msgSend(v54, "setObject:forKeyedSubscript:", v55, *(_QWORD *)(a1 + 48));
      goto LABEL_45;
    }
    ne_log_obj();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19BD16000, v56, OS_LOG_TYPE_DEBUG, "assignNexusData:toClient: failed", buf, 2u);
    }
  }
  else
  {
    ne_log_obj();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, v56, OS_LOG_TYPE_FAULT, "nw_path_create_assign_message failed", buf, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
LABEL_45:

LABEL_74:
}

uint64_t __40__NENexus_handleRequestNexusFromClient___block_invoke_184(uint64_t a1)
{
  uint64_t protocol_handler;
  uint64_t result;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  uint8_t buf[2];

  protocol_handler = nw_channel_get_protocol_handler();
  if (protocol_handler)
  {
    result = (**(uint64_t (***)(uint64_t, uint64_t))(protocol_handler + 24))(protocol_handler, objc_msgSend(*(id *)(a1 + 56), "protocol"));
    if ((result & 1) != 0)
      return result;
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 0;
      v5 = "Failed to attach network protocol to user channel";
      v6 = (uint8_t *)&v7;
LABEL_9:
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    }
  }
  else
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v5 = "Could not get channel protocol";
      v6 = buf;
      goto LABEL_9;
    }
  }

  return objc_msgSend(*(id *)(a1 + 40), "closeFlowWithClientIdentifier:", *(_QWORD *)(a1 + 48));
}

uint64_t __40__NENexus_handleRequestNexusFromClient___block_invoke_185(uint64_t a1)
{
  uint64_t protocol_handler;
  uint64_t result;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  uint8_t buf[2];

  protocol_handler = nw_channel_get_protocol_handler();
  if (protocol_handler)
  {
    result = (**(uint64_t (***)(uint64_t, uint64_t))(protocol_handler + 24))(protocol_handler, objc_msgSend(*(id *)(a1 + 56), "protocol"));
    if ((result & 1) != 0)
      return result;
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 0;
      v5 = "Failed to attach network protocol to user channel";
      v6 = (uint8_t *)&v7;
LABEL_9:
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    }
  }
  else
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v5 = "Could not get channel protocol";
      v6 = buf;
      goto LABEL_9;
    }
  }

  return objc_msgSend(*(id *)(a1 + 40), "closeFlowWithClientIdentifier:", *(_QWORD *)(a1 + 48));
}

void __17__NENexus_cancel__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  nw_channel_close();
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "Closed channel for nexus %@ flow manager %@", (uint8_t *)&v5, 0x16u);
  }

}

void __27__NENexus_setupFlowManager__block_invoke()
{
  dword_1EE412CC0 = 4;
  NENexusFlowCallbacks = (uint64_t)nw_nexus_flow_add_input_handler;
  qword_1EE412BD0 = (uint64_t)nw_nexus_flow_input_available;
  unk_1EE412BD8 = nw_nexus_flow_output_available;
  qword_1EE412BE0 = (uint64_t)nw_nexus_flow_get_input_frames;
  unk_1EE412BE8 = nw_nexus_flow_get_output_frames;
  qword_1EE412BF0 = (uint64_t)nw_nexus_flow_finalize_output_frames;
}

@end
