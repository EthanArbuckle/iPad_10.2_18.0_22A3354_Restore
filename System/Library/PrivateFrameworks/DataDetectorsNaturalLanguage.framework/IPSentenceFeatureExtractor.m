@implementation IPSentenceFeatureExtractor

- (unint64_t)responseKitAnnotationTypeForFeatureDataType:(unint64_t)a3
{
  if (a3 > 0xD)
    return 0;
  else
    return qword_2195AA120[a3];
}

- (id)featureSentencesFromText:(id)a3 dataDetectedFeatures:(id)a4 languageID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  IPSentenceFeatureExtractor *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[4];
  _QWORD v33[6];
  _QWORD v34[3];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v10, "hasPrefix:", CFSTR("zh")) & 1) != 0
    || objc_msgSend(v10, "hasPrefix:", CFSTR("ja")))
  {
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("。"), CFSTR("\n"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("\n"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BDD1638]);
  v34[0] = *MEMORY[0x24BDD0F58];
  v14 = v34[0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithTagSchemes:options:", v15, 0);

  objc_msgSend(v16, "setString:", v8);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3010000000;
  v33[4] = 0;
  v33[5] = 0;
  v33[3] = &unk_2195EAEEA;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v17 = objc_msgSend(v8, "length");
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __87__IPSentenceFeatureExtractor_featureSentencesFromText_dataDetectedFeatures_languageID___block_invoke;
  v24[3] = &unk_24DAA5930;
  v30 = v33;
  v18 = v8;
  v25 = v18;
  v19 = v10;
  v26 = v19;
  v20 = v12;
  v27 = v20;
  v31 = v32;
  v21 = v9;
  v28 = v21;
  v29 = self;
  objc_msgSend(v16, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v17, v14, 4, v24);
  v22 = v20;

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v33, 8);

  return v22;
}

void __87__IPSentenceFeatureExtractor_featureSentencesFromText_dataDetectedFeatures_languageID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  id v9;
  uint64_t v10;
  void *v12;
  IPFeatureSentence *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  id v24;

  v9 = a2;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (a5 == *(_QWORD *)(v10 + 32) && a6 == *(_QWORD *)(v10 + 40))
    goto LABEL_18;
  v24 = v9;
  *(_QWORD *)(v10 + 32) = a5;
  *(_QWORD *)(v10 + 40) = a6;
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a5, a6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80918]), "initWithString:andLanguageIdentifier:", v23, *(_QWORD *)(a1 + 40));
  v13 = -[IPFeatureSentence initWithLanguageID:responseKitSentence:]([IPFeatureSentence alloc], "initWithLanguageID:responseKitSentence:", *(_QWORD *)(a1 + 40), v12);
  -[IPFeature setMatchRange:](v13, "setMatchRange:", a5, a6);
  -[IPFeature setTextUnit:](v13, "setTextUnit:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  if (v14 >= objc_msgSend(*(id *)(a1 + 56), "count"))
    goto LABEL_17;
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "matchRange");
    if (v16 + v17 > a5)
      break;
LABEL_14:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);

    v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    if (v22 >= objc_msgSend(*(id *)(a1 + 56), "count"))
      goto LABEL_17;
  }
  if (v16 < a5 + a6)
  {
    v18 = v16 - a5;
    if (v16 >= a5)
    {
      v19 = v17;
      v20 = objc_msgSend(*(id *)(a1 + 64), "responseKitAnnotationTypeForFeatureDataType:", objc_msgSend(v15, "type"));
      if (v20)
      {
        if (v19 >= a6 - v18)
          v21 = a6 - v18;
        else
          v21 = v19;
        objc_msgSend(v12, "annotateRange:type:", v18, v21, v20);
      }
    }
    goto LABEL_14;
  }

LABEL_17:
  v9 = v24;
LABEL_18:

}

- (void)identifyAndStorePolarityInFeatureSentences:(id)a3 eventIdentifier:(id)a4 previousFeatureSentences:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(v7, "count");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v7);

  objc_msgSend(v11, "addObjectsFromArray:", v9);
  NSStringFromSelector(sel_responseKitSentence);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifyText:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __114__IPSentenceFeatureExtractor_identifyAndStorePolarityInFeatureSentences_eventIdentifier_previousFeatureSentences___block_invoke;
  v16[3] = &unk_24DAA5958;
  v17 = v11;
  v18 = v10;
  v15 = v11;
  objc_msgSend(v14, "enumerateClassifiedTokens:", v16);

}

void __114__IPSentenceFeatureExtractor_identifyAndStorePolarityInFeatureSentences_eventIdentifier_previousFeatureSentences___block_invoke(uint64_t a1, unint64_t *a2, float *a3)
{
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = *a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= *(_QWORD *)(a1 + 40))
  {
    v8 = a3[1];
    v9 = a3[3];
    v10 = a3[4];
    v11 = a3[2];
    if (v11 <= 0.4 && v10 <= 0.4)
      v13 = 0;
    else
      v13 = 6;
    v15 = v7;
    +[IPFeatureSentenceFragment fragmentWithRange:clusterType:](IPFeatureSentenceFragment, "fragmentWithRange:clusterType:", a2[1], a2[2], v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProbability_None:", v8);
    objc_msgSend(v14, "setProbability_Rejection:", v9);
    objc_msgSend(v14, "setProbability_Proposal:", v10);
    objc_msgSend(v14, "setProbability_Confirmation:", v11);
    objc_msgSend(v15, "addFragment:", v14);

    v7 = v15;
  }

}

- (id)eventIdentifierForLanguageID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD block[5];
  id v20;
  _QWORD v21[5];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  v6 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke;
  v21[3] = &unk_24DAA59D0;
  v21[4] = self;
  if (eventIdentifierForLanguageID__onceToken == -1)
  {
    if (v4)
      goto LABEL_3;
LABEL_17:
    v9 = 0;
    goto LABEL_18;
  }
  dispatch_once(&eventIdentifierForLanguageID__onceToken, v21);
  if (!v4)
    goto LABEL_17;
LABEL_3:
  objc_msgSend((id)eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE80908]), "initWithLanguageID:", v4);
    if (v9)
    {
      objc_msgSend((id)eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID, "setObject:forKey:", v9, v4);
      goto LABEL_15;
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", v4);
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(&unk_24DB100C8, "containsObject:", v11);

    if (v12)
    {
      v13 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v13 = _IPLogHandle;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v4;
        _os_log_impl(&dword_219581000, v13, OS_LOG_TYPE_ERROR, "%{public}@ is supposed to be a supported language but we have failed to load the corresponding ResponseKit model. This usually means that the corresponding LinguisticData assets have not been downloaded #Generic", buf, 0xCu);
      }
    }
    v14 = (void *)eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, v4);

    v16 = dispatch_time(0, 43200000000000);
    dispatch_get_global_queue(0, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke_42;
    block[3] = &unk_24DAA4FB0;
    block[4] = self;
    v20 = v4;
    dispatch_after(v16, v17, block);

LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
    goto LABEL_14;
  v9 = v7;
LABEL_15:

LABEL_18:
  objc_sync_exit(v5);

  return v9;
}

void __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD handler[5];
  int out_token;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A5F0]), "initWithCountLimit:", 3);
  v3 = (void *)eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID;
  eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID = v2;

  out_token = 0;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke_2;
  handler[3] = &unk_24DAA5980;
  handler[4] = *(_QWORD *)(a1 + 32);
  notify_register_dispatch("com.apple.MobileAsset.LinguisticData.new-asset-installed", &out_token, v4, handler);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke_24;
  v8[3] = &unk_24DAA59A8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v7 = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", CFSTR("IPScannerResetSharedCachesAndModelsNotification"), 0, 0, v8);

}

void __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke_2()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  v0 = _IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    v0 = _IPLogHandle;
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_219581000, v0, OS_LOG_TYPE_INFO, "Received new asset installation notification #Generic", v2, 2u);
  }
  objc_opt_class();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v1);
  objc_msgSend((id)eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID, "removeAllObjects");
  objc_sync_exit(v1);

}

void __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke_24(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  objc_msgSend((id)eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID, "removeAllObjects");
  objc_sync_exit(v2);

}

void __59__IPSentenceFeatureExtractor_eventIdentifierForLanguageID___block_invoke_42(uint64_t a1)
{
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend((id)eventIdentifierForLanguageID__sResponseKitEventIdentifierPerLanguageID, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(obj);

}

- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v21;

  v8 = a3;
  v9 = a4;
  v21 = a5;
  objc_opt_class();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  objc_msgSend(v9, "bestLanguageID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPSentenceFeatureExtractor eventIdentifierForLanguageID:](self, "eventIdentifierForLanguageID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v9, "originalMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "type");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = IPMessageTypeShortMessage;

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("IPFeatureExtractorContextDataDetectorsFeatures"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == v15)
    {
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("IPFeatureExtractorPreviousFeatureSentences"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = (void *)MEMORY[0x24BDBD1A8];
    }
    -[IPSentenceFeatureExtractor featureSentencesFromText:dataDetectedFeatures:languageID:](self, "featureSentencesFromText:dataDetectedFeatures:languageID:", v8, v16, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPSentenceFeatureExtractor identifyAndStorePolarityInFeatureSentences:eventIdentifier:previousFeatureSentences:](self, "identifyAndStorePolarityInFeatureSentences:eventIdentifier:previousFeatureSentences:", v18, v12, v17);

  }
  else
  {
    v18 = 0;
  }

  objc_sync_exit(v10);
  if (v12)
    v19 = v18;
  else
    v19 = (id)MEMORY[0x24BDBD1A8];

  return v19;
}

- (id)queue
{
  if (queue__onceToken_1 != -1)
    dispatch_once(&queue__onceToken_1, &__block_literal_global_8);
  return (id)queue__ipExprOnceResult_1;
}

void __35__IPSentenceFeatureExtractor_queue__block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x219A2F708]();
  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("IPSentenceFeatureExtractor", v1);
  v3 = (void *)queue__ipExprOnceResult_1;
  queue__ipExprOnceResult_1 = (uint64_t)v2;

  objc_autoreleasePoolPop(v0);
}

@end
