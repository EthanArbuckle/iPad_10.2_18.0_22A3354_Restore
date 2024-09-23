@implementation KVXPCClient

- (KVXPCClient)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (KVXPCClient)initWithServiceProtocol:(id)a3 machServiceName:(id)a4 clientId:(id)a5 interruptionCode:(unsigned __int16)a6 invalidationCode:(unsigned __int16)a7
{
  uint64_t v7;
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  KVXPCClient *v15;
  void **p_isa;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  KVXPCClient *v43;
  objc_super v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v7 = a7;
  v8 = a6;
  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v45.receiver = self;
  v45.super_class = (Class)KVXPCClient;
  v15 = -[KVXPCClient init](&v45, sel_init);
  p_isa = (void **)&v15->super.isa;
  if (v15)
  {
    v15->_failureCode = 0;
    v15->_interruptionCode = v8;
    objc_storeStrong((id *)&v15->_clientId, a5);
    v17 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v19 = objc_msgSend_initWithMachServiceName_options_(v17, v18, (uint64_t)v13, 0);
    v20 = p_isa[2];
    p_isa[2] = (void *)v19;

    if (!p_isa[2]
      || (objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v21, (uint64_t)v12, v22),
          (v23 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v43 = 0;
      goto LABEL_9;
    }
    v26 = (void *)v23;
    objc_msgSend_setRemoteObjectInterface_(p_isa[2], v24, v23, v25);
    v27 = p_isa[2];
    objc_msgSend__failureHandlerWithResponse_(p_isa, v28, v8, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInterruptionHandler_(v27, v31, (uint64_t)v30, v32);

    v33 = p_isa[2];
    objc_msgSend__failureHandlerWithResponse_(p_isa, v34, v7, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInvalidationHandler_(v33, v37, (uint64_t)v36, v38);

    v39 = qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "-[KVXPCClient initWithServiceProtocol:machServiceName:clientId:interruptionCode:invalidationCode:]";
      v48 = 2112;
      v49 = v14;
      _os_log_impl(&dword_1B70E7000, v39, OS_LOG_TYPE_INFO, "%s Client %@ connecting to XPC service", buf, 0x16u);
    }
    objc_msgSend_resume(p_isa[2], v40, v41, v42);

  }
  v43 = p_isa;
LABEL_9:

  return v43;
}

- (void)dealloc
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_DEBUG))
  {
    v7 = v3;
    objc_msgSend_clientId(self, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v14 = "-[KVXPCClient dealloc]";
    v15 = 2112;
    v16 = v11;
    _os_log_debug_impl(&dword_1B70E7000, v7, OS_LOG_TYPE_DEBUG, "%s Invalidating XPC connection for client %@", buf, 0x16u);

  }
  objc_msgSend_invalidate(self->_connection, v4, v5, v6);
  v12.receiver = self;
  v12.super_class = (Class)KVXPCClient;
  -[KVXPCClient dealloc](&v12, sel_dealloc);
}

- (id)_failureHandlerWithResponse:(unsigned __int16)a3
{
  void *v4;
  _QWORD v6[4];
  id v7;
  unsigned __int16 v8;
  id location;

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1B70F3EFC;
  v6[3] = &unk_1E6B7AD48;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  v4 = (void *)MEMORY[0x1BCCA2CD0](v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B70F3DB0;
  v8[3] = &unk_1E6B7AD70;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1BCCA2CD0](v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

- (void)serviceRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, void *, id);
  const char *v9;
  void *v10;
  id v11;

  v6 = a3;
  v11 = a4;
  v8 = (void (**)(id, void *, id))a5;
  objc_msgSend__remoteObjectProxy_errorCompletion_(self, v9, v6, (uint64_t)v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v8[2](v8, v10, v11);

}

- (void)serviceOptionsRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *, id);
  id v10;
  const char *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, id))a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1B70F3D98;
  v13[3] = &unk_1E6B7AD98;
  v10 = v8;
  v14 = v10;
  objc_msgSend__remoteObjectProxy_errorCompletion_(self, v11, v6, (uint64_t)v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v9[2](v9, v12, v10);

}

- (void)serviceVersionRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *, id);
  id v10;
  const char *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, id))a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1B70F3D80;
  v13[3] = &unk_1E6B7AD98;
  v10 = v8;
  v14 = v10;
  objc_msgSend__remoteObjectProxy_errorCompletion_(self, v11, v6, (uint64_t)v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v9[2](v9, v12, v10);

}

- (void)serviceArrayRespondingRequestWithCompletion:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  id v8;
  const char *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B70F3D64;
  v11[3] = &unk_1E6B7AD98;
  v8 = v6;
  v12 = v8;
  objc_msgSend__remoteObjectProxy_errorCompletion_(self, v9, 1, (uint64_t)v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v7[2](v7, v10, v8);

}

- (id)_remoteObjectProxy:(BOOL)a3 errorCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t);
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  objc_msgSend__errorHandlerWithCompletion_(self, v7, (uint64_t)v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connection(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  if (v4)
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v13, v14, (uint64_t)v9, v15);
  else
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v13, v14, (uint64_t)v9, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !v17)
  {
    v21 = objc_msgSend_failureCode(self, v18, v19, v20);
    v6[2](v6, v21);
  }

  return v17;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)failureCode
{
  return self->_failureCode;
}

- (void)setFailureCode:(unsigned __int16)a3
{
  self->_failureCode = a3;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (unsigned)interruptionCode
{
  return self->_interruptionCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (void)initialize
{
  if (qword_1ED114580 != -1)
    dispatch_once(&qword_1ED114580, &unk_1E6B7B4A0);
}

@end
