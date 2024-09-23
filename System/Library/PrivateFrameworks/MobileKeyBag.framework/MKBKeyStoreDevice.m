@implementation MKBKeyStoreDevice

+ (id)sharedService
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MKBKeyStoreDevice_sharedService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, block);
  return (id)sharedService_service;
}

void __34__MKBKeyStoreDevice_sharedService__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedService_service;
  sharedService_service = v0;

}

- (id)_CreateMKBServerConnection
{
  int v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = xpc_user_sessions_enabled();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF089EB8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
  if (v2)
    v5 = 0;
  else
    v5 = 4096;
  v6 = (void *)objc_msgSend(v4, "initWithMachServiceName:options:", CFSTR("com.apple.mobile.keybagd.xpc"), v5);
  objc_msgSend(v6, "setRemoteObjectInterface:", v3);
  if (v2)
  {
    xpc_user_sessions_get_foreground_uid();
    objc_msgSend(v6, "_xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_user_session_uid();

  }
  objc_msgSend(v6, "resume");

  return v6;
}

- (id)getFileHandleForData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  int *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v24[2];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_8;
  v5 = (void *)objc_msgSend(v3, "length");
  if (v5)
  {
    if (pipe(v24) == -1)
    {
      v7 = __error();
      v8 = strerror(*v7);
      debuglog("-[MKBKeyStoreDevice getFileHandleForData:]", CFSTR("failed to get fds(1) with error:%s"), v9, v10, v11, v12, v13, v14, v8);
    }
    else
    {
      if (writen(v24[1], (char *)objc_msgSend(objc_retainAutorelease(v4), "bytes"), (size_t)v5) != -1)
      {
        close(v24[1]);
        v6 = objc_alloc(MEMORY[0x1E0CB3608]);
        v5 = (void *)objc_msgSend(v6, "initWithFileDescriptor:closeOnDealloc:", v24[0], 1);
        goto LABEL_9;
      }
      v15 = __error();
      v16 = strerror(*v15);
      debuglog("-[MKBKeyStoreDevice getFileHandleForData:]", CFSTR("failed to write to pipe with error:%s"), v17, v18, v19, v20, v21, v22, v16);
      close(v24[0]);
      close(v24[1]);
    }
LABEL_8:
    v5 = 0;
  }
LABEL_9:

  return v5;
}

- (int)setSpacedRepetitionMode:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v3 = *(_QWORD *)&a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__MKBKeyStoreDevice_setSpacedRepetitionMode___block_invoke_2;
  v8[3] = &unk_1E67572F8;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "setSpacedRepetitionMode:reply:", v3, v8);
  LODWORD(v3) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return v3;
}

void __45__MKBKeyStoreDevice_setSpacedRepetitionMode___block_invoke(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  debuglog("-[MKBKeyStoreDevice setSpacedRepetitionMode:]_block_invoke", CFSTR("got error from remote proxy: %@"), a3, a4, a5, a6, a7, a8, a2);
}

uint64_t __45__MKBKeyStoreDevice_setSpacedRepetitionMode___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)changeSystemSecretFromOldPasscode:(id)a3 ToNew:(id)a4 withOpaqueData:(id)a5 withParams:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  int v20;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && objc_msgSend(v10, "length"))
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "length");
    if (!v11)
      goto LABEL_8;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    if (!v11)
    {
LABEL_8:
      v16 = 0;
      v17 = 0;
      goto LABEL_9;
    }
  }
  if (!objc_msgSend(v11, "length"))
    goto LABEL_8;
  -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v11, "length");
LABEL_9:
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_176);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __87__MKBKeyStoreDevice_changeSystemSecretFromOldPasscode_ToNew_withOpaqueData_withParams___block_invoke_2;
  v22[3] = &unk_1E67572F8;
  v24 = &v25;
  v19 = v13;
  v23 = v19;
  objc_msgSend(v18, "changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:", v14, v15, v16, v17, v12, v6, v22);
  v20 = *((_DWORD *)v26 + 6);

  _Block_object_dispose(&v25, 8);
  return v20;
}

void __87__MKBKeyStoreDevice_changeSystemSecretFromOldPasscode_ToNew_withOpaqueData_withParams___block_invoke(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  debuglog("-[MKBKeyStoreDevice changeSystemSecretFromOldPasscode:ToNew:withOpaqueData:withParams:]_block_invoke", CFSTR("got error from remote proxy: %@"), a3, a4, a5, a6, a7, a8, a2);
}

uint64_t __87__MKBKeyStoreDevice_changeSystemSecretFromOldPasscode_ToNew_withOpaqueData_withParams___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)changeClassKeysGenerationWithSecret:(id)a3 withGenerationOption:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(v6, "length"))
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "length");
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_177);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__MKBKeyStoreDevice_changeClassKeysGenerationWithSecret_withGenerationOption___block_invoke_2;
  v14[3] = &unk_1E67572F8;
  v16 = &v17;
  v11 = v7;
  v15 = v11;
  objc_msgSend(v10, "changeClassKeysGenerationWithSecret:secretSize:generationOption:reply:", v8, v9, v4, v14);
  v12 = *((_DWORD *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __78__MKBKeyStoreDevice_changeClassKeysGenerationWithSecret_withGenerationOption___block_invoke(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  debuglog("-[MKBKeyStoreDevice changeClassKeysGenerationWithSecret:withGenerationOption:]_block_invoke", CFSTR("got error from remote proxy: %@"), a3, a4, a5, a6, a7, a8, a2);
}

uint64_t __78__MKBKeyStoreDevice_changeClassKeysGenerationWithSecret_withGenerationOption___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)copySytemSecretBlob
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_178);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__MKBKeyStoreDevice_copySytemSecretBlob__block_invoke_2;
  v7[3] = &unk_1E6757380;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "getPasscodeBlobWithReply:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __40__MKBKeyStoreDevice_copySytemSecretBlob__block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice copySytemSecretBlob]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

void __40__MKBKeyStoreDevice_copySytemSecretBlob__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  if (a3)
  {
    v6 = objc_msgSend(a3, "code");
    debuglog("-[MKBKeyStoreDevice copySytemSecretBlob]_block_invoke_2", CFSTR("got error from remote proxy for getPasscodeBlobWithReply: %ld"), v7, v8, v9, v10, v11, v12, v6);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (id)getBackupkeyForVolume:(id)a3 andCryptoID:(unint64_t)a4 withError:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
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
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_184);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__MKBKeyStoreDevice_getBackupkeyForVolume_andCryptoID_withError___block_invoke_2;
  v14[3] = &unk_1E67573C8;
  v16 = &v18;
  v17 = &v24;
  v11 = v9;
  v15 = v11;
  objc_msgSend(v10, "getBackupkeyForVolume:andCryptoID:withReply:", v8, a4, v14);
  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __65__MKBKeyStoreDevice_getBackupkeyForVolume_andCryptoID_withError___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice getBackupkeyForVolume:andCryptoID:withError:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

void __65__MKBKeyStoreDevice_getBackupkeyForVolume_andCryptoID_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v7 = objc_msgSend(v6, "code");
    debuglog("-[MKBKeyStoreDevice getBackupkeyForVolume:andCryptoID:withError:]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v8, v9, v10, v11, v12, v13, v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (int)ChangeSystemSecretWithEscrow:(id)a3 FromOldPasscode:(id)a4 ToNew:(id)a5 withOpaqueDats:(id)a6 withKeepState:(int)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  id v22;
  id v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && objc_msgSend(v13, "length"))
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v13, "length");
    if (!v14)
      goto LABEL_8;
  }
  else
  {
    v31 = 0;
    v17 = 0;
    if (!v14)
      goto LABEL_8;
  }
  if (objc_msgSend(v14, "length"))
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v14, "length");
    goto LABEL_9;
  }
LABEL_8:
  v19 = 0;
  v18 = 0;
LABEL_9:
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_185);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = a7 == 0;
  v22 = v15;
  v23 = v12;
  v24 = !v21;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __101__MKBKeyStoreDevice_ChangeSystemSecretWithEscrow_FromOldPasscode_ToNew_withOpaqueDats_withKeepState___block_invoke_2;
  v32[3] = &unk_1E67572F8;
  v34 = &v35;
  v25 = v16;
  v33 = v25;
  LOBYTE(v30) = v24;
  v26 = v23;
  v27 = v22;
  objc_msgSend(v20, "changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:", v26, v17, v31, v18, v19, v22, v30, v32);
  v28 = *((_DWORD *)v36 + 6);

  _Block_object_dispose(&v35, 8);
  return v28;
}

void __101__MKBKeyStoreDevice_ChangeSystemSecretWithEscrow_FromOldPasscode_ToNew_withOpaqueDats_withKeepState___block_invoke(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  debuglog("-[MKBKeyStoreDevice ChangeSystemSecretWithEscrow:FromOldPasscode:ToNew:withOpaqueDats:withKeepState:]_block_invoke", CFSTR("got error from remote proxy: %@"), a3, a4, a5, a6, a7, a8, a2);
}

uint64_t __101__MKBKeyStoreDevice_ChangeSystemSecretWithEscrow_FromOldPasscode_ToNew_withOpaqueDats_withKeepState___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)SetSystemSecretBlob:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_186);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__MKBKeyStoreDevice_SetSystemSecretBlob___block_invoke_2;
  v10[3] = &unk_1E67572F8;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "setSystemSecretBlob:reply:", v4, v10);
  v8 = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __41__MKBKeyStoreDevice_SetSystemSecretBlob___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice SetSystemSecretBlob:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __41__MKBKeyStoreDevice_SetSystemSecretBlob___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice SetSystemSecretBlob:]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)registerOTABackup:(id)a3 withSecret:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && objc_msgSend(v7, "length"))
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "length");
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_187);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__MKBKeyStoreDevice_registerOTABackup_withSecret___block_invoke_2;
  v15[3] = &unk_1E67572F8;
  v17 = &v18;
  v12 = v8;
  v16 = v12;
  objc_msgSend(v11, "registerBackupBag:withSecret:secretSize:reply:", v6, v9, v10, v15);
  v13 = *((_DWORD *)v19 + 6);

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __50__MKBKeyStoreDevice_registerOTABackup_withSecret___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice registerOTABackup:withSecret:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __50__MKBKeyStoreDevice_registerOTABackup_withSecret___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice registerOTABackup:withSecret:]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)startBackupSessionForVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_188);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__MKBKeyStoreDevice_startBackupSessionForVolume___block_invoke_2;
  v10[3] = &unk_1E67572F8;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "startBackupSessionForVolume:withReply:", v4, v10);
  v8 = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __49__MKBKeyStoreDevice_startBackupSessionForVolume___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice startBackupSessionForVolume:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __49__MKBKeyStoreDevice_startBackupSessionForVolume___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice startBackupSessionForVolume:]_block_invoke_2", CFSTR("got error from remote proxy(2): %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)stopBackupSessionForVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_191);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__MKBKeyStoreDevice_stopBackupSessionForVolume___block_invoke_2;
  v10[3] = &unk_1E67572F8;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "stopBackupSessionForVolume:withReply:", v4, v10);
  v8 = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __48__MKBKeyStoreDevice_stopBackupSessionForVolume___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice stopBackupSessionForVolume:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __48__MKBKeyStoreDevice_stopBackupSessionForVolume___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice stopBackupSessionForVolume:]_block_invoke_2", CFSTR("got error from remote proxy(2): %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)enableBackupForVolume:(id)a3 withSecret:(id)a4 bagData:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = -1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend(v9, "length"))
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "length");
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_192);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__MKBKeyStoreDevice_enableBackupForVolume_withSecret_bagData___block_invoke_2;
  v17[3] = &unk_1E67573C8;
  v19 = &v27;
  v20 = &v21;
  v14 = v10;
  v18 = v14;
  objc_msgSend(v13, "enableBackupForVolume:withSecret:secretSize:reply:", v8, v11, v12, v17);
  *a5 = objc_retainAutorelease((id)v22[5]);
  v15 = *((_DWORD *)v28 + 6);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

void __62__MKBKeyStoreDevice_enableBackupForVolume_withSecret_bagData___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice enableBackupForVolume:withSecret:bagData:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

void __62__MKBKeyStoreDevice_enableBackupForVolume_withSecret_bagData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "code");
    v8 = objc_msgSend(v7, "code");
    debuglog("-[MKBKeyStoreDevice enableBackupForVolume:withSecret:bagData:]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v9, v10, v11, v12, v13, v14, v8);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (int)disableBackupForVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_193);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__MKBKeyStoreDevice_disableBackupForVolume___block_invoke_2;
  v10[3] = &unk_1E67572F8;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "disableBackupForVolume:reply:", v4, v10);
  v8 = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __44__MKBKeyStoreDevice_disableBackupForVolume___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice disableBackupForVolume:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __44__MKBKeyStoreDevice_disableBackupForVolume___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice disableBackupForVolume:]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)backupUUIDForVolume:(id)a3 bagUUID:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_194);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__MKBKeyStoreDevice_backupUUIDForVolume_bagUUID___block_invoke_2;
  v11[3] = &unk_1E6757380;
  v13 = &v14;
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "backupUUIDForVolume:reply:", v5, v11);
  v9 = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __49__MKBKeyStoreDevice_backupUUIDForVolume_bagUUID___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice backupUUIDForVolume:bagUUID:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __49__MKBKeyStoreDevice_backupUUIDForVolume_bagUUID___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3)
  {
    v4 = a3;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "code");
    v5 = objc_msgSend(v4, "code");

    debuglog("-[MKBKeyStoreDevice backupUUIDForVolume:bagUUID:]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v6, v7, v8, v9, v10, v11, v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)passcodeUnlockStart
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_195);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__MKBKeyStoreDevice_passcodeUnlockStart__block_invoke_2;
  v7[3] = &unk_1E67572F8;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "passcodeUnlockStartWithReply:", v7);
  v5 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __40__MKBKeyStoreDevice_passcodeUnlockStart__block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice passcodeUnlockStart]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __40__MKBKeyStoreDevice_passcodeUnlockStart__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice passcodeUnlockStart]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)passcodeUnlockSuccess
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_196);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__MKBKeyStoreDevice_passcodeUnlockSuccess__block_invoke_2;
  v7[3] = &unk_1E67572F8;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "passcodeUnlockSuccessWithReply:", v7);
  v5 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __42__MKBKeyStoreDevice_passcodeUnlockSuccess__block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice passcodeUnlockSuccess]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __42__MKBKeyStoreDevice_passcodeUnlockSuccess__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice passcodeUnlockSuccess]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)passcodeUnlockFailed
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_197);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__MKBKeyStoreDevice_passcodeUnlockFailed__block_invoke_2;
  v7[3] = &unk_1E67572F8;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "passcodeUnlockFailedWithReply:", v7);
  v5 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __41__MKBKeyStoreDevice_passcodeUnlockFailed__block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice passcodeUnlockFailed]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __41__MKBKeyStoreDevice_passcodeUnlockFailed__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice passcodeUnlockFailed]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)getLockStateForUser:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = *(_QWORD *)&a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_198);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__MKBKeyStoreDevice_getLockStateForUser___block_invoke_2;
  v9[3] = &unk_1E6757510;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "getLockSateInfoforUser:WithReply:", v3, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__MKBKeyStoreDevice_getLockStateForUser___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice getLockStateForUser:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

void __41__MKBKeyStoreDevice_getLockStateForUser___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  if (a3)
  {
    v6 = objc_msgSend(a3, "code");
    debuglog("-[MKBKeyStoreDevice getLockStateForUser:]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v7, v8, v9, v10, v11, v12, v6);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (BOOL)getDeviceLockStateForUser:(int)a3 extendedState:(BOOL)a4 withLockStateInfo:(int *)a5
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  int *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_200);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__MKBKeyStoreDevice_getDeviceLockStateForUser_extendedState_withLockStateInfo___block_invoke_2;
  v12[3] = &unk_1E6757538;
  v14 = &v16;
  v15 = a5;
  v10 = v8;
  v13 = v10;
  objc_msgSend(v9, "getDeviceLockState:needsExtended:withReply:", v7, v6, v12);
  LOBYTE(v6) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __79__MKBKeyStoreDevice_getDeviceLockStateForUser_extendedState_withLockStateInfo___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice getDeviceLockStateForUser:extendedState:withLockStateInfo:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __79__MKBKeyStoreDevice_getDeviceLockStateForUser_extendedState_withLockStateInfo___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;

  if (a3)
  {
    v4 = objc_msgSend(a3, "code");
    debuglog("-[MKBKeyStoreDevice getDeviceLockStateForUser:extendedState:withLockStateInfo:]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    v11 = *(_DWORD **)(a1 + 48);
    if (v11)
      *v11 = a2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)stashCreateWithSecret:(id)a3 withMode:(int)a4 withUID:(unsigned int)a5 WithFlags:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && objc_msgSend(v10, "length"))
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "length");
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_202);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__MKBKeyStoreDevice_stashCreateWithSecret_withMode_withUID_WithFlags___block_invoke_2;
  v18[3] = &unk_1E67572F8;
  v20 = &v21;
  v15 = v11;
  v19 = v15;
  objc_msgSend(v14, "stashCreatewithSecret:secrestSize:withMode:withUID:WithFlags:reply:", v12, v13, v8, v7, v6, v18);
  v16 = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return v16;
}

void __70__MKBKeyStoreDevice_stashCreateWithSecret_withMode_withUID_WithFlags___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice stashCreateWithSecret:withMode:withUID:WithFlags:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __70__MKBKeyStoreDevice_stashCreateWithSecret_withMode_withUID_WithFlags___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice stashCreateWithSecret:withMode:withUID:WithFlags:]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)stashCommit:(unsigned int)a3 WithFlags:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_203);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__MKBKeyStoreDevice_stashCommit_WithFlags___block_invoke_2;
  v10[3] = &unk_1E67572F8;
  v12 = &v13;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "stashCommitwithUID:WithFlags:WithReply:", v5, v4, v10);
  LODWORD(v4) = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void __43__MKBKeyStoreDevice_stashCommit_WithFlags___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice stashCommit:WithFlags:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __43__MKBKeyStoreDevice_stashCommit_WithFlags___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice stashCommit:WithFlags:]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)stashDestroy
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_204);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__MKBKeyStoreDevice_stashDestroy__block_invoke_2;
  v7[3] = &unk_1E67572F8;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "stashDestroywithReply:", v7);
  v5 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __33__MKBKeyStoreDevice_stashDestroy__block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice stashDestroy]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __33__MKBKeyStoreDevice_stashDestroy__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice stashDestroy]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)stashVerifywithValidity:(int *)a3 WithUID:(unsigned int)a4 WithFlags:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  id v10;
  int v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = -1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_205);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__MKBKeyStoreDevice_stashVerifywithValidity_WithUID_WithFlags___block_invoke_2;
  v13[3] = &unk_1E67575E0;
  v15 = &v21;
  v16 = &v17;
  v10 = v8;
  v14 = v10;
  objc_msgSend(v9, "stashVerifywithUID:WithFlags:WithReply:", v6, v5, v13);
  if (a3)
    *a3 = *((_DWORD *)v18 + 6);
  v11 = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v11;
}

void __63__MKBKeyStoreDevice_stashVerifywithValidity_WithUID_WithFlags___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice stashVerifywithValidity:WithUID:WithFlags:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __63__MKBKeyStoreDevice_stashVerifywithValidity_WithUID_WithFlags___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3)
  {
    v4 = a3;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "code");
    v5 = objc_msgSend(v4, "code");

    debuglog("-[MKBKeyStoreDevice stashVerifywithValidity:WithUID:WithFlags:]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v6, v7, v8, v9, v10, v11, v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)isKeyRollingWithKeyStatus:(int *)a3
{
  void *v4;
  void *v5;
  id v6;
  int v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = -1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_206);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__MKBKeyStoreDevice_isKeyRollingWithKeyStatus___block_invoke_2;
  v9[3] = &unk_1E67575E0;
  v11 = &v17;
  v12 = &v13;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "isKeyRollingInProgresswithreply:", v9);
  if (a3)
    *a3 = *((_DWORD *)v14 + 6);
  v7 = *((_DWORD *)v18 + 6);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __47__MKBKeyStoreDevice_isKeyRollingWithKeyStatus___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice isKeyRollingWithKeyStatus:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __47__MKBKeyStoreDevice_isKeyRollingWithKeyStatus___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3)
  {
    v4 = a3;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "code");
    v5 = objc_msgSend(v4, "code");

    debuglog("-[MKBKeyStoreDevice isKeyRollingWithKeyStatus:]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v6, v7, v8, v9, v10, v11, v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)migrateFS
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_207);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__MKBKeyStoreDevice_migrateFS__block_invoke_2;
  v7[3] = &unk_1E67572F8;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "migrationWithReply:", v7);
  v5 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __30__MKBKeyStoreDevice_migrateFS__block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice migrateFS]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __30__MKBKeyStoreDevice_migrateFS__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice migrateFS]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)forgottenPasscodeEvent
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_208);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__MKBKeyStoreDevice_forgottenPasscodeEvent__block_invoke_2;
  v7[3] = &unk_1E67572F8;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "forgottenPasscodeEventWithReply:", v7);
  v5 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __43__MKBKeyStoreDevice_forgottenPasscodeEvent__block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice forgottenPasscodeEvent]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __43__MKBKeyStoreDevice_forgottenPasscodeEvent__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice forgottenPasscodeEvent]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)Event:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_209);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Event:", v3);
  objc_msgSend(v4, "invalidate");

  return 0;
}

void __27__MKBKeyStoreDevice_Event___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice Event:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

- (int)SeshatEnroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "length");
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_210);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__MKBKeyStoreDevice_SeshatEnroll___block_invoke_2;
  v12[3] = &unk_1E67572F8;
  v14 = &v15;
  v9 = v5;
  v13 = v9;
  objc_msgSend(v8, "SeshatEnrollWithSecret:secretSize:withReply:", v6, v7, v12);
  v10 = *((_DWORD *)v16 + 6);

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __34__MKBKeyStoreDevice_SeshatEnroll___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice SeshatEnroll:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __34__MKBKeyStoreDevice_SeshatEnroll___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice SeshatEnroll:]_block_invoke_2", CFSTR("got error from remote proxy: %ld"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)SeshatUnlock:(id)a3 withMemento:(BOOL)a4 verifyOnly:(BOOL)a5 withACMRef:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = -1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && objc_msgSend(v10, "length"))
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "length");
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_211);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __68__MKBKeyStoreDevice_SeshatUnlock_withMemento_verifyOnly_withACMRef___block_invoke_2;
  v25[3] = &unk_1E67575E0;
  v27 = &v33;
  v28 = &v29;
  v16 = v12;
  v26 = v16;
  objc_msgSend(v15, "SeshatUnlockWithSecret:secretSize:withMemento:verifyOnly:withACMRef:withReply:", v13, v14, v8, v7, v11, v25);
  v23 = *((_DWORD *)v34 + 6);
  if (!v23)
  {
    debuglog("-[MKBKeyStoreDevice SeshatUnlock:withMemento:verifyOnly:withACMRef:]", CFSTR("kCommandSeshatUnlock -> %d"), v17, v18, v19, v20, v21, v22, *((_DWORD *)v30 + 6));
    v23 = *((_DWORD *)v34 + 6);
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v23;
}

void __68__MKBKeyStoreDevice_SeshatUnlock_withMemento_verifyOnly_withACMRef___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice SeshatUnlock:withMemento:verifyOnly:withACMRef:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __68__MKBKeyStoreDevice_SeshatUnlock_withMemento_verifyOnly_withACMRef___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  int v4;

  if (a3)
  {
    v4 = objc_msgSend(a3, "code");
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)SeshatRecover:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = -1;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "length");
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_214);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __35__MKBKeyStoreDevice_SeshatRecover___block_invoke_2;
  v18[3] = &unk_1E67575E0;
  v20 = &v26;
  v21 = &v22;
  v9 = v5;
  v19 = v9;
  objc_msgSend(v8, "SeshatRecoverWithSecret:secretSize:withReply:", v6, v7, v18);
  v16 = *((_DWORD *)v27 + 6);
  if (!v16)
  {
    debuglog("-[MKBKeyStoreDevice SeshatRecover:]", CFSTR("kCommandSeshatRecover -> %d"), v10, v11, v12, v13, v14, v15, *((_DWORD *)v23 + 6));
    v16 = *((_DWORD *)v27 + 6);
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v16;
}

void __35__MKBKeyStoreDevice_SeshatRecover___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice SeshatRecover:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __35__MKBKeyStoreDevice_SeshatRecover___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  int v4;

  if (a3)
  {
    v4 = objc_msgSend(a3, "code");
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)SeshatDebug:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v3 = *(_QWORD *)&a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_217);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__MKBKeyStoreDevice_SeshatDebug___block_invoke_2;
  v8[3] = &unk_1E67572F8;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "SeshatDebugWithDebugMask:withReply:", v3, v8);
  LODWORD(v3) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return v3;
}

void __33__MKBKeyStoreDevice_SeshatDebug___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice SeshatDebug:]_block_invoke", CFSTR("got error from remote proxy: %d"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __33__MKBKeyStoreDevice_SeshatDebug___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v3 = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "code");
    v4 = objc_msgSend(v3, "code");

    debuglog("-[MKBKeyStoreDevice SeshatDebug:]_block_invoke_2", CFSTR("got error from remote proxy: %d"), v5, v6, v7, v8, v9, v10, v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)createKeybagForUserSession:(id)a3 withSessionUID:(int)a4 WithSecret:(id)a5 withGracePeriod:(int)a6 withOpaqeStuff:(id)a7
{
  uint64_t v8;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;

  v8 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a5;
  v14 = a7;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && objc_msgSend(v13, "length"))
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "length");
  }
  else
  {
    v17 = 0;
    v16 = 0;
  }
  objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_220);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __105__MKBKeyStoreDevice_createKeybagForUserSession_withSessionUID_WithSecret_withGracePeriod_withOpaqeStuff___block_invoke_2;
  v28[3] = &unk_1E67572F8;
  v30 = &v31;
  v19 = v15;
  v29 = v19;
  objc_msgSend(v18, "createKeybagForUserSession:withSessionUID:WithSecret:secretSize:withGracePeriod:withOpaqeStuff:withReply:", v12, v10, v16, v17, v8, v14, v28);
  if (*((_DWORD *)v32 + 6))
  {
    debuglog("-[MKBKeyStoreDevice createKeybagForUserSession:withSessionUID:WithSecret:withGracePeriod:withOpaqeStuff:]", CFSTR("kcreateKeybagForUserSession -> %d"), v20, v21, v22, v23, v24, v25, *((_DWORD *)v32 + 6));
    v26 = *((_DWORD *)v32 + 6);
  }
  else
  {
    v26 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v26;
}

void __105__MKBKeyStoreDevice_createKeybagForUserSession_withSessionUID_WithSecret_withGracePeriod_withOpaqeStuff___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice createKeybagForUserSession:withSessionUID:WithSecret:withGracePeriod:withOpaqeStuff:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __105__MKBKeyStoreDevice_createKeybagForUserSession_withSessionUID_WithSecret_withGracePeriod_withOpaqeStuff___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)loadKeybagForUserSession:(id)a3 withSessionID:(int)a4 withSecret:(id)a5 shouldSetGracePeriod:(BOOL)a6 withGracePeriod:(int)a7 isInEarlyStar:(BOOL)a8
{
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v12;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;

  v9 = *(_QWORD *)&a7;
  v10 = a6;
  v12 = *(_QWORD *)&a4;
  v14 = a3;
  v15 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && objc_msgSend(v15, "length"))
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "length");
  }
  else
  {
    v18 = 0;
    v17 = 0;
  }
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_223);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __122__MKBKeyStoreDevice_loadKeybagForUserSession_withSessionID_withSecret_shouldSetGracePeriod_withGracePeriod_isInEarlyStar___block_invoke_2;
  v30[3] = &unk_1E67572F8;
  v32 = &v33;
  v20 = v16;
  v31 = v20;
  LOBYTE(v29) = a8;
  objc_msgSend(v19, "loadKeybagForUserSession:withSessionID:withSecret:secretSize:shouldSetGracePeriod:withGracePeriod:isInEarlyStar:withReply:", v14, v12, v17, v18, v10, v9, v29, v30);
  if (*((_DWORD *)v34 + 6))
  {
    debuglog("-[MKBKeyStoreDevice loadKeybagForUserSession:withSessionID:withSecret:shouldSetGracePeriod:withGracePeriod:isInEarlyStar:]", CFSTR("kcreateKeybagForUserSession -> %d"), v21, v22, v23, v24, v25, v26, *((_DWORD *)v34 + 6));
    v27 = *((_DWORD *)v34 + 6);
  }
  else
  {
    v27 = 0;
  }

  _Block_object_dispose(&v33, 8);
  return v27;
}

void __122__MKBKeyStoreDevice_loadKeybagForUserSession_withSessionID_withSecret_shouldSetGracePeriod_withGracePeriod_isInEarlyStar___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice loadKeybagForUserSession:withSessionID:withSecret:shouldSetGracePeriod:withGracePeriod:isInEarlyStar:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __122__MKBKeyStoreDevice_loadKeybagForUserSession_withSessionID_withSecret_shouldSetGracePeriod_withGracePeriod_isInEarlyStar___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)unloadKeybagForUserSession:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v3 = *(_QWORD *)&a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_224);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MKBKeyStoreDevice_unloadKeybagForUserSession___block_invoke_2;
  v8[3] = &unk_1E67572F8;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "unloadKeybagForUserSession:withReply:", v3, v8);
  LODWORD(v3) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return v3;
}

void __48__MKBKeyStoreDevice_unloadKeybagForUserSession___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice unloadKeybagForUserSession:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __48__MKBKeyStoreDevice_unloadKeybagForUserSession___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)deleteKeybagForUserSession:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v3 = *(_QWORD *)&a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_225);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MKBKeyStoreDevice_deleteKeybagForUserSession___block_invoke_2;
  v8[3] = &unk_1E67572F8;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "deleteKeybagForUserSession:withReply:", v3, v8);
  LODWORD(v3) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return v3;
}

void __48__MKBKeyStoreDevice_deleteKeybagForUserSession___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice deleteKeybagForUserSession:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __48__MKBKeyStoreDevice_deleteKeybagForUserSession___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)setVolumeToPersona:(id)a3 withPersonaString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_226);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__MKBKeyStoreDevice_setVolumeToPersona_withPersonaString___block_invoke_2;
  v13[3] = &unk_1E67572F8;
  v15 = &v16;
  v10 = v8;
  v14 = v10;
  objc_msgSend(v9, "setVolumeToPersona:withPersonaString:withReply:", v6, v7, v13);
  v11 = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __58__MKBKeyStoreDevice_setVolumeToPersona_withPersonaString___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice setVolumeToPersona:withPersonaString:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __58__MKBKeyStoreDevice_setVolumeToPersona_withPersonaString___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)createSyncBagForUserSession:(id)a3 withSessionUID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_227);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__MKBKeyStoreDevice_createSyncBagForUserSession_withSessionUID___block_invoke_2;
  v11[3] = &unk_1E67572F8;
  v13 = &v14;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "createSyncBagForUserSession:withSessionUID:withReply:", v6, v4, v11);
  LODWORD(v4) = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __64__MKBKeyStoreDevice_createSyncBagForUserSession_withSessionUID___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice createSyncBagForUserSession:withSessionUID:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __64__MKBKeyStoreDevice_createSyncBagForUserSession_withSessionUID___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)loadSyncBagForUserSession:(id)a3 withSessionUID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_228);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__MKBKeyStoreDevice_loadSyncBagForUserSession_withSessionUID___block_invoke_2;
  v11[3] = &unk_1E67572F8;
  v13 = &v14;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "loadSyncBagForUserSession:withSessionUID:withReply:", v6, v4, v11);
  LODWORD(v4) = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __62__MKBKeyStoreDevice_loadSyncBagForUserSession_withSessionUID___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice loadSyncBagForUserSession:withSessionUID:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __62__MKBKeyStoreDevice_loadSyncBagForUserSession_withSessionUID___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)verifySyncBagForUserSession:(id)a3 withSessionUID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_229);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__MKBKeyStoreDevice_verifySyncBagForUserSession_withSessionUID___block_invoke_2;
  v11[3] = &unk_1E67572F8;
  v13 = &v14;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "verifySyncBagForUserSession:withSessionUID:withReply:", v6, v4, v11);
  LODWORD(v4) = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __64__MKBKeyStoreDevice_verifySyncBagForUserSession_withSessionUID___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice verifySyncBagForUserSession:withSessionUID:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __64__MKBKeyStoreDevice_verifySyncBagForUserSession_withSessionUID___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)unloadSyncBagForUserSession:(id)a3 withSessionUID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_230);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__MKBKeyStoreDevice_unloadSyncBagForUserSession_withSessionUID___block_invoke_2;
  v11[3] = &unk_1E67572F8;
  v13 = &v14;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "unloadSyncBagForUserSession:withSessionUID:withReply:", v6, v4, v11);
  LODWORD(v4) = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __64__MKBKeyStoreDevice_unloadSyncBagForUserSession_withSessionUID___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice unloadSyncBagForUserSession:withSessionUID:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __64__MKBKeyStoreDevice_unloadSyncBagForUserSession_withSessionUID___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)removeSyncBagForUserSession:(id)a3 withSessionUID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_231);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__MKBKeyStoreDevice_removeSyncBagForUserSession_withSessionUID___block_invoke_2;
  v11[3] = &unk_1E67572F8;
  v13 = &v14;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "removeSyncBagForUserSession:withSessionUID:withReply:", v6, v4, v11);
  LODWORD(v4) = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __64__MKBKeyStoreDevice_removeSyncBagForUserSession_withSessionUID___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice removeSyncBagForUserSession:withSessionUID:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __64__MKBKeyStoreDevice_removeSyncBagForUserSession_withSessionUID___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)addPersonaKeyForUserSession:(unsigned int)a3 withSecret:(id)a4 withPersonaUUIDString:(id)a5 forPath:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  int v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && objc_msgSend(v10, "length"))
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "length");
  }
  else
  {
    v15 = 0;
    v14 = 0;
  }
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_232);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__MKBKeyStoreDevice_addPersonaKeyForUserSession_withSecret_withPersonaUUIDString_forPath___block_invoke_2;
  v20[3] = &unk_1E67572F8;
  v22 = &v23;
  v17 = v13;
  v21 = v17;
  objc_msgSend(v16, "createPersonaKeyForUserSession:forPath:withUID:WithSecret:secretSize:withReply:", v11, v12, v8, v14, v15, v20);
  v18 = *((_DWORD *)v24 + 6);

  _Block_object_dispose(&v23, 8);
  return v18;
}

void __90__MKBKeyStoreDevice_addPersonaKeyForUserSession_withSecret_withPersonaUUIDString_forPath___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice addPersonaKeyForUserSession:withSecret:withPersonaUUIDString:forPath:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __90__MKBKeyStoreDevice_addPersonaKeyForUserSession_withSecret_withPersonaUUIDString_forPath___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)removePersonaKeyForUserSession:(unsigned int)a3 withPersonaUUIDString:(id)a4 withVolumeUUIDString:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_233);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__MKBKeyStoreDevice_removePersonaKeyForUserSession_withPersonaUUIDString_withVolumeUUIDString___block_invoke_2;
  v14[3] = &unk_1E67572F8;
  v16 = &v17;
  v12 = v10;
  v15 = v12;
  objc_msgSend(v11, "removePersonaKeyForUserSession:withUID:withVolumeUUIDString:withReply:", v8, v6, v9, v14);
  LODWORD(v6) = *((_DWORD *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  return v6;
}

void __95__MKBKeyStoreDevice_removePersonaKeyForUserSession_withPersonaUUIDString_withVolumeUUIDString___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a2, "code");
  debuglog("-[MKBKeyStoreDevice removePersonaKeyForUserSession:withPersonaUUIDString:withVolumeUUIDString:]_block_invoke", CFSTR("got error from remote proxy: %ld"), v3, v4, v5, v6, v7, v8, v2);
}

uint64_t __95__MKBKeyStoreDevice_removePersonaKeyForUserSession_withPersonaUUIDString_withVolumeUUIDString___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  if (a2)
    v3 = objc_msgSend(a2, "code");
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

@end
