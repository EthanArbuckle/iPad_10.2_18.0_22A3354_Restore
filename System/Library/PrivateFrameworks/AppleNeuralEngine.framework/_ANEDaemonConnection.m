@implementation _ANEDaemonConnection

- (void)loadModel:(id)a3 sandboxExtension:(id)a4 options:(id)a5 qos:(unsigned int)a6 withReply:(id)a7
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  uint64_t v18;
  NSXPCConnection *daemonConnection;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];

  v8 = *(_QWORD *)&a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = +[_ANEQoSMapper programPriorityForQoS:](_ANEQoSMapper, "programPriorityForQoS:", v8);
  if (v17 == +[_ANEQoSMapper realTimeProgramPriority](_ANEQoSMapper, "realTimeProgramPriority")
    && !-[_ANEDaemonConnection restricted](self, "restricted"))
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors priorityErrorForMethod:](_ANEErrors, "priorityErrorForMethod:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v16 + 2))(v16, 0, MEMORY[0x1E0C9AA70], 0, 0, 0, 0, v22);
  }
  else
  {
    v18 = MEMORY[0x1E0C809B0];
    daemonConnection = self->_daemonConnection;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __73___ANEDaemonConnection_loadModel_sandboxExtension_options_qos_withReply___block_invoke;
    v25[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v25[4] = a2;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v18;
    v23[1] = 3221225472;
    v23[2] = __73___ANEDaemonConnection_loadModel_sandboxExtension_options_qos_withReply___block_invoke_13;
    v23[3] = &unk_1E95162F0;
    v24 = v16;
    objc_msgSend(v20, "loadModel:sandboxExtension:options:qos:withReply:", v13, v14, v15, v8, v23);

  }
}

- (BOOL)restricted
{
  return self->_restricted;
}

- (NSXPCConnection)daemonConnection
{
  return self->_daemonConnection;
}

+ (id)daemonConnection
{
  return (id)objc_opt_new();
}

- (_ANEDaemonConnection)init
{
  void *v3;
  _ANEDaemonConnection *v4;

  +[_ANEStrings machServiceName](_ANEStrings, "machServiceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_ANEDaemonConnection initWithMachServiceName:restricted:](self, "initWithMachServiceName:restricted:", v3, 0);

  return v4;
}

- (_ANEDaemonConnection)initWithMachServiceName:(id)a3 restricted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _ANEDaemonConnection *v7;
  uint64_t v8;
  NSXPCConnection *daemonConnection;
  void *v10;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_ANEDaemonConnection;
  v7 = -[_ANEDaemonConnection init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v6, 4096);
    daemonConnection = v7->_daemonConnection;
    v7->_daemonConnection = (NSXPCConnection *)v8;

    v7->_restricted = v4;
    if (v4)
      _ANEDaemonInterfacePrivate();
    else
      _ANEDaemonInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7->_daemonConnection, "setRemoteObjectInterface:", v10);

    -[NSXPCConnection resume](v7->_daemonConnection, "resume");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_daemonConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_ANEDaemonConnection;
  -[_ANEDaemonConnection dealloc](&v3, sel_dealloc);
}

+ (id)daemonConnectionRestricted
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)objc_opt_class());
  +[_ANEStrings machServiceNamePrivate](_ANEStrings, "machServiceNamePrivate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithMachServiceName:restricted:", v3, 1);

  return v4;
}

+ (id)userDaemonConnection
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)objc_opt_class());
  +[_ANEStrings userMachServiceName](_ANEStrings, "userMachServiceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithMachServiceName:restricted:", v3, 0);

  return v4;
}

- (void)beginRealTimeTaskWithReply:(id)a3
{
  id v5;
  uint64_t v6;
  NSXPCConnection *daemonConnection;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v5 = a3;
  if (-[_ANEDaemonConnection restricted](self, "restricted"))
  {
    v6 = MEMORY[0x1E0C809B0];
    daemonConnection = self->_daemonConnection;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51___ANEDaemonConnection_beginRealTimeTaskWithReply___block_invoke;
    v12[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v12[4] = a2;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __51___ANEDaemonConnection_beginRealTimeTaskWithReply___block_invoke_6;
    v10[3] = &unk_1E95162A0;
    v11 = v5;
    objc_msgSend(v8, "beginRealTimeTaskWithReply:", v10);

  }
  else
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors entitlementErrorForMethod:](_ANEErrors, "entitlementErrorForMethod:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v9);

  }
}

- (void)endRealTimeTaskWithReply:(id)a3
{
  id v5;
  uint64_t v6;
  NSXPCConnection *daemonConnection;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v5 = a3;
  if (-[_ANEDaemonConnection restricted](self, "restricted"))
  {
    v6 = MEMORY[0x1E0C809B0];
    daemonConnection = self->_daemonConnection;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49___ANEDaemonConnection_endRealTimeTaskWithReply___block_invoke;
    v12[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v12[4] = a2;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __49___ANEDaemonConnection_endRealTimeTaskWithReply___block_invoke_8;
    v10[3] = &unk_1E95162A0;
    v11 = v5;
    objc_msgSend(v8, "endRealTimeTaskWithReply:", v10);

  }
  else
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors entitlementErrorForMethod:](_ANEErrors, "entitlementErrorForMethod:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v9);

  }
}

- (void)echo:(id)a3 withReply:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSXPCConnection *daemonConnection;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];

  v7 = a3;
  v8 = a4;
  if (-[_ANEDaemonConnection restricted](self, "restricted"))
  {
    v9 = MEMORY[0x1E0C809B0];
    daemonConnection = self->_daemonConnection;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39___ANEDaemonConnection_echo_withReply___block_invoke;
    v15[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v15[4] = a2;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __39___ANEDaemonConnection_echo_withReply___block_invoke_9;
    v13[3] = &unk_1E95162A0;
    v14 = v8;
    objc_msgSend(v11, "echo:withReply:", v7, v13);

  }
  else
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors entitlementErrorForMethod:](_ANEErrors, "entitlementErrorForMethod:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v12);

  }
}

- (void)compileModel:(id)a3 sandboxExtension:(id)a4 options:(id)a5 qos:(unsigned int)a6 withReply:(id)a7
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  uint64_t v18;
  NSXPCConnection *daemonConnection;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];

  v8 = *(_QWORD *)&a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = +[_ANEQoSMapper programPriorityForQoS:](_ANEQoSMapper, "programPriorityForQoS:", v8);
  if (v17 == +[_ANEQoSMapper realTimeProgramPriority](_ANEQoSMapper, "realTimeProgramPriority")
    && !-[_ANEDaemonConnection restricted](self, "restricted"))
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors priorityErrorForMethod:](_ANEErrors, "priorityErrorForMethod:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v16 + 2))(v16, 0, MEMORY[0x1E0C9AA70], 0, v22);
  }
  else
  {
    v18 = MEMORY[0x1E0C809B0];
    daemonConnection = self->_daemonConnection;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __76___ANEDaemonConnection_compileModel_sandboxExtension_options_qos_withReply___block_invoke;
    v25[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v25[4] = a2;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v18;
    v23[1] = 3221225472;
    v23[2] = __76___ANEDaemonConnection_compileModel_sandboxExtension_options_qos_withReply___block_invoke_11;
    v23[3] = &unk_1E95162C8;
    v24 = v16;
    objc_msgSend(v20, "compileModel:sandboxExtension:options:qos:withReply:", v13, v14, v15, v8, v23);

  }
}

- (void)loadModelNewInstance:(id)a3 options:(id)a4 modelInstParams:(id)a5 qos:(unsigned int)a6 withReply:(id)a7
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  uint64_t v18;
  NSXPCConnection *daemonConnection;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];

  v8 = *(_QWORD *)&a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = +[_ANEQoSMapper programPriorityForQoS:](_ANEQoSMapper, "programPriorityForQoS:", v8);
  if (v17 == +[_ANEQoSMapper realTimeProgramPriority](_ANEQoSMapper, "realTimeProgramPriority")
    && !-[_ANEDaemonConnection restricted](self, "restricted"))
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors priorityErrorForMethod:](_ANEErrors, "priorityErrorForMethod:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v16 + 2))(v16, 0, MEMORY[0x1E0C9AA70], 0, 0, 0, 0, v22);
  }
  else
  {
    v18 = MEMORY[0x1E0C809B0];
    daemonConnection = self->_daemonConnection;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __83___ANEDaemonConnection_loadModelNewInstance_options_modelInstParams_qos_withReply___block_invoke;
    v25[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v25[4] = a2;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v18;
    v23[1] = 3221225472;
    v23[2] = __83___ANEDaemonConnection_loadModelNewInstance_options_modelInstParams_qos_withReply___block_invoke_15;
    v23[3] = &unk_1E95162F0;
    v24 = v16;
    objc_msgSend(v20, "loadModelNewInstance:options:modelInstParams:qos:withReply:", v13, v14, v15, v8, v23);

  }
}

- (void)unloadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 withReply:(id)a6
{
  uint64_t v7;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  int v14;
  uint64_t v15;
  NSXPCConnection *daemonConnection;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(id, _QWORD, void *);
  _QWORD v22[5];

  v7 = *(_QWORD *)&a5;
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, _QWORD, void *))a6;
  v14 = +[_ANEQoSMapper programPriorityForQoS:](_ANEQoSMapper, "programPriorityForQoS:", v7);
  if (v14 == +[_ANEQoSMapper realTimeProgramPriority](_ANEQoSMapper, "realTimeProgramPriority")
    && !-[_ANEDaemonConnection restricted](self, "restricted"))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors priorityErrorForMethod:](_ANEErrors, "priorityErrorForMethod:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v13[2](v13, 0, v19);
  }
  else
  {
    v15 = MEMORY[0x1E0C809B0];
    daemonConnection = self->_daemonConnection;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __58___ANEDaemonConnection_unloadModel_options_qos_withReply___block_invoke;
    v22[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v22[4] = a2;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __58___ANEDaemonConnection_unloadModel_options_qos_withReply___block_invoke_16;
    v20[3] = &unk_1E95162A0;
    v21 = v13;
    objc_msgSend(v17, "unloadModel:options:qos:withReply:", v11, v12, v7, v20);

  }
}

- (void)reportTelemetryToPPS:(id)a3 playload:(id)a4
{
  NSXPCConnection *daemonConnection;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  daemonConnection = self->_daemonConnection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54___ANEDaemonConnection_reportTelemetryToPPS_playload___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a2;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportTelemetryToPPS:playload:", v7, v6);

}

- (void)compiledModelExistsFor:(id)a3 withReply:(id)a4
{
  id v7;
  uint64_t v8;
  NSXPCConnection *daemonConnection;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  daemonConnection = self->_daemonConnection;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57___ANEDaemonConnection_compiledModelExistsFor_withReply___block_invoke;
  v15[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v15[4] = a2;
  v10 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __57___ANEDaemonConnection_compiledModelExistsFor_withReply___block_invoke_17;
  v13[3] = &unk_1E9516318;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "compiledModelExistsFor:withReply:", v10, v13);

}

- (void)purgeCompiledModel:(id)a3 withReply:(id)a4
{
  id v7;
  uint64_t v8;
  NSXPCConnection *daemonConnection;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  daemonConnection = self->_daemonConnection;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53___ANEDaemonConnection_purgeCompiledModel_withReply___block_invoke;
  v15[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v15[4] = a2;
  v10 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __53___ANEDaemonConnection_purgeCompiledModel_withReply___block_invoke_19;
  v13[3] = &unk_1E95162A0;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "purgeCompiledModel:withReply:", v10, v13);

}

- (void)prepareChainingWithModel:(id)a3 options:(id)a4 chainingReq:(id)a5 qos:(unsigned int)a6 withReply:(id)a7
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  int v17;
  uint64_t v18;
  NSXPCConnection *daemonConnection;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(id, _QWORD, void *);
  _QWORD v26[5];

  v8 = *(_QWORD *)&a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void (**)(id, _QWORD, void *))a7;
  v17 = +[_ANEQoSMapper programPriorityForQoS:](_ANEQoSMapper, "programPriorityForQoS:", v8);
  if (v17 == +[_ANEQoSMapper realTimeProgramPriority](_ANEQoSMapper, "realTimeProgramPriority")
    && !-[_ANEDaemonConnection restricted](self, "restricted"))
  {
    v21 = (void *)objc_opt_class();
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "priorityErrorForMethod:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v16[2](v16, 0, v23);
  }
  else
  {
    v18 = MEMORY[0x1E0C809B0];
    daemonConnection = self->_daemonConnection;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __83___ANEDaemonConnection_prepareChainingWithModel_options_chainingReq_qos_withReply___block_invoke;
    v26[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v26[4] = a2;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __83___ANEDaemonConnection_prepareChainingWithModel_options_chainingReq_qos_withReply___block_invoke_20;
    v24[3] = &unk_1E95162A0;
    v25 = v16;
    objc_msgSend(v20, "prepareChainingWithModel:options:chainingReq:qos:withReply:", v13, v14, v15, v8, v24);

  }
}

- (void)compiledModelExistsMatchingHash:(id)a3 withReply:(id)a4
{
  id v7;
  uint64_t v8;
  NSXPCConnection *daemonConnection;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  daemonConnection = self->_daemonConnection;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66___ANEDaemonConnection_compiledModelExistsMatchingHash_withReply___block_invoke;
  v15[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v15[4] = a2;
  v10 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __66___ANEDaemonConnection_compiledModelExistsMatchingHash_withReply___block_invoke_21;
  v13[3] = &unk_1E95162A0;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "compiledModelExistsMatchingHash:withReply:", v10, v13);

}

- (void)purgeCompiledModelMatchingHash:(id)a3 withReply:(id)a4
{
  id v7;
  uint64_t v8;
  NSXPCConnection *daemonConnection;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  daemonConnection = self->_daemonConnection;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65___ANEDaemonConnection_purgeCompiledModelMatchingHash_withReply___block_invoke;
  v15[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v15[4] = a2;
  v10 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __65___ANEDaemonConnection_purgeCompiledModelMatchingHash_withReply___block_invoke_22;
  v13[3] = &unk_1E95162A0;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "purgeCompiledModelMatchingHash:withReply:", v10, v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

@end
