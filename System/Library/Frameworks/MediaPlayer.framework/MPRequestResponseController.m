@implementation MPRequestResponseController

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!(v5 | v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("MPRequestResponseController.m"), 350, CFSTR("Must get a response or an error"));

  }
  v7 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_opt_class();
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v26 = v8;
    v27 = 2048;
    v28 = v9;
    v10 = v8;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_INFO, "RRC <%{public}@ %p>: Request finished loading", buf, 0x16u);

  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  v13 = *(NSObject **)(v11 + 112);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_65;
  v19[3] = &unk_1E315D938;
  v19[4] = v11;
  v20 = (id)v6;
  v21 = v12;
  v22 = (id)v5;
  v14 = *(id *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 56);
  v23 = v14;
  v24 = v15;
  v16 = (id)v5;
  v17 = (id)v6;
  dispatch_async(v13, v19);

}

void __39__MPRequestResponseController_response__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

void __38__MPRequestResponseController_request__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

uint64_t __43__MPRequestResponseController_setResponse___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t result;
  char v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88))
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(v3 + 80);
      v4 = *(_QWORD *)(v3 + 88);
      v33 = 138543618;
      v34 = v5;
      v35 = 2048;
      v36 = v4;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEBUG, "RRC %{public}@: Removing observer for %p", (uint8_t *)&v33, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), MPResponseDidInvalidateNotification, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));

  }
  v7 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v33 = 138543618;
    v34 = v9;
    v35 = 2048;
    v36 = v8;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "RRC %{public}@: Updating response to %p", (uint8_t *)&v33, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = 0;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 64);
  *(_QWORD *)(v12 + 64) = 0;

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 32);
  *(_QWORD *)(v14 + 32) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    v17 = objc_msgSend((id)result, "isValid");
    v18 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    v19 = v18;
    if ((v17 & 1) == 0)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v31 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
        v33 = 138543362;
        v34 = v31;
        _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_INFO, "RRC %{public}@: Needs reload [response invalid before -setResponse:]", (uint8_t *)&v33, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 1;
      v26 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        goto LABEL_21;
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v33 = 138543362;
      v34 = v32;
      v28 = "RRC %{public}@: Reloading [response invalid before -setResponse:]";
      v29 = v26;
      v30 = OS_LOG_TYPE_INFO;
      goto LABEL_20;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v22 = *(_QWORD *)(v20 + 80);
      v21 = *(_QWORD *)(v20 + 88);
      v33 = 138543618;
      v34 = v22;
      v35 = 2048;
      v36 = v21;
      _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_DEBUG, "RRC %{public}@: Adding observer for %p", (uint8_t *)&v33, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__responseDidInvalidate_, MPResponseDidInvalidateNotification, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));

    result = objc_msgSend(*(id *)(a1 + 40), "isValid");
    if ((result & 1) == 0)
    {
      v24 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
        v33 = 138543362;
        v34 = v25;
        _os_log_impl(&dword_193B9B000, v24, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Needs reload [response invalid before -setResponse: after adding observer]", (uint8_t *)&v33, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 1;
      v26 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v33 = 138543362;
      v34 = v27;
      v28 = "RRC %{public}@: Reloading [response invalid before -setResponse: after adding observer]";
      v29 = v26;
      v30 = OS_LOG_TYPE_DEFAULT;
LABEL_20:
      _os_log_impl(&dword_193B9B000, v29, v30, v28, (uint8_t *)&v33, 0xCu);
LABEL_21:

      return objc_msgSend(*(id *)(a1 + 32), "_onQueue_reloadIfNeeded");
    }
  }
  return result;
}

- (void)setRequest:(id)a3
{
  id v5;
  id v6;
  NSObject *queue;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  MPRequestResponseController *v13;
  id v14;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPRequestResponseController.m"), 69, CFSTR("Request must be subclass of MPRequest."));

    }
  }
  -[MPRequestResponseController request](self, "request");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    -[MPRequestResponseController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("request"));
    queue = self->_queue;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __42__MPRequestResponseController_setRequest___block_invoke;
    v12 = &unk_1E31635F8;
    v13 = self;
    v14 = v5;
    dispatch_async(queue, &v9);
    -[MPRequestResponseController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("request"), v9, v10, v11, v12, v13);

  }
}

- (id)request
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__36431;
  v10 = __Block_byref_object_dispose__36432;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__MPRequestResponseController_request__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setResponse:(id)a3
{
  id v5;
  id v6;
  NSObject *queue;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  MPRequestResponseController *v13;
  id v14;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPRequestResponseController.m"), 103, CFSTR("Response must be subclass of MPResponse."));

    }
  }
  -[MPRequestResponseController response](self, "response");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    -[MPRequestResponseController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("response"));
    queue = self->_queue;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __43__MPRequestResponseController_setResponse___block_invoke;
    v12 = &unk_1E31635F8;
    v13 = self;
    v14 = v5;
    dispatch_async(queue, &v9);
    -[MPRequestResponseController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("response"), v9, v10, v11, v12, v13);

  }
}

- (id)response
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__36431;
  v10 = __Block_byref_object_dispose__36432;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__MPRequestResponseController_response__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__MPRequestResponseController_setRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 32))
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_INFO, "RRC %{public}@: Canceling request [request changed]", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "cancel");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 80), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateRequestID");
  v7 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Needs reload [request changed]", (uint8_t *)&v11, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Reloading [automatic, request changed]", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_reloadIfNeeded");
  }
}

void __60__MPRequestResponseController_beginAutomaticResponseLoading__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 24))
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Starting automatic reloading", (uint8_t *)&v7, 0xCu);
    }

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25))
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_INFO, "RRC %{public}@: Reloading [automatic, beginLoading]", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_reloadIfNeeded");
  }
}

void __54__MPRequestResponseController__responseDidInvalidate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_INFO, "RRC %{public}@: Needs reload [response invalid]", (uint8_t *)&v6, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_INFO, "RRC %{public}@: Reloading [automatic, response invalid]", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_reloadIfNeeded");
  }
}

void __45__MPRequestResponseController_setNeedsReload__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateRequestID");
  v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v11 = 138543362;
    v12 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Needs reload [request by client]", (uint8_t *)&v11, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 32))
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_INFO, "RRC %{public}@: Canceling request [request by client]", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "cancel");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = 0;

    v4 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_BYTE *)(v4 + 25))
  {
    *(_BYTE *)(v4 + 25) = 1;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
    {
      v9 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Reloading [automatic, requested by client]", (uint8_t *)&v11, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_onQueue_reloadIfNeeded");
    }
  }
}

- (void)_onQueue_reloadIfNeeded
{
  NSObject *retryTimer;
  OS_dispatch_source *v5;
  id request;
  NSObject *v7;
  id v8;
  const char *v9;
  id v10;
  id v11;
  NSString *v12;
  id WeakRetained;
  char v14;
  uint64_t v15;
  NSObject *calloutQueue;
  NSString *v17;
  MPRequestCancellationToken *v18;
  MPRequestCancellationToken *cancelToken;
  id v20;
  _QWORD v21[5];
  id v22;
  NSString *v23;
  SEL v24;
  _QWORD block[5];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_source_cancel(retryTimer);
    v5 = self->_retryTimer;
    self->_retryTimer = 0;

  }
  request = self->_request;
  if (request)
  {
    if (self->_cancelToken)
    {
      v7 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = self->_request;
        *(_DWORD *)buf = 138543362;
        v27 = v8;
        v9 = "RRC %{public}@: Request loading skipped [already loading]";
LABEL_9:
        _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_INFO, v9, buf, 0xCu);
      }
    }
    else
    {
      if (!self->_needsReload)
      {
        v7 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          goto LABEL_16;
        v20 = self->_request;
        *(_DWORD *)buf = 138543362;
        v27 = v20;
        v9 = "RRC %{public}@: Request loading skipped [not needed]";
        goto LABEL_9;
      }
      self->_needsReload = 0;
      v11 = request;
      v12 = self->_requestID;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v14 = objc_opt_respondsToSelector();

      v15 = MEMORY[0x1E0C809B0];
      if ((v14 & 1) != 0)
      {
        dispatch_assert_queue_not_V2((dispatch_queue_t)self->_calloutQueue);
        calloutQueue = self->_calloutQueue;
        block[0] = v15;
        block[1] = 3221225472;
        block[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke;
        block[3] = &unk_1E3163508;
        block[4] = self;
        dispatch_sync(calloutQueue, block);
      }
      v21[0] = v15;
      v21[1] = 3221225472;
      v21[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_2;
      v21[3] = &unk_1E315D960;
      v21[4] = self;
      v22 = v11;
      v23 = v12;
      v24 = a2;
      v17 = v12;
      v7 = v11;
      -[NSObject performWithCompletion:](v7, "performWithCompletion:", v21);
      v18 = (MPRequestCancellationToken *)objc_claimAutoreleasedReturnValue();
      cancelToken = self->_cancelToken;
      self->_cancelToken = v18;

    }
  }
  else
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = self->_request;
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      v9 = "RRC %{public}@: Request loading skipped [no request]";
      goto LABEL_9;
    }
  }
LABEL_16:

}

- (void)_onQueue_updateRequestID
{
  NSString *v3;
  NSString *requestID;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  MSVNanoIDCreateTaggedPointer();
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  requestID = self->_requestID;
  self->_requestID = v3;

}

uint64_t __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) != 0;
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateRequestID");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

void __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();
  v5 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138543874;
      v27 = v2;
      v28 = 2048;
      v29 = 0;
      v30 = 2048;
      v31 = v3;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "RRC %{public}@: Deferring clearing of %p to delegate %p", buf, 0x20u);
    }

    v7 = objc_alloc(MEMORY[0x1E0D4D048]);
    v8 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke_28;
    v22[3] = &unk_1E315D820;
    v9 = *(_QWORD *)(a1 + 32);
    v25 = *(_QWORD *)(a1 + 40);
    v22[4] = v9;
    v10 = v2;
    v23 = v10;
    v11 = v3;
    v24 = v11;
    v12 = (void *)objc_msgSend(v7, "initWithTimeout:interruptionHandler:", v22, 9.0);
    v13 = *(_QWORD *)(a1 + 32);
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke_32;
    v17[3] = &unk_1E315D848;
    v18 = v12;
    v19 = v10;
    v14 = v11;
    v15 = *(_QWORD *)(a1 + 32);
    v20 = v14;
    v21 = v15;
    v16 = v12;
    objc_msgSend(v14, "controller:defersResponseReplacement:", v13, v17);

  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 138543362;
      v27 = v2;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "RRC %{public}@: Clearing response", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setResponse:", 0);
  }

}

- (MPRequestResponseControllerDelegate)delegate
{
  return (MPRequestResponseControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setNeedsReloadForSignificantRequestChange
{
  NSObject *queue;
  uint64_t v5;
  NSObject *calloutQueue;
  _QWORD v7[6];
  _QWORD block[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  queue = self->_queue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke;
  block[3] = &unk_1E3163580;
  block[4] = self;
  block[5] = &v9;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v10 + 24))
  {
    calloutQueue = self->_calloutQueue;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke_2;
    v7[3] = &unk_1E3161620;
    v7[4] = self;
    v7[5] = a2;
    dispatch_async(calloutQueue, v7);
  }
  -[MPRequestResponseController setNeedsReload](self, "setNeedsReload");
  _Block_object_dispose(&v9, 8);
}

- (void)setNeedsReload
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MPRequestResponseController_setNeedsReload__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_responseDidInvalidate:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MPRequestResponseController__responseDidInvalidate___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)beginAutomaticResponseLoading
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MPRequestResponseController_beginAutomaticResponseLoading__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (MPRequestResponseController)init
{
  MPRequestResponseController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *calloutQueue;
  uint64_t v10;
  MPRequestResponseController *v11;
  _QWORD v13[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MPRequestResponseController;
  v2 = -[MPRequestResponseController init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.MediaPlayer/MPRequestResponseController", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.MediaPlayer/MPRequestResponseController.calloutQueue", v7);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v8;

    v10 = MEMORY[0x1E0C809B0];
    v2->_retryInterval = 0.25;
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __35__MPRequestResponseController_init__block_invoke;
    v13[3] = &unk_1E315D7F8;
    v13[4] = v2;
    v11 = v2;
    v11->_stateHandle = __35__MPRequestResponseController_init__block_invoke((uint64_t)v13);

  }
  return v2;
}

uint64_t __35__MPRequestResponseController_init__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v3, &location);
  v1 = MSVLogAddStateHandler();
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
  return v1;
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "willBeginLoadingRequestForController:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  NSObject *v3;
  id request;
  objc_super v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MEMORY[0x194038908](self->_stateHandle, a2);
  if (self->_shouldAutomaticallyLoad)
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      request = self->_request;
      *(_DWORD *)buf = 138543362;
      v7 = request;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Ending automatic reloading [dealloc]", buf, 0xCu);
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)MPRequestResponseController;
  -[MPRequestResponseController dealloc](&v5, sel_dealloc);
}

- (void)endAutomaticResponseLoading
{
  NSObject *queue;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__MPRequestResponseController_endAutomaticResponseLoading__block_invoke;
  v6[3] = &unk_1E3163580;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  if (*((_BYTE *)v8 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPRequestResponseController.m"), 173, CFSTR("Mismatched begin/endAutomaticResponseLoading."));

  }
  _Block_object_dispose(&v7, 8);
}

- (void)reloadIfNeeded
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MPRequestResponseController_reloadIfNeeded__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_onQueue_stateDictionary
{
  __CFString *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *requestID;
  __CFString *v12;
  const __CFString *v13;
  const __CFString *response;
  void *v15;
  void *v16;
  id v17;
  NSError *v18;
  void *v19;
  _QWORD v21[8];
  _QWORD v22[10];

  v22[8] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (__CFString *)self->_request;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self, CFSTR("_obj"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  v21[1] = CFSTR("automaticLoad");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldAutomaticallyLoad);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v7;
  v21[2] = CFSTR("observers");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfObservers);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v8;
  v21[3] = CFSTR("needsReload");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_needsReload);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  requestID = (const __CFString *)self->_requestID;
  v12 = CFSTR("<NULL>");
  if (!requestID)
    requestID = CFSTR("<NULL>");
  v22[3] = v9;
  v22[4] = requestID;
  v21[4] = CFSTR("requestID");
  v21[5] = CFSTR("request");
  if (v3)
    v13 = v3;
  else
    v13 = CFSTR("<NULL>");
  response = (const __CFString *)self->_response;
  if (!response)
    response = CFSTR("<NULL>");
  v22[5] = v13;
  v22[6] = response;
  v21[6] = CFSTR("response");
  v21[7] = CFSTR("delegate");
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), WeakRetained);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v22[7] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained)
  v17 = self->_pendingResponse;
  if (v17)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("pendingResponse"));
  v18 = self->_lastError;
  if (v18)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("lastError"));
  if (self->_retryInterval != 0.25)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("retryInterval"));

  }
  return v16;
}

- (void)_onQueue_scheduleRetryAfterInterval:(double)a3
{
  OS_dispatch_queue *v5;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *retryTimer;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  OS_dispatch_queue *v12;
  _QWORD v13[4];
  OS_dispatch_queue *v14;
  id v15[2];
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_retryTimer)
  {
    objc_initWeak(&location, self);
    v5 = self->_queue;
    dispatch_get_global_queue(21, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v6);
    retryTimer = self->_retryTimer;
    self->_retryTimer = v7;

    v9 = self->_retryTimer;
    v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    v11 = self->_retryTimer;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__MPRequestResponseController__onQueue_scheduleRetryAfterInterval___block_invoke;
    v13[3] = &unk_1E315D898;
    v14 = v5;
    v12 = v5;
    objc_copyWeak(v15, &location);
    v15[1] = *(id *)&a3;
    dispatch_source_set_event_handler(v11, v13);
    dispatch_resume((dispatch_object_t)self->_retryTimer);
    objc_destroyWeak(v15);

    objc_destroyWeak(&location);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_response, 0);
  objc_storeStrong(&self->_request, 0);
  objc_storeStrong(&self->_pendingResponse, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_cancelToken, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_65(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void (**v5)(_QWORD);
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  void (**v33)(_QWORD);
  uint64_t v34;
  _QWORD block[5];
  id v36;
  char v37;
  _QWORD v38[5];
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_2_66;
  v38[3] = &unk_1E31635F8;
  v38[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v39 = v4;
  v5 = (void (**)(_QWORD))MEMORY[0x19403A810](v38);
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      v9 = *(void **)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v41 = v7;
      v42 = 2048;
      v43 = v8;
      v44 = 2114;
      v45 = v9;
      v10 = v7;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "RRC <%{public}@ %p>: Request failed with error: %{public}@", buf, 0x20u);

    }
    v11 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24);
    v12 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = (void *)objc_opt_class();
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v41 = v13;
      v42 = 2048;
      v43 = v14;
      v44 = 1024;
      LODWORD(v45) = v11;
      v15 = v13;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEBUG, "RRC <%{public}@ %p>: Recovering from error. shouldRetry: %d", buf, 0x1Cu);

    }
    LOBYTE(v12) = v11 != 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      LODWORD(v12) = objc_msgSend(v4, "controller:shouldRetryFailedRequestWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v16 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = (void *)objc_opt_class();
        v18 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138544130;
        v41 = v17;
        v42 = 2048;
        v43 = v18;
        v44 = 2048;
        v45 = v4;
        v46 = 1024;
        v47 = (int)v12;
        v19 = v17;
        _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_DEBUG, "RRC <%{public}@ %p>: Delegate %p returned shouldRetry: %d", buf, 0x26u);

      }
    }
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(a1 + 40);
    v22 = *(NSObject **)(v20 + 104);
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_71;
    block[3] = &unk_1E31623A8;
    block[4] = v20;
    v23 = &v36;
    v36 = v21;
    v37 = (char)v12;
    dispatch_async(v22, block);
    v5[2](v5);
  }
  else
  {
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(NSObject **)(v24 + 104);
    v28[0] = v3;
    v28[1] = 3221225472;
    v28[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_72;
    v28[3] = &unk_1E315D910;
    v28[4] = v24;
    v23 = &v29;
    v29 = *(id *)(a1 + 56);
    v30 = *(id *)(a1 + 64);
    v31 = v4;
    v26 = *(id *)(a1 + 48);
    v27 = *(_QWORD *)(a1 + 72);
    v32 = v26;
    v34 = v27;
    v33 = v5;
    dispatch_async(v25, v28);

  }
}

uint64_t __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_2_66(uint64_t a1)
{
  uint64_t result;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 112));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 40), "didFinishLoadingRequestForController:", *(_QWORD *)(a1 + 32));
  return result;
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_71(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v14 = 138543618;
    v15 = v3;
    v16 = 2048;
    v17 = v4;
    v5 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_INFO, "RRC <%{public}@ %p>: Needs reload [failed request]", (uint8_t *)&v14, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 1;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = 0;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_opt_class();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(v10 + 80);
      v12 = *(_QWORD *)(v10 + 40);
      v14 = 138543874;
      v15 = v9;
      v16 = 2048;
      v17 = v11;
      v18 = 2048;
      v19 = v12;
      v13 = v9;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_INFO, "RRC <%{public}@ %p>: Scheduling retry after %fs", (uint8_t *)&v14, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_scheduleRetryAfterInterval:", *(double *)(*(_QWORD *)(a1 + 32) + 40));
  }
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_72(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0x3FD0000000000000;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 16) == *(_QWORD *)(a1 + 48))
  {
    v5 = *(NSObject **)(v2 + 112);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_2_73;
    block[3] = &unk_1E315D8E8;
    v11 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 32);
    v13 = v6;
    v14 = v7;
    v9 = *(_OWORD *)(a1 + 72);
    v8 = (id)v9;
    v15 = v9;
    dispatch_async(v5, block);

  }
  else
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      *(_DWORD *)buf = 138543362;
      v17 = v4;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_INFO, "RRC %{public}@: Reloading [retry mismatched request revision]", buf, 0xCu);
    }

    dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 112), *(dispatch_block_t *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_reloadIfNeeded");
  }
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_2_73(uint64_t a1)
{
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = objc_opt_respondsToSelector();
  v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      v5 = (void *)objc_opt_class();
      v7 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v35 = v5;
      v36 = 2048;
      v37 = v7;
      v38 = 2048;
      v39 = v6;
      v40 = 2048;
      v41 = v8;
      v9 = v5;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEBUG, "RRC <%{public}@ %p>: Deferring replacement of %p to delegate %p", buf, 0x2Au);

    }
    v10 = objc_alloc(MEMORY[0x1E0D4D048]);
    v11 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_74;
    v30[3] = &unk_1E315D820;
    v12 = *(_QWORD *)(a1 + 56);
    v33 = *(_QWORD *)(a1 + 72);
    v30[4] = v12;
    v31 = *(id *)(a1 + 40);
    v32 = *(id *)(a1 + 32);
    v13 = (void *)objc_msgSend(v10, "initWithTimeout:interruptionHandler:", v30, 9.0);
    v14 = *(_QWORD *)(a1 + 56);
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_75;
    v23[3] = &unk_1E315D8C0;
    v24 = v13;
    v15 = *(void **)(a1 + 32);
    v25 = *(id *)(a1 + 40);
    v26 = *(id *)(a1 + 32);
    v16 = *(id *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 56);
    v18 = *(void **)(a1 + 64);
    v27 = v16;
    v28 = v17;
    v29 = v18;
    v19 = v13;
    objc_msgSend(v15, "controller:defersResponseReplacement:", v14, v23);

  }
  else
  {
    if (v4)
    {
      v20 = (void *)objc_opt_class();
      v21 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v35 = v20;
      v36 = 2048;
      v37 = v21;
      v22 = v20;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEBUG, "RRC <%{public}@ %p>: Replacing response", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 56), "setResponse:", *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_74(_QWORD *a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("MPRequestResponseController.m"), 394, CFSTR("MPRequestResponseController delegate did not call block passed to defersResponseReplacement."));

  }
  v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_opt_class();
    v5 = a1[5];
    v6 = a1[6];
    v9 = 138543874;
    v10 = v4;
    v11 = 2048;
    v12 = v5;
    v13 = 2048;
    v14 = v6;
    v7 = v4;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_ERROR, "RRC <%{public}@ %p>: Delegate %p timeout replacing response.", (uint8_t *)&v9, 0x20u);

  }
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_75(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "disarm");
  v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v8 = 138544130;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    v12 = 2048;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    v7 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEBUG, "RRC <%{public}@ %p>: Delegate %p replacing response with %p", (uint8_t *)&v8, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 64), "setResponse:", *(_QWORD *)(a1 + 56));
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 64) + 112), *(dispatch_block_t *)(a1 + 72));
}

void __67__MPRequestResponseController__onQueue_scheduleRetryAfterInterval___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4[2];

  v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__MPRequestResponseController__onQueue_scheduleRetryAfterInterval___block_invoke_2;
  v3[3] = &unk_1E315D870;
  objc_copyWeak(v4, (id *)(a1 + 40));
  v4[1] = *(id *)(a1 + 48);
  dispatch_async(v2, v3);
  objc_destroyWeak(v4);
}

void __67__MPRequestResponseController__onQueue_scheduleRetryAfterInterval___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 25))
    {
      *((double *)WeakRetained + 5) = fmin(*(double *)(a1 + 40) * 1.20000005, 15.0);
      v4 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = v3[10];
        v10 = 138543362;
        v11 = v5;
        _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_INFO, "RRC %{public}@: Reloading [retry, failed request]", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend(v3, "_onQueue_reloadIfNeeded");
    }
    else
    {
      v6 = *((_QWORD *)WeakRetained + 6);
      if (v6)
      {
        dispatch_source_cancel(v6);
        v7 = (void *)v3[6];
        v3[6] = 0;

      }
      v8 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = v3[10];
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEBUG, "RRC %{public}@: Scheduled reload skipped.", (uint8_t *)&v10, 0xCu);
      }

    }
  }

}

uint64_t __45__MPRequestResponseController_reloadIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_INFO, "RRC %{public}@: Reloading [requested by client]", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_reloadIfNeeded");
}

void __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke_28(_QWORD *a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("MPRequestResponseController.m"), 212, CFSTR("MPRequestResponseController delegate did not call block passed to defersResponseReplacement."));

  }
  v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = a1[5];
    v5 = a1[6];
    v7 = 138543618;
    v8 = v4;
    v9 = 2048;
    v10 = v5;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_ERROR, "RRC %{public}@: Delegate %p timeout replacing response.", (uint8_t *)&v7, 0x16u);
  }

}

uint64_t __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke_32(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "disarm");
  v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v6 = 138543874;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    v10 = 2048;
    v11 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEBUG, "RRC %{public}@: Delegate %p clearing response with %p", (uint8_t *)&v6, 0x20u);
  }

  return objc_msgSend(*(id *)(a1 + 56), "setResponse:", 0);
}

void __58__MPRequestResponseController_endAutomaticResponseLoading__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) < 1;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && (uint64_t)--*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) <= 0)
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Ending automatic reloading", (uint8_t *)&v4, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  }
}

uint64_t __35__MPRequestResponseController_init__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t (**v5)(id, void *);
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_onQueue_stateDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5[2](v5, v9);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
