@implementation _HKDataCollectorPendingBatch

- (_HKDataCollectorPendingBatch)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (_HKDataCollectorPendingBatch)initWithIdentifier:(id)a3 data:(id)a4 metadata:(id)a5 device:(id)a6 options:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _HKDataCollectorPendingBatch *v20;
  _HKDataCollectorPendingBatch *v21;
  _HKDataCollectorPendingBatch *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  if (a8)
  {
    v18 = _Block_copy(a8);
    v24[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[_HKDataCollectorPendingBatch initWithIdentifier:data:metadata:device:options:completions:](self, "initWithIdentifier:data:metadata:device:options:completions:", v17, v16, v15, v14, a7, v19);

    v21 = v20;
  }
  else
  {
    v22 = -[_HKDataCollectorPendingBatch initWithIdentifier:data:metadata:device:options:completions:](self, "initWithIdentifier:data:metadata:device:options:completions:", v17, v16, v15, v14, a7, MEMORY[0x1E0C9AA60]);

    v21 = v22;
  }

  return v21;
}

- (_HKDataCollectorPendingBatch)initWithIdentifier:(id)a3 data:(id)a4 metadata:(id)a5 device:(id)a6 options:(unint64_t)a7 completions:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _HKDataCollectorPendingBatch *v19;
  uint64_t v20;
  NSUUID *batchUUID;
  uint64_t v22;
  NSArray *data;
  uint64_t v24;
  NSDictionary *metadata;
  uint64_t v26;
  HKDevice *device;
  uint64_t v28;
  NSArray *completions;
  objc_super v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)_HKDataCollectorPendingBatch;
  v19 = -[_HKDataCollectorPendingBatch init](&v31, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    batchUUID = v19->_batchUUID;
    v19->_batchUUID = (NSUUID *)v20;

    v22 = objc_msgSend(v15, "copy");
    data = v19->_data;
    v19->_data = (NSArray *)v22;

    v24 = objc_msgSend(v16, "copy");
    metadata = v19->_metadata;
    v19->_metadata = (NSDictionary *)v24;

    v26 = objc_msgSend(v17, "copy");
    device = v19->_device;
    v19->_device = (HKDevice *)v26;

    v19->_options = a7;
    v28 = objc_msgSend(v18, "copy");
    completions = v19->_completions;
    v19->_completions = (NSArray *)v28;

  }
  return v19;
}

- (id)batchByAddingData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _HKDataCollectorPendingBatch *v8;
  NSUUID *batchUUID;
  void *v10;
  NSDictionary *metadata;
  HKDevice *device;
  unint64_t options;
  NSArray *completions;
  void *v15;
  void *v16;
  _HKDataCollectorPendingBatch *v17;

  v6 = a4;
  v7 = a3;
  v8 = [_HKDataCollectorPendingBatch alloc];
  batchUUID = self->_batchUUID;
  -[NSArray arrayByAddingObjectsFromArray:](self->_data, "arrayByAddingObjectsFromArray:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  metadata = self->_metadata;
  device = self->_device;
  options = self->_options;
  completions = self->_completions;
  if (v6)
  {
    v15 = _Block_copy(v6);
    -[NSArray arrayByAddingObject:](completions, "arrayByAddingObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[_HKDataCollectorPendingBatch initWithIdentifier:data:metadata:device:options:completions:](v8, "initWithIdentifier:data:metadata:device:options:completions:", batchUUID, v10, metadata, device, options, v16);

  }
  else
  {
    v17 = -[_HKDataCollectorPendingBatch initWithIdentifier:data:metadata:device:options:completions:](v8, "initWithIdentifier:data:metadata:device:options:completions:", batchUUID, v10, metadata, device, options, completions);
  }

  return v17;
}

- (void)callCompletionsWithSuccess:(BOOL)a3 error:(id)a4
{
  id v5;
  void *v6;
  NSUUID *batchUUID;
  NSObject *v8;
  void *v9;
  NSUInteger v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  _HKDataCollectorPendingBatch *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  NSUInteger v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[NSArray count](self->_completions, "count"))
  {
    _HKInitializeLogging();
    v6 = (void *)HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_INFO))
    {
      batchUUID = self->_batchUUID;
      v8 = v6;
      HKDiagnosticStringFromUUID(batchUUID);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSArray count](self->_completions, "count");
      *(_DWORD *)buf = 138543874;
      v22 = self;
      v23 = 2114;
      v24 = v9;
      v25 = 2048;
      v26 = v10;
      _os_log_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_INFO, "%{public}@: Batch %{public}@: Calling %ld completions from client.", buf, 0x20u);

    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = (void *)-[NSArray copy](self->_completions, "copy", 0);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++) + 16))();
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

  }
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  HKDiagnosticStringFromUUID(self->_batchUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ datums={%lu count} metadata={%lu values} device=%@>"), v4, self, v5, -[NSArray count](self->_data, "count"), -[NSDictionary count](self->_metadata, "count"), self->_device);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isTransient
{
  return self->_options & 1;
}

- (NSUUID)batchUUID
{
  return self->_batchUUID;
}

- (NSArray)data
{
  return self->_data;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (HKDevice)device
{
  return self->_device;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSArray)completions
{
  return self->_completions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_batchUUID, 0);
}

@end
