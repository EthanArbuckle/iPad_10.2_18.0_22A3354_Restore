@implementation SecEscrowRequest

- (SecEscrowRequest)initWithConnection:(id)a3
{
  id v5;
  SecEscrowRequest *v6;
  SecEscrowRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SecEscrowRequest;
  v6 = -[SecEscrowRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SecEscrowRequest connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SecEscrowRequest;
  -[SecEscrowRequest dealloc](&v4, sel_dealloc);
}

- (BOOL)triggerEscrowUpdate:(id)a3 error:(id *)a4
{
  return -[SecEscrowRequest triggerEscrowUpdate:options:error:](self, "triggerEscrowUpdate:options:error:", a3, 0, a4);
}

- (BOOL)triggerEscrowUpdate:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2730;
  v26 = __Block_byref_object_dispose__2731;
  v27 = 0;
  -[SecEscrowRequest connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __54__SecEscrowRequest_triggerEscrowUpdate_options_error___block_invoke;
  v21[3] = &unk_1E1FD8560;
  v21[4] = &v22;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __54__SecEscrowRequest_triggerEscrowUpdate_options_error___block_invoke_82;
  v18[3] = &unk_1E1FCDEF0;
  v20 = &v22;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v12, "triggerEscrowUpdate:options:reply:", v13, v9, v18);
  v14 = v23;
  if (a5)
  {
    v15 = (void *)v23[5];
    if (v15)
    {
      *a5 = objc_retainAutorelease(v15);
      v14 = v23;
    }
  }
  v16 = v14[5] == 0;

  _Block_object_dispose(&v22, 8);
  return v16;
}

- (BOOL)cachePrerecord:(id)a3 serializedPrerecord:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2730;
  v26 = __Block_byref_object_dispose__2731;
  v27 = 0;
  -[SecEscrowRequest connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__SecEscrowRequest_cachePrerecord_serializedPrerecord_error___block_invoke;
  v21[3] = &unk_1E1FD8560;
  v21[4] = &v22;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __61__SecEscrowRequest_cachePrerecord_serializedPrerecord_error___block_invoke_83;
  v18[3] = &unk_1E1FCDEF0;
  v20 = &v22;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v12, "cachePrerecord:serializedPrerecord:reply:", v13, v9, v18);
  v14 = v23;
  if (a5)
  {
    v15 = (void *)v23[5];
    if (v15)
    {
      *a5 = objc_retainAutorelease(v15);
      v14 = v23;
    }
  }
  v16 = v14[5] == 0;

  _Block_object_dispose(&v22, 8);
  return v16;
}

- (id)fetchPrerecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2730;
  v29 = __Block_byref_object_dispose__2731;
  v30 = 0;
  -[SecEscrowRequest connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __41__SecEscrowRequest_fetchPrerecord_error___block_invoke;
  v24[3] = &unk_1E1FD8560;
  v24[4] = &v25;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2730;
  v22 = __Block_byref_object_dispose__2731;
  v23 = 0;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __41__SecEscrowRequest_fetchPrerecord_error___block_invoke_84;
  v14[3] = &unk_1E1FCC308;
  v16 = &v18;
  v17 = &v25;
  v10 = v6;
  v15 = v10;
  objc_msgSend(v9, "fetchPrerecord:reply:", v10, v14);
  if (a4)
  {
    v11 = (void *)v26[5];
    if (v11)
      *a4 = objc_retainAutorelease(v11);
  }
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (id)fetchRequestWaitingOnPasscode:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2730;
  v22 = __Block_byref_object_dispose__2731;
  v23 = 0;
  -[SecEscrowRequest connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__SecEscrowRequest_fetchRequestWaitingOnPasscode___block_invoke;
  v17[3] = &unk_1E1FD8560;
  v17[4] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2730;
  v15 = __Block_byref_object_dispose__2731;
  v16 = 0;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __50__SecEscrowRequest_fetchRequestWaitingOnPasscode___block_invoke_86;
  v10[3] = &unk_1E1FCC330;
  v10[4] = &v11;
  v10[5] = &v18;
  objc_msgSend(v6, "fetchRequestWaitingOnPasscode:", v10);
  if (a3)
  {
    v7 = (void *)v19[5];
    if (v7)
      *a3 = objc_retainAutorelease(v7);
  }
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (id)fetchStatuses:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2730;
  v22 = __Block_byref_object_dispose__2731;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2730;
  v16 = __Block_byref_object_dispose__2731;
  v17 = 0;
  -[SecEscrowRequest connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__SecEscrowRequest_fetchStatuses___block_invoke;
  v11[3] = &unk_1E1FD8560;
  v11[4] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __34__SecEscrowRequest_fetchStatuses___block_invoke_88;
  v10[3] = &unk_1E1FCDF18;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "fetchRequestStatuses:", v10);
  if (a3)
  {
    v7 = (void *)v19[5];
    if (v7)
      *a3 = objc_retainAutorelease(v7);
  }
  v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (BOOL)resetAllRequests:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2730;
  v17 = __Block_byref_object_dispose__2731;
  v18 = 0;
  -[SecEscrowRequest connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__SecEscrowRequest_resetAllRequests___block_invoke;
  v12[3] = &unk_1E1FD8560;
  v12[4] = &v13;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __37__SecEscrowRequest_resetAllRequests___block_invoke_90;
  v11[3] = &unk_1E1FD8560;
  v11[4] = &v13;
  objc_msgSend(v6, "resetAllRequests:", v11);
  v7 = v14;
  if (a3)
  {
    v8 = (void *)v14[5];
    if (v8)
    {
      *a3 = objc_retainAutorelease(v8);
      v7 = v14;
    }
  }
  v9 = v7[5] == 0;

  _Block_object_dispose(&v13, 8);
  return v9;
}

- (unint64_t)storePrerecordsInEscrow:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2730;
  v20 = __Block_byref_object_dispose__2731;
  v21 = 0;
  -[SecEscrowRequest connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__SecEscrowRequest_storePrerecordsInEscrow___block_invoke;
  v15[3] = &unk_1E1FD8560;
  v15[4] = &v16;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __44__SecEscrowRequest_storePrerecordsInEscrow___block_invoke_91;
  v10[3] = &unk_1E1FCC358;
  v10[4] = &v11;
  v10[5] = &v16;
  objc_msgSend(v6, "storePrerecordsInEscrow:", v10);
  if (a3)
  {
    v7 = (void *)v17[5];
    if (v7)
      *a3 = objc_retainAutorelease(v7);
  }
  v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (BOOL)pendingEscrowUpload:(id *)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  -[SecEscrowRequest fetchStatuses:](self, "fetchStatuses:", &v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v20;
  if (v5)
  {
    secLogObjForScope("escrow");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "failed to fetch escrow statuses: %@", buf, 0xCu);
    }

    if (a3)
    {
      v7 = 0;
      *a3 = objc_retainAutorelease(v5);
      goto LABEL_23;
    }
LABEL_20:
    v7 = 0;
    goto LABEL_23;
  }
  if (!v4 || !objc_msgSend(v4, "count"))
    goto LABEL_20;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v15 = v4;
  objc_msgSend(v4, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v7 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("have_prerecord")) & 1) != 0
          || (objc_msgSend(v13, "isEqualToString:", CFSTR("pending_passcode")) & 1) != 0
          || objc_msgSend(v13, "isEqualToString:", CFSTR("pending_certificate")))
        {
          v7 = 1;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v10);
  }
  else
  {
    v7 = 0;
  }

  v4 = v15;
LABEL_23:

  return v7 & 1;
}

- (BOOL)escrowCompletedWithinLastSeconds:(double)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__2730;
  v10[4] = __Block_byref_object_dispose__2731;
  v11 = 0;
  -[SecEscrowRequest connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__SecEscrowRequest_escrowCompletedWithinLastSeconds___block_invoke;
  v9[3] = &unk_1E1FD8560;
  v9[4] = v10;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __53__SecEscrowRequest_escrowCompletedWithinLastSeconds___block_invoke_93;
  v8[3] = &unk_1E1FCDF68;
  v8[4] = &v12;
  v8[5] = v10;
  objc_msgSend(v6, "escrowCompletedWithinLastSeconds:reply:", v8, a3);
  LOBYTE(v4) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __53__SecEscrowRequest_escrowCompletedWithinLastSeconds___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  secLogObjForScope("escrow");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "resetAllRequests: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }

}

void __53__SecEscrowRequest_escrowCompletedWithinLastSeconds___block_invoke_93(uint64_t a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  secLogObjForScope("escrow");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "resetAllRequests: %@", (uint8_t *)&v8, 0xCu);
  }

}

void __44__SecEscrowRequest_storePrerecordsInEscrow___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  secLogObjForScope("escrow");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "fetchRequestWaitingOnPasscode: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }

}

void __44__SecEscrowRequest_storePrerecordsInEscrow___block_invoke_91(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  secLogObjForScope("escrow");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "Stored %d records: %@", (uint8_t *)v8, 0x12u);
  }

}

void __37__SecEscrowRequest_resetAllRequests___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  secLogObjForScope("escrow");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "resetAllRequests: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }

}

void __37__SecEscrowRequest_resetAllRequests___block_invoke_90(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  secLogObjForScope("escrow");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "resetAllRequests: %@", (uint8_t *)&v6, 0xCu);
  }

}

void __34__SecEscrowRequest_fetchStatuses___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  secLogObjForScope("escrow");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "requestStatuses: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }

}

void __34__SecEscrowRequest_fetchStatuses___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  secLogObjForScope("escrow");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "Received statuses: %@ %@", (uint8_t *)&v10, 0x16u);
  }

}

void __50__SecEscrowRequest_fetchRequestWaitingOnPasscode___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  secLogObjForScope("escrow");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "fetchRequestWaitingOnPasscode: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }

}

void __50__SecEscrowRequest_fetchRequestWaitingOnPasscode___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  secLogObjForScope("escrow");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "Received request waiting on passcode: %@ %@", (uint8_t *)&v9, 0x16u);
  }

}

void __41__SecEscrowRequest_fetchPrerecord_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  secLogObjForScope("escrow");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "fetchprerecord: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }

}

void __41__SecEscrowRequest_fetchPrerecord_error___block_invoke_84(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  secLogObjForScope("escrow");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[4];
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "Received prerecord for %@: %@", (uint8_t *)&v10, 0x16u);
  }

}

void __61__SecEscrowRequest_cachePrerecord_serializedPrerecord_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  secLogObjForScope("escrow");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "cachePrerecord: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }

}

void __61__SecEscrowRequest_cachePrerecord_serializedPrerecord_error___block_invoke_83(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  secLogObjForScope("escrow");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "Cached prerecord for %@: %@", (uint8_t *)&v7, 0x16u);
  }

}

void __54__SecEscrowRequest_triggerEscrowUpdate_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  secLogObjForScope("escrow");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "triggerEscrowUpdate: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }

}

void __54__SecEscrowRequest_triggerEscrowUpdate_options_error___block_invoke_82(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  secLogObjForScope("escrow");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "Triggered escrow update for '%@': %@", (uint8_t *)&v7, 0x16u);
  }

}

+ (id)request:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.security.escrow-update"), 0);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF88AA8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SecEscrowRequestSetupControlProtocol(v5);
    objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setRemoteObjectInterface:", v5);
    objc_msgSend(v4, "resume");
    a3 = -[SecEscrowRequest initWithConnection:]([SecEscrowRequest alloc], "initWithConnection:", v4);

  }
  else if (a3)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = CFSTR("Couldn't create connection (no reason given)");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("securityd"), -1, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }

  return a3;
}

@end
