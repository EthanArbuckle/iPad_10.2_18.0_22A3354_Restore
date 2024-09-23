@implementation AMFIConnection

- (AMFIConnection)init
{
  AMFIConnection *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMFIConnection;
  v2 = -[AMFIConnection init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.amfi.nsxpc"), 4096);
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0476478);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection resume](v2->connection, "resume");
  }
  return v2;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->connection, "invalidate");
  connection = self->connection;
  self->connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)AMFIConnection;
  -[AMFIConnection dealloc](&v4, sel_dealloc);
}

+ (id)newConnection
{
  return objc_alloc_init(AMFIConnection);
}

- (id)initiateDataMigration
{
  uint64_t v2;
  NSXPCConnection *connection;
  void *v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v2 = MEMORY[0x1E0C809B0];
  connection = self->connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__AMFIConnection_initiateDataMigration__block_invoke;
  v8[3] = &unk_1EA986C10;
  v8[4] = &v9;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __39__AMFIConnection_initiateDataMigration__block_invoke_32;
  v7[3] = &unk_1EA986C10;
  v7[4] = &v9;
  objc_msgSend(v4, "initiateDataMigrationWithReply:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __39__AMFIConnection_initiateDataMigration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __39__AMFIConnection_initiateDataMigration__block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __39__AMFIConnection_initiateDataMigration__block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (v3)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__AMFIConnection_initiateDataMigration__block_invoke_32_cold_1();

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (id)initiateDeveloperModeDaemons
{
  uint64_t v2;
  NSXPCConnection *connection;
  void *v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v2 = MEMORY[0x1E0C809B0];
  connection = self->connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke;
  v8[3] = &unk_1EA986C10;
  v8[4] = &v9;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_33;
  v7[3] = &unk_1EA986C10;
  v7[4] = &v9;
  objc_msgSend(v4, "initiateDeveloperModeDaemonsWithReply:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (v3)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_33_cold_1();

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- ($E0E7E7FD564019D5BF0FF602771CD47C)getSEPStateWithError:(SEL)a3
{
  uint64_t v6;
  NSXPCConnection *connection;
  void *v8;
  uint64_t *v9;
  __int128 v10;
  $E0E7E7FD564019D5BF0FF602771CD47C *result;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x5810000000;
  v23 = &unk_1DF30AB13;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v6 = MEMORY[0x1E0C809B0];
  connection = self->connection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__AMFIConnection_getSEPStateWithError___block_invoke;
  v13[3] = &unk_1EA986C10;
  v13[4] = &v14;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __39__AMFIConnection_getSEPStateWithError___block_invoke_35;
  v12[3] = &unk_1EA986C38;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v8, "getSEPStateWithReply:", v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v9 = v21;
  v10 = *((_OWORD *)v21 + 3);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v21 + 2);
  *(_OWORD *)&retstr->var3.var1.var0 = v10;
  *(_OWORD *)&retstr->var3.var1.var1[12] = *((_OWORD *)v9 + 4);
  retstr->var3.var1.var1[28] = *((_BYTE *)v9 + 80);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return result;
}

void __39__AMFIConnection_getSEPStateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __39__AMFIConnection_getSEPStateWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

__n128 __39__AMFIConnection_getSEPStateWithError___block_invoke_35(uint64_t a1, __int128 *a2, id obj)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  *(_BYTE *)(v3 + 80) = *((_BYTE *)a2 + 48);
  *(_OWORD *)(v3 + 48) = v5;
  *(_OWORD *)(v3 + 64) = v6;
  *(_OWORD *)(v3 + 32) = v4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  return result;
}

- (id)signTeamID:(id)a3 withSignType:(unsigned int)a4 withLAContext:(id)a5 withError:(id *)a6
{
  uint64_t v8;
  id v10;
  id v11;
  uint64_t v12;
  NSXPCConnection *connection;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v12 = MEMORY[0x1E0C809B0];
  connection = self->connection;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke;
  v18[3] = &unk_1EA986C10;
  v18[4] = &v25;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke_37;
  v17[3] = &unk_1EA986C60;
  v17[4] = &v19;
  v17[5] = &v25;
  objc_msgSend(v14, "signTeamID:withSignType:withLAContext:withReply:", v10, v8, v11, v17);

  if (a6)
    *a6 = objc_retainAutorelease((id)v26[5]);
  v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)stageProfileForUuid:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  connection = self->connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__AMFIConnection_stageProfileForUuid___block_invoke;
  v11[3] = &unk_1EA986C10;
  v11[4] = &v12;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __38__AMFIConnection_stageProfileForUuid___block_invoke_39;
  v10[3] = &unk_1EA986C10;
  v10[4] = &v12;
  objc_msgSend(v7, "stageProfileForUuid:withReply:", v4, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __38__AMFIConnection_stageProfileForUuid___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__AMFIConnection_stageProfileForUuid___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __38__AMFIConnection_stageProfileForUuid___block_invoke_39(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getStagedProfileWithError:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v4 = MEMORY[0x1E0C809B0];
  connection = self->connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__AMFIConnection_getStagedProfileWithError___block_invoke;
  v10[3] = &unk_1EA986C10;
  v10[4] = &v17;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __44__AMFIConnection_getStagedProfileWithError___block_invoke_40;
  v9[3] = &unk_1EA986C88;
  v9[4] = &v11;
  v9[5] = &v17;
  objc_msgSend(v6, "getStagedProfileWithReply:", v9);

  if (a3)
    *a3 = objc_retainAutorelease((id)v18[5]);
  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __44__AMFIConnection_getStagedProfileWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __44__AMFIConnection_getStagedProfileWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __44__AMFIConnection_getStagedProfileWithError___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)commitProfileForUuid:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  connection = self->connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__AMFIConnection_commitProfileForUuid___block_invoke;
  v11[3] = &unk_1EA986C10;
  v11[4] = &v12;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __39__AMFIConnection_commitProfileForUuid___block_invoke_42;
  v10[3] = &unk_1EA986C10;
  v10[4] = &v12;
  objc_msgSend(v7, "commitProfileForUuid:withReply:", v4, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __39__AMFIConnection_commitProfileForUuid___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __39__AMFIConnection_commitProfileForUuid___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __39__AMFIConnection_commitProfileForUuid___block_invoke_42(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)setTrustForUuid:(id)a3 withSignature:(id)a4 withSignType:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  uint64_t v10;
  NSXPCConnection *connection;
  void *v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v10 = MEMORY[0x1E0C809B0];
  connection = self->connection;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke;
  v16[3] = &unk_1EA986C10;
  v16[4] = &v17;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke_43;
  v15[3] = &unk_1EA986C10;
  v15[4] = &v17;
  objc_msgSend(v12, "setTrustForUuid:withSignature:withSignType:withReply:", v8, v9, v5, v15);

  v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke_43(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)removeTrustforUuid:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  connection = self->connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__AMFIConnection_removeTrustforUuid___block_invoke;
  v11[3] = &unk_1EA986C10;
  v11[4] = &v12;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __37__AMFIConnection_removeTrustforUuid___block_invoke_44;
  v10[3] = &unk_1EA986C10;
  v10[4] = &v12;
  objc_msgSend(v7, "removeTrustforUuid:withReply:", v4, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __37__AMFIConnection_removeTrustforUuid___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __37__AMFIConnection_removeTrustforUuid___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __37__AMFIConnection_removeTrustforUuid___block_invoke_44(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)setSupervisedState:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = *(_QWORD *)&a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v4 = MEMORY[0x1E0C809B0];
  connection = self->connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__AMFIConnection_setSupervisedState___block_invoke;
  v10[3] = &unk_1EA986C10;
  v10[4] = &v11;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __37__AMFIConnection_setSupervisedState___block_invoke_45;
  v9[3] = &unk_1EA986C10;
  v9[4] = &v11;
  objc_msgSend(v6, "setSupervisedState:withReply:", v3, v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __37__AMFIConnection_setSupervisedState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __37__AMFIConnection_setSupervisedState___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __37__AMFIConnection_setSupervisedState___block_invoke_45(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)setDemoState:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = *(_QWORD *)&a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v4 = MEMORY[0x1E0C809B0];
  connection = self->connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __31__AMFIConnection_setDemoState___block_invoke;
  v10[3] = &unk_1EA986C10;
  v10[4] = &v11;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __31__AMFIConnection_setDemoState___block_invoke_46;
  v9[3] = &unk_1EA986C10;
  v9[4] = &v11;
  objc_msgSend(v6, "setDemoState:withReply:", v3, v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __31__AMFIConnection_setDemoState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __31__AMFIConnection_setDemoState___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __31__AMFIConnection_setDemoState___block_invoke_46(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)setManagedState:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  connection = self->connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__AMFIConnection_setManagedState___block_invoke;
  v11[3] = &unk_1EA986C10;
  v11[4] = &v12;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __34__AMFIConnection_setManagedState___block_invoke_47;
  v10[3] = &unk_1EA986C10;
  v10[4] = &v12;
  objc_msgSend(v7, "setManagedState:withReply:", v4, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __34__AMFIConnection_setManagedState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __34__AMFIConnection_setManagedState___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __34__AMFIConnection_setManagedState___block_invoke_47(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)removeManagedState
{
  uint64_t v2;
  NSXPCConnection *connection;
  void *v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v2 = MEMORY[0x1E0C809B0];
  connection = self->connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__AMFIConnection_removeManagedState__block_invoke;
  v8[3] = &unk_1EA986C10;
  v8[4] = &v9;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __36__AMFIConnection_removeManagedState__block_invoke_48;
  v7[3] = &unk_1EA986C10;
  v7[4] = &v9;
  objc_msgSend(v4, "removeManagedStateWithReply:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __36__AMFIConnection_removeManagedState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __36__AMFIConnection_removeManagedState__block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __36__AMFIConnection_removeManagedState__block_invoke_48(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->connection, 0);
}

void __39__AMFIConnection_initiateDataMigration__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __39__AMFIConnection_initiateDataMigration__block_invoke_32_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] data migration error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_33_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] developer mode daemons error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __39__AMFIConnection_getSEPStateWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __38__AMFIConnection_stageProfileForUuid___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __44__AMFIConnection_getStagedProfileWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __39__AMFIConnection_commitProfileForUuid___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __37__AMFIConnection_removeTrustforUuid___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __37__AMFIConnection_setSupervisedState___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __31__AMFIConnection_setDemoState___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __34__AMFIConnection_setManagedState___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __36__AMFIConnection_removeManagedState__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] xpc error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

@end
