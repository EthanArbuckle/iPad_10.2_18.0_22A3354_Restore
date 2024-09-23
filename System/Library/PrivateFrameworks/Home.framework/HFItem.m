@implementation HFItem

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

- (NSDictionary)latestResults
{
  return self->_latestResults;
}

- (void)setModuleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_moduleIdentifier, a3);
}

- (void)setLoadingState:(unint64_t)a3
{
  self->_loadingState = a3;
}

- (HFItemManager)_debug_owningItemManager
{
  return (HFItemManager *)objc_loadWeakRetained((id *)&self->__debug_owningItemManager);
}

id __28__HFItem_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("HFItem.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subclassOutcome != nil"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("HFItem.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[subclassOutcome isKindOfClass:[HFItemUpdateOutcome class]]"));

  }
  v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(*(id *)(a1 + 32), "_finalOutcomeForSubclassOutcome:previousResults:updateOptions:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLatestResults:", v6);

  if (+[HFUtilities isDetailedSignpostLoggingEnabled](HFUtilities, "isDetailedSignpostLoggingEnabled"))
  {
    HFLogForCategory(0x31uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 64);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 138412290;
      v14 = objc_opt_class();
      _os_signpost_emit_with_name_impl(&dword_1DD34E000, v8, OS_SIGNPOST_INTERVAL_END, v9, "HFItemUpdate", "%@", buf, 0xCu);
    }

  }
  objc_msgSend(v4, "finishWithResult:", v5);

  return v4;
}

- (void)setLatestResults:(id)a3
{
  objc_storeStrong((id *)&self->_latestResults, a3);
}

- (id)updateWithOptions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[6];
  _QWORD v43[5];
  id v44;
  id v45;
  SEL v46;
  os_signpost_id_t v47;
  uint8_t buf[4];
  void *v49;
  os_activity_scope_state_s state;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", HFItemUpdateOptionLogger);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItem cancellableInFlightUpdateFuture](self, "cancellableInFlightUpdateFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HFItem cancellableInFlightUpdateFuture](self, "cancellableInFlightUpdateFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isFinished");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", HFItemUpdateOptionAllowInFlightResults);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      if (v11)
      {
        -[HFItem cancellableInFlightUpdateFuture](self, "cancellableInFlightUpdateFuture");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      if (v6)
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        objc_msgSend(v6, "loggerActivity");
        v13 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v13, &state);

        HFLogForCategory(0x29uLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[HFItem description](self, "description");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v49 = v15;
          _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Asked to update item [%@] with an in-flight update. Cancelling the in-flight update before starting the new update.", buf, 0xCu);

        }
        os_activity_scope_leave(&state);
      }
      else
      {
        HFLogForCategory(0x29uLL);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          -[HFItem description](self, "description");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(state.opaque[0]) = 138412290;
          *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v34;
          _os_log_impl(&dword_1DD34E000, v33, OS_LOG_TYPE_DEFAULT, "Asked to update item [%@] with an in-flight update. Cancelling the in-flight update before starting the new update.", (uint8_t *)&state, 0xCu);

        }
      }
      -[HFItem cancellableInFlightUpdateFuture](self, "cancellableInFlightUpdateFuture");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cancel");

      -[HFItem setCancellableInFlightUpdateFuture:](self, "setCancellableInFlightUpdateFuture:", 0);
    }
  }
  if (+[HFUtilities isDetailedSignpostLoggingEnabled](HFUtilities, "isDetailedSignpostLoggingEnabled"))
  {
    HFLogForCategory(0x31uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_id_generate(v17);

    HFLogForCategory(0x31uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      v21 = objc_opt_class();
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = v21;
      _os_signpost_emit_with_name_impl(&dword_1DD34E000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "HFItemUpdate", "%@", (uint8_t *)&state, 0xCu);
    }

  }
  else
  {
    v18 = 0;
  }
  -[HFItem latestResults](self, "latestResults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");

  -[HFItem _subclass_updateWithOptions:](self, "_subclass_updateWithOptions:", v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __28__HFItem_updateWithOptions___block_invoke;
  v43[3] = &unk_1EA730658;
  v46 = a2;
  v43[4] = self;
  v26 = v23;
  v44 = v26;
  v45 = v5;
  v47 = v18;
  objc_msgSend(v24, "flatMap:", v43);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HFUtilities isDetailedSignpostLoggingEnabled](HFUtilities, "isDetailedSignpostLoggingEnabled"))
  {
    v42[0] = v25;
    v42[1] = 3221225472;
    v42[2] = __28__HFItem_updateWithOptions___block_invoke_27;
    v42[3] = &unk_1EA72C190;
    v42[4] = self;
    v42[5] = v18;
    v27 = (id)objc_msgSend(v12, "addFailureBlock:", v42);
  }
  if (v6)
  {
    objc_initWeak((id *)&state, v6);
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v25;
    v40[1] = 3221225472;
    v40[2] = __28__HFItem_updateWithOptions___block_invoke_30;
    v40[3] = &unk_1EA727A48;
    objc_copyWeak(&v41, (id *)&state);
    v40[4] = self;
    objc_msgSend(v28, "afterDelay:performBlock:", v40, 10.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = v25;
    v36 = 3221225472;
    v37 = __28__HFItem_updateWithOptions___block_invoke_32;
    v38 = &unk_1EA730680;
    v30 = v29;
    v39 = v30;
    v31 = (id)objc_msgSend(v12, "addCompletionBlock:", &v35);

    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)&state);
  }
  -[HFItem setCancellableInFlightUpdateFuture:](self, "setCancellableInFlightUpdateFuture:", v24, v35, v36, v37, v38);

LABEL_21:
  return v12;
}

- (NAFuture)cancellableInFlightUpdateFuture
{
  return (NAFuture *)objc_loadWeakRetained((id *)&self->_cancellableInFlightUpdateFuture);
}

- (void)setCancellableInFlightUpdateFuture:(id)a3
{
  objc_storeWeak((id *)&self->_cancellableInFlightUpdateFuture, a3);
}

- (id)_finalOutcomeForSubclassOutcome:(id)a3 previousResults:(id)a4 updateOptions:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  if (-[HFItem conformsToProtocol:](self, "conformsToProtocol:", &unk_1F03F0850))
  {
    -[HFItem homeKitObject](self, "homeKitObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "addObject:", v8);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("dependentHomeKitObjects"));

    }
  }

  return v7;
}

- (void)set_debug_owningItemManager:(id)a3
{
  objc_storeWeak((id *)&self->__debug_owningItemManager, a3);
}

- (void)set_debug_isChildItem:(BOOL)a3
{
  self->__debug_isChildItem = a3;
}

- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HFItem latestResults](self, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isInStateTransition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "BOOLValue"))
    a3 |= 2uLL;

  return a3;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[HFItem latestResults](self, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  v6 = CFSTR("NotSet");
  if (v5 == 1)
    v6 = CFSTR("Normal");
  if (v5 == 2)
    v7 = CFSTR("Abnormal");
  else
    v7 = v6;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItem latestResults](self, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("title"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p> \"%@\" state:%@"), v10, self, v12, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFItem latestResults](self, "latestResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("description"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p> \"%@\" state:%@"), v10, self, v16, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (unint64_t)loadingState
{
  return self->_loadingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);
  objc_destroyWeak((id *)&self->__debug_owningItemManager);
  objc_destroyWeak((id *)&self->_cancellableInFlightUpdateFuture);
  objc_storeStrong((id *)&self->_latestResults, 0);
}

- (void)copyLatestResultsFromItem:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  SEL v13;

  v10 = a3;
  -[HFItem latestResults](self, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    NSLog(CFSTR("%@ already has results!"), self);
  if ((objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    NSLog(CFSTR("Mismatched items %@ and %@!"), self, v10);
  objc_msgSend(v10, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("childItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __36__HFItem_copyLatestResultsFromItem___block_invoke;
    v11[3] = &unk_1EA7306A8;
    v13 = a2;
    v11[4] = self;
    v12 = v10;
    objc_msgSend(v8, "na_map:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("childItems"));

  }
  -[HFItem setLatestResults:](self, "setLatestResults:", v7);

}

- (BOOL)_debug_isChildItem
{
  return self->__debug_isChildItem;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItem latestResults](self, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __28__HFItem_updateWithOptions___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x31uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 138412546;
    v8 = objc_opt_class();
    v9 = 2112;
    v10 = v3;
    _os_signpost_emit_with_name_impl(&dword_1DD34E000, v5, OS_SIGNPOST_INTERVAL_END, v6, "HFItemUpdate", "%@ -error: %@", (uint8_t *)&v7, 0x16u);
  }

}

void __28__HFItem_updateWithOptions___block_invoke_30(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  os_activity_scope_state_s state;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(WeakRetained, "loggerActivity");
    v4 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v4, &state);

    HFLogForCategory(0x29uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Update for item has taken more than 10 seconds: %@", (uint8_t *)&v9, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x29uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = v8;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Update for item has taken more than 10 seconds: %@", (uint8_t *)&state, 0xCu);
    }

  }
}

uint64_t __28__HFItem_updateWithOptions___block_invoke_32(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

id __36__HFItem_copyLatestResultsFromItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a2;
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1F03F0C00) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, CFSTR("HFItem.m"), 137, CFSTR("Found a child item that does not conform to NSCopying. Child items must be copyable! Child: %@, parent: %@"), v9, v10);

  }
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItem.m"), 155, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFItem _subclass_updateWithOptions:]", objc_opt_class());

  v6 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "futureWithError:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)resultsContainRequiredProperties:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[HFItem latestResults](self, "latestResults", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

@end
