@implementation CDMRepetitionDetectionServiceUtils

+ (id)buildRDRequestWithPrevTurn:(id)a3 curTurn:(id)a4 nluRequestId:(id)a5 resultCandidateId:(id)a6 cdmRequestId:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  id v23;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[2];
  void *v44;
  NSObject *v45;
  uint8_t buf[4];
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  CDMOSLoggerForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "+[CDMRepetitionDetectionServiceUtils buildRDRequestWithPrevTurn:curTurn:nluRequestId:resultCandidateId:cdmRequestId:]";
    _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s Preparing Repetition Detection Reqeust", buf, 0xCu);
  }

  if (v11)
  {
    objc_msgSend(v11, "asrOutputs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");
    if (v12 && v18)
    {
      objc_msgSend(v12, "asrOutputs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20)
      {
        if ((objc_msgSend(v12, "tapToEdit") & 1) == 0 && !objc_msgSend(v11, "tapToEdit"))
        {
          objc_msgSend(v11, "asrOutputs");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "firstObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[CDMRepetitionDetectionServiceUtils asrHypothesis2QRUtterance:](CDMRepetitionDetectionServiceUtils, "asrHypothesis2QRUtterance:", v26);
          v21 = objc_claimAutoreleasedReturnValue();

          v27 = objc_alloc_init(MEMORY[0x24BE9E298]);
          v45 = v21;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v28, "copy");
          objc_msgSend(v27, "setOriginalUtterances:", v29);

          v30 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
          objc_msgSend(v27, "setSiriResponses:", v30);

          objc_msgSend(v11, "locale");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setLocale:", v31);

          objc_msgSend(v27, "setTap2edit:", objc_msgSend(v11, "tapToEdit"));
          v41 = v27;
          objc_msgSend(v27, "setStartTimestamp:", objc_msgSend(v11, "startTimestamp"));
          objc_msgSend(v12, "asrOutputs");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[CDMRepetitionDetectionServiceUtils asrHypothesis2QRUtterance:](CDMRepetitionDetectionServiceUtils, "asrHypothesis2QRUtterance:", v33);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          v34 = objc_alloc_init(MEMORY[0x24BE9E298]);
          v44 = v42;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)objc_msgSend(v35, "copy");
          objc_msgSend(v34, "setOriginalUtterances:", v36);

          v37 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
          objc_msgSend(v34, "setSiriResponses:", v37);

          objc_msgSend(v12, "locale");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setLocale:", v38);

          objc_msgSend(v34, "setTap2edit:", objc_msgSend(v12, "tapToEdit"));
          objc_msgSend(v34, "setStartTimestamp:", objc_msgSend(v12, "startTimestamp"));
          v23 = objc_alloc_init(MEMORY[0x24BE9E280]);
          objc_msgSend(v23, "setResultCandidateId:", v14);
          objc_msgSend(v23, "setNluRequestId:", v13);
          v43[0] = v27;
          v43[1] = v34;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(v39, "mutableCopy");
          objc_msgSend(v23, "setOriginalInteractions:", v40);

          objc_msgSend(v23, "setCdmRequestId:", v15);
          goto LABEL_14;
        }
        CDMOSLoggerForCategory(0);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v47 = "+[CDMRepetitionDetectionServiceUtils buildRDRequestWithPrevTurn:curTurn:nluRequestId:resultCandidateId:cdmRequestId:]";
          v22 = "%s Current Turn or Previous Turn is Tap2Edit, skipping RD call";
LABEL_17:
          _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, v22, buf, 0xCu);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else
    {

    }
  }
  CDMOSLoggerForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "+[CDMRepetitionDetectionServiceUtils buildRDRequestWithPrevTurn:curTurn:nluRequestId:resultCandidateId:cdmRequestId:]";
    v22 = "%s Invalid Inputs for Repetition Detection";
    goto LABEL_17;
  }
LABEL_13:
  v23 = 0;
LABEL_14:

  return v23;
}

+ (id)asrToken2QRToken:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (objc_class *)MEMORY[0x24BE9E2A0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "postItnText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:", v6);

  objc_msgSend(v5, "setStartIndex:", objc_msgSend(v4, "beginIndex"));
  objc_msgSend(v5, "setEndIndex:", objc_msgSend(v4, "endIndex"));
  objc_msgSend(v4, "confidenceScore");
  objc_msgSend(v5, "setAsrConfidence:");
  objc_msgSend(v4, "phoneSequence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhoneSequence:", v7);

  v8 = objc_msgSend(v4, "removeSpaceAfter");
  objc_msgSend(v5, "setRemoveSpaceAfter:", v8);
  return v5;
}

+ (id)asrHypothesis2QRUtterance:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "asrTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "asrTokens", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        +[CDMRepetitionDetectionServiceUtils asrToken2QRToken:](CDMRepetitionDetectionServiceUtils, "asrToken2QRToken:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v13 = objc_alloc_init(MEMORY[0x24BE9E2A8]);
  v14 = objc_alloc_init(MEMORY[0x24BE9E150]);
  objc_msgSend(v13, "setAsrId:", v14);

  objc_msgSend(v3, "utterance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUtterance:", v15);

  v16 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  objc_msgSend(v13, "setNluInternalTokens:", v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v6);
  objc_msgSend(v13, "setAsrUtteranceTokens:", v17);

  objc_msgSend(v3, "probability");
  objc_msgSend(v13, "setConfidence:");

  return v13;
}

@end
