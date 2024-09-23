@implementation CPMLModelEvaluate

- (CPMLModelEvaluate)initWithModel:(id)a3 withPropertyList:(id)a4
{
  id v6;
  id v7;
  CPMLModelEvaluate *v8;
  CPMLModelEvaluate *v9;
  CPMLStorageManager *storageManager;
  CPMLAlgorithmProtocol *delegateAlgorithm;
  CPMLLog *v12;
  void *v13;
  void *v14;
  _QWORD *CPMLLog;
  void *v16;
  uint64_t v17;
  NSString *machineLearningAlgo;
  NSMutableArray *v19;
  NSMutableArray *modelSchema;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  CPMLSchema *v32;
  CPMLSchema *cpmlSchema;
  CPMLTunableData *v34;
  uint64_t v35;
  NSNumber *maxRemoveTrainingRow;
  id v37;
  sqlite3 **p_db;
  uint64_t v39;
  NSString *serializeFunction;
  CPMLDBSerialization *v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  int v46;
  void *v47;
  uint64_t v48;
  void *v49;
  int v50;
  _QWORD *trainerCPStatistics;
  _QWORD *v52;
  CPMLRemapper *v53;
  void *v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  void *v61;
  char v62;
  id v63;
  unint64_t v64;
  CPMLModelEvaluate *v65;
  void *v67;
  void *v68;
  char v69;
  id v70;
  id v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  objc_super v77;
  char v78[30];
  char v79[30];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v77.receiver = self;
  v77.super_class = (Class)CPMLModelEvaluate;
  v8 = -[CPMLModelEvaluate init](&v77, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_61;
  v8->shouldFail = 0;
  storageManager = v8->_storageManager;
  v8->_storageManager = 0;

  v9->_delegateEngine = 0;
  v9->_cpmlDelegate = 0;
  delegateAlgorithm = v9->_delegateAlgorithm;
  v9->_delegateAlgorithm = 0;

  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("loggingMode"));
    v12 = (CPMLLog *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12
      || (v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.cpml")),
          objc_msgSend(v14, "objectForKey:", CFSTR("loggingMode")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v13))
    {
      CPMLLog = CPMLLog::getCPMLLog(v12);
      CPMLLog[10] = objc_msgSend(v13, "longLongValue");
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v16, "fileExistsAtPath:", v6);

    objc_msgSend(v7, "objectForKey:", CFSTR("machineLearningAlgorithm"));
    v17 = objc_claimAutoreleasedReturnValue();
    machineLearningAlgo = v9->machineLearningAlgo;
    v9->machineLearningAlgo = (NSString *)v17;

    if ((v69 & 1) == 0
      && !-[NSString isEqualToString:](v9->machineLearningAlgo, "isEqualToString:", CFSTR("NB"))
      && !-[NSString isEqualToString:](v9->machineLearningAlgo, "isEqualToString:", CFSTR("NB_BASE"))
      && !-[NSString isEqualToString:](v9->machineLearningAlgo, "isEqualToString:", CFSTR("KNN")))
    {
      NSLog(CFSTR("%@ does not support update model. Please train a model."), v9->machineLearningAlgo);

      goto LABEL_59;
    }
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    modelSchema = v9->modelSchema;
    v9->modelSchema = v19;

    objc_msgSend(v7, "objectForKey:", CFSTR("schema"));
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v74 != v23)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "objectForKey:", CFSTR("HeaderDef"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v9->modelSchema, "addObject:", v25);

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
      }
      while (v22);
    }

    objc_msgSend(v7, "objectForKey:", CFSTR("mapFunction"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v9->mapFunction = objc_msgSend(v26, "isEqualToString:", CFSTR("MAP_NORMALIZE"));
    objc_msgSend(v7, "objectForKey:", CFSTR("keepInMemory"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      v9->keepInMemory = objc_msgSend(v27, "BOOLValue");
    else
      v9->keepInMemory = 1;
    objc_msgSend(v7, "objectForKey:", CFSTR("cacheString"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
      v31 = objc_msgSend(v29, "BOOLValue");
    else
      v31 = 0;
    v9->enableCacheString = v31;
    v32 = -[CPMLSchema initWithPlist:]([CPMLSchema alloc], "initWithPlist:", v7);
    cpmlSchema = v9->cpmlSchema;
    v9->cpmlSchema = v32;

    v34 = (CPMLTunableData *)operator new();
    CPMLTunableData::CPMLTunableData(v34, v7, -[CPMLSchema availableOptions](v9->cpmlSchema, "availableOptions"));
    v9->cpTuneableData = v34;
    objc_msgSend(v7, "objectForKey:", CFSTR("clearTrainingValueUpdatePhase"));
    v35 = objc_claimAutoreleasedReturnValue();
    maxRemoveTrainingRow = v9->maxRemoveTrainingRow;
    v9->maxRemoveTrainingRow = (NSNumber *)v35;

  }
  else
  {
    NSLog(CFSTR("NO DEFAULT PLIST YET"));
    v69 = 0;
  }
  if (!v6)
  {
    NSLog(CFSTR("ERROR No model path"));
    goto LABEL_59;
  }
  v37 = objc_retainAutorelease(v6);
  p_db = &v9->db;
  if (!sqlite3_open((const char *)objc_msgSend(v37, "UTF8String"), &v9->db))
  {
    v9->countRows = CPMLsql_getRowCountForTable(*p_db, "sqlite_master WHERE type=\"table\" AND name=\"INDEX0\";");
    objc_msgSend(v7, "objectForKey:", CFSTR("serializeFunction"));
    v39 = objc_claimAutoreleasedReturnValue();
    serializeFunction = v9->serializeFunction;
    v9->serializeFunction = (NSString *)v39;

    if (-[NSString isEqualToString:](v9->serializeFunction, "isEqualToString:", CFSTR("PMML")))
    {
      NSLog(CFSTR("PMML NOT IMPLEMENTED"));
    }
    else if (-[NSString isEqualToString:](v9->serializeFunction, "isEqualToString:", CFSTR("MMAP")))
    {
      NSLog(CFSTR("MMAP NOT IMPLEMENTED"));
    }
    else
    {
      v41 = (CPMLDBSerialization *)operator new();
      CPMLDBSerialization::CPMLDBSerialization(v41, *p_db, 1);
      v9->trainerCPDeSerializer = (CPMLSerialization *)v41;
      *((_BYTE *)v41 + 8) = v9->keepInMemory;
    }
    v72 = 0;
    if (v9->countRows)
    {
      (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, _QWORD))v9->trainerCPDeSerializer->var0
       + 8))(v9->trainerCPDeSerializer, (char *)&v72 + 4, "cptrainRows", 1, 0);
      (*((void (**)(CPMLSerialization *, uint64_t *, const char *, uint64_t, _QWORD))v9->trainerCPDeSerializer->var0
       + 8))(v9->trainerCPDeSerializer, &v72, "cptrainColumns", 1, 0);
      v42 = operator new();
      CPMLStatistics::CPMLStatistics(v42, v72, v9->mapFunction);
      v9->trainerCPStatistics = (void *)v42;
      *(_DWORD *)(v42 + 120) = HIDWORD(v72);
      (*((void (**)(CPMLSerialization *, uint64_t, const char *, uint64_t, _QWORD))v9->trainerCPDeSerializer->var0
       + 8))(v9->trainerCPDeSerializer, v42 + 128, "cptrainyCol", 1, 0);
      (*((void (**)(CPMLSerialization *, _QWORD, const char *, _QWORD, _QWORD))v9->trainerCPDeSerializer->var0
       + 8))(v9->trainerCPDeSerializer, *((_QWORD *)v9->trainerCPStatistics + 9), "cpContinousData", *((int *)v9->trainerCPStatistics + 31), 0);
      (*((void (**)(CPMLSerialization *, _QWORD, const char *, _QWORD, _QWORD))v9->trainerCPDeSerializer->var0
       + 8))(v9->trainerCPDeSerializer, *((_QWORD *)v9->trainerCPStatistics + 12), "cpValRemap", *((int *)v9->trainerCPStatistics + 31), 0);
      (*((void (**)(CPMLSerialization *, _QWORD, const char *, _QWORD, _QWORD))v9->trainerCPDeSerializer->var0
       + 12))(v9->trainerCPDeSerializer, *((_QWORD *)v9->trainerCPStatistics + 18), "cptrainCard", *((int *)v9->trainerCPStatistics + 31), 0);
      (*((void (**)(CPMLSerialization *, _QWORD, const char *, _QWORD, _QWORD))v9->trainerCPDeSerializer->var0
       + 12))(v9->trainerCPDeSerializer, *((_QWORD *)v9->trainerCPStatistics + 21), "cptrainMean", *((int *)v9->trainerCPStatistics + 31), 0);
      (*((void (**)(CPMLSerialization *, _QWORD, const char *, _QWORD, _QWORD))v9->trainerCPDeSerializer->var0
       + 12))(v9->trainerCPDeSerializer, *((_QWORD *)v9->trainerCPStatistics + 24), "cpSTDev", *((int *)v9->trainerCPStatistics + 31), 0);
      (*((void (**)(CPMLSerialization *, _QWORD, const char *, _QWORD, _QWORD))v9->trainerCPDeSerializer->var0
       + 12))(v9->trainerCPDeSerializer, *((_QWORD *)v9->trainerCPStatistics + 27), "cpMin", *((int *)v9->trainerCPStatistics + 31), 0);
      (*((void (**)(CPMLSerialization *, _QWORD, const char *, _QWORD, _QWORD))v9->trainerCPDeSerializer->var0
       + 12))(v9->trainerCPDeSerializer, *((_QWORD *)v9->trainerCPStatistics + 30), "cpMax", *((int *)v9->trainerCPStatistics + 31), 0);
    }
    else
    {
      CPMLsql_createTable(*p_db, "cptrainRows", "cptrainRows INTEGER", 0);
      CPMLsql_createTable(*p_db, "cptrainColumns", "cptrainColumns INTEGER", 0);
      CPMLsql_createTable(*p_db, "cptrainyCol", "cptrainyCol INTEGER", 0);
      CPMLsql_createTable(*p_db, "cpContinousData", "cpContinousData INTEGER", 0);
      CPMLsql_createTable(*p_db, "cpValRemap", "cpValRemap INTEGER", 0);
      CPMLsql_createTable(*p_db, "cptrainCard", "cptrainCard REAL", 0);
      CPMLsql_createTable(*p_db, "cptrainMean", "cptrainMean REAL", 0);
      CPMLsql_createTable(*p_db, "cpSTDev", "cpSTDev REAL", 0);
      CPMLsql_createTable(*p_db, "cpMin", "cpMin REAL", 0);
      CPMLsql_createTable(*p_db, "cpMax", "cpMax REAL", 0);
      CPMLsql_createTable(*p_db, "cacheString", "keyValue TEXT, indexValue INTEGER", 0);
      LODWORD(v72) = -[CPMLSchema getTotalAttributes](v9->cpmlSchema, "getTotalAttributes");
      sprintf(v79, "%d", v72);
      CPMLsql_insertIntoTable(*p_db, "cptrainColumns", "cptrainColumns", v79);
      if ((int)v72 >= 1)
      {
        v43 = 0;
        v44 = -10;
        do
        {
          sprintf(v79, "\"EMPTY\",%d", v44);
          CPMLsql_insertIntoTable(*p_db, "cacheString", "keyValue, indexValue", v79);
          ++v43;
          --v44;
        }
        while (v43 < (int)v72);
      }
      v45 = operator new();
      CPMLStatistics::CPMLStatistics(v45, v72, v9->mapFunction);
      v9->trainerCPStatistics = (void *)v45;
      v46 = -[CPMLSchema getYColumnPosition](v9->cpmlSchema, "getYColumnPosition");
      *((_DWORD *)v9->trainerCPStatistics + 32) = v46;
      sprintf(v79, "%d", v46);
      CPMLsql_insertIntoTable(v9->db, "cptrainyCol", "cptrainyCol", v79);
      -[CPMLSchema nsRemapTable](v9->cpmlSchema, "nsRemapTable");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((int *)v9->trainerCPStatistics + 31) >= 1)
      {
        v48 = 0;
        do
        {
          objc_msgSend(v47, "objectAtIndex:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)(*((_QWORD *)v9->trainerCPStatistics + 9) + 4 * v48) = -[CPMLSchema isColumnContinous:](v9->cpmlSchema, "isColumnContinous:", v48);
          v50 = objc_msgSend(v49, "intValue");
          trainerCPStatistics = v9->trainerCPStatistics;
          *(_DWORD *)(trainerCPStatistics[12] + 4 * v48) = v50;
          sprintf(v78, "%d", *(_DWORD *)(trainerCPStatistics[9] + 4 * v48));
          CPMLsql_insertIntoTable(v9->db, "cpContinousData", "cpContinousData", v78);
          sprintf(v78, "%d", *(_DWORD *)(*((_QWORD *)v9->trainerCPStatistics + 12) + 4 * v48));
          CPMLsql_insertIntoTable(v9->db, "cpValRemap", "cpValRemap", v78);
          if (v9->mapFunction == 1)
          {
            v52 = v9->trainerCPStatistics;
            *(_QWORD *)(v52[18] + 8 * v48) = 0;
            *(_QWORD *)(v52[21] + 8 * v48) = 0;
            *(_QWORD *)(v52[24] + 8 * v48) = 0;
            *(_QWORD *)(v52[27] + 8 * v48) = 0;
            *(_QWORD *)(v52[30] + 8 * v48) = 0;
          }

          ++v48;
        }
        while (v48 < *((int *)v9->trainerCPStatistics + 31));
      }

    }
    v53 = (CPMLRemapper *)operator new();
    CPMLRemapper::CPMLRemapper(v53, v9->db, (CPMLStatistics *)v9->trainerCPStatistics, 1);
    v9->cpRemapper = v53;
    -[CPMLModelEvaluate buildEvaluateMachineLearningAlgorithm](v9, "buildEvaluateMachineLearningAlgorithm");
    objc_msgSend(v7, "objectForKey:", CFSTR("FileProtection"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0;
    objc_msgSend(v54, "attributesOfItemAtPath:error:", v37, &v71);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v71;

    v56 = *MEMORY[0x24BDD0CF0];
    objc_msgSend(v68, "objectForKey:", *MEMORY[0x24BDD0CF0]);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPMLModelEvaluate fileProtectionClassRequest:](v9, "fileProtectionClassRequest:", v67);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v57, "isEqualToString:", v58))
    {
      v59 = v69;
      if (!v58)
        v59 = 1;
      if ((v59 & 1) != 0)
        goto LABEL_54;
    }
    else if (!v58)
    {
LABEL_54:
      v64 = *((int *)v9->trainerCPStatistics + 32);
      if (-[NSMutableArray count](v9->modelSchema, "count") <= v64)
      {
        NSLog(CFSTR("%s: mismatch between schema and model predicted column."), "-[CPMLModelEvaluate initWithModel:withPropertyList:]");
        goto LABEL_58;
      }
      if (v9->shouldFail)
      {
        NSLog(CFSTR("%s Failed"), "-[CPMLModelEvaluate initWithModel:withPropertyList:]");
LABEL_58:

        goto LABEL_59;
      }

LABEL_61:
      v65 = v9;
      goto LABEL_62;
    }
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v58, v56);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v55;
    v62 = objc_msgSend(v61, "setAttributes:ofItemAtPath:error:", v60, v37, &v70);
    v63 = v70;

    if ((v62 & 1) == 0)
      NSLog(CFSTR("%s: Could not set file protection to NSFileProtectionComplete\n"), "-[CPMLModelEvaluate initWithModel:withPropertyList:]");

    v55 = v63;
    goto LABEL_54;
  }
  NSLog(CFSTR("Cannot open %@"), v37);
  sqlite3_close(*p_db);
LABEL_59:
  v65 = 0;
LABEL_62:

  return v65;
}

- (void)dealloc
{
  CPMLSerialization *trainerCPDeSerializer;
  CPMLAlgorithm *cpMLAlgo;
  CPMLStatistics *trainerCPStatistics;
  CPMLRemapper *cpRemapper;
  CPMLTunableData *cpTuneableData;
  objc_super v8;

  trainerCPDeSerializer = self->trainerCPDeSerializer;
  if (trainerCPDeSerializer)
    (*((void (**)(CPMLSerialization *, SEL))trainerCPDeSerializer->var0 + 1))(trainerCPDeSerializer, a2);
  cpMLAlgo = self->cpMLAlgo;
  if (cpMLAlgo)
    (*((void (**)(CPMLAlgorithm *, SEL))cpMLAlgo->var0 + 1))(cpMLAlgo, a2);
  trainerCPStatistics = (CPMLStatistics *)self->trainerCPStatistics;
  if (trainerCPStatistics)
  {
    CPMLStatistics::~CPMLStatistics(trainerCPStatistics);
    MEMORY[0x20BD188E4]();
  }
  cpRemapper = (CPMLRemapper *)self->cpRemapper;
  if (cpRemapper)
  {
    CPMLRemapper::~CPMLRemapper(cpRemapper);
    MEMORY[0x20BD188E4]();
  }
  cpTuneableData = self->cpTuneableData;
  if (cpTuneableData)
    MEMORY[0x20BD188E4](cpTuneableData, 0x1080C40C4643742);
  v8.receiver = self;
  v8.super_class = (Class)CPMLModelEvaluate;
  -[CPMLModelEvaluate dealloc](&v8, sel_dealloc);
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

- (int)getAttributeType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOLEAN")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("INTEGER")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("REAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BLOB")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)constructVector:(void *)a3 withColumnPosition:(unint64_t)a4 maxColNumber:(unint64_t)a5 withValue:(id)a6
{
  id v8;
  void *v9;
  uint64_t *v10;
  unint64_t v11;
  void *v12;
  CPMLRemapper *cpRemapper;
  id v14;
  int v15;
  int v16;
  unint64_t v17;
  _DWORD *v18;
  _DWORD *v19;
  _DWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  int v27;
  _QWORD *XVectorVector;
  CPMLFeatureVector *v29;
  id v30;

  v29 = (CPMLFeatureVector *)a3;
  v30 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v30;
  }
  else
  {
    objc_msgSend(v30, "componentsSeparatedByString:", CFSTR(","));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = (uint64_t *)operator new();
  v11 = 0;
  *v10 = 0;
  v10[1] = 0;
  v10[2] = 0;
  while (objc_msgSend(v9, "count", v29) > v11)
  {
    objc_msgSend(v9, "objectAtIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    cpRemapper = (CPMLRemapper *)self->cpRemapper;
    v14 = objc_retainAutorelease(v12);
    v15 = CPMLRemapper::remap(cpRemapper, (char *)objc_msgSend(v14, "UTF8String"), a4);
    v16 = v15;
    v18 = (_DWORD *)v10[1];
    v17 = v10[2];
    if ((unint64_t)v18 >= v17)
    {
      v20 = (_DWORD *)*v10;
      v21 = ((uint64_t)v18 - *v10) >> 2;
      v22 = v21 + 1;
      if ((unint64_t)(v21 + 1) >> 62)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v23 = v17 - (_QWORD)v20;
      if (v23 >> 1 > v22)
        v22 = v23 >> 1;
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL)
        v24 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v24 = v22;
      if (v24)
      {
        v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v10 + 2), v24);
        v20 = (_DWORD *)*v10;
        v18 = (_DWORD *)v10[1];
      }
      else
      {
        v25 = 0;
      }
      v26 = &v25[4 * v21];
      *(_DWORD *)v26 = v16;
      v19 = v26 + 4;
      while (v18 != v20)
      {
        v27 = *--v18;
        *((_DWORD *)v26 - 1) = v27;
        v26 -= 4;
      }
      *v10 = (uint64_t)v26;
      v10[1] = (uint64_t)v19;
      v10[2] = (uint64_t)&v25[4 * v24];
      if (v20)
        operator delete(v20);
    }
    else
    {
      *v18 = v15;
      v19 = v18 + 1;
    }
    v10[1] = (uint64_t)v19;

    ++v11;
  }
  if (-[CPMLSchema getYColumnPosition](self->cpmlSchema, "getYColumnPosition") == a4)
  {
    XVectorVector = (_QWORD *)CPMLFeatureVector::getXVectorVector(v29);
    CPMLFeatureVector::setYHatVectorPosition(v29, (XVectorVector[1] - *XVectorVector) >> 4);
  }
  CPMLFeatureVector::insertIntVectorToVVClass(v29, v10);
}

- (id)evalCTypesV:(char *)a3
{
  return 0;
}

- (id)evalString:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPMLModelEvaluate evalArray:](self, "evalArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)evalNSObjectV:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  void *v11;
  id *v13;
  uint64_t v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = (id *)&v14;
  v6 = v4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    do
    {
      objc_msgSend(v5, "addObject:", v8);
      v9 = v13++;
      v10 = *v9;

      v8 = v10;
    }
    while (v10);
  }
  -[CPMLModelEvaluate evalArray:](self, "evalArray:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)evalArray:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  CPMLFeatureVector *v7;
  NSMutableArray *v8;
  NSMutableArray *vectorPositions;
  unint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 <= -[NSMutableArray count](self->modelSchema, "count"))
  {
    v7 = (CPMLFeatureVector *)operator new();
    CPMLFeatureVector::CPMLFeatureVector(v7);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    vectorPositions = self->vectorPositions;
    self->vectorPositions = v8;

    for (i = 0; i < objc_msgSend(v4, "count"); ++i)
    {
      v11 = objc_msgSend(v4, "count");
      objc_msgSend(v4, "objectAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPMLModelEvaluate doRemapToFeatureVector:withPositionID:withMaxCol:withValue:](self, "doRemapToFeatureVector:withPositionID:withMaxCol:withValue:", v7, i, v11, v12);

    }
    -[CPMLModelEvaluate doEvaluate:withBoundedList:](self, "doEvaluate:withBoundedList:", v7, &self->boundedRemappedValues);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CPMLFeatureVector::~CPMLFeatureVector(v7);
    MEMORY[0x20BD188E4]();
    v6 = -[CPMLEvalutionResult init:withConfigurationList:]([CPMLEvalutionResult alloc], "init:withConfigurationList:", v13, 0);

  }
  else
  {
    NSLog(CFSTR("%s Input count greater tha declared schema."), "-[CPMLModelEvaluate evalArray:]");
    v6 = 0;
  }

  return v6;
}

- (id)evalDict:(id)a3
{
  id v4;
  CPMLFeatureVector *v5;
  NSMutableArray *v6;
  NSMutableArray *vectorPositions;
  unint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  CPMLFeatureVector *v14;

  v4 = a3;
  v5 = (CPMLFeatureVector *)operator new();
  CPMLFeatureVector::CPMLFeatureVector(v5);
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  vectorPositions = self->vectorPositions;
  self->vectorPositions = v6;

  v8 = objc_msgSend(v4, "count");
  if (v8 <= -[NSMutableArray count](self->modelSchema, "count"))
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __30__CPMLModelEvaluate_evalDict___block_invoke;
    v12[3] = &unk_24C256400;
    v12[4] = self;
    v14 = v5;
    v13 = v4;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v12);
    -[CPMLModelEvaluate doEvaluate:withBoundedList:](self, "doEvaluate:withBoundedList:", v5, &self->boundedRemappedValues);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CPMLFeatureVector::~CPMLFeatureVector(v5);
    MEMORY[0x20BD188E4]();
    v9 = -[CPMLEvalutionResult init:withConfigurationList:]([CPMLEvalutionResult alloc], "init:withConfigurationList:", v10, 0);

  }
  else
  {
    NSLog(CFSTR("%s Input count greater tha declared schema."), "-[CPMLModelEvaluate evalDict:]");
    CPMLFeatureVector::~CPMLFeatureVector(v5);
    MEMORY[0x20BD188E4]();
    v9 = 0;
  }

  return v9;
}

void __30__CPMLModelEvaluate_evalDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "doRemapToFeatureVector:withPositionID:withMaxCol:withValue:", *(_QWORD *)(a1 + 48), (int)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "getColumnPosition:", v6), objc_msgSend(*(id *)(a1 + 40), "count"), v5);

}

- (void)doRemapToFeatureVector:(void *)a3 withPositionID:(unint64_t)a4 withMaxCol:(unint64_t)a5 withValue:(id)a6
{
  id v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  double v16;
  BOOL v17;
  char v18;
  void *v19;
  CPMLRemapper *cpRemapper;
  id v21;
  id v22;
  NSMutableArray *vectorPositions;
  void *v24;
  id v25;
  double v26;
  double v27;
  _QWORD *trainerCPStatistics;
  uint64_t v29;
  double v30;
  id v31;

  v10 = a6;
  v11 = *(_DWORD *)(*((_QWORD *)self->trainerCPStatistics + 9) + 4 * a4);
  -[NSMutableArray objectAtIndex:](self->modelSchema, "objectAtIndex:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CPMLModelEvaluate getAttributeType:](self, "getAttributeType:", v12))
  {
    if (-[CPMLModelEvaluate getAttributeType:](self, "getAttributeType:", v12) == 1)
    {
      v13 = !-[CPMLSchema matchSubstituteValue:theValue:](self->cpmlSchema, "matchSubstituteValue:theValue:", a4, v10);
      if (!v10)
        LOBYTE(v13) = 0;
      v31 = v10;
      if ((v13 & 1) == 0)
      {
        -[CPMLSchema getSubstituteValue:](self->cpmlSchema, "getSubstituteValue:", a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_alloc(MEMORY[0x24BDD16E0]);
        if (v14)
          objc_msgSend(v14, "doubleValue");
        else
          v16 = *(double *)(*((_QWORD *)self->trainerCPStatistics + 21) + 8 * a4);
        v31 = (id)objc_msgSend(v15, "initWithDouble:", v16);

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v31;
        v21 = v10;
        v31 = v22;
        if (!v11)
          goto LABEL_19;
      }
      else
      {
        v25 = objc_alloc_init(MEMORY[0x24BDD16F0]);
        objc_msgSend(v25, "setNumberStyle:", 1);
        objc_msgSend(v25, "numberFromString:", v10);
        v22 = (id)objc_claimAutoreleasedReturnValue();

        v21 = v10;
        if (!v11)
          goto LABEL_19;
      }
    }
    else
    {
      if (-[CPMLModelEvaluate getAttributeType:](self, "getAttributeType:", v12) == 2)
      {
        vectorPositions = self->vectorPositions;
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", a4);
        -[NSMutableArray addObject:](vectorPositions, "addObject:", v24);

        v22 = 0;
        v31 = v10;
        -[CPMLModelEvaluate constructVector:withColumnPosition:maxColNumber:withValue:](self, "constructVector:withColumnPosition:maxColNumber:withValue:", a3, a4, a5, v10);
        goto LABEL_31;
      }
      v22 = 0;
      v31 = v10;
      NSLog(CFSTR("Error EvalArray type incorrect"));
      v21 = v10;
      if (!v11)
        goto LABEL_19;
    }
  }
  else
  {
    v17 = -[CPMLSchema matchSubstituteValue:theValue:](self->cpmlSchema, "matchSubstituteValue:theValue:", a4, v10);
    if (v10)
      v18 = v17;
    else
      v18 = 1;
    if ((v18 & 1) != 0 || (v19 = v10, objc_msgSend(v10, "isEqualToString:", &stru_24C256E28)))
    {
      -[CPMLSchema getSubstituteValue:](self->cpmlSchema, "getSubstituteValue:", a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    cpRemapper = (CPMLRemapper *)self->cpRemapper;
    v21 = objc_retainAutorelease(v19);
    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", (double)(int)CPMLRemapper::remap(cpRemapper, (char *)objc_msgSend(v21, "UTF8String"), a4));
    v31 = v10;
    if (!v11)
    {
LABEL_19:
      if (!(*((unsigned int (**)(CPMLAlgorithm *))self->cpMLAlgo->var0 + 7))(self->cpMLAlgo))
      {
        v10 = v21;
        CPMLFeatureVector::insertIntVClass((CPMLFeatureVector *)a3, objc_msgSend(v22, "intValue"));
        goto LABEL_31;
      }
    }
  }
  v26 = 1.0;
  v27 = 0.0;
  if (self->mapFunction == 1)
  {
    trainerCPStatistics = self->trainerCPStatistics;
    v27 = *(double *)(trainerCPStatistics[21] + 8 * a4);
    v29 = trainerCPStatistics[24];
    if (*(double *)(v29 + 8 * a4) > 0.0)
      v26 = *(double *)(v29 + 8 * a4);
  }
  objc_msgSend(v22, "doubleValue");
  CPMLFeatureVector::insertRealVClass((CPMLFeatureVector *)a3, (v30 - v27) / v26);
  v10 = v21;
LABEL_31:

}

- (id)doEvaluate:(void *)a3 withBoundedList:(void *)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  double YHat;
  char *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  int v32;
  void *v33;
  void *v34;
  char *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  double v41;
  int v42;
  char *v43;
  void *v44;
  void *v45;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  id v51;

  v7 = (id)objc_opt_new();
  v8 = (void *)objc_opt_new();
  if (((*((uint64_t (**)(CPMLAlgorithm *, void *, void *))self->cpMLAlgo->var0 + 3))(self->cpMLAlgo, a3, a4) & 0x80000000) == 0)
  {
    -[NSMutableArray objectAtIndex:](self->modelSchema, "objectAtIndex:", *((int *)self->trainerCPStatistics + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CPMLModelEvaluate getAttributeType:](self, "getAttributeType:", v9) != 2)
    {
      if (-[CPMLModelEvaluate getAttributeType:](self, "getAttributeType:", v9))
      {
        v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%f"), CPMLFeatureVector::getYHat((CPMLFeatureVector *)a3));
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CPMLFeatureVector::getYHat((CPMLFeatureVector *)a3));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v22, v21);
        objc_msgSend(v7, "addObject:", v8);
      }
      else
      {
        YHat = CPMLFeatureVector::getYHat((CPMLFeatureVector *)a3);
        v25 = CPMLRemapper::unmap((CPMLRemapper *)self->cpRemapper, llround(YHat), *((_DWORD *)self->trainerCPStatistics + 32));
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v25, 4);
        if (v25)
          free(v25);
        v27 = (void *)objc_opt_new();
        v28 = *((_QWORD *)a3 + 10);
        if (*((_QWORD *)a3 + 11) == v28)
        {
          if ((objc_msgSend(v26, "isEqual:", CFSTR("error")) & 1) == 0)
          {
            objc_msgSend(v8, "setObject:forKey:", &unk_24C259198, v26);
            objc_msgSend(v7, "addObject:", v8);
          }
          v7 = v7;

          goto LABEL_30;
        }
        v47 = (uint64_t)v26;
        v49 = v9;
        v51 = v7;
        v29 = 0;
        v30 = 0;
        do
        {
          v31 = v28 + v29;
          v32 = *(_DWORD *)(v31 + 8);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_opt_new();

          v35 = CPMLRemapper::unmap((CPMLRemapper *)self->cpRemapper, v32, *((_DWORD *)self->trainerCPStatistics + 32));
          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v35, 4);
          objc_msgSend(v34, "setObject:forKey:", v33, v36);

          objc_msgSend(v27, "addObject:", v34);
          if (v35)
            free(v35);

          ++v30;
          v28 = *((_QWORD *)a3 + 10);
          v29 += 16;
          v8 = v34;
        }
        while (v30 < (*((_QWORD *)a3 + 11) - v28) >> 4);
        v9 = v49;
        v22 = v51;
        v8 = v34;
        v7 = v27;
        v21 = v47;
      }
      v10 = v7;

      v7 = (id)v21;
      goto LABEL_28;
    }
    if (*((_QWORD *)a3 + 11) == *((_QWORD *)a3 + 10))
    {
      v23 = v7;
LABEL_29:
      v7 = v23;
LABEL_30:

      v20 = v7;
      goto LABEL_31;
    }
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v11 = -[CPMLSchema getVectorContent:](self->cpmlSchema, "getVectorContent:", -[CPMLSchema getYColumnPosition](self->cpmlSchema, "getYColumnPosition"));
    v12 = *((_QWORD *)a3 + 10);
    v13 = *((_QWORD *)a3 + 11);
    if (v11 == 4)
    {
      if (v13 != v12)
      {
        v48 = v9;
        v50 = v7;
        v14 = 0;
        v15 = 0;
        v16 = v8;
        do
        {
          v17 = *(double *)(v12 + v14);
          v8 = (void *)objc_opt_new();

          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%lf"), *(_QWORD *)&v17);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v19, v18);

          objc_msgSend(v10, "addObject:", v8);
          ++v15;
          v12 = *((_QWORD *)a3 + 10);
          v14 += 16;
          v16 = v8;
        }
        while (v15 < (*((_QWORD *)a3 + 11) - v12) >> 4);
LABEL_27:
        v9 = v48;
        v7 = v50;
      }
    }
    else if (v13 != v12)
    {
      v48 = v9;
      v50 = v7;
      v37 = 0;
      v38 = 0;
      v39 = v8;
      do
      {
        v40 = v12 + v37;
        v41 = *(double *)v40;
        v42 = *(_DWORD *)(v40 + 8);
        v8 = (void *)objc_opt_new();

        v43 = CPMLRemapper::unmap((CPMLRemapper *)self->cpRemapper, v42, -[CPMLSchema getYColumnPosition](self->cpmlSchema, "getYColumnPosition"));
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v43, 4);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v41);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v45, v44);

        objc_msgSend(v10, "addObject:", v8);
        if (v43)
          free(v43);

        ++v38;
        v12 = *((_QWORD *)a3 + 10);
        v37 += 16;
        v39 = v8;
      }
      while (v38 < (*((_QWORD *)a3 + 11) - v12) >> 4);
      goto LABEL_27;
    }
LABEL_28:

    v23 = v10;
    goto LABEL_29;
  }
  v20 = 0;
LABEL_31:

  return v20;
}

- (void)buildEvaluateMachineLearningAlgorithm
{
  CPMLOnlineSvm *v3;
  CPMLNaiveBayesClassifier *v4;
  CPMLNaiveBayesStorageManager *v5;
  CPMLStorageManager *storageManager;

  if (-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("SVM")))
  {
    v3 = (CPMLOnlineSvm *)operator new();
    CPMLOnlineSvm::CPMLOnlineSvm(v3, self->trainerCPDeSerializer, self->cpTuneableData);
LABEL_9:
    self->cpMLAlgo = (CPMLAlgorithm *)v3;
    return;
  }
  if (-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("LIBSVM")))
  {
    v3 = (CPMLOnlineSvm *)operator new();
    CPMLLIBSVMClassifier::CPMLLIBSVMClassifier(v3, self->trainerCPDeSerializer, self->cpTuneableData);
    goto LABEL_9;
  }
  if (-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("LINEARSVM")))
  {
    v3 = (CPMLOnlineSvm *)operator new();
    CPMLLINEARSVMClassifier::CPMLLINEARSVMClassifier(v3, self->trainerCPDeSerializer, self->cpTuneableData);
    goto LABEL_9;
  }
  if (-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("NB")))
  {
    v3 = (CPMLOnlineSvm *)operator new();
    CPMLNaiveBayesSuggestionsClassifier::CPMLNaiveBayesSuggestionsClassifier(v3, (CPMLStatistics *)self->trainerCPStatistics, self->trainerCPDeSerializer, self->cpTuneableData);
    goto LABEL_9;
  }
  if (!-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("NB_BASE")))
  {
    if (-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("NAIVE_BAYES")))
    {
      v3 = (CPMLOnlineSvm *)operator new();
      CPNaiveBayesClassifier::CPNaiveBayesClassifier(v3, self->trainerCPDeSerializer, self->cpTuneableData);
    }
    else if (-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("NAIVE_BAYESV2")))
    {
      v3 = (CPMLOnlineSvm *)operator new();
      CPNaiveBayesV2Classifier::CPNaiveBayesV2Classifier(v3, self->trainerCPDeSerializer, self->cpTuneableData);
    }
    else if (-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("NAIVEBAYES")))
    {
      v5 = objc_alloc_init(CPMLNaiveBayesStorageManager);
      storageManager = self->_storageManager;
      self->_storageManager = &v5->super;

      v3 = (CPMLOnlineSvm *)operator new();
      CPMLNaiveBayesClassifierBase::CPMLNaiveBayesClassifierBase(v3, (CPMLStatistics *)self->trainerCPStatistics, self->trainerCPDeSerializer, self->cpTuneableData);
    }
    else if (-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("KMEANS")))
    {
      v3 = (CPMLOnlineSvm *)operator new();
      CPMLKMeans::CPMLKMeans(v3, self->trainerCPDeSerializer, self->cpTuneableData);
    }
    else if (-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("KNN")))
    {
      v3 = (CPMLOnlineSvm *)operator new();
      CPKNNClassfier::CPKNNClassfier(v3, self->trainerCPDeSerializer, self->cpTuneableData);
    }
    else if (-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("LOGISTIC_REGRESSION")))
    {
      v3 = (CPMLOnlineSvm *)operator new();
      CPLogisticRegressionClassfier::CPLogisticRegressionClassfier(v3, self->trainerCPDeSerializer, self->cpTuneableData);
    }
    else if (-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("REGRESSION_FOREST")))
    {
      v3 = (CPMLOnlineSvm *)operator new();
      CPRegressionForestClassfier::CPRegressionForestClassfier(v3, self->trainerCPDeSerializer, self->cpTuneableData);
    }
    else if (-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("GAUSSIAN_MIXTURE_MODEL")))
    {
      v3 = (CPMLOnlineSvm *)operator new();
      CPGMMClassfier::CPGMMClassfier(v3, self->trainerCPDeSerializer, self->cpTuneableData);
    }
    else
    {
      if (!-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("LINEAR_REGRESSION")))
      {
        NSLog(CFSTR("%s No ML ALGO Selected!"), "-[CPMLModelEvaluate buildEvaluateMachineLearningAlgorithm]");
        self->shouldFail = 1;
        return;
      }
      v3 = (CPMLOnlineSvm *)operator new();
      CPLinearRegressionClassfier::CPLinearRegressionClassfier(v3, self->trainerCPDeSerializer, self->cpTuneableData);
    }
    goto LABEL_9;
  }
  v4 = (CPMLNaiveBayesClassifier *)operator new();
  CPMLNaiveBayesClassifier::CPMLNaiveBayesClassifier(v4, (CPMLStatistics *)self->trainerCPStatistics, self->trainerCPDeSerializer, self->cpTuneableData);
  self->cpMLAlgo = (CPMLAlgorithm *)v4;
  if (self->enableCacheString)
    *((_BYTE *)self->cpRemapper + 1) = 1;
}

- (void)boundResult:(id)a3
{
  unint64_t v4;
  vector<int, std::allocator<int>> *p_boundedRemappedValues;
  void *v6;
  CPMLRemapper *cpRemapper;
  id v8;
  int v9;
  int v10;
  int *value;
  int *end;
  int *v13;
  int *begin;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  int *v20;
  int v21;
  id v22;

  v22 = a3;
  v4 = 0;
  p_boundedRemappedValues = &self->boundedRemappedValues;
  self->boundedRemappedValues.__end_ = self->boundedRemappedValues.__begin_;
  while (v4 < objc_msgSend(v22, "count"))
  {
    objc_msgSend(v22, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    cpRemapper = (CPMLRemapper *)self->cpRemapper;
    v8 = objc_retainAutorelease(v6);
    v9 = CPMLRemapper::remap(cpRemapper, (char *)objc_msgSend(v8, "UTF8String"), *((_DWORD *)self->trainerCPStatistics + 32));
    v10 = v9;
    end = self->boundedRemappedValues.__end_;
    value = self->boundedRemappedValues.__end_cap_.__value_;
    if (end >= value)
    {
      begin = p_boundedRemappedValues->__begin_;
      v15 = end - p_boundedRemappedValues->__begin_;
      v16 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 62)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v17 = (char *)value - (char *)begin;
      if (v17 >> 1 > v16)
        v16 = v17 >> 1;
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
        v18 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v18 = v16;
      if (v18)
      {
        v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&self->boundedRemappedValues.__end_cap_, v18);
        begin = self->boundedRemappedValues.__begin_;
        end = self->boundedRemappedValues.__end_;
      }
      else
      {
        v19 = 0;
      }
      v20 = (int *)&v19[4 * v15];
      *v20 = v10;
      v13 = v20 + 1;
      while (end != begin)
      {
        v21 = *--end;
        *--v20 = v21;
      }
      self->boundedRemappedValues.__begin_ = v20;
      self->boundedRemappedValues.__end_ = v13;
      self->boundedRemappedValues.__end_cap_.__value_ = (int *)&v19[4 * v18];
      if (begin)
        operator delete(begin);
    }
    else
    {
      *end = v9;
      v13 = end + 1;
    }
    self->boundedRemappedValues.__end_ = v13;

    ++v4;
  }

}

- (BOOL)updateModel:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  CPMLCDB *v9;
  char v10;
  _QWORD v12[8];
  _QWORD block[4];
  id v14;
  CPMLModelEvaluate *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  objc_msgSend(v4, "getDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flushDB");
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v6 = MEMORY[0x24BDAC760];
  v20 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CPMLModelEvaluate_updateModel___block_invoke;
  block[3] = &unk_24C256258;
  v16 = &v17;
  v7 = v4;
  v14 = v7;
  v15 = self;
  dispatch_sync(v5, block);
  v8 = operator new();
  CPMLStatistics::CPMLStatistics(v8, v7, self->mapFunction);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __33__CPMLModelEvaluate_updateModel___block_invoke_2;
  v12[3] = &unk_24C256428;
  v12[4] = self;
  v12[5] = &v17;
  v12[6] = &v21;
  v12[7] = v8;
  dispatch_sync(v5, v12);
  v9 = (CPMLCDB *)v18[3];
  if (v9)
  {
    CPMLCDB::~CPMLCDB(v9);
    MEMORY[0x20BD188E4]();
  }
  -[NSNumber doubleValue](self->maxRemoveTrainingRow, "doubleValue");
  objc_msgSend(v7, "removeTrainingRowData:");
  v10 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v10;
}

void __33__CPMLModelEvaluate_updateModel___block_invoke(uint64_t a1)
{
  CPMLCDB *v2;

  v2 = (CPMLCDB *)operator new();
  CPMLCDB::CPMLCDB(v2, (sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "db"), *(sqlite3 **)(*(_QWORD *)(a1 + 40) + 16), *(CPMLRemapper **)(*(_QWORD *)(a1 + 40) + 88), *(CPMLTunableData **)(*(_QWORD *)(a1 + 40) + 120));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;
}

void __33__CPMLModelEvaluate_updateModel___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  CPMLStatistics *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  **(_QWORD **)(*(_QWORD *)(a1[5] + 8) + 24) = a1[7];
  v2 = a1[4];
  if (*(_QWORD *)(v2 + 72))
  {
    **(_BYTE **)(v2 + 88) = 1;
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(**(_QWORD **)(a1[4] + 72) + 16))(*(_QWORD *)(a1[4] + 72), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(a1[4] + 80), *(_QWORD *)(a1[4] + 120));
    v3 = a1[4];
    v4 = *(CPMLStatistics **)(v3 + 104);
    if (v4)
    {
      CPMLStatistics::~CPMLStatistics(v4);
      MEMORY[0x20BD188E4]();
      v3 = a1[4];
    }
    *(_QWORD *)(v3 + 104) = a1[7];
    *(_QWORD *)(*(_QWORD *)(a1[4] + 88) + 16) = a1[7];
    (*(void (**)(_QWORD, _QWORD, const char *, const char *, _QWORD))(**(_QWORD **)(a1[4] + 80) + 160))(*(_QWORD *)(a1[4] + 80), *(unsigned int *)(*(_QWORD *)(a1[4] + 104) + 120), "cptrainRows", "cptrainRows", 0);
    v5 = a1[4];
    v6 = *(_QWORD *)(v5 + 104);
    if (*(int *)(v6 + 124) >= 1)
    {
      v7 = 0;
      do
      {
        (*(void (**)(_QWORD, const char *, const char *, uint64_t, double))(**(_QWORD **)(v5 + 80) + 176))(*(_QWORD *)(v5 + 80), "cptrainCard", "cptrainCard", v7, *(double *)(*(_QWORD *)(v6 + 144) + 8 * v7));
        (*(void (**)(_QWORD, const char *, const char *, uint64_t, double))(**(_QWORD **)(a1[4] + 80) + 176))(*(_QWORD *)(a1[4] + 80), "cptrainMean", "cptrainMean", v7, *(double *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 104) + 144) + 8 * v7));
        (*(void (**)(_QWORD, const char *, const char *, uint64_t, double))(**(_QWORD **)(a1[4] + 80) + 176))(*(_QWORD *)(a1[4] + 80), "cpSTDev", "cpSTDev", v7, *(double *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 104) + 144) + 8 * v7));
        (*(void (**)(_QWORD, const char *, const char *, uint64_t, double))(**(_QWORD **)(a1[4] + 80) + 176))(*(_QWORD *)(a1[4] + 80), "cpMin", "cpMin", v7, *(double *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 104) + 144) + 8 * v7));
        (*(void (**)(_QWORD, const char *, const char *, uint64_t, double))(**(_QWORD **)(a1[4] + 80) + 176))(*(_QWORD *)(a1[4] + 80), "cpMax", "cpMax", v7, *(double *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 104) + 144) + 8 * v7));
        ++v7;
        v5 = a1[4];
        v6 = *(_QWORD *)(v5 + 104);
      }
      while (v7 < *(int *)(v6 + 124));
    }
    **(_BYTE **)(v5 + 88) = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    NSLog(CFSTR("%s can't update empty model."), "-[CPMLModelEvaluate updateModel:]_block_invoke_2");
  }
}

- (void)setCPMLAlgorithm:(id)a3
{
  CPMLStorageManager *storageManager;
  CPMLStorageManager *v6;
  CPMLStorageManager *v7;
  CPMLDelegateEngine *v8;
  CPMLAlgorithm *cpMLAlgo;
  CPMLUserDefinedAlgorithm *v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    objc_storeStrong((id *)&self->_delegateAlgorithm, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      storageManager = self->_storageManager;
      if (!storageManager)
      {
        v6 = objc_alloc_init(CPMLStorageManager);
        v7 = self->_storageManager;
        self->_storageManager = v6;

        storageManager = self->_storageManager;
      }
      -[CPMLAlgorithmProtocol initCPMLAlgorithm:](self->_delegateAlgorithm, "initCPMLAlgorithm:", storageManager);
      v8 = (CPMLDelegateEngine *)operator new();
      CPMLDelegateEngine::CPMLDelegateEngine(v8, v11, self->_storageManager);
      self->_cpmlDelegate = (CPMLDelegate *)v8;
      cpMLAlgo = self->cpMLAlgo;
      if (cpMLAlgo)
        (*((void (**)(CPMLAlgorithm *))cpMLAlgo->var0 + 1))(cpMLAlgo);
      v10 = (CPMLUserDefinedAlgorithm *)operator new();
      CPMLUserDefinedAlgorithm::CPMLUserDefinedAlgorithm(v10, self->trainerCPDeSerializer, self->cpTuneableData);
      self->cpMLAlgo = (CPMLAlgorithm *)v10;
      (*(void (**)(CPMLUserDefinedAlgorithm *, CPMLDelegate *))(*(_QWORD *)v10 + 72))(v10, self->_cpmlDelegate);
    }
  }

}

- (void)setCPMLAlgorithmEngine:(id)a3
{
  CPMLStorageManager *v4;
  CPMLStorageManager *storageManager;
  CPMLDelegateEngineNaiveBayes *v6;
  id v7;

  v7 = a3;
  if (-[NSString isEqualToString:](self->machineLearningAlgo, "isEqualToString:", CFSTR("NAIVEBAYES")))
  {
    if (!self->_storageManager)
    {
      v4 = objc_alloc_init(CPMLStorageManager);
      storageManager = self->_storageManager;
      self->_storageManager = v4;

    }
    v6 = (CPMLDelegateEngineNaiveBayes *)operator new();
    CPMLDelegateEngineNaiveBayes::CPMLDelegateEngineNaiveBayes(v6, v7, self->_storageManager);
    self->_delegateEngine = (CPMLDelegateEngine *)v6;
    (*((void (**)(CPMLAlgorithm *, CPMLDelegateEngineNaiveBayes *))self->cpMLAlgo->var0 + 10))(self->cpMLAlgo, v6);
  }

}

- (void)getModelData
{
  return (void *)(*((uint64_t (**)(CPMLAlgorithm *))self->cpMLAlgo->var0 + 11))(self->cpMLAlgo);
}

- (void).cxx_destruct
{
  int *begin;

  objc_storeStrong((id *)&self->_delegateAlgorithm, 0);
  objc_storeStrong((id *)&self->_storageManager, 0);
  begin = self->boundedRemappedValues.__begin_;
  if (begin)
  {
    self->boundedRemappedValues.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->cpmlSchema, 0);
  objc_storeStrong((id *)&self->machineLearningAlgo, 0);
  objc_storeStrong((id *)&self->serializeFunction, 0);
  objc_storeStrong((id *)&self->maxRemoveTrainingRow, 0);
  objc_storeStrong((id *)&self->vectorPositions, 0);
  objc_storeStrong((id *)&self->modelSchema, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  return self;
}

@end
