@implementation _HDAuthorizationRequestGroup

- (void)cancelRequestsWithIdentifiers:(void *)a3 error:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v6)
    {
      v7 = v6 - 1;
      do
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v8)
          v10 = *(_QWORD *)(v8 + 16);
        else
          v10 = 0;
        if (objc_msgSend(v11, "containsObject:", v10))
        {
          objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v7);
          -[_HDAuthorizationRequest invokeCompletionHandlerWithSuccess:error:]((uint64_t)v9, 0, v5);
        }

        --v7;
      }
      while (v7 != -1);
    }
  }

}

- (id)bundleIdentifier
{
  if (a1)
  {
    objc_msgSend(a1[7], "bundleIdentifier");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)promptIfNecessaryWithTimeout:(double)a3 completion:
{
  id v5;
  void (**v6)(id, void *, id);
  NSObject *v7;
  dispatch_source_t v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v24;
  _QWORD handler[4];
  id v26;

  v5 = a2;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel_promptIfNecessaryWithTimeout_completion_, a1, CFSTR("HDAuthorizationManager.m"), 1760, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != NULL"));

  }
  v6 = (void (**)(id, void *, id))*(id *)(a1 + 72);
  if (v6 && !*(_QWORD *)(a1 + 64))
  {
    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v7);
    v9 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v8;

    v10 = *(NSObject **)(a1 + 48);
    v11 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    v12 = *(NSObject **)(a1 + 48);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __72___HDAuthorizationRequestGroup_promptIfNecessaryWithTimeout_completion___block_invoke;
    handler[3] = &unk_1E6CE7DE0;
    v13 = v5;
    v26 = v13;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(*(dispatch_object_t *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v14;

    v16 = objc_alloc(MEMORY[0x1E0CB6328]);
    v17 = *(_QWORD *)(a1 + 56);
    v18 = *(_QWORD *)(a1 + 64);
    v19 = *(_QWORD *)(a1 + 8);
    v20 = *(id *)(a1 + 16);
    v21 = (void *)objc_msgSend(v16, "initWithSource:session:readTypes:writeTypes:", v17, v18, v20, v19);

    v6[2](v6, v21, v13);
  }
  v22 = *(_QWORD *)(a1 + 64);

  return v22 != 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKSource bundleIdentifier](self->_source, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableArray count](self->_requests, "count");
  -[NSUUID UUIDString](self->_promptSessionIdentifier, "UUIDString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (self->_inTransaction)
    v9 = "YES";
  else
    v9 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p source:\"%@\" requests:%lu prompt:%@ transaction:%s>"), v4, self, v5, v6, v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptHandler, 0);
  objc_storeStrong((id *)&self->_promptSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_sessionTimeoutSource, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_typesToRead, 0);
  objc_storeStrong((id *)&self->_typesToWrite, 0);
}

@end
