@implementation HKElectrocardiogramQuery

- (HKElectrocardiogramQuery)initWithElectrocardiogram:(id)a3 lead:(int64_t)a4 dataHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  HKElectrocardiogramQuery *v10;
  _QWORD v12[4];
  HKElectrocardiogramQuery *v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[4];

  v7 = a3;
  v8 = a5;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__HKElectrocardiogramQuery_initWithElectrocardiogram_lead_dataHandler___block_invoke;
  v12[3] = &unk_1E37EFCD0;
  v13 = self;
  v9 = v8;
  v14 = v9;
  v15 = v16;
  v10 = -[HKElectrocardiogramQuery initWithElectrocardiogram:dataHandler:](v13, "initWithElectrocardiogram:dataHandler:", v7, v12);

  _Block_object_dispose(v16, 8);
  return v10;
}

void __71__HKElectrocardiogramQuery_initWithElectrocardiogram_lead_dataHandler___block_invoke(_QWORD *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  float v14;

  v8 = *(_QWORD *)(a1[4] + 160);
  v9 = a5;
  v10 = a2;
  objc_msgSend(a3, "quantityForLead:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit voltUnitWithMetricPrefix:](HKUnit, "voltUnitWithMetricPrefix:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValueForUnit:", v12);
  v14 = v13;

  (*(void (**)(float))(a1[5] + 16))(v14);
  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
}

- (HKElectrocardiogramQuery)initWithElectrocardiogram:(HKElectrocardiogram *)electrocardiogram dataHandler:(void *)dataHandler
{
  HKElectrocardiogram *v7;
  void *v8;
  void *v9;
  void *v10;
  HKElectrocardiogramQuery *v11;
  void *v12;
  id sampleHandler;
  _QWORD aBlock[4];
  id v16;
  objc_super v17;

  v7 = electrocardiogram;
  v8 = dataHandler;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "electrocardiogram");
    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "dataHandler");
LABEL_3:
  +[HKObjectType electrocardiogramType](HKElectrocardiogramType, "electrocardiogramType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)HKElectrocardiogramQuery;
  v11 = -[HKQuery _initWithObjectType:predicate:](&v17, sel__initWithObjectType_predicate_, v10, 0);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_electrocardiogram, electrocardiogram);
    v11->_lead = 1;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__HKElectrocardiogramQuery_initWithElectrocardiogram_dataHandler___block_invoke;
    aBlock[3] = &unk_1E37EFCF8;
    v16 = v9;
    v12 = _Block_copy(aBlock);
    sampleHandler = v11->_sampleHandler;
    v11->_sampleHandler = v12;

  }
  return v11;
}

uint64_t __66__HKElectrocardiogramQuery_initWithElectrocardiogram_dataHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  v5 = *(_QWORD *)(a1 + 32);
  if (a3)
    return objc_msgSend(a2, "_enumerateMeasurementsForElectrocardiogram:handler:", a3, v5, a4);
  else
    return (*(uint64_t (**)(_QWORD, void *, _QWORD, uint64_t, uint64_t))(v5 + 16))(*(_QWORD *)(a1 + 32), a2, 0, 1, a4);
}

- (HKElectrocardiogramQuery)initWithElectrocardiogram:(id)a3 sampleHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  HKElectrocardiogramQuery *v11;
  uint64_t v12;
  id sampleHandler;
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
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "electrocardiogram");
    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "sampleHandler");
LABEL_3:
  +[HKObjectType electrocardiogramType](HKElectrocardiogramType, "electrocardiogramType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogramQuery;
  v11 = -[HKQuery _initWithObjectType:predicate:](&v15, sel__initWithObjectType_predicate_, v10, 0);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_electrocardiogram, a3);
    v11->_lead = 1;
    v12 = objc_msgSend(v9, "copy");
    sampleHandler = v11->_sampleHandler;
    v11->_sampleHandler = (id)v12;

  }
  return v11;
}

- (void)client_deliverData
{
  NSObject *v3;
  _QWORD block[5];

  -[HKQuery queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__HKElectrocardiogramQuery_client_deliverData__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __46__HKElectrocardiogramQuery_client_deliverData__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 168));
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "activationUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__HKElectrocardiogramQuery_client_deliverData__block_invoke_2;
    v8[3] = &unk_1E37E6710;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = v3;
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);

  }
}

uint64_t __46__HKElectrocardiogramQuery_client_deliverData__block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)_enumerateMeasurementsForElectrocardiogram:(id)a3 handler:(id)a4
{
  void (**v6)(id, HKElectrocardiogramQuery *, void *, BOOL, _QWORD);
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, HKElectrocardiogramQuery *, void *, BOOL, _QWORD))a4;
  if (objc_msgSend(v13, "numberOfVoltageMeasurements"))
  {
    v7 = -[HKQuery deactivateCallCount](self, "deactivateCallCount");
    objc_msgSend(v13, "voltageMeasurementEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      while (1)
      {
        v11 = (void *)MEMORY[0x19AEC7968]();
        if (-[HKQuery deactivateCallCount](self, "deactivateCallCount") > v7)
          break;
        objc_msgSend(v8, "nextObject");
        v12 = objc_claimAutoreleasedReturnValue();
        v6[2](v6, self, v10, v12 == 0, 0);

        objc_autoreleasePoolPop(v11);
        v10 = (void *)v12;
        if (!v12)
          goto LABEL_9;
      }
      objc_autoreleasePoolPop(v11);

    }
LABEL_9:

  }
  else
  {
    v6[2](v6, self, 0, 1, 0);
  }

}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3C9090;
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
  v5 = _Block_copy(self->_sampleHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__HKElectrocardiogramQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __47__HKElectrocardiogramQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id sampleHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKElectrocardiogramQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  sampleHandler = self->_sampleHandler;
  self->_sampleHandler = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sampleHandler, 0);
  objc_storeStrong((id *)&self->_electrocardiogram, 0);
}

@end
