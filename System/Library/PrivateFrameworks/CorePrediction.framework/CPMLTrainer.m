@implementation CPMLTrainer

- (id)getSolution
{
  void *v3;
  double *v4;
  unint64_t v5;
  void *v6;
  void *__p;
  _BYTE *v9;

  (*((void (**)(CPMLAlgorithm *, SEL))self->cpMLAlgo->var0 + 4))(self->cpMLAlgo, a2);
  NSLog(CFSTR("getting solution ..."));
  __p = 0;
  v9 = 0;
  (*((void (**)(CPMLAlgorithm *, void **))self->cpMLAlgo->var0 + 12))(self->cpMLAlgo, &__p);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double *)__p;
  if (v9 != __p)
  {
    v5 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4[v5]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      ++v5;
      v4 = (double *)__p;
    }
    while (v5 < (v9 - (_BYTE *)__p) >> 3);
  }
  if (__p)
  {
    if (v9 != __p)
      v9 += ((_BYTE *)__p - v9 + 7) & 0xFFFFFFFFFFFFFFF8;
    operator delete(__p);
  }
  return v3;
}

- (id)init:(id)a3 withModelDBPath:(id)a4 withPropertyList:(id)a5
{
  id v9;
  char *v10;
  CPMLLog *v11;
  void *v12;
  void *v13;
  _QWORD *CPMLLog;
  uint64_t v15;
  void *v16;
  sqlite3 **v17;
  char *v18;
  CPMLSchema *v19;
  void *v20;
  CPMLTunableData *v21;
  CPMLDBSerialization *v22;
  uint64_t v23;
  CPMLRemapper *v24;
  CPMLCDB *v25;
  unint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  void *v36;
  char v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  char v45;
  id v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  objc_super v63;
  char v64[30];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v55 = a3;
  v56 = a4;
  v9 = a5;
  v63.receiver = self;
  v63.super_class = (Class)CPMLTrainer;
  v10 = -[CPMLTrainer init](&v63, sel_init);
  if (!v10)
    goto LABEL_48;
  objc_msgSend(v9, "objectForKey:", CFSTR("loggingMode"));
  v11 = (CPMLLog *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11
    || (v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.cpml")),
        objc_msgSend(v13, "objectForKey:", CFSTR("loggingMode")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12))
  {
    CPMLLog = CPMLLog::getCPMLLog(v11);
    CPMLLog[10] = objc_msgSend(v12, "longLongValue");
  }
  v10[8] = 0;
  objc_storeStrong((id *)v10 + 4, a3);
  objc_msgSend(*((id *)v10 + 4), "getDelegate");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)*((_QWORD *)v10 + 15);
  *((_QWORD *)v10 + 15) = v15;

  objc_msgSend(*((id *)v10 + 4), "flushDB");
  if (!v56)
  {
    NSLog(CFSTR("Model name and path cannot be nil"));
    goto LABEL_9;
  }
  v54 = objc_retainAutorelease(v56);
  v17 = (sqlite3 **)(v10 + 16);
  if (!sqlite3_open((const char *)objc_msgSend(v54, "UTF8String"), (sqlite3 **)v10 + 2))
  {
    if (v9)
    {
      objc_storeStrong((id *)v10 + 3, a5);
      v19 = -[CPMLSchema initWithPlist:]([CPMLSchema alloc], "initWithPlist:", v9);
      v20 = (void *)*((_QWORD *)v10 + 8);
      *((_QWORD *)v10 + 8) = v19;

      v21 = (CPMLTunableData *)operator new();
      CPMLTunableData::CPMLTunableData(v21, *((void **)v10 + 3), (void *)objc_msgSend(*((id *)v10 + 8), "availableOptions"));
      *((_QWORD *)v10 + 11) = v21;
    }
    objc_msgSend(v9, "objectForKey:", CFSTR("mapFunction"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v10 + 24) = objc_msgSend(v49, "isEqualToString:", CFSTR("MAP_NORMALIZE"));
    objc_msgSend(v9, "objectForKey:", CFSTR("serializeFunction"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v50, "isEqualToString:", CFSTR("PMML")) & 1) != 0)
    {
      NSLog(CFSTR("PMML NOT IMPLEMENTED"));
    }
    else if (objc_msgSend(v50, "isEqualToString:", CFSTR("MMAP")))
    {
      NSLog(CFSTR("MMAP NOT IMPLEMENTED"));
    }
    else
    {
      v22 = (CPMLDBSerialization *)operator new();
      CPMLDBSerialization::CPMLDBSerialization(v22, *v17, 0);
      *((_QWORD *)v10 + 10) = v22;
    }
    v23 = operator new();
    CPMLStatistics::CPMLStatistics(v23, *((_QWORD *)v10 + 4), *((unsigned int *)v10 + 24));
    *((_QWORD *)v10 + 9) = v23;
    v24 = (CPMLRemapper *)operator new();
    CPMLRemapper::CPMLRemapper(v24, *((sqlite3 **)v10 + 2), *((CPMLStatistics **)v10 + 9), 0);
    *((_QWORD *)v10 + 7) = v24;
    v25 = (CPMLCDB *)operator new();
    CPMLCDB::CPMLCDB(v25, (sqlite3 *)objc_msgSend(*((id *)v10 + 4), "db"), *((sqlite3 **)v10 + 2), *((CPMLRemapper **)v10 + 7), *((CPMLTunableData **)v10 + 11));
    v26 = 0;
    *((_QWORD *)v10 + 5) = v25;
    v25->var0 = (CPMLStatistics *)*((_QWORD *)v10 + 9);
    while (v26 < objc_msgSend(*((id *)v10 + 8), "getTotalAttributes"))
    {
      objc_msgSend(*((id *)v10 + 8), "getUserDefinedCategoricalData:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v28 = v27;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      if (v29)
      {
        v30 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v60 != v30)
              objc_enumerationMutation(v28);
            CPMLRemapper::remap(*((CPMLRemapper **)v10 + 7), (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i)), "cStringUsingEncoding:", 4), v26);
          }
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
        }
        while (v29);
      }

      ++v26;
    }
    objc_msgSend(*((id *)v10 + 3), "objectForKey:", CFSTR("machineLearningAlgorithm"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "buildTrainingMachineLearningAlgorithm:");
    v32 = *((_QWORD *)v10 + 6);
    if (v32 && (*(unsigned int (**)(uint64_t))(*(_QWORD *)v32 + 56))(v32))
      CPMLStatistics::updateAllColumnTypeToReal(*((CPMLStatistics **)v10 + 9));
    CPMLsql_createTable(*v17, "cacheString", "keyValue TEXT, indexValue INTEGER", 0);
    v33 = objc_msgSend(*((id *)v10 + 8), "getTotalAttributes");
    if (v33 >= 1)
    {
      v34 = 0;
      v35 = -v33;
      do
      {
        sprintf(v64, "\"EMPTY\",%d", v34 - 10);
        CPMLsql_insertIntoTable(*v17, "cacheString", "keyValue, indexValue", v64);
        --v34;
      }
      while (v35 != v34);
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "fileExistsAtPath:", v54);

    objc_msgSend(v9, "objectForKey:", CFSTR("FileProtection"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    objc_msgSend(v38, "attributesOfItemAtPath:error:", v54, &v58);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v58;

    v40 = *MEMORY[0x24BDD0CF0];
    objc_msgSend(v52, "objectForKey:", *MEMORY[0x24BDD0CF0]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileProtectionClassRequest:", v53);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "isEqualToString:", v41))
    {
      if (v41)
        v42 = v37;
      else
        v42 = 1;
      if ((v42 & 1) != 0)
        goto LABEL_45;
    }
    else if (!v41)
    {
LABEL_45:
      if (v10[8])
      {
        NSLog(CFSTR("%s Failed"), "-[CPMLTrainer init:withModelDBPath:withPropertyList:]");

        goto LABEL_10;
      }

LABEL_48:
      v18 = v10;
      goto LABEL_49;
    }
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v41, v40);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v39;
    v45 = objc_msgSend(v44, "setAttributes:ofItemAtPath:error:", v43, v54, &v57);
    v46 = v57;

    if ((v45 & 1) == 0)
      NSLog(CFSTR("%s: Could not set file protection to NSFileProtectionComplete\n"), "-[CPMLTrainer init:withModelDBPath:withPropertyList:]");

    v39 = v46;
    goto LABEL_45;
  }
  NSLog(CFSTR("Cannot open %@"), v54);
  sqlite3_close(*v17);
LABEL_9:

LABEL_10:
  v18 = 0;
LABEL_49:

  return v18;
}

- (void)dealloc
{
  CPMLRemapper *cpRemapper;
  CPMLCDB *cpCDB;
  CPMLSerialization *trainerCPSerializer;
  CPMLAlgorithm *cpMLAlgo;
  CPMLTunableData *cpTuneableData;
  CPMLStatistics *trainerCPStatistics;
  objc_super v9;

  cpRemapper = (CPMLRemapper *)self->cpRemapper;
  if (cpRemapper)
  {
    CPMLRemapper::~CPMLRemapper(cpRemapper);
    MEMORY[0x20BD188E4]();
  }
  cpCDB = self->cpCDB;
  if (cpCDB)
  {
    CPMLCDB::~CPMLCDB(cpCDB);
    MEMORY[0x20BD188E4]();
  }
  trainerCPSerializer = self->trainerCPSerializer;
  if (trainerCPSerializer)
    (*((void (**)(CPMLSerialization *, SEL))trainerCPSerializer->var0 + 1))(trainerCPSerializer, a2);
  cpMLAlgo = self->cpMLAlgo;
  if (cpMLAlgo)
    (*((void (**)(CPMLAlgorithm *, SEL))cpMLAlgo->var0 + 1))(cpMLAlgo, a2);
  cpTuneableData = self->cpTuneableData;
  if (cpTuneableData)
    MEMORY[0x20BD188E4](cpTuneableData, 0x1080C40C4643742);
  trainerCPStatistics = (CPMLStatistics *)self->trainerCPStatistics;
  if (trainerCPStatistics)
  {
    CPMLStatistics::~CPMLStatistics(trainerCPStatistics);
    MEMORY[0x20BD188E4]();
  }
  v9.receiver = self;
  v9.super_class = (Class)CPMLTrainer;
  -[CPMLTrainer dealloc](&v9, sel_dealloc);
}

- (id)fileProtectionClassRequest:(id)a3
{
  id v3;
  id *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NSFileProtectionCompleteUntilFirstUserAuthentication")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDD0CE0];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NSFileProtectionCompleteUnlessOpen")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDD0CD8];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NSFileProtectionComplete")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDD0CD0];
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("NSFileProtectionNone")))
    {
      v5 = 0;
      goto LABEL_10;
    }
    v4 = (id *)MEMORY[0x24BDD0CF8];
  }
  v5 = *v4;
LABEL_10:

  return v5;
}

- (void)train:(BOOL)a3
{
  NSObject *v5;
  CPMLDB *cpmlDB;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  BOOL v10;

  -[CPMLDB getDispatchQueue](self->cpmlDB, "getDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (*((int *)self->trainerCPStatistics + 31) <= 0)
  {
    NSLog(CFSTR("train column statistics empty"));
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __21__CPMLTrainer_train___block_invoke;
    block[3] = &unk_24C2560E8;
    block[4] = self;
    v10 = a3;
    dispatch_sync(v5, block);
    cpmlDB = self->cpmlDB;
    -[NSDictionary objectForKey:](self->modelPlist, "objectForKey:", CFSTR("clearTrainingValueTrainingPhase"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    -[CPMLDB removeTrainingRowData:](cpmlDB, "removeTrainingRowData:");

  }
}

uint64_t __21__CPMLTrainer_train___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80) + 232))(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                  + 80));
  (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 48) + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                 + 48));
  if (*(_BYTE *)(a1 + 40))
  {
    CPModelClose(*(void **)(*(_QWORD *)(a1 + 32) + 40));
    (*(void (**)(_QWORD, uint64_t, const char *, uint64_t, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80)
                                                                           + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 120, "cptrainRows", 1, 0);
    (*(void (**)(_QWORD, uint64_t, const char *, uint64_t, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80)
                                                                           + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 124, "cptrainColumns", 1, 0);
    (*(void (**)(_QWORD, uint64_t, const char *, uint64_t, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80)
                                                                           + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 128, "cptrainyCol", 1, 0);
    (*(void (**)(_QWORD, _QWORD, const char *, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80)
                                                                         + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 72), "cpContinousData", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 124), 0);
    (*(void (**)(_QWORD, _QWORD, const char *, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80)
                                                                         + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 96), "cpValRemap", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 124), 0);
    (*(void (**)(_QWORD, _QWORD, const char *, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80)
                                                                         + 48))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 144), "cptrainCard", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 124), 0);
    (*(void (**)(_QWORD, _QWORD, const char *, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80)
                                                                         + 48))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 168), "cptrainMean", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 124), 0);
    (*(void (**)(_QWORD, _QWORD, const char *, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80)
                                                                         + 48))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 192), "cpSTDev", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 124), 0);
    (*(void (**)(_QWORD, _QWORD, const char *, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80)
                                                                         + 48))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 216), "cpMin", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 124), 0);
    (*(void (**)(_QWORD, _QWORD, const char *, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80)
                                                                         + 48))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 240), "cpMax", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 124), 0);
    (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 48) + 32))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  }
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80) + 240))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)buildTrainingMachineLearningAlgorithm:(id)a3
{
  CPMLOnlineSvm *v4;
  CPMLAlgorithm *cpMLAlgo;
  CPMLStorageManager *v6;
  CPMLStorageManager *v7;
  CPMLStorageManager *v8;
  CPMLUserDefinedAlgorithm *v9;
  CPMLDelegateEngine *v10;
  CPMLNaiveBayesClassifierBase *v11;
  CPMLNaiveBayesStorageManager *v12;
  CPMLStorageManager *storageManager;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("SVM")))
  {
    v4 = (CPMLOnlineSvm *)operator new();
    CPMLOnlineSvm::CPMLOnlineSvm(v4, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
LABEL_15:
    self->cpMLAlgo = (CPMLAlgorithm *)v4;
    goto LABEL_16;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("LIBSVM")))
  {
    v4 = (CPMLOnlineSvm *)operator new();
    CPMLLIBSVMClassifier::CPMLLIBSVMClassifier(v4, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
    goto LABEL_15;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("LINEARSVM")))
  {
    v4 = (CPMLOnlineSvm *)operator new();
    CPMLLINEARSVMClassifier::CPMLLINEARSVMClassifier(v4, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
    goto LABEL_15;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("NB")))
  {
    v4 = (CPMLOnlineSvm *)operator new();
    CPMLNaiveBayesSuggestionsClassifier::CPMLNaiveBayesSuggestionsClassifier(v4, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
    goto LABEL_15;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("NB_BASE")))
  {
    v4 = (CPMLOnlineSvm *)operator new();
    CPMLNaiveBayesClassifier::CPMLNaiveBayesClassifier(v4, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
    goto LABEL_15;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("NAIVE_BAYES")))
  {
    v4 = (CPMLOnlineSvm *)operator new();
    CPNaiveBayesClassifier::CPNaiveBayesClassifier(v4, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
    goto LABEL_15;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("NAIVE_BAYESV2")))
  {
    v4 = (CPMLOnlineSvm *)operator new();
    CPNaiveBayesV2Classifier::CPNaiveBayesV2Classifier(v4, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
    goto LABEL_15;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("NAIVEBAYES")))
  {
    v11 = (CPMLNaiveBayesClassifierBase *)operator new();
    CPMLNaiveBayesClassifierBase::CPMLNaiveBayesClassifierBase(v11, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
    self->cpMLAlgo = (CPMLAlgorithm *)v11;
    v12 = objc_alloc_init(CPMLNaiveBayesStorageManager);
    storageManager = self->_storageManager;
    self->_storageManager = &v12->super;

  }
  else
  {
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("KMEANS")))
    {
      v4 = (CPMLOnlineSvm *)operator new();
      CPMLKMeans::CPMLKMeans(v4, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
      goto LABEL_15;
    }
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("KNN")))
    {
      v4 = (CPMLOnlineSvm *)operator new();
      CPKNNClassfier::CPKNNClassfier(v4, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
      goto LABEL_15;
    }
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("LOGISTIC_REGRESSION")))
    {
      v4 = (CPMLOnlineSvm *)operator new();
      CPLogisticRegressionClassfier::CPLogisticRegressionClassfier(v4, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
      goto LABEL_15;
    }
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("REGRESSION_FOREST")))
    {
      v4 = (CPMLOnlineSvm *)operator new();
      CPRegressionForestClassfier::CPRegressionForestClassfier(v4, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
      goto LABEL_15;
    }
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("GAUSSIAN_MIXTURE_MODEL")))
    {
      v4 = (CPMLOnlineSvm *)operator new();
      CPGMMClassfier::CPGMMClassfier(v4, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
      goto LABEL_15;
    }
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("LINEAR_REGRESSION")))
    {
      v4 = (CPMLOnlineSvm *)operator new();
      CPLinearRegressionClassfier::CPLinearRegressionClassfier(v4, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
      goto LABEL_15;
    }
    NSLog(CFSTR("%s No ML ALGO Selected!"), "-[CPMLTrainer buildTrainingMachineLearningAlgorithm:]");
    self->shouldFail = 1;
    self->cpMLAlgo = 0;
  }
LABEL_16:
  if (self->_theDelegate)
  {
    cpMLAlgo = self->cpMLAlgo;
    if (cpMLAlgo)
      (*((void (**)(CPMLAlgorithm *))cpMLAlgo->var0 + 1))(cpMLAlgo);
    v6 = self->_storageManager;
    if (!v6)
    {
      v7 = objc_alloc_init(CPMLStorageManager);
      v8 = self->_storageManager;
      self->_storageManager = v7;

      v6 = self->_storageManager;
    }
    -[CPMLAlgorithmProtocol initCPMLAlgorithm:](self->_theDelegate, "initCPMLAlgorithm:", v6);
    v9 = (CPMLUserDefinedAlgorithm *)operator new();
    CPMLUserDefinedAlgorithm::CPMLUserDefinedAlgorithm(v9, self->cpCDB, self->trainerCPSerializer, self->cpTuneableData);
    self->cpMLAlgo = (CPMLAlgorithm *)v9;
    v10 = (CPMLDelegateEngine *)operator new();
    CPMLDelegateEngine::CPMLDelegateEngine(v10, self->_theDelegate, self->_storageManager);
    self->_cpmlDelegate = (CPMLDelegate *)v10;
    (*((void (**)(CPMLAlgorithm *, CPMLDelegateEngine *))self->cpMLAlgo->var0 + 9))(self->cpMLAlgo, v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theDelegate, 0);
  objc_storeStrong((id *)&self->_storageManager, 0);
  objc_storeStrong((id *)&self->cpmlSchema, 0);
  objc_storeStrong((id *)&self->cpmlDB, 0);
  objc_storeStrong((id *)&self->modelPlist, 0);
}

@end
