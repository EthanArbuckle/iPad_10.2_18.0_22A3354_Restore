@implementation LCFFeatureStore

- (id)init:(id)a3 url:(id)a4 useSqlite:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  LCFFeatureStore *v11;
  LCFDatabaseConnection *v12;
  void *dbFeatureStore;
  LCFBiomeManager *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  LCFBiomeManager *biomeManagerLabeledDataStore;
  objc_super v21;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)LCFFeatureStore;
  v11 = -[LCFFeatureStore init](&v21, sel_init);
  if (v11)
  {
    LCFLoggingUtilsInit();
    objc_storeStrong((id *)&v11->_featureStoreKey, a3);
    v11->_useSqlite = v5;
    if (v5)
    {
      v12 = -[LCFDatabaseConnection init:databaseName:tableName:]([LCFDatabaseConnection alloc], "init:databaseName:tableName:", v10, v9, CFSTR("featureStore"));
      dbFeatureStore = v11->_dbFeatureStore;
      v11->_dbFeatureStore = v12;
    }
    else
    {
      v14 = [LCFBiomeManager alloc];
      BiomeLibrary();
      dbFeatureStore = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(dbFeatureStore, "MLSE");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ShareSheet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "LabeledDataStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[LCFBiomeManager init:](v14, "init:", v17);
      biomeManagerLabeledDataStore = v11->_biomeManagerLabeledDataStore;
      v11->_biomeManagerLabeledDataStore = (LCFBiomeManager *)v18;

    }
  }

  return v11;
}

- (BOOL)updateFeatureSet:(id)a3
{
  LCFBiomeManager *biomeManagerLabeledDataStore;
  void *v5;

  if (self->_useSqlite)
    return -[LCFDatabaseConnection writeFeatures:](self->_dbFeatureStore, "writeFeatures:", a3);
  biomeManagerLabeledDataStore = self->_biomeManagerLabeledDataStore;
  +[LCFFeatureConverter fromFeatureSetToLabeledData:](LCFFeatureConverter, "fromFeatureSetToLabeledData:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(biomeManagerLabeledDataStore) = -[LCFBiomeManager writeData:](biomeManagerLabeledDataStore, "writeData:", v5);

  return (char)biomeManagerLabeledDataStore;
}

- (BOOL)updateFeatureSet:(id)a3 featureVestion:(id)a4 featureValues:(id)a5
{
  id v8;
  id v9;
  id v10;
  LCFFeatureSet *v11;
  void *v12;
  LCFFeatureSet *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [LCFFeatureSet alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[LCFFeatureSet initWithIdentifier:featureVersion:timestamp:featureValues:](v11, "initWithIdentifier:featureVersion:timestamp:featureValues:", v10, v9, v12, v8);

  LOBYTE(v9) = -[LCFFeatureStore updateFeatureSet:](self, "updateFeatureSet:", v13);
  return (char)v9;
}

- (id)getFeatureVector:(id)a3 option:(unint64_t)a4
{
  return -[LCFFeatureStore getFeatureVector:atTime:option:](self, "getFeatureVector:atTime:option:", a3, 0, a4);
}

- (id)getFeatureVector:(id)a3 atTime:(id)a4 option:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  void *v24;
  LCFFeatureStore *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = v8;
  if (self->_useSqlite)
  {
    -[LCFDatabaseConnection query:startDate:endDate:reversed:](self->_dbFeatureStore, "query:startDate:endDate:reversed:", 0, a4, 0, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LCFFeatureStore getFeatureVectorWithStoreEvents:storeEventsInReversedOrder:option:](self, "getFeatureVectorWithStoreEvents:storeEventsInReversedOrder:option:", v9, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = v8;
    v26 = self;
    -[LCFBiomeManager readDataWithTimestamp:endDate:reversed:](self->_biomeManagerLabeledDataStore, "readDataWithTimestamp:endDate:reversed:", a4, 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[LCFFeatureConverter fromLabeledDataBiomeFeatureStore:timestamp:](LCFFeatureConverter, "fromLabeledDataBiomeFeatureStore:timestamp:", v22, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v24);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v16);
    }

    v9 = v27;
    -[LCFFeatureStore getFeatureVectorWithStoreEvents:storeEventsInReversedOrder:option:](v26, "getFeatureVectorWithStoreEvents:storeEventsInReversedOrder:option:", v27, v13, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)getFeatureVectorWithStoreEvents:(id)a3 storeEventsInReversedOrder:(id)a4 option:(unint64_t)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  uint64_t v33;
  void *v34;
  char v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  LCFCoreMLFeatureProvider *v59;
  NSString *featureStoreKey;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v70;
  id obj;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t v92[128];
  uint8_t buf[4];
  uint64_t v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v70 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14E0]), "initWithArray:", v6);
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = v7;
  v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
  if (v73)
  {
    v72 = *(_QWORD *)v89;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v89 != v72)
        objc_enumerationMutation(obj);
      v74 = v10;
      v11 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v10);
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      objc_msgSend(v11, "featureValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v85;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v85 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i);
            objc_msgSend(v11, "featureValues");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              if (objc_msgSend(v8, "containsObject:", v18))
              {
                objc_msgSend(v9, "valueForKey:", v18);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v21)
                  objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, v18);
              }
            }

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
        }
        while (v15);
      }

      v22 = objc_alloc(MEMORY[0x24BDD14E0]);
      objc_msgSend(v9, "allKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithArray:", v23);
      v25 = objc_msgSend(v8, "isEqual:", v24);

      if ((v25 & 1) != 0)
        break;
      v10 = v74 + 1;
      if (v74 + 1 == v73)
      {
        v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
        if (!v73)
          goto LABEL_20;
        goto LABEL_3;
      }
    }

    v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v37 = v9;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
    if (v38)
    {
      v39 = v38;
      v75 = *(_QWORD *)v77;
LABEL_35:
      v40 = 0;
      while (1)
      {
        if (*(_QWORD *)v77 != v75)
          objc_enumerationMutation(v37);
        v41 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v40);
        objc_msgSend(v37, "objectForKeyedSubscript:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "intValue");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          v44 = (void *)MEMORY[0x24BDBFF98];
          objc_msgSend(v42, "intValue");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v42, "BOOLValue");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            v44 = (void *)MEMORY[0x24BDBFF98];
            objc_msgSend(v42, "BOOLValue");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v42, "doubleValue");
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            if (v50)
            {
              v51 = (void *)MEMORY[0x24BDBFF98];
              objc_msgSend(v42, "doubleValue");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "doubleValue");
              objc_msgSend(v51, "featureValueWithDouble:");
              v48 = objc_claimAutoreleasedReturnValue();
              goto LABEL_43;
            }
            objc_msgSend(v42, "timeBucketValue");
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v52)
            {
              objc_msgSend(v42, "doubleArray");
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              if (v53)
              {
                v54 = (void *)MEMORY[0x24BDBFFF0];
                objc_msgSend(v42, "doubleArray");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "doubleVectorWithValues:", v55);
                v47 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithMultiArray:", v47);
                v48 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v42, "stringValue");
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v56)
                {
LABEL_56:
                  v61 = LCFLogFeatureStore;
                  if (os_log_type_enabled((os_log_t)LCFLogFeatureStore, OS_LOG_TYPE_ERROR))
                    -[LCFFeatureStore getFeatureVectorWithStoreEvents:storeEventsInReversedOrder:option:].cold.2(v41, v61, v62, v63, v64, v65, v66, v67);
                  v30 = 0;
                  goto LABEL_59;
                }
                v57 = (void *)MEMORY[0x24BDBFF98];
                objc_msgSend(v42, "stringValue");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "featureValueWithString:", v47);
                v48 = objc_claimAutoreleasedReturnValue();
              }
              goto LABEL_43;
            }
            v44 = (void *)MEMORY[0x24BDBFF98];
            objc_msgSend(v42, "timeBucketValue");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        v47 = v45;
        objc_msgSend(v44, "featureValueWithInt64:", objc_msgSend(v45, "longValue"));
        v48 = objc_claimAutoreleasedReturnValue();
LABEL_43:
        v49 = (void *)v48;

        if (!v49)
          goto LABEL_56;
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v49, v41);

        if (v39 == ++v40)
        {
          v58 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
          v39 = v58;
          if (v58)
            goto LABEL_35;
          break;
        }
      }
    }

    v59 = [LCFCoreMLFeatureProvider alloc];
    featureStoreKey = self->_featureStoreKey;
    objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "timestamp");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[LCFCoreMLFeatureProvider init:timestamp:featureValues:](v59, "init:timestamp:featureValues:", featureStoreKey, v42, v29);
LABEL_59:

  }
  else
  {
LABEL_20:

    v26 = LCFLogFeatureStore;
    if (os_log_type_enabled((os_log_t)LCFLogFeatureStore, OS_LOG_TYPE_ERROR))
      -[LCFFeatureStore getFeatureVectorWithStoreEvents:storeEventsInReversedOrder:option:].cold.1(v26, v27, v28);
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v29 = v70;
    v30 = (id)objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v81;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(_QWORD *)v81 != v31)
            objc_enumerationMutation(v29);
          v33 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v9, "allKeys");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "containsObject:", v33);

          if ((v35 & 1) == 0)
          {
            v36 = LCFLogFeatureStore;
            if (os_log_type_enabled((os_log_t)LCFLogFeatureStore, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v94 = v33;
              _os_log_error_impl(&dword_24032B000, v36, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }
          }
        }
        v30 = (id)objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
      }
      while (v30);
    }
  }

  return v30;
}

- (id)getFeatureVectors:(id)a3 option:(unint64_t)a4
{
  return -[LCFFeatureStore getFeatureVectors:startDate:endDate:option:](self, "getFeatureVectors:startDate:endDate:option:", a3, 0, 0, a4);
}

- (id)getFeatureSets:(id)a3 startDate:(id)a4 endDate:(id)a5 option:(unint64_t)a6
{
  char v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id obj;
  uint64_t v46;
  char v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v6 = a6;
  v69 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v41 = v11;
  v42 = v10;
  if (self->_useSqlite)
  {
    -[LCFDatabaseConnection query:startDate:endDate:reversed:](self->_dbFeatureStore, "query:startDate:endDate:reversed:", 0, v10, v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v62 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i));
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      }
      while (v15);
    }
  }
  else
  {
    -[LCFBiomeManager readDataWithTimestamp:endDate:reversed:](self->_biomeManagerLabeledDataStore, "readDataWithTimestamp:endDate:reversed:", v10, v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    if (v18)
    {
      v19 = v18;
      v47 = v6;
      v20 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v58 != v20)
            objc_enumerationMutation(v13);
          v22 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
          objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[LCFFeatureConverter fromLabeledDataBiomeFeatureStore:timestamp:](LCFFeatureConverter, "fromLabeledDataBiomeFeatureStore:timestamp:", v25, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v27);

          }
        }
        v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      }
      while (v19);
      v6 = v47;
    }
  }

  if ((v6 & 4) != 0)
  {
    v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14E0]), "initWithArray:", v43);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v12;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    if (v28)
    {
      v29 = v28;
      v46 = *(_QWORD *)v54;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v54 != v46)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v32 = v48;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v50;
            while (2)
            {
              for (m = 0; m != v34; ++m)
              {
                if (*(_QWORD *)v50 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * m);
                objc_msgSend(v31, "featureValues");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "allKeys");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v37) = objc_msgSend(v39, "containsObject:", v37);

                if (!(_DWORD)v37)
                {

                  goto LABEL_36;
                }
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
              if (v34)
                continue;
              break;
            }
          }

          objc_msgSend(v44, "addObject:", v31);
LABEL_36:
          ;
        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
      }
      while (v29);
    }

    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v44);
  }

  return v12;
}

- (id)featureProviderFromfeatureSet:(id)a3 featureNames:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  LCFCoreMLFeatureProvider *v32;
  NSString *featureStoreKey;
  void *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v46;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v12);
      objc_msgSend(v5, "featureValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "intValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)MEMORY[0x24BDBFF98];
        objc_msgSend(v15, "intValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v15, "BOOLValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v17 = (void *)MEMORY[0x24BDBFF98];
          objc_msgSend(v15, "BOOLValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v15, "doubleValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            v24 = (void *)MEMORY[0x24BDBFF98];
            objc_msgSend(v15, "doubleValue");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "doubleValue");
            objc_msgSend(v24, "featureValueWithDouble:");
            v21 = objc_claimAutoreleasedReturnValue();
            goto LABEL_11;
          }
          objc_msgSend(v15, "timeBucketValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
            objc_msgSend(v15, "doubleArray");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              v27 = (void *)MEMORY[0x24BDBFFF0];
              objc_msgSend(v15, "doubleArray");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "doubleVectorWithValues:", v28);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithMultiArray:", v20);
              v21 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v15, "stringValue");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v29)
              {
LABEL_24:
                v36 = LCFLogFeatureStore;
                if (os_log_type_enabled((os_log_t)LCFLogFeatureStore, OS_LOG_TYPE_ERROR))
                  -[LCFFeatureStore getFeatureVectorWithStoreEvents:storeEventsInReversedOrder:option:].cold.2(v13, v36, v37, v38, v39, v40, v41, v42);

                v35 = 0;
                v34 = v8;
                goto LABEL_27;
              }
              v30 = (void *)MEMORY[0x24BDBFF98];
              objc_msgSend(v15, "stringValue");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "featureValueWithString:", v20);
              v21 = objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_11;
          }
          v17 = (void *)MEMORY[0x24BDBFF98];
          objc_msgSend(v15, "timeBucketValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v20 = v18;
      objc_msgSend(v17, "featureValueWithInt64:", objc_msgSend(v18, "longValue"));
      v21 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v22 = (void *)v21;

      if (!v22)
        goto LABEL_24;
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, v13);

      if (v10 == ++v12)
      {
        v31 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        v10 = v31;
        if (v31)
          goto LABEL_3;
        break;
      }
    }
  }

  v32 = [LCFCoreMLFeatureProvider alloc];
  featureStoreKey = self->_featureStoreKey;
  objc_msgSend(v5, "timestamp");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[LCFCoreMLFeatureProvider init:timestamp:featureValues:](v32, "init:timestamp:featureValues:", featureStoreKey, v34, v7);
LABEL_27:

  return v35;
}

- (id)getFeatureVectors:(id)a3 startDate:(id)a4 endDate:(id)a5 option:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  char isKindOfClass;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  id v64;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v71;
  LCFFeatureStore *v72;
  id v73;
  id obj;
  id obja;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81;
  _BYTE v82[15];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v73 = a3;
  v9 = a4;
  v10 = a5;
  v76 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v72 = self;
  if (self->_useSqlite)
  {
    -[LCFDatabaseConnection query:startDate:endDate:reversed:](self->_dbFeatureStore, "query:startDate:endDate:reversed:", 0, v9, v10, 0, v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v96 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v16, "timestamp");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "timeIntervalSinceReferenceDate");
          objc_msgSend(v17, "numberWithDouble:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setValue:forKey:", v16, v20);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
      }
      while (v13);
    }
  }
  else
  {
    -[LCFBiomeManager readDataWithTimestamp:endDate:reversed:](self->_biomeManagerLabeledDataStore, "readDataWithTimestamp:endDate:reversed:", v9, v10, 0, v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v92;
      v24 = 0x24BE0C000uLL;
      obj = v11;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v92 != v23)
            objc_enumerationMutation(v11);
          v26 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
          objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            +[LCFFeatureConverter fromLabeledDataBiomeFeatureStore:timestamp:](LCFFeatureConverter, "fromLabeledDataBiomeFeatureStore:timestamp:", v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v24;
            v33 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "timeIntervalSinceReferenceDate");
            objc_msgSend(v33, "numberWithDouble:");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringValue");
            v36 = v23;
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "setValue:forKey:", v31, v37);

            v23 = v36;
            v24 = v32;
            v11 = obj;

          }
        }
        v22 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
      }
      while (v22);
      self = v72;
    }
  }

  v68 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if ((a6 & 4) != 0)
  {
    v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD14E0]), "initWithArray:", v73);
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    objc_msgSend(v76, "allValues");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
    if (v71)
    {
      v69 = *(_QWORD *)v88;
      do
      {
        v50 = 0;
        do
        {
          if (*(_QWORD *)v88 != v69)
            objc_enumerationMutation(obja);
          v51 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v50);
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v52 = v40;
          v53 = v40;
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
          if (v54)
          {
            v55 = v54;
            v56 = *(_QWORD *)v84;
            while (2)
            {
              for (k = 0; k != v55; ++k)
              {
                if (*(_QWORD *)v84 != v56)
                  objc_enumerationMutation(v53);
                v58 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * k);
                objc_msgSend(v51, "featureValues");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "allKeys");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v58) = objc_msgSend(v60, "containsObject:", v58);

                if (!(_DWORD)v58)
                {
                  v61 = v53;
                  goto LABEL_47;
                }
              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
              if (v55)
                continue;
              break;
            }
          }

          self = v72;
          -[LCFFeatureStore featureProviderFromfeatureSet:featureNames:](v72, "featureProviderFromfeatureSet:featureNames:", v51, v73);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (v61)
          {
            objc_msgSend(v68, "addObject:", v61);
          }
          else
          {
            v62 = LCFLogFeatureStore;
            if (os_log_type_enabled((os_log_t)LCFLogFeatureStore, OS_LOG_TYPE_ERROR))
              -[LCFFeatureStore getFeatureVectors:startDate:endDate:option:].cold.1(&v81, v82, v62);
LABEL_47:
            self = v72;
          }
          v40 = v52;

          ++v50;
        }
        while (v50 != v71);
        v63 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
        v71 = v63;
      }
      while (v63);
      v40 = v53;
    }
  }
  else
  {
    objc_msgSend(v76, "allKeys");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sortedArrayUsingFunction:context:", doubleSort, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    obja = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v40 = v39;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v77, v99, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v78;
      do
      {
        for (m = 0; m != v42; ++m)
        {
          if (*(_QWORD *)v78 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(v76, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * m));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obja, "addObject:", v45);

          objc_msgSend(obja, "reverseObjectEnumerator");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "allObjects");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          -[LCFFeatureStore getFeatureVectorWithStoreEvents:storeEventsInReversedOrder:option:](self, "getFeatureVectorWithStoreEvents:storeEventsInReversedOrder:option:", v73, v47, a6);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            +[LCFCoreMLFeatureProvider fromMLProvider:](LCFCoreMLFeatureProvider, "fromMLProvider:", v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "addObject:", v49);

          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v77, v99, 16);
      }
      while (v42);
    }

  }
  v64 = -[LCFCoreMLBatchProvider init:featureProviders:]([LCFCoreMLBatchProvider alloc], "init:featureProviders:", self->_featureStoreKey, v68);

  return v64;
}

- (id)getMultiArrayFeatureVectors:(id)a3 vectorName:(id)a4 srcLabelName:(id)a5 destLabelName:(id)a6 option:(unint64_t)a7
{
  return -[LCFFeatureStore getMultiArrayFeatureVectors:vectorName:srcLabelName:destLabelName:startDate:endDate:option:](self, "getMultiArrayFeatureVectors:vectorName:srcLabelName:destLabelName:startDate:endDate:option:", a3, a4, a5, a6, 0, 0, a7);
}

- (id)getMultiArrayFeatureVectors:(id)a3 vectorName:(id)a4 srcLabelName:(id)a5 destLabelName:(id)a6 startDate:(id)a7 endDate:(id)a8 option:(unint64_t)a9
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v28 = a5;
  v15 = (void *)MEMORY[0x24BDBCE30];
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  objc_msgSend(v15, "arrayWithObjects:count:", &v28, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v22, v28, v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[LCFFeatureStore getFeatureVectors:startDate:endDate:option:](self, "getFeatureVectors:startDate:endDate:option:", v23, v17, v16, a9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  +[LCFCoreMLBatchProvider fromMLProvider:](LCFCoreMLBatchProvider, "fromMLProvider:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[LCFCoreMLFeatureProviderUtils toMultiArrayTypeBatchProvider:srcFeatureNames:srcLabelName:destFeatureName:destLabelName:](LCFCoreMLFeatureProviderUtils, "toMultiArrayTypeBatchProvider:srcFeatureNames:srcLabelName:destFeatureName:destLabelName:", v25, v21, v19, v20, v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)getFeatureVectorTimestamps
{
  return -[LCFBiomeManager readTimeStamps:endDate:reversed:](self->_biomeManagerLabeledDataStore, "readTimeStamps:endDate:reversed:", 0, 0, 0);
}

- (BOOL)pruneFrom:(id)a3 endDate:(id)a4 option:(unint64_t)a5
{
  id v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a3;
  v8 = a4;
  if (self->_useSqlite)
  {
    v9 = -[LCFDatabaseConnection pruneFrom:endDate:](self->_dbFeatureStore, "pruneFrom:endDate:", v7, v8);
  }
  else
  {
    v10 = LCFLogFeatureStore;
    if (os_log_type_enabled((os_log_t)LCFLogFeatureStore, OS_LOG_TYPE_ERROR))
      -[LCFFeatureStore pruneFrom:endDate:option:].cold.1(v10, v11, v12);
    v9 = 0;
  }

  return v9;
}

- (NSString)featureStoreKey
{
  return self->_featureStoreKey;
}

- (LCFBiomeManager)biomeManagerLabeledDataStore
{
  return self->_biomeManagerLabeledDataStore;
}

- (LCFDatabaseConnection)dbFeatureStore
{
  return self->_dbFeatureStore;
}

- (BOOL)useSqlite
{
  return self->_useSqlite;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbFeatureStore, 0);
  objc_storeStrong((id *)&self->_biomeManagerLabeledDataStore, 0);
  objc_storeStrong((id *)&self->_featureStoreKey, 0);
}

- (void)getFeatureVectorWithStoreEvents:(NSObject *)a1 storeEventsInReversedOrder:(uint64_t)a2 option:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_24032B000, a1, a3, "could not find all needed features.", v3);
}

- (void)getFeatureVectorWithStoreEvents:(uint64_t)a3 storeEventsInReversedOrder:(uint64_t)a4 option:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_24032B000, a2, a3, "normalizedName (%@) could not construct a featurevalue", a5, a6, a7, a8, 2u);
}

- (void)getFeatureVectors:(NSObject *)a3 startDate:endDate:option:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0(&dword_24032B000, a3, (uint64_t)a3, "featureProvider could not be construcd", a1);
}

- (void)pruneFrom:(NSObject *)a1 endDate:(uint64_t)a2 option:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_24032B000, a1, a3, "prune is called on biome stream mode.", v3);
}

@end
