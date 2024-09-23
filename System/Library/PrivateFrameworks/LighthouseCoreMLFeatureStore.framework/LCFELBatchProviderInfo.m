@implementation LCFELBatchProviderInfo

+ (id)meanOf:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "doubleValue", (_QWORD)v14);
          v8 = v8 + v10;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8 / (double)(unint64_t)objc_msgSend(v4, "count"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  return v12;
}

+ (id)standardDeviationOf:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    +[LCFELBatchProviderInfo meanOf:](LCFELBatchProviderInfo, "meanOf:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "doubleValue", (_QWORD)v17);
          v11 = v11 + (v13 - v6) * (v13 - v6);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", sqrt(v11 / (double)(unint64_t)objc_msgSend(v7, "count")));
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

  return v15;
}

- (id)init:(id)a3 labelFeatureName:(id)a4
{
  id v6;
  LCFELBatchProviderInfo *v7;
  uint64_t v8;
  NSUUID *contextId;
  uint64_t v10;
  NSUUID *eventId;
  uint64_t v12;
  NSString *featureStoreKey;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSNumber *timeRange;
  uint64_t v19;
  NSNumber *featureCount;
  id v21;
  char *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  char v37;
  id v38;
  void *v39;
  char v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  LCFELFeatureValueStatistic *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  NSArray *positiveFeatureStatistics;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t k;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  LCFELFeatureValueStatistic *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  NSArray *negativeFeatureStatistics;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t m;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  LCFELFeatureValueStatistic *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  uint64_t v100;
  NSDictionary *totalFeatureStatistics;
  id v103;
  LCFELBatchProviderInfo *v104;
  id obj;
  uint64_t v106;
  id v107;
  char *v108;
  id v109;
  id v110;
  id v111;
  id v112;
  char *v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  void *v120;
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
  __int128 v138;
  __int128 v139;
  __int128 v140;
  objc_super v141;
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  uint64_t v147;

  v147 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v107 = a4;
  v141.receiver = self;
  v141.super_class = (Class)LCFELBatchProviderInfo;
  v7 = -[LCFELBatchProviderInfo init](&v141, sel_init);
  if (!v7)
    goto LABEL_49;
  +[LCFFeatureStoreContextId getContextId](LCFFeatureStoreContextId, "getContextId");
  v8 = objc_claimAutoreleasedReturnValue();
  contextId = v7->_contextId;
  v7->_contextId = (NSUUID *)v8;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = objc_claimAutoreleasedReturnValue();
  eventId = v7->_eventId;
  v7->_eventId = (NSUUID *)v10;

  objc_msgSend(v6, "featureStoreKey");
  v12 = objc_claimAutoreleasedReturnValue();
  featureStoreKey = v7->_featureStoreKey;
  v7->_featureStoreKey = (NSString *)v12;

  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "timeLast");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeFirst");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v16);
  objc_msgSend(v14, "numberWithDouble:");
  v17 = objc_claimAutoreleasedReturnValue();
  timeRange = v7->_timeRange;
  v7->_timeRange = (NSNumber *)v17;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "count"));
  v19 = objc_claimAutoreleasedReturnValue();
  featureCount = v7->_featureCount;
  v104 = v7;
  v7->_featureCount = (NSNumber *)v19;

  v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v117 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v116 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v103 = v6;
  objc_msgSend(v6, "featureProviders");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v120 = v21;
  v108 = (char *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v146, 16);
  if (!v108)
    goto LABEL_27;
  v106 = *(_QWORD *)v138;
  do
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v138 != v106)
        objc_enumerationMutation(obj);
      v113 = v22;
      +[LCFCoreMLFeatureProvider fromMLProvider:](LCFCoreMLFeatureProvider, "fromMLProvider:", *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)v22));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "featureValues");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", v107);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v110 = v25;
      v26 = objc_msgSend(v25, "int64Value");
      v27 = v117;
      if (v26 <= 0)
        v27 = v116;
      v28 = v27;
      v133 = 0u;
      v134 = 0u;
      v135 = 0u;
      v136 = 0u;
      objc_msgSend(v23, "featureValues");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "allKeys");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v118 = v30;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v134;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v134 != v33)
              objc_enumerationMutation(v118);
            v35 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * i);
            objc_msgSend(v28, "allKeys");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "containsObject:", v35);

            if ((v37 & 1) == 0)
            {
              v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v38, v35);

            }
            objc_msgSend(v21, "allKeys");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "containsObject:", v35);

            if ((v40 & 1) == 0)
            {
              v41 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v41, v35);

            }
            objc_msgSend(v23, "featureValues");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectForKeyedSubscript:", v35);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            v44 = objc_msgSend(v43, "type");
            if (v44 == 2)
            {
              objc_msgSend(v28, "objectForKeyedSubscript:", v35);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v43, "doubleValue");
              objc_msgSend(v50, "numberWithDouble:");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "addObject:", v51);

              v21 = v120;
              objc_msgSend(v120, "objectForKeyedSubscript:", v35);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v43, "doubleValue");
              objc_msgSend(v52, "numberWithDouble:");
              v48 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v44 != 1)
                goto LABEL_23;
              objc_msgSend(v28, "objectForKeyedSubscript:", v35);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v43, "int64Value"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addObject:", v46);

              v21 = v120;
              objc_msgSend(v120, "objectForKeyedSubscript:", v35);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v43, "int64Value"));
              v48 = objc_claimAutoreleasedReturnValue();
            }
            v53 = (void *)v48;
            objc_msgSend(v47, "addObject:", v48);

LABEL_23:
          }
          v32 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
        }
        while (v32);
      }

      v22 = v113 + 1;
    }
    while (v113 + 1 != v108);
    v108 = (char *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v146, 16);
  }
  while (v108);
LABEL_27:

  v119 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  objc_msgSend(v117, "allKeys");
  v114 = (id)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v129, v144, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v130;
    do
    {
      for (j = 0; j != v55; ++j)
      {
        if (*(_QWORD *)v130 != v56)
          objc_enumerationMutation(v114);
        v58 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * j);
        objc_msgSend(v117, "objectForKeyedSubscript:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        +[LCFELBatchProviderInfo meanOf:](LCFELBatchProviderInfo, "meanOf:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v117, "objectForKeyedSubscript:", v58);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        +[LCFELBatchProviderInfo standardDeviationOf:](LCFELBatchProviderInfo, "standardDeviationOf:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        v63 = [LCFELFeatureValueStatistic alloc];
        v64 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v117, "objectForKeyedSubscript:", v58);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "numberWithUnsignedInteger:", objc_msgSend(v65, "count"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = -[LCFELFeatureValueStatistic init:count:mean:stddev:](v63, "init:count:mean:stddev:", v58, v66, v60, v62);

        objc_msgSend(v119, "addObject:", v67);
      }
      v55 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v129, v144, 16);
    }
    while (v55);
  }

  v68 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v119);
  positiveFeatureStatistics = v104->_positiveFeatureStatistics;
  v104->_positiveFeatureStatistics = (NSArray *)v68;

  v115 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  objc_msgSend(v116, "allKeys");
  v111 = (id)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v125, v143, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v126;
    do
    {
      for (k = 0; k != v71; ++k)
      {
        if (*(_QWORD *)v126 != v72)
          objc_enumerationMutation(v111);
        v74 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * k);
        objc_msgSend(v116, "objectForKeyedSubscript:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        +[LCFELBatchProviderInfo meanOf:](LCFELBatchProviderInfo, "meanOf:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v116, "objectForKeyedSubscript:", v74);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        +[LCFELBatchProviderInfo standardDeviationOf:](LCFELBatchProviderInfo, "standardDeviationOf:", v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        v79 = [LCFELFeatureValueStatistic alloc];
        v80 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v116, "objectForKeyedSubscript:", v74);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "numberWithUnsignedInteger:", objc_msgSend(v81, "count"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = -[LCFELFeatureValueStatistic init:count:mean:stddev:](v79, "init:count:mean:stddev:", v74, v82, v76, v78);

        objc_msgSend(v115, "addObject:", v83);
      }
      v71 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v125, v143, 16);
    }
    while (v71);
  }

  v84 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v115);
  negativeFeatureStatistics = v104->_negativeFeatureStatistics;
  v104->_negativeFeatureStatistics = (NSArray *)v84;

  v112 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  objc_msgSend(v120, "allKeys");
  v109 = (id)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v121, v142, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v122;
    do
    {
      for (m = 0; m != v87; ++m)
      {
        if (*(_QWORD *)v122 != v88)
          objc_enumerationMutation(v109);
        v90 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * m);
        objc_msgSend(v120, "objectForKeyedSubscript:", v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        +[LCFELBatchProviderInfo meanOf:](LCFELBatchProviderInfo, "meanOf:", v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v120, "objectForKeyedSubscript:", v90);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        +[LCFELBatchProviderInfo standardDeviationOf:](LCFELBatchProviderInfo, "standardDeviationOf:", v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        v95 = [LCFELFeatureValueStatistic alloc];
        v96 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v120, "objectForKeyedSubscript:", v90);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "numberWithUnsignedInteger:", objc_msgSend(v97, "count"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = -[LCFELFeatureValueStatistic init:count:mean:stddev:](v95, "init:count:mean:stddev:", v90, v98, v92, v94);

        objc_msgSend(v112, "setObject:forKeyedSubscript:", v99, v90);
      }
      v87 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v121, v142, 16);
    }
    while (v87);
  }

  v100 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:", v112);
  v7 = v104;
  totalFeatureStatistics = v104->_totalFeatureStatistics;
  v104->_totalFeatureStatistics = (NSDictionary *)v100;

  v6 = v103;
LABEL_49:

  return v7;
}

- (NSUUID)contextId
{
  return self->_contextId;
}

- (NSUUID)eventId
{
  return self->_eventId;
}

- (NSString)featureStoreKey
{
  return self->_featureStoreKey;
}

- (NSNumber)timeRange
{
  return self->_timeRange;
}

- (NSNumber)featureCount
{
  return self->_featureCount;
}

- (NSDictionary)totalFeatureStatistics
{
  return self->_totalFeatureStatistics;
}

- (NSArray)positiveFeatureStatistics
{
  return self->_positiveFeatureStatistics;
}

- (NSArray)negativeFeatureStatistics
{
  return self->_negativeFeatureStatistics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeFeatureStatistics, 0);
  objc_storeStrong((id *)&self->_positiveFeatureStatistics, 0);
  objc_storeStrong((id *)&self->_totalFeatureStatistics, 0);
  objc_storeStrong((id *)&self->_featureCount, 0);
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_featureStoreKey, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

@end
