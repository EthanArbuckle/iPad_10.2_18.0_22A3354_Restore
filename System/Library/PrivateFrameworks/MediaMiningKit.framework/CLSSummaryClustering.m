@implementation CLSSummaryClustering

- (id)densityClusteringDistanceBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__CLSSummaryClustering_Performance__densityClusteringDistanceBlock__block_invoke;
  v3[3] = &unk_1E84F7578;
  v3[4] = self;
  return (id)objc_msgSend(v3, "copy");
}

uint64_t __67__CLSSummaryClustering_Performance__densityClusteringDistanceBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;
  void *v7;
  void *v8;
  CLLocationCoordinate2D v9;
  CLLocationCoordinate2D v10;

  objc_msgSend((id)objc_msgSend(a2, "cls_universalDate"), "timeIntervalSinceDate:", objc_msgSend(a3, "cls_universalDate"));
  result = objc_msgSend(*(id *)(a1 + 32), "enableDensityClusteringLocationsDistance");
  if ((_DWORD)result)
  {
    result = objc_msgSend(a2, "clsLocation");
    if (result)
    {
      v7 = (void *)result;
      result = objc_msgSend(MEMORY[0x1E0C99E38], "null");
      if (v7 != (void *)result)
      {
        objc_msgSend(v7, "coordinate");
        result = CLLocationCoordinate2DIsValid(v9);
        if ((_DWORD)result)
        {
          result = objc_msgSend(a3, "clsLocation");
          if (result)
          {
            v8 = (void *)result;
            result = objc_msgSend(MEMORY[0x1E0C99E38], "null");
            if (v8 != (void *)result)
            {
              objc_msgSend(v8, "coordinate");
              result = CLLocationCoordinate2DIsValid(v10);
              if ((_DWORD)result)
              {
                objc_msgSend(v7, "distanceFromLocation:", v8);
                return objc_msgSend(*(id *)(a1 + 32), "densityClusteringLocationsDistanceUnit");
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (CLSSummaryClustering)init
{
  CLSSummaryClustering *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSSummaryClustering;
  result = -[CLSSummaryClustering init](&v3, sel_init);
  if (result)
  {
    result->_optimalDayDistributionThreshold = 30.0;
    *(_OWORD *)&result->_timeSpanDensityAverageNumberOfObjects = xmmword_1CABE9080;
    result->_diffuseDensityClusteringMaximumDistance = 10800.0;
    result->_diffuseDensityClusteringMinimumNumberOfObjects = 7;
    result->_conciseDensityClusteringMaximumDistance = 1800.0;
    *(_OWORD *)&result->_conciseDensityClusteringMinimumNumberOfObjects = xmmword_1CABE9090;
    *(_DWORD *)&result->_enableDensityClusteringLocationsDistance = 16842752;
    *(_OWORD *)&result->_adaptiveElectionSmootherMaximumLimit = xmmword_1CABE90A0;
  }
  return result;
}

- (id)densityClustersWithItems:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSSummaryClustering _densityClustersWithItems:progressBlock:](self, "_densityClustersWithItems:progressBlock:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "objects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)_densityClustersWithItems:(id)a3 progressBlock:(id)a4
{
  uint64_t v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double optimalDayDistributionThreshold;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  size_t v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  char v35;
  void *v37;
  id v38;
  id v39;
  char v40;
  _QWORD block[4];
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t *v46;
  int *v47;
  int v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  int buf;
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v38 = a4;
  v6 = MEMORY[0x1D1796244]();
  v7 = (void *)v6;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  if (!v6
    || (LOBYTE(v48) = 0,
        (*(void (**)(uint64_t, int *, double))(v6 + 16))(v6, &v48, 0.0),
        v8 = *((_BYTE *)v53 + 24) | v48,
        (*((_BYTE *)v53 + 24) = v8) == 0))
  {
    objc_msgSend(v39, "sortedArrayUsingComparator:", &__block_literal_global_5957);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cls_universalDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cls_universalDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v14);
    v16 = v15;

    if (v16 <= 0.0)
      v17 = 1.79769313e308;
    else
      v17 = (double)(unint64_t)objc_msgSend(v10, "count") / (v16 / 86400.0);
    optimalDayDistributionThreshold = self->_optimalDayDistributionThreshold;
    v19 = 56;
    if (v17 < optimalDayDistributionThreshold)
      v19 = 40;
    v20 = 64;
    if (v17 < optimalDayDistributionThreshold)
      v20 = 48;
    v21 = *(uint64_t *)((char *)&self->super.isa + v20);
    v22 = *(double *)((char *)&self->super.isa + v19);
    v23 = objc_alloc_init(MEMORY[0x1E0D71B88]);
    objc_msgSend(v23, "setAverageNumberOfObjects:", self->_timeSpanDensityAverageNumberOfObjects);
    objc_msgSend(v23, "setMinimumSpan:", v22 * 3.0);
    v24 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __64__CLSSummaryClustering__densityClustersWithItems_progressBlock___block_invoke_2;
    v49[3] = &unk_1E84F94F0;
    v25 = v7;
    v50 = v25;
    v51 = &v52;
    objc_msgSend(v23, "performWithDataset:progressBlock:", v10, v49);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v53 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109120;
        v57 = 241;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
      }
      v9 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_28;
    }
    v26 = objc_alloc(MEMORY[0x1E0D71698]);
    v27 = -[CLSSummaryClustering densityClusteringDistanceBlock](self, "densityClusteringDistanceBlock");
    v28 = (void *)objc_msgSend(v26, "initWithDistanceBlock:", v27);

    objc_msgSend(v28, "setMaximumDistance:", v22);
    objc_msgSend(v28, "setMinimumNumberOfObjects:", v21);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v30 = objc_msgSend(v37, "count");
    block[0] = v24;
    block[1] = 3221225472;
    block[2] = __64__CLSSummaryClustering__densityClustersWithItems_progressBlock___block_invoke_21;
    block[3] = &unk_1E84F9088;
    v31 = v25;
    v47 = &v48;
    v45 = v31;
    v46 = &v52;
    v42 = v37;
    v32 = v28;
    v43 = v32;
    v33 = v29;
    v44 = v33;
    dispatch_apply(v30, 0, block);
    if (*((_BYTE *)v53 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109120;
        v57 = 270;
        v34 = MEMORY[0x1E0C81028];
LABEL_20:
        _os_log_impl(&dword_1CAB79000, v34, OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
      }
    }
    else
    {
      if (!v7
        || (v40 = 0,
            (*((void (**)(id, char *, double))v31 + 2))(v31, &v40, 1.0),
            v35 = *((_BYTE *)v53 + 24) | v40,
            (*((_BYTE *)v53 + 24) = v35) == 0))
      {
        v9 = v33;
        goto LABEL_27;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109120;
        v57 = 273;
        v34 = MEMORY[0x1E0C81028];
        goto LABEL_20;
      }
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 67109120;
    v57 = 187;
    _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
  }
  v9 = (id)MEMORY[0x1E0C9AA60];
LABEL_29:
  _Block_object_dispose(&v52, 8);

  return v9;
}

- (id)performWithItems:(id)a3 identifiersOfEligibleItems:(id)a4 maximumNumberOfItemsToElect:(unint64_t)a5 progressBlock:(id)a6
{
  return -[CLSSummaryClustering performWithItems:identifiersOfEligibleItems:maximumNumberOfItemsToElect:debugInfo:progressBlock:](self, "performWithItems:identifiersOfEligibleItems:maximumNumberOfItemsToElect:debugInfo:progressBlock:", a3, a4, a5, 0, a6);
}

- (id)performWithItems:(id)a3 identifiersOfEligibleItems:(id)a4 maximumNumberOfItemsToElect:(unint64_t)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  CLSSummaryClusteringItem *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  CLSSummaryClusteringItem *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v56;
  _QWORD v57[4];
  id v58;
  uint64_t *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  uint64_t *v66;
  _QWORD v67[4];
  id v68;
  uint64_t *v69;
  char v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  void *v75;
  CLSSummaryClusteringItem *v76;
  CLSSummaryClusteringItem *v77;
  uint8_t v78[128];
  uint8_t buf[4];
  int v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v53 = a4;
  v12 = a6;
  v13 = a7;
  v14 = MEMORY[0x1D1796244]();
  v15 = (void *)v14;
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 0;
  v56 = v12;
  v54 = v11;
  v52 = v13;
  if (!v14
    || (v70 = 0,
        (*(void (**)(uint64_t, char *, double))(v14 + 16))(v14, &v70, 0.0),
        v16 = *((_BYTE *)v72 + 24) | v70,
        (*((_BYTE *)v72 + 24) = v16) == 0))
  {
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __120__CLSSummaryClustering_performWithItems_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke;
    v67[3] = &unk_1E84F94F0;
    v18 = v15;
    v68 = v18;
    v69 = &v71;
    -[CLSSummaryClustering _densityClustersWithItems:progressBlock:](self, "_densityClustersWithItems:progressBlock:", v11, v67);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v12, "setAgent:", CFSTR("Summarizer"));
      objc_msgSend(v12, "setStage:", CFSTR("Density Clustering"));
      objc_msgSend(v12, "setClusters:withReason:", v19, CFSTR("Summarizer"));
    }
    v51 = v19;
    if (self->_enableMultipassDensityClustering)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71910]), "initWithDistanceBlock:", &__block_literal_global_30);
      objc_msgSend(v20, "setMaximumDistance:", 86400.0);
      objc_msgSend(v20, "setMinimumNumberOfObjects:", 2);
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __120__CLSSummaryClustering_performWithItems_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke_3;
      v64[3] = &unk_1E84F94F0;
      v65 = v18;
      v66 = &v71;
      objc_msgSend(v20, "performWithDataset:progressBlock:", v19, v64);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *((unsigned __int8 *)v72 + 24);
      if (*((_BYTE *)v72 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v80 = 315;
          _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
      }
      else
      {
        objc_msgSend(v19, "valueForKeyPath:", CFSTR("meanDate"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("totalDensityClusters = %@"), v23);

        NSLog(CFSTR("densityClusters = %@"), v21);
      }

      if (v22)
        goto LABEL_26;
    }
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v24 = v19;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v61;
LABEL_16:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v61 != v26)
          objc_enumerationMutation(v24);
        v28 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v27);
        if (v15)
        {
          buf[0] = 0;
          (*((void (**)(id, uint8_t *, double))v18 + 2))(v18, buf, 0.5);
          v29 = *((_BYTE *)v72 + 24) | buf[0];
          *((_BYTE *)v72 + 24) = v29;
          if (v29)
            break;
        }
        objc_msgSend(v28, "objects");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[CLSSummaryClustering scoreForItems:](CLSSummaryClustering, "scoreForItems:", v30);
        objc_msgSend(v28, "setScore:");

        if (v25 == ++v27)
        {
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
          if (v25)
            goto LABEL_16;
          break;
        }
      }
    }

    if (*((_BYTE *)v72 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v80 = 335;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
LABEL_26:
      v17 = (void *)MEMORY[0x1E0C9AA60];
LABEL_57:

      goto LABEL_58;
    }
    if ((unint64_t)objc_msgSend(v24, "count") < 2)
    {
      if (objc_msgSend(v24, "count") != 1)
      {
        v31 = 0;
        goto LABEL_44;
      }
      objc_msgSend(v24, "firstObject");
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objects");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (v34 >= a5)
        v35 = a5;
      else
        v35 = v34;
      v36 = -[CLSSummaryClusteringItem initWithCluster:numberOfItemsToElect:]([CLSSummaryClusteringItem alloc], "initWithCluster:numberOfItemsToElect:", v32, v35);
      v77 = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      if (v56)
      {
        v37 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v32, "objects");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", CFSTR("Single density cluster, electing %lu items out of %lu"), v35, objc_msgSend(v38, "count"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "setState:ofCluster:withReason:", 1, v32, v39);
      }

    }
    else
    {
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __120__CLSSummaryClustering_performWithItems_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke_38;
      v57[3] = &unk_1E84F94F0;
      v58 = v18;
      v59 = &v71;
      -[CLSSummaryClustering adaptiveElection:identifiersOfEligibleItems:maximumNumberOfItemsToElect:debugInfo:progressBlock:](self, "adaptiveElection:identifiersOfEligibleItems:maximumNumberOfItemsToElect:debugInfo:progressBlock:", v24, v53, a5, v56, v57);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      if (*((_BYTE *)v72 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v80 = 348;
          _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }

        goto LABEL_54;
      }
      v32 = v58;
    }

    if (v31 && objc_msgSend(v31, "count"))
    {
      objc_msgSend(v56, "setUnclusteredItemsState:withReason:", 2, CFSTR("Not Clustered"));
LABEL_50:
      if (!v15
        || (v70 = 0,
            (*((void (**)(id, char *, double))v18 + 2))(v18, &v70, 1.0),
            v49 = *((_BYTE *)v72 + 24) | v70,
            (*((_BYTE *)v72 + 24) = v49) == 0))
      {
        v31 = v31;
        v17 = v31;
        goto LABEL_56;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v80 = 386;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
LABEL_54:
      v17 = (void *)MEMORY[0x1E0C9AA60];
LABEL_56:

      v19 = v51;
      goto LABEL_57;
    }
LABEL_44:
    objc_msgSend(MEMORY[0x1E0D716A0], "clusterWithObjects:", v54);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v54, "count");
    if (v41 >= a5)
      v42 = a5;
    else
      v42 = v41;
    v43 = -[CLSSummaryClusteringItem initWithCluster:numberOfItemsToElect:]([CLSSummaryClusteringItem alloc], "initWithCluster:numberOfItemsToElect:", v40, v42);
    v76 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
    v44 = objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      objc_msgSend(v56, "resetWithReason:", CFSTR("SummaryClustering didn't find any density cluster"));
      v75 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setClusters:withReason:", v45, CFSTR("No Density Clusters"));

      v46 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v40, "objects");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", CFSTR("No density cluster, electing %lu items out of %lu"), v42, objc_msgSend(v47, "count"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v56, "setState:ofCluster:withReason:", 1, v40, v48);
    }

    v31 = (id)v44;
    goto LABEL_50;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v80 = 287;
    _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
  }
  v17 = (void *)MEMORY[0x1E0C9AA60];
LABEL_58:
  _Block_object_dispose(&v71, 8);

  return v17;
}

- (id)adaptiveElection:(id)a3 identifiersOfEligibleItems:(id)a4 maximumNumberOfItemsToElect:(unint64_t)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  unsigned int v28;
  void *v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  double adaptiveElectionSmootherMaximumLimit;
  double v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t k;
  void *v41;
  unint64_t v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  double v48;
  double v49;
  uint64_t v50;
  void *v51;
  unint64_t v52;
  double v53;
  double v54;
  double v55;
  unint64_t v56;
  void *v57;
  NSObject *v58;
  double v59;
  unint64_t adaptiveElectionMaximumNumberOfItemsByCluster;
  unint64_t v61;
  unint64_t v62;
  void *v63;
  __CFString *v64;
  uint64_t v65;
  CLSSummaryClusteringItem *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  unint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t m;
  void *v77;
  unint64_t v78;
  double v79;
  unint64_t adaptiveElectionSmootherMinimumLimit;
  uint64_t v81;
  uint64_t n;
  void *v83;
  unint64_t v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  unint64_t v89;
  unint64_t v90;
  CLSSummaryClusteringItem *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t ii;
  uint64_t v97;
  void *v98;
  void *v100;
  id v101;
  void *v102;
  void *v104;
  id v105;
  id obj;
  id obja;
  uint64_t v108;
  CLSSummaryClustering *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _BYTE v138[128];
  _BYTE v139[128];
  uint8_t v140[128];
  uint8_t buf[4];
  unint64_t v142;
  __int16 v143;
  unint64_t v144;
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _QWORD v148[5];

  v148[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v105 = a6;
  v101 = a7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v148[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objects.@count"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v148[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 2);
  v15 = objc_claimAutoreleasedReturnValue();

  v102 = v11;
  v100 = (void *)v15;
  objc_msgSend(v11, "sortedArrayUsingDescriptors:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = (void *)objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v105, "setStage:", CFSTR("Adaptive Election"));
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  obj = v16;
  v109 = self;
  v110 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v147, 16);
  if (v110)
  {
    v17 = 0;
    v108 = *(_QWORD *)v135;
    do
    {
      for (i = 0; i != v110; ++i)
      {
        if (*(_QWORD *)v135 != v108)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * i);
        objc_msgSend(v19, "objects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v111 = v19;
        if (v12)
        {
          v132 = 0u;
          v133 = 0u;
          v130 = 0u;
          v131 = 0u;
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v130, v146, 16);
          if (v22)
          {
            v23 = v22;
            v24 = 0;
            v25 = *(_QWORD *)v131;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v131 != v25)
                  objc_enumerationMutation(v21);
                objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * j), "clsIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v12, "containsObject:", v27);

                v24 += v28;
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v130, v146, 16);
            }
            while (v23);
          }
          else
          {
            v24 = 0;
          }
        }
        else
        {
          v24 = objc_msgSend(v20, "count");
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "setObject:forKey:", v29, v111);

        if (v17 <= v24)
          v17 = v24;

        self = v109;
      }
      v110 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v147, 16);
    }
    while (v110);
    v30 = (double)v17;
  }
  else
  {
    v30 = 0.0;
  }

  v31 = objc_msgSend(obj, "count");
  v32 = v31;
  adaptiveElectionSmootherMaximumLimit = (double)self->_adaptiveElectionSmootherMaximumLimit;
  if (self->_enableAdaptiveElectionSmoother && self->_enableAdaptiveElectionSmootherAutomaticLimit)
  {
    v34 = v30 / (double)v31;
    if (v34 >= adaptiveElectionSmootherMaximumLimit)
      v34 = (double)self->_adaptiveElectionSmootherMaximumLimit;
    if (v34 >= (double)self->_adaptiveElectionSmootherMinimumLimit)
      adaptiveElectionSmootherMaximumLimit = v34;
    else
      adaptiveElectionSmootherMaximumLimit = (double)self->_adaptiveElectionSmootherMinimumLimit;
  }
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v35 = obj;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v126, v145, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v127;
    v39 = 0.0;
    do
    {
      for (k = 0; k != v37; ++k)
      {
        if (*(_QWORD *)v127 != v38)
          objc_enumerationMutation(v35);
        objc_msgSend(v113, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * k));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "unsignedIntegerValue");

        if (self->_enableAdaptiveElectionSmoother)
        {
          if (v42)
          {
            v43 = adaptiveElectionSmootherMaximumLimit
                / 1.57079633
                * atan((double)v42 / (adaptiveElectionSmootherMaximumLimit / 1.57079633));
            if (v43 > (double)v42)
              __assert_rtn("-[CLSSummaryClustering adaptiveElection:identifiersOfEligibleItems:maximumNumberOfItemsToElect:debugInfo:progressBlock:]", "CLSSummaryClustering.m", 442, "numberOfItemsFromThisCluster <= numberOfEligibleItemsInThisCluster");
          }
          else
          {
            v43 = 0.0;
          }
        }
        else
        {
          v43 = (double)v42;
        }
        v39 = v39 + v43;
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v126, v145, 16);
    }
    while (v37);
  }
  else
  {
    v39 = 0.0;
  }

  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v32);
  v45 = v104;
  v46 = v105;
  obja = v44;
  if (objc_msgSend(v104, "count"))
  {
    v47 = 0;
    v48 = 0.0;
    v49 = 0.0;
    do
    {
      objc_msgSend(v45, "objectAtIndexedSubscript:", v47);
      v50 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "objectForKey:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "unsignedIntegerValue");

      if (self->_enableAdaptiveElectionSmoother)
      {
        if (!v52)
        {
          v53 = 0.0;
          v54 = 0.0;
          goto LABEL_54;
        }
        v53 = (double)v52;
        v54 = adaptiveElectionSmootherMaximumLimit
            / 1.57079633
            * atan((double)v52 / (adaptiveElectionSmootherMaximumLimit / 1.57079633));
      }
      else
      {
        v53 = (double)v52;
        v54 = (double)v52;
      }
      if (v54 > v53)
        __assert_rtn("-[CLSSummaryClustering adaptiveElection:identifiersOfEligibleItems:maximumNumberOfItemsToElect:debugInfo:progressBlock:]", "CLSSummaryClustering.m", 462, "targetNumberOfItemsFromThisCluster <= numberOfEligibleItemsInThisCluster");
LABEL_54:
      v112 = (void *)v50;
      v55 = ((double)a5 - v48) * (v54 / (v39 - v49));
      v56 = (unint64_t)v55;
      if (v52 < (unint64_t)v55)
      {
        +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "loggingConnection");
        v58 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v142 = v56;
          v143 = 2048;
          v144 = v52;
          _os_log_impl(&dword_1CAB79000, v58, OS_LOG_TYPE_INFO, "Election wants %lu items from cluster that only contains %lu", buf, 0x16u);
        }

        v55 = v53;
      }
      v59 = v55 + 0.0000001;
      adaptiveElectionMaximumNumberOfItemsByCluster = self->_adaptiveElectionMaximumNumberOfItemsByCluster;
      if (adaptiveElectionMaximumNumberOfItemsByCluster >= (unint64_t)v59)
        v61 = (unint64_t)v59;
      else
        v61 = self->_adaptiveElectionMaximumNumberOfItemsByCluster;
      if (adaptiveElectionMaximumNumberOfItemsByCluster)
        v62 = v61;
      else
        v62 = (unint64_t)v59;
      v48 = v48 + (double)v62;
      v63 = v104;
      if (v48 >= (double)a5 + 1.0
        || v47 == objc_msgSend(v104, "count") - 1 && !objc_msgSend(v44, "count") && objc_msgSend(v104, "count"))
      {
        if (v46)
        {
          objc_msgSend(v104, "firstObject");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setState:ofCluster:withReason:", 2, v68, CFSTR("Election Failure"));

        }
        objc_msgSend(v104, "removeObjectAtIndex:", 0);
        objc_msgSend(v44, "removeAllObjects");
        v69 = objc_msgSend(v104, "count");
        if (!v69)
        {

          v45 = v104;
          break;
        }
        if (self->_enableAdaptiveElectionSmoother)
        {
          v70 = v69;
          v124 = 0u;
          v125 = 0u;
          v122 = 0u;
          v123 = 0u;
          v71 = v104;
          v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v122, v140, 16);
          if (v72)
          {
            v73 = v72;
            v74 = 0;
            v75 = *(_QWORD *)v123;
            do
            {
              for (m = 0; m != v73; ++m)
              {
                if (*(_QWORD *)v123 != v75)
                  objc_enumerationMutation(v71);
                objc_msgSend(v113, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * m));
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = objc_msgSend(v77, "unsignedIntegerValue");

                if (v74 <= v78)
                  v74 = v78;
              }
              v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v122, v140, 16);
            }
            while (v73);
          }
          else
          {
            v74 = 0;
          }

          self = v109;
          v63 = v104;
          v44 = obja;
          if (v109->_enableAdaptiveElectionSmootherAutomaticLimit)
          {
            v79 = (double)v74 / (double)v70;
            adaptiveElectionSmootherMinimumLimit = v109->_adaptiveElectionSmootherMinimumLimit;
            if (v79 >= (double)v109->_adaptiveElectionSmootherMaximumLimit)
              v79 = (double)v109->_adaptiveElectionSmootherMaximumLimit;
            if (v79 >= (double)adaptiveElectionSmootherMinimumLimit)
              adaptiveElectionSmootherMaximumLimit = v79;
            else
              adaptiveElectionSmootherMaximumLimit = (double)adaptiveElectionSmootherMinimumLimit;
          }
        }
        v120 = 0u;
        v121 = 0u;
        v118 = 0u;
        v119 = 0u;
        v64 = v63;
        v47 = -[__CFString countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v118, v139, 16);
        if (v47)
        {
          v81 = *(_QWORD *)v119;
          v39 = 0.0;
          do
          {
            for (n = 0; n != v47; ++n)
            {
              if (*(_QWORD *)v119 != v81)
                objc_enumerationMutation(v64);
              objc_msgSend(v113, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * n));
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = objc_msgSend(v83, "unsignedIntegerValue");

              if (self->_enableAdaptiveElectionSmoother)
              {
                if (v84)
                {
                  v85 = adaptiveElectionSmootherMaximumLimit
                      / 1.57079633
                      * atan((double)v84 / (adaptiveElectionSmootherMaximumLimit / 1.57079633));
                  if (v85 > (double)v84)
                    __assert_rtn("-[CLSSummaryClustering adaptiveElection:identifiersOfEligibleItems:maximumNumberOfItemsToElect:debugInfo:progressBlock:]", "CLSSummaryClustering.m", 530, "numberOfItemsFromOtherCluster <= numberOfEligibleItemsInOtherCluster");
                }
                else
                {
                  v85 = 0.0;
                }
              }
              else
              {
                v85 = (double)v84;
              }
              v39 = v39 + v85;
            }
            v47 = -[__CFString countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v118, v139, 16);
          }
          while (v47);
          v49 = 0.0;
          v48 = 0.0;
          v63 = v104;
          v46 = v105;
        }
        else
        {
          v49 = 0.0;
          v48 = 0.0;
          v39 = 0.0;
          v46 = v105;
        }
        v67 = v112;
      }
      else
      {
        if (v62)
        {
          if (v62 >= self->_adaptiveElectionMinimumNumberOfItemsByCluster)
          {
            v66 = -[CLSSummaryClusteringItem initWithCluster:numberOfItemsToElect:]([CLSSummaryClusteringItem alloc], "initWithCluster:numberOfItemsToElect:", v112, v62);
            objc_msgSend(v44, "addObject:", v66);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Electing %lu items out of %lu"), v62, v52);
            v64 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v65 = 1;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Number of elected items less than threshold, electing 0 items out of %lu"), v52);
            v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v65 = 2;
          }
        }
        else
        {
          v65 = 2;
          v64 = CFSTR("Electing 0 items, cluster is too small");
        }
        v49 = v49 + v54;
        ++v47;
        v67 = v112;
        objc_msgSend(v46, "setState:ofCluster:withReason:", v65, v112, v64);
      }

      v45 = v63;
    }
    while (v47 < objc_msgSend(v63, "count"));
  }
  v86 = v45;
  if (!objc_msgSend(v44, "count"))
  {
    objc_msgSend(v35, "lastObject");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (v87)
    {
      objc_msgSend(v113, "objectForKey:", v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v88, "unsignedIntegerValue");

      if (v89 >= a5)
        v90 = a5;
      else
        v90 = v89;
      v91 = -[CLSSummaryClusteringItem initWithCluster:numberOfItemsToElect:]([CLSSummaryClusteringItem alloc], "initWithCluster:numberOfItemsToElect:", v87, v90);
      objc_msgSend(v44, "addObject:", v91);

    }
    if (v46)
    {
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v92 = v35;
      v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v114, v138, 16);
      if (v93)
      {
        v94 = v93;
        v95 = *(_QWORD *)v115;
        do
        {
          for (ii = 0; ii != v94; ++ii)
          {
            if (*(_QWORD *)v115 != v95)
              objc_enumerationMutation(v92);
            if (*(void **)(*((_QWORD *)&v114 + 1) + 8 * ii) == v87)
              v97 = 3;
            else
              v97 = 2;
            objc_msgSend(v105, "setState:ofCluster:withReason:", v97);
          }
          v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v114, v138, 16);
        }
        while (v94);
      }

      v86 = v104;
      v46 = v105;
      v44 = obja;
    }

  }
  objc_msgSend(v44, "sortedArrayUsingComparator:", &__block_literal_global_78);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  return v98;
}

- (double)optimalDayDistributionThreshold
{
  return self->_optimalDayDistributionThreshold;
}

- (void)setOptimalDayDistributionThreshold:(double)a3
{
  self->_optimalDayDistributionThreshold = a3;
}

- (unint64_t)timeSpanDensityAverageNumberOfObjects
{
  return self->_timeSpanDensityAverageNumberOfObjects;
}

- (void)setTimeSpanDensityAverageNumberOfObjects:(unint64_t)a3
{
  self->_timeSpanDensityAverageNumberOfObjects = a3;
}

- (BOOL)enableDensityClusteringLocationsDistance
{
  return self->_enableDensityClusteringLocationsDistance;
}

- (void)setEnableDensityClusteringLocationsDistance:(BOOL)a3
{
  self->_enableDensityClusteringLocationsDistance = a3;
}

- (unint64_t)densityClusteringLocationsDistanceUnit
{
  return self->_densityClusteringLocationsDistanceUnit;
}

- (void)setDensityClusteringLocationsDistanceUnit:(unint64_t)a3
{
  self->_densityClusteringLocationsDistanceUnit = a3;
}

- (double)diffuseDensityClusteringMaximumDistance
{
  return self->_diffuseDensityClusteringMaximumDistance;
}

- (void)setDiffuseDensityClusteringMaximumDistance:(double)a3
{
  self->_diffuseDensityClusteringMaximumDistance = a3;
}

- (unint64_t)diffuseDensityClusteringMinimumNumberOfObjects
{
  return self->_diffuseDensityClusteringMinimumNumberOfObjects;
}

- (void)setDiffuseDensityClusteringMinimumNumberOfObjects:(unint64_t)a3
{
  self->_diffuseDensityClusteringMinimumNumberOfObjects = a3;
}

- (double)conciseDensityClusteringMaximumDistance
{
  return self->_conciseDensityClusteringMaximumDistance;
}

- (void)setConciseDensityClusteringMaximumDistance:(double)a3
{
  self->_conciseDensityClusteringMaximumDistance = a3;
}

- (unint64_t)conciseDensityClusteringMinimumNumberOfObjects
{
  return self->_conciseDensityClusteringMinimumNumberOfObjects;
}

- (void)setConciseDensityClusteringMinimumNumberOfObjects:(unint64_t)a3
{
  self->_conciseDensityClusteringMinimumNumberOfObjects = a3;
}

- (BOOL)enableMultipassDensityClustering
{
  return self->_enableMultipassDensityClustering;
}

- (void)setEnableMultipassDensityClustering:(BOOL)a3
{
  self->_enableMultipassDensityClustering = a3;
}

- (unint64_t)adaptiveElectionMinimumNumberOfItemsByCluster
{
  return self->_adaptiveElectionMinimumNumberOfItemsByCluster;
}

- (void)setAdaptiveElectionMinimumNumberOfItemsByCluster:(unint64_t)a3
{
  self->_adaptiveElectionMinimumNumberOfItemsByCluster = a3;
}

- (unint64_t)adaptiveElectionMaximumNumberOfItemsByCluster
{
  return self->_adaptiveElectionMaximumNumberOfItemsByCluster;
}

- (void)setAdaptiveElectionMaximumNumberOfItemsByCluster:(unint64_t)a3
{
  self->_adaptiveElectionMaximumNumberOfItemsByCluster = a3;
}

- (BOOL)enableAdaptiveElectionSmoother
{
  return self->_enableAdaptiveElectionSmoother;
}

- (void)setEnableAdaptiveElectionSmoother:(BOOL)a3
{
  self->_enableAdaptiveElectionSmoother = a3;
}

- (BOOL)enableAdaptiveElectionSmootherAutomaticLimit
{
  return self->_enableAdaptiveElectionSmootherAutomaticLimit;
}

- (void)setEnableAdaptiveElectionSmootherAutomaticLimit:(BOOL)a3
{
  self->_enableAdaptiveElectionSmootherAutomaticLimit = a3;
}

- (unint64_t)adaptiveElectionSmootherMaximumLimit
{
  return self->_adaptiveElectionSmootherMaximumLimit;
}

- (void)setAdaptiveElectionSmootherMaximumLimit:(unint64_t)a3
{
  self->_adaptiveElectionSmootherMaximumLimit = a3;
}

- (unint64_t)adaptiveElectionSmootherMinimumLimit
{
  return self->_adaptiveElectionSmootherMinimumLimit;
}

- (void)setAdaptiveElectionSmootherMinimumLimit:(unint64_t)a3
{
  self->_adaptiveElectionSmootherMinimumLimit = a3;
}

uint64_t __120__CLSSummaryClustering_adaptiveElection_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "cluster");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cls_universalDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cluster");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cls_universalDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "compare:", v12);

  return v13;
}

uint64_t __120__CLSSummaryClustering_performWithItems_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;
  char v6;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v6 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.0 + 0.5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

uint64_t __120__CLSSummaryClustering_performWithItems_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke_3(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;
  char v6;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v6 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.0 + 0.5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

uint64_t __120__CLSSummaryClustering_performWithItems_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke_38(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;
  char v6;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v6 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.0 + 0.5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

void __120__CLSSummaryClustering_performWithItems_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a2, "meanUniversalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meanUniversalDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
}

uint64_t __64__CLSSummaryClustering__densityClustersWithItems_progressBlock___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;
  char v6;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v6 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.0 + 0.5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

void __64__CLSSummaryClustering__densityClustersWithItems_progressBlock___block_invoke_21(uint64_t a1, uint64_t a2)
{
  void *v4;
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, _BYTE *, double);
  void *v14;
  id v15;
  __int128 v16;
  char v17;

  v4 = (void *)MEMORY[0x1D1796094]();
  if (!*(_QWORD *)(a1 + 56)
    || (v17 = 0,
        os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 72)),
        (*(void (**)(double))(*(_QWORD *)(a1 + 56) + 16))(0.5),
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 24),
        v5 = *(os_unfair_lock_s **)(a1 + 72),
        v17 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24),
        os_unfair_lock_unlock(v5),
        !v17))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v6, "objects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __64__CLSSummaryClustering__densityClustersWithItems_progressBlock___block_invoke_2_22;
    v14 = &unk_1E84F9060;
    v15 = *(id *)(a1 + 56);
    v16 = *(_OWORD *)(a1 + 64);
    objc_msgSend(v7, "performWithDataset:progressBlock:", v8, &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 72));
    LODWORD(v8) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 72));
    if (!(_DWORD)v8)
    {
      v10 = *(id *)(a1 + 48);
      objc_sync_enter(v10);
      objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v9, v11, v12, v13, v14);
      objc_sync_exit(v10);

    }
  }
  objc_autoreleasePoolPop(v4);
}

void __64__CLSSummaryClustering__densityClustersWithItems_progressBlock___block_invoke_2_22(uint64_t a1, _BYTE *a2, double a3)
{
  os_unfair_lock_s *v6;
  char v7;

  if (*(_QWORD *)(a1 + 32))
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 48));
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
    v6 = *(os_unfair_lock_s **)(a1 + 48);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
    v7 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    os_unfair_lock_unlock(v6);
    if (v7)
      *a2 = 1;
  }
}

uint64_t __64__CLSSummaryClustering__densityClustersWithItems_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "cls_universalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cls_universalDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (double)scoreForItems:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "clsContentScore", (_QWORD)v13);
        v9 = v9 + v11;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  return v9 + (double)v4 * -0.4;
}

+ (double)meanScoreForItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "clsContentScore");
        v7 = v7 + v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }
  v10 = objc_msgSend(v3, "count");

  return v7 / (double)v10;
}

+ (double)maximumScoreForItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "clsContentScore");
        if (v7 < v9)
          v7 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

@end
