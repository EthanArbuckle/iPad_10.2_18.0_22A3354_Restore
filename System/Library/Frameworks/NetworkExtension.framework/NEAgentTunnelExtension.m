@implementation NEAgentTunnelExtension

- (void)handleCancel
{
  id v2;

  if (self)
    self->_cancelCalled = 1;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopWithReason:", 1);

}

- (void)handleAppsUninstalled:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEAgentExtension pluginType](self, "pluginType");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[NEAgentExtension pluginType](self, "pluginType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "containsObject:", v7);

    if (v8)
    {
      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[NEAgentExtension pluginType](self, "pluginType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v10;
        _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "App for plugin type %@ has been uninstalled, stopping", (uint8_t *)&v12, 0xCu);

      }
      -[NEAgentExtension sessionContext](self, "sessionContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stopWithReason:", 6);

    }
  }

}

- (void)handleAppsUpdateBegins:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NEAgentExtension queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__NEAgentTunnelExtension_handleAppsUpdateBegins___block_invoke;
  v7[3] = &unk_1E3CC2F98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleAppsUpdateEnding:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NEAgentExtension queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__NEAgentTunnelExtension_handleAppsUpdateEnding___block_invoke;
  v7[3] = &unk_1E3CC2F98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleAppsUpdateEnds:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NEAgentExtension queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__NEAgentTunnelExtension_handleAppsUpdateEnds___block_invoke;
  v7[3] = &unk_1E3CC2F98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)managerInterface
{
  if (managerInterface_onceToken != -1)
    dispatch_once(&managerInterface_onceToken, &__block_literal_global_6895);
  return (id)managerInterface_managerInterface;
}

- (id)driverInterface
{
  if (driverInterface_onceToken_6887 != -1)
    dispatch_once(&driverInterface_onceToken_6887, &__block_literal_global_9);
  return (id)driverInterface_driverInterface_6888;
}

- (void)connectWithParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v4 = a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v6 = v4;
  else
    v6 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__NEAgentTunnelExtension_connectWithParameters___block_invoke;
  v7[3] = &unk_1E3CC45C8;
  v7[4] = self;
  objc_msgSend(v5, "startWithOptions:completionHandler:", v6, v7);

}

- (void)disconnectWithReason:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopWithReason:", v3);

}

- (void)attachIPCWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "establishIPCWithCompletionHandler:", v4);

}

- (void)extension:(id)a3 didStartWithError:(id)a4
{
  uint64_t v4;
  id v5;

  if (a4)
  {
    v4 = 0;
    v5 = a4;
  }
  else
  {
    v4 = 4;
    v5 = 0;
  }
  -[NEAgentTunnelExtension sendStatus:withDisconnectError:](self, v4, v5);
}

- (void)extension:(id)a3 didSetStatus:(int64_t)a4
{
  -[NEAgentTunnelExtension sendStatus:withDisconnectError:](self, a4, 0);
}

- (void)extension:(id)a3 didSetTunnelConfiguration:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a5;
  v8 = a4;
  -[NEAgentExtension managerObjectFactory](self, "managerObjectFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managerObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__NEAgentTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke;
  v12[3] = &unk_1E3CC4748;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "setTunnelNetworkSettings:completionHandler:", v8, v12);

}

- (void)extensionDidDetachIPC:(id)a3
{
  void *v3;
  id v4;

  -[NEAgentExtension managerObjectFactory](self, "managerObjectFactory", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managerObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "handleIPCDetached");
}

- (void)extension:(id)a3 didRequestSocket:(BOOL)a4 interface:(id)a5 local:(id)a6 remote:(id)a7 effectivePID:(int)a8 completionHandler:(id)a9
{
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD);
  NSObject *v19;
  _BOOL4 v20;
  uint64_t IKESocket;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  int v27;
  NEAgentTunnelExtension *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v12 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, _QWORD))a9;
  ne_log_obj();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v20)
    {
      v27 = 138412290;
      v28 = self;
      _os_log_debug_impl(&dword_19BD16000, v19, OS_LOG_TYPE_DEBUG, "%@: Getting IKE Socket", (uint8_t *)&v27, 0xCu);
    }

    if (!v15 || !v16 || !v17)
    {
      ne_log_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v27 = 138412290;
        v28 = self;
        v26 = "%@: Failed to get IKE Socket, null local/remote address or interface name";
        goto LABEL_21;
      }
LABEL_18:

      v18[2](v18, 0);
      goto LABEL_19;
    }
    objc_msgSend(objc_retainAutorelease(v16), "bytes");
    objc_msgSend(objc_retainAutorelease(v17), "bytes");
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    IKESocket = NEHelperGetIKESocket();
  }
  else
  {
    if (v20)
    {
      v27 = 138412290;
      v28 = self;
      _os_log_debug_impl(&dword_19BD16000, v19, OS_LOG_TYPE_DEBUG, "%@: Getting PFKey Socket", (uint8_t *)&v27, 0xCu);
    }

    IKESocket = NEHelperGetPFKeySocket();
  }
  v22 = IKESocket;
  ne_log_obj();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v27 = 138412546;
    v28 = self;
    v29 = 1024;
    v30 = v22;
    _os_log_debug_impl(&dword_19BD16000, v23, OS_LOG_TYPE_DEBUG, "%@: NEHelper returned socket %d", (uint8_t *)&v27, 0x12u);
  }

  if ((v22 & 0x80000000) != 0)
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v27 = 138412290;
      v28 = self;
      v26 = "%@: Failed to get socket";
LABEL_21:
      _os_log_error_impl(&dword_19BD16000, v25, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v27, 0xCu);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v22, 1);
  ((void (**)(id, void *))v18)[2](v18, v24);

LABEL_19:
}

- (void)handleExtensionStartedWithCompletionHandler:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)sendExtensionFailed
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NEAgentErrorDomain"), 1, 0);
  -[NEAgentTunnelExtension sendStatus:withDisconnectError:](self, 0, v3);

}

- (void)sendStatus:(void *)a3 withDisconnectError:
{
  id v5;
  void *v6;
  id v7;

  if (a1)
  {
    v5 = a3;
    objc_msgSend(a1, "managerObjectFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managerObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setStatus:error:", a2, v5);
  }
}

void __80__NEAgentTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEFAULT, "%@: setTunnelNetworkSettings done", buf, 0xCu);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEFAULT, "%@: setTunnelNetworkSettings calling completionHandler", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__NEAgentTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_34;
    v9[3] = &unk_1E3CC46A8;
    v11 = *(id *)(a1 + 40);
    v10 = v3;
    dispatch_async(v8, v9);

  }
}

uint64_t __80__NEAgentTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __48__NEAgentTunnelExtension_connectWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__NEAgentTunnelExtension_connectWithParameters___block_invoke_2;
  v7[3] = &unk_1E3CC2F98;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __48__NEAgentTunnelExtension_connectWithParameters___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  _QWORD v7[5];

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEAgentErrorDomain")) & 1) != 0)
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "code");

      if (v4 == 3)
      {
        v5 = *(void **)(a1 + 40);
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __48__NEAgentTunnelExtension_connectWithParameters___block_invoke_3;
        v7[3] = &unk_1E3CC41F0;
        v7[4] = v5;
        objc_msgSend(v5, "handleDisposeWithCompletionHandler:", v7);
        return;
      }
    }
    else
    {

    }
  }
  v6 = *(_BYTE **)(a1 + 40);
  if (v6)
  {
    if ((v6[120] & 1) != 0)
      objc_msgSend(v6, "handleDisposeWithCompletionHandler:", 0);
    else
      -[NEAgentTunnelExtension sendStatus:withDisconnectError:](v6, 0, *(void **)(a1 + 32));
  }
}

void __48__NEAgentTunnelExtension_connectWithParameters___block_invoke_3(uint64_t a1)
{
  -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 32), 7, 0);
}

void __41__NEAgentTunnelExtension_driverInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4195B8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)driverInterface_driverInterface_6888;
  driverInterface_driverInterface_6888 = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)driverInterface_driverInterface_6888, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_setAppUUIDMap_, 0, 0);

}

void __42__NEAgentTunnelExtension_managerInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE428D58);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)managerInterface_managerInterface;
  managerInterface_managerInterface = v0;

}

void __47__NEAgentTunnelExtension_handleAppsUpdateEnds___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "appsUpdateEnding"))
  {
    objc_msgSend(*(id *)(a1 + 32), "extensionIdentifier");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      v4 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "extensionIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

      if ((_DWORD)v4)
      {
        objc_msgSend(*(id *)(a1 + 32), "setAppsUpdateStarted:", 0);
        objc_msgSend(*(id *)(a1 + 32), "setAppsUpdateEnding:", 0);
        ne_log_obj();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "extensionIdentifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 138412290;
          v9 = v7;
          _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEFAULT, "Extension %@ has been updated, setting status to disconnected", (uint8_t *)&v8, 0xCu);

        }
        -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 32), 0, 0);
      }
    }
  }
}

void __49__NEAgentTunnelExtension_handleAppsUpdateEnding___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(*(id *)(a1 + 32), "appsUpdateStarted"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "appsUpdateEnding") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "extensionIdentifier");
      v2 = objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        v3 = (void *)v2;
        v4 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "extensionIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

        if ((_DWORD)v4)
          objc_msgSend(*(id *)(a1 + 32), "setAppsUpdateEnding:", 1);
      }
    }
  }
}

void __49__NEAgentTunnelExtension_handleAppsUpdateBegins___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "appsUpdateStarted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "pluginType");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      v4 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "pluginType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

      if ((_DWORD)v4)
      {
        objc_msgSend(*(id *)(a1 + 32), "setAppsUpdateStarted:", 1);
        objc_msgSend(*(id *)(a1 + 32), "sendFailedTimer");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          objc_msgSend(*(id *)(a1 + 32), "sendFailedTimer");
          v7 = objc_claimAutoreleasedReturnValue();
          dispatch_source_cancel(v7);

          objc_msgSend(*(id *)(a1 + 32), "setSendFailedTimer:", 0);
        }
        ne_log_obj();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "extensionIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138412290;
          v12 = v9;
          _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "Extension %@ is being updated, stopping", (uint8_t *)&v11, 0xCu);

        }
        -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 32), 7, 0);
        objc_msgSend(*(id *)(a1 + 32), "sessionContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stopWithReason:", 40);

      }
    }
  }
}

@end
