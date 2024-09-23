@implementation HKWorkoutEffortRelationshipQuery

- (HKWorkoutEffortRelationshipQuery)initWithPredicate:(id)a3 anchor:(id)a4 options:(int64_t)a5 resultsHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  HKWorkoutEffortRelationshipQuery *v15;
  uint64_t v16;
  id resultsHandler;
  objc_super v19;

  v11 = a4;
  v12 = a6;
  v13 = a3;
  +[HKObjectType workoutType](HKObjectType, "workoutType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)HKWorkoutEffortRelationshipQuery;
  v15 = -[HKQuery _initWithObjectType:predicate:](&v19, sel__initWithObjectType_predicate_, v14, v13);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_anchor, a4);
    v15->_options = a5;
    v16 = objc_msgSend(v12, "copy");
    resultsHandler = v15->_resultsHandler;
    v15->_resultsHandler = (id)v16;

  }
  return v15;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3DE5F0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___HKWorkoutEffortRelationshipQuery;
  objc_msgSendSuper2(&v11, sel_configureClientInterface_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_client_deliverWorkoutEffortRelationships_isFinalBatch_anchor_forQuery_, 0, 0);

  v9 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverWorkoutEffortRelationships_isFinalBatch_anchor_forQuery_, 2, 0);
  v10 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverWorkoutEffortRelationships_isFinalBatch_anchor_forQuery_, 3, 0);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutEffortRelationshipQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setAnchor:", self->_anchor, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setOptions:", self->_options);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutEffortRelationshipQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  resultsHandler = self->_resultsHandler;
  self->_resultsHandler = 0;

}

- (void)queue_validate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HKWorkoutEffortRelationshipQuery;
  -[HKQuery queue_validate](&v2, sel_queue_validate);
}

- (void)queue_deliverError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  v5 = _Block_copy(self->_resultsHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__HKWorkoutEffortRelationshipQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __55__HKWorkoutEffortRelationshipQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5]);
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)client_deliverWorkoutEffortRelationships:(id)a3 isFinalBatch:(BOOL)a4 anchor:(id)a5 forQuery:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[HKQuery queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__HKWorkoutEffortRelationshipQuery_client_deliverWorkoutEffortRelationships_isFinalBatch_anchor_forQuery___block_invoke;
  block[3] = &unk_1E37EC130;
  block[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v12;
  v20 = v11;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  dispatch_async(v13, block);

}

void __106__HKWorkoutEffortRelationshipQuery_client_deliverWorkoutEffortRelationships_isFinalBatch_anchor_forQuery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 176));
  if (v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    if (v3)
    {
      objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 152);
      *(_QWORD *)(v5 + 152) = v4;

    }
    if (*(_BYTE *)(a1 + 64))
    {
      v7 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 152);
      *(_QWORD *)(v8 + 152) = 0;

      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 48);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __106__HKWorkoutEffortRelationshipQuery_client_deliverWorkoutEffortRelationships_isFinalBatch_anchor_forQuery___block_invoke_2;
      v13[3] = &unk_1E37F3128;
      v16 = v2;
      v13[4] = *(_QWORD *)(a1 + 32);
      v14 = v7;
      v15 = *(id *)(a1 + 56);
      v12 = v7;
      objc_msgSend(v10, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v11, 0, v13);

    }
  }

}

uint64_t __106__HKWorkoutEffortRelationshipQuery_client_deliverWorkoutEffortRelationships_isFinalBatch_anchor_forQuery___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_relationshipsPendingDelivery, 0);
}

@end
