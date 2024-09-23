@implementation HKHeartbeatSeriesQuery

- (HKHeartbeatSeriesQuery)initWithHeartbeatSeries:(HKHeartbeatSeriesSample *)heartbeatSeries dataHandler:(void *)dataHandler
{
  HKHeartbeatSeriesSample *v7;
  void *v8;
  void *v9;
  void *v10;
  HKHeartbeatSeriesQuery *v11;
  void *v12;
  id bufferHandler;
  _QWORD aBlock[4];
  id v16;
  id v17;
  id location;
  objc_super v19;

  v7 = heartbeatSeries;
  v8 = dataHandler;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "heartbeatSeries");
    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "dataHandler");
LABEL_3:
  +[HKSeriesType heartbeatSeriesType](HKSeriesType, "heartbeatSeriesType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)HKHeartbeatSeriesQuery;
  v11 = -[HKQuery _initWithObjectType:predicate:](&v19, sel__initWithObjectType_predicate_, v10, 0);

  if (v11)
  {
    objc_initWeak(&location, v11);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__HKHeartbeatSeriesQuery_initWithHeartbeatSeries_dataHandler___block_invoke;
    aBlock[3] = &unk_1E37EB100;
    objc_copyWeak(&v17, &location);
    v16 = v9;
    v12 = _Block_copy(aBlock);
    bufferHandler = v11->_bufferHandler;
    v11->_bufferHandler = v12;

    objc_storeStrong((id *)&v11->_heartbeatSeries, heartbeatSeries);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __62__HKHeartbeatSeriesQuery_initWithHeartbeatSeries_dataHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id WeakRetained;
  id v7;

  v7 = a3;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_enumerateHeartbeatData:final:handler:", v7, a4, *(_QWORD *)(a1 + 32));

  }
  else
  {
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);
  }

}

- (HKHeartbeatSeriesQuery)initWithHeartbeatSeries:(id)a3 bufferHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  HKHeartbeatSeriesQuery *v11;
  uint64_t v12;
  id bufferHandler;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "heartbeatSeries");
    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "bufferHandler");
LABEL_3:
  +[HKSeriesType heartbeatSeriesType](HKSeriesType, "heartbeatSeriesType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)HKHeartbeatSeriesQuery;
  v11 = -[HKQuery _initWithObjectType:predicate:](&v15, sel__initWithObjectType_predicate_, v10, 0);

  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    bufferHandler = v11->_bufferHandler;
    v11->_bufferHandler = (id)v12;

    objc_storeStrong((id *)&v11->_heartbeatSeries, a3);
  }

  return v11;
}

- (void)client_deliverHeartbeats
{
  NSObject *v3;
  _QWORD block[5];

  -[HKQuery queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HKHeartbeatSeriesQuery_client_deliverHeartbeats__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __50__HKHeartbeatSeriesQuery_client_deliverHeartbeats__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 152));
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "activationUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__HKHeartbeatSeriesQuery_client_deliverHeartbeats__block_invoke_2;
    v6[3] = &unk_1E37E6D40;
    v5 = v2;
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 1, v6);

  }
}

void __50__HKHeartbeatSeriesQuery_client_deliverHeartbeats__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(v2 + 160), "heartbeatData");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, uint64_t, _QWORD))(v1 + 16))(v1, v2, v3, 1, 0);

}

- (void)_enumerateHeartbeatData:(id)a3 final:(BOOL)a4 handler:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, HKHeartbeatSeriesQuery *, BOOL, _BOOL8, _QWORD, __n128);
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  __n128 v15;
  _BOOL8 v16;
  unint64_t v17;
  char v18;
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, HKHeartbeatSeriesQuery *, BOOL, _BOOL8, _QWORD, __n128))a5;
  v10 = objc_msgSend(v8, "length");
  v11 = -[HKQuery deactivateCallCount](self, "deactivateCallCount");
  if (v10 >= 0x10)
  {
    v12 = v11;
    v13 = 0;
    v14 = v10 >> 4;
    do
    {
      if (-[HKQuery deactivateCallCount](self, "deactivateCallCount") > v12)
        break;
      objc_msgSend(v8, "getBytes:range:", &v17, v13, 16);
      v15.n128_u64[0] = v17;
      v16 = !--v14 && (unint64_t)v6;
      v9[2](v9, self, v18 != 0, v16, 0, v15);
      v13 += 16;
    }
    while (v14);
  }

}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3B7B10;
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
  v5 = _Block_copy(self->_bufferHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__HKHeartbeatSeriesQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __45__HKHeartbeatSeriesQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 1, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id bufferHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKHeartbeatSeriesQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  bufferHandler = self->_bufferHandler;
  self->_bufferHandler = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatSeries, 0);
  objc_storeStrong(&self->_bufferHandler, 0);
}

@end
