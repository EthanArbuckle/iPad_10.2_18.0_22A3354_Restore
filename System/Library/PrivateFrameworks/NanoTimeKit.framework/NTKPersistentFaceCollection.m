@implementation NTKPersistentFaceCollection

void __119__NTKPersistentFaceCollection_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  _BYTE *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v78 = v3;
    v79 = 2112;
    v80 = v4;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "%@ from daemon load full collection (seqId=%@)", buf, 0x16u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "facesByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v7)
    v8 = objc_msgSend(v7, "count") == 0;
  else
    v8 = 1;
  objc_msgSend(*(id *)(a1 + 48), "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsInArray:", v9);

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v71 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_removeFaceForUUID:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    }
    while (v12);
  }
  v55 = v10;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_updateOrderedUUIDsFromReference:andNotifyReordered:", *(_QWORD *)(a1 + 56), 1);
  objc_msgSend(*(id *)(a1 + 48), "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v17 = *(_BYTE **)(a1 + 32);
  if (v17[152])
    v18 = v8;
  else
    v18 = 0;
  if (v18)
  {
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __119__NTKPersistentFaceCollection_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion___block_invoke_92;
    v68[3] = &unk_1E6BD17A0;
    v69 = *(id *)(a1 + 56);
    objc_msgSend(v16, "sortUsingComparator:", v68);

    v17 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v17, "facesByUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectsInArray:", v20);

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v21 = v16;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
  v56 = v21;
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v65 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[NTKFace faceWithInstanceDescriptor:](NTKFace, "faceWithInstanceDescriptor:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_addFace:forUUID:", v28, v26);
        }
        else
        {
          _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v27, "debugDescription");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "UUIDString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v78 = v30;
            v79 = 2112;
            v80 = v31;
            _os_log_impl(&dword_1B72A3000, v29, OS_LOG_TYPE_DEFAULT, "Got a nil NTKFace when initalizing from descriptor %@, uuid %@", buf, 0x16u);

            v21 = v56;
          }

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    }
    while (v23);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_computeSelectedUUIDFromReferenceAndNotifySelected");
  objc_msgSend(*(id *)(a1 + 32), "selectedFace");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138412290;
      v78 = v34;
      _os_log_impl(&dword_1B72A3000, v33, OS_LOG_TYPE_DEFAULT, "Failed to select the specified selectedUUID (%@) when loading, falling back", buf, 0xCu);
    }

    v35 = *(void **)(a1 + 32);
    objc_msgSend(v35, "orderedUUIDs");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "_selectFaceUUID:notify:", v37, 0);

  }
  objc_msgSend(*(id *)(a1 + 48), "allKeys");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "mutableCopy");

  objc_msgSend(v39, "removeObjectsInArray:", v21);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v40 = v39;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v61;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v61 != v43)
          objc_enumerationMutation(v40);
        v45 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * k);
        v46 = (void *)MEMORY[0x1BCCA7FA8]();
        objc_msgSend(*(id *)(a1 + 32), "facesByUUID");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectForKey:", v45);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v45);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        +[NTKFace faceWithInstanceDescriptor:](NTKFace, "faceWithInstanceDescriptor:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = *(void **)(a1 + 32);
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __119__NTKPersistentFaceCollection_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion___block_invoke_96;
        v57[3] = &unk_1E6BCD778;
        v58 = v48;
        v59 = v50;
        v52 = v50;
        v53 = v48;
        objc_msgSend(v51, "_performSuppressingFaceObserverCallbacks:", v57);

        objc_autoreleasePoolPop(v46);
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
    }
    while (v42);
  }

  v54 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v54 + 80))
  {
    *(_BYTE *)(v54 + 80) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_notifyLoaded");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

- (void)_notifyLoaded
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NTKFaceCollection observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "faceCollectionDidLoad:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_fromDaemon_computeSelectedUUIDFromReferenceAndNotifySelected
{
  void *v3;
  NSUUID *referenceSelectedUUID;
  void *v5;
  uint64_t v6;
  NSUUID *v7;
  id v8;

  if (self->_referenceSelectedUUID)
  {
    -[NTKFaceCollection facesByUUID](self, "facesByUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", self->_referenceSelectedUUID);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      referenceSelectedUUID = self->_referenceSelectedUUID;
      -[NTKFaceCollection selectedUUID](self, "selectedUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = NTKEqualObjects(referenceSelectedUUID, v5) ^ 1;

      -[NTKFaceCollection _selectFaceUUID:notify:](self, "_selectFaceUUID:notify:", self->_referenceSelectedUUID, v6);
      v7 = self->_referenceSelectedUUID;
      self->_referenceSelectedUUID = 0;

    }
  }
}

- (void)_register
{
  void *v3;
  void *v4;
  void *v5;

  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceCollection collectionIdentifier](self, "collectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceCollection deviceUUID](self, "deviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForCollectionIdentifier:deviceUUID:withSeqId:", v4, v5, self->_seqId);

  self->_registrationNeeded = 0;
}

- (NTKPersistentFaceCollection)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4
{
  id v6;
  id v7;
  NTKPersistentFaceCollection *v8;
  NTKPersistentFaceCollection *v9;
  void *v10;
  uint64_t v11;
  NSXPCConnection *connection;
  NSXPCConnection *v13;
  void *v14;
  NSXPCConnection *v15;
  void *v16;
  _NTKCollectionClientProxy *v17;
  NSXPCConnection *v18;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id location;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NTKPersistentFaceCollection;
  v8 = -[NTKFaceCollection initWithCollectionIdentifier:deviceUUID:](&v27, sel_initWithCollectionIdentifier_deviceUUID_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[NTKFaceCollection collectionIdentifier](v8, "collectionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isLibraryCollection = objc_msgSend(v10, "isEqualToString:", CFSTR("LibraryFaces"));

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nanotimekit.collectionserver"), 4096);
    connection = v9->_connection;
    v9->_connection = (NSXPCConnection *)v11;

    v13 = v9->_connection;
    NTKCollectionServerInterface();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v13, "setRemoteObjectInterface:", v14);

    v15 = v9->_connection;
    NTKCollectionClientInterface();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v15, "setExportedInterface:", v16);

    v17 = -[_NTKCollectionClientProxy initWithWeakProxy:]([_NTKCollectionClientProxy alloc], "initWithWeakProxy:", v9);
    -[NSXPCConnection setExportedObject:](v9->_connection, "setExportedObject:", v17);
    if (initWithCollectionIdentifier_deviceUUID__onceToken != -1)
      dispatch_once(&initWithCollectionIdentifier_deviceUUID__onceToken, &__block_literal_global_45);
    -[NSXPCConnection _setQueue:](v9->_connection, "_setQueue:", initWithCollectionIdentifier_deviceUUID__xpcQueue);
    objc_initWeak(&location, v9);
    v18 = v9->_connection;
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_2;
    v24 = &unk_1E6BCD7F0;
    objc_copyWeak(&v25, &location);
    -[NSXPCConnection setInterruptionHandler:](v18, "setInterruptionHandler:", &v21);
    -[NSXPCConnection setInvalidationHandler:](v9->_connection, "setInvalidationHandler:", &__block_literal_global_82, v21, v22, v23, v24);
    -[NSXPCConnection resume](v9->_connection, "resume");
    -[NTKPersistentFaceCollection _register](v9, "_register");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_handleDaemonDidLaunchNotification, CFSTR("com.apple.nanotimekit.daemondidlaunch"), 0, (CFNotificationSuspensionBehavior)0);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  return v9;
}

- (void)loadFullCollectionWithOrderedUUIDs:(id)a3 selectedUUID:(id)a4 facesDescriptorsByUUID:(id)a5 seqId:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_opt_class();
  NTKValidateArray(v12, v17);
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  NTKValidateDictionary(v14, v18, v19);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __119__NTKPersistentFaceCollection_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion___block_invoke;
  v20[3] = &unk_1E6BD17C8;
  v20[4] = self;
  v21 = v15;
  v22 = v14;
  v23 = v12;
  v24 = v13;
  v25 = v16;
  -[NTKPersistentFaceCollection _performOrEnqueueUpdateOfType:forFaceUUID:block:](self, "_performOrEnqueueUpdateOfType:forFaceUUID:block:", 0, 0, v20);

}

- (void)_performOrEnqueueUpdateOfType:(int64_t)a3 forFaceUUID:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__NTKPersistentFaceCollection__performOrEnqueueUpdateOfType_forFaceUUID_block___block_invoke;
  v12[3] = &unk_1E6BD0060;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a3;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __79__NTKPersistentFaceCollection__performOrEnqueueUpdateOfType_forFaceUUID_block___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 129))
  {
    +[NTKFaceCollectionUpdate updateWithType:uuid:block:](NTKFaceCollectionUpdate, "updateWithType:uuid:block:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_pruneEnqueuedUpdatesMadeObsoleteByNewUpdate:", v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "addObject:", v2);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("PFC-Shared-XPC", v2);
  v1 = (void *)initWithCollectionIdentifier_deviceUUID__xpcQueue;
  initWithCollectionIdentifier_deviceUUID__xpcQueue = (uint64_t)v0;

}

void __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_3;
  block[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionInterrupted");

}

void __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_4()
{
  NSObject *v0;

  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_4_cold_1();

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.nanotimekit.daemondidlaunch"), 0);
  v4.receiver = self;
  v4.super_class = (Class)NTKPersistentFaceCollection;
  -[NTKPersistentFaceCollection dealloc](&v4, sel_dealloc);
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (void)_didAddFace:(id)a3 withUUID:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  NSArray *referenceOrderedUUIDs;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  if (self->_isLibraryCollection)
  {
    objc_msgSend(v13, "setIsLibraryFace:", 1);
    objc_msgSend(v13, "didMoveToLibrary");
  }
  referenceOrderedUUIDs = self->_referenceOrderedUUIDs;
  self->_referenceOrderedUUIDs = 0;

  v10 = -[NTKFaceCollection numberOfFaces](self, "numberOfFaces") - 1;
  -[NTKFaceCollection orderedUUIDs](self, "orderedUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPersistentFaceCollection _sendToDaemonAddedFace:forUUID:](self, "_sendToDaemonAddedFace:forUUID:", v13, v12);

  if (v10 != a5)
    -[NTKPersistentFaceCollection _sendToDaemonOrderedUUIDs](self, "_sendToDaemonOrderedUUIDs");

}

- (void)_didMoveFace:(id)a3 withUUID:(id)a4 toIndex:(unint64_t)a5
{
  NSArray *referenceOrderedUUIDs;

  referenceOrderedUUIDs = self->_referenceOrderedUUIDs;
  self->_referenceOrderedUUIDs = 0;

  -[NTKPersistentFaceCollection _sendToDaemonOrderedUUIDs](self, "_sendToDaemonOrderedUUIDs");
}

- (void)_didSelectFaceUUID:(id)a3 suppressingCallback:(BOOL)a4
{
  _BOOL8 v4;
  NSUUID *referenceSelectedUUID;
  void *v7;

  v4 = a4;
  referenceSelectedUUID = self->_referenceSelectedUUID;
  self->_referenceSelectedUUID = 0;

  -[NTKFaceCollection selectedUUID](self, "selectedUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[NTKPersistentFaceCollection _sendToDaemonSelectedUUIDSuppressingCallback:](self, "_sendToDaemonSelectedUUIDSuppressingCallback:", v4);
}

- (void)_didRemoveFace:(id)a3 withUUID:(id)a4
{
  id v6;

  v6 = a3;
  -[NTKPersistentFaceCollection _sendToDaemonRemovedFaceForUUID:](self, "_sendToDaemonRemovedFaceForUUID:", a4);
  if (self->_isLibraryCollection)
    objc_msgSend(v6, "setIsLibraryFace:", 0);

}

- (void)suspendUpdatesFromDaemon
{
  NSObject *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *updatesFromDaemonEnqueuedWhileSuspended;
  void *v7;
  NSString *v8;
  NSString *updateSuspensionIdentifier;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKFaceCollection logIdentifier](self, "logIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "%@ suspend updates from daemon", (uint8_t *)&v10, 0xCu);

  }
  if (!self->_updatesFromDaemonEnqueuedWhileSuspended)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    updatesFromDaemonEnqueuedWhileSuspended = self->_updatesFromDaemonEnqueuedWhileSuspended;
    self->_updatesFromDaemonEnqueuedWhileSuspended = v5;

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  updateSuspensionIdentifier = self->_updateSuspensionIdentifier;
  self->_updateSuspensionIdentifier = v8;

  self->_updatesFromDaemonSuspended = 1;
}

- (void)resumeUpdatesFromDaemon
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKFaceCollection logIdentifier](self, "logIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "%@ resume updates from daemon", (uint8_t *)&v5, 0xCu);

  }
  if (self->_updatesFromDaemonSuspended)
    -[NTKPersistentFaceCollection _sendToDaemonFlushWithIdentifier:](self, "_sendToDaemonFlushWithIdentifier:", self->_updateSuspensionIdentifier);
}

- (void)_handleFlushCompleteForIdentifier:(id)a3
{
  NSObject *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(void);
  NSString *updateSuspensionIdentifier;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[NSString isEqualToString:](self->_updateSuspensionIdentifier, "isEqualToString:", a3))
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKFaceCollection logIdentifier](self, "logIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "%@ playing back updates enqueued while suspended", buf, 0xCu);

    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_updatesFromDaemonEnqueuedWhileSuspended;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "block", (_QWORD)v13);
          v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v11[2]();

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[NSMutableArray removeAllObjects](self->_updatesFromDaemonEnqueuedWhileSuspended, "removeAllObjects");
    updateSuspensionIdentifier = self->_updateSuspensionIdentifier;
    self->_updateSuspensionIdentifier = 0;

    self->_updatesFromDaemonSuspended = 0;
  }
}

- (void)faceConfigurationDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_suppressingFaceObserverCallbacks)
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKFaceCollection logIdentifier](self, "logIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "%@ face config did change (face = %@)", (uint8_t *)&v9, 0x16u);

    }
    -[NTKFaceCollection UUIDsByFace](self, "UUIDsByFace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[NTKPersistentFaceCollection _sendToDaemonUpdatedConfigurationForFace:withUUID:](self, "_sendToDaemonUpdatedConfigurationForFace:withUUID:", v4, v8);

  }
}

- (void)faceResourceDirectoryDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_suppressingFaceObserverCallbacks)
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKFaceCollection logIdentifier](self, "logIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "%@ face directory did change (face = %@)", (uint8_t *)&v9, 0x16u);

    }
    -[NTKFaceCollection UUIDsByFace](self, "UUIDsByFace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[NTKPersistentFaceCollection _sendToDaemonUpdatedResourceDirectoryForFace:withUUID:](self, "_sendToDaemonUpdatedResourceDirectoryForFace:withUUID:", v4, v8);

  }
}

- (void)faceUpgradeOccurred:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_suppressingFaceObserverCallbacks)
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKFaceCollection logIdentifier](self, "logIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "%@ face upgrade in progress (face = %@)", (uint8_t *)&v9, 0x16u);

    }
    -[NTKFaceCollection UUIDsByFace](self, "UUIDsByFace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[NTKPersistentFaceCollection _sendToDaemonUpgradeForFace:withUUID:](self, "_sendToDaemonUpgradeForFace:withUUID:", v4, v8);

  }
}

- (void)_notifyReset
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NTKFaceCollection observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "faceCollectionDidReset:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_sendToDaemonOrderedUUIDs
{
  void *v3;
  id v4;

  -[NTKPersistentFaceCollection _registerIfNeeded](self, "_registerIfNeeded");
  -[NTKPersistentFaceCollection _serverProxy](self, "_serverProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceCollection orderedUUIDs](self, "orderedUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOrderedFaceUUIDs:", v3);

}

- (void)_sendToDaemonSelectedUUIDSuppressingCallback:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[NTKPersistentFaceCollection _registerIfNeeded](self, "_registerIfNeeded");
  -[NTKPersistentFaceCollection _serverProxy](self, "_serverProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceCollection selectedUUID](self, "selectedUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedFaceUUID:suppressingCallback:", v5, v3);

}

- (void)_sendToDaemonUpdatedConfigurationForFace:(id)a3 withUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[NTKPersistentFaceCollection _registerIfNeeded](self, "_registerIfNeeded");
  -[NTKPersistentFaceCollection _serverProxy](self, "_serverProxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationJSONRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "updateFaceForUUID:withConfigurationJSONRepresentation:", v6, v8);
}

- (void)_sendToDaemonUpdatedResourceDirectoryForFace:(id)a3 withUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[NTKPersistentFaceCollection _registerIfNeeded](self, "_registerIfNeeded");
  -[NTKPersistentFaceCollection _serverProxy](self, "_serverProxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "updateFaceForUUID:withResourceDirectory:", v6, v8);
}

- (void)_sendToDaemonUpgradeForFace:(id)a3 withUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[NTKPersistentFaceCollection _registerIfNeeded](self, "_registerIfNeeded");
  objc_msgSend(v7, "instanceDescriptor");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKPersistentFaceCollection _serverProxy](self, "_serverProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "upgradeFaceInstanceDescriptor:forUUID:", v9, v6);

}

- (void)_sendToDaemonAddedFace:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[NTKPersistentFaceCollection _registerIfNeeded](self, "_registerIfNeeded");
  objc_msgSend(v7, "instanceDescriptor");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKPersistentFaceCollection _serverProxy](self, "_serverProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addFaceInstanceDescriptor:forUUID:", v9, v6);

}

- (void)_sendToDaemonRemovedFaceForUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NTKPersistentFaceCollection _registerIfNeeded](self, "_registerIfNeeded");
  -[NTKPersistentFaceCollection _serverProxy](self, "_serverProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFaceForUUID:", v4);

}

- (void)_sendToDaemonReset
{
  id v3;

  -[NTKPersistentFaceCollection _registerIfNeeded](self, "_registerIfNeeded");
  -[NTKPersistentFaceCollection _serverProxy](self, "_serverProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetCollection");

}

- (void)_sendToDaemonFlushWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NTKPersistentFaceCollection _registerIfNeeded](self, "_registerIfNeeded");
  -[NTKPersistentFaceCollection _serverProxy](self, "_serverProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flushUpdatesWithIdentifier:", v4);

}

- (id)_serverProxy
{
  return -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

uint64_t __119__NTKPersistentFaceCollection_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion___block_invoke_92(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

void __119__NTKPersistentFaceCollection_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion___block_invoke_96(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applyConfiguration:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "resourceDirectory");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResourceDirectoryByTransferringOwnership:", v5);

}

- (void)resetClientCollectionWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__NTKPersistentFaceCollection_resetClientCollectionWithCompletion___block_invoke;
  v6[3] = &unk_1E6BD00B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NTKPersistentFaceCollection _performOrEnqueueUpdateOfType:forFaceUUID:block:](self, "_performOrEnqueueUpdateOfType:forFaceUUID:block:", 0, 0, v6);

}

uint64_t __67__NTKPersistentFaceCollection_resetClientCollectionWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_notifyReset");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)updateSelectedFaceUUID:(id)a3 seqId:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__NTKPersistentFaceCollection_updateSelectedFaceUUID_seqId___block_invoke;
  v10[3] = &unk_1E6BCDCB8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NTKPersistentFaceCollection _performOrEnqueueUpdateOfType:forFaceUUID:block:](self, "_performOrEnqueueUpdateOfType:forFaceUUID:block:", 5, 0, v10);

}

uint64_t __60__NTKPersistentFaceCollection_updateSelectedFaceUUID_seqId___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  id v5;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "logIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[5];
    v5 = a1[6];
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "%@ from daemon update selected uuid to %@ (seqId=%@)", (uint8_t *)&v7, 0x20u);

  }
  objc_storeStrong((id *)a1[4] + 13, a1[6]);
  objc_storeStrong((id *)a1[4] + 15, a1[5]);
  return objc_msgSend(a1[4], "_fromDaemon_computeSelectedUUIDFromReferenceAndNotifySelected");
}

- (void)updateOrderedFaceUUIDs:(id)a3 seqId:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  NTKValidateArray(v6, v8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__NTKPersistentFaceCollection_updateOrderedFaceUUIDs_seqId___block_invoke;
  v11[3] = &unk_1E6BCDCB8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NTKPersistentFaceCollection _performOrEnqueueUpdateOfType:forFaceUUID:block:](self, "_performOrEnqueueUpdateOfType:forFaceUUID:block:", 6, 0, v11);

}

uint64_t __60__NTKPersistentFaceCollection_updateOrderedFaceUUIDs_seqId___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  id v5;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "logIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[5];
    v5 = a1[6];
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "%@ from daemon update ordered uuids to %@ (seqId=%@)", (uint8_t *)&v7, 0x20u);

  }
  objc_storeStrong((id *)a1[4] + 13, a1[6]);
  objc_storeStrong((id *)a1[4] + 14, a1[5]);
  return objc_msgSend(a1[4], "_updateOrderedUUIDsFromReference:andNotifyReordered:", a1[5], 1);
}

- (void)updateFaceForUUID:(id)a3 withConfigurationJSONRepresentation:(id)a4 seqId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ must be non-nil"), CFSTR("UUID"));
    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ must be non-nil"), CFSTR("Configuration"));
    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__NTKPersistentFaceCollection_updateFaceForUUID_withConfigurationJSONRepresentation_seqId___block_invoke;
  v14[3] = &unk_1E6BD17F0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[NTKPersistentFaceCollection _performOrEnqueueUpdateOfType:forFaceUUID:block:](self, "_performOrEnqueueUpdateOfType:forFaceUUID:block:", 2, v13, v14);

}

void __91__NTKPersistentFaceCollection_updateFaceForUUID_withConfigurationJSONRepresentation_seqId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NTKFaceConfiguration *v4;
  uint64_t v5;
  void *v6;
  NTKFaceConfiguration *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  NTKFaceConfiguration *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "facesByUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [NTKFaceConfiguration alloc];
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTKFaceConfiguration initWithJSONDictionary:editModeMapping:forDevice:](v4, "initWithJSONDictionary:editModeMapping:forDevice:", v5, v3, v6);

  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 56);
    v12 = 138413058;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "%@ from daemon update face for uuid %@ with config %@ (seqId=%@)", (uint8_t *)&v12, 0x2Au);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_updateFaceForUUID:withConfiguration:", *(_QWORD *)(a1 + 40), v7);

}

- (void)updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4 seqId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ must be non-nil"), CFSTR("UUID"));
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__NTKPersistentFaceCollection_updateFaceForUUID_withResourceDirectory_seqId_completion___block_invoke;
  v18[3] = &unk_1E6BD1818;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[NTKPersistentFaceCollection _performOrEnqueueUpdateOfType:forFaceUUID:block:](self, "_performOrEnqueueUpdateOfType:forFaceUUID:block:", 3, v17, v18);

}

uint64_t __88__NTKPersistentFaceCollection_updateFaceForUUID_withResourceDirectory_seqId_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v8 = 138413058;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "%@ from daemon update face for uuid %@ with resource directory %@ (seqId=%@)", (uint8_t *)&v8, 0x2Au);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_updateFaceForUUID:withResourceDirectory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)upgradeFaceInstanceDescriptor:(id)a3 forUUID:(id)a4 seqID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ must be non-nil"), CFSTR("UUID"));
    if (v8)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ must be non-nil"), CFSTR("FaceInstanceDescriptor"));
    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__NTKPersistentFaceCollection_upgradeFaceInstanceDescriptor_forUUID_seqID___block_invoke;
  v14[3] = &unk_1E6BD17F0;
  v14[4] = self;
  v15 = v8;
  v16 = v10;
  v17 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  -[NTKPersistentFaceCollection _performOrEnqueueUpdateOfType:forFaceUUID:block:](self, "_performOrEnqueueUpdateOfType:forFaceUUID:block:", 7, v11, v14);

}

void __75__NTKPersistentFaceCollection_upgradeFaceInstanceDescriptor_forUUID_seqID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v8 = 138412802;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "%@ from daemon upgrade face %@ (seqId=%@)", (uint8_t *)&v8, 0x20u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 48));
  v6 = (void *)MEMORY[0x1BCCA7FA8]();
  +[NTKFace faceWithInstanceDescriptor:](NTKFace, "faceWithInstanceDescriptor:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_upgradeFace:forUUID:", v7, *(_QWORD *)(a1 + 56));

  objc_autoreleasePoolPop(v6);
}

- (void)addFaceInstanceDescriptor:(id)a3 forUUID:(id)a4 seqId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ must be non-nil"), CFSTR("UUID"));
    if (v8)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ must be non-nil"), CFSTR("FaceInstanceDescriptor"));
    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__NTKPersistentFaceCollection_addFaceInstanceDescriptor_forUUID_seqId___block_invoke;
  v14[3] = &unk_1E6BD17F0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[NTKPersistentFaceCollection _performOrEnqueueUpdateOfType:forFaceUUID:block:](self, "_performOrEnqueueUpdateOfType:forFaceUUID:block:", 1, v12, v14);

}

void __71__NTKPersistentFaceCollection_addFaceInstanceDescriptor_forUUID_seqId___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v17 = 138413058;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v5;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "%@ from daemon add face %@ for uuid %@ (seqId=%@)", (uint8_t *)&v17, 0x2Au);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 56));
  v7 = (void *)MEMORY[0x1BCCA7FA8]();
  +[NTKFace faceWithInstanceDescriptor:](NTKFace, "faceWithInstanceDescriptor:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "facesByUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 48);
  if (v10)
  {
    objc_msgSend(v8, "resourceDirectory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_fromDaemon_updateFaceForUUID:withResourceDirectory:", v12, v13);

    v14 = *(void **)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v8, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_fromDaemon_updateFaceForUUID:withConfiguration:", v15, v16);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_addFace:forUUID:", v8, *(_QWORD *)(a1 + 48));
  }

  objc_autoreleasePoolPop(v7);
}

- (void)removeFaceForUUID:(id)a3 seqId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ must be non-nil"), CFSTR("UUID"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__NTKPersistentFaceCollection_removeFaceForUUID_seqId_completion___block_invoke;
  v14[3] = &unk_1E6BD1840;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[NTKPersistentFaceCollection _performOrEnqueueUpdateOfType:forFaceUUID:block:](self, "_performOrEnqueueUpdateOfType:forFaceUUID:block:", 4, v13, v14);

}

uint64_t __66__NTKPersistentFaceCollection_removeFaceForUUID_seqId_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "%@ from daemon remove face for uuid %@ (seqId=%@)", (uint8_t *)&v7, 0x20u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_removeFaceForUUID:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)flushCompleteForIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__NTKPersistentFaceCollection_flushCompleteForIdentifier___block_invoke;
  v6[3] = &unk_1E6BCD778;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __58__NTKPersistentFaceCollection_flushCompleteForIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFlushCompleteForIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)_fromDaemon_addFace:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *referenceOrderedUUIDs;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "resourceDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setResourceDirectoryByTransferringOwnership:", v8);

  -[NTKFaceCollection orderedUUIDs](self, "orderedUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceCollection _addFace:forUUID:atIndex:](self, "_addFace:forUUID:atIndex:", v7, v6, objc_msgSend(v9, "count"));

  referenceOrderedUUIDs = self->_referenceOrderedUUIDs;
  if (referenceOrderedUUIDs)
    -[NTKFaceCollection _updateOrderedUUIDsFromReference:andNotifyReordered:](self, "_updateOrderedUUIDsFromReference:andNotifyReordered:", referenceOrderedUUIDs, 0);
  -[NTKPersistentFaceCollection _fromDaemon_computeSelectedUUIDFromReferenceAndNotifySelected](self, "_fromDaemon_computeSelectedUUIDFromReferenceAndNotifySelected");
}

- (void)_fromDaemon_removeFaceForUUID:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NTKFaceCollection facesByUUID](self, "facesByUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NTKFaceCollection _removeFaceForUUID:](self, "_removeFaceForUUID:", v6);

}

- (void)_fromDaemon_updateFaceForUUID:(id)a3 withConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[NTKFaceCollection facesByUUID](self, "facesByUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v6);

    if ((v11 & 1) == 0)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __79__NTKPersistentFaceCollection__fromDaemon_updateFaceForUUID_withConfiguration___block_invoke;
      v12[3] = &unk_1E6BCD778;
      v13 = v9;
      v14 = v6;
      -[NTKPersistentFaceCollection _performSuppressingFaceObserverCallbacks:](self, "_performSuppressingFaceObserverCallbacks:", v12);

    }
  }

}

uint64_t __79__NTKPersistentFaceCollection__fromDaemon_updateFaceForUUID_withConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)_fromDaemon_updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[NTKFaceCollection facesByUUID](self, "facesByUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__NTKPersistentFaceCollection__fromDaemon_updateFaceForUUID_withResourceDirectory___block_invoke;
  v12[3] = &unk_1E6BCD778;
  v13 = v9;
  v14 = v6;
  v10 = v6;
  v11 = v9;
  -[NTKPersistentFaceCollection _performSuppressingFaceObserverCallbacks:](self, "_performSuppressingFaceObserverCallbacks:", v12);

}

uint64_t __83__NTKPersistentFaceCollection__fromDaemon_updateFaceForUUID_withResourceDirectory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setResourceDirectoryByTransferringOwnership:", *(_QWORD *)(a1 + 40));
}

- (void)_registerIfNeeded
{
  if (self->_registrationNeeded)
    -[NTKPersistentFaceCollection _register](self, "_register");
}

- (void)_handleConnectionInterrupted
{
  self->_registrationNeeded = 1;
}

- (void)_pruneEnqueuedUpdatesMadeObsoleteByNewUpdate:(id)a3
{
  id v4;
  id v5;
  unsigned int (**v6)(void *, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD aBlock[4];
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__NTKPersistentFaceCollection__pruneEnqueuedUpdatesMadeObsoleteByNewUpdate___block_invoke;
  aBlock[3] = &unk_1E6BD1868;
  v5 = v4;
  v18 = v5;
  v6 = (unsigned int (**)(void *, _QWORD))_Block_copy(aBlock);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)-[NSMutableArray copy](self->_updatesFromDaemonEnqueuedWhileSuspended, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v6[2](v6, v12))
          -[NSMutableArray removeObject:](self->_updatesFromDaemonEnqueuedWhileSuspended, "removeObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v9);
  }

}

uint64_t __76__NTKPersistentFaceCollection__pruneEnqueuedUpdatesMadeObsoleteByNewUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t result;
  uint64_t v11;
  _BOOL4 v12;

  v3 = a2;
  v4 = objc_msgSend(v3, "type");
  v5 = objc_msgSend(*(id *)(a1 + 32), "type");
  objc_msgSend(v3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = NTKEqualObjects(v6, v7);

  v9 = objc_msgSend(*(id *)(a1 + 32), "type");
  result = 1;
  if (v9 <= 7)
  {
    if (((1 << v9) & 0x8C) != 0)
    {
      if (v4 == v5)
        return v8;
      else
        return 0;
    }
    else
    {
      v11 = 1 << v9;
      v12 = ((1 << v9) & 0x60) == 0 || v4 == v5;
      if ((v11 & 0x12) != 0)
        return v8;
      else
        return v12;
    }
  }
  return result;
}

- (void)_performSuppressingFaceObserverCallbacks:(id)a3
{
  self->_suppressingFaceObserverCallbacks = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_suppressingFaceObserverCallbacks = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateSuspensionIdentifier, 0);
  objc_storeStrong((id *)&self->_updatesFromDaemonEnqueuedWhileSuspended, 0);
  objc_storeStrong((id *)&self->_referenceSelectedUUID, 0);
  objc_storeStrong((id *)&self->_referenceOrderedUUIDs, 0);
  objc_storeStrong((id *)&self->_seqId, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "xpc connection invalidated. This is unrecoverable.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

@end
