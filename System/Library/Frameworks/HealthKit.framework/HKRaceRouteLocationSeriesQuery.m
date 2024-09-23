@implementation HKRaceRouteLocationSeriesQuery

- (HKRaceRouteLocationSeriesQuery)initWithClusterUUID:(id)a3 workoutSelection:(unint64_t)a4 timestampAnchor:(double)a5 limit:(unint64_t)a6 dataHandler:(id)a7
{
  id v13;
  id v14;
  void *v15;
  HKRaceRouteLocationSeriesQuery *v16;
  void *v17;
  id dataHandler;
  NSMutableArray *v19;
  NSMutableArray *results;
  objc_super v22;

  v13 = a3;
  v14 = a7;
  +[HKSeriesType workoutRouteType](HKSeriesType, "workoutRouteType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)HKRaceRouteLocationSeriesQuery;
  v16 = -[HKQuery _initWithObjectType:predicate:](&v22, sel__initWithObjectType_predicate_, v15, 0);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_clusterUUID, a3);
    v16->_workoutSelection = a4;
    v16->_timestampAnchor = a5;
    v16->_limit = a6;
    v17 = _Block_copy(v14);
    dataHandler = v16->_dataHandler;
    v16->_dataHandler = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    results = v16->_results;
    v16->_results = v19;

  }
  return v16;
}

- (HKRaceRouteLocationSeriesQuery)initWithWorkoutUUID:(id)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 dataHandler:(id)a6
{
  id v11;
  id v12;
  void *v13;
  HKRaceRouteLocationSeriesQuery *v14;
  void *v15;
  id dataHandler;
  NSMutableArray *v17;
  NSMutableArray *results;
  objc_super v20;

  v11 = a3;
  v12 = a6;
  +[HKSeriesType workoutRouteType](HKSeriesType, "workoutRouteType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)HKRaceRouteLocationSeriesQuery;
  v14 = -[HKQuery _initWithObjectType:predicate:](&v20, sel__initWithObjectType_predicate_, v13, 0);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_workoutUUID, a3);
    v14->_timestampAnchor = a4;
    v14->_limit = a5;
    v15 = _Block_copy(v12);
    dataHandler = v14->_dataHandler;
    v14->_dataHandler = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    results = v14->_results;
    v14->_results = v17;

  }
  return v14;
}

- (void)client_deliverRaceRouteLocations:(id)a3 isFinal:(BOOL)a4 query:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[HKQuery queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__HKRaceRouteLocationSeriesQuery_client_deliverRaceRouteLocations_isFinal_query___block_invoke;
  v13[3] = &unk_1E37E8708;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __81__HKRaceRouteLocationSeriesQuery_client_deliverRaceRouteLocations_isFinal_query___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *(*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 192));
  if (v12[5])
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
    if (*(_BYTE *)(a1 + 56))
    {
      v2 = *(id *)(*(_QWORD *)(a1 + 32) + 200);
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 200);
      *(_QWORD *)(v3 + 200) = 0;

      v5 = *(void **)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 48);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __81__HKRaceRouteLocationSeriesQuery_client_deliverRaceRouteLocations_isFinal_query___block_invoke_4;
      v8[3] = &unk_1E37E6838;
      v10 = &v11;
      v8[4] = v5;
      v7 = v2;
      v9 = v7;
      objc_msgSend(v5, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v6, 1, v8);

    }
  }
  _Block_object_dispose(&v11, 8);

}

uint64_t __81__HKRaceRouteLocationSeriesQuery_client_deliverRaceRouteLocations_isFinal_query___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) + 16))(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3B4580;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKRaceRouteLocationSeriesQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverRaceRouteLocations_isFinal_query_, 0, 0);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKRaceRouteLocationSeriesQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setClusterUUID:", self->_clusterUUID, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setWorkoutSelection:", self->_workoutSelection);
  objc_msgSend(v4, "setWorkoutUUID:", self->_workoutUUID);
  objc_msgSend(v4, "setTimestampAnchor:", self->_timestampAnchor);
  objc_msgSend(v4, "setLimit:", self->_limit);

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
  v5 = _Block_copy(self->_dataHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__HKRaceRouteLocationSeriesQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __53__HKRaceRouteLocationSeriesQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id dataHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKRaceRouteLocationSeriesQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  dataHandler = self->_dataHandler;
  self->_dataHandler = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_dataHandler, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);
  objc_storeStrong((id *)&self->_clusterUUID, 0);
}

@end
