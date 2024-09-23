@implementation INAppIntentDeliverer

- (INAppIntentDeliverer)initWithBundleIdentifier:(id)a3
{
  return -[INAppIntentDeliverer initWithBundleIdentifier:intentForwardingAction:](self, "initWithBundleIdentifier:intentForwardingAction:", a3, 0);
}

- (INAppIntentDeliverer)initWithBundleIdentifier:(id)a3 intentForwardingAction:(id)a4
{
  id v6;
  id v7;
  INAppIntentDeliverer *v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  RBSAssertion *processAssertion;
  void *v19;
  id v20;
  uint64_t v21;
  RBSProcessMonitor *processMonitor;
  INAppIntentDeliverer *v23;
  _QWORD v25[4];
  id v26;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)INAppIntentDeliverer;
  v8 = -[INAppIntentDeliverer init](&v27, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_intentForwardingAction, a4);
    v11 = dispatch_queue_create("INAppIntentDeliverer", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x1E0D87D80], "identityForEmbeddedApplicationIdentifier:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithProcessIdentity:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.siri"), CFSTR("IntentStartupGrant"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D87C98]), "initWithExplanation:target:attributes:", CFSTR("AppIntentDeliverer"), v14, v16);
    processAssertion = v8->_processAssertion;
    v8->_processAssertion = (RBSAssertion *)v17;

    -[RBSAssertion addObserver:](v8->_processAssertion, "addObserver:", v8);
    v19 = (void *)MEMORY[0x1E0D87D90];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __72__INAppIntentDeliverer_initWithBundleIdentifier_intentForwardingAction___block_invoke;
    v25[3] = &unk_1E228CF78;
    v26 = v14;
    v20 = v14;
    objc_msgSend(v19, "monitorWithConfiguration:", v25);
    v21 = objc_claimAutoreleasedReturnValue();
    processMonitor = v8->_processMonitor;
    v8->_processMonitor = (RBSProcessMonitor *)v21;

    v23 = v8;
  }

  return v8;
}

- (void)dealloc
{
  RBSAssertion *processAssertion;
  char v4;
  id v5;
  NSObject *v6;
  objc_super v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
  if (-[RBSAssertion isValid](self->_processAssertion, "isValid"))
  {
    processAssertion = self->_processAssertion;
    v8 = 0;
    v4 = -[RBSAssertion invalidateWithError:](processAssertion, "invalidateWithError:", &v8);
    v5 = v8;
    if ((v4 & 1) == 0)
    {
      v6 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "-[INAppIntentDeliverer dealloc]";
        v11 = 2114;
        v12 = v5;
        _os_log_error_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_ERROR, "%s Failed to invalidate process assertion: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  v7.receiver = self;
  v7.super_class = (Class)INAppIntentDeliverer;
  -[INAppIntentDeliverer dealloc](&v7, sel_dealloc);
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[INAppIntentDeliverer processMonitor](self, "processMonitor", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "states");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (!v8)
  {

LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 1312, MEMORY[0x1E0C9AA70]);
    v14 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "responseClass")), "initWithError:", v14);
    -[INAppIntentDeliverer completeWithIntentForwardingActionResponse:](self, "completeWithIntentForwardingActionResponse:", v16);

    v17 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      -[INAppIntentDeliverer bundleIdentifier](self, "bundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v25 = "-[INAppIntentDeliverer assertion:didInvalidateWithError:]";
      v26 = 2114;
      v27 = v19;
      v28 = 2114;
      v29 = v5;
      _os_log_error_impl(&dword_18BEBC000, v18, OS_LOG_TYPE_ERROR, "%s Intent delivery failed because %{public}@ appears to have crashed: %{public}@", buf, 0x20u);

    }
    goto LABEL_14;
  }
  v9 = v8;
  v10 = *(_QWORD *)v21;
  v11 = 1;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v21 != v10)
        objc_enumerationMutation(v7);
      v11 &= objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "taskState");
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  }
  while (v9);

  if ((v11 & 1) != 0)
    goto LABEL_12;
  v13 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    -[INAppIntentDeliverer bundleIdentifier](self, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v25 = "-[INAppIntentDeliverer assertion:didInvalidateWithError:]";
    v26 = 2114;
    v27 = v15;
    v28 = 2114;
    v29 = v5;
    _os_log_error_impl(&dword_18BEBC000, v14, OS_LOG_TYPE_ERROR, "%s Intent delivery assertion for %{public}@ was dropped after timeout: %{public}@", buf, 0x20u);

LABEL_14:
  }

}

- (void)deliverIntentForwardingActionWithResponseHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[INAppIntentDeliverer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__INAppIntentDeliverer_deliverIntentForwardingActionWithResponseHandler___block_invoke;
  block[3] = &unk_1E2293BE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)deliverIntent:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[INAppIntentDeliverer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__INAppIntentDeliverer_deliverIntent_reply___block_invoke;
  block[3] = &unk_1E2292238;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (void)_deliverIntentForwardingActionWithResponseHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  INIntentForwardingAction *intentForwardingAction;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD v34[5];
  _QWORD v35[4];
  id v36;
  id v37;
  id location;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  _BYTE buf[24];
  void *v45;
  uint64_t *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INIntentForwardingAction intent](self->_intentForwardingAction, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke;
  v35[3] = &unk_1E228CFC8;
  objc_copyWeak(&v37, &location);
  v6 = v4;
  v36 = v6;
  -[INAppIntentDeliverer setCompletionBlock:](self, "setCompletionBlock:", v35);
  v39 = 0;
  v40 = &v39;
  v41 = 0x2050000000;
  v7 = (void *)getUIIntentForwardingActionClass_softClass;
  v42 = getUIIntentForwardingActionClass_softClass;
  if (!getUIIntentForwardingActionClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getUIIntentForwardingActionClass_block_invoke;
    v45 = &unk_1E22953C0;
    v46 = &v39;
    __getUIIntentForwardingActionClass_block_invoke((uint64_t)buf);
    v7 = (void *)v40[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v39, 8);
  v9 = [v8 alloc];
  intentForwardingAction = self->_intentForwardingAction;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_3;
  v34[3] = &unk_1E228CFF0;
  v34[4] = self;
  v11 = (void *)objc_msgSend(v9, "initWithIntentForwardingAction:responseHandler:", intentForwardingAction, v34);
  -[INAppIntentDeliverer bundleIdentifier](self, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v5, "_intents_backgroundHandlingAssertionForBundleIdentifier:context:error:", v12, 0, &v33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v33;
  -[INAppIntentDeliverer setAuxiliaryAssertion:](self, "setAuxiliaryAssertion:", v13);

  if (v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "responseClass")), "initWithError:", v14);
    -[INAppIntentDeliverer completeWithIntentForwardingActionResponse:](self, "completeWithIntentForwardingActionResponse:", v15);
  }
  else
  {
    INIssueSandboxExtensionsForFileURLEnumerable(v5);
    v16 = objc_alloc(MEMORY[0x1E0C99E08]);
    v43 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v16, "initWithObjectsAndKeys:", v17, *MEMORY[0x1E0D22CE0], 0);

    if (!-[INIntentForwardingAction allowsForegroundAppLaunch](self->_intentForwardingAction, "allowsForegroundAppLaunch")|| objc_msgSend(v5, "_type") != 2|| objc_msgSend(v5, "_type") == 2&& (objc_msgSend(v5, "_codableDescription"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v19 = objc_msgSend(v18, "isForeground"), v18, (v19 & 1) == 0))
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D00]);
      v20 = objc_alloc(MEMORY[0x1E0CA5870]);
      -[INAppIntentDeliverer bundleIdentifier](self, "bundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v22 = (void *)objc_msgSend(v20, "initWithBundleIdentifier:allowPlaceholder:error:", v21, 0, &v32);
      v23 = v32;

      if (v23)
      {
        v24 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[INAppIntentDeliverer _deliverIntentForwardingActionWithResponseHandler:]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v23;
          _os_log_error_impl(&dword_18BEBC000, v24, OS_LOG_TYPE_ERROR, "%s Failed to get application record: %{public}@", buf, 0x16u);
        }
      }
      v25 = (void *)MEMORY[0x1E0CB37E8];
      if (objc_msgSend(v22, "supportsMultiwindow"))
        v26 = -[INIntentForwardingAction allowsScenelessAppLaunch](self->_intentForwardingAction, "allowsScenelessAppLaunch");
      else
        v26 = 0;
      objc_msgSend(v25, "numberWithInt:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0DAB8A8]);

    }
    objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppIntentDeliverer bundleIdentifier](self, "bundleIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_26;
    v31[3] = &unk_1E228D040;
    v31[4] = self;
    objc_msgSend(v28, "openApplication:withOptions:completion:", v30, v29, v31);

  }
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

}

- (void)invalidateIntentDelivery
{
  NSObject *v3;
  _QWORD block[5];

  -[INAppIntentDeliverer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__INAppIntentDeliverer_invalidateIntentDelivery__block_invoke;
  block[3] = &unk_1E2294DE0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)completeWithIntentForwardingActionResponse:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[INAppIntentDeliverer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__INAppIntentDeliverer_completeWithIntentForwardingActionResponse___block_invoke;
  v7[3] = &unk_1E2293C38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (INIntentForwardingAction)intentForwardingAction
{
  return self->_intentForwardingAction;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (INWatchdogTimer)requestTimer
{
  return self->_requestTimer;
}

- (void)setRequestTimer:(id)a3
{
  objc_storeStrong((id *)&self->_requestTimer, a3);
}

- (INIntentBackgroundHandlingAssertion)auxiliaryAssertion
{
  return self->_auxiliaryAssertion;
}

- (void)setAuxiliaryAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryAssertion, 0);
  objc_storeStrong((id *)&self->_requestTimer, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_intentForwardingAction, 0);
}

void __67__INAppIntentDeliverer_completeWithIntentForwardingActionResponse___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
  v2 = v3;
  if (v3)
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40));
    v2 = v3;
  }

}

void __48__INAppIntentDeliverer_invalidateIntentDelivery__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "requestTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

  objc_msgSend(*(id *)(a1 + 32), "setRequestTimer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "auxiliaryAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setAuxiliaryAssertion:", 0);
  objc_msgSend(*(id *)(a1 + 32), "processAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (objc_msgSend(v4, "isValid"))
  {
    v8 = 0;
    v6 = objc_msgSend(v4, "invalidateWithError:", &v8);
    v5 = v8;
    if ((v6 & 1) == 0)
    {
      v7 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "-[INAppIntentDeliverer invalidateIntentDelivery]_block_invoke";
        v11 = 2114;
        v12 = v5;
        _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s Failed to invalidate process assertion: %{public}@", buf, 0x16u);
      }
    }
  }

}

void __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = dispatch_time(0, 2000000000);
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_2;
    block[3] = &unk_1E2294DE0;
    v8 = WeakRetained;
    dispatch_after(v5, v6, block);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeWithIntentForwardingActionResponse:", a2);
}

void __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "intentForwardingAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "responseClass")), "initWithError:", v4);
    objc_msgSend(v5, "completeWithIntentForwardingActionResponse:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "processAssertion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v9 = objc_msgSend(v8, "acquireWithError:", &v16);
    v10 = v16;

    if ((v9 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v11 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_27;
      v15[3] = &unk_1E2294DE0;
      v15[4] = *(_QWORD *)(a1 + 32);
      dispatch_sync(v11, v15);
    }
    else
    {
      v12 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[INAppIntentDeliverer _deliverIntentForwardingActionWithResponseHandler:]_block_invoke";
        v19 = 2114;
        v20 = v10;
        _os_log_error_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_ERROR, "%s Failed to acquire assertion: %{public}@", buf, 0x16u);
      }
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v13, "intentForwardingAction");
      v11 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "responseClass")), "initWithError:", v10);
      objc_msgSend(v13, "completeWithIntentForwardingActionResponse:", v14);

    }
  }

}

void __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_27(uint64_t a1)
{
  double v2;
  double v3;
  INWatchdogTimer *v4;
  void *v5;
  INWatchdogTimer *v6;
  _QWORD v7[6];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "requestTimeout");
  v3 = v2;
  v4 = [INWatchdogTimer alloc];
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_2_29;
  v7[3] = &unk_1E228D018;
  v7[4] = *(_QWORD *)(a1 + 32);
  *(double *)&v7[5] = v3;
  v6 = -[INWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](v4, "initWithTimeoutInterval:onQueue:timeoutHandler:", v5, v7, v3);

  objc_msgSend(*(id *)(a1 + 32), "setRequestTimer:", v6);
  -[INWatchdogTimer start](v6, "start");

}

void __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_2_29(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v2;
    objc_msgSend(v7, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 136315650;
    v12 = "-[INAppIntentDeliverer _deliverIntentForwardingActionWithResponseHandler:]_block_invoke_2";
    v13 = 2114;
    v14 = v9;
    v15 = 2050;
    v16 = v10;
    _os_log_error_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_ERROR, "%s Handle intent request for %{public}@ timed out after %{public}.2f seconds", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 1314, MEMORY[0x1E0C9AA70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "intentForwardingAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "responseClass")), "initWithError:", v3);
  objc_msgSend(v4, "completeWithIntentForwardingActionResponse:", v6);

}

uint64_t __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateIntentDelivery");
}

void __44__INAppIntentDeliverer_deliverIntent_reply___block_invoke(uint64_t a1)
{
  INHandleIntentForwardingAction *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v2 = -[INIntentForwardingAction initWithIntent:]([INHandleIntentForwardingAction alloc], "initWithIntent:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__INAppIntentDeliverer_deliverIntent_reply___block_invoke_2;
  v6[3] = &unk_1E228CFA0;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v5, "_deliverIntentForwardingActionWithResponseHandler:", v6);

}

void __44__INAppIntentDeliverer_deliverIntent_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "intentResponse");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

uint64_t __73__INAppIntentDeliverer_deliverIntentForwardingActionWithResponseHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deliverIntentForwardingActionWithResponseHandler:", *(_QWORD *)(a1 + 40));
}

void __72__INAppIntentDeliverer_initWithBundleIdentifier_intentForwardingAction___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D87DA0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "predicateMatching:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicates:", v6);

  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValues:", 1);
  objc_msgSend(v4, "setStateDescriptor:", v7);

}

@end
