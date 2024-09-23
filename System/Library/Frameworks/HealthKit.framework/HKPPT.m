@implementation HKPPT

- (HKPPT)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKPPT)initWithHKPPTInterface:(id)a3 usingQueue:(id)a4
{
  id v7;
  id v8;
  HKPPT *v9;
  HKPPT *v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *pptQueue;
  OS_dispatch_queue *v13;
  id v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *activeTestsByName;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKPPT;
  v9 = -[HKPPT init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pptInterface, a3);
    if (v8)
    {
      v11 = (OS_dispatch_queue *)v8;
      pptQueue = v10->_pptQueue;
      v10->_pptQueue = v11;
    }
    else
    {
      v13 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v14 = MEMORY[0x1E0C80D38];
      pptQueue = v10->_pptQueue;
      v10->_pptQueue = v13;
    }

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activeTestsByName = v10->_activeTestsByName;
    v10->_activeTestsByName = v15;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKPPT;
  -[HKPPT dealloc](&v4, sel_dealloc);
}

- (id)builtinTests
{
  void *v2;
  void *v3;

  +[HKPPTPluginManager sharedPluginManager](HKPPTPluginManager, "sharedPluginManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "builtinTests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_testNameForDriver:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_activeTestsByName;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_activeTestsByName, "objectForKeyedSubscript:", v10, (_QWORD)v14);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          v12 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)invalidConfigurationForTest:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[HKPPT startedTest:](self, "startedTest:", v7);
  -[HKPPT failedTest:results:error:](self, "failedTest:results:error:", v7, 0, v6);

}

- (void)startedTest:(id)a3
{
  void *v4;
  void *v5;

  -[HKPPT _testNameForDriver:](self, "_testNameForDriver:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[HKPPT _startedTest:](self, "_startedTest:", v4);
    v4 = v5;
  }

}

- (void)failedTest:(id)a3 results:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[HKPPT _testNameForDriver:](self, "_testNameForDriver:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_activeTestsByName, "removeObjectForKey:", v10);
    if (v9)
    {
      if (!v8)
      {
        v14 = CFSTR("error");
        objc_msgSend(v9, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (v8)
          goto LABEL_6;
        goto LABEL_8;
      }
      v11 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v9, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("error"));

      v8 = v11;
    }
    if (v8)
    {
LABEL_6:
      -[HKPPT _failedTest:withResults:](self, "_failedTest:withResults:", v10, v8);
      goto LABEL_9;
    }
LABEL_8:
    -[HKPPT _failedTest:](self, "_failedTest:", v10);
  }
LABEL_9:

}

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[HKPPT _testNameForDriver:](self, "_testNameForDriver:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_activeTestsByName, "removeObjectForKey:", v6);
    if (v7)
      -[HKPPT _finishedTest:extraResults:](self, "_finishedTest:extraResults:", v6, v7);
    else
      -[HKPPT _finishedTest:](self, "_finishedTest:", v6);
  }

}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  objc_class *v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  const char *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKey:", CFSTR("testType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    _HKInitializeLogging();
    HKLogTesting();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      v16 = "[PPT] Skipping unspecified performance test type for: %@";
LABEL_9:
      _os_log_impl(&dword_19A0E6000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v18, 0xCu);
    }
LABEL_12:

    v14 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("enabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogTesting();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      v16 = "[PPT] Skipping disabled performance test: %@";
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  +[HKPPTPluginManager sharedPluginManager](HKPPTPluginManager, "sharedPluginManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_class *)objc_msgSend(v11, "classForTestType:", v8);

  if (!v12)
  {
    _HKInitializeLogging();
    HKLogTesting();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[HKPPT runTest:options:].cold.1((uint64_t)v6, (uint64_t)v8, v15);
    goto LABEL_12;
  }
  v13 = objc_alloc_init(v12);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeTestsByName, "setObject:forKeyedSubscript:", v13, v6);
  objc_msgSend(v13, "runTest:options:controller:", v6, v7, self);

  v14 = 1;
LABEL_13:

  return v14;
}

- (void)_startedTest:(id)a3
{
  id v4;
  NSObject *pptQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  pptQueue = self->_pptQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __22__HKPPT__startedTest___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(pptQueue, v7);

}

void __22__HKPPT__startedTest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "startedTest:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    _HKInitializeLogging();
    HKLogTesting();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "[PPT] *** HKPPT application object does not conform to startedTest.", v3, 2u);
    }

  }
}

- (void)_finishedTest:(id)a3
{
  id v4;
  NSObject *pptQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  pptQueue = self->_pptQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __23__HKPPT__finishedTest___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(pptQueue, v7);

}

void __23__HKPPT__finishedTest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "finishedTest:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    _HKInitializeLogging();
    HKLogTesting();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "[PPT] *** HKPPT application object does not conform to finishedTest.", v3, 2u);
    }

  }
}

- (void)_finishedTest:(id)a3 extraResults:(id)a4
{
  id v6;
  id v7;
  NSObject *pptQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  pptQueue = self->_pptQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__HKPPT__finishedTest_extraResults___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(pptQueue, block);

}

void __36__HKPPT__finishedTest_extraResults___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "finishedTest:extraResults:", a1[5], a1[6]);
  }
  else
  {
    _HKInitializeLogging();
    HKLogTesting();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "[PPT] *** HKPPT application object does not conform to finishedTest:extraResults:.", v3, 2u);
    }

  }
}

- (void)_failedTest:(id)a3
{
  id v4;
  NSObject *pptQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  pptQueue = self->_pptQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __21__HKPPT__failedTest___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(pptQueue, v7);

}

void __21__HKPPT__failedTest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "failedTest:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    _HKInitializeLogging();
    HKLogTesting();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "[PPT] *** HKPPT application object does not conform to failedTest:.", v3, 2u);
    }

  }
}

- (void)_failedTest:(id)a3 withResults:(id)a4
{
  id v6;
  id v7;
  NSObject *pptQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  pptQueue = self->_pptQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__HKPPT__failedTest_withResults___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(pptQueue, block);

}

void __33__HKPPT__failedTest_withResults___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "failedTest:withResults:", a1[5], a1[6]);
  }
  else
  {
    _HKInitializeLogging();
    HKLogTesting();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "[PPT] *** HKPPT application object does not conform to failedTest:withResults:.", v3, 2u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTestsByName, 0);
  objc_storeStrong((id *)&self->_pptQueue, 0);
  objc_storeStrong((id *)&self->_pptInterface, 0);
}

- (void)runTest:(os_log_t)log options:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "Unrecognized performance test: %@ (%@)", (uint8_t *)&v3, 0x16u);
}

@end
