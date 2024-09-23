@implementation AMDInputBuilder

- (AMDInputBuilder)initWithDictionary:(id)a3 andModelId:(id)a4
{
  InputFeatureDefinition *v4;
  AMDInputBuilder *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD v23[8];
  uint64_t v24;
  id v25;
  id v26;
  _QWORD __b[8];
  uint64_t v28;
  id v29;
  id location[2];
  id v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  objc_msgSend(v31, "setModelId:", v29);
  v19 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(location[0], "count"));
  objc_msgSend(v31, "setInputsDefinitions:");

  memset(__b, 0, sizeof(__b));
  v20 = location[0];
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
  if (v21)
  {
    v15 = *(_QWORD *)__b[2];
    v16 = 0;
    v17 = v21;
    while (1)
    {
      v14 = v16;
      if (*(_QWORD *)__b[2] != v15)
        objc_enumerationMutation(v20);
      v28 = *(_QWORD *)(__b[1] + 8 * v16);
      v26 = (id)objc_msgSend(location[0], "objectForKey:", v28);
      v25 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v26, "count"));
      memset(v23, 0, sizeof(v23));
      v12 = v26;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", v23, v32, 16);
      if (v13)
      {
        v9 = *(_QWORD *)v23[2];
        v10 = 0;
        v11 = v13;
        while (1)
        {
          v8 = v10;
          if (*(_QWORD *)v23[2] != v9)
            objc_enumerationMutation(v12);
          v24 = *(_QWORD *)(v23[1] + 8 * v10);
          v4 = [InputFeatureDefinition alloc];
          v22 = -[InputFeatureDefinition initWithDictionary:](v4, "initWithDictionary:", v24);
          if ((objc_msgSend(v22, "isValid") & 1) != 0)
            objc_msgSend(v25, "addObject:", v22);
          objc_storeStrong(&v22, 0);
          ++v10;
          if (v8 + 1 >= v11)
          {
            v10 = 0;
            v11 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", v23, v32, 16);
            if (!v11)
              break;
          }
        }
      }

      if (objc_msgSend(v25, "count"))
      {
        v7 = (id)objc_msgSend(v31, "inputsDefinitions");
        objc_msgSend(v7, "setObject:forKey:", v25, v28);

      }
      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v26, 0);
      ++v16;
      if (v14 + 1 >= v17)
      {
        v16 = 0;
        v17 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
        if (!v17)
          break;
      }
    }
  }

  v6 = (AMDInputBuilder *)v31;
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v31, 0);
  return v6;
}

- (BOOL)isValid
{
  NSMutableDictionary *v3;
  BOOL v4;
  char v5;
  NSMutableDictionary *v6;

  v3 = -[AMDInputBuilder inputsDefinitions](self, "inputsDefinitions");
  v5 = 0;
  v4 = 0;
  if (v3)
  {
    v6 = -[AMDInputBuilder inputsDefinitions](self, "inputsDefinitions");
    v5 = 1;
    v4 = -[NSMutableDictionary count](v6, "count") != 0;
  }
  if ((v5 & 1) != 0)

  return v4;
}

- (id)getInputsWithMetadata:(id)a3 andModelAssets:(id)a4 error:(id *)a5
{
  id v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *log;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  NSMutableDictionary *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  _QWORD v25[8];
  uint64_t v26;
  int v27;
  os_log_type_t type;
  os_log_t oslog;
  id v30;
  id v31;
  id v32;
  _QWORD __b[8];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id *v39;
  id v40;
  id location[2];
  AMDInputBuilder *v42;
  id v43;
  _BYTE v44[128];
  uint8_t v45[24];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v40 = 0;
  objc_storeStrong(&v40, a4);
  v39 = a5;
  v38 = CFSTR("getInputs");
  +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", v38);
  v37 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(location[0], "count"));
  v20 = -[AMDInputBuilder inputsDefinitions](v42, "inputsDefinitions");
  v36 = (id)-[NSMutableDictionary objectForKey:](v20, "objectForKey:", CFSTR("hyperparameters"));

  v35 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  memset(__b, 0, sizeof(__b));
  v21 = v36;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
  if (v22)
  {
    v15 = *(_QWORD *)__b[2];
    v16 = 0;
    v17 = v22;
    while (1)
    {
      v14 = v16;
      if (*(_QWORD *)__b[2] != v15)
        objc_enumerationMutation(v21);
      v34 = *(id *)(__b[1] + 8 * v16);
      v32 = (id)objc_msgSend(v34, "featureId");
      objc_msgSend(v35, "addObject:", v32);
      v31 = (id)objc_msgSend(location[0], "objectForKey:", v32);
      v30 = -[AMDInputBuilder getHyperParameterInput:usingMetadata:withInputFeatureDefinition:](v42, "getHyperParameterInput:usingMetadata:withInputFeatureDefinition:", v32, v31, v34);
      if (v30)
      {
        objc_msgSend(v37, "setObject:forKey:", v30, v32);
        v27 = 0;
      }
      else
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          __os_log_helper_16_2_1_8_64((uint64_t)v45, (uint64_t)v32);
          _os_log_error_impl(&dword_1DC678000, log, type, "could not build input array for hyperparameter %@", v45, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        v27 = 3;
      }
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
      ++v16;
      if (v14 + 1 >= v17)
      {
        v16 = 0;
        v17 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
        if (!v17)
          break;
      }
    }
  }

  memset(v25, 0, sizeof(v25));
  v11 = location[0];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", v25, v44, 16);
  if (v12)
  {
    v8 = *(_QWORD *)v25[2];
    v9 = 0;
    v10 = v12;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)v25[2] != v8)
        objc_enumerationMutation(v11);
      v26 = *(_QWORD *)(v25[1] + 8 * v9);
      if ((objc_msgSend(v35, "containsObject:", v26) & 1) == 0)
      {
        v24 = (id)objc_msgSend(location[0], "objectForKey:", v26);
        v23 = -[AMDInputBuilder getModelInput:usingMetadata:andModelAssets:error:](v42, "getModelInput:usingMetadata:andModelAssets:error:", v26, v24, v40, v39);
        if (!*v39 && v23)
        {
          objc_msgSend(v37, "setObject:forKey:", v23, v26);
          v27 = 0;
        }
        else
        {
          v43 = 0;
          v27 = 1;
        }
        objc_storeStrong(&v23, 0);
        objc_storeStrong(&v24, 0);
        if (v27)
          break;
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", v25, v44, 16);
        if (!v10)
          goto LABEL_24;
      }
    }
  }
  else
  {
LABEL_24:
    v27 = 0;
  }

  if (!v27)
  {
    +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", v38);
    v5 = objc_alloc(MEMORY[0x1E0C9E8F8]);
    v43 = (id)objc_msgSend(v5, "initWithDictionary:error:", v37, v39);
    v27 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
  return v43;
}

- (id)getHyperParameterInput:(id)a3 usingMetadata:(id)a4 withInputFeatureDefinition:(id)a5
{
  double v5;
  float v6;
  float v7;
  uint64_t v8;
  double v9;
  id v10;
  id v11;
  id v13;
  NSObject *log;
  os_log_type_t type;
  id v16;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  double v20;
  double v21;
  id v24;
  char v25;
  id v26;
  id v27;
  id v28;
  unsigned int v29;
  float v30;
  double v31;
  id v32;
  id v33;
  id v34;
  id v35;
  int v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id location[3];
  id v44;
  uint8_t v45[24];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v42 = 0;
  objc_storeStrong(&v42, a4);
  v41 = 0;
  objc_storeStrong(&v41, a5);
  v40 = (id)objc_msgSend(v42, "getSize");
  v39 = objc_msgSend(v42, "getDataType");
  v38 = (id)objc_msgSend(v42, "getPaddingValue");
  v37 = (id)objc_msgSend(v41, "featureValues");
  if (v40 && v39)
  {
    v46[0] = &unk_1EA4CF760;
    v46[1] = v40;
    v35 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v34 = &unk_1EA4D1DB8;
    v33 = (id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", +[AMDInputBuilder getSizeOfDataType:](AMDInputBuilder, "getSizeOfDataType:", v39)* objc_msgSend(v40, "intValue"));
    v32 = 0;
    switch(v39)
    {
      case 65568:
        v30 = 0.0;
        if (v38)
        {
          objc_msgSend(v38, "floatValue");
          v20 = v6;
        }
        else
        {
          v20 = 0.0;
        }
        v7 = v20;
        v30 = v7;
        v19 = objc_msgSend(v40, "intValue");
        v8 = objc_msgSend(objc_retainAutorelease(v33), "mutableBytes");
        *(float *)&v9 = v30;
        +[AMDFeature copyFloat32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "copyFloat32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", v19, v37, v8, 0, v9);
        break;
      case 65600:
        v31 = 0.0;
        if (v38)
        {
          objc_msgSend(v38, "doubleValue");
          v21 = v5;
        }
        else
        {
          v21 = 0.0;
        }
        v31 = v21;
        +[AMDFeature copyDoubleValues:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "copyDoubleValues:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", objc_msgSend(v40, "intValue"), v37, objc_msgSend(objc_retainAutorelease(v33), "mutableBytes"), 0, v21);
        break;
      case 131104:
        v29 = 0;
        if (v38)
          v18 = objc_msgSend(v38, "intValue");
        else
          v18 = 0;
        v29 = v18;
        +[AMDFeature copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", objc_msgSend(v40, "intValue"), v37, objc_msgSend(objc_retainAutorelease(v33), "mutableBytes"), v18, 0);
        break;
      default:
        v10 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, CFSTR("invalid data type for hyperparameter"));
        v11 = v32;
        v32 = v10;

        break;
    }
    if (v32)
    {
      v44 = 0;
      v36 = 1;
    }
    else
    {
      v27 = 0;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithDataPointer:shape:dataType:strides:deallocator:error:", objc_msgSend(objc_retainAutorelease(v33), "mutableBytes"), v35, v39, v34, 0, &v27);
      objc_storeStrong(&v32, v27);
      v28 = v17;
      if (v32)
      {
        v26 = MEMORY[0x1E0C81028];
        v25 = 16;
        if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
        {
          log = v26;
          type = v25;
          v13 = location[0];
          v16 = (id)objc_msgSend(v32, "localizedDescription");
          v24 = v16;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v45, (uint64_t)v13, (uint64_t)v24);
          _os_log_error_impl(&dword_1DC678000, log, type, "Error while initialising for feature %@ input array: %@", v45, 0x16u);

          objc_storeStrong(&v24, 0);
        }
        objc_storeStrong(&v26, 0);
        v44 = 0;
        v36 = 1;
      }
      else
      {
        v44 = v28;
        v36 = 1;
      }
      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
  }
  else
  {
    v44 = 0;
    v36 = 1;
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
  return v44;
}

- (id)getModelInput:(id)a3 usingMetadata:(id)a4 andModelAssets:(id)a5 error:(id *)a6
{
  id v6;
  id v7;
  id v12;
  id v13;
  id v14;
  os_log_type_t v15;
  id v16;
  __CFString *v17;
  uint64_t v18;
  int v19;
  os_log_type_t v20;
  id v21;
  __CFString *v22;
  id *v23;
  id v24;
  id v25;
  id location[2];
  AMDInputBuilder *v27;
  id v28;
  uint8_t v29[16];
  uint8_t v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23 = a6;
  if (v25)
  {
    v18 = objc_msgSend(v25, "getDataType");
    if (v18)
    {
      v14 = (id)objc_msgSend(v25, "getPaddingValue");
      v13 = (id)objc_msgSend(v25, "getShape");
      if (v13)
      {
        v28 = -[AMDInputBuilder getGeneralMultiArrayForInput:withDataType:andShape:withPaddingValue:usingMetadata:andModelAssets:error:](v27, "getGeneralMultiArrayForInput:withDataType:andShape:withPaddingValue:usingMetadata:andModelAssets:error:", location[0], v18, v13, v14, v25, v24, v23);
        v19 = 1;
      }
      else
      {
        v12 = (id)objc_msgSend(v25, "getSize");
        v28 = -[AMDInputBuilder getSimpleMultiArrayForInput:OfSize:withDataType:withPaddingValue:usingMetadata:andModelAssets:error:](v27, "getSimpleMultiArrayForInput:OfSize:withDataType:withPaddingValue:usingMetadata:andModelAssets:error:", location[0], v12, v18, v14, v25, v24, v23);
        v19 = 1;
        objc_storeStrong(&v12, 0);
      }
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v14, 0);
    }
    else
    {
      v17 = CFSTR("No datatype available, check model metadata");
      v16 = MEMORY[0x1E0C81028];
      v15 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v29, (uint64_t)v17);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v16, v15, "%@", v29, 0xCu);
      }
      objc_storeStrong(&v16, 0);
      v7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v17);
      *v23 = v7;
      v28 = 0;
      v19 = 1;
      objc_storeStrong((id *)&v17, 0);
    }
  }
  else
  {
    v22 = CFSTR("No model metadata available");
    v21 = MEMORY[0x1E0C81028];
    v20 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v22);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v21, v20, "%@", v30, 0xCu);
    }
    objc_storeStrong(&v21, 0);
    v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v22);
    *v23 = v6;
    v28 = 0;
    v19 = 1;
    objc_storeStrong((id *)&v22, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v28;
}

- (BOOL)isMatchingShape:(id)a3 with:(id)a4
{
  int v5;
  id v6;
  id v7;
  BOOL v8;
  uint64_t v10;
  int i;
  id v12;
  id location[3];
  char v14;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v10 = objc_msgSend(location[0], "count");
  if (v10 == objc_msgSend(v12, "count"))
  {
    for (i = 0; i < (unint64_t)objc_msgSend(location[0], "count"); ++i)
    {
      v7 = (id)objc_msgSend(location[0], "objectAtIndexedSubscript:", i);
      v5 = objc_msgSend(v7, "intValue");
      v6 = (id)objc_msgSend(v12, "objectAtIndexedSubscript:", i);
      v8 = v5 == objc_msgSend(v6, "intValue");

      if (!v8)
      {
        v14 = 0;
        goto LABEL_9;
      }
    }
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
LABEL_9:
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v14 & 1;
}

- (id)getGeneralMultiArrayForInput:(id)a3 withDataType:(int64_t)a4 andShape:(id)a5 withPaddingValue:(id)a6 usingMetadata:(id)a7 andModelAssets:(id)a8 error:(id *)a9
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  BOOL v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  AMDInputBuilder *v26;
  id v27;
  BOOL v28;
  id v29;
  BOOL v30;
  NSMutableDictionary *v36;
  os_log_t v37;
  id v38;
  id v39;
  os_log_type_t v40;
  os_log_t v41;
  id v42;
  char v43;
  id v44;
  os_log_type_t v45;
  os_log_t v46;
  id v47;
  os_log_type_t v48;
  os_log_t oslog;
  id v50;
  char v51;
  id v52;
  id v53;
  int v54;
  os_log_type_t v55;
  id v56;
  id v57;
  id v58;
  id *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  int64_t v64;
  id location[2];
  AMDInputBuilder *v66;
  id v67;
  uint8_t v68[16];
  uint8_t v69[16];
  uint8_t v70[16];
  uint8_t v71[16];
  uint8_t v72[24];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v66 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v64 = a4;
  v63 = 0;
  objc_storeStrong(&v63, a5);
  v62 = 0;
  objc_storeStrong(&v62, a6);
  v61 = 0;
  objc_storeStrong(&v61, a7);
  v60 = 0;
  objc_storeStrong(&v60, a8);
  v59 = a9;
  v36 = -[AMDInputBuilder inputsDefinitions](v66, "inputsDefinitions");
  v58 = (id)-[NSMutableDictionary objectForKey:](v36, "objectForKey:", location[0]);

  if (v58 && objc_msgSend(v58, "count") == 1)
  {
    v53 = (id)objc_msgSend(v58, "firstObject");
    v29 = (id)objc_msgSend(v53, "shape");
    v51 = 0;
    v30 = 1;
    if (v29)
    {
      v52 = (id)objc_msgSend(v53, "shape");
      v51 = 1;
      v30 = objc_msgSend(v52, "count") == 0;
    }
    if ((v51 & 1) != 0)

    if (v30)
    {
      v50 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Empty input definition for feature '%@'"), location[0]);
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      v48 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v71, (uint64_t)v50);
        _os_log_error_impl(&dword_1DC678000, oslog, v48, "%@", v71, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      *v59 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v50);
      v67 = 0;
      v54 = 1;
      objc_storeStrong(&v50, 0);
    }
    else
    {
      v26 = v66;
      v25 = v63;
      v27 = (id)objc_msgSend(v53, "shape");
      v28 = -[AMDInputBuilder isMatchingShape:with:](v26, "isMatchingShape:with:", v25);

      if (v28)
      {
        v18 = (id)objc_msgSend(v53, "featureType");
        v43 = 0;
        v19 = 0;
        if ((objc_msgSend(v18, "isEqual:", CFSTR("RowSet")) & 1) != 0)
        {
          v44 = (id)objc_msgSend(v53, "columnName");
          v43 = 1;
          v19 = v44 == 0;
        }
        if ((v43 & 1) != 0)

        if (v19)
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          v17 = (id)objc_msgSend(v53, "featureId");
          v42 = (id)objc_msgSend(v16, "stringWithFormat:", CFSTR("Error %@: No column name specified for a feature of type RowSet"), v17);

          v41 = (os_log_t)MEMORY[0x1E0C81028];
          v40 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v69, (uint64_t)v42);
            _os_log_error_impl(&dword_1DC678000, v41, v40, "%@", v69, 0xCu);
          }
          objc_storeStrong((id *)&v41, 0);
          *v59 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v42);
          v67 = 0;
          v54 = 1;
          objc_storeStrong(&v42, 0);
        }
        else
        {
          v15 = (id)objc_msgSend(v53, "featureProvider");
          v14 = (id)objc_msgSend(v53, "featureId");
          v13 = (id)objc_msgSend(v53, "columnName");
          v39 = (id)objc_msgSend(v15, "getFeatureWithName:withColumn:error:", v14);

          if (!*v59 && v39)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v39, "setDataType:", v64);
              objc_msgSend(v39, "setShape:", v63);
              v10 = -[AMDInputBuilder getRemapInfoFrom:andModelAssets:](v66, "getRemapInfoFrom:andModelAssets:", v53, v60);
              objc_msgSend(v39, "setRemapInfo:");

              v67 = (id)objc_msgSend(v39, "getMultiArray:", v59);
              v54 = 1;
            }
            else
            {
              v11 = (void *)MEMORY[0x1E0CB3940];
              v12 = (id)objc_msgSend(v53, "featureId");
              v38 = (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("Feature '%@' is not a multi-array, check!"), v12);

              v37 = (os_log_t)MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v68, (uint64_t)v38);
                _os_log_error_impl(&dword_1DC678000, v37, OS_LOG_TYPE_ERROR, "%@", v68, 0xCu);
              }
              objc_storeStrong((id *)&v37, 0);
              *v59 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v38);
              v67 = 0;
              v54 = 1;
              objc_storeStrong(&v38, 0);
            }
          }
          else
          {
            v67 = 0;
            v54 = 1;
          }
          objc_storeStrong(&v39, 0);
        }
      }
      else
      {
        v22 = (void *)MEMORY[0x1E0CB3940];
        v20 = location[0];
        v21 = v63;
        v24 = (id)objc_msgSend(v53, "shape");
        v23 = (id)objc_msgSend(v22, "stringWithFormat:", CFSTR("Unexpected shapes of data for feature '%@', expected: %@, got: %@"), v20, v21, v24);
        v47 = (id)objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1EA4B7088);

        v46 = (os_log_t)MEMORY[0x1E0C81028];
        v45 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v70, (uint64_t)v47);
          _os_log_error_impl(&dword_1DC678000, v46, v45, "%@", v70, 0xCu);
        }
        objc_storeStrong((id *)&v46, 0);
        *v59 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v47);
        v67 = 0;
        v54 = 1;
        objc_storeStrong(&v47, 0);
      }
    }
    objc_storeStrong(&v53, 0);
  }
  else
  {
    v57 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing or invalid input definition for feature '%@'"), location[0]);
    v56 = MEMORY[0x1E0C81028];
    v55 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v72, (uint64_t)v57);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v56, v55, "%@", v72, 0xCu);
    }
    objc_storeStrong(&v56, 0);
    *v59 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v57);
    v67 = 0;
    v54 = 1;
    objc_storeStrong(&v57, 0);
  }
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);
  return v67;
}

- (id)getSimpleMultiArrayForInput:(id)a3 OfSize:(id)a4 withDataType:(int64_t)a5 withPaddingValue:(id)a6 usingMetadata:(id)a7 andModelAssets:(id)a8 error:(id *)a9
{
  id v9;
  id v10;
  double v11;
  float v12;
  float v13;
  id v14;
  double v15;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  unsigned int v25;
  uint64_t v26;
  float v27;
  id v28;
  id v29;
  double v30;
  uint64_t v31;
  id v32;
  id v33;
  double v34;
  id v35;
  unsigned int v36;
  id v37;
  id v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  void *v42;
  id v43;
  id v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unsigned int v50;
  void *v51;
  id v52;
  uint64_t v53;
  NSMutableDictionary *v59;
  id v60;
  unsigned int v61;
  float v62;
  double v63;
  unsigned int v64;
  id v65;
  id v66;
  os_log_type_t v67;
  os_log_t v68;
  id v69;
  char v70;
  id v71;
  _QWORD __b[8];
  id v73;
  uint64_t v74;
  id v75;
  int v76;
  os_log_type_t type;
  os_log_t oslog;
  id v79;
  id v80;
  id *v81;
  id v82;
  id v83;
  id v84;
  int64_t v85;
  id v86;
  id location[2];
  AMDInputBuilder *v88;
  id v89;
  _QWORD v90[2];
  uint8_t v91[16];
  _BYTE v92[128];
  uint8_t v93[24];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v88 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v86 = 0;
  objc_storeStrong(&v86, a4);
  v85 = a5;
  v84 = 0;
  objc_storeStrong(&v84, a6);
  v83 = 0;
  objc_storeStrong(&v83, a7);
  v82 = 0;
  objc_storeStrong(&v82, a8);
  v81 = a9;
  v59 = -[AMDInputBuilder inputsDefinitions](v88, "inputsDefinitions");
  v80 = (id)-[NSMutableDictionary objectForKey:](v59, "objectForKey:", location[0]);

  if (v80)
  {
    v51 = (void *)MEMORY[0x1E0C99DF0];
    v50 = +[AMDInputBuilder getSizeOfDataType:](AMDInputBuilder, "getSizeOfDataType:", v85);
    v75 = (id)objc_msgSend(v51, "dataWithLength:", v50 * objc_msgSend(v86, "intValue"));
    v74 = objc_msgSend(objc_retainAutorelease(v75), "mutableBytes");
    memset(__b, 0, sizeof(__b));
    v52 = v80;
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", __b, v92, 16);
    if (v53)
    {
      v47 = *(_QWORD *)__b[2];
      v48 = 0;
      v49 = v53;
      while (1)
      {
        v46 = v48;
        if (*(_QWORD *)__b[2] != v47)
          objc_enumerationMutation(v52);
        v73 = *(id *)(__b[1] + 8 * v48);
        v44 = (id)objc_msgSend(v73, "columnName");
        v70 = 0;
        LOBYTE(v45) = 0;
        if (v44)
        {
          v71 = (id)objc_msgSend(v73, "featureType");
          v70 = 1;
          v45 = objc_msgSend(v71, "isEqual:", CFSTR("RowSet")) ^ 1;
        }
        if ((v70 & 1) != 0)

        if ((v45 & 1) != 0)
          break;
        v39 = (id)objc_msgSend(v73, "featureProvider");
        v38 = (id)objc_msgSend(v73, "featureId");
        v37 = (id)objc_msgSend(v73, "columnName");
        v66 = (id)objc_msgSend(v39, "getFeatureWithName:withColumn:error:", v38);

        if (!*v81 && v66)
        {
          v65 = -[AMDInputBuilder getRemapInfoFrom:andModelAssets:](v88, "getRemapInfoFrom:andModelAssets:", v73, v82);
          v35 = (id)objc_msgSend(v73, "size");
          v36 = objc_msgSend(v35, "intValue");

          v64 = v36;
          if (v85 == 65552)
          {
            v89 = 0;
            v76 = 1;
          }
          else
          {
            switch(v85)
            {
              case 65568:
                v62 = 0.0;
                if (v84)
                {
                  objc_msgSend(v84, "floatValue");
                  v30 = v12;
                }
                else
                {
                  v30 = 0.0;
                }
                v13 = v30;
                v62 = v13;
                v28 = v66;
                v26 = v74;
                v27 = v13;
                v14 = (id)objc_msgSend(v73, "mapOp");
                *(float *)&v15 = v27;
                v29 = v14;
                objc_msgSend(v28, "copyFloat32Values:toBuffer:withDefaultValue:withMapOp:withRemapDictionary:andPostRemapOperation:", v64, v26, v15);

                v74 += 4 * (int)v64;
                break;
              case 65600:
                v63 = 0.0;
                if (v84)
                {
                  objc_msgSend(v84, "doubleValue");
                  v34 = v11;
                }
                else
                {
                  v34 = 0.0;
                }
                v63 = v34;
                v32 = v66;
                v31 = v74;
                v33 = (id)objc_msgSend(v73, "mapOp");
                objc_msgSend(v32, "copyDoubleValues:toBuffer:withDefaultValue:withMapOp:withRemapDictionary:andPostRemapOperation:", v64, v31, v34);

                v74 += 8 * (int)v64;
                break;
              case 131104:
                v61 = 0;
                if (v84)
                  v25 = objc_msgSend(v84, "intValue");
                else
                  v25 = 0;
                v61 = v25;
                v23 = v66;
                v22 = v74;
                v24 = (id)objc_msgSend(v73, "mapOp");
                objc_msgSend(v23, "copyInt32Values:toBuffer:withDefaultValue:withMapOp:withRemapInfo:andPostRemapOperation:", v64, v22, v25);

                v74 += 4 * (int)v64;
                break;
            }
            v76 = 0;
          }
          objc_storeStrong(&v65, 0);
        }
        else
        {
          v89 = 0;
          v76 = 1;
        }
        objc_storeStrong(&v66, 0);
        if (v76)
          goto LABEL_44;
        ++v48;
        if (v46 + 1 >= v49)
        {
          v48 = 0;
          v49 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", __b, v92, 16);
          if (!v49)
            goto LABEL_43;
        }
      }
      v42 = (void *)MEMORY[0x1E0CB3940];
      v43 = (id)objc_msgSend(v73, "featureId");
      v69 = (id)objc_msgSend(v42, "stringWithFormat:", CFSTR("Error %@: Column name can only be specified for a feature of type RowSet"), v43);

      v68 = (os_log_t)MEMORY[0x1E0C81028];
      v67 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v40 = v68;
        v41 = v67;
        __os_log_helper_16_2_1_8_64((uint64_t)v91, (uint64_t)v69);
        _os_log_error_impl(&dword_1DC678000, v40, v41, "%@", v91, 0xCu);
      }
      objc_storeStrong((id *)&v68, 0);
      v10 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v69);
      *v81 = v10;
      v89 = 0;
      v76 = 1;
      objc_storeStrong(&v69, 0);
    }
    else
    {
LABEL_43:
      v76 = 0;
    }
LABEL_44:

    if (!v76)
    {
      v17 = location[0];
      v18 = objc_msgSend(objc_retainAutorelease(v75), "mutableBytes");
      +[AMDMiscHelpers printInput:withRawData:withType:andSize:](AMDMiscHelpers, "printInput:withRawData:withType:andSize:", v17, v18, v85, objc_msgSend(v86, "intValue"));
      v20 = objc_alloc(MEMORY[0x1E0C9E970]);
      v19 = objc_msgSend(objc_retainAutorelease(v75), "mutableBytes");
      v90[0] = &unk_1EA4CF760;
      v90[1] = v86;
      v21 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
      v60 = (id)objc_msgSend(v20, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v19);

      if (*v81)
        v89 = 0;
      else
        v89 = v60;
      v76 = 1;
      objc_storeStrong(&v60, 0);
    }
    objc_storeStrong(&v75, 0);
  }
  else
  {
    v79 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No input definition for feature '%@'"), location[0]);
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v93, (uint64_t)v79);
      _os_log_error_impl(&dword_1DC678000, oslog, type, "%@", v93, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v9 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v79);
    *v81 = v9;
    v89 = 0;
    v76 = 1;
    objc_storeStrong(&v79, 0);
  }
  objc_storeStrong(&v80, 0);
  objc_storeStrong(&v82, 0);
  objc_storeStrong(&v83, 0);
  objc_storeStrong(&v84, 0);
  objc_storeStrong(&v86, 0);
  objc_storeStrong(location, 0);
  return v89;
}

- (id)getRemapInfoFrom:(id)a3 andModelAssets:(id)a4
{
  id v6;
  int v7;
  id v8;
  int v9;
  char v10;
  id v11;
  id v12;
  id location[2];
  AMDInputBuilder *v14;
  id v15;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v6 = (id)objc_msgSend(location[0], "remapDictionaryId");
  v10 = 0;
  LOBYTE(v7) = 1;
  if (v6)
  {
    v11 = (id)objc_msgSend(location[0], "remapDictionaryId");
    v10 = 1;
    v7 = objc_msgSend(v11, "isEqualToString:", 0x1EA4BD4A8) ^ 1;
  }
  if ((v10 & 1) != 0)

  if ((v7 & 1) != 0)
  {
    v15 = 0;
    v9 = 1;
  }
  else if ((objc_msgSend(v12, "getMinimalMapPresent") & 1) == 0
         || ((v8 = -[AMDInputBuilder getMinimalCToLMapping](v14, "getMinimalCToLMapping")) == 0
           ? (v9 = 0)
           : (v15 = v8, v9 = 1),
             objc_storeStrong(&v8, 0),
             !v9))
  {
    v15 = (id)objc_msgSend(v12, "getContentToLogicalMap");
    v9 = 1;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v15;
}

+ (unsigned)getSizeOfDataType:(int64_t)a3
{
  switch(a3)
  {
    case 65552:
      return 2;
    case 65568:
      return 4;
    case 65600:
      return 8;
    case 131104:
      return 4;
  }
  return 0;
}

- (id)getMinimalCToLMapping
{
  NSString *v2;
  NSString *v4;
  void *v5;
  NSString *v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13[2];
  AMDInputBuilder *v14;
  id v15;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = self;
  v13[1] = (id)a2;
  v2 = -[AMDInputBuilder modelId](self, "modelId");
  v8 = v2 != 0;

  if (v8)
  {
    v13[0] = 0;
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = -[AMDInputBuilder modelId](v14, "modelId");
    v12 = (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), 0x1EA4C23E8, v6);

    v10 = v13[0];
    v7 = +[AMDTasteProfile getFeatureValueWithName:inDomain:error:](AMDTasteProfile, "getFeatureValueWithName:inDomain:error:", v12, CFSTR("apps"), &v10);
    objc_storeStrong(v13, v10);
    v11 = v7;
    if (v7)
    {
      v9 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
      {
        v4 = -[AMDInputBuilder modelId](v14, "modelId");
        __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)v4);
        _os_log_debug_impl(&dword_1DC678000, (os_log_t)v9, OS_LOG_TYPE_DEBUG, "Content to logical id map for model '%@' found", v16, 0xCu);

      }
      objc_storeStrong(&v9, 0);
    }
    v15 = v11;
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(v13, 0);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (NSMutableDictionary)inputsDefinitions
{
  return self->_inputsDefinitions;
}

- (void)setInputsDefinitions:(id)a3
{
  objc_storeStrong((id *)&self->_inputsDefinitions, a3);
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
  objc_storeStrong((id *)&self->_modelId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelId, 0);
  objc_storeStrong((id *)&self->_inputsDefinitions, 0);
}

@end
