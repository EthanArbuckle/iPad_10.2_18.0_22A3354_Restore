@implementation LCFChangepointDetection

+ (id)convertFeatureStoreToEvents:(id)a3 featureNames:(id)a4 labelName:(id)a5 valueName:(id)a6 timestampName:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a6;
  v13 = a7;
  +[LCFChangepointDetection _generateFeatureDictionaryForFeatureStore:featureNames:labelName:timestampName:](LCFChangepointDetection, "_generateFeatureDictionaryForFeatureStore:featureNames:labelName:timestampName:", a3, v11, a5, v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v11;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v27)
  {
    v24 = *(_QWORD *)v31;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(obj);
        v29 = v14;
        v28 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v14);
        objc_msgSend(v25, "objectForKeyedSubscript:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_opt_new();
        if (objc_msgSend(v15, "count"))
        {
          v18 = 0;
          do
          {
            v34[0] = v12;
            objc_msgSend(v15, "objectAtIndexedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v34[1] = v13;
            v35[0] = v19;
            objc_msgSend(v16, "objectAtIndexedSubscript:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v35[1] = v20;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "addObject:", v21);
            ++v18;
          }
          while (objc_msgSend(v15, "count") > v18);
        }
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v17, v28);

        v14 = v29 + 1;
      }
      while (v29 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v27);
  }

  return v26;
}

+ (id)_generateFeatureDictionaryForFeatureStore:(id)a3 featureNames:(id)a4 labelName:(id)a5 timestampName:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v51 = a6;
  objc_msgSend(v9, "getMultiArrayFeatureVectors:vectorName:srcLabelName:destLabelName:option:", v10, CFSTR("vector"), v11, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getFeatureVectorTimestamps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") && (v14 = objc_msgSend(v12, "count"), v14 == objc_msgSend(v13, "count")))
  {
    v49 = v12;
    v50 = v13;
    v47 = v9;
    v15 = (void *)objc_opt_new();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v46 = v10;
    v16 = v10;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v56;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v56 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v20);
          v22 = (void *)objc_opt_new();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      }
      while (v18);
    }

    v23 = (void *)objc_opt_new();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v11);

    v24 = (void *)objc_opt_new();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, v51);

    v12 = v49;
    if (objc_msgSend(v49, "count") < 1)
    {
LABEL_17:
      v44 = v15;
      v10 = v46;
    }
    else
    {
      v25 = 0;
      v48 = v11;
      while (1)
      {
        objc_msgSend(v12, "featuresAtIndex:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "featureValueForName:", CFSTR("vector"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "multiArrayValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v52 = v25;
        objc_msgSend(v50, "objectAtIndexedSubscript:", v25);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v26;
        objc_msgSend(v26, "featureValueForName:", v11);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "int64Value");

        v31 = objc_retainAutorelease(v28);
        v32 = objc_msgSend(v31, "dataPointer");
        objc_msgSend(v31, "shape");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "longLongValue");

        if (v35 != objc_msgSend(v16, "count"))
          break;
        if (objc_msgSend(v16, "count"))
        {
          v36 = 0;
          do
          {
            objc_msgSend(v16, "objectAtIndexedSubscript:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = *(double *)(v32 + 8 * v36);
            objc_msgSend(v15, "objectForKeyedSubscript:", v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v38);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addObject:", v40);

            ++v36;
          }
          while (objc_msgSend(v16, "count") > v36);
        }
        v11 = v48;
        objc_msgSend(v15, "objectForKeyedSubscript:", v48);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v30);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addObject:", v42);

        objc_msgSend(v15, "objectForKeyedSubscript:", v51);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObject:", v53);

        v25 = v52 + 1;
        v12 = v49;
        if (objc_msgSend(v49, "count") <= v52 + 1)
          goto LABEL_17;
      }

      v44 = 0;
      v10 = v46;
      v11 = v48;
    }
    v13 = v50;

    v9 = v47;
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

+ (id)analyzeChangePointInEvents:(id)a3 withTestParameters:(id)a4 lastRunDate:(id)a5
{
  return 0;
}

@end
