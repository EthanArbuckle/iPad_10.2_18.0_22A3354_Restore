@implementation CKDLogicalDeviceScopedClientProxy

- (CKDLogicalDeviceScopedClientProxy)initWithClientConnection:(id)a3 deviceContext:(id)a4
{
  id v6;
  id v7;
  CKDLogicalDeviceScopedClientProxy *v8;
  CKDLogicalDeviceScopedClientProxy *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKDLogicalDeviceScopedClientProxy;
  v8 = -[CKDLogicalDeviceScopedClientProxy init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_clientConnection, v6);
    objc_storeStrong((id *)&v9->_deviceContext, a4);
    objc_msgSend_xpcConnection(v6, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_pid = objc_msgSend_processIdentifier(v12, v13, v14);

  }
  return v9;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  __CFString *v8;

  objc_msgSend_deviceContext(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDeviceReference(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("testDevice=%@"), v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("defaultDevice");
  }

  return v8;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDLogicalDeviceScopedClientProxy *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (BOOL)processIsAttached
{
  uint64_t v2;

  objc_msgSend_pid(self, a2, v2);
  return CKPIDIsStillAlive();
}

- (void)getLogicalDeviceScopedClientProxySynchronous:(BOOL)a3 errorHandler:(id)a4 clientProxyHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEB69920;
  v13[3] = &unk_1E782F038;
  v16 = v6;
  v14 = v9;
  v15 = v8;
  v10 = v8;
  v11 = v9;
  objc_msgSend__getLogicalDeviceScopedClientProxyCreatorSynchronous_completionHandler_(self, v12, v6, v13);

}

- (void)_getLogicalDeviceScopedClientProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *, _QWORD);
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  _QWORD v21[5];
  void (**v22)(id, void *, _QWORD);

  v4 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend_logicalDeviceScopedClientProxyCreator(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_logicalDeviceScopedClientProxyCreator(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12, 0);

  }
  else
  {
    objc_msgSend_clientConnection(self, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceContext(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testDeviceReference(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1BEB69AD0;
    v21[3] = &unk_1E7834E60;
    v21[4] = self;
    v22 = v6;
    objc_msgSend_getLogicalDeviceScopedClientProxyCreatorForTestDeviceReference_synchronous_completionHandler_(v13, v20, (uint64_t)v19, v4, v21);

  }
}

- (id)openFileWithOpenInfo:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  const char *v12;
  dispatch_time_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  _QWORD v27[4];
  NSObject *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v6 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_1BE9BB0B8;
  v40 = sub_1BE9BAE10;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1BE9BB0B8;
  v34 = sub_1BE9BAE10;
  v35 = 0;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v8 = (void *)MEMORY[0x1C3B83E24]();
  voucher_copy_without_importance();
  voucher_adopt();
  v9 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1BEB6A090;
  v27[3] = &unk_1E782EB60;
  v29 = &v36;
  v28 = v7;
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = sub_1BEB6A0DC;
  v22[3] = &unk_1E7834E88;
  v10 = v6;
  v23 = v10;
  v25 = &v30;
  v26 = &v36;
  v11 = v28;
  v24 = v11;
  objc_msgSend_getLogicalDeviceScopedClientProxySynchronous_errorHandler_clientProxyHandler_(self, v12, 1, v27, v22);

  objc_autoreleasePoolPop(v8);
  v13 = dispatch_time(0, 150000000000);
  if (dispatch_group_wait(v11, v13))
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v14, *MEMORY[0x1E0C94B20], 1000, CFSTR("Daemon timed out waiting for adopter process to open file %@"), v10);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v37[5];
    v37[5] = v15;

    if (a4)
      goto LABEL_3;
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  v18 = (void *)v31[5];
  if (v18)
  {
    v17 = v18;
    goto LABEL_10;
  }
  if (!v37[5])
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v14, *MEMORY[0x1E0C94B20], 1000, CFSTR("Adopter failed to open file %@"), v10);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v37[5];
    v37[5] = v19;

  }
  if (!a4)
    goto LABEL_9;
LABEL_3:
  v17 = 0;
  *a4 = objc_retainAutorelease((id)v37[5]);
LABEL_10:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v17;
}

- (id)readBytesOfInMemoryAssetContentWithUUID:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 error:(id *)a6
{
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  const char *v15;
  dispatch_time_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  uint64_t *v28;
  uint64_t *v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v9 = a3;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_1BE9BB0B8;
  v45 = sub_1BE9BAE10;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_1BE9BB0B8;
  v39 = sub_1BE9BAE10;
  v40 = 0;
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v11 = (void *)MEMORY[0x1C3B83E24]();
  voucher_copy_without_importance();
  voucher_adopt();
  v12 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_1BEB6A4C4;
  v32[3] = &unk_1E782EB60;
  v34 = &v41;
  v33 = v10;
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = sub_1BEB6A510;
  v25[3] = &unk_1E7834EB0;
  v13 = v9;
  v30 = a4;
  v31 = a5;
  v26 = v13;
  v28 = &v35;
  v29 = &v41;
  v14 = v33;
  v27 = v14;
  objc_msgSend_getLogicalDeviceScopedClientProxySynchronous_errorHandler_clientProxyHandler_(self, v15, 1, v32, v25);

  objc_autoreleasePoolPop(v11);
  v16 = dispatch_time(0, 150000000000);
  if (dispatch_group_wait(v14, v16))
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v17, *MEMORY[0x1E0C94B20], 1000, CFSTR("Daemon timed out waiting for adopter to read bytes for %@"), v13);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v42[5];
    v42[5] = v18;

    v20 = 0;
    if (a6)
      *a6 = objc_retainAutorelease((id)v42[5]);
  }
  else
  {
    if (!v36[5])
    {
      if (!v42[5])
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v17, *MEMORY[0x1E0C94B20], 1000, CFSTR("Adopter failed to read bytes for %@"), v13);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v42[5];
        v42[5] = v21;

      }
      if (a6)
        *a6 = objc_retainAutorelease((id)v42[5]);
    }
    v20 = (id)v36[5];
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v20;
}

- (void)resetThrottles
{
  NSObject *v3;
  const char *v4;
  int v5;
  CKDLogicalDeviceScopedClientProxy *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1BE990000, v3, OS_LOG_TYPE_INFO, "Resetting throttles in %@", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend_getLogicalDeviceScopedClientProxySynchronous_errorHandler_clientProxyHandler_(self, v4, 1, &unk_1E7834ED0, &unk_1E7834F10);
}

- (void)addThrottle:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEB6A7B8;
  v7[3] = &unk_1E7834F58;
  v8 = v4;
  v5 = v4;
  objc_msgSend_getLogicalDeviceScopedClientProxySynchronous_errorHandler_clientProxyHandler_(self, v6, 1, &unk_1E7834F30, v7);

}

- (BOOL)hasBeenThrottled
{
  return self->_hasBeenThrottled;
}

- (void)setHasBeenThrottled:(BOOL)a3
{
  self->_hasBeenThrottled = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (CKDXPCConnection)clientConnection
{
  return (CKDXPCConnection *)objc_loadWeakRetained((id *)&self->_clientConnection);
}

- (void)setClientConnection:(id)a3
{
  objc_storeWeak((id *)&self->_clientConnection, a3);
}

- (CKXPCLogicalDeviceScopedClient)logicalDeviceScopedClientProxyCreator
{
  return self->_logicalDeviceScopedClientProxyCreator;
}

- (void)setLogicalDeviceScopedClientProxyCreator:(id)a3
{
  objc_storeStrong((id *)&self->_logicalDeviceScopedClientProxyCreator, a3);
}

- (CKDLogicalDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (void)setDeviceContext:(id)a3
{
  objc_storeStrong((id *)&self->_deviceContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_logicalDeviceScopedClientProxyCreator, 0);
  objc_destroyWeak((id *)&self->_clientConnection);
}

@end
