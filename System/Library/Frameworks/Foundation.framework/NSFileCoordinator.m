@implementation NSFileCoordinator

- (void)_blockOnAccessClaim:(id)a3 withAccessArbiter:(id)a4
{
  uint64_t v7;
  uint64_t *v8;
  char v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "claimID");
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__24;
  v17 = __Block_byref_object_dispose__24;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__NSFileCoordinator_NSPrivate___blockOnAccessClaim_withAccessArbiter___block_invoke;
  v12[3] = &unk_1E0F510E0;
  v12[5] = a3;
  v12[6] = &v13;
  v12[4] = a4;
  -[NSFileCoordinator _requestAccessClaim:withProcedure:](self, "_requestAccessClaim:withProcedure:", a3, v12);
  v8 = v14;
  if (v14[5])
  {
    if (_NSFCIP)
    {
      v9 = objc_msgSend((id)objc_msgSend(a3, "purposeID"), "isEqualToString:", CFSTR("com.apple.filecoordination.crash_verifier"));
      v8 = v14;
      if ((v9 & 1) == 0)
      {
        v10 = v14[5];
        v11 = dispatch_time(0, 10000000000);
        if (!dispatch_semaphore_wait(v10, v11))
        {
LABEL_7:
          dispatch_release((dispatch_object_t)v14[5]);
          goto LABEL_8;
        }
        NSLog((NSString *)CFSTR("Possible NSFileCoordinator deadlock detected. Requesting debug information..."));
        +[NSFileCoordinator _getDebugInfoWithCompletionHandler:](NSFileCoordinator, "_getDebugInfoWithCompletionHandler:", &__block_literal_global_84_0);
        v8 = v14;
      }
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)v8[5], 0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_7;
  }
LABEL_8:
  -[NSFileCoordinator _forgetAccessClaimForID:](self, "_forgetAccessClaimForID:", v7);
  _Block_object_dispose(&v13, 8);
}

- (void)_forgetAccessClaimForID:(id)a3
{
  int v5;
  id accessClaimIDOrIDs;

  os_unfair_lock_lock(&stru_1ECD0A6EC);
  v5 = _NSIsNSSet();
  accessClaimIDOrIDs = self->_accessClaimIDOrIDs;
  if (v5)
  {
    objc_msgSend(accessClaimIDOrIDs, "removeObject:", a3);
  }
  else if (accessClaimIDOrIDs && objc_msgSend(accessClaimIDOrIDs, "isEqual:", a3))
  {

    self->_accessClaimIDOrIDs = 0;
  }
  os_unfair_lock_unlock(&stru_1ECD0A6EC);
}

- (void)_requestAccessClaim:(id)a3 withProcedure:(id)a4
{
  NSObject *v7;
  int v8;
  id accessClaimIDOrIDs;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  NSFileCoordinator *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&stru_1ECD0A6EC);
  if (self->_isCancelled)
  {
    os_unfair_lock_unlock(&stru_1ECD0A6EC);
    if (qword_1ECD0A798 != -1)
      dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
    v7 = qword_1ECD0A700;
    if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v11 = objc_msgSend(a3, "claimID");
      v12 = 2048;
      v13 = self;
      _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "%{public}@ was probably made on an already-cancelled NSFileCoordinator instance (%p). It will be immediately cancelled before being sent to the server.", buf, 0x16u);
    }
    objc_msgSend(a3, "setClaimerError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3072, 0));
    objc_msgSend(a3, "unblockClaimerForReason:", 0x1E0F76530);
  }
  else
  {
    if (self->_accessClaimIDOrIDs)
    {
      v8 = _NSIsNSSet();
      accessClaimIDOrIDs = self->_accessClaimIDOrIDs;
      if (v8)
      {
        objc_msgSend(accessClaimIDOrIDs, "addObject:", objc_msgSend(a3, "claimID"));
      }
      else
      {
        self->_accessClaimIDOrIDs = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", accessClaimIDOrIDs, objc_msgSend(a3, "claimID"), 0);

      }
    }
    else
    {
      self->_accessClaimIDOrIDs = (id)objc_msgSend(a3, "claimID");
    }
    (*((void (**)(id))a4 + 2))(a4);
    os_unfair_lock_unlock(&stru_1ECD0A6EC);
  }
}

uint64_t __70__NSFileCoordinator_NSPrivate___blockOnAccessClaim_withAccessArbiter___block_invoke(uint64_t a1)
{
  NSAutoreleasePool *v2;
  NSObject *v3;

  v2 = objc_alloc_init(NSAutoreleasePool);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "grantAccessClaim:synchronouslyIfPossible:", *(_QWORD *)(a1 + 40), 1);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v3)
    dispatch_retain(v3);
  return -[NSAutoreleasePool drain](v2, "drain");
}

- (void)_didEndWrite:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
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
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (object_getClass(v9) == (Class)NSFilePromiseWriteToken)
        {
          if ((objc_msgSend((id)objc_msgSend(v9, "promiseURL"), "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
            -[NSFileCoordinator _itemDidDisappearAtURL:](self, "_itemDidDisappearAtURL:", objc_msgSend(v9, "logicalURL"));
        }
        else
        {
          +[NSMetadataQuery didEndPossibleFileOperation:](NSMetadataQuery, "didEndPossibleFileOperation:", v9);
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
}

- (void)coordinateWritingItemAtURL:(NSURL *)url options:(NSFileCoordinatorWritingOptions)options error:(NSError *)outError byAccessor:(void *)writer
{
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__NSFileCoordinator_coordinateWritingItemAtURL_options_error_byAccessor___block_invoke;
  v6[3] = &unk_1E0F52688;
  v6[4] = self;
  v6[5] = writer;
  -[NSFileCoordinator _coordinateWritingItemAtURL:options:error:byAccessor:](self, "_coordinateWritingItemAtURL:options:error:byAccessor:", url, options, outError, v6);
}

- (void)coordinateReadingItemAtURL:(NSURL *)url options:(NSFileCoordinatorReadingOptions)options error:(NSError *)outError byAccessor:(void *)reader
{
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__NSFileCoordinator_coordinateReadingItemAtURL_options_error_byAccessor___block_invoke;
  v6[3] = &unk_1E0F52688;
  v6[4] = self;
  v6[5] = reader;
  -[NSFileCoordinator _coordinateReadingItemAtURL:options:error:byAccessor:](self, "_coordinateReadingItemAtURL:options:error:byAccessor:", url, options, outError, v6);
}

- (void)_coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6
{
  unint64_t v11;
  NSFileReadingClaim *v12;
  id purposeID;
  id v14;
  uint64_t v15;
  NSFileReadingClaim *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v22[8];
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  uint64_t v41;
  uint8_t buf[4];
  unint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, void *))a6 + 2))(a6, a3, &__block_literal_global_178_0);
  }
  else
  {
    v36 = 0;
    v37 = &v36;
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
      v11 = a4 | 0x80000000;
    else
      v11 = a4;
    v38 = 0x3052000000;
    v39 = __Block_byref_object_copy__24;
    v40 = __Block_byref_object_dispose__24;
    v41 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3052000000;
    v33 = __Block_byref_object_copy__24;
    v34 = __Block_byref_object_dispose__24;
    v35 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3052000000;
    v27 = __Block_byref_object_copy__24;
    v28 = __Block_byref_object_dispose__24;
    v29 = 0;
    v12 = [NSFileReadingClaim alloc];
    purposeID = self->_purposeID;
    v14 = +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3);
    v15 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2;
    v23[3] = &unk_1E0F527F8;
    v23[4] = &v36;
    v23[5] = &v30;
    v23[6] = &v24;
    v16 = -[NSFileReadingClaim initWithPurposeID:url:options:claimer:](v12, "initWithPurposeID:url:options:claimer:", purposeID, v14, v11, v23);
    if (__NSFCShouldLog(1))
    {
      if (qword_1ECD0A798 != -1)
        dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
      v17 = qword_1ECD0A700;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_purposeID;
        v19 = -[NSFileAccessClaim claimID](v16, "claimID");
        *(_DWORD *)buf = 134218755;
        v43 = v11;
        v44 = 2113;
        v45 = a3;
        v46 = 2114;
        v47 = v18;
        v48 = 2114;
        v49 = v19;
        _os_log_impl(&dword_1817D9000, v17, OS_LOG_TYPE_DEFAULT, "Read options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
      }
    }
    v20 = self->_accessArbiter;
    -[NSFileCoordinator _blockOnAccessClaim:withAccessArbiter:](self, "_blockOnAccessClaim:withAccessArbiter:", v16, v20);
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_182;
    v22[3] = &unk_1E0F52820;
    v22[6] = a6;
    v22[7] = &v36;
    v22[4] = a3;
    v22[5] = v20;
    -[NSFileCoordinator _withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:](self, "_withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:", v20, v22, v25[5] != 0, v16);
    v21 = (void *)v25[5];
    if (a5)
    {
      if (v21)
      {
        *a5 = v21;
        v21 = (void *)v25[5];
      }
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
  }
}

- (void)_coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6
{
  NSFileWritingClaim *v11;
  id purposeID;
  id v13;
  uint64_t v14;
  NSFileWritingClaim *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD v21[10];
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint8_t buf[4];
  unint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, void *))a6 + 2))(a6, a3, &__block_literal_global_185);
  }
  else
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3052000000;
    v32 = __Block_byref_object_copy__24;
    v33 = __Block_byref_object_dispose__24;
    v34 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3052000000;
    v26 = __Block_byref_object_copy__24;
    v27 = __Block_byref_object_dispose__24;
    v28 = 0;
    v11 = [NSFileWritingClaim alloc];
    purposeID = self->_purposeID;
    v13 = +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3);
    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2;
    v22[3] = &unk_1E0F52848;
    v22[4] = &v29;
    v22[5] = &v23;
    v15 = -[NSFileWritingClaim initWithPurposeID:url:options:claimer:](v11, "initWithPurposeID:url:options:claimer:", purposeID, v13, a4, v22);
    if (__NSFCShouldLog(1))
    {
      if (qword_1ECD0A798 != -1)
        dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
      v16 = qword_1ECD0A700;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_purposeID;
        v18 = -[NSFileAccessClaim claimID](v15, "claimID");
        *(_DWORD *)buf = 134218755;
        v36 = a4;
        v37 = 2113;
        v38 = a3;
        v39 = 2114;
        v40 = v17;
        v41 = 2114;
        v42 = v18;
        _os_log_impl(&dword_1817D9000, v16, OS_LOG_TYPE_DEFAULT, "Write options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
      }
    }
    v19 = self->_accessArbiter;
    -[NSFileCoordinator _blockOnAccessClaim:withAccessArbiter:](self, "_blockOnAccessClaim:withAccessArbiter:", v15, v19);
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_188;
    v21[3] = &unk_1E0F52898;
    v21[4] = a3;
    v21[5] = self;
    v21[8] = &v29;
    v21[9] = a4;
    v21[6] = v19;
    v21[7] = a6;
    -[NSFileCoordinator _withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:](self, "_withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:", v19, v21, v24[5] != 0, v15);
    v20 = (void *)v24[5];
    if (a5)
    {
      if (v20)
      {
        *a5 = v20;
        v20 = (void *)v24[5];
      }
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
}

+ (id)_canonicalURLForURL:(id)a3
{
  return a3;
}

+ (BOOL)_skipCoordinationWork
{
  if (qword_1ECD0A738 != -1)
    dispatch_once(&qword_1ECD0A738, &__block_literal_global_67_1);
  return _MergedGlobals_147;
}

+ (id)_createIdentifierForNewClaim
{
  uint64_t TSD;
  void *v3;

  TSD = NSFileCoordinatorGetTSD();
  v3 = *(void **)(TSD + 32);
  if (!v3)
    return (id)__CFCreateUUIDString();
  *(_QWORD *)(TSD + 32) = 0;
  return v3;
}

- (void)_invokeAccessor:(id)a3 thenCompletionHandler:(id)a4
{
  uint64_t *TSD;
  uint64_t v8;
  NSFileCoordinatorAccessorBlockCompletion *v9;

  TSD = (uint64_t *)NSFileCoordinatorGetTSD();
  v8 = *TSD;
  *TSD = (uint64_t)self;
  v9 = +[NSFileCoordinatorAccessorBlockCompletion completionWithBlock:](NSFileCoordinatorAccessorBlockCompletion, "completionWithBlock:", a4);
  TSD[1] = (uint64_t)v9;
  (*((void (**)(id))a3 + 2))(a3);
  *TSD = v8;
  -[NSFileCoordinatorAccessorBlockCompletion decrement](v9, "decrement");
  TSD[1] = 0;
}

uint64_t __73__NSFileCoordinator_coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __98__NSFileCoordinator_NSPrivate___withAccessArbiter_invokeAccessor_orDont_andRelinquishAccessClaim___block_invoke(uint64_t a1)
{
  NSAutoreleasePool *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(NSAutoreleasePool);
  if (*(_BYTE *)(a1 + 72))
  {
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "presentedItemURL");
    if (v3 != *(void **)(a1 + 40))
    {
      v4 = v3;
      if ((objc_msgSend(v3, "isEqual:") & 1) == 0)
        objc_msgSend(*(id *)(a1 + 48), "tiePresenterForID:toItemAtURL:", objc_msgSend(*(id *)(a1 + 48), "idForFileReactor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)), +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", v4));
    }
  }
  if (!*(_BYTE *)(a1 + 73))
    objc_msgSend(*(id *)(a1 + 48), "revokeAccessClaimForID:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "finished");
  return -[NSAutoreleasePool drain](v2, "drain");
}

- (NSFileCoordinator)initWithFilePresenter:(id)filePresenterOrNil
{
  NSFileCoordinator *v4;
  id v5;
  const __CFUUID *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSFileCoordinator;
  v4 = -[NSFileCoordinator init](&v8, sel_init);
  if (v4)
  {
    v4->_accessArbiter = NSFileCoordinatorSharedAccessArbiter();
    v5 = filePresenterOrNil;
    v4->_fileReactor = v5;
    if (!v4->_purposeID)
    {
      if (v5)
      {
        v4->_purposeID = (id)objc_msgSend((id)objc_msgSend(v4->_accessArbiter, "idForFileReactor:", v5), "copy");
        -[NSFileCoordinator _lockdownPurposeIdentifier](v4, "_lockdownPurposeIdentifier");
      }
      else
      {
        v6 = CFUUIDCreate(0);
        v4->_purposeID = (id)CFUUIDCreateString(0, v6);
        CFRelease(v6);
      }
    }
    v4->_recentFilePresenterURL = (NSURL *)objc_msgSend((id)objc_msgSend(filePresenterOrNil, "presentedItemURL"), "copy");
  }
  return v4;
}

uint64_t __73__NSFileCoordinator_coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_withAccessArbiter:(id)a3 invokeAccessor:(id)a4 orDont:(BOOL)a5 andRelinquishAccessClaim:(id)a6
{
  _BOOL4 v7;
  uint64_t v11;
  int v12;
  char v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  char v18;
  uint64_t v19;
  _QWORD v20[9];
  char v21;
  char v22;
  int v23;
  int v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v7 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v11 = objc_msgSend(a6, "claimID");
  if (v7)
  {
    objc_msgSend(a3, "revokeAccessClaimForID:", v11);
    objc_msgSend(a6, "finished");
  }
  else
  {
    v12 = objc_msgSend(a6, "shouldBeRevokedPriorToInvokingAccessor");
    v13 = v12;
    if (v12)
    {
      if (qword_1ECD0A798 != -1)
        dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
      v14 = qword_1ECD0A700;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v26 = v11;
        _os_log_impl(&dword_1817D9000, v14, OS_LOG_TYPE_INFO, "Revoking claim %{public}@ prior to invoking accessor", buf, 0xCu);
      }
      objc_msgSend(a3, "revokeAccessClaimForID:", v11);
    }
    *(_DWORD *)buf = -1;
    v23 = 1;
    v15 = _NSSetThreadSpecificMaterializationState(1, (int *)buf);
    objc_msgSend(a6, "protectFilesAgainstEviction");
    if (v15)
    {
      if (objc_msgSend(a6, "shouldEnableMaterializationDuringAccessorBlock"))
        v16 = 2;
      else
        v16 = *(_DWORD *)buf;
      if (_NSSetThreadSpecificMaterializationState(v16, &v23) && v23 != 1)
        __assert_rtn("-[NSFileCoordinator(NSPrivate) _withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:]", "NSFileCoordinator.m", 962, "materializationOffState == IOPOL_MATERIALIZE_DATALESS_FILES_OFF");
      v15 = objc_msgSend(a6, "shouldEnableMaterializationDuringAccessorBlock");
    }
    v17 = objc_msgSend(self->_fileReactor, "conformsToProtocol:", &unk_1EDCFFB50);
    v18 = v17;
    if (v17)
      v19 = objc_msgSend(self->_fileReactor, "presentedItemURL");
    else
      v19 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __98__NSFileCoordinator_NSPrivate___withAccessArbiter_invokeAccessor_orDont_andRelinquishAccessClaim___block_invoke;
    v20[3] = &unk_1E0F527B0;
    v21 = v18;
    v20[4] = self;
    v20[5] = v19;
    v22 = v13;
    v20[6] = a3;
    v20[7] = v11;
    v20[8] = a6;
    (*((void (**)(id, _QWORD *))a4 + 2))(a4, v20);
    if (v15)
      _NSSetThreadSpecificMaterializationState(*(int *)buf, &v24);
  }
}

id __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a3;
  result = a4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) = a3;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = a4;
  result = a5;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

uint64_t __73__NSFileCoordinator_coordinateReadingItemAtURL_options_error_byAccessor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__NSFileCoordinator_coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2;
  v6[3] = &unk_1E0F4E060;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = a2;
  v6[5] = v4;
  return objc_msgSend(v3, "_invokeAccessor:thenCompletionHandler:", v6, a3);
}

- (void)_lockdownPurposeIdentifier
{
  objc_setAssociatedObject(self, sel__purposeIdentifierLockedDown, (id)1, 0);
}

uint64_t __98__NSFileCoordinator_coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)_createConnectionToFileAccessArbiterForQueue:(id)a3
{
  uint64_t v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;

  v4 = qword_1ECD0A768;
  v5 = [NSXPCConnection alloc];
  if (v4)
    v6 = -[NSXPCConnection initWithListenerEndpoint:](v5, "initWithListenerEndpoint:", objc_msgSend((id)qword_1ECD0A768, "endpoint"));
  else
    v6 = -[NSXPCConnection initWithMachServiceName:options:](v5, "initWithMachServiceName:options:", CFSTR("com.apple.FileCoordination"), 0);
  v7 = v6;
  -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", +[NSFileCoordinator _fileAccessArbiterInterface](NSFileCoordinator, "_fileAccessArbiterInterface"));
  -[NSXPCConnection setOptions:](v7, "setOptions:", 4096);
  -[NSXPCConnection _setQueue:](v7, "_setQueue:", a3);
  return v7;
}

+ (id)_fileAccessArbiterInterface
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__NSFileCoordinator_NSInternal___fileAccessArbiterInterface__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD0A758 != -1)
    dispatch_once(&qword_1ECD0A758, v3);
  return (id)qword_1ECD0A760;
}

NSXPCInterface *__55__NSFileCoordinator_NSInternal___fileProviderInterface__block_invoke()
{
  NSXPCInterface *result;

  result = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &unk_1EDCF1808);
  qword_1ECD0A750 = (uint64_t)result;
  return result;
}

+ (id)_filePresenterInterface
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSXPCInterface *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v5 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &unk_1EDCF0F58);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v5, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_observeChangeOfUbiquityAttributes_, 0, 0);
  return v5;
}

uint64_t __60__NSFileCoordinator_NSInternal___fileAccessArbiterInterface__block_invoke(uint64_t a1)
{
  NSXPCInterface *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v2 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &unk_1EDCF0188);
  qword_1ECD0A760 = (uint64_t)v2;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_self();
  v17[1] = objc_opt_self();
  v17[2] = objc_opt_self();
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3)), sel_grantAccessClaim_withReply_, 0, 1);
  v4 = (void *)qword_1ECD0A760;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = objc_opt_self();
  v16[1] = objc_opt_self();
  v16[2] = objc_opt_self();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3)), sel_grantAccessClaim_withReply_, 1, 1);
  v6 = (void *)qword_1ECD0A760;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = objc_opt_self();
  v15[1] = objc_opt_self();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2)), sel_grantAccessClaim_withReply_, 2, 1);
  v8 = (void *)qword_1ECD0A760;
  v9 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_self();
  v14[1] = objc_opt_self();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v9, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2)), sel_prepareToArbitrateForURLs_, 0, 0);
  objc_msgSend((id)qword_1ECD0A760, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(*(id *)(a1 + 32), "_filePresenterInterface"), sel_addPresenter_withID_fileURL_lastPresentedItemEventIdentifier_ubiquityAttributes_options_responses_, 0, 0);
  objc_msgSend((id)qword_1ECD0A760, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(*(id *)(a1 + 32), "_fileProviderInterface"), sel_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply_, 0, 0);
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  objc_msgSend((id)qword_1ECD0A760, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL_, 1, 0);
  return objc_msgSend((id)qword_1ECD0A760, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_addPresenter_withID_fileURL_lastPresentedItemEventIdentifier_ubiquityAttributes_options_responses_, 4, 0);
}

+ (id)_fileProviderInterface
{
  if (qword_1ECD0A748 != -1)
    dispatch_once(&qword_1ECD0A748, &__block_literal_global_334);
  return (id)qword_1ECD0A750;
}

- (NSFileCoordinator)init
{
  return -[NSFileCoordinator initWithFilePresenter:](self, "initWithFilePresenter:", 0);
}

void __53__NSFileCoordinator_NSPrivate___skipCoordinationWork__block_invoke()
{
  void *v0;
  BOOL v1;

  v0 = (void *)MEMORY[0x186DA8F78]();
  v1 = (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSFileCoordinatorDoesNothing")) & 1) != 0|| getenv("NSDisableFileCoordination") != 0;
  _MergedGlobals_147 = v1;
  objc_autoreleasePoolPop(v0);
  if (_MergedGlobals_147)
    NSLog((NSString *)CFSTR("NSFileCoordinator is doing nothing."));
}

void __65__NSFileCoordinator_NSPrivate___willStartWriteWithIntents_async___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  id v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  void *v16;

  v6 = objc_msgSend(a2, "URL");
  if (!v6)
    return;
  v7 = v6;
  if ((objc_msgSend(a2, "isRead") & 1) != 0)
    return;
  v8 = objc_msgSend(a2, "writingOptions");
  v9 = v8;
  if (!*(_BYTE *)(a1 + 48))
  {
    if ((v8 & 1) != 0)
    {
      v10 = +[NSMetadataQuery willBeginPossibleDeletionOfItemAtURL:](NSMetadataQuery, "willBeginPossibleDeletionOfItemAtURL:", v7);
      goto LABEL_9;
    }
    if ((v8 & 2) == 0)
    {
      v10 = +[NSMetadataQuery willBeginPossibleCreationOfItemAtURL:](NSMetadataQuery, "willBeginPossibleCreationOfItemAtURL:", v7);
      goto LABEL_9;
    }
    v15 = a3 + 1;
    if (v15 < objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v16 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v15);
      if ((objc_msgSend(v16, "isRead") & 1) == 0)
      {
        if (objc_msgSend(v16, "URL"))
        {
          v10 = +[NSMetadataQuery willBeginPossibleMoveOfItemAtURL:toURL:](NSMetadataQuery, "willBeginPossibleMoveOfItemAtURL:toURL:", v7, objc_msgSend(v16, "URL"));
LABEL_9:
          if (v10)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
        }
      }
    }
  }
  if (_CFURLIsItemPromiseAtURL())
  {
    if ((v9 & 3) != 0)
    {
      v11 = _CFURLCopyLogicalURLOfPromiseAtURL();
      if (v11)
      {
        v12 = (const void *)v11;
        v13 = (void *)objc_opt_new();
        objc_msgSend(v13, "setPromiseURL:", v7);
        objc_msgSend(v13, "setLogicalURL:", v12);
        v14 = v13;
        CFRelease(v12);
        if (v14)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
      }
    }
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileCoordinator;
  -[NSFileCoordinator dealloc](&v3, sel_dealloc);
}

- (id)_willStartWriteWithIntents:(id)a3 async:(BOOL)a4
{
  void *v6;
  _QWORD v8[6];
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__NSFileCoordinator_NSPrivate___willStartWriteWithIntents_async___block_invoke;
  v8[3] = &unk_1E0F52788;
  v9 = a4;
  v8[4] = a3;
  v8[5] = v6;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v8);
  return v6;
}

uint64_t __73__NSFileCoordinator_coordinateWritingItemAtURL_options_error_byAccessor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__NSFileCoordinator_coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2;
  v6[3] = &unk_1E0F4E060;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = a2;
  v6[5] = v4;
  return objc_msgSend(v3, "_invokeAccessor:thenCompletionHandler:", v6, a3);
}

uint64_t __98__NSFileCoordinator_coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98__NSFileCoordinator_coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2;
  v6[3] = &unk_1E0F4DF70;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[5] = a3;
  v6[6] = v4;
  v6[4] = a2;
  return objc_msgSend(v3, "_invokeAccessor:thenCompletionHandler:", v6);
}

id __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) = a3;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = a4;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = a5;
  result = a6;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = result;
  return result;
}

+ (void)addFilePresenter:(id)filePresenter
{
  -[NSFileAccessArbiterProxy addFilePresenter:](NSFileCoordinatorSharedAccessArbiter(), "addFilePresenter:", filePresenter);
}

- (void)coordinateReadingItemAtURL:(NSURL *)readingURL options:(NSFileCoordinatorReadingOptions)readingOptions writingItemAtURL:(NSURL *)writingURL options:(NSFileCoordinatorWritingOptions)writingOptions error:(NSError *)outError byAccessor:(void *)readerWriter
{
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__NSFileCoordinator_coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke;
  v8[3] = &unk_1E0F526B0;
  v8[4] = self;
  v8[5] = readerWriter;
  -[NSFileCoordinator _coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:](self, "_coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", readingURL, readingOptions, writingURL, writingOptions, outError, v8);
}

- (void)_coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 error:(id *)a7 byAccessor:(id)a8
{
  unint64_t v15;
  NSFileReadingWritingClaim *v16;
  id purposeID;
  id v18;
  id v19;
  uint64_t v20;
  NSFileReadingWritingClaim *v21;
  id *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t *v31;
  id *v32;
  _QWORD v33[12];
  _QWORD v34[8];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  uint64_t v58;
  uint8_t buf[4];
  unint64_t v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, id, void *))a8 + 2))(a8, a3, a5, &__block_literal_global_192);
  }
  else
  {
    v32 = a7;
    v53 = 0;
    v54 = &v53;
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
      v15 = a4 | 0x80000000;
    else
      v15 = a4;
    v55 = 0x3052000000;
    v56 = __Block_byref_object_copy__24;
    v57 = __Block_byref_object_dispose__24;
    v58 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x3052000000;
    v50 = __Block_byref_object_copy__24;
    v51 = __Block_byref_object_dispose__24;
    v52 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x3052000000;
    v44 = __Block_byref_object_copy__24;
    v45 = __Block_byref_object_dispose__24;
    v46 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3052000000;
    v38 = __Block_byref_object_copy__24;
    v39 = __Block_byref_object_dispose__24;
    v40 = 0;
    v16 = [NSFileReadingWritingClaim alloc];
    purposeID = self->_purposeID;
    v18 = +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3);
    v19 = +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a5);
    v20 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2;
    v34[3] = &unk_1E0F528E0;
    v34[4] = &v53;
    v34[5] = &v47;
    v34[6] = &v41;
    v34[7] = &v35;
    v21 = -[NSFileReadingWritingClaim initWithPurposeID:readingURL:options:writingURL:options:claimer:](v16, "initWithPurposeID:readingURL:options:writingURL:options:claimer:", purposeID, v18, v15, v19, a6, v34);
    v22 = v32;
    if (__NSFCShouldLog(1))
    {
      if (qword_1ECD0A798 != -1)
        dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
      v23 = qword_1ECD0A700;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
      {
        v24 = self->_purposeID;
        v25 = -[NSFileAccessClaim claimID](v21, "claimID");
        *(_DWORD *)buf = 134218755;
        v60 = v15;
        v61 = 2113;
        v62 = a3;
        v63 = 2114;
        v64 = v24;
        v65 = 2114;
        v66 = v25;
        _os_log_impl(&dword_1817D9000, v23, OS_LOG_TYPE_DEFAULT, "Read options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
        v22 = v32;
        if (qword_1ECD0A798 != -1)
          dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
      }
      v26 = qword_1ECD0A700;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v20;
        v28 = self->_purposeID;
        v29 = -[NSFileAccessClaim claimID](v21, "claimID");
        *(_DWORD *)buf = 134218755;
        v60 = a6;
        v61 = 2113;
        v62 = a5;
        v63 = 2114;
        v64 = v28;
        v65 = 2114;
        v66 = v29;
        _os_log_impl(&dword_1817D9000, v26, OS_LOG_TYPE_DEFAULT, "Write options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
        v20 = v27;
      }
    }
    v30 = self->_accessArbiter;
    -[NSFileCoordinator _blockOnAccessClaim:withAccessArbiter:](self, "_blockOnAccessClaim:withAccessArbiter:", v21, v30);
    v33[0] = v20;
    v33[1] = 3221225472;
    v33[2] = __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_195;
    v33[3] = &unk_1E0F52908;
    v33[4] = a3;
    v33[5] = a5;
    v33[10] = &v47;
    v33[11] = a6;
    v33[8] = a8;
    v33[9] = &v53;
    v33[6] = self;
    v33[7] = v30;
    -[NSFileCoordinator _withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:](self, "_withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:", v30, v33, v36[5] != 0, v21);
    v31 = v36;
    if (v36[5])
    {

      v31 = v36;
      if (v22)
      {
        *v22 = (id)v36[5];
        v31 = v36;
      }
    }

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v53, 8);
  }
}

+ (id)_createConnectionToProgressRegistrar
{
  uint64_t v2;
  NSXPCConnection *v3;

  v2 = qword_1ECD0A778;
  v3 = [NSXPCConnection alloc];
  if (v2)
    return -[NSXPCConnection initWithListenerEndpoint:](v3, "initWithListenerEndpoint:", objc_msgSend((id)qword_1ECD0A778, "endpoint"));
  else
    return -[NSXPCConnection initWithMachServiceName:options:](v3, "initWithMachServiceName:options:", CFSTR("com.apple.ProgressReporting"), 0);
}

+ (unint64_t)_responsesForPresenter:(id)a3
{
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  char v15;
  char v16;

  v3 = objc_opt_respondsToSelector();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = v3 & 1 | 2;
  else
    v4 = v3 & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 |= 4uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 |= 8uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 |= 0x10uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 |= 0x20uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 |= 0x40uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 |= 0x80uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 |= 0x100uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 |= 0x200uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 |= 0x400uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 |= 0x800uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 |= 0x1000uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 |= 0x2000uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 |= 0x4000uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 |= 0x8000uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = v4 | 0x10000;
  else
    v5 = v4;
  v16 = objc_opt_respondsToSelector();
  v15 = objc_opt_respondsToSelector();
  v6 = objc_opt_respondsToSelector();
  v7 = objc_opt_respondsToSelector();
  v8 = objc_opt_respondsToSelector();
  v9 = objc_opt_respondsToSelector();
  v10 = objc_opt_respondsToSelector();
  v11 = objc_opt_respondsToSelector();
  v12 = objc_opt_respondsToSelector();
  v13 = objc_opt_respondsToSelector();
  if ((((objc_opt_respondsToSelector() | v13 | v12 | v11 | v10 | v9 | v8) | (v7 | v6 | v15 | v16)) & 1) != 0)
    return v5 | 0xFFFFFFFF80000000;
  else
    return v5;
}

+ (void)removeFilePresenter:(id)filePresenter
{
  -[NSFileAccessArbiterProxy removeFilePresenter:](NSFileCoordinatorSharedAccessArbiter(), "removeFilePresenter:", filePresenter);
}

+ (NSArray)filePresenters
{
  return (NSArray *)-[NSFileAccessArbiterProxy filePresenters](NSFileCoordinatorSharedAccessArbiter(), "filePresenters");
}

- (void)setPurposeIdentifier:(NSString *)purposeIdentifier
{
  NSString *v6;
  void *v7;
  _QWORD *v8;

  if (-[NSFileCoordinator _purposeIdentifierLockedDown](self, "_purposeIdentifierLockedDown"))
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: A purpose identifier can't be set more than once."), _NSMethodExceptionProem((objc_class *)self, a2));
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = (_QWORD *)MEMORY[0x1E0C99750];
    goto LABEL_6;
  }
  if (!-[NSString length](purposeIdentifier, "length"))
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: A nil or zero-length purpose identifier is not allowed."), _NSMethodExceptionProem((objc_class *)self, a2));
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = (_QWORD *)MEMORY[0x1E0C99778];
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", *v8, v6, 0));
  }
  -[NSFileCoordinator _setPurposeIdentifier:](self, "_setPurposeIdentifier:", purposeIdentifier);
}

- (NSString)purposeIdentifier
{
  return (NSString *)self->_purposeID;
}

- (void)coordinateWritingItemAtURL:(NSURL *)url1 options:(NSFileCoordinatorWritingOptions)options1 writingItemAtURL:(NSURL *)url2 options:(NSFileCoordinatorWritingOptions)options2 error:(NSError *)outError byAccessor:(void *)writer
{
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__NSFileCoordinator_coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke;
  v8[3] = &unk_1E0F526B0;
  v8[4] = self;
  v8[5] = writer;
  -[NSFileCoordinator _coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:](self, "_coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", url1, options1, url2, options2, outError, v8);
}

uint64_t __98__NSFileCoordinator_coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98__NSFileCoordinator_coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2;
  v6[3] = &unk_1E0F4DF70;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[5] = a3;
  v6[6] = v4;
  v6[4] = a2;
  return objc_msgSend(v3, "_invokeAccessor:thenCompletionHandler:", v6);
}

uint64_t __98__NSFileCoordinator_coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)coordinateAccessWithIntents:(NSArray *)intents queue:(NSOperationQueue *)queue byAccessor:(void *)accessor
{
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__NSFileCoordinator_coordinateAccessWithIntents_queue_byAccessor___block_invoke;
  v5[3] = &unk_1E0F526D8;
  v5[4] = self;
  v5[5] = accessor;
  -[NSFileCoordinator _coordinateAccessWithIntents:queue:byAccessor:](self, "_coordinateAccessWithIntents:queue:byAccessor:", intents, queue, v5);
}

uint64_t __66__NSFileCoordinator_coordinateAccessWithIntents_queue_byAccessor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__NSFileCoordinator_coordinateAccessWithIntents_queue_byAccessor___block_invoke_2;
  v6[3] = &unk_1E0F4E060;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = a2;
  v6[5] = v4;
  return objc_msgSend(v3, "_invokeAccessor:thenCompletionHandler:", v6, a3);
}

uint64_t __66__NSFileCoordinator_coordinateAccessWithIntents_queue_byAccessor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)prepareForReadingItemsAtURLs:(NSArray *)readingURLs options:(NSFileCoordinatorReadingOptions)readingOptions writingItemsAtURLs:(NSArray *)writingURLs options:(NSFileCoordinatorWritingOptions)writingOptions error:(NSError *)outError byAccessor:(void *)batchAccessor
{
  NSObject *v13;
  uint64_t v14;
  id accessArbiter;
  _QWORD v18[7];
  _QWORD v19[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33 = &v32;
  v34 = 0x3052000000;
  v35 = __Block_byref_object_copy__24;
  v36 = __Block_byref_object_dispose__24;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = __Block_byref_object_copy__24;
  v30 = __Block_byref_object_dispose__24;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__11;
  v24 = __Block_byref_object_dispose__12;
  v25 = 0;
  v13 = dispatch_semaphore_create(0);
  v14 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __102__NSFileCoordinator_prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_error_byAccessor___block_invoke;
  v19[3] = &unk_1E0F52700;
  v19[6] = &v26;
  v19[7] = &v20;
  v19[4] = v13;
  v19[5] = &v32;
  -[NSFileCoordinator __prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:byAccessor:](self, "__prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:byAccessor:", readingURLs, readingOptions, writingURLs, writingOptions, v19);
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v13);
  if (v27[5])
  {
    (*(void (**)(void))(v21[5] + 16))();

    if (outError)
      *outError = (NSError *)(id)v27[5];
  }
  else
  {
    accessArbiter = self->_accessArbiter;
    self->_accessArbiter = (id)v33[5];
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __102__NSFileCoordinator_prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_error_byAccessor___block_invoke_2;
    v18[3] = &unk_1E0F52CB0;
    v18[4] = self;
    v18[5] = accessArbiter;
    v18[6] = &v20;
    (*((void (**)(void *, _QWORD *))batchAccessor + 2))(batchAccessor, v18);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
}

intptr_t __102__NSFileCoordinator_prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_error_byAccessor___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(a4, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __102__NSFileCoordinator_prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_error_byAccessor___block_invoke_2(_QWORD *a1)
{
  *(_QWORD *)(a1[4] + 8) = a1[5];
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) + 16))();

}

- (void)itemAtURL:(NSURL *)oldURL willMoveToURL:(NSURL *)newURL
{
  if (*(NSFileCoordinator **)NSFileCoordinatorGetTSD() != self)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("-[NSFileCoordinator itemAtURL:willMoveToURL:] may only be invoked from within a block passed to a -coordinate... method."), 0));
  -[NSFileCoordinator _itemAtURL:willMoveToURL:](self, "_itemAtURL:willMoveToURL:", oldURL, newURL);
}

- (void)itemAtURL:(NSURL *)oldURL didMoveToURL:(NSURL *)newURL
{
  if (*(NSFileCoordinator **)NSFileCoordinatorGetTSD() != self)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("-[NSFileCoordinator itemAtURL:didMoveToURL:] may only be invoked from within a block passed to a -coordinate... method."), 0));
  -[NSFileCoordinator _itemAtURL:didMoveToURL:](self, "_itemAtURL:didMoveToURL:", oldURL, newURL);
}

- (BOOL)_isValidUbiquityAttribute:(id)a3
{
  if (qword_1ECD0A730 != -1)
    dispatch_once(&qword_1ECD0A730, &__block_literal_global_73);
  return objc_msgSend((id)qword_1ECD0A728, "member:", a3) != 0;
}

uint64_t __47__NSFileCoordinator__isValidUbiquityAttribute___block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  result = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0C99A38], *MEMORY[0x1E0C99B10], *MEMORY[0x1E0C99B20], *MEMORY[0x1E0C99B38], *MEMORY[0x1E0C99B40], *MEMORY[0x1E0C99B00], *MEMORY[0x1E0C99AE8], *MEMORY[0x1E0C99B48], *MEMORY[0x1E0C99AE0], *MEMORY[0x1E0C99AD8], *MEMORY[0x1E0C99B30], *MEMORY[0x1E0C99B58], *MEMORY[0x1E0C99B50], *MEMORY[0x1E0C99B68], *MEMORY[0x1E0C99B60], 0);
  qword_1ECD0A728 = result;
  return result;
}

- (void)itemAtURL:(NSURL *)url didChangeUbiquityAttributes:(NSSet *)attributes
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!attributes)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v13 = (NSString *)CFSTR("nil attributes");
LABEL_15:
    objc_exception_throw((id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v13, 0));
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = -[NSSet countByEnumeratingWithState:objects:count:](attributes, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (!v7)
    goto LABEL_10;
  v8 = v7;
  v9 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(attributes);
      v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
      if (!-[NSFileCoordinator _isValidUbiquityAttribute:](self, "_isValidUbiquityAttribute:", v11))
      {
        v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("invalid attribute: %@"), v11);
        v14 = (void *)MEMORY[0x1E0C99DA0];
        v15 = *MEMORY[0x1E0C99778];
        goto LABEL_15;
      }
    }
    v8 = -[NSSet countByEnumeratingWithState:objects:count:](attributes, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  }
  while (v8);
LABEL_10:
  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    if (-[NSSet count](attributes, "count"))
    {
      v12 = (void *)MEMORY[0x186DA8F78]();
      objc_msgSend(self->_accessArbiter, "writerWithPurposeID:didChangeUbiquityAttributes:ofItemAtURL:", self->_purposeID, attributes, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", url)));
      objc_autoreleasePoolPop(v12);
    }
  }
}

- (void)cancel
{
  NSObject *v3;
  id accessClaimIDOrIDs;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSFileCoordinator *v10;
  NSObject *v11;
  NSObject *v12;
  NSFileCoordinator *v13;
  __int128 v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  NSFileCoordinator *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&stru_1ECD0A6EC);
  if (qword_1ECD0A798 != -1)
    dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
  v3 = qword_1ECD0A6F8;
  if (os_log_type_enabled((os_log_t)qword_1ECD0A6F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = self;
    _os_log_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEFAULT, "NSFileCoordinator instance %p was cancelled. All future claims made on this instance will immediately fail with cancellation", buf, 0xCu);
  }
  if (_NSIsNSSet())
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    accessClaimIDOrIDs = self->_accessClaimIDOrIDs;
    v5 = objc_msgSend(accessClaimIDOrIDs, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v17;
      *(_QWORD *)&v6 = 138543362;
      v14 = v6;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(accessClaimIDOrIDs);
          v10 = *(NSFileCoordinator **)(*((_QWORD *)&v16 + 1) + 8 * v9);
          if (qword_1ECD0A798 != -1)
            dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
          v11 = qword_1ECD0A700;
          if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v21 = v10;
            _os_log_impl(&dword_1817D9000, v11, OS_LOG_TYPE_DEFAULT, "In-flight claim %{public}@ was cancelled", buf, 0xCu);
          }
          objc_msgSend(self->_accessArbiter, "cancelAccessClaimForID:", v10, v14);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(accessClaimIDOrIDs, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      }
      while (v7);
    }
  }
  else if (self->_accessClaimIDOrIDs)
  {
    if (qword_1ECD0A798 != -1)
      dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
    v12 = qword_1ECD0A700;
    if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (NSFileCoordinator *)self->_accessClaimIDOrIDs;
      *(_DWORD *)buf = 138543362;
      v21 = v13;
      _os_log_impl(&dword_1817D9000, v12, OS_LOG_TYPE_DEFAULT, "In-flight claim %{public}@ was cancelled", buf, 0xCu);
    }
    objc_msgSend(self->_accessArbiter, "cancelAccessClaimForID:", self->_accessClaimIDOrIDs);
  }
  self->_isCancelled = 1;
  os_unfair_lock_unlock(&stru_1ECD0A6EC);
}

+ (id)_nextClaimIdentifier
{
  uint64_t TSD;
  id result;

  TSD = NSFileCoordinatorGetTSD();
  result = *(id *)(TSD + 32);
  if (!result)
  {
    result = (id)__CFCreateUUIDString();
    *(_QWORD *)(TSD + 32) = result;
  }
  return result;
}

+ (void)_setNextClaimIdentifier:(id)a3
{
  uint64_t TSD;

  TSD = NSFileCoordinatorGetTSD();
  if (*(_QWORD *)(TSD + 32))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't set next claim identifier when current identifier has not been consumed"), 0));
  *(_QWORD *)(TSD + 32) = objc_msgSend(a3, "copy");
}

- (void)_cancelClaimWithIdentifier:(id)a3
{
  objc_msgSend(self->_accessArbiter, "cancelAccessClaimForID:", a3);
}

void __70__NSFileCoordinator_NSPrivate___blockOnAccessClaim_withAccessArbiter___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog((NSString *)CFSTR("%@"), a2);
}

uint64_t __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_182(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (!v2)
    v2 = a1[4];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2_183;
  v5[3] = &unk_1E0F4E060;
  v3 = a1[6];
  v5[4] = a1[5];
  v5[5] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(v3 + 16))(v3, v2, v5);
}

void __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2_183(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_188(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[8];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
  if (!v4)
    v4 = a1[4];
  v5 = (void *)a1[5];
  v11[0] = +[NSFileAccessIntent writingIntentWithURL:options:](NSFileAccessIntent, "writingIntentWithURL:options:", v4, a1[9]);
  v6 = objc_msgSend(v5, "_willStartWriteWithIntents:async:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1), 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2_191;
  v10[3] = &unk_1E0F52870;
  v8 = a1[6];
  v7 = a1[7];
  v10[4] = a1[5];
  v10[5] = v6;
  v10[6] = v8;
  v10[7] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(v7 + 16))(v7, v4, v10);
}

void __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2_191(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_didEndWrite:", *(_QWORD *)(a1 + 40));

}

uint64_t __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_195(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[8];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40);
  if (!v4)
    v4 = a1[4];
  v5 = *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40);
  if (!v5)
    v5 = a1[5];
  v6 = (void *)a1[6];
  v12[0] = +[NSFileAccessIntent writingIntentWithURL:options:](NSFileAccessIntent, "writingIntentWithURL:options:", v5, a1[11]);
  v7 = objc_msgSend(v6, "_willStartWriteWithIntents:async:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1), 0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2_196;
  v11[3] = &unk_1E0F52870;
  v9 = a1[7];
  v8 = a1[8];
  v11[4] = a1[6];
  v11[5] = v7;
  v11[6] = v9;
  v11[7] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v8 + 16))(v8, v4, v5, v11);
}

void __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2_196(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_didEndWrite:", *(_QWORD *)(a1 + 40));

}

- (void)_coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 error:(id *)a7 byAccessor:(id)a8
{
  NSFileWritingWritingClaim *v15;
  id purposeID;
  id v17;
  id v18;
  uint64_t v19;
  NSFileWritingWritingClaim *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t *v29;
  id *v30;
  _QWORD v31[13];
  _QWORD v32[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  uint64_t v50;
  uint8_t buf[4];
  unint64_t v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, id, void *))a8 + 2))(a8, a3, a5, &__block_literal_global_197);
  }
  else
  {
    v30 = a7;
    v45 = 0;
    v46 = &v45;
    v47 = 0x3052000000;
    v48 = __Block_byref_object_copy__24;
    v49 = __Block_byref_object_dispose__24;
    v50 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3052000000;
    v42 = __Block_byref_object_copy__24;
    v43 = __Block_byref_object_dispose__24;
    v44 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3052000000;
    v36 = __Block_byref_object_copy__24;
    v37 = __Block_byref_object_dispose__24;
    v38 = 0;
    v15 = [NSFileWritingWritingClaim alloc];
    purposeID = self->_purposeID;
    v17 = +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3);
    v18 = +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a5);
    v19 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2;
    v32[3] = &unk_1E0F52950;
    v32[4] = &v45;
    v32[5] = &v39;
    v32[6] = &v33;
    v20 = -[NSFileWritingWritingClaim initWithPurposeID:url:options:url:options:claimer:](v15, "initWithPurposeID:url:options:url:options:claimer:", purposeID, v17, a4, v18, a6, v32);
    if (__NSFCShouldLog(1))
    {
      if (qword_1ECD0A798 != -1)
        dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
      v21 = qword_1ECD0A700;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_purposeID;
        v23 = -[NSFileAccessClaim claimID](v20, "claimID");
        *(_DWORD *)buf = 134218755;
        v52 = a4;
        v53 = 2113;
        v54 = a3;
        v55 = 2114;
        v56 = v22;
        v57 = 2114;
        v58 = v23;
        _os_log_impl(&dword_1817D9000, v21, OS_LOG_TYPE_DEFAULT, "Write options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
        v19 = MEMORY[0x1E0C809B0];
        if (qword_1ECD0A798 != -1)
          dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
      }
      v24 = qword_1ECD0A700;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v19;
        v26 = self->_purposeID;
        v27 = -[NSFileAccessClaim claimID](v20, "claimID");
        *(_DWORD *)buf = 134218755;
        v52 = a6;
        v53 = 2113;
        v54 = a5;
        v55 = 2114;
        v56 = v26;
        v57 = 2114;
        v58 = v27;
        _os_log_impl(&dword_1817D9000, v24, OS_LOG_TYPE_DEFAULT, "Write options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
        v19 = v25;
      }
    }
    v28 = self->_accessArbiter;
    -[NSFileCoordinator _blockOnAccessClaim:withAccessArbiter:](self, "_blockOnAccessClaim:withAccessArbiter:", v20, v28);
    v31[0] = v19;
    v31[1] = 3221225472;
    v31[2] = __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_200;
    v31[3] = &unk_1E0F52978;
    v31[4] = a3;
    v31[5] = a5;
    v31[10] = &v39;
    v31[11] = a4;
    v31[12] = a6;
    v31[8] = a8;
    v31[9] = &v45;
    v31[6] = self;
    v31[7] = v28;
    -[NSFileCoordinator _withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:](self, "_withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:", v28, v31, v34[5] != 0, v20);
    v29 = v34;
    if (v34[5])
    {

      v29 = v34;
      if (v30)
      {
        *v30 = (id)v34[5];
        v29 = v34;
      }
    }

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);
  }
}

id __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) = a3;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = a4;
  result = a5;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

uint64_t __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_200(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[8];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40);
  if (!v4)
    v4 = a1[4];
  v5 = *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40);
  if (!v5)
    v5 = a1[5];
  v6 = (void *)a1[6];
  v12[0] = +[NSFileAccessIntent writingIntentWithURL:options:](NSFileAccessIntent, "writingIntentWithURL:options:", v4, a1[11]);
  v12[1] = +[NSFileAccessIntent writingIntentWithURL:options:](NSFileAccessIntent, "writingIntentWithURL:options:", v5, a1[12]);
  v7 = objc_msgSend(v6, "_willStartWriteWithIntents:async:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2), 0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2_201;
  v11[3] = &unk_1E0F52870;
  v9 = a1[7];
  v8 = a1[8];
  v11[4] = a1[6];
  v11[5] = v7;
  v11[6] = v9;
  v11[7] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v8 + 16))(v8, v4, v5, v11);
}

void __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2_201(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_didEndWrite:", *(_QWORD *)(a1 + 40));

}

- (void)_coordinateAccessWithIntents:(id)a3 queue:(id)a4 byAccessor:(id)a5
{
  id accessArbiter;
  NSFileMultipleAccessClaim *v10;
  id purposeID;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  NSAutoreleasePool *v30;
  id v31;
  NSFileMultipleAccessClaim *v32;
  uint64_t v33;
  _QWORD v34[6];
  _QWORD v35[9];
  _QWORD v36[5];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[128];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke;
    v36[3] = &unk_1E0F4E870;
    v36[4] = a5;
    objc_msgSend(a4, "_fc_addUncancellableOperationWithBlock:", v36);
  }
  else
  {
    accessArbiter = self->_accessArbiter;
    v30 = objc_alloc_init(NSAutoreleasePool);
    v10 = [NSFileMultipleAccessClaim alloc];
    purposeID = self->_purposeID;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_3;
    v35[3] = &unk_1E0F529E8;
    v35[4] = self;
    v35[5] = a3;
    v29 = accessArbiter;
    v35[6] = accessArbiter;
    v35[7] = a4;
    v35[8] = a5;
    v32 = -[NSFileMultipleAccessClaim initWithPurposeID:intents:claimer:](v10, "initWithPurposeID:intents:claimer:", purposeID, a3, v35);
    if (__NSFCShouldLog(1))
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v48, v47, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v49;
        v15 = &_MergedGlobals_114;
        v16 = &_MergedGlobals_114;
        v31 = a3;
        do
        {
          v17 = 0;
          v33 = v13;
          do
          {
            if (*(_QWORD *)v49 != v14)
              objc_enumerationMutation(a3);
            v18 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v17);
            if (v15[243] != -1)
              dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
            v19 = v16[224];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = v14;
              v21 = v16;
              v22 = v15;
              if (objc_msgSend(v18, "isRead"))
                v23 = "Read";
              else
                v23 = "Write";
              if (objc_msgSend(v18, "isRead"))
                v24 = objc_msgSend(v18, "readingOptions");
              else
                v24 = objc_msgSend(v18, "writingOptions");
              v25 = v24;
              v26 = objc_msgSend(v18, "URL");
              v27 = self->_purposeID;
              v28 = -[NSFileAccessClaim claimID](v32, "claimID");
              *(_DWORD *)buf = 136316163;
              v38 = v23;
              v39 = 2048;
              v40 = v25;
              v41 = 2113;
              v42 = v26;
              v43 = 2114;
              v44 = v27;
              v45 = 2114;
              v46 = v28;
              _os_log_impl(&dword_1817D9000, v19, OS_LOG_TYPE_DEFAULT, "%s options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x34u);
              a3 = v31;
              v15 = v22;
              v16 = v21;
              v14 = v20;
              v13 = v33;
            }
            ++v17;
          }
          while (v13 != v17);
          v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v48, v47, 16);
        }
        while (v13);
      }
    }
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_208;
    v34[3] = &unk_1E0F4C650;
    v34[4] = v29;
    v34[5] = v32;
    -[NSFileCoordinator _requestAccessClaim:withProcedure:](self, "_requestAccessClaim:withProcedure:", v32, v34);

    -[NSAutoreleasePool drain](v30, "drain");
  }
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v22[6];
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = *(void **)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v14, "isRead"))
          v15 = objc_msgSend(a3, "objectAtIndex:", v10++);
        else
          v15 = objc_msgSend(a4, "objectAtIndex:", v11++);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v14, "setURL:", v15);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    }
    while (v9);
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_4;
  v22[3] = &unk_1E0F52CD8;
  v16 = *(_QWORD *)(a1 + 48);
  v22[4] = *(_QWORD *)(a1 + 56);
  v22[5] = a6;
  v23 = *(_OWORD *)(a1 + 32);
  v24 = *(_QWORD *)(a1 + 64);
  return objc_msgSend((id)v23, "_withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:", v16, v22, 0, a2);
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  __int128 v3;
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_5;
  v5[3] = &unk_1E0F529C0;
  v3 = *(_OWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = v3;
  v8 = a2;
  return objc_msgSend(v2, "_fc_addUncancellableOperationWithBlock:", v5);
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "_willStartWriteWithIntents:async:", *(_QWORD *)(a1 + 48), 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_6;
  v7[3] = &unk_1E0F4DF70;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v7[5] = v3;
  v7[6] = v5;
  v7[4] = *(_QWORD *)(a1 + 40);
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(v4 + 16))(v4, v2, v7);
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_didEndWrite:", *(_QWORD *)(a1 + 40));
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_208(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "grantAccessClaim:synchronouslyIfPossible:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_itemAtURL:(id)a3 didMoveToURL:(id)a4
{
  void *v7;

  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v7 = (void *)MEMORY[0x186DA8F78]();
    objc_msgSend(self->_accessArbiter, "writerWithPurposeID:didMoveItemAtURL:toURL:", self->_purposeID, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)), +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a4)));
    objc_autoreleasePoolPop(v7);
  }
}

- (void)_ubiquityDidChangeForItemAtURL:(id)a3
{
  NSAutoreleasePool *v5;

  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v5 = objc_alloc_init(NSAutoreleasePool);
    objc_msgSend(self->_accessArbiter, "writerWithPurposeID:didChangeUbiquityOfItemAtURL:", self->_purposeID, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)));
    -[NSAutoreleasePool drain](v5, "drain");
  }
}

- (void)sharingDidChangeForItemAtURL:(id)a3
{
  void *v5;

  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v5 = (void *)MEMORY[0x186DA8F78]();
    objc_msgSend(self->_accessArbiter, "writerWithPurposeID:didChangeSharingOfItemAtURL:", self->_purposeID, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)));
    objc_autoreleasePoolPop(v5);
  }
}

- (void)_itemDidDisappearAtURL:(id)a3
{
  NSAutoreleasePool *v5;

  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v5 = objc_alloc_init(NSAutoreleasePool);
    objc_msgSend(self->_accessArbiter, "writerWithPurposeID:didMakeItemDisappearAtURL:", self->_purposeID, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)));
    -[NSAutoreleasePool drain](v5, "drain");
  }
}

- (void)_itemDidChangeAtURL:(id)a3
{
  NSAutoreleasePool *v5;

  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v5 = objc_alloc_init(NSAutoreleasePool);
    objc_msgSend(self->_accessArbiter, "writerWithPurposeID:didChangeItemAtURL:", self->_purposeID, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)));
    -[NSAutoreleasePool drain](v5, "drain");
  }
}

- (void)__coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 byAccessor:(id)a6
{
  id accessArbiter;
  NSAutoreleasePool *v12;
  NSFileReadingClaim *v13;
  id v14;
  uint64_t v15;
  NSFileReadingClaim *v16;
  NSObject *v17;
  id purposeID;
  uint64_t v19;
  _QWORD v20[6];
  _QWORD v21[9];
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, _QWORD, void *))a6 + 2))(a6, a3, 0, &__block_literal_global_209);
  }
  else
  {
    accessArbiter = self->_accessArbiter;
    v12 = objc_alloc_init(NSAutoreleasePool);
    v13 = [NSFileReadingClaim alloc];
    v14 = +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3);
    v15 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_2;
    v21[3] = &unk_1E0F52A38;
    v21[4] = self;
    v21[5] = a3;
    v21[7] = a6;
    v21[8] = a4;
    v21[6] = accessArbiter;
    v16 = -[NSFileReadingClaim initWithPurposeID:url:options:claimer:](v13, "initWithPurposeID:url:options:claimer:", a5, v14, a4, v21);
    if (__NSFCShouldLog(1))
    {
      if (qword_1ECD0A798 != -1)
        dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
      v17 = qword_1ECD0A700;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
      {
        purposeID = self->_purposeID;
        v19 = -[NSFileAccessClaim claimID](v16, "claimID");
        *(_DWORD *)buf = 134218755;
        v23 = a4;
        v24 = 2113;
        v25 = a3;
        v26 = 2114;
        v27 = purposeID;
        v28 = 2114;
        v29 = v19;
        _os_log_impl(&dword_1817D9000, v17, OS_LOG_TYPE_DEFAULT, "Read (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
      }
    }
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_210;
    v20[3] = &unk_1E0F4C650;
    v20[4] = accessArbiter;
    v20[5] = v16;
    -[NSFileCoordinator _requestAccessClaim:withProcedure:](self, "_requestAccessClaim:withProcedure:", v16, v20);

    -[NSAutoreleasePool drain](v12, "drain");
  }
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  if (!a3)
    a3 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_3;
  v13[3] = &unk_1E0F52A10;
  v13[4] = v9;
  v13[5] = a3;
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 48);
  v13[7] = *(_QWORD *)(a1 + 56);
  v13[8] = v10;
  v13[6] = a5;
  return objc_msgSend(v9, "_withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:", v11, v13, 0, a2);
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)a1[4];
  v11[0] = +[NSFileAccessIntent readingIntentWithURL:options:](NSFileAccessIntent, "readingIntentWithURL:options:", a1[5], a1[8]);
  v5 = objc_msgSend(v4, "_willStartWriteWithIntents:async:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1), 1);
  v6 = a1[6];
  v7 = a1[7];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_4;
  v10[3] = &unk_1E0F4DF70;
  v10[5] = v5;
  v10[6] = a2;
  v8 = a1[5];
  v10[4] = a1[4];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v7 + 16))(v7, v8, v6, v10);
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_didEndWrite:", *(_QWORD *)(a1 + 40));
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_210(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "grantAccessClaim:synchronouslyIfPossible:", *(_QWORD *)(a1 + 40), 0);
}

- (void)__coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 byAccessor:(id)a6
{
  id accessArbiter;
  NSAutoreleasePool *v12;
  NSFileWritingClaim *v13;
  id v14;
  uint64_t v15;
  NSFileWritingClaim *v16;
  NSObject *v17;
  id purposeID;
  uint64_t v19;
  _QWORD v20[6];
  _QWORD v21[9];
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, _QWORD, void *))a6 + 2))(a6, a3, 0, &__block_literal_global_211);
  }
  else
  {
    accessArbiter = self->_accessArbiter;
    v12 = objc_alloc_init(NSAutoreleasePool);
    v13 = [NSFileWritingClaim alloc];
    v14 = +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3);
    v15 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_2;
    v21[3] = &unk_1E0F52A60;
    v21[4] = self;
    v21[5] = a3;
    v21[7] = a6;
    v21[8] = a4;
    v21[6] = accessArbiter;
    v16 = -[NSFileWritingClaim initWithPurposeID:url:options:claimer:](v13, "initWithPurposeID:url:options:claimer:", a5, v14, a4, v21);
    if (__NSFCShouldLog(1))
    {
      if (qword_1ECD0A798 != -1)
        dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
      v17 = qword_1ECD0A700;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
      {
        purposeID = self->_purposeID;
        v19 = -[NSFileAccessClaim claimID](v16, "claimID");
        *(_DWORD *)buf = 134218755;
        v23 = a4;
        v24 = 2113;
        v25 = a3;
        v26 = 2114;
        v27 = purposeID;
        v28 = 2114;
        v29 = v19;
        _os_log_impl(&dword_1817D9000, v17, OS_LOG_TYPE_DEFAULT, "Write (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
      }
    }
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_212;
    v20[3] = &unk_1E0F4C650;
    v20[4] = accessArbiter;
    v20[5] = v16;
    -[NSFileCoordinator _requestAccessClaim:withProcedure:](self, "_requestAccessClaim:withProcedure:", v16, v20);

    -[NSAutoreleasePool drain](v12, "drain");
  }
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[10];

  v12[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  if (!a3)
    a3 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_3;
  v12[3] = &unk_1E0F52A10;
  v12[4] = v8;
  v12[5] = a3;
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 48);
  v12[7] = *(_QWORD *)(a1 + 56);
  v12[8] = v9;
  v12[6] = a4;
  return objc_msgSend(v8, "_withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:", v10, v12, 0, a2);
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)a1[4];
  v11[0] = +[NSFileAccessIntent writingIntentWithURL:options:](NSFileAccessIntent, "writingIntentWithURL:options:", a1[5], a1[8]);
  v5 = objc_msgSend(v4, "_willStartWriteWithIntents:async:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1), 1);
  v6 = a1[6];
  v7 = a1[7];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_4;
  v10[3] = &unk_1E0F4DF70;
  v10[5] = v5;
  v10[6] = a2;
  v8 = a1[5];
  v10[4] = a1[4];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v7 + 16))(v7, v8, v6, v10);
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_didEndWrite:", *(_QWORD *)(a1 + 40));
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_212(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "grantAccessClaim:synchronouslyIfPossible:", *(_QWORD *)(a1 + 40), 0);
}

- (void)__coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 purposeID:(id)a7 byAccessor:(id)a8
{
  id accessArbiter;
  unint64_t v16;
  NSFileReadingWritingClaim *v17;
  id v18;
  id v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  NSFileReadingWritingClaim *v23;
  unint64_t v24;
  NSFileCoordinator *v25;
  NSFileReadingWritingClaim *v26;
  NSObject *v27;
  unint64_t v28;
  id v29;
  id purposeID;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  NSAutoreleasePool *v37;
  id v38;
  NSFileCoordinator *v39;
  _QWORD v40[6];
  _QWORD v41[10];
  uint8_t buf[4];
  unint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, id, _QWORD, void *))a8 + 2))(a8, a3, a5, 0, &__block_literal_global_213);
  }
  else
  {
    accessArbiter = self->_accessArbiter;
    v37 = objc_alloc_init(NSAutoreleasePool);
    v39 = self;
    v16 = a4;
    v17 = [NSFileReadingWritingClaim alloc];
    v18 = +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3);
    v19 = accessArbiter;
    v20 = a6;
    v21 = +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a5);
    v22 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_2;
    v41[3] = &unk_1E0F52AB0;
    v41[4] = v39;
    v41[5] = a3;
    v41[6] = a5;
    v41[7] = v19;
    v41[8] = a8;
    v41[9] = v20;
    v23 = v17;
    v24 = v16;
    v25 = v39;
    v26 = -[NSFileReadingWritingClaim initWithPurposeID:readingURL:options:writingURL:options:claimer:](v23, "initWithPurposeID:readingURL:options:writingURL:options:claimer:", a7, v18, v24, v21, v20, v41);
    if (__NSFCShouldLog(1))
    {
      if (qword_1ECD0A798 != -1)
        dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
      v27 = qword_1ECD0A700;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
      {
        v28 = v24;
        v29 = v19;
        purposeID = v39->_purposeID;
        v31 = -[NSFileAccessClaim claimID](v26, "claimID");
        *(_DWORD *)buf = 134218755;
        v43 = v28;
        v44 = 2113;
        v45 = a3;
        v46 = 2114;
        v47 = purposeID;
        v19 = v29;
        v48 = 2114;
        v49 = v31;
        _os_log_impl(&dword_1817D9000, v27, OS_LOG_TYPE_DEFAULT, "Read (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
        if (qword_1ECD0A798 != -1)
          dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
      }
      v32 = qword_1ECD0A700;
      v25 = v39;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v22;
        v34 = v19;
        v35 = v39->_purposeID;
        v36 = -[NSFileAccessClaim claimID](v26, "claimID");
        *(_DWORD *)buf = 134218755;
        v43 = v20;
        v44 = 2113;
        v45 = a5;
        v46 = 2114;
        v47 = v35;
        v19 = v34;
        v22 = v33;
        v48 = 2114;
        v49 = v36;
        _os_log_impl(&dword_1817D9000, v32, OS_LOG_TYPE_DEFAULT, "Write (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
      }
    }
    v40[0] = v22;
    v40[1] = 3221225472;
    v40[2] = __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_214;
    v40[3] = &unk_1E0F4C650;
    v40[4] = v19;
    v40[5] = v26;
    -[NSFileCoordinator _requestAccessClaim:withProcedure:](v25, "_requestAccessClaim:withProcedure:", v26, v40, v37);

    objc_msgSend(v38, "drain");
  }
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[11];

  v15[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  if (!a3)
  {
    a3 = *(_QWORD *)(a1 + 40);
    if (a4)
      goto LABEL_3;
LABEL_5:
    a4 = *(_QWORD *)(a1 + 48);
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v11 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_3;
  v15[3] = &unk_1E0F52A88;
  v15[4] = v11;
  v15[5] = a4;
  v12 = *(_QWORD *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 56);
  v15[8] = *(_QWORD *)(a1 + 64);
  v15[9] = v12;
  v15[6] = a3;
  v15[7] = a6;
  return objc_msgSend(v11, "_withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:", v13, v15, 0, a2);
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[7];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)a1[4];
  v12[0] = +[NSFileAccessIntent writingIntentWithURL:options:](NSFileAccessIntent, "writingIntentWithURL:options:", a1[5], a1[9]);
  v5 = objc_msgSend(v4, "_willStartWriteWithIntents:async:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1), 1);
  v6 = a1[7];
  v7 = a1[8];
  v9 = a1[5];
  v8 = a1[6];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_4;
  v11[3] = &unk_1E0F4DF70;
  v11[5] = v5;
  v11[6] = a2;
  v11[4] = a1[4];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))(v7 + 16))(v7, v8, v9, v6, v11);
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_didEndWrite:", *(_QWORD *)(a1 + 40));
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_214(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "grantAccessClaim:synchronouslyIfPossible:", *(_QWORD *)(a1 + 40), 0);
}

- (void)__coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 purposeID:(id)a7 byAccessor:(id)a8
{
  unint64_t v15;
  id accessArbiter;
  NSFileWritingWritingClaim *v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  NSFileWritingWritingClaim *v22;
  NSObject *v23;
  uint64_t v24;
  id purposeID;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  NSAutoreleasePool *v32;
  _QWORD v33[6];
  _QWORD v34[11];
  uint8_t buf[4];
  unint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, id, _QWORD, void *))a8 + 2))(a8, a3, a5, 0, &__block_literal_global_215);
  }
  else
  {
    v31 = a4;
    v15 = a6;
    accessArbiter = self->_accessArbiter;
    v32 = objc_alloc_init(NSAutoreleasePool);
    v17 = [NSFileWritingWritingClaim alloc];
    v18 = +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3);
    v19 = +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a5);
    v20 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_2;
    v34[3] = &unk_1E0F52B00;
    v34[4] = self;
    v34[5] = a3;
    v34[6] = a5;
    v34[7] = accessArbiter;
    v21 = v15;
    v34[9] = v31;
    v34[10] = v15;
    v34[8] = a8;
    v22 = -[NSFileWritingWritingClaim initWithPurposeID:url:options:url:options:claimer:](v17, "initWithPurposeID:url:options:url:options:claimer:", a7, v18, v31, v19, v15, v34);
    if (__NSFCShouldLog(1))
    {
      if (qword_1ECD0A798 != -1)
        dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
      v23 = qword_1ECD0A700;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v20;
        purposeID = self->_purposeID;
        v26 = -[NSFileAccessClaim claimID](v22, "claimID");
        *(_DWORD *)buf = 134218755;
        v36 = v31;
        v37 = 2113;
        v38 = a3;
        v39 = 2114;
        v40 = purposeID;
        v20 = v24;
        v41 = 2114;
        v42 = v26;
        _os_log_impl(&dword_1817D9000, v23, OS_LOG_TYPE_DEFAULT, "Write (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
        if (qword_1ECD0A798 != -1)
          dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
      }
      v27 = qword_1ECD0A700;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
      {
        v28 = v20;
        v29 = self->_purposeID;
        v30 = -[NSFileAccessClaim claimID](v22, "claimID");
        *(_DWORD *)buf = 134218755;
        v36 = v21;
        v37 = 2113;
        v38 = a5;
        v39 = 2114;
        v40 = v29;
        v20 = v28;
        v41 = 2114;
        v42 = v30;
        _os_log_impl(&dword_1817D9000, v27, OS_LOG_TYPE_DEFAULT, "Write (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
      }
    }
    v33[0] = v20;
    v33[1] = 3221225472;
    v33[2] = __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_216;
    v33[3] = &unk_1E0F4C650;
    v33[4] = self;
    v33[5] = v22;
    -[NSFileCoordinator _requestAccessClaim:withProcedure:](self, "_requestAccessClaim:withProcedure:", v22, v33);

    -[NSAutoreleasePool drain](v32, "drain");
  }
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[9];
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  if (!a3)
  {
    a3 = *(_QWORD *)(a1 + 40);
    if (a4)
      goto LABEL_3;
LABEL_5:
    a4 = *(_QWORD *)(a1 + 48);
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v10 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_3;
  v14[3] = &unk_1E0F52AD8;
  v14[4] = v10;
  v14[5] = a3;
  v15 = *(_OWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v14[7] = a5;
  v14[8] = v12;
  v14[6] = a4;
  return objc_msgSend(v10, "_withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:", v11, v14, 0, a2);
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[7];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)a1[4];
  v12[0] = +[NSFileAccessIntent writingIntentWithURL:options:](NSFileAccessIntent, "writingIntentWithURL:options:", a1[5], a1[9]);
  v12[1] = +[NSFileAccessIntent writingIntentWithURL:options:](NSFileAccessIntent, "writingIntentWithURL:options:", a1[6], a1[10]);
  v5 = objc_msgSend(v4, "_willStartWriteWithIntents:async:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2), 1);
  v6 = a1[7];
  v7 = a1[8];
  v8 = a1[5];
  v9 = a1[6];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_4;
  v11[3] = &unk_1E0F4DF70;
  v11[5] = v5;
  v11[6] = a2;
  v11[4] = a1[4];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))(v7 + 16))(v7, v8, v9, v6, v11);
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_didEndWrite:", *(_QWORD *)(a1 + 40));
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_216(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "grantAccessClaim:synchronouslyIfPossible:", *(_QWORD *)(a1 + 40), 0);
}

- (void)__prepareForReadingItemsAtURLs:(id)a3 options:(unint64_t)a4 writingItemsAtURLs:(id)a5 options:(unint64_t)a6 byAccessor:(id)a7
{
  qos_class_t v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  NSXPCListener *v17;
  NSFileAccessSubarbiter *v18;
  NSFileSubarbitrationClaim *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  NSObject *v28;
  uint64_t *v29;
  uint64_t *v30;
  id v31;
  id purposeID;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  NSAutoreleasePool *v42;
  id v43;
  NSXPCListener *v44;
  unint64_t v45;
  id obj;
  NSFileSubarbitrationClaim *v47;
  NSFileCoordinator *v48;
  _QWORD v49[7];
  _QWORD v50[9];
  _BYTE v51[128];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  unint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  id v61;
  __int16 v62;
  uint64_t v63;
  _BYTE v64[128];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, _QWORD, void *))a7 + 2))(a7, self->_accessArbiter, 0, &__block_literal_global_217_0);
  }
  else
  {
    v13 = qos_class_main();
    v14 = dispatch_queue_attr_make_with_qos_class(0, v13, 0);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_create("com.apple.FileCoordination.subarbitration", v15);
    v17 = +[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener");
    v18 = -[NSFileAccessSubarbiter initWithQueue:listener:]([NSFileAccessSubarbiter alloc], "initWithQueue:listener:", v16, v17);
    -[NSXPCListener setDelegate:](v17, "setDelegate:", v18);
    -[NSXPCListener _setQueue:](v17, "_setQueue:", v16);
    -[NSXPCListener resume](v17, "resume");
    v42 = objc_alloc_init(NSAutoreleasePool);
    v19 = [NSFileSubarbitrationClaim alloc];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_2;
    v50[3] = &unk_1E0F52B70;
    v50[7] = v16;
    v50[8] = a7;
    v48 = self;
    v50[4] = self;
    v50[5] = v18;
    v44 = v17;
    v50[6] = v17;
    obj = a5;
    v47 = -[NSFileSubarbitrationClaim initWithReadingURLs:options:writingURLs:options:claimer:](v19, "initWithReadingURLs:options:writingURLs:options:claimer:", a3, a4, a5, a6, v50);
    if (__NSFCShouldLog(1))
    {
      v20 = a3;
      v45 = a4;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v21 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v65, v64, 16);
      v22 = &_MergedGlobals_114;
      v23 = &_MergedGlobals_114;
      if (v21)
      {
        v24 = v21;
        v25 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v66 != v25)
              objc_enumerationMutation(v20);
            v27 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
            if (v22[243] != -1)
              dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
            v28 = v23[224];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = v23;
              v30 = v22;
              v31 = v20;
              purposeID = v48->_purposeID;
              v33 = -[NSFileAccessClaim claimID](v47, "claimID");
              *(_DWORD *)buf = 134218755;
              v57 = v45;
              v58 = 2113;
              v59 = v27;
              v60 = 2114;
              v61 = purposeID;
              v20 = v31;
              v22 = v30;
              v23 = v29;
              v62 = 2114;
              v63 = v33;
              _os_log_impl(&dword_1817D9000, v28, OS_LOG_TYPE_DEFAULT, "Read (Subarbitration) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
            }
          }
          v24 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v65, v64, 16);
        }
        while (v24);
      }
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v51, 16, v42);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v53 != v36)
              objc_enumerationMutation(obj);
            v38 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
            if (v22[243] != -1)
              dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
            v39 = v23[224];
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              v40 = v48->_purposeID;
              v41 = -[NSFileAccessClaim claimID](v47, "claimID");
              *(_DWORD *)buf = 134218755;
              v57 = a6;
              v58 = 2113;
              v59 = v38;
              v60 = 2114;
              v61 = v40;
              v62 = 2114;
              v63 = v41;
              _os_log_impl(&dword_1817D9000, v39, OS_LOG_TYPE_DEFAULT, "Write (Subarbitration) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
            }
          }
          v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
        }
        while (v35);
      }
    }
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_223;
    v49[3] = &unk_1E0F51588;
    v49[4] = v48;
    v49[5] = v47;
    v49[6] = v44;
    -[NSFileCoordinator _requestAccessClaim:withProcedure:](v48, "_requestAccessClaim:withProcedure:", v47, v49, v42);

    objc_msgSend(v43, "drain");
  }
}

uint64_t __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a2, "claimID");
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", v5);
  do
    v10 = __ldaxr(&_NSFCSubarbitrationCount);
  while (__stlxr(v10 + 1, &_NSFCSubarbitrationCount));
  if (!v10)
    atomic_store(objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSFileCoordinationDisableLogSuppression")), _NSFCDisableLogSuppression);
  v11 = *(_QWORD *)(a1 + 64);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_3;
  v14[3] = &unk_1E0F52B48;
  v12 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = v12;
  v17 = v5;
  v18 = *(_OWORD *)(a1 + 48);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, v15, a3, v14, v6, v7, v8, v9);
}

uint64_t __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSAutoreleasePool *v6;
  uint8_t v8[8];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  do
  {
    v2 = __ldaxr(&_NSFCSubarbitrationCount);
    v3 = v2 - 1;
  }
  while (__stlxr(v3, &_NSFCSubarbitrationCount));
  if (!v3)
  {
    do
      v4 = __ldaxr(&_NSFCSubarbitratedClaimCount);
    while (__stlxr(0, &_NSFCSubarbitratedClaimCount));
    if (v4 >= 101)
    {
      if (qword_1ECD0A798 != -1)
        dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
      v5 = qword_1ECD0A700;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A700, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1817D9000, v5, OS_LOG_TYPE_DEFAULT, "Resuming normal logging", v8, 2u);
      }
    }
  }
  v6 = objc_alloc_init(NSAutoreleasePool);
  objc_msgSend(*(id *)(a1 + 32), "stopArbitrating");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "revokeSubarbitrationClaimForID:", *(_QWORD *)(a1 + 48));

  dispatch_release(*(dispatch_object_t *)(a1 + 64));
  return -[NSAutoreleasePool drain](v6, "drain");
}

uint64_t __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_223(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "grantSubarbitrationClaim:withServer:", a1[5], a1[6]);
}

+ (void)__itemAtURL:(id)a3 didMoveToURL:(id)a4 purposeID:(id)a5
{
  void *v9;

  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v9 = (void *)MEMORY[0x186DA8F78]();
    -[NSFileAccessArbiterProxy writerWithPurposeID:didMoveItemAtURL:toURL:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didMoveItemAtURL:toURL:", a5, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", objc_msgSend(a1, "_canonicalURLForURL:", a3)), +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", objc_msgSend(a1, "_canonicalURLForURL:", a4)));
    objc_autoreleasePoolPop(v9);
  }
}

+ (void)__itemAtURL:(id)a3 didDisconnectWithPurposeID:(id)a4
{
  NSAutoreleasePool *v7;

  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v7 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didDisconnectItemAtURL:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didDisconnectItemAtURL:", a4, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", objc_msgSend(a1, "_canonicalURLForURL:", a3)));
    -[NSAutoreleasePool drain](v7, "drain");
  }
}

+ (void)__itemAtURL:(id)a3 didReconnectWithPurposeID:(id)a4
{
  NSAutoreleasePool *v7;

  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v7 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didReconnectItemAtURL:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didReconnectItemAtURL:", a4, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", objc_msgSend(a1, "_canonicalURLForURL:", a3)));
    -[NSAutoreleasePool drain](v7, "drain");
  }
}

+ (void)__itemAtURL:(id)a3 didChangeUbiquityWithPurposeID:(id)a4
{
  NSAutoreleasePool *v7;

  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v7 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didChangeUbiquityOfItemAtURL:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didChangeUbiquityOfItemAtURL:", a4, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", objc_msgSend(a1, "_canonicalURLForURL:", a3)));
    -[NSAutoreleasePool drain](v7, "drain");
  }
}

+ (void)__itemAtURL:(id)a3 didDisappearWithPurposeID:(id)a4
{
  NSAutoreleasePool *v7;

  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v7 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didMakeItemDisappearAtURL:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didMakeItemDisappearAtURL:", a4, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", objc_msgSend(a1, "_canonicalURLForURL:", a3)));
    -[NSAutoreleasePool drain](v7, "drain");
  }
}

+ (void)__itemAtURL:(id)a3 didChangeWithPurposeID:(id)a4
{
  NSAutoreleasePool *v7;

  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v7 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didChangeItemAtURL:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didChangeItemAtURL:", a4, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", objc_msgSend(a1, "_canonicalURLForURL:", a3)));
    -[NSAutoreleasePool drain](v7, "drain");
  }
}

+ (void)__itemAtURL:(id)a3 didGainVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6
{
  NSAutoreleasePool *v11;

  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v11 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:", a6, CFSTR("added"), +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", objc_msgSend(a1, "_canonicalURLForURL:", a3)), a4, a5);
    -[NSAutoreleasePool drain](v11, "drain");
  }
}

+ (void)__itemAtURL:(id)a3 didLoseVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6
{
  NSAutoreleasePool *v11;

  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v11 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:", a6, CFSTR("removed"), +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", objc_msgSend(a1, "_canonicalURLForURL:", a3)), a4, a5);
    -[NSAutoreleasePool drain](v11, "drain");
  }
}

+ (void)__itemAtURL:(id)a3 didResolveConflictVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6
{
  NSAutoreleasePool *v11;

  if (!+[NSFileCoordinator _skipCoordinationWork](NSFileCoordinator, "_skipCoordinationWork"))
  {
    v11 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:", a6, CFSTR("resolved"), +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", objc_msgSend(a1, "_canonicalURLForURL:", a3)), a4, a5);
    -[NSAutoreleasePool drain](v11, "drain");
  }
}

+ (void)_addFileProvider:(id)a3
{
  objc_msgSend(a1, "_addFileProvider:completionHandler:", a3, &__block_literal_global_230);
}

+ (void)_addFileProvider:(id)a3 completionHandler:(id)a4
{
  -[NSFileAccessArbiterProxy addFileProvider:completionHandler:](NSFileCoordinatorSharedAccessArbiter(), "addFileProvider:completionHandler:", a3, a4);
}

+ (void)_removeFileProvider:(id)a3
{
  -[NSFileAccessArbiterProxy removeFileProvider:](NSFileCoordinatorSharedAccessArbiter(), "removeFileProvider:", a3);
}

+ (id)_fileProviders
{
  return -[NSFileAccessArbiterProxy fileProviders](NSFileCoordinatorSharedAccessArbiter(), "fileProviders");
}

+ (void)_setAutomaticFileProviderReregistrationDisabled:(BOOL)a3
{
  -[NSFileAccessArbiterProxy setAutomaticFileProviderReregistrationDisabled:](NSFileCoordinatorSharedAccessArbiter(), "setAutomaticFileProviderReregistrationDisabled:", a3);
}

- (void)_setFileProvider:(id)a3
{
  id fileReactor;
  id v6;
  uint64_t v7;

  fileReactor = self->_fileReactor;
  if (fileReactor != a3)
  {

    v6 = a3;
    self->_fileReactor = v6;
    v7 = objc_msgSend(self->_accessArbiter, "idForFileReactor:", v6);
    if (v7)
      -[NSFileCoordinator setPurposeIdentifier:](self, "setPurposeIdentifier:", v7);
  }
}

+ (BOOL)_itemHasPresentersAtURL:(id)a3
{
  return -[NSFileAccessArbiterProxy itemHasPresentersAtURL:](NSFileCoordinatorSharedAccessArbiter(), "itemHasPresentersAtURL:", a3);
}

- (BOOL)_purposeIdentifierLockedDown
{
  return objc_getAssociatedObject(self, sel__purposeIdentifierLockedDown) == (id)1;
}

- (void)_setPurposeIdentifier:(id)a3
{
  id purposeID;

  purposeID = self->_purposeID;
  if (purposeID != a3)
  {

    self->_purposeID = (id)objc_msgSend(a3, "copy");
    -[NSFileCoordinator _lockdownPurposeIdentifier](self, "_lockdownPurposeIdentifier");
  }
}

- (id)retainAccess
{
  void *v2;
  uint64_t TSD;
  uint64_t v4;

  v2 = *(void **)(NSFileCoordinatorGetTSD() + 8);
  TSD = NSFileCoordinatorGetTSD();
  v4 = *(_QWORD *)(TSD + 16);
  if (v2)
  {
    if (v4)
      __assert_rtn("-[NSFileCoordinator(NSPrivate) retainAccess]", "NSFileCoordinator.m", 1893, "NSFileCoordinatorGetTSD()->reacquisitionBlockCompletion == NULL");
    goto LABEL_5;
  }
  v2 = *(void **)(TSD + 16);
  if (v4)
LABEL_5:
    objc_msgSend(v2, "increment");
  return v2;
}

- (void)releaseAccess:(id)a3
{
  objc_msgSend(a3, "decrement");
}

+ (id)_currentFileCoordinator
{
  return *(id *)NSFileCoordinatorGetTSD();
}

+ (id)_currentClaimPurposeIdentifier
{
  return *(id *)(NSFileCoordinatorGetTSD() + 40);
}

+ (void)_getDebugInfoWithCompletionHandler:(id)a3
{
  if (qword_1ECD0A740)
    objc_msgSend((id)qword_1ECD0A740, "getDebugInformationIncludingEverything:withString:fromPid:thenContinue:", 1, +[NSFileAccessArbiterProxy _fileReactorDebuggingInformation](NSFileAccessArbiterProxy, "_fileReactorDebuggingInformation"), getpid(), a3);
  else
    -[NSFileAccessArbiterProxy getDebugInfoWithCompletionHandler:](NSFileCoordinatorSharedAccessArbiter(), "getDebugInfoWithCompletionHandler:", a3);
}

+ (void)_startInProcessFileCoordinationAndProgressServers
{
  qos_class_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSFileAccessArbiter *v8;
  NSProgressRegistrar *v9;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileCoordinator.m"), 2010, CFSTR("%@ must be invoked on main thread."), NSStringFromSelector(a2));
  _NSFCIP = 1;
  v4 = qos_class_main();
  v5 = dispatch_queue_attr_make_with_qos_class(0, v4, 0);
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(v5, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = dispatch_queue_create("com.apple.FileCoordination.inProcessServerQueue", v6);
  if (!qword_1ECD0A740)
  {
    qword_1ECD0A768 = +[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener");
    v8 = [NSFileAccessArbiter alloc];
    qword_1ECD0A740 = -[NSFileAccessArbiter initWithQueue:isSubarbiter:listener:](v8, "initWithQueue:isSubarbiter:listener:", v7, 0, qword_1ECD0A768);
    objc_msgSend((id)qword_1ECD0A768, "setDelegate:", qword_1ECD0A740);
    objc_msgSend((id)qword_1ECD0A768, "resume");
  }
  if (!qword_1ECD0A770)
  {
    qword_1ECD0A778 = +[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener");
    v9 = [NSProgressRegistrar alloc];
    qword_1ECD0A770 = -[NSProgressRegistrar initWithQueue:rootFileAccessNode:](v9, "initWithQueue:rootFileAccessNode:", v7, objc_msgSend((id)qword_1ECD0A740, "rootNode"));
    objc_msgSend((id)qword_1ECD0A778, "setDelegate:", qword_1ECD0A770);
    objc_msgSend((id)qword_1ECD0A778, "resume");
  }
  dispatch_release(v7);
  NSFileCoordinatorSharedAccessArbiter();
}

+ (id)_inProcessFileAccessArbiter
{
  return (id)qword_1ECD0A740;
}

+ (void)_stopInProcessFileCoordinationAndProgressServers
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileCoordinator.m"), 2047, CFSTR("%@ must be invoked on main thread."), NSStringFromSelector(a2));
  _NSFCIP = 0;

  qword_1ECD0A780 = 0;
  objc_msgSend((id)qword_1ECD0A740, "stopArbitrating");

  qword_1ECD0A740 = 0;
  objc_msgSend((id)qword_1ECD0A768, "invalidate");

  qword_1ECD0A768 = 0;
  qword_1ECD0A770 = 0;
  objc_msgSend((id)qword_1ECD0A778, "invalidate");

  qword_1ECD0A778 = 0;
}

+ (void)_adoptFCDEndpointForTest:(id)a3
{
  qos_class_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSXPCConnection *v9;

  v5 = qos_class_main();
  v6 = dispatch_queue_attr_make_with_qos_class(0, v5, 0);
  v7 = dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = dispatch_queue_create("com.apple.FileCoordination.test-connectionToInProcessServerQueue", v7);
  v9 = -[NSXPCConnection initWithListenerEndpoint:]([NSXPCConnection alloc], "initWithListenerEndpoint:", a3);
  -[NSXPCConnection setRemoteObjectInterface:](v9, "setRemoteObjectInterface:", objc_msgSend(a1, "_fileAccessArbiterInterface"));
  -[NSXPCConnection _setQueue:](v9, "_setQueue:", v8);
  qword_1ECD0A780 = -[NSFileAccessArbiterProxy initWithServer:queue:]([NSFileAccessArbiterProxy alloc], "initWithServer:queue:", v9, v8);
  -[NSXPCConnection resume](v9, "resume");

  dispatch_release(v8);
}

+ (id)_endpointForInProcessFileCoordinationServer
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    __assert_rtn("+[NSFileCoordinator(NSInternal) _endpointForInProcessFileCoordinationServer]", "NSFileCoordinator.m", 2108, "[NSThread isMainThread]");
  if (!qword_1ECD0A768)
    __assert_rtn("+[NSFileCoordinator(NSInternal) _endpointForInProcessFileCoordinationServer]", "NSFileCoordinator.m", 2109, "inProcessFileAccessArbiterListener");
  return (id)objc_msgSend((id)qword_1ECD0A768, "endpoint");
}

+ (void)_performBarrier
{
  -[NSFileAccessArbiterProxy performBarrier](NSFileCoordinatorSharedAccessArbiter(), "performBarrier");
}

+ (void)_performBarrierAsync:(id)a3
{
  -[NSFileAccessArbiterProxy performBarrierAsync:](NSFileCoordinatorSharedAccessArbiter(), "performBarrierAsync:", a3);
}

+ (void)_accessPresenterInfoUsingBlock:(id)a3
{
  if (qword_1ECD0A790 != -1)
    dispatch_once(&qword_1ECD0A790, &__block_literal_global_436);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD0A6F0);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, qword_1ECD0A788);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD0A6F0);
}

uint64_t __85__NSFileCoordinator_NSFileProviderInternalAdditions___accessPresenterInfoUsingBlock___block_invoke()
{
  uint64_t result;

  result = objc_opt_new();
  qword_1ECD0A788 = result;
  return result;
}

+ (void)_addProcessIdentifier:(int)a3 observedUbiquityAttributes:(id)a4 forID:(id)a5
{
  _QWORD v5[6];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 >= 1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __109__NSFileCoordinator_NSFileProviderInternalAdditions___addProcessIdentifier_observedUbiquityAttributes_forID___block_invoke;
    v5[3] = &unk_1E0F52BD8;
    v6 = a3;
    v5[4] = a5;
    v5[5] = a4;
    objc_msgSend(a1, "_accessPresenterInfoUsingBlock:", v5);
  }
}

uint64_t __109__NSFileCoordinator_NSFileProviderInternalAdditions___addProcessIdentifier_observedUbiquityAttributes_forID___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;

  v4 = (void *)objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  if (!v4)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(a2, "setObject:forKey:", v4, *(_QWORD *)(a1 + 32));

  }
  result = objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)), CFSTR("pid"));
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    return objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("ubiquityAttributes"));
  return result;
}

+ (void)_removeInfoForID:(id)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__NSFileCoordinator_NSFileProviderInternalAdditions___removeInfoForID___block_invoke;
  v3[3] = &unk_1E0F52C00;
  v3[4] = a3;
  objc_msgSend(a1, "_accessPresenterInfoUsingBlock:", v3);
}

uint64_t __71__NSFileCoordinator_NSFileProviderInternalAdditions___removeInfoForID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

+ (void)_setReadingOptions:(unint64_t)a3
{
  *(_QWORD *)(NSFileCoordinatorGetTSD() + 24) = a3 & 0x7FFFFFFF;
}

+ (void)_setKernelMaterializationInfo:(id)a3
{
  id v4;

  if (*(id *)(NSFileCoordinatorGetTSD() + 48) != a3)
  {

    v4 = a3;
    *(_QWORD *)(NSFileCoordinatorGetTSD() + 48) = v4;
  }
}

+ (void)_setCurrentClaimPurposeIdentifier:(id)a3
{
  uint64_t TSD;
  id v5;
  uint64_t v6;

  TSD = NSFileCoordinatorGetTSD();
  v5 = *(id *)(TSD + 40);
  if (v5 != a3)
  {
    v6 = TSD;

    *(_QWORD *)(v6 + 40) = objc_msgSend(a3, "copy");
  }
}

+ (unint64_t)_providedItemGenerationCount
{
  return *(_QWORD *)(NSFileCoordinatorGetTSD() + 56);
}

+ (int)_processIdentifierForID:(id)a3
{
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__NSFileCoordinator_NSFileProviderPrivateAdditions___processIdentifierForID___block_invoke;
  v5[3] = &unk_1E0F51030;
  v5[4] = a3;
  v5[5] = &v6;
  objc_msgSend(a1, "_accessPresenterInfoUsingBlock:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__77__NSFileCoordinator_NSFileProviderPrivateAdditions___processIdentifierForID___block_invoke(uint64_t a1, void *a2)
{
  void *result;

  result = (void *)objc_msgSend((id)objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32)), "objectForKey:", CFSTR("pid"));
  if (result)
  {
    result = (void *)objc_msgSend(result, "intValue");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result;
  }
  return result;
}

+ (id)_observedUbiquityAttributesForPresenterWithID:(id)a3
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __99__NSFileCoordinator_NSFileProviderPrivateAdditions___observedUbiquityAttributesForPresenterWithID___block_invoke;
  v5[3] = &unk_1E0F52C28;
  v5[4] = a3;
  v5[5] = &v6;
  objc_msgSend(a1, "_accessPresenterInfoUsingBlock:", v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __99__NSFileCoordinator_NSFileProviderPrivateAdditions___observedUbiquityAttributesForPresenterWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32)), "objectForKey:", CFSTR("ubiquityAttributes"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (BOOL)_provideRecursively
{
  return (*(unsigned __int8 *)(NSFileCoordinatorGetTSD() + 26) >> 1) & 1;
}

+ (unint64_t)_readingOptions
{
  return *(_QWORD *)(NSFileCoordinatorGetTSD() + 24);
}

+ (unsigned)_kernelMaterializationOperation
{
  if (*(_QWORD *)(NSFileCoordinatorGetTSD() + 48))
    return objc_msgSend(*(id *)(NSFileCoordinatorGetTSD() + 48), "operation");
  else
    return 0;
}

+ (void)_setProvidedItemRecursiveGenerationCount:(unint64_t)a3
{
  *(_QWORD *)(NSFileCoordinatorGetTSD() + 56) = a3;
}

+ (id)_kernelMaterializationInfo
{
  return *(id *)(NSFileCoordinatorGetTSD() + 48);
}

@end
