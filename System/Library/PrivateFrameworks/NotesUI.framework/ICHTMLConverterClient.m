@implementation ICHTMLConverterClient

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1)
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_36);
  return (id)sharedClient_sharedClient;
}

void __37__ICHTMLConverterClient_sharedClient__block_invoke()
{
  ICHTMLConverterClient *v0;
  void *v1;

  v0 = objc_alloc_init(ICHTMLConverterClient);
  v1 = (void *)sharedClient_sharedClient;
  sharedClient_sharedClient = (uint64_t)v0;

}

- (ICHTMLConverterClient)init
{
  ICHTMLConverterClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICHTMLConverterClient;
  v2 = -[ICHTMLConverterClient init](&v6, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.notes.htmlconverter", v3);
    -[ICHTMLConverterClient setRequestCountQueue:](v2, "setRequestCountQueue:", v4);

    -[ICHTMLConverterClient setRequestCount:](v2, "setRequestCount:", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connectionToService, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ICHTMLConverterClient;
  -[ICHTMLConverterClient dealloc](&v3, sel_dealloc);
}

- (void)attributedStringFromHTMLString:(id)a3 baseURL:(id)a4 timeoutDate:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  void *v15;
  uint64_t v16;
  NSXPCConnection *connectionToService;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v12, "timeIntervalSinceNow");
  if (v14 > 0.0)
  {
    v15 = (void *)objc_msgSend(v13, "copy");
    -[ICHTMLConverterClient resumeConnectionIfNeeded](self, "resumeConnectionIfNeeded");
    v16 = MEMORY[0x1E0C809B0];
    connectionToService = self->_connectionToService;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke;
    v25[3] = &unk_1E5C20488;
    v25[4] = self;
    v18 = v10;
    v26 = v18;
    v19 = v11;
    v27 = v19;
    v28 = v12;
    v20 = v15;
    v29 = v20;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connectionToService, "remoteObjectProxyWithErrorHandler:", v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke_2;
    v23[3] = &unk_1E5C204B0;
    v23[4] = self;
    v24 = v20;
    v22 = v20;
    objc_msgSend(v21, "attributedStringFromHTMLString:baseURL:completionBlock:", v18, v19, v23);

  }
}

void __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  dispatch_time_t v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "HTML");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke_9;
  block[3] = &unk_1E5C20460;
  v12 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v14 = v12;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 64);
  dispatch_after(v11, MEMORY[0x1E0C80D38], block);

}

uint64_t __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "attributedStringFromHTMLString:baseURL:timeoutDate:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke_2_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v29 = v6;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, &v29);
    v27 = v29;

    v26 = (void *)MEMORY[0x1E0C99E20];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v28 = v5;
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v15, v16, v17, v18, v19, v20, v21, v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "decodeObjectOfClasses:forKey:", v23, *MEMORY[0x1E0CB2CD0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICDynamicCast();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishDecoding");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v5 = v28;
    v6 = v27;
  }

}

- (id)attributedStringFromHTMLString:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  dispatch_semaphore_t v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "HTML");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICHTMLConverterClient attributedStringFromHTMLString:].cold.1(v4, v5);

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__31;
  v20 = __Block_byref_object_dispose__31;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 10.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__ICHTMLConverterClient_attributedStringFromHTMLString___block_invoke;
  v12[3] = &unk_1E5C204D8;
  v8 = v4;
  v13 = v8;
  v15 = &v16;
  v9 = v7;
  v14 = v9;
  -[ICHTMLConverterClient attributedStringFromHTMLString:baseURL:timeoutDate:completionBlock:](self, "attributedStringFromHTMLString:baseURL:timeoutDate:completionBlock:", v8, 0, v6, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __56__ICHTMLConverterClient_attributedStringFromHTMLString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.notes", "HTML");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __56__ICHTMLConverterClient_attributedStringFromHTMLString___block_invoke_cold_1(a1, v3, v5);

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = v3;
    v5 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "length");
      v9 = 134217984;
      v10 = v8;
      _os_log_impl(&dword_1AC7A1000, v5, OS_LOG_TYPE_INFO, "Could not convert HTML string (length=%ld) to attributed string", (uint8_t *)&v9, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)resumeConnectionIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  -[ICHTMLConverterClient requestCountQueue](self, "requestCountQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ICHTMLConverterClient_resumeConnectionIfNeeded__block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __49__ICHTMLConverterClient_resumeConnectionIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[1])
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
    ICNoteHTMLConverterBundleIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithServiceName:", v4);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = v5;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EED6F550);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setRemoteObjectInterface:", v8);

LABEL_5:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resume");
    return objc_msgSend(*(id *)(a1 + 32), "setRequestCount:", objc_msgSend(*(id *)(a1 + 32), "requestCount") + 1);
  }
  if (!objc_msgSend(v2, "requestCount"))
    goto LABEL_5;
  return objc_msgSend(*(id *)(a1 + 32), "setRequestCount:", objc_msgSend(*(id *)(a1 + 32), "requestCount") + 1);
}

- (void)suspendConnectionIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  -[ICHTMLConverterClient requestCountQueue](self, "requestCountQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ICHTMLConverterClient_suspendConnectionIfNeeded__block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __50__ICHTMLConverterClient_suspendConnectionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "requestCount");
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRequestCount:", objc_msgSend(*(id *)(a1 + 32), "requestCount") - 1);
    result = objc_msgSend(*(id *)(a1 + 32), "requestCount");
    if (!result)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "suspend");
  }
  return result;
}

- (OS_dispatch_queue)requestCountQueue
{
  return self->_requestCountQueue;
}

- (void)setRequestCountQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestCountQueue, a3);
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCountQueue, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

void __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, a2, a3, "Error reaching HTML converter service: %@", a5, a6, a7, a8, 2u);
}

void __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, a2, a3, "Error converting HTML to attributed string: %@", a5, a6, a7, a8, 2u);
}

- (void)attributedStringFromHTMLString:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "length");
  _os_log_debug_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_DEBUG, "Synchronously converting HTML to attributed string (HTML length=%ld)", (uint8_t *)&v3, 0xCu);
}

void __56__ICHTMLConverterClient_attributedStringFromHTMLString___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*(id *)(a1 + 32), "length");
  v6 = 134218240;
  v7 = v5;
  v8 = 2048;
  v9 = objc_msgSend(a2, "length");
  _os_log_debug_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_DEBUG, "Converted HTML string (length=%ld) to attributed string (length=%ld)", (uint8_t *)&v6, 0x16u);
}

@end
