@implementation NLPLearnerExtensionWorker

- (NLPLearnerExtensionWorker)initWithLocale:(id)a3 experimentName:(id)a4 modelURL:(id)a5 metricParameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  os_log_t v14;
  void *v15;
  NLPLearnerExtensionWorker *v16;
  NLPLearnerExtensionWorker *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = os_log_create("com.apple.NLPLearner.NLPLearnerExtensionWorker", "NLPLearnerExtensionWorker");
  v15 = (void *)sLog;
  sLog = (uint64_t)v14;

  v19.receiver = self;
  v19.super_class = (Class)NLPLearnerExtensionWorker;
  v16 = -[NLPLearnerExtensionWorker init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    -[NLPLearnerExtensionWorker setLocale:](v16, "setLocale:", v10);
    -[NLPLearnerExtensionWorker setExperimentName:](v17, "setExperimentName:", v11);
    -[NLPLearnerExtensionWorker setModelURL:](v17, "setModelURL:", v12);
    -[NLPLearnerExtensionWorker setMetricParameters:](v17, "setMetricParameters:", v13);
  }

  return v17;
}

- (BOOL)evaluateModel:(id)a3 sampleLimit:(unint64_t)a4
{
  NLPLearnerACTShadowEvaluator *v6;
  void *v7;
  void *v8;
  NLPLearnerACTShadowEvaluator *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v17;
  id v18;

  v6 = [NLPLearnerACTShadowEvaluator alloc];
  -[NLPLearnerExtensionWorker locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLPLearnerExtensionWorker metricParameters](self, "metricParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NLPLearnerACTShadowEvaluator initWithLocale:andMetricParameters:](v6, "initWithLocale:andMetricParameters:", v7, v8);

  -[NLPLearnerShadowEvaluator setMaxSamples:](v9, "setMaxSamples:", a4);
  -[NLPLearnerExtensionWorker modelURL](self, "modelURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLPLearnerExtensionWorker loadTaskData](self, "loadTaskData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  -[NLPLearnerACTShadowEvaluator evaluateModel:onRecords:options:completion:error:](v9, "evaluateModel:onRecords:options:completion:error:", v10, v11, 0, 0, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;

  if (v13)
  {
    v14 = (void *)sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[NLPLearnerExtensionWorker evaluateModel:sampleLimit:].cold.2(v14, self, (uint64_t)v13);
  }
  else
  {
    if (v12)
    {
      -[NLPLearnerExtensionWorker logEvaluationResults:](self, "logEvaluationResults:", v12);
      v15 = 1;
      goto LABEL_7;
    }
    v17 = (void *)sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[NLPLearnerExtensionWorker evaluateModel:sampleLimit:].cold.1(v17, self);
  }
  v15 = 0;
LABEL_7:

  return v15;
}

- (id)loadTaskData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1B0F8], "startDateSortDescriptorAscending:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B090], "eventStreamWithName:", CFSTR("/app/intents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:argumentArray:", CFSTR("source.bundleID IN {'com.apple.MobileSMS', 'com.apple.mobilemail'} && structuredMetadata._DKIntentMetadataKey__intentClass IN {'INSendMessageIntent', 'MSSendMailIntent'}"), MEMORY[0x24BDBD1A8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B088], "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v6, v5, 0, 4000, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0B0], "knowledgeStoreWithDirectReadOnlyAccess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v8, "executeQuery:error:", v7, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  if (v10)
  {
    v11 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[NLPLearnerExtensionWorker loadTaskData].cold.1((uint64_t)v10, v11, v12);
  }
  v13 = (void *)sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v19 = v15;
    _os_log_impl(&dword_22630F000, v14, OS_LOG_TYPE_INFO, "Finished querying CoreDuet, got %lu events", buf, 0xCu);

  }
  return v9;
}

- (void)logEvaluationResults:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_22630F000, v5, OS_LOG_TYPE_INFO, "Evaluation results: %@", buf, 0xCu);
  }
  -[NLPLearnerExtensionWorker coreAnalyticsEvent](self, "coreAnalyticsEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  AnalyticsSendEventLazy();

}

uint64_t __50__NLPLearnerExtensionWorker_logEvaluationResults___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "coreAnalyticsDonationFromEvaluationResults:", *(_QWORD *)(a1 + 40));
}

- (id)coreAnalyticsEvent
{
  return CFSTR("com.apple.NLPLearner.NLPLearnerQuickTypeLighthousePlugin.ACTShadowEvaluation");
}

- (id)coreAnalyticsEventSchema
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[29];
  _QWORD v10[30];

  v10[29] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(&unk_24EDBC7D8, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("actTestName");
  v9[1] = CFSTR("actTestVersion");
  v10[0] = &stru_24EDB9588;
  v10[1] = &stru_24EDB9588;
  v9[2] = CFSTR("actVersion");
  v9[3] = CFSTR("isAutocorrectionEnabled");
  v10[2] = &stru_24EDB9588;
  v10[3] = v3;
  v9[4] = CFSTR("candidate1ConfigName");
  v9[5] = CFSTR("candidate1CharacterCount");
  v10[4] = &stru_24EDB9588;
  v10[5] = v3;
  v9[6] = CFSTR("candidate1InsertedCharacterCount");
  v9[7] = CFSTR("candidate1SeparatorCount");
  v10[6] = v3;
  v10[7] = v3;
  v9[8] = CFSTR("candidate1WordCount");
  v9[9] = CFSTR("candidate1WordErrorCount");
  v10[8] = v3;
  v10[9] = v3;
  v9[10] = CFSTR("candidate1AverageJoannaWordErrorCount");
  v9[11] = CFSTR("candidate1CorrectedAwayWordErrorCount");
  v10[10] = v3;
  v10[11] = v3;
  v9[12] = CFSTR("candidate1TouchErrorRecoveryWordErrorCount");
  v9[13] = CFSTR("candidate1KnownWordCount");
  v10[12] = v3;
  v10[13] = v3;
  v9[14] = CFSTR("candidate2ConfigName");
  v9[15] = CFSTR("candidate2CharacterCount");
  v10[14] = &stru_24EDB9588;
  v10[15] = v3;
  v9[16] = CFSTR("candidate2InsertedCharacterCount");
  v9[17] = CFSTR("candidate2SeparatorCount");
  v10[16] = v3;
  v10[17] = v3;
  v9[18] = CFSTR("candidate2WordCount");
  v9[19] = CFSTR("candidate2WordErrorCount");
  v10[18] = v3;
  v10[19] = v3;
  v9[20] = CFSTR("candidate2AverageJoannaWordErrorCount");
  v9[21] = CFSTR("candidate2CorrectedAwayWordErrorCount");
  v10[20] = v3;
  v10[21] = v3;
  v9[22] = CFSTR("candidate2TouchErrorRecoveryWordErrorCount");
  v9[23] = CFSTR("candidate2KnownWordCount");
  v10[22] = v3;
  v10[23] = v3;
  v10[24] = v3;
  v9[24] = CFSTR("numberOfSamples");
  v9[25] = CFSTR("keyboardLanguage");
  -[NLPLearnerExtensionWorker locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[25] = v5;
  v10[26] = v3;
  v9[26] = CFSTR("deploymentID");
  v9[27] = CFSTR("experimentID");
  v9[28] = CFSTR("treatmentID");
  v10[27] = CFSTR("fail");
  v10[28] = CFSTR("fail");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  return v7;
}

- (id)coreAnalyticsDonationFromEvaluationResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NLPLearnerExtensionWorker coreAnalyticsEventSchema](self, "coreAnalyticsEventSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLPLearnerExtensionWorker experimentName](self, "experimentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("candidate1ConfigName"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Samples"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("numberOfSamples"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v15, "isEqualToString:", CFSTR("Samples")) & 1) == 0)
        {
          objc_msgSend(v16, "stringValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("candidate1%@"), v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v18);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v12);
  }

  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24EDBC7F0, CFSTR("deploymentID"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("MLHost"), CFSTR("experimentID"));
  -[NLPLearnerExtensionWorker experimentName](self, "experimentName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("treatmentID"));

  v20 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl(&dword_22630F000, v20, OS_LOG_TYPE_INFO, "Donate to CoreAnalytics: %@", buf, 0xCu);
  }

  return v9;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSString)experimentName
{
  return self->_experimentName;
}

- (void)setExperimentName:(id)a3
{
  objc_storeStrong((id *)&self->_experimentName, a3);
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelURL, a3);
}

- (NSDictionary)metricParameters
{
  return self->_metricParameters;
}

- (void)setMetricParameters:(id)a3
{
  objc_storeStrong((id *)&self->_metricParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricParameters, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_experimentName, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)evaluateModel:(void *)a1 sampleLimit:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "modelURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0(&dword_22630F000, v3, v5, "Empty evaluation results for model: %@", (uint8_t *)&v6);

}

- (void)evaluateModel:(uint64_t)a3 sampleLimit:.cold.2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "modelURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a3;
  _os_log_error_impl(&dword_22630F000, v5, OS_LOG_TYPE_ERROR, "Failed evaluation for model: %@, Error: %@", (uint8_t *)&v7, 0x16u);

}

- (void)loadTaskData
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_22630F000, a2, a3, "Failed to query CoreDuet storage with error %@", (uint8_t *)&v3);
}

@end
