@implementation LoggingHelper

- (LoggingHelper)initWithExperimentName:(id)a3
{
  return -[LoggingHelper initWithExperimentName:trialExperimentId:trialTreatmentId:trialDeploymentId:](self, "initWithExperimentName:trialExperimentId:trialTreatmentId:trialDeploymentId:", a3, 0, 0, 0);
}

- (LoggingHelper)initWithExperimentName:(id)a3 trialExperimentId:(id)a4 trialTreatmentId:(id)a5 trialDeploymentId:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  LoggingHelper *v14;
  uint64_t v15;
  NSUUID *dodmlId;
  void *v17;
  NSString *experimentName;
  NSString *trialExperimentId;
  void *v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)LoggingHelper;
  v14 = -[LoggingHelper init](&v22, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = objc_claimAutoreleasedReturnValue();
    dodmlId = v14->_dodmlId;
    v14->_dodmlId = (NSUUID *)v15;

    objc_storeStrong((id *)&v14->_experimentName, a3);
    objc_storeStrong((id *)&v14->_trialExperimentId, a4);
    objc_storeStrong((id *)&v14->_trialTreatmentId, a5);
    v14->_trialDeploymentId = a6;
    -[NSUUID UUIDString](v14->_dodmlId, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    experimentName = v14->_experimentName;
    trialExperimentId = v14->_trialExperimentId;
    -[NSUUID UUIDString](v14->_trialTreatmentId, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("SELF Logging object created successfully: dodmlId=%@, experimentName=%@, trialExperimentId=%@, trialTreatmentId=%@, trialDeploymentId=%llu"), v17, experimentName, trialExperimentId, v20, v14->_trialDeploymentId);

  }
  return v14;
}

- (void)logUserEditExperimentStartedOrChanged
{
  id v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BE94B90]);
  objc_msgSend(v4, "setExists:", 1);
  v3 = objc_alloc_init(MEMORY[0x24BE94B70]);
  objc_msgSend(v3, "setStartedOrChanged:", v4);
  -[LoggingHelper _wrapAndEmitTopLevelEvent:](self, "_wrapAndEmitTopLevelEvent:", v3);

}

- (void)logUserEditExperimentEndedAndTier1WithResultsDict:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id obj;
  id v48;
  uint64_t v49;
  LoggingHelper *v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v51 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v48 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v56 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioResults"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v52)
  {
    v49 = *(_QWORD *)v66;
    v50 = self;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v66 != v49)
          objc_enumerationMutation(obj);
        v54 = v5;
        v6 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v5);
        v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v53 = v6;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("confusionPairs"));
        v55 = (id)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v62;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v62 != v11)
                objc_enumerationMutation(v55);
              v13 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v12);
              v14 = objc_alloc_init(MEMORY[0x24BE94AE8]);
              objc_msgSend(v14, "setErrorCode:", 0);
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("editMethod"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "intValue");

              objc_msgSend(v14, "setEditMethod:", v16);
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("errorType"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "intValue");

              objc_msgSend(v14, "setEditReason:", v18);
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("index"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setRecognizedTextStartIndex:", objc_msgSend(v19, "intValue"));

              v20 = objc_alloc_init(MEMORY[0x24BE94AF0]);
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("recognizedTokens"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setRecognizedTokens:", v21);

              if ((v18 & 0xFFFFFFFD) != 0)
              {
                objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("correctedTokens"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setCorrectedTokens:", v22);

                objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("logContext"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                if (v23)
                {
                  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("leftContext"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "setLeftContextToken:", v24);

                  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("rightContext"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "setRightContextToken:", v25);

                }
              }
              objc_msgSend(v7, "addObject:", v14);
              objc_msgSend(v8, "addObject:", v20);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
          }
          while (v10);
        }

        v26 = objc_alloc_init(MEMORY[0x24BE94B88]);
        self = v50;
        objc_msgSend(v26, "setDatapackVersion:", v50->_datapackVersion);
        v27 = objc_alloc(MEMORY[0x24BE95C78]);
        v28 = objc_alloc(MEMORY[0x24BDD1880]);
        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("asrId"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v28, "initWithUUIDString:", v29);
        v31 = (void *)objc_msgSend(v27, "initWithNSUUID:", v30);
        objc_msgSend(v26, "setAsrId:", v31);

        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("errorCode"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setErrorCode:", objc_msgSend(v32, "intValue"));

        if (objc_msgSend(v7, "count"))
        {
          objc_msgSend(v26, "setConfusionPairs:", v7);
          v33 = objc_alloc(MEMORY[0x24BE95C78]);
          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v33, "initWithNSUUID:", v34);

          objc_msgSend(v26, "setLinkId:", v35);
          v36 = objc_alloc_init(MEMORY[0x24BE94B80]);
          objc_msgSend(v36, "setLinkId:", v35);
          objc_msgSend(v36, "setConfusionPairs:", v8);
          objc_msgSend(v48, "addObject:", v36);

        }
        objc_msgSend(v51, "addObject:", v26);

        v5 = v54 + 1;
      }
      while (v54 + 1 != v52);
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v52);
  }

  v37 = objc_alloc_init(MEMORY[0x24BE94B78]);
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("numAudioAvailable"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setNumAudioFilesAvailable:", objc_msgSend(v38, "unsignedIntValue"));

  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("numSelectedAudio"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setNumAudioFilesSelected:", objc_msgSend(v39, "unsignedIntValue"));

  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("errorCode"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setErrorCode:", objc_msgSend(v40, "intValue"));

  objc_msgSend(v37, "setRedecodingResults:", v51);
  v41 = objc_alloc_init(MEMORY[0x24BE94B70]);
  objc_msgSend(v41, "setEnded:", v37);
  -[LoggingHelper _wrapAndEmitTopLevelEvent:](self, "_wrapAndEmitTopLevelEvent:", v41);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v42 = v48;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v58;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v58 != v45)
          objc_enumerationMutation(v42);
        -[LoggingHelper _wrapAndEmitTopLevelEvent:](self, "_wrapAndEmitTopLevelEvent:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v46++));
      }
      while (v44 != v46);
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v44);
  }

}

- (void)logDictationPersonalizationExperimentStartedOrChanged
{
  void *v3;
  id v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BE94B40]);
  objc_msgSend(v5, "setExists:", 1);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceThermalState:", objc_msgSend(v3, "thermalState"));

  v4 = objc_alloc_init(MEMORY[0x24BE94B30]);
  objc_msgSend(v4, "setStartedOrChanged:", v5);
  -[LoggingHelper _wrapAndEmitTopLevelEvent:](self, "_wrapAndEmitTopLevelEvent:", v4);

}

- (void)logDictationPersonalizationExperimentEndedAndTier1WithResultsDict:(id)a3
{
  id v4;
  id v5;
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
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE94B38]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("languageMetadata"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v7)
  {
    v8 = v7;
    v30 = v4;
    v9 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("status"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v11, "isEqualToString:", CFSTR("Required Personalized LM not found")))
        {

          v12 = &unk_2510B7B28;
          v4 = v30;
          goto LABEL_13;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v8)
        continue;
      break;
    }
    v4 = v30;
  }
  v12 = &unk_2510B7B10;
LABEL_13:

  objc_msgSend(v5, "setExperimentStatusCode:", objc_msgSend(v12, "intValue"));
  objc_msgSend(v5, "setDatapackVersion:", self->_datapackVersion);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAudio"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumAudioFilesAvailable:", objc_msgSend(v13, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedAudio"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumAudioFilesSelected:", objc_msgSend(v14, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textProcessingDuration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v15, "doubleValue");
  objc_msgSend(v16, "numberWithDouble:", v17 * 1000000000.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextProcessingDurationInNs:", objc_msgSend(v18, "unsignedLongLongValue"));

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceThermalState:", objc_msgSend(v19, "thermalState"));

  v35 = 0;
  -[LoggingHelper _audioFileResultsFromResultDict:privateAudioFileResultsOut:](self, "_audioFileResultsFromResultDict:privateAudioFileResultsOut:", v4, &v35);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v35;
  objc_msgSend(v5, "setAudioFileResults:", v20);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personalizedLM"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[LoggingHelper _plmMetricsFromPlmDict:](self, "_plmMetricsFromPlmDict:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersonalizedLanguageModelMetrics:", v23);

  v24 = objc_alloc_init(MEMORY[0x24BE94B30]);
  objc_msgSend(v24, "setEnded:", v5);
  -[LoggingHelper _wrapAndEmitTopLevelEvent:](self, "_wrapAndEmitTopLevelEvent:", v24);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v25 = v21;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(v25);
        -[LoggingHelper _wrapAndEmitTopLevelEvent:](self, "_wrapAndEmitTopLevelEvent:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v27);
  }

}

- (id)_audioFileResultsFromResultDict:(id)a3 privateAudioFileResultsOut:(id *)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v24;
  id obj;
  uint64_t v26;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioResults"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v5)
  {
    v6 = v5;
    v26 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v9 = objc_alloc_init(MEMORY[0x24BE94AD0]);
        objc_msgSend(v29, "addObject:", v9);
        v10 = objc_alloc(MEMORY[0x24BE95C78]);
        v11 = objc_alloc(MEMORY[0x24BDD1880]);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("asrSelfComponentId"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);
        v14 = (void *)objc_msgSend(v10, "initWithNSUUID:", v13);

        objc_msgSend(v9, "setAsrId:", v14);
        v15 = objc_alloc(MEMORY[0x24BE95C78]);
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithNSUUID:", v16);

        objc_msgSend(v9, "setLinkId:", v17);
        v30 = 0;
        -[LoggingHelper _decodingResultsWithAudioDict:privateTokensOut:](self, "_decodingResultsWithAudioDict:privateTokensOut:", v8, &v30);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v30;
        objc_msgSend(v9, "setDecodingResults:", v18);

        v20 = objc_alloc_init(MEMORY[0x24BE94AD8]);
        objc_msgSend(v28, "addObject:", v20);
        v21 = objc_alloc_init(MEMORY[0x24BE949D8]);
        objc_msgSend(v21, "setLinkId:", v17);
        objc_msgSend(v21, "setTokens:", v19);

        objc_msgSend(v20, "setRecognitionResult:", v21);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v6);
  }
  if (a4)
    *a4 = objc_retainAutorelease(v28);

  return v29;
}

- (id)_decodingResultsWithAudioDict:(id)a3 privateTokensOut:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v56;
  id obj;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v62 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tokens"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metrics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alignments"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v7;
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uttInfos"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = v5;
  if (v10)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uttInfos"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uttInfosCompressed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x24BDBCE50]);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uttInfosCompressed"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithBase64EncodedString:options:", v13, 0);

      v68 = 0;
      objc_msgSend(v14, "decompressedDataUsingAlgorithm:error:", 3, &v68);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v68;
      v67 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v15, 0, &v67);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v67;
      v18 = v17;
      if (v16)
      {
        v19 = *MEMORY[0x24BE08FD0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FD0], OS_LOG_TYPE_ERROR))
          -[LoggingHelper _decodingResultsWithAudioDict:privateTokensOut:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      else if (v17)
      {
        v27 = *MEMORY[0x24BE08FD0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FD0], OS_LOG_TYPE_ERROR))
          -[LoggingHelper _decodingResultsWithAudioDict:privateTokensOut:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);
      }

    }
    else
    {
      v59 = 0;
    }
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v9;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v35)
  {
    v36 = v35;
    v58 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v64 != v58)
          objc_enumerationMutation(obj);
        v38 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
        v39 = objc_alloc_init(MEMORY[0x24BE94B00]);
        objc_msgSend(v62, "addObject:", v39);
        objc_msgSend(v39, "setConfigName:", v38);
        objc_msgSend(v8, "objectForKeyedSubscript:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[LoggingHelper _decodingMetricsFromMetricsDict:](self, "_decodingMetricsFromMetricsDict:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setDecodingMetrics:", v41);

        objc_msgSend(v61, "objectForKeyedSubscript:", v38);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[LoggingHelper _tokensFromTokenDict:privateTokens:](self, "_tokensFromTokenDict:privateTokens:", v42, v6);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setTokens:", v43);

        objc_msgSend(v59, "objectForKeyedSubscript:", v38);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[LoggingHelper _utteranceInfosFromUtteranceInfoDict:privateTokens:](self, "_utteranceInfosFromUtteranceInfoDict:privateTokens:", v44, v6);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setUtterances:", v45);

        objc_msgSend(v8, "objectForKeyedSubscript:", v38);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("DecodeDuration"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v6;
        v49 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v47, "doubleValue");
        objc_msgSend(v49, "numberWithDouble:", v50 * 1000000000.0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setDecodeDurationInNs:", objc_msgSend(v51, "unsignedLongLongValue"));

        v6 = v48;
        objc_msgSend(v60, "objectForKeyedSubscript:", v38);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[LoggingHelper _alignmentInfosFromAlignmentDict:](self, "_alignmentInfosFromAlignmentDict:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setAlignments:", v53);

      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    }
    while (v36);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v62;
}

- (id)_decodingMetricsFromMetricsDict:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v36;
  void *v37;
  void *v38;
  id obj;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE94AF8]);
  v38 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WallRTF"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  objc_msgSend(v4, "setWallRealTimeFactor:");

  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("AverageActiveTokensPerFrame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  objc_msgSend(v4, "setAverageActiveTokensPerFrame:");

  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("jitQueryDurationInMs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setJitQueryDurationInMs:", objc_msgSend(v7, "unsignedLongLongValue"));

  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("jitLmeDurationInMs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setJitLanguageModelEnrollmentDurationInMs:", objc_msgSend(v8, "unsignedLongLongValue"));

  objc_msgSend(v38, "valueForKeyPath:", CFSTR("jitDataStats.preprocessingCategoryCounts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __49__LoggingHelper__decodingMetricsFromMetricsDict___block_invoke;
  v47[3] = &unk_2510B5F70;
  v11 = v4;
  v48 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v47);

  objc_msgSend(v38, "valueForKeyPath:", CFSTR("jitDataStats.postprocessingCategoryCounts"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v10;
  v45[1] = 3221225472;
  v45[2] = __49__LoggingHelper__decodingMetricsFromMetricsDict___block_invoke_2;
  v45[3] = &unk_2510B5F70;
  v36 = v11;
  v46 = v36;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v45);

  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("lm_interp_weights"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v40 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v37, "componentsSeparatedByString:", CFSTR(";"));
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v42;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v42 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v15);
          v17 = objc_alloc_init(MEMORY[0x24BE949B8]);
          objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(":"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "doubleValue");
          objc_msgSend(v19, "numberWithDouble:");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "doubleValue");
          objc_msgSend(v22, "numberWithDouble:");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v21, "doubleValue");
          objc_msgSend(v25, "numberWithDouble:", v26 * 1000000.0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setStartTimeInNs:", objc_msgSend(v27, "unsignedLongLongValue"));

          v28 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v24, "doubleValue");
          objc_msgSend(v28, "numberWithDouble:", v29 * 1000000.0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setEndTimeInNs:", objc_msgSend(v30, "unsignedLongLongValue"));

          objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "componentsSeparatedByString:", CFSTR(","));
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "valueForKey:", CFSTR("floatValue"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setWeights:", v33);

          objc_msgSend(v40, "addObject:", v17);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v13);
    }

    objc_msgSend(v36, "setLanguageModelInterpolationWeights:", v40);
  }
  v34 = v36;

  return v34;
}

void __49__LoggingHelper__decodingMetricsFromMetricsDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5 = (objc_class *)MEMORY[0x24BE94B08];
  v6 = a3;
  v7 = a2;
  v9 = objc_alloc_init(v5);
  objc_msgSend(v9, "setEntityCategory:", v7);

  v8 = objc_msgSend(v6, "unsignedLongValue");
  objc_msgSend(v9, "setCount:", v8);
  objc_msgSend(*(id *)(a1 + 32), "addPreprocessingEntityCategoryCounts:", v9);

}

void __49__LoggingHelper__decodingMetricsFromMetricsDict___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5 = (objc_class *)MEMORY[0x24BE94B08];
  v6 = a3;
  v7 = a2;
  v9 = objc_alloc_init(v5);
  objc_msgSend(v9, "setEntityCategory:", v7);

  v8 = objc_msgSend(v6, "unsignedLongValue");
  objc_msgSend(v9, "setCount:", v8);
  objc_msgSend(*(id *)(a1 + 32), "addPostprocessingEntityCategoryCounts:", v9);

}

- (id)_utteranceInfosFromUtteranceInfoDict:(id)a3 privateTokens:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  id v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v27 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
          v13 = objc_alloc_init(MEMORY[0x24BE94B98]);
          objc_msgSend(v7, "addObject:", v13);
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("results"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[LoggingHelper _resultInfosFromResultInfoDict:privateTokens:](self, "_resultInfosFromResultInfoDict:privateTokens:", v14, v27);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setResults:", v15);

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("startMillis"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v16, "doubleValue");
          objc_msgSend(v17, "numberWithDouble:", v18 * 1000000.0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v19, "unsignedLongLongValue"));

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("endMillis"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v20, "doubleValue");
          objc_msgSend(v21, "numberWithDouble:", v22 * 1000000.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setEndTimeInNs:", objc_msgSend(v23, "unsignedLongLongValue"));

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v9);
    }

    v6 = v25;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_alignmentInfosFromAlignmentDict:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__LoggingHelper__alignmentInfosFromAlignmentDict___block_invoke;
  v8[3] = &unk_2510B5F98;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __50__LoggingHelper__alignmentInfosFromAlignmentDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = (objc_class *)MEMORY[0x24BE94AC8];
  v6 = a3;
  v7 = a2;
  v13 = objc_alloc_init(v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
  objc_msgSend(v13, "setReferenceName:", v7);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Deletions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumDeletions:", objc_msgSend(v8, "unsignedIntValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Insertions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumInsertions:", objc_msgSend(v9, "unsignedIntValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Substitutions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumSubstitutions:", objc_msgSend(v10, "unsignedIntValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EditDistance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEditDistance:", objc_msgSend(v11, "unsignedIntValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReferenceSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setReferenceSize:", objc_msgSend(v12, "unsignedIntValue"));
}

- (id)_resultInfosFromResultInfoDict:(id)a3 privateTokens:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_alloc_init(MEMORY[0x24BE94B50]);
        objc_msgSend(v7, "addObject:", v15);
        objc_msgSend(v15, "setStageName:", v13);
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("aligned"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setIsAligned:", v16 != 0);

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("choices"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[LoggingHelper _choiceInfosFromChoiceInfoDicts:privateTokens:](self, "_choiceInfosFromChoiceInfoDicts:privateTokens:", v17, v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setChoices:", v18);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_choiceInfosFromChoiceInfoDicts:(id)a3 privateTokens:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        v14 = objc_alloc_init(MEMORY[0x24BE94AE0]);
        objc_msgSend(v8, "addObject:", v14);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("tokens"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[LoggingHelper _tokensFromTokensArray:privateTokens:](self, "_tokensFromTokensArray:privateTokens:", v15, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTokens:", v16);

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("graphCost"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "floatValue");
        objc_msgSend(v14, "setGraphCost:");

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("acousticCost"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        objc_msgSend(v14, "setAcousticCost:");

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v8;
}

- (id)_tokensFromTokensArray:(id)a3 privateTokens:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id obj;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
        v12 = objc_alloc_init(MEMORY[0x24BE94B58]);
        objc_msgSend(v35, "addObject:", v12);
        v13 = objc_alloc_init(MEMORY[0x24BE949E0]);
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v14, "doubleValue");
        objc_msgSend(v15, "numberWithDouble:", v16 * 1000000.0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v17, "unsignedLongLongValue"));

        objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v18, "doubleValue");
        objc_msgSend(v19, "numberWithDouble:", v20 * 1000000.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setEndTimeInNs:", objc_msgSend(v21, "unsignedLongLongValue"));

        objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v22, "doubleValue");
        objc_msgSend(v23, "numberWithDouble:", v24 * 1000000.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSilenceStartTimeInNs:", objc_msgSend(v25, "unsignedLongLongValue"));

        objc_msgSend(v12, "setToken:", v13);
        objc_msgSend(v11, "objectAtIndexedSubscript:", 5);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "floatValue");
        objc_msgSend(v12, "setAcousticCost:");

        objc_msgSend(v11, "objectAtIndexedSubscript:", 6);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "floatValue");
        objc_msgSend(v12, "setSilenceAcousticCost:");

        objc_msgSend(v11, "objectAtIndexedSubscript:", 7);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setNumBackoffs:", v28);

        objc_msgSend(v11, "objectAtIndexedSubscript:", 8);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setLanguageModelCosts:", v29);

        v30 = objc_alloc_init(MEMORY[0x24BE949E8]);
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setText:", v31);

        objc_msgSend(v11, "objectAtIndexedSubscript:", 4);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setPhoneSequence:", v32);

        if (objc_msgSend(v6, "containsObject:", v30))
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "indexOfObject:", v30));
        }
        else
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "count"));
          objc_msgSend(v6, "addObject:", v30);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v8);
  }

  return v35;
}

- (id)_tokensFromTokenDict:(id)a3 privateTokens:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v11);
        v13 = objc_alloc_init(MEMORY[0x24BE949E0]);
        objc_msgSend(v7, "addObject:", v13);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("startTime"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v14, "doubleValue");
        objc_msgSend(v15, "numberWithDouble:", v16 * 1000000000.0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v17, "unsignedLongLongValue"));

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("endTime"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v18, "doubleValue");
        objc_msgSend(v19, "numberWithDouble:", v20 * 1000000000.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setEndTimeInNs:", objc_msgSend(v21, "unsignedLongLongValue"));

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("removeSpaceAfter"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAppendSpaceAfter:", objc_msgSend(v22, "BOOLValue") ^ 1);

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("silenceStartTime"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v23, "doubleValue");
        objc_msgSend(v24, "numberWithDouble:", v25 * 1000000000.0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSilenceStartTimeInNs:", objc_msgSend(v26, "unsignedLongLongValue"));

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("confidence"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setConfidence:", objc_msgSend(v27, "intValue"));

        v28 = objc_alloc_init(MEMORY[0x24BE949E8]);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("text"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setText:", v29);

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("phoneSequence"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setPhoneSequence:", v30);

        if (objc_msgSend(v6, "containsObject:", v28))
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "indexOfObject:", v28));
        }
        else
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "count"));
          objc_msgSend(v6, "addObject:", v28);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v9);
  }

  return v7;
}

- (id)_plmMetricsFromPlmDict:(id)a3
{
  id v4;
  void *v5;
  id v6;
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
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("train"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BE94B68]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("train"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LoggingHelper _transcriptMetadataFromPopDict:](self, "_transcriptMetadataFromPopDict:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTrain:", v9);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("test"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LoggingHelper _transcriptMetadataFromPopDict:](self, "_transcriptMetadataFromPopDict:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTest:", v12);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("dev"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LoggingHelper _transcriptMetadataFromPopDict:](self, "_transcriptMetadataFromPopDict:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDev:", v15);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("external"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LoggingHelper _transcriptMetadataFromPopDict:](self, "_transcriptMetadataFromPopDict:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExternal:", v18);

  v19 = objc_alloc_init(MEMORY[0x24BE94B10]);
  v66 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eval"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("model-selection"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("best-weight"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  objc_msgSend(v19, "setBestWeight:");

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("totalTime"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v23, "doubleValue");
  objc_msgSend(v24, "numberWithDouble:", v25 * 1000.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTotalDurationInMs:", objc_msgSend(v26, "unsignedLongLongValue"));

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("times"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[LoggingHelper _lmMetricsFromEvalDict:perplexityName:timesDict:](self, "_lmMetricsFromEvalDict:perplexityName:timesDict:", v20, CFSTR("train-ppl"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTrains:", v28);

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("times"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[LoggingHelper _lmMetricsFromEvalDict:perplexityName:timesDict:](self, "_lmMetricsFromEvalDict:perplexityName:timesDict:", v20, CFSTR("test-ppl"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTests:", v30);

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("times"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[LoggingHelper _lmMetricsFromEvalDict:perplexityName:timesDict:](self, "_lmMetricsFromEvalDict:perplexityName:timesDict:", v20, CFSTR("dev-ppl"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDevs:", v32);

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("times"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[LoggingHelper _lmMetricsFromEvalDict:perplexityName:timesDict:](self, "_lmMetricsFromEvalDict:perplexityName:timesDict:", v20, CFSTR("external-ppl"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setExternals:", v34);

  v35 = objc_alloc_init(MEMORY[0x24BE94B20]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("model"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("times"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setConfigName:", 0);
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("order"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setNgramOrder:", objc_msgSend(v38, "unsignedIntValue"));

  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("residualAdaptationWeight"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "floatValue");
  objc_msgSend(v35, "setResidualAdaptationWeight:");

  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("totalTime"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v40, "doubleValue");
  objc_msgSend(v41, "numberWithDouble:", v42 * 1000.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTotalDurationInMs:", objc_msgSend(v43, "unsignedLongLongValue"));

  objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("training"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v44, "doubleValue");
  objc_msgSend(v45, "numberWithDouble:", v46 * 1000.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTrainingDurationInMs:", objc_msgSend(v47, "unsignedLongLongValue"));

  objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("conversion"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v48, "doubleValue");
  objc_msgSend(v49, "numberWithDouble:", v50 * 1000.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setConversionDurationInMs:", objc_msgSend(v51, "unsignedLongLongValue"));

  objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("optimization"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v52, "doubleValue");
  objc_msgSend(v53, "numberWithDouble:", v54 * 1000.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setOptimizationDurationInMs:", objc_msgSend(v55, "unsignedLongLongValue"));

  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("numStates"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setNumFiniteStateTransducerStates:", objc_msgSend(v56, "unsignedIntValue"));

  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("numArcs"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setNumFiniteStateTransducerArcs:", objc_msgSend(v57, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trainErrorCode"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setModelTrainingStatusCode:", objc_msgSend(v58, "unsignedIntValue"));

  v59 = objc_alloc_init(MEMORY[0x24BE94B48]);
  v60 = v6;
  objc_msgSend(v59, "setTranscriptionMetrics:", v6);
  objc_msgSend(v59, "setEvaluationMetrics:", v19);
  v61 = (void *)MEMORY[0x24BE95CA8];
  v62 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userLanguage"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v63, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setUserLocale:", objc_msgSend(v61, "convertLanguageCodeToSchemaLocale:", v64));

  objc_msgSend(v59, "setModelMetrics:", v35);
  return v59;
}

- (id)_transcriptMetadataFromPopDict:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
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

  v3 = (objc_class *)MEMORY[0x24BE94B60];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numDocumentsRejected"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumDocumentsRejected:", objc_msgSend(v6, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSentencesRejected"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumSentencesRejected:", objc_msgSend(v7, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numDocuments"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumDocumentsAccepted:", objc_msgSend(v8, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSentences"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumSentencesAccepted:", objc_msgSend(v9, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numTokens"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumTokensAccepted:", objc_msgSend(v10, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numTokensOOV"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumTokensOutOfVocabularyAccepted:", objc_msgSend(v11, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numDocumentsDictated"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumDocumentsDictated:", objc_msgSend(v12, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numDocumentsTyped"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumDocumentsTyped:", objc_msgSend(v13, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numTokensDictated"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumTokensDictated:", objc_msgSend(v14, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numTokensTyped"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumTokensTyped:", objc_msgSend(v15, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSentencesMungeRejected"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumSentencesMungeRejected:", objc_msgSend(v16, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSentencesMungeChanged"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumSentencesMungeChanged:", objc_msgSend(v17, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numTokensEstimatedExamined"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setNumTokensEstimatedExamined:", objc_msgSend(v18, "unsignedIntValue"));
  return v5;
}

- (id)_lmMetricsFromEvalDict:(id)a3 perplexityName:(id)a4 timesDict:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  id v32;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v37 = a5;
  v38 = v7;
  objc_msgSend(a3, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v34 = v8;
    obj = v8;
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v39)
    {
      v35 = *(_QWORD *)v47;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v47 != v35)
            objc_enumerationMutation(obj);
          v41 = v9;
          v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v9);
          objc_msgSend(obj, "objectForKeyedSubscript:", v10, v34);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_alloc_init(MEMORY[0x24BE94B18]);
          objc_msgSend(v36, "addObject:", v12);
          objc_msgSend(v10, "floatValue");
          objc_msgSend(v12, "setLinearInterpolationWeight:");
          objc_msgSend(v37, "objectForKeyedSubscript:", v38);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v14, "doubleValue");
          objc_msgSend(v15, "numberWithDouble:", v16 * 1000.0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setTotalDurationInMs:", objc_msgSend(v17, "unsignedLongLongValue"));

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("utterances"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setNumUtterances:", objc_msgSend(v18, "unsignedIntValue"));

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("words"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setNumWords:", objc_msgSend(v19, "unsignedIntValue"));

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("OOVs"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setNumOutOfVocabularyWords:", objc_msgSend(v20, "unsignedIntValue"));

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("invalidTokens"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setNumInvalidTokens:", objc_msgSend(v21, "unsignedIntValue"));

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("invalidUtterances"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setNumInvalidUtterances:", objc_msgSend(v22, "unsignedIntValue"));

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PPL"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "floatValue");
          objc_msgSend(v12, "setPerplexity:");

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PPL1"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "floatValue");
          objc_msgSend(v12, "setPerplexityOne:");

          v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ngramHits"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v43;
            do
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v43 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
                v32 = objc_alloc_init(MEMORY[0x24BE94B28]);
                objc_msgSend(v25, "addObject:", v32);
                objc_msgSend(v32, "setHits:", v31);

              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
            }
            while (v28);
          }

          objc_msgSend(v12, "setNgramHits:", v25);
          v9 = v41 + 1;
        }
        while (v41 + 1 != v39);
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v39);
    }

    v8 = v34;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (void)_wrapAndEmitTopLevelEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE94BA8]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithNSUUID:", self->_dodmlId);
  objc_msgSend(v5, "setDodMlId:", v6);
  objc_msgSend(v5, "setExperimentName:", self->_experimentName);
  objc_msgSend(v5, "setTrialExperimentId:", self->_trialExperimentId);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithNSUUID:", self->_trialTreatmentId);
  objc_msgSend(v5, "setTrialTreatmentId:", v7);
  objc_msgSend(v5, "setTrialDeploymentId:", self->_trialDeploymentId);
  v8 = objc_alloc_init(MEMORY[0x24BE94BA0]);
  objc_msgSend(v8, "setEventMetadata:", v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setPersonalizationExperimentContext:", v4);
LABEL_9:
    v9 = (void *)*MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEBUG))
      -[LoggingHelper _wrapAndEmitTopLevelEvent:].cold.1(v9);
    objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "emitMessage:", v8);

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setUserEditExperimentContext:", v4);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setUserEditExperimentEndedTier1:", v4);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setAudioFileResultTier1:", v4);
    goto LABEL_9;
  }
  v11 = *MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_ERROR))
    -[LoggingHelper _wrapAndEmitTopLevelEvent:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_12:

}

- (NSString)datapackVersion
{
  return self->_datapackVersion;
}

- (void)setDatapackVersion:(id)a3
{
  objc_storeStrong((id *)&self->_datapackVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datapackVersion, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_experimentName, 0);
  objc_storeStrong((id *)&self->_dodmlId, 0);
}

- (void)_decodingResultsWithAudioDict:(uint64_t)a3 privateTokensOut:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24097E000, a1, a3, "%s Fides SELF: Utterance Info could not be deserialized - it will not be logged.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_decodingResultsWithAudioDict:(uint64_t)a3 privateTokensOut:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24097E000, a1, a3, "%s Fides SELF: Utterance Info could not be decompressed - it will not be logged.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_decodingMetricsFromMetricsDict:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24097E000, a1, a3, "%s Fides SELF: Expected interpolation weight sets separated by delimiter ';' - starting with a set of weights delimi"
    "ted by ',' and ending with start/end times delimited by ':'. Ex: '0.999646,0.000354:0:4280;0.947514,0.000158:0:3859'",
    a5,
    a6,
    a7,
    a8,
    2u);
  OUTLINED_FUNCTION_1();
}

- (void)_decodingMetricsFromMetricsDict:.cold.2()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_24097E000, v0, OS_LOG_TYPE_ERROR, "%s Fides SELF: Encountered malformed string during SELF logging for interpolation weights in speech results from recognizer. String: %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_wrapAndEmitTopLevelEvent:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_24097E000, v1, OS_LOG_TYPE_DEBUG, "%s Fides SELF: Wrapping and logging an event of type %@", (uint8_t *)v4, 0x16u);

}

- (void)_wrapAndEmitTopLevelEvent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24097E000, a1, a3, "%s Fides SELF: Failed trying to wrap and emit top-level ASR event because event type was not mapped to loggable message type in the DODML ASR SELF schema.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
