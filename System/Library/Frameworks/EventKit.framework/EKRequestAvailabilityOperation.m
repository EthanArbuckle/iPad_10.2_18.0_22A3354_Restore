@implementation EKRequestAvailabilityOperation

- (EKRequestAvailabilityOperation)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Please use the appropriate designated initializer for this class."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (EKRequestAvailabilityOperation)initWithSource:(id)a3 startDate:(id)a4 endDate:(id)a5 ignoredEvent:(id)a6 addresses:(id)a7 resultsBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  EKRequestAvailabilityOperation *v22;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  if (objc_msgSend(v16, "isDetached"))
  {
    objc_msgSend(v16, "originalItem");
    v20 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v20;
  }
  objc_msgSend(v16, "uniqueID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[EKRequestAvailabilityOperation initWithSource:startDate:endDate:ignoredEventID:addresses:resultsBlock:](self, "initWithSource:startDate:endDate:ignoredEventID:addresses:resultsBlock:", v19, v18, v17, v21, v15, v14);
  return v22;
}

- (EKRequestAvailabilityOperation)initWithSource:(id)a3 startDate:(id)a4 endDate:(id)a5 ignoredEventID:(id)a6 addresses:(id)a7 resultsBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  EKRequestAvailabilityOperation *v18;
  uint64_t v19;
  EKAvailabilityCache *availabilityCache;
  uint64_t v21;
  id resultsBlock;
  id v23;
  const char *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *queue;
  id v28;
  id v29;
  objc_super v30;

  v14 = a3;
  v29 = a4;
  v28 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)EKRequestAvailabilityOperation;
  v18 = -[EKRequestAvailabilityOperation init](&v30, sel_init);
  if (v18)
  {
    objc_msgSend(v14, "availabilityCache", v28, v29);
    v19 = objc_claimAutoreleasedReturnValue();
    availabilityCache = v18->_availabilityCache;
    v18->_availabilityCache = (EKAvailabilityCache *)v19;

    objc_storeStrong((id *)&v18->_startDate, a4);
    objc_storeStrong((id *)&v18->_endDate, a5);
    objc_storeStrong((id *)&v18->_ignoredEventID, a6);
    objc_storeStrong((id *)&v18->_addresses, a7);
    v21 = objc_msgSend(v17, "copy");
    resultsBlock = v18->_resultsBlock;
    v18->_resultsBlock = (id)v21;

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = (const char *)objc_msgSend(v23, "UTF8String");

    v25 = dispatch_queue_create(v24, 0);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v25;

  }
  return v18;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0D0C2D0]);
  v9.receiver = self;
  v9.super_class = (Class)EKRequestAvailabilityOperation;
  -[EKRequestAvailabilityOperation description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  objc_msgSend(v5, "setKey:withBoolean:", CFSTR("_isFinished"), self->_isFinished);
  objc_msgSend(v5, "setKey:withBoolean:", CFSTR("_isExecuting"), self->_isExecuting);
  objc_msgSend(v5, "setKey:withObject:", CFSTR("_availabilityCache"), self->_availabilityCache);
  objc_msgSend(v5, "setKey:withDate:", CFSTR("_startDate"), self->_startDate);
  objc_msgSend(v5, "setKey:withDate:", CFSTR("_endDate"), self->_endDate);
  objc_msgSend(v5, "setKey:withString:", CFSTR("_ignoredEventID"), self->_ignoredEventID);
  objc_msgSend(v5, "setKey:withArray:", CFSTR("_addresses"), self->_addresses);
  objc_msgSend(v5, "setKey:withPointerAddress:", CFSTR("_resultsBlock"), self->_resultsBlock);
  objc_msgSend(v5, "setKey:withObject:", CFSTR("_requestID"), self->_requestID);
  objc_msgSend(v5, "setKey:withPointerAddress:", CFSTR("_queue"), self->_queue);
  -[EKRequestAvailabilityOperation error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withObject:", CFSTR("error"), v6);

  objc_msgSend(v5, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__EKRequestAvailabilityOperation_start__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __39__EKRequestAvailabilityOperation_start__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isExecuting");
    if ((result & 1) == 0)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "isFinished");
      if ((result & 1) == 0)
        return objc_msgSend(*(id *)(a1 + 32), "main");
    }
  }
  return result;
}

- (void)main
{
  EKAvailabilityCache *availabilityCache;
  NSDate *startDate;
  NSDate *endDate;
  NSString *ignoredEventID;
  NSArray *addresses;
  void *v8;
  id requestID;
  _QWORD v10[5];
  _QWORD v11[5];

  -[EKRequestAvailabilityOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_isExecuting = 1;
  -[EKRequestAvailabilityOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  availabilityCache = self->_availabilityCache;
  startDate = self->_startDate;
  endDate = self->_endDate;
  ignoredEventID = self->_ignoredEventID;
  addresses = self->_addresses;
  v10[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__EKRequestAvailabilityOperation_main__block_invoke;
  v11[3] = &unk_1E4785F60;
  v11[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__EKRequestAvailabilityOperation_main__block_invoke_33;
  v10[3] = &unk_1E4785238;
  -[EKAvailabilityCache requestAvailabilityBetweenStartDate:endDate:ignoredEventID:addresses:resultsBlock:completionBlock:](availabilityCache, "requestAvailabilityBetweenStartDate:endDate:ignoredEventID:addresses:resultsBlock:completionBlock:", startDate, endDate, ignoredEventID, addresses, v11, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  requestID = self->_requestID;
  self->_requestID = v8;

}

void __38__EKRequestAvailabilityOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = (uint64_t *)(a1 + 32);
  if (objc_msgSend(v5, "isCancelled"))
  {
    v6 = EKAvailabilityHandle;
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
      __38__EKRequestAvailabilityOperation_main__block_invoke_cold_1(v4, v6);
  }
  else
  {
    v7 = *v4;
    v8 = *(NSObject **)(*v4 + 312);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__EKRequestAvailabilityOperation_main__block_invoke_31;
    v9[3] = &unk_1E47853B0;
    v9[4] = v7;
    v10 = v3;
    dispatch_async(v8, v9);

  }
}

void __38__EKRequestAvailabilityOperation_main__block_invoke_31(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;

  v2 = (_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296);
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = EKAvailabilityHandle;
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
      __38__EKRequestAvailabilityOperation_main__block_invoke_31_cold_1(a1, v2, v4);
  }
}

void __38__EKRequestAvailabilityOperation_main__block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 312);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__EKRequestAvailabilityOperation_main__block_invoke_2;
  v7[3] = &unk_1E47853B0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __38__EKRequestAvailabilityOperation_main__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKRequestAvailabilityOperation;
  -[EKRequestAvailabilityOperation cancel](&v5, sel_cancel);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__EKRequestAvailabilityOperation_cancel__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__EKRequestAvailabilityOperation_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "cancelAvailabilityRequestWithID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)_finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id resultsBlock;

  v4 = a3;
  v5 = EKAvailabilityHandle;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
    -[EKRequestAvailabilityOperation _finishWithError:].cold.1((uint64_t)v4, (uint64_t)self, v5);
  if (!self->_isFinished)
  {
    if ((-[EKRequestAvailabilityOperation isCancelled](self, "isCancelled") & 1) == 0)
      -[EKRequestAvailabilityOperation setError:](self, "setError:", v4);
    resultsBlock = self->_resultsBlock;
    self->_resultsBlock = 0;

    if (self->_isExecuting)
    {
      -[EKRequestAvailabilityOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
      self->_isExecuting = 0;
      -[EKRequestAvailabilityOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    }
    -[EKRequestAvailabilityOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_isFinished = 1;
    -[EKRequestAvailabilityOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }

}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_requestID, 0);
  objc_storeStrong(&self->_resultsBlock, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_ignoredEventID, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_availabilityCache, 0);
}

void __38__EKRequestAvailabilityOperation_main__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1A2318000, a2, OS_LOG_TYPE_DEBUG, "Operation was cancelled.  Will not return results.  Operation: [%@]", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __38__EKRequestAvailabilityOperation_main__block_invoke_31_cold_1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_2_4(&dword_1A2318000, (uint64_t)a2, a3, "No results block.  Will not pass along results [%@] for operation: [%@]", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_0();
}

- (void)_finishWithError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_4(&dword_1A2318000, a2, a3, "Finishing operation with error: [%@].  Operation: [%@]", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_0();
}

@end
