@implementation C2Session

- (void)sessionTaskDelegateCallbackHelper:(id)a3 task:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  C2Session *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *context;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  context = (void *)MEMORY[0x1D8269840]();
  v11 = self;
  objc_sync_enter(v11);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "taskIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11)
      goto LABEL_3;
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("C2Session.m"), 425, CFSTR("C2Session must not be nil."));

    if (v8)
      goto LABEL_4;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("C2Session.m"), 424, CFSTR("task %@ should always have a task identifier"), v9);

  if (!v11)
    goto LABEL_31;
LABEL_3:
  if (v8)
    goto LABEL_4;
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("C2Session.m"), 425, CFSTR("NSURLSession must not be nil."));

LABEL_4:
  -[C2Session session](v11, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = objc_claimAutoreleasedReturnValue();

  if (v15 | v17)
  {
    if (-[C2Session isComplete](v11, "isComplete"))
      goto LABEL_11;
    if (v15)
    {
      if (v17)
      {
LABEL_8:
        if ((objc_msgSend((id)v15, "isEqual:", v17) & 1) != 0)
          goto LABEL_11;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("C2Session.m"), 425, CFSTR("Callbacks should only occur for member session. %@ != %@"), v15, v17);
        goto LABEL_34;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("C2Session.m"), 425, CFSTR("C2Session missing background configuration identifier."));

      if (v17)
        goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("C2Session.m"), 425, CFSTR("NSURLSession missing background configuration identifier."));

    goto LABEL_8;
  }
  -[C2Session session](v11, "session");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19 == v8)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2Session session](v11, "session");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("C2Session.m"), 425, CFSTR("Callbacks should only occur for member session. %@ != %@"), v36, v8);

LABEL_34:
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2Session queue](v11, "queue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if ((v22 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("C2Session.m"), 425, CFSTR("Callbacks should always occur on member queue"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](v11->_wrappedTaskByTaskIdentifier, "objectForKeyedSubscript:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v11);

  if (v23)
  {
    objc_msgSend(v23, "taskDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("C2Session.m"), 430, CFSTR("wrappedTask %@ should always have a task description"), v23);

    }
    objc_msgSend(v9, "taskDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      if ((objc_msgSend(v25, "isEqual:", v24) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("C2Session.m"), 435, CFSTR("taskDescription (%@) inconsistent with expected taskDescription (%@)"), v26, v24);

      }
    }
    else
    {
      if (C2_DEFAULT_LOG_BLOCK_5 != -1)
        dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_109_0);
      v29 = C2_DEFAULT_LOG_INTERNAL_5;
      if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v42 = v12;
        _os_log_impl(&dword_1D4DC3000, v29, OS_LOG_TYPE_ERROR, "task %{public}@ lost its task description", buf, 0xCu);
      }
    }
    -[C2Session options](v11, "options");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleCallbackForSessionTask:dataTask:callback:", v23, v9, v10);

  }
  else
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_113_0);
    v28 = C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v42 = v12;
      _os_log_impl(&dword_1D4DC3000, v28, OS_LOG_TYPE_INFO, "ignoring callback for unknown task %{public}@", buf, 0xCu);
    }
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

  objc_autoreleasePoolPop(context);
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (C2RequestOptions)options
{
  return self->_options;
}

void __88__C2Session_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_123);
  v7 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[6];
    v11 = a1[7];
    v12 = (const void *)a1[8];
    v13 = v7;
    v14 = _Block_copy(v12);
    v15 = 138544386;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_1D4DC3000, v13, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ task:%{public}@ _willSendRequestForEstablishedConnection:%{public}@ completionHandler:%{public}@]", (uint8_t *)&v15, 0x34u);

  }
  if (v6)
    objc_msgSend(v6, "URLSession:task:_willSendRequestForEstablishedConnection:completionHandler:", a1[5], a1[6], a1[7], a1[8]);
  else
    (*(void (**)(void))(a1[8] + 16))();

}

void __85__C2Session_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke(_QWORD *a1, void *a2, void *a3)
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
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_117_0);
  v7 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[6];
    v11 = a1[7];
    v12 = a1[8];
    v13 = a1[9];
    v14 = 138544642;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v10;
    v20 = 2048;
    v21 = v11;
    v22 = 2048;
    v23 = v12;
    v24 = 2048;
    v25 = v13;
    _os_log_impl(&dword_1D4DC3000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ task:%{public}@ didSendBodyData:%lld totalBytesSent:%lld totalBytesExpectedToSend:%lld]", (uint8_t *)&v14, 0x3Eu);
  }
  objc_msgSend(v6, "URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:", a1[5], a1[6], a1[7], a1[8], a1[9]);

}

void __70__C2Session_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_128);
  v7 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[6];
    v11 = a1[7];
    v12 = (const void *)a1[8];
    v13 = v7;
    v14 = _Block_copy(v12);
    v15 = 138544386;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_1D4DC3000, v13, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ dataTask:%{public}@ didReceiveResponse:%{public}@ completionHandler:%{public}@]", (uint8_t *)&v15, 0x34u);

  }
  if (v6)
    objc_msgSend(v6, "URLSession:dataTask:didReceiveResponse:completionHandler:", a1[5], a1[6], a1[7], a1[8]);
  else
    (*(void (**)(void))(a1[8] + 16))();

}

void __67__C2Session_URLSession_dataTask__didReceiveData_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_130_0);
  v7 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[4];
    v9 = a1[5];
    v11 = a1[6];
    v10 = (void *)a1[7];
    v12 = v7;
    v17 = 138544130;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    v21 = 2114;
    v22 = v11;
    v23 = 2048;
    v24 = objc_msgSend(v10, "length");
    _os_log_impl(&dword_1D4DC3000, v12, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ dataTask:%{public}@ _didReceiveData:(binary data of length %lld)]", (uint8_t *)&v17, 0x2Au);

  }
  v13 = objc_opt_respondsToSelector();
  v14 = a1[5];
  v15 = a1[6];
  v16 = a1[7];
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v6, "URLSession:dataTask:_didReceiveData:completionHandler:", v14, v15, v16, a1[8]);
  }
  else
  {
    objc_msgSend(v6, "URLSession:dataTask:didReceiveData:", v14, v15, v16);
    (*(void (**)(void))(a1[8] + 16))();
  }

}

void __56__C2Session_URLSession_task_didFinishCollectingMetrics___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_118);
  v7 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[6];
    v11 = a1[7];
    v12 = 138544131;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2113;
    v19 = v11;
    _os_log_impl(&dword_1D4DC3000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ task:%{public}@ didFinishCollectingMetrics:%{private}@]", (uint8_t *)&v12, 0x2Au);
  }
  objc_msgSend(v5, "didFinishCollectingMetrics:", a1[7]);

}

void __50__C2Session_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_119_0);
  v7 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v19 = 138544130;
    v20 = v8;
    v21 = 2114;
    v22 = v9;
    v23 = 2114;
    v24 = v10;
    v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_1D4DC3000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ task:%{public}@ didCompleteWithError:%{public}@]", (uint8_t *)&v19, 0x2Au);
  }
  if (!*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "response");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "response");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allHeaderFields");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("x-apple-c2-route"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 && objc_msgSend(v16, "length"))
        objc_msgSend(*(id *)(a1 + 32), "C2Session:sessionTask:updatedRoute:", *(_QWORD *)(a1 + 32), v5, v16);

    }
  }
  objc_msgSend(v5, "captureMetricsWithError:eventType:", *(_QWORD *)(a1 + 56), 1);
  if (v5)
  {
    v17 = *(id *)(a1 + 32);
    objc_sync_enter(v17);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", v5);
    objc_sync_exit(v17);

  }
  objc_msgSend(v5, "C2Session:task:didCompleteWithError:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 56));
  objc_msgSend(v6, "URLSession:task:didCompleteWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (v5)
  {
    v18 = *(id *)(a1 + 32);
    objc_sync_enter(v18);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", v5);
    objc_sync_exit(v18);

  }
}

void __53__C2Session__recalculateSessionDelegateQueuePriority__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  objc_msgSend(a3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "qualityOfService");

  if (v5 <= 16)
  {
    if (v5 == -1)
    {
      v6 = 2;
      goto LABEL_13;
    }
    if (v5 == 9)
    {
      v6 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    switch(v5)
    {
      case 33:
        v6 = 4;
        goto LABEL_13;
      case 25:
        v6 = 3;
        goto LABEL_13;
      case 17:
        v6 = 1;
        goto LABEL_13;
    }
  }
  v6 = -1;
LABEL_13:
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8 <= 16)
  {
    if (v8 == -1)
    {
      v9 = 2;
      goto LABEL_25;
    }
    if (v8 == 9)
    {
      v9 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    switch(v8)
    {
      case 33:
        v9 = 4;
        goto LABEL_25;
      case 25:
        v9 = 3;
        goto LABEL_25;
      case 17:
        v9 = 1;
        goto LABEL_25;
    }
  }
  v9 = -1;
LABEL_25:
  if (v6 > v9)
    *(_QWORD *)(v7 + 24) = v5;
}

- (void)C2Session:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  C2Session *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  C2Session *v15;
  __int16 v16;
  C2Session *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = (C2Session *)a3;
  v10 = a4;
  v11 = a5;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_91);
  v12 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138544130;
    v15 = self;
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_1D4DC3000, v12, OS_LOG_TYPE_DEBUG, "[%{public}@ C2Session:%{public}@ task:%{public}@ didCompleteWithError:%{public}@]", (uint8_t *)&v14, 0x2Au);
  }
  if (v9 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2Session.m"), 385, CFSTR("Callbacks should only occur for self."));

  }
  -[C2Session removeTask:](self, "removeTask:", v10);

}

- (id)addTask:(id)a3 withDescription:(id)a4 request:(id)a5
{
  id v9;
  NSURLSession *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  C2Session *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  NSURLSession *session;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  C2Session *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  NSURLSession *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (NSURLSession *)a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2Session.m"), 179, CFSTR("taskDescription must not be nil."));

    if (v11)
      goto LABEL_4;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2Session.m"), 178, CFSTR("task must not be nil."));

  if (!v10)
    goto LABEL_26;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2Session.m"), 180, CFSTR("request must not be nil."));

LABEL_4:
  -[NSURLSession dataTaskWithRequest:](self->_session, "dataTaskWithRequest:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_48_1);
    v13 = C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v38 = self;
      v39 = 2114;
      v40 = v9;
      v41 = 2114;
      v42 = v10;
      v43 = 2114;
      v44 = v11;
      _os_log_impl(&dword_1D4DC3000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@ addTask:%{public}@ withDescription:%{public}@ request:%{public}@]", buf, 0x2Au);
    }
    objc_msgSend(v12, "setTaskDescription:", v10);
    objc_msgSend(v9, "setTask:", v12);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "taskIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2Session.m"), 196, CFSTR("Task identifier should always be set."));

  }
  if (v12)
  {
    v15 = self;
    objc_sync_enter(v15);
    -[C2Session wrappedTaskByTaskIdentifier](v15, "wrappedTaskByTaskIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("C2Session.m"), 202, CFSTR("task mapping must not be nil"));

    }
    -[C2Session wrappedTaskByTaskIdentifier](v15, "wrappedTaskByTaskIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2Session wrappedTaskByTaskIdentifier](v15, "wrappedTaskByTaskIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", v14);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("C2Session.m"), 203, CFSTR("A delegate for task %@ has already been set: %@"), v14, v35);

    }
    -[C2Session wrappedTaskByTaskIdentifier](v15, "wrappedTaskByTaskIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v9, v14);

    -[C2Session wrappedTaskByTaskIdentifier](v15, "wrappedTaskByTaskIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23 == 0;

    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("C2Session.m"), 205, CFSTR("invariant broken."));

    }
    -[C2Session _recalculateSessionDelegateQueuePriority](v15, "_recalculateSessionDelegateQueuePriority");
    v15->_emptyTimestamp = -1;
    objc_sync_exit(v15);

  }
  else
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_55);
    v25 = C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
    {
      session = self->_session;
      *(_DWORD *)buf = 138543874;
      v38 = self;
      v39 = 2114;
      v40 = v11;
      v41 = 2114;
      v42 = session;
      _os_log_impl(&dword_1D4DC3000, v25, OS_LOG_TYPE_ERROR, "%{public}@ can't create a new data task with request %{public}@ in session %{public}@", buf, 0x20u);
    }
  }

  return v12;
}

- (void)cleanupRetainCycle
{
  C2Session *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSURLSession *session;
  NSOperationQueue *queue;
  void (**testBehavior_cleanupRetainCycle)(void);
  id v9;
  C2Session *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (obj->_isComplete)
  {
    -[C2Session wrappedTaskByTaskIdentifier](obj, "wrappedTaskByTaskIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = obj;
    if (v3)
    {
      -[C2Session wrappedTaskByTaskIdentifier](obj, "wrappedTaskByTaskIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      v2 = obj;
      if (!v5)
      {
        session = obj->_session;
        obj->_session = 0;

        queue = obj->_queue;
        obj->_queue = 0;

        v2 = obj;
        testBehavior_cleanupRetainCycle = (void (**)(void))obj->_testBehavior_cleanupRetainCycle;
        if (testBehavior_cleanupRetainCycle)
        {
          testBehavior_cleanupRetainCycle[2]();
          v9 = obj->_testBehavior_cleanupRetainCycle;
          obj->_testBehavior_cleanupRetainCycle = 0;

          v2 = obj;
        }
      }
    }
  }
  objc_sync_exit(v2);

}

- (NSMutableDictionary)wrappedTaskByTaskIdentifier
{
  return self->_wrappedTaskByTaskIdentifier;
}

- (void)removeTask:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  C2Session *v8;
  id v9;
  BOOL v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  C2Session *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2Session.m"), 215, CFSTR("task must not be nil."), 0);

  }
  objc_msgSend(v5, "taskIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2Session.m"), 217, CFSTR("Task identifier should always be set."));

  }
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_62);
  v7 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v19 = self;
    v20 = 2114;
    v21 = v5;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_1D4DC3000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@ removeTask:%{public}@] - withIdentifier:%{public}@", buf, 0x20u);
  }
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_wrappedTaskByTaskIdentifier, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9 == v5;

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v8->_wrappedTaskByTaskIdentifier, "objectForKeyedSubscript:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("C2Session.m"), 220, CFSTR("taskIdentifier(%@) should be map to task (%@) but mapped to (%@) "), v6, v5, v16);

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_wrappedTaskByTaskIdentifier, "setObject:forKeyedSubscript:", 0, v6);
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_wrappedTaskByTaskIdentifier, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("C2Session.m"), 222, CFSTR("wrapped task should no longer be present"));

  }
  -[C2Session _recalculateSessionDelegateQueuePriority](v8, "_recalculateSessionDelegateQueuePriority");
  if (!-[NSMutableDictionary count](v8->_wrappedTaskByTaskIdentifier, "count"))
    v8->_emptyTimestamp = mach_absolute_time();
  objc_sync_exit(v8);

  -[C2Session cleanupRetainCycle](v8, "cleanupRetainCycle");
}

- (void)C2Session:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v7;
  void (**testBehavior_sessionInvalidated_shouldInvalidate)(void);
  id v9;
  C2Session *v10;
  C2SessionDelegate *v11;
  C2SessionDelegate *sessionDelegate;
  void (**testBehavior_sessionInvalidated_cfnetwork)(void);
  id v14;
  C2Session *v15;
  void *v16;
  void *v17;
  C2Session *v18;

  v18 = (C2Session *)a3;
  v7 = a4;
  if (v18 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2Session.m"), 358, CFSTR("Callbacks should only occur for self."));

  }
  testBehavior_sessionInvalidated_shouldInvalidate = (void (**)(void))self->_testBehavior_sessionInvalidated_shouldInvalidate;
  if (testBehavior_sessionInvalidated_shouldInvalidate)
  {
    testBehavior_sessionInvalidated_shouldInvalidate[2]();
    v9 = self->_testBehavior_sessionInvalidated_shouldInvalidate;
    self->_testBehavior_sessionInvalidated_shouldInvalidate = 0;

  }
  v10 = self;
  objc_sync_enter(v10);
  v11 = v10->_sessionDelegate;
  sessionDelegate = v10->_sessionDelegate;
  v10->_sessionDelegate = 0;

  objc_sync_exit(v10);
  testBehavior_sessionInvalidated_cfnetwork = (void (**)(void))v10->_testBehavior_sessionInvalidated_cfnetwork;
  if (testBehavior_sessionInvalidated_cfnetwork)
  {
    testBehavior_sessionInvalidated_cfnetwork[2]();
    v14 = v10->_testBehavior_sessionInvalidated_cfnetwork;
    v10->_testBehavior_sessionInvalidated_cfnetwork = 0;

  }
  -[C2SessionDelegate C2Session:didBecomeInvalidWithError:](v11, "C2Session:didBecomeInvalidWithError:", v10, v7);
  v15 = v10;
  objc_sync_enter(v15);
  if (v15->_isComplete)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("C2Session.m"), 375, CFSTR("received duplicate callbacks"));

  }
  v15->_isComplete = 1;
  objc_sync_exit(v15);

  -[C2Session cleanupRetainCycle](v15, "cleanupRetainCycle");
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  C2Session *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  BOOL v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  C2Session *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_92);
  v9 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v29 = self;
    v30 = 2114;
    v31 = v7;
    v32 = 2114;
    v33 = v8;
    _os_log_impl(&dword_1D4DC3000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ URLSession:%{public}@ didBecomeInvalidWithError:%{public}@]", buf, 0x20u);
  }
  v10 = self;
  objc_sync_enter(v10);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("C2Session.m"), 411, CFSTR("C2Session must not be nil."));

  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("C2Session.m"), 411, CFSTR("NSURLSession must not be nil."));

  }
  -[C2Session session](v10, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = objc_claimAutoreleasedReturnValue();

  if (!(v13 | v15))
  {
    -[C2Session session](v10, "session");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v17 == v7;

    if (v18)
      goto LABEL_18;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2Session session](v10, "session");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("C2Session.m"), 411, CFSTR("Callbacks should only occur for member session. %@ != %@"), v25, v7);

    goto LABEL_22;
  }
  if (!-[C2Session isComplete](v10, "isComplete"))
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("C2Session.m"), 411, CFSTR("C2Session missing background configuration identifier."));

    }
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("C2Session.m"), 411, CFSTR("NSURLSession missing background configuration identifier."));

    }
    if ((objc_msgSend((id)v13, "isEqual:", v15) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("C2Session.m"), 411, CFSTR("Callbacks should only occur for member session. %@ != %@"), v13, v15);
LABEL_22:

    }
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2Session queue](v10, "queue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  if ((v21 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("C2Session.m"), 411, CFSTR("Callbacks should always occur on member queue"));

  }
  objc_sync_exit(v10);

  -[C2Session C2Session:didBecomeInvalidWithError:](v10, "C2Session:didBecomeInvalidWithError:", v10, v8);
}

- (void)_recalculateSessionDelegateQueuePriority
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  C2Session *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 9;
  -[C2Session wrappedTaskByTaskIdentifier](self, "wrappedTaskByTaskIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__C2Session__recalculateSessionDelegateQueuePriority__block_invoke;
  v12[3] = &unk_1E9898F60;
  v12[4] = &v13;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v12);

  v4 = v14[3];
  -[C2Session session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v4 == objc_msgSend(v6, "qualityOfService");

  if ((v4 & 1) == 0)
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_34_1);
    v7 = (id)C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      +[C2RequestOptions stringForQualityOfService:](C2RequestOptions, "stringForQualityOfService:", v14[3]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_1D4DC3000, v7, OS_LOG_TYPE_INFO, "%{public}@ Changing delegate callback queue QoS to %{public}@", buf, 0x16u);

    }
    v9 = v14[3];
    -[C2Session session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setQualityOfService:", v9);

  }
  _Block_object_dispose(&v13, 8);
}

- (BOOL)shouldInvalidateAndCancel
{
  C2Session *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t emptyTimestamp;
  NSObject *v8;
  const char *v9;
  C2SessionDelegate *sessionDelegate;
  double v11;
  double v12;
  double v13;
  C2SessionDelegate *v14;
  _BOOL4 v15;
  NSObject *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void (**testBehavior_callbackHung)(id, uint64_t);
  NSObject *v34;
  const __CFString *v35;
  void *v37;
  void *v38;
  void *v39;
  uint8_t v40[16];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE buf[22];
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  double v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  mach_absolute_time();
  v39 = (void *)objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NSMutableDictionary count](v4->_wrappedTaskByTaskIdentifier, "count");
  if (!v4->_sessionDelegate)
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_78);
    v8 = C2_DEFAULT_LOG_INTERNAL_5;
    if (!os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
      goto LABEL_23;
    sessionDelegate = v4->_sessionDelegate;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = sessionDelegate;
    v9 = "[%@ shouldInvalidateAndCancel] - Session State Undefined, _sessionDelegate:%@";
LABEL_13:
    _os_log_impl(&dword_1D4DC3000, v8, OS_LOG_TYPE_DEBUG, v9, buf, 0x16u);
    goto LABEL_23;
  }
  v6 = v5;
  emptyTimestamp = v4->_emptyTimestamp;
  if (v5)
  {
    if (emptyTimestamp != -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (C2_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_76);
    v8 = C2_DEFAULT_LOG_INTERNAL_5;
    if (!os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
      goto LABEL_23;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v6;
    v9 = "[%@ shouldInvalidateAndCancel] - %lld outstanding tasks";
    goto LABEL_13;
  }
  if (emptyTimestamp == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  TMConvertTicksToSeconds();
  v12 = v11;
  -[C2RequestOptions emptySessionExpiryInSeconds](v4->_options, "emptySessionExpiryInSeconds");
  if (v12 > v13)
  {
    v14 = v4->_sessionDelegate;
    v4->_sessionDelegate = 0;

    objc_sync_exit(v4);
    v15 = 1;
    goto LABEL_39;
  }
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_70);
  v16 = (id)C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = v4->_emptyTimestamp;
    -[C2RequestOptions emptySessionExpiryInSeconds](v4->_options, "emptySessionExpiryInSeconds");
    v19 = v18;
    -[C2RequestOptions emptySessionExpiryInSeconds](v4->_options, "emptySessionExpiryInSeconds");
    v21 = v20;
    TMConvertTicksToSeconds();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v17;
    v47 = 2048;
    v48 = v19;
    v49 = 2048;
    v50 = v21 - v22;
    _os_log_impl(&dword_1D4DC3000, v16, OS_LOG_TYPE_DEBUG, "[%@ shouldInvalidateAndCancel] - emptyTimestamp:%llu expirySeconds:%.0f secondsRemaining:%.0f", buf, 0x2Au);
  }

LABEL_23:
  -[NSMutableDictionary allValues](v4->_wrappedTaskByTaskIdentifier, "allValues");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObjectsFromArray:", v23);

  -[NSMutableSet allObjects](v4->_didCompleteWithErrorRunningTasks, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObjectsFromArray:", v24);

  objc_sync_exit(v4);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = v39;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v42;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v42 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v28);
        v30 = objc_msgSend(v29, "callbackHung");
        if ((_DWORD)v30)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v29, "activity");
          v31 = objc_claimAutoreleasedReturnValue();
          os_activity_scope_enter(v31, (os_activity_scope_state_t)buf);

          if (C2_DEFAULT_LOG_BLOCK_5 != -1)
            dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_80);
          v32 = C2_DEFAULT_LOG_INTERNAL_5;
          if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v40 = 0;
            _os_log_impl(&dword_1D4DC3000, v32, OS_LOG_TYPE_FAULT, "C2 callback hung.", v40, 2u);
          }
          os_activity_scope_leave((os_activity_scope_state_t)buf);
        }
        testBehavior_callbackHung = (void (**)(id, uint64_t))v4->_testBehavior_callbackHung;
        if (testBehavior_callbackHung)
          testBehavior_callbackHung[2](testBehavior_callbackHung, v30);
        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v26);
  }

  v15 = 0;
LABEL_39:
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_82);
  v34 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v35 = CFSTR("false");
    if (v15)
      v35 = CFSTR("true");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v35;
    _os_log_impl(&dword_1D4DC3000, v34, OS_LOG_TYPE_DEBUG, "[%@ shouldInvalidateAndCancel] --> %{public}@", buf, 0x16u);
  }

  return v15;
}

- (NSString)sessionConfigurationName
{
  return self->_sessionConfigurationName;
}

- (void)invalidateAndCancel
{
  -[NSURLSession invalidateAndCancel](self->_session, "invalidateAndCancel");
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_isComplete)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2Session.m"), 133, CFSTR("C2Session should always be complete at this point."));

  }
  v5.receiver = self;
  v5.super_class = (Class)C2Session;
  -[C2Session dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_testBehavior_callbackHung, 0);
  objc_storeStrong(&self->_testBehavior_cleanupRetainCycle, 0);
  objc_storeStrong(&self->_testBehavior_sessionInvalidated_shouldInvalidate, 0);
  objc_storeStrong(&self->_testBehavior_sessionInvalidated_cfnetwork, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wrappedTaskByTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionDelegate, 0);
  objc_storeStrong((id *)&self->_didCompleteWithErrorRunningTasks, 0);
  objc_storeStrong((id *)&self->_routeHost, 0);
  objc_storeStrong((id *)&self->_originalHost, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionConfigurationName, 0);
}

- (id)createTaskWithOptions:(id)a3 delegate:(id)a4
{
  NSURLSession *v6;
  id v7;
  NSObject *v8;
  C2SessionTask *v9;
  C2SessionTask *v10;
  C2SessionTask *v11;
  NSObject *v12;
  NSObject *v13;
  NSURLSession *session;
  int v16;
  C2Session *v17;
  __int16 v18;
  NSURLSession *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (NSURLSession *)a3;
  v7 = a4;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_27_1);
  v8 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138543874;
    v17 = self;
    v18 = 2114;
    v19 = v6;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_1D4DC3000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@ createDataTaskWithOptions:%{public}@ delegate:%{public}@]", (uint8_t *)&v16, 0x20u);
  }
  if (v6 && v7)
  {
    v9 = -[C2SessionTask initWithOptions:delegate:sessionTaskDelegate:]([C2SessionTask alloc], "initWithOptions:delegate:sessionTaskDelegate:", v6, v7, self);
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      if (C2_DEFAULT_LOG_BLOCK_5 != -1)
        dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_32_2);
      v13 = C2_DEFAULT_LOG_INTERNAL_5;
      if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
      {
        session = self->_session;
        v16 = 138543618;
        v17 = self;
        v18 = 2114;
        v19 = session;
        _os_log_impl(&dword_1D4DC3000, v13, OS_LOG_TYPE_ERROR, "%{public}@ can't create a new wrapped data task in session %{public}@", (uint8_t *)&v16, 0x16u);
      }
    }

  }
  else
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_29);
    v12 = C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
    {
      v16 = 138543874;
      v17 = self;
      v18 = 2114;
      v19 = v6;
      v20 = 2114;
      v21 = v7;
      _os_log_impl(&dword_1D4DC3000, v12, OS_LOG_TYPE_ERROR, "missing required arguments - [%{public}@ createTaskWithOptions:%{public}@ delegate:%{public}@]", (uint8_t *)&v16, 0x20u);
    }
    v10 = 0;
  }

  return v10;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__C2Session_URLSession_task_didFinishCollectingMetrics___block_invoke;
  v14[3] = &unk_1E9899100;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[C2Session sessionTaskDelegateCallbackHelper:task:block:](self, "sessionTaskDelegateCallbackHelper:task:block:", v13, v12, v14);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__C2Session_URLSession_task_didCompleteWithError___block_invoke;
  v14[3] = &unk_1E9899100;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[C2Session sessionTaskDelegateCallbackHelper:task:block:](self, "sessionTaskDelegateCallbackHelper:task:block:", v13, v12, v14);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__C2Session_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v18[3] = &unk_1E9899148;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[C2Session sessionTaskDelegateCallbackHelper:task:block:](self, "sessionTaskDelegateCallbackHelper:task:block:", v17, v16, v18);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__C2Session_URLSession_dataTask__didReceiveData_completionHandler___block_invoke;
  v18[3] = &unk_1E9899148;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[C2Session sessionTaskDelegateCallbackHelper:task:block:](self, "sessionTaskDelegateCallbackHelper:task:block:", v17, v16, v18);

}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;
  int64_t v20;
  int64_t v21;

  v12 = a3;
  v13 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__C2Session_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke;
  v16[3] = &unk_1E98990D8;
  v16[4] = self;
  v17 = v12;
  v18 = v13;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v14 = v13;
  v15 = v12;
  -[C2Session sessionTaskDelegateCallbackHelper:task:block:](self, "sessionTaskDelegateCallbackHelper:task:block:", v15, v14, v16);

}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__C2Session_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke;
  v18[3] = &unk_1E9899148;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[C2Session sessionTaskDelegateCallbackHelper:task:block:](self, "sessionTaskDelegateCallbackHelper:task:block:", v17, v16, v18);

}

- (C2Session)initWithSessionConfigurationName:(id)a3 routeHost:(id)a4 options:(id)a5 sessionDelegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  C2Session *v14;
  C2Session *v15;
  __objc2_class_ro **p_info;
  __objc2_class_ro **v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  __objc2_class_ro **v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id testBehavior_sessionInvalidated_cfnetwork;
  id testBehavior_sessionInvalidated_shouldInvalidate;
  id testBehavior_cleanupRetainCycle;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  __objc2_class_ro **v51;
  Class aClassa;
  objc_class *aClass;
  uint64_t v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  id obj;
  id v60;
  objc_super v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  C2Session *v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (C2Session *)a6;
  v61.receiver = self;
  v61.super_class = (Class)C2Session;
  v15 = -[C2Session init](&v61, sel_init);
  p_info = C2MetricOperationOptions.info;
  v17 = C2MetricOperationOptions.info;
  if (!v15)
    goto LABEL_36;
  if (!v11 || !v13 || !v14)
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_11);
    v27 = C2_DEFAULT_LOG_INTERNAL_5;
    v28 = os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR);
    v17 = C2MetricOperationOptions.info;
    p_info = C2MetricOperationOptions.info;
    if (v28)
    {
      *(_DWORD *)buf = 138412802;
      v63 = v11;
      v64 = 2112;
      v65 = v13;
      v66 = 2112;
      v67 = v14;
      _os_log_impl(&dword_1D4DC3000, v27, OS_LOG_TYPE_ERROR, "missing required arguments - [C2Session initWithSessionConfigurationName:%@ options:%@ sessionDelegate:%@]", buf, 0x20u);
      p_info = C2MetricOperationOptions.info;
      v17 = C2MetricOperationOptions.info;
    }
    goto LABEL_36;
  }
  objc_msgSend(v13, "sessionConfigurationWithName:", v11);
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v29 = C2MetricOperationOptions.info;
    if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_5);
      v29 = (__objc2_class_ro **)(C2MetricOperationOptions + 32);
    }
    v30 = v29[224];
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    v17 = (__objc2_class_ro **)(C2MetricOperationOptions + 32);
    p_info = (__objc2_class_ro **)(C2MetricOperationOptions + 32);
    if (v31)
    {
      *(_DWORD *)buf = 138412290;
      v63 = v13;
      _os_log_impl(&dword_1D4DC3000, v30, OS_LOG_TYPE_ERROR, "failed to create NSURLSessionConfiguration for C2Session from Options %@", buf, 0xCu);
      p_info = (__objc2_class_ro **)(C2MetricOperationOptions + 32);
      v17 = (__objc2_class_ro **)(C2MetricOperationOptions + 32);
    }
    goto LABEL_36;
  }
  v19 = (void *)v18;
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v20)
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_7_0);
    v32 = C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4DC3000, v32, OS_LOG_TYPE_ERROR, "failed to create NSMutableDictionary for C2Session", buf, 2u);
    }
    goto LABEL_35;
  }
  v60 = v20;
  obj = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (!obj)
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_10);
    v33 = C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4DC3000, v33, OS_LOG_TYPE_ERROR, "failed to create NSMutableSet for C2Session", buf, 2u);
    }
    goto LABEL_34;
  }
  v21 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  if (!v21)
  {
    if (C2_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_13_0);
    v34 = C2_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4DC3000, v34, OS_LOG_TYPE_ERROR, "failed to create NSOperationQueue for C2Session", buf, 2u);
    }

LABEL_34:
LABEL_35:

    v17 = C2MetricOperationOptions.info;
    p_info = C2MetricOperationOptions.info;
LABEL_36:
    if (p_info[215] != (__objc2_class_ro *)-1)
    {
      v51 = v17;
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_19_1);
      v17 = v51;
    }
    v35 = v17[224];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4DC3000, v35, OS_LOG_TYPE_ERROR, "failed to create C2Session", buf, 2u);
    }
    v15->_isComplete = 1;

    v15 = 0;
    goto LABEL_41;
  }
  v55 = v12;
  v58 = v19;
  v22 = v21;
  -[C2Session underlyingDelegateQueue](v14, "underlyingDelegateQueue");
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    -[C2Session underlyingDelegateQueue](v14, "underlyingDelegateQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setUnderlyingQueue:", v23);

  }
  v56 = v22;
  objc_msgSend(v22, "setQualityOfService:", 9);
  v24 = objc_opt_class();
  objc_msgSend(v13, "networkingDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    v26 = (void *)objc_opt_class();
  else
    v26 = (void *)v24;
  objc_msgSend(v26, "sessionWithConfiguration:delegate:delegateQueue:", v58, v15, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    objc_msgSend(v13, "networkingDelegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v13, "networkingDelegate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setNetworkingDelegate:", v38);

    }
    objc_msgSend(v58, "identifier");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v39)
      v40 = (id)v39;
    else
      v40 = v11;
    objc_msgSend(v57, "setSessionDescription:", v40, v39);
    objc_storeStrong((id *)&v15->_sessionConfigurationName, a3);
    objc_storeStrong((id *)&v15->_routeHost, a4);
    v15->_routeLastUpdated = 0.0;
    objc_storeStrong((id *)&v15->_didCompleteWithErrorRunningTasks, obj);
    v41 = a5;
    v42 = obj;
    objc_storeStrong((id *)&v15->_options, v41);
    objc_storeStrong((id *)&v15->_session, v57);
    objc_storeStrong((id *)&v15->_wrappedTaskByTaskIdentifier, v60);
    v43 = v56;
    objc_storeStrong((id *)&v15->_queue, v56);
    v15->_isComplete = 0;
    objc_storeStrong((id *)&v15->_sessionDelegate, a6);
    v15->_emptyTimestamp = -1;
    testBehavior_sessionInvalidated_cfnetwork = v15->_testBehavior_sessionInvalidated_cfnetwork;
    v15->_testBehavior_sessionInvalidated_cfnetwork = 0;

    testBehavior_sessionInvalidated_shouldInvalidate = v15->_testBehavior_sessionInvalidated_shouldInvalidate;
    v15->_testBehavior_sessionInvalidated_shouldInvalidate = 0;

    testBehavior_cleanupRetainCycle = v15->_testBehavior_cleanupRetainCycle;
    v15->_testBehavior_cleanupRetainCycle = 0;

    v47 = (void *)v54;
    v12 = v55;
  }
  else
  {
    aClass = (objc_class *)v26;
    if (C2_DEFAULT_LOG_BLOCK_5 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_17_1);
    v42 = obj;
    v47 = (void *)v54;
    v48 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
    v12 = v55;
    v43 = v56;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
    {
      v49 = v48;
      NSStringFromClass(aClass);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v63 = v50;
      v64 = 2112;
      v65 = v58;
      v66 = 2112;
      v67 = v15;
      v68 = 2112;
      v69 = v56;
      _os_log_impl(&dword_1D4DC3000, v49, OS_LOG_TYPE_ERROR, "failed to create NSURLSession for C2Session - [%@ sessionWithConfiguration:%@ delegate:%@ delegateQueue:%@]", buf, 0x2Au);

    }
  }

  v17 = (__objc2_class_ro **)(C2MetricOperationOptions + 32);
  p_info = (__objc2_class_ro **)(C2MetricOperationOptions + 32);
  if (!v57)
    goto LABEL_36;
LABEL_41:

  return v15;
}

void __80__C2Session_initWithSessionConfigurationName_routeHost_options_sessionDelegate___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __80__C2Session_initWithSessionConfigurationName_routeHost_options_sessionDelegate___block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __80__C2Session_initWithSessionConfigurationName_routeHost_options_sessionDelegate___block_invoke_6()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __80__C2Session_initWithSessionConfigurationName_routeHost_options_sessionDelegate___block_invoke_9()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __80__C2Session_initWithSessionConfigurationName_routeHost_options_sessionDelegate___block_invoke_12()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __80__C2Session_initWithSessionConfigurationName_routeHost_options_sessionDelegate___block_invoke_16()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __80__C2Session_initWithSessionConfigurationName_routeHost_options_sessionDelegate___block_invoke_18()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __44__C2Session_createTaskWithOptions_delegate___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __44__C2Session_createTaskWithOptions_delegate___block_invoke_28()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __44__C2Session_createTaskWithOptions_delegate___block_invoke_31()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __53__C2Session__recalculateSessionDelegateQueuePriority__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

+ (id)portFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  int v10;

  v3 = a3;
  objc_msgSend(v3, "port");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", CFSTR("http"));

    if ((v8 & 1) != 0)
    {
      v6 = &unk_1E98A59B0;
    }
    else
    {
      objc_msgSend(v3, "scheme");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", CFSTR("https"));

      if (v10)
        v6 = &unk_1E98A59C8;
      else
        v6 = 0;
    }
  }

  return v6;
}

void __45__C2Session_addTask_withDescription_request___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __45__C2Session_addTask_withDescription_request___block_invoke_49()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __45__C2Session_addTask_withDescription_request___block_invoke_54()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __24__C2Session_removeTask___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (int64_t)emptyTimestamp
{
  C2Session *v2;
  int64_t emptyTimestamp;

  v2 = self;
  objc_sync_enter(v2);
  emptyTimestamp = v2->_emptyTimestamp;
  objc_sync_exit(v2);

  return emptyTimestamp;
}

- (BOOL)shouldRemoveEmptySession
{
  C2Session *v2;
  int64_t emptyTimestamp;
  C2SessionDelegate *sessionDelegate;

  v2 = self;
  objc_sync_enter(v2);
  emptyTimestamp = v2->_emptyTimestamp;
  if (emptyTimestamp != -1)
  {
    sessionDelegate = v2->_sessionDelegate;
    v2->_sessionDelegate = 0;

  }
  objc_sync_exit(v2);

  return emptyTimestamp != -1;
}

void __38__C2Session_shouldInvalidateAndCancel__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __38__C2Session_shouldInvalidateAndCancel__block_invoke_75()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __38__C2Session_shouldInvalidateAndCancel__block_invoke_77()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __38__C2Session_shouldInvalidateAndCancel__block_invoke_79()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __38__C2Session_shouldInvalidateAndCancel__block_invoke_81()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (void)testBehavior_setSessionExpiry:(int64_t)a3
{
  C2Session *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!-[NSMutableDictionary count](obj->_wrappedTaskByTaskIdentifier, "count"))
    obj->_emptyTimestamp = a3;
  objc_sync_exit(obj);

}

- (void)testBehavior_triggerSessionExpiry
{
  C2Session *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!-[NSMutableDictionary count](obj->_wrappedTaskByTaskIdentifier, "count"))
    obj->_emptyTimestamp = 0;
  objc_sync_exit(obj);

}

- (void)testBehavior_triggerCallbackHang
{
  C2Session *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allValues](v2->_wrappedTaskByTaskIdentifier, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v6++), "testBehavior_triggerCallbackHang");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v4);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v2->_didCompleteWithErrorRunningTasks;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "testBehavior_triggerCallbackHang", (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v8);
  }

  objc_sync_exit(v2);
}

- (void)C2Session:(id)a3 sessionTask:(id)a4 updatedRoute:(id)a5
{
  id v9;
  id v10;
  void *v11;
  int v12;
  double Current;
  C2Session *v14;
  C2SessionDelegate *sessionDelegate;
  C2Session *v16;
  void *v17;
  void *v18;
  C2Session *v19;

  v19 = (C2Session *)a3;
  v9 = a4;
  v10 = a5;
  if (v19 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2Session.m"), 326, CFSTR("Callbacks should only occur for self."));

  }
  objc_msgSend(v9, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "allowRouting");

  if (v12)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v14 = self;
    objc_sync_enter(v14);
    if (Current <= v14->_routeLastUpdated + 900.0)
    {
      objc_sync_exit(v14);
    }
    else
    {
      v14->_routeLastUpdated = Current;
      objc_sync_exit(v14);

      sessionDelegate = v14->_sessionDelegate;
      objc_msgSend(v9, "options");
      v16 = (C2Session *)objc_claimAutoreleasedReturnValue();
      -[C2Session originalHost](v16, "originalHost");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2SessionDelegate C2Session:originalHost:updatedRoute:](sessionDelegate, "C2Session:originalHost:updatedRoute:", v14, v17, v10);

      v14 = v16;
    }

  }
}

void __49__C2Session_C2Session_task_didCompleteWithError___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __50__C2Session_URLSession_didBecomeInvalidWithError___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __58__C2Session_sessionTaskDelegateCallbackHelper_task_block___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __58__C2Session_sessionTaskDelegateCallbackHelper_task_block___block_invoke_112()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __85__C2Session_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  v22[3] = &unk_1E9899068;
  v22[4] = self;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  -[C2Session sessionTaskDelegateCallbackHelper:task:block:](self, "sessionTaskDelegateCallbackHelper:task:block:", v21, v20, v22);

}

void __85__C2Session_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_114);
  v7 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[6];
    v11 = a1[7];
    v13 = a1[8];
    v12 = (const void *)a1[9];
    v14 = v7;
    v15 = _Block_copy(v12);
    v16 = 138544642;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 2114;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    v24 = 2114;
    v25 = v13;
    v26 = 2114;
    v27 = v15;
    _os_log_impl(&dword_1D4DC3000, v14, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ task:%{public}@ willPerformHTTPRedirection:%{public}@ newRequest:%{public}@ completionHandler:%{public}@]", (uint8_t *)&v16, 0x3Eu);

  }
  if (v6)
    objc_msgSend(v6, "URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:", a1[5], a1[6], a1[7], a1[8], a1[9]);
  else
    (*(void (**)(void))(a1[9] + 16))();

}

void __85__C2Session_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__C2Session_URLSession_task_needNewBodyStream___block_invoke;
  v14[3] = &unk_1E9899090;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[C2Session sessionTaskDelegateCallbackHelper:task:block:](self, "sessionTaskDelegateCallbackHelper:task:block:", v13, v12, v14);

}

void __47__C2Session_URLSession_task_needNewBodyStream___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_116);
  v7 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[4];
    v9 = a1[5];
    v11 = a1[6];
    v10 = (const void *)a1[7];
    v12 = v7;
    v13 = _Block_copy(v10);
    v14 = 138544130;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_1D4DC3000, v12, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ task:%{public}@ needNewBodyStream:%{public}@]", (uint8_t *)&v14, 0x2Au);

  }
  if (v6)
    objc_msgSend(v6, "URLSession:task:needNewBodyStream:", a1[5], a1[6], a1[7]);
  else
    (*(void (**)(void))(a1[7] + 16))();

}

void __47__C2Session_URLSession_task_needNewBodyStream___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __85__C2Session_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __56__C2Session_URLSession_task_didFinishCollectingMetrics___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __50__C2Session_URLSession_task_didCompleteWithError___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __88__C2Session_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (void)URLSession:(id)a3 _taskIsWaitingForConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__C2Session_URLSession__taskIsWaitingForConnection___block_invoke;
  v10[3] = &unk_1E9899190;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[C2Session sessionTaskDelegateCallbackHelper:task:block:](self, "sessionTaskDelegateCallbackHelper:task:block:", v9, v8, v10);

}

void __52__C2Session_URLSession__taskIsWaitingForConnection___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_124_0);
  v7 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[6];
    v11 = 138543874;
    v12 = v8;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1D4DC3000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ _taskIsWaitingForConnection:%{public}@]", (uint8_t *)&v11, 0x20u);
  }
  objc_msgSend(v6, "URLSession:_taskIsWaitingForConnection:", a1[5], a1[6]);

}

void __52__C2Session_URLSession__taskIsWaitingForConnection___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (void)URLSession:(id)a3 task:(id)a4 _conditionalRequirementsChanged:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__C2Session_URLSession_task__conditionalRequirementsChanged___block_invoke;
  v12[3] = &unk_1E98991B8;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a5;
  v10 = v9;
  v11 = v8;
  -[C2Session sessionTaskDelegateCallbackHelper:task:block:](self, "sessionTaskDelegateCallbackHelper:task:block:", v11, v10, v12);

}

void __61__C2Session_URLSession_task__conditionalRequirementsChanged___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_125);
  v7 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    if (*(_BYTE *)(a1 + 56))
      v11 = "true";
    else
      v11 = "false";
    v12 = 138544130;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2082;
    v19 = v11;
    _os_log_impl(&dword_1D4DC3000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ task:%{public}@ _conditionalRequirementsChanged:%{public}s]", (uint8_t *)&v12, 0x2Au);
  }
  objc_msgSend(v6, "URLSession:task:_conditionalRequirementsChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));

}

void __61__C2Session_URLSession_task__conditionalRequirementsChanged___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __70__C2Session_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__C2Session_URLSession_dataTask_didReceiveData___block_invoke;
  v14[3] = &unk_1E9899100;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[C2Session sessionTaskDelegateCallbackHelper:task:block:](self, "sessionTaskDelegateCallbackHelper:task:block:", v13, v12, v14);

}

void __48__C2Session_URLSession_dataTask_didReceiveData___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_129);
  v7 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[4];
    v9 = a1[5];
    v11 = a1[6];
    v10 = (void *)a1[7];
    v12 = v7;
    v13 = 138544130;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    v17 = 2114;
    v18 = v11;
    v19 = 2048;
    v20 = objc_msgSend(v10, "length");
    _os_log_impl(&dword_1D4DC3000, v12, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ dataTask:%{public}@ didReceiveData:(binary data of length %lld)]", (uint8_t *)&v13, 0x2Au);

  }
  objc_msgSend(v6, "URLSession:dataTask:didReceiveData:", a1[5], a1[6], a1[7]);

}

void __48__C2Session_URLSession_dataTask_didReceiveData___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

void __67__C2Session_URLSession_dataTask__didReceiveData_completionHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__C2Session_URLSession__willRetryBackgroundDataTask_withError___block_invoke;
  v14[3] = &unk_1E9899100;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[C2Session sessionTaskDelegateCallbackHelper:task:block:](self, "sessionTaskDelegateCallbackHelper:task:block:", v13, v12, v14);

}

void __63__C2Session_URLSession__willRetryBackgroundDataTask_withError___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (C2_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_5, &__block_literal_global_133);
  v7 = C2_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[6];
    v11 = a1[7];
    v12 = 138544130;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_1D4DC3000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@ URLSession:%{public}@ _willRetryBackgroundDataTask:%{public}@ withError:%{public}@]", (uint8_t *)&v12, 0x2Au);
  }
  objc_msgSend(v5, "captureMetricsWithError:eventType:", a1[7], 2);
  objc_msgSend(v6, "URLSession:_willRetryBackgroundDataTask:withError:", a1[5], a1[6], a1[7]);

}

void __63__C2Session_URLSession__willRetryBackgroundDataTask_withError___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_5;
  C2_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (void)setEmptyTimestamp:(int64_t)a3
{
  self->_emptyTimestamp = a3;
}

- (NSString)originalHost
{
  return self->_originalHost;
}

- (void)setOriginalHost:(id)a3
{
  objc_storeStrong((id *)&self->_originalHost, a3);
}

- (NSString)routeHost
{
  return self->_routeHost;
}

- (void)setRouteHost:(id)a3
{
  objc_storeStrong((id *)&self->_routeHost, a3);
}

- (double)routeLastUpdated
{
  return self->_routeLastUpdated;
}

- (void)setRouteLastUpdated:(double)a3
{
  self->_routeLastUpdated = a3;
}

- (NSMutableSet)didCompleteWithErrorRunningTasks
{
  return self->_didCompleteWithErrorRunningTasks;
}

- (void)setDidCompleteWithErrorRunningTasks:(id)a3
{
  objc_storeStrong((id *)&self->_didCompleteWithErrorRunningTasks, a3);
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

- (C2SessionDelegate)sessionDelegate
{
  return self->_sessionDelegate;
}

- (void)setSessionDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_sessionDelegate, a3);
}

- (id)testBehavior_sessionInvalidated_cfnetwork
{
  return self->_testBehavior_sessionInvalidated_cfnetwork;
}

- (void)setTestBehavior_sessionInvalidated_cfnetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)testBehavior_sessionInvalidated_shouldInvalidate
{
  return self->_testBehavior_sessionInvalidated_shouldInvalidate;
}

- (void)setTestBehavior_sessionInvalidated_shouldInvalidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)testBehavior_cleanupRetainCycle
{
  return self->_testBehavior_cleanupRetainCycle;
}

- (void)setTestBehavior_cleanupRetainCycle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)testBehavior_callbackHung
{
  return self->_testBehavior_callbackHung;
}

- (void)setTestBehavior_callbackHung:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

@end
