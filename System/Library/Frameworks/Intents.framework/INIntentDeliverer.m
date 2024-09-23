@implementation INIntentDeliverer

- (INIntentDeliverer)initWithQueue:(id)a3 auditToken:(id *)a4
{
  id v7;
  INIntentDeliverer *v8;
  INIntentDeliverer *v9;
  __int128 v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INIntentDeliverer;
  v8 = -[INIntentDeliverer init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v10 = *(_OWORD *)a4->var0;
    *(_OWORD *)&v9->_auditToken.val[4] = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v9->_auditToken.val = v10;
  }

  return v9;
}

- (void)getIntentParameterOptions:(id)a3 forIntent:(id)a4 searchTerm:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  if (a6)
  {
    v10 = a5;
    v11 = a4;
    v12 = a3;
    -[INIntentDeliverer _processOptionsForIntent:parameterNamed:completionHandler:](self, "_processOptionsForIntent:parameterNamed:completionHandler:", v11, v12, a6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[INIntentDeliverer getParameterOptionsForParameterNamed:intent:searchTerm:completionBlock:](self, "getParameterOptionsForParameterNamed:intent:searchTerm:completionBlock:", v12, v11, v10, v13);

  }
}

- (void)getIntentParameterDefaultValue:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __78__INIntentDeliverer_getIntentParameterDefaultValue_forIntent_completionBlock___block_invoke;
    v13[3] = &unk_1E2291E60;
    v13[4] = self;
    v14 = v8;
    v15 = v9;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __78__INIntentDeliverer_getIntentParameterDefaultValue_forIntent_completionBlock___block_invoke_74;
    v11[3] = &unk_1E2291E88;
    v12 = v15;
    -[INIntentDeliverer _invokeIntentHandlerMethodForIntent:intentHandler:parameterNamed:keyForSelectors:executionHandler:unimplementedHandler:](self, "_invokeIntentHandlerMethodForIntent:intentHandler:parameterNamed:keyForSelectors:executionHandler:unimplementedHandler:", a4, 0, v14, CFSTR("defaultValueSelectorStrings"), v13, v11);

  }
}

- (void)resolveIntentParameters:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id obj;
  NSObject *queue;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD block[6];
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[3];
  char v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v19 = a4;
  v8 = a5;
  if (v8)
  {
    v18 = v8;
    INTypedIntentWithIntent(v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v17 = objc_claimAutoreleasedReturnValue();
    queue = dispatch_queue_create("INCExtensionContextBatchSlotResolutionQueue", v17);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v40 = 1;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__92410;
    v37[4] = __Block_byref_object_dispose__92411;
    v38 = 0;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v20;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v34;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v13);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __71__INIntentDeliverer_resolveIntentParameters_forIntent_completionBlock___block_invoke;
          block[3] = &unk_1E2291ED8;
          v31 = v39;
          block[4] = self;
          block[5] = v14;
          v29 = v9;
          v32 = v37;
          v30 = v10;
          dispatch_async(queue, block);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16, v17);
      }
      while (v11);
    }

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__INIntentDeliverer_resolveIntentParameters_forIntent_completionBlock___block_invoke_3;
    v23[3] = &unk_1E2291F00;
    v24 = v9;
    v25 = v10;
    v26 = v18;
    v27 = v39;
    v15 = v10;
    v16 = v9;
    dispatch_async(queue, v23);

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(v39, 8);

    v8 = v18;
  }

}

- (void)resolveIntentParameter:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = a3;
    INTypedIntentWithIntent(v8);
    v11 = objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__INIntentDeliverer_resolveIntentParameter_forIntent_completionBlock___block_invoke;
    v12[3] = &unk_1E2291F28;
    v13 = v9;
    -[INIntentDeliverer _resolveIntentParameter:forIntent:intentHandler:updateIntent:withCompletion:](self, "_resolveIntentParameter:forIntent:intentHandler:updateIntent:withCompletion:", v10, v11, 0, 0, v12);

    v8 = (id)v11;
  }

}

- (void)confirmIntent:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  INIntentDeliverer *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __50__INIntentDeliverer_confirmIntent_withCompletion___block_invoke;
    v20[3] = &unk_1E2293C78;
    v21 = v7;
    v10 = (void *)MEMORY[0x18D7812C4](v20);
    INTypedIntentWithIntent(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      objc_msgSend(v11, "typeName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v23 = "-[INIntentDeliverer confirmIntent:withCompletion:]";
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_INFO, "%s confirmIntent %@", buf, 0x16u);

    }
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __50__INIntentDeliverer_confirmIntent_withCompletion___block_invoke_82;
    v16[3] = &unk_1E2291F58;
    v6 = v11;
    v18 = self;
    v19 = v10;
    v17 = v6;
    v15 = v10;
    -[INIntentDeliverer _deliverIntent:withBlock:](self, "_deliverIntent:withBlock:", v6, v16);

  }
}

- (void)handleIntent:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  INIntentDeliverer *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __49__INIntentDeliverer_handleIntent_withCompletion___block_invoke;
    v20[3] = &unk_1E2293C78;
    v21 = v7;
    v10 = (void *)MEMORY[0x18D7812C4](v20);
    INTypedIntentWithIntent(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      objc_msgSend(v11, "typeName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v23 = "-[INIntentDeliverer handleIntent:withCompletion:]";
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_INFO, "%s handleIntent %@", buf, 0x16u);

    }
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __49__INIntentDeliverer_handleIntent_withCompletion___block_invoke_85;
    v16[3] = &unk_1E2291F58;
    v6 = v11;
    v18 = self;
    v19 = v10;
    v17 = v6;
    v15 = v10;
    -[INIntentDeliverer _deliverIntent:withBlock:](self, "_deliverIntent:withBlock:", v6, v16);

  }
}

- (void)startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__INIntentDeliverer_startSendingUpdatesForIntent_toObserver_completionHandler___block_invoke;
  block[3] = &unk_1E2291F80;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v11;
  v21 = v10;
  v13 = v10;
  v14 = v11;
  v15 = v9;
  v16 = v8;
  dispatch_async(queue, block);

}

- (void)stopSendingUpdatesForIntent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__INIntentDeliverer_stopSendingUpdatesForIntent_completionHandler___block_invoke;
  v13[3] = &unk_1E2291FA8;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_async(queue, v13);

}

- (void)getParameterOptionsForParameterNamed:(id)a3 intent:(id)a4 searchTerm:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v10 = a5;
  v11 = a6;
  if (v11)
  {
    v12 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __92__INIntentDeliverer_getParameterOptionsForParameterNamed_intent_searchTerm_completionBlock___block_invoke;
    v15[3] = &unk_1E2291FF8;
    v16 = v10;
    v17 = v11;
    v13[0] = v12;
    v13[1] = 3221225472;
    v13[2] = __92__INIntentDeliverer_getParameterOptionsForParameterNamed_intent_searchTerm_completionBlock___block_invoke_2;
    v13[3] = &unk_1E2291E88;
    v14 = v17;
    -[INIntentDeliverer _invokeIntentHandlerMethodForIntent:intentHandler:parameterNamed:keyForSelectors:executionHandler:unimplementedHandler:](self, "_invokeIntentHandlerMethodForIntent:intentHandler:parameterNamed:keyForSelectors:executionHandler:unimplementedHandler:", a4, 0, a3, CFSTR("provideOptionsSelectorStrings"), v15, v13);

  }
}

- (void)getSupportsParameterOptionsForParameterNamed:(id)a3 intent:(id)a4 completionHandler:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__INIntentDeliverer_getSupportsParameterOptionsForParameterNamed_intent_completionHandler___block_invoke;
  v13[3] = &unk_1E2292020;
  v14 = v8;
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __91__INIntentDeliverer_getSupportsParameterOptionsForParameterNamed_intent_completionHandler___block_invoke_2;
  v11[3] = &unk_1E2291E88;
  v12 = v14;
  v10 = v14;
  -[INIntentDeliverer _invokeIntentHandlerMethodForIntent:intentHandler:parameterNamed:keyForSelectors:executionHandler:unimplementedHandler:](self, "_invokeIntentHandlerMethodForIntent:intentHandler:parameterNamed:keyForSelectors:executionHandler:unimplementedHandler:", a4, 0, a3, CFSTR("provideOptionsSelectorStrings"), v13, v11);

}

- (void)_resolveIntentParameter:(id)a3 forIntent:(id)a4 intentHandler:(id)a5 updateIntent:(BOOL)a6 withCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  INExtensionContextSlotResolutionResult *v30;
  void *v31;
  INExtensionContextSlotResolutionResult *v32;
  INExtensionContextSlotResolutionResult *v33;
  void *v34;
  INExtensionContextSlotResolutionResult *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  INIntentDeliverer *v44;
  id v45;
  BOOL v46;
  _QWORD v47[4];
  id v48;
  INIntentDeliverer *v49;
  id v50;
  BOOL v51;
  id v52[2];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v15)
  {
    if (objc_msgSend(v13, "_type") != 2)
    {
LABEL_22:
      v36 = MEMORY[0x1E0C809B0];
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke;
      v47[3] = &unk_1E2292070;
      v50 = v15;
      v48 = v13;
      v49 = self;
      v51 = a6;
      v41[0] = v36;
      v41[1] = 3221225472;
      v41[2] = __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_2;
      v41[3] = &unk_1E22920C0;
      v42 = v12;
      v43 = v48;
      v44 = self;
      v45 = v50;
      v46 = a6;
      -[INIntentDeliverer _invokeIntentHandlerMethodForIntent:intentHandler:parameterNamed:keyForSelectors:executionHandler:unimplementedHandler:](self, "_invokeIntentHandlerMethodForIntent:intentHandler:parameterNamed:keyForSelectors:executionHandler:unimplementedHandler:", v43, v14, v42, CFSTR("resolveSelectorStrings"), v47, v41);

      v17 = v50;
      goto LABEL_23;
    }
    objc_msgSend(v13, "_codableDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributeByName:", v12);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v17, "supportsResolution"))
    {
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v17, "relationship");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "parentCodableAttribute");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 && v19)
    {
      objc_msgSend(v17, "relationship");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "relation");

      if (v21)
      {
        objc_msgSend(v19, "propertyName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "valueForKey:", v22);
        v23 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "relationship");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)v23;
        LOBYTE(v23) = objc_msgSend(v24, "compareValue:", v23);

        if ((v23 & 1) == 0)
        {
          v33 = [INExtensionContextSlotResolutionResult alloc];
          +[INIntentResolutionResult _dataForResolutionMethodUnimplemented](INIntentResolutionResult, "_dataForResolutionMethodUnimplemented");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[INExtensionContextSlotResolutionResult initWithResult:data:](v33, "initWithResult:data:", 2, v34);
          (*((void (**)(id, INExtensionContextSlotResolutionResult *, _QWORD))v15 + 2))(v15, v35, 0);

          goto LABEL_17;
        }

      }
    }
    else if (!v17)
    {
LABEL_20:

      goto LABEL_21;
    }
    if ((objc_msgSend(v17, "supportsDynamicEnumeration") & 1) == 0 && objc_msgSend(v17, "modifier"))
    {
      v52[0] = 0;
      v25 = objc_msgSend(v13, "_isValueValidForKey:unsupportedReason:", v12, v52);
      v26 = v52[0];
      v27 = v26;
      if ((v25 & 1) == 0 && v26)
      {
        objc_msgSend(v13, "_intentInstanceDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v40 = v28;
          objc_msgSend(v28, "slotByName:", v12);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "unsupportedReasons");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[INIntentResolutionResult unsupportedWithReason:](INIntentResolutionResult, "unsupportedWithReason:", objc_msgSend(v38, "indexOfObject:", v27) + 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = [INExtensionContextSlotResolutionResult alloc];
          objc_msgSend(v29, "_dataForIntentSlotDescription:", v37);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[INExtensionContextSlotResolutionResult initWithResult:data:](v30, "initWithResult:data:", 1, v31);
          (*((void (**)(id, INExtensionContextSlotResolutionResult *, _QWORD))v15 + 2))(v15, v32, 0);

LABEL_17:
LABEL_23:

          goto LABEL_24;
        }

      }
    }
    goto LABEL_20;
  }
LABEL_24:

}

- (void)_invokeIntentHandlerMethodForIntent:(id)a3 intentHandler:(id)a4 parameterNamed:(id)a5 keyForSelectors:(id)a6 executionHandler:(id)a7 unimplementedHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  INTypedIntentWithIntent(a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v21 = v20;
    objc_msgSend(v19, "typeName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v37 = "-[INIntentDeliverer _invokeIntentHandlerMethodForIntent:intentHandler:parameterNamed:keyForSelectors:execution"
          "Handler:unimplementedHandler:]";
    v38 = 2112;
    v39 = v22;
    _os_log_impl(&dword_18BEBC000, v21, OS_LOG_TYPE_INFO, "%s _invokeIntentHandlerMethodForIntent %@", buf, 0x16u);

  }
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __140__INIntentDeliverer__invokeIntentHandlerMethodForIntent_intentHandler_parameterNamed_keyForSelectors_executionHandler_unimplementedHandler___block_invoke;
  v30[3] = &unk_1E2292110;
  v34 = v17;
  v23 = v19;
  v31 = v23;
  v32 = v15;
  v33 = v16;
  v35 = v18;
  v24 = v18;
  v25 = v16;
  v26 = v15;
  v27 = v17;
  v28 = MEMORY[0x18D7812C4](v30);
  v29 = (void *)v28;
  if (v14)
    (*(void (**)(uint64_t, id))(v28 + 16))(v28, v14);
  else
    -[INIntentDeliverer _deliverIntent:withBlock:](self, "_deliverIntent:withBlock:", v23, v28);

}

- (id)_processIntentResponseCompletionHandlerWithIntent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[3];
  char v17;

  v6 = a3;
  v7 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__INIntentDeliverer__processIntentResponseCompletionHandlerWithIntent_completion___block_invoke;
  v12[3] = &unk_1E2292138;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = v16;
  v8 = v7;
  v9 = v6;
  v10 = (void *)MEMORY[0x18D7812C4](v12);

  _Block_object_dispose(v16, 8);
  return v10;
}

- (id)_processResolutionDataProviderForIntent:(id)a3 intentSlotDescription:(id)a4 updateIntent:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  INIntentDeliverer *v21;
  id v22;
  _QWORD *v23;
  BOOL v24;
  _QWORD v25[3];
  char v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __107__INIntentDeliverer__processResolutionDataProviderForIntent_intentSlotDescription_updateIntent_completion___block_invoke;
  v18[3] = &unk_1E2292160;
  v22 = v12;
  v23 = v25;
  v19 = v10;
  v20 = v11;
  v24 = a5;
  v21 = self;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = (void *)MEMORY[0x18D7812C4](v18);

  _Block_object_dispose(v25, 8);
  return v16;
}

- (id)_processOptionsForIntent:(id)a3 parameterNamed:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__INIntentDeliverer__processOptionsForIntent_parameterNamed_completionHandler___block_invoke;
  v15[3] = &unk_1E2292188;
  v18 = v9;
  v19 = v20;
  v16 = v7;
  v17 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v9;
  v13 = (void *)MEMORY[0x18D7812C4](v15);

  _Block_object_dispose(v20, 8);
  return v13;
}

- (void)_processDefaultValue:(id)a3 forIntent:(id)a4 parameterNamed:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  Class v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  NSString *v23;
  INJSONEncoder *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void (**v59)(_QWORD, _QWORD, _QWORD);
  void *v60;
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
  if (v9)
  {
    objc_msgSend(v10, "_intentInstanceDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "slotByName:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = v15;
    objc_msgSend(v15, "codableAttribute");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(v10, "_codableDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "attributeByName:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v18 = (Class)objc_msgSend(v16, "objectClass");
    v19 = v16;
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    v21 = v20;

    if (v18 == (Class)objc_opt_class() && v21)
    {
      objc_msgSend(v21, "codableDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "className");
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      v18 = NSClassFromString(v23);

    }
    v60 = v21;
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_INExtensionContextErrorDomain"), 1000, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v46);

      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Undefined parameter class"), 0);
      v47 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v47);
    }
    v24 = objc_alloc_init(INJSONEncoder);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = v11;
      v57 = v10;
      v59 = v13;
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v58 = v9;
      v26 = v9;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v64 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
            if ((objc_msgSend(v31, "isMemberOfClass:", v18) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_INExtensionContextErrorDomain"), 1001, 0);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, _QWORD, void *))v59)[2](v59, 0, v38);

              v39 = (void *)MEMORY[0x1E0C99DA0];
              v40 = *MEMORY[0x1E0C99768];
              v41 = (void *)MEMORY[0x1E0CB3940];
              v42 = (objc_class *)objc_opt_class();
              NSStringFromClass(v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "stringWithFormat:", CFSTR("Unexpected class %@"), v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "exceptionWithName:reason:userInfo:", v40, v44, 0);
              v45 = (id)objc_claimAutoreleasedReturnValue();

              objc_exception_throw(v45);
            }
            INObjectWithTypedObject(v31, v19);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              -[INJSONEncoder encodeObject:withCodableAttribute:](v24, "encodeObject:withCodableAttribute:", v32, v19);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "if_addObjectIfNonNil:", v33);

            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
        }
        while (v28);
      }

      v10 = v57;
      if (objc_msgSend(v25, "count"))
        v34 = (void *)objc_msgSend(v25, "copy");
      else
        v34 = 0;
      v13 = v59;

      v9 = v58;
      v11 = v56;
      if (!v34)
      {
LABEL_32:
        v13[2](v13, 0, 0);
        goto LABEL_33;
      }
    }
    else
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_INExtensionContextErrorDomain"), 1001, 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v48);

        v49 = (void *)MEMORY[0x1E0C99DA0];
        v50 = *MEMORY[0x1E0C99768];
        v51 = (void *)MEMORY[0x1E0CB3940];
        v52 = (objc_class *)objc_opt_class();
        NSStringFromClass(v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "stringWithFormat:", CFSTR("Unexpected class %@"), v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "exceptionWithName:reason:userInfo:", v50, v54, 0);
        v55 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v55);
      }
      INObjectWithTypedObject(v9, v19);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[INJSONEncoder encodeObject:withCodableAttribute:](v24, "encodeObject:withCodableAttribute:", v35, v19);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
        goto LABEL_32;
    }
    v62 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v34, 1, &v62);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v62;
    ((void (**)(_QWORD, void *, id))v13)[2](v13, v36, v37);

LABEL_33:
    goto LABEL_34;
  }
  (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
LABEL_34:

}

- (BOOL)_updateIntent:(id)a3 intentSlotDescription:(id)a4 resolutionResultDataProvider:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v7 && v8 && v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v10;
        v25 = objc_msgSend(v24, "resolutionResultCode");
        if ((unint64_t)(v25 - 1) >= 4 && v25 != 6)
        {
          if (v25)
          {
            v26 = 0;
          }
          else
          {
            objc_msgSend(v24, "resolvedValue");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }

LABEL_48:
          objc_msgSend(v8, "facadePropertyName", (_QWORD)v42);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v7, "_intents_setterForPropertyWithName:", v34);

          if (v35)
          {
            if (v26 || !objc_msgSend(v8, "isEnum"))
            {
              objc_msgSend(v8, "facadePropertyName");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setValue:forKey:", v26, v37);

            }
            else
            {
              objc_msgSend(v8, "facadePropertyName");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setValue:forKey:", &unk_1E23E9EF8, v36);

              v26 = 0;
            }
            v11 = 1;
            goto LABEL_57;
          }
          v38 = (void *)INSiriLogContextIntents;
          if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
          {
            v40 = v38;
            objc_msgSend(v8, "facadePropertyName");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v47 = "-[INIntentDeliverer _updateIntent:intentSlotDescription:resolutionResultDataProvider:]";
            v48 = 2114;
            v49 = v41;
            _os_log_error_impl(&dword_18BEBC000, v40, OS_LOG_TYPE_ERROR, "%s Setter for property %{public}@ is not defined or invalid", buf, 0x16u);

          }
LABEL_56:
          v11 = 0;
LABEL_57:

          goto LABEL_58;
        }

      }
      v26 = 0;
      goto LABEL_56;
    }
    v12 = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v43 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v20 = objc_msgSend(v19, "resolutionResultCode", (_QWORD)v42);
          if (v20)
          {
            if ((unint64_t)(v20 - 1) < 4 || v20 == 6)
            {
              v27 = 1;
              goto LABEL_27;
            }
          }
          else
          {
            objc_msgSend(v19, "resolvedValue");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v19, "resolvedValue");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v23);

            }
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        v27 = 0;
      }
      while (v16);
    }
    else
    {
      v27 = 0;
    }
LABEL_27:

    objc_msgSend(v8, "facadePropertyName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "_isValidKey:", v28) & 1) != 0)
    {
      objc_msgSend(v8, "facadePropertyName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForKey:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = v30;
      if (v31)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v32 = v31;
        else
          v32 = 0;
LABEL_34:
        v33 = v32;

        if ((v27 & 1) != 0)
        {
LABEL_35:
          v26 = 0;
          goto LABEL_38;
        }
        if (objc_msgSend(v13, "count"))
        {
          v26 = (void *)objc_msgSend(v13, "copy");
        }
        else
        {
          if (!v33 || objc_msgSend(v33, "count"))
            goto LABEL_35;
          v26 = (void *)MEMORY[0x1E0C9AA60];
        }
LABEL_38:

        if ((v27 & 1) != 0)
          goto LABEL_56;
        goto LABEL_48;
      }
    }
    else
    {

      v31 = 0;
    }
    v32 = 0;
    goto LABEL_34;
  }
LABEL_58:

  return v11;
}

- (void)_processIntent:(id)a3 intentResponse:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  INIntentDeliverer *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    objc_msgSend(v9, "_intents_prepareResponse");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__INIntentDeliverer__processIntent_intentResponse_completion___block_invoke_2;
    v11[3] = &unk_1E2292210;
    v12 = v9;
    v13 = v8;
    v14 = self;
    v15 = v10;
    INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler(v12, 0x21u, 1, 0, &__block_literal_global_92340, v11, 180.0, 180.0);

  }
}

- (void)_deliverIntent:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__INIntentDeliverer__deliverIntent_withBlock___block_invoke;
    block[3] = &unk_1E2292238;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(queue, block);

  }
}

- (void)_startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4 fromConnection:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  INIntentDeliverer *v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v11)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __95__INIntentDeliverer__startSendingUpdatesForIntent_toObserver_fromConnection_completionHandler___block_invoke;
    v15[3] = &unk_1E2292260;
    v16 = v10;
    v17 = v12;
    v18 = self;
    v19 = v11;
    v20 = v14;
    -[INIntentDeliverer _deliverIntent:withBlock:](self, "_deliverIntent:withBlock:", v16, v15);

  }
  else if (v13)
  {
    (*((void (**)(id))v13 + 2))(v13);
  }

}

- (void)_stopSendingUpdatesForIntent:(id)a3 fromConnection:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  INIntentDeliverer *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__INIntentDeliverer__stopSendingUpdatesForIntent_fromConnection_completionHandler___block_invoke;
  v14[3] = &unk_1E2292288;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[INIntentDeliverer _deliverIntent:withBlock:](self, "_deliverIntent:withBlock:", v13, v14);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (INIntentDeliveringDelegate)delegate
{
  return (INIntentDeliveringDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (INExtensionContextIntentResponseObserver)getRideStatusObserver
{
  return self->_getRideStatusObserver;
}

- (void)setGetRideStatusObserver:(id)a3
{
  objc_storeStrong((id *)&self->_getRideStatusObserver, a3);
}

- (INExtensionContextIntentResponseObserver)getCarPowerLevelObserver
{
  return self->_getCarPowerLevelObserver;
}

- (void)setGetCarPowerLevelObserver:(id)a3
{
  objc_storeStrong((id *)&self->_getCarPowerLevelObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getCarPowerLevelObserver, 0);
  objc_storeStrong((id *)&self->_getRideStatusObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __83__INIntentDeliverer__stopSendingUpdatesForIntent_fromConnection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "getRideStatusObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObserver:forConnection:", 0, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "getRideStatusObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObservers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      objc_msgSend(v12, "stopSendingUpdatesForGetRideStatus:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "setGetRideStatusObserver:", 0);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "getCarPowerLevelObserver");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObserver:forConnection:", 0, *(_QWORD *)(a1 + 48));

      objc_msgSend(*(id *)(a1 + 40), "getCarPowerLevelObserver");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remoteObservers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (!v10)
      {
        objc_msgSend(v12, "stopSendingUpdatesForGetCarPowerLevelStatus:", *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 40), "setGetCarPowerLevelObserver:", 0);
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "stopSendingUpdatesForIntent:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    }
  }
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(void))(v11 + 16))();

}

void __95__INIntentDeliverer__startSendingUpdatesForIntent_toObserver_fromConnection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  INExtensionContextIntentResponseObserver *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  INExtensionContextIntentResponseObserver *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "getRideStatusObserver");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = *(void **)(a1 + 48);
      if (v4)
      {
        objc_msgSend(*(id *)(a1 + 48), "getRideStatusObserver");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v9 = v6;
        objc_msgSend(v6, "setObserver:forConnection:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

        goto LABEL_22;
      }
      v13 = objc_alloc_init(INExtensionContextIntentResponseObserver);
      objc_msgSend(v5, "setGetRideStatusObserver:", v13);

      objc_msgSend(*(id *)(a1 + 48), "getRideStatusObserver");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObserver:forConnection:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

      v15 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "getRideStatusObserver");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "startSendingUpdatesForGetRideStatus:toObserver:", v15, v16);
LABEL_21:

      goto LABEL_22;
    }
    v11 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
      goto LABEL_22;
    v21 = 136315138;
    v22 = "-[INIntentDeliverer _startSendingUpdatesForIntent:toObserver:fromConnection:completionHandler:]_block_invoke";
    v12 = "%s Attemping to start getting ride status update without the caller connection. Request is ignored.";
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "getCarPowerLevelObserver");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = *(void **)(a1 + 48);
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 48), "getCarPowerLevelObserver");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      v17 = objc_alloc_init(INExtensionContextIntentResponseObserver);
      objc_msgSend(v8, "setGetCarPowerLevelObserver:", v17);

      objc_msgSend(*(id *)(a1 + 48), "getCarPowerLevelObserver");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObserver:forConnection:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

      v19 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "getCarPowerLevelObserver");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "startSendingUpdatesForGetCarPowerLevelStatus:toObserver:", v19, v16);
      goto LABEL_21;
    }
    v11 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
      goto LABEL_22;
    v21 = 136315138;
    v22 = "-[INIntentDeliverer _startSendingUpdatesForIntent:toObserver:fromConnection:completionHandler:]_block_invoke";
    v12 = "%s Attemping to start getting car battery level update without the caller connection. Request is ignored.";
LABEL_18:
    _os_log_fault_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_FAULT, v12, (uint8_t *)&v21, 0xCu);
    goto LABEL_22;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "startSendingUpdatesForIntent:toObserver:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
LABEL_22:
  v20 = *(_QWORD *)(a1 + 64);
  if (v20)
    (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, v10);

}

void __46__INIntentDeliverer__deliverIntent_withBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentDeliverer:deliverIntent:withBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __62__INIntentDeliverer__processIntent_intentResponse_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  __int128 v43;
  __int128 v44;
  __int128 v45[2];
  _BYTE v46[128];
  uint8_t buf[40];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v31 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[INIntentDeliverer _processIntent:intentResponse:completion:]_block_invoke_2";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v31;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v6;
      _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s Error injecting image proxies into intent response %@: %@", buf, 0x20u);
    }
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = v5;
  if ((isKindOfClass & 1) == 0)
    v9 = *(void **)(a1 + 32);
  v10 = v9;
  memset(buf, 0, 32);
  objc_msgSend(*(id *)(a1 + 40), "_metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "auditTokenData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v5;
  v32 = a1;
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "_metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "auditTokenData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      objc_msgSend(v14, "if_auditToken");
    else
      memset(buf, 0, 32);

  }
  else
  {
    v16 = *(void **)(a1 + 48);
    if (v16)
      objc_msgSend(v16, "auditToken");
    else
      memset(buf, 0, 32);
  }
  v33 = v6;

  v45[0] = *(_OWORD *)buf;
  v45[1] = *(_OWORD *)&buf[16];
  INIssueSandboxExtensionsForFileURLEnumerableToProcess(v10, v45);
  v17 = objc_opt_class();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __62__INIntentDeliverer__processIntent_intentResponse_completion___block_invoke_128;
  v42[3] = &__block_descriptor_64_e15_B16__0__NSURL_8l;
  v43 = *(_OWORD *)buf;
  v44 = *(_OWORD *)&buf[16];
  objc_msgSend(v10, "_intents_enumerateObjectsOfClass:withBlock:", v17, v42);
  +[INCache sharedCache](INCache, "sharedCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v10, "_intents_cacheableObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v39 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v25, "cacheIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "cacheableObjectForIdentifier:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
          v28 = v27;
        else
          v28 = v25;
        objc_msgSend(v19, "addObject:", v28);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v22);
  }

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __62__INIntentDeliverer__processIntent_intentResponse_completion___block_invoke_2_131;
  v35[3] = &unk_1E2293C10;
  v29 = *(id *)(v32 + 56);
  v36 = v10;
  v37 = v29;
  v30 = v10;
  +[INSerializedCacheItem serializeCacheableObjects:completion:](INSerializedCacheItem, "serializeCacheableObjects:completion:", v19, v35);

}

uint64_t __62__INIntentDeliverer__processIntent_intentResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB34D0];
  v3 = a2;
  objc_msgSend(v2, "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setBundleIdentifier:", v5);

  return 1;
}

uint64_t __62__INIntentDeliverer__processIntent_intentResponse_completion___block_invoke_128(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  _OWORD v7[2];

  v3 = a2;
  v4 = objc_msgSend(v3, "isFileURL");
  if ((_DWORD)v4)
  {
    v5 = *(_OWORD *)(a1 + 48);
    v7[0] = *(_OWORD *)(a1 + 32);
    v7[1] = v5;
    INFileURLSetAssociatedAuditToken(v3, v7);
  }

  return v4;
}

void __62__INIntentDeliverer__processIntent_intentResponse_completion___block_invoke_2_131(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v10 = 136315394;
    v11 = "-[INIntentDeliverer _processIntent:intentResponse:completion:]_block_invoke_2";
    v12 = 2048;
    v13 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_INFO, "%s Sending %tu serialized cache items.", (uint8_t *)&v10, 0x16u);

  }
  v8 = a1 + 32;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v8 + 8);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD, void *, _QWORD))(v7 + 16))(v7, v6, 0, v9, 0);

}

void __79__INIntentDeliverer__processOptionsForIntent_parameterNamed_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void (*v10)(void);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  Class v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSString *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v46 = "-[INIntentDeliverer _processOptionsForIntent:parameterNamed:completionHandler:]_block_invoke";
    v47 = 2112;
    v48 = v5;
    v49 = 2112;
    v50 = v6;
    _os_log_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_INFO, "%s Completion handler called with objectCollection: %@, error: %@", buf, 0x20u);
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v28 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0C99768];
    v30 = CFSTR("This completion handler should be called only once");
    goto LABEL_27;
  }
  if (!v6)
  {
    if (!v5)
    {
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      goto LABEL_16;
    }
    objc_msgSend(*(id *)(a1 + 32), "_intentInstanceDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "slotByName:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "codableAttribute");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "_codableDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "attributeByName:", *(_QWORD *)(a1 + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v15 = (Class)objc_msgSend(v13, "objectClass");
    v16 = v13;
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v21 = v17;

    if (v15 == (Class)objc_opt_class() && v21)
    {
      objc_msgSend(v21, "codableDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "className");
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = NSClassFromString(v23);

    }
    if (v15)
    {
      v42 = 0;
      objc_msgSend(v5, "_untypedObjectCollectionWithItemClass:codableAttribute:error:", v15, v16, &v42);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v42;
      if (!v24)
      {
        v34 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_INExtensionContextErrorDomain"), 1001, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v34 + 16))(v34, 0, v35);

        v36 = (void *)MEMORY[0x1E0C99DA0];
        v37 = *MEMORY[0x1E0C99768];
        objc_msgSend(v25, "userInfo");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "exceptionWithName:reason:userInfo:", v37, v39, 0);
        v40 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v40);
      }
      v41 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v24, 1, &v41);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v41;
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

      goto LABEL_24;
    }
    v31 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_INExtensionContextErrorDomain"), 1000, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v31 + 16))(v31, 0, v32);

    v28 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0C99768];
    v30 = CFSTR("Undefined parameter class");
LABEL_27:
    objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, v30, 0);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v33);
  }
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("_INExtensionContextErrorDomain"));

  if (v9)
  {
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_16:
    v10();
    goto LABEL_24;
  }
  v18 = (void *)MEMORY[0x1E0CB35C8];
  v43 = *MEMORY[0x1E0CB3388];
  v44 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("_INExtensionContextErrorDomain"), 1004, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_24:

}

void __107__INIntentDeliverer__processResolutionDataProviderForIntent_intentSlotDescription_updateIntent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  INExtensionContextSlotResolutionResult *v13;
  id v14;
  _QWORD v15[4];
  INExtensionContextSlotResolutionResult *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[INIntentDeliverer _processResolutionDataProviderForIntent:intentSlotDescription:updateIntent:completion:]_block_invoke";
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_INFO, "%s Completion handler called with %@", buf, 0x16u);
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This completion handler should be called only once"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __107__INIntentDeliverer__processResolutionDataProviderForIntent_intentSlotDescription_updateIntent_completion___block_invoke_110;
    v15[3] = &unk_1E2292160;
    v16 = v5;
    v8 = *(id *)(a1 + 40);
    v21 = *(_BYTE *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(void **)(a1 + 56);
    v17 = v8;
    v18 = v9;
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 64);
    v19 = v11;
    v20 = v12;
    objc_msgSend(v3, "transformResolutionResultForIntent:intentSlotDescription:withOptionsProvider:completion:", v16, v6, v7, v15);

    v13 = v16;
  }
  else
  {
    v13 = -[INExtensionContextSlotResolutionResult initWithResult:data:]([INExtensionContextSlotResolutionResult alloc], "initWithResult:data:", 1, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }

}

void __107__INIntentDeliverer__processResolutionDataProviderForIntent_intentSlotDescription_updateIntent_completion___block_invoke_110(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  INExtensionContextSlotResolutionResult *v10;
  id v11;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v11 = 0;
    objc_msgSend(v3, "resolutionResultDataForIntent:intentSlotDescription:error:", v4, v5, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v7)
    {
      v8 = v7;
LABEL_8:
      v9 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    v6 = 0;
  }
  if (!*(_BYTE *)(a1 + 72))
  {
    v8 = 0;
    goto LABEL_8;
  }
  v8 = 0;
  v9 = objc_msgSend(*(id *)(a1 + 48), "_updateIntent:intentSlotDescription:resolutionResultDataProvider:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3) ^ 1;
LABEL_9:
  v10 = -[INExtensionContextSlotResolutionResult initWithResult:data:]([INExtensionContextSlotResolutionResult alloc], "initWithResult:data:", v9, v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

}

void __82__INIntentDeliverer__processIntentResponseCompletionHandlerWithIntent_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[INIntentDeliverer _processIntentResponseCompletionHandlerWithIntent:completion:]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_INFO, "%s Completion handler called with %@", (uint8_t *)&v9, 0x16u);
  }
  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This completion handler should be called only once"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  v5 = (void *)a1[4];
  v6 = a1[5];
  INIntentResponseWithTypedIntentResponse(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_processIntent:intentResponse:completion:", v6, v7, a1[6]);

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
}

void __140__INIntentDeliverer__invokeIntentHandlerMethodForIntent_intentHandler_parameterNamed_keyForSelectors_executionHandler_unimplementedHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_intentInstanceDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v4, "slotByName:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v6, "facadePropertyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    if (!v7)
      goto LABEL_13;
    objc_msgSend(v6, "valueForKey:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __140__INIntentDeliverer__invokeIntentHandlerMethodForIntent_intentHandler_parameterNamed_keyForSelectors_executionHandler_unimplementedHandler___block_invoke_2;
    v11[3] = &unk_1E22920E8;
    v12 = v3;
    v16 = &v17;
    v15 = *(id *)(a1 + 56);
    v13 = *(id *)(a1 + 32);
    v14 = v6;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

    if (!*((_BYTE *)v18 + 24))
LABEL_13:
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    _Block_object_dispose(&v17, 8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __140__INIntentDeliverer__invokeIntentHandlerMethodForIntent_intentHandler_parameterNamed_keyForSelectors_executionHandler_unimplementedHandler___block_invoke_2(uint64_t a1, NSString *aSelectorName, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (uint64_t)NSSelectorFromString(aSelectorName);
  if (result)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        *a4 = 1;
    }
  }
  return result;
}

BOOL __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void (*v12)(id, uint64_t, uint64_t, void *);
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  v12 = (void (*)(id, uint64_t, uint64_t, void *))objc_msgSend(v9, "methodForSelector:", a3);
  if (v12)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_99;
    v24 = &unk_1E2292048;
    v26 = *(id *)(a1 + 48);
    v13 = v9;
    v25 = v13;
    v14 = (void *)MEMORY[0x18D7812C4](&v21);
    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_processResolutionDataProviderForIntent:intentSlotDescription:updateIntent:completion:", v15, v11, *(unsigned __int8 *)(a1 + 56), v14, v21, v22, v23, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12(v13, a3, v15, v16);

  }
  else
  {
    v17 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v19 = v17;
      objc_msgSend(v11, "facadePropertyName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[INIntentDeliverer _resolveIntentParameter:forIntent:intentHandler:updateIntent:withCompletion:]_block_invoke";
      v29 = 2114;
      v30 = v20;
      v31 = 2112;
      v32 = v10;
      _os_log_error_impl(&dword_18BEBC000, v19, OS_LOG_TYPE_ERROR, "%s Unable to find implementation of resolution method for facade slot name %{public}@ on intent %@", buf, 0x20u);

    }
  }

  return v12 != 0;
}

void __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSString *v9;
  SEL v10;
  void (*v11)(uint64_t, SEL, _QWORD *);
  uint64_t v12;
  id v13;
  uint64_t v14;
  INExtensionContextSlotResolutionResult *v15;
  void *v16;
  INExtensionContextSlotResolutionResult *v17;
  int8x16_t v18;
  _QWORD v19[4];
  id v20;
  int8x16_t v21;
  id v22;
  id v23;
  char v24;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "if_ASCIIStringByUppercasingFirstCharacter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("_intents_resolve%@WithCompletionHandler:"), v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  v10 = NSSelectorFromString(v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = (void (*)(uint64_t, SEL, _QWORD *))objc_msgSend(*(id *)(a1 + 40), "methodForSelector:", v10);
    v12 = *(_QWORD *)(a1 + 40);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_3;
    v19[3] = &unk_1E2292098;
    v23 = *(id *)(a1 + 56);
    v20 = v5;
    v18 = *(int8x16_t *)(a1 + 40);
    v13 = (id)v18.i64[0];
    v21 = vextq_s8(v18, v18, 8uLL);
    v22 = v6;
    v24 = *(_BYTE *)(a1 + 64);
    v11(v12, v10, v19);

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 56);
    v15 = [INExtensionContextSlotResolutionResult alloc];
    +[INIntentResolutionResult _dataForResolutionMethodUnimplemented](INIntentResolutionResult, "_dataForResolutionMethodUnimplemented");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[INExtensionContextSlotResolutionResult initWithResult:data:](v15, "initWithResult:data:", 2, v16);
    (*(void (**)(uint64_t, INExtensionContextSlotResolutionResult *, id))(v14 + 16))(v14, v17, v5);

  }
}

void __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  INExtensionContextSlotResolutionResult *v10;
  void *v11;
  INExtensionContextSlotResolutionResult *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(unsigned __int8 *)(a1 + 72);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_4;
    v13[3] = &unk_1E2292048;
    v7 = *(_QWORD *)(a1 + 56);
    v15 = *(id *)(a1 + 64);
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v4, "_processResolutionDataProviderForIntent:intentSlotDescription:updateIntent:completion:", v5, v7, v6, v13);
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v3);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 64);
    v10 = [INExtensionContextSlotResolutionResult alloc];
    +[INIntentResolutionResult _dataForResolutionMethodUnimplemented](INIntentResolutionResult, "_dataForResolutionMethodUnimplemented");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[INExtensionContextSlotResolutionResult initWithResult:data:](v10, "initWithResult:data:", 2, v11);
    (*(void (**)(uint64_t, INExtensionContextSlotResolutionResult *, _QWORD))(v9 + 16))(v9, v12, *(_QWORD *)(a1 + 32));

  }
}

uint64_t __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

uint64_t __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_99(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

BOOL __91__INIntentDeliverer_getSupportsParameterOptionsForParameterNamed_intent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v3;

  v3 = objc_msgSend(a2, "methodForSelector:") != 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v3;
}

uint64_t __91__INIntentDeliverer_getSupportsParameterOptionsForParameterNamed_intent_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __92__INIntentDeliverer_getParameterOptionsForParameterNamed_intent_searchTerm_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void (*v12)(id, uint64_t, id, _QWORD *);
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  v12 = (void (*)(id, uint64_t, id, _QWORD *))objc_msgSend(v9, "methodForSelector:", a3);
  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "numberOfArguments");
  if (v14 == 4)
  {
    if (v12)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __92__INIntentDeliverer_getParameterOptionsForParameterNamed_intent_searchTerm_completionBlock___block_invoke_91;
      v22[3] = &unk_1E2291FD0;
      v23 = *(id *)(a1 + 40);
      v12(v9, a3, v10, v22);

      goto LABEL_7;
    }
    v20 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v17 = v20;
      objc_msgSend(v11, "facadePropertyName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v25 = "-[INIntentDeliverer getParameterOptionsForParameterNamed:intent:searchTerm:completionBlock:]_block_invoke";
      v26 = 2114;
      v27 = v18;
      v28 = 2112;
      v29 = v10;
      v19 = "%s Unable to find implementation of provide options method for facade parameter name %{public}@ on intent %@";
      goto LABEL_14;
    }
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  if (v14 != 5)
    goto LABEL_11;
  if (!v12)
  {
    v16 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v17 = v16;
      objc_msgSend(v11, "facadePropertyName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v25 = "-[INIntentDeliverer getParameterOptionsForParameterNamed:intent:searchTerm:completionBlock:]_block_invoke";
      v26 = 2114;
      v27 = v18;
      v28 = 2112;
      v29 = v10;
      v19 = "%s Unable to find implementation of provide options with search term method for facade parameter name %{publ"
            "ic}@ on intent %@";
LABEL_14:
      _os_log_error_impl(&dword_18BEBC000, v17, OS_LOG_TYPE_ERROR, v19, buf, 0x20u);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  ((void (*)(id, uint64_t, id, _QWORD, _QWORD))v12)(v9, a3, v10, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
LABEL_7:
  v15 = 1;
LABEL_12:

  return v15;
}

void __92__INIntentDeliverer_getParameterOptionsForParameterNamed_intent_searchTerm_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_INExtensionContextErrorDomain"), 1002, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __92__INIntentDeliverer_getParameterOptionsForParameterNamed_intent_searchTerm_completionBlock___block_invoke_91(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  uint64_t v7;
  INObjectCollection *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v9, v5);
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = *(_QWORD *)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      v8 = -[INObjectCollection initWithItems:]([INObjectCollection alloc], "initWithItems:", v9);
      (*(void (**)(uint64_t, INObjectCollection *, id))(v7 + 16))(v7, v8, v5);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v5);
    }
  }

}

uint64_t __67__INIntentDeliverer_stopSendingUpdatesForIntent_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopSendingUpdatesForIntent:fromConnection:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __79__INIntentDeliverer_startSendingUpdatesForIntent_toObserver_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSendingUpdatesForIntent:toObserver:fromConnection:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __49__INIntentDeliverer_handleIntent_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = INSiriLogContextIntents;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[INIntentDeliverer handleIntent:withCompletion:]_block_invoke";
      v16 = 2112;
      v17 = v12;
      _os_log_error_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_ERROR, "%s Returning handle response with error %@", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v14 = 136315394;
    v15 = "-[INIntentDeliverer handleIntent:withCompletion:]_block_invoke";
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_INFO, "%s Returning handle response %@", (uint8_t *)&v14, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __49__INIntentDeliverer_handleIntent_withCompletion___block_invoke_85(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(id, uint64_t, uint64_t, void *);
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_intentInstanceDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "handleSelector");
    if (v5)
    {
      v6 = v5;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v7 = objc_msgSend(v3, "methodForSelector:", v6);
        if (v7)
        {
          v8 = (void (*)(id, uint64_t, uint64_t, void *))v7;
          v9 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "_processIntentResponseCompletionHandlerWithIntent:completion:", v9, *(_QWORD *)(a1 + 48));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v8(v3, v6, v9, v10);

          goto LABEL_20;
        }
        v12 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          v20 = *(_QWORD *)(a1 + 32);
          v21 = 136315394;
          v22 = "-[INIntentDeliverer handleIntent:withCompletion:]_block_invoke";
          v23 = 2112;
          v24 = v20;
          _os_log_error_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_ERROR, "%s Unable to find implementation of handling method for handling intent %@", (uint8_t *)&v21, 0x16u);
        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "_type") == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_codableDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEligibleForWidgets");

      if (v14)
      {
        if (_os_feature_enabled_impl())
          v15 = 4;
        else
          v15 = 2;
      }
      else
      {
        v15 = 5;
      }
      v18 = -[INIntentResponse _initWithCode:userActivity:]([INIntentResponse alloc], "_initWithCode:userActivity:", v15, 0);
    }
    else
    {
      objc_msgSend(v4, "responseName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      INIntentSchemaGetIntentResponseDescriptionWithName(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v17, "facadeClass")), "_initWithCode:userActivity:", 5, 0);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v21 = 136315394;
      v22 = "-[INIntentDeliverer handleIntent:withCompletion:]_block_invoke";
      v23 = 2112;
      v24 = v19;
      _os_log_error_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_ERROR, "%s No handler for intent %@ provided by extension", (uint8_t *)&v21, 0x16u);
    }
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 2003, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
LABEL_20:

}

void __50__INIntentDeliverer_confirmIntent_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = INSiriLogContextIntents;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[INIntentDeliverer confirmIntent:withCompletion:]_block_invoke";
      v16 = 2112;
      v17 = v12;
      _os_log_error_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_ERROR, "%s Returning confirm response with error %@", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v14 = 136315394;
    v15 = "-[INIntentDeliverer confirmIntent:withCompletion:]_block_invoke";
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_INFO, "%s Returning confirm response %@", (uint8_t *)&v14, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __50__INIntentDeliverer_confirmIntent_withCompletion___block_invoke_82(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(id, uint64_t, uint64_t, void *);
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_intentInstanceDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "confirmSelector");
    if (v5)
    {
      v6 = v5;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v7 = objc_msgSend(v3, "methodForSelector:", v6);
        if (v7)
        {
          v8 = (void (*)(id, uint64_t, uint64_t, void *))v7;
          v9 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "_processIntentResponseCompletionHandlerWithIntent:completion:", v9, *(_QWORD *)(a1 + 48));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v8(v3, v6, v9, v10);

          goto LABEL_15;
        }
        v12 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          v17 = *(_QWORD *)(a1 + 32);
          v18 = 136315394;
          v19 = "-[INIntentDeliverer confirmIntent:withCompletion:]_block_invoke";
          v20 = 2112;
          v21 = v17;
          _os_log_error_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_ERROR, "%s Unable to find implementation of confirmation method for handling intent %@", (uint8_t *)&v18, 0x16u);
        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "_type") == 2)
    {
      v13 = -[INIntentResponse _initWithCode:userActivity:]([INIntentResponse alloc], "_initWithCode:userActivity:", 1, 0);
    }
    else
    {
      objc_msgSend(v4, "responseName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      INIntentSchemaGetIntentResponseDescriptionWithName(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v15, "facadeClass")), "_initWithCode:userActivity:", 1, 0);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v18 = 136315394;
      v19 = "-[INIntentDeliverer confirmIntent:withCompletion:]_block_invoke";
      v20 = 2112;
      v21 = v16;
      _os_log_error_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_ERROR, "%s No handler for intent %@ provided by extension", (uint8_t *)&v18, 0x16u);
    }
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 2003, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
LABEL_15:

}

void __70__INIntentDeliverer_resolveIntentParameter_forIntent_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[INIntentDeliverer resolveIntentParameter:forIntent:completionBlock:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_INFO, "%s Returning parameter resolution result %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

void __71__INIntentDeliverer_resolveIntentParameters_forIntent_completionBlock___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  dispatch_semaphore_t v13;
  __int128 v14;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v2 = dispatch_semaphore_create(0);
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__INIntentDeliverer_resolveIntentParameters_forIntent_completionBlock___block_invoke_2;
    v10[3] = &unk_1E2291EB0;
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(id *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 40);
    v11 = v7;
    v12 = v8;
    v14 = *(_OWORD *)(a1 + 64);
    v13 = v2;
    v9 = v2;
    objc_msgSend(v3, "_resolveIntentParameter:forIntent:intentHandler:updateIntent:withCompletion:", v4, v6, v5, 1, v10);
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  }
}

void __71__INIntentDeliverer_resolveIntentParameters_forIntent_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  INIntentWithTypedIntent(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = v3;
    objc_msgSend(v2, "typeName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[INIntentDeliverer resolveIntentParameters:forIntent:completionBlock:]_block_invoke_3";
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_INFO, "%s Returning slot resolution results %@ with updated intent %@", (uint8_t *)&v10, 0x20u);

  }
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v9 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  (*(void (**)(uint64_t, uint64_t, void *, void *))(v7 + 16))(v7, v8, v2, v9);

}

void __71__INIntentDeliverer_resolveIntentParameters_forIntent_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v11;
  v7 = v5;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v11, *(_QWORD *)(a1 + 40));
    v6 = v11;
  }
  if (objc_msgSend(v6, "result") == 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;
  v10 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

BOOL __78__INIntentDeliverer_getIntentParameterDefaultValue_forIntent_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void (*v12)(id, uint64_t, id);
  void *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  v12 = (void (*)(id, uint64_t, id))objc_msgSend(v9, "methodForSelector:", a3);
  if (v12)
  {
    v12(v9, a3, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_processDefaultValue:forIntent:parameterNamed:completionHandler:", v13, v10, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    v14 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v16 = v14;
      objc_msgSend(v11, "facadePropertyName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136315650;
      v19 = "-[INIntentDeliverer getIntentParameterDefaultValue:forIntent:completionBlock:]_block_invoke";
      v20 = 2114;
      v21 = v17;
      v22 = 2112;
      v23 = v10;
      _os_log_error_impl(&dword_18BEBC000, v16, OS_LOG_TYPE_ERROR, "%s Unable to find implementation of default value method for facade slot name %{public}@ on intent %@", (uint8_t *)&v18, 0x20u);

    }
  }

  return v12 != 0;
}

void __78__INIntentDeliverer_getIntentParameterDefaultValue_forIntent_completionBlock___block_invoke_74(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_INExtensionContextErrorDomain"), 1003, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

@end
