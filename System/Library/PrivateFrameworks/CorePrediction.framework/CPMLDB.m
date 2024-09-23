@implementation CPMLDB

- (void)initMaxSizeStatistics:(unint64_t)a3
{
  self->maxFieldCount = a3;
  self->rowCount = 0;
  self->repFields = (unint64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  self->cardinality = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  self->min = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  self->max = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  self->mean = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  self->sumOfX = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  self->sumOfXX = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  self->sigma = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
}

+ (id)getConfigurationFromPlist:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  if (!v3)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    NSLog(CFSTR("%s cannot open file"), "+[CPMLDB getConfigurationFromPlist:]");
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v7 = 0;
  v8 = 100;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v4, 0, &v8, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v5;
}

- (CPMLDB)initWithDBName:(id)a3 withPlistPath:(id)a4 withWriteOptions:(int)a5
{
  uint64_t v5;
  id v9;
  id v10;
  CPMLDB *v11;
  NSDictionary *v12;
  NSDictionary *cInfo;
  NSDictionary *v14;
  CPMLDB *v15;
  objc_super v17;

  v5 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CPMLDB;
  v11 = -[CPMLDB init](&v17, sel_init);
  if (v11)
  {
    +[CPMLDB getConfigurationFromPlist:](CPMLDB, "getConfigurationFromPlist:", v10);
    v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v15 = 0;
      goto LABEL_6;
    }
    cInfo = v11->_cInfo;
    v11->_cInfo = v12;
    v14 = v12;

    v11->_openCPMLDBOptions = v5;
    objc_storeStrong((id *)&v11->_trainingModelFileAndPath, a3);
    -[CPMLDB doInitialize:withConfiguration:withWriteOptions:](v11, "doInitialize:withConfiguration:withWriteOptions:", v9, v14, v5);

  }
  v15 = v11;
LABEL_6:

  return v15;
}

- (CPMLDB)initWithDBName:(id)a3 withConfiguration:(id)a4 withWriteOptions:(int)a5
{
  uint64_t v5;
  id v9;
  id v10;
  CPMLDB *v11;
  CPMLDB *v12;
  objc_super v14;

  v5 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPMLDB;
  v11 = -[CPMLDB init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cInfo, a4);
    v12->_openCPMLDBOptions = v5;
    objc_storeStrong((id *)&v12->_trainingModelFileAndPath, a3);
    -[CPMLDB doInitialize:withConfiguration:withWriteOptions:](v12, "doInitialize:withConfiguration:withWriteOptions:", v9, v10, v5);
  }

  return v12;
}

- (void)doInitCommon:(id)a3 withDict:(id)a4 withFileExists:(BOOL *)a5 withWriteOptions:(int)a6
{
  id v11;
  id v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *dispatch_queue;
  CPMLLog *v15;
  void *v16;
  void *v17;
  _QWORD *CPMLLog;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  double v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *vectorListCardinality;
  NSMutableString *v27;
  NSMutableString *dbTableName;
  CPMLSchema *v29;
  CPMLSchema *cpSchema;
  void *v31;
  NSMutableString *v32;
  void *v33;
  NSMutableString *v34;
  NSMutableString *v35;
  void *v36;
  id v37;

  v11 = a3;
  v12 = a4;
  if (!self->_dispatch_queue)
  {
    v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coreprediction.tdb", 0);
    dispatch_queue = self->_dispatch_queue;
    self->_dispatch_queue = v13;

  }
  *(_QWORD *)&self->commitCountMax = 1000;
  objc_storeStrong((id *)&self->_dbFileName, a3);
  objc_msgSend(v12, "objectForKey:", CFSTR("loggingMode"));
  v15 = (CPMLLog *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15
    || (v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.cpml")),
        objc_msgSend(v17, "objectForKey:", CFSTR("loggingMode")),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v16))
  {
    CPMLLog = CPMLLog::getCPMLLog(v15);
    CPMLLog[10] = objc_msgSend(v16, "longLongValue");
  }
  objc_msgSend(v12, "objectForKey:", CFSTR("commitCountMax"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
    v21 = objc_msgSend(v19, "intValue");
  else
    v21 = 100;
  self->commitCountMax = v21;
  objc_msgSend(v12, "objectForKey:", CFSTR("minTimeToLogIndex"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
    objc_msgSend(v22, "doubleValue");
  else
    v24 = 86400.0;
  self->minTimeToLogIndex = v24;
  v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  vectorListCardinality = self->vectorListCardinality;
  self->vectorListCardinality = v25;

  v27 = (NSMutableString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("MAIN_TABLE"));
  dbTableName = self->dbTableName;
  self->dbTableName = v27;

  v29 = -[CPMLSchema initWithPlist:]([CPMLSchema alloc], "initWithPlist:", v12);
  cpSchema = self->cpSchema;
  self->cpSchema = v29;

  v37 = objc_retainAutorelease(v11);
  if (sqlite3_open((const char *)objc_msgSend(v37, "UTF8String"), &self->db))
  {
    NSLog(CFSTR("Cannot open %@"), v37);
    sqlite3_close(self->db);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = objc_msgSend(v31, "fileExistsAtPath:", v37);

    if (!*a5)
    {
      -[CPMLDB createTable:withSchema:withExistingTable:](self, "createTable:withSchema:withExistingTable:", CFSTR("version"), CFSTR("version TEXT"), 0);
      -[CPMLDB insertIntoTable:withTuple:](self, "insertIntoTable:withTuple:", CFSTR("version"), CFSTR("(version) values(\"1.0.0\");"));
    }
    -[CPMLDB initMaxSizeStatistics:](self, "initMaxSizeStatistics:", -[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes"));
    if ((a6 & 0xFFFFFFFD) == 1)
    {
      if (!-[CPMLDB loadStatisticTable](self, "loadStatisticTable"))
        -[CPMLDB initStatisticsTable](self, "initStatisticsTable");
      -[CPMLDB createTable:withSchema:withExistingTable:](self, "createTable:withSchema:withExistingTable:", CFSTR("DATEINDEX"), CFSTR("pkeyIndex INTEGER, date REAL"), 1);
      v32 = self->dbTableName;
      -[CPMLSchema schemaHeaderWithType](self->cpSchema, "schemaHeaderWithType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPMLDB createTable:withSchema:withExistingTable:](self, "createTable:withSchema:withExistingTable:", v32, v33, 1);
    }
    else
    {
      -[CPMLDB createTable:withSchema:withExistingTable:](self, "createTable:withSchema:withExistingTable:", CFSTR("DATEINDEX"), CFSTR("pkeyIndex INTEGER, date REAL"), 0);
      v34 = self->dbTableName;
      -[CPMLSchema schemaHeaderWithType](self->cpSchema, "schemaHeaderWithType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPMLDB createTable:withSchema:withExistingTable:](self, "createTable:withSchema:withExistingTable:", v34, v33, 0);
    }

    v35 = self->dbTableName;
    -[CPMLSchema indexColumnList](self->cpSchema, "indexColumnList");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPMLDB indexTable:withColumn:](self, "indexTable:withColumn:", v35, v36);

    -[CPMLDB loadTables](self, "loadTables");
  }

}

- (void)doInitialize:(id)a3 withConfiguration:(id)a4 withWriteOptions:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  char v24;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v24 = 0;
  -[CPMLDB doInitCommon:withDict:withFileExists:withWriteOptions:](self, "doInitCommon:withDict:withFileExists:withWriteOptions:", v8, v9, &v24, v5);
  objc_msgSend(v9, "objectForKey:", CFSTR("FileProtection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v11, "attributesOfItemAtPath:error:", v8, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;

  v14 = *MEMORY[0x24BDD0CF0];
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0CF0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPMLDB fileProtectionClassRequest:](self, "fileProtectionClassRequest:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", v16) && v24 || !v16)
  {
    v20 = v13;
  }
  else
  {
    v21 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v13;
    v19 = objc_msgSend(v18, "setAttributes:ofItemAtPath:error:", v17, v8, &v22);
    v20 = v22;

    if ((v19 & 1) == 0)
      NSLog(CFSTR("%s: Could not set file protection to NSFileProtectionComplete\n"), "-[CPMLDB doInitialize:withConfiguration:withWriteOptions:]");

    v10 = v21;
  }

}

- (CPMLDB)initWithDBName:(id)a3 dataFromFile:(id)a4 withPlistPath:(id)a5 withWriteOptions:(int)a6
{
  uint64_t v6;
  id v11;
  id v12;
  id v13;
  CPMLDB *v14;
  NSDictionary *v15;
  NSDictionary *cInfo;
  NSDictionary *v17;
  CPMLDB *v18;
  objc_super v20;

  v6 = *(_QWORD *)&a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CPMLDB;
  v14 = -[CPMLDB init](&v20, sel_init);
  if (v14)
  {
    +[CPMLDB getConfigurationFromPlist:](CPMLDB, "getConfigurationFromPlist:", v13);
    v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v18 = 0;
      goto LABEL_6;
    }
    cInfo = v14->_cInfo;
    v14->_cInfo = v15;
    v17 = v15;

    objc_storeStrong((id *)&v14->_trainingFile, a4);
    v14->_openCPMLDBOptions = v6;
    objc_storeStrong((id *)&v14->_trainingModelFileAndPath, a3);
    -[CPMLDB doInitializeWithDataFile:dataFromFile:withConfiguration:withWriteOptions:](v14, "doInitializeWithDataFile:dataFromFile:withConfiguration:withWriteOptions:", v11, v12, v17, v6);

  }
  v18 = v14;
LABEL_6:

  return v18;
}

- (CPMLDB)initWithDBName:(id)a3 dataFromFile:(id)a4 withConfiguration:(id)a5 withWriteOptions:(int)a6
{
  uint64_t v6;
  id v11;
  id v12;
  id v13;
  CPMLDB *v14;
  CPMLDB *v15;
  objc_super v17;

  v6 = *(_QWORD *)&a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CPMLDB;
  v14 = -[CPMLDB init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_cInfo, a5);
    objc_storeStrong((id *)&v15->_trainingFile, a4);
    v15->_openCPMLDBOptions = v6;
    objc_storeStrong((id *)&v15->_trainingModelFileAndPath, a3);
    -[CPMLDB doInitializeWithDataFile:dataFromFile:withConfiguration:withWriteOptions:](v15, "doInitializeWithDataFile:dataFromFile:withConfiguration:withWriteOptions:", v11, v12, v13, v6);
  }

  return v15;
}

- (void)doInitializeWithDataFile:(id)a3 dataFromFile:(id)a4 withConfiguration:(id)a5 withWriteOptions:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  sqlite3 *db;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t i;
  void *v23;
  char v24;
  char v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  unint64_t j;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  double v36;
  sqlite3_stmt *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  unint64_t v57;
  id v58;
  void *v59;
  CPMLDB *v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  sqlite3_stmt *ppStmt;
  _BYTE v67[9];

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v53 = a4;
  v11 = a5;
  v67[0] = 0;
  v52 = v10;
  -[CPMLDB doInitCommon:withDict:withFileExists:withWriteOptions:](self, "doInitCommon:withDict:withFileExists:withWriteOptions:", v10, v11, v67, v6);
  objc_msgSend(v11, "objectForKey:", CFSTR("csvType"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v53, 4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r"), CFSTR("\n"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v13;
  objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("\n"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPMLDB prepInsertStatementForMainTable](self, "prepInsertStatementForMainTable");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v58 = v11;
  v60 = self;
  while (objc_msgSend(v56, "count") - 1 > v14)
  {
    v57 = v14;
    ppStmt = 0;
    db = self->db;
    v16 = objc_retainAutorelease(v54);
    v17 = sqlite3_prepare_v2(db, (const char *)objc_msgSend(v16, "UTF8String"), objc_msgSend(v16, "length"), &ppStmt, 0);
    if ((_DWORD)v17)
      NSLog(CFSTR("%s prepare fail reason %d"), "-[CPMLDB doInitializeWithDataFile:dataFromFile:withConfiguration:withWriteOptions:]", v17);
    if (objc_msgSend(v55, "isEqualToString:", CFSTR("TAB")))
    {
      objc_msgSend(v56, "objectAtIndex:", v57);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("\t"));
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v20 = (void *)v19;

      goto LABEL_11;
    }
    if (objc_msgSend(v55, "isEqualToString:", CFSTR("COMMA")))
    {
      objc_msgSend(v56, "objectAtIndex:", v57);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(","));
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v20 = 0;
LABEL_11:
    v21 = objc_msgSend(v20, "count");
    if (v21 != -[CPMLSchema getTotalAttributes](v60->cpSchema, "getTotalAttributes"))
    {
      NSLog(CFSTR("%s incorrect attribute count %ld vs input item set %ld"), "-[CPMLDB doInitializeWithDataFile:dataFromFile:withConfiguration:withWriteOptions:]", -[CPMLSchema getTotalAttributes](v60->cpSchema, "getTotalAttributes"), objc_msgSend(v20, "count"));

      goto LABEL_47;
    }
    for (i = 0; ; ++i)
    {
      self = v60;
      if (i >= objc_msgSend(v20, "count"))
        break;
      objc_msgSend(v20, "objectAtIndex:", i);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[CPMLSchema matchSubstituteValue:theValue:](v60->cpSchema, "matchSubstituteValue:theValue:", i, v23);
      if (v23)
        v25 = v24;
      else
        v25 = 1;
      if ((v25 & 1) != 0 || objc_msgSend(v23, "isEqualToString:", &stru_24C256E28))
      {
        -[CPMLSchema getSubstituteValue:](v60->cpSchema, "getSubstituteValue:", i);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = v23;
      }
      if (-[CPMLSchema isStringType:](v60->cpSchema, "isStringType:", i))
      {
        sqlite3_bind_text(ppStmt, i + 1, (const char *)objc_msgSend(objc_retainAutorelease(v26), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      }
      else if (-[CPMLSchema isVectorType:](v60->cpSchema, "isVectorType:", i))
      {
        v65 = 83;
        v27 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
        v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("key%d"), i);
        -[NSMutableDictionary objectForKey:](v60->vectorListCardinality, "objectForKey:", v59);
        v28 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "appendBytes:length:", &v65, 1);
        if (!v28)
        {
          v28 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          -[NSMutableDictionary setObject:forKey:](v60->vectorListCardinality, "setObject:forKey:");
        }
        objc_msgSend(v26, "componentsSeparatedByString:", CFSTR(","));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 0;
        v64 = objc_msgSend(v29, "count");
        objc_msgSend(v27, "appendBytes:length:", &v64, 8);
        for (j = 0; j < objc_msgSend(v29, "count"); ++j)
        {
          objc_msgSend(v29, "objectAtIndex:", j);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKey:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v32)
          {
            v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", 1);
            objc_msgSend(v28, "setObject:forKey:", v33, v31);

          }
          v63 = 0;
          v63 = objc_msgSend(v31, "length") + 1;
          objc_msgSend(v27, "appendBytes:length:", &v63, 8);
          v34 = objc_retainAutorelease(v31);
          v35 = objc_msgSend(v34, "UTF8String");
          objc_msgSend(v27, "appendBytes:length:", v35, v63);

        }
        v37 = ppStmt;
        v38 = objc_retainAutorelease(v27);
        sqlite3_bind_blob(v37, i + 1, (const void *)objc_msgSend(v38, "mutableBytes"), objc_msgSend(v38, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

        v11 = v58;
      }
      else
      {
        -[CPMLDB updateStatisticsString:colPosition:](v60, "updateStatisticsString:colPosition:", v26, i);
        sqlite3_bind_double(ppStmt, i + 1, v36);
      }

    }
    v39 = sqlite3_step(ppStmt);
    if ((_DWORD)v39 == 101)
      ++v60->rowCount;
    else
      NSLog(CFSTR("%s: Error iterating rows %d\n"), "-[CPMLDB doInitializeWithDataFile:dataFromFile:withConfiguration:withWriteOptions:]", v39);
    sqlite3_finalize(ppStmt);

    v14 = v57 + 1;
  }
  -[CPMLDB initStatisticsTable](self, "initStatisticsTable");
  -[CPMLDB updateStatistics](self, "updateStatistics");
  objc_msgSend(v11, "objectForKey:", CFSTR("FileProtection"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  objc_msgSend(v41, "attributesOfItemAtPath:error:", v52, &v62);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v62;

  v44 = *MEMORY[0x24BDD0CF0];
  objc_msgSend(v42, "objectForKey:", *MEMORY[0x24BDD0CF0]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPMLDB fileProtectionClassRequest:](v60, "fileProtectionClassRequest:", v40);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "isEqualToString:", v46) && v67[0] || !v46)
  {
    v50 = v43;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v46, v44);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v43;
    v49 = objc_msgSend(v48, "setAttributes:ofItemAtPath:error:", v47, v52, &v61);
    v50 = v61;

    if ((v49 & 1) == 0)
      NSLog(CFSTR("%s: Could not set file protection to NSFileProtectionComplete\n"), "-[CPMLDB doInitializeWithDataFile:dataFromFile:withConfiguration:withWriteOptions:]");

  }
LABEL_47:

}

- (void)loadTables
{
  void *v3;
  sqlite3 *db;
  id v5;
  uint64_t v6;
  sqlite3_stmt *ppStmt;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("select date from %@ ORDER BY pkey DESC LIMIT 1;"),
                 CFSTR("DATEINDEX"));
  ppStmt = 0;
  db = self->db;
  v5 = objc_retainAutorelease(v3);
  if (sqlite3_prepare_v2(db, (const char *)objc_msgSend(v5, "UTF8String"), objc_msgSend(v5, "length"), &ppStmt, 0))
    NSLog(CFSTR("%s prepare fail"), "-[CPMLDB loadTables]");
  v6 = sqlite3_step(ppStmt);
  if ((_DWORD)v6 != 101)
  {
    if ((_DWORD)v6 == 100)
      self->currentTimeInterval = sqlite3_column_double(ppStmt, 0);
    else
      NSLog(CFSTR("columnQueryFor: Error iterating rows %d\n"), v6);
  }
  sqlite3_finalize(ppStmt);

}

- (void)dealloc
{
  objc_super v3;

  -[CPMLDB restart](self, "restart");
  v3.receiver = self;
  v3.super_class = (Class)CPMLDB;
  -[CPMLDB dealloc](&v3, sel_dealloc);
}

- (void)restart
{
  sqlite3 *db;
  unint64_t *repFields;
  double *cardinality;
  double *min;
  double *max;
  double *mean;
  double *sumOfX;
  double *sumOfXX;
  double *sigma;
  CPMLSchema *cpSchema;
  NSMutableArray *indexer;
  NSMutableDictionary *vectorListCardinality;
  NSMutableString *dbTableName;

  db = self->db;
  if (db)
    sqlite3_close(db);
  repFields = self->repFields;
  if (repFields)
    free(repFields);
  cardinality = self->cardinality;
  if (cardinality)
    free(cardinality);
  min = self->min;
  if (min)
    free(min);
  max = self->max;
  if (max)
    free(max);
  mean = self->mean;
  if (mean)
    free(mean);
  sumOfX = self->sumOfX;
  if (sumOfX)
    free(sumOfX);
  sumOfXX = self->sumOfXX;
  if (sumOfXX)
    free(sumOfXX);
  sigma = self->sigma;
  if (sigma)
    free(sigma);
  self->maxFieldCount = 0;
  *(_QWORD *)&self->commitCountMax = 0;
  self->rowCount = 0;
  cpSchema = self->cpSchema;
  self->cpSchema = 0;

  indexer = self->indexer;
  self->indexer = 0;

  vectorListCardinality = self->vectorListCardinality;
  self->vectorListCardinality = 0;

  dbTableName = self->dbTableName;
  self->dbTableName = 0;

  self->currentTimeInterval = 0.0;
  self->minTimeToLogIndex = 0.0;
}

- (void)flushDB
{
  NSObject *dispatch_queue;
  _QWORD block[5];

  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __17__CPMLDB_flushDB__block_invoke;
  block[3] = &unk_24C2562F8;
  block[4] = self;
  dispatch_sync(dispatch_queue, block);
}

void __17__CPMLDB_flushDB__block_invoke(uint64_t a1)
{
  uint64_t v1;
  CPMLLog *v3;
  pthread_mutex_t *CPMLLog;
  char *errmsg;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v1 + 28))
  {
    errmsg = 0;
    v3 = (CPMLLog *)sqlite3_exec(*(sqlite3 **)(v1 + 192), "END TRANSACTION;",
                      (int (__cdecl *)(void *, int, char **, char **))callbackDBResponse,
                      0,
                      &errmsg);
    if ((_DWORD)v3)
    {
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v3);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "-[CPMLDB flushDB]_block_invoke", "SQL End TransactionError %s.", errmsg);
      sqlite3_free(errmsg);
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) = 0;
  }
}

- (id)prepInsertStatementForMainTable
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("INSERT INTO MAIN_TABLE VALUES("));
  v4 = -[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes");
  if (v4 >= 1)
  {
    v5 = 0;
    do
    {
      if (v4 <= ++v5)
        v6 = CFSTR("?");
      else
        v6 = CFSTR("?,");
      objc_msgSend(v3, "appendString:", v6);
    }
    while (v4 != v5);
  }
  objc_msgSend(v3, "appendString:", CFSTR(" , $pKey);"));
  return v3;
}

- (BOOL)logCTypesV:(void *)a3
{
  id v5;
  uint64_t v6;
  int *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int **v12;
  BOOL v13;
  int **v15;
  uint64_t v16;

  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = (int **)&v16;
  v6 = 0;
  if (a3)
  {
    v7 = (int *)a3;
    do
    {
      if ((unint64_t)a3 >= 2)
      {
        -[CPMLSchema getColumnName:](self->cpSchema, "getColumnName:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[CPMLSchema getSchemaType:](self->cpSchema, "getSchemaType:", v6);
        switch(v9)
        {
          case 3:
            v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", *v7);
            break;
          case 4:
            v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", *(double *)v7);
            break;
          case 5:
            v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v7, 4);
            break;
          default:
            NSLog(CFSTR("%s: No support"), "-[CPMLDB logCTypesV:]");

LABEL_15:
            v13 = 0;
            goto LABEL_16;
        }
        v11 = (void *)v10;
        objc_msgSend(v5, "setObject:forKey:", v10, v8);
        ++v6;

      }
      v12 = v15++;
      v7 = *v12;
    }
    while (*v12);
  }
  if (v6 != -[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes"))
  {
    NSLog(CFSTR("%s column count does not match declared schema."), "-[CPMLDB logCTypesV:]");
    goto LABEL_15;
  }
  v13 = -[CPMLDB logNSDictionary:](self, "logNSDictionary:", v5);
LABEL_16:

  return v13;
}

- (BOOL)logNSObjectV:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  BOOL v13;
  id *v15;
  uint64_t v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = (id *)&v16;
  v6 = v4;
  v7 = v6;
  v8 = 0;
  if (v6)
  {
    v9 = v6;
    do
    {
      -[CPMLSchema getColumnName:](self->cpSchema, "getColumnName:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v9, v10);
      ++v8;

      v11 = v15++;
      v12 = *v11;

      v9 = v12;
    }
    while (v12);
  }
  if (-[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes") != v8 + 1)
  {
    NSLog(CFSTR("%s insufficient parameters"), "-[CPMLDB logNSObjectV:]");
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  if (v8 != -[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes"))
  {
    NSLog(CFSTR("%s column count does not match declared schema."), "-[CPMLDB logNSObjectV:]");
    goto LABEL_9;
  }
  v13 = -[CPMLDB logNSDictionary:](self, "logNSDictionary:", v5);
LABEL_10:

  return v13;
}

- (BOOL)logNSArray:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  id v7;
  unint64_t i;
  unint64_t v9;
  CPMLSchema *cpSchema;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 <= -[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes"))
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    for (i = 0; ; ++i)
    {
      v9 = objc_msgSend(v4, "count");
      cpSchema = self->cpSchema;
      if (i >= v9)
        break;
      -[CPMLSchema getColumnName:](cpSchema, "getColumnName:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v12, v11);

    }
    v13 = -[CPMLSchema getTotalAttributes](cpSchema, "getTotalAttributes");
    if (v13 == objc_msgSend(v4, "count"))
    {
      v6 = -[CPMLDB logNSDictionary:](self, "logNSDictionary:", v7);
    }
    else
    {
      NSLog(CFSTR("%s insufficient parameters"), "-[CPMLDB logNSArray:]");
      v6 = 0;
    }

  }
  else
  {
    NSLog(CFSTR("%s Error: Cannot log more than declared schema."), "-[CPMLDB logNSArray:]");
    v6 = 0;
  }

  return v6;
}

- (BOOL)logBatchNSArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        if (!-[CPMLDB logNSArray:](self, "logNSArray:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)))
        {
          NSLog(CFSTR("%s Failed to batch log"), "-[CPMLDB logBatchNSArray:]");
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)logNSDictionary:(id)a3
{
  id v4;
  NSObject *dispatch_queue;
  id v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  char v11;
  uint64_t block;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  CPMLDB *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  dispatch_queue = self->_dispatch_queue;
  block = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __26__CPMLDB_logNSDictionary___block_invoke;
  v16 = &unk_24C2562A8;
  v17 = self;
  v6 = v4;
  v18 = v6;
  v19 = &v20;
  dispatch_sync(dispatch_queue, &block);
  -[CPMLDB initStatisticsTable](self, "initStatisticsTable");
  -[CPMLDB updateStatistics](self, "updateStatistics");
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v8 = v7;
  if (v7 > self->currentTimeInterval + self->minTimeToLogIndex)
  {
    self->currentTimeInterval = v7;
    v9 = objc_alloc(MEMORY[0x24BDD17C8]);
    v10 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("(%@) VALUES(%d,%f);"),
                    CFSTR("pKeyIndex, date"),
                    self->rowCount,
                    *(_QWORD *)&v8,
                    block,
                    v14,
                    v15,
                    v16,
                    v17);
    -[CPMLDB insertIntoTable:withTuple:](self, "insertIntoTable:withTuple:", CFSTR("DATEINDEX"), v10);

  }
  v11 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __26__CPMLDB_logNSDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  sqlite3 *v5;
  id v6;
  CPMLLog *v7;
  pthread_mutex_t *CPMLLog;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  CPMLLog *v12;
  pthread_mutex_t *v13;
  char *errmsg;
  _QWORD v15[6];
  sqlite3_stmt *ppStmt;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v2 + 28))
  {
    ppStmt = 0;
    v7 = (CPMLLog *)sqlite3_exec(*(sqlite3 **)(v2 + 192), "BEGIN TRANSACTION;",
                      (int (__cdecl *)(void *, int, char **, char **))callbackDBResponse,
                      0,
                      (char **)&ppStmt);
    if ((_DWORD)v7)
    {
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v7);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "-[CPMLDB logNSDictionary:]_block_invoke", "SQL Begin TransactionError %s.", (const char *)ppStmt);
      sqlite3_free(ppStmt);
      return;
    }
    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = objc_msgSend(*(id *)(v2 + 96), "getTotalAttributes");
  if (v3 != objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    NSLog(CFSTR("%s insufficient parameters"), "-[CPMLDB logNSDictionary:]_block_invoke");
    return;
  }
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 32), "prepInsertStatementForMainTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ppStmt = 0;
  v5 = *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 192);
  v6 = objc_retainAutorelease(v4);
  if (!sqlite3_prepare_v2(v5, (const char *)objc_msgSend(v6, "UTF8String"), objc_msgSend(v6, "length"), &ppStmt, 0))
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __26__CPMLDB_logNSDictionary___block_invoke_2;
    v15[3] = &unk_24C256320;
    v9 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v15[5] = ppStmt;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);
    v10 = sqlite3_step(ppStmt);
    if ((_DWORD)v10 != 101)
    {
      --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32);
      NSLog(CFSTR("%s: Error iterating rows %d\n"), "-[CPMLDB logNSDictionary:]_block_invoke", v10);
      goto LABEL_16;
    }
    sqlite3_finalize(ppStmt);
    ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 28);
    v11 = *(_QWORD *)(a1 + 32);
    if (*(_DWORD *)(v11 + 28) == *(_DWORD *)(v11 + 24))
    {
      errmsg = 0;
      v12 = (CPMLLog *)sqlite3_exec(*(sqlite3 **)(v11 + 192), "END TRANSACTION;",
                         (int (__cdecl *)(void *, int, char **, char **))callbackDBResponse,
                         0,
                         &errmsg);
      if ((_DWORD)v12)
      {
        v13 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v12);
        CPMLLog::log(v13, CPML_LOG_ERR, "-[CPMLDB logNSDictionary:]_block_invoke", "SQL End TransactionError %s.", errmsg);
        sqlite3_free(errmsg);
        goto LABEL_16;
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) = 0;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_16;
  }
  NSLog(CFSTR("%s prepare fail"), "-[CPMLDB logNSDictionary:]_block_invoke");
LABEL_16:

}

void __26__CPMLDB_logNSDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  sqlite3_stmt *v11;
  int v12;
  void *v13;
  id v14;
  double v15;
  id v16;
  id v17;
  unint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  sqlite3_stmt *v26;
  double v27;
  sqlite3_stmt *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "getColumnPosition:", v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "matchSubstituteValue:theValue:", (int)v7, v6);
    if (v6)
      v9 = v8;
    else
      v9 = 1;
    if ((v9 & 1) != 0 || objc_msgSend(v6, "isEqualToString:", &stru_24C256E28))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "getSubstituteValue:", (int)v7);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v10;
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isStringType:", (int)v7))
    {
      v11 = *(sqlite3_stmt **)(a1 + 40);
      v6 = objc_retainAutorelease(v6);
      sqlite3_bind_text(v11, v7 + 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      NSLog(CFSTR("%s String incorrect schema mapping"), "-[CPMLDB logNSDictionary:]_block_invoke_2");
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "matchSubstituteValue:theValue:", (int)v7, v6) ^ 1;
      if (!v6)
        LOBYTE(v12) = 0;
      if ((v12 & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "getSubstituteValue:", (int)v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc(MEMORY[0x24BDD16E0]);
        if (v13)
          objc_msgSend(v13, "doubleValue");
        else
          v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 8 * (int)v7);
        v24 = objc_msgSend(v14, "initWithDouble:", v15);

        v6 = (id)v24;
      }
      v25 = *(void **)(a1 + 32);
      objc_msgSend(v6, "doubleValue");
      objc_msgSend(v25, "updateStatisticsReal:colPosition:", (int)v7);
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isRealType:", (int)v7))
      {
        v26 = *(sqlite3_stmt **)(a1 + 40);
        objc_msgSend(v6, "doubleValue");
        sqlite3_bind_double(v26, v7 + 1, v27);
      }
      else if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isIntType:", (int)v7))
      {
        sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 40), v7 + 1, objc_msgSend(v6, "unsignedIntValue"));
      }
      else
      {
        NSLog(CFSTR("%s NSNumber incorrect schema mapping"), "-[CPMLDB logNSDictionary:]_block_invoke_2");
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isVectorType:", (int)v7))
        {
          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "getVectorContent:", (int)v7) == 5)
          {
            v33 = 83;
            v16 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
            v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("key%d"), v7);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKey:", v30);
            v17 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "appendBytes:length:", &v33, 1);
            if (!v17)
            {
              v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setObject:forKey:");
            }
            v32 = objc_msgSend(v6, "count");
            objc_msgSend(v16, "appendBytes:length:", &v32, 8);
            for (i = 0; i < objc_msgSend(v6, "count"); ++i)
            {
              objc_msgSend(v6, "objectAtIndex:", i);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKey:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v20)
              {
                v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", 1);
                objc_msgSend(v17, "setObject:forKey:", v21, v19);

              }
              v31 = 0;
              v31 = objc_msgSend(v19, "length") + 1;
              objc_msgSend(v16, "appendBytes:length:", &v31, 8);
              v22 = objc_retainAutorelease(v19);
              v23 = objc_msgSend(v22, "UTF8String");
              objc_msgSend(v16, "appendBytes:length:", v23, v31);

            }
            v28 = *(sqlite3_stmt **)(a1 + 40);
            v29 = objc_retainAutorelease(v16);
            sqlite3_bind_blob(v28, v7 + 1, (const void *)objc_msgSend(v29, "mutableBytes"), objc_msgSend(v29, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

          }
          else
          {
            NSLog(CFSTR("%s VType NOT SUPPORTED"), "-[CPMLDB logNSDictionary:]_block_invoke_2");
          }
        }
        else
        {
          NSLog(CFSTR("%s Vector incorrect schema mapping"), "-[CPMLDB logNSDictionary:]_block_invoke_2");
        }
      }
      else
      {
        NSLog(CFSTR("%s unknown class"), "-[CPMLDB logNSDictionary:]_block_invoke_2");
      }
    }
  }

}

- (BOOL)logBatchNSDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        if (!-[CPMLDB logNSDictionary:](self, "logNSDictionary:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)))
        {
          NSLog(CFSTR("%s Failed to batch log"), "-[CPMLDB logBatchNSDictionary:]");
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)logNSDataFloat:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = -[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes");
  if (v5 == (unint64_t)objc_msgSend(v4, "length") >> 2 && objc_msgSend(v4, "length"))
  {
    v6 = (void *)objc_opt_new();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __25__CPMLDB_logNSDataFloat___block_invoke;
    v10[3] = &unk_24C256348;
    v7 = v6;
    v11 = v7;
    objc_msgSend(v4, "enumerateByteRangesUsingBlock:", v10);
    v8 = -[CPMLDB logNSArray:](self, "logNSArray:", v7);

  }
  else
  {
    NSLog(CFSTR("%s Number of attributes (%ld) doesn't match input length (%ld)"), "-[CPMLDB logNSDataFloat:]", -[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes"), (unint64_t)objc_msgSend(v4, "length") >> 2);
    v8 = 0;
  }

  return v8;
}

void __25__CPMLDB_logNSDataFloat___block_invoke(uint64_t a1, _DWORD *a2, double a3, uint64_t a4, char a5)
{
  void *v5;
  id v6;

  if ((a5 & 3) == 0)
  {
    v5 = *(void **)(a1 + 32);
    LODWORD(a3) = *a2;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:");

  }
}

- (BOOL)logNSDataDouble:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = -[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes");
  if (v5 == (unint64_t)objc_msgSend(v4, "length") >> 3 && objc_msgSend(v4, "length"))
  {
    v6 = (void *)objc_opt_new();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __26__CPMLDB_logNSDataDouble___block_invoke;
    v10[3] = &unk_24C256348;
    v7 = v6;
    v11 = v7;
    objc_msgSend(v4, "enumerateByteRangesUsingBlock:", v10);
    v8 = -[CPMLDB logNSArray:](self, "logNSArray:", v7);

  }
  else
  {
    NSLog(CFSTR("%s Number of attributes (%ld) doesn't match input length (%ld)"), "-[CPMLDB logNSDataDouble:]", -[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes"), (unint64_t)objc_msgSend(v4, "length") >> 3);
    v8 = 0;
  }

  return v8;
}

void __26__CPMLDB_logNSDataDouble___block_invoke(uint64_t a1, double *a2, uint64_t a3, char a4)
{
  void *v4;
  id v5;

  if ((a4 & 7) == 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:");

  }
}

- (void)execSQLCommand:(id)a3
{
  id v4;
  NSObject *dispatch_queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__CPMLDB_execSQLCommand___block_invoke;
  block[3] = &unk_24C256280;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatch_queue, block);

}

void __25__CPMLDB_execSQLCommand___block_invoke(uint64_t a1)
{
  CPMLLog *v1;
  pthread_mutex_t *CPMLLog;
  char *errmsg;

  errmsg = 0;
  v1 = (CPMLLog *)sqlite3_exec(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 192), (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), (int (__cdecl *)(void *, int, char **, char **))callbackDBResponse, *(void **)(a1 + 32), &errmsg);
  if ((_DWORD)v1)
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v1);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "-[CPMLDB execSQLCommand:]_block_invoke", "SQL error: %s \n", errmsg);
    sqlite3_free(errmsg);
  }
}

- (void)createTable:(id)a3 withSchema:(id)a4 withExistingTable:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  if (v5)
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@ (%@, pKey INTEGER PRIMARY KEY);"),
           v11,
           v8);
  else
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("DROP TABLE IF EXISTS %@; CREATE TABLE %@ (%@, pKey INTEGER PRIMARY KEY);"),
           v11,
           v11,
           v8);
  v10 = (void *)v9;
  -[CPMLDB execSQLCommand:](self, "execSQLCommand:", v9);

}

- (void)addColumnToTable:(id)a3 withNewColumn:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("ALTER TABLE %@ ADD COLUMN %@"), v8, v6);
  -[CPMLDB execSQLCommand:](self, "execSQLCommand:", v7);

}

- (void)insertIntoTable:(id)a3 withTuple:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("INSERT INTO %@ %@ ;"), v8, v6);
  -[CPMLDB execSQLCommand:](self, "execSQLCommand:", v7);

}

- (void)queryDatabase:(id)a3 whereMatch:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("SELECT * from %@ WHERE %@"), v8, v6);
  -[CPMLDB execSQLCommand:](self, "execSQLCommand:", v7);

}

- (void)updateTable:(id)a3 withAttribute:(id)a4 whereMatch:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("UPDATE %@ set %@ %@"), v11, v8, v9);
  -[CPMLDB execSQLCommand:](self, "execSQLCommand:", v10);

}

- (void)deleteRow:(id)a3 whereMatch:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("DELETE from %@ where %@"), v8, v6);
  -[CPMLDB execSQLCommand:](self, "execSQLCommand:", v7);

}

- (void)deleteAllRows:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("DELETE from %@"), v5);
  -[CPMLDB execSQLCommand:](self, "execSQLCommand:", v4);

}

- (void)dropCommands:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR(" DROP TABLE IF EXISTS %@ ;"), v5);
  -[CPMLDB execSQLCommand:](self, "execSQLCommand:", v4);

}

- (unint64_t)getCombinedRemapTableCardinality:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t i;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v3 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  -[CPMLSchema nsRemapTable](self->cpSchema, "nsRemapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = v3;

  if (v6 >= v3)
  {
    v8 = 0;
  }
  else
  {
    NSLog(CFSTR("%s attribute pos greater than schema length"), "-[CPMLDB getCombinedRemapTableCardinality:]");
    v8 = -[CPMLDB getCardinality:](self, "getCardinality:", v3);
  }
  v9 = (void *)objc_opt_new();
  -[CPMLSchema nsRemapTable](self->cpSchema, "nsRemapTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; ; ++i)
  {
    -[CPMLSchema nsRemapTable](self->cpSchema, "nsRemapTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 <= i)
      break;
    -[CPMLSchema nsRemapTable](self->cpSchema, "nsRemapTable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v15) = objc_msgSend(v11, "intValue");
    if ((_DWORD)v15 == objc_msgSend(v16, "intValue"))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", i);
      objc_msgSend(v9, "addObject:", v17);

    }
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v24;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v18);
        v8 += -[CPMLDB getCardinality:](self, "getCardinality:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v21++), "intValue"));
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v19);
  }

  return v8;
}

- (unint64_t)getCardinality:(unsigned int)a3
{
  NSObject *dispatch_queue;
  unint64_t v4;
  _QWORD block[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__CPMLDB_getCardinality___block_invoke;
  block[3] = &unk_24C256370;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(dispatch_queue, block);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __25__CPMLDB_getCardinality___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  sqlite3 *v7;
  id v8;
  uint64_t v9;
  id v10;
  sqlite3_stmt *ppStmt;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "getUserDefinedCategoricalDataCount:", *(unsigned int *)(a1 + 48));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isVectorType:", *(unsigned int *)(a1 + 48)))
    {
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("key%d"), *(unsigned int *)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKey:");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      if (v2)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

        return;
      }
      v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("select cardinality from STATISTICS where rowid=%u;"),
             (*(_DWORD *)(a1 + 48) + 1));
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "attribute");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndex:", *(unsigned int *)(a1 + 48));
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("select count (DISTINCT %@) from MAIN_TABLE;"),
             v10);
    }
    v6 = (void *)v5;

    ppStmt = 0;
    v7 = *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 192);
    v8 = objc_retainAutorelease(v6);
    if (sqlite3_prepare_v2(v7, (const char *)objc_msgSend(v8, "UTF8String"), objc_msgSend(v8, "length"), &ppStmt, 0))
      NSLog(CFSTR("%s getCardinality prepare fail %s"), "-[CPMLDB getCardinality:]_block_invoke", objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    v9 = sqlite3_step(ppStmt);
    if ((_DWORD)v9 != 101)
    {
      if ((_DWORD)v9 == 100)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_column_int(ppStmt, 0);
      else
        NSLog(CFSTR("getCardinality: Error iterating rows %d\n"), v9);
    }
    sqlite3_finalize(ppStmt);

  }
}

- (unint64_t)getColumnCount
{
  return -[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes");
}

- (unint64_t)getRowCount
{
  NSObject *dispatch_queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatch_queue = self->_dispatch_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __21__CPMLDB_getRowCount__block_invoke;
  v5[3] = &unk_24C2562D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatch_queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__CPMLDB_getRowCount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 192), "SELECT COUNT (*) FROM MAIN_TABLE;",
         33,
         &ppStmt,
         0))
  {
    NSLog(CFSTR("getRowCount prepare fail"));
  }
  v2 = sqlite3_step(ppStmt);
  if ((_DWORD)v2 != 101)
  {
    if ((_DWORD)v2 == 100)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_column_int(ppStmt, 0);
    else
      NSLog(CFSTR("getIndexValueWith: Error iterating rows %d\n"), v2);
  }
  return sqlite3_finalize(ppStmt);
}

- (double)getMeanFor:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = *(_QWORD *)&a3;
  -[CPMLSchema attribute](self->cpSchema, "attribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT AVG (%@) FROM MAIN_TABLE;"),
                 v6);
  -[CPMLDB columnQueryFor:withQuery:](self, "columnQueryFor:withQuery:", v3, v7);
  v9 = v8;

  return v9;
}

- (double)getStdDevFor:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = *(_QWORD *)&a3;
  -[CPMLSchema attribute](self->cpSchema, "attribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT AVG((MAIN_TABLE.%@-sub.a)*(MAIN_TABLE.%@-sub.a)) as var from MAIN_TABLE, (SELECT AVG(%@) AS a FROM MAIN_TABLE) AS sub;"),
                 v6,
                 v6,
                 v6);
  -[CPMLDB columnQueryFor:withQuery:](self, "columnQueryFor:withQuery:", v3, v7);
  v9 = sqrt(v8);

  return v9;
}

- (double)getMinFor:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = *(_QWORD *)&a3;
  -[CPMLSchema attribute](self->cpSchema, "attribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT MIN(%@) from MAIN_TABLE;"),
                 v6);
  -[CPMLDB columnQueryFor:withQuery:](self, "columnQueryFor:withQuery:", v3, v7);
  v9 = v8;

  return v9;
}

- (double)getMaxFor:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = *(_QWORD *)&a3;
  -[CPMLSchema attribute](self->cpSchema, "attribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT MAX(%@) from MAIN_TABLE;"),
                 v6);
  -[CPMLDB columnQueryFor:withQuery:](self, "columnQueryFor:withQuery:", v3, v7);
  v9 = v8;

  return v9;
}

- (double)columnQueryFor:(unsigned int)a3 withQuery:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  double v9;
  NSObject *dispatch_queue;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  -[CPMLSchema attribute](self->cpSchema, "attribute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 >= a3)
  {
    v15 = 0;
    v16 = (double *)&v15;
    v17 = 0x2020000000;
    v18 = 0;
    dispatch_queue = self->_dispatch_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__CPMLDB_columnQueryFor_withQuery___block_invoke;
    block[3] = &unk_24C2562A8;
    block[4] = self;
    v13 = v6;
    v14 = &v15;
    dispatch_sync(dispatch_queue, block);
    v9 = v16[3];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    NSLog(CFSTR("columnQueryFor: column greater than attribute"));
    v9 = 1.79769313e308;
  }

  return v9;
}

uint64_t __35__CPMLDB_columnQueryFor_withQuery___block_invoke(uint64_t a1)
{
  uint64_t v2;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 192), (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), objc_msgSend(*(id *)(a1 + 40), "length"), &ppStmt, 0))
  {
    NSLog(CFSTR("columnQueryFor prepare fail"));
  }
  v2 = sqlite3_step(ppStmt);
  if ((_DWORD)v2 != 101)
  {
    if ((_DWORD)v2 == 100)
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sqlite3_column_double(ppStmt, 0);
    else
      NSLog(CFSTR("columnQueryFor: Error iterating rows %d\n"), v2);
  }
  return sqlite3_finalize(ppStmt);
}

- (BOOL)isColumnContinousData:(unsigned int)a3
{
  return -[CPMLSchema isColumnContinous:](self->cpSchema, "isColumnContinous:", *(_QWORD *)&a3);
}

- (void)updateStatisticsReal:(double)a3 colPosition:(unint64_t)a4
{
  double *sumOfX;
  double *mean;
  double *sumOfXX;
  double v9;
  double v10;
  double v11;
  double v12;

  mean = self->mean;
  sumOfX = self->sumOfX;
  sumOfX[a4] = sumOfX[a4] + a3;
  sumOfXX = self->sumOfXX;
  v9 = sumOfXX[a4];
  sumOfXX[a4] = v9 + a3 * a3;
  LODWORD(v9) = self->rowCount;
  v10 = (double)*(unint64_t *)&v9 + 1.0;
  v11 = sumOfX[a4] / v10;
  mean[a4] = v11;
  v12 = sumOfXX[a4] / v10 - v11 * v11;
  if (v12 < 0.0)
  {
    NSLog(CFSTR("%s -ve sigma^2"), a2, "-[CPMLDB updateStatisticsReal:colPosition:]");
    v12 = 1.0;
  }
  self->sigma[a4] = sqrt(v12);
}

- (double)updateStatisticsString:(id)a3 colPosition:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  v6 = a3;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v7, "setNumberStyle:", 1);
    objc_msgSend(v7, "numberFromString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", self->mean[a4]);
  }
  objc_msgSend(v8, "doubleValue");
  -[CPMLDB updateStatisticsReal:colPosition:](self, "updateStatisticsReal:colPosition:", a4);
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  return v10;
}

- (void)initStatisticsTable
{
  -[CPMLDB dropCommands:](self, "dropCommands:", CFSTR("STATISTICS"));
  -[CPMLDB createTable:withSchema:withExistingTable:](self, "createTable:withSchema:withExistingTable:", CFSTR("STATISTICS"), CFSTR("cardinality REAL, mean REAL, sumofX REAL, sumofXX REAL, sigma REAL, min REAL, max REAL"), 0);
}

- (BOOL)loadStatisticTable
{
  NSObject *dispatch_queue;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dispatch_queue = self->_dispatch_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __28__CPMLDB_loadStatisticTable__block_invoke;
  v6[3] = &unk_24C2562D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(dispatch_queue, v6);
  if (*((_BYTE *)v8 + 24))
  {
    self->rowCount = -[CPMLDB getRowCount](self, "getRowCount");
    v4 = *((_BYTE *)v8 + 24) != 0;
  }
  else
  {
    v4 = 0;
    self->rowCount = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __28__CPMLDB_loadStatisticTable__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  sqlite3_stmt *v4;
  unint64_t i;
  unint64_t v6;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 192), (const char *)objc_msgSend(CFSTR("select * from STATISTICS;"), "UTF8String"),
         objc_msgSend(CFSTR("select * from STATISTICS;"), "length"),
         &ppStmt,
         0);
  if ((_DWORD)v2 == 1)
  {
    sqlite3_finalize(ppStmt);
  }
  else if ((_DWORD)v2)
  {
    NSLog(CFSTR("%s prepare fail %d"), "-[CPMLDB loadStatisticTable]_block_invoke", v2);
  }
  else
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "getTotalAttributes");
    v4 = ppStmt;
    if (v3)
    {
      for (i = 0; i < v6; ++i)
      {
        if (sqlite3_step(v4) == 100)
        {
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8 * i) = sqlite3_column_double(ppStmt, 0);
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 8 * i) = sqlite3_column_double(ppStmt, 1);
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 8 * i) = sqlite3_column_double(ppStmt, 2);
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 8 * i) = sqlite3_column_double(ppStmt, 3);
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) + 8 * i) = sqlite3_column_double(ppStmt, 4);
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 8 * i) = sqlite3_column_double(ppStmt, 5);
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 8 * i) = sqlite3_column_double(ppStmt, 6);
        }
        v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "getTotalAttributes");
        v4 = ppStmt;
      }
    }
    sqlite3_finalize(v4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)updateStatistics
{
  unint64_t v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes"))
  {
    v3 = 0;
    do
    {
      -[CPMLDB getMinFor:](self, "getMinFor:", v3);
      self->min[v3] = v4;
      -[CPMLDB getMaxFor:](self, "getMaxFor:", v3);
      self->max[v3] = v5;
      if (-[CPMLSchema isVectorType:](self->cpSchema, "isVectorType:", v3))
      {
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("key%d"), v3);
        -[NSMutableDictionary objectForKey:](self->vectorListCardinality, "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        self->cardinality[v3] = (double)(unint64_t)objc_msgSend(v7, "count");

      }
      else
      {
        self->cardinality[v3] = (double)-[CPMLDB getCardinality:](self, "getCardinality:", v3);
      }
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR(" (cardinality, mean, sumofX, sumofXX, sigma, min, max) VALUES (%lf, %lf, %lf, %lf, %lf, %lf, %lf) "), *(_QWORD *)&self->cardinality[v3], *(_QWORD *)&self->mean[v3], *(_QWORD *)&self->sumOfX[v3], *(_QWORD *)&self->sumOfXX[v3], *(_QWORD *)&self->sigma[v3], *(_QWORD *)&self->min[v3], *(_QWORD *)&self->max[v3]);
      -[CPMLDB insertIntoTable:withTuple:](self, "insertIntoTable:withTuple:", CFSTR("STATISTICS"), v8);

      ++v3;
    }
    while (v3 < -[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes"));
  }
}

- (void)indexTable:(id)a3 withColumn:(id)a4
{
  id v6;
  unint64_t i;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  for (i = 0; i < objc_msgSend(v6, "count"); ++i)
  {
    v8 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v6, "objectAtIndex:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ID%d"), v9, i);

    v11 = objc_alloc(MEMORY[0x24BDD16A8]);
    objc_msgSend(v6, "objectAtIndex:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@ ON %@ (%@);"),
                    v10,
                    v14,
                    v12);

    -[CPMLDB execSQLCommand:](self, "execSQLCommand:", v13);
  }

}

- (id)getColumnName:(unint64_t)a3
{
  return -[CPMLSchema getColumnName:](self->cpSchema, "getColumnName:", a3);
}

- (int)getSchemaType:(unint64_t)a3
{
  return -[CPMLSchema getSchemaType:](self->cpSchema, "getSchemaType:", a3);
}

- (int)getVectorContent:(unint64_t)a3
{
  return -[CPMLSchema getVectorContent:](self->cpSchema, "getVectorContent:", a3);
}

- (int)getYColumnPosition
{
  return -[CPMLSchema getYColumnPosition](self->cpSchema, "getYColumnPosition");
}

- (id)getRemapTable
{
  return -[CPMLSchema nsRemapTable](self->cpSchema, "nsRemapTable");
}

- (void)printFormat:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  id *v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)&v11;
  v5 = v3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    do
    {
      objc_msgSend(v4, "appendString:", v7);
      NSLog(CFSTR("-> %@"), v7);
      v8 = v10++;
      v9 = *v8;

      v7 = v9;
    }
    while (v9);
  }
  NSLog(CFSTR("--> %@"), v4);

}

- (id)addValues:(int)a3
{
  int v3;
  id v4;
  double v5;
  void *v6;
  id *v7;
  double v8;
  void *v9;
  id *v11;
  uint64_t v12;

  v11 = (id *)&v12;
  if (a3 < 1)
  {
    v4 = 0;
    v5 = 0.0;
  }
  else
  {
    v3 = a3;
    v4 = 0;
    v5 = 0.0;
    do
    {
      v6 = v4;
      v7 = v11++;
      v4 = *v7;

      objc_msgSend(v4, "doubleValue");
      v5 = v5 + v8;
      --v3;
    }
    while (v3);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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

- (id)extractRow:(id)a3
{
  id v4;
  int v5;
  NSObject *dispatch_queue;
  id v7;
  _QWORD block[4];
  id v10;
  CPMLDB *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = (id)objc_opt_new();
  if (v4)
  {
    v5 = objc_msgSend(v4, "intValue");
    if (-[CPMLDB getRowCount](self, "getRowCount") < v5)
    {
      NSLog(CFSTR("%s rowID:%d greater than total row count."), "-[CPMLDB extractRow:]", objc_msgSend(v4, "intValue"));
LABEL_6:
      v7 = (id)v14[5];
      goto LABEL_7;
    }
  }
  else if (!-[CPMLDB getRowCount](self, "getRowCount"))
  {
    goto LABEL_6;
  }
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __21__CPMLDB_extractRow___block_invoke;
  block[3] = &unk_24C2562A8;
  v10 = v4;
  v11 = self;
  v12 = &v13;
  dispatch_sync(dispatch_queue, block);
  v7 = (id)v14[5];

LABEL_7:
  _Block_object_dispose(&v13, 8);

  return v7;
}

sqlite3_stmt *__21__CPMLDB_extractRow___block_invoke(_QWORD *a1)
{
  void *v2;
  char *v3;
  char *v4;
  sqlite3 *v5;
  int v6;
  int v7;
  unint64_t i;
  void *v10;
  const unsigned __int8 *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  unsigned __int8 *v18;
  CPMLLog *v19;
  char *v20;
  int v21;
  uint64_t v22;
  size_t *v23;
  const char *v24;
  size_t v25;
  void *v26;
  pthread_mutex_t *CPMLLog;
  sqlite3_stmt *result;
  uint64_t v29;
  char *v30;
  sqlite3_stmt *ppStmt[2];

  ppStmt[1] = *(sqlite3_stmt **)MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  if (v2)
    v3 = sqlite3_mprintf("SELECT * FROM MAIN_TABLE where pKey = %d; ", objc_msgSend(v2, "intValue"));
  else
    v3 = sqlite3_mprintf("SELECT * FROM MAIN_TABLE ORDER BY pKey DESC LIMIT 1;");
  v4 = v3;
  ppStmt[0] = 0;
  v5 = *(sqlite3 **)(a1[5] + 192);
  v6 = strlen(v3);
  v30 = v4;
  sqlite3_prepare_v2(v5, v4, v6, ppStmt, 0);
  v7 = sqlite3_step(ppStmt[0]);
  if ((v7 - 100) >= 2 && v7 != 0)
  {
    NSLog(CFSTR("%s cannot query DB."), "-[CPMLDB extractRow:]_block_invoke");
    goto LABEL_28;
  }
  if (objc_msgSend(*(id *)(a1[5] + 96), "getTotalAttributes"))
  {
    for (i = 0; objc_msgSend(*(id *)(a1[5] + 96), "getTotalAttributes") > i; ++i)
    {
      objc_msgSend(*(id *)(a1[5] + 96), "getColumnName:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1[5] + 96), "isStringType:", i))
      {
        v11 = sqlite3_column_text(ppStmt[0], i);
        v12 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v11, 4);
        objc_msgSend(v12, "setObject:forKey:", v13, v10);
      }
      else if (objc_msgSend(*(id *)(a1[5] + 96), "isIntType:", i))
      {
        v14 = sqlite3_column_int(ppStmt[0], i);
        v15 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v14);
        objc_msgSend(v15, "setObject:forKey:", v13, v10);
      }
      else if (objc_msgSend(*(id *)(a1[5] + 96), "isRealType:", i))
      {
        v16 = sqlite3_column_double(ppStmt[0], i);
        v17 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", v16);
        objc_msgSend(v17, "setObject:forKey:", v13, v10);
      }
      else
      {
        if (!objc_msgSend(*(id *)(a1[5] + 96), "isVectorType:", i))
        {
          NSLog(CFSTR("%s unknown type"), "-[CPMLDB extractRow:]_block_invoke");

          break;
        }
        v13 = (void *)objc_opt_new();
        v18 = (unsigned __int8 *)sqlite3_column_blob(ppStmt[0], i);
        v19 = (CPMLLog *)sqlite3_column_bytes(ppStmt[0], i);
        v20 = (char *)&v29 - ((v19 + 15) & 0x1FFFFFFF0);
        v21 = *v18;
        if (v21 == 83)
        {
          v22 = *(_QWORD *)(v18 + 1);
          if (v22)
          {
            v23 = (size_t *)(v18 + 9);
            do
            {
              v25 = *v23;
              v24 = (const char *)(v23 + 1);
              strlcpy(v20, v24, v25);
              v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v20, 4);
              objc_msgSend(v13, "addObject:", v26);

              v23 = (size_t *)&v24[v25];
              --v22;
            }
            while (v22);
          }
        }
        else if (v21 == 78)
        {
          objc_msgSend(v13, "addObject:", &stru_24C256E28);
        }
        else
        {
          CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v19);
          CPMLLog::log(CPMLLog, CPML_LOG_ERR, "-[CPMLDB extractRow:]_block_invoke", "Encoding unsupported");
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKey:", v13, v10);
      }

    }
  }
LABEL_28:
  if (v30)
    sqlite3_free(v30);
  result = ppStmt[0];
  if (ppStmt[0])
    return (sqlite3_stmt *)sqlite3_finalize(ppStmt[0]);
  return result;
}

- (void)removeTrainingRow:(id)a3
{
  id v4;
  int v5;
  NSObject *dispatch_queue;
  _QWORD block[5];
  int v8;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(v4, "intValue");
      if (v5)
      {
        dispatch_queue = self->_dispatch_queue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __28__CPMLDB_removeTrainingRow___block_invoke;
        block[3] = &unk_24C256398;
        v8 = v5;
        block[4] = self;
        dispatch_async(dispatch_queue, block);
      }
    }
    else
    {
      NSLog(CFSTR("%s Not a number."), "-[CPMLDB removeTrainingRow:]");
    }
  }

}

sqlite3_stmt *__28__CPMLDB_removeTrainingRow___block_invoke(uint64_t a1)
{
  char *v2;
  int v3;
  int v4;
  sqlite3_stmt *result;
  int v7;
  sqlite3_stmt *ppStmt;

  v7 = *(_DWORD *)(a1 + 40);
  ppStmt = 0;
  v2 = sqlite3_mprintf("delete from MAIN_TABLE where pkey in(select pkey from MAIN_TABLE LIMIT %d);", v7);
  v3 = strlen(v2);
  sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 192), v2, v3, &ppStmt, 0);
  v4 = sqlite3_step(ppStmt);
  if ((v4 - 100) < 2 || v4 == 0)
  {
    if (!v2)
      goto LABEL_8;
  }
  else
  {
    NSLog(CFSTR("%s cannot query DB."), "-[CPMLDB removeTrainingRow:]_block_invoke");
    if (!v2)
      goto LABEL_8;
  }
  sqlite3_free(v2);
LABEL_8:
  result = ppStmt;
  if (ppStmt)
    return (sqlite3_stmt *)sqlite3_finalize(ppStmt);
  return result;
}

- (void)removeTrainingRowData:(double)a3
{
  NSObject *dispatch_queue;
  _QWORD v4[6];

  dispatch_queue = self->_dispatch_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__CPMLDB_removeTrainingRowData___block_invoke;
  v4[3] = &unk_24C2563C0;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_sync(dispatch_queue, v4);
}

sqlite3_stmt *__32__CPMLDB_removeTrainingRowData___block_invoke(sqlite3_stmt *result)
{
  sqlite3_stmt *v1;
  char *v2;
  int v3;
  uint64_t v4;
  int v5;
  int v7;
  int v8;
  void *v9;
  void *v10;
  char *v11;
  int v12;
  int v13;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (*((double *)result + 5) > 0.0)
  {
    v1 = result;
    v2 = sqlite3_mprintf("select * from DateIndex where date <= %lf;", *((double *)result + 5));
    v3 = strlen(v2);
    sqlite3_prepare_v2(*(sqlite3 **)(*((_QWORD *)v1 + 4) + 192), v2, v3, &ppStmt, 0);
    if (v2)
      sqlite3_free(v2);
    v4 = 0;
    while (1)
    {
      v5 = sqlite3_step(ppStmt);
      if ((v5 - 100) >= 2 && v5 != 0)
        break;
      v7 = v5;
      v8 = sqlite3_column_int(ppStmt, 0);
      if (v8 <= (int)v4)
        v4 = v4;
      else
        v4 = v8;
      if (v7 == 101)
        goto LABEL_14;
    }
    NSLog(CFSTR("%s cannot query DB."), "-[CPMLDB removeTrainingRowData:]_block_invoke");
LABEL_14:
    if (ppStmt)
    {
      sqlite3_finalize(ppStmt);
      ppStmt = 0;
    }
    v9 = (void *)*((_QWORD *)v1 + 4);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v4);
    objc_msgSend(v9, "removeTrainingRow:", v10);

    v11 = sqlite3_mprintf("delete from DateIndex where date <= %lf;", *((double *)v1 + 5));
    v12 = strlen(v11);
    sqlite3_prepare_v2(*(sqlite3 **)(*((_QWORD *)v1 + 4) + 192), v11, v12, &ppStmt, 0);
    if (v11)
      sqlite3_free(v11);
    v13 = sqlite3_step(ppStmt);
    if ((v13 - 100) >= 2 && v13)
      NSLog(CFSTR("%s cannot delete DateIndexes."), "-[CPMLDB removeTrainingRowData:]_block_invoke");
    result = ppStmt;
    if (ppStmt)
      return (sqlite3_stmt *)sqlite3_finalize(ppStmt);
  }
  return result;
}

- (BOOL)reset
{
  NSObject *dispatch_queue;
  NSString *trainingModelFileAndPath;
  NSString *trainingFile;
  char v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  -[CPMLDB flushDB](self, "flushDB");
  dispatch_queue = self->_dispatch_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __15__CPMLDB_reset__block_invoke;
  v8[3] = &unk_24C2562D0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(dispatch_queue, v8);
  trainingModelFileAndPath = self->_trainingModelFileAndPath;
  trainingFile = self->_trainingFile;
  if (trainingFile)
    -[CPMLDB doInitializeWithDataFile:dataFromFile:withConfiguration:withWriteOptions:](self, "doInitializeWithDataFile:dataFromFile:withConfiguration:withWriteOptions:", trainingModelFileAndPath, trainingFile, self->_cInfo, self->_openCPMLDBOptions);
  else
    -[CPMLDB doInitialize:withConfiguration:withWriteOptions:](self, "doInitialize:withConfiguration:withWriteOptions:", trainingModelFileAndPath, self->_cInfo, self->_openCPMLDBOptions);
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __15__CPMLDB_reset__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "restart");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
  v6 = 0;
  v4 = objc_msgSend(v2, "removeItemAtPath:error:", v3, &v6);
  v5 = v6;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    NSLog(CFSTR("%s Cannot remove model."), "-[CPMLDB reset]_block_invoke");

}

- (void)setCPMLAlgorithm:(id)a3
{
  objc_storeStrong((id *)&self->_thedelegate, a3);
}

- (id)getDelegate
{
  return self->_thedelegate;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatch_queue, a3);
}

- (id)getDispatchQueue
{
  return self->_dispatch_queue;
}

- (CPMLSchema)cpSchema
{
  return (CPMLSchema *)objc_getProperty(self, a2, 96, 1);
}

- (sqlite3)db
{
  return self->db;
}

- (NSString)dbFileName
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbFileName, 0);
  objc_storeStrong((id *)&self->_dispatch_queue, 0);
  objc_storeStrong((id *)&self->_thedelegate, 0);
  objc_storeStrong((id *)&self->_trainingFile, 0);
  objc_storeStrong((id *)&self->_trainingModelFileAndPath, 0);
  objc_storeStrong((id *)&self->_cInfo, 0);
  objc_storeStrong((id *)&self->dbTableName, 0);
  objc_storeStrong((id *)&self->vectorListCardinality, 0);
  objc_storeStrong((id *)&self->indexer, 0);
  objc_storeStrong((id *)&self->cpSchema, 0);
}

@end
