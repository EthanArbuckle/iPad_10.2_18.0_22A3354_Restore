@implementation HDCyclingDataCollectionForwarder

- (HDCyclingDataCollectionForwarder)init
{
  HDCyclingDataCollectionForwarder *v2;
  HDCyclingDataCollectionForwarder *v3;
  uint64_t v4;
  CMBikeSensor *cmBikeSensor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDCyclingDataCollectionForwarder;
  v2 = -[HDCyclingDataCollectionForwarder init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[HDCyclingDataCollectionForwarder _newBikeSensor](v2, "_newBikeSensor");
    cmBikeSensor = v3->_cmBikeSensor;
    v3->_cmBikeSensor = (CMBikeSensor *)v4;

  }
  return v3;
}

- (id)_newBikeSensor
{
  if (objc_msgSend(MEMORY[0x1E0CA55F0], "isAvailable"))
    return objc_alloc_init(MEMORY[0x1E0CA55F0]);
  else
    return 0;
}

- (void)insertSamples:(id)a3 device:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (self->_cmBikeSensor)
  {
    objc_msgSend(v9, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 == (void *)*MEMORY[0x1E0CB7560])
    {

    }
    else
    {
      if (!objc_msgSend(MEMORY[0x1E0CB6F18], "isCollectBLETypesFromLocalSourceEnabled"))
      {

        goto LABEL_9;
      }
      v13 = objc_msgSend(v10, "_isLocalDevice");

      if ((v13 & 1) == 0)
        goto LABEL_9;
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__HDCyclingDataCollectionForwarder_insertSamples_device_source___block_invoke;
    v15[3] = &unk_1E6D019E8;
    v15[4] = self;
    v16 = v8;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);

  }
LABEL_9:

}

void __64__HDCyclingDataCollectionForwarder_insertSamples_device_source___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = a2;
  v6 = v5;
  if (!v4)
  {

    goto LABEL_15;
  }
  v7 = (objc_class *)MEMORY[0x1E0CA55F8];
  v8 = v3;
  v9 = [v7 alloc];
  objc_msgSend(v6, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithTimestamp:", v10);

  objc_msgSend(v8, "manufacturer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setManufacturer:", v12);

  objc_msgSend(v8, "localIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDeviceIdentifier:", v13);

  objc_msgSend(v8, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setModel:", v14);
  objc_msgSend(v6, "quantityType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "code");

  switch(v16)
  {
    case 282:
      objc_msgSend(v6, "quantity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("count/min"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValueForUnit:", v18);
      objc_msgSend(v11, "setInstantaneousCadence:");
      goto LABEL_8;
    case 281:
      objc_msgSend(v6, "quantity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValueForUnit:", v18);
      objc_msgSend(v11, "setInstantaneousSpeed:");
      goto LABEL_8;
    case 280:
      objc_msgSend(v6, "quantity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "wattUnit");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValueForUnit:", v18);
      objc_msgSend(v11, "setInstantaneousPower:");
LABEL_8:

      v22 = v11;
      goto LABEL_12;
  }
  _HKInitializeLogging();
  v19 = (void *)*MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
  {
    v20 = v19;
    objc_msgSend(v6, "quantityType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v4;
    v25 = 2114;
    v26 = v21;
    _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Received non forwardable of %{public}@", buf, 0x16u);

  }
  v22 = 0;
LABEL_12:

  if (!v22)
  {
LABEL_15:
    v22 = 0;
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "feedBikeSensorData:");
LABEL_16:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmBikeSensor, 0);
}

@end
