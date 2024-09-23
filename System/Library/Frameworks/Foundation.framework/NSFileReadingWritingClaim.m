@implementation NSFileReadingWritingClaim

- (NSFileReadingWritingClaim)initWithCoder:(id)a3
{
  NSFileReadingWritingClaim *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSFileReadingWritingClaim;
  v4 = -[NSFileAccessClaim initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileAccessClaims should only ever be decoded by XPC"), 0));
    }
    v4->_readingURL = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSReadingURLPairKey")), "URL");
    v4->_readingOptions = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSReadingOptionsKey")), "unsignedIntegerValue");
    v4->_writingURL = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSWritingURLPairKey")), "URL");
    v4->_writingOptions = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSWritingOptionsKey")), "unsignedIntegerValue");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileAccessClaims should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_readingURL), CFSTR("NSReadingURLPairKey"));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_readingOptions), CFSTR("NSReadingOptionsKey"));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_writingURL), CFSTR("NSWritingURLPairKey"));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_writingOptions), CFSTR("NSWritingOptionsKey"));
  v5.receiver = self;
  v5.super_class = (Class)NSFileReadingWritingClaim;
  -[NSFileAccessClaim encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)protectFilesAgainstEviction
{
  -[NSFileAccessClaim _protectIfNecessaryFileAtURL:withOptions:forReading:](self, "_protectIfNecessaryFileAtURL:withOptions:forReading:", self->_readingURL, self->_readingOptions, 1);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileReadingWritingClaim;
  -[NSFileAccessClaim dealloc](&v3, sel_dealloc);
}

uint64_t __36__NSFileReadingWritingClaim_granted__block_invoke_6(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "itemProvider"), "observeEndOfWriteAtLocation:forAccessClaim:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264));
}

- (void)devalueSelf
{
  NSFileAccessNode *readingLocation;
  uint64_t v4;
  NSFileAccessNode *writingLocation;
  objc_super v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  readingLocation = self->_readingLocation;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__NSFileReadingWritingClaim_devalueSelf__block_invoke;
  v8[3] = &unk_1E0F534D8;
  v8[4] = self;
  -[NSFileAccessNode forEachRelevantAccessClaimPerformProcedure:](readingLocation, "forEachRelevantAccessClaimPerformProcedure:", v8);
  writingLocation = self->_writingLocation;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __40__NSFileReadingWritingClaim_devalueSelf__block_invoke_2;
  v7[3] = &unk_1E0F534D8;
  v7[4] = self;
  -[NSFileAccessNode forEachRelevantAccessClaimPerformProcedure:](writingLocation, "forEachRelevantAccessClaimPerformProcedure:", v7);
  -[NSFileAccessNode removeAccessClaim:](self->_readingLocation, "removeAccessClaim:", self);
  self->_readingLocation = 0;
  -[NSFileAccessNode removeAccessClaim:](self->_writingLocation, "removeAccessClaim:", self);
  self->_writingLocation = 0;
  v6.receiver = self;
  v6.super_class = (Class)NSFileReadingWritingClaim;
  -[NSFileAccessClaim devalueSelf](&v6, sel_devalueSelf);
}

- (id)allURLs
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = v3;
  if (self->_readingURL)
    objc_msgSend(v3, "addObject:");
  if (self->_writingURL)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  _BOOL4 v4;
  NSFileAccessNode *v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  NSFileAccessNode *v11;
  NSFileAccessNode *readingLocation;
  uint64_t v13;
  NSFileAccessNode *writingLocation;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  NSFileAccessNode *v19;
  _QWORD v20[2];

  v4 = a4;
  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = (NSFileAccessNode *)objc_msgSend(a3, "descendantForFileURL:", self->_readingURL);
  v8 = objc_msgSend(a3, "descendantForFileURL:", self->_writingURL);
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
    return 1;
  v11 = (NSFileAccessNode *)v8;
  v18 = 0;
  if (!v4
    || -[NSFileAccessNode itemIsSubarbitrable](v7, "itemIsSubarbitrable")
    && -[NSFileAccessNode itemIsSubarbitrable](v11, "itemIsSubarbitrable"))
  {
    v20[0] = v7;
    if (-[NSFileAccessClaim canAccessLocations:forReading:error:](self, "canAccessLocations:forReading:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1), 1, &v18)&& (v19 = v11, -[NSFileAccessClaim canAccessLocations:forReading:error:](self, "canAccessLocations:forReading:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1), 0, &v18)))
    {
      self->_readingLocation = v7;
      -[NSFileAccessNode addAccessClaim:](v7, "addAccessClaim:", self);
      self->_writingLocation = v11;
      -[NSFileAccessNode addAccessClaim:](v11, "addAccessClaim:", self);
      if ((self->_readingOptions & 2) != 0)
        self->_rootNode = (NSFileAccessNode *)a3;
      readingLocation = self->_readingLocation;
      v13 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __76__NSFileReadingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
      v17[3] = &unk_1E0F534D8;
      v17[4] = self;
      -[NSFileAccessNode forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:](readingLocation, "forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:", self, v17);
      writingLocation = self->_writingLocation;
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __76__NSFileReadingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2;
      v16[3] = &unk_1E0F534D8;
      v16[4] = self;
      -[NSFileAccessNode forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:](writingLocation, "forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:", self, v16);
    }
    else
    {
      -[NSFileAccessClaim setClaimerError:](self, "setClaimerError:", v18);
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  -[NSFileAccessNode removeSelfIfUseless](v11, "removeSelfIfUseless");
  -[NSFileAccessNode removeSelfIfUseless](v7, "removeSelfIfUseless");
  return v10;
}

- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4
{
  NSObject *v7;
  _QWORD v8[5];
  _QWORD v9[6];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v11 = -[NSFileAccessClaim claimID](self, "claimID");
    _os_log_debug_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ blocked pending grantAccessClaim", buf, 0xCu);
  }
  -[NSFileAccessClaim block](self, "block");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__NSFileReadingWritingClaim_forwardUsingConnection_crashHandler___block_invoke;
  v9[3] = &unk_1E0F50DE0;
  v9[4] = self;
  v9[5] = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__NSFileReadingWritingClaim_forwardUsingConnection_crashHandler___block_invoke_354;
  v8[3] = &unk_1E0F534B0;
  v8[4] = self;
  objc_msgSend((id)objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v9), "grantAccessClaim:withReply:", self, v8);
}

uint64_t __76__NSFileReadingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "evaluateNewClaim:", *(_QWORD *)(a1 + 32));
}

uint64_t __76__NSFileReadingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "evaluateNewClaim:", *(_QWORD *)(a1 + 32));
}

uint64_t __40__NSFileReadingWritingClaim_devalueSelf__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "devalueOldClaim:", *(_QWORD *)(a1 + 32));
}

uint64_t __40__NSFileReadingWritingClaim_devalueSelf__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "devalueOldClaim:", *(_QWORD *)(a1 + 32));
}

void __36__NSFileReadingWritingClaim_granted__block_invoke(uint64_t a1, int a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[13];

  v7[12] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = *(_QWORD **)(a1 + 32);
    v5 = MEMORY[0x1E0C809B0];
    if (v4[33])
    {
      v7[6] = MEMORY[0x1E0C809B0];
      v7[7] = 3221225472;
      v7[8] = __36__NSFileReadingWritingClaim_granted__block_invoke_2;
      v7[9] = &unk_1E0F53618;
      v7[10] = v4;
      v7[11] = v3;
      objc_msgSend(v4, "makePresentersOfItemAtLocation:orContainedItem:relinquishUsingProcedureGetter:");
      v4 = *(_QWORD **)(a1 + 32);
    }
    v6 = v4[32];
    if (v6)
    {
      v7[0] = v5;
      v7[1] = 3221225472;
      v7[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_4;
      v7[3] = &unk_1E0F53618;
      v7[4] = v4;
      v7[5] = v3;
      objc_msgSend(v4, "makePresentersOfItemAtLocation:orContainedItem:relinquishUsingProcedureGetter:", v6, 0, v7);
    }

  }
}

- (void)granted
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSURL *readingURL;
  unsigned __int8 v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  NSFileAccessNode *writingLocation;
  NSFileAccessNode *readingLocation;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_readingLocation || self->_writingLocation)
  {
    v3 = atomic_load(&_NSFCSubarbitrationCount);
    if (v3 < 1
      || (v12 = atomic_load(_NSFCDisableLogSuppression), (v12 & 1) != 0)
      || (v13 = atomic_load(&_NSFCSubarbitratedClaimCount), v13 <= 99))
    {
      v4 = _NSFCClaimsLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in server", buf, 0xCu);
      }
    }
    if (self->_readingLocation)
    {
      readingLocation = self->_readingLocation;
      v5 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &readingLocation, 1);
    }
    else
    {
      v5 = 0;
    }
    if (self->_writingLocation)
    {
      writingLocation = self->_writingLocation;
      v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &writingLocation, 1);
    }
    else
    {
      v6 = 0;
    }
    v7 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __36__NSFileReadingWritingClaim_granted__block_invoke;
    v18[3] = &unk_1E0F4F260;
    v18[4] = self;
    -[NSFileAccessClaim makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:](self, "makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:", v5, &self->_readingOptions, v6, &self->_writingOptions, v18);
    if (self->_writingLocation
      && -[NSFileAccessClaim shouldInformProvidersAboutEndOfWriteWithOptions:](self, "shouldInformProvidersAboutEndOfWriteWithOptions:", self->_writingOptions))
    {
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_6;
      v17[3] = &unk_1E0F4D2D8;
      v17[4] = self;
      -[NSFileAccessClaim whenRevokedPerformProcedure:](self, "whenRevokedPerformProcedure:", v17);
    }
  }
  else if (self->super._client)
  {
    v8 = _NSFCClaimsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v22 = -[NSFileAccessClaim claimID](self, "claimID");
      _os_log_error_impl(&dword_1817D9000, v8, OS_LOG_TYPE_ERROR, "Claim %{public}@ can't be granted in daemon", buf, 0xCu);
    }
  }
  else
  {
    v9 = atomic_load(&_NSFCSubarbitrationCount);
    if (v9 < 1
      || (v14 = atomic_load(_NSFCDisableLogSuppression), (v14 & 1) != 0)
      || (v15 = atomic_load(&_NSFCSubarbitratedClaimCount), v15 <= 99))
    {
      v10 = _NSFCClaimsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_1817D9000, v10, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in client", buf, 0xCu);
      }
    }
    if ((self->_readingOptions & 8) != 0)
    {
      readingURL = self->_readingURL;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_355;
      v16[3] = &unk_1E0F4E368;
      v16[4] = self;
      -[NSFileAccessClaim prepareItemForUploadingFromURL:thenContinue:](self, "prepareItemForUploadingFromURL:thenContinue:", readingURL, v16);
    }
  }
  -[NSFileAccessClaim unblockClaimerForReason:](self, "unblockClaimerForReason:", CFSTR("Initial blockage"));
}

- (void)invokeClaimer
{
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__NSFileReadingWritingClaim_invokeClaimer__block_invoke;
  v2[3] = &unk_1E0F53668;
  v2[4] = self;
  -[NSFileReadingWritingClaim resolveURLsThenMaybeContinueInvokingClaimer:](self, "resolveURLsThenMaybeContinueInvokingClaimer:", v2);
}

- (void)resolveURLsThenMaybeContinueInvokingClaimer:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  if (-[NSFileAccessClaim didWait](self, "didWait"))
  {
    v5 = -[NSFileAccessNode standardizedURL](self->_readingLocation, "standardizedURL");
    if (v5)
    {
      v6 = v5;

      self->_readingURL = (NSURL *)objc_msgSend(v6, "copy");
      self->_readingURLDidChange = 1;
    }
    v7 = -[NSFileAccessNode standardizedURL](self->_writingLocation, "standardizedURL");
    if (v7)
    {
      v8 = v7;

      self->_writingURL = (NSURL *)objc_msgSend(v8, "copy");
      self->_writingURLDidChange = 1;
    }
  }
  if (-[NSFileAccessClaim claimerError](self, "claimerError"))
  {
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
  }
  else
  {
    v9[5] = a3;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke;
    v10[3] = &unk_1E0F53578;
    v10[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3;
    v9[3] = &unk_1E0F50148;
    v9[4] = self;
    __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke((uint64_t)v10, (uint64_t)v9);
  }
}

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v3 + 224) & 2) == 0)
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  v4 = *(_QWORD *)(v3 + 208);
  if (!v4)
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_2;
  v6[3] = &unk_1E0F53550;
  v6[4] = v3;
  result = objc_msgSend((id)v3, "checkIfSymbolicLinkAtURL:withResolutionCount:andIfSoThenReevaluateSelf:", v4, v3 + 280, v6);
  if ((result & 1) == 0)
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  return result;
}

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[32];
  v4 = objc_msgSend(v2, "purposeID");
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_4;
  v8[3] = &unk_1E0F535A0;
  v9 = v5;
  return objc_msgSend(v2, "makeProviderOfItemAtLocation:provideOrAttachPhysicalURLIfNecessaryForPurposeID:readingOptions:thenContinue:", v3, v4, v6, v8);
}

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_4(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  _QWORD v10[5];
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[33];
  v6 = objc_msgSend(v4, "purposeID");
  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_5;
  v10[3] = &unk_1E0F53640;
  v10[4] = a2;
  v11 = v7;
  return objc_msgSend(v4, "makeProviderOfItemAtLocation:provideOrAttachPhysicalURLIfNecessaryForPurposeID:writingOptions:thenContinue:", v5, v6, v8, v10);
}

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

id __42__NSFileReadingWritingClaim_invokeClaimer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSURLPromisePair *v13;
  NSURLPromisePair *v14;
  NSURLPromisePair *v15;
  NSURLPromisePair *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 v20;
  uint64_t v21;
  unsigned __int8 v22;
  uint64_t v23;
  objc_super v24;
  NSURLPromisePair *v25;
  NSURLPromisePair *v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD **)(a1 + 32);
  if (v6[20])
  {
    v7 = atomic_load(&_NSFCSubarbitrationCount);
    if (v7 < 1
      || (v20 = atomic_load(_NSFCDisableLogSuppression), (v20 & 1) != 0)
      || (v21 = atomic_load(&_NSFCSubarbitratedClaimCount), v21 <= 99))
    {
      v8 = _NSFCClaimsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_msgSend(*(id *)(a1 + 32), "claimID");
        *(_DWORD *)buf = 138543362;
        v28 = v9;
        _os_log_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in client", buf, 0xCu);
      }
    }
    (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160)
                                                                              + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), *(_QWORD *)(a1 + 32), a2, a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
    v6 = *(_QWORD **)(a1 + 32);
  }
  if (v6[21])
  {
    v10 = atomic_load(&_NSFCSubarbitrationCount);
    if (v10 < 1
      || (v22 = atomic_load(_NSFCDisableLogSuppression), (v22 & 1) != 0)
      || (v23 = atomic_load(&_NSFCSubarbitratedClaimCount), v23 <= 99))
    {
      v11 = _NSFCClaimsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(*(id *)(a1 + 32), "claimID");
        *(_DWORD *)buf = 138543362;
        v28 = v12;
        _os_log_impl(&dword_1817D9000, v11, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in server", buf, 0xCu);
      }
    }
    if (a2)
      v13 = +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", a2);
    else
      v13 = (NSURLPromisePair *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = v13;
    if (a3)
      v15 = +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", a3);
    else
      v15 = (NSURLPromisePair *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = v15;
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
    v26 = v14;
    v18 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v25 = v16;
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v17 + 16))(v17, v18, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), objc_msgSend(*(id *)(a1 + 32), "shouldEnableMaterializationDuringAccessorBlock"), objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
    v6 = *(_QWORD **)(a1 + 32);
  }
  v24.receiver = v6;
  v24.super_class = (Class)NSFileReadingWritingClaim;
  return objc_msgSendSuper2(&v24, sel_invokeClaimer);
}

- (NSFileReadingWritingClaim)initWithPurposeID:(id)a3 readingURL:(id)a4 options:(unint64_t)a5 writingURL:(id)a6 options:(unint64_t)a7 claimer:(id)a8
{
  NSFileReadingWritingClaim *v13;

  v13 = -[NSFileAccessClaim initWithClient:claimID:purposeID:](self, "initWithClient:claimID:purposeID:", 0, 0, a3);
  if (v13)
  {
    v13->_readingURL = (NSURL *)objc_msgSend(a4, "copy");
    v13->_readingOptions = ((_DWORD)a5 << 14) & 0x20000 | a5;
    v13->_writingURL = (NSURL *)objc_msgSend(a6, "copy");
    v13->_writingOptions = a7;
    v13->super._claimerOrNil = (id)objc_msgSend(a8, "copy");
  }
  return v13;
}

uint64_t __65__NSFileReadingWritingClaim_forwardUsingConnection_crashHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "claimID");
    v8 = 138543618;
    v9 = (const __CFString *)v7;
    v10 = 2114;
    v11 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim message failed: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  v5 = _NSFCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543618;
    v9 = CFSTR("grantAccessClaim");
    v10 = 2114;
    v11 = a2;
    _os_log_error_impl(&dword_1817D9000, v5, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", _NSErrorWithFilePath(256, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208)));
  return objc_msgSend(*(id *)(a1 + 32), "unblock");
}

uint64_t __65__NSFileReadingWritingClaim_forwardUsingConnection_crashHandler___block_invoke_354(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v12 = _NSFCClaimsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = objc_msgSend(*(id *)(a1 + 32), "claimID");
    v19 = 138543362;
    v20 = v14;
    _os_log_debug_impl(&dword_1817D9000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ received grantAccessClaim reply", (uint8_t *)&v19, 0xCu);
    if (a6)
      goto LABEL_3;
  }
  else if (a6)
  {
LABEL_3:
    v13 = _NSFCClaimsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(*(id *)(a1 + 32), "claimID");
      v19 = 138543618;
      v20 = v18;
      v21 = 2114;
      v22 = a6;
      _os_log_error_impl(&dword_1817D9000, v13, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim reply is an error: %{public}@", (uint8_t *)&v19, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", a6);
    return objc_msgSend(*(id *)(a1 + 32), "unblock");
  }
  v15 = (void *)objc_msgSend(a2, "firstObject");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = objc_msgSend((id)objc_msgSend(v15, "URL"), "copy");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 1;
  }
  v16 = (void *)objc_msgSend(a3, "firstObject");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = objc_msgSend((id)objc_msgSend(v16, "URL"), "copy");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 240) = 1;
  }
  if (a4)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = objc_msgSend(a4, "copy");
  }
  objc_msgSend(*(id *)(a1 + 32), "setShouldEnableMaterializationDuringAccessorBlock:", a5);
  return objc_msgSend(*(id *)(a1 + 32), "unblock");
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return objc_msgSend((id)objc_opt_class(), "canReadingItemAtLocation:options:safelyOverlapNewWriting:ofItemAtLocation:options:", a3, a4, 1, self->_writingLocation, self->_writingOptions) ^ 1;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  void *v7;

  v7 = (void *)objc_opt_class();
  if (objc_msgSend(v7, "canReadingItemAtLocation:options:safelyOverlapNewWriting:ofItemAtLocation:options:", self->_readingLocation, self->_readingOptions, 0, a3, a4))return objc_msgSend(v7, "canNewWriteOfItemAtLocation:options:safelyOverlapExistingWriteOfItemAtLocation:options:", self->_writingLocation, self->_writingOptions, a3, a4) ^ 1;
  else
    return 1;
}

id __36__NSFileReadingWritingClaim_granted__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldWritingWithOptions:causePresenterToRelinquish:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248), a2))return 0;
  objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "reactorID"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_3;
  v7[3] = &unk_1E0F535C8;
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = a2;
  v7[6] = a3;
  return (id)objc_msgSend(v7, "copy");
}

uint64_t __36__NSFileReadingWritingClaim_granted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "relinquishToWritingClaimWithID:options:purposeID:subitemPath:resultHandler:", objc_msgSend(*(id *)(a1 + 32), "claimID"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248), objc_msgSend(*(id *)(a1 + 32), "purposeIDOfClaimOnItemAtLocation:forMessagingPresenter:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264), *(_QWORD *)(a1 + 40)), *(_QWORD *)(a1 + 48), a2);
}

id __36__NSFileReadingWritingClaim_granted__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v5;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldReadingWithOptions:causePresenterToRelinquish:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224), a2)|| (objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(a2, "reactorID")) & 1) != 0)
  {
    return 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "reactorID"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_5;
  v6[3] = &unk_1E0F53500;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  return (id)objc_msgSend(v6, "copy");
}

uint64_t __36__NSFileReadingWritingClaim_granted__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "relinquishToReadingClaimWithID:options:purposeID:resultHandler:", objc_msgSend(*(id *)(a1 + 40), "claimID"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 224), objc_msgSend(*(id *)(a1 + 40), "purposeID"), a2);
}

_QWORD *__36__NSFileReadingWritingClaim_granted__block_invoke_355(_QWORD *result, void *a2, uint64_t a3)
{
  _QWORD *v3;
  void *v5;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v3 = result;
  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    *(_BYTE *)(result[4] + 216) = 1;
    v5 = *(void **)(result[4] + 208);
    if (v5 != a2)
    {

      result = a2;
      *(_QWORD *)(v3[4] + 208) = result;
    }
  }
  else
  {
    v7 = _NSFCClaimsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend((id)v3[4], "claimID");
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = a3;
      _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "Claim %{public}@ failed during preparing for uploading due to error: %@", (uint8_t *)&v9, 0x16u);
    }
    return (_QWORD *)objc_msgSend((id)v3[4], "setClaimerError:", a3);
  }
  return result;
}

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_2(uint64_t a1, void *a2)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = objc_msgSend(a2, "copy");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "evaluateSelfWithRootNode:checkSubarbitrability:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272), 0);
}

- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4
{
  if (self->_writingLocation == a3)
  {
    objc_msgSend(a4, "addAccessClaim:", self);
    objc_msgSend(a3, "removeAccessClaim:", self);
    self->_writingLocation = (NSFileAccessNode *)a4;
  }
  if (self->_readingLocation == a3)
  {
    objc_msgSend(a4, "addAccessClaim:", self);
    objc_msgSend(a3, "removeAccessClaim:", self);
    self->_readingLocation = (NSFileAccessNode *)a4;
  }
}

- (BOOL)blocksClaim:(id)a3
{
  if ((objc_msgSend(a3, "isBlockedByReadingItemAtLocation:options:", self->_readingLocation, self->_readingOptions) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a3, "isBlockedByWritingItemAtLocation:options:", self->_writingLocation, self->_writingOptions);
}

- (BOOL)shouldCancelInsteadOfWaiting
{
  return (BYTE2(self->_readingOptions) >> 3) & 1;
}

@end
