@implementation AMDDODMLModelMetadata

- (id)initModelMetadata:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  double v22;
  float v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  char v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  AMDDODMLModelMetadata *v85;
  id v86;
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
  id v97;
  id v98;
  id v99;
  id v100;
  id v101[2];
  uint64_t v102;
  uint64_t v103;
  id v104;
  id v105;
  id v106;
  id v107;
  int v108;
  id v109;
  objc_super v110;
  id v111;
  id *v112;
  id location[2];
  id v114;
  id v115;

  v114 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v112 = a4;
  v111 = 0;
  objc_storeStrong(&v111, a5);
  v5 = v114;
  v114 = 0;
  v110.receiver = v5;
  v110.super_class = (Class)AMDDODMLModelMetadata;
  v85 = -[AMDDODMLModelMetadata init](&v110, sel_init);
  v114 = v85;
  objc_storeStrong(&v114, v85);
  if (!v85)
    goto LABEL_82;
  v82 = (id)objc_msgSend(location[0], "parameters");
  v109 = (id)objc_msgSend(v82, "stringValueForKey:defaultValue:", ModelFileNameKey, 0);

  if (!v109)
  {
    v6 = objc_alloc(MEMORY[0x24BDD1540]);
    v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v111, 1, 0);
    *v112 = v7;
    v115 = 0;
    v108 = 1;
    goto LABEL_81;
  }
  v81 = (id)objc_msgSend(location[0], "attachments");
  v107 = (id)objc_msgSend(v81, "attachmentURLsForBasename:", v109);

  if (objc_msgSend(v107, "count"))
  {
    if ((unint64_t)objc_msgSend(v107, "count") > 1)
    {
      v10 = objc_alloc(MEMORY[0x24BDD1540]);
      v11 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v111, 3, 0);
      *v112 = v11;
      v115 = 0;
      v108 = 1;
      goto LABEL_80;
    }
    v79 = (id)objc_msgSend(v107, "objectAtIndexedSubscript:", 0);
    v78 = (id)objc_msgSend(v79, "path");
    objc_msgSend(v114, "setModelPath:");

    v80 = (id)objc_msgSend(location[0], "parameters");
    v106 = (id)objc_msgSend(v80, "objectForKeyedSubscript:", InputNamesKey);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v106, "count"))
    {
      v12 = objc_alloc(MEMORY[0x24BDD1540]);
      v13 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", v111, 4, 0);
      *v112 = v13;
      v115 = 0;
      v108 = 1;
LABEL_79:
      objc_storeStrong(&v106, 0);
      goto LABEL_80;
    }
    objc_msgSend(v114, "setInputNames:", v106);
    v77 = (id)objc_msgSend(location[0], "parameters");
    v105 = (id)objc_msgSend(v77, "objectForKeyedSubscript:", OutputNamesKey);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v105, "count"))
    {
      v14 = objc_alloc(MEMORY[0x24BDD1540]);
      v15 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v111, 5, 0);
      *v112 = v15;
      v115 = 0;
      v108 = 1;
LABEL_78:
      objc_storeStrong(&v105, 0);
      goto LABEL_79;
    }
    objc_msgSend(v114, "setOutputNames:", v105);
    v76 = (id)objc_msgSend(location[0], "parameters");
    v104 = (id)objc_msgSend(v76, "objectForKeyedSubscript:", WeightNamesKey);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v104, "count"))
    {
      v16 = objc_alloc(MEMORY[0x24BDD1540]);
      v17 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v111, 6, 0);
      *v112 = v17;
      v115 = 0;
      v108 = 1;
LABEL_77:
      objc_storeStrong(&v104, 0);
      goto LABEL_78;
    }
    objc_msgSend(v114, "setWeightNames:", v104);
    v74 = (id)objc_msgSend(location[0], "parameters");
    v75 = objc_msgSend(v74, "unsignedIntegerValueForKey:defaultValue:", BatchSizeKey, 1);

    v103 = v75;
    if (v75 < 1)
    {
      v18 = objc_alloc(MEMORY[0x24BDD1540]);
      v19 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v111, 7, 0);
      *v112 = v19;
      v115 = 0;
      v108 = 1;
      goto LABEL_77;
    }
    objc_msgSend(v114, "setBatchSize:", v103);
    v72 = (id)objc_msgSend(location[0], "parameters");
    v73 = objc_msgSend(v72, "unsignedIntegerValueForKey:defaultValue:", NumLocalIterationsKey, 1);

    v102 = v73;
    if (v73 < 1)
    {
      v20 = objc_alloc(MEMORY[0x24BDD1540]);
      v21 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v111, 8, 0);
      *v112 = v21;
      v115 = 0;
      v108 = 1;
      goto LABEL_77;
    }
    objc_msgSend(v114, "setNumLocalIterations:", v102);
    v68 = (id)objc_msgSend(location[0], "parameters");
    v69 = (void *)objc_msgSend(v68, "unsignedIntegerValueForKey:defaultValue:", NumEpochsKey, 0);

    v101[1] = v69;
    objc_msgSend(v114, "setNumEpochs:", v69);
    v70 = (void *)MEMORY[0x24BDD16E0];
    v71 = (id)objc_msgSend(location[0], "parameters");
    LODWORD(v22) = 0;
    objc_msgSend(v71, "floatValueForKey:defaultValue:", LearningRateKey, v22);
    v101[0] = (id)objc_msgSend(v70, "numberWithFloat:");

    objc_msgSend(v101[0], "floatValue");
    if (v23 < 0.0)
    {
      v24 = objc_alloc(MEMORY[0x24BDD1540]);
      v25 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v111, 9, 0);
      *v112 = v25;
      v115 = 0;
      v108 = 1;
LABEL_76:
      objc_storeStrong(v101, 0);
      goto LABEL_77;
    }
    objc_msgSend(v114, "setLearningRate:", v101[0]);
    v67 = (id)objc_msgSend(location[0], "parameters");
    v100 = (id)objc_msgSend(v67, "stringValueForKey:defaultValue:", InitFunctionNameKey, InitFunctionDefaultName);

    if (!objc_msgSend(v100, "length"))
    {
      v26 = objc_alloc(MEMORY[0x24BDD1540]);
      v27 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v111, 10, 0);
      *v112 = v27;
      v115 = 0;
      v108 = 1;
LABEL_75:
      objc_storeStrong(&v100, 0);
      goto LABEL_76;
    }
    objc_msgSend(v114, "setInitializationFunctionName:", v100);
    v66 = (id)objc_msgSend(location[0], "parameters");
    v99 = (id)objc_msgSend(v66, "stringValueForKey:defaultValue:", TrainingModeBufferNameKey, TrainingModeBufferDefaultName);

    if (!objc_msgSend(v99, "length"))
    {
      v28 = objc_alloc(MEMORY[0x24BDD1540]);
      v29 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v111, 11, 0);
      *v112 = v29;
      v115 = 0;
      v108 = 1;
LABEL_74:
      objc_storeStrong(&v99, 0);
      goto LABEL_75;
    }
    objc_msgSend(v114, "setTrainingModeBufferName:", v99);
    v65 = (id)objc_msgSend(location[0], "parameters");
    v98 = (id)objc_msgSend(v65, "stringValueForKey:defaultValue:", LearningRateBufferNameKey, LearningRateBufferDefaultName);

    if (!objc_msgSend(v98, "length"))
    {
      v30 = objc_alloc(MEMORY[0x24BDD1540]);
      v31 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v111, 12, 0);
      *v112 = v31;
      v115 = 0;
      v108 = 1;
LABEL_73:
      objc_storeStrong(&v98, 0);
      goto LABEL_74;
    }
    objc_msgSend(v114, "setLearningRateBufferName:", v98);
    v64 = (id)objc_msgSend(location[0], "parameters");
    v97 = (id)objc_msgSend(v64, "stringValueForKey:defaultValue:", LossNameKey, 0);

    if (!v97)
    {
      v32 = objc_alloc(MEMORY[0x24BDD1540]);
      v33 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v111, 18, 0);
      *v112 = v33;
      v115 = 0;
      v108 = 1;
LABEL_72:
      objc_storeStrong(&v97, 0);
      goto LABEL_73;
    }
    v62 = (id)objc_msgSend(v114, "outputNames");
    v63 = objc_msgSend(v62, "containsObject:", v97);

    if ((v63 & 1) == 0)
    {
      v34 = objc_alloc(MEMORY[0x24BDD1540]);
      v35 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v111, 19, 0);
      *v112 = v35;
      v115 = 0;
      v108 = 1;
      goto LABEL_72;
    }
    objc_msgSend(v114, "setLossName:", v97);
    v61 = (id)objc_msgSend(location[0], "parameters");
    v96 = (id)objc_msgSend(v61, "objectForKeyedSubscript:", InitializeManually);

    if (!v96)
    {
      v96 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);

    }
    objc_msgSend(v114, "setInitializeManually:", v96);
    v60 = (id)objc_msgSend(location[0], "parameters");
    v95 = (id)objc_msgSend(v60, "objectForKeyedSubscript:", UseCoreMLTrainer);

    if (!v95)
    {
      v95 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);

    }
    objc_msgSend(v114, "setUseCoreMLTrainer:", v95);
    v59 = (id)objc_msgSend(location[0], "parameters");
    v94 = (id)objc_msgSend(v59, "objectForKeyedSubscript:", LearningRateScheduleKey);

    if (v94)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v36 = objc_alloc(MEMORY[0x24BDD1540]);
        v37 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v111, 131, 0);
        *v112 = v37;
        v115 = 0;
        v108 = 1;
LABEL_71:
        objc_storeStrong(&v94, 0);
        objc_storeStrong(&v95, 0);
        objc_storeStrong(&v96, 0);
        goto LABEL_72;
      }
    }
    if (v94)
    {
      v58 = objc_msgSend(v94, "count");
      if (v58 != objc_msgSend(v114, "numLocalIterations"))
      {
        v38 = objc_alloc(MEMORY[0x24BDD1540]);
        v39 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v111, 132, 0);
        *v112 = v39;
        v115 = 0;
        v108 = 1;
        goto LABEL_71;
      }
    }
    objc_msgSend(v114, "setLearningRateSchedule:", v94);
    v53 = (id)objc_msgSend(location[0], "parameters");
    v93 = (id)objc_msgSend(v53, "objectForKeyedSubscript:", ShortenedEmbeddingNames);

    v54 = (id)objc_msgSend(location[0], "parameters");
    v92 = (id)objc_msgSend(v54, "objectForKeyedSubscript:", ShortenedEmbeddingMappingKeys);

    v55 = (id)objc_msgSend(location[0], "parameters");
    v91 = (id)objc_msgSend(v55, "objectForKeyedSubscript:", ShortenedEmbeddingSize);

    v56 = (id)objc_msgSend(location[0], "parameters");
    v90 = (id)objc_msgSend(v56, "objectForKeyedSubscript:", ShortenedEmbeddingNumberVectorsBefore);

    v57 = (id)objc_msgSend(location[0], "parameters");
    v89 = (id)objc_msgSend(v57, "objectForKeyedSubscript:", ShortenedEmbeddingNumberVectorsAfter);

    if (v93 || v92 || v91 || v90 || v89)
    {
      if (!v93
        || !v92
        || !v91
        || !v90
        || !v89
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v40 = objc_alloc(MEMORY[0x24BDD1540]);
        v41 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v111, 109, 0);
        *v112 = v41;
        v115 = 0;
        v108 = 1;
LABEL_70:
        objc_storeStrong(&v89, 0);
        objc_storeStrong(&v90, 0);
        objc_storeStrong(&v91, 0);
        objc_storeStrong(&v92, 0);
        objc_storeStrong(&v93, 0);
        goto LABEL_71;
      }
      objc_msgSend(v114, "setShortenedEmbeddingNames:", v93);
      objc_msgSend(v114, "setShortenedEmbeddingMappingKeys:", v92);
      objc_msgSend(v114, "setShortenedEmbeddingSize:", v91);
      objc_msgSend(v114, "setShortenedEmbeddingNumberVectorsBefore:", v90);
      objc_msgSend(v114, "setShortenedEmbeddingNumberVectorsAfter:", v89);
    }
    else
    {
      v48 = objc_alloc_init(MEMORY[0x24BDBCE70]);
      objc_msgSend(v114, "setShortenedEmbeddingNames:");

      v49 = objc_alloc_init(MEMORY[0x24BDBCE70]);
      objc_msgSend(v114, "setShortenedEmbeddingMappingKeys:");

      v50 = objc_alloc_init(MEMORY[0x24BDBCE70]);
      objc_msgSend(v114, "setShortenedEmbeddingSize:");

      v51 = objc_alloc_init(MEMORY[0x24BDBCE70]);
      objc_msgSend(v114, "setShortenedEmbeddingNumberVectorsBefore:");

      v52 = objc_alloc_init(MEMORY[0x24BDBCE70]);
      objc_msgSend(v114, "setShortenedEmbeddingNumberVectorsAfter:");

    }
    v47 = (id)objc_msgSend(location[0], "parameters");
    v88 = (id)objc_msgSend(v47, "objectForKeyedSubscript:", MetricsNamesKey);

    if (!v88 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v87 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v88);
      v86 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v105);
      if ((objc_msgSend(v87, "isSubsetOfSet:", v86) & 1) != 0)
      {
        objc_msgSend(v114, "setMetricsNames:", v88);
        v108 = 0;
      }
      else
      {
        v44 = objc_alloc(MEMORY[0x24BDD1540]);
        v45 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v111, 61, 0);
        *v112 = v45;
        v115 = 0;
        v108 = 1;
      }
      objc_storeStrong(&v86, 0);
      objc_storeStrong(&v87, 0);
    }
    else
    {
      v42 = objc_alloc(MEMORY[0x24BDD1540]);
      v43 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v111, 60, 0);
      *v112 = v43;
      v115 = 0;
      v108 = 1;
    }
    objc_storeStrong(&v88, 0);
    goto LABEL_70;
  }
  v8 = objc_alloc(MEMORY[0x24BDD1540]);
  v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", v111, 2, 0);
  *v112 = v9;
  v115 = 0;
  v108 = 1;
LABEL_80:
  objc_storeStrong(&v107, 0);
LABEL_81:
  objc_storeStrong(&v109, 0);
  if (!v108)
  {
LABEL_82:
    v115 = v114;
    v108 = 1;
  }
  objc_storeStrong(&v111, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v114, 0);
  return v115;
}

- (NSString)modelPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setModelPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)inputNames
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInputNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)outputNames
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutputNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)weightNames
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWeightNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (NSNumber)learningRate
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLearningRate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int64_t)numLocalIterations
{
  return self->_numLocalIterations;
}

- (void)setNumLocalIterations:(int64_t)a3
{
  self->_numLocalIterations = a3;
}

- (int64_t)numEpochs
{
  return self->_numEpochs;
}

- (void)setNumEpochs:(int64_t)a3
{
  self->_numEpochs = a3;
}

- (NSString)initializationFunctionName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInitializationFunctionName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)trainingModeBufferName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTrainingModeBufferName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)learningRateBufferName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLearningRateBufferName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)lossName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLossName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSArray)metricsNames
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMetricsNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSDictionary)shortenedEmbeddingNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setShortenedEmbeddingNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSDictionary)shortenedEmbeddingMappingKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setShortenedEmbeddingMappingKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSDictionary)shortenedEmbeddingNumberVectorsBefore
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setShortenedEmbeddingNumberVectorsBefore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSDictionary)shortenedEmbeddingNumberVectorsAfter
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setShortenedEmbeddingNumberVectorsAfter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSDictionary)shortenedEmbeddingSize
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setShortenedEmbeddingSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSNumber)initializeManually
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInitializeManually:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSNumber)useCoreMLTrainer
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUseCoreMLTrainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSArray)learningRateSchedule
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLearningRateSchedule:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learningRateSchedule, 0);
  objc_storeStrong((id *)&self->_useCoreMLTrainer, 0);
  objc_storeStrong((id *)&self->_initializeManually, 0);
  objc_storeStrong((id *)&self->_shortenedEmbeddingSize, 0);
  objc_storeStrong((id *)&self->_shortenedEmbeddingNumberVectorsAfter, 0);
  objc_storeStrong((id *)&self->_shortenedEmbeddingNumberVectorsBefore, 0);
  objc_storeStrong((id *)&self->_shortenedEmbeddingMappingKeys, 0);
  objc_storeStrong((id *)&self->_shortenedEmbeddingNames, 0);
  objc_storeStrong((id *)&self->_metricsNames, 0);
  objc_storeStrong((id *)&self->_lossName, 0);
  objc_storeStrong((id *)&self->_learningRateBufferName, 0);
  objc_storeStrong((id *)&self->_trainingModeBufferName, 0);
  objc_storeStrong((id *)&self->_initializationFunctionName, 0);
  objc_storeStrong((id *)&self->_learningRate, 0);
  objc_storeStrong((id *)&self->_weightNames, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_modelPath, 0);
}

@end
