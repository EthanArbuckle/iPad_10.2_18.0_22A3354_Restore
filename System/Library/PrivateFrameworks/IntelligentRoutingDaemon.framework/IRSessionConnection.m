@implementation IRSessionConnection

- (void)_runWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  _QWORD v59[4];
  id v60;
  uint64_t v61;
  const __CFString *v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  const __CFString *v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRSessionConnection server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BE5B308];
    objc_msgSend(v4, "serviceToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSessionConnection client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v6, "isServiceTokenValid:forClientIdentifier:", v7, v9);

    if ((_DWORD)v6)
    {
      objc_msgSend(v4, "serviceToken");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");
    }
    else
    {
      v12 = (void *)MEMORY[0x24BE5B308];
      -[IRSessionConnection client](self, "client");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clientIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "serviceTokenForServiceIdentifier:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v11)
    {
      v14 = objc_msgSend(v4, "mode");
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE5B2D0]), "initWithServiceToken:", v11);

      objc_msgSend(v15, "setMode:", v14);
      -[IRSessionConnection serviceIdentifier](self, "serviceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
LABEL_17:
        v43 = -[IRSessionConnection mode](self, "mode", v52);
        if (v43 != objc_msgSend(v15, "mode"))
        {
          -[IRSessionConnection setMode:](self, "setMode:", objc_msgSend(v15, "mode"));
          -[IRSessionConnection serviceIdentifier](self, "serviceIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "refreshUpdateModeForServiceIdentifier:", v44);

        }
        -[IRSessionConnection serviceHandler](self, "serviceHandler");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "run");
        v4 = v15;
        goto LABEL_21;
      }
      os_unfair_lock_lock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
      objc_msgSend(v5, "persistenceManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[IRServiceContainer getServicesWithPersistenceManager:](IRServiceContainer, "getServicesWithPersistenceManager:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v59[0] = MEMORY[0x24BDAC760];
      v59[1] = 3221225472;
      v59[2] = __45__IRSessionConnection__runWithConfiguration___block_invoke;
      v59[3] = &unk_251045C00;
      v4 = v15;
      v60 = v4;
      v57 = v18;
      objc_msgSend(v18, "firstWhere:", v59);
      v58 = objc_claimAutoreleasedReturnValue();
      v19 = (id)*MEMORY[0x24BE5B270];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        -[IRSessionConnection client](self, "client");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "clientIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "serviceToken");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "serviceIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "serviceToken");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "servicePackage");
        IRServicePackageString();
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v64 = v53;
        v65 = 2112;
        v66 = (uint64_t)v21;
        v67 = 2112;
        v68 = v23;
        v69 = 2112;
        v70 = v58;
        _os_log_impl(&dword_23FFBA000, v19, OS_LOG_TYPE_INFO, "#session-connection, Client:%@ running Service Token:%@ with Service Package:%@\n Service found in database:%@", buf, 0x2Au);

      }
      v24 = (void *)v58;
      if (!v58)
      {
        objc_msgSend(v4, "serviceToken");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "serviceIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "serviceToken");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "serviceIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_alloc(MEMORY[0x24BE5B300]);
        objc_msgSend(v4, "serviceToken");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v27, "initWithServicePackage:", objc_msgSend(v28, "servicePackage"));
        objc_msgSend(v5, "persistenceManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[IRServiceContainer createServiceWithClientIdentifier:serviceIdentifier:parameters:persistenceManager:](IRServiceContainer, "createServiceWithClientIdentifier:serviceIdentifier:parameters:persistenceManager:", v54, v26, v29, v30);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = (id)*MEMORY[0x24BE5B270];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "serviceToken");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "serviceIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[IRSessionConnection client](self, "client");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "clientIdentifier");
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v35;
          v37 = CFSTR("YES");
          *(_DWORD *)buf = 138412802;
          v64 = v33;
          v65 = 2112;
          if (!v52)
            v37 = CFSTR("NO");
          v66 = v35;
          v67 = 2112;
          v68 = v37;
          _os_log_impl(&dword_23FFBA000, v31, OS_LOG_TYPE_INFO, "#session-connection, Creating service: %@, for client: %@, success: %@", buf, 0x20u);

        }
        v24 = 0;
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
      objc_msgSend(v4, "serviceToken");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "serviceIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "registerWithServiceIdentifier:withConnection:", v39, self);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        objc_msgSend(v4, "serviceToken");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "serviceIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[IRSessionConnection setServiceIdentifier:](self, "setServiceIdentifier:", v42);

        -[IRSessionConnection setServiceHandler:](self, "setServiceHandler:", v40);
        goto LABEL_17;
      }
      v49 = (void *)MEMORY[0x24BDD1540];
      v61 = *MEMORY[0x24BDD0FD8];
      v62 = CFSTR("Could not run service");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE5B268], -12889, v50);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      -[IRSessionConnection client](self, "client");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "_sessionDidFailWithError:", v45);

    }
    else
    {
      v46 = (void *)MEMORY[0x24BDD1540];
      v71 = *MEMORY[0x24BDD0FD8];
      v72[0] = CFSTR("Could not run service, unknown client");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE5B268], -12889, v47);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      -[IRSessionConnection client](self, "client");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "_sessionDidFailWithError:", v45);

    }
LABEL_21:

  }
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)didUpdateContexts:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *log;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[IRSessionConnection mode](self, "mode") == 1)
  {
    -[IRSessionConnection client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_didUpdateContext:", v6);

    v9 = (void *)*MEMORY[0x24BE5B280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
    {
      log = v9;
      -[IRSessionConnection client](self, "client");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "clientIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allKeys");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[IRLogQEUtility getContextAsString:](IRLogQEUtility, "getContextAsString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v22 = v17;
      v23 = 2112;
      v24 = v7;
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = v13;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_23FFBA000, log, OS_LOG_TYPE_DEFAULT, "#session-connection, [%@]:[%@]: didUpdateContexts: [%@][%@]:\n%@", buf, 0x34u);

    }
  }

}

- (int64_t)mode
{
  return self->_mode;
}

- (IRSessionClientProxy)client
{
  return self->_client;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (IRServiceHandling)serviceHandler
{
  return (IRServiceHandling *)objc_loadWeakRetained((id *)&self->_serviceHandler);
}

- (IRSessionServer)server
{
  return (IRSessionServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (IRSessionConnection)initWithServer:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  IRSessionConnection *v8;
  IRSessionConnection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRSessionConnection;
  v8 = -[IRSessionConnection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[IRSessionConnection setServer:](v8, "setServer:", v6);
    -[IRSessionConnection setClient:](v9, "setClient:", v7);
  }

  return v9;
}

- (void)xpcInvalidationHandler
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23FFBA000, log, OS_LOG_TYPE_ERROR, "#session-connection, [ErrorId - Unregister error during invalidation] Could not unregister from server", v1, 2u);
}

- (void)_createServiceWithParameters:(id)a3 reply:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BE5B308];
  v7 = a4;
  -[IRSessionConnection client](self, "client");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceTokenForServiceIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))a4 + 2))(v7, v9, 0);

}

- (void)_deleteService:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
  -[IRSessionConnection server](self, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistenceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRServiceContainer deleteServiceWithToken:persistenceManager:](IRServiceContainer, "deleteServiceWithToken:persistenceManager:", v6, v5);

  os_unfair_lock_unlock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
}

- (void)_databaseExportwithReply:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *))a3;
  -[IRSessionConnection server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistenceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRServiceContainer exportDatabaseWithPersistenceManager:](IRServiceContainer, "exportDatabaseWithPersistenceManager:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BE5B268];
    v12 = *MEMORY[0x24BDD0FD8];
    v13[0] = CFSTR("Could not export DB");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, -12895, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v4[2](v4, v7, v8);

}

- (void)_deleteDatabaseWithReply:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
  -[IRSessionConnection server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistenceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[IRServiceContainer deleteDatabaseWithPersistenceManager:](IRServiceContainer, "deleteDatabaseWithPersistenceManager:", v6);

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0FD8];
    v12[0] = CFSTR("Couldn't delete DB");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE5B268], -12896, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v4[2](v4, v8);

  os_unfair_lock_unlock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
}

- (void)_getServiceTokensWithReply:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
  -[IRSessionConnection client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSessionConnection server](self, "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistenceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRServiceContainer getServiceTokensForClientIdentifier:persistenceManager:](IRServiceContainer, "getServiceTokensForClientIdentifier:persistenceManager:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0FD8];
    v14[0] = CFSTR("Could not get service tokens");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE5B268], -12897, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v4[2](v4, v9, v10);

  os_unfair_lock_unlock((os_unfair_lock_t)&serviceCreationAndDeletionlock);
}

uint64_t __45__IRSessionConnection__runWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "serviceToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqual:", v6);
  return v7;
}

- (void)_updateCandidates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__IRSessionConnection__updateCandidates___block_invoke;
  v8[3] = &unk_251045C28;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  -[IRSessionConnection serviceHandler](self, "serviceHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateCandidates:", v7);

}

void __41__IRSessionConnection__updateCandidates___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[IRCandidateDO candidateDOFromCandidate:](IRCandidateDO, "candidateDOFromCandidate:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_deleteCandidate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IRSessionConnection serviceHandler](self, "serviceHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[IRCandidateDO candidateDOFromCandidate:](IRCandidateDO, "candidateDOFromCandidate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "deleteCandidate:", v5);
}

- (void)_addEvent:(id)a3 forCandidateIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[IRSessionConnection serviceHandler](self, "serviceHandler");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventDO");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addEvent:forCandidateIdentifier:", v8, v6);
}

- (void)_requestCurrentContextWithBundleID:(id)a3
{
  id v4;
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
  NSObject *log;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRSessionConnection serviceHandler](self, "serviceHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestCurrentContextWithBundleID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IRSessionConnection client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_didUpdateContext:", v6);

  v8 = (void *)*MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    -[IRSessionConnection client](self, "client");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "clientIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRLogQEUtility getContextAsString:](IRLogQEUtility, "getContextAsString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v21 = v9;
    v22 = 2112;
    v23 = CFSTR("Request");
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v13;
    v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_23FFBA000, log, OS_LOG_TYPE_DEFAULT, "#session-connection, [%@]:[%@]: didUpdateContexts: [%@][%@]:\n%@", buf, 0x34u);

  }
}

- (void)_invalidate
{
  id v2;

  -[IRSessionConnection client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateXPCConnection");

}

- (void)didUpdateBundlesWithSignificantInteractionPattern:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRSessionConnection client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_didUpdateBundlesWithSignificantInteractionPattern:", v4);

  v6 = (void *)*MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[IRSessionConnection client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_DEFAULT, "#session-connection, [%@]: Did update bundles: [%@]", (uint8_t *)&v10, 0x16u);

  }
}

- (void)_setSpotOnLocationWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[IRSessionConnection serviceHandler](self, "serviceHandler");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[IRSessionConnection client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSpotOnLocationWithParameters:andClientID:", v4, v6);

}

- (void)didSpotOnLocationComplete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRSessionConnection client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_didSpotOnLocationComplete:", v4);

  v6 = (void *)*MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[IRSessionConnection client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_DEFAULT, "#session-connection, [%@]: Did Spot On Location Complete with error: [%@]", (uint8_t *)&v11, 0x16u);

  }
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (void)setServiceHandler:(id)a3
{
  objc_storeWeak((id *)&self->_serviceHandler, a3);
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_serviceHandler);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
