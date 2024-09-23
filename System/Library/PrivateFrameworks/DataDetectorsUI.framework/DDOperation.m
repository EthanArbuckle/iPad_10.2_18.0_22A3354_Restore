@implementation DDOperation

uint64_t __41__DDOperation_shouldUrlifyBlockForTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  int Category;
  const __CFString *Type;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  _BOOL8 v22;

  v7 = a3;
  v8 = a4;
  Category = DDResultGetCategory();
  Type = (const __CFString *)DDResultGetType();
  if (CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CB58], Type, 0) == kCFCompareEqualTo)
    goto LABEL_5;
  if (!DDResultHasProperties())
    goto LABEL_51;
  v11 = *(_QWORD *)(a1 + 32);
  if ((v11 & 4) != 0 && Category == 3)
    goto LABEL_5;
  if ((v11 & 0x10) != 0)
  {
    if (CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CBA0], Type, 0) == kCFCompareEqualTo)
      goto LABEL_5;
    v11 = *(_QWORD *)(a1 + 32);
  }
  if ((v11 & 0x20) != 0)
  {
    if (CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CAB8], Type, 0) == kCFCompareEqualTo)
      goto LABEL_5;
    v11 = *(_QWORD *)(a1 + 32);
  }
  if ((v11 & 0x40) != 0)
  {
    if (CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CB38], Type, 0) == kCFCompareEqualTo)
      goto LABEL_5;
    v11 = *(_QWORD *)(a1 + 32);
  }
  if ((v11 & 0x20000) != 0)
  {
    if (CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CAD0], Type, 0) == kCFCompareEqualTo)
      goto LABEL_5;
    v11 = *(_QWORD *)(a1 + 32);
  }
  if ((v11 & 1) != 0 && Category == 2)
    goto LABEL_5;
  if ((v11 & 2) == 0)
  {
LABEL_25:
    if ((v11 & 8) != 0 && Category == 4)
    {
      if (!DDResultIsPastDate())
        goto LABEL_5;
      v11 = *(_QWORD *)(a1 + 32);
    }
    if (v11 == -1)
    {
      if (DDResultHasType())
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

        if ((v17 & 1) != 0)
          goto LABEL_5;
      }
    }
    if ((~*(_DWORD *)(a1 + 32) & 0x1FFLL) == 0)
    {
      if (DDResultHasType())
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

        if ((v20 & 1) != 0)
          goto LABEL_5;
      }
    }
    v21 = *(_QWORD *)(a1 + 32);
    if ((v21 & 0x40000) == 0)
      goto LABEL_38;
    if ((DDResultHasType() & 1) == 0)
    {
      v21 = *(_QWORD *)(a1 + 32);
LABEL_38:
      if ((~(_WORD)v21 & 0x1FF) == 0)
      {
        if ((DDResultHasType() & 1) != 0)
        {
          v22 = +[DDUPIAction actionAvailableForResult:url:context:](DDUPIAction, "actionAvailableForResult:url:context:", a2, 0, 0);
LABEL_50:
          v12 = v22;
          goto LABEL_52;
        }
        v21 = *(_QWORD *)(a1 + 32);
      }
      if ((v21 & 0x80) != 0)
      {
        if ((DDResultHasType() & 1) != 0)
        {
LABEL_49:
          v22 = +[DDConversionAction actionAvailableForResult:](DDConversionAction, "actionAvailableForResult:", a2);
          goto LABEL_50;
        }
        v21 = *(_QWORD *)(a1 + 32);
      }
      if ((v21 & 0x100) != 0 && DDResultHasType())
        goto LABEL_49;
LABEL_51:
      v12 = 0;
      goto LABEL_52;
    }
LABEL_5:
    v12 = 1;
    goto LABEL_52;
  }
  if ((_DDResultIsURL(a2) & 1) == 0)
  {
    v11 = *(_QWORD *)(a1 + 32);
    goto LABEL_25;
  }
  _DDURLFromResult(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    v12 = dd_urlLooksSuspicious(v13) ^ 1;
  else
    v12 = 0;

LABEL_52:
  return v12;
}

void __60__DDOperation_dispatchScanQueryCreationWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v2 = a1 + 32;
  v3 = objc_msgSend(*(id *)(a1 + 32), "_createScanQuery");
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v3 == 35)
  {
    if (v4)
      __60__DDOperation_dispatchScanQueryCreationWithCompletionBlock___block_invoke_cold_1(v2, v5, v6, v7, v8, v9, v10, v11);
    v12 = *(void **)(a1 + 32);
    v13 = (void *)MEMORY[0x1A1AF3244](*(_QWORD *)(a1 + 40));
    objc_msgSend(v12, "performSelector:withObject:afterDelay:", sel_dispatchScanQueryCreationWithCompletionBlock_, v13, 0.0);

  }
  else
  {
    if (v4)
      __60__DDOperation_dispatchScanQueryCreationWithCompletionBlock___block_invoke_cold_2(v2, v5, v6, v7, v8, v9, v10, v11);
    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3 == 0);
  }
}

id __41__DDOperation_urlificationBlockForTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  unsigned int (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[DDOperation shouldUrlifyBlockForTypes:](DDOperation, "shouldUrlifyBlockForTypes:", *(_QWORD *)(a1 + 32));
  v12 = (unsigned int (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (((unsigned int (**)(_QWORD, uint64_t, id, id))v12)[2](v12, a2, v10, v11))
  {
    DDURLStringForResult();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int)tryCount
{
  return self->_tryCount;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void)setIgnoreSignatures:(BOOL)a3
{
  self->_ignoreSignatures = a3;
}

- (void)setGenerationNumber:(int)a3
{
  self->_generationNumber = a3;
}

- (void)setDetectionTypes:(unint64_t)a3
{
  self->_types = a3;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setContainer:(id)a3
{
  objc_storeStrong(&self->_container, a3);
}

- (NSArray)scannerResults
{
  return self->_scannerResults;
}

- (__DDScanQuery)scanQuery
{
  return self->_query;
}

- (NSArray)results
{
  return self->_results;
}

- (BOOL)needsFullScanner
{
  return objc_msgSend((id)objc_opt_class(), "_needsFullScannerForDetectionTypes:", self->_types);
}

- (BOOL)needContinuation
{
  return self->_needContinuation;
}

- (void)main
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "Got an exception during scanning: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (BOOL)isDiscarded
{
  return self->_isDiscarded;
}

- (DDOperation)initWithContainer:(id)a3
{
  id v5;
  DDOperation *v6;
  DDOperation *v7;
  NSArray *results;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DDOperation;
  v6 = -[DDOperation init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_container, a3);
    v7->_query = 0;
    results = v7->_results;
    v7->_results = 0;

    v7->_tryCount = 0;
    v7->_containerNotReadyTryCount = 0;
    v7->_isDiscarded = 0;
  }

  return v7;
}

- (BOOL)ignoreSignatures
{
  return self->_ignoreSignatures;
}

- (int)generationNumber
{
  return self->_generationNumber;
}

- (void)dispatchScanQueryCreationWithCompletionBlock:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  DDOperation *v11;
  id v12;

  v4 = (void *)objc_msgSend(a3, "copy");
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __60__DDOperation_dispatchScanQueryCreationWithCompletionBlock___block_invoke;
  v10 = &unk_1E4258540;
  v11 = self;
  v12 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A1AF3244](&v7);
  -[DDOperation dispatchContainerModificationBlock:](self, "dispatchContainerModificationBlock:", v6, v7, v8, v9, v10, v11);

}

- (unint64_t)detectionTypes
{
  return self->_types;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_super v6;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[DDOperation _createScanQuery].cold.8();
  if (self->_container)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DDOperation.m"), 278, CFSTR("Container should already be nil"));

  }
  if (self->_query)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DDOperation.m"), 279, CFSTR("Scan query should already be nil"));

  }
  v6.receiver = self;
  v6.super_class = (Class)DDOperation;
  -[DDOperation dealloc](&v6, sel_dealloc);
}

- (NSDictionary)context
{
  return self->_context;
}

- (id)container
{
  return self->_container;
}

- (BOOL)containerIsReady
{
  return 1;
}

- (void)cleanup
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[DDOperation _createScanQuery].cold.8();
  -[DDOperation _setScanQuery:](self, "_setScanQuery:", 0);
  -[DDOperation setContext:](self, "setContext:", 0);
  -[DDOperation setContainer:](self, "setContainer:", 0);
}

- (void)_setScanQuery:(__DDScanQuery *)a3
{
  __DDScanQuery *query;

  query = self->_query;
  if (query != a3)
  {
    if (query)
    {
      CFRelease(query);
      self->_query = 0;
    }
    if (a3)
      self->_query = (__DDScanQuery *)CFRetain(a3);
  }
}

- (int)_createScanQuery
{
  int containerNotReadyTryCount;
  _BOOL4 v4;
  __DDScanQuery *v6;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[DDOperation _createScanQuery].cold.8();
  if (-[DDOperation isDiscarded](self, "isDiscarded"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[DDOperation _createScanQuery].cold.1();
    return 22;
  }
  -[DDOperation _applyContainerRestrictionsToTypes](self, "_applyContainerRestrictionsToTypes");
  if (!self->_types)
    return 22;
  if (-[DDOperation tryCount](self, "tryCount") != -1
    && !-[DDOperation _containerReadyForDetection](self, "_containerReadyForDetection"))
  {
    containerNotReadyTryCount = self->_containerNotReadyTryCount;
    self->_containerNotReadyTryCount = containerNotReadyTryCount + 1;
    v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (containerNotReadyTryCount <= 1)
    {
      if (v4)
        -[DDOperation _createScanQuery].cold.6(self);
      return 35;
    }
    if (v4)
      -[DDOperation _createScanQuery].cold.7(self);
  }
  -[DDOperation _updateGenerationNumber](self, "_updateGenerationNumber");
  if (!-[DDOperation _rangeValidForContainer](self, "_rangeValidForContainer")
    || !-[DDOperation generationNumber](self, "generationNumber"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[DDOperation _createScanQuery].cold.2(self);
    return 22;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[DDOperation _createScanQuery].cold.5();
  v6 = -[DDOperation _createScanQueryForBackend](self, "_createScanQueryForBackend");
  -[DDOperation _setScanQuery:](self, "_setScanQuery:", v6);
  if (v6)
    CFRelease(v6);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[DDOperation _createScanQuery].cold.3(self);
  if (-[DDOperation scanQuery](self, "scanQuery"))
    return 0;
  else
    return 22;
}

- (BOOL)_containerReadyForDetection
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannerResults, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_container, 0);
}

+ (id)urlificationBlockForTypes:(unint64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__DDOperation_urlificationBlockForTypes___block_invoke;
  v6[3] = &__block_descriptor_40_e70___NSString_40__0____DDResult__8__NSString_16__NSDate_24__NSTimeZone_32l;
  v6[4] = a3;
  v3 = (void *)MEMORY[0x1A1AF3244](v6, a2);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (id)shouldUrlifyBlockForTypes:(unint64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__DDOperation_shouldUrlifyBlockForTypes___block_invoke;
  v6[3] = &__block_descriptor_40_e47_B32__0____DDResult__8__NSDate_16__NSTimeZone_24l;
  v6[4] = a3;
  v3 = (void *)MEMORY[0x1A1AF3244](v6, a2);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (BOOL)_needsFullScannerForDetectionTypes:(unint64_t)a3
{
  return (a3 & 0x601FC) != 0;
}

- (BOOL)_rangeValidForContainer
{
  return 1;
}

- (__DDScanQuery)_createScanQueryForBackend
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DDOperation.m"), 84, CFSTR("_createScanQueryForBackend has to be overridden by subclasses"));

  return 0;
}

- (BOOL)doURLificationOnDocument
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DDOperation.m"), 250, CFSTR("_doURLificationOnDocument must be overridden by DDOperation subclasses"));

  return 0;
}

- (void)dispatchContainerModificationBlock:(id)a3
{
  NSObject *v4;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, a3);

}

- (void)cancel
{
  DDOperation *v3;
  objc_super v4;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[DDOperation _createScanQuery].cold.8();
  -[DDOperation setIsDiscarded:](self, "setIsDiscarded:", 1);
  v3 = self;
  objc_sync_enter(v3);
  objc_msgSend(MEMORY[0x1E0D1CE70], "cancelJob:", v3->_jobIdentifier);
  objc_sync_exit(v3);

  v4.receiver = v3;
  v4.super_class = (Class)DDOperation;
  -[DDOperation cancel](&v4, sel_cancel);
}

- (BOOL)needsToStartOver
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[DDOperation container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithContainer:", v5);

  objc_msgSend(v6, "setDetectionTypes:", -[DDOperation detectionTypes](self, "detectionTypes"));
  -[DDOperation context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContext:", v7);

  objc_msgSend(v6, "setTryCount:", -[DDOperation tryCount](self, "tryCount"));
  return v6;
}

- (id)newOperationForStartingOver
{
  void *v3;

  v3 = (void *)-[DDOperation copy](self, "copy");
  objc_msgSend(v3, "setTryCount:", -[DDOperation tryCount](self, "tryCount") + 1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[DDOperation newOperationForStartingOver].cold.1(v3);
  return v3;
}

- (void)setNeedContinuation:(BOOL)a3
{
  self->_needContinuation = a3;
}

- (void)setTryCount:(int)a3
{
  self->_tryCount = a3;
}

- (void)setIsDiscarded:(BOOL)a3
{
  self->_isDiscarded = a3;
}

- (void)setScannerResults:(id)a3
{
  objc_storeStrong((id *)&self->_scannerResults, a3);
}

- (void)_createScanQuery
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "operation %p", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)newOperationForStartingOver
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v1, "Created operation %@ to start over for container %@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_6();
}

void __60__DDOperation_dispatchScanQueryCreationWithCompletionBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "Should retry operation %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __60__DDOperation_dispatchScanQueryCreationWithCompletionBlock___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "Calling the completion block for %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
