@implementation LCFProactivePredictionRanker

- (LCFProactivePredictionRanker)init
{
  LCFProactivePredictionRanker *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LCFProactivePredictionRanker;
  v2 = -[LCFProactivePredictionRanker init](&v4, sel_init);
  if (v2)
    LCFModelMonitoringLoggingUtilsInit();
  return v2;
}

- (id)proactiveRanking:(id)a3 predictions:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  v38 = v6;
  if (v7 == objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_opt_new();
    if (objc_msgSend(v5, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "featuresAtIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[LCFProactivePredictionRankerHolder init:prediction:]([LCFProactivePredictionRankerHolder alloc], "init:prediction:", v10, v11);
        objc_msgSend(v10, "featureValues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("_sharingEventUID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v8, "setObject:forKey:", v17, v15);

        }
        objc_msgSend(v8, "objectForKeyedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v12);

        ++v9;
      }
      while (v9 < objc_msgSend(v5, "count"));
    }
    v37 = v5;
    v39 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v19 = v8;
    v42 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v42)
    {
      v41 = *(_QWORD *)v44;
      v40 = v19;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v44 != v41)
            objc_enumerationMutation(v19);
          v21 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v19, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "count"))
          {
            objc_msgSend(v22, "sortedArrayUsingFunction:context:", predictionSort, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "count"))
            {
              if (objc_msgSend(v23, "count"))
              {
                v24 = 1;
                while (1)
                {
                  objc_msgSend(v23, "objectAtIndexedSubscript:", v24 - 1);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "featureSet");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "featureValues");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("_isPositiveLabeled"));
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "BOOLValue");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v29, "BOOLValue");

                  if (v30)
                    break;
                  if (v24++ >= objc_msgSend(v23, "count"))
                    goto LABEL_25;
                }
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v24);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "addObject:", v34);

              }
            }
            else
            {
              v33 = LCFMMLogProactivePredictionRanker;
              if (os_log_type_enabled((os_log_t)LCFMMLogProactivePredictionRanker, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v48 = v21;
                _os_log_error_impl(&dword_240989000, v33, OS_LOG_TYPE_ERROR, "empty sortedByPrediction for %@", buf, 0xCu);
              }
            }
LABEL_25:

            v19 = v40;
          }
          else
          {
            v32 = LCFMMLogProactivePredictionRanker;
            if (os_log_type_enabled((os_log_t)LCFMMLogProactivePredictionRanker, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v48 = v21;
              _os_log_error_impl(&dword_240989000, v32, OS_LOG_TYPE_ERROR, "empty holder for %@", buf, 0xCu);
            }
          }

        }
        v42 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v42);
    }

    v5 = v37;
  }
  else
  {
    v35 = (void *)LCFMMLogProactivePredictionRanker;
    if (os_log_type_enabled((os_log_t)LCFMMLogProactivePredictionRanker, OS_LOG_TYPE_ERROR))
      -[LCFProactivePredictionRanker proactiveRanking:predictions:].cold.1(v35, v5, v6);
    v39 = 0;
  }

  return v39;
}

- (void)proactiveRanking:(void *)a3 predictions:.cold.1(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = 134218240;
  v7 = objc_msgSend(a2, "count");
  v8 = 2048;
  v9 = objc_msgSend(a3, "count");
  _os_log_error_impl(&dword_240989000, v5, OS_LOG_TYPE_ERROR, "count of features and precistions don't match. feature count %ld predictions count %ld", (uint8_t *)&v6, 0x16u);

}

@end
