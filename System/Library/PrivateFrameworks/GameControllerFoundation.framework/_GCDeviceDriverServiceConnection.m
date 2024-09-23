@implementation _GCDeviceDriverServiceConnection

+ (Protocol)serviceProtocol
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)connectionToServiceInDriver:(id)a3 withClient:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_GCDeviceDriverServiceConnection.m"), 35, CFSTR("Invalid parameter not satisfying: %s"), "driverConnection != nil");

    if (v9)
      goto LABEL_3;
LABEL_5:
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_GCDeviceDriverServiceConnection.m"), 36, CFSTR("Invalid parameter not satisfying: %s"), "client != nil");

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a1, "serviceProtocol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectToDeviceService:withClient:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75___GCDeviceDriverServiceConnection_connectionToServiceInDriver_withClient___block_invoke;
  v17[3] = &unk_1EA4D33E0;
  v18 = v7;
  v19 = a1;
  v12 = v7;
  objc_msgSend(v11, "thenSynchronouslyWithResult:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (_GCDeviceDriverServiceConnection)initWithDriverConnection:(id)a3 serviceVendor:(id)a4
{
  id v8;
  id v9;
  _GCDeviceDriverServiceConnection *v10;
  uint64_t v11;
  NSArray *invalidationHandlers;
  _GCDeviceDriverServiceConnection *v13;
  _GCDeviceDriverServiceConnection *v14;
  void (**v15)(_QWORD);
  uint64_t v16;
  id driverConnectionInterruptionObserver;
  uint64_t v18;
  id driverConnectionInvalidationObserver;
  _GCDeviceDriverServiceConnection *v20;
  void *v22;
  void *v23;
  _QWORD aBlock[4];
  _GCDeviceDriverServiceConnection *v25;
  _GCDeviceDriverServiceConnection *v26;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_GCDeviceDriverServiceConnection;
  v10 = -[_GCDeviceDriverServiceConnection init](&v27, sel_init);
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("_GCDeviceDriverServiceConnection.m"), 48, CFSTR("Invalid parameter not satisfying: %s"), "driverConnection != nil");

    if (v9)
      goto LABEL_3;
LABEL_8:
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("_GCDeviceDriverServiceConnection.m"), 49, CFSTR("Invalid parameter not satisfying: %s"), "serviceVendor != nil");

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_8;
LABEL_3:
  objc_storeStrong((id *)&v10->_driverConnection, a3);
  objc_storeStrong(&v10->_serviceVendor, a4);
  v11 = objc_opt_new();
  invalidationHandlers = v10->_invalidationHandlers;
  v10->_invalidationHandlers = (NSArray *)v11;

  atomic_store(0, (unsigned __int8 *)&v10->_invalid);
  v13 = v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75___GCDeviceDriverServiceConnection_initWithDriverConnection_serviceVendor___block_invoke;
  aBlock[3] = &unk_1EA4D2E58;
  v25 = v13;
  v14 = v25;
  v26 = v14;
  v15 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[_GCDeviceDriverConnection addInterruptionHandler:](v10->_driverConnection, "addInterruptionHandler:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  driverConnectionInterruptionObserver = v14->_driverConnectionInterruptionObserver;
  v14->_driverConnectionInterruptionObserver = (id)v16;

  -[_GCDeviceDriverConnection addInvalidationHandler:](v10->_driverConnection, "addInvalidationHandler:", v15);
  v18 = objc_claimAutoreleasedReturnValue();
  driverConnectionInvalidationObserver = v14->_driverConnectionInvalidationObserver;
  v14->_driverConnectionInvalidationObserver = (id)v18;

  if (!v14->_driverConnectionInterruptionObserver || !v14->_driverConnectionInvalidationObserver)
    v15[2](v15);
  v20 = v14;

  return v20;
}

- (id)invalidationHandlers
{
  if (result)
    return objc_getProperty(result, a2, 48, 1);
  return result;
}

- (BOOL)isInvalid
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_invalid);
  return v2 & 1;
}

- (id)addInvalidationHandler:(id)a3
{
  void *v4;
  _GCDeviceDriverServiceConnection *v5;
  const char *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  SEL v11;
  _GCDisposable *v12;
  _GCDisposable *v13;
  _QWORD v15[5];
  id v16;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = self;
  objc_sync_enter(v5);
  v7 = atomic_load((unsigned __int8 *)&v5->_invalid);
  if ((v7 & 1) != 0)
  {
    objc_sync_exit(v5);

    v13 = 0;
  }
  else
  {
    v8 = objc_getProperty(v5, v6, 48, 1);
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v10 = _Block_copy(v4);
    objc_msgSend(v9, "addObject:", v10);

    objc_setProperty_atomic_copy(v5, v11, v9, 48);
    objc_sync_exit(v5);

    v12 = [_GCDisposable alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59___GCDeviceDriverServiceConnection_addInvalidationHandler___block_invoke;
    v15[3] = &unk_1EA4D3408;
    v15[4] = v5;
    v16 = v4;
    v13 = -[_GCDisposable initWithCleanupHandler:](v12, "initWithCleanupHandler:", v15);

  }
  return v13;
}

- (void)setInvalidationHandlers:(void *)a1
{
  if (a1)
    objc_setProperty_atomic_copy(a1, newValue, newValue, 48);
}

- (void)scheduleSendBarrierBlock:(id)a3
{
  -[_GCDeviceDriverConnection scheduleSendBarrierBlock:](self->_driverConnection, "scheduleSendBarrierBlock:", a3);
}

- (id)serviceVendorRequestWithLabel:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  _GCDeviceDriverServiceConnection *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = -[GCOperation initOnQueue:withOptions:]([GCOperation alloc], "initOnQueue:withOptions:", 0, 0);
  objc_msgSend(v8, "setLabel:", v7);

  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke;
  v20[3] = &unk_1EA4D3480;
  v20[4] = self;
  v10 = v6;
  v21 = v10;
  objc_msgSend(v8, "setSyncBlock:", v20);
  v14 = v9;
  v15 = 3221225472;
  v16 = __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_3;
  v17 = &unk_1EA4D34F8;
  v18 = self;
  v19 = v10;
  v11 = v10;
  objc_msgSend(v8, "setAsyncBlock:", &v14);
  objc_msgSend(v8, "activate", v14, v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)serviceVendorRequestWithHandler:(id)a3
{
  return -[_GCDeviceDriverServiceConnection serviceVendorRequestWithLabel:handler:](self, "serviceVendorRequestWithLabel:handler:", 0, a3);
}

- (id)serviceVendor
{
  if (result)
    return objc_getProperty(result, a2, 32, 1);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationHandlers, 0);
  objc_storeStrong(&self->_serviceVendor, 0);
  objc_storeStrong(&self->_driverConnectionInvalidationObserver, 0);
  objc_storeStrong(&self->_driverConnectionInterruptionObserver, 0);
  objc_storeStrong((id *)&self->_driverConnection, 0);
}

@end
