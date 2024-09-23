@implementation FSModuleConnector

- (void)sendTaskUpdate:(id)a3
{
  NSXPCConnection *ourConnection;
  id v4;
  id v5;

  ourConnection = self->_ourConnection;
  if (ourConnection)
  {
    v4 = a3;
    -[NSXPCConnection remoteObjectProxy](ourConnection, "remoteObjectProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskStatusUpdate:", v4);

  }
}

- (void)sendRevokeResource:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *ourConnection;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  fskit_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FSModuleConnector sendRevokeResource:].cold.3(v4, v5);

  ourConnection = self->_ourConnection;
  if (ourConnection)
  {
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](ourConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_2);
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject revokeResource:replyHandler:](v7, "revokeResource:replyHandler:", v4, &__block_literal_global_226);
    fskit_std_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[FSModuleConnector sendRevokeResource:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  else
  {
    fskit_std_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FSModuleConnector sendRevokeResource:].cold.1(v7, v16, v17);
  }

}

void __40__FSModuleConnector_sendRevokeResource___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  fskit_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__FSModuleConnector_sendRevokeResource___block_invoke_cold_1();

}

void __40__FSModuleConnector_sendRevokeResource___block_invoke_225(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __40__FSModuleConnector_sendRevokeResource___block_invoke_225_cold_1();

  }
}

- (void)sendCloseResource:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *ourConnection;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  fskit_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FSModuleConnector sendCloseResource:].cold.3(v4, v5);

  ourConnection = self->_ourConnection;
  if (ourConnection)
  {
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](ourConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_227);
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject closeResource:replyHandler:](v7, "closeResource:replyHandler:", v4, &__block_literal_global_229);
    fskit_std_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[FSModuleConnector sendCloseResource:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  else
  {
    fskit_std_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FSModuleConnector sendCloseResource:].cold.1(v7, v16, v17);
  }

}

void __39__FSModuleConnector_sendCloseResource___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  fskit_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __39__FSModuleConnector_sendCloseResource___block_invoke_cold_1();

}

void __39__FSModuleConnector_sendCloseResource___block_invoke_228(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __39__FSModuleConnector_sendCloseResource___block_invoke_228_cold_1();

  }
}

- (void)sendIsVolumeUsed:(id)a3 bundle:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSXPCConnection *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  fskit_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[FSModuleConnector sendIsVolumeUsed:bundle:replyHandler:].cold.2();

  v12 = self->_ourConnection;
  if (v12)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __58__FSModuleConnector_sendIsVolumeUsed_bundle_replyHandler___block_invoke;
    v23[3] = &unk_250C31EC8;
    v13 = v10;
    v24 = v13;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v12, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "isVolumeIDUsed:bundle:replyHandler:", v8, v9, v13);
    fskit_std_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[FSModuleConnector sendIsVolumeUsed:bundle:replyHandler:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

  }
}

void __58__FSModuleConnector_sendIsVolumeUsed_bundle_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__FSModuleConnector_sendIsVolumeUsed_bundle_replyHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendWipeResource:(id)a3 includingBlockRanges:(id)a4 excludingBlockRanges:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSXPCConnection *v22;
  FSModuleExtension *v23;
  uint64_t v24;
  id v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  FSModuleExtension *v36;
  id v37;
  _QWORD v38[4];
  id v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  fskit_std_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[FSModuleConnector sendWipeResource:includingBlockRanges:excludingBlockRanges:replyHandler:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);

  v22 = self->_ourConnection;
  v23 = self->_ourModule;
  if (v22)
  {
    if (-[FSModuleExtension delegateConformantFS](self->_ourModule, "delegateConformantFS"))
    {
      v24 = MEMORY[0x24BDAC760];
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __93__FSModuleConnector_sendWipeResource_includingBlockRanges_excludingBlockRanges_replyHandler___block_invoke;
      v38[3] = &unk_250C31EC8;
      v25 = v13;
      v39 = v25;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v22, "remoteObjectProxyWithErrorHandler:", v38);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v24;
      v35[1] = 3221225472;
      v35[2] = __93__FSModuleConnector_sendWipeResource_includingBlockRanges_excludingBlockRanges_replyHandler___block_invoke_230;
      v35[3] = &unk_250C31FB8;
      v36 = v23;
      v37 = v25;
      objc_msgSend(v26, "wipeResource:includingRanges:excludingRanges:replyHandler:", v10, v11, v12, v35);
      fskit_std_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[FSModuleConnector sendWipeResource:includingBlockRanges:excludingBlockRanges:replyHandler:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);

    }
    else
    {
      fs_errorForPOSIXError(8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v13 + 2))(v13, v26);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

void __93__FSModuleConnector_sendWipeResource_includingBlockRanges_excludingBlockRanges_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __93__FSModuleConnector_sendWipeResource_includingBlockRanges_excludingBlockRanges_replyHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__FSModuleConnector_sendWipeResource_includingBlockRanges_excludingBlockRanges_replyHandler___block_invoke_230(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __93__FSModuleConnector_sendWipeResource_includingBlockRanges_excludingBlockRanges_replyHandler___block_invoke_230_cold_2(a1);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __93__FSModuleConnector_sendWipeResource_includingBlockRanges_excludingBlockRanges_replyHandler___block_invoke_230_cold_1(a1, v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)sendConfigureUserClient:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  fskit_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FSModuleConnector sendConfigureUserClient:replyHandler:].cold.2();

  v9 = self->_ourConnection;
  if (v9)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __58__FSModuleConnector_sendConfigureUserClient_replyHandler___block_invoke;
    v20[3] = &unk_250C31EC8;
    v10 = v7;
    v21 = v10;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v9, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configureUserClient:replyHandler:", v6, v10);
    fskit_std_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[FSModuleConnector sendConfigureUserClient:replyHandler:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
}

void __58__FSModuleConnector_sendConfigureUserClient_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__FSModuleConnector_sendConfigureUserClient_replyHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ping:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = (void (**)(id, void *))a3;
  fskit_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FSModuleConnector ping:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  if (-[FSModuleExtension delegateConformantFS](self->_ourModule, "delegateConformantFS"))
  {
    v13 = 0;
  }
  else
  {
    fs_errorForPOSIXError(8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4[2](v4, v13);

}

- (void)checkIn:(id)a3 replyHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  FSModuleExtension *v9;
  void *v10;
  FSModuleExtension *ourModule;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  fskit_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl(&dword_23B2A6000, v8, OS_LOG_TYPE_DEFAULT, "FSModuleExtension.checkIn:extensionID:%@", buf, 0xCu);
  }

  v9 = self->_ourModule;
  objc_sync_enter(v9);
  -[FSModuleExtension instanceID](self->_ourModule, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  ourModule = self->_ourModule;
  if (!v10)
  {
    -[FSModuleExtension setInstanceID:](ourModule, "setInstanceID:", v6);
    goto LABEL_9;
  }
  -[FSModuleExtension instanceID](ourModule, "instanceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", v6);

  if ((v13 & 1) != 0)
  {
LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  fskit_std_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    -[FSModuleExtension instanceID](self->_ourModule, "instanceID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleConnector checkIn:replyHandler:].cold.1((uint64_t)v6, v15, (uint64_t)buf, v14);
  }

  fs_errorForPOSIXError(17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  objc_sync_exit(v9);

  fskit_std_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v16;
    _os_log_impl(&dword_23B2A6000, v17, OS_LOG_TYPE_DEFAULT, "FSModuleExtension.checkIn returning %@", (uint8_t *)&v18, 0xCu);
  }

  v7[2](v7, v16);
}

- (void)getLegacyVolumeEndpoint:(id)a3 replyHandler:(id)a4
{
  void (**v4)(id, _QWORD, id);
  id v5;

  v4 = (void (**)(id, _QWORD, id))a4;
  fs_errorForPOSIXError(45);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v5);

}

- (void)getVolumeEndpoint:(id)a3 replyHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  fskit_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315394;
    v17 = "-[FSModuleConnector getVolumeEndpoint:replyHandler:]";
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_23B2A6000, v8, OS_LOG_TYPE_DEFAULT, "%s:start:volID:%@", (uint8_t *)&v16, 0x16u);
  }

  if (v6)
  {
    -[FSModuleExtension volumes](self->_ourModule, "volumes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "listener");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "endpoint");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      fskit_std_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "listener");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 136315906;
        v17 = "-[FSModuleConnector getVolumeEndpoint:replyHandler:]";
        v18 = 2112;
        v19 = v6;
        v20 = 2112;
        v21 = v14;
        v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_23B2A6000, v13, OS_LOG_TYPE_DEFAULT, "%s:end:found:volID:%@ listener %@ returning ep %@", (uint8_t *)&v16, 0x2Au);

      }
      v7[2](v7, v12, 0);
    }
    else
    {
      fskit_std_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315394;
        v17 = "-[FSModuleConnector getVolumeEndpoint:replyHandler:]";
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_23B2A6000, v15, OS_LOG_TYPE_DEFAULT, "%s:end:ENOENT:volID:%@", (uint8_t *)&v16, 0x16u);
      }

      fs_errorForPOSIXError(2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v12);
    }

  }
  else
  {
    fs_errorForPOSIXError(5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v10);
  }

}

- (void)probeResource:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD aBlock[5];
  id v16;
  id v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[FSModuleExtension supportsBlockOps](self->_ourModule, "supportsBlockOps"))
  {
    if (objc_msgSend(v6, "kind") == 1)
    {
      +[FSResource dynamicCast:](FSBlockDeviceResource, "dynamicCast:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        fskit_std_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v19 = objc_msgSend(v8, "fileDescriptor");
          _os_log_impl(&dword_23B2A6000, v9, OS_LOG_TYPE_DEFAULT, "Successful dynamic cast of resource to bd. Got fd %d", buf, 8u);
        }

        objc_msgSend(v8, "readFirstSectorAndLog");
      }

    }
    -[_EXExtension delegate](self->_ourModule, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__FSModuleConnector_probeResource_replyHandler___block_invoke;
    aBlock[3] = &unk_250C31FE0;
    aBlock[4] = self;
    v11 = v6;
    v16 = v11;
    v17 = v7;
    v12 = _Block_copy(aBlock);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      fskit_std_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[FSModuleConnector probeResource:replyHandler:].cold.1((uint64_t)v10, v13);

    }
    objc_msgSend(v10, "probeResource:replyHandler:", v11, v12);

  }
  else
  {
    fs_errorForPOSIXError(45);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);

  }
}

void __48__FSModuleConnector_probeResource_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  fskit_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_23B2A6000, v7, OS_LOG_TYPE_DEFAULT, "Returning %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "sendCloseResource:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)checkResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 replyHandler:(id)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  FSModuleExtension *v15;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  FSModuleExtension *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  FSModuleExtension *v43;
  FSModuleConnector *v44;
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[4];
  id v49;
  uint8_t buf[4];
  const char *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v31 = a4;
  v34 = a5;
  v12 = a6;
  v33 = a7;
  fskit_std_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v51 = "-[FSModuleConnector checkResource:options:connection:taskID:replyHandler:]";
    _os_log_impl(&dword_23B2A6000, v13, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }

  if (-[FSModuleExtension supportsSimpleMaintenanceOps](self->_ourModule, "supportsSimpleMaintenanceOps"))
  {
    -[_EXExtension delegate](self->_ourModule, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 100);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_ourModule;
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke;
    v48[3] = &unk_250C31EC8;
    v16 = v33;
    v49 = v16;
    objc_msgSend(v34, "connect:", v48);
    v17 = FSTaskPurposeCheck;
    -[FSModuleExtension bundleID](v15, "bundleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleExtension instanceID](v15, "instanceID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[FSTaskDescription taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:](FSTaskDescription, "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:", v12, 1, v17, 0, v18, v19, v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    +[FSModuleTask taskWithID:description:progress:](FSModuleTask, "taskWithID:description:progress:", v12, v20, v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_237;
    v46[3] = &unk_250C32008;
    v46[4] = self;
    v21 = v32;
    v47 = v21;
    objc_msgSend(v34, "setEarlyCompletedBlock:", v46);
    -[FSModuleExtension taskSet](self->_ourModule, "taskSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v22);
    -[FSModuleExtension taskSet](v15, "taskSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v30, v12);

    objc_sync_exit(v22);
    dispatch_get_global_queue(0, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_2;
    block[3] = &unk_250C32078;
    v36 = v20;
    v45 = v16;
    v37 = v29;
    v38 = v21;
    v39 = v31;
    v40 = v34;
    v41 = v12;
    v42 = v14;
    v43 = v15;
    v44 = self;
    v25 = v15;
    v26 = v14;
    v27 = v29;
    v28 = v20;
    dispatch_async(v24, block);

  }
  else
  {
    fs_errorForPOSIXError(45);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v33 + 2))(v33, v27);
  }

}

void __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (a2)
  {
    v3 = a2;
    fskit_std_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23B2A6000, v4, OS_LOG_TYPE_DEFAULT, "check: encountered connect error!", v5, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_237(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendRevokeResource:", *(_QWORD *)(a1 + 40));
}

void __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_238;
  aBlock[3] = &unk_250C32030;
  v12 = *(id *)(a1 + 104);
  v13 = &v19;
  v14 = &v15;
  v3 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 40), "checkResource:options:connection:taskID:progress:replyHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v3);
  v4 = objc_msgSend(*(id *)(a1 + 80), "totalUnitCount");
  if (v4 > objc_msgSend(*(id *)(a1 + 80), "completedUnitCount"))
    objc_msgSend(*(id *)(a1 + 80), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 80), "totalUnitCount"));
  objc_msgSend(*(id *)(a1 + 64), "completed:replyHandler:", 0, &__block_literal_global_241);
  if (*((_BYTE *)v16 + 24))
  {
    if (!v20[5])
    {
      objc_msgSend(v2, "updatedDescriptionInState:error:", 3, 0);
      v5 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 96), "sendTaskUpdate:", v5);
      v2 = (id)v5;
    }
  }
  else
  {
    fskit_std_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 88), "bundleID");
      objc_claimAutoreleasedReturnValue();
      __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_2_cold_1();
    }

    v7 = *(_QWORD *)(a1 + 104);
    fs_errorForPOSIXError(43);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
  objc_msgSend(*(id *)(a1 + 88), "taskSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v9);
  objc_msgSend(*(id *)(a1 + 88), "taskSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", *(_QWORD *)(a1 + 72));

  objc_sync_exit(v9);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

}

void __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_238(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  (*(void (**)(void))(a1[4] + 16))();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
}

- (void)checkWithOptions:(id)a3 connection:(id)a4 taskID:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  FSModuleExtension *v14;
  FSModuleExtension *v15;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  FSModuleExtension *v40;
  FSModuleConnector *v41;
  id v42;
  __int128 *p_buf;
  _QWORD v44[4];
  id v45;
  _QWORD v46[5];
  FSModuleExtension *v47;
  __int128 buf;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v10 = a4;
  v33 = a5;
  v11 = a6;
  fskit_std_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[FSModuleConnector checkWithOptions:connection:taskID:replyHandler:]";
    _os_log_impl(&dword_23B2A6000, v12, OS_LOG_TYPE_DEFAULT, "%s:start", (uint8_t *)&buf, 0xCu);
  }

  if (-[FSModuleExtension supportsSimpleMaintenanceOps](self->_ourModule, "supportsSimpleMaintenanceOps"))
  {
    -[_EXExtension delegate](self->_ourModule, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy_;
    v51 = __Block_byref_object_dispose_;
    v52 = 0;
    v14 = self->_ourModule;
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke;
    v46[3] = &unk_250C32008;
    v46[4] = self;
    v15 = v14;
    v47 = v15;
    objc_msgSend(v10, "setEarlyCompletedBlock:", v46);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_244;
      v44[3] = &unk_250C31EC8;
      v16 = v11;
      v45 = v16;
      objc_msgSend(v10, "connect:", v44);
      v17 = FSTaskPurposeCheck;
      -[FSModuleExtension bundleID](v15, "bundleID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[FSModuleExtension instanceID](v15, "instanceID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[FSTaskDescription taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:](FSTaskDescription, "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:", v33, 1, v17, 0, v18, v19, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_get_global_queue(0, 0);
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_245;
      block[3] = &unk_250C320E8;
      v22 = v20;
      v35 = v22;
      v36 = v13;
      v37 = v32;
      v38 = v10;
      v39 = v33;
      v40 = v15;
      p_buf = &buf;
      v41 = self;
      v42 = v16;
      dispatch_async(v21, block);

      v23 = v45;
    }
    else
    {
      fskit_std_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[FSModuleConnector checkWithOptions:connection:taskID:replyHandler:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

      -[FSModuleExtension resource](v15, "resource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[FSModuleConnector checkResource:options:connection:taskID:replyHandler:](self, "checkResource:options:connection:taskID:replyHandler:", v23, v32, v10, v33, v11);
      v22 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    fs_errorForPOSIXError(45);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v11 + 2))(v11, v13);
  }

}

void __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "resource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendRevokeResource:", v2);

}

void __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_244(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (a2)
  {
    v3 = a2;
    fskit_std_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23B2A6000, v4, OS_LOG_TYPE_DEFAULT, "checkWithOptions: encountered connect error!", v5, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_245(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 64);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_2;
  v17[3] = &unk_250C320A0;
  v18 = v5;
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 72);
  v16 = *(_OWORD *)(a1 + 88);
  v7 = (id)v16;
  v21 = v16;
  v22 = &v28;
  v23 = &v24;
  objc_msgSend(v3, "checkWithParameters:connection:taskID:replyHandler:", v4, v6, v18, v17);

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  if (v8)
  {
    v9 = objc_msgSend(v8, "totalUnitCount");
    if (v9 > objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "completedUnitCount"))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "totalUnitCount"));
  }
  objc_msgSend(*(id *)(a1 + 56), "completed:replyHandler:", 0, &__block_literal_global_247, v16);
  if (*((_BYTE *)v25 + 24))
  {
    if (!v29[5])
    {
      objc_msgSend(v2, "updatedDescriptionInState:error:", 3, 0);
      v10 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 80), "sendTaskUpdate:", v10);
      v2 = (id)v10;
    }
  }
  else
  {
    fskit_std_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 72), "bundleID");
      objc_claimAutoreleasedReturnValue();
      __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_245_cold_1();
    }

    v12 = *(_QWORD *)(a1 + 88);
    fs_errorForPOSIXError(43);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
  objc_msgSend(*(id *)(a1 + 72), "taskSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  objc_msgSend(*(id *)(a1 + 72), "taskSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectForKey:", *(_QWORD *)(a1 + 64));

  objc_sync_exit(v14);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

}

void __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  v6 = a3;
  if (!v6)
  {
    +[FSModuleTask taskWithID:description:progress:](FSModuleTask, "taskWithID:description:progress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "taskSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v8);
    objc_msgSend(*(id *)(a1 + 48), "taskSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v7, *(_QWORD *)(a1 + 32));

    objc_sync_exit(v8);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;
  v12 = v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
}

- (void)formatResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  FSModuleExtension *v19;
  uint64_t v20;
  id v21;
  id v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  FSModuleExtension *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD block[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  FSModuleExtension *v48;
  FSModuleConnector *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[5];
  id v54;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  fskit_std_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23B2A6000, v17, OS_LOG_TYPE_DEFAULT, "formatResource:options:connection:taskID:reply", buf, 2u);
  }

  if (-[FSModuleExtension supportsSimpleMaintenanceOps](self->_ourModule, "supportsSimpleMaintenanceOps"))
  {
    v38 = v13;
    -[_EXExtension delegate](self->_ourModule, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 100);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self->_ourModule;
    v20 = MEMORY[0x24BDAC760];
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke;
    v53[3] = &unk_250C32008;
    v53[4] = self;
    v39 = v12;
    v21 = v12;
    v54 = v21;
    objc_msgSend(v14, "setEarlyCompletedBlock:", v53);
    v51[0] = v20;
    v51[1] = 3221225472;
    v51[2] = __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_2;
    v51[3] = &unk_250C31EC8;
    v36 = v16;
    v22 = v16;
    v52 = v22;
    v37 = v14;
    objc_msgSend(v14, "connect:", v51);
    v23 = FSTaskPurposeFormat;
    -[FSModuleExtension bundleID](v19, "bundleID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleExtension instanceID](v19, "instanceID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[FSTaskDescription taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:](FSTaskDescription, "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:", v15, 1, v23, 0, v24, v25, v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    +[FSModuleTask taskWithID:description:progress:](FSModuleTask, "taskWithID:description:progress:", v15, v26, v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleExtension taskSet](self->_ourModule, "taskSet");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v28);
    -[FSModuleExtension taskSet](v19, "taskSet");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", v27, v15);

    objc_sync_exit(v28);
    dispatch_get_global_queue(0, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_248;
    block[3] = &unk_250C32078;
    v41 = v26;
    v50 = v22;
    v42 = v35;
    v43 = v21;
    v44 = v38;
    v45 = v37;
    v46 = v15;
    v47 = v18;
    v48 = v19;
    v49 = self;
    v31 = v19;
    v32 = v18;
    v33 = v35;
    v34 = v26;
    dispatch_async(v30, block);

    v13 = v38;
    v14 = v37;

    v12 = v39;
    v16 = v36;
  }
  else
  {
    fs_errorForPOSIXError(45);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v16 + 2))(v16, v33);
  }

}

uint64_t __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendRevokeResource:", *(_QWORD *)(a1 + 40));
}

void __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (a2)
  {
    v3 = a2;
    fskit_std_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23B2A6000, v4, OS_LOG_TYPE_DEFAULT, "formatResource: encountered on connect error!", v5, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_248(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_2_249;
  aBlock[3] = &unk_250C32030;
  v12 = *(id *)(a1 + 104);
  v13 = &v19;
  v14 = &v15;
  v3 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 40), "formatResource:options:connection:taskID:progress:replyHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v3);
  v4 = objc_msgSend(*(id *)(a1 + 80), "totalUnitCount");
  if (v4 > objc_msgSend(*(id *)(a1 + 80), "completedUnitCount"))
    objc_msgSend(*(id *)(a1 + 80), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 80), "totalUnitCount"));
  objc_msgSend(*(id *)(a1 + 64), "completed:replyHandler:", 0, &__block_literal_global_250);
  if (*((_BYTE *)v16 + 24))
  {
    if (!v20[5])
    {
      objc_msgSend(v2, "updatedDescriptionInState:error:", 3, 0);
      v5 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 96), "sendTaskUpdate:", v5);
      v2 = (id)v5;
    }
  }
  else
  {
    fskit_std_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 88), "bundleID");
      objc_claimAutoreleasedReturnValue();
      __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_248_cold_1();
    }

    v7 = *(_QWORD *)(a1 + 104);
    fs_errorForPOSIXError(43);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
  objc_msgSend(*(id *)(a1 + 88), "taskSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v9);
  objc_msgSend(*(id *)(a1 + 88), "taskSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", *(_QWORD *)(a1 + 72));

  objc_sync_exit(v9);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

}

void __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_2_249(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  (*(void (**)(void))(a1[4] + 16))();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
}

- (void)formatWithOptions:(id)a3 connection:(id)a4 taskID:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  FSModuleExtension *v14;
  FSModuleExtension *v15;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  FSModuleExtension *v40;
  FSModuleConnector *v41;
  id v42;
  __int128 *p_buf;
  _QWORD v44[4];
  id v45;
  _QWORD v46[5];
  FSModuleExtension *v47;
  __int128 buf;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v10 = a4;
  v33 = a5;
  v11 = a6;
  fskit_std_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[FSModuleConnector formatWithOptions:connection:taskID:replyHandler:]";
    _os_log_impl(&dword_23B2A6000, v12, OS_LOG_TYPE_DEFAULT, "%s:start", (uint8_t *)&buf, 0xCu);
  }

  if (-[FSModuleExtension supportsSimpleMaintenanceOps](self->_ourModule, "supportsSimpleMaintenanceOps"))
  {
    -[_EXExtension delegate](self->_ourModule, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy_;
    v51 = __Block_byref_object_dispose_;
    v52 = 0;
    v14 = self->_ourModule;
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke;
    v46[3] = &unk_250C32008;
    v46[4] = self;
    v15 = v14;
    v47 = v15;
    objc_msgSend(v10, "setEarlyCompletedBlock:", v46);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_252;
      v44[3] = &unk_250C31EC8;
      v16 = v11;
      v45 = v16;
      objc_msgSend(v10, "connect:", v44);
      v17 = FSTaskPurposeFormat;
      -[FSModuleExtension bundleID](v15, "bundleID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[FSModuleExtension instanceID](v15, "instanceID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[FSTaskDescription taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:](FSTaskDescription, "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:", v33, 1, v17, 0, v18, v19, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_get_global_queue(0, 0);
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_253;
      block[3] = &unk_250C320E8;
      v22 = v20;
      v35 = v22;
      v36 = v13;
      v37 = v32;
      v38 = v10;
      v39 = v33;
      v40 = v15;
      p_buf = &buf;
      v41 = self;
      v42 = v16;
      dispatch_async(v21, block);

      v23 = v45;
    }
    else
    {
      fskit_std_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[FSModuleConnector formatWithOptions:connection:taskID:replyHandler:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

      -[FSModuleExtension resource](v15, "resource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[FSModuleConnector formatResource:options:connection:taskID:replyHandler:](self, "formatResource:options:connection:taskID:replyHandler:", v23, v32, v10, v33, v11);
      v22 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    fs_errorForPOSIXError(45);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v11 + 2))(v11, v13);
  }

}

void __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "resource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendRevokeResource:", v2);

}

void __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_252(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (a2)
  {
    v3 = a2;
    fskit_std_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23B2A6000, v4, OS_LOG_TYPE_DEFAULT, "formatResource: encountered on connect error!", v5, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_253(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 64);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_2;
  v17[3] = &unk_250C320A0;
  v18 = v5;
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 72);
  v16 = *(_OWORD *)(a1 + 88);
  v7 = (id)v16;
  v21 = v16;
  v22 = &v28;
  v23 = &v24;
  objc_msgSend(v3, "formatWithParameters:connection:taskID:replyHandler:", v4, v6, v18, v17);

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  if (v8)
  {
    v9 = objc_msgSend(v8, "totalUnitCount");
    if (v9 > objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "completedUnitCount"))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "totalUnitCount"));
  }
  objc_msgSend(*(id *)(a1 + 56), "completed:replyHandler:", 0, &__block_literal_global_254, v16);
  if (*((_BYTE *)v25 + 24))
  {
    if (!v29[5])
    {
      objc_msgSend(v2, "updatedDescriptionInState:error:", 3, 0);
      v10 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 80), "sendTaskUpdate:", v10);
      v2 = (id)v10;
    }
  }
  else
  {
    fskit_std_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 72), "bundleID");
      objc_claimAutoreleasedReturnValue();
      __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_253_cold_1();
    }

    v12 = *(_QWORD *)(a1 + 88);
    fs_errorForPOSIXError(43);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
  objc_msgSend(*(id *)(a1 + 72), "taskSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  objc_msgSend(*(id *)(a1 + 72), "taskSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectForKey:", *(_QWORD *)(a1 + 64));

  objc_sync_exit(v14);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

}

void __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  v6 = a3;
  if (!v6)
  {
    +[FSModuleTask taskWithID:description:progress:](FSModuleTask, "taskWithID:description:progress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "taskSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v8);
    objc_msgSend(*(id *)(a1 + 48), "taskSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v7, *(_QWORD *)(a1 + 32));

    objc_sync_exit(v8);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;
  v12 = v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
}

- (void)loadResource:(id)a3 options:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  FSModuleExtension *v12;
  NSObject *v13;
  FSModuleExtension *v14;
  _QWORD block[4];
  FSModuleExtension *v16;
  id v17;
  FSModuleConnector *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  fskit_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[FSModuleConnector loadResource:options:replyHandler:]";
    _os_log_impl(&dword_23B2A6000, v11, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }

  if (-[FSModuleExtension isNormalFS](self->_ourModule, "isNormalFS")
    || -[FSModuleExtension isSimpleFS](self->_ourModule, "isSimpleFS"))
  {
    v12 = self->_ourModule;
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke;
    block[3] = &unk_250C32218;
    v16 = v12;
    v17 = v8;
    v18 = self;
    v20 = v10;
    v19 = v9;
    v14 = v12;
    dispatch_async(v13, block);

  }
  else
  {
    fs_errorForPOSIXError(45);
    v14 = (FSModuleExtension *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, FSModuleExtension *))v10 + 2))(v10, 0, v14);
  }

}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id *v12;
  id *v13;
  id *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[2];
  _QWORD v30[3];
  _QWORD aBlock[4];
  id v32;
  _QWORD v33[2];
  _QWORD v34[3];
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  v46 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "isNormalFS") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "isSimpleFS"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "supportsBlockOps"))
    {
      objc_msgSend(*(id *)(a1 + 32), "fsMachPort");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2 == 0;

      if (!v3)
      {
        v4 = *(void **)(a1 + 32);
        objc_msgSend(v4, "fsMachPort");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_2;
        v35[3] = &unk_250C32150;
        v36 = *(id *)(a1 + 32);
        objc_msgSend(v4, "sendConfigureUserClient:replyHandler:", v5, v35);

      }
    }
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "isNormalFS");
  v7 = *(void **)(a1 + 32);
  if (!v6)
  {
    if (!objc_msgSend(v7, "isSimpleFS"))
      goto LABEL_16;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_263;
    v27[3] = &unk_250C321F0;
    v28 = *(id *)(a1 + 32);
    v30[1] = &v41;
    v15 = *(id *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    v29[0] = v15;
    v29[1] = v16;
    v30[0] = *(id *)(a1 + 64);
    v30[2] = &v37;
    v11 = _Block_copy(v27);
    v12 = &v28;
    v13 = (id *)v29;
    v14 = (id *)v30;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 56), "parameters");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "loadResource:options:replyHandler:", v17, v18, v11);

      goto LABEL_15;
    }
    fs_errorForPOSIXError(45);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v42[5];
    v42[5] = v21;

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_14:
    *((_BYTE *)v38 + 24) = 1;
    goto LABEL_15;
  }
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_255;
  aBlock[3] = &unk_250C321C8;
  v32 = *(id *)(a1 + 32);
  v34[1] = &v41;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v33[0] = v9;
  v33[1] = v10;
  v34[0] = *(id *)(a1 + 64);
  v34[2] = &v37;
  v11 = _Block_copy(aBlock);
  v12 = &v32;
  v13 = (id *)v33;
  v14 = (id *)v34;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    fs_errorForPOSIXError(45);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v42[5];
    v42[5] = v19;

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_14;
  }
  objc_msgSend(v8, "loadResource:options:replyHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v11);
LABEL_15:

LABEL_16:
  if (!*((_BYTE *)v38 + 24))
  {
    fskit_std_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleID");
      objc_claimAutoreleasedReturnValue();
      __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_cold_2();
    }

    v24 = *(_QWORD *)(a1 + 64);
    fs_errorForPOSIXError(43);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v24 + 16))(v24, 0, v25);

  }
  if (!v42[5])
  {
    fskit_std_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "getResourceID");
      objc_claimAutoreleasedReturnValue();
      __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 32), "setResource:", *(_QWORD *)(a1 + 40));
  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v3, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v7 = 136315650;
    v8 = "-[FSModuleConnector loadResource:options:replyHandler:]_block_invoke_2";
    v9 = 2114;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_23B2A6000, v4, OS_LOG_TYPE_DEFAULT, "%s: configureUserClient for FSModule %{public}@ returned error (%@)", (uint8_t *)&v7, 0x20u);
    if (v3)

  }
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_255(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v5 = a3;
  v7 = v5;
  v8 = 0;
  if (a2 && !v5)
  {
    v9 = a2;
    v10 = (void *)objc_opt_new();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_2_256;
    v17[3] = &unk_250C321A0;
    v11 = *(id *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 64);
    v18 = v11;
    v21 = v12;
    v19 = *(id *)(a1 + 40);
    v8 = v10;
    v20 = v8;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v17);

    fskit_std_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_255_cold_1(a1, v13);

  }
  (*(void (**)(_QWORD, id, void *, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v8, v7, v6);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v7;
  v16 = v7;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_2_256(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "volumeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_3;
  v21[3] = &unk_250C32178;
  v7 = *(_QWORD *)(a1 + 56);
  v21[4] = &v22;
  v21[5] = v7;
  objc_msgSend(v4, "sendIsVolumeUsed:bundle:replyHandler:", v5, v6, v21);

  if (*((_BYTE *)v23 + 24))
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "fs_volumeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setVolumeID:", v9);

    fskit_std_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "volumeID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "getResourceID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "volumeID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v27 = "-[FSModuleConnector loadResource:options:replyHandler:]_block_invoke_2";
      v28 = 2112;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      v32 = 2112;
      v33 = v20;
      _os_log_error_impl(&dword_23B2A6000, v10, OS_LOG_TYPE_ERROR, "%s: VolumeID (%@) of resource (%@) is being used, using new volumeID (%@) to avoid collision.", buf, 0x2Au);

    }
  }
  +[FSModuleVolume volumeWithName:resource:](FSModuleVolume, "volumeWithName:resource:", v3, *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOurExtension:", *(_QWORD *)(a1 + 32));
  fskit_std_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_2_256_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "volumes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v11, v14);

  objc_msgSend(v3, "volumeID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FSVolumeDescription volumeDescriptionWithID:name:state:](FSVolumeDescription, "volumeDescriptionWithID:name:state:", v15, v16, objc_msgSend(v3, "state"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);
  _Block_object_dispose(&v22, 8);

}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_3(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_263(uint64_t a1, void *a2, void *a3)
{
  char *v5;
  id v6;
  NSObject *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  _QWORD v33[6];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  fskit_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v40 = v5;
    v41 = 2112;
    v42 = (uint64_t)v6;
    _os_log_impl(&dword_23B2A6000, v7, OS_LOG_TYPE_DEFAULT, "loadResource returned vol %@ and error %@", buf, 0x16u);
  }

  v8 = 0;
  if (v5 && !v6)
  {
    v9 = v5;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v9, "volumeID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_264;
    v33[3] = &unk_250C32178;
    v13 = *(_QWORD *)(a1 + 64);
    v33[4] = &v34;
    v33[5] = v13;
    objc_msgSend(v10, "sendIsVolumeUsed:bundle:replyHandler:", v11, v12, v33);

    if (*((_BYTE *)v35 + 24))
    {
      v14 = (void *)objc_opt_new();
      objc_msgSend(v9, "setVolumeID:", v14);

      fskit_std_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "volumeID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "getResourceID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "volumeID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v40 = "-[FSModuleConnector loadResource:options:replyHandler:]_block_invoke_2";
        v41 = 2112;
        v42 = (uint64_t)v16;
        v43 = 2112;
        v44 = v17;
        v45 = 2112;
        v46 = v18;
        _os_log_impl(&dword_23B2A6000, v15, OS_LOG_TYPE_DEFAULT, "%s: Received a volumeID (%@) of resource (%@) that is already being used by a different container, so we are modifying the volume ID to (%@) to avoid collision.", buf, 0x2Au);

      }
    }
    +[FSModuleVolume volumeWithName:resource:](FSModuleVolume, "volumeWithName:resource:", v9, *(_QWORD *)(a1 + 40));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setOurExtension:", *(_QWORD *)(a1 + 32));
    fskit_std_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[FSModuleConnector loadResource:options:replyHandler:]_block_invoke";
      v41 = 2112;
      v42 = (uint64_t)v19;
      _os_log_impl(&dword_23B2A6000, v20, OS_LOG_TYPE_DEFAULT, "%s: Adding volume %@ to module volumes", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "volumes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "volumeID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v19, v22);

    objc_msgSend(v9, "volumeID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[FSVolumeDescription volumeDescriptionWithID:name:state:](FSVolumeDescription, "volumeDescriptionWithID:name:state:", v23, v24, objc_msgSend(v9, "state"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    fskit_std_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "ourModule");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "volumes");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");
      *(_DWORD *)buf = 136315394;
      v40 = "-[FSModuleConnector loadResource:options:replyHandler:]_block_invoke";
      v41 = 2048;
      v42 = v29;
      _os_log_impl(&dword_23B2A6000, v26, OS_LOG_TYPE_DEFAULT, "%s: module volume now has %lu volumes", buf, 0x16u);

    }
    _Block_object_dispose(&v34, 8);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v6;
  v32 = v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_264(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)unloadResource:(id)a3 options:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  FSModuleExtension *v12;
  NSObject *v13;
  FSModuleExtension *v14;
  _QWORD block[4];
  FSModuleExtension *v16;
  FSModuleConnector *v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  fskit_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[FSModuleConnector unloadResource:options:replyHandler:]";
    _os_log_impl(&dword_23B2A6000, v11, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }

  if (-[FSModuleExtension isNormalFS](self->_ourModule, "isNormalFS")
    || -[FSModuleExtension isSimpleFS](self->_ourModule, "isSimpleFS"))
  {
    v12 = self->_ourModule;
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke;
    block[3] = &unk_250C32218;
    v16 = v12;
    v17 = self;
    v18 = v8;
    v20 = v10;
    v19 = v9;
    v14 = v12;
    dispatch_async(v13, block);

  }
  else
  {
    fs_errorForPOSIXError(45);
    v14 = (FSModuleExtension *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, FSModuleExtension *))v10 + 2))(v10, v14);
  }

}

void __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  void (**v6)(void *, _QWORD);
  void *v7;
  char v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke_2;
  v26 = &unk_250C32240;
  v2 = a1 + 32;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(v2 + 8);
  v5 = *(void **)(v2 + 16);
  v27 = v3;
  v28 = v4;
  v29 = v5;
  v30 = *(id *)(v2 + 32);
  v31 = &v37;
  v32 = &v33;
  v6 = (void (**)(void *, _QWORD))_Block_copy(&v23);
  objc_msgSend(*(id *)v2, "delegate", v23, v24, v25, v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
    v6[2](v6, 0);
    goto LABEL_8;
  }
  v9 = objc_msgSend(*(id *)(a1 + 32), "isNormalFS");
  v10 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unloadResource:options:replyHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v6);
  }
  else
  {
    if (!objc_msgSend(v10, "isSimpleFS"))
      goto LABEL_8;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unloadResource:options:replyHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v6);
  }

LABEL_8:
  if (!*((_BYTE *)v34 + 24))
  {
    fskit_std_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleID");
      objc_claimAutoreleasedReturnValue();
      __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke_cold_2();
    }

    v13 = *(_QWORD *)(a1 + 64);
    fs_errorForPOSIXError(43);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  }
  if (!v38[5])
  {
    fskit_std_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);

    objc_msgSend(*(id *)(a1 + 32), "setResource:", 0);
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

}

void __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "volumes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 40), "sendRevokeResource:", *(_QWORD *)(a1 + 48));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
}

- (void)activateVolume:(id)a3 resource:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  FSModuleExtension *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  fskit_std_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[FSModuleConnector activateVolume:resource:options:replyHandler:]";
    _os_log_impl(&dword_23B2A6000, v12, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }

  v13 = self->_ourModule;
  -[FSModuleExtension volumes](v13, "volumes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && (objc_msgSend(v15, "volume"), v16 = (void *)objc_claimAutoreleasedReturnValue(), v16, v16))
  {
    objc_msgSend(v15, "volume");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke;
    block[3] = &unk_250C32290;
    v29 = v17;
    v30 = v10;
    v31 = v9;
    v32 = v15;
    v33 = v11;
    v19 = v17;
    dispatch_async(v18, block);

  }
  else
  {
    fskit_std_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[FSModuleConnector activateVolume:resource:options:replyHandler:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    fs_errorForPOSIXError(45);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v11 + 2))(v11, v19);
  }

}

void __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke_2;
  v4[3] = &unk_250C32268;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "activateWithOptions:replyHandler:", v3, v4);

}

void __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    fskit_std_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke_2_cold_2();

    objc_msgSend(*(id *)(a1 + 40), "updateRootItem:", v5);
  }
  fskit_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)deactivateVolume:(id)a3 numericOptions:(unint64_t)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  FSModuleExtension *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  fskit_std_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[FSModuleConnector deactivateVolume:numericOptions:replyHandler:]";
    _os_log_impl(&dword_23B2A6000, v10, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }

  v11 = self->_ourModule;
  -[FSModuleExtension volumes](v11, "volumes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && (objc_msgSend(v13, "volume"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    objc_msgSend(v13, "volume");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __66__FSModuleConnector_deactivateVolume_numericOptions_replyHandler___block_invoke;
    v24[3] = &unk_250C322B8;
    v25 = v8;
    v26 = v13;
    v27 = v9;
    objc_msgSend(v15, "deactivateWithOptions:replyHandler:", a4, v24);

  }
  else
  {
    fskit_std_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[FSModuleConnector deactivateVolume:numericOptions:replyHandler:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    fs_errorForPOSIXError(45);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v15);
  }

}

void __66__FSModuleConnector_deactivateVolume_numericOptions_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;

  v3 = a2;
  if (v3)
  {
    fskit_std_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__FSModuleConnector_deactivateVolume_numericOptions_replyHandler___block_invoke_cold_1(a1, v3);

  }
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "stopUsingVolume");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)getProgressPortForTask:(id)a3 replyHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;

  v20 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[FSModuleExtension taskSet](self->_ourModule, "taskSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[FSModuleExtension taskSet](self->_ourModule, "taskSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v7);
  if (!v9)
  {
    v19 = 2;
    goto LABEL_9;
  }
  v10 = v9;
  objc_sync_enter(v10);
  objc_msgSend(v10, "connector");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v10, "taskProgress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "taskDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[FSTaskProgressConnector newForProgress:description:](FSTaskProgressConnector, "newForProgress:description:", v12, v13);
    objc_msgSend(v10, "setConnector:", v14);

  }
  objc_sync_exit(v10);

  objc_msgSend(v10, "connector");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15
    || (v16 = (void *)v15,
        objc_msgSend(v10, "connector"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v17, "endpoint"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        !v18))
  {
    v19 = 12;
LABEL_9:
    fs_errorForPOSIXError(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v18);
    goto LABEL_10;
  }
  ((void (**)(id, void *, void *))v6)[2](v6, v18, 0);
LABEL_10:

}

- (void)getModuleListenerEndpoint:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[FSModuleExtension secondaryListener](self->_ourModule, "secondaryListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fskit_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_23B2A6000, v6, OS_LOG_TYPE_DEFAULT, "getModuleListenerEndpoint got listener %@", (uint8_t *)&v8, 0xCu);
  }

  if (v5)
  {
    objc_msgSend(v5, "endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7, 0);
  }
  else
  {
    fs_errorForPOSIXError(12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v7);
  }

}

- (FSModuleExtension)ourModule
{
  return (FSModuleExtension *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOurModule:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSXPCConnection)ourConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOurConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ourConnection, 0);
  objc_storeStrong((id *)&self->_ourModule, 0);
}

- (void)sendRevokeResource:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[FSModuleConnector sendRevokeResource:]";
  OUTLINED_FUNCTION_9(&dword_23B2A6000, a1, a3, "%s: the connection is dead", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)sendRevokeResource:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendRevokeResource:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "getResourceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s:start:resource(%@)", (uint8_t *)v5);

  OUTLINED_FUNCTION_7();
}

void __40__FSModuleConnector_sendRevokeResource___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_23B2A6000, v0, v1, "%s: remote proxy object error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __40__FSModuleConnector_sendRevokeResource___block_invoke_225_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_23B2A6000, v0, v1, "%s: revoked encountered an error (%@)", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)sendCloseResource:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[FSModuleConnector sendCloseResource:]";
  OUTLINED_FUNCTION_9(&dword_23B2A6000, a1, a3, "%s: the connection is dead", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)sendCloseResource:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendCloseResource:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "getResourceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s:start:resource(%@)", (uint8_t *)v5);

  OUTLINED_FUNCTION_7();
}

void __39__FSModuleConnector_sendCloseResource___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_23B2A6000, v0, v1, "%s: remote proxy object error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __39__FSModuleConnector_sendCloseResource___block_invoke_228_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_23B2A6000, v0, v1, "%s: close encountered an error (%@)", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)sendIsVolumeUsed:(uint64_t)a3 bundle:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendIsVolumeUsed:bundle:replyHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_10(&dword_23B2A6000, v0, v1, "%s:start:volumeID(%@):bundleID(%@)", v2);
  OUTLINED_FUNCTION_8();
}

void __58__FSModuleConnector_sendIsVolumeUsed_bundle_replyHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_23B2A6000, v0, v1, "%s: remote proxy object error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)sendWipeResource:(uint64_t)a3 includingBlockRanges:(uint64_t)a4 excludingBlockRanges:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendWipeResource:(uint64_t)a3 includingBlockRanges:(uint64_t)a4 excludingBlockRanges:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:start", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __93__FSModuleConnector_sendWipeResource_includingBlockRanges_excludingBlockRanges_replyHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_23B2A6000, v0, v1, "%s: remote proxy object error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __93__FSModuleConnector_sendWipeResource_includingBlockRanges_excludingBlockRanges_replyHandler___block_invoke_230_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[FSModuleConnector sendWipeResource:includingBlockRanges:excludingBlockRanges:replyHandler:]_block_invoke";
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s: %{public}@ sendWipeResource done, no errors", (uint8_t *)&v5);

  OUTLINED_FUNCTION_7();
}

void __93__FSModuleConnector_sendWipeResource_includingBlockRanges_excludingBlockRanges_replyHandler___block_invoke_230_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_15(&dword_23B2A6000, v2, v3, "%s: %{public}@ sendWipeResource error (%@)!", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_17();
}

- (void)sendConfigureUserClient:(uint64_t)a3 replyHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendConfigureUserClient:replyHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s:start:userClient(%@)", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __58__FSModuleConnector_sendConfigureUserClient_replyHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_23B2A6000, v0, v1, "%s: remote proxy object error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)ping:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_23B2A6000, a1, a3, "FSModuleExtension.ping", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_19();
}

- (void)checkIn:(uint64_t)a3 replyHandler:(NSObject *)a4 .cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3(&dword_23B2A6000, a4, a3, "Attempt to set instance UUID to %@ after already set to %@", (uint8_t *)a3);

  OUTLINED_FUNCTION_11();
}

- (void)probeResource:(uint64_t)a1 replyHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_20(v3);
  OUTLINED_FUNCTION_9(&dword_23B2A6000, a2, v5, "Delegate class %@ doesn't surpport probeResource:replyHandler:", v6);

  OUTLINED_FUNCTION_7();
}

void __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_14(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_23B2A6000, v3, v4, "FSModule %{public}@ check: did NOT call reply()", v5);

  OUTLINED_FUNCTION_11();
}

- (void)checkWithOptions:(uint64_t)a3 connection:(uint64_t)a4 taskID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s: delegate doesn't have checkWithOptions method, try checkResource", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_245_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_14(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_23B2A6000, v3, v4, "FSModule %{public}@ checkWithOptions: did NOT call reply()", v5);

  OUTLINED_FUNCTION_11();
}

void __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_248_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_14(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_23B2A6000, v3, v4, "FSModule %{public}@ formatResource: did NOT call reply()", v5);

  OUTLINED_FUNCTION_11();
}

- (void)formatWithOptions:(uint64_t)a3 connection:(uint64_t)a4 taskID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s: delegate doesn't have formatWithParameters method, try formatResource", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_253_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_14(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_23B2A6000, v3, v4, "FSModule %{public}@ format: did NOT call reply()", v5);

  OUTLINED_FUNCTION_11();
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_13();
  *(_DWORD *)v1 = 136315394;
  *(_QWORD *)(v1 + 4) = "-[FSModuleConnector loadResource:options:replyHandler:]_block_invoke";
  *(_WORD *)(v1 + 12) = 2112;
  *(_QWORD *)(v1 + 14) = v2;
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v3, (uint64_t)v3, "%s: Setting up the module resource to (%@)", v4);

  OUTLINED_FUNCTION_11();
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_14(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_23B2A6000, v3, v4, "FSModule %{public}@ loadResource: did NOT call reply()", v5);

  OUTLINED_FUNCTION_11();
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_255_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 48), "ourModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "count");
  v6 = 136315394;
  v7 = "-[FSModuleConnector loadResource:options:replyHandler:]_block_invoke";
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v5, "%s: module volume now has %lu volumes", (uint8_t *)&v6);

}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_2_256_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s: Adding volume %@ to module volumes", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s: Setting up the module resource to nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_14(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_23B2A6000, v3, v4, "FSModule %{public}@ unloadResource: did NOT call reply()", v5);

  OUTLINED_FUNCTION_11();
}

- (void)activateVolume:(uint64_t)a3 resource:(uint64_t)a4 options:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s: module volume does not exist", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s: activate volume (%@) reply(nil)", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_10(&dword_23B2A6000, v0, v1, "%s: activate volume (%@) found root item (%@)", v2);
  OUTLINED_FUNCTION_8();
}

- (void)deactivateVolume:(uint64_t)a3 numericOptions:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s: module volume does not exist", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __66__FSModuleConnector_deactivateVolume_numericOptions_replyHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15(&dword_23B2A6000, v2, v3, "%s: deactivate volume (%@) error %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_17();
}

@end
