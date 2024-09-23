@implementation NSXPCStoreServer

- (NSQueryGenerationToken)unpackQueryGeneration:(uint64_t)a1 withContext:(void *)a2
{
  void *v4;
  NSQueryGenerationToken *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSQueryGenerationToken *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSQueryGenerationToken *v19;
  uint64_t v21;

  v4 = (void *)MEMORY[0x18D76B4E4]();
  if (objc_msgSend(CFSTR("current"), "isEqual:", a1))
  {
    v5 = +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken");
  }
  else if (objc_msgSend(CFSTR("unpinned"), "isEqual:", a1))
  {
    v5 = +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken");
  }
  else
  {
    v6 = (void *)MEMORY[0x18D76B4E4]();
    if (a1)
      v7 = *(_QWORD *)(a1 + 24);
    else
      v7 = 0;
    v8 = (void *)-[NSXPCStoreServerPerConnectionCache localGenerationForRemoteGeneration:]((id *)objc_msgSend(a2, "cache"), v7);
    if (!v8)
    {
      v9 = objc_msgSend(a2, "persistentStoreCoordinator");
      v10 = a1 ? *(_QWORD *)(a1 + 8) : 0;
      v8 = -[NSPersistentStoreCoordinator _reopenQueryGenerationWithIdentifier:inStoreWithIdentifier:error:](v9, v7, v10, 0);
      if (v8)
      {
        -[NSXPCStoreServerPerConnectionCache registerQueryGeneration:forRemoteGeneration:]((void *)objc_msgSend(a2, "cache"), v8, v7);
        v8 = (void *)-[NSXPCStoreServerPerConnectionCache localGenerationForRemoteGeneration:]((id *)objc_msgSend(a2, "cache"), v7);
      }
    }
    v11 = v8;
    objc_autoreleasePoolPop(v6);
    v5 = v8;
  }
  v12 = v5;
  if (v5)
  {
    v21 = 0;
    if ((objc_msgSend((id)objc_msgSend(a2, "managedObjectContext"), "setQueryGenerationFromToken:error:", v5, &v21) & 1) == 0)
    {
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
      {
        _NSCoreDataLog(8, (uint64_t)CFSTR("Failed to set query generation on context: %@ -> %@ (%@)"), v13, v14, v15, v16, v17, v18, a1);
        v12 = 0;
      }
    }
    v19 = v12;
    objc_autoreleasePoolPop(v4);
    return v12;
  }
  else
  {
    objc_autoreleasePoolPop(v4);
    return 0;
  }
}

- (void)handleRequest:(id)a3 reply:(id)a4
{
  void *v7;
  void *v8;
  NSXPCStoreServerConnectionContext *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  NSManagedObjectContext *v31;
  NSManagedObjectContext *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  dispatch_block_t v37;
  const void *v38;
  uint64_t v39;
  id v40;
  _QWORD block[14];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;

  v40 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "userInfo"), "objectForKey:", CFSTR("NSConnectionInfo"));
  v9 = -[NSXPCStoreServerConnectionContext initWithConnectionInfo:]([NSXPCStoreServerConnectionContext alloc], "initWithConnectionInfo:", v8);
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3052000000;
  v45 = __Block_byref_object_copy__0;
  v46 = __Block_byref_object_dispose__0;
  v47 = 0;
  if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
    _NSCoreDataLog(8, (uint64_t)CFSTR("Starting event handler"), v10, v11, v12, v13, v14, v15, v39);
  if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
    _NSCoreDataLog(8, (uint64_t)CFSTR("XPCStore server handling request: %@"), v16, v17, v18, v19, v20, v21, (uint64_t)a3);
  v22 = -[NSXPCStoreServerRequestHandlingPolicy shouldAcceptConnectionsFromClientWithContext:](self->_policy, "shouldAcceptConnectionsFromClientWithContext:", v9);
  v23 = v49;
  *((_BYTE *)v49 + 24) = v22;
  v43[5] = 0;
  if (!*((_BYTE *)v23 + 24))
  {
    v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Policy rejected connection from client: %@"));
    v43[5] = v24;
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v24, (uint64_t)self, v25, v26, v27, v28, v29, (uint64_t)v7);
  }
  v30 = -[NSXPCStoreServerConnectionContext persistentStoreCoordinator](v9, "persistentStoreCoordinator");
  v31 = (NSManagedObjectContext *)-[NSXPCStoreServerConnectionContext managedObjectContext](v9, "managedObjectContext");
  if (!v31)
  {
    v32 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v32, "setPersistentStoreCoordinator:", v30);
    -[NSManagedObjectContext _setDelegate:](v32, "_setDelegate:", self);
    if (v32)
      *(_QWORD *)&v32->_flags |= 0x8000000uLL;
    v33 = (void *)objc_msgSend((id)objc_msgSend(v8, "entitlements"), "objectForKey:", CFSTR("application-identifier"));
    if (v33)
      -[NSPersistentStoreCoordinator _setXPCBundleIdentifier:]((uint64_t)v30, v33);
    if (a3)
    {
      v34 = (void *)*((_QWORD *)a3 + 7);
      if (v34)
        -[NSPersistentStoreCoordinator _setXPCProcessName:]((uint64_t)v30, v34);
    }
    -[NSManagedObjectContext setMergePolicy:](v32, "setMergePolicy:", NSErrorMergePolicy);
    -[NSManagedObjectContext setUndoManager:](v32, "setUndoManager:", 0);
    if (a3 && *((_QWORD *)a3 + 5))
      -[NSManagedObjectContext setName:](v32, "setName:");
    -[NSXPCStoreServerConnectionContext setManagedObjectContext:](v9, "setManagedObjectContext:", v32);
    v31 = v32;
  }
  if (a3)
  {
    v35 = (void *)*((_QWORD *)a3 + 5);
    if (v35 && (objc_msgSend(v35, "isEqual:", -[NSManagedObjectContext name](v31, "name")) & 1) == 0)
      -[NSManagedObjectContext setName:](v31, "setName:", *((_QWORD *)a3 + 5));
    v36 = (void *)*((_QWORD *)a3 + 6);
    if (v36
      && (objc_msgSend(v36, "isEqual:", -[NSManagedObjectContext transactionAuthor](v31, "transactionAuthor")) & 1) == 0)
    {
      -[NSManagedObjectContext setTransactionAuthor:](v31, "setTransactionAuthor:", *((_QWORD *)a3 + 6));
    }
    if (*((_BYTE *)a3 + 16))
      -[NSManagedObjectContext _setAllowAncillaryEntities:](v31, "_setAllowAncillaryEntities:", 1);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NSXPCStoreServer_handleRequest_reply___block_invoke;
  block[3] = &unk_1E1EDD408;
  block[4] = 0;
  block[5] = a3;
  block[6] = v31;
  block[7] = v9;
  block[12] = &v48;
  block[13] = &v42;
  block[8] = self;
  block[9] = v7;
  block[10] = v30;
  block[11] = a4;
  v37 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  v38 = v37;
  if (v31)
    -[NSManagedObjectContext performBlockAndWait:](v31, "performBlockAndWait:", v37);
  else
    (*((void (**)(dispatch_block_t))v37 + 2))(v37);
  _Block_release(v38);
  objc_msgSend(v40, "drain");
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);
}

- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  void *v6;
  NSXPCStoreManagedObjectArchivingToken *v7;
  NSXPCStoreManagedObjectArchivingToken *v8;

  v6 = (void *)MEMORY[0x18D76B4E4](self, a2, a3, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [NSXPCStoreManagedObjectArchivingToken alloc];
    a5 = (id)objc_msgSend(a5, "objectID");
LABEL_5:
    v8 = -[NSXPCStoreManagedObjectArchivingToken initWithURI:](v7, "initWithURI:", objc_msgSend(a5, "URIRepresentation"));
    objc_autoreleasePoolPop(v6);
    return v8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [NSXPCStoreManagedObjectArchivingToken alloc];
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (+[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken") == a5)
    {
      a5 = CFSTR("current");
    }
    else if (+[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken") == a5)
    {
      a5 = CFSTR("unpinned");
    }
    else
    {
      +[NSQueryGenerationToken nostoresQueryGenerationToken](NSQueryGenerationToken, "nostoresQueryGenerationToken");
    }
  }
  objc_autoreleasePoolPop(v6);
  return a5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSXPCStoreServerPerConnectionCache *v15;
  unint64_t *p_connections;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSManagedObjectModel *v25;
  void *v26;
  NSPersistentStoreCoordinator *v27;
  unint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSXPCStoreServerPerConnectionCache *v43;
  NSXPCStoreConnectionInfo *v44;
  NSArray *entitlementNames;
  id v46;
  id v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  _QWORD v63[6];
  __int128 v64;
  __int128 v65;
  NSXPCStoreServer *v66;
  id v67;

  v6 = (void *)MEMORY[0x18D76B4E4](self, a2, a3);
  if (a4)
    objc_msgSend(a4, "auditToken");
  if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
    _NSCoreDataLog(8, (uint64_t)CFSTR("%@ - Incoming connection: %@"), v7, v8, v9, v10, v11, v12, (uint64_t)self);
  if (self)
  {
    v13 = (void *)MEMORY[0x18D76B4E4]();
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(self->_delegate, "identifierForConnection:", a4);
      objc_sync_enter(self);
      if (v14)
      {
        v15 = (NSXPCStoreServerPerConnectionCache *)-[NSMutableDictionary objectForKey:](self->_cacheIDtoCoordinatorMap, "objectForKey:", v14);
        if (v15)
        {
          if (!NSMapGet(self->_connectionToCoordinatorMap, a4))
          {
            NSMapInsert(self->_connectionToCoordinatorMap, a4, v15);
            p_connections = (unint64_t *)&v15->_connections;
            do
              v17 = __ldxr(p_connections);
            while (__stxr(v17 + 1, p_connections));
LABEL_25:
            v30 = MEMORY[0x1E0C809B0];
            *(_QWORD *)&v64 = MEMORY[0x1E0C809B0];
            *((_QWORD *)&v64 + 1) = 3221225472;
            *(_QWORD *)&v65 = __47__NSXPCStoreServer_retainedCacheForConnection___block_invoke;
            *((_QWORD *)&v65 + 1) = &unk_1E1EDD430;
            v66 = self;
            v67 = a4;
            objc_msgSend(a4, "setInterruptionHandler:", &v64);
            v63[0] = v30;
            v63[1] = 3221225472;
            v63[2] = __47__NSXPCStoreServer_retainedCacheForConnection___block_invoke_2;
            v63[3] = &unk_1E1EDD430;
            v63[4] = self;
            v63[5] = a4;
            objc_msgSend(a4, "setInvalidationHandler:", v63);
            goto LABEL_33;
          }
          goto LABEL_33;
        }
        v18 = 0;
LABEL_16:
        v15 = (NSXPCStoreServerPerConnectionCache *)NSMapGet(self->_connectionToCoordinatorMap, a4);
        if (!v15)
        {
          v25 = self->_model;
          if (v25)
          {
            v26 = (void *)MEMORY[0x18D76B4E4]();
            v27 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v25);

            *(_QWORD *)&v64 = 0;
            if (-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v27, "addPersistentStoreWithType:configuration:URL:options:error:", CFSTR("SQLite"), 0, self->_storeURL, self->_storeOptions, &v64))
            {
              objc_autoreleasePoolPop(v26);
              if (v27)
              {
                v15 = -[NSXPCStoreServerPerConnectionCache initWithCoordinator:]([NSXPCStoreServerPerConnectionCache alloc], "initWithCoordinator:", v27);

                if ((v18 & 1) == 0)
                {
                  -[NSMutableDictionary setObject:forKey:](self->_cacheIDtoCoordinatorMap, "setObject:forKey:", v15, v14);
                  -[NSXPCStoreServerPerConnectionCache setClientIdentifier:](v15, v14);
                  if (v15)
                  {
                    v28 = (unint64_t *)&v15->_connections;
                    do
                      v29 = __ldxr(v28);
                    while (__stxr(v29 + 1, v28));
                  }
                }
                NSMapInsert(self->_connectionToCoordinatorMap, a4, v15);

                goto LABEL_25;
              }
            }
            else
            {
              if (-[NSXPCStoreServer errorIsPlausiblyAnSQLiteIssue:]((uint64_t)self, (void *)v64))
              {
                -[NSXPCStoreServer setupRecoveryForConnectionContext:ifNecessary:]((uint64_t)self, 0, v64);
                v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't create coordinator - attempting SQLite recovery"));
              }
              else
              {
                v62 = v64;
                v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't create coordinator - due to an error - %@"));
              }
              +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v31, (uint64_t)self, v32, v33, v34, v35, v36, v62);

              _NSCoreDataLog(8, (uint64_t)CFSTR("Unable to load store: %@"), v37, v38, v39, v40, v41, v42, v64);
              objc_autoreleasePoolPop(v26);
            }
          }
          else
          {
            _NSCoreDataLog(8, (uint64_t)CFSTR("%@: Unable to find model"), v19, v20, v21, v22, v23, v24, (uint64_t)self);
          }
          v15 = 0;
        }
LABEL_33:
        objc_sync_exit(self);
        v43 = v15;
        objc_autoreleasePoolPop(v13);
        goto LABEL_34;
      }
    }
    else
    {
      objc_sync_enter(self);
      v14 = 0;
    }
    v18 = 1;
    goto LABEL_16;
  }
  v15 = 0;
LABEL_34:
  if (!-[NSXPCStoreServerPerConnectionCache coordinator](v15, "coordinator"))
  {
    v49 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create stack"));
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v49, (uint64_t)self, v50, v51, v52, v53, v54, v62);

LABEL_39:
    v48 = 0;
    goto LABEL_40;
  }
  v44 = [NSXPCStoreConnectionInfo alloc];
  entitlementNames = self->_entitlementNames;
  v64 = 0u;
  v65 = 0u;
  v46 = -[NSXPCStoreConnectionInfo initForToken:entitlementNames:cache:](v44, "initForToken:entitlementNames:cache:", &v64, entitlementNames, v15);

  if (!v46)
  {
    v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create connection context"));
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v55, (uint64_t)self, v56, v57, v58, v59, v60, v62);
    goto LABEL_39;
  }
  objc_msgSend(a4, "setDelegate:", self);
  objc_msgSend(a4, "setExportedObject:", self);
  objc_msgSend(a4, "setExportedInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF665A8));
  v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v47, "setValue:forKey:", v46, CFSTR("NSConnectionInfo"));

  objc_msgSend(a4, "setUserInfo:", v47);
  objc_msgSend(a4, "resume");
  v48 = 1;
LABEL_40:
  objc_autoreleasePoolPop(v6);
  return v48;
}

void __40__NSXPCStoreServer_handleRequest_reply___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t kk;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  _QWORD *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t j;
  uint64_t v154;
  uint64_t v155;
  uint64_t k;
  uint64_t v157;
  uint64_t v158;
  uint64_t m;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  id v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  uint64_t v194;
  id v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  int v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t n;
  void *v211;
  void *v212;
  void *v213;
  NSManagedObject *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t ii;
  void *v223;
  void *v224;
  void *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  void *v230;
  void *v231;
  id v232;
  uint64_t v233;
  NSSaveChangesRequest *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  void *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  void *v257;
  uint64_t v258;
  uint64_t v259;
  NSQueryGenerationToken *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  id v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  void *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  void *v299;
  uint64_t v300;
  uint64_t v301;
  NSQueryGenerationToken *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  void *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  void *v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  id v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  id v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  void *v349;
  NSQueryGenerationToken *v350;
  NSQueryGenerationToken *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  id v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  void *v375;
  id v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  void *v394;
  void *v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  void *v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  void *v412;
  void *v413;
  void *v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  void *v418;
  id v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  void *v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  void *v442;
  void *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  void *v448;
  uint64_t v449;
  uint64_t v450;
  NSQueryGenerationToken *v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  void *v460;
  void *v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  NSQueryGenerationToken *v467;
  NSQueryGenerationToken *v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  void *v477;
  void *v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  id v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  id v501;
  void *v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  void *v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  id v516;
  id v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  void *v530;
  uint64_t v531;
  void *v532;
  int v533;
  void *v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  void *v555;
  uint64_t v556;
  void *v557;
  void *v558;
  uint64_t v559;
  uint64_t v560;
  id v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  uint64_t v573;
  void *v574;
  uint64_t v575;
  void *v576;
  void *v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  void *v586;
  id v587;
  void *v588;
  uint64_t v589;
  __CFString *v590;
  __CFString *v591;
  __CFString *v592;
  __CFString *v593;
  __CFString *v594;
  __CFString *v595;
  void *v596;
  uint64_t v597;
  __CFString *v598;
  __CFString *v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  void *v606;
  uint64_t v607;
  void *v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  void *v615;
  uint64_t v616;
  int v617;
  void *v618;
  uint64_t v619;
  int v620;
  NSQueryGenerationToken *v621;
  NSQueryGenerationToken *v622;
  NSQueryGenerationToken *v623;
  uint64_t isa;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  id v631;
  uint64_t v632;
  uint64_t v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  _BOOL8 v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t v641;
  uint64_t v642;
  uint64_t v643;
  uint64_t v644;
  uint64_t v645;
  id v646;
  id v647;
  uint64_t v648;
  uint64_t v649;
  uint64_t v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  id v654;
  id v655;
  id v656;
  id v657;
  uint64_t v658;
  uint64_t v659;
  uint64_t v660;
  uint64_t v661;
  uint64_t v662;
  uint64_t v663;
  id v664;
  id v665;
  id v666;
  uint64_t v667;
  uint64_t v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  uint64_t v672;
  uint64_t v673;
  uint64_t v674;
  uint64_t v675;
  uint64_t v676;
  uint64_t v677;
  uint64_t v678;
  uint64_t v679;
  const char *v680;
  uint64_t v681;
  uint64_t v682;
  uint64_t v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  uint64_t v687;
  char *v688;
  id v689;
  uint64_t v690;
  uint64_t v691;
  uint64_t v692;
  uint64_t v693;
  uint64_t v694;
  uint64_t v695;
  const __CFString *v696;
  uint64_t v697;
  uint64_t v698;
  uint64_t v699;
  uint64_t v700;
  uint64_t v701;
  void *v702;
  uint64_t v703;
  uint64_t v704;
  uint64_t v705;
  uint64_t jj;
  void *v707;
  void *v708;
  uint64_t v709;
  uint64_t v710;
  uint64_t v711;
  uint64_t v712;
  uint64_t v713;
  uint64_t v714;
  id v715;
  id v716;
  uint64_t v717;
  uint64_t v718;
  uint64_t v719;
  uint64_t v720;
  uint64_t v721;
  uint64_t v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  uint64_t v726;
  uint64_t v727;
  id v728;
  uint64_t v729;
  uint64_t v730;
  _QWORD *v731;
  int v732;
  id v733;
  uint64_t *v734;
  id v735;
  NSCoreDataXPCMessage *self;
  id obj;
  id v738;
  id v739;
  id v740;
  id v741;
  char *v742;
  __int128 v743;
  __int128 v744;
  __int128 v745;
  __int128 v746;
  __int128 v747;
  __int128 v748;
  __int128 v749;
  __int128 v750;
  __int128 v751;
  __int128 v752;
  __int128 v753;
  __int128 v754;
  __int128 v755;
  __int128 v756;
  __int128 v757;
  __int128 v758;
  __int128 v759;
  __int128 v760;
  __int128 v761;
  __int128 v762;
  __int128 v763;
  __int128 v764;
  __int128 v765;
  __int128 v766;
  __int128 v767;
  __int128 v768;
  __int128 v769;
  __int128 v770;
  id v771[2];
  _BYTE v772[128];
  _BYTE v773[128];
  _BYTE v774[128];
  _QWORD v775[16];
  id v776[16];
  __int128 v777;
  __int128 v778;
  __int128 v779;
  __int128 v780;
  __CFString *v781;
  uint64_t v782;
  uint64_t v783;
  uint64_t v784;

  v784 = *MEMORY[0x1E0C80C00];
  v733 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  self = objc_alloc_init(NSCoreDataXPCMessage);
  v742 = 0;
  v2 = (void *)a1[4];
  if (v2)
    goto LABEL_447;
  v3 = a1[5];
  if (v3)
    v4 = *(void **)(v3 + 32);
  else
    v4 = 0;
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1[6], "persistentStoreCoordinator"), "persistentStores"), "lastObject");
  -[NSXPCStoreServerConnectionContext setActiveStore:](a1[7], v5);
  if (v4 && (objc_msgSend(v4, "isEqual:", objc_msgSend(v5, "identifier")) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[12] + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(a1[13] + 8) + 40) = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Token mismatch"));
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, *(_QWORD *)(*(_QWORD *)(a1[13] + 8) + 40), a1[8], v6, v7, v8, v9, v10, v724);
    v732 = 1;
  }
  else
  {
    v732 = 0;
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[12] + 8) + 24))
  {
    v39 = 0;
LABEL_407:
    v679 = *MEMORY[0x1E0CB28A8];
    if (v732)
    {
      v742 = (char *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v679, 134095, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("request failed, store identifier mismatch"), CFSTR("Problem")));
LABEL_409:
      v681 = 2;
      goto LABEL_411;
    }
    v742 = (char *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v679, 134070, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("request failed, insufficient permission"), CFSTR("Problem")));
    v681 = 1;
    goto LABEL_411;
  }
  v734 = a1;
  v11 = a1[5];
  if (!v11)
  {
LABEL_28:
    if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
    {
      v46 = a1[5];
      if (v46)
        v46 = *(_QWORD *)(v46 + 8);
      v726 = a1[9];
      _NSCoreDataLog(8, (uint64_t)CFSTR("Illegal input: %u from connection %p"), v40, v41, v42, v43, v44, v45, v46);
    }
    v39 = 0;
    v742 = (char *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134070, 0);
    goto LABEL_403;
  }
  switch(*(_QWORD *)(v11 + 8))
  {
    case 1:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Metadata"), v12, v13, v14, v15, v16, v17, v724);
      if (!a1[8])
        goto LABEL_444;
      v18 = (void *)a1[7];
      v19 = (void *)MEMORY[0x18D76B4E4]();
      v20 = (void *)objc_msgSend((id)objc_msgSend(v18, "managedObjectContext"), "persistentStoreCoordinator");
      v27 = (void *)objc_msgSend((id)objc_msgSend(v20, "persistentStores"), "lastObject");
      if (!v27)
        _NSCoreDataLog(8, (uint64_t)CFSTR("no store"), v21, v22, v23, v24, v25, v26, v724);
      v28 = (void *)objc_msgSend(v27, "metadata");
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Got metadata %@"), v29, v30, v31, v32, v33, v34, (uint64_t)v28);
      v35 = (void *)objc_msgSend(v20, "managedObjectModel");
      v779 = 0u;
      v780 = 0u;
      v777 = 0u;
      v778 = 0u;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v777, &v781, 16);
      if (!v36)
        goto LABEL_284;
      v37 = *(_QWORD *)v778;
      while (1)
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v778 != v37)
            objc_enumerationMutation(v35);
          if ((-[NSEntityDescription _hasAttributesWithFileBackedFutures](*(_QWORD *)(*((_QWORD *)&v777 + 1) + 8 * i)) & 1) != 0)
          {
            v502 = (void *)objc_msgSend(v27, "fileBackedFuturesDirectory");
            if (v502)
            {
              v775[0] = CFSTR("NSMetadataKey");
              v775[1] = CFSTR("NSFileBackedFuturePathKey");
              v776[0] = v28;
              v776[1] = v502;
              v28 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v776, v775, 2);
              goto LABEL_284;
            }
            _NSCoreDataLog(8, (uint64_t)CFSTR("what on earth happened?"), v503, v504, v505, v506, v507, v508, v724);
LABEL_446:
            __break(1u);
LABEL_447:
            objc_exception_throw(v2);
          }
        }
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v777, &v781, 16);
        if (!v36)
        {
LABEL_284:
          v509 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v28, 200, 0, 0);
          if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
            _NSCoreDataLog(8, (uint64_t)CFSTR("Which archives to %@"), v510, v511, v512, v513, v514, v515, (uint64_t)v509);
          v516 = v509;
          objc_autoreleasePoolPop(v19);
          v332 = v509;
          goto LABEL_402;
        }
      }
    case 2:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Fetch"), v284, v285, v286, v287, v288, v289, v724);
      v290 = a1[5];
      if (v290)
        v291 = *(_QWORD *)(v290 + 24);
      else
        v291 = 0;
      v292 = a1[8];
      if (!v292)
        goto LABEL_444;
      v293 = (void *)a1[7];
      v776[0] = 0;
      v740 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v294 = (void *)MEMORY[0x1E0C99E60];
      v295 = objc_opt_class();
      v296 = objc_opt_class();
      v297 = objc_opt_class();
      v298 = objc_opt_class();
      objc_opt_class();
      v726 = v297;
      v727 = v298;
      v724 = v296;
      v299 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v291, (uint64_t)v293, objc_msgSend(v294, "setWithObjects:", v295));
      if ((unint64_t)objc_msgSend(v299, "count") < 2)
      {
        v301 = 0;
      }
      else
      {
        v300 = objc_msgSend(v299, "objectAtIndex:", 1);
        v301 = v300;
        if (v300)
        {
          v302 = -[NSXPCStoreServer unpackQueryGeneration:withContext:](v300, v293);
          goto LABEL_289;
        }
      }
      v302 = 0;
LABEL_289:
      v517 = +[NSFetchRequest decodeFromXPCArchive:withContext:andPolicy:](NSFetchRequest, "decodeFromXPCArchive:withContext:andPolicy:", objc_msgSend(v299, "firstObject"), v293, *(_QWORD *)(v292 + 64));
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Got a fetch request %@"), v518, v519, v520, v521, v522, v523, (uint64_t)v517);
      if (v301 && !v302 && +[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
      {
        _NSCoreDataLog(8, (uint64_t)CFSTR("Can't fulfill fetch request: can't find query generation: %@"), v524, v525, v526, v527, v528, v529, 0);
        v530 = (void *)MEMORY[0x1E0CB35C8];
        v781 = CFSTR("unrecognized query generation");
        *(_QWORD *)&v777 = CFSTR("reason");
        *((_QWORD *)&v777 + 1) = CFSTR("generation");
        v782 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v531 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v781, &v777, 2);
        v532 = 0;
        v533 = 0;
        v776[0] = (id)objc_msgSend(v530, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134061, v531);
        goto LABEL_391;
      }
      v534 = (void *)objc_msgSend(*(id *)(v292 + 64), "processRequest:fromClientWithContext:error:", v517, v293, v776);
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
      {
        if (v534)
          v541 = objc_msgSend(v534, "count");
        else
          v541 = 0;
        v726 = v541;
        _NSCoreDataLog(8, (uint64_t)CFSTR("Which had result %d (%d)"), v535, v536, v537, v538, v539, v540, v534 != 0);
      }
      if (v534)
      {
        v631 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v534);
        v532 = v631;
        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        {
          v638 = v631 != 0;
          if (v532)
            v639 = objc_msgSend(v532, "length");
          else
            v639 = 0;
          v726 = v639;
          _NSCoreDataLog(8, (uint64_t)CFSTR("Which archived %d (%d)"), v632, v633, v634, v635, v636, v637, v638);
        }
        goto LABEL_390;
      }
      if (v776[0])
      {
        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        {
          v532 = 0;
          _NSCoreDataLog(8, (uint64_t)CFSTR("Fetch failed returning error %@"), v640, v641, v642, v643, v644, v645, (uint64_t)v776[0]);
LABEL_388:
          v533 = 1;
          goto LABEL_391;
        }
      }
      else if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
      {
        v532 = 0;
        _NSCoreDataLog(8, (uint64_t)CFSTR("Fetch failed with no error."), v658, v659, v660, v661, v662, v663, v724);
        goto LABEL_388;
      }
      v532 = 0;
LABEL_390:
      v533 = 1;
LABEL_391:
      v664 = v776[0];
      objc_msgSend(v740, "drain");
      v665 = 0;
      v666 = v776[0];
      if (v776[0])
        v742 = (char *)v776[0];
      if (v533)
      {
        v332 = v532;
        goto LABEL_402;
      }
      goto LABEL_444;
    case 3:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Save"), v122, v123, v124, v125, v126, v127, v724);
      v128 = a1[5];
      if (v128)
        v129 = *(_QWORD *)(v128 + 24);
      else
        v129 = 0;
      v730 = a1[8];
      if (!v730)
        goto LABEL_444;
      v731 = (_QWORD *)a1[7];
      v728 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v771[0] = 0;
      v130 = objc_msgSend((id)+[_NSXPCStoreUtilities classesForSaveArchive](), "setByAddingObjectsFromSet:", objc_msgSend(*(id *)(v730 + 64), "allowableClassesForClientWithContext:", v731));
      v131 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v129, (uint64_t)v731, v130);
      v132 = v131;
      if (v131)
      {
        v133 = (void *)objc_msgSend(v131, "valueForKey:", CFSTR("NSMetadata"));
        v134 = (_QWORD *)objc_msgSend(v731, "managedObjectContext");
        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
          _NSCoreDataLog(8, (uint64_t)CFSTR("Got save request: %@"), v135, v136, v137, v138, v139, v140, (uint64_t)v132);
        if (!v133)
          goto LABEL_88;
        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
          _NSCoreDataLog(8, (uint64_t)CFSTR("Updating metadata"), v141, v142, v143, v144, v145, v146, v724);
        if ((objc_opt_respondsToSelector() & 1) == 0
          || (objc_msgSend(*(id *)(v730 + 64), "shouldAcceptMetadataChangesFromClientWithContext:", v731) & 1) != 0)
        {
          v147 = (void *)objc_msgSend(v133, "mutableCopy");
          objc_msgSend(v147, "removeObjectForKey:", CFSTR("NSStoreUUID"));
          objc_msgSend(v147, "removeObjectForKey:", CFSTR("NSStoreType"));
          objc_msgSend(v147, "removeObjectForKey:", CFSTR("NSStoreModelVersionHashes"));
          objc_msgSend(v147, "removeObjectForKey:", CFSTR("NSStoreModelVersionIdentifiers"));
          objc_msgSend(v147, "removeObjectForKey:", 0x1E1EF1490);
          objc_msgSend(v147, "removeObjectForKey:", 0x1E1EF14B0);
          if (v731)
            v148 = (void *)v731[4];
          else
            v148 = 0;
          objc_msgSend(v148, "setMetadata:", v147);

LABEL_88:
          obj = (id)objc_msgSend(v132, "valueForKey:", CFSTR("deleted"));
          v735 = (id)objc_msgSend(v132, "valueForKey:", CFSTR("inserted"));
          v738 = (id)objc_msgSend(v132, "valueForKey:", CFSTR("updated"));
          v149 = (void *)objc_msgSend(v132, "valueForKey:", CFSTR("locked"));
          v150 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v769 = 0u;
          v770 = 0u;
          v767 = 0u;
          v768 = 0u;
          v151 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v767, &v781, 16);
          if (v151)
          {
            v152 = *(_QWORD *)v768;
            do
            {
              for (j = 0; j != v151; ++j)
              {
                if (*(_QWORD *)v768 != v152)
                  objc_enumerationMutation(obj);
                objc_msgSend(v150, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v767 + 1) + 8 * j), "objectAtIndex:", 0));
              }
              v151 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v767, &v781, 16);
            }
            while (v151);
          }
          v765 = 0u;
          v766 = 0u;
          v763 = 0u;
          v764 = 0u;
          v154 = objc_msgSend(v738, "countByEnumeratingWithState:objects:count:", &v763, &v777, 16);
          if (v154)
          {
            v155 = *(_QWORD *)v764;
            do
            {
              for (k = 0; k != v154; ++k)
              {
                if (*(_QWORD *)v764 != v155)
                  objc_enumerationMutation(v738);
                objc_msgSend(v150, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v763 + 1) + 8 * k), "objectAtIndex:", 0));
              }
              v154 = objc_msgSend(v738, "countByEnumeratingWithState:objects:count:", &v763, &v777, 16);
            }
            while (v154);
          }
          v761 = 0u;
          v762 = 0u;
          v759 = 0u;
          v760 = 0u;
          v157 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v759, v776, 16);
          if (v157)
          {
            v158 = *(_QWORD *)v760;
            do
            {
              for (m = 0; m != v157; ++m)
              {
                if (*(_QWORD *)v760 != v158)
                  objc_enumerationMutation(v149);
                objc_msgSend(v150, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v759 + 1) + 8 * m), "objectAtIndex:", 0));
              }
              v157 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v759, v776, 16);
            }
            while (v157);
          }
          +[_PFRoutines fetchHeterogeneousCollectionByObjectIDs:intoContext:]((uint64_t)_PFRoutines, (uint64_t)v150, (uint64_t)v134);
          objc_opt_self();
          if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
            _NSCoreDataLog(8, (uint64_t)CFSTR("Locking objects :%@"), v160, v161, v162, v163, v164, v165, (uint64_t)v149);
          v757 = 0u;
          v758 = 0u;
          v755 = 0u;
          v756 = 0u;
          v166 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v755, v775, 16);
          if (v166)
          {
            v167 = *(_QWORD *)v756;
            do
            {
              v168 = 0;
              do
              {
                if (*(_QWORD *)v756 != v167)
                  objc_enumerationMutation(v149);
                v169 = *(void **)(*((_QWORD *)&v755 + 1) + 8 * v168);
                v170 = (void *)MEMORY[0x18D76B4E4]();
                v171 = (void *)objc_msgSend(v169, "objectAtIndex:", 0);
                if (v134)
                  v172 = _PFRetainedObjectIDCore((uint64_t)v134, v171, 0, 1);
                else
                  v172 = 0;
                objc_msgSend(v172, "willAccessValueForKey:", 0);
                if (objc_msgSend(v172, "isDeleted"))
                {
                  if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
                    _NSCoreDataLog(8, (uint64_t)CFSTR("Not locking %@ because it's not in the db"), v173, v174, v175, v176, v177, v178, (uint64_t)v172);

                }
                else
                {
                  if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
                    _NSCoreDataLog(8, (uint64_t)CFSTR("Locking %@"), v179, v180, v181, v182, v183, v184, (uint64_t)v172);
                  objc_msgSend(v172, "_setVersionReference__:", objc_msgSend((id)objc_msgSend(v169, "objectAtIndex:", 1), "unsignedIntegerValue"));
                  objc_msgSend(v134, "detectConflictsForObject:", v172);

                }
                objc_autoreleasePoolPop(v170);
                ++v168;
              }
              while (v166 != v168);
              v185 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v755, v775, 16);
              v166 = v185;
            }
            while (v185);
          }
          v753 = 0u;
          v754 = 0u;
          v751 = 0u;
          v752 = 0u;
          v186 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v751, v774, 16);
          if (!v186)
            goto LABEL_156;
          v187 = 0;
          v188 = 0;
          v189 = *(_QWORD *)v752;
          v729 = *MEMORY[0x1E0CB28A8];
          while (1)
          {
            v190 = 0;
            do
            {
              if (*(_QWORD *)v752 != v189)
                objc_enumerationMutation(obj);
              v191 = *(void **)(*((_QWORD *)&v751 + 1) + 8 * v190);
              v192 = (void *)MEMORY[0x18D76B4E4]();
              v193 = (void *)objc_msgSend(v191, "objectAtIndex:", 0);
              v194 = objc_msgSend(v193, "entity");
              if (v187 != v194)
              {
                v188 = (void *)objc_msgSend(*(id *)(v730 + 64), "restrictingWritePredicateForEntity:fromClientWithContext:", v194, v731);
                v187 = v194;
              }
              if (!v188)
              {
                v203 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v729, 134092, 0);
LABEL_149:
                v202 = 0;
                v771[0] = v203;
                goto LABEL_150;
              }
              if ((void *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0) == v188)
              {
                v203 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v729, 134030, 0);
                goto LABEL_149;
              }
              if (v134)
                v195 = _PFRetainedObjectIDCore((uint64_t)v134, v193, 0, 1);
              else
                v195 = 0;
              objc_msgSend(v195, "willAccessValueForKey:", 0);
              if ((objc_msgSend(v195, "isDeleted") & 1) != 0)
                goto LABEL_146;
              objc_msgSend(v195, "_setVersionReference__:", objc_msgSend((id)objc_msgSend(v191, "objectAtIndex:", 1), "unsignedIntegerValue"));
              -[NSXPCStoreServer _populateObject:withValuesFromClient:](v195, v191);
              if ((void *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1) == v188
                || (objc_msgSend(v188, "evaluateWithObject:", v195) & 1) != 0)
              {
                if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
                  _NSCoreDataLog(8, (uint64_t)CFSTR("Deleting object :%@"), v196, v197, v198, v199, v200, v201, (uint64_t)v195);
                objc_msgSend(v134, "deleteObject:", v195);
LABEL_146:

                v202 = 1;
                goto LABEL_150;
              }
              v771[0] = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v729, 134030, 0);

              v202 = 0;
LABEL_150:
              objc_autoreleasePoolPop(v192);
              if (!v202)
              {
                v39 = 0;
                goto LABEL_383;
              }
              ++v190;
            }
            while (v186 != v190);
            v204 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v751, v774, 16);
            v186 = v204;
            if (!v204)
            {
LABEL_156:
              v205 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v206 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v207 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v749 = 0u;
              v750 = 0u;
              v747 = 0u;
              v748 = 0u;
              v208 = objc_msgSend(v735, "countByEnumeratingWithState:objects:count:", &v747, v773, 16);
              if (v208)
              {
                v209 = *(_QWORD *)v748;
                do
                {
                  for (n = 0; n != v208; ++n)
                  {
                    if (*(_QWORD *)v748 != v209)
                      objc_enumerationMutation(v735);
                    v211 = *(void **)(*((_QWORD *)&v747 + 1) + 8 * n);
                    v212 = (void *)MEMORY[0x18D76B4E4]();
                    v213 = (void *)objc_msgSend(v211, "objectAtIndex:", 0);
                    objc_msgSend(v207, "addObject:", v213);
                    v214 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]([NSManagedObject alloc], "initWithEntity:insertIntoManagedObjectContext:", objc_msgSend(v213, "entity"), v134);
                    objc_msgSend(v206, "addObject:", v214);
                    if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
                      _NSCoreDataLog(8, (uint64_t)CFSTR("Inserting object with ID %@"), v215, v216, v217, v218, v219, v220, (uint64_t)v213);
                    objc_msgSend(v205, "addObject:", v214);

                    objc_autoreleasePoolPop(v212);
                  }
                  v208 = objc_msgSend(v735, "countByEnumeratingWithState:objects:count:", &v747, v773, 16);
                }
                while (v208);
              }

              v221 = objc_msgSend(v205, "count");
              if (v221)
              {
                for (ii = 0; ii != v221; ++ii)
                {
                  v223 = (void *)MEMORY[0x18D76B4E4]();
                  v224 = (void *)objc_msgSend(v735, "objectAtIndex:", ii);
                  v225 = (void *)objc_msgSend(v205, "objectAtIndex:", ii);
                  objc_msgSend(v225, "_setVersionReference__:", objc_msgSend((id)objc_msgSend(v224, "objectAtIndex:", 1), "unsignedIntegerValue"));
                  -[NSXPCStoreServer _populateObject:withValuesFromClient:](v225, v224);
                  objc_autoreleasePoolPop(v223);
                }
              }
              v745 = 0u;
              v746 = 0u;
              v743 = 0u;
              v744 = 0u;
              v226 = objc_msgSend(v738, "countByEnumeratingWithState:objects:count:", &v743, v772, 16);
              if (v226)
              {
                v227 = *(_QWORD *)v744;
                do
                {
                  v228 = 0;
                  do
                  {
                    if (*(_QWORD *)v744 != v227)
                      objc_enumerationMutation(v738);
                    v229 = *(void **)(*((_QWORD *)&v743 + 1) + 8 * v228);
                    v230 = (void *)MEMORY[0x18D76B4E4]();
                    v231 = (void *)objc_msgSend(v229, "objectAtIndex:", 0);
                    if (v134)
                      v232 = _PFRetainedObjectIDCore((uint64_t)v134, v231, 0, 1);
                    else
                      v232 = 0;
                    objc_msgSend(v232, "willAccessValueForKey:", 0);
                    objc_msgSend(v232, "_setVersionReference__:", objc_msgSend((id)objc_msgSend(v229, "objectAtIndex:", 1), "unsignedIntegerValue"));
                    -[NSXPCStoreServer _populateObject:withValuesFromClient:](v232, v229);

                    objc_autoreleasePoolPop(v230);
                    ++v228;
                  }
                  while (v226 != v228);
                  v233 = objc_msgSend(v738, "countByEnumeratingWithState:objects:count:", &v743, v772, 16);
                  v226 = v233;
                }
                while (v233);
              }
              objc_msgSend(v134, "processPendingChanges");
              v234 = -[NSManagedObjectContext _newSaveRequestForCurrentState]((uint64_t)v134);
              if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
                _NSCoreDataLog(8, (uint64_t)CFSTR("Made save request: %@"), v235, v236, v237, v238, v239, v240, (uint64_t)v234);
              v39 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, objc_msgSend(*(id *)(v730 + 64), "processRequest:fromClientWithContext:error:", v234, v731, v771));
LABEL_383:
              v654 = v771[0];
              objc_msgSend(v728, "drain");
              v655 = v39;
              v656 = 0;
              if (v771[0])
                v742 = (char *)v771[0];
              v657 = v771[0];
              goto LABEL_403;
            }
          }
        }
        v608 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134092, 0);
      }
      else
      {
        v606 = (void *)MEMORY[0x1E0CB35C8];
        *(_QWORD *)&v777 = *MEMORY[0x1E0CB2D68];
        v724 = v130;
        v781 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to unarchive save request with allowed classes: %@"));
        v607 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v781, &v777, 1);
        v608 = (void *)objc_msgSend(v606, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v607);
      }
      v39 = 0;
      v771[0] = v608;
      goto LABEL_383;
    case 4:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("OID"), v403, v404, v405, v406, v407, v408, v724);
      v409 = a1[5];
      if (v409)
        v410 = *(_QWORD *)(v409 + 24);
      else
        v410 = 0;
      v411 = v734[8];
      if (!v411)
        goto LABEL_444;
      v412 = (void *)v734[7];
      v413 = (void *)MEMORY[0x18D76B4E4]();
      v414 = (void *)MEMORY[0x1E0C99E60];
      v415 = objc_opt_class();
      v416 = objc_opt_class();
      v417 = objc_opt_class();
      v727 = objc_opt_class();
      v724 = v416;
      v726 = v417;
      v418 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v410, (uint64_t)v412, objc_msgSend(v414, "setWithObjects:", v415));
      v419 = v418;
      objc_autoreleasePoolPop(v413);
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Got oid  request for %@"), v420, v421, v422, v423, v424, v425, (uint64_t)v418);
      v426 = -[NSXPCStoreServerRequestHandlingPolicy processObtainRequest:inContext:error:](*(void **)(v411 + 64), v418, v412, &v742);
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Returning result %@"), v427, v428, v429, v430, v431, v432, (uint64_t)v426);

      if (!v426)
        goto LABEL_444;
      v358 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v426);
      goto LABEL_401;
    case 5:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Fault"), v433, v434, v435, v436, v437, v438, v724);
      v439 = a1[5];
      if (v439)
        v440 = *(_QWORD *)(v439 + 24);
      else
        v440 = 0;
      v441 = a1[8];
      if (!v441)
        goto LABEL_444;
      v442 = (void *)a1[7];
      v776[0] = 0;
      v741 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v443 = (void *)MEMORY[0x1E0C99E60];
      v444 = objc_opt_class();
      v445 = objc_opt_class();
      v446 = objc_opt_class();
      v447 = objc_opt_class();
      objc_opt_class();
      v726 = v446;
      v727 = v447;
      v724 = v445;
      v448 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v440, (uint64_t)v442, objc_msgSend(v443, "setWithObjects:", v444));
      if ((unint64_t)objc_msgSend(v448, "count") < 2)
      {
        v450 = 0;
      }
      else
      {
        v449 = objc_msgSend(v448, "objectAtIndex:", 1);
        v450 = v449;
        if (v449)
        {
          v451 = -[NSXPCStoreServer unpackQueryGeneration:withContext:](v449, v442);
          goto LABEL_300;
        }
      }
      v451 = 0;
LABEL_300:
      v542 = objc_msgSend(v448, "firstObject");
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Attempting to fire fault for %@"), v543, v544, v545, v546, v547, v548, v542);
      if (v450 && !v451 && +[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
      {
        _NSCoreDataLog(8, (uint64_t)CFSTR("Can't fulfill fault request: can't find query generation: %@"), v549, v550, v551, v552, v553, v554, 0);
        v555 = (void *)MEMORY[0x1E0CB35C8];
        v781 = CFSTR("unrecognized query generation");
        *(_QWORD *)&v777 = CFSTR("reason");
        *((_QWORD *)&v777 + 1) = CFSTR("generation");
        *(_QWORD *)&v778 = CFSTR("target");
        v782 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v783 = v542;
        v556 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v781, &v777, 3);
        v557 = (void *)objc_msgSend(v555, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134061, v556);
LABEL_352:
        v561 = 0;
        v617 = 0;
        v776[0] = v557;
        goto LABEL_371;
      }
      v558 = (void *)objc_msgSend(v442, "managedObjectContext");
      objc_msgSend(v558, "setStalenessInterval:", 0.0);
      v559 = objc_msgSend((id)objc_msgSend(v558, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", v542);
      if (!v559)
      {
        v615 = (void *)MEMORY[0x1E0CB35C8];
        v616 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("missing objectID"), CFSTR("reason"));
        v557 = (void *)objc_msgSend(v615, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v616);
        goto LABEL_352;
      }
      v560 = objc_msgSend(*(id *)(v441 + 64), "processFaultForObjectWithID:fromClientWithContext:error:", v559, v442, v776);
      if (v560)
        v561 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, v560);
      else
        v561 = 0;
      v617 = 1;
LABEL_371:
      v646 = v776[0];
      objc_msgSend(v741, "drain");
      if (v776[0])
        v742 = (char *)v776[0];
      v647 = v776[0];
      if (!v617)
      {
LABEL_444:
        v39 = 0;
        goto LABEL_403;
      }
      goto LABEL_374;
    case 6:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Rel fault"), v241, v242, v243, v244, v245, v246, v724);
      v247 = a1[5];
      if (v247)
        v248 = *(_QWORD *)(v247 + 24);
      else
        v248 = 0;
      v249 = a1[8];
      if (!v249)
        goto LABEL_444;
      v250 = (void *)a1[7];
      v776[0] = 0;
      v739 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v251 = (void *)MEMORY[0x1E0C99E60];
      v252 = objc_opt_class();
      v253 = objc_opt_class();
      v254 = objc_opt_class();
      v255 = objc_opt_class();
      objc_opt_class();
      objc_opt_class();
      v727 = v255;
      v724 = v253;
      v726 = v254;
      v256 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v248, (uint64_t)v250, objc_msgSend(v251, "setWithObjects:", v252));
      v257 = (void *)objc_msgSend(v256, "firstObject");
      if ((unint64_t)objc_msgSend(v256, "count") < 2)
      {
        v259 = 0;
      }
      else
      {
        v258 = objc_msgSend(v256, "objectAtIndex:", 1);
        v259 = v258;
        if (v258)
        {
          v260 = -[NSXPCStoreServer unpackQueryGeneration:withContext:](v258, v250);
          goto LABEL_311;
        }
      }
      v260 = 0;
LABEL_311:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Got relationship fault request: %@"), v562, v563, v564, v565, v566, v567, (uint64_t)v257);
      if (v259 && !v260 && +[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
      {
        _NSCoreDataLog(8, (uint64_t)CFSTR("Can't fulfill relationship fault request: can't find query generation: %@"), v568, v569, v570, v571, v572, v573, 0);
        v574 = (void *)MEMORY[0x1E0CB35C8];
        v781 = CFSTR("unrecognized query generation");
        *(_QWORD *)&v777 = CFSTR("reason");
        *((_QWORD *)&v777 + 1) = CFSTR("generation");
        *(_QWORD *)&v778 = CFSTR("request");
        v782 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v783 = (uint64_t)v257;
        v575 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v781, &v777, 3);
        v576 = (void *)objc_msgSend(v574, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134061, v575);
      }
      else
      {
        v577 = (void *)objc_msgSend(v250, "managedObjectContext");
        objc_msgSend(v577, "setStalenessInterval:", 0.0);
        v578 = objc_msgSend((id)objc_msgSend(v577, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(v257, "valueForKey:", CFSTR("source")));
        v579 = objc_msgSend(v257, "valueForKey:", CFSTR("relationship"));
        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        {
          v726 = v579;
          _NSCoreDataLog(8, (uint64_t)CFSTR("Attempting to fire fault for %@, %@"), v580, v581, v582, v583, v584, v585, v578);
        }
        if (v578)
        {
          v586 = (void *)objc_msgSend(*(id *)(v249 + 64), "processFaultForRelationshipWithName:onObjectWithID:fromClientWithContext:error:", v579, v578, v250, v776);
          if (v586)
          {
            v587 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == v586)
            {
              objc_msgSend(v587, "addObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v586, "URIRepresentation");
              }
              else
              {
                v779 = 0u;
                v780 = 0u;
                v777 = 0u;
                v778 = 0u;
                v704 = objc_msgSend(v586, "countByEnumeratingWithState:objects:count:", &v777, &v781, 16);
                if (v704)
                {
                  v705 = *(_QWORD *)v778;
                  do
                  {
                    for (jj = 0; jj != v704; ++jj)
                    {
                      if (*(_QWORD *)v778 != v705)
                        objc_enumerationMutation(v586);
                      v707 = *(void **)(*((_QWORD *)&v777 + 1) + 8 * jj);
                      v708 = (void *)MEMORY[0x18D76B4E4]();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v717 = objc_opt_class();
                        _NSCoreDataLog(8, (uint64_t)CFSTR("Wrong in all kinds of ways. Less colloquially, that should be an object ID, but it's an instance of %@ instead"), v718, v719, v720, v721, v722, v723, v717);
                        goto LABEL_446;
                      }
                      objc_msgSend(v587, "addObject:", objc_msgSend(v707, "URIRepresentation"));
                      objc_autoreleasePoolPop(v708);
                    }
                    v704 = objc_msgSend(v586, "countByEnumeratingWithState:objects:count:", &v777, &v781, 16);
                  }
                  while (v704);
                }
              }
            }
            if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
            {
              v726 = v579;
              v727 = (uint64_t)v587;
              _NSCoreDataLog(8, (uint64_t)CFSTR("Fired relationship fault %@ - %@, returning values: %@"), v709, v710, v711, v712, v713, v714, v578);
            }
            v561 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v587);

          }
          else
          {
            if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
            {
              v726 = v579;
              _NSCoreDataLog(8, (uint64_t)CFSTR("Attempted to fire relationship fault %@ - %@, no such luck"), v648, v649, v650, v651, v652, v653, v578);
            }
            v561 = 0;
          }
          v620 = 1;
LABEL_441:
          v715 = v776[0];
          objc_msgSend(v739, "drain");
          if (v776[0])
            v742 = (char *)v776[0];
          v716 = v776[0];
          if (!v620)
            goto LABEL_444;
LABEL_374:
          v332 = v561;
          goto LABEL_402;
        }
        v618 = (void *)MEMORY[0x1E0CB35C8];
        v619 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v257, CFSTR("originalRequest"));
        v576 = (void *)objc_msgSend(v618, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v619);
      }
      v561 = 0;
      v620 = 0;
      v776[0] = v576;
      goto LABEL_441;
    case 7:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Request notification name"), v303, v304, v305, v306, v307, v308, v724);
      if (!a1[8])
        goto LABEL_444;
      v309 = (void *)a1[7];
      v310 = (void *)MEMORY[0x18D76B4E4]();
      v317 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v309, "managedObjectContext"), "persistentStoreCoordinator"), "persistentStores"), "lastObject");
      if (!v317)
        _NSCoreDataLog(8, (uint64_t)CFSTR("no store"), v311, v312, v313, v314, v315, v316, v724);
      *(_QWORD *)&v777 = CFSTR("notificationName");
      v781 = (__CFString *)+[_PFRoutines _remoteChangeNotificationNameForStore:]((uint64_t)_PFRoutines, v317);
      v318 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v781, &v777, 1);
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Got pull changes result %@"), v319, v320, v321, v322, v323, v324, v318);
      v325 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, v318);
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Which archives to %@"), v326, v327, v328, v329, v330, v331, (uint64_t)v325);
      objc_autoreleasePoolPop(v310);
      v332 = v325;
      goto LABEL_402;
    case 9:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Query generation"), v333, v334, v335, v336, v337, v338, v724);
      if (!a1[8])
        goto LABEL_444;
      v339 = (void *)a1[7];
      v340 = (void *)MEMORY[0x18D76B4E4]();
      v341 = (void *)objc_msgSend(v339, "persistentStoreCoordinator");
      v342 = (void *)objc_msgSend(v341, "_retainedCurrentQueryGeneration:", 0);
      v349 = (void *)objc_msgSend((id)objc_msgSend(v341, "persistentStores"), "lastObject");
      if (!v349)
        _NSCoreDataLog(8, (uint64_t)CFSTR("no store"), v343, v344, v345, v346, v347, v348, v724);
      v350 = (NSQueryGenerationToken *)-[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)v342, v349);
      v351 = -[NSXPCStoreServer retainedXPCEncodableGenerationTokenForOriginal:inContext:](v350, v339);
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Got queryGeneration %@"), v352, v353, v354, v355, v356, v357, (uint64_t)v342);

      v358 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v351);
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        goto LABEL_399;
      goto LABEL_400;
    case 0xALL:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Query generation release"), v469, v470, v471, v472, v473, v474, v724);
      v475 = a1[5];
      if (v475)
        v476 = *(_QWORD *)(v475 + 24);
      else
        v476 = 0;
      if (!a1[8])
        goto LABEL_444;
      v477 = (void *)a1[7];
      v340 = (void *)MEMORY[0x18D76B4E4]();
      v478 = (void *)MEMORY[0x1E0C99E60];
      v479 = objc_opt_class();
      v480 = objc_opt_class();
      v726 = objc_opt_class();
      v727 = 0;
      v724 = v480;
      v481 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v476, (uint64_t)v477, objc_msgSend(v478, "setWithObjects:", v479));
      if (v481)
        -[NSXPCStoreServerPerConnectionCache releaseQueryGenerationForRemoteGeneration:]((id *)objc_msgSend(v477, "cache"), *(_QWORD *)(v481 + 24));
      else
        _NSCoreDataLog(8, (uint64_t)CFSTR("Attempting to free nothing (or too many things) %@"), v482, v483, v484, v485, v486, v487, 0);
      v358 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, MEMORY[0x1E0C9AAB0]);
      goto LABEL_400;
    case 0xBLL:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Query generation reopen"), v452, v453, v454, v455, v456, v457, v724);
      v458 = a1[5];
      if (v458)
        v459 = *(_QWORD *)(v458 + 24);
      else
        v459 = 0;
      if (!a1[8])
        goto LABEL_444;
      v460 = (void *)a1[7];
      v340 = (void *)MEMORY[0x18D76B4E4]();
      v461 = (void *)MEMORY[0x1E0C99E60];
      v462 = objc_opt_class();
      v463 = objc_opt_class();
      v726 = objc_opt_class();
      v727 = 0;
      v724 = v463;
      v464 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v459, (uint64_t)v460, objc_msgSend(v461, "setWithObjects:", v462));
      v465 = v464;
      if (!v464)
      {
        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        {
          _NSCoreDataLog(8, (uint64_t)CFSTR("Bad parameter to reopen generation %@"), v609, v610, v611, v612, v613, v614, 0);
          v468 = 0;
          goto LABEL_398;
        }
        goto LABEL_397;
      }
      v466 = *(_QWORD *)(v464 + 24);
      v467 = (NSQueryGenerationToken *)-[NSXPCStoreServerPerConnectionCache localGenerationForRemoteGeneration:]((id *)objc_msgSend(v460, "cache"), v466);
      if (v467)
      {
        v468 = -[NSXPCStoreServer retainedXPCEncodableGenerationTokenForOriginal:inContext:](v467, v460);
        goto LABEL_398;
      }
      v621 = (NSQueryGenerationToken *)-[NSPersistentStoreCoordinator _reopenQueryGenerationWithIdentifier:inStoreWithIdentifier:error:](objc_msgSend(v460, "persistentStoreCoordinator"), v466, objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v460, "persistentStoreCoordinator"), "persistentStores"), "firstObject"), "identifier"), 0);
      v622 = v621;
      if (!v621)
      {
        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
          _NSCoreDataLog(8, (uint64_t)CFSTR("Unable to reopen generation %@"), v667, v668, v669, v670, v671, v672, v465);
LABEL_397:
        v468 = 0;
        goto LABEL_398;
      }
      v623 = -[NSXPCStoreServer retainedXPCEncodableGenerationTokenForOriginal:inContext:](v621, v460);
      v468 = v623;
      if (v623)
        isa = (uint64_t)v623[3].super.isa;
      else
        isa = 0;
      -[NSXPCStoreServerPerConnectionCache registerQueryGeneration:forRemoteGeneration:]((void *)objc_msgSend(v460, "cache"), v622, isa);
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Reopened generation %@"), v625, v626, v627, v628, v629, v630, (uint64_t)v468);
LABEL_398:
      v358 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v468);

      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
LABEL_399:
        _NSCoreDataLog(8, (uint64_t)CFSTR("Which archives to %@"), v359, v360, v361, v362, v363, v364, (uint64_t)v358);
LABEL_400:
      objc_autoreleasePoolPop(v340);
LABEL_401:
      v332 = v358;
LABEL_402:
      v39 = v332;
LABEL_403:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Done event handler"), v673, v674, v675, v676, v677, v678, v724);
      if (!*(_BYTE *)(*(_QWORD *)(v734[12] + 8) + 24))
      {
        a1 = v734;
        goto LABEL_407;
      }
      v680 = v742;
      if (v742)
      {
        a1 = v734;
        if (-[NSXPCStoreServer errorIsPlausiblyAnSQLiteIssue:](v734[8], v742))
        {
          if (-[NSXPCStoreServer setupRecoveryForConnectionContext:ifNecessary:](v734[8], v734[7], (uint64_t)v742))v696 = CFSTR("SQLite error on server: %@, recovery being attempted");
          else
            v696 = CFSTR("SQLite error on server: %@, no recovery being attempted");
          *(_QWORD *)(*(_QWORD *)(v734[13] + 8) + 40) = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v696, v742, v726, v727);
          +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, *(_QWORD *)(*(_QWORD *)(v734[13] + 8) + 40), v734[8], v697, v698, v699, v700, v701, v725);
        }
        goto LABEL_409;
      }
      a1 = v734;
      if (v39)
      {
        v681 = 0;
      }
      else
      {
        v702 = (void *)MEMORY[0x1E0CB35C8];
        v703 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("request failed (no result, no error)"), CFSTR("Problem"));
        v39 = 0;
        v742 = (char *)objc_msgSend(v702, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134070, v703);
        v681 = 8;
      }
LABEL_411:
      if (self)
      {
        self->_messageCode = v681;
        objc_setProperty_nonatomic(self, v680, v39, 24);
      }
      if (v742)
        v742 = (char *)+[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v742);
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Sending reply %p, %p"), v682, v683, v684, v685, v686, v687, (uint64_t)self);
      v688 = v742;
      objc_msgSend((id)a1[6], "reset");

      objc_msgSend(v733, "drain");
      v689 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      (*(void (**)(void))(a1[11] + 16))();
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Sent reply"), v690, v691, v692, v693, v694, v695, v724);

      objc_msgSend(v689, "drain");
      v742 = 0;
      return;
    case 0xCLL:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Batch delete"), v71, v72, v73, v74, v75, v76, v724);
      v77 = a1[5];
      if (v77)
        v78 = *(_QWORD *)(v77 + 24);
      else
        v78 = 0;
      v79 = v734[8];
      if (!v79)
        goto LABEL_444;
      v80 = v734[7];
      v781 = 0;
      v81 = (void *)MEMORY[0x18D76B4E4]();
      v82 = +[NSBatchDeleteRequest decodeFromXPCArchive:withContext:withPolicy:](NSBatchDeleteRequest, "decodeFromXPCArchive:withContext:withPolicy:", v78, v80, *(_QWORD *)(v79 + 64));
      if (v82)
      {
        v88 = (id)objc_msgSend(*(id *)(v79 + 64), "processRequest:fromClientWithContext:error:", v82, v80, &v781);
        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
          _NSCoreDataLog(8, (uint64_t)CFSTR("Which had result %@"), v89, v90, v91, v92, v93, v94, (uint64_t)v88);
        if (v88)
          v88 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, objc_msgSend(v88, "result"));
      }
      else
      {
        _NSCoreDataLog(8, (uint64_t)CFSTR("Nil batch delete request"), 0, v83, v84, v85, v86, v87, v724);
        v88 = 0;
      }
      v593 = v781;
      objc_autoreleasePoolPop(v81);
      if (v781)
        v742 = (char *)v781;
      goto LABEL_331;
    case 0xDLL:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Persistent history"), v261, v262, v263, v264, v265, v266, v724);
      v267 = a1[5];
      if (v267)
        v268 = *(_QWORD *)(v267 + 24);
      else
        v268 = 0;
      v269 = v734[8];
      if (!v269)
        goto LABEL_444;
      v270 = v734[7];
      v781 = 0;
      v271 = (void *)MEMORY[0x18D76B4E4]();
      v272 = +[NSPersistentHistoryChangeRequest decodeFromXPCArchive:withContext:withPolicy:](NSPersistentHistoryChangeRequest, "decodeFromXPCArchive:withContext:withPolicy:", v268, v270, *(_QWORD *)(v269 + 64));
      if (v272)
      {
        v88 = (id)objc_msgSend(*(id *)(v269 + 64), "processRequest:fromClientWithContext:error:", v272, v270, &v781);
        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
          _NSCoreDataLog(8, (uint64_t)CFSTR("Which had result %@"), v278, v279, v280, v281, v282, v283, (uint64_t)v88);
        if (v88)
          v88 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, objc_msgSend(v88, "result"));
      }
      else
      {
        _NSCoreDataLog(8, (uint64_t)CFSTR("Nil persistent history request"), 0, v273, v274, v275, v276, v277, v724);
        v88 = 0;
      }
      v595 = v781;
      objc_autoreleasePoolPop(v271);
      if (v781)
        v742 = (char *)v781;
LABEL_331:
      v594 = v781;
      v332 = v88;
      goto LABEL_402;
    case 0xELL:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Persistent history token"), v95, v96, v97, v98, v99, v100, v724);
      v101 = a1[5];
      if (v101)
        v102 = *(_QWORD *)(v101 + 24);
      else
        v102 = 0;
      if (!a1[8])
        goto LABEL_444;
      v103 = (void *)a1[7];
      v104 = (void *)MEMORY[0x18D76B4E4]();
      v105 = (void *)objc_msgSend(v103, "persistentStoreCoordinator");
      v106 = (void *)MEMORY[0x1E0C99E60];
      v107 = objc_opt_class();
      v724 = objc_opt_class();
      v726 = 0;
      v108 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v102, (uint64_t)v103, objc_msgSend(v106, "setWithObjects:", v107));
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Server received history token payload - %@"), v109, v110, v111, v112, v113, v114, (uint64_t)v108);
      if (!objc_msgSend(v108, "count"))
        goto LABEL_276;
      v115 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v108, "count"));
      v779 = 0u;
      v780 = 0u;
      v777 = 0u;
      v778 = 0u;
      v116 = (void *)objc_msgSend(v105, "persistentStores");
      v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v777, &v781, 16);
      if (v117)
      {
        v118 = *(_QWORD *)v778;
        do
        {
          for (kk = 0; kk != v117; ++kk)
          {
            if (*(_QWORD *)v778 != v118)
              objc_enumerationMutation(v116);
            v120 = *(void **)(*((_QWORD *)&v777 + 1) + 8 * kk);
            if (objc_msgSend(v108, "containsObject:", objc_msgSend(v120, "identifier")))
              objc_msgSend(v115, "addObject:", v120);
          }
          v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v777, &v781, 16);
        }
        while (v117);
      }
      if (objc_msgSend(v115, "count"))
        v121 = (void *)objc_msgSend(v105, "currentPersistentHistoryTokenFromStores:", v115);
      else
LABEL_276:
        v121 = 0;
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Server sending back historyToken %@"), v488, v489, v490, v491, v492, v493, (uint64_t)v121);
      v494 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, objc_msgSend(v121, "storeTokens"));
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Server historyToken archived to %@"), v495, v496, v497, v498, v499, v500, (uint64_t)v494);
      objc_autoreleasePoolPop(v104);
      v501 = 0;
      v332 = v494;
      goto LABEL_402;
    case 0xFLL:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Batch update"), v47, v48, v49, v50, v51, v52, v724);
      v53 = a1[5];
      if (v53)
        v54 = *(_QWORD *)(v53 + 24);
      else
        v54 = 0;
      v55 = v734[8];
      if (!v55)
        goto LABEL_444;
      v56 = v734[7];
      v781 = 0;
      v57 = (void *)MEMORY[0x18D76B4E4]();
      v58 = +[NSBatchUpdateRequest decodeFromXPCArchive:withContext:withPolicy:](NSBatchUpdateRequest, "decodeFromXPCArchive:withContext:withPolicy:", v54, v56, *(_QWORD *)(v55 + 64));
      if (v58)
      {
        v64 = (id)objc_msgSend(*(id *)(v55 + 64), "processRequest:fromClientWithContext:error:", v58, v56, &v781);
        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
          _NSCoreDataLog(8, (uint64_t)CFSTR("Which had result %@"), v65, v66, v67, v68, v69, v70, (uint64_t)v64);
        if (v64)
          v64 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, objc_msgSend(v64, "result"));
      }
      else
      {
        _NSCoreDataLog(8, (uint64_t)CFSTR("Nil batch update request"), 0, v59, v60, v61, v62, v63, v724);
        v588 = (void *)MEMORY[0x1E0CB35C8];
        v776[0] = *(id *)MEMORY[0x1E0CB2D68];
        *(_QWORD *)&v777 = CFSTR("Unable to decode request, ensure policy allows for updated class values");
        v589 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v777, v776, 1);
        v590 = (__CFString *)objc_msgSend(v588, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134070, v589);
        v64 = 0;
        v781 = v590;
      }
      v591 = v781;
      objc_autoreleasePoolPop(v57);
      if (v781)
        v742 = (char *)v781;
      goto LABEL_327;
    case 0x10:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Batch insert"), v365, v366, v367, v368, v369, v370, v724);
      v371 = a1[5];
      if (v371)
        v372 = *(_QWORD *)(v371 + 24);
      else
        v372 = 0;
      v373 = v734[8];
      if (!v373)
        goto LABEL_444;
      v374 = v734[7];
      v781 = 0;
      v375 = (void *)MEMORY[0x18D76B4E4]();
      v376 = +[NSBatchInsertRequest decodeFromXPCArchive:withContext:withPolicy:](NSBatchInsertRequest, "decodeFromXPCArchive:withContext:withPolicy:", v372, v374, *(_QWORD *)(v373 + 64));
      if (v376)
      {
        v64 = (id)objc_msgSend(*(id *)(v373 + 64), "processRequest:fromClientWithContext:error:", v376, v374, &v781);
        if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
          _NSCoreDataLog(8, (uint64_t)CFSTR("Which had result %@"), v382, v383, v384, v385, v386, v387, (uint64_t)v64);
        if (v64)
          v64 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, objc_msgSend(v64, "result"));
      }
      else
      {
        _NSCoreDataLog(8, (uint64_t)CFSTR("Nil batch insert request"), 0, v377, v378, v379, v380, v381, v724);
        v596 = (void *)MEMORY[0x1E0CB35C8];
        v776[0] = *(id *)MEMORY[0x1E0CB2D68];
        *(_QWORD *)&v777 = CFSTR("Unable to decode request, ensure policy allows for inserted class values");
        v597 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v777, v776, 1);
        v598 = (__CFString *)objc_msgSend(v596, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134070, v597);
        v64 = 0;
        v781 = v598;
      }
      v599 = v781;
      objc_autoreleasePoolPop(v375);
      if (v781)
        v742 = (char *)v781;
LABEL_327:
      v592 = v781;
      v332 = v64;
      goto LABEL_402;
    case 0x11:
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Query generation active connections"), v388, v389, v390, v391, v392, v393, v724);
      if (!a1[8])
        goto LABEL_444;
      v394 = (void *)a1[7];
      v340 = (void *)MEMORY[0x18D76B4E4]();
      v395 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v394, "persistentStoreCoordinator"), "persistentStores"), "lastObject");
      if (v395)
      {
        v402 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v395, "_hasActiveGenerations"));
      }
      else
      {
        _NSCoreDataLog(8, (uint64_t)CFSTR("no store"), v396, v397, v398, v399, v400, v401, v724);
        v402 = &unk_1E1F4B330;
      }
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        _NSCoreDataLog(8, (uint64_t)CFSTR("Got active connections %@"), v600, v601, v602, v603, v604, v605, (uint64_t)v402);
      v358 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v402);
      if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
        goto LABEL_399;
      goto LABEL_400;
    default:
      goto LABEL_28;
  }
}

+ (unint64_t)debugDefault
{
  return _CoreData_XPCDebug;
}

+ (void)initialize
{
  objc_opt_self();
  if ((id)objc_opt_class() == a1)
    _CoreData_XPCDebug = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.XPCDebug"));
}

- (id)initForStoreWithURL:(id)a3 usingModel:(id)a4 options:(id)a5 policy:(id)a6
{
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  NSXPCStoreServer *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSManagedObjectModel *v33;
  NSManagedObjectModel *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  NSXPCStoreServerRequestHandlingPolicy *v40;
  NSDictionary *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSXPCListener *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  int v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  _QWORD v67[4];
  _BYTE v68[128];
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
  {

    v14 = CFSTR("model");
    if (!a3)
      v14 = CFSTR("storeURL");
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't create server - misconfigured server : %@ is nil"), v14);
    goto LABEL_14;
  }
  v11 = (void *)objc_msgSend(a5, "valueForKey:", CFSTR("NSXPCStoreEntitlementNames"));
  if (!v11)
  {
    v69[0] = CFSTR("application-identifier");
    v13 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
    goto LABEL_10;
  }
  v12 = v11;
  if ((objc_msgSend(v11, "containsObject:", CFSTR("application-identifier")) & 1) == 0)
  {
    v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v12), "arrayByAddingObject:", CFSTR("application-identifier"));
LABEL_10:
    v12 = (void *)v13;
  }
  v21 = objc_msgSend(a5, "valueForKey:", CFSTR("NSXPCStoreServiceName"));
  v22 = objc_msgSend((id)objc_msgSend(a5, "valueForKey:", CFSTR("NSXPCStoreDaemonize")), "BOOLValue");
  v23 = v22;
  if (!v21 && v22)
  {

    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't create server - misconfigured server : no service name supplied for daemonized server"), v57);
LABEL_14:
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v15, 0, v16, v17, v18, v19, v20, v58);
    return 0;
  }
  v26 = objc_msgSend(a5, "valueForKey:", CFSTR("NSXPCStoreListener"));
  if (v26 && v21)
  {
    v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Options dictionary contains service name and anonymous listener, defaulting to service name"));
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v27, 0, v28, v29, v30, v31, v32, v57);
    v26 = 0;
  }
  v59 = (void *)v26;
  v66.receiver = self;
  v66.super_class = (Class)NSXPCStoreServer;
  v24 = -[NSXPCStoreServer init](&v66, sel_init);
  if (v24)
  {
    v60 = v23;
    v61 = a6;
    v33 = (NSManagedObjectModel *)a4;
    v24->_model = v33;
    if (!v33)
    {
      v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't create server - unable to load model"));
      +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v51, (uint64_t)v24, v52, v53, v54, v55, v56, v57);
      abort();
    }
    v34 = v33;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v35 = -[NSManagedObjectModel countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v63 != v37)
            objc_enumerationMutation(v34);
          v39 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
          if (v39)
          {

            *(_QWORD *)(v39 + 48) = 0;
          }
        }
        v36 = -[NSManagedObjectModel countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      }
      while (v36);
    }
    v24->_storeURL = (NSURL *)a3;
    v24->_entitlementNames = (NSArray *)objc_msgSend(v12, "copy");
    if (v61)
      v40 = (NSXPCStoreServerRequestHandlingPolicy *)v61;
    else
      v40 = objc_alloc_init(NSXPCStoreServerRequestHandlingPolicy);
    v24->_policy = v40;
    v41 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", a5);
    v67[0] = CFSTR("NSPersistentStoreDeferredLightweightMigrationOptionKey");
    v67[1] = CFSTR("NSMigratePersistentStoresAutomaticallyOption");
    v67[2] = CFSTR("NSInferMappingModelAutomaticallyOption");
    v67[3] = CFSTR("NSPersistentStoreForceLightweightMigrationOption");
    -[NSDictionary removeObjectsForKeys:](v41, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 4));
    if (!-[NSDictionary isEqualToDictionary:](v41, "isEqualToDictionary:", a5))
      _NSCoreDataLog(2, (uint64_t)CFSTR("XPC Store Server - Migration keys have been removed from %@"), v42, v43, v44, v45, v46, v47, (uint64_t)a5);
    v24->_storeOptions = v41;
    if (v21)
    {
      if (v60)
      {
        v48 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v21);
      }
      else
      {
        _NSCoreDataLog(8, (uint64_t)CFSTR("Attempting to create non-mach listener with service name: %@"), v42, v43, v44, v45, v46, v47, v21);
        v48 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithServiceName:", v21);
      }
    }
    else if (v59)
    {
      v48 = v59;
    }
    else
    {
      v48 = (NSXPCListener *)(id)objc_msgSend(MEMORY[0x1E0CB3B58], "serviceListener");
    }
    v24->_listener = v48;
    -[NSXPCListener setDelegate:](v48, "setDelegate:", v24);
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3870]), "initWithOptions:", 0);
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3870]), "initWithOptions:", 0);
    v24->_connectionToCoordinatorMap = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v49, v50, 10);

    v24->_cacheIDtoCoordinatorMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v24;
}

- (id)initForStoreWithURL:(id)a3 usingModelAtURL:(id)a4 options:(id)a5 policy:(id)a6
{
  NSManagedObjectModel *v11;
  _QWORD *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  if (a3 && a4)
  {
    v11 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", a4);
    v12 = -[NSXPCStoreServer initForStoreWithURL:usingModel:options:policy:](self, "initForStoreWithURL:usingModel:options:policy:", a3, v11, a5, a6);
    if (v12)
      v12[2] = a4;

  }
  else
  {

    v13 = CFSTR("storeURL");
    if (!a4)
      v13 = CFSTR("modelURL");
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't create server - misconfigured server : %@ is nil"), v13);
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v14, 0, v15, v16, v17, v18, v19, v21);
    return 0;
  }
  return v12;
}

- (void)startListening
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
    _NSCoreDataLog(8, (uint64_t)CFSTR("%@: Listening"), v3, v4, v5, v6, v7, v8, (uint64_t)self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");

  self->_listener = 0;
  self->_policy = 0;

  self->_connectionToCoordinatorMap = 0;
  self->_cacheIDtoCoordinatorMap = 0;

  self->_modelURL = 0;
  self->_model = 0;

  self->_storeURL = 0;
  self->_storeOptions = 0;

  self->_entitlementNames = 0;
  self->_delegate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSXPCStoreServer;
  -[NSXPCStoreServer dealloc](&v3, sel_dealloc);
}

- (id)errorHandlingDelegate
{
  return self->_delegate;
}

- (void)setErrorHandlingDelegate:(id)a3
{
  id v5;

  if (self->_delegate != a3)
  {
    v5 = a3;

    self->_delegate = a3;
  }
}

- (void)errorIsPlausiblyAnSQLiteIssue:(uint64_t)a1
{
  void *result;
  void *v5;
  int v6;

  result = 0;
  if (a1 && a2)
  {
    result = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", CFSTR("NSSQLiteErrorDomain"));
    if (result)
      goto LABEL_8;
    v5 = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", CFSTR("NSUnderlyingException"));
    if (v5)
    {
      result = (void *)objc_msgSend(v5, "userInfo");
    }
    else
    {
      result = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", CFSTR("exception info"));
      if (!result)
        return result;
    }
    result = (void *)objc_msgSend(result, "objectForKey:", CFSTR("NSSQLiteErrorDomain"));
    if (result)
    {
LABEL_8:
      v6 = objc_msgSend(result, "intValue");
      return (void *)(v6 == 11 || v6 == 26);
    }
  }
  return result;
}

- (uint64_t)setupRecoveryForConnectionContext:(uint64_t)a3 ifNecessary:
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    result = *(_QWORD *)(result + 8);
    if (result)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        return 0;
      result = objc_msgSend(*(id *)(v3 + 8), "willPerformRecoveryForError:fromContext:", a3, a2);
      if (!(_DWORD)result)
        return result;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(*(id *)(v3 + 8), "performRecoveryForError:fromContext:", a3, a2);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (void)removeCachesForConnection:(void *)result
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  unint64_t *v7;
  unint64_t v8;
  BOOL v9;
  int64_t v10;

  if (result)
  {
    v3 = result;
    v4 = objc_sync_enter(result);
    v5 = (void *)MEMORY[0x18D76B4E4](v4);
    v6 = NSMapGet(*((NSMapTable **)v3 + 9), a2);
    if (v6 && v6[6])
    {
      v7 = v6 + 5;
      do
      {
        v8 = __ldxr(v7);
        v9 = __OFSUB__(v8, 1);
        v10 = v8 - 1;
      }
      while (__stxr(v10, v7));
      if ((v10 < 0) ^ v9 | (v10 == 0))
        objc_msgSend(*((id *)v3 + 10), "removeObjectForKey:");
    }
    NSMapRemove(*((NSMapTable **)v3 + 9), a2);
    objc_msgSend(a2, "setUserInfo:", 0);
    objc_autoreleasePoolPop(v5);
    return (void *)objc_sync_exit(v3);
  }
  return result;
}

void *__47__NSXPCStoreServer_retainedCacheForConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
    _NSCoreDataLog(8, (uint64_t)CFSTR(" Server Connection interrupted."), v2, v3, v4, v5, v6, v7, v9);
  return -[NSXPCStoreServer removeCachesForConnection:](*(void **)(a1 + 32), *(void **)(a1 + 40));
}

void *__47__NSXPCStoreServer_retainedCacheForConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  if (+[NSXPCStoreServer debugDefault](NSXPCStoreServer, "debugDefault"))
    _NSCoreDataLog(8, (uint64_t)CFSTR(" Server Connection invalidated."), v2, v3, v4, v5, v6, v7, v9);
  return -[NSXPCStoreServer removeCachesForConnection:](*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (NSXPCStoreServerDelegate)delegate
{
  return (NSXPCStoreServerDelegate *)self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSQueryGenerationToken)retainedXPCEncodableGenerationTokenForOriginal:(NSQueryGenerationToken *)a1 inContext:(void *)a2
{
  void *v4;
  Class isa;
  id WeakRetained;
  _NSXPCQueryGenerationToken *v7;
  Class v8;
  NSQueryGenerationToken *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x18D76B4E4]();
  if (+[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken") == a1|| +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken") == a1)
  {
    v9 = a1;
    goto LABEL_13;
  }
  if (+[NSQueryGenerationToken nostoresQueryGenerationToken](NSQueryGenerationToken, "nostoresQueryGenerationToken") == a1)
  {
    v9 = 0;
    goto LABEL_13;
  }
  if (a1)
  {
    isa = a1[2].super.isa;
    if (isa)
      WeakRetained = objc_loadWeakRetained((id *)isa + 1);
    else
      WeakRetained = 0;
    v7 = [_NSXPCQueryGenerationToken alloc];
    v8 = a1[3].super.isa;
    if (v7)
      goto LABEL_8;
LABEL_16:
    v9 = 0;
    goto LABEL_9;
  }
  v7 = [_NSXPCQueryGenerationToken alloc];
  WeakRetained = 0;
  v8 = 0;
  if (!v7)
    goto LABEL_16;
LABEL_8:
  v9 = (NSQueryGenerationToken *)-[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](v7, v8, WeakRetained, 0);
LABEL_9:

  v10 = (void *)objc_msgSend(a2, "cache");
  if (a1)
    v11 = (uint64_t)a1[3].super.isa;
  else
    v11 = 0;
  -[NSXPCStoreServerPerConnectionCache registerQueryGeneration:forRemoteGeneration:](v10, a1, v11);
LABEL_13:
  objc_autoreleasePoolPop(v4);
  return v9;
}

- (uint64_t)_populateObject:(void *)a1 withValuesFromClient:(void *)a2
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v47;
  void *v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v47 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v4 = (void *)objc_msgSend(a1, "managedObjectContext");
  v5 = (_QWORD *)objc_msgSend(a1, "entity");
  objc_msgSend(a1, "_setVersionReference__:", objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", 1), "longLongValue"));
  v56 = a2;
  v55 = objc_msgSend(a2, "objectAtIndex:", 2);
  if (v5)
    v6 = (_QWORD *)v5[14];
  else
    v6 = 0;
  v7 = objc_msgSend((id)objc_msgSend(v5, "propertiesByName"), "values");
  v8 = v6[6];
  v9 = v6[7];
  v10 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v53 = v10;
  v11 = v8 < v9 + v8;
  v49 = v7;
  if (v8 < v9 + v8)
  {
    v50 = v6;
    v12 = 0;
    v13 = v7;
    v14 = 0;
    v15 = v9 + 3;
    v16 = v13 + 8 * v8;
    while (1)
    {
      v17 = objc_msgSend(*(id *)(v16 + 8 * v12), "name");
      v10 = objc_msgSend(v56, "objectAtIndex:", v12 + 3);
      if (v10 != v55)
      {
        v18 = v10;
        v10 = objc_msgSend(a1, "valueForKey:", v17);
        if (v10 != v18)
        {
          v10 = objc_msgSend((id)v10, "isEqual:", v18);
          if ((v10 & 1) == 0)
            break;
        }
      }
      if ((v14 & 1) == 0)
      {
        v19 = objc_msgSend(a1, "valueForKey:", v17);
LABEL_14:
        v10 = objc_msgSend(a1, "setValue:forKey:", v19, v17);
      }
      ++v12;
      v14 = 1;
      if (v9 == v12)
      {
        v7 = v49;
        v6 = v50;
        goto LABEL_18;
      }
    }
    if (v53 == v18)
      v19 = 0;
    else
      v19 = v18;
    goto LABEL_14;
  }
  v15 = 3;
LABEL_18:
  v20 = v6[12];
  v21 = v6[13];
  v48 = a1;
  if (v20 >= v21 + v20)
    goto LABEL_32;
  v51 = v21 + v15;
  v22 = (id *)(v7 + 8 * v20);
  do
  {
    v23 = objc_msgSend(*v22, "name");
    v10 = objc_msgSend(v56, "objectAtIndex:", v15);
    if (v10 == v55
      || (v24 = v10, v10 = objc_msgSend(a1, "valueForKey:", v23), v10 == v24)
      || (v10 = objc_msgSend((id)v10, "isEqual:", v24), (v10 & 1) != 0))
    {
      if (v11)
        goto LABEL_29;
      v25 = objc_msgSend(a1, "valueForKey:", v23);
    }
    else
    {
      if (v53 == v24)
      {
        v26 = 0;
        goto LABEL_28;
      }
      v25 = objc_msgSend(v4, "existingObjectWithID:error:", v24, 0);
    }
    v26 = v25;
LABEL_28:
    v10 = objc_msgSend(a1, "setValue:forKey:", v26, v23);
LABEL_29:
    ++v15;
    ++v22;
    v11 = 1;
    --v21;
  }
  while (v21);
  v15 = v51;
LABEL_32:
  v28 = v6[14];
  v27 = v6[15];
  if (v28 < v27 + v28)
  {
    v52 = v27 + v15;
    do
    {
      v29 = (void *)MEMORY[0x18D76B4E4](v10);
      v30 = objc_msgSend(*(id *)(v7 + 8 * v28), "name");
      v31 = (void *)objc_msgSend(v56, "objectAtIndex:", v15);
      if (v55 == objc_msgSend(v31, "objectAtIndex:", 0))
      {
        if (!v11)
          objc_msgSend(v48, "setValue:forKey:", objc_msgSend(v48, "valueForKey:", v30), v30);
        v11 = 1;
      }
      else
      {
        v32 = (void *)objc_msgSend(v31, "objectAtIndex:", 0);
        v33 = (void *)objc_msgSend(v31, "objectAtIndex:", 1);
        v54 = (void *)objc_msgSend(v48, "mutableSetValueForKey:", v30);
        if (objc_msgSend(v32, "count"))
        {
          v34 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v62;
            do
            {
              v38 = 0;
              do
              {
                if (*(_QWORD *)v62 != v37)
                  objc_enumerationMutation(v32);
                v39 = objc_msgSend(v4, "existingObjectWithID:error:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v38), 0);
                if (v39)
                  objc_msgSend(v34, "addObject:", v39);
                ++v38;
              }
              while (v36 != v38);
              v36 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
            }
            while (v36);
          }
          objc_msgSend(v54, "unionSet:", v34);

          v11 = 1;
          v7 = v49;
        }
        if (objc_msgSend(v33, "count"))
        {
          v40 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v41 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v58;
            do
            {
              v44 = 0;
              do
              {
                if (*(_QWORD *)v58 != v43)
                  objc_enumerationMutation(v33);
                v45 = objc_msgSend(v4, "existingObjectWithID:error:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v44), 0);
                if (v45)
                  objc_msgSend(v40, "addObject:", v45);
                ++v44;
              }
              while (v42 != v44);
              v42 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
            }
            while (v42);
          }
          objc_msgSend(v54, "minusSet:", v40);

          v11 = 1;
          v7 = v49;
        }
      }
      ++v15;
      objc_autoreleasePoolPop(v29);
      ++v28;
    }
    while (v15 != v52);
  }
  return objc_msgSend(v47, "drain");
}

@end
