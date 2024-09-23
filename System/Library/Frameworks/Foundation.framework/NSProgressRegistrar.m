@implementation NSProgressRegistrar

uint64_t __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addPublisher:forID:withValues:isOld:", a2, objc_msgSend(a2, "publisherID"), objc_msgSend(a2, "values"), 1);
}

uint64_t __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke(uint64_t a1, int a2)
{
  NSProgressSubscriberProxy *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  _QWORD v17[12];
  _BYTE buf[24];
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
    if (a2)
    {
      v4 = (NSProgressSubscriberProxy *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
      if (!v4)
      {
        v4 = -[NSProgressSubscriberProxy initWithForwarder:onConnection:subscriberID:appBundleID:]([NSProgressSubscriberProxy alloc], "initWithForwarder:onConnection:subscriberID:appBundleID:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      }
      v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "descendantForFileURL:", *(_QWORD *)(a1 + 56));
      v6 = objc_msgSend(v5, "itemProvider");
      v7 = MEMORY[0x1E0C809B0];
      if (v6)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3052000000;
        v19 = __Block_byref_object_copy_;
        v20 = __Block_byref_object_dispose_;
        v21 = 0;
        v8 = dispatch_semaphore_create(0);
        v9 = (void *)objc_msgSend(v5, "itemProvider");
        v10 = *(_QWORD *)(a1 + 56);
        v17[5] = v7;
        v17[6] = 3221225472;
        v17[7] = __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke_135;
        v17[8] = &unk_1E0F4C790;
        v17[10] = v8;
        v17[11] = buf;
        v17[9] = v10;
        objc_msgSend(v9, "provideLogicalURLForURL:completionHandler:");
        dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(v8);
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "descendantForFileURL:");

          if ((void *)v11 != v5)
          {
            objc_msgSend(v5, "removeSelfIfUseless");
            v5 = (void *)v11;
          }
        }
        _Block_object_dispose(buf, 8);
      }
      if (v5)
      {
        v17[0] = v7;
        v17[1] = 3221225472;
        v17[2] = __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke_2;
        v17[3] = &unk_1E0F4C7B8;
        v17[4] = v4;
        objc_msgSend(v5, "forEachProgressPublisherOfItemOrContainedItemPerformProcedure:", v17);
        -[NSProgressSubscriberProxy setItemLocation:](v4, "setItemLocation:", v5);
      }
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    }
    else
    {
      v13 = _NSOSLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = *(_QWORD *)(a1 + 56);
        v15 = *(_QWORD *)(a1 + 64);
        v16 = *(void (**)(uint64_t, uint64_t))(a1 + 40);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        v19 = v16;
        _os_log_error_impl(&dword_1817D9000, v13, OS_LOG_TYPE_ERROR, "sandboxing denied subscription to progress on URL %@ (bundle id %@, %@)", buf, 0x20u);
      }

      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    }
  }
  else
  {

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }
}

uint64_t __66__NSProgressRegistrar_observePublisherUserInfoForID_value_forKey___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "observePublisherUserInfoForID:value:forKey:", a1[4], a1[5], a1[6]);
}

uint64_t __45__NSProgressRegistrar_removeSubscriberForID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appWithBundleID:didAcknowledgeWithSuccess:", *(_QWORD *)(a1 + 32), 0);
}

- (void)removeSubscriberForID:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_subscribersByID, "objectForKey:", a3);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "appBundleID");
    if (v7)
    {
      v8 = v7;
      v9 = (void *)objc_msgSend(v6, "itemLocation");
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __45__NSProgressRegistrar_removeSubscriberForID___block_invoke;
      v10[3] = &unk_1E0F4C7B8;
      v10[4] = v8;
      objc_msgSend(v9, "forEachProgressPublisherOfItemOrContainedItemPerformProcedure:", v10);
    }
    objc_msgSend(v6, "setItemLocation:", 0);
    -[NSMutableDictionary removeObjectForKey:](self->_subscribersByID, "removeObjectForKey:", a3);
    -[NSMutableDictionary removeObjectForKey:](self->_subscriberTransactionsByID, "removeObjectForKey:", a3);
  }
  -[NSMutableSet removeObject:](self->_pendingFileSubscriberIDs, "removeObject:", a3);
}

- (void)observePublisherUserInfoForID:(id)a3 value:(id)a4 forKey:(id)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *subscribersByID;
  _QWORD v14[7];
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v9 = (void *)-[NSMutableDictionary objectForKey:](self->_publishersByID, "objectForKey:", a3);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "observeUserInfoValue:forKey:", a4, a5);
    v11 = objc_msgSend(v10, "category");
    v12 = MEMORY[0x1E0C809B0];
    if (v11)
    {
      subscribersByID = self->_subscribersByID;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __66__NSProgressRegistrar_observePublisherUserInfoForID_value_forKey___block_invoke;
      v15[3] = &unk_1E0F4C6C8;
      v15[4] = v11;
      v15[5] = a3;
      v15[6] = a4;
      v15[7] = a5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subscribersByID, "enumerateKeysAndObjectsUsingBlock:", v15);
    }
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __66__NSProgressRegistrar_observePublisherUserInfoForID_value_forKey___block_invoke_2;
    v14[3] = &unk_1E0F4C6F0;
    v14[4] = a3;
    v14[5] = a4;
    v14[6] = a5;
    objc_msgSend((id)objc_msgSend(v10, "itemLocation"), "forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:", v14);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "setExportedObject:", self);
  objc_msgSend(a4, "setExportedInterface:", +[NSProgress _registrarInterface](NSProgress, "_registrarInterface"));
  objc_msgSend(a4, "_setQueue:", self->_queue);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke;
  v7[3] = &unk_1E0F4C650;
  v7[4] = self;
  v7[5] = a4;
  objc_msgSend(a4, "setInvalidationHandler:", v7);
  objc_msgSend(a4, "resume");
  return 1;
}

- (void)addSubscriber:(id)a3 forID:(id)a4 appBundleID:(id)a5 fileURL:(id)a6 completionHandler:(id)a7
{
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSXPCConnection *v16;
  NSXPCConnection *v17;
  uint64_t v18;
  _QWORD v19[12];
  _OWORD v20[2];
  uint8_t buf[4];
  NSProgressRegistrar *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v13 = _NSProgressIPCDebugLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218755;
      v22 = self;
      v23 = 2048;
      v24 = a3;
      v25 = 2114;
      v26 = a4;
      v27 = 2113;
      v28 = a6;
      _os_log_debug_impl(&dword_1817D9000, v15, OS_LOG_TYPE_DEBUG, "<NSProgressRegistrar %p> Add subscriber %p forID: %{public}@ for URL %{private}@", buf, 0x2Au);
    }
  }
  v16 = +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection", v14);
  if (a6)
  {
    v17 = v16;
    -[NSMutableSet addObject:](self->_pendingFileSubscriberIDs, "addObject:", a4);
    -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Sub: %@ (%d bundle: %@ URL: %@)"), a4, -[NSXPCConnection processIdentifier](v17, "processIdentifier"), a5, a6), "UTF8String");
    v18 = os_transaction_create();
    if (v17)
      -[NSXPCConnection auditToken](v17, "auditToken");
    else
      memset(v20, 0, sizeof(v20));
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke;
    v19[3] = &unk_1E0F4C7E0;
    v19[4] = self;
    v19[5] = a4;
    v19[6] = v18;
    v19[7] = a6;
    v19[8] = a5;
    v19[9] = a3;
    v19[10] = v17;
    v19[11] = a7;
    -[NSProgressRegistrar _getRemoteProcessWithAuditToken:canReadItemAtURL:completionHandler:](self, "_getRemoteProcessWithAuditToken:canReadItemAtURL:completionHandler:", v20, a6, v19);
  }
  else
  {
    (*((void (**)(id))a7 + 2))(a7);
  }
}

- (void)_getRemoteProcessWithAuditToken:(id *)a3 canReadItemAtURL:(id)a4 completionHandler:(id)a5
{
  int v9;
  __int128 v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  __int128 v16;
  _BOOL4 v17;
  void *i;
  uint64_t v19;
  __int128 v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD v32[7];
  __int128 v33;
  __int128 v34;
  int v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0C806B0];
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v10 = *(_OWORD *)&a3->var0[4];
  v39 = *(_OWORD *)a3->var0;
  v40 = v10;
  v11 = sandbox_check_by_audit_token();
  v12 = objc_msgSend((id)objc_msgSend(a4, "lastPathComponent"), "isEqualToString:", CFSTR("f13c05f5-944f-4466-bc09-c73815293ab8"));
  v13 = v12;
  if (v11)
    v14 = 1;
  else
    v14 = v12;
  if (v14 != 1)
  {
    *((_BYTE *)v29 + 24) = 1;
LABEL_25:
    if (*((_BYTE *)v29 + 24))
      v26 = 1;
    else
      v26 = v13;
    (*((void (**)(id, uint64_t))a5 + 2))(a5, v26);
    goto LABEL_29;
  }
  *(_QWORD *)&v39 = 0;
  *((_QWORD *)&v39 + 1) = &v39;
  v40 = 0x2020000000uLL;
  *((_QWORD *)&v40 + 1) = objc_msgSend(a4, "fileSystemRepresentation");
  v15 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 24);
  if (v15)
  {
    v16 = *(_OWORD *)&a3->var0[4];
    v37 = *(_OWORD *)a3->var0;
    v38 = v16;
    v27 = v15;
    v17 = sandbox_check_by_audit_token() == 0;
    *((_BYTE *)v29 + 24) = v17;
    if (v17)
      goto LABEL_16;
  }
  else if (*((_BYTE *)v29 + 24))
  {
    goto LABEL_16;
  }
  for (i = (void *)objc_msgSend(a4, "URLByDeletingLastPathComponent", v27);
        i;
        i = (void *)objc_msgSend(i, "URLByDeletingLastPathComponent"))
  {
    if ((objc_msgSend(i, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
    {
      v19 = objc_msgSend(i, "fileSystemRepresentation");
      *(_QWORD *)(*((_QWORD *)&v39 + 1) + 24) = v19;
      if (v19)
      {
        v20 = *(_OWORD *)&a3->var0[4];
        v37 = *(_OWORD *)a3->var0;
        v38 = v20;
        v27 = v19;
        *((_BYTE *)v29 + 24) = sandbox_check_by_audit_token() == 0;
      }
      break;
    }
  }
LABEL_16:
  if (*((_BYTE *)v29 + 24))
    v21 = v13;
  else
    v21 = 1;
  if (v21 != 1)
  {
    _Block_object_dispose(&v39, 8);
    goto LABEL_25;
  }
  v22 = -[NSFileAccessNode descendantForFileURL:](self->_rootFileAccessNode, "descendantForFileURL:", a4);
  v23 = (void *)objc_msgSend(v22, "itemProvider");
  v24 = v23;
  if (v23)
  {
    v32[1] = 3221225472;
    v25 = *(_OWORD *)&a3->var0[4];
    v33 = *(_OWORD *)a3->var0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[2] = __90__NSProgressRegistrar__getRemoteProcessWithAuditToken_canReadItemAtURL_completionHandler___block_invoke;
    v32[3] = &unk_1E0F4C768;
    v32[5] = &v39;
    v32[6] = &v28;
    v34 = v25;
    v35 = v9;
    v32[4] = a5;
    v36 = v13;
    objc_msgSend(v23, "providePhysicalURLForURL:completionHandler:", a4, v32);
  }
  objc_msgSend(v22, "removeSelfIfUseless", v27);
  _Block_object_dispose(&v39, 8);
  if (!v24)
    goto LABEL_25;
LABEL_29:
  _Block_object_dispose(&v28, 8);
}

- (NSProgressRegistrar)initWithQueue:(id)a3 rootFileAccessNode:(id)a4
{
  NSProgressRegistrar *v6;
  NSProgressRegistrar *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSProgressRegistrar;
  v6 = -[NSProgressRegistrar init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v7->_publishersByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7->_publisherTransactionsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7->_subscribersByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7->_subscriberTransactionsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7->_pendingFileSubscriberIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7->_rootFileAccessNode = (NSFileAccessNode *)a4;
  }
  return v7;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  v4.receiver = self;
  v4.super_class = (Class)NSProgressRegistrar;
  -[NSProgressRegistrar dealloc](&v4, sel_dealloc);
}

uint64_t __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v18[2] = __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke_2;
  v18[3] = &unk_1E0F4C600;
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[4] = v2;
  v5 = (void *)objc_msgSend(v3, "keysOfEntriesPassingTest:", v18);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke_3;
  v17[3] = &unk_1E0F4C628;
  v17[4] = v6;
  v8 = (void *)objc_msgSend(v7, "keysOfEntriesPassingTest:", v17);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "removeSubscriberForID:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    }
    while (v10);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (result)
  {
    v14 = result;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 32), "removePublisherForID:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
      v14 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isFromConnection:", *(_QWORD *)(a1 + 32));
}

uint64_t __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isFromConnection:", *(_QWORD *)(a1 + 32));
}

- (void)addPublisher:(id)a3 forID:(id)a4 acknowledgementAppBundleIDs:(id)a5 category:(id)a6 fileURL:(id)a7 initialValues:(id)a8 completionHandler:(id)a9
{
  NSObject *v16;
  NSObject *v17;
  NSXPCConnection *v18;
  NSProgressPublisherProxy *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSMutableDictionary *subscribersByID;
  id v24;
  id v25;
  _QWORD v26[8];
  _QWORD v27[9];
  uint8_t buf[4];
  NSProgressRegistrar *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v16 = _NSProgressIPCDebugLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218755;
      v29 = self;
      v30 = 2114;
      v31 = a4;
      v32 = 2113;
      v33 = a7;
      v34 = 2114;
      v35 = a6;
      _os_log_debug_impl(&dword_1817D9000, v17, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriberProxy %p> Add publisher ID %{public}@ for URL %{private}@ in category %{public}@", buf, 0x2Au);
    }
  }
  v18 = +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection");
  v19 = (NSProgressPublisherProxy *)-[NSMutableDictionary objectForKey:](self->_publishersByID, "objectForKey:", a4);
  if (!v19)
  {
    v19 = -[NSProgressPublisherProxy initWithForwarder:onConnection:publisherID:values:]([NSProgressPublisherProxy alloc], "initWithForwarder:onConnection:publisherID:values:", a3, v18, a4, a8);
    -[NSMutableDictionary setObject:forKey:](self->_publishersByID, "setObject:forKey:", v19, a4);

    -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Pub: %@ (%d cat: %@ URL: %@)"), a4, -[NSXPCConnection processIdentifier](v18, "processIdentifier"), a6, a7), "UTF8String");
    v20 = (void *)os_transaction_create();
    -[NSMutableDictionary setObject:forKey:](self->_publisherTransactionsByID, "setObject:forKey:", v20, a4);

  }
  v21 = (void *)objc_msgSend(a5, "mutableCopy");
  v22 = MEMORY[0x1E0C809B0];
  if (a6)
  {
    subscribersByID = self->_subscribersByID;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __119__NSProgressRegistrar_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler___block_invoke;
    v27[3] = &unk_1E0F4C678;
    v27[4] = a6;
    v27[5] = v19;
    v27[6] = a4;
    v27[7] = a8;
    v27[8] = v21;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subscribersByID, "enumerateKeysAndObjectsUsingBlock:", v27);
    -[NSProgressPublisherProxy setCategory:](v19, "setCategory:", a6);
  }
  if (a7)
  {
    v24 = -[NSFileAccessNode descendantForFileURL:](self->_rootFileAccessNode, "descendantForFileURL:", a7);
    if (v24)
    {
      v25 = v24;
      v26[0] = v22;
      v26[1] = 3221225472;
      v26[2] = __119__NSProgressRegistrar_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler___block_invoke_2;
      v26[3] = &unk_1E0F4C6A0;
      v26[4] = v19;
      v26[5] = a4;
      v26[6] = a8;
      v26[7] = v21;
      objc_msgSend(v24, "forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:", v26);
      -[NSProgressPublisherProxy setItemLocation:](v19, "setItemLocation:", v25);
    }
  }
  (*((void (**)(id, void *))a9 + 2))(a9, v21);

}

uint64_t __119__NSProgressRegistrar_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    objc_msgSend(a3, "addPublisher:forID:withValues:isOld:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
    result = objc_msgSend((id)objc_msgSend(a3, "appBundleID"), "lowercaseString");
    if (result)
      return objc_msgSend(*(id *)(a1 + 64), "removeObject:", result);
  }
  return result;
}

uint64_t __119__NSProgressRegistrar_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_msgSend(a2, "addPublisher:forID:withValues:isOld:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  result = objc_msgSend((id)objc_msgSend(a2, "appBundleID"), "lowercaseString");
  if (result)
    return objc_msgSend(*(id *)(a1 + 56), "removeObject:", result);
  return result;
}

uint64_t __66__NSProgressRegistrar_observePublisherUserInfoForID_value_forKey___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", a1[4]);
  if ((_DWORD)result)
    return objc_msgSend(a3, "observePublisherUserInfoForID:value:forKey:", a1[5], a1[6], a1[7]);
  return result;
}

- (void)observePublisherForID:(id)a3 values:(id)a4 forKeys:(id)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *subscribersByID;
  _QWORD v14[7];
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v9 = (void *)-[NSMutableDictionary objectForKey:](self->_publishersByID, "objectForKey:", a3);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "observeValues:forKeys:", a4, a5);
    v11 = objc_msgSend(v10, "category");
    v12 = MEMORY[0x1E0C809B0];
    if (v11)
    {
      subscribersByID = self->_subscribersByID;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __60__NSProgressRegistrar_observePublisherForID_values_forKeys___block_invoke;
      v15[3] = &unk_1E0F4C6C8;
      v15[4] = v11;
      v15[5] = a3;
      v15[6] = a4;
      v15[7] = a5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subscribersByID, "enumerateKeysAndObjectsUsingBlock:", v15);
    }
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __60__NSProgressRegistrar_observePublisherForID_values_forKeys___block_invoke_2;
    v14[3] = &unk_1E0F4C6F0;
    v14[4] = a3;
    v14[5] = a4;
    v14[6] = a5;
    objc_msgSend((id)objc_msgSend(v10, "itemLocation"), "forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:", v14);
  }
}

uint64_t __60__NSProgressRegistrar_observePublisherForID_values_forKeys___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", a1[4]);
  if ((_DWORD)result)
    return objc_msgSend(a3, "observePublisherForID:values:forKeys:", a1[5], a1[6], a1[7]);
  return result;
}

uint64_t __60__NSProgressRegistrar_observePublisherForID_values_forKeys___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "observePublisherForID:values:forKeys:", a1[4], a1[5], a1[6]);
}

- (void)removePublisherForID:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *subscribersByID;
  _QWORD v11[6];
  uint8_t buf[4];
  NSProgressRegistrar *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = _NSProgressIPCDebugLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v13 = self;
      v14 = 2114;
      v15 = a3;
      _os_log_debug_impl(&dword_1817D9000, v6, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriberProxy %p> Remove publisher ID %{public}@", buf, 0x16u);
    }
  }
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->_publishersByID, "objectForKey:", a3);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "category");
    if (v9)
    {
      subscribersByID = self->_subscribersByID;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __44__NSProgressRegistrar_removePublisherForID___block_invoke;
      v11[3] = &unk_1E0F4C718;
      v11[4] = v9;
      v11[5] = a3;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subscribersByID, "enumerateKeysAndObjectsUsingBlock:", v11);
    }
    objc_msgSend(v8, "setItemLocation:", 0);
    -[NSMutableDictionary removeObjectForKey:](self->_publishersByID, "removeObjectForKey:", a3);
    -[NSMutableDictionary removeObjectForKey:](self->_publisherTransactionsByID, "removeObjectForKey:", a3);
  }
}

uint64_t __44__NSProgressRegistrar_removePublisherForID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(a3, "removePublisherForID:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)addSubscriber:(id)a3 forID:(id)a4 appBundleID:(id)a5 category:(id)a6 completionHandler:(id)a7
{
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSXPCConnection *v16;
  NSXPCConnection *v17;
  NSObject *v18;
  NSProgressSubscriberProxy *v19;
  void *v20;
  NSMutableDictionary *publishersByID;
  _QWORD v22[6];
  _BYTE buf[32];
  uint8_t v24[32];
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v13 = _NSProgressIPCDebugLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v24 = 134218754;
      *(_QWORD *)&v24[4] = self;
      *(_WORD *)&v24[12] = 2048;
      *(_QWORD *)&v24[14] = a3;
      *(_WORD *)&v24[22] = 2114;
      *(_QWORD *)&v24[24] = a4;
      v25 = 2114;
      v26 = a6;
      _os_log_debug_impl(&dword_1817D9000, v15, OS_LOG_TYPE_DEBUG, "<NSProgressRegistrar %p> Add subscriber %p forID: %{public}@ in category %{public}@", v24, 0x2Au);
    }
  }
  v16 = +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection", v14);
  v17 = v16;
  memset(v24, 0, sizeof(v24));
  if (v16)
    -[NSXPCConnection auditToken](v16, "auditToken");
  *(_OWORD *)buf = *(_OWORD *)v24;
  *(_OWORD *)&buf[16] = *(_OWORD *)&v24[16];
  if (sandbox_check_by_audit_token())
  {
    v18 = _NSOSLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = a6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a5;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = a4;
      _os_log_error_impl(&dword_1817D9000, v18, OS_LOG_TYPE_ERROR, "sandboxing denied subscription to progress on category %@ (bundle id %@, %@)", buf, 0x20u);
    }
  }
  v19 = (NSProgressSubscriberProxy *)-[NSMutableDictionary objectForKey:](self->_subscribersByID, "objectForKey:", a4);
  if (!v19)
  {
    v19 = -[NSProgressSubscriberProxy initWithForwarder:onConnection:subscriberID:appBundleID:]([NSProgressSubscriberProxy alloc], "initWithForwarder:onConnection:subscriberID:appBundleID:", a3, v17, a4, a5);
    -[NSProgressSubscriberProxy setCategory:](v19, "setCategory:", a6);
    -[NSMutableDictionary setObject:forKey:](self->_subscribersByID, "setObject:forKey:", v19, a4);

    -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Sub: %@ (%d bundle: %@ cat: %@)"), a4, -[NSXPCConnection processIdentifier](v17, "processIdentifier"), a5, a6), "UTF8String");
    v20 = (void *)os_transaction_create();
    -[NSMutableDictionary setObject:forKey:](self->_subscriberTransactionsByID, "setObject:forKey:", v20, a4);

  }
  publishersByID = self->_publishersByID;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__NSProgressRegistrar_addSubscriber_forID_appBundleID_category_completionHandler___block_invoke;
  v22[3] = &unk_1E0F4C740;
  v22[4] = a6;
  v22[5] = v19;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](publishersByID, "enumerateKeysAndObjectsUsingBlock:", v22);
  (*((void (**)(id))a7 + 2))(a7);
}

uint64_t __82__NSProgressRegistrar_addSubscriber_forID_appBundleID_category_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addPublisher:forID:withValues:isOld:", a3, objc_msgSend(a3, "publisherID"), objc_msgSend(a3, "values"), 1);
  return result;
}

uint64_t __90__NSProgressRegistrar__getRemoteProcessWithAuditToken_canReadItemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v3;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "fileSystemRepresentation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sandbox_check_by_audit_token() == 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    v3 = 1;
  else
    v3 = *(_BYTE *)(a1 + 92) != 0;
  return (*(uint64_t (**)(_QWORD, _BOOL8))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3);
}

intptr_t __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke_135(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "logicalURL") != *(_QWORD *)(a1 + 32))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = (id)objc_msgSend(a2, "logicalURL");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end
