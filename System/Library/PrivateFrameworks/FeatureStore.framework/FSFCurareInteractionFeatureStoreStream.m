@implementation FSFCurareInteractionFeatureStoreStream

- (BOOL)insert:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _CurareInternalBiomeFeature *v11;
  FSFFeatureStoreStream *biomeStream;
  void *v13;
  char v14;

  v6 = a3;
  if (!+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("This method is not implemented for the current platform"));
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  if (+[FSFUtils isUnderLegalRestriction](FSFUtils, "isUnderLegalRestriction"))
  {
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("Does not insert into FeatureStore: under privacy restriction");
LABEL_12:
    objc_msgSend(v7, "createError:error:", v8, a4);
    NSLog(CFSTR("%@"), v8);
    goto LABEL_13;
  }
  objc_msgSend(v6, "interactionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("Failed to Insert into FeatureStore: Nil InteractionID");
    goto LABEL_12;
  }
  objc_msgSend(v6, "serialize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("Failed to Insert into FeatureStore: Nil Serialized Data");
    goto LABEL_12;
  }
  v11 = -[_CurareInternalBiomeFeature initWithCurareInteraction:]([_CurareInternalBiomeFeature alloc], "initWithCurareInteraction:", v6);
  biomeStream = self->_biomeStream;
  objc_msgSend(v6, "interactionId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[FSFFeatureStoreStream insert:withInteractionId:atTime:](biomeStream, "insert:withInteractionId:atTime:", v11, v13, CFAbsoluteTimeGetCurrent());

  if ((v14 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "createError:error:", CFSTR("Failed to Insert into FeatureStore: Biome returned false."), a4);
    NSLog(CFSTR("%@"), CFSTR("Failed to Insert into FeatureStore: Biome returned false."));
  }

LABEL_14:
  return v14;
}

+ (BOOL)createError:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0FC8];
    v12[0] = a3;
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = a3;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("FSFCurareInteractionStreamErrorDomain"), 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    *a4 = v9;
  }
  return a4 != 0;
}

- (id)retrieveWithInteractionWrapper:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  FSFFeatureStoreBiomeEvent *v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v40;
  void *v41;
  uint64_t v42;
  id obj;
  FSFFeatureStoreBiomeEvent *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v45 = a3;
  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    -[FSFFeatureStoreStream retrieveEvents:startDate:endDate:](self->_biomeStream, "retrieveEvents:startDate:endDate:", 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v47;
      *(_QWORD *)&v7 = 138412546;
      v40 = v7;
      v41 = v5;
      v42 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v47 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v11, "eventBody", v40);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          objc_msgSend(v11, "eventBody");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((isKindOfClass & 1) != 0)
          {
            v44 = [FSFFeatureStoreBiomeEvent alloc];
            objc_msgSend(v14, "content");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("interactionId"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "content");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("feature"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[FSFUtils getDataFromBase64EncodedStr:](FSFUtils, "getDataFromBase64EncodedStr:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v8;
            v21 = objc_msgSend(v14, "dataVersion");
            objc_msgSend(v11, "timestamp");
            v22 = v21;
            v8 = v20;
            v23 = -[FSFFeatureStoreBiomeEvent initWithInteractionId:featureData:dataVersion:timestamp:](v44, "initWithInteractionId:featureData:dataVersion:timestamp:", v16, v19, v22);

            v5 = v41;
            v9 = v42;

          }
          else
          {
            objc_opt_class();
            v24 = objc_opt_isKindOfClass();

            if ((v24 & 1) != 0)
            {
              objc_msgSend(v11, "eventBody");
              v23 = (FSFFeatureStoreBiomeEvent *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v11, "eventBody");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = (objc_class *)objc_opt_class();
                NSStringFromClass(v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "eventBody");
                v37 = v8;
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v40;
                v51 = v36;
                v52 = 2112;
                v53 = v38;
                _os_log_error_impl(&dword_212552000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Fetched event body is unexpected class %@. Skipping. Event body:\n%@", buf, 0x16u);

                v8 = v37;
              }
              v23 = 0;
            }
          }
          if (!v45
            || (-[FSFFeatureStoreBiomeEvent interactionId](v23, "interactionId"),
                v25 = (void *)objc_claimAutoreleasedReturnValue(),
                v26 = objc_msgSend(v45, "containsObject:", v25),
                v25,
                v26))
          {
            -[FSFFeatureStoreBiomeEvent featureData](v23, "featureData");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              -[FSFFeatureStoreBiomeEvent interactionId](v23, "interactionId");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "objectForKeyedSubscript:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v29)
              {
                v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                -[FSFFeatureStoreBiomeEvent interactionId](v23, "interactionId");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, v31);

              }
              -[FSFFeatureStoreBiomeEvent interactionId](v23, "interactionId");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "objectForKeyedSubscript:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addObject:", v23);

            }
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v8);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("This method is not implemented for the current platform"));
    v5 = 0;
  }

  return v5;
}

- (void)retrieveWithInteractionWrapper:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, id);
  id v7;

  if (a4)
  {
    v6 = (void (**)(id, id))a4;
    -[FSFCurareInteractionFeatureStoreStream retrieveWithInteractionWrapper:](self, "retrieveWithInteractionWrapper:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7);

  }
}

- (id)retrieve:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[FSFCurareInteractionFeatureStoreStream retrieveWithInteractionWrapper:](self, "retrieveWithInteractionWrapper:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (v3)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = v3;
    v5 = v3;
    v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v19)
    {
      v18 = *(_QWORD *)v25;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v5);
          v7 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v6);
          v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(v5, "objectForKeyedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v21;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v21 != v12)
                  objc_enumerationMutation(v9);
                objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "featureData");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addObject:", v14);

                ++v13;
              }
              while (v11 != v13);
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v11);
          }

          objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v7);
          ++v6;
        }
        while (v6 != v19);
        v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v19);
    }

    v15 = v4;
    v3 = v17;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)retrieve:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, id);
  id v7;

  if (a4)
  {
    v6 = (void (**)(id, id))a4;
    -[FSFCurareInteractionFeatureStoreStream retrieve:](self, "retrieve:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7);

  }
}

- (BOOL)deleteCurrentStream
{
  return -[FSFFeatureStoreStream deleteCurrentStream](self->_biomeStream, "deleteCurrentStream");
}

- (FSFCurareInteractionFeatureStoreStream)initWithStreamId:(id)a3
{
  id v4;
  FSFCurareInteractionFeatureStoreStream *v5;
  void *v6;
  uint64_t v7;
  FSFFeatureStoreStream *biomeStream;
  FSFCurareInteractionFeatureStoreStream *v9;
  objc_super v11;

  v4 = a3;
  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    v11.receiver = self;
    v11.super_class = (Class)FSFCurareInteractionFeatureStoreStream;
    v5 = -[FSFCurareInteractionFeatureStoreStream init](&v11, sel_init);
    if (v5)
    {
      +[FSFBiomeFeatureStore singletonInstance](FSFBiomeFeatureStore, "singletonInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getStream:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      biomeStream = v5->_biomeStream;
      v5->_biomeStream = (FSFFeatureStoreStream *)v7;

    }
    self = v5;
    v9 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("This method is not implemented for the current platform"));
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeStream, 0);
}

@end
