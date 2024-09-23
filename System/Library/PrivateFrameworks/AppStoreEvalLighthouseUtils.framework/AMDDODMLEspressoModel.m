@implementation AMDDODMLEspressoModel

- (AMDDODMLEspressoModel)initWithModelMetadata:(id)a3 withAttachmentProcessor:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  AMDDODMLEspressoModel *v52;
  objc_super v53;
  id v54;
  id *v55;
  id v56;
  id location[2];
  id v58;
  AMDDODMLEspressoModel *v59;

  v58 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v56 = 0;
  objc_storeStrong(&v56, a4);
  v55 = a5;
  v54 = 0;
  objc_storeStrong(&v54, a6);
  v6 = v58;
  v58 = 0;
  v53.receiver = v6;
  v53.super_class = (Class)AMDDODMLEspressoModel;
  v52 = -[AMDDODMLEspressoModel init](&v53, sel_init);
  v58 = v52;
  objc_storeStrong(&v58, v52);
  if (!v52)
  {
    v59 = 0;
    goto LABEL_15;
  }
  v7 = (id)objc_msgSend(location[0], "modelPath");
  v8 = (void *)*((_QWORD *)v58 + 1);
  *((_QWORD *)v58 + 1) = v7;

  v9 = objc_msgSend(location[0], "batchSize");
  *((_QWORD *)v58 + 7) = v9;
  v10 = (id)objc_msgSend(location[0], "inputNames");
  v11 = (void *)*((_QWORD *)v58 + 2);
  *((_QWORD *)v58 + 2) = v10;

  v12 = (id)objc_msgSend(location[0], "weightNames");
  v13 = (void *)*((_QWORD *)v58 + 5);
  *((_QWORD *)v58 + 5) = v12;

  v14 = (id)objc_msgSend(v58, "createBufferDictionary:", *((_QWORD *)v58 + 2));
  v15 = (void *)*((_QWORD *)v58 + 3);
  *((_QWORD *)v58 + 3) = v14;

  v47 = v58;
  v48 = (id)objc_msgSend(location[0], "outputNames");
  v16 = (id)objc_msgSend(v47, "createBufferDictionary:");
  v17 = (void *)*((_QWORD *)v58 + 4);
  *((_QWORD *)v58 + 4) = v16;

  v18 = (id)objc_msgSend(v58, "createBufferDictionary:", *((_QWORD *)v58 + 5));
  v19 = (void *)*((_QWORD *)v58 + 6);
  *((_QWORD *)v58 + 6) = v18;

  v20 = (id)objc_msgSend(location[0], "learningRate");
  v21 = (void *)*((_QWORD *)v58 + 8);
  *((_QWORD *)v58 + 8) = v20;

  v22 = (id)objc_msgSend(location[0], "trainingModeBufferName");
  v23 = (void *)*((_QWORD *)v58 + 14);
  *((_QWORD *)v58 + 14) = v22;

  v24 = (id)objc_msgSend(location[0], "learningRateBufferName");
  v25 = (void *)*((_QWORD *)v58 + 36);
  *((_QWORD *)v58 + 36) = v24;

  v26 = (id)objc_msgSend(location[0], "lossName");
  v27 = (void *)*((_QWORD *)v58 + 58);
  *((_QWORD *)v58 + 58) = v26;

  v28 = (id)objc_msgSend(location[0], "metricsNames");
  v29 = (void *)*((_QWORD *)v58 + 9);
  *((_QWORD *)v58 + 9) = v28;

  v30 = (id)objc_msgSend(location[0], "shortenedEmbeddingNames");
  v31 = (void *)*((_QWORD *)v58 + 59);
  *((_QWORD *)v58 + 59) = v30;

  v32 = (id)objc_msgSend(location[0], "shortenedEmbeddingMappingKeys");
  v33 = (void *)*((_QWORD *)v58 + 63);
  *((_QWORD *)v58 + 63) = v32;

  v34 = (id)objc_msgSend(location[0], "shortenedEmbeddingNumberVectorsBefore");
  v35 = (void *)*((_QWORD *)v58 + 60);
  *((_QWORD *)v58 + 60) = v34;

  v36 = (id)objc_msgSend(location[0], "shortenedEmbeddingNumberVectorsAfter");
  v37 = (void *)*((_QWORD *)v58 + 61);
  *((_QWORD *)v58 + 61) = v36;

  v38 = (id)objc_msgSend(location[0], "shortenedEmbeddingSize");
  v39 = (void *)*((_QWORD *)v58 + 62);
  *((_QWORD *)v58 + 62) = v38;

  objc_storeStrong((id *)v58 + 64, v56);
  v40 = (id)objc_msgSend(location[0], "initializeManually");
  v41 = (void *)*((_QWORD *)v58 + 65);
  *((_QWORD *)v58 + 65) = v40;

  if (objc_msgSend(v58, "_buildPlan:errorDomain:", v55, v54))
  {
    if (objc_msgSend(v58, "_bindBuffers:errorDomain:", v55, v54))
    {
      if (objc_msgSend(*((id *)v58 + 65), "longValue"))
      {
        if (!objc_msgSend(v58, "initializeManually:errorDomain:", v55, v54))
        {
          v59 = 0;
          goto LABEL_15;
        }
      }
      else
      {
        v45 = (id)objc_msgSend(location[0], "initializationFunctionName");
        objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
        v46 = (int)espresso_network_set_function_name();

        if (v46 || espresso_plan_execute_sync())
        {
          v42 = objc_alloc(MEMORY[0x24BDD1540]);
          v43 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v54, 77, 0);
          *v55 = v43;
          v59 = 0;
          goto LABEL_15;
        }
      }
      v59 = (AMDDODMLEspressoModel *)v58;
      goto LABEL_15;
    }
    v59 = 0;
  }
  else
  {
    v59 = 0;
  }
LABEL_15:
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v58, 0);
  return v59;
}

- (id)createBufferDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id obj;
  uint64_t v10;
  id v11;
  _BYTE v12[168];
  _QWORD __b[8];
  uint64_t v14;
  id v15;
  id location[3];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
  if (v10)
  {
    v6 = *(_QWORD *)__b[2];
    v7 = 0;
    v8 = v10;
    while (1)
    {
      v5 = v7;
      if (*(_QWORD *)__b[2] != v6)
        objc_enumerationMutation(obj);
      v14 = *(_QWORD *)(__b[1] + 8 * v7);
      memset(v12, 0, sizeof(v12));
      v11 = (id)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v12, 168);
      objc_msgSend(v15, "setObject:forKey:", v11, v14);
      objc_storeStrong(&v11, 0);
      ++v7;
      if (v5 + 1 >= v8)
      {
        v7 = 0;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
        if (!v8)
          break;
      }
    }
  }

  v4 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (int64_t)_buildPlan:(id *)a3 errorDomain:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  NSDictionary *obj;
  uint64_t v21;
  _QWORD __b[8];
  id v23;
  uint64_t v24;
  int v25;
  id location;
  id *v27;
  SEL v28;
  AMDDODMLEspressoModel *v29;
  int64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v29 = self;
  v28 = a2;
  v27 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v29->_ctx = (void *)espresso_create_context();
  if (v29->_ctx)
  {
    v29->_plan = (void *)espresso_create_plan();
    if (v29->_plan)
    {
      v24 = 0;
      -[NSString UTF8String](v29->_modelPath, "UTF8String");
      v8 = espresso_plan_add_network();
      v24 = v8;
      if (v8)
      {
        v9 = objc_alloc(MEMORY[0x24BDD1540]);
        v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", location, 67, 0);
        *v27 = v10;
        v30 = 0;
        v25 = 1;
      }
      else
      {
        memset(__b, 0, sizeof(__b));
        obj = v29->_outputNameBufferMap;
        v21 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
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
            v23 = *(id *)(__b[1] + 8 * v18);
            objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
            if (espresso_network_declare_output())
              break;
            ++v18;
            if (v16 + 1 >= v19)
            {
              v18 = 0;
              v19 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
              if (!v19)
                goto LABEL_15;
            }
          }
          v11 = objc_alloc(MEMORY[0x24BDD1540]);
          v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", location, 70, 0);
          *v27 = v12;
          v30 = 0;
          v25 = 1;
        }
        else
        {
LABEL_15:
          v25 = 0;
        }

        if (!v25)
        {
          if (espresso_plan_build())
          {
            v13 = objc_alloc(MEMORY[0x24BDD1540]);
            v14 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", location, 71, 0);
            *v27 = v14;
            v30 = 0;
          }
          else
          {
            v30 = 1;
          }
          v25 = 1;
        }
      }
    }
    else
    {
      v6 = objc_alloc(MEMORY[0x24BDD1540]);
      v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", location, 69, 0);
      *v27 = v7;
      v30 = 0;
      v25 = 1;
    }
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x24BDD1540]);
    v5 = (id)objc_msgSend(v4, "initWithDomain:code:userInfo:", location, 68, 0);
    *v27 = v5;
    v30 = 0;
    v25 = 1;
  }
  objc_storeStrong(&location, 0);
  return v30;
}

- (int64_t)_bindBuffers:(id *)a3 errorDomain:(id)a4
{
  int v4;
  id v5;
  id v6;
  int v7;
  id v8;
  id v9;
  int v10;
  id v11;
  id v12;
  int v13;
  id v14;
  id v15;
  int v16;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  NSDictionary *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  NSDictionary *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  NSDictionary *obj;
  uint64_t v37;
  id v38;
  _QWORD v39[8];
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  _QWORD v45[8];
  id v46;
  int v47;
  uint64_t v48;
  id v49;
  _QWORD __b[8];
  id v51;
  id location;
  id *v53;
  SEL v54;
  AMDDODMLEspressoModel *v55;
  int64_t v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v55 = self;
  v54 = a2;
  v53 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  memset(__b, 0, sizeof(__b));
  obj = v55->_inputNameBufferMap;
  v37 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v59, 16);
  if (v37)
  {
    v33 = *(_QWORD *)__b[2];
    v34 = 0;
    v35 = v37;
    while (1)
    {
      v32 = v34;
      if (*(_QWORD *)__b[2] != v33)
        objc_enumerationMutation(obj);
      v51 = *(id *)(__b[1] + 8 * v34);
      v49 = -[NSDictionary objectForKeyedSubscript:](v55->_inputNameBufferMap, "objectForKeyedSubscript:", v51);
      objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
      objc_msgSend(objc_retainAutorelease(v49), "mutableBytes");
      v4 = espresso_network_bind_buffer();
      v48 = v4;
      if (v4)
      {
        v5 = objc_alloc(MEMORY[0x24BDD1540]);
        v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", location, 72, 0);
        *v53 = v6;
        v56 = 0;
        v47 = 1;
      }
      else
      {
        v47 = 0;
      }
      objc_storeStrong(&v49, 0);
      if (v47)
        break;
      ++v34;
      if (v32 + 1 >= v35)
      {
        v34 = 0;
        v35 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v59, 16);
        if (!v35)
          goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v47 = 0;
  }

  if (!v47)
  {
    memset(v45, 0, sizeof(v45));
    v30 = v55->_outputNameBufferMap;
    v31 = -[NSDictionary countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", v45, v58, 16);
    if (v31)
    {
      v27 = *(_QWORD *)v45[2];
      v28 = 0;
      v29 = v31;
      while (1)
      {
        v26 = v28;
        if (*(_QWORD *)v45[2] != v27)
          objc_enumerationMutation(v30);
        v46 = *(id *)(v45[1] + 8 * v28);
        v44 = -[NSDictionary objectForKeyedSubscript:](v55->_outputNameBufferMap, "objectForKeyedSubscript:", v46);
        objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
        objc_msgSend(objc_retainAutorelease(v44), "mutableBytes");
        v7 = espresso_network_bind_buffer();
        v43 = v7;
        if (v7)
        {
          v8 = objc_alloc(MEMORY[0x24BDD1540]);
          v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", location, 73, 0);
          *v53 = v9;
          v56 = 0;
          v47 = 1;
        }
        else
        {
          v47 = 0;
        }
        objc_storeStrong(&v44, 0);
        if (v47)
          break;
        ++v28;
        if (v26 + 1 >= v29)
        {
          v28 = 0;
          v29 = -[NSDictionary countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", v45, v58, 16);
          if (!v29)
            goto LABEL_23;
        }
      }
    }
    else
    {
LABEL_23:
      v47 = 0;
    }

    if (!v47)
    {
      v42 = 0;
      -[NSString UTF8String](v55->_trainingModeBufferName, "UTF8String");
      v10 = espresso_network_bind_buffer_to_global();
      v42 = v10;
      if (v10)
      {
        v11 = objc_alloc(MEMORY[0x24BDD1540]);
        v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", location, 75, 0);
        *v53 = v12;
        v56 = 0;
        v47 = 1;
        goto LABEL_45;
      }
      v41 = 0;
      -[NSString UTF8String](v55->_learningRateBufferName, "UTF8String");
      v13 = espresso_network_bind_buffer_to_global();
      v41 = v13;
      if (v13)
      {
        v14 = objc_alloc(MEMORY[0x24BDD1540]);
        v15 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", location, 76, 0);
        *v53 = v15;
        v56 = 0;
        v47 = 1;
        goto LABEL_45;
      }
      *(float *)v55->_bufIsTraining.data = 1.0;
      -[NSNumber floatValue](v55->_learningRate, "floatValue");
      *(_DWORD *)v55->_bufLR.data = v16;
      memset(v39, 0, sizeof(v39));
      v24 = v55->_weightNameBufferMap;
      v25 = -[NSDictionary countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", v39, v57, 16);
      if (v25)
      {
        v21 = *(_QWORD *)v39[2];
        v22 = 0;
        v23 = v25;
        while (1)
        {
          v20 = v22;
          if (*(_QWORD *)v39[2] != v21)
            objc_enumerationMutation(v24);
          v40 = *(id *)(v39[1] + 8 * v22);
          v38 = -[NSDictionary objectForKeyedSubscript:](v55->_weightNameBufferMap, "objectForKeyedSubscript:", v40);
          if (-[NSNumber longValue](v55->_initializeManually, "longValue"))
          {
            objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
            objc_msgSend(objc_retainAutorelease(v38), "mutableBytes");
            if (!espresso_network_bind_buffer_to_global())
            {
LABEL_38:
              v47 = 0;
              goto LABEL_39;
            }
          }
          else
          {
            objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
            objc_msgSend(objc_retainAutorelease(v38), "mutableBytes");
            if (!espresso_network_bind_buffer_to_global())
              goto LABEL_38;
          }
          v17 = objc_alloc(MEMORY[0x24BDD1540]);
          v18 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", location, 74, 0);
          *v53 = v18;
          v56 = 0;
          v47 = 1;
LABEL_39:
          objc_storeStrong(&v38, 0);
          if (v47)
            goto LABEL_43;
          ++v22;
          if (v20 + 1 >= v23)
          {
            v22 = 0;
            v23 = -[NSDictionary countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", v39, v57, 16);
            if (!v23)
              break;
          }
        }
      }
      v47 = 0;
LABEL_43:

      if (!v47)
      {
        v56 = 1;
        v47 = 1;
      }
    }
  }
LABEL_45:
  objc_storeStrong(&location, 0);
  return v56;
}

- (id)_flattenedWeightsBeforeTraining
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSArray *obj;
  uint64_t v9;
  _QWORD v10[21];
  id v11;
  _QWORD __b[8];
  uint64_t v13;
  id v14[2];
  AMDDODMLEspressoModel *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  v14[1] = (id)a2;
  v14[0] = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  memset(__b, 0, sizeof(__b));
  obj = v15->_weightNames;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(__b[1] + 8 * v6);
      v11 = -[NSDictionary objectForKeyedSubscript:](v15->_weightNameBufferMap, "objectForKeyedSubscript:", v13);
      memset(v10, 0, sizeof(v10));
      objc_msgSend(v11, "getBytes:length:", v10, 168);
      objc_msgSend(v14[0], "appendBytes:length:", v10[0], 4 * v10[2] * v10[3] * v10[4] * v10[5]);
      objc_storeStrong(&v11, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
        if (!v7)
          break;
      }
    }
  }

  v3 = v14[0];
  objc_storeStrong(v14, 0);
  return v3;
}

- (id)trainOnData:(id)a3 numLocalIterations:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6
{
  int v6;
  id v7;
  id v8;
  int v9;
  id v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  NSArray *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  int **v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  float **v33;
  id v34;
  id v35;
  NSArray *v36;
  uint64_t v37;
  id v41;
  id v42;
  id v43[3];
  float v44;
  uint64_t v45;
  uint64_t v46;
  int j;
  float v48;
  float v49;
  unint64_t v50;
  _QWORD v51[21];
  id v52;
  _QWORD v53[8];
  uint64_t v54;
  int v55;
  id v56;
  int v57;
  int **v58;
  _QWORD __b[8];
  uint64_t v60;
  float v61;
  float **v62;
  uint64_t v63;
  id v64;
  int64_t i;
  id v66;
  id v67;
  id v68;
  int v69;
  uint64_t v70;
  id v71;
  id *v72;
  int64_t v73;
  id location[2];
  AMDDODMLEspressoModel *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v75 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v73 = a4;
  v72 = a5;
  v71 = 0;
  objc_storeStrong(&v71, a6);
  get_main_function_name();
  v6 = espresso_network_set_function_name();
  v70 = v6;
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDD1540]);
    v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v71, 75, 0);
    *v72 = v8;
    v76 = 0;
    v69 = 1;
  }
  else
  {
    v68 = -[AMDDODMLEspressoModel _flattenedWeightsBeforeTraining](v75, "_flattenedWeightsBeforeTraining");
    v67 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:");
    v66 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 0);
    for (i = 0; i < v73; ++i)
    {
      v64 = (id)objc_msgSend(location[0], "bindDataToInputsDirectly:batchSize:error:errorDomain:", v75->_inputNameBufferMap, v75->_batchSize, v72, v71);
      if (v64)
      {
        v63 = 0;
        v9 = espresso_plan_execute_sync();
        v63 = v9;
        if (v9)
        {
          v10 = objc_alloc(MEMORY[0x24BDD1540]);
          v11 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v71, 79, 0);
          *v72 = v11;
          v76 = 0;
          v69 = 1;
        }
        else
        {
          v62 = 0;
          v32 = -[NSDictionary objectForKeyedSubscript:](v75->_outputNameBufferMap, "objectForKeyedSubscript:", v75->_lossName);
          v33 = (float **)objc_msgSend(objc_retainAutorelease(v32), "mutableBytes");

          v62 = v33;
          v61 = 0.0;
          v61 = **v33;
          v34 = v67;
          *(float *)&v12 = v61;
          v35 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
          objc_msgSend(v34, "addObject:");

          NSLog(CFSTR("Loss: %.4f"), v61);
          memset(__b, 0, sizeof(__b));
          v36 = v75->_metricNames;
          v37 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", __b, v86, 16);
          if (v37)
          {
            v29 = *(_QWORD *)__b[2];
            v30 = 0;
            v31 = v37;
            while (1)
            {
              v28 = v30;
              if (*(_QWORD *)__b[2] != v29)
                objc_enumerationMutation(v36);
              v60 = *(_QWORD *)(__b[1] + 8 * v30);
              v58 = 0;
              v26 = -[NSDictionary objectForKeyedSubscript:](v75->_outputNameBufferMap, "objectForKeyedSubscript:", v60);
              v27 = (int **)objc_msgSend(objc_retainAutorelease(v26), "mutableBytes");

              v58 = v27;
              v57 = 0;
              v57 = **v27;
              v56 = (id)objc_msgSend(v66, "valueForKey:", v60);
              if (!v56)
              {
                v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
                v15 = v56;
                v56 = v14;

                objc_msgSend(v66, "setValue:forKey:", v56, v60);
              }
              v24 = v56;
              LODWORD(v13) = v57;
              v25 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
              objc_msgSend(v24, "addObject:");

              objc_storeStrong(&v56, 0);
              ++v30;
              if (v28 + 1 >= v31)
              {
                v30 = 0;
                v31 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", __b, v86, 16);
                if (!v31)
                  break;
              }
            }
          }

          if (!i && -[NSNumber longValue](v75->_initializeManually, "longValue") == 1)
            v16 = -[AMDDODMLEspressoModel finishInitializeManually:errorDomain:](v75, "finishInitializeManually:errorDomain:", v72, v71);
          v69 = 0;
        }
      }
      else
      {
        v76 = 0;
        v69 = 1;
      }
      objc_storeStrong(&v64, 0);
      if (v69)
        goto LABEL_38;
    }
    v55 = 0;
    memset(v53, 0, sizeof(v53));
    v22 = v75->_weightNames;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", v53, v85, 16);
    if (v23)
    {
      v19 = *(_QWORD *)v53[2];
      v20 = 0;
      v21 = v23;
      while (1)
      {
        v18 = v20;
        if (*(_QWORD *)v53[2] != v19)
          objc_enumerationMutation(v22);
        v54 = *(_QWORD *)(v53[1] + 8 * v20);
        v52 = -[NSDictionary objectForKeyedSubscript:](v75->_weightNameBufferMap, "objectForKeyedSubscript:", v54);
        memset(v51, 0, sizeof(v51));
        objc_msgSend(v52, "getBytes:length:", v51, 168);
        v50 = v51[2] * v51[3] * v51[4] * v51[5];
        v49 = 0.0;
        v48 = 0.0;
        for (j = 0; j < v50; ++j)
        {
          v82 = v55;
          v81 = 4;
          v83 = v55;
          v84 = 4;
          v45 = v55;
          v46 = 4;
          objc_msgSend(v68, "getBytes:range:", &v49, v55, 4);
          v48 = *(float *)(v51[0] + 4 * j);
          v44 = v48 - v49;
          v78 = v55;
          v77 = 4;
          v79 = v55;
          v80 = 4;
          v43[1] = (id)v55;
          v43[2] = (id)4;
          objc_msgSend(v68, "replaceBytesInRange:withBytes:", v55, 4, &v44);
          v55 += 4;
        }
        objc_storeStrong(&v52, 0);
        ++v20;
        if (v18 + 1 >= v21)
        {
          v20 = 0;
          v21 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", v53, v85, 16);
          if (!v21)
            break;
        }
      }
    }

    if (-[NSNumber longValue](v75->_initializeManually, "longValue"))
    {
      v42 = -[AMDDODMLEspressoModel getNewDeltasContainer:withError:errorDomain:](v75, "getNewDeltasContainer:withError:errorDomain:", v68, v72, v71);
      if (v42)
      {
        v41 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v41, "setObject:forKey:", v42, ModelDeltas);
        objc_msgSend(v41, "setObject:forKey:", v75->_weightNames, WeightNamesKeyInResponse);
        objc_msgSend(v41, "setObject:forKey:", v67, LossesKeyInResponse);
        objc_msgSend(v41, "setObject:forKey:", v66, ModelMetrics);
        v76 = v41;
        v69 = 1;
        objc_storeStrong(&v41, 0);
      }
      else
      {
        v76 = 0;
        v69 = 1;
      }
      objc_storeStrong(&v42, 0);
    }
    else
    {
      v43[0] = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      objc_msgSend(v43[0], "setObject:forKey:", v68, ModelDeltas);
      objc_msgSend(v43[0], "setObject:forKey:", v75->_weightNames, WeightNamesKeyInResponse);
      objc_msgSend(v43[0], "setObject:forKey:", v67, LossesKeyInResponse);
      objc_msgSend(v43[0], "setObject:forKey:", v66, ModelMetrics);
      v76 = v43[0];
      v69 = 1;
      objc_storeStrong(v43, 0);
    }
LABEL_38:
    objc_storeStrong(&v66, 0);
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v68, 0);
  }
  objc_storeStrong(&v71, 0);
  objc_storeStrong(location, 0);
  return v76;
}

- (int64_t)initializeManually:(id *)a3 errorDomain:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  NSArray *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  NSArray *obj;
  uint64_t v65;
  int v66;
  int m;
  unint64_t v68;
  _QWORD v69[21];
  id v70;
  uint64_t v71;
  int k;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int j;
  id v78;
  unsigned int i;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[21];
  id v84;
  _QWORD v85[8];
  uint64_t v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  _QWORD v93[8];
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD v97[21];
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  _QWORD __b[8];
  uint64_t v105;
  uint64_t v106;
  id v107;
  int v108;
  id location;
  id *v110;
  SEL v111;
  AMDDODMLEspressoModel *v112;
  int64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  v112 = self;
  v111 = a2;
  v110 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  if (v112->_attachmentProcessor)
  {
    v107 = -[AMDDODMLAttachmentProcessor weightsArray](v112->_attachmentProcessor, "weightsArray");
    if (v107)
    {
      v106 = 0;
      memset(__b, 0, sizeof(__b));
      obj = v112->_weightNames;
      v65 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v124, 16);
      if (v65)
      {
        v61 = *(_QWORD *)__b[2];
        v62 = 0;
        v63 = v65;
        while (1)
        {
          v60 = v62;
          if (*(_QWORD *)__b[2] != v61)
            objc_enumerationMutation(obj);
          v105 = *(_QWORD *)(__b[1] + 8 * v62);
          v59 = -[NSDictionary objectForKey:](v112->_shortenedEmbeddingNames, "objectForKey:", v105);

          if (v59)
          {
            v103 = -[NSDictionary objectForKey:](v112->_shortenedEmbeddingSize, "objectForKey:", v105);
            v102 = -[NSDictionary objectForKey:](v112->_shortenedEmbeddingNumberVectorsBefore, "objectForKey:", v105);
            v101 = -[NSDictionary objectForKey:](v112->_shortenedEmbeddingNumberVectorsAfter, "objectForKey:", v105);
            v100 = -[NSDictionary objectForKey:](v112->_shortenedEmbeddingMappingKeys, "objectForKey:", v105);
            if (v103 && v102 && v101 && v100)
            {
              v58 = objc_msgSend(v103, "longValue");
              v10 = objc_msgSend(v102, "longValue");
              v106 += v58 * v10;
              v99 = -[AMDDODMLAttachmentProcessor hashMapForKey:](v112->_attachmentProcessor, "hashMapForKey:", v100);
              if (v99)
              {
                v57 = objc_msgSend(v99, "count");
                if (v57 <= objc_msgSend(v101, "longValue"))
                {
                  v108 = 0;
                }
                else
                {
                  v13 = objc_alloc(MEMORY[0x24BDD1540]);
                  v14 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", location, 119, 0);
                  *v110 = v14;
                  v113 = 0;
                  v108 = 1;
                }
              }
              else
              {
                v11 = objc_alloc(MEMORY[0x24BDD1540]);
                v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", location, 118, 0);
                *v110 = v12;
                v113 = 0;
                v108 = 1;
              }
              objc_storeStrong(&v99, 0);
            }
            else
            {
              v8 = objc_alloc(MEMORY[0x24BDD1540]);
              v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", location, 117, 0);
              *v110 = v9;
              v113 = 0;
              v108 = 1;
            }
            objc_storeStrong(&v100, 0);
            objc_storeStrong(&v101, 0);
            objc_storeStrong(&v102, 0);
            objc_storeStrong(&v103, 0);
            if (v108)
              goto LABEL_27;
          }
          else
          {
            v98 = -[NSDictionary objectForKeyedSubscript:](v112->_weightNameBufferMap, "objectForKeyedSubscript:", v105);
            memset(v97, 0, sizeof(v97));
            objc_msgSend(v98, "getBytes:length:", v97, 168);
            v96 = v97[2] * v97[3] * v97[4] * v97[5];
            v106 += v96;
            objc_storeStrong(&v98, 0);
          }
          ++v62;
          if (v60 + 1 >= v63)
          {
            v62 = 0;
            v63 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v124, 16);
            if (!v63)
              break;
          }
        }
      }
      v108 = 0;
LABEL_27:

      if (!v108)
      {
        v15 = objc_msgSend(v107, "length");
        if (v15 / 4 == v106)
        {
          v95 = 0;
          memset(v93, 0, sizeof(v93));
          v55 = v112->_weightNames;
          v56 = -[NSArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", v93, v123, 16);
          if (v56)
          {
            v52 = *(_QWORD *)v93[2];
            v53 = 0;
            v54 = v56;
            while (1)
            {
              v51 = v53;
              if (*(_QWORD *)v93[2] != v52)
                objc_enumerationMutation(v55);
              v94 = *(_QWORD *)(v93[1] + 8 * v53);
              v50 = -[NSDictionary objectForKey:](v112->_shortenedEmbeddingNames, "objectForKey:", v94);

              if (v50)
              {
                v92 = -[NSDictionary objectForKey:](v112->_shortenedEmbeddingSize, "objectForKey:", v94);
                v91 = -[NSDictionary objectForKey:](v112->_shortenedEmbeddingNumberVectorsBefore, "objectForKey:", v94);
                v90 = -[NSDictionary objectForKey:](v112->_shortenedEmbeddingNumberVectorsAfter, "objectForKey:", v94);
                v89 = -[NSDictionary objectForKey:](v112->_shortenedEmbeddingMappingKeys, "objectForKey:", v94);
                if (v92 && v91 && v90 && v89)
                {
                  v88 = -[AMDDODMLAttachmentProcessor hashMapForKey:](v112->_attachmentProcessor, "hashMapForKey:", v89);
                  if (v88)
                  {
                    v87 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                    memset(v85, 0, sizeof(v85));
                    v48 = v88;
                    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", v85, v122, 16);
                    if (v49)
                    {
                      v45 = *(_QWORD *)v85[2];
                      v46 = 0;
                      v47 = v49;
                      while (1)
                      {
                        v44 = v46;
                        if (*(_QWORD *)v85[2] != v45)
                          objc_enumerationMutation(v48);
                        v86 = *(_QWORD *)(v85[1] + 8 * v46);
                        v42 = v87;
                        v41 = v86;
                        v43 = (id)objc_msgSend(v88, "objectForKey:", v86);
                        objc_msgSend(v42, "setObject:forKey:", v41);

                        ++v46;
                        if (v44 + 1 >= v47)
                        {
                          v46 = 0;
                          v47 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", v85, v122, 16);
                          if (!v47)
                            break;
                        }
                      }
                    }

                    v84 = -[NSDictionary objectForKeyedSubscript:](v112->_weightNameBufferMap, "objectForKeyedSubscript:", v94);
                    memset(v83, 0, sizeof(v83));
                    objc_msgSend(v84, "getBytes:length:", v83, 168);
                    v82 = v83[2];
                    v81 = v83[3];
                    v22 = objc_msgSend(v92, "longValue");
                    if (v22 == v82 && (v23 = objc_msgSend(v90, "longValue"), v23 == v81))
                    {
                      v80 = v83[0];
                      for (i = 0; ; ++i)
                      {
                        v40 = (int)i;
                        if (v40 >= objc_msgSend(v90, "longValue"))
                          break;
                        v38 = v87;
                        v39 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", i);
                        v78 = (id)objc_msgSend(v38, "objectForKey:");

                        if (v78)
                        {
                          for (j = 0; ; ++j)
                          {
                            v37 = j;
                            if (v37 >= objc_msgSend(v92, "longValue"))
                              break;
                            v76 = 0;
                            v34 = (int)i;
                            v26 = objc_msgSend(v92, "longValue");
                            v76 = v34 * v26 + j;
                            v75 = 0;
                            v35 = v95;
                            v36 = objc_msgSend(v78, "longValue");
                            v27 = objc_msgSend(v92, "longValue");
                            v75 = v35 + v36 * v27 + j;
                            v119 = 4 * v75;
                            v118 = 4;
                            v120 = 4 * v75;
                            v121 = 4;
                            v73 = 4 * v75;
                            v74 = 4;
                            objc_msgSend(v107, "getBytes:range:", v80 + 4 * v76, 4 * v75, 4);
                          }
                        }
                        else
                        {
                          for (k = 0; ; ++k)
                          {
                            v33 = k;
                            if (v33 >= objc_msgSend(v92, "longValue"))
                              break;
                            v71 = 0;
                            v32 = (int)i;
                            v28 = objc_msgSend(v92, "longValue");
                            v71 = v32 * v28 + k;
                            *(_DWORD *)(v80 + 4 * v71) = 0;
                          }
                        }
                        objc_storeStrong(&v78, 0);
                      }
                      v31 = objc_msgSend(v91, "longValue");
                      v29 = objc_msgSend(v92, "longValue");
                      v95 += v31 * v29;
                      v108 = 0;
                    }
                    else
                    {
                      v24 = objc_alloc(MEMORY[0x24BDD1540]);
                      v25 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", location, 121, 0);
                      *v110 = v25;
                      v113 = 0;
                      v108 = 1;
                    }
                    objc_storeStrong(&v84, 0);
                    objc_storeStrong(&v87, 0);
                  }
                  else
                  {
                    v20 = objc_alloc(MEMORY[0x24BDD1540]);
                    v21 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", location, 118, 0);
                    *v110 = v21;
                    v113 = 0;
                    v108 = 1;
                  }
                  objc_storeStrong(&v88, 0);
                }
                else
                {
                  v18 = objc_alloc(MEMORY[0x24BDD1540]);
                  v19 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", location, 117, 0);
                  *v110 = v19;
                  v113 = 0;
                  v108 = 1;
                }
                objc_storeStrong(&v89, 0);
                objc_storeStrong(&v90, 0);
                objc_storeStrong(&v91, 0);
                objc_storeStrong(&v92, 0);
                if (v108)
                  goto LABEL_74;
              }
              else
              {
                v70 = -[NSDictionary objectForKeyedSubscript:](v112->_weightNameBufferMap, "objectForKeyedSubscript:", v94);
                memset(v69, 0, sizeof(v69));
                objc_msgSend(v70, "getBytes:length:", v69, 168);
                v68 = v69[2] * v69[3] * v69[4] * v69[5];
                for (m = 0; m < v68; ++m)
                {
                  v66 = 0;
                  v115 = 4 * (v95 + m);
                  v114 = 4;
                  v116 = v115;
                  v117 = 4;
                  objc_msgSend(v107, "getBytes:range:", &v66, v115, 4);
                  *(_DWORD *)(v69[0] + 4 * m) = v66;
                }
                v95 += v68;
                objc_storeStrong(&v70, 0);
              }
              ++v53;
              if (v51 + 1 >= v54)
              {
                v53 = 0;
                v54 = -[NSArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", v93, v123, 16);
                if (!v54)
                  break;
              }
            }
          }
          v108 = 0;
LABEL_74:

          if (!v108)
          {
            v113 = 1;
            v108 = 1;
          }
        }
        else
        {
          v16 = objc_alloc(MEMORY[0x24BDD1540]);
          v17 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", location, 120, 0);
          *v110 = v17;
          v113 = 0;
          v108 = 1;
        }
      }
    }
    else
    {
      v6 = objc_alloc(MEMORY[0x24BDD1540]);
      v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", location, 116, 0);
      *v110 = v7;
      v113 = 0;
      v108 = 1;
    }
    objc_storeStrong(&v107, 0);
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x24BDD1540]);
    v5 = (id)objc_msgSend(v4, "initWithDomain:code:userInfo:", location, 116, 0);
    *v110 = v5;
    v113 = 0;
    v108 = 1;
  }
  objc_storeStrong(&location, 0);
  return v113;
}

- (id)finishInitializeManually:(id *)a3 errorDomain:(id)a4
{
  int v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSDictionary *obj;
  uint64_t v15;
  id v16;
  int v17;
  uint64_t v18;
  _QWORD __b[8];
  id v20;
  id location;
  id *v22;
  SEL v23;
  AMDDODMLEspressoModel *v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v24 = self;
  v23 = a2;
  v22 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  memset(__b, 0, sizeof(__b));
  obj = v24->_weightNameBufferMap;
  v15 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
  if (v15)
  {
    v11 = *(_QWORD *)__b[2];
    v12 = 0;
    v13 = v15;
    while (1)
    {
      v10 = v12;
      if (*(_QWORD *)__b[2] != v11)
        objc_enumerationMutation(obj);
      v20 = *(id *)(__b[1] + 8 * v12);
      v18 = 0;
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      v4 = espresso_network_unbind_buffer_to_global();
      v18 = v4;
      if (v4)
        break;
      v16 = -[NSDictionary objectForKeyedSubscript:](v24->_weightNameBufferMap, "objectForKeyedSubscript:", v20);
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      objc_msgSend(objc_retainAutorelease(v16), "mutableBytes");
      if (espresso_network_bind_buffer_to_global())
      {
        v7 = objc_alloc(MEMORY[0x24BDD1540]);
        v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", location, 74, 0);
        *v22 = v8;
        v25 = 0;
        v17 = 1;
      }
      else
      {
        v17 = 0;
      }
      objc_storeStrong(&v16, 0);
      if (v17)
        goto LABEL_14;
      ++v12;
      if (v10 + 1 >= v13)
      {
        v12 = 0;
        v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
        if (!v13)
          goto LABEL_13;
      }
    }
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", location, 74, 0);
    *v22 = v6;
    v25 = 0;
    v17 = 1;
  }
  else
  {
LABEL_13:
    v17 = 0;
  }
LABEL_14:

  if (!v17)
  {
    v25 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
    v17 = 1;
  }
  objc_storeStrong(&location, 0);
  return v25;
}

- (id)getNewDeltasContainer:(id)a3 withError:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  NSArray *v27;
  uint64_t v28;
  int v29;
  unint64_t m;
  unint64_t v31;
  _QWORD v32[21];
  id v33;
  int v34;
  uint64_t k;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t j;
  id v41;
  uint64_t i;
  id v43;
  int v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD __b[8];
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id *v54;
  id location[2];
  AMDDODMLEspressoModel *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v56 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v54 = a4;
  v53 = 0;
  objc_storeStrong(&v53, a5);
  v52 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v51 = 0;
  memset(__b, 0, sizeof(__b));
  v27 = v56->_weightNames;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", __b, v66, 16);
  if (v28)
  {
    v22 = *(_QWORD *)__b[2];
    v23 = 0;
    v24 = v28;
    while (1)
    {
      v21 = v23;
      if (*(_QWORD *)__b[2] != v22)
        objc_enumerationMutation(v27);
      v50 = *(_QWORD *)(__b[1] + 8 * v23);
      v20 = -[NSDictionary objectForKey:](v56->_shortenedEmbeddingNames, "objectForKey:", v50);

      if (v20)
      {
        v48 = -[NSDictionary objectForKey:](v56->_shortenedEmbeddingSize, "objectForKey:", v50);
        v47 = -[NSDictionary objectForKey:](v56->_shortenedEmbeddingNumberVectorsBefore, "objectForKey:", v50);
        v46 = -[NSDictionary objectForKey:](v56->_shortenedEmbeddingNumberVectorsAfter, "objectForKey:", v50);
        v45 = -[NSDictionary objectForKey:](v56->_shortenedEmbeddingMappingKeys, "objectForKey:", v50);
        if (v48 && v47 && v46 && v45)
        {
          v43 = -[AMDDODMLAttachmentProcessor hashMapForKey:](v56->_attachmentProcessor, "hashMapForKey:", v45);
          if (v43)
          {
            for (i = 0; ; ++i)
            {
              v19 = i;
              if (v19 >= objc_msgSend(v47, "longValue"))
                break;
              v17 = v43;
              v18 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", i);
              v41 = (id)objc_msgSend(v17, "objectForKey:");

              if (v41)
              {
                for (j = 0; ; ++j)
                {
                  v16 = j;
                  if (v16 >= objc_msgSend(v48, "longValue"))
                    break;
                  v39 = 0;
                  v14 = v51;
                  v15 = objc_msgSend(v41, "longValue");
                  v9 = objc_msgSend(v48, "longValue");
                  v39 = v14 + 4 * v15 * v9 + 4 * j;
                  v38 = 0;
                  v63 = v39;
                  v62 = 4;
                  v64 = v39;
                  v65 = 4;
                  v36 = v39;
                  v37 = 4;
                  objc_msgSend(location[0], "getBytes:range:");
                  objc_msgSend(v52, "appendBytes:length:", &v38, 4);
                }
              }
              else
              {
                for (k = 0; ; ++k)
                {
                  v13 = k;
                  if (v13 >= objc_msgSend(v48, "longValue"))
                    break;
                  v34 = 0;
                  objc_msgSend(v52, "appendBytes:length:", &v34, 4);
                }
              }
              objc_storeStrong(&v41, 0);
            }
            v12 = objc_msgSend(v48, "longValue");
            v10 = objc_msgSend(v46, "longValue");
            v51 += 4 * v12 * v10;
            v44 = 0;
          }
          else
          {
            v7 = objc_alloc(MEMORY[0x24BDD1540]);
            v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v53, 124, 0);
            *v54 = v8;
            v57 = 0;
            v44 = 1;
          }
          objc_storeStrong(&v43, 0);
        }
        else
        {
          v5 = objc_alloc(MEMORY[0x24BDD1540]);
          v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v53, 123, 0);
          *v54 = v6;
          v57 = 0;
          v44 = 1;
        }
        objc_storeStrong(&v45, 0);
        objc_storeStrong(&v46, 0);
        objc_storeStrong(&v47, 0);
        objc_storeStrong(&v48, 0);
        if (v44)
          goto LABEL_35;
      }
      else
      {
        v33 = -[NSDictionary objectForKeyedSubscript:](v56->_weightNameBufferMap, "objectForKeyedSubscript:", v50);
        memset(v32, 0, sizeof(v32));
        objc_msgSend(v33, "getBytes:length:", v32, 168);
        v31 = v32[2] * v32[3] * v32[4] * v32[5];
        for (m = 0; m < v31; ++m)
        {
          v29 = 0;
          v59 = v51;
          v58 = 4;
          v60 = v51;
          v61 = 4;
          objc_msgSend(location[0], "getBytes:range:");
          objc_msgSend(v52, "appendBytes:length:", &v29, 4);
          v51 += 4;
        }
        objc_storeStrong(&v33, 0);
      }
      ++v23;
      if (v21 + 1 >= v24)
      {
        v23 = 0;
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", __b, v66, 16);
        if (!v24)
          break;
      }
    }
  }
  v44 = 0;
LABEL_35:

  if (!v44)
  {
    v57 = v52;
    v44 = 1;
  }
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
  return v57;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;
  uint64_t v4;
  SEL v5;
  AMDDODMLEspressoModel *v6;

  v6 = self;
  v5 = a2;
  if (self->_plan)
  {
    v4 = (int)espresso_plan_destroy();
    v3 = (int)espresso_context_destroy();
  }
  v2.receiver = v6;
  v2.super_class = (Class)AMDDODMLEspressoModel;
  -[AMDDODMLEspressoModel dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializeManually, 0);
  objc_storeStrong((id *)&self->_attachmentProcessor, 0);
  objc_storeStrong((id *)&self->_shortenedEmbeddingMappingKeys, 0);
  objc_storeStrong((id *)&self->_shortenedEmbeddingSize, 0);
  objc_storeStrong((id *)&self->_shortenedEmbeddingNumberVectorsAfter, 0);
  objc_storeStrong((id *)&self->_shortenedEmbeddingNumberVectorsBefore, 0);
  objc_storeStrong((id *)&self->_shortenedEmbeddingNames, 0);
  objc_storeStrong((id *)&self->_lossName, 0);
  objc_storeStrong((id *)&self->_learningRateBufferName, 0);
  objc_storeStrong((id *)&self->_trainingModeBufferName, 0);
  objc_storeStrong((id *)&self->_metricNames, 0);
  objc_storeStrong((id *)&self->_learningRate, 0);
  objc_storeStrong((id *)&self->_weightNameBufferMap, 0);
  objc_storeStrong((id *)&self->_weightNames, 0);
  objc_storeStrong((id *)&self->_outputNameBufferMap, 0);
  objc_storeStrong((id *)&self->_inputNameBufferMap, 0);
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_modelPath, 0);
}

@end
