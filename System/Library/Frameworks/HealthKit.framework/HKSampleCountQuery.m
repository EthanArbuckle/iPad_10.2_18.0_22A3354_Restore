@implementation HKSampleCountQuery

- (HKSampleCountQuery)initWithQueryDescriptors:(id)a3 resultsHandler:(id)a4
{
  id v6;
  void *v7;
  HKSampleCountQuery *v8;
  void *v9;
  id resultsHandler;
  id sampleTypeCountResultsHandler;
  objc_super v13;

  v6 = a4;
  objc_msgSend(a3, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)HKSampleCountQuery;
  v8 = -[HKQuery initWithQueryDescriptors:](&v13, sel_initWithQueryDescriptors_, v7);

  if (v8)
  {
    v9 = _Block_copy(v6);
    resultsHandler = v8->_resultsHandler;
    v8->_resultsHandler = v9;

    sampleTypeCountResultsHandler = v8->_sampleTypeCountResultsHandler;
    v8->_sampleTypeCountResultsHandler = 0;

  }
  return v8;
}

- (HKSampleCountQuery)initWithSampleTypes:(id)a3 predicate:(id)a4 resultsHandler:(id)a5
{
  id *v5;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  HKSampleCountQuery *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__HKSampleCountQuery_initWithSampleTypes_predicate_resultsHandler___block_invoke;
  v20[3] = &unk_1E37F67A0;
  v12 = v9;
  v21 = v12;
  objc_msgSend(a3, "hk_map:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __67__HKSampleCountQuery_initWithSampleTypes_predicate_resultsHandler___block_invoke_2;
    v18[3] = &unk_1E37F7868;
    v14 = v18;
    v5 = &v19;
    v19 = v10;
  }
  else
  {
    v14 = 0;
  }
  v15 = _Block_copy(v14);
  v16 = -[HKSampleCountQuery initWithQueryDescriptors:resultsHandler:](self, "initWithQueryDescriptors:resultsHandler:", v13, v15);

  if (v10)
  return v16;
}

HKQueryDescriptor *__67__HKSampleCountQuery_initWithSampleTypes_predicate_resultsHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HKQueryDescriptor *v4;

  v3 = a2;
  v4 = -[HKQueryDescriptor initWithSampleType:predicate:]([HKQueryDescriptor alloc], "initWithSampleType:predicate:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

void __67__HKSampleCountQuery_initWithSampleTypes_predicate_resultsHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v16, (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sampleType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (HKSampleCountQuery)initWithSampleType:(id)a3 predicate:(id)a4 resultsHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  HKSampleCountQuery *v12;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "setWithObject:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKSampleCountQuery initWithSampleTypes:predicate:resultsHandler:](self, "initWithSampleTypes:predicate:resultsHandler:", v11, v10, v9);

  return v12;
}

- (NSSet)sampleTypes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[HKQuery queryDescriptors](self, "queryDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HKQuery queryDescriptors](self, "queryDescriptors", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "sampleType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return (NSSet *)v12;
}

- (HKSampleCountQuery)initWithResultsHandler:(id)a3
{
  id v5;
  HKSampleCountQuery *v6;
  HKSampleCountQuery *v7;
  id resultsHandler;
  void *v9;
  id sampleTypeCountResultsHandler;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSampleCountQuery.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultsHandler != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HKSampleCountQuery;
  v6 = -[HKQuery _initWithObjectType:predicate:](&v13, sel__initWithObjectType_predicate_, 0, 0);
  v7 = v6;
  if (v6)
  {
    resultsHandler = v6->_resultsHandler;
    v6->_resultsHandler = 0;

    v9 = _Block_copy(v5);
    sampleTypeCountResultsHandler = v7->_sampleTypeCountResultsHandler;
    v7->_sampleTypeCountResultsHandler = v9;

  }
  return v7;
}

- (void)client_deliverSampleCountDictionary:(id)a3 forQuery:(id)a4
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
  -[HKQuery queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__HKSampleCountQuery_client_deliverSampleCountDictionary_forQuery___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __67__HKSampleCountQuery_client_deliverSampleCountDictionary_forQuery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 152));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__HKSampleCountQuery_client_deliverSampleCountDictionary_forQuery___block_invoke_2;
    v8[3] = &unk_1E37E6710;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);

  }
}

uint64_t __67__HKSampleCountQuery_client_deliverSampleCountDictionary_forQuery___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)client_deliverSampleTypeCountDictionary:(id)a3 forQuery:(id)a4
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
  -[HKQuery queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__HKSampleCountQuery_client_deliverSampleTypeCountDictionary_forQuery___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __71__HKSampleCountQuery_client_deliverSampleTypeCountDictionary_forQuery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 160));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__HKSampleCountQuery_client_deliverSampleTypeCountDictionary_forQuery___block_invoke_2;
    v8[3] = &unk_1E37E6710;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);

  }
}

uint64_t __71__HKSampleCountQuery_client_deliverSampleTypeCountDictionary_forQuery___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3EC6F0;
}

+ (void)configureClientInterface:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___HKSampleCountQuery;
  v3 = a3;
  objc_msgSendSuper2(&v12, sel_configureClientInterface_, v3);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_client_deliverSampleCountDictionary_forQuery_, 0, 0);
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_client_deliverSampleTypeCountDictionary_forQuery_, 0, 0);

}

- (void)queue_deliverError:(id)a3
{
  id v4;
  id resultsHandler;
  void *v6;
  NSObject *v7;
  id *v8;
  id *v9;
  id v10;
  _QWORD *v11;
  id sampleTypeCountResultsHandler;
  void *v13;
  _QWORD v14[5];
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  void *v19;

  v4 = a3;
  resultsHandler = self->_resultsHandler;
  if (resultsHandler)
  {
    v6 = _Block_copy(resultsHandler);
    -[HKQuery clientQueue](self, "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __41__HKSampleCountQuery_queue_deliverError___block_invoke;
    v17[3] = &unk_1E37E6710;
    v8 = &v19;
    v19 = v6;
    v17[4] = self;
    v9 = &v18;
    v18 = v4;
    v10 = v6;
    v11 = v17;
LABEL_5:
    dispatch_async(v7, v11);

    goto LABEL_6;
  }
  sampleTypeCountResultsHandler = self->_sampleTypeCountResultsHandler;
  if (sampleTypeCountResultsHandler)
  {
    v13 = _Block_copy(sampleTypeCountResultsHandler);
    -[HKQuery clientQueue](self, "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__HKSampleCountQuery_queue_deliverError___block_invoke_2;
    v14[3] = &unk_1E37E6710;
    v8 = &v16;
    v16 = v13;
    v14[4] = self;
    v9 = &v15;
    v15 = v4;
    v10 = v13;
    v11 = v14;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __41__HKSampleCountQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

uint64_t __41__HKSampleCountQuery_queue_deliverError___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKSampleCountQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v6, sel_queue_populateConfiguration_, v4);
  -[HKQuery queryDescriptors](self, "queryDescriptors", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryDescriptors:", v5);

}

- (void)queue_validate
{
  id sampleTypeCountResultsHandler;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)HKSampleCountQuery;
  -[HKQuery queue_validate](&v24, sel_queue_validate);
  sampleTypeCountResultsHandler = self->_sampleTypeCountResultsHandler;
  if (self->_resultsHandler)
  {
    if (!sampleTypeCountResultsHandler)
      goto LABEL_8;
  }
  else if (sampleTypeCountResultsHandler)
  {
LABEL_6:
    if (self->_sampleTypeCountResultsHandler)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ completionHandler cannot be nil"), objc_opt_class());
    if (!self->_resultsHandler)
      goto LABEL_10;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSampleCountQuery.m"), 159, CFSTR("%@ cannot have two completion handlers"), objc_opt_class());

  if (!self->_resultsHandler)
    goto LABEL_6;
LABEL_8:
  -[HKQuery queryDescriptors](self, "queryDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ sample query description cannot be empty"), objc_opt_class());
LABEL_10:
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HKQuery queryDescriptors](self, "queryDescriptors");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    v11 = *MEMORY[0x1E0C99778];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v14 = (void *)MEMORY[0x1E0C99DA0];
          v15 = objc_opt_class();
          objc_msgSend(v14, "raise:format:", v11, CFSTR("%@ sample query description must be of class %@"), v15, objc_opt_class());
        }
        objc_msgSend(v13, "sampleType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v17 = (void *)MEMORY[0x1E0C99DA0];
          v18 = objc_opt_class();
          objc_msgSend(v17, "raise:format:", v11, CFSTR("%@ sample type must be of class %@"), v18, objc_opt_class());
        }

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v9);
  }

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSampleCountQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  resultsHandler = self->_resultsHandler;
  self->_resultsHandler = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sampleTypeCountResultsHandler, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
}

@end
