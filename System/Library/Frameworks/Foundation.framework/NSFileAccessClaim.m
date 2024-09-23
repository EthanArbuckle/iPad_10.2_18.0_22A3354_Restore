@implementation NSFileAccessClaim

- (void)prepareClaimForGrantingWithArbiterQueue:(id)a3
{
  if (self->_arbiterQueue)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileAccessClaim.m"), 295, CFSTR("This claim has already been prepared for granting"));
  self->_arbiterQueue = (OS_dispatch_queue *)a3;
  if (a3)
    dispatch_retain((dispatch_object_t)a3);
  self->_originatingReactorQueueID = (id)-[NSMutableDictionary objectForKeyedSubscript:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKeyedSubscript:", CFSTR("_NSCurrentReactorID"));
}

- (OS_dispatch_semaphore)claimerWaiter
{
  return self->_claimerWaiter;
}

- (id)claimID
{
  return self->_claimID;
}

- (void)unblockClaimerForReason:(id)a3
{
  uint64_t v4;

  v4 = -[NSMutableArray indexOfObject:](self->_claimerBlockageReasons, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_claimerBlockageReasons, "removeObjectAtIndex:", v4);
  if (!-[NSMutableArray count](self->_claimerBlockageReasons, "count"))
    -[NSFileAccessClaim invokeClaimer](self, "invokeClaimer");
}

- (NSFileAccessClaim)initWithClient:(id)a3 claimID:(id)a4 purposeID:(id)a5
{
  NSFileAccessClaim *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSFileAccessClaim;
  v8 = -[NSFileAccessClaim init](&v10, sel_init);
  if (v8)
  {
    v8->_client = (NSXPCConnection *)a3;
    v8->_claimerWaiter = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    -[NSFileAccessClaim _setupWithClaimID:purposeID:originatingReactorQueueID:](v8, "_setupWithClaimID:purposeID:originatingReactorQueueID:", a4, a5, 0);
  }
  return v8;
}

- (NSFileAccessClaim)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileAccessClaims should only ever be decoded by XPC"), 0));
  }
  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSClaimIDKey"));
  v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPurposeIDKey"));
  -[NSFileAccessClaim _setupWithClaimID:purposeID:originatingReactorQueueID:](self, "_setupWithClaimID:purposeID:originatingReactorQueueID:", v5, v6, objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSOriginatingReactorQueueID")));
  return self;
}

- (void)_setupWithClaimID:(id)a3 purposeID:(id)a4 originatingReactorQueueID:(id)a5
{
  NSString *v8;

  if (a3)
    v8 = (NSString *)a3;
  else
    v8 = +[NSFileCoordinator _createIdentifierForNewClaim](NSFileCoordinator, "_createIdentifierForNewClaim");
  self->_claimID = v8;
  self->_purposeIDOrNil = (NSString *)a4;
  self->_blockageCount = 1;
  self->_claimerBlockageReasons = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("Initial blockage"), 0);
  self->_originatingReactorQueueID = a5;
}

- (void)finished
{
  NSMutableArray *finishingProcedures;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  finishingProcedures = self->_finishingProcedures;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](finishingProcedures, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(finishingProcedures);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i) + 16))();
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](finishingProcedures, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }

  self->_finishingProcedures = 0;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_fileHandlesForEvictionProtection, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_144_0);

  self->_fileHandlesForEvictionProtection = 0;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileAccessClaims should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", self->_claimID, CFSTR("NSClaimIDKey"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_purposeIDOrNil, CFSTR("NSPurposeIDKey"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_originatingReactorQueueID, CFSTR("NSOriginatingReactorQueueID"));
}

- (id)purposeID
{
  return self->_purposeIDOrNil;
}

- (void)makeProviderOfItemAtLocation:(id)a3 provideOrAttachPhysicalURLIfNecessaryForPurposeID:(id)a4 readingOptions:(unint64_t)a5 thenContinue:(id)a6
{
  char v7;
  void *v11;
  char v12;
  _QWORD v13[6];
  char v14;
  uint64_t v15;

  v7 = a5;
  v15 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(a3, "itemProvider");
  if (v11
    && (v12 = objc_msgSend((id)objc_msgSend(v11, "reactorID"), "isEqualToString:", a4), (v7 & 4) != 0)
    && (v12 & 1) == 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __128__NSFileAccessClaim_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_readingOptions_thenContinue___block_invoke;
    v13[3] = &unk_1E0F53220;
    v14 = 1;
    v13[4] = a3;
    v13[5] = a6;
    -[NSFileAccessClaim makeProviderOfItemAtLocation:providePhysicalURLThenContinue:](self, "makeProviderOfItemAtLocation:providePhysicalURLThenContinue:", a3, v13);
  }
  else
  {
    (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
  }
}

- (void)invokeClaimer
{
  NSObject *claimerWaiter;

  if (!self->_hasInvokedClaimer)
  {
    claimerWaiter = self->_claimerWaiter;
    if (claimerWaiter)
      dispatch_semaphore_signal(claimerWaiter);
    self->_hasInvokedClaimer = 1;
  }
}

- (id)claimerError
{
  return self->_claimerError;
}

- (BOOL)didWait
{
  return self->_didWait;
}

- (void)makeProviderOfItemAtLocation:(id)a3 provideOrAttachPhysicalURLIfNecessaryForPurposeID:(id)a4 writingOptions:(unint64_t)a5 thenContinue:(id)a6
{
  char v7;
  void *v11;
  char v12;
  _QWORD v13[6];
  BOOL v14;
  uint64_t v15;

  v7 = a5;
  v15 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(a3, "itemProvider");
  if (v11
    && (v12 = objc_msgSend((id)objc_msgSend(v11, "reactorID"), "isEqualToString:", a4), (v7 & 0x13) != 0)
    && (v12 & 1) == 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __128__NSFileAccessClaim_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_writingOptions_thenContinue___block_invoke;
    v13[3] = &unk_1E0F53220;
    v14 = (v7 & 0x11) == 0;
    v13[4] = a3;
    v13[5] = a6;
    -[NSFileAccessClaim makeProviderOfItemAtLocation:providePhysicalURLThenContinue:](self, "makeProviderOfItemAtLocation:providePhysicalURLThenContinue:", a3, v13);
  }
  else
  {
    (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
  }
}

- (BOOL)shouldEnableMaterializationDuringAccessorBlock
{
  return self->_shouldEnableMaterializationDuringAccessorBlock;
}

- (void)_protectIfNecessaryFileAtURL:(id)a3 withOptions:(unint64_t)a4 forReading:(BOOL)a5
{
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  NSFileHandle *v10;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  v7 = (a4 >> 2) & 1;
  if (!a4)
    LODWORD(v7) = 1;
  if (a5)
    v8 = (a4 & 0xC) == 0;
  else
    v8 = v7;
  if (!-[NSMutableDictionary objectForKey:](self->_fileHandlesForEvictionProtection, "objectForKey:"))
  {
    v11[0] = 0;
    if (objc_msgSend(a3, "getResourceValue:forKey:error:", v11, *MEMORY[0x1E0C99C00], 0))
    {
      if ((v8 & objc_msgSend(v11[0], "BOOLValue") & 1) == 0)
        return;
    }
    else if (!v8)
    {
      return;
    }
    if (!self->_fileHandlesForEvictionProtection)
      self->_fileHandlesForEvictionProtection = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(a3, "fileSystemRepresentation"))
    {
      v9 = open((const char *)objc_msgSend(a3, "fileSystemRepresentation"), 0x8000);
      if ((_DWORD)v9 == -1)
      {
        -[NSMutableDictionary setObject:forKey:](self->_fileHandlesForEvictionProtection, "setObject:forKey:", +[NSFileHandle fileHandleWithNullDevice](NSFileHandle, "fileHandleWithNullDevice"), a3);
      }
      else
      {
        v10 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]([NSFileHandle alloc], "initWithFileDescriptor:closeOnDealloc:", v9, 1);
        -[NSMutableDictionary setObject:forKey:](self->_fileHandlesForEvictionProtection, "setObject:forKey:", v10, a3);

      }
    }
  }
}

- (void)makeProvidersProvideItemsForReadingLocations:(id)a3 options:(unint64_t *)a4 andWritingLocationsIfNecessary:(id)a5 options:(unint64_t *)a6 thenContinue:(id)a7
{
  _QWORD v13[11];

  v13[10] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_arbiterQueue);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke;
  v13[3] = &unk_1E0F531D0;
  v13[4] = self;
  v13[5] = a5;
  v13[6] = a3;
  v13[7] = a7;
  v13[8] = a6;
  v13[9] = a4;
  -[NSFileAccessClaim ensureProvidersOfItemsAtReadingLocations:writingLocations:thenContinue:](self, "ensureProvidersOfItemsAtReadingLocations:writingLocations:thenContinue:", a3, a5, v13);
}

- (void)ensureProvidersOfItemsAtReadingLocations:(id)a3 writingLocations:(id)a4 thenContinue:(id)a5
{
  id v9;

  if (objc_msgSend(a3, "count") || objc_msgSend(a4, "count"))
  {
    v9 = (id)objc_opt_new();
    if (a3)
      objc_msgSend(v9, "addObjectsFromArray:", a3);
    if (a4)
      objc_msgSend(v9, "addObjectsFromArray:", a4);
    +[NSFileAccessArbiter ensureProvidersIfNecessaryForClaim:user:atLocations:queue:thenContinue:](NSFileAccessArbiter, "ensureProvidersIfNecessaryForClaim:user:atLocations:queue:thenContinue:", self, -[NSXPCConnection effectiveUserIdentifier](self->_client, "effectiveUserIdentifier"), v9, self->_arbiterQueue, a5);

  }
  else
  {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)blockClaimerForReason:(id)a3
{
  if (!-[NSMutableArray count](self->_claimerBlockageReasons, "count"))
    NSLog((NSString *)CFSTR("NSFileCoordinator: -[NSFileAccessClaim blockClaimerForReason:] is being invoked with %@ when the claimer has already been invoked."), a3);
  -[NSMutableArray addObject:](self->_claimerBlockageReasons, "addObject:", a3);
}

- (BOOL)shouldMakeProviderProvideItemAtLocation:(id)a3 withOptions:(unint64_t)a4
{
  char v4;
  void *v6;

  v4 = a4;
  v6 = (void *)objc_msgSend(a3, "itemProvider");
  if (v6)
  {
    if (-[NSString isEqual:](self->_purposeIDOrNil, "isEqual:", objc_msgSend(v6, "reactorID")))
      LOBYTE(v6) = 0;
    else
      LOBYTE(v6) = !self->_cameFromSuperarbiter && (v4 & 4) == 0;
  }
  return (char)v6;
}

- (BOOL)shouldBeRevokedPriorToInvokingAccessor
{
  return 0;
}

- (void)whenRevokedPerformProcedure:(id)a3
{
  id v5;

  if (!self->_revocationProcedures)
    self->_revocationProcedures = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (id)objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](self->_revocationProcedures, "addObject:", v5);

}

- (void)revoked
{
  uint64_t v3;
  NSObject *v4;
  NSString *claimID;
  NSMutableArray *revocationProcedures;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableDictionary *reacquisitionProceduresByPresenterID;
  int v11;
  unsigned __int8 v12;
  uint64_t v13;
  _QWORD v14[6];
  __int128 buf;
  uint64_t v16;
  int v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = atomic_load(&_NSFCSubarbitrationCount);
  if (v3 < 1
    || (v12 = atomic_load(_NSFCDisableLogSuppression), (v12 & 1) != 0)
    || (v13 = atomic_load(&_NSFCSubarbitratedClaimCount), v13 <= 199))
  {
    v4 = _NSFCClaimsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      claimID = self->_claimID;
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = claimID;
      _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ was revoked", (uint8_t *)&buf, 0xCu);
    }
  }
  self->_isRevoked = 1;
  -[NSFileAccessClaim cancelled](self, "cancelled");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  revocationProcedures = self->_revocationProcedures;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](revocationProcedures, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(revocationProcedures);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i) + 16))();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](revocationProcedures, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v7);
  }

  self->_revocationProcedures = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v16 = 0x2020000000;
  v17 = 1;
  reacquisitionProceduresByPresenterID = self->_reacquisitionProceduresByPresenterID;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __28__NSFileAccessClaim_revoked__block_invoke;
  v14[3] = &unk_1E0F53420;
  v14[4] = self;
  v14[5] = &buf;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](reacquisitionProceduresByPresenterID, "enumerateKeysAndObjectsUsingBlock:", v14);

  self->_reacquisitionProceduresByPresenterID = 0;
  v11 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) - 1;
  *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = v11;
  if (!v11)
    -[NSFileAccessClaim devalueSelf](self, "devalueSelf");
  _Block_object_dispose(&buf, 8);
}

- (void)cancelled
{
  NSMutableArray *providerCancellationProcedures;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSString *claimID;
  int v10;
  NSString *v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  providerCancellationProcedures = self->_providerCancellationProcedures;
  if (providerCancellationProcedures)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](providerCancellationProcedures, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(providerCancellationProcedures);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7++) + 16))();
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](providerCancellationProcedures, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v5);
    }
  }

  self->_providerCancellationProcedures = 0;
  if (-[NSMutableArray count](self->_claimerBlockageReasons, "count"))
  {
    v8 = _NSFCClaimsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      claimID = self->_claimID;
      v10 = 138543362;
      v11 = claimID;
      _os_log_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ was cancelled before claimer was invoked", (uint8_t *)&v10, 0xCu);
    }
    if (!self->_claimerError)
      self->_claimerError = -[NSError initWithDomain:code:userInfo:]([NSError alloc], "initWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3072, 0);
    -[NSFileAccessClaim invokeClaimer](self, "invokeClaimer");
  }
}

- (void)devalueSelf
{
  uint64_t v3;
  NSObject *v4;
  NSString *claimID;
  NSMutableOrderedSet *pendingClaims;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id *v11;
  NSMutableArray *devaluationProcedures;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  unsigned __int8 v17;
  uint64_t v18;
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
  uint8_t buf[4];
  NSString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[NSFileAccessProcessManager invalidate](self->_processManager, "invalidate");

  self->_processManager = 0;
  v3 = atomic_load(&_NSFCSubarbitrationCount);
  if (v3 < 1
    || (v17 = atomic_load(_NSFCDisableLogSuppression), (v17 & 1) != 0)
    || (v18 = atomic_load(&_NSFCSubarbitratedClaimCount), v18 <= 199))
  {
    v4 = _NSFCClaimsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      claimID = self->_claimID;
      *(_DWORD *)buf = 138543362;
      v30 = claimID;
      _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_INFO, "Claim %{public}@ was devalued", buf, 0xCu);
    }
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  pendingClaims = self->_pendingClaims;
  v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](pendingClaims, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(pendingClaims);
        v11 = *(id **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11[10], "removeObject:", self);
        objc_msgSend(v11, "unblock");
      }
      v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](pendingClaims, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    }
    while (v8);
  }

  self->_pendingClaims = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  devaluationProcedures = self->_devaluationProcedures;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](devaluationProcedures, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(devaluationProcedures);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j) + 16))();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](devaluationProcedures, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    }
    while (v14);
  }

  self->_devaluationProcedures = 0;
}

- (void)unblock
{
  unint64_t blockageCount;
  unint64_t v4;
  NSFileAccessProcessManager *processManager;

  blockageCount = self->_blockageCount;
  if (!blockageCount)
  {
    NSLog((NSString *)CFSTR("NSFileCoordinator: an access claim that was unblocked is somehow becoming even more unblocked."), a2);
    blockageCount = self->_blockageCount;
  }
  v4 = blockageCount - 1;
  self->_blockageCount = v4;
  if (!v4 && !self->_isRevoked)
  {
    processManager = self->_processManager;
    if (processManager)
      -[NSFileAccessProcessManager preventSuspensionWithActivityName:](processManager, "preventSuspensionWithActivityName:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("File Coordination Claim %@"), -[NSFileAccessClaim claimID](self, "claimID")));
    -[NSFileAccessClaim granted](self, "granted");
  }
}

- (void)startObservingClientState
{
  NSXPCConnection *client;
  pid_t v4;
  NSObject *v5;
  NSString *claimID;
  _QWORD v7[5];
  pid_t v8;
  uint8_t buf[4];
  pid_t v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  client = self->_client;
  if (client && self->_arbiterQueue && !self->_cameFromSuperarbiter)
  {
    v4 = -[NSXPCConnection processIdentifier](client, "processIdentifier");
    v5 = _NSFCProcessMonitorLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      claimID = self->_claimID;
      *(_DWORD *)buf = 67109378;
      v10 = v4;
      v11 = 2114;
      v12 = claimID;
      _os_log_impl(&dword_1817D9000, v5, OS_LOG_TYPE_INFO, "Starting to observe state of client with pid %d on behalf of claim %{public}@", buf, 0x12u);
    }
    self->_processManager = -[NSFileAccessProcessManager initWithClient:queue:]([NSFileAccessProcessManager alloc], "initWithClient:queue:", -[NSXPCConnection _xpcConnection](self->_client, "_xpcConnection"), self->_arbiterQueue);
    -[NSFileAccessProcessManager setURLs:](self->_processManager, "setURLs:", -[NSFileAccessClaim allURLs](self, "allURLs"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__NSFileAccessClaim_startObservingClientState__block_invoke;
    v7[3] = &unk_1E0F53068;
    v7[4] = self;
    v8 = v4;
    -[NSFileAccessProcessManager setSuspensionHandler:](self->_processManager, "setSuspensionHandler:", v7);
  }
}

- (void)acceptClaimFromClient:(id)a3 arbiterQueue:(id)a4 grantHandler:(id)a5
{
  if (self->_client)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileAccessClaim.m"), 309, CFSTR("This claim has already been accepted"));
  self->_client = (NSXPCConnection *)a3;
  self->_arbiterQueue = (OS_dispatch_queue *)a4;
  if (a4)
    dispatch_retain((dispatch_object_t)a4);
  self->_serverClaimerOrNil = (id)objc_msgSend(a5, "copy");
}

- (void)dealloc
{
  NSObject *claimerWaiter;
  id serverClaimerOrNil;
  NSObject *arbiterQueue;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];

  claimerWaiter = self->_claimerWaiter;
  if (claimerWaiter)
    dispatch_release(claimerWaiter);

  serverClaimerOrNil = self->_serverClaimerOrNil;
  if (serverClaimerOrNil)

  -[NSFileAccessProcessManager invalidate](self->_processManager, "invalidate");
  arbiterQueue = self->_arbiterQueue;
  if (arbiterQueue)
    dispatch_release(arbiterQueue);

  v6.receiver = self;
  v6.super_class = (Class)NSFileAccessClaim;
  -[NSFileAccessClaim dealloc](&v6, sel_dealloc);
}

- (BOOL)canAccessLocations:(id)a3 forReading:(BOOL)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  char v15;
  NSString *claimID;
  NSString *purposeIDOrNil;
  _BOOL4 v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  NSString *v26;
  __int16 v27;
  NSString *v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v19 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v31;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v20[0] = v10;
        v20[1] = 3221225472;
        v20[2] = __57__NSFileAccessClaim_canAccessLocations_forReading_error___block_invoke;
        v20[3] = &unk_1E0F53388;
        v20[4] = self;
        v20[5] = &v21;
        objc_msgSend(v12, "forEachPresenterOfItemPerformProcedure:", v20);
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
    }
    while (v8);
  }
  if (!*((_BYTE *)v22 + 24))
  {
    v13 = _NSFCClaimsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      claimID = self->_claimID;
      purposeIDOrNil = self->_purposeIDOrNil;
      *(_DWORD *)buf = 138543618;
      v26 = claimID;
      v27 = 2114;
      v28 = purposeIDOrNil;
      _os_log_error_impl(&dword_1817D9000, v13, OS_LOG_TYPE_ERROR, "Denying access for claim %{public}@ because the presenter (reactor ID: %{public}@) performing it has been disconnected", buf, 0x16u);
      if (!a5)
        goto LABEL_15;
    }
    else if (!a5)
    {
      goto LABEL_15;
    }
    if (v19)
      v14 = 257;
    else
      v14 = 513;
    *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), v14, 0);
  }
LABEL_15:
  v15 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);
  return v15;
}

- (void)makePresentersOfItemAtLocation:(id)a3 orContainedItem:(BOOL)a4 relinquishUsingProcedureGetter:(id)a5
{
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSString *claimID;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSString *v20;
  __int128 v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[6];
  _QWORD v25[8];
  _QWORD v26[3];
  char v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!self->_cameFromSuperarbiter)
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v27 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke;
    v25[3] = &unk_1E0F53310;
    v25[4] = self;
    v25[5] = a3;
    v25[6] = a5;
    v25[7] = v26;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_5;
    v24[3] = &unk_1E0F53338;
    v24[4] = a3;
    v24[5] = v25;
    objc_msgSend(a3, "forEachPresenterOfContainingFilePackagePerformProcedure:", v24);
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_6;
    v23[3] = &unk_1E0F53360;
    v23[4] = v25;
    objc_msgSend(a3, "forEachPresenterOfItemPerformProcedure:", v23);
    if (a4 || objc_msgSend(a3, "itemIsFilePackage"))
    {
      v22[0] = v8;
      v22[1] = 3221225472;
      v22[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_7;
      v22[3] = &unk_1E0F53360;
      v22[4] = v25;
      objc_msgSend(a3, "forEachPresenterOfContainedItemPerformProcedure:", v22);
    }
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", -[NSFileAccessClaim pendingClaims](self, "pendingClaims"));
    if (objc_msgSend(v9, "count"))
    {
      v10 = _NSFCClaimsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        claimID = self->_claimID;
        *(_DWORD *)buf = 138543362;
        v29 = (uint64_t)claimID;
        _os_log_impl(&dword_1817D9000, v10, OS_LOG_TYPE_INFO, "Re-evaluating claims pending %{public}@", buf, 0xCu);
      }
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    if (v12)
    {
      v14 = *(_QWORD *)v36;
      *(_QWORD *)&v13 = 138543874;
      v21 = v13;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v9);
          v16 = *(_QWORD **)(*((_QWORD *)&v35 + 1) + 8 * v15);
          v17 = v16[24];
          if (v17
            && -[NSFileAccessClaim claimerInvokingIsBlockedByReactorWithID:](self, "claimerInvokingIsBlockedByReactorWithID:", v16[24]))
          {
            v18 = _NSFCClaimsLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = objc_msgSend(v16, "claimID");
              v20 = self->_claimID;
              *(_DWORD *)buf = v21;
              v29 = v19;
              v30 = 2114;
              v31 = v20;
              v32 = 2114;
              v33 = v17;
              _os_log_impl(&dword_1817D9000, v18, OS_LOG_TYPE_DEFAULT, "Letting claim %{public}@ go before blocking claim %{public}@ because the latter is blocked by a reactor with the former's purposeID: %{public}@", buf, 0x20u);
            }
            -[NSFileAccessClaim givePriorityToClaim:](self, "givePriorityToClaim:", v16, v21);
          }
          ++v15;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
      }
      while (v12);
    }
    _Block_object_dispose(v26, 8);
  }
}

- (id)pendingClaims
{
  NSMutableOrderedSet *pendingClaims;

  pendingClaims = self->_pendingClaims;
  if (!pendingClaims)
    pendingClaims = (NSMutableOrderedSet *)MEMORY[0x1E0C99D20];
  return (id)-[NSMutableOrderedSet array](pendingClaims, "array");
}

- (BOOL)shouldInformProvidersAboutEndOfWriteWithOptions:(unint64_t)a3
{
  int v3;
  _BOOL4 v4;

  v3 = a3;
  v4 = !-[NSFileAccessClaim cameFromSuperarbiter](self, "cameFromSuperarbiter");
  return (*(_QWORD *)&v3 & 0x30000) == 0 && v4;
}

- (BOOL)cameFromSuperarbiter
{
  return self->_cameFromSuperarbiter;
}

- (void)block
{
  unint64_t blockageCount;

  blockageCount = self->_blockageCount;
  if (!blockageCount)
  {
    NSLog((NSString *)CFSTR("NSFileCoordinator: an access claim that was unblocked has somehow become blocked again."), a2);
    blockageCount = self->_blockageCount;
  }
  self->_blockageCount = blockageCount + 1;
}

- (void)evaluateNewClaim:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSString *claimID;
  NSString *purposeIDOrNil;
  int v10;
  uint64_t v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 != self)
  {
    v5 = objc_msgSend(a3, "purposeID");
    if (v5 && -[NSString isEqual:](self->_purposeIDOrNil, "isEqual:", v5) && !self->_isRevoked)
    {
      v6 = _NSFCClaimsLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = objc_msgSend(a3, "claimID");
        claimID = self->_claimID;
        purposeIDOrNil = self->_purposeIDOrNil;
        v10 = 138543874;
        v11 = v7;
        v12 = 2114;
        v13 = claimID;
        v14 = 2114;
        v15 = purposeIDOrNil;
        _os_log_impl(&dword_1817D9000, v6, OS_LOG_TYPE_INFO, "Claim %{public}@ is not blocked by %{public}@ because it has the same purposeID: %{public}@", (uint8_t *)&v10, 0x20u);
      }
    }
    else if (-[NSFileAccessClaim blocksClaim:](self, "blocksClaim:", a3))
    {
      -[NSFileAccessClaim scheduleBlockedClaim:](self, "scheduleBlockedClaim:", a3);
    }
  }
}

void __29__NSFileAccessClaim_finished__block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  if ((objc_msgSend(a3, "closeAndReturnError:", &v6) & 1) == 0)
  {
    v4 = _NSFCClaimsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend(a2, "path");
      *(_DWORD *)buf = 138478083;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Failed to close file at %{private}@ because of error: %@", buf, 0x16u);
    }
  }
}

uint64_t __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  int v7;
  BOOL v8;
  void *v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a3);
  result = objc_msgSend(*(id *)(a1 + 32), "shouldMakeProviderProvideItemAtLocation:withOptions:", a2, v5);
  v7 = result;
  if ((_DWORD)result)
    v8 = (v5 & 0x20000) == 0;
  else
    v8 = 0;
  if (!v8)
  {
LABEL_8:
    if (!v7)
      return result;
    goto LABEL_9;
  }
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    result = objc_msgSend(v9, "indexOfObjectIdenticalTo:", a2);
    if (result != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8 * result) != 2)
        return result;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_9:
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", a2))
  {
    objc_msgSend(*(id *)(a1 + 56), "removeObject:", a2);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

uint64_t __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke(uint64_t a1)
{
  void *v3;
  int8x16_t v4;
  int8x16_t v5;
  _QWORD v6[5];
  int8x16_t v7;
  uint64_t v8;
  int8x16_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isRevoked"))
    return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 1);
  v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_2;
  v6[3] = &unk_1E0F531A8;
  v6[4] = v3;
  v4 = *(int8x16_t *)(a1 + 40);
  v7 = vextq_s8(v4, v4, 8uLL);
  v5 = *(int8x16_t *)(a1 + 64);
  v9 = vextq_s8(v5, v5, 8uLL);
  v8 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(v3, "_checkIfMovingRequiresProvidingAmongWritingLocations:options:thenContinue:", v4.i64[0], v5.i64[0], v6);
}

void __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  dispatch_group_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  id obj;
  _QWORD block[8];
  _QWORD v31[11];
  __int128 v32;
  _QWORD v33[2];
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t, uint64_t *);
  void *v35;
  void *v36;
  dispatch_group_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD v40[3];
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE v50[128];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "count"))
    objc_msgSend(*(id *)(a1 + 32), "setShouldEnableMaterializationDuringAccessorBlock:", 1);
  v4 = (void *)objc_opt_new();
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 1;
  v5 = dispatch_group_create();
  v6 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v34 = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_3;
  v35 = &unk_1E0F53158;
  v36 = v4;
  v37 = v5;
  v38 = *(_QWORD *)(a1 + 32);
  v39 = v40;
  v7 = (void *)objc_msgSend(a2, "mutableCopy");
  v31[0] = v6;
  v31[1] = 3221225472;
  v31[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_5;
  v31[3] = &unk_1E0F53180;
  v8 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v31[4] = *(_QWORD *)(a1 + 32);
  v31[5] = v9;
  v32 = *(_OWORD *)(a1 + 64);
  v31[6] = a2;
  v31[7] = v7;
  v31[8] = v33;
  v31[9] = &v42;
  v31[10] = &v46;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v31);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v60, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v62 != v11)
          objc_enumerationMutation(v7);
        v34((uint64_t)v33, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i), 0x20000, v43 + 3);
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v60, 16);
    }
    while (v10);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v28 = v5;
  obj = *(id *)(a1 + 48);
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v55, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v57 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        v17 = objc_msgSend(v16, "parent");
        v18 = a1;
        if (objc_msgSend(*(id *)(a1 + 32), "shouldMakeProviderProvideItemAtLocation:withOptions:", v17, 0)&& (objc_msgSend(v4, "containsObject:", v17) & 1) == 0&& (objc_msgSend(v4, "containsObject:", v16) & 1) == 0)
        {
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v52;
LABEL_20:
            v21 = 0;
            while (1)
            {
              if (*(_QWORD *)v52 != v20)
                objc_enumerationMutation(v4);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v21), "itemIsInItemAtLocation:", v17) & 1) != 0)
                break;
              if (v19 == ++v21)
              {
                v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
                if (v19)
                  goto LABEL_20;
                goto LABEL_26;
              }
            }
          }
          else
          {
LABEL_26:
            v22 = objc_msgSend(v16, "parent");
            v34((uint64_t)v33, v22, 0x20000000, v43 + 3);
          }
        }
        a1 = v18;
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v55, 16);
    }
    while (v13);
  }

  v23 = MEMORY[0x1E0C809B0];
  v24 = v43[3];
  if (v47[3] | v24)
  {
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Providing for %ld readers and %ld writers"), v47[3], v24);
    objc_msgSend(*(id *)(a1 + 32), "blockClaimerForReason:", v25);
    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(NSObject **)(v26 + 184);
    block[0] = v23;
    block[1] = 3221225472;
    block[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_6;
    block[3] = &unk_1E0F53910;
    block[6] = *(_QWORD *)(a1 + 56);
    block[7] = v40;
    block[4] = v26;
    block[5] = v25;
    dispatch_group_notify(v28, v27, block);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  dispatch_release(v28);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
}

- (void)whenDevaluedPerformProcedure:(id)a3
{
  id v5;

  if (!self->_devaluationProcedures)
    self->_devaluationProcedures = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (id)objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](self->_devaluationProcedures, "addObject:", v5);

}

- (BOOL)isRevoked
{
  return self->_isRevoked;
}

- (void)_checkIfMovingRequiresProvidingAmongWritingLocations:(id)a3 options:(unint64_t *)a4 thenContinue:(id)a5
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v20;
  void *v21;
  NSString *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  NSObject *arbiterQueue;
  NSString *v38;
  void (**v39)(id, void *);
  id obj;
  void *v41;
  id v42;
  _QWORD block[9];
  _QWORD v44[9];
  _QWORD v45[4];
  int v46;
  _QWORD v47[8];
  _BYTE v48[128];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)objc_msgSend(a3, "count") < 2)
  {
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
  }
  else
  {
    v39 = (void (**)(id, void *))a5;
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_opt_new();
    v11 = (void *)objc_opt_new();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke;
    v47[3] = &unk_1E0F530B8;
    v47[4] = v10;
    v47[5] = v11;
    v47[6] = v9;
    v47[7] = a4;
    objc_msgSend(a3, "enumerateObjectsUsingBlock:", v47);

    v41 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    obj = (id)objc_opt_new();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v60 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          v16 = (void *)objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
          v17 = (void *)objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
          v18 = -[NSFileAccessClaim shouldMakeProviderProvideItemAtLocation:withOptions:](self, "shouldMakeProviderProvideItemAtLocation:withOptions:", v16, 0);
          if (v16 != v17 && v18)
          {
            v20 = (void *)objc_msgSend(v16, "itemProvider");
            v21 = (void *)objc_msgSend(v17, "itemProvider");
            if (v20 == v21
              || objc_msgSend((id)objc_msgSend(v20, "reactorID"), "isEqualToString:", objc_msgSend(v21, "reactorID")))
            {
              objc_msgSend(obj, "addObject:", v15);
            }
            else
            {
              objc_msgSend(v41, "addObject:", v16);
            }
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
      }
      while (v12);
    }

    if (objc_msgSend(obj, "count"))
    {
      v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Checking with provider about %ld moving items"), objc_msgSend(obj, "count"));
      -[NSFileAccessClaim blockClaimerForReason:](self, "blockClaimerForReason:", v22);
      v38 = v22;
      v45[0] = 0;
      v45[1] = v45;
      v45[2] = 0x2810000000;
      v45[3] = &unk_1823C230D;
      v46 = 0;
      v23 = dispatch_group_create();
      v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v55;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v55 != v25)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
            v28 = (void *)objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
            v29 = (void *)objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
            dispatch_group_enter(v23);
            v30 = (void *)objc_msgSend(v28, "itemProvider");
            objc_msgSend(v42, "addObject:", objc_msgSend(v30, "reactorID"));
            v31 = objc_msgSend(v28, "standardizedURL");
            v32 = objc_msgSend((id)objc_msgSend(v29, "parent"), "standardizedURL");
            v33 = objc_msgSend(v29, "name");
            v44[0] = MEMORY[0x1E0C809B0];
            v44[1] = 3221225472;
            v44[2] = __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke_2;
            v44[3] = &unk_1E0F530E0;
            v44[7] = v23;
            v44[8] = v45;
            v44[4] = v41;
            v44[5] = v28;
            v44[6] = self;
            objc_msgSend(v30, "movingItemAtURL:requiresProvidingWithDestinationDirectoryURL:newFileName:completionHandler:", v31, v32, v33, v44);
          }
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
        }
        while (v24);
      }
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v34 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v50;
        do
        {
          for (k = 0; k != v34; ++k)
          {
            if (*(_QWORD *)v50 != v35)
              objc_enumerationMutation(v42);
            -[NSFileAccessClaim addBlockingReactorID:](self, "addBlockingReactorID:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k));
          }
          v34 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
        }
        while (v34);
      }
      arbiterQueue = self->_arbiterQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke_3;
      block[3] = &unk_1E0F53108;
      block[4] = v41;
      block[5] = self;
      block[6] = v38;
      block[7] = v42;
      block[8] = v39;
      dispatch_group_notify(v23, arbiterQueue, block);
      dispatch_release(v23);
      _Block_object_dispose(v45, 8);
    }
    else
    {
      v39[2](v39, v41);
    }

  }
}

- (void)setShouldEnableMaterializationDuringAccessorBlock:(BOOL)a3
{
  self->_shouldEnableMaterializationDuringAccessorBlock = a3;
}

+ (BOOL)canReadingItemAtLocation:(id)a3 options:(unint64_t)a4 safelyOverlapNewWriting:(BOOL)a5 ofItemAtLocation:(id)a6 options:(unint64_t)a7
{
  int v7;

  v7 = a7;
  return a7 >> 31 && a5
      || (objc_msgSend(a3, "itemIsItemAtLocation:", a6, a4, a5) & 1) == 0
      && ((*(_QWORD *)&v7 & 0x13000BLL) == 0 || (objc_msgSend(a3, "itemIsInItemAtLocation:", a6) & 1) == 0);
}

+ (BOOL)canNewWriteOfItemAtLocation:(id)a3 options:(unint64_t)a4 safelyOverlapExistingWriteOfItemAtLocation:(id)a5 options:(unint64_t)a6
{
  int v6;
  int v8;

  if (a4 >> 31)
    return 1;
  v6 = a6;
  v8 = a4;
  return (objc_msgSend(a3, "itemIsItemAtLocation:", a5) & 1) == 0
      && ((*(_QWORD *)&v8 & 0x13000BLL) == 0 || (objc_msgSend(a5, "itemIsInItemAtLocation:", a3) & 1) == 0)
      && ((*(_QWORD *)&v6 & 0x13000BLL) == 0 || (objc_msgSend(a3, "itemIsInItemAtLocation:", a5) & 1) == 0);
}

- (BOOL)shouldReadingWithOptions:(unint64_t)a3 causePresenterToRelinquish:(id)a4
{
  int v6;

  if ((a3 & 0x40000000) != 0)
    return 0;
  if ((a3 & 0x80000001) != 0x80000000)
    return 1;
  if (!objc_msgSend(a4, "usesMainThreadDuringReliquishing"))
    return 1;
  v6 = objc_msgSend((id)objc_msgSend(a4, "client"), "processIdentifier");
  return v6 != -[NSXPCConnection processIdentifier](self->_client, "processIdentifier");
}

- (BOOL)shouldWritingWithOptions:(unint64_t)a3 causePresenterToRelinquish:(id)a4
{
  return a3 >> 31 == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)client
{
  return self->_client;
}

- (int)clientProcessIdentifier
{
  NSXPCConnection *client;

  client = self->_client;
  if (client)
    return -[NSXPCConnection processIdentifier](client, "processIdentifier");
  else
    return getpid();
}

- (void)setCameFromSuperarbiter
{
  self->_cameFromSuperarbiter = 1;
}

uint64_t __46__NSFileAccessClaim_startObservingClientState__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCProcessMonitorLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v6 = *(_DWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v5;
    v11 = 1024;
    v12 = v6;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ observed suspension of client with %d", (uint8_t *)&v9, 0x12u);
  }
  v7 = *(_QWORD **)(a1 + 32);
  if (v7[5])
    return objc_msgSend(v7, "cancelled");
  else
    return objc_msgSend(a2, "killProcessWithMessage:", CFSTR("A coordinated read or write was still active when process was suspended."));
}

- (void)setClaimerError:(id)a3
{
  NSError *claimerError;

  claimerError = self->_claimerError;
  if (claimerError != a3)
  {

    self->_claimerError = (NSError *)objc_msgSend(a3, "copy");
  }
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  return 1;
}

- (void)whenFinishedPerformProcedure:(id)a3
{
  id v5;

  if (!self->_finishingProcedures)
    self->_finishingProcedures = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (id)objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](self->_finishingProcedures, "addObject:", v5);

}

- (void)addBlockingReactorID:(id)a3
{
  NSCountedSet *blockingReactorIDs;

  blockingReactorIDs = self->_blockingReactorIDs;
  if (!blockingReactorIDs)
  {
    blockingReactorIDs = objc_alloc_init(NSCountedSet);
    self->_blockingReactorIDs = blockingReactorIDs;
  }
  -[NSCountedSet addObject:](blockingReactorIDs, "addObject:", a3);
}

- (void)removeBlockingReactorID:(id)a3
{
  -[NSCountedSet removeObject:](self->_blockingReactorIDs, "removeObject:", a3);
}

- (BOOL)claimerInvokingIsBlockedByReactorWithID:(id)a3
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  LOBYTE(a3) = -[NSFileAccessClaim _recursive_claimerInvokingIsBlockedByReactorWithID:checkedClaims:]((uint64_t)self, (uint64_t)a3, v5);

  return (char)a3;
}

- (uint64_t)_recursive_claimerInvokingIsBlockedByReactorWithID:(void *)a3 checkedClaims:
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    if ((objc_msgSend(a3, "containsObject:", result) & 1) != 0)
      return 0;
    if ((objc_msgSend(*(id *)(v5 + 88), "containsObject:", a2) & 1) != 0)
      return 1;
    objc_msgSend(a3, "addObject:", v5);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = *(void **)(v5 + 80);
    result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (result)
    {
      v7 = result;
      v8 = *(_QWORD *)v12;
LABEL_9:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((-[NSFileAccessClaim _recursive_claimerInvokingIsBlockedByReactorWithID:checkedClaims:](*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), a2, a3) & 1) != 0)return 1;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
          result = 0;
          if (v7)
            goto LABEL_9;
          return result;
        }
      }
    }
  }
  return result;
}

- (BOOL)isBlockedByClaimWithPurposeID:(id)a3
{
  NSMutableSet *blockingClaims;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  blockingClaims = self->_blockingClaims;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](blockingClaims, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(blockingClaims);
        if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "purposeID"), "isEqual:", a3) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](blockingClaims, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return v5;
}

- (void)givePriorityToClaim:(id)a3
{
  uint64_t v5;
  NSString *v6;
  _QWORD v7[7];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "claimID");
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Avoiding deadlock with claim: %@"), v5);
  -[NSFileAccessClaim blockClaimerForReason:](self, "blockClaimerForReason:", v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__NSFileAccessClaim_givePriorityToClaim___block_invoke;
  v7[3] = &unk_1E0F51588;
  v7[4] = self;
  v7[5] = v5;
  v7[6] = v6;
  objc_msgSend(a3, "whenDevaluedPerformProcedure:", v7);
  v8[0] = a3;
  -[NSFileAccessClaim removePendingClaims:](self, "removePendingClaims:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1));
}

uint64_t __41__NSFileAccessClaim_givePriorityToClaim___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCClaimsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Unblocking claimer for claim %{public}@ because the claim it was avoiding a deadlock with finished: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "unblockClaimerForReason:", *(_QWORD *)(a1 + 48));
}

- (void)scheduleBlockedClaim:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSString *claimID;
  const char *v10;
  uint64_t v11;
  NSString *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  NSString *v19;
  _BYTE v20[24];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "purposeID");
  if (v5)
  {
    v6 = v5;
    if (-[NSFileAccessClaim claimerInvokingIsBlockedByReactorWithID:](self, "claimerInvokingIsBlockedByReactorWithID:", v5))
    {
      v7 = _NSFCClaimsLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_msgSend(a3, "claimID");
        claimID = self->_claimID;
        *(_DWORD *)v20 = 138543874;
        *(_QWORD *)&v20[4] = v8;
        *(_WORD *)&v20[12] = 2114;
        *(_QWORD *)&v20[14] = claimID;
        *(_WORD *)&v20[22] = 2114;
        v21 = v6;
        v10 = "Letting claim %{public}@ go before blocking claim %{public}@ because the latter is blocked by a reactor wi"
              "th the former's purposeID: %{public}@";
LABEL_8:
        _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEFAULT, v10, v20, 0x20u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    if (-[NSFileAccessClaim isBlockedByClaimWithPurposeID:](self, "isBlockedByClaimWithPurposeID:", v6))
    {
      v7 = _NSFCClaimsLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend(a3, "claimID");
        v12 = self->_claimID;
        *(_DWORD *)v20 = 138543874;
        *(_QWORD *)&v20[4] = v11;
        *(_WORD *)&v20[12] = 2114;
        *(_QWORD *)&v20[14] = v12;
        *(_WORD *)&v20[22] = 2114;
        v21 = v6;
        v10 = "Letting claim %{public}@ go before blocking claim %{public}@ because the latter is blocked by another clai"
              "m with the former's purposeID: %{public}@";
        goto LABEL_8;
      }
LABEL_9:
      -[NSFileAccessClaim givePriorityToClaim:](self, "givePriorityToClaim:", a3, *(_OWORD *)v20, *(_QWORD *)&v20[16], v21);
      return;
    }
  }
  v13 = objc_msgSend(a3, "shouldCancelInsteadOfWaiting");
  v14 = _NSFCClaimsLog();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      v16 = objc_msgSend(a3, "claimID");
      v17 = self->_claimID;
      *(_DWORD *)v20 = 138543618;
      *(_QWORD *)&v20[4] = v16;
      *(_WORD *)&v20[12] = 2114;
      *(_QWORD *)&v20[14] = v17;
      _os_log_impl(&dword_1817D9000, v14, OS_LOG_TYPE_DEFAULT, "As requested, cancelling claim %{public}@ because it is blocked by claim %{public}@.", v20, 0x16u);
    }
    objc_msgSend(a3, "setClaimerError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3072, 0));
  }
  else
  {
    if (v15)
    {
      v18 = objc_msgSend(a3, "claimID");
      v19 = self->_claimID;
      *(_DWORD *)v20 = 138543618;
      *(_QWORD *)&v20[4] = v18;
      *(_WORD *)&v20[12] = 2114;
      *(_QWORD *)&v20[14] = v19;
      _os_log_impl(&dword_1817D9000, v14, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ is blocked waiting for claim %{public}@ to finish.", v20, 0x16u);
    }
    -[NSFileAccessClaim addPendingClaim:](self, "addPendingClaim:", a3);
  }
}

- (void)addPendingClaim:(id)a3
{
  NSMutableOrderedSet *pendingClaims;
  id v6;

  pendingClaims = self->_pendingClaims;
  if (!pendingClaims)
  {
    pendingClaims = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    self->_pendingClaims = pendingClaims;
  }
  if ((-[NSMutableOrderedSet containsObject:](pendingClaims, "containsObject:", a3) & 1) == 0)
  {
    -[NSMutableOrderedSet addObject:](self->_pendingClaims, "addObject:", a3);
    objc_msgSend(a3, "block");
    v6 = (id)*((_QWORD *)a3 + 10);
    if (!v6)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      *((_QWORD *)a3 + 10) = v6;
    }
    objc_msgSend(v6, "addObject:", self);
    *((_BYTE *)a3 + 48) = 1;
  }
}

- (void)removePendingClaims:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id *v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(id **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (-[NSMutableOrderedSet containsObject:](self->_pendingClaims, "containsObject:", v9))
        {
          objc_msgSend(v9[10], "removeObject:", self);
          objc_msgSend(v9, "unblock");
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
  -[NSMutableOrderedSet removeObjectsInArray:](self->_pendingClaims, "removeObjectsInArray:", a3);
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (void)makeProviderOfItemAtLocation:(id)a3 provideIfNecessaryWithOptions:(unint64_t)a4 thenContinue:(id)a5
{
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSString *claimID;
  NSString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[9];
  _BYTE buf[24];
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_arbiterQueue);
  if (-[NSFileAccessClaim shouldMakeProviderProvideItemAtLocation:withOptions:](self, "shouldMakeProviderProvideItemAtLocation:withOptions:", a3, a4))
  {
    v9 = (void *)objc_msgSend(a3, "itemProvider");
    v10 = objc_msgSend(v9, "reactorID");
    v11 = _NSFCClaimsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      claimID = self->_claimID;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = claimID;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_1817D9000, v11, OS_LOG_TYPE_DEFAULT, "Claimer for %{public}@ is waiting for provider %{public}@ to provide", buf, 0x16u);
    }
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Waiting for provider %@ to provide"), v10);
    -[NSFileAccessClaim blockClaimerForReason:](self, "blockClaimerForReason:", v13);
    -[NSFileAccessClaim addBlockingReactorID:](self, "addBlockingReactorID:", v10);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    v19 = __Block_byref_object_copy__26;
    v20 = __Block_byref_object_dispose__26;
    v21 = 0;
    v14 = objc_msgSend(a3, "url");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __93__NSFileAccessClaim_makeProviderOfItemAtLocation_provideIfNecessaryWithOptions_thenContinue___block_invoke;
    v17[3] = &unk_1E0F53090;
    v17[4] = v10;
    v17[5] = self;
    v17[7] = a5;
    v17[8] = buf;
    v17[6] = v13;
    v15 = (void *)objc_msgSend(v9, "provideItemAtURL:withOptions:forAccessClaim:completionHandler:", v14, a4, self, v17);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v15;
    if (v15)
    {
      if (!self->_providerCancellationProcedures)
      {
        self->_providerCancellationProcedures = (NSMutableArray *)objc_opt_new();
        v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
      }
      v16 = (void *)objc_msgSend(v15, "copy");
      -[NSMutableArray addObject:](self->_providerCancellationProcedures, "addObject:", v16);

    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  }
}

uint64_t __93__NSFileAccessClaim_makeProviderOfItemAtLocation_provideIfNecessaryWithOptions_thenContinue___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
    v16 = 138543618;
    v17 = v5;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "Provider %{public}@ finished, unblocking claimer for %{public}@", (uint8_t *)&v16, 0x16u);
  }
  v7 = objc_msgSend(a2, "sandboxToken");
  if (v7)
  {
    v8 = v7;
    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 176);
    if (!v9)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176) = objc_opt_new();
      v9 = *(void **)(*(_QWORD *)(a1 + 40) + 176);
    }
    objc_msgSend(v9, "addObject:", v8);
  }
  objc_msgSend(*(id *)(a1 + 40), "removeBlockingReactorID:", *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "removeObject:");
  v10 = objc_msgSend(a2, "error");
  if (v10)
  {
    v11 = v10;
    v12 = _NSFCClaimsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = objc_msgSend(*(id *)(a1 + 40), "claimID");
      v16 = 138543874;
      v17 = v14;
      v18 = 2114;
      v19 = v15;
      v20 = 2112;
      v21 = v11;
      _os_log_error_impl(&dword_1817D9000, v12, OS_LOG_TYPE_ERROR, "Provider %{public}@, while providing for claim %{public}@, returned an error: %@", (uint8_t *)&v16, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 40), "setClaimerError:", v11);
  }
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "claimerError") == 0);
  return objc_msgSend(*(id *)(a1 + 40), "unblockClaimerForReason:", *(_QWORD *)(a1 + 48));
}

uint64_t __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if ((*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * a3) & 2) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v11[0] = a2;
      v7 = *(void **)(a1 + 40);
      v11[1] = objc_msgSend(*(id *)(a1 + 32), "firstObject");
      objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2));
      v6 = *(void **)(a1 + 32);
      return objc_msgSend(v6, "removeObjectAtIndex:", 0);
    }
    v9 = *(void **)(a1 + 48);
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      v5 = *(void **)(a1 + 40);
      v10[0] = objc_msgSend(*(id *)(a1 + 48), "firstObject");
      v10[1] = a2;
      objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2));
      v6 = *(void **)(a1 + 48);
      return objc_msgSend(v6, "removeObjectAtIndex:", 0);
    }
    v9 = *(void **)(a1 + 32);
  }
  return objc_msgSend(v9, "addObject:", a2);
}

void __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_lock_with_options();
  if (objc_msgSend(a2, "requiresProviding"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(a2, "requiresAccessorBlockMaterializationPolicy"))
    objc_msgSend(*(id *)(a1 + 48), "setShouldEnableMaterializationDuringAccessorBlock:", 1);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "unblockClaimerForReason:", *(_QWORD *)(a1 + 48));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(void **)(a1 + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "removeBlockingReactorID:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
    }
    while (v4);
  }

}

uint64_t __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  void *v7;
  uint64_t v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  ++*a4;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_4;
  v10[3] = &unk_1E0F53130;
  v7 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v10[4] = *(_QWORD *)(a1 + 40);
  v10[5] = v8;
  return objc_msgSend(v7, "makeProviderOfItemAtLocation:provideIfNecessaryWithOptions:thenContinue:", a2, a3, v10);
}

void __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "unblockClaimerForReason:", *(_QWORD *)(a1 + 40));
}

- (void)makeProviderOfItemAtLocation:(id)a3 providePhysicalURLThenContinue:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSString *claimID;
  NSString *v12;
  uint64_t v13;
  _QWORD v14[8];
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "itemProvider");
  v8 = objc_msgSend(v7, "reactorID");
  if (!v7
    || (v9 = v8, -[NSString isEqual:](self->_purposeIDOrNil, "isEqual:", v8))
    || self->_cameFromSuperarbiter
    || -[NSFileAccessClaim claimerError](self, "claimerError"))
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
  else
  {
    v10 = _NSFCClaimsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      claimID = self->_claimID;
      *(_DWORD *)buf = 138543618;
      v16 = claimID;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_1817D9000, v10, OS_LOG_TYPE_DEFAULT, "Claimer for %{public}@ is waiting for provider %{public}@ to provide a physical URL", buf, 0x16u);
    }
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Waiting for provider %@ to provide a physical URL"), v9);
    -[NSMutableArray addObject:](self->_claimerBlockageReasons, "addObject:", v12);
    -[NSFileAccessClaim addBlockingReactorID:](self, "addBlockingReactorID:", v9);
    v13 = objc_msgSend(a3, "standardizedURL");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__NSFileAccessClaim_makeProviderOfItemAtLocation_providePhysicalURLThenContinue___block_invoke;
    v14[3] = &unk_1E0F531F8;
    v14[4] = v9;
    v14[5] = self;
    v14[6] = v12;
    v14[7] = a4;
    objc_msgSend(v7, "providePhysicalURLForURL:completionHandler:", v13, v14);
  }
}

uint64_t __81__NSFileAccessClaim_makeProviderOfItemAtLocation_providePhysicalURLThenContinue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCClaimsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Provider %{public}@ has finished providing a physical URL, unblocking claimer for %{public}@", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "removeBlockingReactorID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "removeObject:", *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __128__NSFileAccessClaim_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_readingOptions_thenContinue___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "standardizedURL");
    _CFURLPromiseSetPhysicalURL();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __128__NSFileAccessClaim_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_writingOptions_thenContinue___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "standardizedURL");
    _CFURLPromiseSetPhysicalURL();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  _QWORD v16[7];
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v7 = objc_msgSend(*(id *)(a1 + 32), "purposeID");
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_2;
  v17[3] = &unk_1E0F53248;
  v9 = *(void **)(a1 + 40);
  v17[4] = *(_QWORD *)(a1 + 32);
  v17[5] = v7;
  v17[6] = &v18;
  objc_msgSend(v9, "forEachAccessClaimOnItemOrContainedItemPerformProcedure:", v17);
  if (*((_BYTE *)v19 + 24))
  {
    v10 = objc_msgSend(a2, "reactorID");
    v11 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    if (v11)
    {
      v12 = _NSFCClaimsLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        *(_DWORD *)buf = 138543874;
        v23 = v13;
        v24 = 2114;
        v25 = v10;
        v26 = 2082;
        v27 = a4;
        _os_log_impl(&dword_1817D9000, v12, OS_LOG_TYPE_DEFAULT, "Claimer for %{public}@ is waiting for presenter %{public}@ on %{public}s to relinquish", buf, 0x20u);
      }
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Waiting for presenter %@ to relinquish"), v10);
      objc_msgSend(*(id *)(a1 + 32), "blockClaimerForReason:", v14);
      objc_msgSend(*(id *)(a1 + 32), "addBlockingReactorID:", v10);
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_65;
      v16[3] = &unk_1E0F532E8;
      v15 = *(_QWORD *)(a1 + 32);
      v16[4] = v10;
      v16[5] = v15;
      v16[6] = v14;
      (*(void (**)(uint64_t, _QWORD *))(v11 + 16))(v11, v16);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  _Block_object_dispose(&v18, 8);
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_2(uint64_t result, void *a2)
{
  uint64_t v2;

  if (*(void **)(result + 32) != a2)
  {
    v2 = result;
    result = objc_msgSend(a2, "claimerInvokingIsBlockedByReactorWithID:", *(_QWORD *)(result + 40));
    if ((_DWORD)result)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) = 0;
  }
  return result;
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_65(_QWORD *a1, int a2, void *a3, uint64_t a4)
{
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  _QWORD v20[6];
  _QWORD v21[7];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = _NSFCClaimsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[4];
    v10 = *(_QWORD *)(a1[5] + 16);
    *(_DWORD *)buf = 138543618;
    v23 = v9;
    v24 = 2114;
    v25 = v10;
    _os_log_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ has finished relinquishing, unblocking claimer for %{public}@", buf, 0x16u);
  }
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_66;
  v21[3] = &unk_1E0F53298;
  v12 = (void *)a1[5];
  v21[4] = a1[4];
  v21[5] = v12;
  v21[6] = a4;
  objc_msgSend(v12, "removeBlockingReactorID:");
  v13 = a1[5];
  if (*(_BYTE *)(v13 + 49))
  {
    __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_66((uint64_t)v21, (uint64_t)&__block_literal_global_75);
  }
  else
  {
    v14 = *(void **)(v13 + 104);
    if (!v14)
    {
      *(_QWORD *)(a1[5] + 104) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v14 = *(void **)(a1[5] + 104);
    }
    v15 = objc_msgSend(v14, "objectForKey:", a1[4]);
    v16 = v21;
    if (v15)
    {
      v20[0] = v11;
      v20[1] = 3221225472;
      v20[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_3;
      v20[3] = &unk_1E0F532C0;
      v20[4] = v21;
      v20[5] = v15;
      v16 = v20;
    }
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(*(id *)(a1[5] + 104), "setObject:forKey:", v17, a1[4]);

  }
  v18 = (_QWORD *)a1[5];
  if (a2 && !v18[8])
  {
    *(_QWORD *)(a1[5] + 64) = objc_msgSend(a3, "copy");
    v18 = (_QWORD *)a1[5];
  }
  return objc_msgSend(v18, "unblockClaimerForReason:", a1[6]);
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_66(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  int8x16_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
    *(_DWORD *)buf = 138543618;
    v16 = v5;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ reacquire after claim %{public}@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "addBlockingReactorID:", *(_QWORD *)(a1 + 32));
  v7 = *(_QWORD *)(a1 + 48);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_67;
  v12 = &unk_1E0F53270;
  v13 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v14 = a2;
  return (*(uint64_t (**)(void))(v7 + 16))();
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_67(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeBlockingReactorID:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_4;
  v4[3] = &unk_1E0F52DC8;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v4[5] = a2;
  return (*(uint64_t (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v4);
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  v5 = (void *)MEMORY[0x186DA8F78]();
  objc_msgSend(*(id *)(a1 + 32), "pathFromAncestor:", a3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v5);
}

void __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_6(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x186DA8F78]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_7(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x186DA8F78]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

uint64_t __57__NSFileAccessClaim_canAccessLocations_forReading_error___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v3 = result;
    result = objc_msgSend((id)objc_msgSend(a2, "reactorID"), "isEqual:", *(_QWORD *)(*(_QWORD *)(result + 32) + 24));
    if ((_DWORD)result)
    {
      result = objc_msgSend(a2, "disconnected");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24) = result ^ 1;
    }
  }
  return result;
}

- (BOOL)_writeArchiveOfDirectoryAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  void *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  int *v12;
  uint64_t disk_new;
  FTS *v14;
  BOOL v15;
  char v16;
  NSError *v17;
  BOOL result;
  FTS *v19;
  int *v20;
  const char *v21;
  FTSENT *v22;
  FTSENT *v23;
  unsigned int fts_info;
  int v25;
  const char *fts_accpath;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  size_t v33;
  uint64_t v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  BOOL v44;
  int *v45;
  uint64_t v46;
  int v47;
  _QWORD v48[3];
  unint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  _QWORD v53[2];
  _QWORD v54[2];
  char *v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a3, "path");
  v9 = (char *)objc_msgSend(a3, "fileSystemRepresentation");
  v10 = objc_msgSend(a4, "fileSystemRepresentation");
  if (!v8 || !v9 || !v10)
  {
    if (!a5)
      return 0;
    v53[0] = CFSTR("NSSourceFilePathErrorKey");
    v53[1] = CFSTR("NSDestinationFilePath");
    v54[0] = a3;
    v54[1] = a4;
    v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 256, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2));
    result = 0;
    *a5 = v17;
    return result;
  }
  v11 = (void *)archive_write_new();
  archive_write_set_format_zip();
  if (archive_write_open_filename())
  {
    if (a5)
    {
      v12 = __error();
      *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v12, (uint64_t)a4, 0, 0, 0);
    }
    free(v11);
    disk_new = 0;
    v11 = 0;
    v14 = 0;
    v15 = 0;
    v55 = v9;
    v56 = 0;
    goto LABEL_8;
  }
  disk_new = archive_read_disk_new();
  archive_read_disk_set_standard_lookup();
  v55 = v9;
  v56 = 0;
  v19 = fts_open(&v55, 84, 0);
  if (v19)
  {
    v14 = v19;
    v16 = 0;
    v15 = 1;
  }
  else
  {
    if (!a5)
    {
      v14 = 0;
      v15 = 0;
LABEL_8:
      v16 = 1;
      goto LABEL_16;
    }
    v20 = __error();
    v16 = 1;
    v14 = 0;
    v15 = 0;
    *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v20, (uint64_t)a3, 1, 0, 0);
  }
LABEL_16:
  v21 = (const char *)objc_msgSend((id)objc_msgSend(v8, "stringByDeletingLastPathComponent"), "fileSystemRepresentation");
  if ((v16 & 1) != 0)
  {
LABEL_61:
    if (v14)
    {
      if (*__error())
      {
        if (a5)
        {
          v45 = __error();
          v44 = 0;
          v15 = 0;
          *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v45, (uint64_t)a3, 1, 0, 0);
          if (v11)
            goto LABEL_75;
        }
        else
        {
          v44 = 0;
          v15 = 0;
          if (v11)
            goto LABEL_75;
        }
      }
      else
      {
        v44 = 0;
        if (v11)
          goto LABEL_75;
      }
    }
    else
    {
      v44 = 1;
      if (v11)
        goto LABEL_75;
    }
LABEL_78:
    if (!disk_new)
      goto LABEL_80;
    goto LABEL_79;
  }
  v51 = a4;
  v52 = disk_new;
  v50 = (int)(strlen(v21) + 1);
  while (1)
  {
    while (1)
    {
      v22 = fts_read(v14);
      if (!v22)
      {
        a4 = v51;
        disk_new = v52;
        goto LABEL_61;
      }
      v23 = v22;
      fts_info = v22->fts_info;
      if (fts_info > 0xE)
        goto LABEL_24;
      v25 = 1 << fts_info;
      if ((v25 & 0x4266) == 0)
        break;
      if (!v15)
        goto LABEL_58;
    }
    if ((v25 & 0x490) != 0)
      break;
LABEL_24:
    fts_accpath = v22->fts_accpath;
    v27 = _NSOpenFileDescriptor(fts_accpath, 0, 0);
    if (v27)
    {
      if (v15)
      {
        v28 = archive_entry_new();
        archive_entry_set_pathname();
        if (archive_read_disk_entry_from_file())
        {
          if (a5)
          {
            v29 = (int)archive_errno();
            v15 = 0;
            *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v29, objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", fts_accpath, 0, 0), 1, 0, 0);
          }
          else
          {
            v15 = 0;
          }
        }
        else
        {
          v48[2] = v28;
          if (archive_write_header())
          {
            if (a5)
            {
              v31 = archive_errno();
              v15 = 0;
              *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v31, (uint64_t)v51, 0, 0, 0);
            }
            else
            {
              v15 = 0;
            }
          }
          else
          {
            v32 = _NSPreferredChunkSizeForFileDescriptor(v27);
            if (v32 < v23->fts_statp->st_size)
              v32 = _NSPreferredChunkSizeForFileDescriptor(v27);
            v48[1] = v48;
            MEMORY[0x1E0C80A78](v32);
            v35 = (char *)v48 - v34;
            v49 = v36;
            if (v36 > 0x100)
              v35 = (char *)malloc_type_malloc(v33, 0x100004077774924uLL);
            else
              bzero((char *)v48 - v34, v33);
            v37 = v49;
            while (1)
            {
              v38 = _NSReadFromFileDescriptorWithProgress(v27, v35, v37, 0, 0);
              if (v38 < 1)
                break;
              v39 = archive_write_data();
              v37 = v49;
              if (v39 == -1)
              {
                if (a5)
                {
                  v40 = (int)archive_errno();
                  v41 = (uint64_t)v51;
                  v42 = 0;
LABEL_52:
                  v15 = 0;
                  *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v40, v41, v42, 0, 0);
                  goto LABEL_54;
                }
                v15 = 0;
                goto LABEL_54;
              }
            }
            if (v38)
              v15 = 0;
            if (a5 && v38)
            {
              v43 = *__error();
              v41 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", fts_accpath, 0, 0);
              v40 = v43;
              v42 = 1;
              goto LABEL_52;
            }
LABEL_54:
            if (v49 >= 0x101)
              free(v35);
          }
        }
        archive_entry_free();
      }
    }
    else if (a5)
    {
      v30 = *__error();
      v15 = 0;
      *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v30, objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", fts_accpath, 0, 0), 1, 0, 0);
    }
    else
    {
      v15 = 0;
    }
    close(v27);
    if (!v15)
    {
LABEL_58:
      v44 = v14 == 0;
      a4 = v51;
      disk_new = v52;
      if (v11)
        goto LABEL_75;
      goto LABEL_78;
    }
  }
  a4 = v51;
  disk_new = v52;
  if (a5)
  {
    v46 = *__error();
    *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v46, objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v23->fts_path, 0, 0), 1, 0, 0);
  }
  v15 = 0;
  v44 = v14 == 0;
  if (!v11)
    goto LABEL_78;
LABEL_75:
  if (!archive_write_free())
    goto LABEL_78;
  if (a5)
  {
    v47 = archive_errno();
    v15 = 0;
    *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v47, (uint64_t)a4, 0, 0, 0);
    goto LABEL_78;
  }
  v15 = 0;
  if (disk_new)
LABEL_79:
    archive_read_free();
LABEL_80:
  if (!v44)
    fts_close(v14);
  return v15;
}

- (void)prepareItemForUploadingFromURL:(id)a3 thenContinue:(id)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  char *v11;
  NSString *v12;
  uint64_t v13;
  _QWORD v14[10];
  _QWORD v15[4];
  uint64_t v16;
  id v17;
  NSFileAccessClaim *v18;
  NSString *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[2];
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  void *v25;
  id v26;
  NSFileAccessClaim *v27;
  id v28;
  _QWORD v29[2];
  _BYTE buf[12];
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[NSFileAccessClaim blockClaimerForReason:](self, "blockClaimerForReason:", CFSTR("Zipping"));
  v7 = -[NSFileAccessClaim claimID](self, "claimID");
  v8 = _NSFCClaimsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    *(_QWORD *)&buf[4] = v7;
    v31 = 2113;
    v32 = objc_msgSend(a3, "path");
    _os_log_impl(&dword_1817D9000, v8, OS_LOG_TYPE_INFO, "Claim %{public}@ is waiting for file %{private}@ to be prepared for uploading", buf, 0x16u);
  }
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v24 = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke;
  v25 = &unk_1E0F533B0;
  v27 = self;
  v28 = a4;
  v26 = v7;
  *(_QWORD *)buf = 0;
  v10 = -[NSString fileSystemRepresentation](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("CoordinatedZipFileXXXXXX")), "fileSystemRepresentation");
  v11 = strdup(v10);
  if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", NSTemporaryDirectory(), 1, 0, buf))
  {
    if (v11 && mkdtemp(v11))
    {
      v12 = -[NSFileManager stringWithFileSystemRepresentation:length:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "stringWithFileSystemRepresentation:length:", v11, strlen(v11));
      v22[0] = v9;
      v22[1] = 3221225472;
      v22[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_86;
      v22[3] = &unk_1E0F4D2D8;
      v22[4] = v12;
      -[NSFileAccessClaim whenFinishedPerformProcedure:](self, "whenFinishedPerformProcedure:", v22);
      v21 = 0;
      v13 = *MEMORY[0x1E0C99AD0];
      v29[0] = *MEMORY[0x1E0C999D0];
      v29[1] = v13;
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_87;
      v15[3] = &unk_1E0F52CD8;
      v16 = objc_msgSend(a3, "resourceValuesForKeys:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2), &v21);
      v17 = a3;
      v18 = self;
      v19 = v12;
      v20 = v23;
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_109;
      v14[3] = &unk_1E0F533F8;
      v14[4] = v16;
      v14[5] = v12;
      v14[6] = a3;
      v14[7] = self;
      v14[8] = v21;
      v14[9] = v23;
      __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_87((uint64_t)v15, (uint64_t)v14);
    }
    else
    {
      v24((uint64_t)v23, 0, (uint64_t)+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 256, 0));
    }
  }
  else
  {
    __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke((uint64_t)v23, 0, *(uint64_t *)buf);
  }
  free(v11);
}

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = _NSFCClaimsLog();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 138543619;
      v12 = v8;
      v13 = 2113;
      v14 = a2;
      _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "Upload preparation for claim %{public}@ completed with resulting URL: %{private}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 138543619;
    v12 = v10;
    v13 = 2113;
    v14 = a3;
    _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "Upload preparation for claim %{public}@ completed with error: %{private}@", (uint8_t *)&v11, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "unblockClaimerForReason:", CFSTR("Zipping"));
}

void __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_86(uint64_t a1)
{
  NSObject *v1;
  id v2;
  uint8_t buf[4];
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = 0;
  if ((objc_msgSend((id)objc_opt_new(), "removeItemAtPath:error:", *(_QWORD *)(a1 + 32), &v2) & 1) == 0
    && objc_msgSend(v2, "code") != 4)
  {
    v1 = _NSFCClaimsLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v4 = v2;
      _os_log_error_impl(&dword_1817D9000, v1, OS_LOG_TYPE_ERROR, "Failed to remove file created for uploading: %{public}@", buf, 0xCu);
    }
  }
}

void __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_87(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  const __CFString *v6;
  NSXPCConnection *v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[8];
  _QWORD v22[6];
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0C99AD0]), "hasPrefix:", CFSTR("com.apple.iwork"));
  v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "lastPathComponent"), "hasPrefix:", CFSTR("__NSFileCoordinationPrepareForUploadTestFile"));
  if ((v4 & 1) != 0 || v5)
  {
    if (v4)
    {
      if (NSFileAccessClaimInitialBlockageReason_block_invoke_onceToken != -1)
        dispatch_once(&NSFileAccessClaimInitialBlockageReason_block_invoke_onceToken, &__block_literal_global_92);
      v6 = CFSTR("com.apple.iWorkFileFormat");
    }
    else if (v5)
    {
      v6 = CFSTR("com.apple.foundationtests.NSFileCoordinationPrepareForUploadTestService");
    }
    else
    {
      v6 = 0;
    }
    v7 = -[NSXPCConnection initWithServiceName:]([NSXPCConnection alloc], "initWithServiceName:", v6);
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &unk_1EDCFFBB0));
    -[NSXPCConnection _setQueue:](v7, "_setQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 184));
    -[NSXPCConnection resume](v7, "resume");
    v8 = _NSFCClaimsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v20 = objc_msgSend(*(id *)(a1 + 40), "path");
      *(_DWORD *)buf = 138543619;
      v24 = v6;
      v25 = 2113;
      v26 = v20;
      _os_log_debug_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEBUG, "Asking service named %{public}@ to prepare file %{private}@ for uploading", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "fileSystemRepresentation");
    v9 = (const char *)sandbox_extension_issue_file();
    objc_msgSend(*(id *)(a1 + 56), "fileSystemRepresentation");
    v10 = (const char *)sandbox_extension_issue_file();
    if (v9)
      v11 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v9, strlen(v9) + 1, 1);
    else
      v11 = objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v12 = v11;
    if (v10)
      v13 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v10, strlen(v10) + 1, 1);
    else
      v13 = objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v14 = v13;
    v15 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_106;
    v22[3] = &unk_1E0F50DE0;
    v22[4] = v6;
    v22[5] = a2;
    v16 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v7, "remoteObjectProxyWithErrorHandler:", v22);
    v17 = *(_QWORD *)(a1 + 40);
    v18 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(a1 + 56));
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_108;
    v21[3] = &unk_1E0F52FD0;
    v19 = *(_QWORD *)(a1 + 40);
    v21[4] = v6;
    v21[5] = v19;
    v21[6] = *(_QWORD *)(a1 + 64);
    v21[7] = a2;
    objc_msgSend(v16, "prepareFileForUploadingAtURL:originalURLExtension:inDirectory:destinationSandboxExtension:completionHandler:", v17, v12, v18, v14, v21);

  }
  else
  {
    (*(void (**)(uint64_t))(a2 + 16))(a2);
  }
}

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_2()
{
  xpc_add_bundle();
  return xpc_add_bundle();
}

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_106(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Error communicating with service named: %{public}@. %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_108(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2 | a3;
  v6 = _NSFCClaimsLog();
  v7 = v6;
  if (v5)
  {
    if (a2)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = objc_msgSend(*(id *)(a1 + 40), "path");
        v15 = 138543875;
        v16 = v8;
        v17 = 2113;
        v18 = v9;
        v19 = 2113;
        v20 = objc_msgSend((id)a2, "path");
        _os_log_debug_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEBUG, "Service %{public}@ succeeded in preparing file %{private}@ for uploading. Resulting path: %{private}@", (uint8_t *)&v15, 0x20u);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = objc_msgSend(*(id *)(a1 + 40), "path");
      v15 = 138543875;
      v16 = v13;
      v17 = 2113;
      v18 = v14;
      v19 = 2113;
      v20 = objc_msgSend(0, "path");
      _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "Service %{public}@ failed to prepare file %{private}@ for uploading. Error: %{private}@", (uint8_t *)&v15, 0x20u);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = objc_msgSend(*(id *)(a1 + 40), "path");
      v15 = 138543619;
      v16 = v11;
      v17 = 2113;
      v18 = v12;
      _os_log_debug_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEBUG, "Service %{public}@ has requested we fall back to the standard procedure to prepare file %{private}@ for uploading.", (uint8_t *)&v15, 0x16u);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_109(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  size_t v8;
  size_t v9;
  void *v10;
  size_t v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  unint64_t v16;
  NSError *v17;
  uint64_t v18;
  NSObject *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSError *v25;
  uint8_t buf[8];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0C999D0]);
  if (v2)
  {
    v3 = objc_msgSend(v2, "BOOLValue");
    v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", objc_msgSend(*(id *)(a1 + 48), "lastPathComponent"));
    v5 = v4;
    if (v3)
    {
      v6 = (void *)objc_msgSend(v4, "lastPathComponent");
      v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");
      if (v7)
      {
        v8 = strlen(v7);
        if (v8 - 252 <= 0xFFFFFFFFFFFFFEFFLL)
        {
          v9 = v8;
          v10 = (void *)objc_msgSend(v6, "stringByDeletingPathExtension");
          v11 = objc_msgSend(v10, "length") - v9;
          v12 = objc_msgSend(v10, "rangeOfComposedCharacterSequencesForRange:", 0, v11 + 251);
          v14 = v11 != -251 && v13 > v11 + 251;
          if (v14)
          {
            v20 = v11 + 250;
            do
            {
              v15 = objc_msgSend(v10, "rangeOfComposedCharacterSequencesForRange:", 0, v20);
              v16 = v21;
              if (!v20)
                break;
              v14 = v21 > v20--;
            }
            while (v14);
          }
          else
          {
            v15 = v12;
            v16 = v13;
          }
          v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend(v6, "substringWithRange:", v15, v16)), "stringByAppendingPathExtension:", objc_msgSend(v6, "pathExtension"));
        }
        v5 = (void *)objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("zip"));
      }
      v22 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
      v23 = _NSFCClaimsLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1817D9000, v23, OS_LOG_TYPE_INFO, "(ReadingForUploading) Creating zip archive of coordinated directory", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 56), "_writeArchiveOfDirectoryAtURL:toURL:error:", *(_QWORD *)(a1 + 48), v22, &v25);
    }
    else
    {
      v18 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
      v19 = _NSFCClaimsLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1817D9000, v19, OS_LOG_TYPE_INFO, "(ReadingForUploading) Copying cordinated flat file", buf, 2u);
      }
      objc_msgSend((id)objc_opt_new(), "copyItemAtURL:toURL:error:", *(_QWORD *)(a1 + 48), v18, &v25);
    }
  }
  else
  {
    v17 = *(NSError **)(a1 + 64);
    if (!v17)
      v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 256, 0);
    v25 = v17;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

uint64_t __28__NSFileAccessClaim_revoked__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__NSFileAccessClaim_revoked__block_invoke_2;
  v4[3] = &unk_1E0F51708;
  v5 = *(_OWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, _QWORD *))(a3 + 16))(a3, v4);
}

uint64_t __28__NSFileAccessClaim_revoked__block_invoke_2(uint64_t result)
{
  if (!--*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return objc_msgSend(*(id *)(result + 32), "devalueSelf");
  return result;
}

- (BOOL)isGranted
{
  return !self->_blockageCount && !self->_isRevoked;
}

- (id)descriptionWithIndenting:(id)a3
{
  NSXPCConnection *client;
  uint64_t v6;
  int v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  NSString *purposeIDOrNil;
  unint64_t blockageCount;
  uint64_t v14;
  NSMutableOrderedSet *pendingClaims;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  NSMutableArray *claimerBlockageReasons;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE buffer[256];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  client = self->_client;
  if (client)
  {
    v6 = -[NSXPCConnection processIdentifier](client, "processIdentifier");
    v7 = proc_name(v6, buffer, 0x100u);
    if (v7 < 1)
      v8 = 0;
    else
      v8 = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", buffer, v7, 4);
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%i)"), v8, v6);
  }
  else
  {
    v9 = (NSString *)CFSTR("<this process>");
  }
  v10 = +[NSString string](NSMutableString, "string");
  v11 = (void *)objc_msgSend(a3, "stringByAppendingString:", CFSTR("    "));
  -[NSString appendFormat:](v10, "appendFormat:", CFSTR("%@<%@ %p> client: %@, claim ID: %@"), a3, objc_opt_class(), self, v9, self->_claimID);
  if (self->_cameFromSuperarbiter)
    -[NSString appendString:](v10, "appendString:", CFSTR(" - came from superabiter"));
  purposeIDOrNil = self->_purposeIDOrNil;
  if (!purposeIDOrNil)
    purposeIDOrNil = (NSString *)CFSTR("<nil>");
  -[NSString appendFormat:](v10, "appendFormat:", CFSTR("\n%@purposeID: %@"), v11, purposeIDOrNil);
  blockageCount = self->_blockageCount;
  if (blockageCount)
    -[NSString appendFormat:](v10, "appendFormat:", CFSTR("\n%@blockage count: %i"), v11, blockageCount);
  if (self->_pendingClaims)
  {
    -[NSString appendFormat:](v10, "appendFormat:", CFSTR("\n%@pending claims:"), v11);
    v14 = objc_msgSend(v11, "stringByAppendingString:", CFSTR("    "));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    pendingClaims = self->_pendingClaims;
    v16 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](pendingClaims, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(pendingClaims);
          -[NSString appendFormat:](v10, "appendFormat:", CFSTR("\n%@"), objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "descriptionWithIndenting:", v14));
        }
        v17 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](pendingClaims, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
      }
      while (v17);
    }
  }
  if (-[NSMutableArray count](self->_claimerBlockageReasons, "count"))
  {
    -[NSString appendFormat:](v10, "appendFormat:", CFSTR("\n%@claimer blockage reasons:"), v11);
    v20 = objc_msgSend(v11, "stringByAppendingString:", CFSTR("    "));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    claimerBlockageReasons = self->_claimerBlockageReasons;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](claimerBlockageReasons, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(claimerBlockageReasons);
          -[NSString appendFormat:](v10, "appendFormat:", CFSTR("\n%@%@"), v20, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](claimerBlockageReasons, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
      }
      while (v23);
    }
  }
  return v10;
}

- (id)description
{
  return -[NSFileAccessClaim descriptionWithIndenting:](self, "descriptionWithIndenting:", &stru_1E0F56070);
}

- (BOOL)checkIfSymbolicLinkAtURL:(id)a3 withResolutionCount:(int64_t *)a4 andIfSoThenReevaluateSelf:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSFileManager *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSString *v18;
  BOOL v19;
  NSObject *v20;
  NSString *v22;
  NSString *claimID;
  id v24;
  uint8_t buf[4];
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_claimerError)
    return 0;
  v24 = 0;
  if (!objc_msgSend(a3, "getResourceValue:forKey:error:", &v24, *MEMORY[0x1E0C99A28], 0)
    || !objc_msgSend(v24, "BOOLValue"))
  {
    return 0;
  }
  v9 = (*a4)++;
  if (v9 > 31)
  {
    v20 = _NSFCClaimsLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = -[NSFileAccessClaim claimID](self, "claimID");
      *(_DWORD *)buf = 138543362;
      v26 = v22;
      _os_log_error_impl(&dword_1817D9000, v20, OS_LOG_TYPE_ERROR, "Claim %{public}@ failed symbolic link resolution due to an apparent link cycle", buf, 0xCu);
    }
    -[NSFileAccessClaim setClaimerError:](self, "setClaimerError:", _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(62, (uint64_t)a3, 1, 0, 0));
    return 0;
  }
  v10 = objc_msgSend(a3, "path");
  if (!v10)
    return 0;
  v11 = v10;
  v12 = objc_alloc_init(NSFileManager);
  v13 = -[NSFileManager destinationOfSymbolicLinkAtPath:error:](v12, "destinationOfSymbolicLinkAtPath:error:", v11, 0);
  if (v13 && (v14 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", v13, a3)) != 0)
  {
    v15 = v14;
    if (self->_blockageCount || -[NSMutableArray count](self->_claimerBlockageReasons, "count"))
    {
      v16 = _NSFCClaimsLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        claimID = self->_claimID;
        *(_DWORD *)buf = 138543362;
        v26 = claimID;
        _os_log_error_impl(&dword_1817D9000, v16, OS_LOG_TYPE_ERROR, "claim %{public}@ is trying to resolve a symbolic link too early", buf, 0xCu);
      }
    }
    ++self->_blockageCount;
    -[NSMutableArray addObject:](self->_claimerBlockageReasons, "addObject:", CFSTR("Initial blockage"));
    v17 = _NSFCClaimsLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_claimID;
      *(_DWORD *)buf = 138543362;
      v26 = v18;
      _os_log_impl(&dword_1817D9000, v17, OS_LOG_TYPE_DEFAULT, "claim %{public}@ is re-evaluating after resolving a symlink", buf, 0xCu);
    }
    -[NSFileAccessClaim devalueSelf](self, "devalueSelf");
    (*((void (**)(id, uint64_t))a5 + 2))(a5, v15);
    -[NSFileAccessClaim unblock](self, "unblock");
    v19 = 1;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)purposeIDOfClaimOnItemAtLocation:(id)a3 forMessagingPresenter:(id)a4
{
  void *v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__140;
  v14 = __Block_byref_object_dispose__141;
  v15 = 0;
  v15 = -[NSFileAccessClaim purposeID](self, "purposeID");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__NSFileAccessClaim_purposeIDOfClaimOnItemAtLocation_forMessagingPresenter___block_invoke;
  v9[3] = &unk_1E0F53448;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = &v10;
  objc_msgSend(a3, "forEachRelevantAccessClaimPerformProcedure:", v9);
  v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __76__NSFileAccessClaim_purposeIDOfClaimOnItemAtLocation_forMessagingPresenter___block_invoke(uint64_t result, id *a2)
{
  uint64_t v3;
  void *v4;

  if (*(id **)(result + 32) != a2)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(a2, "purposeID");
    result = objc_msgSend(v4, "isEqual:", objc_msgSend(*(id *)(v3 + 40), "reactorID"));
    if ((_DWORD)result)
    {
      result = objc_msgSend(a2[11], "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 40));
      if ((_DWORD)result)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 40) = v4;
    }
  }
  return result;
}

- (void)disavowed
{
  NSObject *v3;
  NSString *claimID;
  id serverClaimerOrNil;
  int v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = _NSFCClaimsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    claimID = self->_claimID;
    v6 = 138543362;
    v7 = claimID;
    _os_log_impl(&dword_1817D9000, v3, OS_LOG_TYPE_INFO, "Disavowing claim %{public}@ that was never granted", (uint8_t *)&v6, 0xCu);
  }
  if (-[NSMutableArray count](self->_revocationProcedures, "count"))
  {

    self->_revocationProcedures = 0;
  }
  if (-[NSMutableOrderedSet count](self->_pendingClaims, "count"))
  {

    self->_pendingClaims = 0;
  }
  if (-[NSMutableSet count](self->_blockingClaims, "count"))
  {

    self->_blockingClaims = 0;
  }
  serverClaimerOrNil = self->_serverClaimerOrNil;
  if (serverClaimerOrNil)
  {

    self->_serverClaimerOrNil = 0;
  }
}

- (NSArray)allURLs
{
  return 0;
}

- (BOOL)shouldCancelInsteadOfWaiting
{
  return 0;
}

@end
