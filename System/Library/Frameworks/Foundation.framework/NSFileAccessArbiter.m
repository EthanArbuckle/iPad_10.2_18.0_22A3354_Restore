@implementation NSFileAccessArbiter

+ (void)ensureProvidersIfNecessaryForClaim:(id)a3 user:(unsigned int)a4 atLocations:(id)a5 queue:(id)a6 thenContinue:(id)a7
{
  uint64_t v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[8];
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v10 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)a6);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v15)
        objc_enumerationMutation(a5);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "itemProvider"))
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
        if (v14)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
    if (_MergedGlobals_19_2)
      goto LABEL_11;
    (*((void (**)(id))a7 + 2))(a7);
  }
  else
  {
LABEL_11:
    objc_msgSend(a3, "blockClaimerForReason:", CFSTR("Preparing file providers"));
    v17 = objc_msgSend(a3, "allURLs");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __108__NSFileAccessArbiter_FileProvider__ensureProvidersIfNecessaryForClaim_user_atLocations_queue_thenContinue___block_invoke;
    v18[3] = &unk_1E0F541D8;
    v18[4] = a6;
    v18[5] = a3;
    v18[6] = CFSTR("Preparing file providers");
    v18[7] = a7;
    objc_msgSend(a1, "_wakeUpFileProviderWithUID:urls:queue:thenContinue:", v10, v17, a6, v18);
  }
}

+ (void)_wakeUpFileProviderWithUID:(unsigned int)a3 urls:(id)a4 queue:(id)a5 thenContinue:(id)a6
{
  uint64_t v9;
  _BOOL4 v10;
  NSObject *v11;
  _QWORD v12[6];
  int v13;
  _QWORD block[11];
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v9 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)a5);
  if (_NSFCIPPB)
  {
    block[5] = MEMORY[0x1E0C809B0];
    block[6] = 3221225472;
    block[7] = __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke;
    block[8] = &unk_1E0F54140;
    block[9] = a5;
    block[10] = a6;
    (*(void (**)(void))(_NSFCIPPB + 16))();
  }
  else if (_NSFCIP)
  {
    (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 1, 0);
  }
  else
  {
    if (qword_1ECD09448 != -1)
      dispatch_once(&qword_1ECD09448, &__block_literal_global_270);
    v10 = -[NSFileManager _processCanAccessUbiquityIdentityToken](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "_processCanAccessUbiquityIdentityToken");
    if ((_DWORD)v9 != -2 && (_DWORD)v9 && v10 && off_1ECD09440)
    {
      v11 = _NSFCProviderLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v16 = v9;
        _os_log_impl(&dword_1817D9000, v11, OS_LOG_TYPE_INFO, "Waking up fileproviderd (%d) to prepare providers", buf, 8u);
      }
      ++_MergedGlobals_19_2;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_274;
      v12[3] = &unk_1E0F541B0;
      v13 = v9;
      v12[4] = a5;
      v12[5] = a6;
      off_1ECD09440(v9, a4, v12);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_4;
      block[3] = &unk_1E0F4E870;
      block[4] = a6;
      dispatch_async((dispatch_queue_t)a5, block);
    }
  }
}

- (void)revokeAccessClaimForID:(id)a3
{
  -[NSFileAccessArbiter _revokeAccessClaimForID:fromLocal:](self, "_revokeAccessClaimForID:fromLocal:", a3, 0);
}

- (void)_revokeAccessClaimForID:(id)a3 fromLocal:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  NSXPCConnection *superarbitrationServer;
  NSObject *v10;
  uint8_t v11[8];
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->_accessClaimsByID, "objectForKey:");
  if (v7)
  {
    v8 = v7;
    if (!v4 || (objc_msgSend(v7, "cameFromSuperarbiter") & 1) == 0)
    {
      objc_msgSend(v8, "revoked");
      -[NSMutableDictionary removeObjectForKey:](self->_accessClaimsByID, "removeObjectForKey:", a3);
      -[NSMutableDictionary removeObjectForKey:](self->_subarbitrationClaimsByID, "removeObjectForKey:", a3);
      -[NSMutableDictionary removeObjectForKey:](self->_accessClaimTransactionsByID, "removeObjectForKey:", a3);
      return;
    }
  }
  else if (!v4)
  {
    return;
  }
  superarbitrationServer = self->_superarbitrationServer;
  if (superarbitrationServer)
  {
    objc_msgSend(-[NSXPCConnection remoteObjectProxy](superarbitrationServer, "remoteObjectProxy"), "revokeAccessClaimForID:", a3);
  }
  else
  {
    v10 = _NSFCClaimsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl(&dword_1817D9000, v10, OS_LOG_TYPE_FAULT, "A subarbiter is trying to forward a claim revocation to its superarbiter, but the connection is already gone, which is a surprise.", v11, 2u);
    }
  }
}

- (void)_grantAccessClaim:(id)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "claimID");
  v6 = atomic_load(&_NSFCSubarbitrationCount);
  if (v6 < 1
    || (v11 = atomic_load(_NSFCDisableLogSuppression), (v11 & 1) != 0)
    || (v12 = atomic_load(&_NSFCSubarbitratedClaimCount), v12 <= 99))
  {
    v7 = _NSFCClaimsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEFAULT, "Received claim %{public}@", buf, 0xCu);
    }
  }
  if (self->_superarbitrationServer)
    v8 = objc_msgSend(a3, "cameFromSuperarbiter") ^ 1;
  else
    v8 = 0;
  if (objc_msgSend(a3, "evaluateSelfWithRootNode:checkSubarbitrability:", self->_rootNode, v8))
  {
    -[NSMutableDictionary setObject:forKey:](self->_accessClaimsByID, "setObject:forKey:", a3, v5);
    objc_msgSend(a3, "startObservingClientState");
    -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Claim: %@ (%d)"), objc_msgSend(v5, "description"), -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier")), "UTF8String");
    v9 = (void *)os_transaction_create();
    -[NSMutableDictionary setObject:forKey:](self->_accessClaimTransactionsByID, "setObject:forKey:", v9, v5);

  }
  else
  {
    v10 = _NSFCClaimsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1817D9000, v10, OS_LOG_TYPE_INFO, "Claim %{public}@ forwarded to superarbiter", buf, 0xCu);
    }
    objc_msgSend(a3, "forwardUsingConnection:crashHandler:", self->_superarbitrationServer, &__block_literal_global_25_0);
  }
  objc_msgSend(a3, "unblock");
}

- (void)grantAccessClaim:(id)a3 withReply:(id)a4
{
  NSXPCConnection *v7;
  NSXPCConnection *superarbitrationServer;
  NSObject *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection");
    objc_msgSend(a3, "acceptClaimFromClient:arbiterQueue:grantHandler:", v7, self->_queue, a4);
    superarbitrationServer = self->_superarbitrationServer;
    if (superarbitrationServer)
    {
      if (v7 == superarbitrationServer)
      {
        objc_msgSend(a3, "setCameFromSuperarbiter");
      }
      else
      {
        v9 = _NSFCClaimsLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          v11 = 138543362;
          v12 = objc_msgSend(a3, "claimID");
          _os_log_fault_impl(&dword_1817D9000, v9, OS_LOG_TYPE_FAULT, "A subarbiter is being asked to grant a claim (%{public}@) by something other than its superarbiter, which is a surprise.", (uint8_t *)&v11, 0xCu);
        }
      }
    }
    -[NSFileAccessArbiter _grantAccessClaim:](self, "_grantAccessClaim:", a3);
  }
  else
  {
    v10 = _NSFCClaimsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v11) = 0;
      _os_log_fault_impl(&dword_1817D9000, v10, OS_LOG_TYPE_FAULT, "Received a request to grant an access claim, but received no access claim instance.", (uint8_t *)&v11, 2u);
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "setExportedObject:", self);
  objc_msgSend(a4, "setExportedInterface:", +[NSFileCoordinator _fileAccessArbiterInterface](NSFileCoordinator, "_fileAccessArbiterInterface"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__NSFileAccessArbiter_listener_shouldAcceptNewConnection___block_invoke;
  v7[3] = &unk_1E0F4C650;
  v7[4] = self;
  v7[5] = a4;
  objc_msgSend(a4, "setInvalidationHandler:", v7);
  objc_msgSend(a4, "_setQueue:", self->_queue);
  objc_msgSend(a4, "resume");
  return 1;
}

- (void)addPresenter:(id)a3 withID:(id)a4 fileURL:(id)a5 lastPresentedItemEventIdentifier:(id)a6 ubiquityAttributes:(id)a7 options:(unint64_t)a8 responses:(unint64_t)a9
{
  NSFilePresenterProxy *v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v14 = -[NSFilePresenterProxy initWithClient:remotePresenter:reactorID:]([NSFilePresenterProxy alloc], "initWithClient:remotePresenter:reactorID:", +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), a3, a4);
  -[NSFilePresenterProxy setUsesMainThreadDuringReliquishing:](v14, "setUsesMainThreadDuringReliquishing:", (a8 >> 1) & 1);
  -[NSFilePresenterProxy setFilePresenterResponses:](v14, "setFilePresenterResponses:", a9);
  -[NSFilePresenterProxy setObservedUbiquityAttributes:](v14, "setObservedUbiquityAttributes:", a7);
  -[NSFileReactorProxy setEffectiveUserIdentifier:](v14, "setEffectiveUserIdentifier:", -[NSXPCConnection effectiveUserIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "effectiveUserIdentifier"));
  if (!a5 || self->_isSubarbiter || -[NSFilePresenterProxy allowedForURL:](v14, "allowedForURL:", a5))
  {
    if (-[NSFileAccessArbiter _addPresenter:ofItemAtURL:watchingFile:withLastEventID:](self, "_addPresenter:ofItemAtURL:watchingFile:withLastEventID:", v14, a5, a8 & 1, a6))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __121__NSFileAccessArbiter_addPresenter_withID_fileURL_lastPresentedItemEventIdentifier_ubiquityAttributes_options_responses___block_invoke;
      v15[3] = &unk_1E0F53E20;
      v15[4] = v14;
      -[NSFileAccessArbiter _enumerateSubarbitersUsingBlock:](self, "_enumerateSubarbitersUsingBlock:", v15);
    }
  }

}

- (void)_enumerateSubarbitersUsingBlock:(id)a3
{
  NSMutableDictionary *subarbitrationClaimsByID;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  subarbitrationClaimsByID = self->_subarbitrationClaimsByID;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__NSFileAccessArbiter__enumerateSubarbitersUsingBlock___block_invoke;
  v4[3] = &unk_1E0F53CB8;
  v4[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subarbitrationClaimsByID, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (BOOL)_addPresenter:(id)a3 ofItemAtURL:(id)a4 watchingFile:(BOOL)a5 withLastEventID:(id)a6
{
  _BOOL4 v7;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  OS_dispatch_queue *queue;
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v7 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(a3, "reactorID");
  v12 = -[NSMutableDictionary objectForKey:](self->_reactorsByID, "objectForKey:", v11);
  if (v12)
  {
    if (!self->_isSubarbiter)
    {
      v13 = _NSFCPresenterLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v11;
        _os_log_impl(&dword_1817D9000, v13, OS_LOG_TYPE_DEFAULT, "Ignored new presenter %{public}@, because one with the same ID already exists", buf, 0xCu);
      }
    }
  }
  else
  {
    if (!self->_isSubarbiter)
    {
      v14 = _NSFCPresenterLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v11;
        _os_log_impl(&dword_1817D9000, v14, OS_LOG_TYPE_DEFAULT, "Added presenter %{public}@", buf, 0xCu);
      }
    }
    -[NSMutableDictionary setObject:forKey:](self->_reactorsByID, "setObject:forKey:", a3, v11);
    if (self->_isSubarbiter)
      objc_msgSend(a3, "setInSubarbiter:", 1);
    -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Presenter: %@ (%d)"), objc_msgSend(v11, "description"), -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier")), "UTF8String");
    v15 = (void *)os_transaction_create();
    -[NSMutableDictionary setObject:forKey:](self->_reactorTransactionsByID, "setObject:forKey:", v15, v11);

    if (a4)
    {
      v16 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", a4);
      if (v16)
        objc_msgSend(a3, "setItemLocation:", v16);
    }
    if (v7 && (objc_msgSend(a3, "inSubarbiter") & 1) == 0)
    {
      queue = self->_queue;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __78__NSFileAccessArbiter__addPresenter_ofItemAtURL_watchingFile_withLastEventID___block_invoke;
      v19[3] = &unk_1E0F53C68;
      v19[4] = self;
      objc_msgSend(a3, "startWatchingWithQueue:lastEventID:unannouncedMoveHandler:", queue, a6, v19);
    }
    if (!self->_isSubarbiter)
      objc_msgSend(a3, "startObservingApplicationStateWithQueue:", self->_queue);
  }
  return v12 == 0;
}

uint64_t __108__NSFileAccessArbiter_FileProvider__ensureProvidersIfNecessaryForClaim_user_atLocations_queue_thenContinue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (a3)
    objc_msgSend(*(id *)(a1 + 40), "whenDevaluedPerformProcedure:", a3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "unblockClaimerForReason:", *(_QWORD *)(a1 + 48));
}

- (NSFileAccessArbiter)initWithQueue:(id)a3 isSubarbiter:(BOOL)a4 listener:(id)a5
{
  NSFileAccessArbiter *v8;
  NSFileAccessArbiter *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)NSFileAccessArbiter;
  v8 = -[NSFileAccessArbiter init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v9->_listenerConnection = (NSXPCListener *)a5;
    v9->_isSubarbiter = a4;
    v9->_accessClaimsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9->_accessClaimTransactionsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9->_subarbitrationClaimsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9->_reactorsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9->_reactorTransactionsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9->_kernelMaterializationClaimCancellers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9->_kernelMaterializationClaimTransactions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9->_rootNode = -[NSFileAccessNode initWithParent:name:normalizedName:]([NSFileAccessNode alloc], "initWithParent:name:normalizedName:", 0, CFSTR("/"), CFSTR("/"));
    v10 = (void *)MEMORY[0x186DA8F78]();
    v11 = -[NSFileAccessNode descendantForFileURL:](v9->_rootNode, "descendantForFileURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/etc"), 1));
    objc_msgSend(v11, "setSymbolicLinkDestination:", -[NSFileAccessNode descendantForFileURL:](v9->_rootNode, "descendantForFileURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/private/etc"), 1)));
    v12 = -[NSFileAccessNode descendantForFileURL:](v9->_rootNode, "descendantForFileURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/tmp"), 1));
    objc_msgSend(v12, "setSymbolicLinkDestination:", -[NSFileAccessNode descendantForFileURL:](v9->_rootNode, "descendantForFileURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/private/tmp"), 1)));
    v13 = -[NSFileAccessNode descendantForFileURL:](v9->_rootNode, "descendantForFileURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var"), 1));
    objc_msgSend(v13, "setSymbolicLinkDestination:", -[NSFileAccessNode descendantForFileURL:](v9->_rootNode, "descendantForFileURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/private/var"), 1)));
    objc_autoreleasePoolPop(v10);
    if (!v9->_isSubarbiter)
      -[NSFileAccessArbiter _registerForDebugInfoRequests](v9, "_registerForDebugInfoRequests");
  }
  return v9;
}

- (void)dealloc
{
  NSMutableDictionary *kernelMaterializationClaimCancellers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *debugSignalSource;
  objc_super v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_accessClaimsByID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_76);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  kernelMaterializationClaimCancellers = self->_kernelMaterializationClaimCancellers;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](kernelMaterializationClaimCancellers, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(kernelMaterializationClaimCancellers);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i) + 16))();
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](kernelMaterializationClaimCancellers, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v5);
  }

  dispatch_release((dispatch_object_t)self->_queue);
  debugSignalSource = self->_debugSignalSource;
  if (debugSignalSource)
  {
    dispatch_source_cancel(debugSignalSource);
    dispatch_release((dispatch_object_t)self->_debugSignalSource);
  }
  v9.receiver = self;
  v9.super_class = (Class)NSFileAccessArbiter;
  -[NSFileAccessArbiter dealloc](&v9, sel_dealloc);
}

uint64_t __30__NSFileAccessArbiter_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "disavowed");
}

uint64_t __58__NSFileAccessArbiter_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCanceledClient:", *(_QWORD *)(a1 + 40));
}

uint64_t __41__NSFileAccessArbiter__grantAccessClaim___block_invoke()
{
  NSObject *v0;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = _NSOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1817D9000, v0, OS_LOG_TYPE_ERROR, "A process invoked one of the -[NSFileCoordinator coordinate...] methods but filecoordinationd crashed. Returning an error.", v2, 2u);
  }
  return 1;
}

- (void)_grantSubarbitrationClaim:(id)a3 withServer:(id)a4
{
  id v7;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a4, "setRemoteObjectInterface:", +[NSFileCoordinator _fileAccessArbiterInterface](NSFileCoordinator, "_fileAccessArbiterInterface"));
  objc_msgSend(a3, "setSubarbiterConnection:", a4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__NSFileAccessArbiter__grantSubarbitrationClaim_withServer___block_invoke;
  v8[3] = &unk_1E0F51588;
  v8[4] = a3;
  v8[5] = a4;
  v8[6] = self;
  objc_msgSend(a4, "setInterruptionHandler:", v8);
  objc_msgSend(a4, "setUserInfo:", a3);
  objc_msgSend(a4, "_setQueue:", self->_queue);
  objc_msgSend(a4, "resume");
  -[NSMutableDictionary setObject:forKey:](self->_subarbitrationClaimsByID, "setObject:forKey:", a3, objc_msgSend(a3, "claimID"));
  -[NSFileAccessArbiter _grantAccessClaim:](self, "_grantAccessClaim:", a3);
}

void __60__NSFileAccessArbiter__grantSubarbitrationClaim_withServer___block_invoke(id *a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCClaimsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(a1[4], "claimID");
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "cancelling a connection for subarbitration claim %{public}@", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(a1[5], "setUserInfo:", 0);
  objc_msgSend(a1[5], "invalidate");
  objc_msgSend(a1[6], "_handleCanceledClient:", a1[5]);

}

- (void)_writerWithPurposeID:(id)a3 didMoveItemAtURL:(id)a4 toURL:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7
{
  NSFileAccessNode **p_rootNode;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  BOOL v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  fsid v52;
  unint64_t v53;
  unint64_t v54;
  id v55;
  _QWORD v56[4];
  BOOL v57;
  char v58;
  _QWORD v59[7];
  _QWORD v60[6];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  void (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  uint64_t v72;
  _QWORD v73[7];
  _QWORD v74[6];
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  void (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  uint64_t v86;
  _QWORD v87[5];
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  void (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  uint64_t v93;
  _QWORD v94[8];
  _QWORD v95[5];
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  void (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  uint64_t v101;
  _QWORD v102[5];
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  void (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  _BYTE v113[128];
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[8];
  _BYTE v119[128];
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[11];

  v129[9] = *MEMORY[0x1E0C80C00];
  v112 = 0;
  v111 = 0;
  p_rootNode = &self->_rootNode;
  v14 = -[NSFileAccessNode pathToDescendantForFileURL:componentRange:](self->_rootNode, "pathToDescendantForFileURL:componentRange:", objc_msgSend(a4, "logicalURL"), &v111);
  v110 = 0;
  v109 = 0;
  v15 = -[NSFileAccessNode pathToDescendantForFileURL:componentRange:](*p_rootNode, "pathToDescendantForFileURL:componentRange:", objc_msgSend(a5, "logicalURL"), &v109);
  if (v14)
  {
    v16 = (void *)v15;
    if (v15)
    {
      v17 = -[NSFileAccessNode descendantAtPath:componentRange:create:](self->_rootNode, "descendantAtPath:componentRange:create:", v14, v111, v112, 0);
      v18 = -[NSFileAccessNode descendantAtPath:componentRange:create:](self->_rootNode, "descendantAtPath:componentRange:create:", v16, v109, v110, 0);
      if (v18 == v17)
      {
        v20 = objc_msgSend(a4, "physicalURL");
        v21 = objc_msgSend(a5, "physicalURL");
        v22 = v21;
        if (v20)
        {
          v23 = _CFURLIsItemPromiseAtURL();
          v24 = v23 != 0;
          if (v22)
          {
            v25 = v23 != 0;
            v26 = _CFURLIsItemPromiseAtURL() != 0;
            if (v25 == v26)
              return;
          }
          else
          {
            if (!v23)
              return;
            LOBYTE(v26) = 0;
            v24 = 1;
          }
        }
        else
        {
          if (!v21 || !_CFURLIsItemPromiseAtURL())
            return;
          v24 = 0;
          LOBYTE(v26) = 1;
        }
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_41;
        v56[3] = &__block_descriptor_34_e30_v16__0__NSFilePresenterProxy_8l;
        v57 = v24;
        v58 = v26;
        objc_msgSend(v17, "forEachPresenterOfItemPerformProcedure:", v56);
        return;
      }
      if (v17)
      {
        if (self->_isSubarbiter)
          goto LABEL_6;
        v129[0] = MEMORY[0x1E0C809B0];
        v129[1] = 3221225472;
        v129[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke;
        v129[3] = &unk_1E0F53AE0;
        v129[4] = a4;
        v129[5] = a5;
        v129[7] = a7;
        v129[8] = a6;
        v129[6] = a3;
        objc_msgSend(v17, "forEachPresenterOfContainingItemPerformProcedure:", v129);
        v27 = (void *)objc_msgSend(v17, "itemProvider");
        v54 = (unint64_t)v27;
        if (!v27)
        {
LABEL_6:
          v54 = 0;
          v19 = -[NSFileAccessNode descendantAtPath:componentRange:forAddingLeafNode:create:](self->_rootNode, "descendantAtPath:componentRange:forAddingLeafNode:create:", v16, v109, v110 - 1, v17, 1, 0);
        }
        else
        {
          v50 = objc_msgSend(v17, "pathFromAncestor:", objc_msgSend(v27, "itemLocation"));
          v19 = -[NSFileAccessNode descendantAtPath:componentRange:forAddingLeafNode:create:](self->_rootNode, "descendantAtPath:componentRange:forAddingLeafNode:create:", v16, v109, v110 - 1, v17, 1, v50);
        }
        v55 = v19;
        v103 = 0;
        v104 = &v103;
        v105 = 0x3052000000;
        v106 = __Block_byref_object_copy__27;
        v107 = __Block_byref_object_dispose__27;
        v108 = 0;
        if ((id)objc_msgSend(v17, "parent") != v19)
        {
          v102[0] = MEMORY[0x1E0C809B0];
          v102[1] = 3221225472;
          v102[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_27;
          v102[3] = &unk_1E0F53B08;
          v102[4] = &v103;
          objc_msgSend(v17, "forEachProgressPublisherOfItemPerformProcedure:", v102);
        }
        v51 = a3;
        v52 = a6;
        v53 = a7;
        v127 = 0u;
        v128 = 0u;
        v125 = 0u;
        v126 = 0u;
        v28 = (void *)v104[5];
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v125, v124, 16);
        if (v29)
        {
          v30 = *(_QWORD *)v126;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v126 != v30)
                objc_enumerationMutation(v28);
              objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * i), "setItemLocation:", 0);
            }
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v125, v124, 16);
          }
          while (v29);
        }

        v32 = v18;
        objc_msgSend(v17, "setParent:name:", v55, objc_msgSend(v16, "objectAtIndex:", v109 + v110 - 1));
        v96 = 0;
        v97 = &v96;
        v98 = 0x3052000000;
        v99 = __Block_byref_object_copy__27;
        v100 = __Block_byref_object_dispose__27;
        v101 = 0;
        v95[0] = MEMORY[0x1E0C809B0];
        v95[1] = 3221225472;
        v95[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_2;
        v95[3] = &unk_1E0F53B30;
        v95[4] = &v96;
        objc_msgSend(v17, "forEachPresenterOfItemOrContainedItemPerformProcedure:", v95);
        v123 = 0u;
        v122 = 0u;
        v121 = 0u;
        v120 = 0u;
        v33 = (void *)v97[5];
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v120, v119, 16);
        if (v34)
        {
          v35 = *(_QWORD *)v121;
          do
          {
            for (j = 0; j != v34; ++j)
            {
              if (*(_QWORD *)v121 != v35)
                objc_enumerationMutation(v33);
              v37 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * j);
              v38 = (void *)objc_msgSend((id)objc_msgSend(v37, "itemLocation"), "pathFromAncestor:", v17);
              objc_msgSend(v37, "setItemLocation:", objc_msgSend(v17, "descendantAtPath:componentRange:create:", v38, 0, objc_msgSend(v38, "count"), 1));
            }
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v120, v119, 16);
          }
          while (v34);
        }

        v39 = MEMORY[0x1E0C809B0];
        if (!self->_isSubarbiter)
        {
          v118[0] = MEMORY[0x1E0C809B0];
          v118[1] = 3221225472;
          v118[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_3;
          v118[3] = &unk_1E0F53B58;
          v118[4] = v51;
          v118[5] = a5;
          v118[7] = v52;
          v118[6] = v53;
          objc_msgSend(v17, "forEachPresenterOfItemOrContainedItemPerformProcedure:", v118);
          v40 = objc_msgSend(v17, "itemProvider");
          if (v54 | v40)
          {
            v94[0] = v39;
            v94[1] = 3221225472;
            v94[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_4;
            v94[3] = &unk_1E0F53B80;
            v94[4] = v54;
            v94[5] = v49;
            v94[6] = v17;
            v94[7] = v40;
            objc_msgSend(v17, "forEachPresenterOfItemOrContainedItemPerformProcedure:", v94);
          }
        }
        if (v18)
        {
          v88 = 0;
          v89 = &v88;
          v90 = 0x3052000000;
          v91 = __Block_byref_object_copy__27;
          v92 = __Block_byref_object_dispose__27;
          v93 = 0;
          v87[0] = v39;
          v87[1] = 3221225472;
          v87[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_5;
          v87[3] = &unk_1E0F53B30;
          v87[4] = &v88;
          objc_msgSend(v18, "forEachPresenterOfItemOrContainedItemPerformProcedure:", v87);
          v116 = 0u;
          v117 = 0u;
          v114 = 0u;
          v115 = 0u;
          v41 = (void *)v89[5];
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v114, v113, 16);
          if (v42)
          {
            v43 = *(_QWORD *)v115;
            do
            {
              for (k = 0; k != v42; ++k)
              {
                if (*(_QWORD *)v115 != v43)
                  objc_enumerationMutation(v41);
                v45 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * k);
                v46 = (void *)objc_msgSend((id)objc_msgSend(v45, "itemLocation"), "pathFromAncestor:", v18);
                objc_msgSend(v45, "setItemLocation:", objc_msgSend(v17, "descendantAtPath:componentRange:create:", v46, 0, objc_msgSend(v46, "count"), 1));
              }
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v114, v113, 16);
            }
            while (v42);
          }

          v81 = 0;
          v82 = &v81;
          v83 = 0x3052000000;
          v84 = __Block_byref_object_copy__27;
          v85 = __Block_byref_object_dispose__27;
          v86 = 0;
          v75 = 0;
          v76 = &v75;
          v77 = 0x3052000000;
          v78 = __Block_byref_object_copy__27;
          v79 = __Block_byref_object_dispose__27;
          v80 = 0;
          v74[0] = v39;
          v74[1] = 3221225472;
          v74[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_6;
          v74[3] = &unk_1E0F53BA8;
          v74[4] = &v81;
          v74[5] = &v75;
          objc_msgSend(v18, "forEachAccessClaimOnItemOrContainedItemPerformProcedure:", v74);
          v47 = (void *)v82[5];
          v73[0] = v39;
          v73[1] = 3221225472;
          v73[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_7;
          v73[3] = &unk_1E0F53BD0;
          v73[5] = v17;
          v73[6] = &v75;
          v73[4] = v18;
          objc_msgSend(v47, "enumerateObjectsUsingBlock:", v73);

          v67 = 0;
          v68 = &v67;
          v69 = 0x3052000000;
          v70 = __Block_byref_object_copy__27;
          v71 = __Block_byref_object_dispose__27;
          v72 = 0;
          v61 = 0;
          v62 = &v61;
          v63 = 0x3052000000;
          v64 = __Block_byref_object_copy__27;
          v65 = __Block_byref_object_dispose__27;
          v66 = 0;
          v60[0] = v39;
          v60[1] = 3221225472;
          v60[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_38;
          v60[3] = &unk_1E0F53BF8;
          v60[4] = &v67;
          v60[5] = &v61;
          objc_msgSend(v18, "forEachProgressThingOfItemOrContainedItemPerformProcedure:", v60);
          v48 = (void *)v68[5];
          v59[0] = v39;
          v59[1] = 3221225472;
          v59[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_2_40;
          v59[3] = &unk_1E0F53BD0;
          v59[5] = v17;
          v59[6] = &v61;
          v59[4] = v18;
          objc_msgSend(v48, "enumerateObjectsUsingBlock:", v59);

          _Block_object_dispose(&v61, 8);
          _Block_object_dispose(&v67, 8);
          _Block_object_dispose(&v75, 8);
          _Block_object_dispose(&v81, 8);
          _Block_object_dispose(&v88, 8);
        }

        _Block_object_dispose(&v96, 8);
        _Block_object_dispose(&v103, 8);
      }
    }
  }
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "observeMoveOfSubitemAtURL:toURL:byWriterWithPurposeID:withFSID:andFileID:", a1[4], a1[5], a1[6], a1[8], a1[7]);
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_27(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  return objc_msgSend(v4, "addObject:", a2);
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  return objc_msgSend(v4, "addObject:", a2);
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "observeMoveByWriterWithPurposeID:withPhysicalDestinationURL:withFSID:andFileID:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "physicalURL"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_4(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (void *)objc_msgSend(a2, "itemLocation");
  v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "itemLocation"), "urlOfSubitemAtPath:plusPath:", *(_QWORD *)(a1 + 40), objc_msgSend(v4, "pathFromAncestor:", *(_QWORD *)(a1 + 48)));
  if (*(_QWORD *)(a1 + 56))
  {
    v6 = objc_msgSend(v4, "url");
    v7 = *(void **)(a1 + 56);
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  if (v7 == *(void **)(a1 + 32))
  {
    v8 = CFSTR("itemMoved");
    v9 = a2;
    v10 = v5;
    v11 = v6;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "observePresentationChangeOfKind:withPresenter:url:newURL:", CFSTR("removed"), a2, v5, 0);
    v8 = CFSTR("added");
    v7 = *(void **)(a1 + 56);
    v9 = a2;
    v10 = v6;
    v11 = 0;
  }
  return objc_msgSend(v7, "observePresentationChangeOfKind:withPresenter:url:newURL:", v8, v9, v10, v11);
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  return objc_msgSend(v4, "addObject:", a2);
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v6, "addObject:", a2);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  return objc_msgSend(v7, "addObject:", a3);
}

void __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_7(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[8];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndex:");
  v5 = (void *)objc_msgSend(v4, "pathFromAncestor:", *(_QWORD *)(a1 + 32));
  v6 = objc_msgSend(*(id *)(a1 + 40), "descendantAtPath:componentRange:create:", v5, 0, objc_msgSend(v5, "count"), 1);
  if ((void *)v6 == v4)
  {
    v7 = _NSFCClaimsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1817D9000, v7, OS_LOG_TYPE_FAULT, "An arbiter is confusing itself after a file was moved while telling claims about node replacement", v8, 2u);
    }
  }
  else
  {
    objc_msgSend(a2, "itemAtLocation:wasReplacedByItemAtLocation:", v4, v6);
  }
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v6, "addObject:", a2);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  return objc_msgSend(v7, "addObject:", a3);
}

void __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_2_40(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[8];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndex:");
  v5 = (void *)objc_msgSend(v4, "pathFromAncestor:", *(_QWORD *)(a1 + 32));
  v6 = objc_msgSend(*(id *)(a1 + 40), "descendantAtPath:componentRange:create:", v5, 0, objc_msgSend(v5, "count"), 1);
  if ((void *)v6 == v4)
  {
    v7 = _NSFCClaimsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1817D9000, v7, OS_LOG_TYPE_FAULT, "An arbiter is confusing itself after a file was moved while telling progress things about node replacement", v8, 2u);
    }
  }
  else
  {
    objc_msgSend(a2, "setItemLocation:", v6);
  }
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_41(uint64_t result, void *a2)
{
  if (*(_BYTE *)(result + 32))
  {
    if (!*(_BYTE *)(result + 33))
      return objc_msgSend(a2, "promisedFileWasFulfilled");
  }
  else if (*(_BYTE *)(result + 33))
  {
    return objc_msgSend(a2, "localFileWasEvicted");
  }
  return result;
}

uint64_t __78__NSFileAccessArbiter__addPresenter_ofItemAtURL_watchingFile_withLastEventID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSObject *v12;
  NSURLPromisePair *v13;
  NSURLPromisePair *v14;
  void *v15;
  _QWORD v17[9];
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = _NSFCLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v19 = a2;
    _os_log_impl(&dword_1817D9000, v12, OS_LOG_TYPE_INFO, "Detected file move on behalf of writing claim %{public}@", buf, 0xCu);
  }
  v13 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", a3, 0);
  v14 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", a4, 0);
  objc_msgSend(*(id *)(a1 + 32), "_writerWithPurposeID:didMoveItemAtURL:toURL:withFSID:andFileID:", a2, v13, v14, a5, a6);
  v15 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__NSFileAccessArbiter__addPresenter_ofItemAtURL_watchingFile_withLastEventID___block_invoke_45;
  v17[3] = &unk_1E0F53C40;
  v17[4] = a2;
  v17[5] = v13;
  v17[7] = a6;
  v17[8] = a5;
  v17[6] = v14;
  return objc_msgSend(v15, "_enumerateSubarbitersUsingBlock:", v17);
}

uint64_t __78__NSFileAccessArbiter__addPresenter_ofItemAtURL_watchingFile_withLastEventID___block_invoke_45(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "writerWithPurposeID:didMoveItemAtURL:toURL:withFSID:andFileID:", a1[4], a1[5], a1[6], a1[8], a1[7]);
}

- (BOOL)_addProvider:(id)a3 ofItemsAtURL:(id)a4
{
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  BOOL result;
  const char *v15;
  _BOOL4 v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "reactorID");
  v8 = objc_msgSend(a3, "uniqueID");
  if (!self->_isSubarbiter)
  {
    v9 = _NSFCProviderLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v7;
      _os_log_impl(&dword_1817D9000, v9, OS_LOG_TYPE_DEFAULT, "Added provider %{public}@", buf, 0xCu);
    }
  }
  v10 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", a4);
  if (!v10)
  {
    v12 = _NSFCProviderLog();
    v16 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v16)
      return result;
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    v15 = "Added provider %{public}@ failed because no node was found";
    goto LABEL_10;
  }
  v11 = v10;
  objc_msgSend(a3, "setItemLocation:", v10);
  if ((id)objc_msgSend(a3, "itemLocation") != v11)
  {
    v12 = _NSFCProviderLog();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v13)
      return result;
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    v15 = "Added provider %{public}@ failed because -setItemLocation: failed";
LABEL_10:
    _os_log_impl(&dword_1817D9000, v12, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    return 0;
  }
  -[NSMutableDictionary setObject:forKey:](self->_reactorsByID, "setObject:forKey:", a3, v8);
  -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Provider: %@ (%d)"), objc_msgSend(v7, "description"), -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier")), "UTF8String");
  v17 = (void *)os_transaction_create();
  -[NSMutableDictionary setObject:forKey:](self->_reactorTransactionsByID, "setObject:forKey:", v17, v8);

  return 1;
}

- (void)_willRemoveReactor:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if (object_getClass(a3) == (Class)NSFilePresenterProxy)
  {
    objc_msgSend(a3, "stopObservingApplicationState");
    v5 = objc_msgSend(a3, "reactorID");
    goto LABEL_5;
  }
  if (object_getClass(a3) == (Class)NSFileProviderProxy)
  {
    v5 = objc_msgSend(a3, "uniqueID");
LABEL_5:
    v6 = v5;
    objc_msgSend(a3, "setItemLocation:", 0);
    objc_msgSend(a3, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_reactorTransactionsByID, "removeObjectForKey:", v6);
    return;
  }
  qword_1EDC47C18 = (uint64_t)"Unexpected type as argument to _willRemoveReactor";
  __break(1u);
}

- (void)_removeReactorForID:(id)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_reactorsByID, "objectForKey:");
  if (v5)
  {
    v6 = v5;
    if (object_getClass(v5) == (Class)NSFileProviderProxy)
    {
      v7 = _NSFCProviderLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v9 = 138543362;
        *(_QWORD *)&v9[4] = objc_msgSend(v6, "reactorID");
        v8 = "Removed provider %{public}@";
        goto LABEL_7;
      }
    }
    else
    {
      v7 = _NSFCPresenterLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v9 = 138543362;
        *(_QWORD *)&v9[4] = objc_msgSend(v6, "reactorID");
        v8 = "Removed presenter %{public}@";
LABEL_7:
        _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 0xCu);
      }
    }
    -[NSFileAccessArbiter _willRemoveReactor:](self, "_willRemoveReactor:", v6, *(_OWORD *)v9);
    -[NSMutableDictionary removeObjectForKey:](self->_reactorsByID, "removeObjectForKey:", a3);
  }
}

- (void)_startArbitratingItemsAtURLs:(id)a3 withSuperarbitrationServer:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v21 = objc_msgSend(a3, "count");
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "Starting subarbitration for %lu URLs", buf, 0xCu);
  }
  if (!self->_isSubarbiter)
  {
    v8 = _NSFCClaimsLog();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v9 = "NSFileCoordinator: A superarbiter was told to start arbitrating, which is a surprise.";
    goto LABEL_19;
  }
  if (self->_superarbitrationServer)
  {
    v8 = _NSFCClaimsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "NSFileCoordinator: A subarbiter was told by a superarbiter to start subarbitrating twice, which is a surprise.";
LABEL_19:
      _os_log_fault_impl(&dword_1817D9000, v8, OS_LOG_TYPE_FAULT, v9, buf, 2u);
    }
  }
LABEL_8:
  self->_superarbitrationServer = (NSXPCConnection *)a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(a3);
        v14 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        if (v14)
          objc_msgSend(v14, "setArbitrationBoundary");
      }
      v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v11);
  }
}

- (void)stopArbitrating
{
  NSObject *queue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__NSFileAccessArbiter_stopArbitrating__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = self;
  dispatch_sync(queue, v3);
}

uint64_t __38__NSFileAccessArbiter_stopArbitrating__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];
  uint8_t buf[16];
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCClaimsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_INFO, "Stopping subarbitration", buf, 2u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
  if (v3)
  {
    dispatch_source_cancel(v3);
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 104));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = 0;
  }
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 88);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__NSFileAccessArbiter_stopArbitrating__block_invoke_51;
  v11[3] = &unk_1E0F53C90;
  v11[4] = v4;
  v11[5] = v5;
  objc_msgSend(v6, "forEachAccessClaimOnItemOrContainedItemPerformProcedure:", v11);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10++), "revoked");
      }
      while (v8 != v10);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      v8 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __38__NSFileAccessArbiter_stopArbitrating__block_invoke_51(uint64_t a1, void *a2)
{
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "cameFromSuperarbiter"))
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__NSFileAccessArbiter_stopArbitrating__block_invoke_2;
  v5[3] = &unk_1E0F4D2D8;
  v5[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "whenDevaluedPerformProcedure:", v5);
}

uint64_t __38__NSFileAccessArbiter_stopArbitrating__block_invoke_2()
{
  return objc_opt_self();
}

- (id)rootNode
{
  return self->_rootNode;
}

- (NSXPCConnection)superarbitrationConnection
{
  return self->_superarbitrationServer;
}

uint64_t __55__NSFileAccessArbiter__enumerateSubarbitersUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "isGranted");
  if ((_DWORD)result)
  {
    result = objc_msgSend(a3, "nullified");
    if ((result & 1) == 0)
      return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend((id)objc_msgSend(a3, "subarbiterConnection"), "remoteObjectProxy"));
  }
  return result;
}

- (void)grantSubarbitrationClaim:(id)a3 withServer:(id)a4 reply:(id)a5
{
  NSXPCConnection *v9;
  OS_dispatch_queue *queue;
  NSXPCConnection *v11;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v9 = +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection");
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__NSFileAccessArbiter_grantSubarbitrationClaim_withServer_reply___block_invoke;
  v12[3] = &unk_1E0F53CE0;
  v12[4] = a5;
  objc_msgSend(a3, "acceptClaimFromClient:arbiterQueue:grantHandler:", v9, queue, v12);
  v11 = -[NSXPCConnection initWithListenerEndpoint:]([NSXPCConnection alloc], "initWithListenerEndpoint:", a4);
  -[NSXPCConnection setExportedObject:](v11, "setExportedObject:", self);
  -[NSXPCConnection setExportedInterface:](v11, "setExportedInterface:", +[NSFileCoordinator _fileAccessArbiterInterface](NSFileCoordinator, "_fileAccessArbiterInterface"));
  -[NSFileAccessArbiter _grantSubarbitrationClaim:withServer:](self, "_grantSubarbitrationClaim:withServer:", a3, v11);

}

uint64_t __65__NSFileAccessArbiter_grantSubarbitrationClaim_withServer_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performMateralizationOfURL:(id)a3 withProvider:(id)a4 fakeClaim:(id)a5 kernelInfo:(id)a6 requestID:(id)a7 fromProcess:(id *)a8 completionHandler:(id)a9
{
  void *v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[8];
  _OWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Nspace Materialization: %@ (%d)"), objc_msgSend(a5, "claimID"), a8->var0[5]), "UTF8String");
  v16 = (void *)os_transaction_create();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __124__NSFileAccessArbiter_performMateralizationOfURL_withProvider_fakeClaim_kernelInfo_requestID_fromProcess_completionHandler___block_invoke;
  v19[3] = &unk_1E0F53D08;
  v19[4] = a5;
  v19[5] = a7;
  v19[6] = self;
  v19[7] = a9;
  v17 = *(_OWORD *)&a8->var0[4];
  v20[0] = *(_OWORD *)a8->var0;
  v20[1] = v17;
  v18 = objc_msgSend(a4, "provideItemForKernelRequestWithInfo:atURL:forProcess:withOptions:completionHandler:", a6, a3, v20, 0x40000000, v19);
  if (a7)
  {
    -[NSMutableDictionary setObject:forKey:](self->_kernelMaterializationClaimCancellers, "setObject:forKey:", v18, a7);
    -[NSMutableDictionary setObject:forKey:](self->_kernelMaterializationClaimTransactions, "setObject:forKey:", v16, a7);
  }

}

uint64_t __124__NSFileAccessArbiter_performMateralizationOfURL_withProvider_fakeClaim_kernelInfo_requestID_fromProcess_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "revoked");
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "removeObjectForKey:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), objc_msgSend(a2, "providedItemRecursiveGenerationCount"), objc_msgSend(a2, "error"));
}

- (void)makeProviderMaterializeFileAtURL:(id)a3 kernelInfo:(id)a4 withRequestID:(id)a5 fromProcess:(id *)a6 completionHandler:(id)a7
{
  uint64_t v13;
  __int128 v14;
  NSObject *queue;
  uid_t v16;
  uint64_t v17;
  _QWORD block[10];
  uid_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v17 = 0;
  v16 = 0;
  if ((_NSFCGetFileProviderUIDFOrURL(a3, &v16, &v17) & 1) != 0)
  {
    v13 = os_transaction_create();
    block[1] = 3221225472;
    v14 = *(_OWORD *)&a6->var0[4];
    v20 = *(_OWORD *)a6->var0;
    block[0] = MEMORY[0x1E0C809B0];
    queue = self->_queue;
    block[2] = __111__NSFileAccessArbiter_makeProviderMaterializeFileAtURL_kernelInfo_withRequestID_fromProcess_completionHandler___block_invoke;
    block[3] = &unk_1E0F53D58;
    block[4] = self;
    block[5] = a3;
    v19 = v16;
    block[6] = a4;
    block[7] = a5;
    v21 = v14;
    block[8] = v13;
    block[9] = a7;
    dispatch_async(queue, block);
  }
  else
  {
    (*((void (**)(id, _QWORD, uint64_t))a7 + 2))(a7, 0, v17);
  }
}

void __111__NSFileAccessArbiter_makeProviderMaterializeFileAtURL_kernelInfo_withRequestID_fromProcess_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSFileReadingClaim *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _QWORD v12[5];
  __int128 v13;
  NSFileReadingClaim *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "rootNode"), "descendantForFileURL:", *(_QWORD *)(a1 + 40));
  v3 = -[NSFileReadingClaim initWithPurposeID:url:options:claimer:]([NSFileReadingClaim alloc], "initWithPurposeID:url:options:claimer:", CFSTR("kernel-provider-materialization"), *(_QWORD *)(a1 + 40), 0, 0);
  v4 = (void *)objc_opt_class();
  v5 = *(unsigned int *)(a1 + 80);
  v19[0] = v2;
  v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v12[0] = MEMORY[0x1E0C809B0];
  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 48);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12[1] = 3221225472;
  v12[2] = __111__NSFileAccessArbiter_makeProviderMaterializeFileAtURL_kernelInfo_withRequestID_fromProcess_completionHandler___block_invoke_2;
  v12[3] = &unk_1E0F53D30;
  v12[4] = v2;
  v13 = v7;
  v14 = v3;
  v10 = *(_OWORD *)(a1 + 100);
  v17 = *(_OWORD *)(a1 + 84);
  v18 = v10;
  v11 = *(_OWORD *)(a1 + 64);
  v15 = v8;
  v16 = v11;
  objc_msgSend(v4, "ensureProvidersIfNecessaryForClaim:user:atLocations:queue:thenContinue:", v3, v5, v6, v9, v12);

}

void __111__NSFileAccessArbiter_makeProviderMaterializeFileAtURL_kernelInfo_withRequestID_fromProcess_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  NSError *v17;
  int v18;
  NSError *v19;
  id v20;
  _BYTE buf[32];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "itemProvider");
  if (v2)
  {
    v3 = v2;
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 88);
    v10 = *(_OWORD *)(a1 + 112);
    *(_OWORD *)buf = *(_OWORD *)(a1 + 96);
    *(_OWORD *)&buf[16] = v10;
    objc_msgSend(v4, "performMateralizationOfURL:withProvider:fakeClaim:kernelInfo:requestID:fromProcess:completionHandler:", v5, v3, v6, v7, v8, buf, v9);
  }
  else
  {
    v11 = _NSFCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(*(id *)(a1 + 72), "intValue");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1817D9000, v11, OS_LOG_TYPE_INFO, "No provider found for materialization - req: %d", buf, 8u);
    }
    v19 = 0;
    v20 = 0;
    if ((objc_msgSend(*(id *)(a1 + 48), "getResourceValue:forKey:error:", &v20, *MEMORY[0x1E0C999D0], &v19) & 1) != 0)
    {
      if (objc_msgSend(v20, "BOOLValue"))
      {
        v13 = _NSFCLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = objc_msgSend(*(id *)(a1 + 72), "intValue");
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v14;
          _os_log_impl(&dword_1817D9000, v13, OS_LOG_TYPE_INFO, "Not materializing provider-less directory - req: %d", buf, 8u);
        }
      }
      else
      {
        v19 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 256, 0);
      }
    }
    else
    {
      v15 = _NSFCLog();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      v17 = v19;
      if (v16)
      {
        v18 = objc_msgSend(*(id *)(a1 + 72), "intValue");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v18;
        _os_log_error_impl(&dword_1817D9000, v15, OS_LOG_TYPE_ERROR, "Unable to determine if provider-less fault is a directory: %@ - req: %d", buf, 0x12u);
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }

}

- (void)resolveReparentRequestOfFileAtURL:(id)a3 toDestinationDirectory:(id)a4 withRequestID:(id)a5 operation:(unsigned int)a6 fromProcess:(id *)a7 completionHandler:(id)a8
{
  uint64_t v15;
  __int128 v16;
  NSObject *queue;
  uid_t v18;
  uint64_t v19;
  _QWORD block[10];
  uid_t v21;
  unsigned int v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v19 = 0;
  v18 = 0;
  if ((_NSFCGetFileProviderUIDFOrURL(a3, &v18, &v19) & 1) != 0)
  {
    v15 = os_transaction_create();
    block[1] = 3221225472;
    v16 = *(_OWORD *)&a7->var0[4];
    v23 = *(_OWORD *)a7->var0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke;
    block[3] = &unk_1E0F53DF8;
    block[4] = self;
    block[5] = a3;
    v21 = v18;
    v22 = a6;
    block[6] = a4;
    block[7] = a5;
    v24 = v16;
    block[8] = v15;
    block[9] = a8;
    dispatch_async(queue, block);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))a8 + 2))(a8, 0, 0, v19);
  }
}

void __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSFileMultipleAccessClaim *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  __int128 v10;
  uint64_t v11;
  NSFileMultipleAccessClaim *v12;
  __int128 v13;
  uint64_t v14;
  int v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "rootNode"), "descendantForFileURL:", *(_QWORD *)(a1 + 40));
  v19[0] = +[NSFileAccessIntent readingIntentWithURL:options:](NSFileAccessIntent, "readingIntentWithURL:options:", *(_QWORD *)(a1 + 40), 0);
  v19[1] = +[NSFileAccessIntent readingIntentWithURL:options:](NSFileAccessIntent, "readingIntentWithURL:options:", *(_QWORD *)(a1 + 48), 0);
  v3 = -[NSFileMultipleAccessClaim initWithPurposeID:intents:claimer:]([NSFileMultipleAccessClaim alloc], "initWithPurposeID:intents:claimer:", CFSTR("kernel-provider-reparent"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2), 0);
  v4 = (void *)objc_opt_class();
  v5 = *(unsigned int *)(a1 + 80);
  v18 = v2;
  v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v7 + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke_2;
  v9[3] = &unk_1E0F53DD0;
  v9[4] = v2;
  v10 = *(_OWORD *)(a1 + 40);
  v15 = *(_DWORD *)(a1 + 84);
  v11 = v7;
  v12 = v3;
  v17 = *(_OWORD *)(a1 + 104);
  v16 = *(_OWORD *)(a1 + 88);
  v14 = *(_QWORD *)(a1 + 72);
  v13 = *(_OWORD *)(a1 + 56);
  objc_msgSend(v4, "ensureProvidersIfNecessaryForClaim:user:atLocations:queue:thenContinue:", v3, v5, v6, v8, v9);

}

void __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  _DWORD v6[4];
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, void *);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  int v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "itemProvider");
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke_3;
    v10 = &unk_1E0F53DA8;
    v16 = *(_DWORD *)(a1 + 96);
    v11 = *(_QWORD *)(a1 + 56);
    v12 = v3;
    v13 = v2;
    v14 = *(_OWORD *)(a1 + 64);
    v17 = *(_OWORD *)(a1 + 100);
    v18 = *(_OWORD *)(a1 + 116);
    v15 = *(_QWORD *)(a1 + 88);
    objc_msgSend(v2, "movingItemAtURL:requiresProvidingWithDestinationDirectoryURL:newFileName:completionHandler:");
  }
  else
  {
    v4 = _NSFCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend(*(id *)(a1 + 72), "intValue");
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "No provider found for reparent request - req: %d", (uint8_t *)v6, 8u);
    }
    (*(void (**)(_QWORD, _QWORD, _QWORD, NSError *))(*(_QWORD *)(a1 + 88) + 16))(*(_QWORD *)(a1 + 88), 0, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 256, 0));
  }

}

uint64_t __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  NSFileProviderKernelMaterializationInfo *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  _QWORD v12[5];
  _OWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "requiresProviding") & 1) == 0
    && objc_msgSend((id)objc_msgSend(a2, "syncRootID"), "unsignedLongLongValue") != -1)
  {
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), objc_msgSend((id)objc_msgSend(a2, "syncRootID"), "unsignedLongLongValue"), 0, 0);
  }
  v5 = +[NSFileProviderKernelMaterializationInfo kernelMaterializationInfoWithOperation:](NSFileProviderKernelMaterializationInfo, "kernelMaterializationInfoWithOperation:", *(unsigned int *)(a1 + 80));
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v12[1] = 3221225472;
  v12[2] = __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke_4;
  v12[3] = &unk_1E0F53D80;
  v10 = *(_QWORD *)(a1 + 64);
  v12[4] = *(_QWORD *)(a1 + 72);
  v11 = *(_OWORD *)(a1 + 100);
  v13[0] = *(_OWORD *)(a1 + 84);
  v13[1] = v11;
  v12[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(v6, "performMateralizationOfURL:withProvider:fakeClaim:kernelInfo:requestID:fromProcess:completionHandler:", v7, v8, v9, v5, v10, v13, v12);
}

uint64_t __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancelMaterializationWithRequestID:(id)a3
{
  NSObject *queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__NSFileAccessArbiter_cancelMaterializationWithRequestID___block_invoke;
  block[3] = &unk_1E0F4C650;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __58__NSFileAccessArbiter_cancelMaterializationWithRequestID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (result)
  {
    (*(void (**)(void))(result + 16))();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

uint64_t __121__NSFileAccessArbiter_addPresenter_withID_fileURL_lastPresentedItemEventIdentifier_ubiquityAttributes_options_responses___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "forwardUsingProxy:", a2);
}

- (void)removePresenterWithID:(id)a3
{
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  -[NSFileAccessArbiter _removeReactorForID:](self, "_removeReactorForID:");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__NSFileAccessArbiter_removePresenterWithID___block_invoke;
  v5[3] = &unk_1E0F53E20;
  v5[4] = a3;
  -[NSFileAccessArbiter _enumerateSubarbitersUsingBlock:](self, "_enumerateSubarbitersUsingBlock:", v5);
}

uint64_t __45__NSFileAccessArbiter_removePresenterWithID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removePresenterWithID:", *(_QWORD *)(a1 + 32));
}

+ (id)entitlementForConnection:(id)a3 key:(id)a4
{
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_getAssociatedObject(a3, &NSFCXPCEntitlements), "objectForKey:", a4);
  if (v6 == (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
    return 0;
  if (!v6)
  {
    v7 = _NSFCLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138543618;
      v10 = a4;
      v11 = 2114;
      v12 = a3;
      _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "Add key: %{public}@ to entitlement cache for connection: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    return (id)objc_msgSend(a3, "valueForEntitlement:", a4);
  }
  return v6;
}

- (void)addProvider:(id)a3 withID:(id)a4 uniqueID:(id)a5 forProvidedItemsURL:(id)a6 options:(unint64_t)a7 withServer:(id)a8 reply:(id)a9
{
  char v10;
  NSXPCConnection *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSFileProviderProxy *v25;
  id v26;
  char v27;
  id v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[8];
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v10 = a7;
  v37 = *MEMORY[0x1E0C80C00];
  v16 = +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection");
  if (!objc_getAssociatedObject(v16, &NSFCXPCEntitlements))
  {
    v26 = a5;
    v27 = v10;
    v28 = a6;
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(&unk_1E0FCEBD8, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v18 = objc_msgSend(&unk_1E0FCEBD8, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(&unk_1E0FCEBD8);
          v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v23 = -[NSXPCConnection valueForEntitlement:](v16, "valueForEntitlement:", v22);
          if (!v23)
            v23 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
          objc_msgSend(v17, "setValue:forKey:", v23, v22);
        }
        v19 = objc_msgSend(&unk_1E0FCEBD8, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
      }
      while (v19);
    }
    objc_setAssociatedObject(v16, &NSFCXPCEntitlements, v17, (void *)0x303);
    a6 = v28;
    a5 = v26;
    v10 = v27;
  }
  if (v16)
    -[_NSXPCConnectionImportInfo _clearEntitlementCache]((uint64_t)v16->_importInfo);
  if (self->_isSubarbiter)
  {
    v24 = 0;
  }
  else
  {
    v24 = +[NSFileAccessArbiter entitlementForConnection:key:](NSFileAccessArbiter, "entitlementForConnection:key:", v16, CFSTR("com.apple.private.foundation.fileprovideridentifier"));
    if (!_NSIsNSString())
      v24 = 0;
  }
  v25 = -[NSFileProviderProxy initWithClient:remoteProvider:reactorID:secureID:uniqueID:]([NSFileProviderProxy alloc], "initWithClient:remoteProvider:reactorID:secureID:uniqueID:", v16, a3, a4, v24, a5);
  -[NSFileProviderProxy setWantsWriteNotifications:](v25, "setWantsWriteNotifications:", v10 & 1);
  -[NSFileReactorProxy setEffectiveUserIdentifier:](v25, "setEffectiveUserIdentifier:", -[NSXPCConnection effectiveUserIdentifier](v16, "effectiveUserIdentifier"));
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke;
  v31[3] = &unk_1E0F53E48;
  v31[4] = self;
  v31[5] = v25;
  v31[6] = a6;
  v31[7] = a9;
  if (a8)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke_3;
    v30[3] = &unk_1E0F4E088;
    v30[4] = v31;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke_83;
    v29[3] = &unk_1E0F53E70;
    v29[4] = v31;
    objc_msgSend((id)objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v30), "checkInProviderWithReply:", v29);
  }
  else
  {
    __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke((uint64_t)v31, 1);
  }
}

uint64_t __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke(uint64_t a1, int a2)
{
  _BYTE *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = *(_BYTE **)(a1 + 32);
    if (!v3[25])
    {
      if (!objc_msgSend(*(id *)(a1 + 40), "allowedForURL:", *(_QWORD *)(a1 + 48)))
        goto LABEL_7;
      v3 = *(_BYTE **)(a1 + 32);
    }
    if (objc_msgSend(v3, "_addProvider:ofItemsAtURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke_2;
      v6[3] = &unk_1E0F53E20;
      v4 = *(void **)(a1 + 32);
      v6[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(v4, "_enumerateSubarbitersUsingBlock:", v6);
    }
  }
LABEL_7:

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "forwardUsingProxy:", a2);
}

uint64_t __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543618;
    v7 = CFSTR("checkIn");
    v8 = 2114;
    v9 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke_83(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeProviderWithID:(id)a3 uniqueID:(id)a4
{
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  -[NSFileAccessArbiter _removeReactorForID:](self, "_removeReactorForID:", a4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__NSFileAccessArbiter_removeProviderWithID_uniqueID___block_invoke;
  v7[3] = &unk_1E0F53E98;
  v7[4] = a3;
  v7[5] = a4;
  -[NSFileAccessArbiter _enumerateSubarbitersUsingBlock:](self, "_enumerateSubarbitersUsingBlock:", v7);
}

uint64_t __53__NSFileAccessArbiter_removeProviderWithID_uniqueID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeProviderWithID:uniqueID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)prepareToArbitrateForURLs:(id)a3
{
  NSXPCConnection *v5;

  v5 = +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection");
  -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", +[NSFileCoordinator _fileAccessArbiterInterface](NSFileCoordinator, "_fileAccessArbiterInterface"));
  -[NSFileAccessArbiter _startArbitratingItemsAtURLs:withSuperarbitrationServer:](self, "_startArbitratingItemsAtURLs:withSuperarbitrationServer:", a3, v5);
}

- (void)startArbitratingWithReply:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)provideDebugInfoWithLocalInfo:(id)a3 completionHandler:(id)a4
{
  NSXPCConnection *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v7 = +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection");
  v8 = -[NSXPCConnection processIdentifier](v7, "processIdentifier");
  if (_NSFCIP
    || (v9 = -[NSXPCConnection valueForEntitlement:](v7, "valueForEntitlement:", CFSTR("com.apple.private.foundation.filecoordination-debug")), _NSIsNSNumber())&& (objc_msgSend(v9, "BOOLValue") & 1) != 0|| !-[NSXPCConnection effectiveUserIdentifier](v7, "effectiveUserIdentifier"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__NSFileAccessArbiter_provideDebugInfoWithLocalInfo_completionHandler___block_invoke;
    v10[3] = &unk_1E0F53EC0;
    v10[4] = a4;
    -[NSFileAccessArbiter getDebugInformationIncludingEverything:withString:fromPid:thenContinue:](self, "getDebugInformationIncludingEverything:withString:fromPid:thenContinue:", 0, a3, v8, v10);
  }
  else
  {
    (*((void (**)(id, _QWORD, NSError *))a4 + 2))(a4, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSPOSIXErrorDomain"), 1, 0));
  }
}

uint64_t __71__NSFileAccessArbiter_provideDebugInfoWithLocalInfo_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)provideSubarbiterDebugInfoIncludingEverything:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v5;
  NSXPCConnection *v7;
  int v8;
  NSXPCConnection *v9;
  id v10;
  _QWORD v11[6];

  v5 = a3;
  v11[5] = *MEMORY[0x1E0C80C00];
  v7 = +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection");
  if (_NSFCIP || (v9 = v7, !-[NSXPCConnection effectiveUserIdentifier](v7, "effectiveUserIdentifier")))
  {
    v8 = 1;
LABEL_3:
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __87__NSFileAccessArbiter_provideSubarbiterDebugInfoIncludingEverything_completionHandler___block_invoke;
    v11[3] = &unk_1E0F53EC0;
    v11[4] = a4;
    -[NSFileAccessArbiter getDebugInformationIncludingEverything:withString:fromPid:thenContinue:](self, "getDebugInformationIncludingEverything:withString:fromPid:thenContinue:", v8 & v5, 0, 0, v11);
    return;
  }
  v10 = -[NSXPCConnection valueForEntitlement:](v9, "valueForEntitlement:", CFSTR("com.apple.private.foundation.filecoordination-debug"));
  if (_NSIsNSNumber() && objc_msgSend(v10, "BOOLValue"))
  {
    v8 = 0;
    goto LABEL_3;
  }
  (*((void (**)(id, _QWORD, NSError *))a4 + 2))(a4, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSPOSIXErrorDomain"), 1, 0));
}

uint64_t __87__NSFileAccessArbiter_provideSubarbiterDebugInfoIncludingEverything_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performBarrierWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)_handleCanceledClient:(id)a3
{
  NSObject *v5;
  id v6;
  id v7;
  NSMutableDictionary *accessClaimsByID;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSMutableDictionary *reactorsByID;
  _QWORD v16[7];
  _QWORD v17[8];
  uint8_t buf[16];
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = _NSFCClaimsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1817D9000, v5, OS_LOG_TYPE_INFO, "A file coordination client died", buf, 2u);
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  accessClaimsByID = self->_accessClaimsByID;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__NSFileAccessArbiter__handleCanceledClient___block_invoke;
  v17[3] = &unk_1E0F53EE8;
  v17[4] = a3;
  v17[5] = v7;
  v17[6] = self;
  v17[7] = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](accessClaimsByID, "enumerateKeysAndObjectsUsingBlock:", v17);
  -[NSMutableDictionary removeObjectsForKeys:](self->_accessClaimsByID, "removeObjectsForKeys:", v7);
  -[NSMutableDictionary removeObjectsForKeys:](self->_subarbitrationClaimsByID, "removeObjectsForKeys:", v7);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13++), "unblock");
      }
      while (v11 != v13);
      v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    }
    while (v11);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  reactorsByID = self->_reactorsByID;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __45__NSFileAccessArbiter__handleCanceledClient___block_invoke_87;
  v16[3] = &unk_1E0F53F10;
  v16[4] = a3;
  v16[5] = v14;
  v16[6] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](reactorsByID, "enumerateKeysAndObjectsUsingBlock:", v16);
  -[NSMutableDictionary removeObjectsForKeys:](self->_reactorsByID, "removeObjectsForKeys:", v14);

}

uint64_t __45__NSFileAccessArbiter__handleCanceledClient___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a3, "client");
  if (result == *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "removeObjectForKey:", a2);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = (void *)objc_msgSend(a3, "pendingClaims");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
          objc_msgSend(v12, "block");
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
      }
      while (v9);
    }
    v13 = _NSFCClaimsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = a2;
      _os_log_impl(&dword_1817D9000, v13, OS_LOG_TYPE_DEFAULT, "Revoking claim %{public}@ because client died", (uint8_t *)&v14, 0xCu);
    }
    return objc_msgSend(a3, "revoked");
  }
  return result;
}

uint64_t __45__NSFileAccessArbiter__handleCanceledClient___block_invoke_87(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  NSObject *v7;
  const char *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a3, "client");
  if (result == *(_QWORD *)(a1 + 32))
  {
    if (object_getClass(a3) == (Class)NSFileProviderProxy)
    {
      v7 = _NSFCProviderLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v9 = 138543362;
        *(_QWORD *)&v9[4] = objc_msgSend(a3, "reactorID");
        v8 = "Removed provider %{public}@";
        goto LABEL_7;
      }
    }
    else
    {
      v7 = _NSFCPresenterLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v9 = 138543362;
        *(_QWORD *)&v9[4] = objc_msgSend(a3, "reactorID");
        v8 = "Removed presenter %{public}@";
LABEL_7:
        _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 0xCu);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", a2, *(_OWORD *)v9);
    return objc_msgSend(*(id *)(a1 + 48), "_willRemoveReactor:", a3);
  }
  return result;
}

- (void)getItemHasPresentersAtURL:(id)a3 completionHandler:(id)a4
{
  NSXPCConnection *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v18 = 0u;
  v19 = 0u;
  v7 = +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection");
  if (v7)
  {
    -[NSXPCConnection auditToken](v7, "auditToken");
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  v16 = v18;
  v17 = v19;
  if (!sandbox_check_by_audit_token()
    || (v8 = objc_msgSend(a3, "fileSystemRepresentation")) != 0
    && (v16 = v18, v17 = v19, v10 = v8, !sandbox_check_by_audit_token()))
  {
    v9 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", a3, v10);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__NSFileAccessArbiter_getItemHasPresentersAtURL_completionHandler___block_invoke;
    v11[3] = &unk_1E0F53B30;
    v11[4] = &v12;
    objc_msgSend(v9, "forEachPresenterOfItemPerformProcedure:", v11);
  }
  (*((void (**)(id, _QWORD))a4 + 2))(a4, *((unsigned __int8 *)v13 + 24));
  _Block_object_dispose(&v12, 8);
}

uint64_t __67__NSFileAccessArbiter_getItemHasPresentersAtURL_completionHandler___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)getDebugInformationIncludingEverything:(BOOL)a3 withString:(id)a4 fromPid:(int)a5 thenContinue:(id)a6
{
  _BOOL4 v7;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  dispatch_time_t v17;
  NSObject *v18;
  NSFileAccessNode *rootNode;
  _QWORD v20[6];
  BOOL v21;
  _QWORD v22[7];
  _QWORD block[10];
  BOOL v24;
  _QWORD v25[3];
  char v26;
  uint64_t v27;

  v7 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (self->_isSubarbiter)
  {
    v9 = -[NSFileAccessArbiter rootNode](self, "rootNode", a3, a4, *(_QWORD *)&a5);
    if (v7)
      v10 = objc_msgSend(v9, "subarbiterDescription");
    else
      v10 = objc_msgSend(v9, "sensitiveSubarbiterDescription");
    (*((void (**)(id, uint64_t))a6 + 2))(a6, v10);
  }
  else
  {
    v11 = *(_QWORD *)&a5;
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    if (a4)
      objc_msgSend(v13, "setObject:forKey:", a4, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11));
    v14 = (id)-[NSMutableDictionary copy](self->_subarbitrationClaimsByID, "copy");
    v15 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v16 = MEMORY[0x1E0C809B0];
    v26 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke;
    block[3] = &unk_1E0F53F60;
    v24 = v7;
    block[4] = self;
    block[5] = v15;
    block[6] = v14;
    block[7] = v13;
    block[8] = a6;
    block[9] = v25;
    v17 = dispatch_time(0, 2000000000);
    dispatch_after(v17, MEMORY[0x1E0C80D38], block);
    v18 = dispatch_group_create();
    rootNode = self->_rootNode;
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_4;
    v22[3] = &unk_1E0F53FD8;
    v22[4] = v13;
    v22[5] = v18;
    v22[6] = self;
    -[NSFileAccessNode forEachReactorToItemOrContainedItemPerformProcedure:](rootNode, "forEachReactorToItemOrContainedItemPerformProcedure:", v22);
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_7;
    v20[3] = &unk_1E0F54050;
    v20[4] = v18;
    v20[5] = v15;
    v21 = v7;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v20);
    dispatch_group_notify(v18, (dispatch_queue_t)self->_queue, block);
    dispatch_release(v18);
    _Block_object_dispose(v25, 8);
  }
}

uint64_t __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(result + 72) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    v3 = +[NSString string](NSMutableString, "string");
    -[NSString appendString:](v3, "appendString:", CFSTR("Server Information:\n\n"));
    v4 = (void *)objc_msgSend(*(id *)(v2 + 32), "rootNode");
    if (*(_BYTE *)(v2 + 80))
      v5 = objc_msgSend(v4, "description");
    else
      v5 = objc_msgSend(v4, "sensitiveDescription");
    -[NSString appendString:](v3, "appendString:", v5);
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_2;
    v10[3] = &unk_1E0F53F38;
    v7 = *(void **)(v2 + 40);
    v10[4] = *(_QWORD *)(v2 + 48);
    v10[5] = v3;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);
    -[NSString appendString:](v3, "appendString:", CFSTR("\n\nApplication Information:\n\n"));
    v8 = *(void **)(v2 + 56);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_3;
    v9[3] = &unk_1E0F4D940;
    v9[4] = v3;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);
    return (*(uint64_t (**)(_QWORD, NSString *))(*(_QWORD *)(v2 + 64) + 16))(*(_QWORD *)(v2 + 64), v3);
  }
  return result;
}

uint64_t __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  int v6;
  NSString *v7;
  _BYTE buffer[256];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v6 = proc_name(objc_msgSend((id)objc_msgSend(v5, "subarbiterConnection"), "processIdentifier"), buffer, 0x100u);
  if (v6 < 1)
    v7 = 0;
  else
    v7 = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", buffer, v6, 4);
  return objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\n\nSubarbiter Information — %@ (%i):\n\n%@"), v7, objc_msgSend((id)objc_msgSend(v5, "subarbiterConnection"), "processIdentifier"), a3);
}

uint64_t __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  int v6;
  NSString *v7;
  _BYTE buffer[256];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = proc_name(objc_msgSend(a2, "intValue"), buffer, 0x100u);
  if (v6 < 1)
    v7 = 0;
  else
    v7 = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", buffer, v6, 4);
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@ (%i):\n%@\n"), v7, objc_msgSend(a2, "intValue"), a3);
}

uint64_t __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[5];
  __int128 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend(a2, "client"), "processIdentifier");
  result = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  if (!result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", CFSTR("Unknown\n"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_5;
    v6[3] = &unk_1E0F53FB0;
    v6[4] = *(_QWORD *)(a1 + 48);
    v8 = v4;
    v7 = *(_OWORD *)(a1 + 32);
    return objc_msgSend(a2, "collectDebuggingInformationWithCompletionHandler:", v6);
  }
  return result;
}

void __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[7];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_6;
  block[3] = &unk_1E0F53F88;
  block[1] = 3221225472;
  block[4] = v2;
  block[5] = a2;
  v5 = *(_DWORD *)(a1 + 56);
  block[6] = *(_QWORD *)(a1 + 48);
  dispatch_async(v3, block);
}

void __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_6(uint64_t a1)
{
  const __CFString *v2;

  if (*(_QWORD *)(a1 + 40))
    v2 = *(const __CFString **)(a1 + 40);
  else
    v2 = &stru_1E0F56070;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v2, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56)));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v5 = (void *)objc_msgSend(a3, "subarbiterConnection");
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_8;
  v13[3] = &unk_1E0F54000;
  v7 = *(_QWORD *)(a1 + 32);
  v13[4] = *(_QWORD *)(a1 + 40);
  v13[5] = a3;
  v13[6] = v7;
  v8 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = *(unsigned __int8 *)(a1 + 48);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_9;
  v12[3] = &unk_1E0F54028;
  v10 = *(_QWORD *)(a1 + 32);
  v12[4] = *(_QWORD *)(a1 + 40);
  v12[5] = a3;
  v12[6] = v10;
  return objc_msgSend(v8, "provideSubarbiterDebugInfoIncludingEverything:completionHandler:", v9, v12);
}

void __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", CFSTR("Error\n"), objc_msgSend(*(id *)(a1 + 40), "claimID"));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_9(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  const __CFString *v4;
  const __CFString *v5;

  v4 = &stru_1E0F56070;
  if (a2)
    v4 = a2;
  if (a3)
    v5 = CFSTR("Error\n");
  else
    v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, objc_msgSend(*(id *)(a1 + 40), "claimID"));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)_registerForDebugInfoRequests
{
  OS_dispatch_source *v3;
  uint64_t v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  signal(30, (void (__cdecl *)(int))1);
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DC0], 0x1EuLL, 0, (dispatch_queue_t)self->_queue);
  v4 = MEMORY[0x1E0C809B0];
  self->_debugSignalSource = v3;
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __52__NSFileAccessArbiter__registerForDebugInfoRequests__block_invoke;
  v5[3] = &unk_1E0F4D2D8;
  v5[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v3, v5);
  dispatch_resume((dispatch_object_t)self->_debugSignalSource);
}

void __52__NSFileAccessArbiter__registerForDebugInfoRequests__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x186DA8F78]();
  v3 = os_transaction_create();
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__NSFileAccessArbiter__registerForDebugInfoRequests__block_invoke_2;
  v5[3] = &unk_1E0F54078;
  v5[4] = v3;
  objc_msgSend(v4, "getDebugInformationIncludingEverything:withString:fromPid:thenContinue:", 1, 0, 0, v5);
  objc_autoreleasePoolPop(v2);
}

void __52__NSFileAccessArbiter__registerForDebugInfoRequests__block_invoke_2(uint64_t a1, void *a2)
{
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSFileHandle *v10;
  uint64_t v11;
  NSObject *v12;
  int *v13;
  char *v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = NSTemporaryDirectory();
    v5 = -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("filecoordination_%d_dump.txt"), getpid()));
    v6 = open(-[NSString UTF8String](v5, "UTF8String"), 1793, 448);
    v7 = v6;
    if ((int)v6 < 1)
    {
      v9 = _NSOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = __error();
        v14 = strerror(*v13);
        *(_DWORD *)buf = 138412546;
        v16 = v5;
        v17 = 2080;
        v18 = v14;
        _os_log_error_impl(&dword_1817D9000, v9, OS_LOG_TYPE_ERROR, "Failed to open %@ for filecoordinationd dump file: %s", buf, 0x16u);
      }
    }
    else
    {
      if (fchown(v6, 0, 0) || fchmod(v7, 0x180u))
      {
        v8 = _NSOSLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v5;
          _os_log_error_impl(&dword_1817D9000, v8, OS_LOG_TYPE_ERROR, "Failed to set correct permissions for filecoordinationd dump file at %@", buf, 0xCu);
        }
      }
      else
      {
        v10 = -[NSFileHandle initWithFileDescriptor:]([NSFileHandle alloc], "initWithFileDescriptor:", v7);
        v11 = objc_msgSend(a2, "dataUsingEncoding:", 4);
        if (v11)
        {
          -[NSFileHandle writeData:](v10, "writeData:", v11);
          v12 = _NSOSLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v5;
            _os_log_impl(&dword_1817D9000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }
        }

      }
      close(v7);
    }
  }

}

- (void)revokeSubarbitrationClaimForID:(id)a3
{
  -[NSFileAccessArbiter _revokeAccessClaimForID:fromLocal:](self, "_revokeAccessClaimForID:fromLocal:", a3, 0);
}

- (void)cancelAccessClaimForID:(id)a3
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_accessClaimsByID, "objectForKey:");
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v5, "isGranted"))
    {
      objc_msgSend(v6, "cancelled");
    }
    else if ((objc_msgSend(v6, "isRevoked") & 1) == 0)
    {
      objc_msgSend(v6, "revoked");
      -[NSMutableDictionary removeObjectForKey:](self->_accessClaimsByID, "removeObjectForKey:", a3);
      -[NSMutableDictionary removeObjectForKey:](self->_subarbitrationClaimsByID, "removeObjectForKey:", a3);
      -[NSMutableDictionary removeObjectForKey:](self->_accessClaimTransactionsByID, "removeObjectForKey:", a3);
    }
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__NSFileAccessArbiter_cancelAccessClaimForID___block_invoke;
  v7[3] = &unk_1E0F53E20;
  v7[4] = a3;
  -[NSFileAccessArbiter _enumerateSubarbitersUsingBlock:](self, "_enumerateSubarbitersUsingBlock:", v7);
}

uint64_t __46__NSFileAccessArbiter_cancelAccessClaimForID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancelAccessClaimForID:", *(_QWORD *)(a1 + 32));
}

- (void)writerWithPurposeID:(id)a3 didMoveItemAtURL:(id)a4 toURL:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7
{
  NSObject *v13;
  _QWORD v14[9];
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v13 = _NSFCClaimsLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544131;
    v16 = a3;
    v17 = 2113;
    v18 = objc_msgSend(a4, "logicalURL");
    v19 = 2113;
    v20 = objc_msgSend(a5, "logicalURL");
    v21 = 2048;
    v22 = a7;
    _os_log_impl(&dword_1817D9000, v13, OS_LOG_TYPE_INFO, "Received item move hint with purpose %{public}@ -- %{private}@ -> %{private}@ (fileID: %llu)", buf, 0x2Au);
  }
  -[NSFileAccessArbiter _writerWithPurposeID:didMoveItemAtURL:toURL:withFSID:andFileID:](self, "_writerWithPurposeID:didMoveItemAtURL:toURL:withFSID:andFileID:", a3, a4, a5, a6, a7);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__NSFileAccessArbiter_writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke;
  v14[3] = &unk_1E0F53C40;
  v14[4] = a3;
  v14[5] = a4;
  v14[7] = a7;
  v14[8] = a6;
  v14[6] = a5;
  -[NSFileAccessArbiter _enumerateSubarbitersUsingBlock:](self, "_enumerateSubarbitersUsingBlock:", v14);
}

uint64_t __85__NSFileAccessArbiter_writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "writerWithPurposeID:didMoveItemAtURL:toURL:withFSID:andFileID:", a1[4], a1[5], a1[6], a1[8], a1[7]);
}

- (void)writerWithPurposeID:(id)a3 didDisconnectItemAtURL:(id)a4
{
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t v12[16];
  _BYTE buf[22];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = objc_msgSend(a4, "logicalURL");
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "Received item disconnection hint with purpose %{public}@ -- %{private}@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  v8 = -[NSFileAccessNode pathToDescendantForFileURL:componentRange:](self->_rootNode, "pathToDescendantForFileURL:componentRange:", objc_msgSend(a4, "logicalURL"), buf);
  if (v8)
  {
    v9 = -[NSFileAccessNode descendantAtPath:componentRange:create:](self->_rootNode, "descendantAtPath:componentRange:create:", v8, *(_QWORD *)buf, *(_QWORD *)&buf[8], 0);
    if (v9)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __66__NSFileAccessArbiter_writerWithPurposeID_didDisconnectItemAtURL___block_invoke;
      v11[3] = &unk_1E0F540A0;
      v11[4] = a3;
      objc_msgSend(v9, "forEachPresenterOfItemOrContainedItemPerformProcedure:", v11);
    }
  }
  if (self->_isSubarbiter)
  {
    v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_fault_impl(&dword_1817D9000, v10, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a file disconnection, which is a surprise.", v12, 2u);
    }
  }
}

uint64_t __66__NSFileAccessArbiter_writerWithPurposeID_didDisconnectItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "observeDisconnectionByWriterWithPurposeID:", *(_QWORD *)(a1 + 32));
}

- (void)writerWithPurposeID:(id)a3 didReconnectItemAtURL:(id)a4
{
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t v12[16];
  _BYTE buf[22];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = objc_msgSend(a4, "logicalURL");
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "Received item reconnection hint with purpose %{public}@ -- %{private}@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  v8 = -[NSFileAccessNode pathToDescendantForFileURL:componentRange:](self->_rootNode, "pathToDescendantForFileURL:componentRange:", objc_msgSend(a4, "logicalURL"), buf);
  if (v8)
  {
    v9 = -[NSFileAccessNode descendantAtPath:componentRange:create:](self->_rootNode, "descendantAtPath:componentRange:create:", v8, *(_QWORD *)buf, *(_QWORD *)&buf[8], 0);
    if (v9)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __65__NSFileAccessArbiter_writerWithPurposeID_didReconnectItemAtURL___block_invoke;
      v11[3] = &unk_1E0F540A0;
      v11[4] = a3;
      objc_msgSend(v9, "forEachPresenterOfItemOrContainedItemPerformProcedure:", v11);
    }
  }
  if (self->_isSubarbiter)
  {
    v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_fault_impl(&dword_1817D9000, v10, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a file reconnection, which is a surprise.", v12, 2u);
    }
  }
}

uint64_t __65__NSFileAccessArbiter_writerWithPurposeID_didReconnectItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "observeReconnectionByWriterWithPurposeID:", *(_QWORD *)(a1 + 32));
}

- (void)writerWithPurposeID:(id)a3 didChangeUbiquityOfItemAtURL:(id)a4
{
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    v13 = a3;
    v14 = 2113;
    v15 = objc_msgSend(a4, "logicalURL");
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "Received item ubiquity change hint with purpose %{public}@ -- %{private}@", buf, 0x16u);
  }
  v8 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", objc_msgSend(a4, "logicalURL"));
  if (v8)
  {
    v9 = v8;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__NSFileAccessArbiter_writerWithPurposeID_didChangeUbiquityOfItemAtURL___block_invoke;
    v11[3] = &unk_1E0F540C8;
    v11[4] = v8;
    v11[5] = a4;
    objc_msgSend(v8, "forEachPresenterOfItemOrContainingItemPerformProcedure:", v11);
    objc_msgSend(v9, "removeSelfIfUseless");
  }
  if (self->_isSubarbiter)
  {
    v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1817D9000, v10, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a file ubiquity change, which is a surprise.", buf, 2u);
    }
  }
}

uint64_t __72__NSFileAccessArbiter_writerWithPurposeID_didChangeUbiquityOfItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "observeUbiquityChangeAtSubitemPath:withPhysicalURL:", objc_msgSend(*(id *)(a1 + 32), "pathFromAncestor:"), objc_msgSend(*(id *)(a1 + 40), "physicalURL"));
}

- (void)writerWithPurposeID:(id)a3 didChangeSharingOfItemAtURL:(id)a4
{
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    v13 = a3;
    v14 = 2113;
    v15 = objc_msgSend(a4, "logicalURL");
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "Received item sharing change hint with purpose %{public}@ -- %{private}@", buf, 0x16u);
  }
  v8 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", objc_msgSend(a4, "logicalURL"));
  if (v8)
  {
    v9 = v8;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__NSFileAccessArbiter_writerWithPurposeID_didChangeSharingOfItemAtURL___block_invoke;
    v11[3] = &unk_1E0F540C8;
    v11[4] = v8;
    v11[5] = a4;
    objc_msgSend(v8, "forEachPresenterOfItemOrContainingItemPerformProcedure:", v11);
    objc_msgSend(v9, "removeSelfIfUseless");
  }
  if (self->_isSubarbiter)
  {
    v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1817D9000, v10, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a sharing change, which is a surprise.", buf, 2u);
    }
  }
}

uint64_t __71__NSFileAccessArbiter_writerWithPurposeID_didChangeSharingOfItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "observeSharingChangeAtSubitemPath:withPhysicalURL:", objc_msgSend(*(id *)(a1 + 32), "pathFromAncestor:"), objc_msgSend(*(id *)(a1 + 40), "physicalURL"));
}

- (void)writerWithPurposeID:(id)a3 didChangeUbiquityAttributes:(id)a4 ofItemAtURL:(id)a5
{
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = _NSFCClaimsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543875;
    v15 = a3;
    v16 = 2113;
    v17 = objc_msgSend(a5, "logicalURL");
    v18 = 2114;
    v19 = a4;
    _os_log_impl(&dword_1817D9000, v9, OS_LOG_TYPE_INFO, "Received item ubiquity attributes change hint with purpose %{public}@ -- %{private}@. Attributes: %{public}@", buf, 0x20u);
  }
  v10 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", objc_msgSend(a5, "logicalURL"));
  if (v10)
  {
    v11 = v10;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__NSFileAccessArbiter_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL___block_invoke;
    v13[3] = &unk_1E0F540A0;
    v13[4] = a4;
    objc_msgSend(v10, "forEachPresenterOfItemPerformProcedure:", v13);
    objc_msgSend(v11, "removeSelfIfUseless");
  }
  if (self->_isSubarbiter)
  {
    v12 = _NSFCLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1817D9000, v12, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a ubiquity attributes change, which is a surprise.", buf, 2u);
    }
  }
}

uint64_t __83__NSFileAccessArbiter_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "observeChangeOfUbiquityAttributes:", *(_QWORD *)(a1 + 32));
}

- (void)writerWithPurposeID:(id)a3 didMakeItemDisappearAtURL:(id)a4
{
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    v13 = a3;
    v14 = 2113;
    v15 = objc_msgSend(a4, "logicalURL");
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "Received item disappearance hint with purpose %{public}@ -- %{private}@", buf, 0x16u);
  }
  v8 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", objc_msgSend(a4, "logicalURL"));
  if (v8)
  {
    v9 = v8;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__NSFileAccessArbiter_writerWithPurposeID_didMakeItemDisappearAtURL___block_invoke;
    v11[3] = &unk_1E0F540C8;
    v11[4] = a3;
    v11[5] = v8;
    objc_msgSend(v8, "forEachPresenterOfItemOrContainingItemPerformProcedure:", v11);
    objc_msgSend(v9, "removeSelfIfUseless");
  }
  if (self->_isSubarbiter)
  {
    v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1817D9000, v10, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a file disappearance, which is a surprise.", buf, 2u);
    }
  }
}

uint64_t __69__NSFileAccessArbiter_writerWithPurposeID_didMakeItemDisappearAtURL___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(a2, "reactorID"));
  if ((result & 1) == 0)
    return objc_msgSend(a2, "observeDisappearanceAtSubitemPath:", objc_msgSend(*(id *)(a1 + 40), "pathFromAncestor:", a3));
  return result;
}

- (void)writerWithPurposeID:(id)a3 didChangeItemAtURL:(id)a4
{
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    v13 = a3;
    v14 = 2113;
    v15 = objc_msgSend(a4, "logicalURL");
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "Received item change hint with purpose %{public}@ -- %{private}@", buf, 0x16u);
  }
  v8 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", objc_msgSend(a4, "logicalURL"));
  if (v8)
  {
    v9 = v8;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__NSFileAccessArbiter_writerWithPurposeID_didChangeItemAtURL___block_invoke;
    v11[3] = &unk_1E0F540C8;
    v11[4] = a3;
    v11[5] = v8;
    objc_msgSend(v8, "forEachPresenterOfItemOrContainingItemPerformProcedure:", v11);
    objc_msgSend(v9, "removeSelfIfUseless");
  }
  if (self->_isSubarbiter)
  {
    v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1817D9000, v10, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a file change, which is a surprise.", buf, 2u);
    }
  }
}

uint64_t __62__NSFileAccessArbiter_writerWithPurposeID_didChangeItemAtURL___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(a2, "reactorID"));
  if ((result & 1) == 0)
    return objc_msgSend(a2, "observeChangeAtSubitemPath:", objc_msgSend(*(id *)(a1 + 40), "pathFromAncestor:", a3));
  return result;
}

- (void)writerWithPurposeID:(id)a3 didVersionChangeOfKind:(id)a4 toItemAtURL:(id)a5 withClientID:(id)a6 name:(id)a7
{
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[8];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13 = _NSFCClaimsLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543875;
    v19 = a4;
    v20 = 2114;
    v21 = a3;
    v22 = 2113;
    v23 = objc_msgSend(a5, "logicalURL");
    _os_log_impl(&dword_1817D9000, v13, OS_LOG_TYPE_INFO, "Received item version change hint of kind %{public}@ with purpose %{public}@ -- %{private}@", buf, 0x20u);
  }
  v14 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", objc_msgSend(a5, "logicalURL"));
  if (v14)
  {
    v15 = v14;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __96__NSFileAccessArbiter_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name___block_invoke;
    v17[3] = &unk_1E0F540F0;
    v17[4] = v14;
    v17[5] = a4;
    v17[6] = a6;
    v17[7] = a7;
    objc_msgSend(v14, "forEachPresenterOfItemOrContainingItemPerformProcedure:", v17);
    objc_msgSend(v15, "removeSelfIfUseless");
  }
  if (self->_isSubarbiter)
  {
    v16 = _NSFCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1817D9000, v16, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a file version change, which is a surprise.", buf, 2u);
    }
  }
}

uint64_t __96__NSFileAccessArbiter_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "observeVersionChangeOfKind:withClientID:name:subitemPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 32), "pathFromAncestor:"));
}

- (void)tiePresenterForID:(id)a3 toItemAtURL:(id)a4
{
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->_reactorsByID, "objectForKey:");
  if (self->_isSubarbiter || objc_msgSend(v7, "allowedForURL:", objc_msgSend(a4, "logicalURL")))
  {
    if (!objc_msgSend(v7, "itemLocation"))
    {
      v8 = _NSFCPresenterLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543619;
        v13 = a3;
        v14 = 2113;
        v15 = objc_msgSend(a4, "logicalURL");
        _os_log_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ has been tied to a URL for the first time -- %{private}@", buf, 0x16u);
      }
    }
    v9 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", objc_msgSend(a4, "logicalURL"));
    if (v9)
      objc_msgSend(v7, "setItemLocation:", v9);
  }
  else if (v7)
  {
    v10 = _NSFCPresenterLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      v13 = a3;
      v14 = 2113;
      v15 = objc_msgSend(a4, "logicalURL");
      _os_log_impl(&dword_1817D9000, v10, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ not allowed to tie to URL -- %{private}@", buf, 0x16u);
    }
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__NSFileAccessArbiter_tiePresenterForID_toItemAtURL___block_invoke;
  v11[3] = &unk_1E0F53E98;
  v11[4] = a3;
  v11[5] = a4;
  -[NSFileAccessArbiter _enumerateSubarbitersUsingBlock:](self, "_enumerateSubarbitersUsingBlock:", v11);
}

uint64_t __53__NSFileAccessArbiter_tiePresenterForID_toItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tiePresenterForID:toItemAtURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  _QWORD block[5];
  char v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_2;
  block[3] = &unk_1E0F54118;
  v2 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v4 = a2;
  dispatch_async(v2, block);
}

uint64_t __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void *__88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_3()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/FileProvider.framework/FileProvider", 256);
  if (result)
  {
    result = dlsym(result, "FPRegisterFileProvidersForUserAtURLs");
    off_1ECD09440 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))result;
  }
  return result;
}

uint64_t __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[6];
  BOOL v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = _NSFCProviderLog();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 67109378;
      v15 = v8;
      v16 = 2114;
      v17 = a2;
      _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "Error occurred while asking fileproviderd (%d) to prepare providers: %{public}@", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    v15 = v9;
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "fileproviderd (%d) finished preparing providers", buf, 8u);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_275;
  block[3] = &unk_1E0F54188;
  v10 = *(NSObject **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v13 = a2 == 0;
  block[4] = v11;
  block[5] = a3;
  dispatch_async(v10, block);
}

uint64_t __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_275(uint64_t a1)
{
  --_MergedGlobals_19_2;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

@end
