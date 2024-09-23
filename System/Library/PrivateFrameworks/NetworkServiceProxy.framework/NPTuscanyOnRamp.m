@implementation NPTuscanyOnRamp

- (NPTuscanyOnRamp)initWithEndpoint:(id)a3
{
  id v5;
  NPTuscanyOnRamp *v6;
  NPTuscanyOnRamp *v7;

  v5 = a3;
  v6 = -[NPTuscanyOnRamp init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_daypassEndpoint, a3);

  return v7;
}

- (BOOL)registerAgentWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSPKeyNetworkAgent *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  char *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  char *v32;
  void *v33;
  void *v34;
  void *v35;
  char *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  char *v43;
  unsigned int v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  int *v55;
  char *v56;
  void *v57;
  void *v58;
  void *v59;
  char *v60;
  void *v61;
  void *v62;
  char *v63;
  _QWORD v64[5];
  _QWORD v65[6];
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  char *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NPTuscanyOnRamp isDayPassExpired](self, "isDayPassExpired"))
    goto LABEL_29;
  -[NPTuscanyOnRamp agent](self, "agent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "agentUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTuscanyOnRamp dayPassUUID](self, "dayPassUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
  {
    -[NPTuscanyOnRamp agentRegistration](self, "agentRegistration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isRegistered");

    if ((v9 & 1) != 0)
      goto LABEL_29;
  }
  else
  {

  }
  v10 = objc_alloc_init(NSPKeyNetworkAgent);
  -[NPTuscanyOnRamp setAgent:](self, "setAgent:", v10);

  -[NPTuscanyOnRamp dayPassUUID](self, "dayPassUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTuscanyOnRamp agent](self, "agent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAgentUUID:", v11);

  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__4;
  v70 = __Block_byref_object_dispose__4;
  v71 = 0;
  objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __40__NPTuscanyOnRamp_registerAgentWithKey___block_invoke;
  v65[3] = &unk_1E4137E20;
  v65[4] = self;
  v65[5] = &v66;
  objc_msgSend(v13, "iterateFileHandlesWithBlock:", v65);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCEC90]), "initWithNetworkAgentClass:", objc_opt_class());
  -[NPTuscanyOnRamp setAgentRegistration:](self, "setAgentRegistration:", v14);

  v15 = v67[5];
  v16 = v15 == 0;
  nplog_obj();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (!v15)
  {
    if (v18)
    {
      -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTuscanyOnRamp agent](self, "agent");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "agentUUID");
      v36 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v73 = v34;
      v74 = 2112;
      v75 = v36;
      _os_log_impl(&dword_19E8FE000, v17, OS_LOG_TYPE_DEFAULT, "%@: Setting up new key network agent registration for %@", buf, 0x16u);

    }
    -[NPTuscanyOnRamp agentRegistration](self, "agentRegistration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTuscanyOnRamp agent](self, "agent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = objc_msgSend(v37, "registerNetworkAgent:", v38);

    nplog_obj();
    v39 = objc_claimAutoreleasedReturnValue();
    v29 = v39;
    if ((_DWORD)v24)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPTuscanyOnRamp agent](self, "agent");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "agentUUID");
        v43 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v73 = v41;
        v74 = 2112;
        v75 = v43;
        _os_log_impl(&dword_19E8FE000, v29, OS_LOG_TYPE_INFO, "%@: Registered key agent with UUID %@", buf, 0x16u);

      }
      v44 = objc_msgSend(v4, "session_counter");
      -[NPTuscanyOnRamp agentRegistration](self, "agentRegistration");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setUseCount:", v44);

      v46 = objc_alloc(MEMORY[0x1E0CD0820]);
      -[NPTuscanyOnRamp agentRegistration](self, "agentRegistration");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "configurationIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTuscanyOnRamp agent](self, "agent");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "agentUUID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v46, "initWithNetworkAgentRegistration:sessionType:configurationIdentifier:agentUUID:", v47, &unk_1E4151588, v49, v51);

      objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
      v24 = objc_claimAutoreleasedReturnValue();
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __40__NPTuscanyOnRamp_registerAgentWithKey___block_invoke_55;
      v64[3] = &unk_1E4137E48;
      v64[4] = self;
      objc_msgSend((id)v24, "setFileHandle:matchingPredicate:", v29, v64);
      objc_msgSend((id)v24, "commit");

    }
    else if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v24, "identifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTuscanyOnRamp agent](self, "agent");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "agentUUID");
      v63 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v73 = v61;
      v74 = 2112;
      v75 = v63;
      _os_log_error_impl(&dword_19E8FE000, v29, OS_LOG_TYPE_ERROR, "%@: Failed to register key agent with UUID %@", buf, 0x16u);

    }
    goto LABEL_27;
  }
  if (v18)
  {
    -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTuscanyOnRamp agent](self, "agent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "agentUUID");
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v73 = v20;
    v74 = 2112;
    v75 = v22;
    _os_log_impl(&dword_19E8FE000, v17, OS_LOG_TYPE_DEFAULT, "%@: Re-using existing key network agent registration file handle for %@", buf, 0x16u);

  }
  objc_msgSend((id)v67[5], "handle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = dup(objc_msgSend(v23, "fileDescriptor"));

  if ((v24 & 0x80000000) != 0)
  {
    nplog_obj();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "identifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = __error();
      v56 = strerror(*v55);
      *(_DWORD *)buf = 138412546;
      v73 = v54;
      v74 = 2080;
      v75 = v56;
      _os_log_error_impl(&dword_19E8FE000, v29, OS_LOG_TYPE_ERROR, "%@: Failed to dup the key network agent registration file descriptor: %s", buf, 0x16u);

    }
    LOBYTE(v24) = 0;
    goto LABEL_27;
  }
  -[NPTuscanyOnRamp agentRegistration](self, "agentRegistration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTuscanyOnRamp agent](self, "agent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "setRegisteredNetworkAgent:fileDescriptor:", v26, v24);

  nplog_obj();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v27)
  {
    LOBYTE(v24) = 1;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v24, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTuscanyOnRamp agent](self, "agent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "agentUUID");
      v32 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v73 = v30;
      v74 = 2112;
      v75 = v32;
      _os_log_impl(&dword_19E8FE000, v29, OS_LOG_TYPE_INFO, "%@: Registered key agent with UUID %@", buf, 0x16u);

      LOBYTE(v24) = 1;
    }
LABEL_27:

    goto LABEL_28;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "identifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTuscanyOnRamp agent](self, "agent");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "agentUUID");
    v60 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v73 = v58;
    v74 = 2112;
    v75 = v60;
    _os_log_error_impl(&dword_19E8FE000, v29, OS_LOG_TYPE_ERROR, "%@: Failed to register key agent with UUID %@", buf, 0x16u);

  }
  close(v24);
  v16 = 1;
LABEL_28:
  _Block_object_dispose(&v66, 8);

  if (v16)
LABEL_29:
    LOBYTE(v24) = 1;

  return v24 & 1;
}

uint64_t __40__NPTuscanyOnRamp_registerAgentWithKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v3, "sessionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", &unk_1E4151588);
  if (v5)
  {
    objc_msgSend(v3, "agentUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "agent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "agentUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqual:", v8);

    if (v9)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = v3;
      v4 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v11;
      goto LABEL_5;
    }
LABEL_6:
    v12 = 1;
    goto LABEL_7;
  }
LABEL_5:
  v12 = v5 ^ 1u;

LABEL_7:
  return v12;
}

uint64_t __40__NPTuscanyOnRamp_registerAgentWithKey___block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "sessionType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", &unk_1E4151588))
    {
      objc_msgSend(v3, "agentUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "agent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "agentUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v5, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)unregisterAgent
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NPTuscanyOnRamp updateSessionCounterFromKernel](self, "updateSessionCounterFromKernel");
  -[NPTuscanyOnRamp agentRegistration](self, "agentRegistration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRegistered");

  if (v4)
  {
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTuscanyOnRamp agent](self, "agent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "agentUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEFAULT, "%@: Un-registering key agent with UUID %@", buf, 0x16u);

    }
    -[NPTuscanyOnRamp agentRegistration](self, "agentRegistration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unregisterNetworkAgent");

    objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __34__NPTuscanyOnRamp_unregisterAgent__block_invoke;
    v13[3] = &unk_1E4137E48;
    v13[4] = self;
    objc_msgSend(v11, "removeFileHandleMatchingPredicate:", v13);

    objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "commit");

  }
  -[NPTuscanyOnRamp setAgent:](self, "setAgent:", 0);
  -[NPTuscanyOnRamp setAgentRegistration:](self, "setAgentRegistration:", 0);
}

uint64_t __34__NPTuscanyOnRamp_unregisterAgent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "sessionType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", &unk_1E4151588))
    {
      objc_msgSend(v3, "agentUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "agent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "agentUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v5, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateSessionCounterFromKernel
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NPTuscanyOnRamp agentRegistration](self, "agentRegistration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRegistered");

  if (v4)
  {
    -[NPTuscanyOnRamp agentRegistration](self, "agentRegistration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "useCount");

    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPTuscanyOnRamp dayPassUUID](self, "dayPassUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v10;
        v17 = 2048;
        v18 = v6;
        v19 = 2112;
        v20 = v11;
        _os_log_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_INFO, "%@: Got session counter %llu for day pass %@ from the kernel", (uint8_t *)&v15, 0x20u);

      }
      -[NPTuscanyOnRamp setDayPassSessionCounter:](self, "setDayPassSessionCounter:", v6);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPTuscanyOnRamp dayPassUUID](self, "dayPassUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v13;
        v17 = 2112;
        v18 = (uint64_t)v14;
        _os_log_error_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_ERROR, "%@: Got session counter 0 for day pass %@ from the kernel", (uint8_t *)&v15, 0x16u);

      }
    }
  }
}

- (id)getTuscanyEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NPTunnelTuscanyEndpoint *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  NPTunnelTuscanyEndpoint *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NPTuscanyOnRamp tuscanyEndpoint](self, "tuscanyEndpoint", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hosts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (NPTunnelTuscanyEndpoint *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (!v7)
  {
LABEL_14:

    goto LABEL_16;
  }
  v8 = *(_QWORD *)v17;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v8)
      objc_enumerationMutation(v6);
    v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_9;
    v11 = v10;
    v12 = objc_msgSend(v11, "addressFamily");
    if (v12 == objc_msgSend(v4, "unsignedIntegerValue"))
      break;

LABEL_9:
    if (v7 == (NPTunnelTuscanyEndpoint *)++v9)
    {
      v7 = (NPTunnelTuscanyEndpoint *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v7)
        goto LABEL_3;
      goto LABEL_14;
    }
  }

  if (v11)
  {
    v13 = [NPTunnelTuscanyEndpoint alloc];
    v20 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NPTunnelTuscanyEndpoint initWithHosts:](v13, "initWithHosts:", v14);

    v6 = v11;
    goto LABEL_14;
  }
  v7 = 0;
LABEL_16:

  return v7;
}

- (unsigned)copyValue:(void *)a3 ofSize:(unsigned int)a4 fromOffset:(unsigned int)a5 base:(const char *)a6 totalLength:(unsigned int)a7
{
  unsigned int v7;

  if (a5 + a4 > a7)
    return 0;
  v7 = a4;
  memcpy(a3, &a6[a5], a4);
  return v7;
}

- (NPTuscanyOnRamp)initWithKey:(id)a3
{
  id v4;
  NPTuscanyOnRamp *v5;
  void *v6;
  id v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  NSObject *v11;
  const char *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  unsigned int v19;
  uint64_t v20;
  id v21;
  unsigned int v22;
  uint64_t v23;
  id v24;
  unsigned int v25;
  unsigned int v26;
  id v27;
  uint64_t v28;
  NSDate *dayPassCreationDate;
  uint64_t v30;
  id v31;
  unsigned int v32;
  unsigned int v33;
  int v34;
  NPTunnelTuscanyEndpoint *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint8_t v40[16];
  int64_t v41;
  double v42;
  double v43;
  uint64_t v44;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)NPTuscanyOnRamp;
  v5 = -[NPTuscanyOnRamp init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0.0;
    v44 = 0;
    v41 = 0;
    v42 = 0.0;
    if (objc_msgSend(v6, "length"))
    {
      v7 = objc_retainAutorelease(v6);
      v8 = -[NPTuscanyOnRamp copyValue:ofSize:fromOffset:base:totalLength:](v5, "copyValue:ofSize:fromOffset:base:totalLength:", (char *)&v44 + 4, 4, 0, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
      if (v8)
      {
        v9 = v8;
        v10 = HIDWORD(v44) + v8;
        if (v10 <= objc_msgSend(v7, "length"))
        {
          v13 = objc_retainAutorelease(v7);
          v14 = objc_msgSend(v13, "bytes") + v9;
          v15 = objc_alloc(MEMORY[0x1E0C99D50]);
          v16 = (void *)objc_msgSend(v15, "initWithBytes:length:", v14, HIDWORD(v44));
          -[NPTuscanyOnRamp setDayPass:](v5, "setDayPass:", v16);

          v17 = HIDWORD(v44) + v9;
          v18 = objc_retainAutorelease(v13);
          v19 = -[NPTuscanyOnRamp copyValue:ofSize:fromOffset:base:totalLength:](v5, "copyValue:ofSize:fromOffset:base:totalLength:", &v44, 4, v17, objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"));
          if (v19)
          {
            v5->_maxFrameSize = v44;
            v20 = v19 + v17;
            v21 = objc_retainAutorelease(v18);
            v22 = -[NPTuscanyOnRamp copyValue:ofSize:fromOffset:base:totalLength:](v5, "copyValue:ofSize:fromOffset:base:totalLength:", &v41, 8, v20, objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"));
            if (v22)
            {
              v5->_TFOStatus = v41;
              v23 = v22 + v20;
              v24 = objc_retainAutorelease(v21);
              v25 = -[NPTuscanyOnRamp copyValue:ofSize:fromOffset:base:totalLength:](v5, "copyValue:ofSize:fromOffset:base:totalLength:", &v43, 8, v23, objc_msgSend(v24, "bytes"), objc_msgSend(v24, "length"));
              if (v25)
              {
                v26 = v25;
                v27 = objc_alloc(MEMORY[0x1E0C99D68]);
                v28 = objc_msgSend(v27, "initWithTimeIntervalSince1970:", v43);
                dayPassCreationDate = v5->_dayPassCreationDate;
                v5->_dayPassCreationDate = (NSDate *)v28;

                v30 = v26 + v23;
                v31 = objc_retainAutorelease(v24);
                v32 = -[NPTuscanyOnRamp copyValue:ofSize:fromOffset:base:totalLength:](v5, "copyValue:ofSize:fromOffset:base:totalLength:", &v42, 8, v30, objc_msgSend(v31, "bytes"), objc_msgSend(v31, "length"));
                if (v32)
                {
                  v5->_dayPassHardExpiry = v42;
                  v33 = v32 + v30;
                  v34 = objc_msgSend(v31, "length");
                  if (v34 != v33)
                  {
                    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", objc_msgSend(objc_retainAutorelease(v31), "bytes") + v33, v34 - v33);
                    v36 = -[NPTunnelTuscanyEndpoint initWithEncodedData:]([NPTunnelTuscanyEndpoint alloc], "initWithEncodedData:", v11);
                    -[NPTuscanyOnRamp setTuscanyEndpoint:](v5, "setTuscanyEndpoint:", v36);

                    -[NPTuscanyOnRamp tuscanyEndpoint](v5, "tuscanyEndpoint");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v37)
                    {
                      objc_msgSend(v4, "uuid");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NPTuscanyOnRamp setDayPassUUID:](v5, "setDayPassUUID:", v38);

                      v5->_error = objc_msgSend(v4, "error");
                    }
                    else
                    {
                      nplog_obj();
                      v39 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)v40 = 0;
                        _os_log_error_impl(&dword_19E8FE000, v39, OS_LOG_TYPE_ERROR, "Failed to create a tuscany endpoint from endpoint data from key", v40, 2u);
                      }

                    }
                    goto LABEL_27;
                  }
                  nplog_obj();
                  v11 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)v40 = 0;
                    v12 = "No endpoint data in key";
                    goto LABEL_26;
                  }
                }
                else
                {
                  nplog_obj();
                  v11 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)v40 = 0;
                    v12 = "Failed to get the hard expiry from the key info";
                    goto LABEL_26;
                  }
                }
              }
              else
              {
                nplog_obj();
                v11 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v40 = 0;
                  v12 = "Failed to get the creation date from the key info";
                  goto LABEL_26;
                }
              }
            }
            else
            {
              nplog_obj();
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v40 = 0;
                v12 = "Failed to get the tfostatus from the key info";
                goto LABEL_26;
              }
            }
          }
          else
          {
            nplog_obj();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v40 = 0;
              v12 = "Failed to get the max frame size from the key info";
              goto LABEL_26;
            }
          }
        }
        else
        {
          nplog_obj();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v40 = 0;
            v12 = "Failed to get the day pass bytes from the key info";
LABEL_26:
            _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, v12, v40, 2u);
          }
        }
      }
      else
      {
        nplog_obj();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v40 = 0;
          v12 = "Failed to get the day pass length from the key info";
          goto LABEL_26;
        }
      }
    }
    else
    {
      nplog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v40 = 0;
        v12 = "No info in key";
        goto LABEL_26;
      }
    }
LABEL_27:

  }
  return v5;
}

- (unsigned)getNextSessionCounter
{
  NSPKeyNetworkAgent *v3;
  void *v4;
  NSObject *v5;
  unsigned int v6;
  void *v8;
  uint64_t v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v3 = objc_alloc_init(NSPKeyNetworkAgent);
  -[NPTuscanyOnRamp dayPassUUID](self, "dayPassUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPNetworkAgent setAgentUUID:](v3, "setAgentUUID:", v4);

  if ((objc_msgSend(MEMORY[0x1E0CCEC90], "useNetworkAgent:returnUseCount:", v3, &v9) & 1) == 0)
  {
    -[NPTuscanyOnRamp setError:](self, "setError:", 35);
    +[NPDiagnosticReport logInternalError:context:](NPDiagnosticReport, "logInternalError:context:", CFSTR("FailedToGetSessionCounter"), 0);
  }
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[NPTuscanyOnRamp dayPassUUID](self, "dayPassUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = v8;
    v12 = 1024;
    v13 = v9;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "%@: Using session counter %u", buf, 0x12u);

  }
  v6 = v9;

  return v6;
}

- (void)resetParentWaldo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NPTuscanyOnRamp dayPassSession](self, "dayPassSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NPTuscanyOnRamp dayPassSession](self, "dayPassSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateAndCancel");

    -[NPTuscanyOnRamp setDayPassSession:](self, "setDayPassSession:", 0);
  }
  -[NPTuscanyOnRamp setParentWaldo:](self, "setParentWaldo:", v6);

}

- (BOOL)dayPassRefreshAllowed
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[NPTuscanyOnRamp retryDate](self, "retryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NPTuscanyOnRamp retryDate](self, "retryDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5 < 0.0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)fillTestDaypass
{
  void *v3;
  int v4;
  NSDate *v5;
  NSDate *dayPassCreationDate;
  void *v7;
  void *v8;
  void *v9;
  NPTunnelTuscanyEndpoint *v10;
  NPTunnelTuscanyEndpoint *tuscanyEndpoint;

  +[NSPManager sharedManager](NSPManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useTestDaypass");

  if (v4)
  {
    self->_maxFrameSize = 1000;
    self->_rtt = 1;
    self->_dayPassHardExpiry = 8000.0;
    v5 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    dayPassCreationDate = self->_dayPassCreationDate;
    self->_dayPassCreationDate = v5;

    tuscanyClientCreateFakeDayPass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTuscanyOnRamp setDayPass:](self, "setDayPass:", v7);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTuscanyOnRamp setDayPassUUID:](self, "setDayPassUUID:", v8);

    +[NPUtilities parseXHost:](NPUtilities, "parseXHost:", CFSTR("1.1.1.1@5223,11:11:11:11:11:11:11:11@5223"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v10 = -[NPTunnelTuscanyEndpoint initWithHosts:]([NPTunnelTuscanyEndpoint alloc], "initWithHosts:", v9);
      tuscanyEndpoint = self->_tuscanyEndpoint;
      self->_tuscanyEndpoint = v10;
    }
    else
    {
      tuscanyEndpoint = self->_tuscanyEndpoint;
      self->_tuscanyEndpoint = 0;
    }

  }
  return v4;
}

- (void)refreshDayPassWithWaldoDelegate:(id)a3 softExpiry:(double)a4 retryInterval:(double)a5 edge:(id)a6 completionHandler:(id)a7
{
  void (**v12)(id, uint64_t, uint64_t, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSURLSessionDelegate *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  _QWORD v74[5];
  void (**v75)(id, uint64_t, uint64_t, _QWORD);
  _QWORD *v76;
  double v77;
  _QWORD v78[6];
  _QWORD v79[3];
  char v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  _QWORD v88[4];

  v88[1] = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v73 = a6;
  v12 = (void (**)(id, uint64_t, uint64_t, _QWORD))a7;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  v80 = 0;
  -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTuscanyOnRamp setRetryDate:](self, "setRetryDate:", 0);
  -[NPTuscanyOnRamp dayPassCreationDate](self, "dayPassCreationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = v14 == 0;

  if ((a7 & 1) != 0)
  {
    v71 = 0;
  }
  else
  {
    -[NPTuscanyOnRamp dayPassCreationDate](self, "dayPassCreationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dateByAddingTimeInterval:", a4);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NPTuscanyOnRamp dayPassSession](self, "dayPassSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;

  if (v17)
  {
    v18 = objc_alloc_init(NSURLSessionDelegate);
    objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dayPassRequestTimeout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22 > 0.0;

    if (v23)
    {
      -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dayPassRequestTimeout");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      objc_msgSend(v19, "setTimeoutIntervalForResource:");

    }
    else
    {
      objc_msgSend(v19, "setTimeoutIntervalForResource:", 30.0);
    }
    -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dayPassEnableSessionTicket");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "set_allowsTLSSessionTickets:", objc_msgSend(v27, "BOOLValue"));

    -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dayPassExtendedValidation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURLSessionDelegate setEnableExtendedValidation:](v18, "setEnableExtendedValidation:", objc_msgSend(v29, "BOOLValue"));

    -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dayPassLeafOID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURLSessionDelegate setLeafOID:](v18, "setLeafOID:", v31);

    -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dayPassRevocationFailClosed");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURLSessionDelegate setRevocationFailClosed:](v18, "setRevocationFailClosed:", objc_msgSend(v33, "BOOLValue"));

    -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dayPassHostnamePrependLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = objc_msgSend(v35, "BOOLValue");

    if ((_DWORD)v33)
    {
      v36 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v73, "label");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "dayPassHostname");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v36, "initWithFormat:", CFSTR("%@-%@"), v37, v39);
      -[NSURLSessionDelegate setValidationHostname:](v18, "setValidationHostname:", v40);

    }
    else
    {
      -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "dayPassHostname");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURLSessionDelegate setValidationHostname:](v18, "setValidationHostname:", v38);
    }

    nplog_obj();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      -[NSURLSessionDelegate validationHostname](v18, "validationHostname");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v82 = v42;
      _os_log_impl(&dword_19E8FE000, v41, OS_LOG_TYPE_DEFAULT, "Setting SNI to %@", buf, 0xCu);

    }
    v87 = *MEMORY[0x1E0C93270];
    v85 = *MEMORY[0x1E0C93298];
    -[NSURLSessionDelegate validationHostname](v18, "validationHostname");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v43;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v44;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    nplog_obj();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v82 = v45;
      _os_log_impl(&dword_19E8FE000, v46, OS_LOG_TYPE_DEFAULT, "Setting stream properties to %@", buf, 0xCu);
    }

    objc_msgSend(v19, "set_socketStreamProperties:", v45);
    objc_msgSend(v19, "set_allowsTCPFastOpen:", 1);
    v47 = (void *)MEMORY[0x1E0CB39F0];
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "sessionWithConfiguration:delegate:delegateQueue:", v19, v18, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTuscanyOnRamp setDayPassSession:](self, "setDayPassSession:", v49);

    v50 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NPTuscanyOnRamp parentWaldo](self, "parentWaldo");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "identifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v50, "initWithFormat:", CFSTR("%@ TrustEstablishment"), v52);
    -[NPTuscanyOnRamp dayPassSession](self, "dayPassSession");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setSessionDescription:", v53);

  }
  -[NPTuscanyOnRamp daypassEndpoint](self, "daypassEndpoint");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_24;
  objc_msgSend(v55, "hostname");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = v55;
    if (objc_msgSend(v57, "addressFamily") == 30)
    {
      v58 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v57, "hostname");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "stringWithFormat:", CFSTR("[%@]"), v59);
      v60 = objc_claimAutoreleasedReturnValue();

      v56 = (void *)v60;
    }

  }
  if (v56)
  {
    v61 = (void *)MEMORY[0x1E0C99E98];
    v62 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "dayPassPort");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
      objc_msgSend(v13, "dayPassPort");
    else
      objc_msgSend(v55, "port");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "stringWithFormat:", CFSTR("https://%@:%@/tuscany/daypass/2"), v56, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "URLWithString:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NPTuscanyOnRamp fillTestDaypass](self, "fillTestDaypass"))
    {
      v12[2](v12, 1, 1, 0);
    }
    else
    {
      -[NPTuscanyOnRamp dayPassSession](self, "dayPassSession");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __99__NPTuscanyOnRamp_refreshDayPassWithWaldoDelegate_softExpiry_retryInterval_edge_completionHandler___block_invoke;
      v78[3] = &unk_1E4138230;
      v78[4] = self;
      v78[5] = v79;
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __99__NPTuscanyOnRamp_refreshDayPassWithWaldoDelegate_softExpiry_retryInterval_edge_completionHandler___block_invoke_2;
      v74[3] = &unk_1E4138258;
      v74[4] = self;
      v77 = a5;
      v75 = v12;
      v76 = v79;
      objc_msgSend(v72, "waldo:fetchDayPassForURL:ifExpired:session:dataHandler:completionHandler:", v13, v67, v71, v68, v78, v74);

    }
  }
  else
  {
LABEL_24:
    nplog_obj();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "identifier");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTuscanyOnRamp daypassEndpoint](self, "daypassEndpoint");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v82 = v69;
      v83 = 2112;
      v84 = v70;
      _os_log_error_impl(&dword_19E8FE000, v64, OS_LOG_TYPE_ERROR, "%@: Failed to get a hostname from the day pass endpoint %@", buf, 0x16u);

    }
    v12[2](v12, 0, 0, 0);
  }

  _Block_object_dispose(v79, 8);
}

void __99__NPTuscanyOnRamp_refreshDayPassWithWaldoDelegate_softExpiry_retryInterval_edge_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NPTunnelTuscanyEndpoint *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (v6)
  {
    if (objc_msgSend(v6, "length"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v5;
        objc_msgSend(v8, "allHeaderFields");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("X-Timeout"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "allHeaderFields");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("X-MaxFrame"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "allHeaderFields");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("X-Host"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v8;
        objc_msgSend(v8, "allHeaderFields");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("X-RTT"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = 0;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(v14, "integerValue");
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = +[NPUtilities parseXRTT:](NPUtilities, "parseXRTT:", v20);
        +[NPUtilities parseXTimeout:hardTTLInSeconds:](NPUtilities, "parseXTimeout:hardTTLInSeconds:", v11, &v31);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = v31;
        v21 = objc_alloc_init(MEMORY[0x1E0C99D68]);
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(void **)(v22 + 72);
        *(_QWORD *)(v22 + 72) = v21;

        +[NPUtilities parseXHost:](NPUtilities, "parseXHost:", v17);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "count"))
        {
          v25 = -[NPTunnelTuscanyEndpoint initWithHosts:]([NPTunnelTuscanyEndpoint alloc], "initWithHosts:", v24);
          v26 = *(_QWORD *)(a1 + 32);
          v27 = *(void **)(v26 + 16);
          *(_QWORD *)(v26 + 16) = v25;
        }
        else
        {
          v28 = *(_QWORD *)(a1 + 32);
          v27 = *(void **)(v28 + 16);
          *(_QWORD *)(v28 + 16) = 0;
        }

        if (objc_msgSend(v7, "length") == 96)
        {
          objc_msgSend(*(id *)(a1 + 32), "setDayPass:", v7);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setDayPassUUID:", v29);

          objc_msgSend(*(id *)(a1 + 32), "setAgentRegistration:", 0);
          objc_msgSend(*(id *)(a1 + 32), "setAgent:", 0);
        }

      }
    }
  }

}

void __99__NPTuscanyOnRamp_refreshDayPassWithWaldoDelegate_softExpiry_retryInterval_edge_completionHandler___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isDayPassExpired") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "tuscanyEndpoint"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidateDayPass");
  }
  if (v7)
  {
    if ((a3 & 1) == 0)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", *(double *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 32), "setRetryDate:", v6);

    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = objc_msgSend(v7, "code");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTuscanyOnRamp)initWithCoder:(id)a3
{
  id v4;
  NPTuscanyOnRamp *v5;
  uint64_t v6;
  NWEndpoint *daypassEndpoint;
  void *v8;
  NPTunnelTuscanyEndpoint *v9;
  NPTunnelTuscanyEndpoint *tuscanyEndpoint;
  uint64_t v11;
  NSData *dayPass;
  uint64_t v13;
  NSUUID *dayPassUUID;
  double v15;
  uint64_t v16;
  NSDate *dayPassCreationDate;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NPTuscanyOnRamp;
  v5 = -[NPTuscanyOnRamp init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DayPassEndpoint"));
    v6 = objc_claimAutoreleasedReturnValue();
    daypassEndpoint = v5->_daypassEndpoint;
    v5->_daypassEndpoint = (NWEndpoint *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Endpoint"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[NPTunnelTuscanyEndpoint initWithEncodedData:]([NPTunnelTuscanyEndpoint alloc], "initWithEncodedData:", v8);
      tuscanyEndpoint = v5->_tuscanyEndpoint;
      v5->_tuscanyEndpoint = v9;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DayPassData"));
    v11 = objc_claimAutoreleasedReturnValue();
    dayPass = v5->_dayPass;
    v5->_dayPass = (NSData *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DayPassUUID"));
    v13 = objc_claimAutoreleasedReturnValue();
    dayPassUUID = v5->_dayPassUUID;
    v5->_dayPassUUID = (NSUUID *)v13;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("DayPassHardExpiry"));
    v5->_dayPassHardExpiry = v15;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DayPassCreationDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    dayPassCreationDate = v5->_dayPassCreationDate;
    v5->_dayPassCreationDate = (NSDate *)v16;

    v5->_maxFrameSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("CurrentOnRampMaxFrameBytes"));
    v5->_rtt = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("CurrentOnRampRTT"));
    v5->_dayPassFailed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DayPassFailed"));
    v5->_error = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("DayPassError"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[NPTuscanyOnRamp daypassEndpoint](self, "daypassEndpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("DayPassEndpoint"));

  -[NPTuscanyOnRamp tuscanyEndpoint](self, "tuscanyEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("Endpoint"));

  -[NPTuscanyOnRamp dayPass](self, "dayPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("DayPassData"));

  -[NPTuscanyOnRamp dayPassUUID](self, "dayPassUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("DayPassUUID"));

  -[NPTuscanyOnRamp dayPassHardExpiry](self, "dayPassHardExpiry");
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("DayPassHardExpiry"));
  -[NPTuscanyOnRamp dayPassCreationDate](self, "dayPassCreationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("DayPassCreationDate"));

  objc_msgSend(v10, "encodeInt64:forKey:", -[NPTuscanyOnRamp maxFrameSize](self, "maxFrameSize"), CFSTR("CurrentOnRampMaxFrameBytes"));
  objc_msgSend(v10, "encodeInt64:forKey:", -[NPTuscanyOnRamp rtt](self, "rtt"), CFSTR("CurrentOnRampRTT"));
  objc_msgSend(v10, "encodeBool:forKey:", -[NPTuscanyOnRamp dayPassFailed](self, "dayPassFailed"), CFSTR("DayPassFailed"));
  objc_msgSend(v10, "encodeInt32:forKey:", -[NPTuscanyOnRamp error](self, "error"), CFSTR("DayPassError"));

}

- (BOOL)isDayPassPastExpiry:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[NPTuscanyOnRamp dayPass](self, "dayPass");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    return 1;
  v6 = (void *)v5;
  -[NPTuscanyOnRamp dayPassCreationDate](self, "dayPassCreationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 1;
  -[NPTuscanyOnRamp dayPassCreationDate](self, "dayPassCreationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceNow");
  v10 = v9;

  return fabs(v10) >= a3;
}

- (BOOL)isDayPassExpired
{
  -[NPTuscanyOnRamp dayPassHardExpiry](self, "dayPassHardExpiry");
  return -[NPTuscanyOnRamp isDayPassPastExpiry:](self, "isDayPassPastExpiry:");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  -[NPTuscanyOnRamp dayPassCreationDate](self, "dayPassCreationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3578];
    -[NPTuscanyOnRamp dayPassCreationDate](self, "dayPassCreationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringFromDate:dateStyle:timeStyle:", v5, 1, 2);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NPTuscanyOnRamp daypassEndpoint](self, "daypassEndpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTuscanyOnRamp tuscanyEndpoint](self, "tuscanyEndpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NPTuscanyOnRamp maxFrameSize](self, "maxFrameSize");
    v13 = -[NPTuscanyOnRamp rtt](self, "rtt");
    -[NPTuscanyOnRamp dayPassUUID](self, "dayPassUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTuscanyOnRamp dayPassHardExpiry](self, "dayPassHardExpiry");
    v16 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("[%@ tuscany: %@ maxframe: %lu rtt: %lu %@ creation: %@ hard: %f tfoStatus: %ld]"), v10, v11, v12, v13, v14, v6, v15, -[NPTuscanyOnRamp TFOStatus](self, "TFOStatus"));

  }
  else
  {
    -[NPTuscanyOnRamp shortDescription](self, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = &stru_1E4138CF8;
  }

  return v16;
}

- (NSString)shortDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[NPTuscanyOnRamp daypassEndpoint](self, "daypassEndpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("[%@]"), v4);

  if (-[NPTuscanyOnRamp dayPassFailed](self, "dayPassFailed"))
    objc_msgSend(v5, "appendFormat:", CFSTR(" (daypass failed, error %d)"), -[NPTuscanyOnRamp error](self, "error"));
  return (NSString *)v5;
}

- (NSDictionary)descriptionDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _OWORD v36[3];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NPTuscanyOnRamp daypassEndpoint](self, "daypassEndpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NPTuscanyOnRamp daypassEndpoint](self, "daypassEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("dayPassEndpoint"));

  }
  -[NPTuscanyOnRamp dayPassCreationDate](self, "dayPassCreationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NPTuscanyOnRamp tuscanyEndpoint](self, "tuscanyEndpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NPTuscanyOnRamp tuscanyEndpoint](self, "tuscanyEndpoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("tuscanyEndpoint"));

    }
    -[NPTuscanyOnRamp dayPassUUID](self, "dayPassUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      -[NPTuscanyOnRamp dayPassUUID](self, "dayPassUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("dayPassUUID"));

    }
    -[NPTuscanyOnRamp dayPass](self, "dayPass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && objc_msgSend(v15, "length") == 96)
    {
      v17 = objc_retainAutorelease(v16);
      v18 = objc_msgSend(v17, "bytes");
      if (v18 && *(_WORD *)(v18 + 82))
      {
        memset(v36, 0, 46);
        tuscanyClientGetDayPassOriginAddressString(v17, v36, 0x2Eu);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v36);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("dayPassOriginAddress"));

      }
      else
      {
        v20 = (void *)MEMORY[0x1E0CB37E8];
        v21 = objc_msgSend(objc_retainAutorelease(v17), "bytes");
        if (v21)
          v22 = *(unsigned __int16 *)(v21 + 80);
        else
          v22 = 0;
        objc_msgSend(v20, "numberWithUnsignedShort:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("dayPassHostID"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("dayPassPortID"));

      }
    }
    -[NPTuscanyOnRamp dayPassCreationDate](self, "dayPassCreationDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 == 0;

    if (!v26)
    {
      v27 = (void *)MEMORY[0x1E0CB3578];
      -[NPTuscanyOnRamp dayPassCreationDate](self, "dayPassCreationDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringFromDate:dateStyle:timeStyle:", v28, 1, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("dayPassCreation"));
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[NPTuscanyOnRamp maxFrameSize](self, "maxFrameSize"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("maxframe"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[NPTuscanyOnRamp rtt](self, "rtt"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("rtt"));

    v32 = (void *)MEMORY[0x1E0CB3940];
    -[NPTuscanyOnRamp dayPassHardExpiry](self, "dayPassHardExpiry");
    objc_msgSend(v32, "stringWithFormat:", CFSTR("%f"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("dayPassHardExpiry"));

  }
  return (NSDictionary *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NPTuscanyOnRamp daypassEndpoint](self, "daypassEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "daypassEndpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NPTuscanyOnRamp daypassEndpoint](self, "daypassEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)invalidateDayPass
{
  NSDate *dayPassCreationDate;
  NPTunnelTuscanyEndpoint *tuscanyEndpoint;

  -[NPTuscanyOnRamp unregisterAgent](self, "unregisterAgent");
  -[NPTuscanyOnRamp setDayPass:](self, "setDayPass:", 0);
  -[NPTuscanyOnRamp setDayPassUUID:](self, "setDayPassUUID:", 0);
  dayPassCreationDate = self->_dayPassCreationDate;
  self->_dayPassCreationDate = 0;

  self->_dayPassHardExpiry = 0.0;
  tuscanyEndpoint = self->_tuscanyEndpoint;
  self->_tuscanyEndpoint = 0;

}

- (void)setDayPassSessionCounter:(unsigned int)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  _DWORD *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  -[NPTuscanyOnRamp dayPass](self, "dayPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 == 96)
  {
    -[NPTuscanyOnRamp dayPass](self, "dayPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = malloc_type_malloc(objc_msgSend(v7, "length"), 0x49B5D704uLL);

    if (v8)
    {
      -[NPTuscanyOnRamp dayPass](self, "dayPass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTuscanyOnRamp dayPass](self, "dayPass");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getBytes:length:", v8, objc_msgSend(v10, "length"));

      v8[23] = a3;
      v11 = objc_alloc(MEMORY[0x1E0C99D50]);
      -[NPTuscanyOnRamp dayPass](self, "dayPass");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "initWithBytesNoCopy:length:", v8, objc_msgSend(v13, "length"));
      -[NPTuscanyOnRamp setDayPass:](self, "setDayPass:", v12);

    }
  }
}

- (unsigned)dayPassSessionCounter
{
  id v2;
  uint64_t v3;
  unsigned int v4;

  -[NPTuscanyOnRamp dayPass](self, "dayPass");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "bytes");
  if (v3)
    v4 = *(_DWORD *)(v3 + 92);
  else
    v4 = 0;

  return v4;
}

- (BOOL)isTFOEnabled
{
  return -[NPTuscanyOnRamp TFOStatus](self, "TFOStatus") == 2;
}

- (NPTunnelTuscanyEndpoint)tuscanyEndpoint
{
  return (NPTunnelTuscanyEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTuscanyEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)dayPass
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDayPass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSUUID)dayPassUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDayPassUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)maxFrameSize
{
  return self->_maxFrameSize;
}

- (int64_t)TFOStatus
{
  return self->_TFOStatus;
}

- (void)setTFOStatus:(int64_t)a3
{
  self->_TFOStatus = a3;
}

- (unint64_t)rtt
{
  return self->_rtt;
}

- (int64_t)currentEdgeType
{
  return self->_currentEdgeType;
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (NSDate)dayPassCreationDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDayPassCreationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NWEndpoint)daypassEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 80, 1);
}

- (NSDate)retryDate
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRetryDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (double)dayPassHardExpiry
{
  return self->_dayPassHardExpiry;
}

- (void)setDayPassHardExpiry:(double)a3
{
  self->_dayPassHardExpiry = a3;
}

- (NWNetworkAgentRegistration)agentRegistration
{
  return (NWNetworkAgentRegistration *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAgentRegistration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSPKeyNetworkAgent)agent
{
  return (NSPKeyNetworkAgent *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NPWaldo)parentWaldo
{
  return (NPWaldo *)objc_loadWeakRetained((id *)&self->_parentWaldo);
}

- (void)setParentWaldo:(id)a3
{
  objc_storeWeak((id *)&self->_parentWaldo, a3);
}

- (BOOL)dayPassFailed
{
  return self->_dayPassFailed;
}

- (void)setDayPassFailed:(BOOL)a3
{
  self->_dayPassFailed = a3;
}

- (NSURLSession)dayPassSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDayPassSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)dayPassPending
{
  return self->_dayPassPending;
}

- (void)setDayPassPending:(BOOL)a3
{
  self->_dayPassPending = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayPassSession, 0);
  objc_destroyWeak((id *)&self->_parentWaldo);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_agentRegistration, 0);
  objc_storeStrong((id *)&self->_retryDate, 0);
  objc_storeStrong((id *)&self->_daypassEndpoint, 0);
  objc_storeStrong((id *)&self->_dayPassCreationDate, 0);
  objc_storeStrong((id *)&self->_dayPassUUID, 0);
  objc_storeStrong((id *)&self->_dayPass, 0);
  objc_storeStrong((id *)&self->_tuscanyEndpoint, 0);
}

@end
