@implementation MPRequest

void __36__MPRequest__performWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  id *v26;
  id val;
  void (**v28)(_QWORD, _QWORD);
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD block[5];
  id v43;
  id location;
  _QWORD v45[5];
  id v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;

  v2 = MEMORY[0x1E0C809B0];
  v51 = *MEMORY[0x1E0C80C00];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __36__MPRequest__performWithCompletion___block_invoke_2;
  v45[3] = &unk_1E3153060;
  v3 = *(id *)(a1 + 56);
  v32 = a1;
  v45[4] = *(_QWORD *)(a1 + 32);
  v46 = v3;
  v28 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v45);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v28[2](v28, 0);
  }
  else
  {
    v4 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "responseClass"));
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "allMiddleware");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    val = (id)objc_msgSend(v4, "initWithRequest:middleware:", v5, v6);

    objc_initWeak(&location, val);
    v7 = *(NSObject **)(v32 + 48);
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __36__MPRequest__performWithCompletion___block_invoke_4;
    block[3] = &unk_1E31639C8;
    block[4] = *(_QWORD *)(v32 + 64);
    v25 = &v43;
    objc_copyWeak(&v43, &location);
    dispatch_sync(v7, block);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v32 + 72) + 8) + 24))
    {
      v8 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(v32 + 32);
        *(_DWORD *)buf = 138543362;
        v50 = v9;
        _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_INFO, "INVALIDATE: Response invalid before completion. Request: %{public}@", buf, 0xCu);
      }

      objc_msgSend(val, "invalidate", &v43);
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(*(id *)(v32 + 40), "allMiddleware");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    if (v12)
    {
      obj = v11;
      v30 = *(_QWORD *)v39;
      do
      {
        v31 = v12;
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v39 != v30)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          objc_msgSend(*(id *)(v32 + 40), "operationsForMiddleware:", v33);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v35 != v17)
                  objc_enumerationMutation(v15);
                v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
                if (objc_msgSend(v19, "conformsToProtocol:", &unk_1EE2FF310))
                {
                  v20 = v19;
                  objc_msgSend(v20, "invalidationObservers");
                  v21 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "addObjectsFromArray:", v21);

                  objc_msgSend(v20, "error");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v21) = v22 == 0;

                  if ((v21 & 1) == 0)
                  {
                    objc_msgSend(v20, "error");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v10, "addObject:", v23);

                  }
                }
              }
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
            }
            while (v16);
          }

          if (objc_msgSend(v14, "count"))
            objc_msgSend(v33, "setInvalidationObservers:", v14);

        }
        v11 = obj;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingErrors:debugDescription:", CFSTR("MPRequestErrorDomain"), 1, v10, CFSTR("Errors found in middleware operations"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(_QWORD, _QWORD), _QWORD, void *))v28[2])(v28, 0, v24);

    }
    else
    {
      ((void (*)(void (**)(_QWORD, _QWORD), id, _QWORD))v28[2])(v28, val, 0);
    }

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);

  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4;
  NSOperationQueue *v5;
  NSOperationQueue *queue;
  NSOperationQueue *v7;
  NSOperationQueue *calloutQueue;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  objc_class *v27;
  void *v28;
  id v29;
  NSObject *cleanupQueue;
  id v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  _QWORD block[5];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  MPRequest *v41;
  NSObject *v42;
  _QWORD *v43;
  _QWORD *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  id v50;
  NSObject *v51;
  id v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD v55[3];
  char v56;
  _QWORD v57[5];
  id v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
  queue = self->_queue;
  self->_queue = v5;

  v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
  calloutQueue = self->_calloutQueue;
  self->_calloutQueue = v7;

  if (self->_qualityOfService)
  {
    -[NSOperationQueue setQualityOfService:](self->_queue, "setQualityOfService:");
    -[NSOperationQueue setQualityOfService:](self->_calloutQueue, "setQualityOfService:", self->_qualityOfService);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.MediaPlaybackCore/%@"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue setName:](self->_queue, "setName:", v9);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.MediaPlaybackCore/%@.callout"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue setName:](self->_calloutQueue, "setName:", v10);

  +[MPMiddlewareOperationMap mapForRequest:](MPMiddlewareOperationMap, "mapForRequest:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create("com.apple.MPRequest.invalidationQueue", v12);

  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__395;
  v57[4] = __Block_byref_object_dispose__396;
  v58 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v56 = 0;
  v14 = (void *)MEMORY[0x1E0CB34C8];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __36__MPRequest__performWithCompletion___block_invoke;
  v49[3] = &unk_1E3158CE0;
  v34 = v4;
  v52 = v34;
  v49[4] = self;
  v15 = v11;
  v50 = v15;
  v35 = v13;
  v51 = v35;
  v53 = v57;
  v54 = v55;
  objc_msgSend(v14, "blockOperationWithBlock:", v49);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v15;
  objc_msgSend(v15, "allOperations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v17, "valueForKeyPath:", CFSTR("class.description"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v61 = v20;
    _os_log_impl(&dword_193B9B000, v18, OS_LOG_TYPE_DEBUG, "MIDDLEWARE: [%{public}@]", buf, 0xCu);

  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v21 = v17;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v46 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        if (objc_msgSend(v25, "conformsToProtocol:", &unk_1EE2FF310))
        {
          v26 = v25;
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __36__MPRequest__performWithCompletion___block_invoke_101;
          v39[3] = &unk_1E3153088;
          v43 = v55;
          v29 = v28;
          v40 = v29;
          v41 = self;
          v42 = v35;
          v44 = v57;
          objc_msgSend(v26, "setInvalidationHandler:", v39);

        }
        objc_msgSend(v25, "setQualityOfService:", -[MPRequest qualityOfService](self, "qualityOfService"));
        objc_msgSend(v16, "addDependency:", v25);
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    }
    while (v22);
  }

  cleanupQueue = self->_cleanupQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MPRequest__performWithCompletion___block_invoke_2_104;
  block[3] = &unk_1E3163698;
  block[4] = self;
  v37 = v21;
  v38 = v16;
  v31 = v16;
  v32 = v21;
  dispatch_sync(cleanupQueue, block);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);

}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

void __36__MPRequest__performWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MPRequest__performWithCompletion___block_invoke_3;
  block[3] = &unk_1E3163508;
  block[4] = v2;
  dispatch_sync(v3, block);
}

void __35__MPRequest_performWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  double v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = *(NSObject **)(a1 + 40);
  if (v8)
    dispatch_source_cancel(v8);
  v9 = *(NSObject **)(a1 + 48);
  if (v9)
    dispatch_source_cancel(v9);
  objc_msgSend(*(id *)(a1 + 56), "timeIntervalSinceNow");
  if (v10 >= 0.0)
    v11 = v10;
  else
    v11 = -v10;
  v12 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  v13 = v12;
  if (v6)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "msv_description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v14;
      v19 = 2114;
      v20 = v5;
      v21 = 2048;
      v22 = v11;
      v23 = 2114;
      v24 = v15;
      _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_ERROR, "FINISH Request: %{public}@ Response: %{public}@ [%fs] error=%{public}@", (uint8_t *)&v17, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = 138543874;
    v18 = v16;
    v19 = 2114;
    v20 = v5;
    v21 = 2048;
    v22 = v11;
    _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_INFO, "FINISH Request: %{public}@ Response: %{public}@ [%fs]", (uint8_t *)&v17, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 64), "disarm");
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void __36__MPRequest__performWithCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

uint64_t __19__MPRequest_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "cancelAllOperations");
}

void __36__MPRequest__performWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[MPRequest label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLabel:", v6);

  -[MPRequest middlewareClasses](self, "middlewareClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setMiddlewareClasses:", v8);

  objc_msgSend(v4, "setQualityOfService:", -[MPRequest qualityOfService](self, "qualityOfService"));
  -[MPRequest timeoutInterval](self, "timeoutInterval");
  objc_msgSend(v4, "setTimeoutInterval:");
  return v4;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPRequest label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p label=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)label
{
  return self->_label;
}

- (MPRequest)init
{
  MPRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPRequest;
  result = -[MPRequest init](&v3, sel_init);
  if (result)
    result->_qualityOfService = -1;
  return result;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setMiddlewareClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)performWithCompletion:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  double v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_time_t v20;
  double v21;
  NSObject *v22;
  NSObject *v23;
  double v24;
  dispatch_time_t v25;
  NSObject *v26;
  _QWORD *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  void *v32;
  _QWORD *v33;
  _QWORD v36[5];
  id v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  id v41;
  SEL v42;
  _QWORD v43[4];
  NSObject *v44;
  MPRequest *v45;
  _QWORD *v46;
  _QWORD handler[4];
  NSObject *v48;
  _QWORD *v49;
  uint8_t buf[4];
  _QWORD *v51;
  __int16 v52;
  MPRequest *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (_QWORD *)-[MPRequest copy](self, "copy");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v51 = v5;
    v52 = 2114;
    v53 = self;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_INFO, "START Request: %{public}@ aka [%{public}@]", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.MediaPlaybackCore/%@.cleanup"), objc_opt_class());
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create(v9, v10);
  v12 = (void *)v5[6];
  v5[6] = v11;

  objc_msgSend((id)objc_opt_class(), "expectedMaximumResponseTimeInterval");
  v14 = v13;
  -[MPRequest timeoutInterval](self, "timeoutInterval");
  v15 = 0;
  v16 = MEMORY[0x1E0C809B0];
  if (v14 >= v17)
  {
    objc_msgSend(v5, "cleanupQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v18);

    v20 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    dispatch_source_set_timer(v19, v20, 0x3B9ACA00uLL, 0x3B9ACA00uLL);
    handler[0] = v16;
    handler[1] = 3221225472;
    handler[2] = __35__MPRequest_performWithCompletion___block_invoke;
    handler[3] = &unk_1E31635F8;
    v15 = v19;
    v48 = v15;
    v49 = v5;
    dispatch_source_set_event_handler(v15, handler);
    dispatch_resume(v15);

  }
  -[MPRequest timeoutInterval](self, "timeoutInterval");
  if (v21 <= 0.0)
  {
    v26 = 0;
  }
  else
  {
    dispatch_get_global_queue(17, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v22);

    -[MPRequest timeoutInterval](self, "timeoutInterval");
    v25 = dispatch_time(0, (uint64_t)(v24 * 1000000000.0));
    dispatch_source_set_timer(v23, v25, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v43[0] = v16;
    v43[1] = 3221225472;
    v43[2] = __35__MPRequest_performWithCompletion___block_invoke_76;
    v43[3] = &unk_1E3163698;
    v26 = v23;
    v44 = v26;
    v45 = self;
    v46 = v5;
    dispatch_source_set_event_handler(v26, v43);
    dispatch_resume(v26);

  }
  v36[0] = v16;
  v36[1] = 3221225472;
  v36[2] = __35__MPRequest_performWithCompletion___block_invoke_78;
  v36[3] = &unk_1E3153038;
  v41 = v4;
  v42 = a2;
  v36[4] = self;
  v27 = v5;
  v37 = v27;
  v38 = v15;
  v39 = v26;
  v40 = v6;
  v28 = v6;
  v29 = v26;
  v30 = v15;
  v31 = v4;
  objc_msgSend(v27, "prepareForResponseWithCompletion:", v36);
  v32 = v40;
  v33 = v27;

  return v33;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)prepareForResponseWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (OS_dispatch_queue)cleanupQueue
{
  return self->_cleanupQueue;
}

+ (double)expectedMaximumResponseTimeInterval
{
  return 3.0;
}

- (void)cancel
{
  NSObject *cleanupQueue;
  _QWORD block[5];

  cleanupQueue = self->_cleanupQueue;
  if (cleanupQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __19__MPRequest_cancel__block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_sync(cleanupQueue, block);
  }
}

void __36__MPRequest__performWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__MPRequest__performWithCompletion___block_invoke_5;
  v5[3] = &unk_1E315E5D0;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v2 = MEMORY[0x19403A810](v5);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_destroyWeak(&v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_middlewareClasses, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cleanupQueue, 0);
  objc_storeStrong((id *)&self->_cancelationError, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (id)_stateDumpObject
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("label");
  -[MPRequest label](self, "label");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = CFSTR("<NULL>");
  if (v2)
    v4 = (const __CFString *)v2;
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSOperationQueue)calloutQueue
{
  return self->_calloutQueue;
}

- (NSError)cancelationError
{
  return self->_cancelationError;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (NSArray)middlewareClasses
{
  return self->_middlewareClasses;
}

void __36__MPRequest__performWithCompletion___block_invoke_101(_QWORD *a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
  v5 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = a1[4];
      v8 = a1[5];
      *(_DWORD *)buf = 138543874;
      v17 = v7;
      v18 = 2114;
      v19 = v3;
      v20 = 2114;
      v21 = v8;
      v9 = "INVALIDATE: Middleware: %{public}@ [%{public}@, but already invalid] request: %{public}@";
      v10 = v6;
      v11 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_193B9B000, v10, v11, v9, buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[4];
    v13 = a1[5];
    *(_DWORD *)buf = 138543874;
    v17 = v12;
    v18 = 2114;
    v19 = v3;
    v20 = 2114;
    v21 = v13;
    v9 = "INVALIDATE: Middleware: %{public}@ [%{public}@] request: %{public}@";
    v10 = v6;
    v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

  v14 = a1[6];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MPRequest__performWithCompletion___block_invoke_102;
  block[3] = &unk_1E31639A0;
  block[4] = a1[8];
  dispatch_sync(v14, block);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;

}

uint64_t __36__MPRequest__performWithCompletion___block_invoke_2_104(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 56), "addOperations:waitUntilFinished:", a1[5], 0);
  return objc_msgSend(*(id *)(a1[4] + 32), "addOperation:", a1[6]);
}

uint64_t __36__MPRequest__performWithCompletion___block_invoke_102(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __35__MPRequest_performWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  char **v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  char **v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v28 = a1;
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = os_log_create("com.apple.amp.mediaplayer", "Middleware_Oversize");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "valueForKeyPath:", CFSTR("class.description"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v5;
    v37 = 2114;
    v38 = v7;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "TIMEOUT Request: %{public}@ timing out. Remaining operations: [%{public}@]", buf, 0x16u);

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v31;
    v13 = &selRef_initWithSource_modelKind_musicKitBlock_;
    v14 = "com.apple.amp.mediaplayer";
    v15 = "Middleware_Oversize";
    *(_QWORD *)&v10 = 138543618;
    v27 = v10;
    do
    {
      v16 = 0;
      v29 = v11;
      do
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v8);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v16);
        if (objc_msgSend(v17, "conformsToProtocol:", v13[292], v27))
        {
          v18 = v17;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v19 = os_log_create(v14, v15);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = v12;
              v21 = v15;
              v22 = v13;
              v23 = v8;
              v24 = v14;
              v25 = *(_QWORD *)(v28 + 40);
              objc_msgSend(v18, "timeoutDescription");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v27;
              v36 = v25;
              v14 = v24;
              v8 = v23;
              v13 = v22;
              v15 = v21;
              v12 = v20;
              v11 = v29;
              v37 = 2114;
              v38 = v26;
              _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_DEFAULT, "TIMEOUT Request: %{public}@ Operation: %{public}@", buf, 0x16u);

            }
          }

        }
        ++v16;
      }
      while (v11 != v16);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v11);
  }

}

uint64_t __35__MPRequest_performWithCompletion___block_invoke_76(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v8 = 138543362;
    v9 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "TIMEOUT Request: %{public}@ timing out.", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPRequestErrorDomain"), 2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return objc_msgSend(*(id *)(a1 + 48), "cancel");
}

void __35__MPRequest_performWithCompletion___block_invoke_78(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v3 = objc_alloc(MEMORY[0x1E0D4D048]);
    v17[2] = __35__MPRequest_performWithCompletion___block_invoke_2;
    v17[3] = &unk_1E31582F0;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 80);
    v17[4] = v4;
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v18 = v5;
    v19 = *(id *)(a1 + 72);
    v7 = (void *)objc_msgSend(v3, "initWithDeallocHandler:", v17);
    v8 = *(void **)(a1 + 40);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __35__MPRequest_performWithCompletion___block_invoke_3;
    v10[3] = &unk_1E3153010;
    v11 = v8;
    v12 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 64);
    v15 = v7;
    v16 = *(id *)(a1 + 72);
    v9 = v7;
    objc_msgSend(v11, "_performWithCompletion:", v10);

  }
}

void __35__MPRequest_performWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  if (MSVDeviceOSIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("MPRequest.m"), 105, CFSTR("-[MPRequest _performWithCompletion: failed to call completion %@"), a1[5]);

  }
  v2 = a1[6];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPRequestErrorDomain"), 2, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v4);

}

+ (Class)responseClass
{
  uint64_t v4;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v4 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPRequest.m"), 26, CFSTR("Subclass %@ must implement -%@ defined in %@."), v8, v9, CFSTR("[MPRequest class]"));

  }
  return (Class)objc_opt_class();
}

@end
