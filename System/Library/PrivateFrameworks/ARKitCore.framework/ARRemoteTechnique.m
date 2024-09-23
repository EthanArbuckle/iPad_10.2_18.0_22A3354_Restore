@implementation ARRemoteTechnique

- (ARRemoteTechnique)initWithListenerEndpoint:(id)a3
{
  id v4;
  ARServerConnection *v5;
  ARRemoteTechnique *v6;

  v4 = a3;
  v5 = -[ARServerConnection initWithListenerEndpoint:]([ARServerConnection alloc], "initWithListenerEndpoint:", v4);

  v6 = -[ARRemoteTechnique initWithServerConnection:](self, "initWithServerConnection:", v5);
  return v6;
}

- (ARRemoteTechnique)initWithServerConnection:(id)a3
{
  id v5;
  ARRemoteTechnique *v6;
  ARRemoteTechnique *v7;
  id *p_serverConnection;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *inflightContexts;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARRemoteTechnique;
  v6 = -[ARTechnique init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    p_serverConnection = (id *)&v6->_serverConnection;
    objc_storeStrong((id *)&v6->_serverConnection, a3);
    objc_msgSend(*p_serverConnection, "setDelegate:", v7);
    ARRemoteTechniqueClientInterfaceWithProtocol((uint64_t)&unk_1EF0912A8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_serverConnection, "setExportedInterface:", v9);

    objc_msgSend(*p_serverConnection, "setExportedObject:", v7);
    ARRemoteTechniqueServiceInterfaceWithProtocol((uint64_t)&unk_1EF0A40F8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_serverConnection, "setRemoteObjectInterface:", v10);

    v11 = objc_opt_new();
    inflightContexts = v7->_inflightContexts;
    v7->_inflightContexts = (NSMutableArray *)v11;

    v7->_inflightContextsLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (ARRemoteTechnique)initWithServiceName:(id)a3
{
  id v4;
  ARServerConnection *v5;
  ARRemoteTechnique *v6;

  v4 = a3;
  v5 = -[ARServerConnection initWithServiceName:]([ARServerConnection alloc], "initWithServiceName:", v4);

  v6 = -[ARRemoteTechnique initWithServerConnection:](self, "initWithServerConnection:", v5);
  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  ARRemoteTechnique *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _ARLogTechnique_4();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: dealloc", buf, 0x16u);

  }
  v6.receiver = self;
  v6.super_class = (Class)ARRemoteTechnique;
  -[ARRemoteTechnique dealloc](&v6, sel_dealloc);
}

- (id)serviceProxy
{
  ARServerConnection *serverConnection;
  _QWORD v4[5];

  serverConnection = self->_serverConnection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__ARRemoteTechnique_serviceProxy__block_invoke;
  v4[3] = &unk_1E6672EB8;
  v4[4] = self;
  -[ARServerConnection synchronousRemoteObjectProxyWithErrorHandler:](serverConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __33__ARRemoteTechnique_serviceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ARLogTechnique_4();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v10 = 138543874;
    v11 = v6;
    v12 = 2048;
    v13 = v7;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v10, 0x20u);

  }
  v8 = (void *)objc_opt_new();
  if (ARInternalOSBuild())
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Error communicating with XPC proxy. Potential ApprovedListing Issue."), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB3388]);
  }
  ARErrorWithCodeAndUserInfo(501, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "techniqueDidFailWithError:", v9);

}

- (BOOL)isActive
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__ARRemoteTechnique_isActive__block_invoke;
  v4[3] = &unk_1E6674250;
  v4[4] = &v5;
  objc_msgSend(v2, "isActiveWithReply:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __29__ARRemoteTechnique_isActive__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", v3);

}

- (int64_t)captureBehavior
{
  void *v2;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__ARRemoteTechnique_captureBehavior__block_invoke;
  v5[3] = &unk_1E6674278;
  v5[4] = &v6;
  objc_msgSend(v2, "captureBehaviorWithReply:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__ARRemoteTechnique_captureBehavior__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)numberOfActiveConnections
{
  void *v2;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__ARRemoteTechnique_numberOfActiveConnections__block_invoke;
  v5[3] = &unk_1E6674278;
  v5[4] = &v6;
  objc_msgSend(v2, "numberOfActiveConnectionsWithReply:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__ARRemoteTechnique_numberOfActiveConnections__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)prepare:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare:", v3);

}

- (id)processData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  ARRemoteTechnique *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF0889C8))
  {
    -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __33__ARRemoteTechnique_processData___block_invoke;
    v15[3] = &unk_1E66742A0;
    v15[4] = &v16;
    objc_msgSend(v5, "processData:reply:", v4, v15);
  }
  else
  {
    _ARLogTechnique_4();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v23 = v8;
      v24 = 2048;
      v25 = self;
      v26 = 2112;
      v27 = v9;
      v10 = v9;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Data (%@) is not ARDaemonSecureCodingCompliant!", buf, 0x20u);

    }
    v11 = v17;
    v12 = v4;
    v5 = (void *)v11[5];
    v11[5] = (uint64_t)v12;
  }

  v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __33__ARRemoteTechnique_processData___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  os_unfair_lock_s *p_inflightContextsLock;
  id v7;
  id v8;

  p_inflightContextsLock = &self->_inflightContextsLock;
  v7 = a4;
  os_unfair_lock_lock(p_inflightContextsLock);
  -[NSMutableArray addObject:](self->_inflightContexts, "addObject:", v7);
  os_unfair_lock_unlock(p_inflightContextsLock);
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestResultDataAtTimestamp:context:", v7, a3);

}

- (unint64_t)requiredSensorDataTypes
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__ARRemoteTechnique_requiredSensorDataTypes__block_invoke;
  v5[3] = &unk_1E66742C8;
  v5[4] = &v6;
  objc_msgSend(v2, "requiredSensorDataTypesWithReply:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__ARRemoteTechnique_requiredSensorDataTypes__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (double)requiredTimeInterval
{
  void *v2;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__ARRemoteTechnique_requiredTimeInterval__block_invoke;
  v5[3] = &unk_1E66742F0;
  v5[4] = &v6;
  objc_msgSend(v2, "requiredTimeIntervalWithReply:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__ARRemoteTechnique_requiredTimeInterval__block_invoke(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)resultDataClasses
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  -[ARRemoteTechnique serviceProxy](self, "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__ARRemoteTechnique_resultDataClasses__block_invoke;
  v5[3] = &unk_1E6674338;
  v5[4] = &v6;
  objc_msgSend(v2, "resultDataClassesWithReply:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__ARRemoteTechnique_resultDataClasses__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "ar_map:", &__block_literal_global_141);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

Class __38__ARRemoteTechnique_resultDataClasses__block_invoke_2(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

- (void)techniqueDidFailWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ARTechnique delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ARTechnique delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "technique:didFailWithError:", self, v7);

  }
}

- (void)techniqueDidOutputResultData:(id)a3 timestamp:(double)a4 context:(id)a5
{
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  int v21;
  id v22;
  char isKindOfClass;
  void *v24;
  char v25;
  void *v26;
  os_unfair_lock_s *p_inflightContextsLock;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v8 = a5;
  p_inflightContextsLock = &self->_inflightContextsLock;
  os_unfair_lock_lock(&self->_inflightContextsLock);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = self->_inflightContexts;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v14, "imageData", p_inflightContextsLock);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timestamp");
        v17 = v16;
        objc_msgSend(v8, "imageData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timestamp");
        v20 = v19;

        if (v17 == v20)
        {
          v22 = v14;

          if (v22)
          {
            -[NSMutableArray removeObject:](self->_inflightContexts, "removeObject:", v22);
            v21 = 1;
          }
          else
          {
            v21 = 0;
          }
          goto LABEL_13;
        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v11)
        continue;
      break;
    }
  }

  v21 = 0;
  v22 = 0;
LABEL_13:
  os_unfair_lock_unlock(p_inflightContextsLock);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v21 && (isKindOfClass & 1) != 0)
    objc_msgSend(v8, "mergeResultsOfContext:resultFilterBlock:", v22, &__block_literal_global_146);
  -[ARTechnique delegate](self, "delegate", p_inflightContextsLock);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    -[ARTechnique delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "technique:didOutputResultData:timestamp:context:", self, v28, v8, a4);

  }
}

uint64_t __68__ARRemoteTechnique_techniqueDidOutputResultData_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1EF0889C8) ^ 1;
}

- (void)serverConnectionInterrupted:(id)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  ARRemoteTechnique *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _ARLogTechnique_4();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v6;
    v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Server connection interrupted", (uint8_t *)&v11, 0x16u);

  }
  os_unfair_lock_lock(&self->_inflightContextsLock);
  -[NSMutableArray removeAllObjects](self->_inflightContexts, "removeAllObjects");
  os_unfair_lock_unlock(&self->_inflightContextsLock);
  v7 = (void *)objc_opt_new();
  if (ARInternalOSBuild())
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Server Connection Interrupted"), *MEMORY[0x1E0CB2D50]);
  ARKitCoreBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Restart the session."), &stru_1E6676798, CFSTR("Localizable_iOS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2D80]);

  ARErrorWithCodeAndUserInfo(501, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARRemoteTechnique techniqueDidFailWithError:](self, "techniqueDidFailWithError:", v10);

}

- (void)serverConnectionInvalidated:(id)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  ARRemoteTechnique *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _ARLogTechnique_4();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v6;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Server connection invalidated", (uint8_t *)&v7, 0x16u);

  }
  os_unfair_lock_lock(&self->_inflightContextsLock);
  -[NSMutableArray removeAllObjects](self->_inflightContexts, "removeAllObjects");
  os_unfair_lock_unlock(&self->_inflightContextsLock);
}

- (ARServerConnection)serverConnection
{
  return self->_serverConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_inflightContexts, 0);
}

@end
