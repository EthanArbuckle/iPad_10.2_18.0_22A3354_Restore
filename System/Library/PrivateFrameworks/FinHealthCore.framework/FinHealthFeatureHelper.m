@implementation FinHealthFeatureHelper

+ (id)reconstructAggregateFeaturesWithProcessingWindow:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(","));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndex:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setName:", v12);
        FHRepeatingAggregateFeatureSet();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "containsObject:", v12) & 1) == 0)
        {
          v14 = objc_msgSend(v11, "count");

          if (v14 < 2)
            goto LABEL_10;
          v15 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v11, "objectAtIndex:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "doubleValue");
          objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setProcessingWindowStartDate:", v17);

          v18 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v11, "objectAtIndex:", 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "doubleValue");
          objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setProcessingWindowEndDate:", v19);

        }
LABEL_10:
        objc_msgSend(v4, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("processingWindowEndDate"), 0);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)reconstructCompoundFeatures:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  FHSmartCompoundFeatureRankedValue *v21;
  void *v22;
  FHSmartCompoundFeatureRankedValue *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v39 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1608];
    objc_msgSend(v3, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    objc_msgSend(v4, "JSONObjectWithData:options:error:", v5, 0, &v54);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v54;

    if (v6)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v6, "allKeys");
      v8 = objc_claimAutoreleasedReturnValue();
      v40 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      if (v40)
      {
        v34 = v7;
        v35 = v3;
        v36 = *(_QWORD *)v51;
        v37 = v8;
        v38 = v6;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v51 != v36)
              objc_enumerationMutation(v8);
            v42 = v9;
            v10 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v9);
            v45 = (void *)objc_opt_new();
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v41 = v10;
            objc_msgSend(v6, "objectForKey:", v10);
            obj = (id)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
            if (v11)
            {
              v12 = v11;
              v44 = *(_QWORD *)v47;
              do
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v47 != v44)
                    objc_enumerationMutation(obj);
                  v14 = *(id *)(*((_QWORD *)&v46 + 1) + 8 * i);
                  objc_msgSend(v14, "objectForKey:", CFSTR("featureLabel"));
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v14, "objectForKey:", CFSTR("featureRank"));
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "doubleValue");
                  objc_msgSend(v16, "stringWithFormat:", CFSTR("%f"), v18);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v14, "objectForKey:", CFSTR("featureEventIdentifiers"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = [FHSmartCompoundFeatureRankedValue alloc];
                  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithString:", v19);
                  v23 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndRank:featureRank:](v21, "initWithLabelAndRank:featureRank:", v15, v22);

                  if (v20)
                  {
                    -[FHSmartCompoundFeatureRankedValue setEventIdentifiers:](v23, "setEventIdentifiers:", v20);
                    v24 = objc_alloc(MEMORY[0x24BDBCE60]);
                    objc_msgSend(v14, "objectForKey:", CFSTR("featureEventStartDate"));
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "doubleValue");
                    v26 = (void *)objc_msgSend(v24, "initWithTimeIntervalSinceReferenceDate:");
                    -[FHSmartCompoundFeatureRankedValue setEventStartDate:](v23, "setEventStartDate:", v26);

                    v27 = objc_alloc(MEMORY[0x24BDBCE60]);
                    objc_msgSend(v14, "objectForKey:", CFSTR("featureEventEndDate"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "doubleValue");
                    v29 = (void *)objc_msgSend(v27, "initWithTimeIntervalSinceReferenceDate:");
                    -[FHSmartCompoundFeatureRankedValue setEventEndDate:](v23, "setEventEndDate:", v29);

                  }
                  objc_msgSend(v45, "addObject:", v23);

                }
                v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
              }
              while (v12);
            }

            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v45);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setValue:forKey:", v30, v41);

            v9 = v42 + 1;
            v8 = v37;
            v6 = v38;
          }
          while (v42 + 1 != v40);
          v40 = -[NSObject countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
        }
        while (v40);
        v7 = v34;
        v3 = v35;
      }
    }
    else
    {
      FinHealthLogObject(CFSTR("FinHealthCore"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "localizedDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v56 = v3;
        v57 = 2112;
        v58 = v31;
        _os_log_impl(&dword_23B4A2000, v8, OS_LOG_TYPE_DEBUG, "Failed to parse {%@} with error: %@", buf, 0x16u);

      }
    }

  }
  v32 = (void *)objc_msgSend(v39, "copy");

  return v32;
}

@end
