@implementation AMDOutputBuilder

- (AMDOutputBuilder)initWithDictionary:(id)a3 forUseCase:(id)a4
{
  AMDOutputBuilder *v4;
  OutputDefinition *v5;
  AMDOutputBuilder *v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD __b[8];
  uint64_t v20;
  objc_super v21;
  id v22;
  id location[2];
  AMDOutputBuilder *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v4 = v24;
  v24 = 0;
  v21.receiver = v4;
  v21.super_class = (Class)AMDOutputBuilder;
  v24 = -[AMDOutputBuilder init](&v21, sel_init);
  objc_storeStrong((id *)&v24, v24);
  -[AMDOutputBuilder setUseCaseId:](v24, "setUseCaseId:", v22);
  v14 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(location[0], "count"));
  -[AMDOutputBuilder setOutputDefinitions:](v24, "setOutputDefinitions:");

  memset(__b, 0, sizeof(__b));
  v15 = location[0];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
  if (v16)
  {
    v10 = *(_QWORD *)__b[2];
    v11 = 0;
    v12 = v16;
    while (1)
    {
      v9 = v11;
      if (*(_QWORD *)__b[2] != v10)
        objc_enumerationMutation(v15);
      v20 = *(_QWORD *)(__b[1] + 8 * v11);
      v18 = (id)objc_msgSend(location[0], "objectForKey:", v20);
      v5 = [OutputDefinition alloc];
      v17 = -[OutputDefinition initWithOutputDefinitionDictionary:](v5, "initWithOutputDefinitionDictionary:", v18);
      if ((objc_msgSend(v17, "isValid") & 1) != 0)
      {
        v8 = -[AMDOutputBuilder outputDefinitions](v24, "outputDefinitions");
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v17, v20);

      }
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v18, 0);
      ++v11;
      if (v9 + 1 >= v12)
      {
        v11 = 0;
        v12 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
        if (!v12)
          break;
      }
    }
  }

  v7 = v24;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v24, 0);
  return v7;
}

- (BOOL)isValid
{
  NSMutableDictionary *v3;
  BOOL v4;
  char v5;
  NSMutableDictionary *v6;

  v3 = -[AMDOutputBuilder outputDefinitions](self, "outputDefinitions");
  v5 = 0;
  v4 = 0;
  if (v3)
  {
    v6 = -[AMDOutputBuilder outputDefinitions](self, "outputDefinitions");
    v5 = 1;
    v4 = -[NSMutableDictionary count](v6, "count") != 0;
  }
  if ((v5 & 1) != 0)

  return v4;
}

- (id)getAllFeatureIds
{
  id v2;
  id v4;
  NSObject *v5;
  NSObject *log;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  NSMutableDictionary *obj;
  uint64_t v21;
  os_log_t v22;
  uint8_t v23[15];
  os_log_type_t type;
  os_log_t oslog;
  id location;
  id v27;
  _QWORD v28[8];
  id v29;
  int v30;
  id v31;
  _QWORD __b[8];
  uint64_t v33;
  id v34[2];
  AMDOutputBuilder *v35;
  uint8_t v36[24];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v35 = self;
  v34[1] = (id)a2;
  v34[0] = objc_alloc_init(MEMORY[0x1E0C99E20]);
  memset(__b, 0, sizeof(__b));
  obj = -[AMDOutputBuilder outputDefinitions](v35, "outputDefinitions");
  v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v38, 16);
  if (v21)
  {
    v17 = *(_QWORD *)__b[2];
    v18 = 0;
    v19 = v21;
    while (1)
    {
      v16 = v18;
      if (*(_QWORD *)__b[2] != v17)
        objc_enumerationMutation(obj);
      v33 = *(_QWORD *)(__b[1] + 8 * v18);
      v14 = -[AMDOutputBuilder outputDefinitions](v35, "outputDefinitions");
      v31 = (id)-[NSMutableDictionary objectForKey:](v14, "objectForKey:", v33);

      v2 = (id)objc_msgSend(v31, "modifiers");
      v15 = v2 != 0;

      if (v15)
      {
        memset(v28, 0, sizeof(v28));
        v12 = (id)objc_msgSend(v31, "modifiers");
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", v28, v37, 16);
        if (v13)
        {
          v9 = *(_QWORD *)v28[2];
          v10 = 0;
          v11 = v13;
          while (1)
          {
            v8 = v10;
            if (*(_QWORD *)v28[2] != v9)
              objc_enumerationMutation(v12);
            v29 = *(id *)(v28[1] + 8 * v10);
            v27 = (id)objc_msgSend(v29, "objectForKey:", CFSTR("feature_ids"));
            location = (id)objc_msgSend(v29, "objectForKey:", CFSTR("js_method_name"));
            if (location)
            {
              if (v27)
              {
                objc_msgSend(v34[0], "addObjectsFromArray:", v27);
                v30 = 0;
              }
              else
              {
                v22 = (os_log_t)MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  v5 = v22;
                  __os_log_helper_16_2_1_8_64((uint64_t)v36, (uint64_t)location);
                  _os_log_error_impl(&dword_1DC678000, v5, OS_LOG_TYPE_ERROR, "Nil feature ids provided for js method: %@", v36, 0xCu);
                }
                objc_storeStrong((id *)&v22, 0);
                v30 = 5;
              }
            }
            else
            {
              oslog = (os_log_t)MEMORY[0x1E0C81028];
              type = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                log = oslog;
                v7 = type;
                __os_log_helper_16_0_0(v23);
                _os_log_error_impl(&dword_1DC678000, log, v7, "Nil js feature name provided in modifier", v23, 2u);
              }
              objc_storeStrong((id *)&oslog, 0);
              v30 = 5;
            }
            objc_storeStrong(&location, 0);
            objc_storeStrong(&v27, 0);
            ++v10;
            if (v8 + 1 >= v11)
            {
              v10 = 0;
              v11 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", v28, v37, 16);
              if (!v11)
                break;
            }
          }
        }

        v30 = 0;
      }
      else
      {
        v30 = 3;
      }
      objc_storeStrong(&v31, 0);
      ++v18;
      if (v16 + 1 >= v19)
      {
        v18 = 0;
        v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v38, 16);
        if (!v19)
          break;
      }
    }
  }

  v4 = v34[0];
  v30 = 1;
  objc_storeStrong(v34, 0);
  return v4;
}

- (id)getPredictions:(unint64_t)a3 fromMLProvider:(id)a4 andModelAssets:(id)a5 withColdstartModelId:(id)a6 error:(id *)a7
{
  id v7;
  id v8;
  NSString *v10;
  id v11;
  AMDOutputBuilder *v12;
  id v13;
  id v14;
  BOOL v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  uint64_t v24;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD __b[8];
  uint64_t v34;
  id v35;
  int v36;
  id *v37;
  id v38;
  id v39;
  id location;
  unint64_t v41;
  SEL v42;
  AMDOutputBuilder *v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v43 = self;
  v42 = a2;
  v41 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v39 = 0;
  objc_storeStrong(&v39, a5);
  v38 = 0;
  objc_storeStrong(&v38, a6);
  v37 = a7;
  if (-[AMDOutputBuilder isValid](v43, "isValid"))
  {
    v21 = (void *)MEMORY[0x1E0C99E08];
    v22 = -[AMDOutputBuilder outputDefinitions](v43, "outputDefinitions");
    v35 = (id)objc_msgSend(v21, "dictionaryWithCapacity:", -[NSMutableDictionary count](v22, "count"));

    memset(__b, 0, sizeof(__b));
    v23 = -[AMDOutputBuilder outputDefinitions](v43, "outputDefinitions");
    v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
    if (v24)
    {
      v18 = *(_QWORD *)__b[2];
      v19 = 0;
      v20 = v24;
      while (1)
      {
        v17 = v19;
        if (*(_QWORD *)__b[2] != v18)
          objc_enumerationMutation(v23);
        v34 = *(_QWORD *)(__b[1] + 8 * v19);
        v16 = -[AMDOutputBuilder outputDefinitions](v43, "outputDefinitions");
        v32 = (id)-[NSMutableDictionary objectForKey:](v16, "objectForKey:", v34);

        v31 = -[AMDOutputBuilder getOutputfor:FromMLProvider:andModelAssets:withColdstartModelId:topN:error:](v43, "getOutputfor:FromMLProvider:andModelAssets:withColdstartModelId:topN:error:", v32, location, v39, v38, v41, v37);
        if (*v37)
        {
          v44 = 0;
          v36 = 1;
        }
        else
        {
          v14 = (id)objc_msgSend(v32, "nativePostprocessingOperations");
          v15 = 0;
          if (v14)
            v15 = v31 != 0;

          if (!v15)
            goto LABEL_34;
          v12 = v43;
          v11 = v31;
          v13 = (id)objc_msgSend(v32, "nativePostprocessingOperations");
          v7 = -[AMDOutputBuilder postProcessInferenceOutput:withOperations:error:](v12, "postProcessInferenceOutput:withOperations:error:", v11);
          v8 = v31;
          v31 = v7;

          if (*v37)
          {
            v44 = 0;
            v36 = 1;
          }
          else
          {
LABEL_34:
            if (v31 && !*v37)
              objc_msgSend(v35, "setObject:forKey:", v31, v34);
            v36 = 0;
          }
        }
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v32, 0);
        if (v36)
          break;
        ++v19;
        if (v17 + 1 >= v20)
        {
          v19 = 0;
          v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
          if (!v20)
            goto LABEL_21;
        }
      }
    }
    else
    {
LABEL_21:
      v36 = 0;
    }

    if (!v36)
    {
      v30 = +[AMDFeatureProvider getProviderForSource:WithDomain:](AMDFeatureProvider, "getProviderForSource:WithDomain:", 0x1EA4BB628, 0);
      v10 = -[AMDOutputBuilder useCaseId](v43, "useCaseId");
      v29 = (id)objc_msgSend(v30, "fetchOutputRemapDictForUsecase:");

      if (v29)
      {
        v28 = -[AMDOutputBuilder mapInferenceOutputsToIds:withRemapData:error:](v43, "mapInferenceOutputsToIds:withRemapData:error:", v35, v29, v37);
        if (*v37)
          v44 = 0;
        else
          v44 = v28;
        v36 = 1;
        objc_storeStrong(&v28, 0);
      }
      else
      {
        v44 = v35;
        v36 = 1;
      }
      objc_storeStrong(&v29, 0);
      objc_storeStrong(&v30, 0);
    }
    objc_storeStrong(&v35, 0);
  }
  else
  {
    v44 = 0;
    v36 = 1;
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&location, 0);
  return v44;
}

- (id)postProcessInferenceOutput:(id)a3 withOperations:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  char isKindOfClass;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[8];
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  int v36;
  id v37;
  _QWORD __b[8];
  id v39;
  id *v40;
  id v41;
  id location[3];
  id v43;
  const __CFString *v44;
  id v45;
  _QWORD v46[2];
  _QWORD v47[2];
  const __CFString *v48;
  uint64_t v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = 0;
  objc_storeStrong(&v41, a4);
  v40 = a5;
  memset(__b, 0, sizeof(__b));
  v26 = v41;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v51, 16);
  if (v27)
  {
    v21 = *(_QWORD *)__b[2];
    v22 = 0;
    v23 = v27;
    while (1)
    {
      v20 = v22;
      if (*(_QWORD *)__b[2] != v21)
        objc_enumerationMutation(v26);
      v39 = *(id *)(__b[1] + 8 * v22);
      v37 = (id)objc_msgSend(v39, "objectForKey:", CFSTR("operation"));
      if (v37)
      {
        if ((objc_msgSend(v37, "isEqualToString:", CFSTR("vectorSearch")) & 1) != 0)
        {
          v35 = (id)objc_msgSend(v39, "objectForKey:", CFSTR("dbName"));
          if (v35)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v34 = location[0];
              v18 = (id)objc_msgSend(v34, "firstObject");
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
              {
                v8 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 16, CFSTR("vector search can only be applied for post-processing on batched inputs"));
                *v40 = v8;
              }
              v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              memset(v31, 0, sizeof(v31));
              v16 = v34;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", v31, v50, 16);
              if (v17)
              {
                v13 = *(_QWORD *)v31[2];
                v14 = 0;
                v15 = v17;
                while (1)
                {
                  v12 = v14;
                  if (*(_QWORD *)v31[2] != v13)
                    objc_enumerationMutation(v16);
                  v32 = *(_QWORD *)(v31[1] + 8 * v14);
                  v48 = CFSTR("queryVector");
                  v49 = v32;
                  v30 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48);
                  v46[0] = CFSTR("vectorDBConfig");
                  v44 = CFSTR("dbName");
                  v45 = v35;
                  v11 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
                  v47[0] = v11;
                  v46[1] = CFSTR("queryDict");
                  v47[1] = v30;
                  v29 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);

                  v28 = +[AMDVectorDBManager runVectorDBSearchWithSearchPayload:error:](_TtC19AppleMediaDiscovery18AMDVectorDBManager, "runVectorDBSearchWithSearchPayload:error:", v29, v40);
                  if (*v40)
                  {
                    v43 = 0;
                    v36 = 1;
                  }
                  else
                  {
                    objc_msgSend(v33, "addObject:", v28);
                    v36 = 0;
                  }
                  objc_storeStrong(&v28, 0);
                  objc_storeStrong(&v29, 0);
                  objc_storeStrong(&v30, 0);
                  if (v36)
                    break;
                  ++v14;
                  if (v12 + 1 >= v15)
                  {
                    v14 = 0;
                    v15 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", v31, v50, 16);
                    if (!v15)
                      goto LABEL_24;
                  }
                }
              }
              else
              {
LABEL_24:
                v36 = 0;
              }

              if (!v36)
              {
                objc_storeStrong(location, v33);
                v36 = 0;
              }
              objc_storeStrong(&v33, 0);
              objc_storeStrong(&v34, 0);
            }
            else
            {
              v7 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 16, CFSTR("vector search can only run on model outputs of type array"));
              *v40 = v7;
              v43 = 0;
              v36 = 1;
            }
          }
          else
          {
            v6 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 16, CFSTR("dbName missing in post processing config for vector search"));
            *v40 = v6;
            v43 = 0;
            v36 = 1;
          }
          objc_storeStrong(&v35, 0);
          if (!v36)
            v36 = 0;
        }
        else
        {
          v9 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 16, CFSTR("Unrecognized operation passed for inference post processing. vectorSearch is the only supported operation."));
          *v40 = v9;
          v43 = 0;
          v36 = 1;
        }
      }
      else
      {
        v5 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 16, CFSTR("Operation key missing in inference post processing config"));
        *v40 = v5;
        v43 = 0;
        v36 = 1;
      }
      objc_storeStrong(&v37, 0);
      if (v36)
        break;
      ++v22;
      if (v20 + 1 >= v23)
      {
        v22 = 0;
        v23 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v51, 16);
        if (!v23)
          goto LABEL_34;
      }
    }
  }
  else
  {
LABEL_34:
    v36 = 0;
  }

  if (!v36)
  {
    v43 = location[0];
    v36 = 1;
  }
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  return v43;
}

- (id)mapInferenceOutputsToIds:(id)a3 withRemapData:(id)a4 error:(id *)a5
{
  id v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  int i;
  id v19;
  id v20;
  id v21;
  int v22;
  id v23;
  id v24;
  _QWORD __b[8];
  uint64_t v26;
  id v27;
  id *v28;
  id v29;
  id location[3];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v28 = a5;
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  memset(__b, 0, sizeof(__b));
  v14 = location[0];
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", __b, v32, 16);
  if (v15)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v15;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(v14);
      v26 = *(_QWORD *)(__b[1] + 8 * v10);
      v24 = (id)objc_msgSend(location[0], "objectForKey:", v26);
      v23 = (id)objc_msgSend(v29, "objectForKey:", v26);
      if (v23)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = v24;
          v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          for (i = 0; ; ++i)
          {
            v7 = i;
            if (v7 >= objc_msgSend(v23, "count"))
              break;
            v17 = (id)objc_msgSend(v20, "objectAtIndex:", i);
            v16 = (id)objc_msgSend(v23, "objectAtIndex:", i);
            objc_msgSend(v19, "setObject:forKey:", v17, v16);
            objc_storeStrong(&v16, 0);
            objc_storeStrong(&v17, 0);
          }
          objc_msgSend(v27, "setObject:forKey:", v19, v26);
          objc_storeStrong(&v19, 0);
          objc_storeStrong(&v20, 0);
          v22 = 0;
        }
        else
        {
          v21 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Output mapping is only supported for arrays"));
          v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v21);
          *v28 = v5;
          v31 = 0;
          v22 = 1;
          objc_storeStrong(&v21, 0);
        }
      }
      else
      {
        objc_msgSend(v27, "setObject:forKey:", v24, v26);
        v22 = 3;
      }
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v24, 0);
      if (v22)
      {
        if (v22 != 3)
          break;
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", __b, v32, 16);
        if (!v11)
          goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    v22 = 0;
  }

  if (!v22)
  {
    v31 = v27;
    v22 = 1;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v31;
}

- (id)getOutputfor:(id)a3 FromMLProvider:(id)a4 andModelAssets:(id)a5 withColdstartModelId:(id)a6 topN:(unint64_t)a7 error:(id *)a8
{
  id v8;
  id v9;
  unint64_t v11;
  void *v12;
  id v13;
  id v19;
  id v20;
  id v21;
  int v22;
  id v23;
  id v24;
  id *v25;
  unint64_t v26;
  id v27;
  id v28;
  id v29;
  id location[3];
  id v31;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v28 = 0;
  objc_storeStrong(&v28, a5);
  v27 = 0;
  objc_storeStrong(&v27, a6);
  v26 = a7;
  v25 = a8;
  v19 = v29;
  v20 = (id)objc_msgSend(location[0], "modelOutputName");
  v24 = (id)objc_msgSend(v19, "featureValueForName:");

  if (v24)
  {
    v11 = objc_msgSend(v24, "type") - 1;
    if (v11 <= 5)
      __asm { BR              X8 }
    v21 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid output type specified for the model"));
    v9 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v21);
    *v25 = v9;
    v31 = 0;
    v22 = 1;
    objc_storeStrong(&v21, 0);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (id)objc_msgSend(location[0], "modelOutputName");
    v23 = (id)objc_msgSend(v12, "stringWithFormat:", CFSTR("Nil model output obtained for: %@"), v13);

    v8 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v23);
    *v25 = v8;
    v31 = 0;
    v22 = 1;
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v31;
}

- (id)processMultiArrayModelOutput:(id)a3 withOutputDefinition:(id)a4 FromMLProvider:(id)a5 andModelAssets:(id)a6 withColdstartModelId:(id)a7 withTopN:(unint64_t)a8 error:(id *)a9
{
  id v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  id v16;
  unsigned int v17;
  AMDOutputBuilder *v18;
  id v19;
  unsigned int v20;
  AMDOutputBuilder *v21;
  id v22;
  AMDOutputBuilder *v23;
  id v24;
  id v25;
  BOOL v31;
  id v32;
  int v33;
  id v34;
  id v35;
  id v36;
  double v37;
  id *v38;
  unint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id location[2];
  AMDOutputBuilder *v45;
  id v46;

  v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = 0;
  objc_storeStrong(&v43, a4);
  v42 = 0;
  objc_storeStrong(&v42, a5);
  v41 = 0;
  objc_storeStrong(&v41, a6);
  v40 = 0;
  objc_storeStrong(&v40, a7);
  v39 = a8;
  v38 = a9;
  v37 = 0.0;
  v9 = (id)objc_msgSend(v43, "scoreThresholdAsMultipleOfRandomScore");
  v31 = v9 == 0;

  if (!v31)
  {
    v25 = (id)objc_msgSend(v43, "scoreThresholdAsMultipleOfRandomScore");
    objc_msgSend(v25, "doubleValue");
    v37 = v10;

  }
  v36 = (id)objc_msgSend(location[0], "shape");
  v23 = v45;
  v22 = location[0];
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = -[AMDOutputBuilder convertMultiArray:withShape:atDepth:withKey:withScoreThreshold:error:](v23, "convertMultiArray:withShape:atDepth:withKey:withScoreThreshold:error:", v22, v36, 0, v37);

  v34 = (id)objc_msgSend(v43, "mode");
  if (!v34)
    objc_storeStrong(&v34, CFSTR("values"));
  if ((objc_msgSend(v34, "isEqualToString:", CFSTR("top_n")) & 1) != 0
    || (objc_msgSend(v34, "isEqualToString:", CFSTR("idsAndScores")) & 1) != 0)
  {
    v21 = v45;
    v19 = v35;
    v20 = objc_msgSend(v36, "count");
    v11 = objc_msgSend(location[0], "dataType");
    LOBYTE(v15) = 0;
    v46 = -[AMDOutputBuilder process2DMultiArray:shapeLength:withDataType:withOutputDefinition:andModelAssets:withColdstartModelId:idsOnly:inferenceMode:error:](v21, "process2DMultiArray:shapeLength:withDataType:withOutputDefinition:andModelAssets:withColdstartModelId:idsOnly:inferenceMode:error:", v19, v20, v11, v43, v41, v40, v15, v34, v38);
    v33 = 1;
  }
  else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("idsOnly")) & 1) != 0)
  {
    v18 = v45;
    v16 = v35;
    v17 = objc_msgSend(v36, "count");
    v12 = objc_msgSend(location[0], "dataType");
    LOBYTE(v15) = 1;
    v46 = -[AMDOutputBuilder process2DMultiArray:shapeLength:withDataType:withOutputDefinition:andModelAssets:withColdstartModelId:idsOnly:inferenceMode:error:](v18, "process2DMultiArray:shapeLength:withDataType:withOutputDefinition:andModelAssets:withColdstartModelId:idsOnly:inferenceMode:error:", v16, v17, v12, v43, v41, v40, v15, v34, v38);
    v33 = 1;
  }
  else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("values")) & 1) != 0)
  {
    v46 = v35;
    v33 = 1;
  }
  else
  {
    v32 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unrecognized inference mode: %@ passed in the workflow"), v34);
    v13 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v32);
    *v38 = v13;
    v46 = 0;
    v33 = 1;
    objc_storeStrong(&v32, 0);
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  return v46;
}

- (id)process2DMultiArray:(id)a3 shapeLength:(unsigned int)a4 withDataType:(int64_t)a5 withOutputDefinition:(id)a6 andModelAssets:(id)a7 withColdstartModelId:(id)a8 idsOnly:(BOOL)a9 inferenceMode:(id)a10 error:(id *)a11
{
  id v11;
  AMDOutputBuilder *v13;
  id v14;
  id v20;
  unsigned int i;
  id v22;
  unsigned int v23;
  int v24;
  id v25;
  id *v26;
  id v27;
  BOOL v28;
  id v29;
  id v30;
  id v31[2];
  unsigned int v32;
  id location[2];
  AMDOutputBuilder *v34;
  id v35;

  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = a4;
  v31[1] = (id)a5;
  v31[0] = 0;
  objc_storeStrong(v31, a6);
  v30 = 0;
  objc_storeStrong(&v30, a7);
  v29 = 0;
  objc_storeStrong(&v29, a8);
  v28 = a9;
  v27 = 0;
  objc_storeStrong(&v27, a10);
  v26 = a11;
  if (v32 == 2)
  {
    v23 = objc_msgSend(location[0], "count");
    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v23);
    for (i = 0; i < v23; ++i)
    {
      v13 = v34;
      v14 = (id)objc_msgSend(location[0], "objectAtIndex:", i);
      v20 = -[AMDOutputBuilder processArrayOutput:withDataType:withOutputDefinition:andModelAssets:withColdstartModelId:idsOnly:error:](v13, "processArrayOutput:withDataType:withOutputDefinition:andModelAssets:withColdstartModelId:idsOnly:error:", v26);

      objc_msgSend(v22, "addObject:", v20);
      objc_storeStrong(&v20, 0);
    }
    if (v23 == 1)
      v35 = (id)objc_msgSend(v22, "firstObject");
    else
      v35 = v22;
    v24 = 1;
    objc_storeStrong(&v22, 0);
  }
  else
  {
    v25 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid output shape for mode %@: %u"), v27, v32);
    v11 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v25);
    *v26 = v11;
    v35 = 0;
    v24 = 1;
    objc_storeStrong(&v25, 0);
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(v31, 0);
  objc_storeStrong(location, 0);
  return v35;
}

- (id)processArrayOutput:(id)a3 withDataType:(int64_t)a4 withOutputDefinition:(id)a5 andModelAssets:(id)a6 withColdstartModelId:(id)a7 idsOnly:(BOOL)a8 error:(id *)a9
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  AMDOutputBuilder *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  BOOL v35;
  id v36;
  _QWORD __b[8];
  uint64_t v38;
  id v39;
  int v40;
  id v41;
  id v42;
  BOOL v43;
  id *v44;
  BOOL v45;
  id v46;
  id v47;
  id v48;
  int64_t v49;
  id location[2];
  AMDOutputBuilder *v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v51 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v49 = a4;
  v48 = 0;
  objc_storeStrong(&v48, a5);
  v47 = 0;
  objc_storeStrong(&v47, a6);
  v46 = 0;
  objc_storeStrong(&v46, a7);
  v45 = a8;
  v44 = a9;
  v9 = (id)objc_msgSend(v48, "remapDictionaryId");
  v35 = v9 != 0;

  v43 = v35;
  v42 = -[AMDOutputBuilder getRemapDictFor:withModelAssets:](v51, "getRemapDictFor:withModelAssets:", v48, v47);
  if (!v35 || v42)
  {
    if (v45)
    {
      if (v43)
      {
        v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v39 = (id)objc_msgSend(v25, "initWithCapacity:", objc_msgSend(location[0], "count"));
        memset(__b, 0, sizeof(__b));
        v26 = location[0];
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v53, 16);
        if (v27)
        {
          v22 = *(_QWORD *)__b[2];
          v23 = 0;
          v24 = v27;
          while (1)
          {
            v21 = v23;
            if (*(_QWORD *)__b[2] != v22)
              objc_enumerationMutation(v26);
            v38 = *(_QWORD *)(__b[1] + 8 * v23);
            v19 = v39;
            v20 = (id)objc_msgSend(v42, "objectForKey:", v38);
            objc_msgSend(v19, "addObject:");

            ++v23;
            if (v21 + 1 >= v24)
            {
              v23 = 0;
              v24 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v53, 16);
              if (!v24)
                break;
            }
          }
        }

        v52 = v39;
        v40 = 1;
        objc_storeStrong(&v39, 0);
      }
      else
      {
        v52 = location[0];
        v40 = 1;
      }
    }
    else
    {
      v36 = +[AMDColdstartOperation computeUpdatedScoresV2:withModel:andMappingDictionary:](AMDColdstartOperation, "computeUpdatedScoresV2:withModel:andMappingDictionary:", location[0], v46, v42);
      if (v36)
      {
        v11 = (id)objc_msgSend(v36, "objectForKey:", CFSTR("recomputedScores"));
        v12 = location[0];
        location[0] = v11;

        v13 = (id)objc_msgSend(v36, "objectForKey:", CFSTR("updatedRemapdict"));
        v14 = v42;
        v42 = v13;

      }
      v17 = v51;
      v18 = (id)objc_msgSend(v48, "modelTopN");
      v15 = objc_msgSend(v18, "unsignedLongValue");
      v52 = -[AMDOutputBuilder getTopN:idsAndScoresFrom:withMappingDictionary:withType:](v17, "getTopN:idsAndScoresFrom:withMappingDictionary:withType:", v15, location[0], v42, v49);

      v40 = 1;
      objc_storeStrong(&v36, 0);
    }
  }
  else
  {
    v28 = (void *)MEMORY[0x1E0CB3940];
    v29 = (id)objc_msgSend(v48, "modelOutputName");
    v41 = (id)objc_msgSend(v28, "stringWithFormat:", CFSTR("Remap dictionary absent for output: %@"), v29);

    v10 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v41);
    *v44 = v10;
    v52 = 0;
    v40 = 1;
    objc_storeStrong(&v41, 0);
  }
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
  return v52;
}

- (id)getTopN:(unint64_t)a3 idsAndScoresFrom:(id)a4 withMappingDictionary:(id)a5 withType:(int64_t)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  AMDPair *v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char isKindOfClass;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  NSObject *log;
  os_log_type_t v31;
  id v32;
  char v33;
  unint64_t v34;
  _QWORD __b[8];
  id v38;
  AMDPair *v39;
  id v40;
  int v41;
  os_log_type_t type;
  os_log_t oslog;
  id v44;
  unsigned int i;
  id v46;
  id v47;
  id v48[2];
  id v49;
  id location;
  unint64_t v51;
  SEL v52;
  AMDOutputBuilder *v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _BYTE v56[128];
  uint8_t v57[8];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v53 = self;
  v52 = a2;
  v51 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v49 = 0;
  objc_storeStrong(&v49, a5);
  v48[1] = (id)a6;
  v48[0] = -[AMDOutputBuilder createHeapOfType:withCapacity:](v53, "createHeapOfType:withCapacity:", a6, v51);
  v47 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v51);
  v46 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v51);
  for (i = 0; ; ++i)
  {
    v34 = (int)i;
    if (v34 >= objc_msgSend(location, "count"))
      break;
    v44 = (id)objc_msgSend(location, "objectAtIndex:", (int)i);
    v32 = (id)objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v33 = objc_msgSend(v32, "isEqualToNumber:", v44);

    if ((v33 & 1) == 0)
    {
      v40 = 0;
      if (v49)
      {
        v28 = v49;
        v29 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
        v6 = (id)objc_msgSend(v28, "objectForKey:");
        v7 = v40;
        v40 = v6;

        if (!v40)
        {
          v41 = 4;
LABEL_13:
          objc_storeStrong(&v40, 0);
          goto LABEL_14;
        }
      }
      else
      {
        v8 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
        v9 = v40;
        v40 = v8;

      }
      v10 = [AMDPair alloc];
      v39 = -[AMDPair initWith:and:](v10, "initWith:and:", v40, v44);
      objc_msgSend(v48[0], "add:", v39);
      objc_storeStrong((id *)&v39, 0);
      v41 = 0;
      goto LABEL_13;
    }
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v31 = type;
      __os_log_helper_16_0_1_4_0((uint64_t)v57, i);
      _os_log_error_impl(&dword_1DC678000, log, v31, "nan output produced during inference for logicalId: %d", v57, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v41 = 4;
LABEL_14:
    objc_storeStrong(&v44, 0);
  }
  memset(__b, 0, sizeof(__b));
  v26 = (id)objc_msgSend(v48[0], "topN");
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v56, 16);
  if (v27)
  {
    v23 = *(_QWORD *)__b[2];
    v24 = 0;
    v25 = v27;
    while (1)
    {
      v22 = v24;
      if (*(_QWORD *)__b[2] != v23)
        objc_enumerationMutation(v26);
      v38 = *(id *)(__b[1] + 8 * v24);
      v20 = (id)objc_msgSend(v38, "first");
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v17 = v47;
        v19 = (id)objc_msgSend(v38, "first");
        v18 = (id)objc_msgSend(v19, "stringValue");
        objc_msgSend(v17, "addObject:");

      }
      else
      {
        v15 = v47;
        v16 = (id)objc_msgSend(v38, "first");
        objc_msgSend(v15, "addObject:");

      }
      v13 = v46;
      v14 = (id)objc_msgSend(v38, "second");
      objc_msgSend(v13, "addObject:");

      ++v24;
      if (v22 + 1 >= v25)
      {
        v24 = 0;
        v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v56, 16);
        if (!v25)
          break;
      }
    }
  }

  v54[0] = CFSTR("ids");
  v55[0] = v47;
  v54[1] = CFSTR("scores");
  v55[1] = v46;
  v12 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v41 = 1;
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&location, 0);
  return v12;
}

- (id)createHeapOfType:(int64_t)a3 withCapacity:(unint64_t)a4
{
  AMDMinHeap *v4;
  AMDMinHeap *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(_QWORD *, void *, void *);
  void *v11;
  int64_t v12;
  AMDMinHeap *v13;
  unint64_t v14;
  int64_t v15;
  SEL v16;
  AMDOutputBuilder *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  v4 = [AMDMinHeap alloc];
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __50__AMDOutputBuilder_createHeapOfType_withCapacity___block_invoke;
  v11 = &__block_descriptor_40_e11_q24__0_8_16l;
  v12 = v15;
  v13 = -[AMDMinHeap initWithCapacity:comparator:](v4, "initWithCapacity:comparator:", v14, &v7);
  v6 = v13;
  objc_storeStrong((id *)&v13, 0);
  return v6;
}

uint64_t __50__AMDOutputBuilder_createHeapOfType_withCapacity___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  float v5;
  float v6;
  id v8;
  float v9;
  id v10;
  float v11;
  id v12;
  double v13;
  id v14;
  double v15;
  id v16;
  int v17;
  id v18;
  int v19;
  uint64_t v22;
  id v23;
  id v24[2];
  id v25;
  id location[2];
  uint64_t v27;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v25 = 0;
  objc_storeStrong(&v25, a3);
  v24[1] = a1;
  v24[0] = location[0];
  v23 = v25;
  v22 = a1[4];
  if (v22 == 65552 || v22 == 65568)
  {
    v8 = (id)objc_msgSend(v24[0], "second");
    objc_msgSend(v8, "floatValue");
    v9 = v5;

    v10 = (id)objc_msgSend(v23, "second");
    objc_msgSend(v10, "floatValue");
    v11 = v6;

    if (v9 < v11)
    {
      v27 = -1;
      goto LABEL_20;
    }
    if (v9 > v11)
    {
      v27 = 1;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v22 == 65600)
  {
    v12 = (id)objc_msgSend(v24[0], "second");
    objc_msgSend(v12, "doubleValue");
    v13 = v3;

    v14 = (id)objc_msgSend(v23, "second");
    objc_msgSend(v14, "doubleValue");
    v15 = v4;

    if (v13 < v15)
    {
      v27 = -1;
      goto LABEL_20;
    }
    if (v13 > v15)
    {
      v27 = 1;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v22 != 131104)
    goto LABEL_19;
  v16 = (id)objc_msgSend(v24[0], "second");
  v17 = objc_msgSend(v16, "intValue");

  v18 = (id)objc_msgSend(v23, "second");
  v19 = objc_msgSend(v18, "intValue");

  if (v17 >= v19)
  {
    if (v17 > v19)
    {
      v27 = 1;
      goto LABEL_20;
    }
LABEL_19:
    v27 = 0;
    goto LABEL_20;
  }
  v27 = -1;
LABEL_20:
  objc_storeStrong(&v23, 0);
  objc_storeStrong(v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v27;
}

- (id)getRemapDictFor:(id)a3 withModelAssets:(id)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id *v9;
  id v10;
  id v12;
  char v13;
  char v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  AMDOutputBuilder *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  v16 = 0;
  v12 = (id)objc_msgSend(location[0], "remapDictionaryId");
  v14 = 0;
  v13 = 0;
  if (v12)
  {
    v15 = (id)objc_msgSend(location[0], "remapDictionaryId");
    v14 = 1;
    v13 = objc_msgSend(v15, "isEqualToString:", 0x1EA4BD4C8);
  }
  if ((v14 & 1) != 0)

  if ((v13 & 1) != 0)
  {
    v4 = (id)objc_msgSend(v18, "getLogicalToContentMap");
    v5 = v16;
    v16 = v4;

  }
  v6 = -[AMDOutputBuilder generateMappingDictionary:](v20, "generateMappingDictionary:", v16, &v16);
  v7 = v17;
  v17 = v6;

  v10 = v17;
  objc_storeStrong(v9, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)generateMappingDictionary:(id)a3
{
  id v3;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *log;
  os_log_type_t type;
  unsigned int *v11;
  unsigned int *v12;
  unsigned int i;
  id v14;
  os_log_type_t v15;
  id v16;
  unsigned int v17;
  unsigned int *v18;
  uint8_t v19[15];
  char v20;
  id v21;
  int v22;
  uint8_t v23[7];
  char v24;
  id v25;
  id location[3];
  id v27;
  uint8_t v28[8];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v21 = MEMORY[0x1E0C81028];
    v20 = 2;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
    {
      v7 = v21;
      v8 = v20;
      __os_log_helper_16_0_0(v19);
      _os_log_debug_impl(&dword_1DC678000, v7, v8, "Using binary map for output remapping", v19, 2u);
    }
    objc_storeStrong(&v21, 0);
    v18 = (unsigned int *)objc_msgSend(objc_retainAutorelease(location[0]), "bytes");
    v17 = 0;
    v17 = *v18;
    v16 = MEMORY[0x1E0C81028];
    v15 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v28, v17);
      _os_log_debug_impl(&dword_1DC678000, (os_log_t)v16, v15, "Output map: %d entries", v28, 8u);
    }
    objc_storeStrong(&v16, 0);
    ++v18;
    v3 = objc_alloc(MEMORY[0x1E0C99E08]);
    v14 = (id)objc_msgSend(v3, "initWithCapacity:", v17);
    for (i = 0; i < v17; ++i)
    {
      v12 = v18++;
      v11 = v18;
      v18 += 2;
      v6 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)v11);
      v5 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v12);
      objc_msgSend(v14, "setObject:forKey:", v6);

    }
    v27 = v14;
    v22 = 1;
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v25 = MEMORY[0x1E0C81028];
    v24 = 16;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      log = v25;
      type = v24;
      __os_log_helper_16_0_0(v23);
      _os_log_error_impl(&dword_1DC678000, log, type, "Output map not found", v23, 2u);
    }
    objc_storeStrong(&v25, 0);
    v27 = 0;
    v22 = 1;
  }
  objc_storeStrong(location, 0);
  return v27;
}

- (id)convertMultiArray:(id)a3 withShape:(id)a4 atDepth:(unsigned int)a5 withKey:(id)a6 withScoreThreshold:(double)a7 error:(id *)a8
{
  double v8;
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  AMDOutputBuilder *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v26;
  unsigned int v27;
  uint64_t v28;
  id v29;
  unsigned int j;
  id v31;
  int v32;
  id v33;
  id v34;
  unsigned int i;
  id v36;
  unsigned int v37;
  id *v38;
  double v39;
  id v40;
  unsigned int v41;
  id v42;
  id location[2];
  AMDOutputBuilder *v44;
  id v45;

  v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v42 = 0;
  objc_storeStrong(&v42, a4);
  v41 = a5;
  v40 = 0;
  objc_storeStrong(&v40, a6);
  v39 = a7;
  v38 = a8;
  v26 = (id)objc_msgSend(v42, "objectAtIndex:", v41);
  v27 = objc_msgSend(v26, "intValue");

  v37 = v27;
  v28 = v41 + 1;
  if (v28 == objc_msgSend(v42, "count"))
  {
    v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; i < v37; ++i)
    {
      v18 = v40;
      v20 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
      v19 = (id)objc_msgSend(v18, "arrayByAddingObject:");
      v34 = (id)objc_msgSend(v19, "mutableCopy");

      v33 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", v34);
      objc_msgSend(v33, "doubleValue");
      if (v8 >= v39)
        objc_msgSend(v36, "addObject:", v33);
      else
        objc_msgSend(v36, "addObject:", &unk_1EA4CEB00);
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
    }
    v45 = v36;
    v32 = 1;
    objc_storeStrong(&v36, 0);
  }
  else
  {
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (j = 0; j < v37; ++j)
    {
      v14 = v44;
      v11 = location[0];
      v12 = v42;
      v13 = v41 + 1;
      v10 = v40;
      v17 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", j);
      v16 = (id)objc_msgSend(v10, "arrayByAddingObject:");
      v15 = (id)objc_msgSend(v16, "mutableCopy");
      v29 = -[AMDOutputBuilder convertMultiArray:withShape:atDepth:withKey:withScoreThreshold:error:](v14, "convertMultiArray:withShape:atDepth:withKey:withScoreThreshold:error:", v11, v12, v13, v39);

      objc_msgSend(v31, "addObject:", v29);
      objc_storeStrong(&v29, 0);
    }
    v45 = v31;
    v32 = 1;
    objc_storeStrong(&v31, 0);
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
  return v45;
}

- (NSString)useCaseId
{
  return self->_useCaseId;
}

- (void)setUseCaseId:(id)a3
{
  objc_storeStrong((id *)&self->_useCaseId, a3);
}

- (NSMutableDictionary)outputDefinitions
{
  return self->_outputDefinitions;
}

- (void)setOutputDefinitions:(id)a3
{
  objc_storeStrong((id *)&self->_outputDefinitions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDefinitions, 0);
  objc_storeStrong((id *)&self->_useCaseId, 0);
}

@end
