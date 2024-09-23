@implementation CKOperationCallbackProxy

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  Protocol *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  SEL name;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id *v25;
  id v26;
  id v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  id v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  _QWORD v79[4];
  id *v80;
  id v81;
  id v82;
  _QWORD aBlock[4];
  id v84;
  id v85;
  CKOperationCallbackProxy *v86;
  objc_super v87;

  v4 = a3;
  objc_msgSend_retainArguments(v4, v5, v6, v7);
  objc_msgSend_callbackProtocol(self, v8, v9, v10);
  v11 = (Protocol *)objc_claimAutoreleasedReturnValue();
  v15 = (const char *)objc_msgSend_selector(v4, v12, v13, v14);
  name = protocol_getMethodDescription(v11, v15, 1, 1).name;

  if (name)
  {
    objc_msgSend_weakObject(self, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_18A6E5D80;
    aBlock[3] = &unk_1E1F614E0;
    v22 = v20;
    v84 = v22;
    v23 = v4;
    v85 = v23;
    v86 = self;
    v24 = _Block_copy(aBlock);
    v79[0] = v21;
    v79[1] = 3221225472;
    v79[2] = sub_18A6E5FA8;
    v79[3] = &unk_1E1F61508;
    v25 = (id *)v22;
    v80 = v25;
    v26 = v24;
    v82 = v26;
    v27 = v23;
    v81 = v27;
    v28 = _Block_copy(v79);
    v32 = v28;
    if (v25)
    {
      v76 = v26;
      v77 = v28;
      objc_msgSend_methodSignature(v27, v29, v30, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend_numberOfArguments(v33, v34, v35, v36) >= 3)
      {
        v40 = 2;
        do
        {
          v41 = objc_retainAutorelease(v33);
          if (*(_BYTE *)objc_msgSend_getArgumentTypeAtIndex_(v41, v42, v40, v43) == 64)
          {
            v78 = 0;
            objc_msgSend_getArgument_atIndex_(v27, v44, (uint64_t)&v78, v40);
            v47 = v78;
            objc_msgSend_configuration(v25, v48, v49, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_container(v51, v52, v53, v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_containerID(v55, v56, v57, v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_CKAssignToContainerWithID_(v47, v60, (uint64_t)v59, v61);

          }
          ++v40;
        }
        while (v40 < objc_msgSend_numberOfArguments(v41, v44, v45, v46));
      }
      if (__sTestOverridesAvailable)
      {
        objc_msgSend_unitTestOverrides(v25, v37, v38, v39);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v62, v63, (uint64_t)CFSTR("CancelOnProgressCallback"), v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend_BOOLValue(v65, v66, v67, v68);

        if (v69)
          objc_msgSend_cancel(v25, v37, v38, v39);
      }
      if (__ROR8__(objc_msgSend_qualityOfService(v25, v37, v38, v39) - 9, 3) >= 4uLL)
      {
        v70 = v25[60];
        v71 = dispatch_block_create_with_voucher();
      }
      else
      {
        v70 = v25[60];
        v71 = dispatch_block_create_with_voucher_and_qos_class();
      }
      v32 = (void *)v71;
      v26 = v76;

      objc_msgSend_callbackQueue(v25, v72, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      ck_call_or_dispatch_async_if_not_key(v75, kCKOperationCallbackQueueName, v32);

    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v29, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, CFSTR("Weak operation went nil before proxy could forward invocation to it"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v26 + 2))(v26, v33);
    }

  }
  else
  {
    v87.receiver = self;
    v87.super_class = (Class)CKOperationCallbackProxy;
    -[CKWeakObjectCallbackProxy forwardInvocation:](&v87, sel_forwardInvocation_, v4);
  }

}

- (CKOperationCallbackProxy)initWithOperation:(id)a3 callbackProtocol:(id)a4
{
  id v6;
  CKOperationCallbackProxy *v7;
  uint64_t v8;
  Class cls;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSHashTable *connections;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKOperationCallbackProxy;
  v7 = -[CKWeakObjectCallbackProxy initWithWeakObject:callbackProtocol:](&v16, sel_initWithWeakObject_callbackProtocol_, v6, a4);
  if (v7)
  {
    objc_opt_class();
    v8 = objc_claimAutoreleasedReturnValue();
    cls = v7->_cls;
    v7->_cls = (Class)v8;

    objc_msgSend_weakObjectsHashTable(MEMORY[0x1E0CB3690], v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    connections = v7->_connections;
    v7->_connections = (NSHashTable *)v13;

  }
  return v7;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_invalidate(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)CKOperationCallbackProxy;
  -[CKOperationCallbackProxy dealloc](&v5, sel_dealloc);
}

- (NSXPCListener)listener
{
  CKOperationCallbackProxy *v2;
  NSXPCListener *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_listener;
  objc_sync_exit(v2);

  return v3;
}

- (CKOperationCallbackProxyEndpoint)endpoint
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  CKOperationCallbackProxyEndpoint *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;

  objc_msgSend_listener(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [CKOperationCallbackProxyEndpoint alloc];
    v10 = objc_msgSend_cls(self, v7, v8, v9);
    objc_msgSend_callbackProtocol(self, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endpoint(v5, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend_initWithClass_protocol_endpoint_(v6, v19, v10, (uint64_t)v14, v18);

  }
  else
  {
    v20 = 0;
  }

  return (CKOperationCallbackProxyEndpoint *)v20;
}

- (void)activate
{
  CKOperationCallbackProxy *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSXPCListener *listener;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_listener)
  {
    objc_msgSend_anonymousListener(MEMORY[0x1E0CB3B58], v3, v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v6;

    objc_msgSend_setDelegate_(v2->_listener, v8, (uint64_t)v2, v9);
  }
  objc_sync_exit(v2);

  objc_msgSend_listener(v2, v10, v11, v12);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activate(v16, v13, v14, v15);

}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend_listener(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v5, v6, v7, v8);

  objc_msgSend_connections(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v12);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend_connections(self, v13, v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v16);
        objc_msgSend_invalidate(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v23++), v18, v19, v20);
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v21);
  }

  objc_sync_exit(v12);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;

  v6 = a3;
  v7 = a4;
  objc_msgSend_endpoint(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interface(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExportedInterface_(v7, v16, (uint64_t)v15, v17);

  objc_msgSend_setExportedObject_(v7, v18, (uint64_t)self, v19);
  objc_msgSend_weakObject(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v23;
  if (v23)
  {
    objc_msgSend_callbackQueue(v23, v24, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setQueue_(v7, v29, (uint64_t)v28, v30);

  }
  objc_msgSend_connections(self, v24, v25, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v31);
  objc_msgSend_connections(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v35, v36, (uint64_t)v7, v37);

  objc_sync_exit(v31);
  objc_msgSend_resume(v7, v38, v39, v40);

  return 1;
}

- (Class)cls
{
  return self->_cls;
}

- (NSHashTable)connections
{
  return self->_connections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_cls, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
