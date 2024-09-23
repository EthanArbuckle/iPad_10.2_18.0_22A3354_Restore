@implementation NEFlowNexus

- (NEFlowNexus)initWithName:(id)a3 delegate:(id)a4
{
  NEFlowNexus *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  SEL v7;
  SEL v8;
  id v9;
  SEL v10;
  SEL v11;
  const char *v12;
  void *v13;
  SEL v14;
  void *v15;
  SEL v16;
  SEL v17;
  void *v18;
  SEL v19;
  void *v20;
  SEL v21;
  void *v22;
  int v23;
  ssize_t v24;
  const __CFAllocator *v25;
  void *v26;
  SEL v27;
  void *v28;
  int v29;
  ssize_t v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  NEPolicy *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NEPolicy *v42;
  const char *v43;
  void *v44;
  _BOOL4 v45;
  const char *v46;
  void *v47;
  int v48;
  NSMutableSet *v49;
  NSMutableSet *browseAssertions;
  NEFlowNexus *v51;
  NSObject *v52;
  const char *v53;
  int *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  int *v59;
  char *v60;
  objc_super v61;
  uint8_t v62[8];
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v65;
  id v66[2];
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint8_t v71[8];
  uint64_t v72;
  void (*v73)(uint64_t, const void *, void *);
  void *v74;
  id v75[2];
  uint8_t buf[4];
  char *v77;
  __int16 v78;
  char *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v61.receiver = self;
  v61.super_class = (Class)NEFlowNexus;
  v4 = -[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:](&v61, sel_initWithLevel_name_virtualInterfaceType_delegate_channelCount_, 4, a3, 1, a4, 0);
  if (!v4)
  {
    ne_log_obj();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v71 = 0;
      _os_log_fault_impl(&dword_19BD16000, v33, OS_LOG_TYPE_FAULT, "[super initWithLevel:name:delegate:] failed", v71, 2u);
    }
    goto LABEL_40;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("FlowDivertDirector", v5);
  objc_setProperty_atomic(v4, v7, v6, 176);

  if (!objc_getProperty(v4, v8, 176, 1))
  {
    ne_log_obj();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v32 = "dispatch_queue_create failed";
    goto LABEL_15;
  }
  v9 = -[NEFlowDivertFileHandle initFlowDivertControlSocket]([NEFlowDivertFileHandle alloc], "initFlowDivertControlSocket");
  objc_setProperty_atomic(v4, v10, v9, 168);

  if (!objc_getProperty(v4, v11, 168, 1))
  {
    ne_log_obj();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v32 = "[NEFlowDivertFileHandle initFlowDivertControlSocket] failed";
    goto LABEL_15;
  }
  objc_msgSend(objc_getProperty(v4, v12, 168, 1), "controlUnit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_flowDivertControlUnit = objc_msgSend(v13, "unsignedIntValue");

  objc_msgSend(objc_getProperty(v4, v14, 168, 1), "keyMaterial");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(v4, v16, v15, 184);

  objc_msgSend(objc_getProperty(v4, v17, 168, 1), "handle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fileDescriptor");
  objc_getProperty(v4, v19, 176, 1);
  v4->_flowDivertDirector = (_NEFlowDirector *)NEFlowDirectorCreate();

  if (!v4->_flowDivertDirector)
  {
    ne_log_obj();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v32 = "NEFlowDirectorCreate failed";
LABEL_15:
    _os_log_fault_impl(&dword_19BD16000, v31, OS_LOG_TYPE_FAULT, v32, buf, 2u);
LABEL_16:

    ne_log_obj();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v71 = 0;
      _os_log_fault_impl(&dword_19BD16000, v33, OS_LOG_TYPE_FAULT, "setupFlowDivertDirector failed", v71, 2u);
    }
    goto LABEL_40;
  }
  v70 = 0;
  v68 = 0;
  v69 = 0;
  v67 = 0;
  v20 = (void *)NEFlowTLVMsgCreate();
  NEFlowTLVAdd();
  objc_msgSend(objc_getProperty(v4, v21, 168, 1), "handle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "fileDescriptor");
  v24 = send(v23, v20, v67 - v69, 0);

  if (v24 < 0)
  {
    ne_log_obj();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v55 = __error();
      v56 = strerror(*v55);
      *(_DWORD *)buf = 136315138;
      v77 = v56;
      _os_log_error_impl(&dword_19BD16000, v34, OS_LOG_TYPE_ERROR, "Failed to send a FLOW_DIVERT_PKT_APP_MAP_CREATE message: %s", buf, 0xCu);
    }

    if (v20)
      CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v20);
  }
  else
  {
    v25 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v20);
    v70 = 1;
    v26 = (void *)NEFlowTLVMsgCreate();
    NEFlowTLVAdd();
    NEFlowTLVAdd();
    objc_msgSend(objc_getProperty(v4, v27, 168, 1), "handle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "fileDescriptor");
    v30 = send(v29, v26, v67 - v69, 0);

    if (v30 >= 0)
    {
      if (!v26)
        goto LABEL_27;
      goto LABEL_26;
    }
    ne_log_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v57 = v67;
      v58 = v69;
      v59 = __error();
      v60 = strerror(*v59);
      *(_DWORD *)buf = 134218242;
      v77 = (char *)(v57 - v58);
      v78 = 2080;
      v79 = v60;
      _os_log_error_impl(&dword_19BD16000, v35, OS_LOG_TYPE_ERROR, "Failed to send a FLOW_DIVERT_PKT_APP_MAP_CREATE with size %lu bytes: %s", buf, 0x16u);
    }

    if (v26)
LABEL_26:
      CFAllocatorDeallocate(v25, v26);
  }
LABEL_27:
  objc_initWeak((id *)buf, v4);
  v36 = MEMORY[0x1E0C809B0];
  *(_QWORD *)v71 = MEMORY[0x1E0C809B0];
  v72 = 3221225472;
  v73 = __38__NEFlowNexus_setupFlowDivertDirector__block_invoke;
  v74 = &unk_1E3CC06A8;
  objc_copyWeak(v75, (id *)buf);
  NEFlowDirectorSetNewFlowCallback();
  *(_QWORD *)v62 = v36;
  v63 = 3221225472;
  v64 = __38__NEFlowNexus_setupFlowDivertDirector__block_invoke_2;
  v65 = &unk_1E3CC06D0;
  objc_copyWeak(v66, (id *)buf);
  NEFlowDirectorSetMatchRulesCallback();
  NEFlowDirectorStart();
  objc_destroyWeak(v66);
  objc_destroyWeak(v75);
  objc_destroyWeak((id *)buf);
  v37 = [NEPolicy alloc];
  +[NEPolicyResult divertSocketToControlUnit:](NEPolicyResult, "divertSocketToControlUnit:", v4->_flowDivertControlUnit);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NENexus interfaceName](v4, "interfaceName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[NEPolicyCondition scopedInterface:](NEPolicyCondition, "scopedInterface:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v71 = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[NEPolicy initWithOrder:result:conditions:](v37, "initWithOrder:result:conditions:", 0, v38, v41);

  if (!v42)
  {
    ne_log_obj();
    v52 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      goto LABEL_38;
    *(_WORD *)v62 = 0;
    v53 = "[NEPolicy initWithOrder:result:conditions:] failed";
    goto LABEL_37;
  }
  objc_getProperty(v4, v43, 120, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "addPolicy:", v42) == 0;

  if (v45)
  {
    ne_log_obj();
    v52 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      goto LABEL_38;
    *(_WORD *)v62 = 0;
    v53 = "[NEPolicySession addPolicy:] failed";
    goto LABEL_37;
  }
  objc_getProperty(v4, v46, 120, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "apply");

  if ((v48 & 1) == 0)
  {
    ne_log_obj();
    v52 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      goto LABEL_38;
    *(_WORD *)v62 = 0;
    v53 = "[NEPolicySession apply] failed";
LABEL_37:
    _os_log_fault_impl(&dword_19BD16000, v52, OS_LOG_TYPE_FAULT, v53, v62, 2u);
LABEL_38:

    ne_log_obj();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v71 = 0;
      _os_log_fault_impl(&dword_19BD16000, v33, OS_LOG_TYPE_FAULT, "setupFlowDivertDirector failed", v71, 2u);
    }
LABEL_40:

    v51 = 0;
    goto LABEL_41;
  }

  v49 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  browseAssertions = v4->_browseAssertions;
  v4->_browseAssertions = v49;

  v51 = v4;
LABEL_41:

  return v51;
}

- (void)dealloc
{
  objc_super v3;

  if (self && self->_flowDivertDirector)
  {
    NEFlowDirectorDestroy();
    self->_flowDivertDirector = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NEFlowNexus;
  -[NENexus dealloc](&v3, sel_dealloc);
}

- (void)setRemoteConnectionDirector:(id)a3
{
  if (self)
    objc_setProperty_atomic(self, a2, a3, 192);
}

- (void)setSupportsBrowseRequests:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  SEL v6;
  id Property;
  const char *v8;
  id v9;
  SEL v10;
  id v11;
  id v12;

  v3 = a3;
  self->_supportsBrowseRequests = a3;
  v5 = objc_getProperty(self, a2, 128, 1);
  objc_msgSend(v5, "setSupportsBrowseRequests:", v3);

  Property = objc_getProperty(self, v6, 128, 1);
  v12 = Property;
  if (Property)
    Property = objc_getProperty(Property, v8, 32, 1);
  v9 = Property;
  v11 = objc_getProperty(self, v10, 128, 1);
  objc_msgSend(v9, "updateNetworkAgent:", v11);

}

- (BOOL)setDiscoveredEndpoints:(id)a3 forClient:(id)a4
{
  id v6;
  const char *v7;
  char *v8;
  id Property;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t browse_result;
  const char *v18;
  void *v19;
  NEFlowNexus *v20;
  const char *v21;
  NEFlowNexus *v22;
  void *v23;
  char v24;
  BOOL v25;
  NSObject *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v8 = (char *)a4;
  if (!v8)
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[NEFlowNexus setDiscoveredEndpoints:forClient:]";
      _os_log_fault_impl(&dword_19BD16000, v10, OS_LOG_TYPE_FAULT, "%s called with null clientID", buf, 0xCu);
    }
    goto LABEL_28;
  }
  if (self)
    Property = objc_getProperty(self, v7, 200, 1);
  else
    Property = 0;
  if ((objc_msgSend(Property, "containsObject:", v8) & 1) == 0)
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "Client %@ has not asserted browse, cannot assign discovered endpoints", buf, 0xCu);
    }
    goto LABEL_28;
  }
  if (objc_msgSend(v6, "count"))
  {
    v10 = nw_array_create();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "copyCEndpoint");
          nw_array_append();

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

  }
  else
  {
    v10 = 0;
  }
  browse_result = nw_path_create_browse_result();
  if (!browse_result)
  {
    ne_log_obj();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, v26, OS_LOG_TYPE_FAULT, "nw_path_create_browse_result failed", buf, 2u);
    }
    goto LABEL_27;
  }
  v19 = (void *)browse_result;
  if (self)
  {
    v20 = (NEFlowNexus *)objc_getProperty(self, v18, 128, 1);
    self = v20;
    if (v20)
      v20 = (NEFlowNexus *)objc_getProperty(v20, v21, 32, 1);
  }
  else
  {
    v20 = 0;
  }
  v22 = v20;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v19, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[NEFlowNexus assignNexusData:toClient:](v22, "assignNexusData:toClient:", v23, v8);

  free(v19);
  if ((v24 & 1) == 0)
  {
    ne_log_obj();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_error_impl(&dword_19BD16000, v26, OS_LOG_TYPE_ERROR, "Could not assign browse result to client %@", buf, 0xCu);
    }
LABEL_27:

LABEL_28:
    v25 = 0;
    goto LABEL_29;
  }
  v25 = 1;
LABEL_29:

  return v25;
}

- (void)handleAssertFromClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  id Property;
  NSObject *v9;
  id WeakRetained;
  SEL v11;
  id v12;
  NENexusBrowse *v13;
  char v14;
  void *v15;
  void *v16;
  const char *v17;
  id v18;
  id v19;
  objc_super v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NEFlowNexus;
  -[NENexus handleAssertFromClient:](&v20, sel_handleAssertFromClient_, v4);
  objc_msgSend(MEMORY[0x1E0CCECA8], "pathForClientID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v4;
      _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "Failed to get path for assert client %@", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "hasBrowseDescriptor"))
  {
    if (self)
      Property = objc_getProperty(self, v7, 200, 1);
    else
      Property = 0;
    v9 = Property;
    objc_sync_enter(v9);
    if (self)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
      v12 = objc_getProperty(self, v11, 200, 1);
    }
    else
    {
      WeakRetained = 0;
      v12 = 0;
    }
    v13 = (NENexusBrowse *)v12;
    if ((-[NENexusBrowse containsObject:](v13, "containsObject:", v4) & 1) == 0)
    {
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0)
      {
LABEL_13:

        objc_sync_exit(v9);
LABEL_16:

        goto LABEL_17;
      }
      v13 = objc_alloc_init(NENexusBrowse);
      -[NENexusBrowse setClientIdentifier:](v13, "setClientIdentifier:", v4);
      objc_msgSend(v6, "browseDescriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NENexusBrowse setDescriptor:](v13, "setDescriptor:", v15);

      objc_msgSend(v6, "parameters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NENexusBrowse setParameters:](v13, "setParameters:", v16);

      objc_msgSend(WeakRetained, "startBrowse:fromNexus:", v13, self);
      if (self)
        v18 = objc_getProperty(self, v17, 200, 1);
      else
        v18 = 0;
      v19 = v18;
      objc_msgSend(v19, "addObject:", v4);

    }
    goto LABEL_13;
  }
LABEL_17:

}

- (void)handleUnassertFromClient:(id)a3
{
  id v4;
  const char *v5;
  id Property;
  id v7;
  const char *v8;
  id v9;
  id v10;
  int v11;
  id WeakRetained;
  NENexusBrowse *v13;
  const char *v14;
  id v15;
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NEFlowNexus;
  -[NENexus handleUnassertFromClient:](&v17, sel_handleUnassertFromClient_, v4);
  if (self)
    Property = objc_getProperty(self, v5, 200, 1);
  else
    Property = 0;
  v7 = Property;
  objc_sync_enter(v7);
  if (self)
    v9 = objc_getProperty(self, v8, 200, 1);
  else
    v9 = 0;
  v10 = v9;
  v11 = objc_msgSend(v10, "containsObject:", v4);

  if (v11)
  {
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    else
      WeakRetained = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = objc_alloc_init(NENexusBrowse);
      -[NENexusBrowse setClientIdentifier:](v13, "setClientIdentifier:", v4);
      objc_msgSend(WeakRetained, "stopBrowse:fromNexus:", v13, self);

    }
    -[NEFlowNexus setDiscoveredEndpoints:forClient:](self, "setDiscoveredEndpoints:forClient:", 0, v4);
    if (self)
      v15 = objc_getProperty(self, v14, 200, 1);
    else
      v15 = 0;
    v16 = v15;
    objc_msgSend(v16, "removeObject:", v4);

  }
  objc_sync_exit(v7);

}

- (BOOL)supportsBrowseRequests
{
  return self->_supportsBrowseRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browseAssertions, 0);
  objc_storeStrong((id *)&self->_connectionDirector, 0);
  objc_storeStrong((id *)&self->_flowDivertTokenHMACKey, 0);
  objc_storeStrong((id *)&self->_flowDivertQueue, 0);
  objc_storeStrong((id *)&self->_flowDivertControl, 0);
}

void __38__NEFlowNexus_setupFlowDivertDirector__block_invoke(uint64_t a1, const void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  NENexusFlowDivertFlow *v7;
  NSObject *p_super;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id *p_isa;
  SEL v31;
  id v32;
  id WeakRetained;
  id *v34;
  NSObject *v35;
  id *self;
  uint8_t buf[16];
  objc_super v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  id *v41;
  id *v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 32);
  v5 = a3;
  self = (id *)objc_loadWeakRetained(v4);
  v6 = v5;
  if (!self)
    goto LABEL_26;
  v7 = [NENexusFlowDivertFlow alloc];
  if (!v7)
  {
    p_isa = 0;
    goto LABEL_23;
  }
  p_super = &v7->super.super;
  if (a2)
  {
    v38.receiver = v7;
    v38.super_class = (Class)NENexusFlowDivertFlow;
    v9 = objc_msgSendSuper2(&v38, sel_init);
    if (v9)
    {
      v10 = v9;
      v9[8] = CFRetain(a2);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)*((_QWORD *)v10 + 5);
      *((_QWORD *)v10 + 5) = v11;

      -[NENexusFlow setupFlowProtocolWithUUID:](v10, *((void **)v10 + 5));
      v13 = (void *)NEFlowCopyProperty();
      v14 = (void *)NEFlowCopyProperty();
      v15 = isa_nsstring(v14);
      v16 = isa_nsdata(v13);
      if (v15)
      {
        if (v16 && (v17 = objc_msgSend(objc_retainAutorelease(v13), "bytes")) != 0)
        {
          v18 = *(unsigned __int8 *)(v17 + 1);
          if (v18 == 30 || v18 == 2)
            v19 = *(unsigned __int16 *)(v17 + 2);
          else
            v19 = 0;
          v22 = __rev16(v19);
        }
        else
        {
          v22 = 0;
        }
        v23 = (void *)MEMORY[0x1E0CCEC80];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "endpointWithHostname:port:", v14, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)*((_QWORD *)v10 + 6);
        *((_QWORD *)v10 + 6) = v25;

      }
      else
      {
        if (!v16)
        {
LABEL_18:
          v27 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
          v28 = (void *)*((_QWORD *)v10 + 7);
          *((_QWORD *)v10 + 7) = v27;

          if (NEFlowGetFlowType() == 1)
            v29 = 2;
          else
            v29 = 1;
          objc_msgSend(*((id *)v10 + 7), "setDataMode:", v29);
          p_super = v10;

          p_isa = (id *)&p_super->isa;
          goto LABEL_22;
        }
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", objc_msgSend(objc_retainAutorelease(v13), "bytes"));
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)*((_QWORD *)v10 + 6);
        *((_QWORD *)v10 + 6) = v20;
      }

      goto LABEL_18;
    }
    ne_log_obj();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }
  else
  {
    ne_log_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v38.receiver) = 136315138;
      *(id *)((char *)&v38.receiver + 4) = "-[NENexusFlowDivertFlow initWithFlowDivertFlow:]";
      _os_log_fault_impl(&dword_19BD16000, v35, OS_LOG_TYPE_FAULT, "%s called with null flowDivertFlow", (uint8_t *)&v38, 0xCu);
    }

  }
  p_isa = 0;
LABEL_22:

LABEL_23:
  objc_msgSend(p_isa, "setState:", 1);
  v32 = objc_getProperty(self, v31, 112, 1);
  if (p_isa)
    objc_storeWeak(p_isa + 4, v32);

  WeakRetained = objc_loadWeakRetained(self + 17);
  v38.receiver = (id)MEMORY[0x1E0C809B0];
  v38.super_class = (Class)3221225472;
  v39 = __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke;
  v40 = &unk_1E3CC0680;
  v41 = p_isa;
  v43 = v6;
  v42 = self;
  v34 = p_isa;
  objc_msgSend(WeakRetained, "acceptNewFlow:fromNexus:completionHandler:", v34, self, &v38);

LABEL_26:
}

void __38__NEFlowNexus_setupFlowDivertDirector__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v6;
  id WeakRetained;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = a4;
    _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_INFO, "Allowing flow from %@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  NEFlowDirectorHandleMatchRulesResult();

}

void __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  char v16;
  const char *v17;
  id Property;
  uint64_t v19;
  const char *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  const char *v27;
  id v28;
  id v29;
  id v30;
  id v31[5];
  id v32;
  id v33[5];
  id v34;
  id location[6];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
      objc_getProperty(v5, v3, 176, 1);
    NEFlowSetDispatchQueue();
    objc_msgSend(v4, "localEndpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0
      || (objc_msgSend(v4, "localEndpoint"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "addressData"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = NEFlowSetProperty(),
          v9,
          v8,
          v10))
    {
      objc_initWeak(location, *(id *)(a1 + 40));
      v11 = (void *)MEMORY[0x1E0C809B0];
      v33[1] = (id)MEMORY[0x1E0C809B0];
      v33[2] = (id)3221225472;
      v33[3] = __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_26;
      v33[4] = &unk_1E3CC0630;
      v34 = *(id *)(a1 + 32);
      v12 = NEFlowSetEventHandler();
      v31[1] = v11;
      v31[2] = (id)3221225472;
      v31[3] = __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_2;
      v31[4] = &unk_1E3CC0658;
      v32 = *(id *)(a1 + 32);
      objc_copyWeak(v33, location);
      v13 = NEFlowSetEventHandler();
      v30 = *(id *)(a1 + 32);
      objc_copyWeak(v31, location);
      v14 = NEFlowSetEventHandler();
      if (v12)
      {
        if (v13)
          v15 = v14 == 0;
        else
          v15 = 1;
        v16 = !v15;
        objc_destroyWeak(v31);

        objc_destroyWeak(v33);
        objc_destroyWeak(location);
        if ((v16 & 1) != 0)
        {
          if (NEFlowOpen())
          {
            v19 = *(_QWORD *)(a1 + 32);
            Property = *(id *)(a1 + 40);
            if (Property)
              Property = objc_getProperty(Property, v17, 144, 1);
            v21 = Property;
            v22 = *(void **)(a1 + 32);
            if (v22)
              v23 = objc_getProperty(v22, v20, 40, 1);
            else
              v23 = 0;
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, v23);

            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            goto LABEL_26;
          }
          ne_log_obj();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v29 = *(id *)(a1 + 32);
            if (v29)
              v29 = objc_getProperty(v29, v27, 40, 1);
            LODWORD(location[0]) = 138412290;
            *(id *)((char *)location + 4) = v29;
            _os_log_error_impl(&dword_19BD16000, v26, OS_LOG_TYPE_ERROR, "NEFlowOpen failed for client %@", (uint8_t *)location, 0xCu);
          }

        }
      }
      else
      {
        objc_destroyWeak(v31);

        objc_destroyWeak(v33);
        objc_destroyWeak(location);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
    NEFlowSetEventHandler();
    NEFlowSetEventHandler();
    NEFlowSetEventHandler();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_26;
  }
  ne_log_obj();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v28 = *(id *)(a1 + 32);
    if (v28)
      v28 = objc_getProperty(v28, v25, 40, 1);
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v28;
    _os_log_debug_impl(&dword_19BD16000, v24, OS_LOG_TYPE_DEBUG, "Rejecting new flow for client %@", (uint8_t *)location, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_26:

}

uint64_t __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
}

void __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  const char *v4;
  id v5;
  void *v6;
  id Property;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
  NEFlowSetEventHandler();
  NEFlowSetEventHandler();
  NEFlowSetEventHandler();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
    WeakRetained = objc_getProperty(WeakRetained, v3, 144, 1);
  v5 = WeakRetained;
  v6 = *(void **)(a1 + 32);
  if (v6)
    Property = objc_getProperty(v6, v4, 40, 1);
  else
    Property = 0;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, Property);

}

void __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  const char *v4;
  id v5;
  void *v6;
  id Property;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
  NEFlowSetEventHandler();
  NEFlowSetEventHandler();
  NEFlowSetEventHandler();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
    WeakRetained = objc_getProperty(WeakRetained, v3, 144, 1);
  v5 = WeakRetained;
  v6 = *(void **)(a1 + 32);
  if (v6)
    Property = objc_getProperty(v6, v4, 40, 1);
  else
    Property = 0;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, Property);

}

@end
