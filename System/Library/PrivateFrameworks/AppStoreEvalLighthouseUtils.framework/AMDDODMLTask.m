@implementation AMDDODMLTask

- (AMDDODMLTask)initWithErrorDomain:(id)a3
{
  id v3;
  AMDDODMLTask *v5;
  objc_super v6;
  id location[2];
  id v8;
  AMDDODMLTask *v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDDODMLTask;
  v5 = -[AMDDODMLTask init](&v6, sel_init);
  v8 = v5;
  objc_storeStrong(&v8, v5);
  if (v5)
  {
    objc_msgSend(v8, "setErrorDomain:", location[0]);
    v9 = (AMDDODMLTask *)v8;
  }
  else
  {
    v9 = 0;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v9;
}

- (id)performTask:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v13;
  id *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  AMDCoreMLTrainer *v21;
  id v22;
  id *v23;
  id v24;
  AMDCoreMLTrainer *v25;
  id v26;
  AMDCoreMLDataProvider *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  AMDCoreMLDataProvider *v32;
  id obj;
  id v34;
  id v35;
  AMDDODMLTrainer *v36;
  id v37;
  id *v38;
  id v39;
  AMDDODMLTrainer *v40;
  id v41;
  AMDDODMLEspressoDataProvider *v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  AMDDODMLEspressoDataProvider *v47;
  _BOOL4 v48;
  id v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id *v55;
  id v56;
  AMDDODMLModelMetadata *v57;
  id v58;
  id v59;
  id v60;
  id *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  AMDDODMLDataProcessor *v67;
  AMDDODMLDataProcessor *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  AMDDODMLAttachmentProcessor *v77;
  id v78;
  id v79;
  id *v80;
  NSString *v81;
  id v82;
  AMDDODMLAttachmentProcessor *v83;
  id v84;
  id v85;
  id *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  int v97;
  id v98;
  id v99;
  id *v100;
  id location[2];
  AMDDODMLTask *v102;
  id v103;

  v86 = a4;
  v102 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v100 = v86;
  v87 = (id)objc_msgSend(location[0], "parameters");
  v84 = v87;
  v85 = (id)objc_msgSend(v84, "objectForKeyedSubscript:", AttachmentInstructions);
  v99 = v85;

  v83 = [AMDDODMLAttachmentProcessor alloc];
  v82 = (id)objc_msgSend(location[0], "attachments");
  v78 = v82;
  v79 = v99;
  v80 = v86;
  v81 = -[AMDDODMLTask errorDomain](v102, "errorDomain");
  v76 = v81;
  v77 = -[AMDDODMLAttachmentProcessor initWithAttachmentURLs:withInstructions:error:errorDomain:](v83, "initWithAttachmentURLs:withInstructions:error:errorDomain:", v78, v99, v86);
  v98 = v77;

  if (v77)
  {
    v75 = (id)objc_msgSend(location[0], "parameters");
    v73 = v75;
    v74 = (id)objc_msgSend(v73, "objectForKeyedSubscript:", DataProcessing);
    v96 = v74;

    if (v96)
    {
      v68 = [AMDDODMLDataProcessor alloc];
      v67 = -[AMDDODMLDataProcessor initWithActionArray:withAttachmentProcessor:](v68, "initWithActionArray:withAttachmentProcessor:", v96, v98);
      v95 = v67;
      if (v67)
      {
        v60 = v95;
        v61 = v100;
        v62 = -[AMDDODMLTask errorDomain](v102, "errorDomain");
        v58 = v62;
        v59 = (id)objc_msgSend(v95, "processRecipe:errorDomain:", v100);
        v94 = v59;

        if (v94)
        {
          v57 = [AMDDODMLModelMetadata alloc];
          v54 = location[0];
          v55 = v100;
          v56 = -[AMDDODMLTask errorDomain](v102, "errorDomain");
          v52 = v56;
          v53 = -[AMDDODMLModelMetadata initModelMetadata:error:errorDomain:](v57, "initModelMetadata:error:errorDomain:", v54, v100);
          v93 = v53;

          v92 = 0;
          v51 = (id)objc_msgSend(v53, "useCoreMLTrainer");
          v49 = v51;
          v50 = objc_msgSend(v49, "longValue");
          v48 = v50 != 0;

          if (v50)
          {
            v32 = [AMDCoreMLDataProvider alloc];
            v31 = objc_msgSend(v95, "getInputSize");
            v30 = (id)objc_msgSend(v95, "getElementsInSampleDictionary");
            v28 = v30;
            v29 = (id)objc_msgSend(v95, "getInputDictionary");
            v26 = v29;
            v27 = -[AMDCoreMLDataProvider initWithInputs:featureSizeMap:inputDictionary:](v32, "initWithInputs:featureSizeMap:inputDictionary:", v31, v28);
            v89 = v27;

            v25 = objc_alloc_init(AMDCoreMLTrainer);
            v88 = v25;
            v21 = v25;
            v22 = location[0];
            v23 = v100;
            v24 = -[AMDDODMLTask errorDomain](v102, "errorDomain");
            v19 = v24;
            v20 = -[AMDCoreMLTrainer runTask:error:errorDomain:dataProvider:](v25, "runTask:error:errorDomain:dataProvider:", v22, v100);
            v10 = v20;
            v11 = v92;
            v92 = v10;

            v18 = 0;
            objc_storeStrong(&v88, 0);
            objc_storeStrong(&v89, 0);
          }
          else
          {
            v47 = [AMDDODMLEspressoDataProvider alloc];
            v46 = objc_msgSend(v95, "getInputSize");
            v45 = (id)objc_msgSend(v95, "getElementsInSampleDictionary");
            v43 = v45;
            v44 = (id)objc_msgSend(v95, "getInputDictionary");
            v41 = v44;
            v42 = -[AMDDODMLEspressoDataProvider initWithInputs:featureSizeMap:inputDictionary:](v47, "initWithInputs:featureSizeMap:inputDictionary:", v46, v43);
            v91 = v42;

            v40 = objc_alloc_init(AMDDODMLTrainer);
            v90 = v40;
            v36 = v40;
            v37 = location[0];
            v38 = v100;
            v39 = -[AMDDODMLTask errorDomain](v102, "errorDomain");
            v34 = v39;
            v35 = -[AMDDODMLTrainer runTask:error:errorDomain:dataProvider:attachmentProcessor:](v40, "runTask:error:errorDomain:dataProvider:attachmentProcessor:", v37, v100);
            v8 = v35;
            v9 = v92;
            v92 = v8;

            obj = 0;
            objc_storeStrong(&v90, 0);
            objc_storeStrong(&v91, 0);
          }
          if (v92)
          {
            v17 = (id)objc_msgSend(v92, "JSONResult");
            v16 = v17;
            NSLog(CFSTR("%@"), v16);

          }
          else
          {
            NSLog(CFSTR("result is nil"));
          }
          v14 = &v92;
          v103 = v92;
          v97 = 1;
          v15 = 0;
          objc_storeStrong(v14, 0);
          objc_storeStrong(&v93, v15);
        }
        else
        {
          v103 = 0;
          v97 = 1;
        }
        objc_storeStrong(&v94, 0);
      }
      else
      {
        v66 = objc_alloc(MEMORY[0x24BDD1540]);
        v65 = -[AMDDODMLTask errorDomain](v102, "errorDomain");
        v63 = v65;
        v64 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:");
        v6 = v64;
        v7 = v63;
        *v100 = v6;

        v103 = 0;
        v97 = 1;
      }
      objc_storeStrong(&v95, 0);
    }
    else
    {
      v72 = objc_alloc(MEMORY[0x24BDD1540]);
      v71 = -[AMDDODMLTask errorDomain](v102, "errorDomain");
      v69 = v71;
      v70 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:");
      v4 = v70;
      v5 = v69;
      *v100 = v4;

      v103 = 0;
      v97 = 1;
    }
    objc_storeStrong(&v96, 0);
  }
  else
  {
    v103 = 0;
    v97 = 1;
  }
  v13 = 0;
  objc_storeStrong(&v98, 0);
  objc_storeStrong(&v99, v13);
  objc_storeStrong(location, 0);
  return v103;
}

- (NSString)errorDomain
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setErrorDomain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

@end
