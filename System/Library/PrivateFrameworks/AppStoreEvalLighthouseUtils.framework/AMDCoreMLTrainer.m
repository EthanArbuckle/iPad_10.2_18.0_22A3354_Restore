@implementation AMDCoreMLTrainer

- (id)runTask:(id)a3 error:(id *)a4 errorDomain:(id)a5 dataProvider:(id)a6
{
  AMDDODMLModelMetadata *v6;
  id v7;
  id v8;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  int v39;
  id v40;
  id v41;
  id v42;
  id *v43;
  id location[2];
  AMDCoreMLTrainer *v45;
  id v46;

  v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = a4;
  v42 = 0;
  objc_storeStrong(&v42, a5);
  v41 = 0;
  objc_storeStrong(&v41, a6);
  v6 = [AMDDODMLModelMetadata alloc];
  v40 = -[AMDDODMLModelMetadata initModelMetadata:error:errorDomain:](v6, "initModelMetadata:error:errorDomain:", location[0], v43, v42);
  if (v40)
  {
    v17 = (void *)MEMORY[0x24BDBCF48];
    v19 = (id)objc_msgSend(v40, "modelPath");
    v18 = (id)objc_msgSend(v17, "fileURLWithPath:");
    v38 = (id)objc_msgSend(v18, "URLByDeletingLastPathComponent");

    v37 = objc_alloc_init(MEMORY[0x24BDBFFD8]);
    objc_msgSend(v37, "setComputeUnits:", 0);
    v36 = (id)objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", v38, v37, v43);
    if (v36)
    {
      v14 = objc_alloc(MEMORY[0x24BDC0020]);
      v16 = (id)objc_msgSend(v36, "program");
      v15 = (id)objc_msgSend(v40, "learningRate");
      objc_msgSend(v15, "doubleValue");
      v35 = (id)objc_msgSend(v14, "initWithProgram:learningRate:error:", v16, v43);

      if (v35)
      {
        v34 = objc_msgSend(v41, "numberOfIterationsPerEpoch:", objc_msgSend(v40, "batchSize"));
        if (v34)
        {
          v33 = objc_msgSend(v40, "numLocalIterations");
          v12 = (id)objc_msgSend(v40, "learningRateSchedule");
          v13 = 0;
          if (!v12)
            v13 = objc_msgSend(v40, "numEpochs") > 0;

          if (v13)
            v33 = objc_msgSend(v40, "numEpochs") * v34;
          v32 = -[AMDCoreMLTrainer computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:](v45, "computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:", v40, v35, v33, v43, v42, v41, 0);
          if (v32)
          {
            v31 = -[AMDCoreMLTrainer computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:](v45, "computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:", v40, v35, v33, v43, v42, v41, 1);
            if (v31)
            {
              v30 = (id)objc_msgSend(v35, "copyCurrentTrainingDelta");
              v29 = (id)objc_msgSend(v30, "flattenedModelUpdate");
              v28 = -[AMDCoreMLTrainer computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:](v45, "computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:", v40, v35, v33, v43, v42, v41, 2);
              if (v28)
              {
                v27 = (id)objc_msgSend(v32, "objectForKey:", LossBeforeEachLocalIteration);
                v26 = (id)objc_msgSend(v28, "objectForKey:", LossAfterEachLocalIteration);
                v25 = (id)objc_msgSend(v31, "objectForKey:", LossDuringEachLocalIteration);
                v24 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                objc_msgSend(v24, "addEntriesFromDictionary:", v32);
                objc_msgSend(v24, "addEntriesFromDictionary:", v31);
                objc_msgSend(v24, "addEntriesFromDictionary:", v28);
                objc_msgSend(v24, "removeObjectForKey:", LossBeforeEachLocalIteration);
                objc_msgSend(v24, "removeObjectForKey:", LossDuringEachLocalIteration);
                objc_msgSend(v24, "removeObjectForKey:", LossAfterEachLocalIteration);
                v23 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                objc_msgSend(v23, "setObject:forKey:", v29, ModelDeltas);
                v10 = v23;
                v11 = (id)objc_msgSend(v40, "weightNames");
                objc_msgSend(v10, "setObject:forKey:");

                objc_msgSend(v23, "setObject:forKey:", v27, LossBeforeEachLocalIteration);
                objc_msgSend(v23, "setObject:forKey:", v25, LossDuringEachLocalIteration);
                objc_msgSend(v23, "setObject:forKey:", v26, LossAfterEachLocalIteration);
                objc_msgSend(v23, "setObject:forKey:", v24, ModelMetrics);
                v46 = -[AMDCoreMLTrainer taskResultFromDict:](v45, "taskResultFromDict:", v23);
                v39 = 1;
                objc_storeStrong(&v23, 0);
                objc_storeStrong(&v24, 0);
                objc_storeStrong(&v25, 0);
                objc_storeStrong(&v26, 0);
                objc_storeStrong(&v27, 0);
              }
              else
              {
                v46 = 0;
                v39 = 1;
              }
              objc_storeStrong(&v28, 0);
              objc_storeStrong(&v29, 0);
              objc_storeStrong(&v30, 0);
            }
            else
            {
              v46 = 0;
              v39 = 1;
            }
            objc_storeStrong(&v31, 0);
          }
          else
          {
            v46 = 0;
            v39 = 1;
          }
          objc_storeStrong(&v32, 0);
        }
        else
        {
          v7 = objc_alloc(MEMORY[0x24BDD1540]);
          v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v42, 127, 0);
          *v43 = v8;
          v46 = 0;
          v39 = 1;
        }
      }
      else
      {
        v46 = 0;
        v39 = 1;
      }
      objc_storeStrong(&v35, 0);
    }
    else
    {
      v46 = 0;
      v39 = 1;
    }
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
  }
  else
  {
    v46 = 0;
    v39 = 1;
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
  return v46;
}

- (id)computeAndGetMetrics:(id)a3 programTrainer:(id)a4 numIterationsToTrain:(int64_t)a5 error:(id *)a6 errorDomain:(id)a7 dataProvider:(id)a8 localTrainingStage:(unint64_t)a9
{
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  int v20;
  double v21;
  void *v22;
  id v23;
  id v25;
  id v26;
  id v27;
  id v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  BOOL v52;
  id v53;
  id v59;
  id v60;
  int v61;
  id v62;
  _QWORD __b[8];
  id v64;
  id v65;
  id v66;
  id v67;
  int v68;
  id v69;
  int i;
  id v71;
  id v72;
  id v73;
  unint64_t v74;
  id v75;
  id v76;
  id *v77;
  int64_t v78;
  id v79;
  id location[3];
  id v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v79 = 0;
  objc_storeStrong(&v79, a4);
  v78 = a5;
  v77 = a6;
  v76 = 0;
  objc_storeStrong(&v76, a7);
  v75 = 0;
  objc_storeStrong(&v75, a8);
  v74 = a9;
  v73 = 0;
  v72 = 0;
  if (a9 == 1)
  {
    objc_storeStrong(&v73, LossDuringEachLocalIteration);
    objc_storeStrong(&v72, DuringIterationMetricsSuffix);
  }
  else if (v74)
  {
    if (v74 == 2)
    {
      objc_storeStrong(&v73, LossAfterEachLocalIteration);
      objc_storeStrong(&v72, AfterIterationMetricsSuffix);
    }
  }
  else
  {
    objc_storeStrong(&v73, LossBeforeEachLocalIteration);
    objc_storeStrong(&v72, BeforeIterationMetricsSuffix);
  }
  v71 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 0);
  for (i = 0; i < v78; ++i)
  {
    v53 = v75;
    v9 = objc_msgSend(location[0], "batchSize");
    v69 = (id)objc_msgSend(v53, "fetchData:error:errorDomain:", v9, v77, v76);
    if (v69)
    {
      v10 = (id)objc_msgSend(location[0], "learningRateSchedule");
      v52 = v10 == 0;

      if (!v52)
      {
        v51 = (id)objc_msgSend(location[0], "learningRateSchedule");
        v50 = (id)objc_msgSend(v51, "objectAtIndexedSubscript:", i);
        objc_msgSend(v50, "doubleValue");
        objc_msgSend(v79, "setLearningRate:");

      }
      v67 = 0;
      if (v74 == 1)
      {
        v47 = v79;
        v46 = v69;
        v45 = (void *)MEMORY[0x24BDBCF20];
        v49 = (id)objc_msgSend(location[0], "metricsNames");
        v48 = (id)objc_msgSend(v45, "setWithArray:");
        v11 = (id)objc_msgSend(v47, "trainUsingTrainingData:evaluationMetricNames:error:", v46);
        v12 = v67;
        v67 = v11;

      }
      else
      {
        v42 = v79;
        v41 = v69;
        v40 = (void *)MEMORY[0x24BDBCF20];
        v44 = (id)objc_msgSend(location[0], "metricsNames");
        v43 = (id)objc_msgSend(v40, "setWithArray:");
        v13 = (id)objc_msgSend(v42, "evaluateUsingTestData:evaluationMetricNames:error:", v41);
        v14 = v67;
        v67 = v13;

      }
      if (v67)
      {
        objc_msgSend(v67, "loss");
        NSLog(CFSTR("Loss: %f"), v15);
        v66 = (id)objc_msgSend(v71, "valueForKey:", v73);
        if (!v66)
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
          v17 = v66;
          v66 = v16;

          objc_msgSend(v71, "setValue:forKey:", v66, v73);
        }
        v35 = v66;
        v34 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v67, "loss");
        v36 = (id)objc_msgSend(v34, "numberWithDouble:");
        objc_msgSend(v35, "addObject:");

        v37 = (id)objc_msgSend(v67, "evaluationMetrics");
        v65 = (id)objc_msgSend(v37, "featuresAtIndex:", 0);

        memset(__b, 0, sizeof(__b));
        v38 = (id)objc_msgSend(location[0], "metricsNames");
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", __b, v82, 16);
        if (v39)
        {
          v31 = *(_QWORD *)__b[2];
          v32 = 0;
          v33 = v39;
          while (1)
          {
            v30 = v32;
            if (*(_QWORD *)__b[2] != v31)
              objc_enumerationMutation(v38);
            v64 = *(id *)(__b[1] + 8 * v32);
            v62 = (id)objc_msgSend(v65, "featureValueForName:", v64);
            if (v62)
            {
              v61 = 0;
              v28 = (id)objc_msgSend(v62, "multiArrayValue");
              v27 = (id)objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
              objc_msgSend(v27, "floatValue");
              v29 = v20;

              v61 = v29;
              v60 = (id)objc_msgSend(v64, "stringByAppendingString:", v72);
              v59 = (id)objc_msgSend(v71, "valueForKey:", v60);
              if (!v59)
              {
                v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
                v23 = v59;
                v59 = v22;

                objc_msgSend(v71, "setValue:forKey:", v59, v60);
              }
              v25 = v59;
              LODWORD(v21) = v61;
              v26 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
              objc_msgSend(v25, "addObject:");

              objc_storeStrong(&v59, 0);
              objc_storeStrong(&v60, 0);
              v68 = 0;
            }
            else
            {
              v18 = objc_alloc(MEMORY[0x24BDD1540]);
              v19 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v76, 61, 0);
              *v77 = v19;
              v81 = 0;
              v68 = 1;
            }
            objc_storeStrong(&v62, 0);
            if (v68)
              break;
            ++v32;
            if (v30 + 1 >= v33)
            {
              v32 = 0;
              v33 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", __b, v82, 16);
              if (!v33)
                goto LABEL_32;
            }
          }
        }
        else
        {
LABEL_32:
          v68 = 0;
        }

        if (!v68)
          v68 = 0;
        objc_storeStrong(&v65, 0);
        objc_storeStrong(&v66, 0);
      }
      else
      {
        v81 = 0;
        v68 = 1;
      }
      objc_storeStrong(&v67, 0);
    }
    else
    {
      v81 = 0;
      v68 = 1;
    }
    objc_storeStrong(&v69, 0);
    if (v68)
      goto LABEL_40;
  }
  v81 = v71;
  v68 = 1;
LABEL_40:
  objc_storeStrong(&v71, 0);
  objc_storeStrong(&v72, 0);
  objc_storeStrong(&v73, 0);
  objc_storeStrong(&v75, 0);
  objc_storeStrong(&v76, 0);
  objc_storeStrong(&v79, 0);
  objc_storeStrong(location, 0);
  return v81;
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
