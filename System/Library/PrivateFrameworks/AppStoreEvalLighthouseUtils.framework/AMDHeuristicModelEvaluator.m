@implementation AMDHeuristicModelEvaluator

- (id)runTask:(id)a3 error:(id *)a4 errorDomain:(id)a5 dataProvider:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  int v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id *v42;
  id location[2];
  AMDHeuristicModelEvaluator *v44;
  id v45;

  v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v42 = a4;
  v41 = 0;
  objc_storeStrong(&v41, a5);
  v40 = 0;
  objc_storeStrong(&v40, a6);
  v22 = (id)objc_msgSend(location[0], "parameters");
  v39 = (id)objc_msgSend(v22, "stringValueForKey:defaultValue:", ModelFileNameKey, 0);

  v23 = (id)objc_msgSend(location[0], "attachments");
  v38 = (id)objc_msgSend(v23, "attachmentURLsForBasename:", v39);

  v24 = (void *)MEMORY[0x24BDBCF48];
  v26 = (id)objc_msgSend(v38, "objectAtIndexedSubscript:");
  v25 = (id)objc_msgSend(v26, "path");
  v37 = (id)objc_msgSend(v24, "fileURLWithPath:");

  v36 = objc_alloc_init(MEMORY[0x24BDBFFD8]);
  objc_msgSend(v36, "setComputeUnits:", 0);
  v35 = (id)objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", v37, v36, v42);
  if (v35)
  {
    v17 = (id)objc_msgSend(location[0], "parameters");
    v18 = objc_msgSend(v17, "unsignedIntegerValueForKey:defaultValue:", BatchSizeKey, 1);

    v33 = v18;
    if (v18 >= 1)
    {
      v16 = (id)objc_msgSend(location[0], "parameters");
      v32 = (id)objc_msgSend(v16, "objectForKeyedSubscript:", OutputNamesKey);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v32, "count"))
      {
        v15 = (id)objc_msgSend(location[0], "parameters");
        v31 = (id)objc_msgSend(v15, "objectForKeyedSubscript:", MetricsNamesKey);

        if (!v31 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v30 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v31);
          v29 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v32);
          if ((objc_msgSend(v30, "isSubsetOfSet:", v29) & 1) != 0)
          {
            v28 = -[AMDHeuristicModelEvaluator computeAndGetMetrics:model:error:errorDomain:dataProvider:metricNames:](v44, "computeAndGetMetrics:model:error:errorDomain:dataProvider:metricNames:", v33, v35, v42, v41, v40, v31);
            if (v28)
            {
              v27 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              objc_msgSend(v27, "setObject:forKey:", v28, ModelMetrics);
              v45 = -[AMDHeuristicModelEvaluator taskResultFromDict:](v44, "taskResultFromDict:", v27);
              v34 = 1;
              objc_storeStrong(&v27, 0);
            }
            else
            {
              v45 = 0;
              v34 = 1;
            }
            objc_storeStrong(&v28, 0);
          }
          else
          {
            v12 = objc_alloc(MEMORY[0x24BDD1540]);
            v13 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", v41, 61, 0);
            *v42 = v13;
            v45 = 0;
            v34 = 1;
          }
          objc_storeStrong(&v29, 0);
          objc_storeStrong(&v30, 0);
        }
        else
        {
          v10 = objc_alloc(MEMORY[0x24BDD1540]);
          v11 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v41, 60, 0);
          *v42 = v11;
          v45 = 0;
          v34 = 1;
        }
        objc_storeStrong(&v31, 0);
      }
      else
      {
        v8 = objc_alloc(MEMORY[0x24BDD1540]);
        v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", v41, 5, 0);
        *v42 = v9;
        v45 = 0;
        v34 = 1;
      }
      objc_storeStrong(&v32, 0);
    }
    else
    {
      v6 = objc_alloc(MEMORY[0x24BDD1540]);
      v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v41, 7, 0);
      *v42 = v7;
      v45 = 0;
      v34 = 1;
    }
  }
  else
  {
    v45 = 0;
    v34 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  return v45;
}

- (id)computeAndGetMetrics:(int64_t)a3 model:(id)a4 error:(id *)a5 errorDomain:(id)a6 dataProvider:(id)a7 metricNames:(id)a8
{
  id v8;
  id v9;
  int v10;
  double v11;
  void *v12;
  id v13;
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  id v30;
  int v31;
  id v32;
  _QWORD __b[8];
  uint64_t v34;
  id v35;
  id v36;
  int v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id *v43;
  id location;
  int64_t v45;
  SEL v46;
  AMDHeuristicModelEvaluator *v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v47 = self;
  v46 = a2;
  v45 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v43 = a5;
  v42 = 0;
  objc_storeStrong(&v42, a6);
  v41 = 0;
  objc_storeStrong(&v41, a7);
  v40 = 0;
  objc_storeStrong(&v40, a8);
  v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:");
  v38 = (id)objc_msgSend(v41, "fetchData:error:errorDomain:", v45, v43, v42);
  if (v38)
  {
    v36 = (id)objc_msgSend(location, "predictionsFromBatch:error:", v38, v43);
    if (v36)
    {
      v35 = (id)objc_msgSend(v36, "featuresAtIndex:", 0);
      memset(__b, 0, sizeof(__b));
      v24 = v40;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", __b, v49, 16);
      if (v25)
      {
        v21 = *(_QWORD *)__b[2];
        v22 = 0;
        v23 = v25;
        while (1)
        {
          v20 = v22;
          if (*(_QWORD *)__b[2] != v21)
            objc_enumerationMutation(v24);
          v34 = *(_QWORD *)(__b[1] + 8 * v22);
          v32 = (id)objc_msgSend(v35, "featureValueForName:", v34);
          if (v32)
          {
            v31 = 0;
            v18 = (id)objc_msgSend(v32, "multiArrayValue");
            v17 = (id)objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
            objc_msgSend(v17, "floatValue");
            v19 = v10;

            v31 = v19;
            v30 = (id)objc_msgSend(v39, "valueForKey:", v34);
            if (!v30)
            {
              v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
              v13 = v30;
              v30 = v12;

              objc_msgSend(v39, "setValue:forKey:", v30, v34);
            }
            v15 = v30;
            LODWORD(v11) = v31;
            v16 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
            objc_msgSend(v15, "addObject:");

            objc_storeStrong(&v30, 0);
            v37 = 0;
          }
          else
          {
            v8 = objc_alloc(MEMORY[0x24BDD1540]);
            v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", v42, 61, 0);
            *v43 = v9;
            v48 = 0;
            v37 = 1;
          }
          objc_storeStrong(&v32, 0);
          if (v37)
            break;
          ++v22;
          if (v20 + 1 >= v23)
          {
            v22 = 0;
            v23 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", __b, v49, 16);
            if (!v23)
              goto LABEL_17;
          }
        }
      }
      else
      {
LABEL_17:
        v37 = 0;
      }

      if (!v37)
      {
        v48 = v39;
        v37 = 1;
      }
      objc_storeStrong(&v35, 0);
    }
    else
    {
      v48 = 0;
      v37 = 1;
    }
    objc_storeStrong(&v36, 0);
  }
  else
  {
    v48 = 0;
    v37 = 1;
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&location, 0);
  return v48;
}

- (id)taskResultFromDict:(id)a3
{
  id v3;
  id v5;
  id v6;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)objc_msgSend(location[0], "mutableCopy");
  v6 = (id)objc_msgSend(v7, "objectForKeyedSubscript:", ModelDeltas);
  objc_msgSend(v7, "removeObjectForKey:", ModelDeltas);
  v3 = objc_alloc(MEMORY[0x24BE63328]);
  v5 = (id)objc_msgSend(v3, "initWithJSONResult:unprivatizedVector:", v7, v6);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

@end
