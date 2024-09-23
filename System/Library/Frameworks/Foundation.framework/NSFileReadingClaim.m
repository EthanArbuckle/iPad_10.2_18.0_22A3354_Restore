@implementation NSFileReadingClaim

- (NSFileReadingClaim)initWithCoder:(id)a3
{
  NSFileReadingClaim *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSFileReadingClaim;
  v4 = -[NSFileAccessClaim initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileAccessClaims should only ever be decoded by XPC"), 0));
    }
    v4->_url = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSURLPairKey")), "URL");
    v4->_options = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSURLOptionsKey")), "unsignedIntegerValue");
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)granted
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSURL *url;
  unsigned __int8 v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  NSFileAccessNode *location;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_location)
  {
    v3 = atomic_load(&_NSFCSubarbitrationCount);
    if (v3 < 1
      || (v10 = atomic_load(_NSFCDisableLogSuppression), (v10 & 1) != 0)
      || (v11 = atomic_load(&_NSFCSubarbitratedClaimCount), v11 <= 99))
    {
      v4 = _NSFCClaimsLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in server", buf, 0xCu);
      }
    }
    location = self->_location;
    v5 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &location, 1);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __29__NSFileReadingClaim_granted__block_invoke;
    v15[3] = &unk_1E0F4F260;
    v15[4] = self;
    -[NSFileAccessClaim makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:](self, "makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:", v5, &self->_options, 0, 0, v15);
  }
  else if (self->super._client)
  {
    v6 = _NSFCClaimsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = -[NSFileAccessClaim claimID](self, "claimID");
      _os_log_error_impl(&dword_1817D9000, v6, OS_LOG_TYPE_ERROR, "Claim %{public}@ can't be granted in daemon", buf, 0xCu);
    }
  }
  else
  {
    v7 = atomic_load(&_NSFCSubarbitrationCount);
    if (v7 < 1
      || (v12 = atomic_load(_NSFCDisableLogSuppression), (v12 & 1) != 0)
      || (v13 = atomic_load(&_NSFCSubarbitratedClaimCount), v13 <= 99))
    {
      v8 = _NSFCClaimsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in client", buf, 0xCu);
      }
    }
    if ((self->_options & 8) != 0)
    {
      url = self->_url;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __29__NSFileReadingClaim_granted__block_invoke_321;
      v14[3] = &unk_1E0F4E368;
      v14[4] = self;
      -[NSFileAccessClaim prepareItemForUploadingFromURL:thenContinue:](self, "prepareItemForUploadingFromURL:thenContinue:", url, v14);
    }
  }
  -[NSFileAccessClaim unblockClaimerForReason:](self, "unblockClaimerForReason:", CFSTR("Initial blockage"));
}

- (NSFileReadingClaim)initWithPurposeID:(id)a3 url:(id)a4 options:(unint64_t)a5 claimer:(id)a6
{
  NSFileReadingClaim *v9;

  v9 = -[NSFileAccessClaim initWithClient:claimID:purposeID:](self, "initWithClient:claimID:purposeID:", 0, 0, a3);
  if (v9)
  {
    v9->_url = (NSURL *)objc_msgSend(a4, "copy");
    v9->_options = ((_DWORD)a5 << 14) & 0x20000 | a5;
    v9->super._claimerOrNil = (id)objc_msgSend(a6, "copy");
  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileAccessClaims should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_url), CFSTR("NSURLPairKey"));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_options), CFSTR("NSURLOptionsKey"));
  v5.receiver = self;
  v5.super_class = (Class)NSFileReadingClaim;
  -[NSFileAccessClaim encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (void)invokeClaimer
{
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __35__NSFileReadingClaim_invokeClaimer__block_invoke;
  v2[3] = &unk_1E0F53550;
  v2[4] = self;
  -[NSFileReadingClaim resolveURLThenMaybeContinueInvokingClaimer:](self, "resolveURLThenMaybeContinueInvokingClaimer:", v2);
}

uint64_t __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_3(uint64_t a1)
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
  v3 = v2[29];
  v4 = objc_msgSend(v2, "purposeID");
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_4;
  v8[3] = &unk_1E0F535A0;
  v9 = v5;
  return objc_msgSend(v2, "makeProviderOfItemAtLocation:provideOrAttachPhysicalURLIfNecessaryForPurposeID:readingOptions:thenContinue:", v3, v4, v6, v8);
}

uint64_t __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __35__NSFileReadingClaim_invokeClaimer__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSURLPromisePair *v12;
  unsigned __int8 v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  objc_super v18;
  NSURLPromisePair *v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD **)(a1 + 32);
  if (v4[20])
  {
    v5 = atomic_load(&_NSFCSubarbitrationCount);
    if (v5 < 1
      || (v14 = atomic_load(_NSFCDisableLogSuppression), (v14 & 1) != 0)
      || (v15 = atomic_load(&_NSFCSubarbitratedClaimCount), v15 <= 99))
    {
      v6 = _NSFCClaimsLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend(*(id *)(a1 + 32), "claimID");
        *(_DWORD *)buf = 138543362;
        v21 = v7;
        _os_log_impl(&dword_1817D9000, v6, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in client", buf, 0xCu);
      }
    }
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
    v4 = *(_QWORD **)(a1 + 32);
  }
  if (v4[21])
  {
    v8 = atomic_load(&_NSFCSubarbitrationCount);
    if (v8 < 1
      || (v16 = atomic_load(_NSFCDisableLogSuppression), (v16 & 1) != 0)
      || (v17 = atomic_load(&_NSFCSubarbitratedClaimCount), v17 <= 99))
    {
      v9 = _NSFCClaimsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(*(id *)(a1 + 32), "claimID");
        *(_DWORD *)buf = 138543362;
        v21 = v10;
        _os_log_impl(&dword_1817D9000, v9, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in server", buf, 0xCu);
      }
    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
    v12 = +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", a2);
    if (!v12)
      v12 = (NSURLPromisePair *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = v12;
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v11 + 16))(v11, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), objc_msgSend(*(id *)(a1 + 32), "shouldEnableMaterializationDuringAccessorBlock"), objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
    v4 = *(_QWORD **)(a1 + 32);
  }
  v18.receiver = v4;
  v18.super_class = (Class)NSFileReadingClaim;
  return objc_msgSendSuper2(&v18, sel_invokeClaimer);
}

- (void)resolveURLThenMaybeContinueInvokingClaimer:(id)a3
{
  id v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  if (-[NSFileAccessClaim didWait](self, "didWait"))
  {
    v5 = -[NSFileAccessNode standardizedURL](self->_location, "standardizedURL");
    if (v5)
    {
      v6 = v5;

      self->_url = (NSURL *)objc_msgSend(v6, "copy");
      self->_urlDidChange = 1;
    }
  }
  if (-[NSFileAccessClaim claimerError](self, "claimerError"))
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
  else
  {
    v7[5] = a3;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke;
    v8[3] = &unk_1E0F53578;
    v8[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_3;
    v7[3] = &unk_1E0F50148;
    v7[4] = self;
    __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke((uint64_t)v8, (uint64_t)v7);
  }
}

uint64_t __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke(uint64_t a1, uint64_t a2)
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
  v6[2] = __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_2;
  v6[3] = &unk_1E0F53550;
  v6[4] = v3;
  result = objc_msgSend((id)v3, "checkIfSymbolicLinkAtURL:withResolutionCount:andIfSoThenReevaluateSelf:", v4, v3 + 248, v6);
  if ((result & 1) == 0)
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  return result;
}

- (BOOL)shouldBeRevokedPriorToInvokingAccessor
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (void)protectFilesAgainstEviction
{
  -[NSFileAccessClaim _protectIfNecessaryFileAtURL:withOptions:forReading:](self, "_protectIfNecessaryFileAtURL:withOptions:forReading:", self->_url, self->_options, 1);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileReadingClaim;
  -[NSFileAccessClaim dealloc](&v3, sel_dealloc);
}

- (id)allURLs
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_url, 0);
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  _BOOL4 v4;
  NSFileAccessNode *v7;
  NSFileAccessNode *v8;
  NSFileAccessNode *location;
  BOOL v10;
  _QWORD v12[5];
  uint64_t v13;
  _QWORD v14[2];

  v4 = a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = (NSFileAccessNode *)objc_msgSend(a3, "descendantForFileURL:", self->_url);
  if (!v7)
    return 1;
  v8 = v7;
  v13 = 0;
  if (v4 && !-[NSFileAccessNode itemIsSubarbitrable](v7, "itemIsSubarbitrable"))
  {
    v10 = 0;
  }
  else
  {
    v14[0] = v8;
    if (-[NSFileAccessClaim canAccessLocations:forReading:error:](self, "canAccessLocations:forReading:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1), 1, &v13))
    {
      self->_location = v8;
      -[NSFileAccessNode addAccessClaim:](v8, "addAccessClaim:", self);
      if ((self->_options & 2) != 0)
        self->_rootNode = (NSFileAccessNode *)a3;
      location = self->_location;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __69__NSFileReadingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
      v12[3] = &unk_1E0F534D8;
      v12[4] = self;
      -[NSFileAccessNode forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:](location, "forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:", self, v12);
    }
    else
    {
      -[NSFileAccessClaim setClaimerError:](self, "setClaimerError:", v13);
    }
    v10 = 1;
  }
  -[NSFileAccessNode removeSelfIfUseless](v8, "removeSelfIfUseless");
  return v10;
}

- (void)devalueSelf
{
  NSFileAccessNode *location;
  objc_super v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  location = self->_location;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__NSFileReadingClaim_devalueSelf__block_invoke;
  v5[3] = &unk_1E0F534D8;
  v5[4] = self;
  -[NSFileAccessNode forEachRelevantAccessClaimPerformProcedure:](location, "forEachRelevantAccessClaimPerformProcedure:", v5);
  -[NSFileAccessNode removeAccessClaim:](self->_location, "removeAccessClaim:", self);
  self->_location = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSFileReadingClaim;
  -[NSFileAccessClaim devalueSelf](&v4, sel_devalueSelf);
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
  v9[2] = __58__NSFileReadingClaim_forwardUsingConnection_crashHandler___block_invoke;
  v9[3] = &unk_1E0F50DE0;
  v9[4] = self;
  v9[5] = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__NSFileReadingClaim_forwardUsingConnection_crashHandler___block_invoke_317;
  v8[3] = &unk_1E0F534B0;
  v8[4] = self;
  objc_msgSend((id)objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v9), "grantAccessClaim:withReply:", self, v8);
}

uint64_t __69__NSFileReadingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "evaluateNewClaim:", *(_QWORD *)(a1 + 32));
}

uint64_t __33__NSFileReadingClaim_devalueSelf__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "devalueOldClaim:", *(_QWORD *)(a1 + 32));
}

uint64_t __29__NSFileReadingClaim_granted__block_invoke(uint64_t result, int a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v2 = *(_QWORD **)(result + 32);
    v3 = v2[29];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __29__NSFileReadingClaim_granted__block_invoke_2;
    v4[3] = &unk_1E0F53528;
    v4[4] = v2;
    return objc_msgSend(v2, "makePresentersOfItemAtLocation:orContainedItem:relinquishUsingProcedureGetter:", v3, 0, v4);
  }
  return result;
}

uint64_t __58__NSFileReadingClaim_forwardUsingConnection_crashHandler___block_invoke(uint64_t a1, uint64_t a2)
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
    v6 = objc_msgSend(*(id *)(a1 + 32), "claimID");
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim message failed: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", _NSErrorWithFilePath(256, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208)));
  return objc_msgSend(*(id *)(a1 + 32), "unblock");
}

uint64_t __58__NSFileReadingClaim_forwardUsingConnection_crashHandler___block_invoke_317(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = _NSFCClaimsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "claimID");
    v17 = 138543362;
    v18 = v13;
    _os_log_debug_impl(&dword_1817D9000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ received grantAccessClaim reply", (uint8_t *)&v17, 0xCu);
    if (a6)
      goto LABEL_3;
  }
  else if (a6)
  {
LABEL_3:
    v12 = _NSFCClaimsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(*(id *)(a1 + 32), "claimID");
      v17 = 138543618;
      v18 = v16;
      v19 = 2114;
      v20 = a6;
      _os_log_error_impl(&dword_1817D9000, v12, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim reply is an error: %{public}@", (uint8_t *)&v17, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", a6);
    return objc_msgSend(*(id *)(a1 + 32), "unblock");
  }
  v14 = (void *)objc_msgSend(a2, "firstObject");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = objc_msgSend((id)objc_msgSend(v14, "URL"), "copy");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 1;
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
  return 0;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return objc_msgSend((id)objc_opt_class(), "canReadingItemAtLocation:options:safelyOverlapNewWriting:ofItemAtLocation:options:", self->_location, self->_options, 0, a3, a4) ^ 1;
}

id __29__NSFileReadingClaim_granted__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldReadingWithOptions:causePresenterToRelinquish:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224), a2))return 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__NSFileReadingClaim_granted__block_invoke_3;
  v6[3] = &unk_1E0F53500;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v4;
  return (id)objc_msgSend(v6, "copy");
}

uint64_t __29__NSFileReadingClaim_granted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "relinquishToReadingClaimWithID:options:purposeID:resultHandler:", objc_msgSend(*(id *)(a1 + 40), "claimID"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 224), objc_msgSend(*(id *)(a1 + 40), "purposeID"), a2);
}

_QWORD *__29__NSFileReadingClaim_granted__block_invoke_321(_QWORD *result, void *a2, uint64_t a3)
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

uint64_t __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_2(uint64_t a1, void *a2)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = objc_msgSend(a2, "copy");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "evaluateSelfWithRootNode:checkSubarbitrability:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240), 0);
}

- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4
{
  if (self->_location == a3)
  {
    objc_msgSend(a4, "addAccessClaim:", self);
    objc_msgSend(a3, "removeAccessClaim:", self);
    self->_location = (NSFileAccessNode *)a4;
  }
}

- (BOOL)blocksClaim:(id)a3
{
  return objc_msgSend(a3, "isBlockedByReadingItemAtLocation:options:", self->_location, self->_options);
}

- (BOOL)shouldCancelInsteadOfWaiting
{
  return (BYTE2(self->_options) >> 3) & 1;
}

@end
