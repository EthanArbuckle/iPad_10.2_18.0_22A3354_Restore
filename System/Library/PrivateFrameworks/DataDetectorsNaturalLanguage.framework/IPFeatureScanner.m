@implementation IPFeatureScanner

+ (void)resetSharedCachesAndModels
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("IPScannerResetSharedCachesAndModelsNotification"), 0);

}

- (id)stitchedEventsFromEvents:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    -[IPFeatureScanner _stitchedEventsFromEvents:](self, "_stitchedEventsFromEvents:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    -[IPFeatureScanner _regroupEventsWithSpreadTimeAsAllDayEvents:](self, "_regroupEventsWithSpreadTimeAsAllDayEvents:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)v6;
  }
  else
  {
    v5 = (void *)objc_msgSend(v4, "copy");
  }

  return v5;
}

- (void)setDetectedEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)adjustTimeForEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[IPFeatureScanner adjustTimeForEvent:](self, "adjustTimeForEvent:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (id)eventStore
{
  id v2;

  if (_sharedEventStore)
  {
    v2 = (id)_sharedEventStore;
  }
  else
  {
    if (eventStore__pasOnceToken2 != -1)
      dispatch_once(&eventStore__pasOnceToken2, &__block_literal_global_0);
    objc_msgSend((id)eventStore__pasExprOnceResult, "result");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void __30__IPFeatureScanner_eventStore__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x219A2F708]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A600]), "initWithBlock:idleTimeout:", &__block_literal_global_7, 5.0);
  v2 = (void *)eventStore__pasExprOnceResult;
  eventStore__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __30__IPFeatureScanner_eventStore__block_invoke_2()
{
  return (id)objc_opt_new();
}

+ (BOOL)isNaturalLanguageEventDetectionEnabled
{
  return 1;
}

+ (void)setEventStoreForTesting:(id)a3
{
  objc_storeStrong((id *)&_sharedEventStore, a3);
}

- (void)scanEventsInMessageUnits:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = (id)objc_opt_new();
  objc_msgSend(v9, "scanEventsInMessageUnits:synchronously:completionHandler:", v8, v5, v7);

}

- (void)resetScanState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[IPFeatureScanner setBodyMessageUnits:](self, "setBodyMessageUnits:", 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner setDetectedEvents:](self, "setDetectedEvents:", v3);

  v4 = MEMORY[0x24BDBD1A8];
  -[IPFeatureScanner setStitchedEvents:](self, "setStitchedEvents:", MEMORY[0x24BDBD1A8]);
  -[IPFeatureScanner setFilteredDetectedEvents:](self, "setFilteredDetectedEvents:", v4);
  -[IPFeatureScanner setResultType:](self, "setResultType:", 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner setBodyAllFeatures:](self, "setBodyAllFeatures:", v5);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner setBodyDataDetectorsFeatures:](self, "setBodyDataDetectorsFeatures:", v6);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner setBodyKeywordFeatures:](self, "setBodyKeywordFeatures:", v7);

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner setExtractedNotesStrings:](self, "setExtractedNotesStrings:", v8);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner setBodySentenceFeatures:](self, "setBodySentenceFeatures:", v9);

}

+ (id)dataDetectorsFeatureExtractor
{
  if (dataDetectorsFeatureExtractor_onceToken != -1)
    dispatch_once(&dataDetectorsFeatureExtractor_onceToken, &__block_literal_global_15);
  return (id)dataDetectorsFeatureExtractor_sExtractor;
}

void __49__IPFeatureScanner_dataDetectorsFeatureExtractor__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[IPFeatureExtractor defaultExtractor](IPDataDetectorsFeatureExtractor, "defaultExtractor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dataDetectorsFeatureExtractor_sExtractor;
  dataDetectorsFeatureExtractor_sExtractor = v0;

}

+ (id)keywordFeatureExtractor
{
  if (keywordFeatureExtractor_onceToken != -1)
    dispatch_once(&keywordFeatureExtractor_onceToken, &__block_literal_global_17);
  return (id)keywordFeatureExtractor_kFeatureExtractor;
}

void __43__IPFeatureScanner_keywordFeatureExtractor__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[IPFeatureExtractor defaultExtractor](IPKeywordFeatureExtractor, "defaultExtractor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keywordFeatureExtractor_kFeatureExtractor;
  keywordFeatureExtractor_kFeatureExtractor = v0;

}

+ (id)sentenceFeatureExtractor
{
  if (sentenceFeatureExtractor_onceToken != -1)
    dispatch_once(&sentenceFeatureExtractor_onceToken, &__block_literal_global_19);
  return (id)sentenceFeatureExtractor_sFeatureExtractor;
}

void __44__IPFeatureScanner_sentenceFeatureExtractor__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[IPFeatureExtractor defaultExtractor](IPSentenceFeatureExtractor, "defaultExtractor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sentenceFeatureExtractor_sFeatureExtractor;
  sentenceFeatureExtractor_sFeatureExtractor = v0;

}

- (id)_sortedFeaturesByRange:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_22);
  return v3;
}

uint64_t __43__IPFeatureScanner__sortedFeaturesByRange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "matchRange");
  v6 = objc_msgSend(v4, "matchRange");

  v7 = -1;
  if (v5 >= v6)
    v7 = 1;
  if (v5 == v6)
    return 0;
  else
    return v7;
}

- (unint64_t)_distanceBetweenFeature:(id)a3 andFeature:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;

  v5 = a4;
  v6 = objc_msgSend(a3, "matchRange");
  v8 = v7;
  v9 = objc_msgSend(v5, "matchRange");
  v11 = v10;

  v12 = v6 - (v11 + v9);
  if (v12 >= v9 - (v6 + v8))
    v12 = v9 - (v6 + v8);
  if (v12 >= 0)
    return v12;
  else
    return -v12;
}

- (id)_sortedFeaturesByDistance:(id)a3 aroundRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  _QWORD v8[6];

  length = a4.length;
  location = a4.location;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__IPFeatureScanner__sortedFeaturesByDistance_aroundRange___block_invoke;
  v8[3] = &__block_descriptor_48_e33_q24__0__IPFeature_8__IPFeature_16l;
  v8[4] = location;
  v8[5] = location + length;
  objc_msgSend(v6, "sortUsingComparator:", v8);
  return v6;
}

uint64_t __58__IPFeatureScanner__sortedFeaturesByDistance_aroundRange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  BOOL v17;
  BOOL v18;
  uint64_t v19;

  v5 = a3;
  v6 = objc_msgSend(a2, "matchRange");
  v8 = v7;
  v9 = objc_msgSend(v5, "matchRange");
  v11 = v10;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = v12 - (v6 + v8);
  if (v14 >= v6 - v13)
    v14 = v6 - v13;
  v15 = v12 - (v9 + v11);
  v16 = v9 - v13;
  if (v15 >= v16)
    v15 = v16;
  v17 = v14 == v15;
  v18 = (uint64_t)v14 < v15;
  v19 = -1;
  if (!v18)
    v19 = 1;
  if (v17)
    return 0;
  else
    return v19;
}

- (id)_featureWithClass:(Class)a3 inFeatures:(id)a4 atIndex:(unint64_t)a5
{
  id v6;
  void *v7;

  v6 = a4;
  if (objc_msgSend(v6, "count") <= a5)
    goto LABEL_4;
  objc_msgSend(v6, "objectAtIndexedSubscript:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v7 = 0;
  }

  return v7;
}

- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 extractors:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSObject *v23;
  dispatch_time_t v24;
  NSObject *v25;
  id v26;
  void *v28;
  void *v29;
  id obj;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD block[4];
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v32 = a4;
  v10 = a5;
  v33 = a6;
  v28 = v9;
  v29 = v10;
  if (v9)
  {
    v11 = v9;
    if ((unint64_t)objc_msgSend(v11, "length") >= 0x2711)
    {
      v12 = v11;
      objc_msgSend(v11, "substringToIndex:", 10000);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    v31 = v11;
    if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v10, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0;
      v53 = &v52;
      v54 = 0x3032000000;
      v55 = __Block_byref_object_copy_;
      v56 = __Block_byref_object_dispose_;
      v57 = 0;
      objc_msgSend(v13, "queue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke;
      block[3] = &unk_24DAA4F68;
      v51 = &v52;
      v47 = v13;
      v48 = v11;
      v49 = v32;
      v50 = v33;
      v15 = v13;
      dispatch_sync(v14, block);

      v16 = (id)v53[5];
      _Block_object_dispose(&v52, 8);

    }
    else
    {
      v17 = dispatch_group_create();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (featuresForTextString_inMessageUnit_extractors_context__onceToken != -1)
        dispatch_once(&featuresForTextString_inMessageUnit_extractors_context__onceToken, &__block_literal_global_23);
      v44 = 0u;
      v45 = 0u;
      v43 = 0u;
      v42 = 0u;
      obj = v10;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v43 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v22, "queue");
            v23 = objc_claimAutoreleasedReturnValue();
            v37[0] = MEMORY[0x24BDAC760];
            v37[1] = 3221225472;
            v37[2] = __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke_3;
            v37[3] = &unk_24DAA4FD8;
            v37[4] = v22;
            v38 = v31;
            v39 = v32;
            v40 = v33;
            v41 = v18;
            dispatch_group_async(v17, v23, v37);

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
        }
        while (v19);
      }

      v24 = dispatch_time(0, 60000000000);
      dispatch_group_wait(v17, v24);
      v52 = 0;
      v53 = &v52;
      v54 = 0x3032000000;
      v55 = __Block_byref_object_copy_;
      v56 = __Block_byref_object_dispose_;
      v57 = 0;
      v25 = featuresForTextString_inMessageUnit_extractors_context__sResponseQueue;
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke_5;
      v34[3] = &unk_24DAA5000;
      v35 = v18;
      v36 = &v52;
      v26 = v18;
      dispatch_sync(v25, v34);
      v16 = (id)v53[5];

      _Block_object_dispose(&v52, 8);
    }

  }
  else
  {
    v16 = (id)MEMORY[0x24BDBD1A8];
  }

  return v16;
}

void __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "featuresForTextString:inMessageUnit:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke_2()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.Ipsos.IPFeatureManager.response", v2);
  v1 = (void *)featuresForTextString_inMessageUnit_extractors_context__sResponseQueue;
  featuresForTextString_inMessageUnit_extractors_context__sResponseQueue = (uint64_t)v0;

}

void __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "featuresForTextString:inMessageUnit:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v2 = featuresForTextString_inMessageUnit_extractors_context__sResponseQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke_4;
    block[3] = &unk_24DAA4FB0;
    v5 = v3;
    v6 = *(id *)(a1 + 64);
    dispatch_sync(v2, block);

  }
}

uint64_t __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke_4(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "addObjectsFromArray:");
  return result;
}

void __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_featureDataInFeatures:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[IPFeatureScanner _featureWithClass:inFeatures:atIndex:](self, "_featureWithClass:inFeatures:atIndex:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_featureSentenceInFeatures:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[IPFeatureScanner _featureWithClass:inFeatures:atIndex:](self, "_featureWithClass:inFeatures:atIndex:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_nearbyFeatureDatas:(id)a3 fromFeatureAtIndex:(unint64_t)a4 messageUnit:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(a5, "originalMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateSent");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[IPFeatureScanner _featureWithClass:inFeatures:atIndex:](self, "_featureWithClass:inFeatures:atIndex:", objc_opt_class(), v8, a4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v36, "matchRange");
  v12 = v11;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v8;
  -[IPFeatureScanner _sortedFeaturesByDistance:aroundRange:](self, "_sortedFeaturesByDistance:aroundRange:", v8, v10, v12);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v38;
    v19 = 0x24DAA4000uLL;
    v20 = 0x24DAA4000uLL;
    do
    {
      v21 = 0;
      v33 = v16;
      do
      {
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(v14);
        v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v21);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((unint64_t)++v17 > 6
            || -[IPFeatureScanner _distanceBetweenFeature:andFeature:](self, "_distanceBetweenFeature:andFeature:", v36, v22) > 0x7D0)
          {
            goto LABEL_21;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && v36 != v22)
          {
            v23 = v22;
            objc_msgSend(v13, "lastObject");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v24, "type") && objc_msgSend(v24, "type") != 1)
              goto LABEL_17;
            v25 = v20;
            v26 = v19;
            v27 = v14;
            v28 = v13;
            objc_msgSend(v24, "value");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v29, "compare:", v34) != -1)
            {

              v13 = v28;
              v14 = v27;
              v19 = v26;
              v20 = v25;
              v16 = v33;
              goto LABEL_17;
            }
            v32 = objc_msgSend(v23, "type");

            v13 = v28;
            v14 = v27;
            v19 = v26;
            v20 = v25;
            v16 = v33;
            if (v32 == 5)
              objc_msgSend(v13, "removeLastObject");
            else
LABEL_17:
              objc_msgSend(v13, "addObject:", v23);

          }
        }
        ++v21;
      }
      while (v16 != v21);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v16);
  }
LABEL_21:

  return v13;
}

- (id)_nearbyFeatureSentences:(id)a3 fromFeatureAtIndex:(unint64_t)a4 messageUnit:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[IPFeatureScanner _featureWithClass:inFeatures:atIndex:](self, "_featureWithClass:inFeatures:atIndex:", objc_opt_class(), v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "matchRange");
  v11 = v10;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v7;
  -[IPFeatureScanner _sortedFeaturesByDistance:aroundRange:](self, "_sortedFeaturesByDistance:aroundRange:", v7, v9, v11);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v23;
LABEL_3:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v17)
        objc_enumerationMutation(v13);
      if (v16 > 5)
        break;
      v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
      if (-[IPFeatureScanner _distanceBetweenFeature:andFeature:](self, "_distanceBetweenFeature:andFeature:", v8, v19) > 0x3E8)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v8 != v19)
      {
        objc_msgSend(v12, "addObject:", v19);
        ++v16;
      }
      if (v15 == ++v18)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v15)
          goto LABEL_3;
        break;
      }
    }
  }

  return v12;
}

- (BOOL)shouldReplaceSendDateWithCurrentDate
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("IPFeatureManagersReplaceSendDateWithCurrentDate"));

  return v3;
}

- (void)augmentDetectedDatesWithEndDates:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v27;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "type");
        if (v10 < 2)
        {
          objc_msgSend(v9, "contextDictionary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("endDate"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v13 = v6;
            v6 = 0;
          }
          else
          {
            v25 = v9;
            v13 = v6;
            v6 = v25;
          }
LABEL_18:

          continue;
        }
        if (v10 == 2)
        {
          v14 = objc_msgSend(v9, "matchRange");
          v15 = objc_msgSend(v6, "matchRange");
          v17 = v14 - (v16 + v15);
          if (v17 < 0)
            v17 = v16 + v15 - v14;
          if ((unint64_t)v17 <= 0x31)
          {
            objc_msgSend(v9, "contextDictionary");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("endDate"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "value");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "timeIntervalSinceReferenceDate");
            v21 = v20;
            objc_msgSend(v19, "timeIntervalSinceReferenceDate");
            v23 = v21 - v22;
            if (v23 >= 1800.0 && v23 < 43200.0)
            {
              objc_msgSend(v6, "contextDictionary");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v13, CFSTR("endDate"));

            }
            goto LABEL_18;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (!v5)
        goto LABEL_23;
    }
  }
  v6 = 0;
LABEL_23:

}

- (unint64_t)featureSentencePolarityForFeatureAtIndex:(unint64_t)a3 inFeatures:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v6 = a4;
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "matchRange");
  v9 = 0;
  while (1)
  {
    -[IPFeatureScanner _featureSentenceInFeatures:atIndex:](self, "_featureSentenceInFeatures:atIndex:", v6, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_msgSend(v7, "matchRange");
      if (v8 >= v11 && v8 - v11 < v12)
        break;
    }

    if ((unint64_t)++v9 >= 5)
    {
      v13 = 0;
      goto LABEL_8;
    }
  }
  v13 = objc_msgSend(v10, "polarity");

LABEL_8:
  return v13;
}

- (BOOL)isDateAroundNoon:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (IPGregorianCalendar_once != -1)
    dispatch_once(&IPGregorianCalendar_once, &__block_literal_global_428);
  objc_msgSend((id)IPGregorianCalendar_calendar, "components:fromDate:", 32, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hour") >= 11 && objc_msgSend(v4, "hour") < 14;

  return v5;
}

- (BOOL)isDateRoundedTo5Minutes:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (IPGregorianCalendar_once != -1)
    dispatch_once(&IPGregorianCalendar_once, &__block_literal_global_428);
  objc_msgSend((id)IPGregorianCalendar_calendar, "components:fromDate:", 192, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "second"))
    v5 = 0;
  else
    v5 = 0xCCCCCCCCCCCCCCCDLL * objc_msgSend(v4, "minute") + 0x1999999999999999 < 0x3333333333333333;

  return v5;
}

- (id)dataFeaturesInTheFutureFromDataFeatures:(id)a3 messageUnitSentDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "dateByAddingTimeInterval:", 600.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!objc_msgSend(v14, "type", (_QWORD)v17) || objc_msgSend(v14, "type") == 1)
        {
          objc_msgSend(v14, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "compare:", v8) != -1)
            objc_msgSend(v7, "addObject:", v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v7;
}

- (unint64_t)countOfFeaturesContainDateInTheFuture:(id)a3 messageUnitSentDate:(id)a4
{
  void *v4;
  unint64_t v5;

  -[IPFeatureScanner dataFeaturesInTheFutureFromDataFeatures:messageUnitSentDate:](self, "dataFeaturesInTheFutureFromDataFeatures:messageUnitSentDate:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (BOOL)dataFeatures:(id)a3 containDateOlderThan:(id)a4 preciseTimeOnly:(BOOL)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  _BOOL4 v24;
  BOOL v25;
  _BOOL4 v28;
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v28 = a5;
  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (!objc_msgSend(v13, "type") || objc_msgSend(v13, "type") == 1)
        {
          objc_msgSend(v13, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "compare:", v7) == -1)
          {
            if (!v28)
              goto LABEL_17;
            objc_msgSend(v13, "contextDictionary");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("timeIsApproximate"));
            v16 = v8;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v17, "BOOLValue");

            objc_msgSend(v13, "contextDictionary");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("allDay"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "BOOLValue");

            objc_msgSend(v13, "contextDictionary");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("dateTimeIsTenseDependent"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "BOOLValue");

            v8 = v16;
            v24 = -[IPFeatureScanner isDateRoundedTo5Minutes:](self, "isDateRoundedTo5Minutes:", v14);
            if ((v20 & 1) == 0 && (v23 & 1) == 0 && (v29 & v24) == 0)
            {
LABEL_17:

              v25 = 1;
              goto LABEL_18;
            }
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v10)
        continue;
      break;
    }
  }
  v25 = 0;
LABEL_18:

  return v25;
}

- (id)subjectEventVocabularyRejectionKeyword:(id)a3
{
  return +[IPFeatureSentence eventVocabularyRejectionKeywordInString:languageID:](IPFeatureSentence, "eventVocabularyRejectionKeywordInString:languageID:", a3, 0);
}

- (id)subjectEventVocabularyIgnoreDateKeyword:(id)a3
{
  return +[IPFeatureSentence eventVocabularyIgnoreDateKeywordInString:languageID:](IPFeatureSentence, "eventVocabularyIgnoreDateKeywordInString:languageID:", a3, 0);
}

- (BOOL)isEventProposalOrConfirmationFromFeatures:(id)a3 fromFeatureAtIndex:(unint64_t)a4 messageUnit:(id)a5 eventIsTenseDependent:(BOOL)a6 extractedFromSubject:(BOOL)a7 extractedPolarity:(unint64_t *)a8 polarityInfluencedByIpsosPlistRef:(BOOL *)a9
{
  _BOOL4 v10;
  _BOOL4 v11;
  id v15;
  id v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  BOOL v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int64_t v47;
  int v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  NSObject *v70;
  _BOOL4 v71;
  NSObject *v72;
  void *v73;
  void *v74;
  const char *v75;
  id v76;
  char v77;
  uint64_t v78;
  void *v79;
  NSObject *v80;
  void *v81;
  NSObject *v82;
  uint64_t v83;
  NSObject *v84;
  NSObject *v85;
  NSObject *v86;
  void *v87;
  int v88;
  int v89;
  void *v90;
  int v91;
  BOOL v92;
  void *v93;
  NSObject *v94;
  id obj;
  int v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  unint64_t *v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  double v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  uint8_t v114[128];
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  void *v118;
  uint64_t v119;

  v10 = a7;
  v11 = a6;
  v119 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a5;
  v17 = v16;
  *a8 = 1;
  if (v10)
  {
    objc_msgSend(v16, "originalMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "type");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20 = IPMessageTypeShortMessage;

    if (v19 == v20)
    {
      v37 = 0;
      goto LABEL_70;
    }
  }
  objc_msgSend(v15, "objectAtIndexedSubscript:", a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "matchRange");
  v24 = v23;
  -[IPFeatureScanner _nearbyFeatureSentences:fromFeatureAtIndex:messageUnit:](self, "_nearbyFeatureSentences:fromFeatureAtIndex:messageUnit:", v15, a4, v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v25, "count"))
  {
    v37 = 0;
    v28 = v25;
    goto LABEL_69;
  }
  v103 = v24;
  v26 = objc_msgSend(v25, "count");
  if (v26 >= 3)
    v27 = 3;
  else
    v27 = v26;
  objc_msgSend(v25, "subarrayWithRange:", 0, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = a8;
  if (IPDebuggingModeEnabled_once != -1)
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v30 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v30 = _IPLogHandle;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = v30;
      objc_msgSend(v21, "matchString");
      v32 = v21;
      v33 = v17;
      v34 = v29;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v116 = v35;
      v117 = 2112;
      v118 = v34;
      _os_log_impl(&dword_219581000, v31, OS_LOG_TYPE_INFO, "Evaluating main feature sentence containing date [%@]: %@ #FeatureManager", buf, 0x16u);

      v29 = v34;
      v17 = v33;
      v21 = v32;

    }
  }
  if (objc_msgSend(v29, "isQuoteAttributionLine"))
  {
    v36 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v36 = _IPLogHandle;
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219581000, v36, OS_LOG_TYPE_INFO, "Skip main feature because it is a QUOTE ATTRIBUTION LINE #FeatureManager", buf, 2u);
    }
    v37 = 0;
    goto LABEL_68;
  }
  objc_msgSend(v29, "eventVocabularyIgnoreDateKeyword");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v39 = _IPLogHandle;
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219581000, v39, OS_LOG_TYPE_INFO, "Skip main feature because it contains IGNORE vocabulary #FeatureManager", buf, 2u);
    }
    if (IPDebuggingModeEnabled_once != -1)
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
    if (IPDebuggingModeEnabled_sEnabled)
    {
      v40 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v40 = _IPLogHandle;
      }
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = v40;
        objc_msgSend(v29, "eventVocabularyIgnoreDateKeyword");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v116 = v42;
        _os_log_impl(&dword_219581000, v41, OS_LOG_TYPE_INFO, "Keyword: [%@] #FeatureManager", buf, 0xCu);

      }
    }
    v37 = 0;
    *a9 = 1;
    goto LABEL_68;
  }
  v98 = v21;
  v100 = v29;
  if (!v11)
    goto LABEL_37;
  objc_msgSend(v29, "matchString");
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = v29;
  v45 = (void *)v43;
  objc_msgSend(v44, "languageID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = +[IPTenseDetector tenseOfString:languageID:](IPTenseDetector, "tenseOfString:languageID:", v45, v46);

  if (!v47)
  {
    v69 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v69 = _IPLogHandle;
    }
    v48 = 1;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219581000, v69, OS_LOG_TYPE_INFO, "Event SEEMS to be in the PAST. Let's check the fragment polarity. #FeatureManager", buf, 2u);
    }
  }
  else
  {
LABEL_37:
    v48 = 0;
  }
  v96 = v48;
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v99 = v28;
  v49 = v28;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v109, v114, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v110 != v52)
          objc_enumerationMutation(v49);
        objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * i), "eventVocabularyRejectionKeyword");
        v54 = objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          v61 = (void *)v54;
          v62 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v62 = _IPLogHandle;
          }
          v21 = v98;
          v28 = v99;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219581000, v62, OS_LOG_TYPE_INFO, "Skip because a REJECTION keyword was found nearby #FeatureManager", buf, 2u);
          }
          if (IPDebuggingModeEnabled_once != -1)
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
          if (IPDebuggingModeEnabled_sEnabled)
          {
            v63 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v63 = _IPLogHandle;
            }
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v116 = v61;
              _os_log_impl(&dword_219581000, v63, OS_LOG_TYPE_INFO, "Keyword: %@ #FeatureManager", buf, 0xCu);
            }
          }
          *a9 = 1;

          v37 = 0;
          v29 = v100;
          goto LABEL_68;
        }
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v109, v114, 16);
    }
    while (v51);
  }

  v108 = 0.0;
  v55 = objc_msgSend(v100, "polarityForRange:confidence:", v22 - objc_msgSend(v100, "matchRange"), v103, &v108);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v108);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v98;
  objc_msgSend(v98, "contextDictionary");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v56, CFSTR("polarityProbability"));

  if (v55 == 4)
  {
    v58 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v58 = _IPLogHandle;
    }
    v29 = v100;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219581000, v58, OS_LOG_TYPE_INFO, "Skip because focused fragment polarity is REJECTION #FeatureManager", buf, 2u);
    }
    v28 = v99;
    if (IPDebuggingModeEnabled_once != -1)
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
    if (IPDebuggingModeEnabled_sEnabled)
    {
      IPSOSLogHandle();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v98, "matchString");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v116 = v60;
        _os_log_impl(&dword_219581000, v59, OS_LOG_TYPE_INFO, "Focused fragment: [%@] #FeatureManager", buf, 0xCu);

      }
      goto LABEL_164;
    }
    goto LABEL_165;
  }
  if (!v10 && v55 == 2)
  {
    IPSOSLogHandle();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219581000, v65, OS_LOG_TYPE_INFO, "Found EVENT because focused fragment polarity is PROPOSAL #FeatureManager", buf, 2u);
    }

    v28 = v99;
    v29 = v100;
    if (IPDebuggingModeEnabled_once != -1)
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
    if (IPDebuggingModeEnabled_sEnabled)
    {
      IPSOSLogHandle();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v98, "matchString");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v116 = v67;
        _os_log_impl(&dword_219581000, v66, OS_LOG_TYPE_INFO, "Focused fragment: [%@] #FeatureManager", buf, 0xCu);

      }
    }
    v68 = 2;
LABEL_97:
    *v102 = v68;
LABEL_98:
    v37 = 1;
    goto LABEL_68;
  }
  IPSOSLogHandle();
  v70 = objc_claimAutoreleasedReturnValue();
  v71 = os_log_type_enabled(v70, OS_LOG_TYPE_INFO);
  if (!v10 && v55 == 3)
  {
    if (v71)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219581000, v70, OS_LOG_TYPE_INFO, "Found EVENT because focused fragment polarity is CONFIRMATION #FeatureManager", buf, 2u);
    }

    v28 = v99;
    v29 = v100;
    if (IPDebuggingModeEnabled_once != -1)
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
    if (IPDebuggingModeEnabled_sEnabled)
    {
      IPSOSLogHandle();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v98, "matchString");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v116 = v73;
        _os_log_impl(&dword_219581000, v72, OS_LOG_TYPE_INFO, "Focused fragment: [%@] #FeatureManager", buf, 0xCu);

      }
    }
    v68 = 3;
    goto LABEL_97;
  }
  if (v10)
  {
    v28 = v99;
    v29 = v100;
    if (v71)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219581000, v70, OS_LOG_TYPE_INFO, "Extracted from SUBJECT #FeatureManager", buf, 2u);
    }
  }
  else
  {
    v29 = v100;
    if (v71)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219581000, v70, OS_LOG_TYPE_INFO, "No CLEAR POLARITY for focused fragment #FeatureManager", buf, 2u);
    }

    v28 = v99;
    if (IPDebuggingModeEnabled_once != -1)
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
    if (!IPDebuggingModeEnabled_sEnabled)
      goto LABEL_110;
    IPSOSLogHandle();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v98, "matchString");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v116 = v74;
      _os_log_impl(&dword_219581000, v70, OS_LOG_TYPE_INFO, "Focused fragment: [%@] #FeatureManager", buf, 0xCu);

    }
  }

LABEL_110:
  if (objc_msgSend(v29, "polarity") == 4)
  {
    IPSOSLogHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v75 = "Skip because main feature polarity is a rejection #FeatureManager";
      goto LABEL_163;
    }
    goto LABEL_164;
  }
  if (v96)
  {
    IPSOSLogHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v75 = "Skip main feature because TENSE is in the PAST and event is tense dependent. #FeatureManager";
      goto LABEL_163;
    }
    goto LABEL_164;
  }
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v76 = v49;
  v101 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
  if (!v101)
  {

    goto LABEL_158;
  }
  obj = v76;
  v77 = 0;
  v97 = *(_QWORD *)v105;
  while (2)
  {
    v78 = 0;
    do
    {
      if (*(_QWORD *)v105 != v97)
        objc_enumerationMutation(obj);
      v79 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v78);
      if (objc_msgSend(v79, "polarity") == 2)
      {
        if (IPDebuggingModeEnabled_once != -1)
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
        if (IPDebuggingModeEnabled_sEnabled)
        {
          IPSOSLogHandle();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v116 = v79;
            _os_log_impl(&dword_219581000, v80, OS_LOG_TYPE_INFO, "Nearby feature: %@ #FeatureManager", buf, 0xCu);
          }

        }
        v81 = v21;
        IPSOSLogHandle();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219581000, v82, OS_LOG_TYPE_INFO, "Found PROPOSAL in nearby feature #FeatureManager", buf, 2u);
        }
        v83 = 2;
      }
      else
      {
        if (objc_msgSend(v79, "polarity") != 3)
          goto LABEL_142;
        if (IPDebuggingModeEnabled_once != -1)
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
        if (IPDebuggingModeEnabled_sEnabled)
        {
          IPSOSLogHandle();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v116 = v79;
            _os_log_impl(&dword_219581000, v84, OS_LOG_TYPE_INFO, "Nearby feature: %@ #FeatureManager", buf, 0xCu);
          }

        }
        v81 = v21;
        IPSOSLogHandle();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219581000, v82, OS_LOG_TYPE_INFO, "Found CONFIRMATION in nearby feature #FeatureManager", buf, 2u);
        }
        v83 = 3;
      }

      *v102 = v83;
      v77 = 1;
      v21 = v81;
      v28 = v99;
      v29 = v100;
LABEL_142:
      if (objc_msgSend(v79, "polarity") == 4)
      {
        if (IPDebuggingModeEnabled_once != -1)
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
        if (IPDebuggingModeEnabled_sEnabled)
        {
          IPSOSLogHandle();
          v85 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v116 = v79;
            _os_log_impl(&dword_219581000, v85, OS_LOG_TYPE_INFO, "Nearby feature: %@ #FeatureManager", buf, 0xCu);
          }

        }
        IPSOSLogHandle();
        v86 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219581000, v86, OS_LOG_TYPE_INFO, "Found REJECTION in nearby feature #FeatureManager", buf, 2u);
        }

        IPSOSLogHandle();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v75 = "Skip feature because rejection found nearby #FeatureManager";
          goto LABEL_163;
        }
        goto LABEL_164;
      }
      ++v78;
    }
    while (v101 != v78);
    v101 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
    if (v101)
      continue;
    break;
  }

  if ((v77 & 1) != 0)
    goto LABEL_98;
LABEL_158:
  if (!v10)
  {
    objc_msgSend(v29, "matchRange");
    v87 = v21;
    v89 = v88 - v103;
    objc_msgSend(v29, "matchString");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "localizedCaseInsensitiveContainsString:", CFSTR(": "));

    v92 = v89 < 10;
    v21 = v87;
    v28 = v99;
    if (v92 || v91)
    {
      objc_msgSend(v21, "contextDictionary");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setObject:forKeyedSubscript:", &unk_24DADF470, CFSTR("polarityProbability"));

      IPSOSLogHandle();
      v94 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219581000, v94, OS_LOG_TYPE_INFO, "Sentence containing DATE is very short. Detecting as a proposal. #FeatureManager", buf, 2u);
      }

      goto LABEL_98;
    }
  }
  IPSOSLogHandle();
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v75 = "Skip feature because no acceptation or proposal found nearby #FeatureManager";
LABEL_163:
    _os_log_impl(&dword_219581000, v59, OS_LOG_TYPE_INFO, v75, buf, 2u);
  }
LABEL_164:

LABEL_165:
  v37 = 0;
LABEL_68:

LABEL_69:
LABEL_70:

  return v37;
}

- (id)_stitchedEventsFromEvents:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  int v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  int v30;
  void *v31;
  void *v32;
  double v33;
  _BOOL4 v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id obj;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v64 = (id)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v3;
  v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  if (v65)
  {
    v63 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v65; ++i)
      {
        if (*(_QWORD *)v77 != v63)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v6 = v64;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
        v70 = v5;
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v73;
          v66 = i;
          v67 = *(_QWORD *)v73;
          v68 = v6;
          while (2)
          {
            v10 = 0;
            v69 = v8;
            do
            {
              if (*(_QWORD *)v73 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v10);
              if (objc_msgSend(v11, "isAllDay") && objc_msgSend(v5, "isAllDay"))
              {
                objc_msgSend(v11, "startDate");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "startDate");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "timeIntervalSinceDate:", v13);
                v15 = v14 == 0.0;

              }
              else
              {
                v15 = 0;
              }
              if ((objc_msgSend(v11, "isAllDay") & 1) == 0 && (objc_msgSend(v5, "isAllDay") & 1) == 0)
              {
                objc_msgSend(v11, "startDate");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "endDate");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "timeIntervalSinceDate:", v17);
                if (fabs(v18) <= 3600.0)
                  goto LABEL_33;
                objc_msgSend(v11, "endDate");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "startDate");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "timeIntervalSinceDate:", v20);
                if (fabs(v21) <= 3600.0)
                  goto LABEL_32;
                v71 = v16;
                objc_msgSend(v11, "startDate");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "startDate");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "timeIntervalSinceDate:", v23);
                if (fabs(v24) <= 3600.0)
                {

                  v16 = v71;
LABEL_32:

                  v6 = v68;
LABEL_33:

LABEL_34:
                  v35 = v11;

                  i = v66;
                  if (!v35)
                    goto LABEL_41;
                  if (objc_msgSend(v35, "isAllDay"))
                  {
LABEL_36:
                    objc_msgSend(v35, "location");
                    v36 = objc_claimAutoreleasedReturnValue();
                    if (v36)
                    {
                      v37 = (void *)v36;
                      objc_msgSend(v70, "location");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v38)
                      {
                        objc_msgSend(v35, "location");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v70, "setLocation:", v39);

                      }
                    }
                    if (objc_msgSend(v70, "ipsos_isDateTimeTenseDependent"))
                      v40 = objc_msgSend(v35, "ipsos_isDateTimeTenseDependent");
                    else
                      v40 = 0;
                    objc_msgSend(v70, "setIpsos_isDateTimeTenseDependent:", v40);
                    objc_msgSend(v6, "removeObject:", v35);
                    objc_msgSend(v70, "ipsos_dataFeatures");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "ipsos_dataFeatures");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v55, "arrayByAddingObjectsFromArray:", v56);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "setIpsos_dataFeatures:", v57);

                    objc_msgSend(v6, "addObject:", v70);
                    goto LABEL_65;
                  }
                  if ((objc_msgSend(v35, "isAllDay") & 1) == 0 && (objc_msgSend(v70, "isAllDay") & 1) != 0
                    || (objc_msgSend(v35, "ipsos_isTimeApproximate") & 1) == 0
                    && (objc_msgSend(v70, "ipsos_isTimeApproximate") & 1) != 0)
                  {
                    goto LABEL_65;
                  }
                  if (objc_msgSend(v35, "ipsos_isTimeApproximate")
                    && (objc_msgSend(v70, "ipsos_isTimeApproximate") & 1) == 0)
                  {
                    goto LABEL_36;
                  }
                  objc_msgSend(v35, "startDate");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "startDate");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "timeIntervalSinceDate:", v42);
                  v44 = v43;

                  if (v44 > 0.0)
                  {
                    objc_msgSend(v70, "startDate");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "setStartDate:", v45);

                  }
                  v46 = objc_msgSend(v70, "ipsos_isEndTimeApproximate");
                  if (v46 == objc_msgSend(v35, "ipsos_isEndTimeApproximate"))
                  {
                    objc_msgSend(v35, "endDate");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "endDate");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "timeIntervalSinceDate:", v48);
                    v50 = v49;

                    if (v50 < 0.0)
                      goto LABEL_54;
                  }
                  if (!objc_msgSend(v70, "ipsos_isEndTimeApproximate")
                    || objc_msgSend(v35, "ipsos_isEndTimeApproximate"))
                  {
LABEL_54:
                    objc_msgSend(v70, "endDate");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "setEndDate:", v51);

                    objc_msgSend(v35, "setIpsos_isEndTimeApproximate:", objc_msgSend(v70, "ipsos_isEndTimeApproximate"));
                  }
                  objc_msgSend(v35, "location");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v52)
                  {
LABEL_58:

                  }
                  else
                  {
                    objc_msgSend(v70, "location");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v53)
                    {
                      objc_msgSend(v70, "location");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "setLocation:", v52);
                      goto LABEL_58;
                    }
                  }
                  if (objc_msgSend(v70, "ipsos_isDateTimeTenseDependent"))
                    v54 = objc_msgSend(v35, "ipsos_isDateTimeTenseDependent");
                  else
                    v54 = 0;
                  objc_msgSend(v35, "setIpsos_isDateTimeTenseDependent:", v54);
                  objc_msgSend(v35, "ipsos_dataFeatures");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "ipsos_dataFeatures");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "arrayByAddingObjectsFromArray:", v59);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "setIpsos_dataFeatures:", v60);

                  goto LABEL_65;
                }
                v25 = objc_msgSend(v11, "ipsos_isTimeApproximate");
                if (v25 == objc_msgSend(v5, "ipsos_isTimeApproximate"))
                {

                  v9 = v67;
                  v6 = v68;
                  v8 = v69;
                }
                else
                {
                  objc_msgSend(v11, "startDate");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "startDate");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "timeIntervalSinceDate:", v27);
                  v29 = fabs(v28);

                  v5 = v70;
                  v9 = v67;
                  v6 = v68;
                  v8 = v69;
                  if (v29 <= 18000.0)
                    goto LABEL_34;
                }
              }
              v30 = objc_msgSend(v11, "isAllDay");
              if (v30 == objc_msgSend(v5, "isAllDay"))
              {
                v34 = 0;
              }
              else
              {
                objc_msgSend(v11, "startDate");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "startDate");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "timeIntervalSinceDate:", v32);
                v34 = fabs(v33) < 86399.0;

              }
              if (v15 || v34)
                goto LABEL_34;
              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
            i = v66;
            if (v8)
              continue;
            break;
          }
        }

LABEL_41:
        objc_msgSend(v6, "addObject:", v70);
        v35 = 0;
LABEL_65:

      }
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    }
    while (v65);
  }

  return v64;
}

- (id)_regroupEventsWithSpreadTimeAsAllDayEvents:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    if (_regroupEventsWithSpreadTimeAsAllDayEvents__onceToken != -1)
      dispatch_once(&_regroupEventsWithSpreadTimeAsAllDayEvents__onceToken, &__block_literal_global_36);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v24 = v3;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v12 = (void *)_regroupEventsWithSpreadTimeAsAllDayEvents__sDateFormatter;
          objc_msgSend(v11, "startDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringFromDate:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v14);
          }
          if (objc_msgSend(v11, "isAllDay"))
            objc_msgSend(v15, "insertObject:atIndex:", v11, 0);
          else
            objc_msgSend(v15, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v8);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = v5;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (!v17)
    {
LABEL_29:

      v3 = v24;
      goto LABEL_30;
    }
    v18 = v17;
    v19 = *(_QWORD *)v26;
LABEL_19:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v19)
        objc_enumerationMutation(v16);
      objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count") == 1)
        break;
      if ((unint64_t)objc_msgSend(v21, "count") >= 2)
      {
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setAllDay:", 1);
        objc_msgSend(v22, "setIpsos_disableTimeAdjustment:", 1);
        goto LABEL_26;
      }
LABEL_27:

      if (v18 == ++v20)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (!v18)
          goto LABEL_29;
        goto LABEL_19;
      }
    }
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
    objc_msgSend(v4, "addObject:", v22);

    goto LABEL_27;
  }
  v4 = v3;
LABEL_30:

  return v4;
}

uint64_t __63__IPFeatureScanner__regroupEventsWithSpreadTimeAsAllDayEvents___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_regroupEventsWithSpreadTimeAsAllDayEvents__sDateFormatter;
  _regroupEventsWithSpreadTimeAsAllDayEvents__sDateFormatter = (uint64_t)v0;

  objc_msgSend((id)_regroupEventsWithSpreadTimeAsAllDayEvents__sDateFormatter, "setTimeStyle:", 0);
  return objc_msgSend((id)_regroupEventsWithSpreadTimeAsAllDayEvents__sDateFormatter, "setDateStyle:", 1);
}

- (void)adjustTimeForEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "ipsos_timeNeedsMeridianGuess"))
  {
    objc_msgSend(v3, "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ipsos_eventClassificationType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "preferedMeridian");
    if (!v6)
    {
LABEL_30:

      goto LABEL_31;
    }
    v7 = v6;
    if (IPGregorianCalendar_once != -1)
      dispatch_once(&IPGregorianCalendar_once, &__block_literal_global_428);
    v8 = (id)IPGregorianCalendar_calendar;
    objc_msgSend(v8, "components:fromDate:", 32, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hour");
    v11 = 12 - v10;
    if (12 - v10 < 0)
      v11 = v10 - 12;
    if (v11 >= 2)
    {
      if (v7 == 2 && v10 <= 11)
      {
        if (IPDebuggingModeEnabled_once != -1)
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
        if (IPDebuggingModeEnabled_sEnabled)
        {
          v12 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v12 = _IPLogHandle;
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v13 = v12;
            objc_msgSend(v3, "valueForKey:", CFSTR("ipsos_betterDescription"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = 138412290;
            v22 = v14;
            _os_log_impl(&dword_219581000, v13, OS_LOG_TYPE_INFO, "Adjusting time as PM for event: %@ #FeatureManager", (uint8_t *)&v21, 0xCu);

          }
        }
        objc_msgSend(v3, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dateByAddingTimeInterval:", 43200.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setStartDate:", v16);

        objc_msgSend(v3, "endDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          goto LABEL_29;
        objc_msgSend(v3, "endDate");
        v18 = objc_claimAutoreleasedReturnValue();
        -[NSObject dateByAddingTimeInterval:](v18, "dateByAddingTimeInterval:", 43200.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setEndDate:", v19);
      }
      else
      {
        if (v7 != 1 || v10 < 12)
          goto LABEL_29;
        if (IPDebuggingModeEnabled_once != -1)
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
        if (!IPDebuggingModeEnabled_sEnabled)
          goto LABEL_29;
        v20 = _IPLogHandle;
        if (!_IPLogHandle)
        {
          IPInitLogging();
          v20 = _IPLogHandle;
        }
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          goto LABEL_29;
        v18 = v20;
        objc_msgSend(v3, "valueForKey:", CFSTR("ipsos_betterDescription"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v19;
        _os_log_impl(&dword_219581000, v18, OS_LOG_TYPE_INFO, "Adjusting time as AM for event: %@ #FeatureManager", (uint8_t *)&v21, 0xCu);
      }

    }
LABEL_29:

    goto LABEL_30;
  }
LABEL_31:

}

- (id)notesStringsFromDataFeatures:(id)a3
{
  return -[IPFeatureScanner stringsFromDataFeatures:matchingTypes:](self, "stringsFromDataFeatures:matchingTypes:", a3, &unk_24DB08FE8);
}

- (id)movieTitlesFromDataFeatures:(id)a3
{
  return -[IPFeatureScanner stringsFromDataFeatures:matchingTypes:](self, "stringsFromDataFeatures:matchingTypes:", a3, &unk_24DB09000);
}

- (id)sportTeamNamesFromDataFeatures:(id)a3
{
  return -[IPFeatureScanner stringsFromDataFeatures:matchingTypes:](self, "stringsFromDataFeatures:matchingTypes:", a3, &unk_24DB09018);
}

- (id)artisNamesFromDataFeatures:(id)a3
{
  return -[IPFeatureScanner stringsFromDataFeatures:matchingTypes:](self, "stringsFromDataFeatures:matchingTypes:", a3, &unk_24DB09030);
}

- (id)restaurantAndBarPOINamesFromDataFeatures:(id)a3
{
  return -[IPFeatureScanner stringsFromDataFeatures:matchingTypes:](self, "stringsFromDataFeatures:matchingTypes:", a3, &unk_24DB09048);
}

- (id)entertainmentPOINamesFromDataFeatures:(id)a3
{
  return -[IPFeatureScanner stringsFromDataFeatures:matchingTypes:](self, "stringsFromDataFeatures:matchingTypes:", a3, &unk_24DB09060);
}

- (id)filteredEventsForDetectedEvents:(id)a3 referenceDate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  double v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  IPFeatureScanner *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  double v73;
  double v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  double v80;
  double v81;
  void *v82;
  int v83;
  double v84;
  NSObject *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  NSObject *v91;
  NSObject *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t i;
  void *v104;
  void *v105;
  id v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t j;
  id v113;
  void *v114;
  IPFeatureScanner *v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
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
  _BYTE v131[128];
  uint8_t v132[128];
  uint8_t buf[4];
  void *v134;
  __int16 v135;
  void *v136;
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v116 = a4;
  if (!objc_msgSend(v6, "count"))
  {
    v106 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_199;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v113 = v6;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
  if (!v8)
    goto LABEL_173;
  v9 = v8;
  v10 = 0x24BDBC000uLL;
  v118 = *(_QWORD *)v128;
  v115 = self;
  do
  {
    v11 = 0;
    v117 = v9;
    do
    {
      if (*(_QWORD *)v128 != v118)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * v11);
      objc_msgSend(*(id *)(v10 + 3920), "standardUserDefaults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("IPFeatureManagersSkipConfidenceFiltering"));

      if ((v14 & 1) == 0)
      {
        objc_msgSend(v12, "ipsos_confidence");
        if (v15 < 0.45)
        {
          v16 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v16 = _IPLogHandle;
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = v16;
            objc_msgSend(v12, "ipsos_confidence");
            *(_DWORD *)buf = 134217984;
            v134 = v18;
            _os_log_impl(&dword_219581000, v17, OS_LOG_TYPE_INFO, "Skipped event because it's confidence score is too low (confidence: %0.4f) #FeatureManager", buf, 0xCu);

          }
          if (IPDebuggingModeEnabled_once != -1)
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
          if (IPDebuggingModeEnabled_sEnabled)
          {
            v19 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v19 = _IPLogHandle;
            }
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              v20 = v19;
              objc_msgSend(v12, "startDate");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v134 = v21;
              _os_log_impl(&dword_219581000, v20, OS_LOG_TYPE_INFO, "Filtered event (Start date: %@) #FeatureManager", buf, 0xCu);

            }
          }
          v22 = self;
          v23 = -80;
          goto LABEL_170;
        }
      }
      objc_msgSend(v12, "ipsos_eventClassificationType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        v38 = _IPLogHandle;
        if (!_IPLogHandle)
        {
          IPInitLogging();
          v38 = _IPLogHandle;
        }
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219581000, v38, OS_LOG_TYPE_INFO, "Skipped event because it doesn't has any clear classification type #FeatureManager", buf, 2u);
        }
        if (IPDebuggingModeEnabled_once != -1)
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
        if (IPDebuggingModeEnabled_sEnabled)
        {
          v39 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v39 = _IPLogHandle;
          }
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
LABEL_59:
            v41 = v39;
            objc_msgSend(v12, "startDate");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v134 = v42;
            _os_log_impl(&dword_219581000, v41, OS_LOG_TYPE_INFO, "Filtered event (Start date: %@) #FeatureManager", buf, 0xCu);

          }
        }
LABEL_60:
        v22 = self;
        v23 = -65;
        goto LABEL_170;
      }
      if (objc_msgSend(v12, "isAllDay"))
      {
        objc_msgSend(v12, "ipsos_eventClassificationType");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          v40 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v40 = _IPLogHandle;
          }
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219581000, v40, OS_LOG_TYPE_INFO, "Skipped event because it doesn't has any clear classification type and is all day #FeatureManager", buf, 2u);
          }
          if (IPDebuggingModeEnabled_once != -1)
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
          if (IPDebuggingModeEnabled_sEnabled)
          {
            v39 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v39 = _IPLogHandle;
            }
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              goto LABEL_59;
          }
          goto LABEL_60;
        }
      }
      if (objc_msgSend(v12, "isAllDay"))
      {
        if ((objc_msgSend(v12, "ipsos_allDayPreferred") & 1) == 0)
        {
          objc_msgSend(v12, "ipsos_eventClassificationType");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isAllDayAllowed");

          if ((v27 & 1) == 0)
          {
            v48 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v48 = _IPLogHandle;
            }
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219581000, v48, OS_LOG_TYPE_INFO, "Skipped event because it is all day #FeatureManager", buf, 2u);
            }
            if (IPDebuggingModeEnabled_once != -1)
              dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
            if (IPDebuggingModeEnabled_sEnabled)
            {
              v49 = _IPLogHandle;
              if (!_IPLogHandle)
              {
                IPInitLogging();
                v49 = _IPLogHandle;
              }
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                v50 = v49;
                objc_msgSend(v12, "startDate");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v134 = v51;
                _os_log_impl(&dword_219581000, v50, OS_LOG_TYPE_INFO, "Filtered event (Start date: %@) #FeatureManager", buf, 0xCu);

              }
            }
            goto LABEL_168;
          }
        }
      }
      if ((objc_msgSend(v12, "isAllDay") & 1) == 0)
      {
        objc_msgSend(v12, "startDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[IPFeatureScanner isDateRoundedTo5Minutes:](self, "isDateRoundedTo5Minutes:", v28))
        {

LABEL_62:
          v43 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v43 = _IPLogHandle;
          }
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219581000, v43, OS_LOG_TYPE_INFO, "Skipped event because time is not rounded #FeatureManager", buf, 2u);
          }
          v10 = 0x24BDBC000;
          if (IPDebuggingModeEnabled_once != -1)
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
          if (IPDebuggingModeEnabled_sEnabled)
          {
            v44 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v44 = _IPLogHandle;
            }
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              v45 = v44;
              objc_msgSend(v12, "startDate");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "endDate");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v134 = v46;
              v135 = 2112;
              v136 = v47;
              _os_log_impl(&dword_219581000, v45, OS_LOG_TYPE_INFO, "Filtered event (Start date: %@, End date: %@) #FeatureManager", buf, 0x16u);

            }
          }
          v22 = self;
          v23 = -67;
          goto LABEL_170;
        }
        objc_msgSend(v12, "endDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[IPFeatureScanner isDateRoundedTo5Minutes:](self, "isDateRoundedTo5Minutes:", v29);

        if (!v30)
          goto LABEL_62;
      }
      if (objc_msgSend(v12, "isAllDay"))
      {
        objc_msgSend(v12, "title");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "length");

        if (!v32)
        {
          v58 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v58 = _IPLogHandle;
          }
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219581000, v58, OS_LOG_TYPE_INFO, "Skipped event because all-day event has no title #FeatureManager", buf, 2u);
          }
          v10 = 0x24BDBC000;
          if (IPDebuggingModeEnabled_once != -1)
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
          if (IPDebuggingModeEnabled_sEnabled)
          {
            v59 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v59 = _IPLogHandle;
            }
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              v60 = v59;
              objc_msgSend(v12, "startDate");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "endDate");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v134 = v61;
              v135 = 2112;
              v136 = v62;
              _os_log_impl(&dword_219581000, v60, OS_LOG_TYPE_INFO, "Filtered event (Start date: %@, End date: %@) #FeatureManager", buf, 0x16u);

            }
          }
          v22 = self;
          v23 = -70;
          goto LABEL_170;
        }
      }
      if ((objc_msgSend(v12, "isAllDay") & 1) == 0)
      {
        objc_msgSend(v12, "ipsos_eventClassificationType");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "startDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v33, "isDateWithinRange:", v34);

        if ((v35 & 1) == 0)
        {
          v52 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v52 = _IPLogHandle;
          }
          v10 = 0x24BDBC000;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219581000, v52, OS_LOG_TYPE_INFO, "Skipped event because it's not within an acceptable time range #FeatureManager", buf, 2u);
          }
          if (IPDebuggingModeEnabled_once != -1)
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
          if (IPDebuggingModeEnabled_sEnabled)
          {
            v53 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v53 = _IPLogHandle;
            }
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              v54 = v53;
              objc_msgSend(v12, "ipsos_eventClassificationType");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "identifier");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "startDate");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v134 = v56;
              v135 = 2112;
              v136 = v57;
              _os_log_impl(&dword_219581000, v54, OS_LOG_TYPE_INFO, "Filtered event (Type: %@, Start date: %@) #FeatureManager", buf, 0x16u);

              v10 = 0x24BDBC000;
            }
          }
          v22 = self;
          v23 = -69;
          goto LABEL_170;
        }
      }
      objc_msgSend(v12, "ipsos_eventClassificationType");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v36, "isFairlyGeneric"))
        goto LABEL_110;
      objc_msgSend(v12, "ipsos_eventClassificationType");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v37, "isAppointment") & 1) == 0)
      {

LABEL_110:
        goto LABEL_111;
      }
      if (objc_msgSend(v12, "isAllDay"))
      {

LABEL_156:
        v91 = _IPLogHandle;
        if (!_IPLogHandle)
        {
          IPInitLogging();
          v91 = _IPLogHandle;
        }
        v10 = 0x24BDBC000;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219581000, v91, OS_LOG_TYPE_INFO, "Skipped event because it's an appointment with a vague / all day date #FeatureManager", buf, 2u);
        }
        if (IPDebuggingModeEnabled_once != -1)
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
        if (IPDebuggingModeEnabled_sEnabled)
        {
          v92 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v92 = _IPLogHandle;
          }
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            v93 = v92;
            objc_msgSend(v12, "ipsos_eventClassificationType");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "identifier");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "startDate");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v134 = v95;
            v135 = 2112;
            v136 = v96;
            _os_log_impl(&dword_219581000, v93, OS_LOG_TYPE_INFO, "Filtered event (Type: %@, Start date: %@) #FeatureManager", buf, 0x16u);

            v10 = 0x24BDBC000;
          }
        }
        if (objc_msgSend(v12, "isAllDay"))
        {
LABEL_168:
          v22 = self;
          v23 = -66;
        }
        else
        {
LABEL_169:
          v22 = self;
          v23 = -60;
        }
LABEL_170:
        -[IPFeatureScanner setResultType:](v22, "setResultType:", v23);
        goto LABEL_171;
      }
      v90 = objc_msgSend(v12, "ipsos_isTimeApproximate");

      if (v90)
        goto LABEL_156;
LABEL_111:
      objc_msgSend(v12, "ipsos_eventClassificationType");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v63, "isFairlyGeneric"))
      {
        v64 = objc_msgSend(v12, "isAllDay");

        v10 = 0x24BDBC000;
        if (v64)
        {
          v65 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v65 = _IPLogHandle;
          }
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219581000, v65, OS_LOG_TYPE_INFO, "Skipped all-day event with a fairy generic event type #FeatureManager", buf, 2u);
          }
          if (IPDebuggingModeEnabled_once != -1)
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
          if (IPDebuggingModeEnabled_sEnabled)
          {
            v66 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v66 = _IPLogHandle;
            }
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              v67 = v66;
              objc_msgSend(v12, "ipsos_eventClassificationType");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "identifier");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "startDate");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v134 = v69;
              v135 = 2112;
              v136 = v70;
              _os_log_impl(&dword_219581000, v67, OS_LOG_TYPE_INFO, "Filtered event (Type: %@, Start date: %@) #FeatureManager", buf, 0x16u);

              v10 = 0x24BDBC000;
            }
          }
          goto LABEL_168;
        }
      }
      else
      {

      }
      v71 = v7;
      objc_msgSend(v12, "startDate");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "timeIntervalSinceDate:", v116);
      v74 = v73;

      v75 = objc_msgSend(v12, "ipsos_isTimeOffset");
      v76 = objc_msgSend(v12, "ipsos_isEventTimeOnlyAndReferrengingToSentDate");
      v77 = 0;
      if (objc_msgSend(v12, "isAllDay") && v74 < 86400.0)
        v77 = objc_msgSend(v12, "ipsos_allDayPreferred") ^ 1;
      v78 = 0;
      if ((objc_msgSend(v12, "isAllDay") & 1) == 0 && v74 < 21600.0)
        v78 = objc_msgSend(v12, "ipsos_isTimeApproximate");
      v79 = 0;
      if ((objc_msgSend(v12, "isAllDay") & 1) == 0 && v74 < 43200.0)
        v79 = objc_msgSend(v12, "ipsos_isTimeApproximate");
      objc_msgSend(v12, "ipsos_duration");
      v81 = v80;
      objc_msgSend(v12, "ipsos_eventClassificationType");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v82, "isMealRelated");

      if (((v76 & (v75 ^ 1) | v77 | v78) & 1) != 0 || (v79 & (v83 ^ 1) & 1) != 0 || v74 > 31536000.0 || v81 > 172800.0)
      {
        v7 = v71;
        v9 = v117;
        if (IPDebuggingModeEnabled_once != -1)
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
        self = v115;
        v10 = 0x24BDBC000;
        if (IPDebuggingModeEnabled_sEnabled)
        {
          v85 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v85 = _IPLogHandle;
          }
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            v86 = v85;
            objc_msgSend(v12, "ipsos_eventClassificationType");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "identifier");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "startDate");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v134 = v88;
            v135 = 2112;
            v136 = v89;
            _os_log_impl(&dword_219581000, v86, OS_LOG_TYPE_INFO, "Filtered event (Type: %@, Start date: %@) #FeatureManager", buf, 0x16u);

          }
        }
        goto LABEL_169;
      }
      v7 = v71;
      v9 = v117;
      if (v74 < 86400.0)
        objc_msgSend(v12, "setIpsos_eventAttributes:", objc_msgSend(v12, "ipsos_eventAttributes") | 0x10);
      self = v115;
      v10 = 0x24BDBC000;
      if (objc_msgSend(v12, "ipsos_eventStatus") == 2)
        objc_msgSend(v12, "setIpsos_eventAttributes:", objc_msgSend(v12, "ipsos_eventAttributes") | 0x20);
      if ((objc_msgSend(v12, "ipsos_usesDefaultClassificationTypeStartTime") & 1) != 0
        || objc_msgSend(v12, "ipsos_isTimeApproximate"))
      {
        objc_msgSend(v12, "setIpsos_eventAttributes:", objc_msgSend(v12, "ipsos_eventAttributes") | 0x80);
      }
      objc_msgSend(v12, "ipsos_confidence");
      if (v84 > 0.95)
        objc_msgSend(v12, "setIpsos_eventAttributes:", objc_msgSend(v12, "ipsos_eventAttributes") | 0x200);
      objc_msgSend(v114, "addObject:", v12);
LABEL_171:
      ++v11;
    }
    while (v9 != v11);
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
  }
  while (v9);
LABEL_173:

  v97 = v114;
  if ((unint64_t)objc_msgSend(v114, "count") < 2)
  {
    v106 = v114;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v114, "count"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v99 = v114;
    v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
    if (v100)
    {
      v101 = v100;
      v102 = *(_QWORD *)v124;
      do
      {
        for (i = 0; i != v101; ++i)
        {
          if (*(_QWORD *)v124 != v102)
            objc_enumerationMutation(v99);
          v104 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
          if ((objc_msgSend(v104, "isAllDay") & 1) == 0)
            objc_msgSend(v98, "addObject:", v104);
        }
        v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
      }
      while (v101);
    }

    if (objc_msgSend(v98, "count"))
      v105 = v98;
    else
      v105 = v99;
    v106 = v105;

    v97 = v114;
  }
  if ((unint64_t)objc_msgSend(v106, "count") >= 2)
  {
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v107 = v106;
    v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
    if (v108)
    {
      v109 = v108;
      v110 = *(_QWORD *)v120;
      do
      {
        for (j = 0; j != v109; ++j)
        {
          if (*(_QWORD *)v120 != v110)
            objc_enumerationMutation(v107);
          objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * j), "setIpsos_eventAttributes:", objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * j), "ipsos_eventAttributes") | 0x40);
        }
        v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
      }
      while (v109);
    }

    v97 = v114;
  }

  v6 = v113;
LABEL_199:

  return v106;
}

- (id)normalizedAllDayDateFromDate:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = IPGregorianCalendar_once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&IPGregorianCalendar_once, &__block_literal_global_428);
  v5 = (id)IPGregorianCalendar_calendar;
  objc_msgSend(v5, "components:fromDate:", 254, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v7, "setHour:", 0);
  objc_msgSend(v7, "setMinute:", 0);
  objc_msgSend(v7, "setSecond:", 0);
  objc_msgSend(v7, "setTimeZone:", 0);
  objc_msgSend(v5, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)normalizedEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "isAllDay"))
        {
          objc_msgSend(v9, "startDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[IPFeatureScanner normalizedAllDayDateFromDate:](self, "normalizedAllDayDateFromDate:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setStartDate:", v11);

          objc_msgSend(v9, "endDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[IPFeatureScanner normalizedAllDayDateFromDate:](self, "normalizedAllDayDateFromDate:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setEndDate:", v13);

          objc_msgSend(v9, "setTimeZone:", 0);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (id)bestEventsFromEvents:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
    v4 = (id)objc_claimAutoreleasedReturnValue();
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
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v10, "ipsos_confidence", (_QWORD)v13);
          if (v11 > 0.7)
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (id)stringsFromDataFeatures:(id)a3 matchingTypes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "type", (_QWORD)v18));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v6, "containsObject:", v14);

        if (v15)
        {
          objc_msgSend(v13, "matchString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v7, "addObject:", v16);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)cleanedStringForFeatureData:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = IPLocalizedString_once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&IPLocalizedString_once, &__block_literal_global_433);
  objc_msgSend((id)IPLocalizedString_bundle, "localizedStringForKey:value:table:", CFSTR(", "), &stru_24DAA6418, CFSTR("DataDetectorsNaturalLanguage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v7, CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(", \n"), CFSTR("\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR(",\n"), CFSTR("\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n\n"), CFSTR("\n"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)descriptionForScanResultType:(int64_t)a3
{
  id result;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  BOOL v7;
  const __CFString *v8;

  result = CFSTR("IPFeatureScanResultTypeEventNotFound");
  if (a3 > -51)
  {
    if (a3 > -21)
    {
      switch(a3)
      {
        case -13:
          result = CFSTR("IPFeatureScanResultTypeNoSentencePolarityExtractedOrAssetMissing");
          break;
        case -12:
          result = CFSTR("IPFeatureScanResultTypeContainsTooManyDatesInTheFuture");
          break;
        case -11:
          result = CFSTR("IPFeatureScanResultTypeContainsDateInTheFarPast");
          break;
        case -10:
          result = CFSTR("IPFeatureScanResultTypeNoDateInTheFuture");
          break;
        case -9:
        case -8:
        case -7:
        case -6:
        case -5:
        case -4:
        case -3:
        case -2:
        case 0:
          return result;
        case -1:
          result = CFSTR("IPFeatureScanResultTypeDisabled");
          break;
        case 1:
          result = CFSTR("IPFeatureScanResultTypeEventFound");
          break;
        case 2:
          result = CFSTR("IPFeatureScanResultTypeMultipleEventsFound");
          break;
        default:
          if (a3 == -20)
            result = CFSTR("IPFeatureScanResultTypeNoPolarityProposalOrAcceptation");
          break;
      }
      return result;
    }
    v4 = CFSTR("IPFeatureScanResultTypeSubjectContainsRejection");
    v5 = CFSTR("IPFeatureScanResultTypeBlacklistedSender");
    v6 = CFSTR("IPFeatureScanResultTypeIgnoreOrRejectionKeywordFound");
    if (a3 != -21)
      v6 = CFSTR("IPFeatureScanResultTypeEventNotFound");
    if (a3 != -40)
      v5 = v6;
    v7 = a3 == -50;
LABEL_18:
    if (v7)
      return (id)v4;
    else
      return (id)v5;
  }
  if (a3 <= -71)
  {
    v4 = CFSTR("IPFeatureScanResultTypeContainsDateInThePastWithPreciseTime");
    v5 = CFSTR("IPFeatureScanResultTypeGroupMessageConversation");
    v8 = CFSTR("IPFeatureScanResultTypeEventFilteredOutLowConfidenceScore");
    if (a3 != -80)
      v8 = CFSTR("IPFeatureScanResultTypeEventNotFound");
    if (a3 != -90)
      v5 = v8;
    v7 = a3 == -110;
    goto LABEL_18;
  }
  switch(a3)
  {
    case -70:
      result = CFSTR("IPFeatureScanResultTypeEventFilteredOutAllDayWithNoTitle");
      break;
    case -69:
      result = CFSTR("IPFeatureScanResultTypeEventFilteredOutNotAcceptableTimeRangeForEventType");
      break;
    case -68:
      result = CFSTR("IPFeatureScanResultTypeEventFilteredOutSeveralDetectedEvents");
      break;
    case -67:
      result = CFSTR("IPFeatureScanResultTypeEventFilteredOutNotRoundedTime");
      break;
    case -66:
      result = CFSTR("IPFeatureScanResultTypeEventFilteredOutAllDayEvent");
      break;
    case -65:
      result = CFSTR("IPFeatureScanResultTypeEventNoClassificationType");
      break;
    case -60:
      result = CFSTR("IPFeatureScanResultTypeEventFilteredOut");
      break;
    default:
      return result;
  }
  return result;
}

- (void)enrichEvents:(id)a3 messageUnits:(id)a4 dateInSubject:(id)a5 dataFeatures:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
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
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  _BOOL4 v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  double v38;
  void *v39;
  id v40;
  char v41;
  double v42;
  _BOOL4 v43;
  id v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  double v49;
  uint64_t v50;
  void *v51;
  void *v52;
  IPFeatureScanner *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  IPFeatureScanner *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id obj;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  int v84;
  void *v85;
  uint64_t v86;
  int v87;
  void *v88;
  unsigned int v89;
  char v90;
  unsigned __int8 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v83 = a4;
  v79 = a5;
  v11 = a6;
  if (objc_msgSend(v10, "count"))
  {
    -[IPFeatureScanner movieTitlesFromDataFeatures:](self, "movieTitlesFromDataFeatures:", v11);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner sportTeamNamesFromDataFeatures:](self, "sportTeamNamesFromDataFeatures:", v11);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner artisNamesFromDataFeatures:](self, "artisNamesFromDataFeatures:", v11);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner restaurantAndBarPOINamesFromDataFeatures:](self, "restaurantAndBarPOINamesFromDataFeatures:", v11);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v11;
    -[IPFeatureScanner entertainmentPOINamesFromDataFeatures:](self, "entertainmentPOINamesFromDataFeatures:", v11);
    v73 = v10;
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    obj = v10;
    v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
    if (!v81)
      goto LABEL_80;
    v80 = *(_QWORD *)v93;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v93 != v80)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v12);
        objc_msgSend(v13, "ipsos_eventClassificationType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_msgSend(v13, "ipsos_messageUnit");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "ipsos_messageUnit");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "keywordFeatures");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "ipsos_dataFeatures");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[IPEventClassificationType eventClassificationTypeFromMessageUnit:keywordFeatures:datafeatures:](IPEventClassificationType, "eventClassificationTypeFromMessageUnit:keywordFeatures:datafeatures:", v15, v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setIpsos_eventClassificationType:", v19);

        }
        objc_msgSend(v13, "ipsos_eventClassificationType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20 && !objc_msgSend(v20, "isFairlyGeneric"))
          goto LABEL_23;
        objc_msgSend(v83, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bestLanguageID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v82, "count"))
        {
          +[IPEventClassificationType eventTypeForMoviesAndLanguageID:](IPEventClassificationType, "eventTypeForMoviesAndLanguageID:", v23);
          v24 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v78, "count"))
        {
          +[IPEventClassificationType eventTypeForSportAndLanguageID:](IPEventClassificationType, "eventTypeForSportAndLanguageID:", v23);
          v24 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v76, "count"))
        {
          +[IPEventClassificationType eventTypeForCultureAndLanguageID:](IPEventClassificationType, "eventTypeForCultureAndLanguageID:", v23);
          v24 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v75, "count"))
        {
          +[IPEventClassificationType eventTypeForMealsAndLanguageID:](IPEventClassificationType, "eventTypeForMealsAndLanguageID:", v23);
          v24 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v74, "count"))
            goto LABEL_22;
          +[IPEventClassificationType eventTypeForEntertainmentAndLanguageID:](IPEventClassificationType, "eventTypeForEntertainmentAndLanguageID:", v23);
          v24 = objc_claimAutoreleasedReturnValue();
        }
        v25 = (void *)v24;

        v21 = v25;
LABEL_22:
        objc_msgSend(v13, "setIpsos_eventClassificationType:", v21);

        if (!v21)
          goto LABEL_76;
LABEL_23:
        v26 = objc_msgSend(v13, "isAllDay");
        v27 = objc_msgSend(v13, "ipsos_allDayPreferred");
        v89 = objc_msgSend(v13, "ipsos_isTimeApproximate");
        v28 = objc_msgSend(v13, "ipsos_isEndTimeApproximate");
        objc_msgSend(v13, "startDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "endDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        v86 = v12;
        if ((_DWORD)v26)
        {
          objc_msgSend(v30, "timeIntervalSinceDate:", v29);
          v33 = fabs(v32) > 86400.0;
        }
        else
        {
          objc_msgSend(v21, "adjustedEventClassificationTypeWithStartDate:", v29);
          v34 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "setIpsos_eventClassificationType:", v34);
          v33 = 0;
          v21 = (void *)v34;
        }
        if ((objc_msgSend(v21, "defaultStartingTimeHour") & 0x80000000) != 0)
        {
          v40 = 0;
        }
        else
        {
          v84 = v27;
          v87 = v28;
          v35 = v31;
          v36 = (void *)MEMORY[0x24BDBCE60];
          v37 = 3600 * objc_msgSend(v21, "defaultStartingTimeHour");
          v38 = (double)(int)(v37 + 60 * objc_msgSend(v21, "defaultStartingTimeMinutes"));
          -[IPFeatureScanner normalizedAllDayDateFromDate:](self, "normalizedAllDayDateFromDate:", v29);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "dateWithTimeInterval:sinceDate:", v39, v38);
          v40 = (id)objc_claimAutoreleasedReturnValue();

          if (v40)
            v41 = v26;
          else
            v41 = 1;
          if ((v41 & 1) != 0 || ((v89 ^ 1) & 1) != 0)
          {
            v31 = v35;
            if (!v40)
              goto LABEL_39;
            v43 = 0;
          }
          else
          {
            objc_msgSend(v40, "timeIntervalSinceDate:", v29);
            v43 = fabs(v42) <= 5400.0;
            v31 = v35;
          }
          if ((v26 ^ 1 | v84 | v33) != 1 || v43)
          {
            v44 = v40;

            v89 = 1;
            objc_msgSend(v13, "setIpsos_usesDefaultClassificationTypeStartTime:", 1);
            v40 = v44;

            v26 = 0;
            v29 = v40;
            v31 = v40;
            v28 = v87;
          }
        }
LABEL_39:
        v85 = v40;
        if ((v26 & 1) != 0 || ((v28 ^ 1) & 1) != 0)
        {
          v88 = v31;
        }
        else
        {
          objc_msgSend(v21, "defaultDuration");
          if (v45 <= 0.0)
          {
            if (-[IPFeatureScanner isDateAroundNoon:](self, "isDateAroundNoon:", v29))
            {
              v48 = v29;
              v49 = 3600.0;
            }
            else
            {
              v48 = v29;
              v49 = 7200.0;
            }
            objc_msgSend(v48, "dateByAddingTimeInterval:", v49);
            v47 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v46 = (void *)MEMORY[0x24BDBCE60];
            objc_msgSend(v21, "defaultDuration");
            objc_msgSend(v46, "dateWithTimeInterval:sinceDate:", v29);
            v47 = objc_claimAutoreleasedReturnValue();
          }
          v50 = v47;

          v88 = (void *)v50;
        }
        v91 = 0;
        -[IPFeatureScanner bodyMessageUnits](self, "bodyMessageUnits");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "objectAtIndexedSubscript:", 0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "originalMessage");
        v53 = self;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "subject");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "adjustedEventTitleForMessageUnits:subject:dateInSubject:eventStartDate:isGeneratedFromSubject:", v51, v55, v79, v29, &v91);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        v90 = 0;
        if (objc_msgSend(v21, "isSportRelated"))
        {
          -[IPFeatureScanner decoratedTitle:withSubtitles:](v53, "decoratedTitle:withSubtitles:", v56, v78);
          v57 = objc_claimAutoreleasedReturnValue();
          self = v53;
          v12 = v86;
        }
        else
        {
          self = v53;
          v58 = v88;
          if (objc_msgSend(v21, "isMovieRelated") && v82)
          {
            -[IPFeatureScanner decoratedTitle:withSubtitles:](v53, "decoratedTitle:withSubtitles:", v56, v82);
            v57 = objc_claimAutoreleasedReturnValue();
            v12 = v86;
            goto LABEL_69;
          }
          v12 = v86;
          if (objc_msgSend(v21, "isCultureRelated") && objc_msgSend(v76, "count"))
          {
            v59 = self;
            v60 = v56;
            v61 = v76;
LABEL_68:
            -[IPFeatureScanner decoratedTitle:withSubtitles:](v59, "decoratedTitle:withSubtitles:", v60, v61);
            v57 = objc_claimAutoreleasedReturnValue();
            goto LABEL_69;
          }
          if (objc_msgSend(v21, "isMealRelated") && objc_msgSend(v75, "count"))
          {
            v59 = self;
            v60 = v56;
            v61 = v75;
            goto LABEL_68;
          }
          if (!objc_msgSend(v56, "length") && objc_msgSend(v74, "count"))
          {
            v59 = self;
            v60 = v56;
            v61 = v74;
            goto LABEL_68;
          }
          if (!objc_msgSend(v21, "prefersTitleSenderDecoration"))
            goto LABEL_70;
          objc_msgSend(v21, "defaultTitle");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "isEqualToString:", v56);

          if (!v63)
          {
            v58 = v88;
            goto LABEL_70;
          }
          objc_msgSend(v83, "firstObject");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "originalMessage");
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v65, "sender");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "recipients");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[IPFeatureScanner decoratedTitleFromEventType:title:sender:recipients:isSent:isTitleSenderDecorated:](self, "decoratedTitleFromEventType:title:sender:recipients:isSent:isTitleSenderDecorated:", v21, v56, v66, v67, objc_msgSend(v65, "isSent"), &v90);
          v57 = objc_claimAutoreleasedReturnValue();

          v12 = v86;
          v56 = v65;
        }
        v58 = v88;
LABEL_69:

        v56 = (void *)v57;
LABEL_70:
        objc_msgSend(v13, "setAllDay:", v26);
        objc_msgSend(v13, "setStartDate:", v29);
        objc_msgSend(v13, "setEndDate:", v58);
        objc_msgSend(v13, "setIpsos_isTimeApproximate:", v89);
        objc_msgSend(v13, "setTitle:", v56);
        if (objc_msgSend(v56, "length"))
        {
          v68 = v91;
          v69 = objc_msgSend(v13, "ipsos_eventAttributes");
          v70 = 1024;
          if (!v68)
            v70 = 2048;
          objc_msgSend(v13, "setIpsos_eventAttributes:", v69 | v70);
          if (v90)
            objc_msgSend(v13, "setIpsos_eventAttributes:", objc_msgSend(v13, "ipsos_eventAttributes") | 0x1000);
        }

LABEL_76:
        ++v12;
      }
      while (v81 != v12);
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
      v81 = v71;
      if (!v71)
      {
LABEL_80:

        v11 = v72;
        v10 = v73;
        break;
      }
    }
  }

}

- (id)messageSenderName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[IPFeatureScanner bodyMessageUnits](self, "bodyMessageUnits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)shortNameForPerson:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "displayableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsString:", CFSTR("@")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "personNameComponentsFromString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1738], "localizedStringFromPersonNameComponents:style:options:", v6, 1, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v3;
    }
    v4 = v7;

  }
  return v4;
}

- (id)decoratedTitle:(id)a3 withSubtitles:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;

  v5 = a3;
  v6 = a4;
  if (IPLocalizedString_once != -1)
    dispatch_once(&IPLocalizedString_once, &__block_literal_global_433);
  objc_msgSend((id)IPLocalizedString_bundle, "localizedStringForKey:value:table:", CFSTR("%@: %@"), &stru_24DAA6418, CFSTR("DataDetectorsNaturalLanguage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IPLocalizedString_once != -1)
    dispatch_once(&IPLocalizedString_once, &__block_literal_global_433);
  objc_msgSend((id)IPLocalizedString_bundle, "localizedStringForKey:value:table:", CFSTR(" / "), &stru_24DAA6418, CFSTR("DataDetectorsNaturalLanguage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") && (unint64_t)objc_msgSend(v6, "count") <= 3)
  {
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_pas_componentsJoinedByString:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lowercaseStringWithLocale:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", v11))
    {

    }
    else
    {
      objc_msgSend(v11, "uppercaseStringWithLocale:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v11);

      if (!v15)
      {
LABEL_11:
        if (objc_msgSend(v5, "length"))
        {
          _PASValidatedFormat(v7, v18, v19, v20, v21, v22, v23, v24, (uint64_t)v5);
          v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = v11;
        }
        v26 = v25;

        v6 = v10;
        v5 = v26;
        goto LABEL_15;
      }
    }
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "capitalizedStringWithLocale:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v17;
    goto LABEL_11;
  }
LABEL_15:

  return v5;
}

- (void)confidenceForEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[IPFeatureScanner confidenceForEvent:baseConfidence:](self, "confidenceForEvent:baseConfidence:", v9, 1.0);
        v11 = fmin(v10, 1.0);
        if (v11 < 0.0)
          v11 = 0.0;
        objc_msgSend(v9, "setIpsos_confidence:", v11);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (id)analyzeFeatures:(id)a3 messageUnit:(id)a4
{
  return -[IPFeatureScanner analyzeFeatures:messageUnit:checkPolarity:polarity:](self, "analyzeFeatures:messageUnit:checkPolarity:polarity:", a3, a4, 1, 0);
}

- (id)analyzeFeatures:(id)a3 messageUnit:(id)a4 checkPolarity:(BOOL)a5 polarity:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  IPFeatureScanner *v26;
  id v27;
  id v28;
  id v29;
  _QWORD *v30;
  uint64_t *v31;
  unint64_t v32;
  BOOL v33;
  BOOL v34;
  _QWORD v35[3];
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v10 = a3;
  v11 = a4;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  v42 = (id)objc_opt_new();
  objc_msgSend(v11, "originalMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateSent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[IPFeatureScanner bodyMessageUnits](self, "bodyMessageUnits");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v15 == v11;

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A608]), "initWithBlock:", &__block_literal_global_136);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __71__IPFeatureScanner_analyzeFeatures_messageUnit_checkPolarity_polarity___block_invoke_2;
  v24[3] = &unk_24DAA5068;
  v30 = v35;
  v18 = v13;
  v33 = a5;
  v34 = v16;
  v25 = v18;
  v26 = self;
  v19 = v10;
  v27 = v19;
  v20 = v11;
  v28 = v20;
  v32 = a6;
  v21 = v17;
  v29 = v21;
  v31 = &v37;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v24);
  v22 = (id)v38[5];

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v37, 8);

  return v22;
}

id __71__IPFeatureScanner_analyzeFeatures_messageUnit_checkPolarity_polarity___block_invoke()
{
  return +[IPFeatureScanner eventStore](IPFeatureScanner, "eventStore");
}

void __71__IPFeatureScanner_analyzeFeatures_messageUnit_checkPolarity_polarity___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  int v36;
  char v37;
  uint64_t v38;
  void *v39;
  char v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  void *v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  void *v78;
  unsigned int v79;
  void *v80;
  unsigned int obj;
  id obja;
  _BYTE *v83;
  char v84;
  void *v85;
  void *v86;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  char v92;
  _BYTE v93[128];
  id v94;
  id v95;
  uint8_t buf[16];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = (void *)MEMORY[0x219A2F708]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    if (objc_msgSend(v9, "type") && objc_msgSend(v9, "type") != 1
      || (objc_msgSend(v9, "isMatchStringInsideQuotationMarks") & 1) != 0)
    {
      goto LABEL_63;
    }
    v83 = a4;
    objc_msgSend(v9, "value");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contextDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("endDate"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "contextDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("endDateTimeZone"));
    v12 = objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v85 = (void *)v12;
    objc_msgSend(v9, "contextDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("allDay"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    obj = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v9, "contextDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("prefersAllDay"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v9, "contextDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("timeIsApproximate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v9, "contextDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("timeNeedsMeridianGuess"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v9, "contextDictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("dateTimeIsTenseDependent"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v9, "contextDictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("dateIsTimeOnlyAndReferrengingToSentDate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v25, "BOOLValue");

    objc_msgSend(v9, "contextDictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("isTimeOffset"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v9, "contextDictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("dateOnlyContainsTimeInformation"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    objc_msgSend(v9, "contextDictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("isDateRange"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v32, "BOOLValue");

    objc_msgSend(v9, "contextDictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("extractedInSubject"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "BOOLValue");

    v76 = v19;
    if (v87)
      v36 = v19;
    else
      v36 = 1;
    v71 = v36;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      v37 = v30;
    else
      v37 = 0;
    v38 = objc_msgSend(v86, "compare:", *(_QWORD *)(a1 + 32));
    v39 = v86;
    if ((v37 & 1) != 0 || v38 == -1)
    {
      if (IPDebuggingModeEnabled_once != -1)
        dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
      a4 = v83;
      if (IPDebuggingModeEnabled_sEnabled)
      {
        v43 = _IPLogHandle;
        if (!_IPLogHandle)
        {
          IPInitLogging();
          v43 = _IPLogHandle;
        }
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          v44 = v43;
          objc_msgSend(v9, "matchString");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v45;
          _os_log_impl(&dword_219581000, v44, OS_LOG_TYPE_INFO, "Skip date:%@ #FeatureManager", buf, 0xCu);

        }
      }
      goto LABEL_62;
    }
    v92 = 0;
    *(_QWORD *)buf = 1;
    if (*(_BYTE *)(a1 + 96))
    {
      if (*(_BYTE *)(a1 + 97))
        v40 = 0;
      else
        v40 = v35;
      if ((v40 & 1) != 0)
        goto LABEL_38;
      if ((objc_msgSend(*(id *)(a1 + 40), "isEventProposalOrConfirmationFromFeatures:fromFeatureAtIndex:messageUnit:eventIsTenseDependent:extractedFromSubject:extractedPolarity:polarityInfluencedByIpsosPlistRef:", *(_QWORD *)(a1 + 48), a3, *(_QWORD *)(a1 + 56), v79, v35, buf, &v92) & 1) == 0)
      {
        if (v92)
        {
          v41 = *(void **)(a1 + 40);
          v42 = -21;
LABEL_39:
          objc_msgSend(v41, "setResultType:", v42);
LABEL_61:
          a4 = v83;
LABEL_62:
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v84;

LABEL_63:
          goto LABEL_64;
        }
LABEL_38:
        v41 = *(void **)(a1 + 40);
        v42 = -20;
        goto LABEL_39;
      }
    }
    else
    {
      *(_QWORD *)buf = *(_QWORD *)(a1 + 88);
      if ((*(_QWORD *)buf & 0xFFFFFFFFFFFFFFFELL) != 2)
        goto LABEL_38;
    }
    v46 = (void *)MEMORY[0x24BDC74E0];
    objc_msgSend(*(id *)(a1 + 64), "result");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "eventWithEventStore:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "setIpsos_eventAttributes:", 0);
    objc_msgSend(*(id *)(a1 + 56), "originalMessage");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v47) = objc_msgSend(v49, "isGroupConversation");

    if ((_DWORD)v47)
      objc_msgSend(v48, "setIpsos_eventAttributes:", objc_msgSend(v48, "ipsos_eventAttributes") | 8);
    v72 = v71 | obj;
    objc_msgSend(*(id *)(a1 + 56), "originalMessage");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "isSenderSignificant");

    v52 = v87;
    v53 = v85;
    if (v51)
      objc_msgSend(v48, "setIpsos_eventAttributes:", objc_msgSend(v48, "ipsos_eventAttributes") | 0x100);
    v95 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v95, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setIpsos_dataFeatures:", v54);

    objc_msgSend(v48, "setIpsos_messageUnit:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v48, "setIpsos_eventStatus:", objc_msgSend(*(id *)(a1 + 40), "eventStatusFromPolarity:", *(_QWORD *)buf));
    if (v87)
    {
      if (!obj)
        goto LABEL_47;
    }
    else
    {
      if (!obj)
      {
        if (objc_msgSend(*(id *)(a1 + 40), "isDateAroundNoon:", v86))
          v56 = 3600.0;
        else
          v56 = 7200.0;
        objc_msgSend(v86, "dateByAddingTimeInterval:", v56);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_47;
      }
      objc_msgSend(v86, "dateByAddingTimeInterval:", 1.0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v52, "dateByAddingTimeInterval:", -1.0);
    v55 = objc_claimAutoreleasedReturnValue();

    v53 = 0;
    v52 = (void *)v55;
LABEL_47:
    objc_msgSend(v48, "setStartTimeZone:", v53);
    v85 = v53;
    objc_msgSend(v48, "setEndTimeZone:", v53);
    objc_msgSend(v48, "setAllDay:", obj);
    objc_msgSend(v48, "setStartDate:", v86);
    v87 = v52;
    objc_msgSend(v48, "setEndDate:", v52);
    objc_msgSend(v48, "setIpsos_isTimeApproximate:", v76);
    objc_msgSend(v48, "setIpsos_isEndTimeApproximate:", v72);
    objc_msgSend(v48, "setIpsos_timeNeedsMeridianGuess:", v75);
    objc_msgSend(v48, "setIpsos_isDateTimeTenseDependent:", v79);
    objc_msgSend(v48, "setIpsos_isEventTimeOnlyAndReferrengingToSentDate:", v74);
    objc_msgSend(v48, "setIpsos_isTimeOffset:", v73);
    objc_msgSend(v48, "setIpsos_eventClassificationType:", 0);
    objc_msgSend(v48, "setIpsos_allDayPreferred:", v77);
    v94 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v94, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setIpsos_dataFeatures:", v57);

    objc_msgSend(v48, "setIpsos_messageUnit:", *(_QWORD *)(a1 + 56));
    v58 = (void *)MEMORY[0x24BDC7488];
    objc_msgSend(*(id *)(a1 + 64), "result");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "calendarForEntityType:eventStore:", 0, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setCalendar:", v60);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObject:", v48);
    objc_msgSend(*(id *)(a1 + 40), "_nearbyFeatureDatas:fromFeatureAtIndex:messageUnit:", *(_QWORD *)(a1 + 48), a3, *(_QWORD *)(a1 + 56));
    v61 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "extractedNotesStrings");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "notesStringsFromDataFeatures:", v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addObjectsFromArray:", v63);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)v61;
    objc_msgSend(v64, "addObjectsFromArray:", v61);
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    objc_msgSend(v64, "reverseObjectEnumerator");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v89;
      v78 = v64;
      while (2)
      {
        for (i = 0; i != v66; ++i)
        {
          if (*(_QWORD *)v89 != v67)
            objc_enumerationMutation(obja);
          v69 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
          if (objc_msgSend(v69, "type") == 3
            || objc_msgSend(v69, "type") == 7
            || objc_msgSend(v69, "type") == 12
            || objc_msgSend(v69, "type") == 13)
          {
            objc_msgSend(*(id *)(a1 + 40), "cleanedStringForFeatureData:", v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setLocation:", v70);

            v64 = v78;
            goto LABEL_60;
          }
        }
        v66 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
        v64 = v78;
        if (v66)
          continue;
        break;
      }
    }
LABEL_60:

    v39 = v86;
    goto LABEL_61;
  }
LABEL_64:
  objc_autoreleasePoolPop(v8);
  if (a3 == 100)
    *a4 = 1;

}

- (unint64_t)eventStatusFromPolarity:(unint64_t)a3
{
  if (a3 - 2 >= 3)
    return 0;
  else
    return a3 - 1;
}

- (id)decoratedTitleFromEventType:(id)a3 title:(id)a4 sender:(id)a5 recipients:(id)a6 isSent:(BOOL)a7 isTitleSenderDecorated:(BOOL *)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if ((unint64_t)objc_msgSend(v17, "count") < 2)
  {
    if (v9)
    {
      objc_msgSend(v17, "firstObject");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = v16;
    }
    v20 = v19;
    if (v19)
    {
      -[IPFeatureScanner shortNameForPerson:](self, "shortNameForPerson:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "containsString:", CFSTR("+")) & 1) == 0 && objc_msgSend(v21, "integerValue") <= 0)
      {
        objc_msgSend(v14, "decoratedTitleFromTitle:participantName:isTitleSenderDecorated:", v15, v21, a8);
        v22 = objc_claimAutoreleasedReturnValue();

        v15 = (id)v22;
      }

    }
    v18 = v15;

  }
  else
  {
    v18 = v15;
  }

  return v18;
}

- (NSArray)bodyMessageUnits
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBodyMessageUnits:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)bodyAllFeatures
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBodyAllFeatures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)bodyDataDetectorsFeatures
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBodyDataDetectorsFeatures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableArray)bodyKeywordFeatures
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBodyKeywordFeatures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)bodySentenceFeatures
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBodySentenceFeatures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableArray)detectedEvents
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)stitchedEvents
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStitchedEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)filteredDetectedEvents
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFilteredDetectedEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(int64_t)a3
{
  self->_resultType = a3;
}

- (NSMutableSet)extractedNotesStrings
{
  return (NSMutableSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExtractedNotesStrings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractedNotesStrings, 0);
  objc_storeStrong((id *)&self->_filteredDetectedEvents, 0);
  objc_storeStrong((id *)&self->_stitchedEvents, 0);
  objc_storeStrong((id *)&self->_detectedEvents, 0);
  objc_storeStrong((id *)&self->_bodySentenceFeatures, 0);
  objc_storeStrong((id *)&self->_bodyKeywordFeatures, 0);
  objc_storeStrong((id *)&self->_bodyDataDetectorsFeatures, 0);
  objc_storeStrong((id *)&self->_bodyAllFeatures, 0);
  objc_storeStrong((id *)&self->_bodyMessageUnits, 0);
}

@end
