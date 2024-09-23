@implementation HKWorkoutRouteQuery

- (HKWorkoutRouteQuery)initWithRoute:(HKWorkoutRoute *)workoutRoute dataHandler:(void *)dataHandler
{
  HKWorkoutRoute *v6;
  void *v7;
  HKWorkoutRouteQuery *v8;

  v6 = workoutRoute;
  v7 = dataHandler;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "workoutRoute");
  v8 = -[HKWorkoutRouteQuery initWithRoute:workoutUUID:dateInterval:dataHandler:](self, "initWithRoute:workoutUUID:dateInterval:dataHandler:", v6, 0, 0, v7);

  return v8;
}

- (HKWorkoutRouteQuery)initWithRoute:(HKWorkoutRoute *)workoutRoute dateInterval:(NSDateInterval *)dateInterval dataHandler:(void *)dataHandler
{
  HKWorkoutRoute *v8;
  NSDateInterval *v9;
  void *v10;
  HKWorkoutRouteQuery *v11;

  v8 = workoutRoute;
  v9 = dateInterval;
  v10 = dataHandler;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "workoutRoute");
    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "dateInterval");
    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v11 = -[HKWorkoutRouteQuery initWithRoute:workoutUUID:dateInterval:dataHandler:](self, "initWithRoute:workoutUUID:dateInterval:dataHandler:", v8, 0, v9, v10);

  return v11;
}

- (HKWorkoutRouteQuery)initWithActiveWorkoutUUID:(id)a3 dataHandler:(id)a4
{
  id v6;
  id v7;
  HKWorkoutRouteQuery *v8;

  v6 = a3;
  v7 = a4;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "workoutUUID");
  v8 = -[HKWorkoutRouteQuery initWithRoute:workoutUUID:dateInterval:dataHandler:](self, "initWithRoute:workoutUUID:dateInterval:dataHandler:", 0, v6, 0, v7);

  return v8;
}

- (HKWorkoutRouteQuery)initWithRoute:(id)a3 workoutUUID:(id)a4 dateInterval:(id)a5 dataHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HKWorkoutRouteQuery *v16;
  void *v17;
  id dataHandler;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "dataHandler");
  +[HKSeriesType workoutRouteType](HKSeriesType, "workoutRouteType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)HKWorkoutRouteQuery;
  v16 = -[HKQuery _initWithObjectType:predicate:](&v20, sel__initWithObjectType_predicate_, v15, 0);

  if (v16)
  {
    v17 = _Block_copy(v14);
    dataHandler = v16->_dataHandler;
    v16->_dataHandler = v17;

    objc_storeStrong((id *)&v16->_series, a3);
    objc_storeStrong((id *)&v16->_workoutUUID, a4);
    objc_storeStrong((id *)&v16->_dateInterval, a5);
  }

  return v16;
}

- (void)client_deliverWorkoutRouteLocations:(id)a3 isFinal:(BOOL)a4 query:(id)a5
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
  v13[2] = __73__HKWorkoutRouteQuery_client_deliverWorkoutRouteLocations_isFinal_query___block_invoke;
  v13[3] = &unk_1E37E8708;
  v13[4] = self;
  v14 = v9;
  v16 = a4;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

void __73__HKWorkoutRouteQuery_client_deliverWorkoutRouteLocations_isFinal_query___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  uint64_t *v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *(*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  v14 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 152));
  if (v10[5])
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(unsigned __int8 *)(a1 + 56);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __73__HKWorkoutRouteQuery_client_deliverWorkoutRouteLocations_isFinal_query___block_invoke_10;
    v5[3] = &unk_1E37EC920;
    v7 = &v9;
    v5[4] = v2;
    v6 = *(id *)(a1 + 48);
    v8 = *(_BYTE *)(a1 + 56);
    objc_msgSend(v2, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v3, v4, v5);

  }
  _Block_object_dispose(&v9, 8);

}

uint64_t __73__HKWorkoutRouteQuery_client_deliverWorkoutRouteLocations_isFinal_query___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                       + 40)
                                                                           + 16))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3BF2C8;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKWorkoutRouteQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverWorkoutRouteLocations_isFinal_query_, 0, 0);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutRouteQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setWorkoutRoute:", self->_series, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setWorkoutUUID:", self->_workoutUUID);
  objc_msgSend(v4, "setDateInterval:", self->_dateInterval);

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
    block[2] = __42__HKWorkoutRouteQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __42__HKWorkoutRouteQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 1, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id dataHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutRouteQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  dataHandler = self->_dataHandler;
  self->_dataHandler = 0;

}

- (id)dataHandler
{
  return self->_dataHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong(&self->_dataHandler, 0);
}

@end
