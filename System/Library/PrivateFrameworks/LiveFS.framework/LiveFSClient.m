@implementation LiveFSClient

- (id)initConnectionForService:(id)a3
{
  id v4;
  LiveFSClient *v5;
  uint64_t v6;
  NSXPCConnection *conn;
  LiveFSClient *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LiveFSClient;
  v5 = -[LiveFSClient init](&v10, sel_init);
  if (v5
    && (connectionForServiceURL(v4, 1),
        v6 = objc_claimAutoreleasedReturnValue(),
        conn = v5->conn,
        v5->conn = (NSXPCConnection *)v6,
        conn,
        !v5->conn))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)dealloc
{
  NSXPCConnection *conn;
  NSXPCConnection *v4;
  objc_super v5;

  conn = self->conn;
  if (conn)
  {
    -[NSXPCConnection invalidate](conn, "invalidate");
    v4 = self->conn;
    self->conn = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)LiveFSClient;
  -[LiveFSClient dealloc](&v5, sel_dealloc);
}

+ (id)newConnectionForService:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initConnectionForService:", v4);

  return v5;
}

- (id)volumes:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *conn;
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
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v4 = MEMORY[0x24BDAC760];
  conn = self->conn;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __24__LiveFSClient_volumes___block_invoke;
  v10[3] = &unk_24F64BF38;
  v10[4] = &v11;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __24__LiveFSClient_volumes___block_invoke_2;
  v9[3] = &unk_24F64C028;
  v9[4] = &v17;
  objc_msgSend(v6, "listVolumes:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __24__LiveFSClient_volumes___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __24__LiveFSClient_volumes___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)listenerForVolume:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSXPCConnection *conn;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v7 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__5;
  v8 = MEMORY[0x24BDAC760];
  v29 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke;
  v19[3] = &unk_24F64C0A0;
  v22 = &v30;
  v9 = v6;
  v20 = v9;
  v23 = &v24;
  v10 = v7;
  v21 = v10;
  v11 = MEMORY[0x22E2FAC64](v19);
  v12 = (void *)v25[5];
  v25[5] = v11;

  conn = self->conn;
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke_2_11;
  v17[3] = &unk_24F64BFB0;
  v14 = v10;
  v18 = v14;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v17);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v31[5];
  v31[5] = v15;

  (*(void (**)(void))(v25[5] + 16))();
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

void __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  int v10;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[2] = __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke_2;
  v6[3] = &unk_24F64C078;
  v5 = *(void **)(a1 + 32);
  v6[1] = 3221225472;
  v10 = a2;
  v9 = v3;
  v7 = v5;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v4, "listenerForVolume:reply:", v7, v6);

}

void __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v13;
  dispatch_time_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_DWORD *)(a1 + 56);
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == (void *)*MEMORY[0x24BDD1128] && objc_msgSend(v7, "code") == 35;

  }
  else
  {
    v10 = 0;
  }
  livefs_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v5;
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_22BD61000, v11, OS_LOG_TYPE_DEFAULT, "ListenerForVolume looper got listener %@ e %@", buf, 0x16u);
  }

  if (v8 < 9 && v10)
  {
    v13 = v8 + 1;
    v14 = dispatch_time(0, 50000000);
    dispatch_get_global_queue(2, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke_6;
    v23[3] = &unk_24F64C050;
    v23[4] = *(_QWORD *)(a1 + 48);
    v24 = v13;
    dispatch_after(v14, v15, v23);

  }
  else
  {
    if (v10)
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BDD0B88];
      v18 = *(_QWORD *)(a1 + 32);
      v25 = *MEMORY[0x24BDD0CB8];
      v26 = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 0x7FFFFFFFFFFFFFFFLL, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v20;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = 0;

}

uint64_t __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(unsigned int *)(a1 + 40));
}

uint64_t __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke_2_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)listenerForVolume:(id)a3 error:(id *)a4
{
  NSXPCConnection *conn;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id *v18;
  id v19;
  _QWORD v20[6];
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[3];

  v18 = a4;
  v35[1] = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  conn = self->conn;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __40__LiveFSClient_listenerForVolume_error___block_invoke;
  v21[3] = &unk_24F64C0C8;
  v21[4] = &v28;
  v21[5] = &v22;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = (void *)*MEMORY[0x24BDD1128];
  while (1)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __40__LiveFSClient_listenerForVolume_error___block_invoke_2;
    v20[3] = &unk_24F64C0F0;
    v20[4] = &v28;
    v20[5] = &v22;
    objc_msgSend(v6, "listenerForVolume:reply:", v19, v20, v18);
    v9 = (void *)v23[5];
    if (!v9)
      break;
    objc_msgSend(v9, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v8)
      goto LABEL_11;
    v11 = objc_msgSend((id)v23[5], "code");

    if (v7 >= 9 || v11 != 35)
    {
      if (v11 != 35)
        break;
      v13 = (void *)MEMORY[0x24BDD1540];
      v34 = *MEMORY[0x24BDD0CB8];
      v35[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 0x7FFFFFFFFFFFFFFFLL, v10);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v23[5];
      v23[5] = v14;

LABEL_11:
      break;
    }
    ++v7;
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.0500000007);
  }
  if (v18)
    *v18 = objc_retainAutorelease((id)v23[5]);
  v16 = (id)v29[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v16;
}

void __40__LiveFSClient_listenerForVolume_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __40__LiveFSClient_listenerForVolume_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

+ (id)interfaceForListeners
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255C00B38);
}

- (id)forgetVolume:(id)a3 withFlags:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  NSXPCConnection *conn;
  void *v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v7 = MEMORY[0x24BDAC760];
  conn = self->conn;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __39__LiveFSClient_forgetVolume_withFlags___block_invoke;
  v13[3] = &unk_24F64BF38;
  v13[4] = &v14;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __39__LiveFSClient_forgetVolume_withFlags___block_invoke_2;
  v12[3] = &unk_24F64BF38;
  v12[4] = &v14;
  objc_msgSend(v9, "ejectVolume:usingFlags:reply:", v6, v4, v12);
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __39__LiveFSClient_forgetVolume_withFlags___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __39__LiveFSClient_forgetVolume_withFlags___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)terminateDevice:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *conn;
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
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v5 = MEMORY[0x24BDAC760];
  conn = self->conn;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __32__LiveFSClient_terminateDevice___block_invoke;
  v11[3] = &unk_24F64BF38;
  v11[4] = &v12;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __32__LiveFSClient_terminateDevice___block_invoke_2;
  v10[3] = &unk_24F64BF38;
  v10[4] = &v12;
  objc_msgSend(v7, "ejectDisk:usingFlags:reply:", v4, 1, v10);
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __32__LiveFSClient_terminateDevice___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __32__LiveFSClient_terminateDevice___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)unlockVolume:(id)a3 password:(id)a4 saveToKeychain:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  NSXPCConnection *conn;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a5;
  v10 = a6;
  conn = self->conn;
  v12 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __71__LiveFSClient_unlockVolume_password_saveToKeychain_completionHandler___block_invoke;
  v20[3] = &unk_24F64BFB0;
  v13 = v10;
  v21 = v13;
  v14 = a4;
  v15 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __71__LiveFSClient_unlockVolume_password_saveToKeychain_completionHandler___block_invoke_2;
  v18[3] = &unk_24F64BFB0;
  v19 = v13;
  v17 = v13;
  objc_msgSend(v16, "unlockVolume:password:saveToKeychain:completionHandler:", v15, v14, v6, v18);

}

uint64_t __71__LiveFSClient_unlockVolume_password_saveToKeychain_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__LiveFSClient_unlockVolume_password_saveToKeychain_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)supportDirURL:(unint64_t)a3 forURL:(id)a4 daemonPrefName:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  int v21;
  id v23;
  id v24;
  char v25;

  v9 = a5;
  v10 = (void *)MEMORY[0x24BDD1580];
  v11 = a4;
  objc_msgSend(v10, "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v24 = 0;
  objc_msgSend(v12, "URLForDirectory:inDomain:appropriateForURL:create:error:", a3, 1, v11, 1, &v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v24;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:relativeToURL:", v9, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v15, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v17, &v25);

      if (v18)
      {
        if (!v25)
        {
          getNSErrorFromLiveFSErrno(20);
          v19 = (id)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            +[LiveFSClient supportDirURL:forURL:daemonPrefName:error:].cold.3();
          goto LABEL_19;
        }
LABEL_16:
        v16 = v16;
        v20 = v16;
        goto LABEL_21;
      }
      v23 = v14;
      v21 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 0, 0, &v23);
      v19 = v23;

      if ((v21 & 1) != 0)
      {
        v14 = v19;
        goto LABEL_16;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        +[LiveFSClient supportDirURL:forURL:daemonPrefName:error:].cold.4();
    }
    else
    {
      getNSErrorFromLiveFSErrno(12);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        +[LiveFSClient supportDirURL:forURL:daemonPrefName:error:].cold.2();
      v16 = 0;
    }
LABEL_19:
    v14 = v19;
    if (a6)
    {
LABEL_20:
      v14 = objc_retainAutorelease(v14);
      v20 = 0;
      *a6 = v14;
      goto LABEL_21;
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[LiveFSClient supportDirURL:forURL:daemonPrefName:error:].cold.1();
  v16 = 0;
  if (a6)
    goto LABEL_20;
LABEL_10:
  v20 = 0;
LABEL_21:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->conn, 0);
}

+ (void)supportDirURL:forURL:daemonPrefName:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_22BD61000, MEMORY[0x24BDACB70], v0, "Error getting location %lu: %{public}@", v1, v2, v3, v4, v5);
}

+ (void)supportDirURL:forURL:daemonPrefName:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_22BD61000, MEMORY[0x24BDACB70], v0, "Error getting %lu/%{public}@: %{public}@", v1, v2, v3, v4, v5);
}

+ (void)supportDirURL:forURL:daemonPrefName:error:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_22BD61000, MEMORY[0x24BDACB70], v0, "%lu/%{public}@ exists but is not a directory", v1, v2, v3, v4, v5);
}

+ (void)supportDirURL:forURL:daemonPrefName:error:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_22BD61000, MEMORY[0x24BDACB70], v0, "Error creating %lu/%{public}@: %{public}@", v1, v2, v3, v4, v5);
}

@end
