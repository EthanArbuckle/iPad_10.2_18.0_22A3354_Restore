@implementation LCFELCoreAnalyticsHandler

+ (void)myAnalyticsSendEvent:(id)a3 eventPayload:(id)a4
{
  AnalyticsSendEvent();
}

+ (BOOL)emitFeatureStatisticEvents:(id)a3 usageType:(int64_t)a4 batchProviderInfo:(id)a5
{
  id v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t k;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id obj;
  id obja;
  id objb;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[12];
  _QWORD v109[12];
  _BYTE v110[128];
  _QWORD v111[12];
  _QWORD v112[12];
  _BYTE v113[128];
  _QWORD v114[12];
  _QWORD v115[12];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x24BDAC8D0];
  v95 = a3;
  v6 = a5;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  objc_msgSend(v6, "positiveFeatureStatistics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = 0x24BDD1000uLL;
  v93 = v6;
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
  if (v63)
  {
    v60 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v63; ++i)
      {
        if (*(_QWORD *)v105 != v60)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
        v114[0] = CFSTR("contextId");
        objc_msgSend(v6, "contextId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "UUIDString");
        v11 = objc_claimAutoreleasedReturnValue();
        v115[0] = v11;
        v114[1] = CFSTR("eventId");
        objc_msgSend(v6, "eventId");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "UUIDString");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v115[1] = v81;
        v114[2] = CFSTR("featureValueStatisticId");
        objc_msgSend(v95, "UUIDString");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v115[2] = v78;
        v114[3] = CFSTR("usageType");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v115[3] = v75;
        v114[4] = CFSTR("timeRange");
        objc_msgSend(v6, "timeRange");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v115[4] = v72;
        v114[5] = CFSTR("faetureStoreKey");
        objc_msgSend(v6, "featureStoreKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (!v12)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v59;
        }
        v115[5] = v13;
        v114[6] = CFSTR("featureCount");
        objc_msgSend(v6, "featureCount");
        v14 = objc_claimAutoreleasedReturnValue();
        v115[6] = v14;
        v115[7] = &unk_2510A2438;
        v114[7] = CFSTR("sampleType");
        v114[8] = CFSTR("featureName");
        objc_msgSend(v9, "featureName");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v115[8] = v66;
        v114[9] = CFSTR("featureStat_count");
        objc_msgSend(v9, "count");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v115[9] = v15;
        v114[10] = CFSTR("featureStat_mean");
        objc_msgSend(v9, "mean");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = (void *)v11;
        v90 = v10;
        v69 = (void *)v14;
        if (objc_msgSend(v16, "isEqualToNumber:", v17))
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        else
          objc_msgSend(v9, "mean");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v115[10] = v18;
        v114[11] = CFSTR("featureStat_stddev");
        objc_msgSend(v9, "stddev");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isEqualToNumber:", v20))
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        else
          objc_msgSend(v9, "stddev");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v115[11] = v21;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v115, v114, 12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        +[LCFELCoreAnalyticsHandler myAnalyticsSendEvent:eventPayload:](LCFELCoreAnalyticsHandler, "myAnalyticsSendEvent:eventPayload:", CFSTR("com.apple.LighthouseCoreMLFoundations.LCFELFeatureValueStatistic"), v22);

        v6 = v93;
        v7 = 0x24BDD1000uLL;
      }
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
    }
    while (v63);
  }

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  objc_msgSend(v6, "negativeFeatureStatistics");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
  if (v64)
  {
    v61 = *(_QWORD *)v101;
    do
    {
      for (j = 0; j != v64; ++j)
      {
        if (*(_QWORD *)v101 != v61)
          objc_enumerationMutation(obja);
        v24 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * j);
        v111[0] = CFSTR("contextId");
        objc_msgSend(v6, "contextId");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "UUIDString");
        v26 = objc_claimAutoreleasedReturnValue();
        v112[0] = v26;
        v111[1] = CFSTR("eventId");
        objc_msgSend(v6, "eventId");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "UUIDString");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v112[1] = v82;
        v111[2] = CFSTR("featureValueStatisticId");
        objc_msgSend(v95, "UUIDString");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v112[2] = v79;
        v111[3] = CFSTR("usageType");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v112[3] = v76;
        v111[4] = CFSTR("timeRange");
        objc_msgSend(v6, "timeRange");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v112[4] = v73;
        v111[5] = CFSTR("faetureStoreKey");
        objc_msgSend(v6, "featureStoreKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (!v27)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v59;
        }
        v112[5] = v28;
        v111[6] = CFSTR("featureCount");
        objc_msgSend(v6, "featureCount");
        v29 = objc_claimAutoreleasedReturnValue();
        v112[6] = v29;
        v112[7] = &unk_2510A2450;
        v111[7] = CFSTR("sampleType");
        v111[8] = CFSTR("featureName");
        objc_msgSend(v24, "featureName");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v112[8] = v67;
        v111[9] = CFSTR("featureStat_count");
        objc_msgSend(v24, "count");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v112[9] = v30;
        v111[10] = CFSTR("featureStat_mean");
        objc_msgSend(v24, "mean");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = (void *)v26;
        v91 = v25;
        v70 = (void *)v29;
        if (objc_msgSend(v31, "isEqualToNumber:", v32))
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        else
          objc_msgSend(v24, "mean");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v112[10] = v33;
        v111[11] = CFSTR("featureStat_stddev");
        objc_msgSend(v24, "stddev");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "isEqualToNumber:", v35))
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        else
          objc_msgSend(v24, "stddev");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v112[11] = v36;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v112, v111, 12);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        +[LCFELCoreAnalyticsHandler myAnalyticsSendEvent:eventPayload:](LCFELCoreAnalyticsHandler, "myAnalyticsSendEvent:eventPayload:", CFSTR("com.apple.LighthouseCoreMLFoundations.LCFELFeatureValueStatistic"), v37);

        v6 = v93;
        v7 = 0x24BDD1000uLL;
      }
      v64 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
    }
    while (v64);
  }

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  objc_msgSend(v6, "totalFeatureStatistics");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "allValues");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objb = v39;
  v65 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
  if (v65)
  {
    v62 = *(_QWORD *)v97;
    do
    {
      for (k = 0; k != v65; ++k)
      {
        if (*(_QWORD *)v97 != v62)
          objc_enumerationMutation(objb);
        v41 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * k);
        v108[0] = CFSTR("contextId");
        objc_msgSend(v6, "contextId");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "UUIDString");
        v43 = objc_claimAutoreleasedReturnValue();
        v109[0] = v43;
        v108[1] = CFSTR("eventId");
        objc_msgSend(v6, "eventId");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "UUIDString");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v109[1] = v83;
        v108[2] = CFSTR("featureValueStatisticId");
        objc_msgSend(v95, "UUIDString");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v109[2] = v80;
        v108[3] = CFSTR("usageType");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v109[3] = v77;
        v108[4] = CFSTR("timeRange");
        objc_msgSend(v6, "timeRange");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v109[4] = v74;
        v108[5] = CFSTR("faetureStoreKey");
        objc_msgSend(v6, "featureStoreKey");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (!v44)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v59;
        }
        v109[5] = v45;
        v108[6] = CFSTR("featureCount");
        objc_msgSend(v6, "featureCount");
        v46 = objc_claimAutoreleasedReturnValue();
        v109[6] = v46;
        v109[7] = &unk_2510A2468;
        v108[7] = CFSTR("sampleType");
        v108[8] = CFSTR("featureName");
        objc_msgSend(v41, "featureName");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v109[8] = v68;
        v108[9] = CFSTR("featureStat_count");
        objc_msgSend(v41, "count");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v109[9] = v47;
        v108[10] = CFSTR("featureStat_mean");
        objc_msgSend(v41, "mean");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v7 + 1304), "notANumber");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = (void *)v43;
        v92 = v42;
        v71 = (void *)v46;
        if (objc_msgSend(v48, "isEqualToNumber:", v49))
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        else
          objc_msgSend(v41, "mean");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v109[10] = v50;
        v108[11] = CFSTR("featureStat_stddev");
        objc_msgSend(v41, "stddev");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v7 + 1304), "notANumber");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v51, "isEqualToNumber:", v52))
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        else
          objc_msgSend(v41, "stddev");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v109[11] = v53;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v109, v108, 12);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v44)
        +[LCFELCoreAnalyticsHandler myAnalyticsSendEvent:eventPayload:](LCFELCoreAnalyticsHandler, "myAnalyticsSendEvent:eventPayload:", CFSTR("com.apple.LighthouseCoreMLFoundations.LCFELFeatureValueStatistic"), v54);

        v6 = v93;
        v7 = 0x24BDD1000;
      }
      v65 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
    }
    while (v65);
  }

  return 1;
}

+ (BOOL)emitModelTrainingEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  _QWORD v25[9];

  v25[7] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bachProviderInfo");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    +[LCFELCoreAnalyticsHandler emitFeatureStatisticEvents:usageType:batchProviderInfo:](LCFELCoreAnalyticsHandler, "emitFeatureStatisticEvents:usageType:batchProviderInfo:", v4, 1, v5);
  v22 = (void *)v5;
  v24[0] = CFSTR("contextId");
  objc_msgSend(v3, "contextId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v20;
  v24[1] = CFSTR("eventId");
  objc_msgSend(v3, "eventId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v18;
  v24[2] = CFSTR("modelName");
  objc_msgSend(v3, "modelName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = CFSTR("succeeded");
  objc_msgSend(v3, "succeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v6;
  v24[4] = CFSTR("errorDomain");
  objc_msgSend(v3, "trainingError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v9;
  v24[5] = CFSTR("errorCodeEnum");
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "trainingError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "code"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[5] = v13;
  v24[6] = CFSTR("featureValueStatisticId");
  v23 = v4;
  objc_msgSend(v4, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  if (!v8)

  +[LCFELCoreAnalyticsHandler myAnalyticsSendEvent:eventPayload:](LCFELCoreAnalyticsHandler, "myAnalyticsSendEvent:eventPayload:", CFSTR("com.apple.LighthouseCoreMLFoundations.LCFELModelTrainingEvent"), v15);
  return 1;
}

+ (BOOL)emitShadowEvaluationEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[8];
  _QWORD v27[10];

  v27[8] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputBachProviderInfo");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    +[LCFELCoreAnalyticsHandler emitFeatureStatisticEvents:usageType:batchProviderInfo:](LCFELCoreAnalyticsHandler, "emitFeatureStatisticEvents:usageType:batchProviderInfo:", v4, 2, v5);
  v24 = (void *)v5;
  v26[0] = CFSTR("contextId");
  objc_msgSend(v3, "contextId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  v26[1] = CFSTR("eventId");
  objc_msgSend(v3, "eventId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  v26[2] = CFSTR("modelName");
  objc_msgSend(v3, "modelName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  v26[3] = CFSTR("succeeded");
  objc_msgSend(v3, "succeeded");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v18;
  v26[4] = CFSTR("errorDomain");
  objc_msgSend(v3, "evaluationError");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[4] = v7;
  v26[5] = CFSTR("errorCodeEnum");
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "evaluationError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "code"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[5] = v11;
  v26[6] = CFSTR("featureValueStatisticId");
  v25 = v4;
  objc_msgSend(v4, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v12;
  v26[7] = CFSTR("accuracy");
  objc_msgSend(v3, "accuracy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[7] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)

  if (!v10)
  if (!v6)

  +[LCFELCoreAnalyticsHandler myAnalyticsSendEvent:eventPayload:](LCFELCoreAnalyticsHandler, "myAnalyticsSendEvent:eventPayload:", CFSTR("com.apple.LighthouseCoreMLFoundations.LCFELShadowEvaluationEvent"), v15);
  return 1;
}

+ (BOOL)emitFeatureImportanceEvent:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id obj;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[15];
  _QWORD v94[15];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  objc_msgSend(v3, "results");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
  if (v68)
  {
    v67 = *(_QWORD *)v90;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v90 != v67)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v4);
        objc_msgSend(v3, "inputBachProviderInfo");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "totalFeatureStatistics");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "featureName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v3, "inputBachProviderInfo");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "totalFeatureStatistics");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "featureName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "count");
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "inputBachProviderInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "totalFeatureStatistics");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "featureName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "mean");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToNumber:", v19);

          if ((v20 & 1) != 0)
          {
            v87 = 0;
          }
          else
          {
            objc_msgSend(v3, "inputBachProviderInfo");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "totalFeatureStatistics");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "featureName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "mean");
            v87 = objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v3, "inputBachProviderInfo");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "totalFeatureStatistics");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "featureName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stddev");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v31, "isEqualToNumber:", v32);

          if ((v33 & 1) != 0)
          {
            v22 = 0;
          }
          else
          {
            objc_msgSend(v3, "inputBachProviderInfo");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "totalFeatureStatistics");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "featureName");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stddev");
            v22 = objc_claimAutoreleasedReturnValue();

          }
          v21 = (void *)v87;
        }
        else
        {
          v21 = 0;
          v22 = 0;
          v86 = &unk_2510A2480;
        }
        v93[0] = CFSTR("contextId");
        objc_msgSend(v3, "contextId");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "UUIDString");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v94[0] = v82;
        v93[1] = CFSTR("eventId");
        objc_msgSend(v3, "eventId");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "UUIDString");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v94[1] = v80;
        v93[2] = CFSTR("succeeded");
        objc_msgSend(v3, "succeeded");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v94[2] = v79;
        v93[3] = CFSTR("errorDomain");
        objc_msgSend(v3, "analysisError");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "domain");
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (!v38)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (uint64_t)v66;
        }
        v77 = (void *)v38;
        v94[3] = v39;
        v93[4] = CFSTR("errorCodeEnum");
        v40 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v3, "analysisError");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "numberWithInteger:", objc_msgSend(v76, "code"));
        v41 = objc_claimAutoreleasedReturnValue();
        v75 = (void *)v41;
        if (!v41)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (uint64_t)v65;
        }
        v94[4] = v41;
        v93[5] = CFSTR("timeRange");
        objc_msgSend(v3, "inputBachProviderInfo");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "timeRange");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v94[5] = v73;
        v93[6] = CFSTR("faetureStoreKey");
        objc_msgSend(v3, "inputBachProviderInfo");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "featureStoreKey");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (!v42)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v64;
        }
        v94[6] = v43;
        v93[7] = CFSTR("featureCount");
        objc_msgSend(v3, "inputBachProviderInfo");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "featureCount");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v94[7] = v70;
        v93[8] = CFSTR("featureName");
        objc_msgSend(v5, "featureName");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (!v44)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v63;
        }
        v94[8] = v45;
        v94[9] = v86;
        v46 = v21;
        v93[9] = CFSTR("featureStat_count");
        v93[10] = CFSTR("featureStat_mean");
        if (!v21)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v62;
        }
        v94[10] = v46;
        v93[11] = CFSTR("featureStat_stddev");
        v47 = v22;
        v84 = (void *)v22;
        if (!v22)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (uint64_t)v61;
        }
        v94[11] = v47;
        v93[12] = CFSTR("correlationCoefficient");
        objc_msgSend(v5, "correlationCoefficient");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v4;
        v88 = v21;
        if (objc_msgSend(v48, "isEqualToNumber:", v49))
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        else
          objc_msgSend(v5, "correlationCoefficient");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v94[12] = v50;
        v93[13] = CFSTR("featureImportance");
        objc_msgSend(v5, "featureImportance");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v51, "isEqualToNumber:", v52))
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        else
          objc_msgSend(v5, "featureImportance");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v94[13] = v53;
        v93[14] = CFSTR("targetLabelFeatureName");
        v54 = v3;
        objc_msgSend(v3, "targetLabelFeatureName");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55;
        if (!v55)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v60;
        }
        v94[14] = v56;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v94, v93, 15);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v55)

        if (!v84)
        v3 = v54;
        if (v88)
        {
          if (v44)
            goto LABEL_41;
        }
        else
        {

          if (v44)
            goto LABEL_41;
        }

LABEL_41:
        if (!v42)

        if (!v75)
        if (!v77)

        +[LCFELCoreAnalyticsHandler myAnalyticsSendEvent:eventPayload:](LCFELCoreAnalyticsHandler, "myAnalyticsSendEvent:eventPayload:", CFSTR("com.apple.LighthouseCoreMLFoundations.LCFELFeatureImportanceEvent"), v69);
        v4 = v85 + 1;
      }
      while (v68 != v85 + 1);
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
      v68 = v57;
    }
    while (v57);
  }

  return 1;
}

+ (BOOL)emitChangePointDetectionEvent:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id obj;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[14];
  _QWORD v91[14];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  objc_msgSend(v3, "results");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
  if (v67)
  {
    v65 = *(_QWORD *)v87;
    v66 = v3;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v87 != v65)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v4);
        v6 = (void *)MEMORY[0x24BDD1608];
        objc_msgSend(v5, "changepointTimestamps");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = 0;
        objc_msgSend(v6, "dataWithJSONObject:options:error:", v7, 1, &v85);
        v8 = objc_claimAutoreleasedReturnValue();
        v78 = v85;

        v79 = (void *)v8;
        v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
        objc_msgSend(v3, "inputBachProviderInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "totalFeatureStatistics");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "featureName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v80 = v4;
        if (v12)
        {
          objc_msgSend(v3, "inputBachProviderInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "totalFeatureStatistics");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "featureName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "count");
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "inputBachProviderInfo");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "totalFeatureStatistics");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "featureName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "mean");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqualToNumber:", v22);

          if ((v23 & 1) != 0)
          {
            v81 = 0;
          }
          else
          {
            objc_msgSend(v3, "inputBachProviderInfo");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "totalFeatureStatistics");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "featureName");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "mean");
            v81 = objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v3, "inputBachProviderInfo");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "totalFeatureStatistics");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "featureName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stddev");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v34, "isEqualToNumber:", v35);

          if ((v36 & 1) != 0)
          {
            v25 = 0;
          }
          else
          {
            objc_msgSend(v3, "inputBachProviderInfo");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "totalFeatureStatistics");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "featureName");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "objectForKeyedSubscript:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "stddev");
            v25 = objc_claimAutoreleasedReturnValue();

          }
          v24 = (void *)v81;
        }
        else
        {
          v24 = 0;
          v25 = 0;
          v83 = &unk_2510A2480;
        }
        v90[0] = CFSTR("contextId");
        objc_msgSend(v3, "contextId");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "UUIDString");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v91[0] = v76;
        v90[1] = CFSTR("eventId");
        objc_msgSend(v3, "eventId");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "UUIDString");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v91[1] = v74;
        v90[2] = CFSTR("succeeded");
        objc_msgSend(v3, "succeeded");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v91[2] = v73;
        v90[3] = CFSTR("errorDomain");
        objc_msgSend(v3, "analysisError");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "domain");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (!v41)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v64;
        }
        v82 = (void *)v25;
        v91[3] = v42;
        v90[4] = CFSTR("errorCodeEnum");
        v43 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v3, "analysisError");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "numberWithInteger:", objc_msgSend(v71, "code"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (!v44)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v63;
        }
        v91[4] = v45;
        v90[5] = CFSTR("timeRange");
        objc_msgSend(v3, "inputBachProviderInfo");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "timeRange");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v91[5] = v69;
        v90[6] = CFSTR("faetureStoreKey");
        objc_msgSend(v3, "inputBachProviderInfo");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "featureStoreKey");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (!v46)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v62;
        }
        v91[6] = v47;
        v90[7] = CFSTR("featureCount");
        objc_msgSend(v3, "inputBachProviderInfo");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "featureCount");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v91[7] = v49;
        v90[8] = CFSTR("featureName");
        objc_msgSend(v5, "featureName");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v50;
        if (!v50)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v61;
        }
        v91[8] = v51;
        v91[9] = v83;
        v52 = v24;
        v90[9] = CFSTR("featureStat_count");
        v90[10] = CFSTR("featureStat_mean");
        if (!v24)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v60;
        }
        v91[10] = v52;
        v90[11] = CFSTR("featureStat_stddev");
        v53 = v82;
        if (!v82)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v59;
        }
        v91[11] = v53;
        v90[12] = CFSTR("changePoints_count");
        objc_msgSend(v5, "detectedChangePointCount");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v90[13] = CFSTR("changePoints");
        v91[12] = v54;
        v91[13] = v84;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 14);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v82)
        {
          if (!v24)
            goto LABEL_39;
        }
        else
        {

          if (!v24)
          {
LABEL_39:

            if (v50)
              goto LABEL_30;
            goto LABEL_40;
          }
        }
        if (v50)
          goto LABEL_30;
LABEL_40:

LABEL_30:
        if (!v46)

        v3 = v66;
        if (!v44)

        if (!v41)
        +[LCFELCoreAnalyticsHandler myAnalyticsSendEvent:eventPayload:](LCFELCoreAnalyticsHandler, "myAnalyticsSendEvent:eventPayload:", CFSTR("com.apple.LighthouseCoreMLFoundations.LCFELChangePointDetectionEvent"), v55);

        v4 = v80 + 1;
      }
      while (v67 != v80 + 1);
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
      v67 = v56;
    }
    while (v56);
  }

  return 1;
}

@end
