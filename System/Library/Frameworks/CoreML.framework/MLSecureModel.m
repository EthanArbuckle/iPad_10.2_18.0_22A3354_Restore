@implementation MLSecureModel

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD block[4];
  id v41;
  id v42;
  id v43;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "hash"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLSecureModel connectionToModelSecurityService](self, "connectionToModelSecurityService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exportedObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "serviceToClientQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MLSecureModel_predictionFromFeatures_options_error___block_invoke;
  block[3] = &unk_1E3D66278;
  v15 = v12;
  v41 = v15;
  v16 = v10;
  v42 = v16;
  v17 = v8;
  v43 = v17;
  dispatch_sync(v13, block);

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__9164;
  v38 = __Block_byref_object_dispose__9165;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__9164;
  v32 = __Block_byref_object_dispose__9165;
  v33 = 0;
  -[MLSecureModel secureModelProxy](self, "secureModelProxy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __54__MLSecureModel_predictionFromFeatures_options_error___block_invoke_2;
  v27[3] = &unk_1E3D65800;
  v27[4] = &v34;
  v27[5] = &v28;
  objc_msgSend(v18, "securePredictionFromLazyFeatures:options:withReply:", v16, v9, v27);

  objc_msgSend(v15, "serviceToClientQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __54__MLSecureModel_predictionFromFeatures_options_error___block_invoke_95;
  v24[3] = &unk_1E3D66FB8;
  v20 = v15;
  v25 = v20;
  v21 = v16;
  v26 = v21;
  dispatch_sync(v19, v24);

  if (a5)
    *a5 = objc_retainAutorelease((id)v29[5]);
  v22 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v22;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLSecureModel predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD block[4];
  id v46;
  id v47;
  id v48;
  _QWORD aBlock[7];

  v8 = a3;
  v9 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  v10 = -[MLModel signpostID](self, "signpostID");
  v11 = objc_msgSend(v9, "parentSignpostID");
  kdebug_trace();
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MLSecureModel connectionToModelSecurityService](self, "connectionToModelSecurityService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exportedObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "serviceToClientQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke_2;
  block[3] = &unk_1E3D66278;
  v18 = v8;
  v46 = v18;
  v19 = v16;
  v47 = v19;
  v20 = v15;
  v48 = v20;
  dispatch_sync(v17, block);

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__9164;
  v43 = __Block_byref_object_dispose__9165;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__9164;
  v37 = __Block_byref_object_dispose__9165;
  v38 = 0;
  -[MLSecureModel secureModelProxy](self, "secureModelProxy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v12;
  v32[1] = 3221225472;
  v32[2] = __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke_3;
  v32[3] = &unk_1E3D65828;
  v32[4] = &v39;
  v32[5] = &v33;
  objc_msgSend(v21, "securePredictionFromLazyBatch:options:withReply:", v19, v9, v32);

  objc_msgSend(v20, "serviceToClientQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  v28[0] = v12;
  v28[1] = 3221225472;
  v28[2] = __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke_100;
  v28[3] = &unk_1E3D66278;
  v23 = v18;
  v29 = v23;
  v24 = v19;
  v30 = v24;
  v25 = v20;
  v31 = v25;
  dispatch_sync(v22, v28);

  if (a5)
    *a5 = objc_retainAutorelease((id)v34[5]);
  v26 = (id)v40[5];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  v13[2](v13);
  return v26;
}

- (id)predictionsFromBatch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLSecureModel predictionsFromBatch:options:error:](self, "predictionsFromBatch:options:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9164;
  v21 = __Block_byref_object_dispose__9165;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9164;
  v15 = __Block_byref_object_dispose__9165;
  v16 = 0;
  -[MLSecureModel secureModelProxy](self, "secureModelProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__MLSecureModel_parameterValueForKey_error___block_invoke;
  v10[3] = &unk_1E3D65850;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(v7, "secureParameterValueForKey:withReply:", v6, v10);

  if (a4)
    *a4 = objc_retainAutorelease((id)v12[5]);
  v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MLModel configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("congfiguration"));

  -[MLModel modelDescription](self, "modelDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("modelDescription"));

}

- (MLSecureModel)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MLSecureModel *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("congfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)MLSecureModel;
  v7 = -[MLModel initWithDescription:configuration:](&v9, sel_initWithDescription_configuration_, v6, v5);

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[MLSecureModel connectionToModelSecurityService](self, "connectionToModelSecurityService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MLSecureModel connectionToModelSecurityService](self, "connectionToModelSecurityService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
  v5.receiver = self;
  v5.super_class = (Class)MLSecureModel;
  -[MLSecureModel dealloc](&v5, sel_dealloc);
}

- (NSXPCConnection)connectionToModelSecurityService
{
  return self->_connectionToModelSecurityService;
}

- (void)setConnectionToModelSecurityService:(id)a3
{
  objc_storeStrong((id *)&self->_connectionToModelSecurityService, a3);
}

- (CoreMLModelSecurityProtocol)secureModelProxy
{
  return self->_secureModelProxy;
}

- (void)setSecureModelProxy:(id)a3
{
  objc_storeStrong((id *)&self->_secureModelProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureModelProxy, 0);
  objc_storeStrong((id *)&self->_connectionToModelSecurityService, 0);
}

void __44__MLSecureModel_parameterValueForKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "Could not obtain parameterValueForKey from secure model via XPC: error=%@", (uint8_t *)&v13, 0xCu);
    }

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

uint64_t __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke()
{
  return kdebug_trace();
}

uint64_t __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke_2(id *a1)
{
  uint64_t result;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  result = objc_msgSend(a1[4], "count");
  if (result >= 1)
  {
    for (i = 0; i < result; ++i)
    {
      objc_msgSend(a1[4], "featuresAtIndex:", i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "setObject:atIndexedSubscript:", v5, i);
      objc_msgSend(a1[6], "featureProviderCount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v5);

      objc_msgSend(a1[6], "featureProviderMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, v5);

      result = objc_msgSend(a1[4], "count");
    }
  }
  return result;
}

void __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "Could not batch predict from secure model via XPC: error=%@", (uint8_t *)&v13, 0xCu);
    }

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

uint64_t __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke_100(id *a1)
{
  uint64_t result;
  uint64_t i;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  result = objc_msgSend(a1[4], "count");
  if (result >= 1)
  {
    for (i = 0; i < result; ++i)
    {
      objc_msgSend(a1[5], "objectAtIndexedSubscript:", i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "featureProviderCount");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countForObject:", v4);

      objc_msgSend(a1[6], "featureProviderCount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v4);

      if (v6 == 1)
      {
        objc_msgSend(a1[6], "featureProviderMap");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectForKey:", v4);

      }
      result = objc_msgSend(a1[4], "count");
    }
  }
  return result;
}

void __54__MLSecureModel_predictionFromFeatures_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "featureProviderCount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "featureProviderMap");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

}

void __54__MLSecureModel_predictionFromFeatures_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "Could not predict from secure model via XPC: error=%@", (uint8_t *)&v13, 0xCu);
    }

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

void __54__MLSecureModel_predictionFromFeatures_options_error___block_invoke_95(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "featureProviderCount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countForObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "featureProviderCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  if (v3 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "featureProviderMap");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
}

+ (id)sandboxExtensionPathsForModelURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "hasDirectoryPath"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "URLByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)sandboxExtensionTokenForModelURL:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[MLSecureModel sandboxExtensionPathsForModelURL:](MLSecureModel, "sandboxExtensionPathsForModelURL:", a3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v13;
    v18 = 2112;
    v19 = v4;
    _os_log_debug_impl(&dword_19C486000, v5, OS_LOG_TYPE_DEBUG, "%@: modelPathStr=%@", buf, 0x16u);

  }
  if ((-[__CFString hasPrefix:](v4, "hasPrefix:", CFSTR("/System/Library/")) & 1) != 0)
  {
    v6 = &stru_1E3D68DC8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/"), v4);
    v7 = (__CFString *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[__CFString UTF8String](v7, "UTF8String");
    v8 = sandbox_extension_issue_file();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      free(v9);
    }
    else
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v15;
        v18 = 2112;
        v19 = v7;
        _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "%@: sandbox_extension_issue_file() returned NULL. path=%@", buf, 0x16u);

      }
      v6 = &stru_1E3D68DC8;
    }

  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v14;
    v18 = 2112;
    v19 = v6;
    _os_log_debug_impl(&dword_19C486000, v11, OS_LOG_TYPE_DEBUG, "%@: sandboxExtensionToken=%@", buf, 0x16u);

  }
  return v6;
}

+ (id)modelWithContentsOfURL:(id)a3 configuration:(id)a4 decryptCredential:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  CoreMLModelSecurityServiceToClient *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  const char *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[4];
  __CFString *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.CoreMLModelSecurityService"));
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE465770);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRemoteObjectInterface:", v13);

    objc_msgSend(v12, "setInterruptionHandler:", &__block_literal_global_9192);
    objc_msgSend(v12, "setInvalidationHandler:", &__block_literal_global_79);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4406E0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setExportedInterface:", v14);

    v15 = objc_alloc_init(CoreMLModelSecurityServiceToClient);
    objc_msgSend(v12, "setExportedObject:", v15);

    objc_msgSend(v12, "resume");
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__9164;
    v43 = __Block_byref_object_dispose__9165;
    v44 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __78__MLSecureModel_modelWithContentsOfURL_configuration_decryptCredential_error___block_invoke_86;
    v36[3] = &unk_1E3D657B0;
    v37 = CFSTR("com.apple.CoreMLModelSecurityService");
    v38 = &v39;
    objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v36);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6)
      *a6 = objc_retainAutorelease((id)v40[5]);
    if (v40[5])
    {
      v18 = 0;
    }
    else
    {
      v30 = 0;
      v31 = &v30;
      v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__9164;
      v34 = __Block_byref_object_dispose__9165;
      v35 = 0;
      +[MLSecureModel sandboxExtensionTokenForModelURL:](MLSecureModel, "sandboxExtensionTokenForModelURL:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v16;
      v29[1] = 3221225472;
      v29[2] = __78__MLSecureModel_modelWithContentsOfURL_configuration_decryptCredential_error___block_invoke_88;
      v29[3] = &unk_1E3D657D8;
      v29[4] = &v39;
      v29[5] = &v30;
      objc_msgSend(v17, "secureModelWithContentsOfURL:sandboxExtensionToken:configuration:decryptCredential:withReply:", v9, v19, v10, v11, v29);

      if (a6)
        *a6 = objc_retainAutorelease((id)v40[5]);
      if (v40[5])
      {
        v18 = 0;
      }
      else
      {
        v20 = (void *)v31[5];
        if (v20)
        {
          objc_msgSend(v20, "setConnectionToModelSecurityService:", v12);
          objc_msgSend((id)v31[5], "setSecureModelProxy:", v17);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.CoreMLModelSecutiyServiceToClient.%lu"), objc_msgSend(v12, "hash"));
          v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v22 = (const char *)objc_msgSend(v21, "UTF8String");
          dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = dispatch_queue_create(v22, v23);
          objc_msgSend((id)v31[5], "connectionToModelSecurityService");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "exportedObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setServiceToClientQueue:", v24);

          v27 = (void *)v31[5];
        }
        else
        {
          v27 = 0;
        }
        v18 = v27;
      }
      _Block_object_dispose(&v30, 8);

    }
    _Block_object_dispose(&v39, 8);

  }
  else if (a6)
  {
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("nil value for URL"));
    v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)modelWithContentsOfURL:(id)a3 decryptCredential:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  +[MLModelConfiguration defaultConfiguration](MLModelConfiguration, "defaultConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLSecureModel modelWithContentsOfURL:configuration:decryptCredential:error:](MLSecureModel, "modelWithContentsOfURL:configuration:decryptCredential:error:", v8, v9, v7, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __78__MLSecureModel_modelWithContentsOfURL_configuration_decryptCredential_error___block_invoke_86(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_error_impl(&dword_19C486000, v4, OS_LOG_TYPE_ERROR, "Could not create connection to %@ : error=%@", (uint8_t *)&v8, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __78__MLSecureModel_modelWithContentsOfURL_configuration_decryptCredential_error___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "Could not create secure model via XPC: error=%@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

void __78__MLSecureModel_modelWithContentsOfURL_configuration_decryptCredential_error___block_invoke_78()
{
  NSObject *v0;
  uint8_t v1[16];

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_19C486000, v0, OS_LOG_TYPE_DEBUG, "Entered invalidationHandler!", v1, 2u);
  }

}

void __78__MLSecureModel_modelWithContentsOfURL_configuration_decryptCredential_error___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_19C486000, v0, OS_LOG_TYPE_DEBUG, "Entered interruptionHandler!", v1, 2u);
  }

}

@end
