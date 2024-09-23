@implementation CKXPCConnection

- (void)getContainerScopedDaemonProxyCreatorForContainerSetupInfo:(id)a3 exportedProxy:(id)a4 synchronous:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  const char *v16;
  _QWORD aBlock[4];
  id v18;

  v6 = a5;
  v10 = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18A815594;
  aBlock[3] = &unk_1E1F60910;
  v18 = v10;
  v11 = v10;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  sub_18A5D0628(self, v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getContainerScopedDaemonProxyCreatorForSetupInfo_containerScopedClientProxy_completionHandler_(v15, v16, (uint64_t)v13, (uint64_t)v12, v11);

}

+ (CKXPCConnection)sharedXPCConnection
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_18A5F2FAC;
  v3[3] = &unk_1E1F65A48;
  v3[4] = a2;
  v3[5] = a1;
  if (qword_1ECD96F48 != -1)
    dispatch_once(&qword_1ECD96F48, v3);
  return (CKXPCConnection *)(id)qword_1ECD96F50;
}

- (id)initInternal
{
  CKXPCConnection *v2;
  CKProcessScopedDaemonProxy *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CKProcessScopedDaemonProxy *processScopedDaemonProxy;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKXPCConnection;
  v2 = -[CKXPCConnection init](&v9, sel_init);
  if (v2)
  {
    v3 = [CKProcessScopedDaemonProxy alloc];
    v6 = objc_msgSend_initWithConnection_(v3, v4, (uint64_t)v2, v5);
    processScopedDaemonProxy = v2->_processScopedDaemonProxy;
    v2->_processScopedDaemonProxy = (CKProcessScopedDaemonProxy *)v6;

  }
  return v2;
}

- (void)getProcessScopedClientProxyCreatorWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  objc_msgSend_sharedManager(CKProcessScopedStateManager, v5, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v4, v8);

}

+ (NSXPCInterface)CKXPCDaemonToClientMuxerInterface
{
  if (qword_1ECD96F70 != -1)
    dispatch_once(&qword_1ECD96F70, &unk_1E1F59818);
  return (NSXPCInterface *)(id)qword_1ECD96F68;
}

+ (NSXPCInterface)CKXPCClientToDaemonMuxerInterface
{
  if (qword_1ECD96F60 != -1)
    dispatch_once(&qword_1ECD96F60, &unk_1E1F59098);
  return (NSXPCInterface *)(id)qword_1ECD96F58;
}

- (void)dealloc
{
  CKXPCConnection *v2;
  NSMutableArray *invalidationCompletionHandlers;
  NSMutableArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  if (v2)
    invalidationCompletionHandlers = v2->_invalidationCompletionHandlers;
  else
    invalidationCompletionHandlers = 0;
  v4 = invalidationCompletionHandlers;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v11, (uint64_t)v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v9, (uint64_t)&v11, (uint64_t)v15, 16);
    }
    while (v6);
  }

  objc_sync_exit(v2);
  v10.receiver = v2;
  v10.super_class = (Class)CKXPCConnection;
  -[CKXPCConnection dealloc](&v10, sel_dealloc);
}

- (int)processIdentifier
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_18A8152F0(self, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_processIdentifier(v2, v3, v4, v5);

  return v6;
}

- (void)getProcessScopedDaemonProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  id v17;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18A815448;
  aBlock[3] = &unk_1E1F60910;
  v8 = v6;
  v17 = v8;
  v9 = _Block_copy(aBlock);
  sub_18A5D0628(self, v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = sub_18A81545C;
  v14[3] = &unk_1E1F61690;
  v15 = v8;
  v11 = v8;
  objc_msgSend_getProcessScopedDaemonProxyCreatorWithCompletionHandler_(v10, v12, (uint64_t)v14, v13);

}

- (void)getLogicalDeviceScopedDaemonProxyCreatorForTestDeviceReferenceProtocol:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[4];
  id v19;

  v5 = a4;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18A815570;
  aBlock[3] = &unk_1E1F60910;
  v10 = v8;
  v19 = v10;
  v11 = a3;
  v12 = _Block_copy(aBlock);
  sub_18A5D0628(self, v5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = sub_18A815584;
  v16[3] = &unk_1E1F667C0;
  v17 = v10;
  v14 = v10;
  objc_msgSend_getLogicalDeviceScopedDaemonProxyCreatorForTestDeviceReferenceProtocol_completionHandler_(v13, v15, (uint64_t)v11, (uint64_t)v16);

}

- (void)getDaemonTestServerManagerProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  _QWORD aBlock[4];
  id v23;

  v4 = a3;
  v10 = a4;
  if (!__sTestOverridesAvailable)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)self, CFSTR("CKXPCConnection.m"), 95, CFSTR("Test hooks aren't supported in this process"));

  }
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18A8156EC;
  aBlock[3] = &unk_1E1F60910;
  v12 = v10;
  v23 = v12;
  v13 = _Block_copy(aBlock);
  sub_18A5D0628(self, v4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = sub_18A815700;
  v20[3] = &unk_1E1F667E8;
  v21 = v12;
  v15 = v12;
  objc_msgSend_getDaemonTestServerManagerProxyCreatorWithCompletionHandler_(v14, v16, (uint64_t)v20, v17);

}

- (void)getLogicalDeviceScopedClientProxyCreatorForTestDeviceReferenceProtocol:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, id);
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v5 = (void (**)(id, id))a4;
  objc_msgSend_deviceContextForTestDeviceReferenceProtocol_(CKLogicalDeviceContext, v6, (uint64_t)a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceScopedStateManager(v8, v9, v10, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v12);
}

- (void)activate
{
  id v2;

  v2 = sub_18A5D0830(self);
}

- (void)invalidate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CKXPCConnection *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *invalidationCompletionHandlers;
  void *v14;
  NSMutableArray *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v19 = 0;
  sub_18A8152F0(self, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (v4)
    {
      v9 = self;
      objc_sync_enter(v9);
      if (!v9 || (invalidationCompletionHandlers = v9->_invalidationCompletionHandlers) == 0)
      {
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18A815920((uint64_t)v9, v14);

        if (v9)
          invalidationCompletionHandlers = v9->_invalidationCompletionHandlers;
        else
          invalidationCompletionHandlers = 0;
      }
      v15 = invalidationCompletionHandlers;
      v16 = _Block_copy(v4);
      objc_msgSend_addObject_(v15, v17, (uint64_t)v16, v18);

      objc_sync_exit(v9);
    }
    objc_msgSend_invalidate(v8, v5, v6, v7);
  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (CKProcessScopedDaemonProxy)processScopedDaemonProxy
{
  return self->_processScopedDaemonProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_processScopedDaemonProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
