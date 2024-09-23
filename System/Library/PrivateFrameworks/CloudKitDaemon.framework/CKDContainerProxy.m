@implementation CKDContainerProxy

- (CKDContainerProxy)initWithAppContainerTuple:(id)a3 entitlements:(id)a4 options:(id)a5 distantContainer:(id)a6 connection:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  CKDAppContainerTuple *v18;
  CKDAppContainerTuple *appContainerTuple;
  const char *v20;
  uint64_t v21;
  CKEntitlements *v22;
  CKEntitlements *entitlements;
  const char *v24;
  uint64_t v25;
  CKContainerOptions *v26;
  CKContainerOptions *options;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  CKDLogicalDeviceScopedClientProxy *v34;
  CKDLogicalDeviceScopedClientProxy *logicalDeviceScopedClientProxy;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  double v42;
  id v43;
  const char *v44;
  CKCoalescer *v45;
  CKCoalescer *coalescer;
  id v48;
  _QWORD v49[4];
  id v50;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v48 = a6;
  v15 = a7;
  v18 = (CKDAppContainerTuple *)objc_msgSend_copy(v12, v16, v17);
  appContainerTuple = self->_appContainerTuple;
  self->_appContainerTuple = v18;

  v22 = (CKEntitlements *)objc_msgSend_copy(v13, v20, v21);
  entitlements = self->_entitlements;
  self->_entitlements = v22;

  v26 = (CKContainerOptions *)objc_msgSend_copy(v14, v24, v25);
  options = self->_options;
  self->_options = v26;

  objc_storeStrong((id *)&self->_distantContainer, a6);
  objc_storeWeak((id *)&self->_connection, v15);
  objc_msgSend_testDeviceReferenceProtocol(v14, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceContextForTestDeviceReference_(CKDLogicalDeviceContext, v31, (uint64_t)v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_logicalDeviceScopedClientProxyForDeviceContext_(v15, v33, (uint64_t)v32);
  v34 = (CKDLogicalDeviceScopedClientProxy *)objc_claimAutoreleasedReturnValue();
  logicalDeviceScopedClientProxy = self->_logicalDeviceScopedClientProxy;
  self->_logicalDeviceScopedClientProxy = v34;

  objc_initWeak(&location, self);
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerProxyInactiveTimeoutWithDefaultValue_(v38, v39, v40, 60.0);
  v42 = v41;

  v43 = objc_alloc(MEMORY[0x1E0C94C08]);
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = sub_1BEAE8D80;
  v49[3] = &unk_1E7833190;
  objc_copyWeak(&v50, &location);
  v45 = (CKCoalescer *)objc_msgSend_initWithActivityDelay_maxActivityDelay_coalescingInterval_processingDelay_notifyBlock_(v43, v44, (unint64_t)(v42 * 1000000000.0), 0, 0, 0, v49);
  coalescer = self->_coalescer;
  self->_coalescer = v45;

  objc_destroyWeak(&v50);
  objc_destroyWeak(&location);

  return self;
}

- (void)dealloc
{
  NSObject *v3;
  unint64_t accessCount;
  objc_super v5;
  uint8_t buf[4];
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self && self->_accessCount)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v3 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      accessCount = self->_accessCount;
      *(_DWORD *)buf = 134217984;
      v7 = accessCount;
      _os_log_error_impl(&dword_1BE990000, v3, OS_LOG_TYPE_ERROR, "Deallocating proxy without being discardable (%tu)", buf, 0xCu);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CKDContainerProxy;
  -[CKDContainerProxy dealloc](&v5, sel_dealloc);
}

- (CKDContainer)container
{
  CKDContainerProxy *v2;
  const char *v3;
  uint64_t v4;
  void *WeakRetained;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  CKDLogicalDeviceScopedClientProxy *logicalDeviceScopedClientProxy;
  CKDLogicalDeviceScopedClientProxy *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  __int16 v31[8];

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_container);
  if (!WeakRetained)
  {
    objc_msgSend_connection(v2, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v7 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v31[0] = 0;
        _os_log_debug_impl(&dword_1BE990000, v7, OS_LOG_TYPE_DEBUG, "Creating proxied container", (uint8_t *)v31, 2u);
      }
      objc_msgSend_appContainerTuple(v2, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_processScopedClientProxy(v6, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
        logicalDeviceScopedClientProxy = v2->_logicalDeviceScopedClientProxy;
      else
        logicalDeviceScopedClientProxy = 0;
      v15 = logicalDeviceScopedClientProxy;
      objc_msgSend_entitlements(v2, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_options(v2, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedContainers(v6, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_sharedContainerTable_(CKDContainer, v25, (uint64_t)v10, v13, v15, v18, v21, v24);
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_distantContainer(v2, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_linkWithClientContainer_(WeakRetained, v29, (uint64_t)v28);

      objc_storeWeak((id *)&v2->_container, WeakRetained);
    }
    else
    {
      WeakRetained = 0;
    }

  }
  objc_sync_exit(v2);

  return (CKDContainer *)WeakRetained;
}

- (Class)class
{
  void *v2;
  CKDContainerProxy *v3;
  id WeakRetained;

  v3 = self;
  objc_sync_enter(v3);
  WeakRetained = objc_loadWeakRetained((id *)&v3->_container);
  if (WeakRetained)
  {
    objc_opt_class();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_sync_exit(v3);
  if (!WeakRetained)
  {
    objc_opt_class();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v2;
}

- (BOOL)isKindOfClass:(Class)a3
{
  char isKindOfClass;
  CKDContainerProxy *v4;
  id WeakRetained;

  v4 = self;
  objc_sync_enter(v4);
  WeakRetained = objc_loadWeakRetained((id *)&v4->_container);
  if (WeakRetained)
    isKindOfClass = objc_opt_isKindOfClass();

  objc_sync_exit(v4);
  if (!WeakRetained)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  char isMemberOfClass;
  CKDContainerProxy *v5;
  id WeakRetained;
  const char *v7;
  void *v8;
  void *v10;
  const char *v11;

  v5 = self;
  objc_sync_enter(v5);
  WeakRetained = objc_loadWeakRetained((id *)&v5->_container);
  v8 = WeakRetained;
  if (WeakRetained)
    isMemberOfClass = objc_msgSend_isMemberOfClass_(WeakRetained, v7, (uint64_t)a3);

  objc_sync_exit(v5);
  if (v8)
    return isMemberOfClass & 1;
  v10 = (void *)objc_opt_class();
  return objc_msgSend_isMemberOfClass_(v10, v11, (uint64_t)a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  char v3;
  id v5;
  CKDContainerProxy *v6;
  id WeakRetained;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  WeakRetained = objc_loadWeakRetained((id *)&v6->_container);
  v9 = WeakRetained;
  if (WeakRetained)
    v3 = objc_msgSend_conformsToProtocol_(WeakRetained, v8, (uint64_t)v5);

  objc_sync_exit(v6);
  if (!v9)
  {
    v10 = (void *)objc_opt_class();
    v3 = objc_msgSend_conformsToProtocol_(v10, v11, (uint64_t)v5);
  }

  return v3 & 1;
}

+ (Class)class
{
  return (Class)objc_opt_class();
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, const char *);
  void *v37;
  id v38;
  CKDContainerProxy *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_retainArguments(v4, v5, v6);
  objc_msgSend_container(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v10 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v26 = v10;
    v29 = (const char *)objc_msgSend_selector(v4, v27, v28);
    NSStringFromSelector(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(v9, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v41 = v30;
    v42 = 2112;
    v43 = v33;
    _os_log_debug_impl(&dword_1BE990000, v26, OS_LOG_TYPE_DEBUG, "Forwarding -%@ to container: %@", buf, 0x16u);

  }
  objc_msgSend_methodSignature(v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CK_indexesOfBlockArguments(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = MEMORY[0x1E0C809B0];
  v35 = 3221225472;
  v36 = sub_1BEAE96B4;
  v37 = &unk_1E78331E0;
  v38 = v4;
  v39 = self;
  v17 = v4;
  objc_msgSend_enumerateIndexesUsingBlock_(v16, v18, (uint64_t)&v34);
  objc_msgSend_setTarget_(v17, v19, (uint64_t)v9, v34, v35, v36, v37);
  objc_msgSend_beginContentAccess(self, v20, v21);
  objc_msgSend_invoke(v17, v22, v23);
  objc_msgSend_endContentAccess(self, v24, v25);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *name;
  objc_method_description MethodDescription;

  MethodDescription = protocol_getMethodDescription((Protocol *)&unk_1EF59FF58, a3, 1, 1);
  name = (void *)MethodDescription.name;
  if (MethodDescription.name)
  {
    objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], MethodDescription.types, (uint64_t)MethodDescription.types);
    name = (void *)objc_claimAutoreleasedReturnValue();
  }
  return name;
}

- (void)beginContentAccess:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = objc_msgSend_beginContentAccess(self, v4, v5);
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, v6, 0);
    v7 = v8;
  }

}

- (void)isContentDiscarded:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t isContentDiscarded;
  id v8;

  if (a3)
  {
    v8 = a3;
    isContentDiscarded = objc_msgSend_isContentDiscarded(self, v5, v6);
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(v8, isContentDiscarded, 0);

  }
}

- (BOOL)beginContentAccess
{
  CKCoalescer *coalescer;
  CKCoalescer *v4;
  const char *v5;
  char v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (self)
    coalescer = self->_coalescer;
  else
    coalescer = 0;
  v4 = coalescer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BEAE999C;
  v8[3] = &unk_1E7833208;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend_coalesce_(v4, v5, (uint64_t)v8);

  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)endContentAccess
{
  CKCoalescer *coalescer;
  _QWORD v3[5];

  if (self)
    coalescer = self->_coalescer;
  else
    coalescer = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BEAE9A8C;
  v3[3] = &unk_1E782EA40;
  v3[4] = self;
  objc_msgSend_coalesce_(coalescer, a2, (uint64_t)v3);
}

- (void)discardContentIfPossible
{
  CKCoalescer *coalescer;
  _QWORD v3[5];

  if (self)
    coalescer = self->_coalescer;
  else
    coalescer = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BEAE9B1C;
  v3[3] = &unk_1E782EA40;
  v3[4] = self;
  objc_msgSend_mutate_(coalescer, a2, (uint64_t)v3);
}

- (BOOL)isContentDiscarded
{
  CKCoalescer *coalescer;
  CKCoalescer *v4;
  const char *v5;
  char v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  if (self)
    coalescer = self->_coalescer;
  else
    coalescer = 0;
  v12 = 0;
  v4 = coalescer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BEAE9BF4;
  v8[3] = &unk_1E78303D8;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend_mutate_(v4, v5, (uint64_t)v8);

  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)CKStatusReportArray
{
  CKCoalescer *coalescer;
  CKCoalescer *v4;
  const char *v5;
  CKDContainerProxy *v6;
  id WeakRetained;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  if (self)
    coalescer = self->_coalescer;
  else
    coalescer = 0;
  v28 = 0;
  v4 = coalescer;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1BEAE9DB8;
  v24[3] = &unk_1E78303D8;
  v24[4] = self;
  v24[5] = &v25;
  objc_msgSend_mutate_(v4, v5, (uint64_t)v24);

  v6 = self;
  objc_sync_enter(v6);
  WeakRetained = objc_loadWeakRetained((id *)&v6->_container);
  objc_sync_exit(v6);

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_appContainerTuple(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationID(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v9, v16, (uint64_t)CFSTR("\n \"%@\"(accessCount: %tu)"), v15, v26[3]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v18, (uint64_t)v17);

  if (WeakRetained)
  {
    objc_msgSend_CKStatusReportArray(WeakRetained, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v8, v22, (uint64_t)v21);

  }
  _Block_object_dispose(&v25, 8);
  return v8;
}

- (CKDAppContainerTuple)appContainerTuple
{
  return self->_appContainerTuple;
}

- (CKEntitlements)entitlements
{
  return self->_entitlements;
}

- (CKContainerOptions)options
{
  return self->_options;
}

- (CKXPCContainerScopedClient)distantContainer
{
  return self->_distantContainer;
}

- (CKDXPCConnection)connection
{
  return (CKDXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong((id *)&self->_logicalDeviceScopedClientProxy, 0);
  objc_storeStrong((id *)&self->_strongContainer, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_distantContainer, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_appContainerTuple, 0);
  objc_destroyWeak((id *)&self->_container);
}

@end
