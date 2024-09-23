@implementation CLSAssetsBeautifier

- (id)hierarchicalClusteringDistanceBlock
{
  return (id)objc_msgSend(&__block_literal_global_1143, "copy");
}

- (id)timeClusteringDistanceBlock
{
  return (id)objc_msgSend(&__block_literal_global_1, "copy");
}

double __63__CLSAssetsBeautifier_Performance__timeClusteringDistanceBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  double result;

  objc_msgSend((id)objc_msgSend(a2, "cls_universalDate"), "timeIntervalSinceDate:", objc_msgSend(a3, "cls_universalDate"));
  if (result < 0.0)
    return -result;
  return result;
}

double __71__CLSAssetsBeautifier_Performance__hierarchicalClusteringDistanceBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  double result;

  objc_msgSend((id)objc_msgSend(a2, "cls_universalDate"), "timeIntervalSinceDate:", objc_msgSend(a3, "cls_universalDate"));
  if (result < 0.0)
    return -result;
  return result;
}

- (CLSAssetsBeautifier)initWithSimilarityModelClass:(Class)a3
{
  char *v4;
  CLSAssetsBeautifier *v5;
  CLSSimilarStacker *v6;
  CLSSimilarStacker *similarStacker;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLSAssetsBeautifier;
  v4 = -[CLSAssetsBeautifier init](&v9, sel_init);
  v5 = (CLSAssetsBeautifier *)v4;
  if (v4)
  {
    v4[8] = 1;
    *(_DWORD *)(v4 + 9) = 0;
    v4[24] = 1;
    v6 = -[CLSSimilarStacker initWithSimilarityModelClass:]([CLSSimilarStacker alloc], "initWithSimilarityModelClass:", a3);
    similarStacker = v5->_similarStacker;
    v5->_similarStacker = v6;

    objc_storeStrong((id *)&v5->_loggingConnection, MEMORY[0x1E0C81028]);
  }
  return v5;
}

- (id)sampledItemsInSortedItems:(id)a3 maximumNumberOfItemsToChoose:(unint64_t)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  id v9;
  char v10;
  id v11;
  OS_os_log *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  NSObject *loggingConnection;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NSSet *identifiersOfEligibleItems;
  void *v27;
  _BOOL4 v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  OS_os_log *v34;
  int v35;
  unint64_t v36;
  unint64_t v37;
  char v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  const __CFString *v48;
  void *v49;
  id v50;
  int v51;
  OS_os_log *v52;
  uint64_t v53;
  double v54;
  double v55;
  uint64_t k;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  double v63;
  uint64_t v64;
  _BOOL8 v65;
  void *v66;
  NSObject *v67;
  void *v68;
  __CFString *v69;
  NSObject *v70;
  NSObject *v71;
  OS_os_log *v72;
  int v74;
  int v75;
  int v76;
  void *context;
  void *v78;
  void *v79;
  unint64_t v80;
  uint64_t v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void (**v87)(_QWORD, _QWORD, double);
  id v88;
  id obj;
  id v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  __CFString *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[4];
  void (**v103)(_QWORD, _QWORD, double);
  uint64_t *v104;
  _QWORD v105[4];
  void (**v106)(_QWORD, _QWORD, double);
  uint64_t *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[4];
  void (**v117)(_QWORD, _QWORD, double);
  uint64_t *v118;
  char v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  char v123;
  _BYTE v124[128];
  _BYTE v125[128];
  uint8_t v126[128];
  uint8_t buf[4];
  _BYTE v128[10];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v84 = a3;
  v88 = a5;
  v9 = a6;
  v120 = 0;
  v121 = &v120;
  v122 = 0x2020000000;
  v123 = 0;
  v87 = (void (**)(_QWORD, _QWORD, double))MEMORY[0x1D1796244]();
  v78 = v9;
  if (v87)
  {
    v119 = 0;
    ((void (**)(_QWORD, char *, double))v87)[2](v87, &v119, 0.0);
    v10 = *((_BYTE *)v121 + 24) | v119;
    *((_BYTE *)v121 + 24) = v10;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v128 = 127;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_118;
    }
  }
  v12 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
  {
    v51 = objc_msgSend(v84, "count");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v128 = a4;
    *(_WORD *)&v128[4] = 1024;
    *(_DWORD *)&v128[6] = v51;
    _os_log_debug_impl(&dword_1CAB79000, (os_log_t)v12, OS_LOG_TYPE_DEBUG, "Beautifier: Sampling %d items out of %d", buf, 0xEu);
  }

  objc_msgSend(v88, "setStage:", CFSTR("Sampling"));
  v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
  context = (void *)MEMORY[0x1D1796094]();
  if (self->_enableStatisticalSampling)
  {
    if (self->_usesKMeans)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D717F8]), "initWithNumericValueKeypaths:", &unk_1E8511F30);
      objc_msgSend(v13, "setK:", a4);
      v85 = v13;
      if (self->_discardNonEligibleClustersInSampling)
      {
        v14 = v84;
        obj = 0;
        v15 = *MEMORY[0x1E0D77DE0];
        while (1)
        {
          v116[0] = MEMORY[0x1E0C809B0];
          v116[1] = 3221225472;
          v116[2] = __102__CLSAssetsBeautifier_sampledItemsInSortedItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke;
          v116[3] = &unk_1E84F94F0;
          v117 = v87;
          v118 = &v120;
          v79 = v14;
          objc_msgSend(v85, "performWithDataset:progressBlock:", v14, v116);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (*((_BYTE *)v121 + 24))
            break;
          v80 = objc_msgSend(v16, "count");
          loggingConnection = self->_loggingConnection;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v128 = v80;
            _os_log_debug_impl(&dword_1CAB79000, loggingConnection, OS_LOG_TYPE_DEBUG, "Beautifier: got %d clusters", buf, 8u);
          }
          v90 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v114 = 0u;
          v115 = 0u;
          v112 = 0u;
          v113 = 0u;
          obj = v16;
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v126, 16);
          if (v18)
          {
            v96 = 0;
            v92 = *(_QWORD *)v113;
            do
            {
              v94 = v18;
              for (i = 0; i != v94; ++i)
              {
                if (*(_QWORD *)v113 != v92)
                  objc_enumerationMutation(obj);
                v20 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
                v108 = 0u;
                v109 = 0u;
                v110 = 0u;
                v111 = 0u;
                objc_msgSend(v20, "objects");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
                if (v22)
                {
                  v23 = *(_QWORD *)v109;
                  while (2)
                  {
                    for (j = 0; j != v22; ++j)
                    {
                      if (*(_QWORD *)v109 != v23)
                        objc_enumerationMutation(v21);
                      v25 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * j);
                      identifiersOfEligibleItems = self->_identifiersOfEligibleItems;
                      if (identifiersOfEligibleItems)
                      {
                        objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * j), "clsIdentifier");
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        v28 = -[NSSet containsObject:](identifiersOfEligibleItems, "containsObject:", v27);

                        if (!v28)
                          continue;
                      }
                      objc_msgSend(v25, "clsContentScore");
                      if (v29 >= v15)
                      {

                        objc_msgSend(v20, "objects");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v90, "addObjectsFromArray:", v31);
                        ++v96;
                        goto LABEL_32;
                      }
                    }
                    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
                    if (v22)
                      continue;
                    break;
                  }
                }

                v30 = (void *)MEMORY[0x1E0C99E60];
                objc_msgSend(v20, "objects");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "setWithArray:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "setState:ofItems:withReason:", 2, v32, CFSTR("Non-eligible cluster"));

LABEL_32:
              }
              v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v126, 16);
            }
            while (v18);
          }
          else
          {
            v96 = 0;
          }

          if (v80 < a4 || (v33 = objc_msgSend(v90, "count"), v80 <= v96) || v33 <= v96)
          {

            v97 = CFSTR("kMeans");
            v50 = v79;
            goto LABEL_69;
          }
          v34 = self->_loggingConnection;
          if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEBUG))
          {
            v35 = objc_msgSend(v90, "count");
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v128 = v80 - v96;
            *(_WORD *)&v128[4] = 1024;
            *(_DWORD *)&v128[6] = v35;
            _os_log_debug_impl(&dword_1CAB79000, (os_log_t)v34, OS_LOG_TYPE_DEBUG, "Beautifier: found %d non-eligible clusters, iterating with %d items", buf, 0xEu);
          }

          -[CLSAssetsBeautifier sortedItemsWithItems:](self, "sortedItemsWithItems:", v90);
          v14 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v128 = 156;
          _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }

        v49 = v14;
        goto LABEL_64;
      }
      v105[0] = MEMORY[0x1E0C809B0];
      v105[1] = 3221225472;
      v105[2] = __102__CLSAssetsBeautifier_sampledItemsInSortedItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke_29;
      v105[3] = &unk_1E84F94F0;
      v106 = v87;
      v107 = &v120;
      objc_msgSend(v13, "performWithDataset:progressBlock:", v84, v105);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_BYTE *)v121 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v128 = 194;
          _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
        v49 = v106;
LABEL_64:

        v47 = 0;
        v48 = CFSTR("kMeans");
LABEL_65:
        v97 = (__CFString *)v48;
LABEL_71:

        obj = v16;
        goto LABEL_72;
      }
      v52 = self->_loggingConnection;
      if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEBUG))
      {
        v76 = objc_msgSend(v16, "count");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v128 = v76;
        _os_log_debug_impl(&dword_1CAB79000, (os_log_t)v52, OS_LOG_TYPE_DEBUG, "Beautifier: got %d clusters", buf, 8u);
      }

      v97 = CFSTR("kMeans");
      v50 = v106;
      obj = v16;
    }
    else
    {
      v41 = objc_alloc(MEMORY[0x1E0D717A0]);
      v42 = -[CLSAssetsBeautifier hierarchicalClusteringDistanceBlock](self, "hierarchicalClusteringDistanceBlock");
      v85 = (void *)objc_msgSend(v41, "initWithDistanceBlock:", v42);

      objc_msgSend(v85, "setUsesSortedDataRelativeDistanceCache:", 1);
      objc_msgSend(v85, "setLinkage:", 0);
      objc_msgSend(v85, "setK:", a4);
      objc_msgSend(v84, "lastObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "cls_universalDate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "cls_universalDate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "timeIntervalSinceDate:", v46);
      objc_msgSend(v85, "setThreshold:");

      v102[0] = MEMORY[0x1E0C809B0];
      v102[1] = 3221225472;
      v102[2] = __102__CLSAssetsBeautifier_sampledItemsInSortedItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke_33;
      v102[3] = &unk_1E84F94F0;
      v103 = v87;
      v104 = &v120;
      objc_msgSend(v85, "performWithDataset:progressBlock:", v84, v102);
      obj = (id)objc_claimAutoreleasedReturnValue();
      if (*((_BYTE *)v121 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v128 = 212;
          _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }

        v47 = 0;
        v97 = CFSTR("HAC");
        v16 = obj;
        goto LABEL_71;
      }
      v97 = CFSTR("HAC");
      v50 = v103;
    }
LABEL_69:

    if ((uint64_t)(a4 - objc_msgSend(obj, "count")) < 1)
    {
      v47 = 1;
      goto LABEL_72;
    }
    -[CLSAssetsBeautifier _clustersBySplittingZeroDiameterClustersInClusters:targetingNumberOfClusters:](self, "_clustersBySplittingZeroDiameterClustersInClusters:targetingNumberOfClusters:", obj);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 1;
    v85 = obj;
    goto LABEL_71;
  }
  v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
  v36 = objc_msgSend(v84, "count");
  if (a4)
  {
    v37 = vcvtad_u64_f64((double)v36 / (double)a4);
    while (1)
    {
      if (v87)
      {
        v119 = 0;
        ((void (**)(_QWORD, char *, double))v87)[2](v87, &v119, 0.5);
        v38 = *((_BYTE *)v121 + 24) | v119;
        *((_BYTE *)v121 + 24) = v38;
        if (v38)
          break;
      }
      objc_msgSend(v84, "subarrayWithRange:", 0, v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D716A0], "clusterWithObjects:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "addObject:", v40);

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v128 = 230;
      _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
    }
    v16 = 0;
    v47 = 0;
    v48 = CFSTR("Bucketing");
    goto LABEL_65;
  }
  v47 = 1;
  v97 = CFSTR("Bucketing");
  obj = v85;
LABEL_72:
  objc_autoreleasePoolPop(context);
  if (!v47)
  {
LABEL_116:
    v11 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_117;
  }
  objc_msgSend(v88, "setClusters:withReason:", obj, v97);
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v91 = obj;
  v53 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v98, v124, 16);
  if (!v53)
    goto LABEL_110;
  v93 = *(_QWORD *)v99;
  v54 = *MEMORY[0x1E0D77DD0];
  v55 = *MEMORY[0x1E0D77DD8];
  while (2)
  {
    v95 = v53;
    for (k = 0; k != v95; ++k)
    {
      if (*(_QWORD *)v99 != v93)
        objc_enumerationMutation(v91);
      v57 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
      if (v87)
      {
        v119 = 0;
        ((void (**)(_QWORD, char *, double))v87)[2](v87, &v119, 0.5);
        v58 = *((_BYTE *)v121 + 24) | v119;
        *((_BYTE *)v121 + 24) = v58;
        if (v58)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v128 = 244;
            _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
          }

          goto LABEL_116;
        }
      }
      objc_msgSend(v57, "objects");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLSAssetsBeautifier requiredItemsInItems:](self, "requiredItemsInItems:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v60, "count"))
      {
        -[CLSAssetsBeautifier bestItemInItems:](self, "bestItemInItems:", v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "isFavorite");
        v63 = v54;
        if ((v62 & 1) == 0)
          objc_msgSend(v61, "clsContentScore", v54);
        if (v63 < v55
          && self->_enableIntermediateNaturalClustering
          && (unint64_t)objc_msgSend(v59, "count") >= 2)
        {
          objc_msgSend(v88, "beginTentativeSection");
          -[CLSAssetsBeautifier _naturalClusteringWithItems:withSimilarity:timestampSupport:debugInfo:](self, "_naturalClusteringWithItems:withSimilarity:timestampSupport:debugInfo:", v59, 0, 1, v88);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v86, "count");
          v65 = v64 != 0;
          objc_msgSend(v88, "endTentativeSectionWithSuccess:", v65);
          if (v64)
          {
            -[CLSAssetsBeautifier bestItemInItems:](self, "bestItemInItems:", v86);
            v82 = objc_claimAutoreleasedReturnValue();

            if (v88)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Intermediate Natural Clustering, chose %lu items out of %lu"), objc_msgSend(v86, "count"), objc_msgSend(v59, "count"));
              v66 = (void *)objc_claimAutoreleasedReturnValue();

              v67 = self->_loggingConnection;
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v128 = v66;
                _os_log_debug_impl(&dword_1CAB79000, v67, OS_LOG_TYPE_DEBUG, "Beautifier: %@", buf, 0xCu);
              }
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v86);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "chooseItems:inCluster:withReason:", v68, v57, v66);

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Best Item, chose %d item out of %lu"), v82 != 0, objc_msgSend(v86, "count"));
              v69 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v70 = self->_loggingConnection;
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v128 = v69;
                _os_log_debug_impl(&dword_1CAB79000, v70, OS_LOG_TYPE_DEBUG, "Beautifier: %@", buf, 0xCu);
              }
              objc_msgSend(v88, "chooseItem:inItems:withReason:", v82, v86, v69);
            }
            else
            {
              v69 = v97;
            }
          }
          else
          {
            v69 = v97;
            v82 = (uint64_t)v61;
          }

          v61 = (void *)v82;
          if (!v82)
            goto LABEL_97;
        }
        else
        {
          LOBYTE(v65) = 0;
          v69 = v97;
          if (!v61)
            goto LABEL_97;
        }
        objc_msgSend(v83, "addObject:", v61);
LABEL_97:
        if (v65)
        {
          v97 = v69;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Best Item, chose %d items out of %lu"), v61 != 0, objc_msgSend(v59, "count"));
          v97 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v71 = self->_loggingConnection;
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v128 = v97;
            _os_log_debug_impl(&dword_1CAB79000, v71, OS_LOG_TYPE_DEBUG, "Beautifier: %@", buf, 0xCu);
          }
          objc_msgSend(v88, "chooseItem:inCluster:withReason:", v61, v57, v97);
        }
        goto LABEL_102;
      }
      objc_msgSend(v83, "addObjectsFromArray:", v60);
      if (!v88)
        goto LABEL_103;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "requireItems:inCluster:", v61, v57);
LABEL_102:

LABEL_103:
    }
    v53 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v98, v124, 16);
    if (v53)
      continue;
    break;
  }
LABEL_110:

  v72 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_DEBUG))
  {
    v74 = objc_msgSend(v83, "count");
    v75 = objc_msgSend(v84, "count");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v128 = v74;
    *(_WORD *)&v128[4] = 1024;
    *(_DWORD *)&v128[6] = v75;
    _os_log_debug_impl(&dword_1CAB79000, (os_log_t)v72, OS_LOG_TYPE_DEBUG, "Beautifier: Sampled %d items out of %d", buf, 0xEu);
  }

  v11 = v83;
LABEL_117:

LABEL_118:
  _Block_object_dispose(&v120, 8);

  return v11;
}

- (id)performWithItems:(id)a3 maximumNumberOfItemsToChoose:(unint64_t)a4 progressBlock:(id)a5
{
  return -[CLSAssetsBeautifier performWithItems:maximumNumberOfItemsToChoose:debugInfo:progressBlock:](self, "performWithItems:maximumNumberOfItemsToChoose:debugInfo:progressBlock:", a3, a4, 0, a5);
}

- (id)performWithItems:(id)a3 maximumNumberOfItemsToChoose:(unint64_t)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  id v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD, double);
  char v12;
  void *v13;
  OS_os_log *v14;
  CLSAssetsBeautifier *v15;
  uint64_t v16;
  char v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  OS_os_log *v22;
  id v23;
  char v24;
  id v25;
  id v26;
  void *v27;
  int v28;
  int v29;
  id v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  int v51;
  double v52;
  uint64_t v53;
  void *v54;
  OS_os_log *v55;
  id v56;
  void *v57;
  NSObject *v58;
  char v59;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  id obj;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[4];
  id v91;
  uint64_t *v92;
  char v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  char v97;
  _BYTE v98[128];
  uint8_t v99[128];
  uint8_t buf[4];
  int v101;
  __int16 v102;
  int v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v81 = a5;
  v79 = a6;
  v10 = MEMORY[0x1D1796244]();
  v11 = (void (**)(_QWORD, _QWORD, double))v10;
  v94 = 0;
  v95 = &v94;
  v96 = 0x2020000000;
  v97 = 0;
  if (!v10
    || (v93 = 0,
        (*(void (**)(uint64_t, char *, double))(v10 + 16))(v10, &v93, 0.0),
        v12 = *((_BYTE *)v95 + 24) | v93,
        (*((_BYTE *)v95 + 24) = v12) == 0))
  {
    v14 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
    {
      v29 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 67109376;
      v101 = a4;
      v102 = 1024;
      v103 = v29;
      _os_log_debug_impl(&dword_1CAB79000, (os_log_t)v14, OS_LOG_TYPE_DEBUG, "Beautifier: Beautifying %d items out of %d", buf, 0xEu);
    }

    objc_msgSend(v81, "setAgent:", CFSTR("Beautifier"));
    v15 = self;
    -[CLSAssetsBeautifier sortedItemsWithItems:](self, "sortedItemsWithItems:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
    -[CLSAssetsBeautifier sampledItemsInSortedItems:maximumNumberOfItemsToChoose:debugInfo:progressBlock:](self, "sampledItemsInSortedItems:maximumNumberOfItemsToChoose:debugInfo:progressBlock:", v16, a4, v81, v79);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSAssetsBeautifier sortedItemsWithItems:](self, "sortedItemsWithItems:");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (void *)v16;
    if (v11)
    {
      v93 = 0;
      ((void (**)(_QWORD, char *, double))v11)[2](v11, &v93, 0.5);
      v17 = *((_BYTE *)v95 + 24) | v93;
      *((_BYTE *)v95 + 24) = v17;
      if (v17)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v101 = 333;
          _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
        v13 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_95;
      }
    }
    v18 = v78;
    v19 = v18;
    if (self->_enableFinalNaturalClustering && (unint64_t)objc_msgSend(v18, "count") >= 2)
    {
      objc_msgSend(v81, "setStage:", CFSTR("Final Natural Clustering"));
      objc_msgSend(v81, "beginTentativeSection");
      -[CLSAssetsBeautifier _naturalClusteringWithItems:withSimilarity:timestampSupport:debugInfo:](self, "_naturalClusteringWithItems:withSimilarity:timestampSupport:debugInfo:", v19, 0, 0, v81);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      objc_msgSend(v81, "endTentativeSectionWithSuccess:", v21 != 0);
      if (v21)
      {
        v22 = self->_loggingConnection;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
        {
          v63 = objc_msgSend(v19, "count");
          v64 = objc_msgSend(v20, "count");
          *(_DWORD *)buf = 67109376;
          v101 = v63;
          v102 = 1024;
          v103 = v64;
          _os_log_debug_impl(&dword_1CAB79000, (os_log_t)v22, OS_LOG_TYPE_DEBUG, "Final Natural Clustering filtered from %d to %d items", buf, 0xEu);
        }

        v23 = v20;
        v19 = v23;
      }

      v15 = self;
    }
    if (v11)
    {
      v93 = 0;
      ((void (**)(_QWORD, char *, double))v11)[2](v11, &v93, 0.5);
      v24 = *((_BYTE *)v95 + 24) | v93;
      *((_BYTE *)v95 + 24) = v24;
      if (v24)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v101 = 353;
          _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
        v13 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_94;
      }
    }
    if (!v15->_enableFinalTimeClustering || (unint64_t)objc_msgSend(v19, "count") < 2)
    {
LABEL_86:
      v58 = v15->_loggingConnection;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        v61 = objc_msgSend(v19, "count");
        v62 = objc_msgSend(v9, "count");
        *(_DWORD *)buf = 67109376;
        v101 = v61;
        v102 = 1024;
        v103 = v62;
        _os_log_debug_impl(&dword_1CAB79000, v58, OS_LOG_TYPE_DEBUG, "Beautifier: Beautified %d items out of %d", buf, 0xEu);
      }

      if (v11
        && (v93 = 0,
            ((void (**)(_QWORD, char *, double))v11)[2](v11, &v93, 1.0),
            v59 = *((_BYTE *)v95 + 24) | v93,
            (*((_BYTE *)v95 + 24) = v59) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v101 = 451;
          _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
        v13 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v19 = v19;
        v13 = v19;
      }
      goto LABEL_94;
    }
    objc_msgSend(v81, "setStage:", CFSTR("Final Time Clustering"));
    v70 = v19;
    v25 = objc_alloc(MEMORY[0x1E0D71698]);
    v26 = -[CLSAssetsBeautifier timeClusteringDistanceBlock](v15, "timeClusteringDistanceBlock");
    v27 = (void *)objc_msgSend(v25, "initWithDistanceBlock:", v26);

    objc_msgSend(v27, "setMaximumDistance:", 3.0);
    objc_msgSend(v27, "setMinimumNumberOfObjects:", 1);
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __93__CLSAssetsBeautifier_performWithItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke;
    v90[3] = &unk_1E84F94F0;
    v72 = v11;
    v91 = v72;
    v92 = &v94;
    objc_msgSend(v27, "performWithDataset:progressBlock:", v70, v90);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v95 + 24))
    {
      v28 = 1;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v101 = 366;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
LABEL_83:

      if (v28)
      {
        v13 = (void *)MEMORY[0x1E0C9AA60];
        v19 = v70;
LABEL_94:

LABEL_95:
        goto LABEL_96;
      }
      v15 = self;
      v19 = v70;
      goto LABEL_86;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v30 = v69;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
    if (!v31)
    {
LABEL_76:

      v55 = self->_loggingConnection;
      if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_DEBUG))
      {
        v65 = objc_msgSend(v70, "count");
        v66 = objc_msgSend(v73, "count");
        *(_DWORD *)buf = 67109376;
        v101 = v65;
        v102 = 1024;
        v103 = v66;
        _os_log_debug_impl(&dword_1CAB79000, (os_log_t)v55, OS_LOG_TYPE_DEBUG, "Final Time Clustering filtered from %d to %d items", buf, 0xEu);
      }

      v56 = v73;
      v28 = 0;
      v57 = v70;
      v70 = v56;
LABEL_82:

      goto LABEL_83;
    }
    v74 = *(_QWORD *)v87;
    v32 = *MEMORY[0x1E0D77DD0];
    v67 = v27;
    v68 = v9;
    obj = v30;
LABEL_32:
    v75 = v31;
    v33 = 0;
    while (1)
    {
      if (*(_QWORD *)v87 != v74)
        objc_enumerationMutation(obj);
      v34 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v33);
      if (v11)
      {
        v93 = 0;
        (*((void (**)(id, char *, double))v72 + 2))(v72, &v93, 0.5);
        v35 = *((_BYTE *)v95 + 24) | v93;
        *((_BYTE *)v95 + 24) = v35;
        if (v35)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            v101 = 372;
            _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
          }
          v28 = 1;
          v57 = obj;
          goto LABEL_82;
        }
      }
      objc_msgSend(v34, "objects");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(objc_msgSend(v36, "count") - 2) <= 2)
        break;
      objc_msgSend(v73, "addObjectsFromArray:", v36);
LABEL_74:

      if (++v33 == v75)
      {
        v30 = obj;
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
        if (v31)
          goto LABEL_32;
        goto LABEL_76;
      }
    }
    -[CLSAssetsBeautifier requiredItemsInItems:](self, "requiredItemsInItems:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "count"))
    {
      objc_msgSend(v73, "addObjectsFromArray:", v37);
      if (v81)
        objc_msgSend(v81, "dedupItems:toRequiredItems:withDedupingType:", v36, v37, 5);
      goto LABEL_73;
    }
    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v39 = v36;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v83 != v41)
            objc_enumerationMutation(v39);
          v43 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
          if ((objc_msgSend(v43, "clsIsInterestingSDOF") & 1) != 0
            || (objc_msgSend(v43, "clsIsInterestingHDR") & 1) != 0
            || objc_msgSend(v43, "clsIsInterestingLivePhoto"))
          {
            objc_msgSend(v38, "addObject:", v43);
          }
        }
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
      }
      while (v40);
    }

    v27 = v67;
    v9 = v68;
    -[CLSAssetsBeautifier bestItemInItems:](self, "bestItemInItems:", v39);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      if (!objc_msgSend(v38, "count")
        || (objc_msgSend(v44, "clsIsInterestingSDOF") & 1) != 0
        || (objc_msgSend(v44, "clsIsInterestingHDR") & 1) != 0
        || (objc_msgSend(v44, "clsIsInterestingLivePhoto") & 1) != 0)
      {
        goto LABEL_65;
      }
      -[CLSAssetsBeautifier bestItemInItems:](self, "bestItemInItems:", v38);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "clsContentScore");
      v47 = v46;
      if (objc_msgSend(v44, "isFavorite"))
        v48 = v32;
      else
        v48 = -0.0;
      objc_msgSend(v45, "clsContentScore");
      v50 = v49;
      v51 = objc_msgSend(v45, "isFavorite");
      v52 = -0.0;
      if (v51)
        v52 = v32;
      if (v50 + v52 < v47 + v48)
      {

LABEL_65:
        v53 = 5;
LABEL_66:
        objc_msgSend(v73, "addObject:", v44);
        objc_msgSend(v81, "dedupItems:toItem:withDedupingType:", v39, v44, v53);
LABEL_72:

LABEL_73:
        goto LABEL_74;
      }

      if (v45)
      {
        v44 = v45;
        v53 = 4;
        goto LABEL_66;
      }
    }
    if (v81)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v39);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setState:ofItems:withReason:", 2, v54, CFSTR("No best item was found"));

    }
    v44 = 0;
    goto LABEL_72;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v101 = 316;
    _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
  }
  v13 = (void *)MEMORY[0x1E0C9AA60];
LABEL_96:
  _Block_object_dispose(&v94, 8);

  return v13;
}

- (id)deduplicateItems:(id)a3 debugInfo:(id)a4
{
  return -[CLSAssetsBeautifier deduplicateItems:withDuration:andSimilarity:debugInfo:](self, "deduplicateItems:withDuration:andSimilarity:debugInfo:", a3, 2, a4, 60.0);
}

- (id)deduplicateItems:(id)a3 withDuration:(double)a4 andSimilarity:(int64_t)a5 debugInfo:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  double v29;
  double v30;
  void *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  objc_msgSend(v10, "setAgent:", CFSTR("Beautifier"));
  objc_msgSend(v10, "setStage:", CFSTR("Deduplicate"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0D71698]);
  v13 = -[CLSAssetsBeautifier timeClusteringDistanceBlock](self, "timeClusteringDistanceBlock");
  v14 = (void *)objc_msgSend(v12, "initWithDistanceBlock:", v13);

  objc_msgSend(v14, "setMaximumDistance:", a4);
  objc_msgSend(v14, "setMinimumNumberOfObjects:", 1);
  v32 = v14;
  v33 = v9;
  objc_msgSend(v14, "performWithDataset:progressBlock:", v9, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v36;
    v19 = *MEMORY[0x1E0D77DF0];
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v20), "objects");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v21, "count") < 2)
        {
          objc_msgSend(v21, "firstObject");
          v23 = (id)objc_claimAutoreleasedReturnValue();
          if (-[CLSAssetsBeautifier itemIsRequired:](self, "itemIsRequired:", v23))
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v10;
            v26 = 4;
            v27 = v24;
            v28 = CFSTR("Item is required");
          }
          else
          {
            objc_msgSend(v23, "clsContentScore");
            v30 = v29;
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v10;
            if (v30 <= v19)
            {
              v26 = 2;
              v27 = v24;
              v28 = CFSTR("Asset is Junk");
            }
            else
            {
              v26 = 1;
              v27 = v24;
              v28 = CFSTR("Unique asset");
            }
          }
          objc_msgSend(v25, "setState:ofItems:withReason:", v26, v27, v28);
          goto LABEL_16;
        }
        -[CLSAssetsBeautifier _naturalClusteringWithItems:withSimilarity:timestampSupport:debugInfo:](self, "_naturalClusteringWithItems:withSimilarity:timestampSupport:debugInfo:", v21, a5, 0, v10);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22 && objc_msgSend(v22, "count"))
        {
          v23 = v23;
          v24 = v21;
          v21 = v23;
LABEL_16:

        }
        objc_msgSend(v11, "addObjectsFromArray:", v21);

        ++v20;
      }
      while (v17 != v20);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v17);
  }

  return v11;
}

- (id)_clustersBySplittingZeroDiameterClustersInClusters:(id)a3 targetingNumberOfClusters:(unint64_t)a4
{
  id v5;
  int64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v42;
  void *v43;
  int64_t v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4 - objc_msgSend(v5, "count");
  if (v6 <= 0)
  {
    v40 = v5;
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v48 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v14, "objects");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v15, "count") <= 1)
            v16 = v7;
          else
            v16 = v8;
          objc_msgSend(v16, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v8, "count"))
    {
      v46 = v8;
      v42 = v9;
      v43 = v7;
      v17 = 0x1E0D71000;
      v18 = v6;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objects.@count"), 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v46;
        objc_msgSend(v46, "sortUsingDescriptors:", v20);

        objc_msgSend(v46, "firstObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");
        v24 = objc_msgSend(v46, "count");
        v25 = v23;
        if (v24 >= 2)
        {
          objc_msgSend(v46, "objectAtIndexedSubscript:", 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objects");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "count");

          v21 = v46;
          v29 = v23 / v28;
          v17 = 0x1E0D71000uLL;
          v25 = v29 + 1;
        }
        v44 = v18 + 1;
        if (v25 >= v18 + 1)
          v30 = v18 + 1;
        else
          v30 = v25;
        objc_msgSend(v21, "removeObjectAtIndex:", 0);
        if (v30)
        {
          v31 = 0;
          v32 = v23;
          v33 = v30;
          do
          {
            v34 = v32 / v30;
            v35 = v32 / v30 - v31;
            v36 = *(void **)(v17 + 1696);
            objc_msgSend(v22, "subarrayWithRange:");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "clusterWithObjects:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = 0x1E0D71000;
            if (v35 <= 1)
              v39 = v43;
            else
              v39 = v46;
            objc_msgSend(v39, "addObject:", v38);

            v32 += v23;
            v31 = v34;
            --v33;
          }
          while (v33);
        }
        v18 = v44 - v30;

      }
      while ((uint64_t)(v44 - v30) > 0);
      v7 = v43;
      v8 = v46;
      objc_msgSend(v43, "arrayByAddingObjectsFromArray:", v46);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    v40 = v9;

  }
  return v40;
}

- (id)sortedItemsWithItems:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3928];
  v4 = a3;
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:", CFSTR("cls_universalDate"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("clsIdentifier"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)bestItemInItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *loggingConnection;
  void *v8;
  NSSet *identifiersOfEligibleItems;
  void *v10;
  _BOOL4 v11;
  double v12;
  void *v13;
  id v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  NSSet *v28;
  void *v29;
  _BOOL4 v30;
  int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  double v39;
  uint64_t v40;
  double v41;
  unint64_t v42;
  void *v43;
  void *v45;
  id v46;
  double v47;
  unint64_t v48;
  void *v49;
  unint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[16];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "count");
  if (!v5)
    goto LABEL_57;
  -[CLSAssetsBeautifier requiredItemsInItems:](self, "requiredItemsInItems:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAB79000, loggingConnection, OS_LOG_TYPE_ERROR, "bestItemInItems should not be called on items containing required items", buf, 2u);
    }
  }
  if (v5 == (void *)1)
  {
    objc_msgSend(v4, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    identifiersOfEligibleItems = self->_identifiersOfEligibleItems;
    if (identifiersOfEligibleItems
      && (objc_msgSend(v8, "clsIdentifier"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = -[NSSet containsObject:](identifiersOfEligibleItems, "containsObject:", v10),
          v10,
          !v11)
      || (objc_msgSend(v5, "clsContentScore"), v12 < *MEMORY[0x1E0D77DE0]))
    {
      v45 = v6;
      v46 = v4;
      v13 = 0;
      goto LABEL_55;
    }
    goto LABEL_56;
  }
  v45 = v6;
  v46 = v4;
  -[CLSAssetsBeautifier sortedItemsWithItems:](self, "sortedItemsWithItems:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = objc_msgSend(v5, "count");
  v54 = *MEMORY[0x1E0D77DE0];
  v53 = *MEMORY[0x1E0D77DD0];
  v48 = v15 >> 1;
  v49 = v5;
  v50 = v15;
  v47 = (double)v15 * 0.5;
  do
  {
    if (objc_msgSend(v14, "count") >= v15)
      goto LABEL_52;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v16 = v5;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (!v17)
    {

LABEL_52:
      v13 = 0;
      break;
    }
    v18 = v17;
    v13 = 0;
    v19 = *(_QWORD *)v56;
    v20 = -1.79769313e308;
    v21 = 1.79769313e308;
    v22 = -1.79769313e308;
    v23 = -1.79769313e308;
    v51 = -1.79769313e308;
    v52 = 1.79769313e308;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v56 != v19)
          objc_enumerationMutation(v16);
        v25 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v24);
        if ((objc_msgSend(v14, "containsObject:", v25) & 1) == 0)
        {
          objc_msgSend(v25, "clsContentScore");
          v27 = v26;
          v28 = self->_identifiersOfEligibleItems;
          if (v28
            && (objc_msgSend(v25, "clsIdentifier"),
                v29 = (void *)objc_claimAutoreleasedReturnValue(),
                v30 = -[NSSet containsObject:](v28, "containsObject:", v29),
                v29,
                !v30)
            || v27 < v54)
          {
            objc_msgSend(v14, "addObject:", v25);
            goto LABEL_34;
          }
          if (v21 >= v27)
            v21 = v27;
          v31 = objc_msgSend(v25, "isFavorite");
          v32 = -0.0;
          if (v31)
            v32 = v53;
          v33 = v27 + v32;
          objc_msgSend(v25, "clsAestheticScore");
          v35 = v34;
          objc_msgSend(v25, "clsFaceScore");
          v37 = v36;
          if (v33 > v22)
          {
            v52 = 1.79769313e308;
LABEL_33:
            v38 = v25;

            v13 = v38;
            v51 = v27;
            v22 = v33;
            v23 = v35;
            v20 = v37;
            goto LABEL_34;
          }
          if (v33 != v22)
            goto LABEL_34;
          if (v36 > v20)
            goto LABEL_32;
          if (v36 != v20)
            goto LABEL_34;
          if (v35 > v23)
          {
LABEL_32:
            v52 = v35 - v23;
            goto LABEL_33;
          }
          v39 = v52;
          if (v52 >= v23 - v35)
            v39 = v23 - v35;
          v52 = v39;
        }
LABEL_34:
        ++v24;
      }
      while (v18 != v24);
      v40 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      v18 = v40;
    }
    while (v40);

    v15 = v50;
    if (!v13)
    {
      v5 = v49;
      break;
    }
    v5 = v49;
    if (v51 != v21)
      break;
    if (v50 < 2)
      break;
    if ((objc_msgSend(v13, "isFavorite", v51) & 1) != 0)
      break;
    if ((objc_msgSend(v13, "clsIsAestheticallyPrettyGood") & 1) != 0)
      break;
    v41 = v52;
    if (v52 > 0.0)
      break;
    v42 = v48;
    do
    {
      v43 = v13;
      objc_msgSend(v16, "objectAtIndexedSubscript:", v42, v41);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v14, "containsObject:", v13))
        break;
      v41 = (double)v42;
      v42 = v50 - v42 - (v47 <= (double)v42);
    }
    while (v42 < v50);
  }
  while (!v13);

LABEL_55:
  v5 = v13;
  v6 = v45;
  v4 = v46;
LABEL_56:

LABEL_57:
  return v5;
}

- (id)_naturalClusteringBestItemInItems:(id)a3
{
  id v4;
  void *v5;
  NSObject *loggingConnection;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t i;
  void *v18;
  NSSet *identifiersOfEligibleItems;
  void *v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  int v25;
  double v26;
  double v27;
  double v28;
  id v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[16];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CLSAssetsBeautifier requiredItemsInItems:](self, "requiredItemsInItems:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAB79000, loggingConnection, OS_LOG_TYPE_ERROR, "_naturalClusteringBestItemInItems should not be called on items containing required items", buf, 2u);
    }
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (!v8)
  {
    v11 = 0;
    v32 = v7;
    goto LABEL_37;
  }
  v9 = v8;
  v35 = v5;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v37;
  v13 = *MEMORY[0x1E0D77DD0];
  v14 = -1.79769313e308;
  v15 = 1.79769313e308;
  v16 = -1.79769313e308;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v37 != v12)
        objc_enumerationMutation(v7);
      v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      identifiersOfEligibleItems = self->_identifiersOfEligibleItems;
      if (identifiersOfEligibleItems)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "clsIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[NSSet containsObject:](identifiersOfEligibleItems, "containsObject:", v20);

        if (!v21)
          continue;
      }
      objc_msgSend(v18, "clsContentScore");
      v23 = v22;
      if (v15 >= v22)
        v15 = v22;
      if (objc_msgSend(v18, "isFavorite"))
        v24 = v13;
      else
        v24 = v23;
      v25 = objc_msgSend(v18, "clsIsAestheticallyPrettyGood");
      if (v24 <= v16)
      {
        if (v24 != v16 || (v25 & 1) == 0)
          continue;
      }
      else if (v25)
      {
        objc_msgSend(v18, "clsAestheticScore");
        v27 = v26;
        v10 = 1;
LABEL_28:
        v30 = v18;

        v14 = v27;
        v16 = v24;
        v11 = v30;
        continue;
      }
      if (v24 == v16)
        v10 = objc_msgSend(v11, "clsIsAestheticallyPrettyGood") ^ 1;
      else
        v10 = 0;
      objc_msgSend(v18, "clsAestheticScore");
      v27 = v28;
      if (v24 > v16 || v28 > v14)
        goto LABEL_28;
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  }
  while (v9);

  if (v11)
  {
    v5 = v35;
    if (((objc_msgSend(v11, "isFavorite") | v10) & 1) == 0)
    {
      objc_msgSend(v11, "clsContentScore");
      if (v31 == v15)
      {
        -[CLSAssetsBeautifier rankSimilarItems:](self, "rankSimilarItems:", v7);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "count"))
        {
          objc_msgSend(v32, "firstObject");
          v33 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v33;
        }
LABEL_37:

      }
    }
  }
  else
  {
    v5 = v35;
  }

  return v11;
}

- (id)_naturalClusteringWithItems:(id)a3 withSimilarity:(int64_t)a4 timestampSupport:(BOOL)a5 debugInfo:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  NSSet *identifiersOfEligibleItems;
  void *v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v7 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_opt_new();
  v31 = v10;
  -[CLSSimilarStacker stackSimilarItems:withSimilarity:timestampSupport:progressBlock:](self->_similarStacker, "stackSimilarItems:withSimilarity:timestampSupport:progressBlock:", v10, a4, v7, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v18, "count") < 2)
        {
          objc_msgSend(v18, "firstObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v20;
          if (v20)
          {
            identifiersOfEligibleItems = self->_identifiersOfEligibleItems;
            if (!identifiersOfEligibleItems
              || (objc_msgSend(v20, "clsIdentifier"),
                  v22 = (void *)objc_claimAutoreleasedReturnValue(),
                  v23 = -[NSSet containsObject:](identifiersOfEligibleItems, "containsObject:", v22),
                  v22,
                  v23))
            {
              objc_msgSend(v12, "addObject:", v19);
              if (v11)
              {
                if (-[CLSAssetsBeautifier itemIsRequired:](self, "itemIsRequired:", v19))
                {
                  v24 = v11;
                  v25 = 4;
                  v26 = v19;
                  v27 = CFSTR("Item is required");
                }
                else
                {
                  v24 = v11;
                  v25 = 1;
                  v26 = v19;
                  v27 = CFSTR("Alone in Natural Clustering");
                }
                objc_msgSend(v24, "setState:ofItem:withReason:", v25, v26, v27);
              }
            }
          }
        }
        else
        {
          -[CLSAssetsBeautifier requiredItemsInItems:](self, "requiredItemsInItems:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "count"))
          {
            objc_msgSend(v12, "addObjectsFromArray:", v19);
            if (v11)
              objc_msgSend(v11, "dedupItems:toRequiredItems:withDedupingType:", v18, v19, 1);
          }
          else
          {
            -[CLSAssetsBeautifier _naturalClusteringBestItemInItems:](self, "_naturalClusteringBestItemInItems:", v18);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              objc_msgSend(v12, "addObject:", v28);
              objc_msgSend(v11, "dedupItems:toItem:withDedupingType:", v18, v28, 1);
            }
            else if (v11)
            {
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v18);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setState:ofItems:withReason:", 2, v29, CFSTR("Failed to find a best item in Natural Clustering"));

            }
          }
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v15);
  }

  return v12;
}

- (id)rankSimilarItems:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_1233);
}

- (BOOL)itemIsRequired:(id)a3
{
  NSSet *identifiersOfRequiredItems;
  void *v4;
  BOOL v5;

  identifiersOfRequiredItems = self->_identifiersOfRequiredItems;
  if (!identifiersOfRequiredItems)
    return 0;
  objc_msgSend(a3, "clsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSSet containsObject:](identifiersOfRequiredItems, "containsObject:", v4);

  return v5;
}

- (id)requiredItemsInItems:(id)a3
{
  id v4;
  NSSet *identifiersOfRequiredItems;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSSet *v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  identifiersOfRequiredItems = self->_identifiersOfRequiredItems;
  if (identifiersOfRequiredItems && -[NSSet count](identifiersOfRequiredItems, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v13 = self->_identifiersOfRequiredItems;
          objc_msgSend(v12, "clsIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v13) = -[NSSet containsObject:](v13, "containsObject:", v14);

          if ((_DWORD)v13)
          {
            if (!v9)
              v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v9, "addObject:", v12);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v4 = v16;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)enableStatisticalSampling
{
  return self->_enableStatisticalSampling;
}

- (void)setEnableStatisticalSampling:(BOOL)a3
{
  self->_enableStatisticalSampling = a3;
}

- (BOOL)enableNetworkAccess
{
  return self->_enableNetworkAccess;
}

- (void)setEnableNetworkAccess:(BOOL)a3
{
  self->_enableNetworkAccess = a3;
}

- (BOOL)enableIntermediateNaturalClustering
{
  return self->_enableIntermediateNaturalClustering;
}

- (void)setEnableIntermediateNaturalClustering:(BOOL)a3
{
  self->_enableIntermediateNaturalClustering = a3;
}

- (BOOL)enableFinalNaturalClustering
{
  return self->_enableFinalNaturalClustering;
}

- (void)setEnableFinalNaturalClustering:(BOOL)a3
{
  self->_enableFinalNaturalClustering = a3;
}

- (BOOL)enableFinalTimeClustering
{
  return self->_enableFinalTimeClustering;
}

- (void)setEnableFinalTimeClustering:(BOOL)a3
{
  self->_enableFinalTimeClustering = a3;
}

- (BOOL)usesKMeans
{
  return self->_usesKMeans;
}

- (void)setUsesKMeans:(BOOL)a3
{
  self->_usesKMeans = a3;
}

- (NSSet)identifiersOfRequiredItems
{
  return self->_identifiersOfRequiredItems;
}

- (void)setIdentifiersOfRequiredItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)identifiersOfEligibleItems
{
  return self->_identifiersOfEligibleItems;
}

- (void)setIdentifiersOfEligibleItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)discardNonEligibleClustersInSampling
{
  return self->_discardNonEligibleClustersInSampling;
}

- (void)setDiscardNonEligibleClustersInSampling:(BOOL)a3
{
  self->_discardNonEligibleClustersInSampling = a3;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)setLoggingConnection:(id)a3
{
  objc_storeStrong((id *)&self->_loggingConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_identifiersOfEligibleItems, 0);
  objc_storeStrong((id *)&self->_identifiersOfRequiredItems, 0);
  objc_storeStrong((id *)&self->_similarStacker, 0);
}

uint64_t __40__CLSAssetsBeautifier_rankSimilarItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v16;
  int v17;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "clsIsAestheticallyPrettyGood");
  v7 = objc_msgSend(v5, "clsIsAestheticallyPrettyGood");
  if (v6)
  {
    v8 = -1;
    if (!v7)
      goto LABEL_19;
    objc_msgSend(v4, "clsAestheticScore");
    v10 = v9;
    objc_msgSend(v5, "clsAestheticScore");
    v12 = v11 + 0.0;
    v13 = v10 + 0.0;
    if (v10 <= v11 + 0.0)
      v8 = 1;
  }
  else
  {
    if ((v7 & 1) != 0)
      goto LABEL_7;
    objc_msgSend(v4, "clsAestheticScore");
    v10 = v14;
    objc_msgSend(v5, "clsAestheticScore");
    v12 = v11 + 0.0;
    v13 = v10 + 0.0;
    if (v10 <= v11 + 0.0)
      v8 = 1;
    else
      v8 = -1;
  }
  if (v11 <= v13 && v10 <= v12)
  {
    v16 = objc_msgSend(v4, "clsIsInterestingSDOF");
    v17 = objc_msgSend(v5, "clsIsInterestingSDOF");
    if (v16 && !v17)
      goto LABEL_18;
    if ((v16 | v17 ^ 1) == 1)
    {
      objc_msgSend(v4, "clsSharpnessScore");
      v20 = v19;
      objc_msgSend(v5, "clsSharpnessScore");
      if (v21 <= v20)
      {
        if (v21 >= v20)
        {
          objc_msgSend(v4, "cls_universalDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "cls_universalDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v22, "compare:", v23);

          if (!v8)
          {
            objc_msgSend(v4, "clsIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "clsIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = objc_msgSend(v24, "compare:", v25);

          }
          goto LABEL_19;
        }
LABEL_18:
        v8 = -1;
        goto LABEL_19;
      }
    }
LABEL_7:
    v8 = 1;
  }
LABEL_19:

  return v8;
}

uint64_t __93__CLSAssetsBeautifier_performWithItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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

uint64_t __102__CLSAssetsBeautifier_sampledItemsInSortedItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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

uint64_t __102__CLSAssetsBeautifier_sampledItemsInSortedItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke_29(uint64_t a1, _BYTE *a2, double a3)
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

uint64_t __102__CLSAssetsBeautifier_sampledItemsInSortedItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke_33(uint64_t a1, _BYTE *a2, double a3)
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

+ (id)beautifier
{
  return objc_alloc_init((Class)objc_opt_class());
}

@end
