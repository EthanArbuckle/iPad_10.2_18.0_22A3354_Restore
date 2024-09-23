@implementation NSFileWritingWritingClaim

- (NSFileWritingWritingClaim)initWithPurposeID:(id)a3 url:(id)a4 options:(unint64_t)a5 url:(id)a6 options:(unint64_t)a7 claimer:(id)a8
{
  NSFileWritingWritingClaim *v13;

  v13 = -[NSFileAccessClaim initWithClient:claimID:purposeID:](self, "initWithClient:claimID:purposeID:", 0, 0, a3);
  if (v13)
  {
    v13->_url1 = (NSURL *)objc_msgSend(a4, "copy");
    v13->_options1 = a5;
    v13->_url2 = (NSURL *)objc_msgSend(a6, "copy");
    v13->_options2 = a7;
    v13->super._claimerOrNil = (id)objc_msgSend(a8, "copy");
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileWritingWritingClaim;
  -[NSFileAccessClaim dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileAccessClaims should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_url1), CFSTR("NSURLPair1Key"));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_options1), CFSTR("NSOptions1Key"));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_url2), CFSTR("NSURLPair2Key"));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_options2), CFSTR("NSOptions2Key"));
  v5.receiver = self;
  v5.super_class = (Class)NSFileWritingWritingClaim;
  -[NSFileAccessClaim encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (NSFileWritingWritingClaim)initWithCoder:(id)a3
{
  NSFileWritingWritingClaim *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSFileWritingWritingClaim;
  v4 = -[NSFileAccessClaim initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileAccessClaims should only ever be decoded by XPC"), 0));
    }
    v4->_url1 = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSURLPair1Key")), "URL");
    v4->_options1 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSOptions1Key")), "unsignedIntegerValue");
    v4->_url2 = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSURLPair2Key")), "URL");
    v4->_options2 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSOptions2Key")), "unsignedIntegerValue");
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  v9[2] = __65__NSFileWritingWritingClaim_forwardUsingConnection_crashHandler___block_invoke;
  v9[3] = &unk_1E0F50DE0;
  v9[4] = self;
  v9[5] = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__NSFileWritingWritingClaim_forwardUsingConnection_crashHandler___block_invoke_379;
  v8[3] = &unk_1E0F534B0;
  v8[4] = self;
  objc_msgSend((id)objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v9), "grantAccessClaim:withReply:", self, v8);
}

uint64_t __65__NSFileWritingWritingClaim_forwardUsingConnection_crashHandler___block_invoke(uint64_t a1, uint64_t a2)
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
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", _NSErrorWithFilePath(512, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208)));
  return objc_msgSend(*(id *)(a1 + 32), "unblock");
}

uint64_t __65__NSFileWritingWritingClaim_forwardUsingConnection_crashHandler___block_invoke_379(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11 = _NSFCClaimsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "claimID");
    v18 = 138543362;
    v19 = v13;
    _os_log_debug_impl(&dword_1817D9000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ received grantAccessClaim reply", (uint8_t *)&v18, 0xCu);
    if (a6)
      goto LABEL_3;
  }
  else if (a6)
  {
LABEL_3:
    v12 = _NSFCClaimsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(*(id *)(a1 + 32), "claimID");
      v18 = 138543618;
      v19 = v17;
      v20 = 2114;
      v21 = a6;
      _os_log_error_impl(&dword_1817D9000, v12, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim reply is an error: %{public}@", (uint8_t *)&v18, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", a6);
    return objc_msgSend(*(id *)(a1 + 32), "unblock");
  }
  v14 = (void *)objc_msgSend(a3, "firstObject");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = objc_msgSend((id)objc_msgSend(v14, "URL"), "copy");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 1;
  }
  if ((unint64_t)objc_msgSend(a3, "count") < 2)
    v15 = 0;
  else
    v15 = (void *)objc_msgSend(a3, "objectAtIndex:", 1);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = objc_msgSend((id)objc_msgSend(v15, "URL"), "copy");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 240) = 1;
  }
  if (a4)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = objc_msgSend(a4, "copy");
  }
  objc_msgSend(*(id *)(a1 + 32), "setShouldEnableMaterializationDuringAccessorBlock:", a5);
  return objc_msgSend(*(id *)(a1 + 32), "unblock");
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  _BOOL4 v4;
  NSFileAccessNode *v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  NSFileAccessNode *v11;
  NSFileAccessNode *location1;
  uint64_t v13;
  NSFileAccessNode *location2;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  _QWORD v19[3];

  v4 = a4;
  v19[2] = *MEMORY[0x1E0C80C00];
  v7 = (NSFileAccessNode *)objc_msgSend(a3, "descendantForFileURL:", self->_url1);
  v8 = objc_msgSend(a3, "descendantForFileURL:", self->_url2);
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
    v19[0] = v7;
    v19[1] = v11;
    if (-[NSFileAccessClaim canAccessLocations:forReading:error:](self, "canAccessLocations:forReading:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2), 0, &v18))
    {
      self->_location1 = v7;
      -[NSFileAccessNode addAccessClaim:](v7, "addAccessClaim:", self);
      self->_location2 = v11;
      -[NSFileAccessNode addAccessClaim:](v11, "addAccessClaim:", self);
      location1 = self->_location1;
      v13 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __76__NSFileWritingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
      v17[3] = &unk_1E0F534D8;
      v17[4] = self;
      -[NSFileAccessNode forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:](location1, "forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:", self, v17);
      location2 = self->_location2;
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __76__NSFileWritingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2;
      v16[3] = &unk_1E0F534D8;
      v16[4] = self;
      -[NSFileAccessNode forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:](location2, "forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:", self, v16);
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
  -[NSFileAccessNode removeSelfIfUseless](v7, "removeSelfIfUseless");
  -[NSFileAccessNode removeSelfIfUseless](v11, "removeSelfIfUseless");
  return v10;
}

uint64_t __76__NSFileWritingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "evaluateNewClaim:", *(_QWORD *)(a1 + 32));
}

uint64_t __76__NSFileWritingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "evaluateNewClaim:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  void *v7;
  _BOOL4 v8;

  v7 = (void *)objc_opt_class();
  LOBYTE(v8) = 1;
  if (objc_msgSend(v7, "canReadingItemAtLocation:options:safelyOverlapNewWriting:ofItemAtLocation:options:", a3, a4, 1, self->_location1, self->_options1))return objc_msgSend(v7, "canReadingItemAtLocation:options:safelyOverlapNewWriting:ofItemAtLocation:options:", a3, a4, 1, self->_location2, self->_options2) ^ 1;
  return v8;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  void *v7;

  v7 = (void *)objc_opt_class();
  if (objc_msgSend(v7, "canNewWriteOfItemAtLocation:options:safelyOverlapExistingWriteOfItemAtLocation:options:", self->_location1, self->_options1, a3, a4))return objc_msgSend(v7, "canNewWriteOfItemAtLocation:options:safelyOverlapExistingWriteOfItemAtLocation:options:", self->_location2, self->_options2, a3, a4) ^ 1;
  else
    return 1;
}

- (void)granted
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  _QWORD *v6;
  _QWORD *v7;
  NSFileAccessNode *location1;
  NSFileAccessNode *location2;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[6];
  _QWORD buf[4];

  buf[3] = *MEMORY[0x1E0C80C00];
  v3 = atomic_load(&_NSFCSubarbitrationCount);
  if (v3 < 1
    || (v12 = atomic_load(_NSFCDisableLogSuppression), (v12 & 1) != 0)
    || (v13 = atomic_load(&_NSFCSubarbitratedClaimCount), v13 <= 99))
  {
    if (self->_location1 || self->_location2)
    {
      v4 = _NSFCClaimsLog();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_7;
      LODWORD(buf[0]) = 138543362;
      *(_QWORD *)((char *)buf + 4) = -[NSFileAccessClaim claimID](self, "claimID");
      v5 = "Claim %{public}@ granted in server";
    }
    else
    {
      v4 = _NSFCClaimsLog();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_7;
      LODWORD(buf[0]) = 138543362;
      *(_QWORD *)((char *)buf + 4) = -[NSFileAccessClaim claimID](self, "claimID");
      v5 = "Claim %{public}@ granted in client";
    }
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)buf, 0xCu);
  }
LABEL_7:
  if (self->_location1 || self->_location2)
  {
    v6 = malloc_type_malloc(0x10uLL, 0x100004000313F17uLL);
    v7 = v6;
    location1 = self->_location1;
    if (location1)
    {
      buf[0] = self->_location1;
      *v6 = self->_options1;
      LODWORD(location1) = 1;
    }
    location2 = self->_location2;
    if (location2)
    {
      buf[location1] = location2;
      v6[location1] = self->_options2;
      LODWORD(location1) = (_DWORD)location1 + 1;
    }
    v10 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, location1);
    v11 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __36__NSFileWritingWritingClaim_granted__block_invoke;
    v15[3] = &unk_1E0F53690;
    v15[4] = self;
    v15[5] = v7;
    -[NSFileAccessClaim makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:](self, "makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:", 0, 0, v10, v7, v15);
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __36__NSFileWritingWritingClaim_granted__block_invoke_6;
    v14[3] = &unk_1E0F4D2D8;
    v14[4] = self;
    -[NSFileAccessClaim whenRevokedPerformProcedure:](self, "whenRevokedPerformProcedure:", v14);
  }
  -[NSFileAccessClaim unblockClaimerForReason:](self, "unblockClaimerForReason:", CFSTR("Initial blockage"));
}

void __36__NSFileWritingWritingClaim_granted__block_invoke(uint64_t a1, int a2)
{
  _QWORD *v3;

  if (a2)
  {
    v3 = *(_QWORD **)(a1 + 32);
    if (v3[32])
    {
      objc_msgSend(v3, "makePresentersOfItemAtLocation:orContainedItem:relinquishUsingProcedureGetter:");
      v3 = *(_QWORD **)(a1 + 32);
    }
    if (v3[33])
      objc_msgSend(v3, "makePresentersOfItemAtLocation:orContainedItem:relinquishUsingProcedureGetter:");
  }
  free(*(void **)(a1 + 40));
}

id __36__NSFileWritingWritingClaim_granted__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldWritingWithOptions:causePresenterToRelinquish:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224), a2))return 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__NSFileWritingWritingClaim_granted__block_invoke_3;
  v7[3] = &unk_1E0F535C8;
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = a2;
  v7[6] = a3;
  return (id)objc_msgSend(v7, "copy");
}

uint64_t __36__NSFileWritingWritingClaim_granted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "relinquishToWritingClaimWithID:options:purposeID:subitemPath:resultHandler:", objc_msgSend(*(id *)(a1 + 32), "claimID"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224), objc_msgSend(*(id *)(a1 + 32), "purposeIDOfClaimOnItemAtLocation:forMessagingPresenter:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256), *(_QWORD *)(a1 + 40)), *(_QWORD *)(a1 + 48), a2);
}

id __36__NSFileWritingWritingClaim_granted__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldWritingWithOptions:causePresenterToRelinquish:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248), a2))return 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__NSFileWritingWritingClaim_granted__block_invoke_5;
  v7[3] = &unk_1E0F535C8;
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = a2;
  v7[6] = a3;
  return (id)objc_msgSend(v7, "copy");
}

uint64_t __36__NSFileWritingWritingClaim_granted__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "relinquishToWritingClaimWithID:options:purposeID:subitemPath:resultHandler:", objc_msgSend(*(id *)(a1 + 32), "claimID"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248), objc_msgSend(*(id *)(a1 + 32), "purposeIDOfClaimOnItemAtLocation:forMessagingPresenter:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264), *(_QWORD *)(a1 + 40)), *(_QWORD *)(a1 + 48), a2);
}

uint64_t __36__NSFileWritingWritingClaim_granted__block_invoke_6(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 256))
  {
    v3 = objc_msgSend((id)result, "shouldInformProvidersAboutEndOfWriteWithOptions:", *(_QWORD *)(result + 224));
    result = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(result + 256), "itemProvider"), "observeEndOfWriteAtLocation:forAccessClaim:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));
      result = *(_QWORD *)(a1 + 32);
    }
  }
  if (*(_QWORD *)(result + 264))
  {
    result = objc_msgSend((id)result, "shouldInformProvidersAboutEndOfWriteWithOptions:", *(_QWORD *)(result + 248));
    if ((_DWORD)result)
      return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "itemProvider"), "observeEndOfWriteAtLocation:forAccessClaim:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264));
  }
  return result;
}

- (void)resolveURLsThenContinueInvokingClaimer:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSFileAccessNode *location1;
  unint64_t options1;
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  if (-[NSFileAccessClaim didWait](self, "didWait"))
  {
    v5 = -[NSFileAccessNode standardizedURL](self->_location1, "standardizedURL");
    if (v5)
    {
      v6 = v5;

      self->_url1 = (NSURL *)objc_msgSend(v6, "copy");
      self->_url1DidChange = 1;
    }
    v7 = -[NSFileAccessNode standardizedURL](self->_location2, "standardizedURL");
    if (v7)
    {
      v8 = v7;

      self->_url2 = (NSURL *)objc_msgSend(v8, "copy");
      self->_url2DidChange = 1;
    }
  }
  if (-[NSFileAccessClaim claimerError](self, "claimerError"))
  {
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
  }
  else
  {
    v9 = -[NSFileAccessClaim purposeID](self, "purposeID");
    location1 = self->_location1;
    options1 = self->_options1;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__NSFileWritingWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke;
    v12[3] = &unk_1E0F53640;
    v12[4] = self;
    v12[5] = v9;
    v12[6] = a3;
    -[NSFileAccessClaim makeProviderOfItemAtLocation:provideOrAttachPhysicalURLIfNecessaryForPurposeID:writingOptions:thenContinue:](self, "makeProviderOfItemAtLocation:provideOrAttachPhysicalURLIfNecessaryForPurposeID:writingOptions:thenContinue:", location1, v9, options1, v12);
  }
}

uint64_t __68__NSFileWritingWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)a1[4];
  v2 = a1[5];
  v4 = v3[33];
  v5 = v3[31];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__NSFileWritingWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke_2;
  v8[3] = &unk_1E0F536B8;
  v6 = a1[6];
  v8[5] = v3;
  v8[6] = v6;
  v8[4] = a2;
  return objc_msgSend(v3, "makeProviderOfItemAtLocation:provideOrAttachPhysicalURLIfNecessaryForPurposeID:writingOptions:thenContinue:", v4, v2, v5, v8);
}

uint64_t __68__NSFileWritingWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a1[6];
  v5 = a1[4];
  if (v5)
  {
LABEL_4:
    if (a2)
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
    goto LABEL_5;
  }
  v6 = a1[5];
  if (*(_BYTE *)(v6 + 216))
  {
    v5 = *(_QWORD *)(v6 + 208);
    goto LABEL_4;
  }
  v5 = 0;
  if (a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
LABEL_5:
  v7 = a1[5];
  if (*(_BYTE *)(v7 + 240))
    a2 = *(_QWORD *)(v7 + 232);
  else
    a2 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
}

- (void)invokeClaimer
{
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__NSFileWritingWritingClaim_invokeClaimer__block_invoke;
  v2[3] = &unk_1E0F53668;
  v2[4] = self;
  -[NSFileWritingWritingClaim resolveURLsThenContinueInvokingClaimer:](self, "resolveURLsThenContinueInvokingClaimer:", v2);
}

id __42__NSFileWritingWritingClaim_invokeClaimer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v16;
  unsigned __int8 v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint64_t v21;
  objc_super v22;
  _QWORD v23[2];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD **)(a1 + 32);
  if (v6[20])
  {
    v7 = atomic_load(&_NSFCSubarbitrationCount);
    if (v7 < 1
      || (v18 = atomic_load(_NSFCDisableLogSuppression), (v18 & 1) != 0)
      || (v19 = atomic_load(&_NSFCSubarbitratedClaimCount), v19 <= 99))
    {
      v8 = _NSFCClaimsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_msgSend(*(id *)(a1 + 32), "claimID");
        *(_DWORD *)buf = 138543362;
        v25 = v9;
        _os_log_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in client", buf, 0xCu);
      }
    }
    (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), *(_QWORD *)(a1 + 32), a2, a3, objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
    v6 = *(_QWORD **)(a1 + 32);
  }
  if (v6[21])
  {
    v10 = atomic_load(&_NSFCSubarbitrationCount);
    if (v10 < 1
      || (v20 = atomic_load(_NSFCDisableLogSuppression), (v20 & 1) != 0)
      || (v21 = atomic_load(&_NSFCSubarbitratedClaimCount), v21 <= 99))
    {
      v11 = _NSFCClaimsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(*(id *)(a1 + 32), "claimID");
        *(_DWORD *)buf = 138543362;
        v25 = v12;
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
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
    v23[0] = v14;
    v23[1] = v15;
    (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(v16 + 16))(v16, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), objc_msgSend(*(id *)(a1 + 32), "shouldEnableMaterializationDuringAccessorBlock"), objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
    v6 = *(_QWORD **)(a1 + 32);
  }
  v22.receiver = v6;
  v22.super_class = (Class)NSFileWritingWritingClaim;
  return objc_msgSendSuper2(&v22, sel_invokeClaimer);
}

- (void)devalueSelf
{
  NSFileAccessNode *location1;
  uint64_t v4;
  NSFileAccessNode *location2;
  objc_super v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  location1 = self->_location1;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__NSFileWritingWritingClaim_devalueSelf__block_invoke;
  v8[3] = &unk_1E0F534D8;
  v8[4] = self;
  -[NSFileAccessNode forEachRelevantAccessClaimPerformProcedure:](location1, "forEachRelevantAccessClaimPerformProcedure:", v8);
  location2 = self->_location2;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __40__NSFileWritingWritingClaim_devalueSelf__block_invoke_2;
  v7[3] = &unk_1E0F534D8;
  v7[4] = self;
  -[NSFileAccessNode forEachRelevantAccessClaimPerformProcedure:](location2, "forEachRelevantAccessClaimPerformProcedure:", v7);
  -[NSFileAccessNode removeAccessClaim:](self->_location1, "removeAccessClaim:", self);
  self->_location1 = 0;
  -[NSFileAccessNode removeAccessClaim:](self->_location2, "removeAccessClaim:", self);
  self->_location2 = 0;
  v6.receiver = self;
  v6.super_class = (Class)NSFileWritingWritingClaim;
  -[NSFileAccessClaim devalueSelf](&v6, sel_devalueSelf);
}

uint64_t __40__NSFileWritingWritingClaim_devalueSelf__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "devalueOldClaim:", *(_QWORD *)(a1 + 32));
}

uint64_t __40__NSFileWritingWritingClaim_devalueSelf__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "devalueOldClaim:", *(_QWORD *)(a1 + 32));
}

- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4
{
  if (self->_location1 == a3)
  {
    objc_msgSend(a4, "addAccessClaim:", self);
    objc_msgSend(a3, "removeAccessClaim:", self);
    self->_location1 = (NSFileAccessNode *)a4;
  }
  if (self->_location2 == a3)
  {
    objc_msgSend(a4, "addAccessClaim:", self);
    objc_msgSend(a3, "removeAccessClaim:", self);
    self->_location2 = (NSFileAccessNode *)a4;
  }
}

- (BOOL)blocksClaim:(id)a3
{
  if ((objc_msgSend(a3, "isBlockedByWritingItemAtLocation:options:", self->_location1, self->_options1) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a3, "isBlockedByWritingItemAtLocation:options:", self->_location2, self->_options2);
}

- (id)allURLs
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = v3;
  if (self->_url1)
    objc_msgSend(v3, "addObject:");
  if (self->_url2)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (void)protectFilesAgainstEviction
{
  -[NSFileAccessClaim _protectIfNecessaryFileAtURL:withOptions:forReading:](self, "_protectIfNecessaryFileAtURL:withOptions:forReading:", self->_url1, self->_options1, 0);
  -[NSFileAccessClaim _protectIfNecessaryFileAtURL:withOptions:forReading:](self, "_protectIfNecessaryFileAtURL:withOptions:forReading:", self->_url2, self->_options2, 0);
}

@end
