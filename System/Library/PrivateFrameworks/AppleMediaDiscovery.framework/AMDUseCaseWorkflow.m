@implementation AMDUseCaseWorkflow

- (AMDUseCaseWorkflow)initWithDictionary:(id)a3
{
  AMDUseCaseWorkflow *v3;
  AMDUseCaseWorkflow *v5;
  AMDOutputBuilder *v6;
  AMDOutputBuilder *v7;
  AMDInputBuilder *v8;
  AMDInputBuilder *v9;
  NSString *v10;
  AMDOutputBuilder *v11;
  AMDOutputBuilder *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char isKindOfClass;
  id v20;
  id v21;
  AMDInputBuilder *v22;
  AMDInputBuilder *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  AMDOutputBuilder *v29;
  char v30;
  NSString *v31;
  id v32;
  char v33;
  AMDInputBuilder *v34;
  char v35;
  NSString *v36;
  id v37;
  char v38;
  AMDOutputBuilder *v39;
  char v40;
  NSString *v41;
  id v42;
  id v43;
  char v44;
  id v45;
  id v46;
  char v47;
  AMDInputBuilder *v48;
  char v49;
  NSString *v50;
  id v51;
  objc_super v52;
  id location[2];
  AMDUseCaseWorkflow *v54;

  v54 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v54;
  v54 = 0;
  v52.receiver = v3;
  v52.super_class = (Class)AMDUseCaseWorkflow;
  v54 = -[AMDUseCaseWorkflow init](&v52, sel_init);
  objc_storeStrong((id *)&v54, v54);
  v24 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("model_id"));
  -[AMDUseCaseWorkflow setModelId:](v54, "setModelId:");

  v25 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("secondary_model_id"));
  -[AMDUseCaseWorkflow setSecondaryModelId:](v54, "setSecondaryModelId:");

  v26 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("end_timestamp"));
  -[AMDUseCaseWorkflow setEndTimestamp:](v54, "setEndTimestamp:");

  v27 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("use_case_id"));
  -[AMDUseCaseWorkflow setUseCaseId:](v54, "setUseCaseId:");

  v51 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("input_definitions"));
  v49 = 0;
  v47 = 0;
  if (v51)
  {
    v22 = [AMDInputBuilder alloc];
    v50 = -[AMDUseCaseWorkflow modelId](v54, "modelId");
    v49 = 1;
    v48 = -[AMDInputBuilder initWithDictionary:andModelId:](v22, "initWithDictionary:andModelId:", v51);
    v47 = 1;
    v23 = v48;
  }
  else
  {
    v23 = 0;
  }
  -[AMDUseCaseWorkflow setInputBuilder:](v54, "setInputBuilder:", v23);
  if ((v47 & 1) != 0)

  if ((v49 & 1) != 0)
  v20 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("max_items_to_display"));
  -[AMDUseCaseWorkflow setMaxItemsToDisplay:](v54, "setMaxItemsToDisplay:");

  v21 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("model_format"));
  -[AMDUseCaseWorkflow setModelFormat:](v54, "setModelFormat:");

  -[AMDUseCaseWorkflow setColdstartModelId:](v54, "setColdstartModelId:");
  -[AMDUseCaseWorkflow setUseMinimalMap:](v54, "setUseMinimalMap:", 0);
  v46 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("resources"));
  if (v46 && objc_msgSend(v46, "count"))
  {
    v18 = (id)objc_msgSend(v46, "firstObject");
    v44 = 0;
    isKindOfClass = 0;
    if (v18)
    {
      v45 = (id)objc_msgSend(v46, "firstObject");
      v44 = 1;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    if ((v44 & 1) != 0)

    if ((isKindOfClass & 1) != 0)
    {
      v43 = (id)objc_msgSend(v46, "firstObject");
      v16 = (id)objc_msgSend(v43, "objectForKey:", CFSTR("coldstart_model_id"));
      -[AMDUseCaseWorkflow setColdstartModelId:](v54, "setColdstartModelId:");

      v17 = (id)objc_msgSend(v43, "objectForKey:", CFSTR("use_minimal_map"));
      -[AMDUseCaseWorkflow setUseMinimalMap:](v54, "setUseMinimalMap:");

      objc_storeStrong(&v43, 0);
    }
  }
  v13 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("rule_params"));
  -[AMDUseCaseWorkflow setRuleParams:](v54, "setRuleParams:");

  v14 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("start_timestamp"));
  -[AMDUseCaseWorkflow setStartTimestamp:](v54, "setStartTimestamp:");

  v15 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("treatment_id"));
  -[AMDUseCaseWorkflow setTreatmentId:](v54, "setTreatmentId:");

  v42 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("output_definitions"));
  v40 = 0;
  v38 = 0;
  if (v42)
  {
    v11 = [AMDOutputBuilder alloc];
    v41 = -[AMDUseCaseWorkflow useCaseId](v54, "useCaseId");
    v40 = 1;
    v39 = -[AMDOutputBuilder initWithDictionary:forUseCase:](v11, "initWithDictionary:forUseCase:", v42);
    v38 = 1;
    v12 = v39;
  }
  else
  {
    v12 = 0;
  }
  -[AMDUseCaseWorkflow setOutputBuilder:](v54, "setOutputBuilder:", v12);
  if ((v38 & 1) != 0)

  if ((v40 & 1) != 0)
  v10 = -[AMDUseCaseWorkflow secondaryModelId](v54, "secondaryModelId");

  if (v10)
  {
    v37 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("secondary_model_input_definitions"));
    v35 = 0;
    v33 = 0;
    if (v37)
    {
      v8 = [AMDInputBuilder alloc];
      v36 = -[AMDUseCaseWorkflow secondaryModelId](v54, "secondaryModelId");
      v35 = 1;
      v34 = -[AMDInputBuilder initWithDictionary:andModelId:](v8, "initWithDictionary:andModelId:", v37);
      v33 = 1;
      v9 = v34;
    }
    else
    {
      v9 = 0;
    }
    -[AMDUseCaseWorkflow setSecondaryModelInputBuilder:](v54, "setSecondaryModelInputBuilder:", v9);
    if ((v33 & 1) != 0)

    if ((v35 & 1) != 0)
    v32 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("secondary_model_output_definitions"));
    v30 = 0;
    v28 = 0;
    if (v32)
    {
      v6 = [AMDOutputBuilder alloc];
      v31 = -[AMDUseCaseWorkflow useCaseId](v54, "useCaseId");
      v30 = 1;
      v29 = -[AMDOutputBuilder initWithDictionary:forUseCase:](v6, "initWithDictionary:forUseCase:", v32);
      v28 = 1;
      v7 = v29;
    }
    else
    {
      v7 = 0;
    }
    -[AMDUseCaseWorkflow setSecondaryModelOutputBuilder:](v54, "setSecondaryModelOutputBuilder:", v7);
    if ((v28 & 1) != 0)

    if ((v30 & 1) != 0)
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v37, 0);
  }
  v5 = v54;
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v54, 0);
  return v5;
}

- (id)getUseCaseId
{
  return -[AMDUseCaseWorkflow useCaseId](self, "useCaseId", a2, self);
}

- (id)getModelId
{
  return -[AMDUseCaseWorkflow modelId](self, "modelId", a2, self);
}

- (id)getColdstartModelId
{
  return -[AMDUseCaseWorkflow coldstartModelId](self, "coldstartModelId", a2, self);
}

- (id)getModelFormat
{
  return -[AMDUseCaseWorkflow modelFormat](self, "modelFormat", a2, self);
}

- (id)getTreatmentId
{
  return -[AMDUseCaseWorkflow treatmentId](self, "treatmentId", a2, self);
}

- (id)getMaxItemsToDisplay
{
  return -[AMDUseCaseWorkflow maxItemsToDisplay](self, "maxItemsToDisplay", a2, self);
}

- (id)getOutputFeatureIds
{
  AMDOutputBuilder *v3;
  id v4;

  v3 = -[AMDUseCaseWorkflow outputBuilder](self, "outputBuilder");
  v4 = -[AMDOutputBuilder getAllFeatureIds](v3, "getAllFeatureIds");

  return v4;
}

- (id)getPredictions:(unint64_t)a3 forDomain:(id)a4 error:(id *)a5
{
  NSString *v5;
  NSString *v7;
  id v8;
  id v9;
  void *v10;
  NSString *v11;
  void *v12;
  id v13;
  NSString *v14;
  NSNumber *v15;
  NSString *v16;
  unint64_t v17;
  AMDOutputBuilder *v18;
  AMDInputBuilder *v19;
  NSObject *v20;
  os_log_type_t v21;
  id v22;
  NSString *v23;
  id v24;
  id v25;
  BOOL v26;
  void *v27;
  NSString *v28;
  void *v29;
  id v30;
  NSString *v31;
  id v32;
  unint64_t v33;
  AMDInputBuilder *v34;
  AMDOutputBuilder *v35;
  NSString *v36;
  NSNumber *v37;
  NSString *v38;
  void *v39;
  NSString *v40;
  os_log_t v42;
  id v43;
  os_log_type_t v44;
  os_log_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  os_log_type_t v50;
  os_log_t v51;
  id v52;
  os_log_type_t v53;
  os_log_t oslog;
  id v55;
  os_log_type_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  int v62;
  os_log_type_t v63;
  id v64;
  id v65;
  id *v66;
  id location;
  unint64_t v68;
  SEL v69;
  AMDUseCaseWorkflow *v70;
  id v71;
  uint8_t v72[16];
  uint8_t v73[16];
  uint8_t v74[16];
  uint8_t v75[16];
  uint8_t v76[16];
  uint8_t v77[24];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v70 = self;
  v69 = a2;
  v68 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v66 = a5;
  if (-[AMDUseCaseWorkflow isValid](v70, "isValid"))
  {
    v38 = -[AMDUseCaseWorkflow modelId](v70, "modelId");
    v37 = -[AMDUseCaseWorkflow useMinimalMap](v70, "useMinimalMap");
    v61 = +[AMDBaseRecoModel getModelforId:useMinimalMap:error:](AMDBaseRecoModel, "getModelforId:useMinimalMap:error:", v38);

    if (*v66)
    {
      v71 = 0;
      v62 = 1;
    }
    else
    {
      v60 = -[AMDUseCaseWorkflow getColdstartModelId](v70, "getColdstartModelId");
      v33 = v68;
      v34 = -[AMDUseCaseWorkflow inputBuilder](v70, "inputBuilder");
      v35 = -[AMDUseCaseWorkflow outputBuilder](v70, "outputBuilder");
      v36 = -[AMDUseCaseWorkflow secondaryModelId](v70, "secondaryModelId");
      if (v36)
        v32 = 0;
      else
        v32 = v60;
      v59 = (id)objc_msgSend(v61, "getPredictions:andInputBuilder:andOutputBuilder:withColdstartModelId:error:", v33, v34, v35, v32, v66);

      if (*v66)
      {
        v29 = (void *)MEMORY[0x1E0CB3940];
        v31 = -[AMDUseCaseWorkflow modelId](v70, "modelId");
        v30 = (id)objc_msgSend(*v66, "localizedDescription");
        v58 = (id)objc_msgSend(v29, "stringWithFormat:", CFSTR("Inference failed for model: %@ error: %@"), v31, v30);

        v57 = MEMORY[0x1E0C81028];
        v56 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v76, (uint64_t)v58);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v57, v56, "%@", v76, 0xCu);
        }
        objc_storeStrong(&v57, 0);
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v58, CFSTR("inferenceFailure"), 0);
        v71 = 0;
        v62 = 1;
        objc_storeStrong(&v58, 0);
      }
      else if (v59)
      {
        v25 = (id)objc_msgSend(v61, "modelMetadata");
        v24 = (id)objc_msgSend(v25, "getModelUid");
        v23 = -[AMDUseCaseWorkflow modelId](v70, "modelId");
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v24);

        v5 = -[AMDUseCaseWorkflow secondaryModelId](v70, "secondaryModelId");
        v26 = v5 != 0;

        if (v26)
        {
          v52 = +[AMDFeatureProvider getProviderForSource:WithDomain:](AMDFeatureProvider, "getProviderForSource:WithDomain:", 0x1EA4BB608, 0);
          objc_msgSend(v52, "storeFeatureData:error:", v59, v66);
          if (*v66)
          {
            v51 = (os_log_t)MEMORY[0x1E0C81028];
            v50 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              v20 = v51;
              v21 = v50;
              v22 = (id)objc_msgSend(*v66, "localizedDescription");
              v49 = v22;
              __os_log_helper_16_2_1_8_64((uint64_t)v74, (uint64_t)v49);
              _os_log_error_impl(&dword_1DC678000, v20, v21, "Intermediate output store failed. Error: %@", v74, 0xCu);

              objc_storeStrong(&v49, 0);
            }
            objc_storeStrong((id *)&v51, 0);
            v71 = 0;
            v62 = 1;
          }
          else
          {
            v16 = -[AMDUseCaseWorkflow secondaryModelId](v70, "secondaryModelId");
            v15 = -[AMDUseCaseWorkflow useMinimalMap](v70, "useMinimalMap");
            v48 = +[AMDBaseRecoModel getModelforId:useMinimalMap:error:](AMDBaseRecoModel, "getModelforId:useMinimalMap:error:", v16);

            v17 = v68;
            v19 = -[AMDUseCaseWorkflow secondaryModelInputBuilder](v70, "secondaryModelInputBuilder");
            v18 = -[AMDUseCaseWorkflow secondaryModelOutputBuilder](v70, "secondaryModelOutputBuilder");
            v47 = (id)objc_msgSend(v48, "getPredictions:andInputBuilder:andOutputBuilder:withColdstartModelId:error:", v17, v19);

            if (*v66)
            {
              v12 = (void *)MEMORY[0x1E0CB3940];
              v14 = -[AMDUseCaseWorkflow secondaryModelId](v70, "secondaryModelId");
              v13 = (id)objc_msgSend(*v66, "localizedDescription");
              v46 = (id)objc_msgSend(v12, "stringWithFormat:", CFSTR("Inference failed for model: %@ error: %@"), v14, v13);

              v45 = (os_log_t)MEMORY[0x1E0C81028];
              v44 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v73, (uint64_t)v46);
                _os_log_error_impl(&dword_1DC678000, v45, v44, "%@", v73, 0xCu);
              }
              objc_storeStrong((id *)&v45, 0);
              +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v46, CFSTR("inferenceFailure"), 0);
              v71 = 0;
              v62 = 1;
              objc_storeStrong(&v46, 0);
            }
            else if (v47)
            {
              v9 = (id)objc_msgSend(v48, "modelMetadata");
              v8 = (id)objc_msgSend(v9, "getModelUid");
              v7 = -[AMDUseCaseWorkflow secondaryModelId](v70, "secondaryModelId");
              +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v8);

              v71 = v47;
              v62 = 1;
            }
            else
            {
              v10 = (void *)MEMORY[0x1E0CB3940];
              v11 = -[AMDUseCaseWorkflow modelId](v70, "modelId");
              v43 = (id)objc_msgSend(v10, "stringWithFormat:", CFSTR("Inference failed for model: %@. Nil output"), v11);

              v42 = (os_log_t)MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v72, (uint64_t)v43);
                _os_log_error_impl(&dword_1DC678000, v42, OS_LOG_TYPE_ERROR, "%@", v72, 0xCu);
              }
              objc_storeStrong((id *)&v42, 0);
              +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v43, CFSTR("inferenceFailure"), 0);
              v71 = 0;
              v62 = 1;
              objc_storeStrong(&v43, 0);
            }
            objc_storeStrong(&v47, 0);
            objc_storeStrong(&v48, 0);
          }
          objc_storeStrong(&v52, 0);
        }
        else
        {
          v71 = v59;
          v62 = 1;
        }
      }
      else
      {
        v27 = (void *)MEMORY[0x1E0CB3940];
        v28 = -[AMDUseCaseWorkflow modelId](v70, "modelId");
        v55 = (id)objc_msgSend(v27, "stringWithFormat:", CFSTR("Inference failed for model: %@. Nil output"), v28);

        oslog = (os_log_t)MEMORY[0x1E0C81028];
        v53 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v75, (uint64_t)v55);
          _os_log_error_impl(&dword_1DC678000, oslog, v53, "%@", v75, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v55, CFSTR("inferenceFailure"), 0);
        v71 = 0;
        v62 = 1;
        objc_storeStrong(&v55, 0);
      }
      objc_storeStrong(&v59, 0);
      objc_storeStrong(&v60, 0);
    }
    objc_storeStrong(&v61, 0);
  }
  else
  {
    v39 = (void *)MEMORY[0x1E0CB3940];
    v40 = -[AMDUseCaseWorkflow useCaseId](v70, "useCaseId");
    v65 = (id)objc_msgSend(v39, "stringWithFormat:", CFSTR("Using unusable workflow for use case '%@'"), v40);

    v64 = MEMORY[0x1E0C81028];
    v63 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v77, (uint64_t)v65);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v64, v63, "%@", v77, 0xCu);
    }
    objc_storeStrong(&v64, 0);
    *v66 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 24, v65);
    v71 = 0;
    v62 = 1;
    objc_storeStrong(&v65, 0);
  }
  objc_storeStrong(&location, 0);
  return v71;
}

- (BOOL)isValid
{
  NSString *v2;
  NSNumber *v3;
  BOOL v5;
  AMDOutputBuilder *v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  AMDInputBuilder *v10;
  BOOL v11;
  NSString *v12;
  BOOL v13;
  NSDictionary *v14;
  BOOL v15;
  NSString *v16;
  BOOL v17;
  NSString *v18;
  BOOL v19;
  char v20;
  AMDOutputBuilder *v21;
  char v22;
  AMDInputBuilder *v23;
  char v24;
  NSDictionary *v25;
  char v26;
  NSString *v27;
  BOOL v29;

  v18 = -[AMDUseCaseWorkflow useCaseId](self, "useCaseId");
  v26 = 0;
  v19 = 1;
  if (v18)
  {
    v27 = -[AMDUseCaseWorkflow modelId](self, "modelId");
    v26 = 1;
    v19 = v27 == 0;
  }
  if ((v26 & 1) != 0)

  if (v19)
    return 0;
  v16 = -[AMDUseCaseWorkflow useCaseId](self, "useCaseId");
  v17 = -[NSString isEqualToString:](v16, "isEqualToString:", 0x1EA4BADA8);

  if (v17)
  {
    v14 = -[AMDUseCaseWorkflow ruleParams](self, "ruleParams");
    v24 = 0;
    v15 = 0;
    if (v14)
    {
      v25 = -[AMDUseCaseWorkflow ruleParams](self, "ruleParams");
      v24 = 1;
      v15 = -[NSDictionary count](v25, "count") != 0;
    }
    v29 = v15;
    if ((v24 & 1) != 0)

  }
  else
  {
    v12 = -[AMDUseCaseWorkflow modelFormat](self, "modelFormat");
    v13 = -[NSString isEqualToString:](v12, "isEqualToString:", 0x1EA4BDD88);

    if (v13)
    {
      return 1;
    }
    else
    {
      v2 = -[AMDUseCaseWorkflow modelId](self, "modelId");
      v8 = v2 != 0;

      v3 = -[AMDUseCaseWorkflow maxItemsToDisplay](self, "maxItemsToDisplay");
      v9 = v3 != 0;

      v10 = -[AMDUseCaseWorkflow inputBuilder](self, "inputBuilder");
      v22 = 0;
      v11 = 0;
      if (v10)
      {
        v23 = -[AMDUseCaseWorkflow inputBuilder](self, "inputBuilder");
        v22 = 1;
        v11 = -[AMDInputBuilder isValid](v23, "isValid");
      }
      if ((v22 & 1) != 0)

      v6 = -[AMDUseCaseWorkflow outputBuilder](self, "outputBuilder");
      v20 = 0;
      v7 = 0;
      if (v6)
      {
        v21 = -[AMDUseCaseWorkflow outputBuilder](self, "outputBuilder");
        v20 = 1;
        v7 = -[AMDOutputBuilder isValid](v21, "isValid");
      }
      if ((v20 & 1) != 0)

      v5 = 0;
      if (v8)
      {
        v5 = 0;
        if (v9)
        {
          v5 = 0;
          if (v11)
            return v7;
        }
      }
      return v5;
    }
  }
  return v29;
}

- (NSString)useCaseId
{
  return self->_useCaseId;
}

- (void)setUseCaseId:(id)a3
{
  objc_storeStrong((id *)&self->_useCaseId, a3);
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
  objc_storeStrong((id *)&self->_modelId, a3);
}

- (NSString)coldstartModelId
{
  return self->_coldstartModelId;
}

- (void)setColdstartModelId:(id)a3
{
  objc_storeStrong((id *)&self->_coldstartModelId, a3);
}

- (NSString)modelFormat
{
  return self->_modelFormat;
}

- (void)setModelFormat:(id)a3
{
  objc_storeStrong((id *)&self->_modelFormat, a3);
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentId, a3);
}

- (NSNumber)maxItemsToDisplay
{
  return self->_maxItemsToDisplay;
}

- (void)setMaxItemsToDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_maxItemsToDisplay, a3);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_storeStrong((id *)&self->_modelName, a3);
}

- (AMDInputBuilder)inputBuilder
{
  return self->_inputBuilder;
}

- (void)setInputBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_inputBuilder, a3);
}

- (AMDOutputBuilder)outputBuilder
{
  return self->_outputBuilder;
}

- (void)setOutputBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_outputBuilder, a3);
}

- (NSNumber)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_startTimestamp, a3);
}

- (NSNumber)endTimestamp
{
  return self->_endTimestamp;
}

- (void)setEndTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_endTimestamp, a3);
}

- (NSDictionary)ruleParams
{
  return self->_ruleParams;
}

- (void)setRuleParams:(id)a3
{
  objc_storeStrong((id *)&self->_ruleParams, a3);
}

- (NSString)secondaryModelId
{
  return self->_secondaryModelId;
}

- (void)setSecondaryModelId:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryModelId, a3);
}

- (AMDInputBuilder)secondaryModelInputBuilder
{
  return self->_secondaryModelInputBuilder;
}

- (void)setSecondaryModelInputBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryModelInputBuilder, a3);
}

- (AMDOutputBuilder)secondaryModelOutputBuilder
{
  return self->_secondaryModelOutputBuilder;
}

- (void)setSecondaryModelOutputBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryModelOutputBuilder, a3);
}

- (NSNumber)useMinimalMap
{
  return self->_useMinimalMap;
}

- (void)setUseMinimalMap:(id)a3
{
  objc_storeStrong((id *)&self->_useMinimalMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useMinimalMap, 0);
  objc_storeStrong((id *)&self->_secondaryModelOutputBuilder, 0);
  objc_storeStrong((id *)&self->_secondaryModelInputBuilder, 0);
  objc_storeStrong((id *)&self->_secondaryModelId, 0);
  objc_storeStrong((id *)&self->_ruleParams, 0);
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_outputBuilder, 0);
  objc_storeStrong((id *)&self->_inputBuilder, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_maxItemsToDisplay, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_modelFormat, 0);
  objc_storeStrong((id *)&self->_coldstartModelId, 0);
  objc_storeStrong((id *)&self->_modelId, 0);
  objc_storeStrong((id *)&self->_useCaseId, 0);
}

@end
