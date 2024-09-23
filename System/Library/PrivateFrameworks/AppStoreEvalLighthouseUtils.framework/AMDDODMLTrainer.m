@implementation AMDDODMLTrainer

- (id)runTask:(id)a3 error:(id *)a4 errorDomain:(id)a5 dataProvider:(id)a6 attachmentProcessor:(id)a7
{
  AMDDODMLModelMetadata *v7;
  AMDDODMLEspressoModel *v8;
  id v9;
  id v10;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  int v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id *v25;
  id location[2];
  AMDDODMLTrainer *v27;
  id v28;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = a4;
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23 = 0;
  objc_storeStrong(&v23, a6);
  v22 = 0;
  objc_storeStrong(&v22, a7);
  v7 = [AMDDODMLModelMetadata alloc];
  v21 = -[AMDDODMLModelMetadata initModelMetadata:error:errorDomain:](v7, "initModelMetadata:error:errorDomain:", location[0], v25, v24);
  if (v21)
  {
    v8 = [AMDDODMLEspressoModel alloc];
    v19 = -[AMDDODMLEspressoModel initWithModelMetadata:withAttachmentProcessor:error:errorDomain:](v8, "initWithModelMetadata:withAttachmentProcessor:error:errorDomain:", v21, v22, v25, v24);
    if (v19)
    {
      v18 = objc_msgSend(v23, "numberOfIterationsPerEpoch:", objc_msgSend(v21, "batchSize"));
      if (v18)
      {
        v17 = objc_msgSend(v21, "numLocalIterations");
        if (objc_msgSend(v21, "numEpochs") > 0)
          v17 = objc_msgSend(v21, "numEpochs") * v18;
        v16 = (id)objc_msgSend(v19, "trainOnData:numLocalIterations:error:errorDomain:", v23, v17, v25, v24);
        if (v16)
          v28 = -[AMDDODMLTrainer taskResultFromDict:](v27, "taskResultFromDict:", v16);
        else
          v28 = 0;
        v20 = 1;
        objc_storeStrong(&v16, 0);
      }
      else
      {
        v9 = objc_alloc(MEMORY[0x24BDD1540]);
        v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v24, 127, 0);
        *v25 = v10;
        v28 = 0;
        v20 = 1;
      }
    }
    else
    {
      v28 = 0;
      v20 = 1;
    }
    objc_storeStrong(&v19, 0);
  }
  else
  {
    v28 = 0;
    v20 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  return v28;
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
