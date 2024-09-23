@implementation LCFFeatureImportance

+ (id)analyzeFeatureQuality:(id)a3 featureNames:(id)a4 labelName:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "getMultiArrayFeatureVectors:vectorName:srcLabelName:destLabelName:option:", v7, CFSTR("vector"), v8, v8, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v8;
  +[LCFFeatureImportance _generateFeatureDictionaryForFeatureStore:featureNames:labelName:](LCFFeatureImportance, "_generateFeatureDictionaryForFeatureStore:featureNames:labelName:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v16)
        {
          v17 = v16;
          v18 = 0;
          v19 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v30 != v19)
                objc_enumerationMutation(v15);
              if (!*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j))
                ++v18;
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v17);
        }
        else
        {
          v18 = 0;
        }

        v21 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "numberWithDouble:", (double)v18 / (double)(unint64_t)objc_msgSend(v22, "count"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "setObject:forKeyedSubscript:", v23, v14);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v11);
  }

  return v28;
}

+ (id)analyzeFeatureImportanceWithFeatureStore:(id)a3 featureNames:(id)a4 labelName:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id obj;
  uint64_t v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "getFeatureVectors:option:", v8, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v7;
  objc_msgSend(v7, "getMultiArrayFeatureVectors:vectorName:srcLabelName:destLabelName:option:", v8, CFSTR("vector"), v9, v9, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v9;
  +[LCFFeatureImportance _generateFeatureDictionaryForFeatureStore:featureNames:labelName:](LCFFeatureImportance, "_generateFeatureDictionaryForFeatureStore:featureNames:labelName:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v8;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v50 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v44);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[LCFFeatureImportance computeCorrelationBetweenVector:andOtherVector:](LCFFeatureImportance, "computeCorrelationBetweenVector:andOtherVector:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v16);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v13);
  }

  v43 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v11, "allKeys");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v20)
  {
    v21 = v20;
    v42 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v46 != v42)
          objc_enumerationMutation(v40);
        v23 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
        v24 = objc_alloc(MEMORY[0x24BE5F748]);
        v25 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v10, "objectForKeyedSubscript:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v23);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v24, "init:featureCount:correlationCoefficient:featureImportance:", v23, v27, v28, v29);

        objc_msgSend(v43, "addObject:", v30);
      }
      v21 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v21);
  }

  v31 = objc_alloc(MEMORY[0x24BE5F750]);
  v32 = objc_alloc(MEMORY[0x24BE5F728]);
  objc_msgSend(MEMORY[0x24BE5F710], "fromMLProvider:", v38);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v32, "init:labelFeatureName:", v33, v44);
  v35 = (void *)objc_msgSend(v31, "init:targetLabelFeatureName:results:succeeded:analysisError:", v34, v44, v43, &unk_2510B88C0, 0);

  objc_msgSend(MEMORY[0x24BE5F740], "emitFeatureImportanceEvent:", v35);
  return v11;
}

+ (id)_generateFeatureDictionaryForFeatureStore:(id)a3 featureNames:(id)a4 labelName:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v40 = v9;
    v10 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v38 = v8;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v44;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v44 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v15);
          v17 = (void *)objc_opt_new();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v13);
    }

    v18 = (void *)objc_opt_new();
    v9 = v40;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v40);

    if (objc_msgSend(v7, "count") < 1)
    {
LABEL_16:
      v36 = v10;
      v8 = v38;
    }
    else
    {
      v19 = 0;
      v39 = v7;
      while (1)
      {
        objc_msgSend(v7, "featuresAtIndex:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "featureValueForName:", CFSTR("vector"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "multiArrayValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = v20;
        objc_msgSend(v20, "featureValueForName:", v9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v23, "int64Value");

        v24 = objc_retainAutorelease(v22);
        v25 = objc_msgSend(v24, "dataPointer");
        objc_msgSend(v24, "shape");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "longLongValue");

        if (v28 != objc_msgSend(v11, "count"))
          break;
        if (objc_msgSend(v11, "count"))
        {
          v29 = 0;
          do
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = *(double *)(v25 + 8 * v29);
            objc_msgSend(v10, "objectForKeyedSubscript:", v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObject:", v33);

            ++v29;
          }
          while (objc_msgSend(v11, "count") > v29);
        }
        v9 = v40;
        objc_msgSend(v10, "objectForKeyedSubscript:", v40);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v41);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v35);

        ++v19;
        v7 = v39;
        if (objc_msgSend(v39, "count") <= v19)
          goto LABEL_16;
      }

      v36 = 0;
      v8 = v38;
      v9 = v40;
    }

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

+ (id)computeCorrelationBetweenVector:(id)a3 andOtherVector:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t j;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  unint64_t v41;
  void *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v49;
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v13, "doubleValue");
        v11 = v11 + v14;
        objc_msgSend(v13, "doubleValue");
        v16 = v15;
        objc_msgSend(v13, "doubleValue");
        v10 = v10 + v16 * v17;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
    v11 = 0.0;
  }
  if (objc_msgSend(v5, "count"))
  {
    v18 = v11 / (float)(unint64_t)objc_msgSend(v5, "count");
    v19 = sqrt((v10 - v11 * v11 / (double)(unint64_t)objc_msgSend(v5, "count"))/ (double)(unint64_t)(objc_msgSend(v5, "count") - 1));
  }
  else
  {
    v19 = -1.0;
    v18 = -1.0;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v20 = v6;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v45;
    v24 = 0.0;
    v25 = 0.0;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(v20);
        v27 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v27, "doubleValue", (_QWORD)v44);
        v24 = v24 + v28;
        objc_msgSend(v27, "doubleValue");
        v30 = v29;
        objc_msgSend(v27, "doubleValue");
        v25 = v25 + v30 * v31;
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v22);
  }
  else
  {
    v24 = 0.0;
    v25 = 0.0;
  }

  if (objc_msgSend(v20, "count"))
  {
    v32 = v24 / (float)(unint64_t)objc_msgSend(v20, "count");
    v33 = sqrt((v25 - v24 * v24 / (double)(unint64_t)objc_msgSend(v20, "count"))/ (double)(unint64_t)(objc_msgSend(v20, "count") - 1));
  }
  else
  {
    v32 = -1.0;
    v33 = -1.0;
  }
  if (objc_msgSend(v5, "count", (_QWORD)v44))
  {
    v34 = 0;
    v35 = 0.0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "doubleValue");
      v39 = (v38 - v18) / v19;
      objc_msgSend(v37, "doubleValue");
      v35 = v35 + v39 * ((v40 - v32) / v33);

      ++v34;
    }
    while (objc_msgSend(v5, "count") > v34);
  }
  else
  {
    v35 = 0.0;
  }
  v41 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v35 * (1.0 / ((double)v41 + -1.0)));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

@end
