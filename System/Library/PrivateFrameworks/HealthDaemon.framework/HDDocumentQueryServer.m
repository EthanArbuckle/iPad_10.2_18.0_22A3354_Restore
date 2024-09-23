@implementation HDDocumentQueryServer

- (HDDocumentQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDDocumentQueryServer *v11;
  uint64_t v12;
  NSArray *sortDescriptors;
  NSArray *authorizedSamples;
  objc_super v16;

  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDDocumentQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v16, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    v11->_maxResults = objc_msgSend(v10, "limit");
    objc_msgSend(v10, "sortDescriptors");
    v12 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v11->_sortDescriptors;
    v11->_sortDescriptors = (NSArray *)v12;

    v11->_includeDocumentData = objc_msgSend(v10, "includeDocumentData");
    v11->_suspended = 0;
    authorizedSamples = v11->_authorizedSamples;
    v11->_authorizedSamples = 0;

    v11->_clientSampleIndex = 0;
  }

  return v11;
}

- (BOOL)validateConfiguration:(id *)a3
{
  void *v5;
  uint64_t v6;
  id v8;
  objc_super v9;

  -[HDQueryServer objectType](self, "objectType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");

  if (v6 == 107)
  {
    v9.receiver = self;
    v9.super_class = (Class)HDDocumentQueryServer;
    return -[HDQueryServer validateConfiguration:](&v9, sel_validateConfiguration_, a3);
  }
  else
  {
    -[HDDocumentQueryServer _unsupportedDocumentTypeError](self);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError();
    }

    return 0;
  }
}

- (id)_unsupportedDocumentTypeError
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = objc_opt_class();
    v4 = objc_opt_class();
    objc_msgSend(v1, "objectType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v3, sel__unsupportedDocumentTypeError, CFSTR("[%@] Unsupported document type: %@"), v4, v5);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

uint64_t __81__HDDocumentQueryServer__samplesBeforeAuthorizationWithSortDescriptors_errorOut___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldStopProcessingQuery"))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "_shouldSuspendQuery");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    if (!v6)
    {
      objc_msgSend(v8, "addObject:", v3);
      v9 = 1;
      goto LABEL_7;
    }
    *(_QWORD *)(v7 + 40) = 0;

  }
  v9 = 0;
LABEL_7:

  return v9;
}

uint64_t __59__HDDocumentQueryServer__deliverOneSample_client_errorOut___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

- (uint64_t)_deliverAuthorizedSamplesToClient:(uint64_t)a3 errorOut:
{
  id v4;
  unint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;
  void *v17;
  unint64_t v18;
  void *v19;
  __CFString *v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a2;
  if (a1)
  {
    v5 = objc_msgSend(*(id *)(a1 + 208), "count");
    if (*(_QWORD *)(a1 + 216) < v5)
    {
      v21 = CFSTR("IncludeCDADocumentData");
      while (1)
      {
        if ((objc_msgSend((id)a1, "_shouldStopProcessingQuery", v21) & 1) != 0)
          goto LABEL_17;
        if (objc_msgSend((id)a1, "_shouldSuspendQuery"))
        {
          *(_BYTE *)(a1 + 200) = 1;
          goto LABEL_17;
        }
        objc_msgSend(*(id *)(a1 + 208), "objectAtIndex:", *(_QWORD *)(a1 + 216));
        v6 = (id)objc_claimAutoreleasedReturnValue();
        v7 = v4;
        v24 = 0;
        v25 = &v24;
        v26 = 0x3032000000;
        v27 = __Block_byref_object_copy__1;
        v28 = __Block_byref_object_dispose__1;
        v8 = v6;
        v9 = v8;
        v29 = v8;
        if (!*(_BYTE *)(a1 + 224))
          break;
        objc_msgSend(v8, "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        HDDataEntityPredicateForDataUUID();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)objc_msgSend((id)a1, "newDataEntityEnumerator");
        objc_msgSend(v12, "setPredicate:", v11);
        objc_msgSend((id)a1, "objectType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "code");

        if (v14 == 107)
        {
          objc_msgSend(v12, "setEncodingOption:forKey:", MEMORY[0x1E0C9AAB0], 0x1E6D4C3D8);
          objc_msgSend(v12, "setEncodingOption:forKey:", MEMORY[0x1E0C9AAB0], v21);
        }
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __59__HDDocumentQueryServer__deliverOneSample_client_errorOut___block_invoke;
        v23[3] = &unk_1E6CE7EA0;
        v23[4] = &v24;
        v15 = objc_msgSend(v12, "enumerateWithError:handler:", a3, v23);

        v16 = (id)v25[5];
        if (v16)
          goto LABEL_12;
LABEL_13:
        _Block_object_dispose(&v24, 8);

        if (!v15)
        {
          a1 = 0;
          goto LABEL_20;
        }
        v18 = *(_QWORD *)(a1 + 216) + 1;
        *(_QWORD *)(a1 + 216) = v18;
        if (v18 >= v5)
          goto LABEL_17;
      }
      v15 = 1;
      v16 = v8;
      if (!v8)
        goto LABEL_13;
LABEL_12:
      objc_msgSend((id)a1, "queryUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "client_deliverDocument:query:", v16, v17);

      goto LABEL_13;
    }
LABEL_17:
    if (*(_QWORD *)(a1 + 216) >= v5)
    {
      objc_msgSend((id)a1, "queryUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "client_deliverDocument:query:", 0, v19);

    }
    a1 = 1;
  }
LABEL_20:

  return a1;
}

- (void)_queue_start
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSArray *sortDescriptors;
  NSArray *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  HDObjectAuthorizationRequestContext *v29;
  NSObject *v30;
  void *v31;
  id v32;
  _QWORD v33[2];
  void (*v34)(uint64_t, void *, void *);
  void *v35;
  HDDocumentQueryServer *v36;
  id v37;
  SEL v38;
  id v39;
  objc_super v40;
  _QWORD v41[6];
  __int128 buf;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)HDDocumentQueryServer;
  -[HDQueryServer _queue_start](&v40, sel__queue_start);
  -[HDQueryServer clientProxy](self, "clientProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_suspended)
  {
    sortDescriptors = self->_sortDescriptors;
    v39 = 0;
    v9 = sortDescriptors;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__1;
    v45 = __Block_byref_object_dispose__1;
    v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HDQueryServer objectType](self, "objectType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "code");

    if (v11 == 107)
    {
      -[HDQueryServer sampleType](self, "sampleType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDQueryServer readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", v12, &v39);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        if (objc_msgSend(v13, "canRead"))
        {
          v14 = -[HDQueryServer newDataEntityEnumerator](self, "newDataEntityEnumerator");
          -[HDQueryServer filter](self, "filter");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setFilter:", v15);

          objc_msgSend(v13, "restrictedSourceEntities");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setRestrictedSourceEntities:", v16);

          -[HDQueryServer sampleAuthorizationFilter](self, "sampleAuthorizationFilter");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setAuthorizationFilter:", v17);

          objc_msgSend(v14, "setSortDescriptors:", v9);
          -[HDQueryServer objectType](self, "objectType");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "code") == 107;

          if (v19)
            objc_msgSend(v14, "setEncodingOption:forKey:", MEMORY[0x1E0C9AAB0], 0x1E6D4C3D8);
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __81__HDDocumentQueryServer__samplesBeforeAuthorizationWithSortDescriptors_errorOut___block_invoke;
          v41[3] = &unk_1E6CE7E78;
          v41[4] = self;
          v41[5] = &buf;
          objc_msgSend(v14, "enumerateWithError:handler:", &v39, v41);

        }
        v6 = *(id *)(*((_QWORD *)&buf + 1) + 40);
        goto LABEL_17;
      }
    }
    else
    {
      -[HDDocumentQueryServer _unsupportedDocumentTypeError](self);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
        v39 = objc_retainAutorelease(v20);

      v13 = 0;
    }
    v6 = 0;
LABEL_17:

    _Block_object_dispose(&buf, 8);
    v22 = v39;
    if (v22)
    {
      v23 = v22;
      -[HDQueryServer queryUUID](self, "queryUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "client_deliverError:forQuery:", v23, v7);

    }
    else
    {
      self->_clientSampleIndex = 0;
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v34 = __37__HDDocumentQueryServer__queue_start__block_invoke;
      v35 = &unk_1E6CE7EC8;
      v36 = self;
      v37 = v4;
      v38 = a2;
      v6 = v6;
      v24 = v33;
      -[HDQueryServer objectType](self, "objectType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "code");

      if (v26 == 107)
      {
        -[HDQueryServer delegate](self, "delegate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v6;
        v29 = -[HDObjectAuthorizationRequestContext initWithSamples:metadata:]([HDObjectAuthorizationRequestContext alloc], "initWithSamples:metadata:", v28, 0);

        -[HDObjectAuthorizationRequestContext setPersistSession:](v29, "setPersistSession:", 0);
        -[HDObjectAuthorizationRequestContext setPromptWithNoSamples:](v29, "setPromptWithNoSamples:", 0);
        objc_msgSend(v27, "queryServer:requestsAuthorizationWithContext:completion:", self, v29, v24);

      }
      else
      {
        -[HDDocumentQueryServer _unsupportedDocumentTypeError](self);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v34((uint64_t)v24, 0, v27);
      }

      v7 = 0;
    }
    goto LABEL_23;
  }
  self->_suspended = 0;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
  {
    v30 = v5;
    -[HDQueryServer queryUUID](self, "queryUUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v31;
    _os_log_debug_impl(&dword_1B7802000, v30, OS_LOG_TYPE_DEBUG, "resume query %{public}@.", (uint8_t *)&buf, 0xCu);

  }
  v32 = 0;
  -[HDDocumentQueryServer _deliverAuthorizedSamplesToClient:errorOut:]((uint64_t)self, v4, (uint64_t)&v32);
  v6 = v32;
  if (v6)
  {
    -[HDQueryServer queryUUID](self, "queryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "client_deliverError:forQuery:", v6, v7);
LABEL_23:

  }
}

void __37__HDDocumentQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __37__HDDocumentQueryServer__queue_start__block_invoke_2;
    v14[3] = &unk_1E6CE78C0;
    v14[4] = v8;
    v15 = v5;
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v16 = v9;
    v17 = v10;
    objc_msgSend(v8, "scheduleDatabaseAccessOnQueueWithBlock:", v14);

  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("HDDocumentQueryServer.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

    }
    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "queryUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "client_deliverError:forQuery:", v7, v12);

  }
}

void __37__HDDocumentQueryServer__queue_start__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v10 = 0;
  v4 = -[HDDocumentQueryServer _deliverAuthorizedSamplesToClient:errorOut:](v2, v3, (uint64_t)&v10);
  v5 = v10;
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("HDDocumentQueryServer.m"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondPassError != nil"));

    }
    v7 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "queryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "client_deliverError:forQuery:", v6, v8);

  }
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)maxResults
{
  return self->_maxResults;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (BOOL)includeDocumentData
{
  return self->_includeDocumentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_authorizedSamples, 0);
}

@end
