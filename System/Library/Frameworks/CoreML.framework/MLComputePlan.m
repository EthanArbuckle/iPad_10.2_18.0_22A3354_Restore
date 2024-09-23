@implementation MLComputePlan

- (MLComputePlan)initWithModelStructure:(id)a3 modelDescription:(id)a4 modelAssetStorageType:(int64_t)a5 executionSchedule:(id)a6 configuration:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MLComputePlan *v17;
  MLComputePlan *v18;
  uint64_t v19;
  NSDictionary *executionScheduleByModelStructurePath;
  NSDictionary *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSDictionary *computeDevicesBySupportedComputeUnits;
  objc_super v40;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v40.receiver = self;
  v40.super_class = (Class)MLComputePlan;
  v17 = -[MLComputePlan init](&v40, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_modelStructure, a3);
    objc_storeStrong((id *)&v18->_modelDescription, a4);
    v18->_modelAssetStorageType = a5;
    objc_storeStrong((id *)&v18->_configuration, a7);
    objc_msgSend(v15, "modelExecutionScheduleByModelStructurePath");
    v19 = objc_claimAutoreleasedReturnValue();
    executionScheduleByModelStructurePath = v18->_executionScheduleByModelStructurePath;
    v18->_executionScheduleByModelStructurePath = (NSDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    +[MLModel availableComputeDevices](MLModel, "availableComputeDevices");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_class();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v24, &unk_1E3DA2080);

    v25 = objc_opt_class();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v26, &unk_1E3DA2098);

    v27 = objc_opt_class();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v28, &unk_1E3DA20B0);

    -[NSDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", &unk_1E3DA2080);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", &unk_1E3DA2098);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "arrayByAddingObjectsFromArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v31, &unk_1E3DA20C8);

    -[NSDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", &unk_1E3DA2080);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", &unk_1E3DA20B0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "arrayByAddingObjectsFromArray:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v34, &unk_1E3DA20E0);

    -[NSDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", &unk_1E3DA20C8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", &unk_1E3DA20B0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "arrayByAddingObjectsFromArray:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v37, &unk_1E3DA20F8);

    computeDevicesBySupportedComputeUnits = v18->_computeDevicesBySupportedComputeUnits;
    v18->_computeDevicesBySupportedComputeUnits = v21;

  }
  return v18;
}

- (id)estimatedCostOfMLProgramOperation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  MLComputePlanCost *v9;
  MLComputePlanCost *v10;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MLComputePlan modelDescription](self, "modelDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLComputePlan modelAssetStorageType](self, "modelAssetStorageType");
  -[MLComputePlan executionScheduleByModelStructurePath](self, "executionScheduleByModelStructurePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "computeTimeRatio");
    v9 = [MLComputePlanCost alloc];
    objc_msgSend(v8, "computeTimeRatio");
    v10 = -[MLComputePlanCost initWithWeight:](v9, "initWithWeight:");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)computeDeviceUsageForNeuralNetworkLayer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[MLComputePlan executionScheduleByModelStructurePath](self, "executionScheduleByModelStructurePath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MLComputePlan configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLComputePlan computeDevicesBySupportedComputeUnits](self, "computeDevicesBySupportedComputeUnits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)computeDeviceUsageForMLProgramOperation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[MLComputePlan modelDescription](self, "modelDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLComputePlan modelAssetStorageType](self, "modelAssetStorageType");
  -[MLComputePlan executionScheduleByModelStructurePath](self, "executionScheduleByModelStructurePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MLComputePlan configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLComputePlan computeDevicesBySupportedComputeUnits](self, "computeDevicesBySupportedComputeUnits");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (MLModelStructure)modelStructure
{
  return self->_modelStructure;
}

- (NSDictionary)computeDevicesBySupportedComputeUnits
{
  return self->_computeDevicesBySupportedComputeUnits;
}

- (NSDictionary)executionScheduleByModelStructurePath
{
  return self->_executionScheduleByModelStructurePath;
}

- (int64_t)modelAssetStorageType
{
  return self->_modelAssetStorageType;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_executionScheduleByModelStructurePath, 0);
  objc_storeStrong((id *)&self->_computeDevicesBySupportedComputeUnits, 0);
  objc_storeStrong((id *)&self->_modelStructure, 0);
}

+ (id)computePlanOfModelStructure:(id)a3 modelAsset:(id)a4 configuration:(id)a5 error:(id *)a6
{
  _anonymous_namespace_ *v10;
  id v11;
  id v12;
  MLModelStructure *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t v29[8];
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v10 = (_anonymous_namespace_ *)a3;
  v11 = a4;
  v12 = a5;
  {
    v14 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v14, "setProfilingOptions:", 1);
    objc_msgSend(v11, "modelWithConfiguration:error:", v14, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "executionSchedule");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "modelExecutionScheduleByModelStructurePath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = objc_alloc((Class)a1);
        objc_msgSend(v16, "modelDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithModelStructure:modelDescription:modelAssetStorageType:executionSchedule:configuration:", v10, v20, objc_msgSend(v11, "storageType"), v17, v14);

      }
      else
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v29 = 0;
          _os_log_error_impl(&dword_19C486000, v24, OS_LOG_TYPE_ERROR, "Failed to construct compute plan, internal failure.", v29, 2u);
        }

        if (a6)
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v30 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to construct compute plan, internal failure."));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v27);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

        }
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
    goto LABEL_17;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v29 = 0;
    _os_log_error_impl(&dword_19C486000, v22, OS_LOG_TYPE_ERROR, "Failed to construct compute plan, model is not supported.", v29, 2u);
  }

  if (a6)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to construct compute plan, model is not supported."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v16);
    v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

    goto LABEL_18;
  }
  v21 = 0;
LABEL_18:

  return v21;
}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, id);
  void *v10;
  id v11;
  id v12;

  v8 = a4;
  v9 = (void (**)(id, _QWORD, id))a5;
  v12 = 0;
  +[MLModelAsset modelAssetWithURL:error:](MLModelAsset, "modelAssetWithURL:error:", a3, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  if (v10)
    objc_msgSend(a1, "loadModelAsset:configuration:completionHandler:", v10, v8, v9);
  else
    v9[2](v9, 0, v11);

}

+ (void)loadModelAsset:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__MLComputePlan_loadModelAsset_configuration_completionHandler___block_invoke;
  v13[3] = &unk_1E3D65660;
  v15 = v8;
  v16 = v9;
  v14 = v7;
  v10 = v8;
  v11 = v7;
  v12 = v9;
  objc_msgSend(v11, "modelStructureWithCompletionHandler:", v13);

}

void __64__MLComputePlan_loadModelAsset_configuration_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = a1[4];
    v8 = a1[5];
    v11 = v6;
    +[MLComputePlan computePlanOfModelStructure:modelAsset:configuration:error:](MLComputePlan, "computePlanOfModelStructure:modelAsset:configuration:error:", v5, v7, v8, &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
    v10 = v6;
  }

}

@end
