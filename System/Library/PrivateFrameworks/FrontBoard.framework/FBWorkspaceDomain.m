@implementation FBWorkspaceDomain

- (BOOL)monitorAllSuspendableProcesses
{
  if (result)
    return *(_BYTE *)(result + 13) != 0;
  return result;
}

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_8);
  return (id)sharedInstance___sharedInstance_1;
}

- (id)reconnectableWorkspaces
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0C99E60];
    if (*(_QWORD *)(a1 + 200))
    {
      objc_msgSend(*(id *)(a1 + 16), "allKeys");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "setWithArray:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)endpoint
{
  void *v1;
  void *v2;

  if (a1)
  {
    -[FBWorkspaceDomain _listener](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "endpoint");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_listener
{
  id *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = a1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__FBWorkspaceDomain__listener__block_invoke;
    block[3] = &unk_1E4A12348;
    block[4] = a1;
    if (_listener_onceToken != -1)
      dispatch_once(&_listener_onceToken, block);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (char)assertionAttributesForWorkspaceState:(char *)a1
{
  char *v3;
  uint64_t v4;
  char *result;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v3 = a1;
    -[FBWorkspaceDomain _ensureAttributes]((uint64_t)a1);
    a1 = 0;
    v4 = 104;
    switch(a2)
    {
      case 0u:
        return a1;
      case 1u:
        goto LABEL_12;
      case 2u:
        v4 = 112;
        goto LABEL_12;
      case 3u:
        v4 = 120;
        goto LABEL_12;
      case 4u:
        v4 = 128;
        goto LABEL_12;
      case 5u:
        v4 = 136;
        goto LABEL_12;
      case 6u:
        v4 = 144;
        goto LABEL_12;
      case 7u:
        v4 = 152;
        goto LABEL_12;
      case 8u:
        v4 = 160;
        goto LABEL_12;
      case 9u:
        v4 = 168;
        goto LABEL_12;
      case 0xAu:
        v4 = 176;
LABEL_12:
        a1 = (char *)*(id *)&v3[v4];
        return a1;
      default:
        v6 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromFBWorkspaceAssertionState(a2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("requested attributes for FBWorkspaceAssertionState %@"), v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBWorkspaceDomain assertionAttributesForWorkspaceState:].cold.1();
        objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        result = (char *)_bs_set_crash_log_message();
        __break(0);
        return result;
    }
  }
  return a1;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 allowsDirectConnections;
  NSObject *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD);
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "remoteToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && !objc_msgSend(v9, "isInvalid"))
  {
    if (objc_msgSend(v8, "decodeBoolForKey:", CFSTR("targetsClientEndpoint")))
    {
      allowsDirectConnections = self->_allowsDirectConnections;
      FBLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      v11 = v13;
      if (!allowsDirectConnections)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[FBWorkspaceDomain listener:didReceiveConnection:withContext:].cold.2();
        goto LABEL_5;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v10;
        _os_log_impl(&dword_1A359A000, v11, OS_LOG_TYPE_INFO, "FBWorkspaceDomain: Registering new direct workspace connection with remoteToken=%{public}@", buf, 0xCu);
      }

      v14 = (void *)MEMORY[0x1E0D23298];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke;
      v22[3] = &unk_1E4A12C70;
      v23 = v7;
      objc_msgSend(v14, "_registerBlockForWorkspaceCreation:", v22);
      v15 = v23;
    }
    else
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke_129;
      v19[3] = &unk_1E4A11FD0;
      v20 = v10;
      v21 = v7;
      v16 = (void (**)(_QWORD))MEMORY[0x1A8590C4C](v19);
      +[FBProcessManager sharedInstanceIfExists](FBProcessManager, "sharedInstanceIfExists");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v16[2](v16);
      }
      else
      {
        dispatch_get_global_queue(33, 0);
        v18 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v18, v16);

      }
      v15 = v20;
    }

    goto LABEL_18;
  }
  FBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[FBWorkspaceDomain listener:didReceiveConnection:withContext:].cold.1();
LABEL_5:

  objc_msgSend(v7, "invalidate");
LABEL_18:

}

uint64_t __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_registerSourcePeer:", *(_QWORD *)(a1 + 32));
}

- (char)assertionAttributesForLaunchIntent:(char *)a1
{
  char *v3;

  if (a1)
  {
    v3 = a1;
    -[FBWorkspaceDomain _ensureAttributes]((uint64_t)a1);
    if ((unint64_t)(a2 - 1) <= 4)
      return (char *)*(id *)&v3[qword_1A3619928[a2 - 1]];
    a1 = 0;
  }
  return a1;
}

- (void)_ensureAttributes
{
  _QWORD block[5];

  if (a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__FBWorkspaceDomain__ensureAttributes__block_invoke;
    block[3] = &unk_1E4A12348;
    block[4] = a1;
    if (_ensureAttributes_onceToken != -1)
      dispatch_once(&_ensureAttributes_onceToken, block);
  }
}

- (BOOL)selfAssertRuntime
{
  if (result)
    return *(_BYTE *)(result + 12) != 0;
  return result;
}

- (id)endpointInjectorTargetingProcess:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v18;
  _QWORD block[4];
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;

  v3 = a2;
  if (a1)
  {
    -[FBWorkspaceDomain _listener]((id *)a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 10))
    {
      objc_msgSend(v3, "identity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D87D80], "identityOfCurrentProcess");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

      if (v7)
      {
        v8 = (void *)MEMORY[0x1E0D23298];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __54__FBWorkspaceDomain_endpointInjectorTargetingProcess___block_invoke;
        v21[3] = &unk_1E4A12C70;
        v22 = v4;
        objc_msgSend(v8, "_registerBlockForWorkspaceCreation:", v21);
        a1 = 0;
        v9 = v22;
      }
      else
      {
        v10 = objc_msgSend(v3, "pid");
        if ((int)v10 < 1)
        {
          FBLogProcessWorkspace();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            -[FBWorkspaceDomain endpointInjectorTargetingProcess:].cold.2();
          a1 = 0;
        }
        else
        {
          v11 = v10;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __54__FBWorkspaceDomain_endpointInjectorTargetingProcess___block_invoke_2;
          block[3] = &unk_1E4A12348;
          v20 = v4;
          if (endpointInjectorTargetingProcess__onceToken != -1)
            dispatch_once(&endpointInjectorTargetingProcess__onceToken, block);
          -[FBWorkspaceDomain _ensureAttributes](a1);
          v12 = objc_alloc(MEMORY[0x1E0D87C98]);
          objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          a1 = objc_msgSend(v12, "initWithExplanation:target:attributes:", CFSTR("workspace-endpoint-injection"), v13, *(_QWORD *)(a1 + 184));

          v18 = 0;
          LODWORD(v12) = objc_msgSend((id)a1, "acquireWithError:", &v18);
          v14 = v18;
          v15 = v14;
          if (!(_DWORD)v12 || v14)
          {
            FBLogProcessWorkspace();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              -[FBWorkspaceDomain endpointInjectorTargetingProcess:].cold.1();

          }
          v9 = v20;
        }
      }

    }
    else
    {
      a1 = 0;
    }

  }
  return (id)a1;
}

- (uint64_t)defaultSceneInterruptionPolicy
{
  if (result)
  {
    if (*(_BYTE *)(result + 9))
      return 3;
    else
      return 1;
  }
  return result;
}

- (FBWorkspaceDomain)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBWorkspaceDomain *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBWorkspaceDomain *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on FBWorkspaceDomain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBWorkspaceDomain.m");
    v17 = 1024;
    v18 = 87;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBWorkspaceDomain *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (_WORD)_init
{
  _WORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  objc_super v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v91.receiver = a1;
  v91.super_class = (Class)FBWorkspaceDomain;
  v1 = objc_msgSendSuper2(&v91, sel_init);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0D23048], "bootstrapConfiguration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D22FD8], "environmentAliases");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D23018], "defaultShellMachName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resolveMachService:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D232C8], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "domainsContainingServiceIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
    {
      objc_msgSend(v2, "domainForMachName:", v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("if we own the defaultShellMachName (%@) then %@ must be registered there"), v5, v6);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBWorkspaceDomain _init].cold.1();
        objc_msgSend(objc_retainAutorelease(v70), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A35D2B40);
      }
      v1[4] = 0;
      v19 = (void *)*((_QWORD *)v1 + 24);
      *((_QWORD *)v1 + 24) = CFSTR("com.apple.frontboard.workspace-service.fallback");

      v20 = (void *)*((_QWORD *)v1 + 25);
      *((_QWORD *)v1 + 25) = 0;

      v1[5] = 1;
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "infoDictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v1 + 12) = objc_msgSend(v22, "bs_BOOLForKey:", CFSTR("FBWorkspaceDynamicDomainOption_SelfAssertRuntime"));

      *(_WORD *)((char *)v1 + 13) = 0;
      v23 = (void *)*((_QWORD *)v1 + 3);
      *((_QWORD *)v1 + 3) = 0;

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)*((_QWORD *)v1 + 2);
      *((_QWORD *)v1 + 2) = v24;
      goto LABEL_51;
    }
    if (objc_msgSend(v7, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must have one and only one domain specify %@ : domains=%@"), v6, v7);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspaceDomain _init].cold.3();
      objc_msgSend(objc_retainAutorelease(v68), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35D2A88);
    }
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "domainForMachName:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9 && (void *)v9 != v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("if we own the defaultShellMachName (%@) then %@ must be registered there"), v5, v6);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspaceDomain _init].cold.2();
      objc_msgSend(objc_retainAutorelease(v69), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35D2AE4);
    }
    v77 = (void *)v9;
    v10 = 1;
    *((_BYTE *)v1 + 8) = 1;
    *((_BYTE *)v1 + 9) = v9 != 0;
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    v13 = (void *)*((_QWORD *)v1 + 24);
    *((_QWORD *)v1 + 24) = v12;

    objc_msgSend(v8, "machName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    v16 = (void *)*((_QWORD *)v1 + 25);
    *((_QWORD *)v1 + 25) = v15;

    v81 = v8;
    objc_msgSend(v8, "serviceForIdentifier:", v6);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "optionForKey:", CFSTR("InjectEndpoint"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = objc_msgSend(v79, "BOOLValue");
    *((_BYTE *)v1 + 10) = v10;
    objc_msgSend(v82, "optionForKey:", CFSTR("AssertVisibility"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v17;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      *((_BYTE *)v1 + 11) = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D22F80], "tokenForCurrentProcess");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v1 + 11) = objc_msgSend(v26, "hasEntitlement:", CFSTR("com.apple.runningboard.primitiveattribute"));

    }
    objc_msgSend(v82, "optionForKey:", CFSTR("SelfAssertRuntime"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v27;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = objc_msgSend(v27, "BOOLValue");
    else
      v28 = 0;
    *((_BYTE *)v1 + 12) = v28;
    *((_BYTE *)v1 + 13) = *((_BYTE *)v1 + 9);
    objc_msgSend(v8, "loadRBSLaunchIdentifiers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "containsObject:", *MEMORY[0x1E0D22E38]);

    *((_BYTE *)v1 + 14) = v30;
    objc_msgSend(v82, "optionForKey:", CFSTR("DefaultWorkspace"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v75 = v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v31, "isEqualToString:", CFSTR("FBSceneManager")))
      {
        v32 = (void *)*((_QWORD *)v1 + 3);
        *((_QWORD *)v1 + 3) = CFSTR("FBSceneManager");
      }
      else
      {
        v33 = objc_msgSend(v31, "copy");
        v32 = (void *)*((_QWORD *)v1 + 3);
        *((_QWORD *)v1 + 3) = v33;
      }
    }
    else
    {
      v32 = (void *)*((_QWORD *)v1 + 3);
      *((_QWORD *)v1 + 3) = 0;
    }
    v34 = v80;

    objc_msgSend(v82, "optionForKey:", CFSTR("RegisterWorkspaces"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v35)
    {
      objc_msgSend(v82, "optionForKey:", CFSTR("ReconnectWorkspaces"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v35)
      {
        if (*((_BYTE *)v1 + 9))
        {
          +[FBWorkspaceRegistration registrationWithIdentifier:options:](FBWorkspaceRegistration, "registrationWithIdentifier:options:", CFSTR("FBSceneManager"), 0);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:");
          v65 = objc_claimAutoreleasedReturnValue();
          v66 = (void *)*((_QWORD *)v1 + 2);
          *((_QWORD *)v1 + 2) = v65;

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
          v67 = objc_claimAutoreleasedReturnValue();
          v60 = (void *)*((_QWORD *)v1 + 2);
          *((_QWORD *)v1 + 2) = v67;
        }
LABEL_50:

        v25 = v81;
LABEL_51:

        objc_msgSend(MEMORY[0x1E0D23018], "nullEndpointForService:instance:", v6, 0);
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = (void *)*((_QWORD *)v1 + 4);
        *((_QWORD *)v1 + 4) = v61;

        if (*((_QWORD *)v1 + 25))
          v63 = -[FBWorkspaceDomain _listener]((id *)v1);

        return v1;
      }
    }
    v74 = v7;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v78 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v71 = v6;
      v72 = v5;
      v73 = v2;
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v37 = v35;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v88;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v88 != v40)
              objc_enumerationMutation(v37);
            +[FBWorkspaceRegistration registrationWithIdentifier:options:](FBWorkspaceRegistration, "registrationWithIdentifier:options:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i), 0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v42;
            if (v42)
            {
              objc_msgSend(v42, "identifier");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKey:", v43, v44);

            }
          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
        }
        while (v39);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_46;
      v71 = v6;
      v72 = v5;
      v73 = v2;
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v45 = v35;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v84;
        do
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v84 != v48)
              objc_enumerationMutation(v45);
            v50 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j);
            objc_msgSend(v45, "objectForKey:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            +[FBWorkspaceRegistration registrationWithIdentifier:options:](FBWorkspaceRegistration, "registrationWithIdentifier:options:", v50, v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v52;
            if (v52)
            {
              objc_msgSend(v52, "identifier");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKey:", v53, v54);

            }
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
        }
        while (v47);
      }
    }

    v5 = v72;
    v2 = v73;
    v6 = v71;
    v34 = v80;
LABEL_46:
    if (*((_QWORD *)v1 + 3))
    {
      objc_msgSend(v36, "objectForKey:");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v55)
      {
        +[FBWorkspaceRegistration registrationWithIdentifier:options:](FBWorkspaceRegistration, "registrationWithIdentifier:options:", *((_QWORD *)v1 + 3), 0);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "identifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKey:", v56, v57);

        v34 = v80;
      }
    }
    v58 = objc_msgSend(v36, "copy");
    v59 = (void *)*((_QWORD *)v1 + 2);
    *((_QWORD *)v1 + 2) = v58;

    v7 = v74;
    v60 = v78;
    goto LABEL_50;
  }
  return v1;
}

- (id)startListener
{
  if (result)
    return (id *)-[FBWorkspaceDomain _listener](result);
  return result;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  FBWorkspaceDomain *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dealloc is not allowed on FBWorkspaceDomain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138544642;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    v14 = 2114;
    v15 = CFSTR("FBWorkspaceDomain.m");
    v16 = 1024;
    v17 = 218;
    v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __35__FBWorkspaceDomain_sharedInstance__block_invoke()
{
  _WORD *v0;
  void *v1;

  v0 = -[FBWorkspaceDomain _init]([FBWorkspaceDomain alloc]);
  v1 = (void *)sharedInstance___sharedInstance_1;
  sharedInstance___sharedInstance_1 = (uint64_t)v0;

}

- (BOOL)allowsDirectConnections
{
  if (result)
    return *(_BYTE *)(result + 14) != 0;
  return result;
}

- (id)nullEndpoint
{
  if (a1)
    a1 = (id *)a1[4];
  return a1;
}

void __54__FBWorkspaceDomain_endpointInjectorTargetingProcess___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "endpoint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_registerSourceEndpoint:", v4);

}

void __54__FBWorkspaceDomain_endpointInjectorTargetingProcess___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "endpoint");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FBLogProcessWorkspace();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v1, "targetDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A359A000, v2, OS_LOG_TYPE_DEFAULT, "FBWorkspaceDomain: registering saved endowment for workspace endpoint : %{public}@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D232C8], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "saveAsInjectorEndowmentForKey:", v4);

}

+ (id)debugDescription
{
  void *v2;
  void *v3;

  +[FBWorkspaceDomain sharedInstance]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)startListener
{
  id *v2;
  id v3;
  id *v4;

  +[FBWorkspaceDomain sharedInstance]();
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    v3 = -[FBWorkspaceDomain _listener](v2);
    v2 = v4;
  }

}

+ (id)endpoint
{
  id *v2;
  void *v3;

  +[FBWorkspaceDomain sharedInstance]();
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[FBWorkspaceDomain endpoint](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __30__FBWorkspaceDomain__listener__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  void *v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 8))
  {
    v3 = (void *)MEMORY[0x1E0D23048];
    v23 = *(_QWORD *)(v2 + 192);
    v21[0] = CFSTR("Start");
    v21[1] = CFSTR("Services");
    v22[0] = CFSTR("ManualSession");
    objc_msgSend(MEMORY[0x1E0D232C8], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v4;
    v20 = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerDynamicDomainsFromPlist:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v2 = *(_QWORD *)(a1 + 32);
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __30__FBWorkspaceDomain__listener__block_invoke_2;
  v18[3] = &unk_1E4A12530;
  v18[4] = v2;
  objc_msgSend(MEMORY[0x1E0D23030], "listenerWithConfigurator:", v18);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 48);
  *(_QWORD *)(v12 + 48) = v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "activate");
  v14 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v14 + 8))
  {
    objc_msgSend(MEMORY[0x1E0D23048], "activateManualDomain:", *(_QWORD *)(v14 + 192));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 56);
    *(_QWORD *)(v16 + 56) = v15;

  }
}

void __30__FBWorkspaceDomain__listener__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
  v5 = a2;
  objc_msgSend(v5, "setDomain:", v3);
  objc_msgSend(MEMORY[0x1E0D232C8], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setService:", v4);

  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
}

void __38__FBWorkspaceDomain__ensureAttributes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  _QWORD *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  _QWORD *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  _QWORD *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  _QWORD *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[3];
  _QWORD v93[2];
  _QWORD v94[3];
  uint64_t v95;
  _QWORD v96[2];
  uint64_t v97;
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[3];
  _QWORD v101[2];
  _QWORD v102[3];
  uint64_t v103;
  _QWORD v104[2];
  uint64_t v105;
  _QWORD v106[2];
  void *v107;
  void *v108;
  _QWORD v109[2];
  void *v110;
  void *v111;
  uint64_t v112;
  _QWORD v113[2];
  uint64_t v114;
  _QWORD v115[4];

  v115[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D87C80], "attributeWithCompletionPolicy:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Visibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Bootstrap-Foreground"));
  v4 = objc_claimAutoreleasedReturnValue();
  v89 = (void *)v4;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
  {
    v115[0] = v4;
    v115[1] = v3;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = v115;
    v7 = 2;
  }
  else
  {
    v114 = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v114;
    v7 = 1;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v8);

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Bootstrap-ForegroundSupport"));
  v9 = objc_claimAutoreleasedReturnValue();
  v88 = (void *)v9;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
  {
    v113[0] = v9;
    v113[1] = v3;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = v113;
    v12 = 2;
  }
  else
  {
    v112 = v9;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v112;
    v12 = 1;
  }
  objc_msgSend(v10, "arrayWithObjects:count:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), v13);

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Bootstrap-BackgroundUserInitiated"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 80);
  *(_QWORD *)(v16 + 80) = v15;

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Bootstrap-Background"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 88);
  *(_QWORD *)(v20 + 88) = v19;

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Bootstrap-Utility"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v22;
  objc_msgSend(MEMORY[0x1E0D87CE0], "attributeWithDuration:warningDuration:startPolicy:endPolicy:", 1, 1, 60.0, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 2);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD *)(a1 + 32);
  v26 = *(void **)(v25 + 96);
  *(_QWORD *)(v25 + 96) = v24;

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Workspace-BackgroundUtility"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = *(_QWORD *)(a1 + 32);
  v30 = *(void **)(v29 + 104);
  *(_QWORD *)(v29 + 104) = v28;

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Workspace-BackgroundActive"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = *(_QWORD *)(a1 + 32);
  v34 = *(void **)(v33 + 112);
  *(_QWORD *)(v33 + 112) = v32;

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Workspace-ForegroundSuspendable"));
  v35 = objc_claimAutoreleasedReturnValue();
  v87 = (void *)v35;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
  {
    v106[0] = v35;
    v106[1] = v3;
    v36 = (void *)MEMORY[0x1E0C99D20];
    v37 = v106;
    v38 = 2;
  }
  else
  {
    v105 = v35;
    v36 = (void *)MEMORY[0x1E0C99D20];
    v37 = &v105;
    v38 = 1;
  }
  objc_msgSend(v36, "arrayWithObjects:count:", v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), v39);

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Workspace-ForegroundUtility"));
  v40 = objc_claimAutoreleasedReturnValue();
  v86 = (void *)v40;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
  {
    v104[0] = v40;
    v104[1] = v3;
    v41 = (void *)MEMORY[0x1E0C99D20];
    v42 = v104;
    v43 = 2;
  }
  else
  {
    v103 = v40;
    v41 = (void *)MEMORY[0x1E0C99D20];
    v42 = &v103;
    v43 = 1;
  }
  objc_msgSend(v41, "arrayWithObjects:count:", v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), v44);

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Workspace-ForegroundActive"));
  v45 = objc_claimAutoreleasedReturnValue();
  v85 = (void *)v45;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
  {
    v102[0] = v45;
    v102[1] = v2;
    v102[2] = v3;
    v46 = (void *)MEMORY[0x1E0C99D20];
    v47 = v102;
    v48 = 3;
  }
  else
  {
    v101[0] = v45;
    v101[1] = v2;
    v46 = (void *)MEMORY[0x1E0C99D20];
    v47 = v101;
    v48 = 2;
  }
  objc_msgSend(v46, "arrayWithObjects:count:", v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), v49);

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Workspace-ForegroundFocal"));
  v50 = objc_claimAutoreleasedReturnValue();
  v83 = v50;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
  {
    v100[0] = v50;
    v100[1] = v2;
    v100[2] = v3;
    v51 = (void *)MEMORY[0x1E0C99D20];
    v52 = v100;
    v53 = 3;
  }
  else
  {
    v99[0] = v50;
    v99[1] = v2;
    v51 = (void *)MEMORY[0x1E0C99D20];
    v52 = v99;
    v53 = 2;
  }
  objc_msgSend(v51, "arrayWithObjects:count:", v52, v53, v83);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 144), v54);

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Workspace-ForegroundSupportSuspendable"));
  v55 = objc_claimAutoreleasedReturnValue();
  v56 = (void *)v55;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
  {
    v98[0] = v55;
    v98[1] = v3;
    v57 = (void *)MEMORY[0x1E0C99D20];
    v58 = v98;
    v59 = 2;
  }
  else
  {
    v97 = v55;
    v57 = (void *)MEMORY[0x1E0C99D20];
    v58 = &v97;
    v59 = 1;
  }
  objc_msgSend(v57, "arrayWithObjects:count:", v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 152), v60);

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Workspace-ForegroundSupportUtility"));
  v61 = objc_claimAutoreleasedReturnValue();
  v62 = (void *)v61;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
  {
    v96[0] = v61;
    v96[1] = v3;
    v63 = (void *)MEMORY[0x1E0C99D20];
    v64 = v96;
    v65 = 2;
  }
  else
  {
    v95 = v61;
    v63 = (void *)MEMORY[0x1E0C99D20];
    v64 = &v95;
    v65 = 1;
  }
  objc_msgSend(v63, "arrayWithObjects:count:", v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), v66);

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Workspace-ForegroundSupportActive"));
  v67 = objc_claimAutoreleasedReturnValue();
  v68 = (void *)v67;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
  {
    v94[0] = v67;
    v94[1] = v2;
    v94[2] = v3;
    v69 = (void *)MEMORY[0x1E0C99D20];
    v70 = v94;
    v71 = 3;
  }
  else
  {
    v93[0] = v67;
    v93[1] = v2;
    v69 = (void *)MEMORY[0x1E0C99D20];
    v70 = v93;
    v71 = 2;
  }
  objc_msgSend(v69, "arrayWithObjects:count:", v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), v72);

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Workspace-ForegroundSupportFocal"));
  v73 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)v73;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
  {
    v92[0] = v73;
    v92[1] = v2;
    v92[2] = v3;
    v75 = (void *)MEMORY[0x1E0C99D20];
    v76 = v92;
    v77 = 3;
  }
  else
  {
    v91[0] = v73;
    v91[1] = v2;
    v75 = (void *)MEMORY[0x1E0C99D20];
    v76 = v91;
    v77 = 2;
  }
  objc_msgSend(v75, "arrayWithObjects:count:", v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), v78);

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("WorkspaceEndpointInjection"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v79;
  v90[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
  v80 = objc_claimAutoreleasedReturnValue();
  v81 = *(_QWORD *)(a1 + 32);
  v82 = *(void **)(v81 + 184);
  *(_QWORD *)(v81 + 184) = v80;

}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  FBWorkspaceDomain *v12;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_machName, CFSTR("machName"), 1);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __32__FBWorkspaceDomain_description__block_invoke;
  v10 = &unk_1E4A11FD0;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v7);
  objc_msgSend(v4, "build", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

id __32__FBWorkspaceDomain_description__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  NSStringFromFBSSceneInterruptionPolicy();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("defaultSceneInterruptionPolicy"));

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 10), CFSTR("injectorEnabled"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 11), CFSTR("assertsVisibility"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 12), CFSTR("selfAssertRuntime"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("defaultWorkspace"));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendArraySection:withName:skipIfEmpty:", v8, CFSTR("preregisteredWorkspaces"), 1);

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendPointer:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("listener"));
}

void __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke_129(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _OWORD v10[2];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v3, "realToken");
  else
    memset(v10, 0, sizeof(v10));
  objc_msgSend(v2, "registerProcessForAuditToken:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "workspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    FBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "workspace");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v12 = v8;
        v13 = 2114;
        v14 = v4;
        _os_log_impl(&dword_1A359A000, v7, OS_LOG_TYPE_INFO, "FBWorkspaceDomain: Assigning new workspace connection to workspace (%p) owned by process: %{public}@", buf, 0x16u);

      }
      -[FBWorkspace _setIncomingConnection:]((uint64_t)v5, *(void **)(a1 + 40));
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke_129_cold_2();

      objc_msgSend(*(id *)(a1 + 40), "invalidate");
    }

  }
  else
  {
    FBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke_129_cold_1(a1, (_QWORD *)(a1 + 32), v9);

    objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }

}

- (uint64_t)machName
{
  if (result)
    return *(_QWORD *)(result + 200);
  return result;
}

- (uint64_t)preregisteredWorkspaces
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)defaultWorkspace
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_injectorAttributes, 0);
  objc_storeStrong((id *)&self->_fgSupportFocalAttributes, 0);
  objc_storeStrong((id *)&self->_fgSupportNonFocalAttributes, 0);
  objc_storeStrong((id *)&self->_fgSupportUtilityAttributes, 0);
  objc_storeStrong((id *)&self->_fgSupportSuspendedAttributes, 0);
  objc_storeStrong((id *)&self->_fgFocalAttributes, 0);
  objc_storeStrong((id *)&self->_fgNonFocalAttributes, 0);
  objc_storeStrong((id *)&self->_fgUtilityAttributes, 0);
  objc_storeStrong((id *)&self->_fgSuspendedAttributes, 0);
  objc_storeStrong((id *)&self->_bgActiveAttributes, 0);
  objc_storeStrong((id *)&self->_bgUtilityAttributes, 0);
  objc_storeStrong((id *)&self->_utLaunchAttributes, 0);
  objc_storeStrong((id *)&self->_bgLaunchAttributes, 0);
  objc_storeStrong((id *)&self->_bgUserInitiatedAttributes, 0);
  objc_storeStrong((id *)&self->_fgSupportLaunchAttributes, 0);
  objc_storeStrong((id *)&self->_fgLaunchAttributes, 0);
  objc_storeStrong((id *)&self->_activation, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_nullEndpoint, 0);
  objc_storeStrong((id *)&self->_defaultWorkspace, 0);
  objc_storeStrong((id *)&self->_preregisteredWorkspaces, 0);
}

- (void)_init
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)endpointInjectorTargetingProcess:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_1(&dword_1A359A000, v0, v1, "FBWorkspaceDomain: error injecting workspace endpoint to %{public}@ : %{public}@");
  OUTLINED_FUNCTION_12();
}

- (void)endpointInjectorTargetingProcess:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6(&dword_1A359A000, v0, v1, "FBWorkspaceDomain: can not inject workspace endpoint to %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)assertionAttributesForWorkspaceState:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)listener:didReceiveConnection:withContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6(&dword_1A359A000, v0, v1, "FBWorkspaceDomain: Unable to assign new incoming connection to a process because the remote was unknown : connection=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)listener:didReceiveConnection:withContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6(&dword_1A359A000, v0, v1, "FBWorkspaceDomain: Unable to register new direct workspace connection with remoteToken=%{public}@ because the service doesn't declare support for direct connections", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke_129_cold_1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_8_1(&dword_1A359A000, (uint64_t)a2, a3, "FBWorkspaceDomain: Unable to assign new incoming connection to a process because a process was unable to be found or created for connection=%@ with remoteToken=%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_12();
}

void __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke_129_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6(&dword_1A359A000, v0, v1, "FBWorkspaceDomain: Unable to assign new incoming connection to a process because its server was unable to be found for process=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

@end
