@implementation LCFCoreMLFeatureProviderUtils

+ (id)toMultiArrayTypeFeatureProvider:(id)a3 srcFeatureNames:(id)a4 srcLabelName:(id)a5 destFeatureName:(id)a6 destLabelName:(id)a7
{
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v47;
  id v48;
  id v49;
  id obj;
  id v51;
  _QWORD v52[5];
  _QWORD v53[6];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[2];
  _QWORD v71[2];
  void *v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v47 = a5;
  v49 = a6;
  v48 = a7;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v12;
  v13 = 0;
  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v67;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v67 != v15)
          objc_enumerationMutation(obj);
        objc_msgSend(v11, "featureValueForName:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v16), v47);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "type") == 1 || objc_msgSend(v17, "type") == 2)
        {
          ++v13;
        }
        else if (objc_msgSend(v17, "type") == 5)
        {
          objc_msgSend(v17, "multiArrayValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "shape");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "intValue");

          v13 += v21;
        }

        ++v16;
      }
      while (v14 != v16);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      v14 = v22;
    }
    while (v22);
  }
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v65 = malloc_type_malloc(8 * v13, 0x100004000313F17uLL);
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v23 = obj;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v55;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v55 != v25)
          objc_enumerationMutation(v23);
        objc_msgSend(v11, "featureValueForName:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v26), v47);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "type") == 1)
        {
          v28 = (double)objc_msgSend(v27, "int64Value");
LABEL_23:
          v29 = v63[3];
          v30 = *((int *)v59 + 6);
          *((_DWORD *)v59 + 6) = v30 + 1;
          *(double *)(v29 + 8 * v30) = v28;
          goto LABEL_24;
        }
        if (objc_msgSend(v27, "type") == 2)
        {
          objc_msgSend(v27, "doubleValue");
          goto LABEL_23;
        }
        if (objc_msgSend(v27, "type") == 5)
        {
          objc_msgSend(v27, "multiArrayValue");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v53[0] = MEMORY[0x24BDAC760];
          v53[1] = 3221225472;
          v53[2] = __124__LCFCoreMLFeatureProviderUtils_toMultiArrayTypeFeatureProvider_srcFeatureNames_srcLabelName_destFeatureName_destLabelName___block_invoke;
          v53[3] = &unk_25109F168;
          v53[4] = &v62;
          v53[5] = &v58;
          objc_msgSend(v31, "getBytesWithHandler:", v53);

        }
LABEL_24:

        ++v26;
      }
      while (v24 != v26);
      v32 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
      v24 = v32;
    }
    while (v32);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v33;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v72, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_alloc(MEMORY[0x24BDBFFF0]);
  v36 = v63[3];
  v51 = 0;
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __124__LCFCoreMLFeatureProviderUtils_toMultiArrayTypeFeatureProvider_srcFeatureNames_srcLabelName_destFeatureName_destLabelName___block_invoke_37;
  v52[3] = &unk_25109F190;
  v52[4] = &v62;
  v37 = (void *)objc_msgSend(v35, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v36, v34, 65600, &unk_2510A24B8, v52, &v51);
  v38 = v51;
  v70[0] = v49;
  objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithMultiArray:", v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v48;
  v71[0] = v39;
  objc_msgSend(v11, "featureValueForName:", v47);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  +[LCFCoreMLFeatureProvider fromMLProvider:](LCFCoreMLFeatureProvider, "fromMLProvider:", v11);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "featureStoreKey");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "timestamp");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[LCFCoreMLFeatureProvider init:timestamp:featureValues:]([LCFCoreMLFeatureProvider alloc], "init:timestamp:featureValues:", v43, v44, v41);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  return v45;
}

void *__124__LCFCoreMLFeatureProviderUtils_toMultiArrayTypeFeatureProvider_srcFeatureNames_srcLabelName_destFeatureName_destLabelName___block_invoke(uint64_t a1, const void *a2, size_t a3)
{
  int v3;
  void *result;

  v3 = a3;
  result = memcpy((void *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)+ 8 * *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)), a2, a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v3;
  return result;
}

void __124__LCFCoreMLFeatureProviderUtils_toMultiArrayTypeFeatureProvider_srcFeatureNames_srcLabelName_destFeatureName_destLabelName___block_invoke_37(uint64_t a1)
{
  free(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

+ (id)toMultiArrayTypeBatchProvider:(id)a3 srcFeatureNames:(id)a4 srcLabelName:(id)a5 destFeatureName:(id)a6 destLabelName:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v11, "count") >= 1)
  {
    v17 = 0;
    do
    {
      objc_msgSend(v11, "featuresAtIndex:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[LCFCoreMLFeatureProviderUtils toMultiArrayTypeFeatureProvider:srcFeatureNames:srcLabelName:destFeatureName:destLabelName:](LCFCoreMLFeatureProviderUtils, "toMultiArrayTypeFeatureProvider:srcFeatureNames:srcLabelName:destFeatureName:destLabelName:", v18, v12, v13, v14, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v19);

      ++v17;
    }
    while (objc_msgSend(v11, "count") > v17);
  }
  +[LCFCoreMLBatchProvider fromMLProvider:](LCFCoreMLBatchProvider, "fromMLProvider:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "featureStoreKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[LCFCoreMLBatchProvider init:featureProviders:]([LCFCoreMLBatchProvider alloc], "init:featureProviders:", v21, v16);

  return v22;
}

@end
