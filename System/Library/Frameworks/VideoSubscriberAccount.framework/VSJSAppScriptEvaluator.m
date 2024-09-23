@implementation VSJSAppScriptEvaluator

- (VSJSAppScriptEvaluator)initWithApp:(id)a3 urls:(id)a4
{
  id v7;
  id v8;
  VSJSAppScriptEvaluator *v9;
  VSJSAppScriptEvaluator *v10;
  uint64_t v11;
  NSArray *urls;
  uint64_t v13;
  NSMutableArray *remainingURLs;
  NSMutableArray *v15;
  NSMutableArray *results;
  VSStateMachine *v17;
  VSStateMachine *stateMachine;
  VSStateMachine *v19;
  objc_class *v20;
  void *v21;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)VSJSAppScriptEvaluator;
  v9 = -[VSJSAppScriptEvaluator init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_app, a3);
    v11 = objc_msgSend(v8, "copy");
    urls = v10->_urls;
    v10->_urls = (NSArray *)v11;

    v13 = -[NSArray mutableCopy](v10->_urls, "mutableCopy");
    remainingURLs = v10->_remainingURLs;
    v10->_remainingURLs = (NSMutableArray *)v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    results = v10->_results;
    v10->_results = v15;

    v17 = objc_alloc_init(VSStateMachine);
    stateMachine = v10->_stateMachine;
    v10->_stateMachine = v17;

    v19 = v10->_stateMachine;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSStateMachine setName:](v19, "setName:", v21);

    -[VSStateMachine setDelegate:](v10->_stateMachine, "setDelegate:", v10);
    -[VSStateMachine setDestinationState:forEvent:inState:](v10->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Enqueueing Next URL"), CFSTR("Start"), CFSTR("Idle"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v10->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Fetching Script"), CFSTR("Enqueued Next URL"), CFSTR("Enqueueing Next URL"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v10->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Done"), CFSTR("Done"), CFSTR("Enqueueing Next URL"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v10->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Enqueueing Next URL"), CFSTR("Done"), CFSTR("Fetching Script"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v10->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Enqueueing Next URL"), CFSTR("Error"), CFSTR("Fetching Script"));
    -[VSStateMachine activateWithState:](v10->_stateMachine, "activateWithState:", CFSTR("Idle"));
  }

  return v10;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[VSJSAppScriptEvaluator stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceUnwrapObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("Idle"));

  if ((v6 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-start invoked in non-idle state."));
  VSDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[VSJSAppScriptEvaluator urls](self, "urls");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134217984;
    v10 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "Starting script evaluation for %lu URLs", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(v3, "enqueueEvent:", CFSTR("Start"));

}

- (void)transitionToEnqueueingNextUrlState
{
  NSObject *v3;
  void *v4;
  char *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[VSJSAppScriptEvaluator transitionToEnqueueingNextUrlState]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v12, 0xCu);
  }

  -[VSJSAppScriptEvaluator remainingURLs](self, "remainingURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (char *)objc_claimAutoreleasedReturnValue();

  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Enqueued URL: %@", (uint8_t *)&v12, 0xCu);
    }

    -[VSJSAppScriptEvaluator remainingURLs](self, "remainingURLs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v5);

    -[VSJSAppScriptEvaluator setCurrentURL:](self, "setCurrentURL:", v5);
    -[VSJSAppScriptEvaluator stateMachine](self, "stateMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("Enqueued Next URL");
  }
  else
  {
    if (v7)
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "No remaining URLs for evaluation.", (uint8_t *)&v12, 2u);
    }

    -[VSJSAppScriptEvaluator stateMachine](self, "stateMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("Done");
  }
  objc_msgSend(v9, "enqueueEvent:", v11);

}

- (void)transitionToFetchingScriptState
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "currentURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D2419000, a2, v4, "Invalid URL: %@", (uint8_t *)&v5);

}

void __57__VSJSAppScriptEvaluator_transitionToFetchingScriptState__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      VSErrorLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __57__VSJSAppScriptEvaluator_transitionToFetchingScriptState__block_invoke_cold_2(a1, (uint64_t)v7, v10);

      objc_msgSend(*(id *)(a1 + 40), "setLoadError:", v7);
      objc_msgSend(*(id *)(a1 + 40), "setLoaded:", 0);
    }
    else
    {
      if (v6)
      {
        objc_msgSend(WeakRetained, "app");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
        if (v12)
        {
          -[NSObject evaluateScript:withSourceURL:](v11, "evaluateScript:withSourceURL:", v12, *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 40), "setLoaded:", 1);
        }

      }
      else
      {
        VSErrorLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __57__VSJSAppScriptEvaluator_transitionToFetchingScriptState__block_invoke_cold_1(a1, v11, v13);
      }

    }
    objc_msgSend(v9, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(v9, "stateMachine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "enqueueEvent:", CFSTR("Done"));

  }
}

- (void)transitionToDoneState
{
  NSObject *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[VSJSAppScriptEvaluator transitionToDoneState]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v6, 0xCu);
  }

  -[VSJSAppScriptEvaluator completionBlock](self, "completionBlock");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VSJSAppScriptEvaluator results](self, "results");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v5);

  }
}

- (NSArray)urls
{
  return self->_urls;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (VSJSApp)app
{
  return self->_app;
}

- (void)setApp:(id)a3
{
  objc_storeStrong((id *)&self->_app, a3);
}

- (VSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (NSMutableArray)remainingURLs
{
  return self->_remainingURLs;
}

- (void)setRemainingURLs:(id)a3
{
  objc_storeStrong((id *)&self->_remainingURLs, a3);
}

- (NSString)currentURL
{
  return self->_currentURL;
}

- (void)setCurrentURL:(id)a3
{
  objc_storeStrong((id *)&self->_currentURL, a3);
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_storeStrong((id *)&self->_remainingURLs, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_urls, 0);
}

void __57__VSJSAppScriptEvaluator_transitionToFetchingScriptState__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D2419000, a2, a3, "Reived no data for script evaluation with URL: %@", (uint8_t *)&v4);
}

void __57__VSJSAppScriptEvaluator_transitionToFetchingScriptState__block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Error fetching script for evaluation with URL: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

@end
