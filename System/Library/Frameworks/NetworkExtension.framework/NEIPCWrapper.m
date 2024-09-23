@implementation NEIPCWrapper

void __43__NEIPCWrapper_initWithSession_identifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NEIPC *v5;
  void *v6;
  id v7;
  const char *v8;
  id Property;
  id v10;
  _xpc_endpoint_s *v11;
  id v12;
  _QWORD *v13;
  NEIPC *v14;
  SEL v15;
  xpc_connection_t v16;
  SEL v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id location;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (v3)
  {
    v5 = objc_alloc_init(NEIPC);
    v6 = *(void **)(a1 + 32);
    v7 = objc_initWeak(&location, v6);
    if (v6)
      Property = objc_getProperty(v6, v8, 16, 1);
    else
      Property = 0;
    v10 = Property;
    v22[1] = 3221225472;
    v22[2] = __43__NEIPCWrapper_initWithSession_identifier___block_invoke_2;
    v22[3] = &unk_1E3CC3A58;
    v22[0] = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v23, &location);
    v11 = (_xpc_endpoint_s *)v3;
    v12 = v10;
    v13 = v22;
    if (v5)
    {
      v14 = v5;
      objc_sync_enter(v14);
      objc_setProperty_atomic_copy(v14, v15, v13, 8);
      v16 = xpc_connection_create_from_endpoint(v11);
      objc_setProperty_atomic(v14, v17, v16, 16);

      -[NEIPC setupMessageHandlingWithQueue:](v14, v12);
      objc_sync_exit(v14);

    }
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 24);
    *(_QWORD *)(v18 + 24) = v5;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    -[NEIPCWrapper cancel](*(void **)(a1 + 32));
  }
  v21 = *(NSObject **)(a1 + 32);
  if (v21)
    v21 = objc_getProperty(v21, v20, 8, 1);
  dispatch_resume(v21);
  objc_sync_exit(v4);

}

void __43__NEIPCWrapper_initWithSession_identifier___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[NEIPCWrapper cancel](WeakRetained);

  }
}

- (void)cancel
{
  id v2;
  void *v3;
  SEL v4;
  id v5;
  void *v6;
  _QWORD *obj;

  if (a1)
  {
    v2 = (id)wrapperMap;
    objc_sync_enter(v2);
    v3 = (void *)wrapperMap;
    v5 = objc_getProperty(a1, v4, 32, 1);
    objc_msgSend(v3, "removeObjectForKey:", v5);

    objc_sync_exit(v2);
    obj = a1;
    objc_sync_enter(obj);
    v6 = (void *)obj[3];
    obj[3] = 0;

    objc_sync_exit(obj);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ipc, 0);
  objc_storeStrong((id *)&self->_ipcQueue, 0);
  objc_storeStrong((id *)&self->_sendQueue, 0);
}

void __40__NEIPCWrapper_sharedWrapperForSession___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)wrapperMap;
  wrapperMap = (uint64_t)v0;

}

@end
