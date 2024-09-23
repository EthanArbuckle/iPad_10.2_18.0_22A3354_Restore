@implementation AIAudiogramIngestionEngine

- (AIAudiogramIngestionEngine)init
{
  AIAudiogramIngestionEngine *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  AIAudiogramAssetManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AIAudiogramIngestionEngine;
  v2 = -[AIAudiogramIngestionEngine init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.AudiogramIngestion.AIAudiogramIngestionEngine.AnalysisQueue", v3);
    -[AIAudiogramIngestionEngine setAnalysisQueue:](v2, "setAnalysisQueue:", v4);

    v5 = -[AIAudiogramAssetManager initWithDelegate:]([AIAudiogramAssetManager alloc], "initWithDelegate:", v2);
    -[AIAudiogramIngestionEngine setAssetManager:](v2, "setAssetManager:", v5);

  }
  return v2;
}

- (AIAudiogramIngestionEngine)initWithDelegate:(id)a3
{
  id v4;
  AIAudiogramIngestionEngine *v5;
  AIAudiogramIngestionEngine *v6;

  v4 = a3;
  v5 = -[AIAudiogramIngestionEngine init](self, "init");
  v6 = v5;
  if (v5)
    -[AIAudiogramIngestionEngine setDelegate:](v5, "setDelegate:", v4);

  return v6;
}

- (BOOL)isAvailable
{
  void *v3;
  void *v4;
  BOOL v5;

  if (_os_feature_enabled_impl())
  {
    -[AIAudiogramIngestionEngine graphModel](self, "graphModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[AIAudiogramIngestionEngine symbolModel](self, "symbolModel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 != 0;

    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    -[AIAudiogramIngestionEngine model](self, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3 != 0;
  }

  return v5;
}

- (void)startRetrievingLatestModel
{
  NSObject *v3;
  uint8_t v4[16];

  AXLogAudiogram();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22FB4F000, v3, OS_LOG_TYPE_INFO, "Start retrieving latest model", v4, 2u);
  }

  -[AIAudiogramIngestionEngine setIsRetrievingLatestModelSilently:](self, "setIsRetrievingLatestModelSilently:", 0);
  -[AIAudiogramIngestionEngine _retrieveModel](self, "_retrieveModel");
}

- (void)startRetrievingLatestModelSilently
{
  NSObject *v3;
  uint8_t v4[16];

  AXLogAudiogram();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22FB4F000, v3, OS_LOG_TYPE_INFO, "Start retrieving latest model silently", v4, 2u);
  }

  -[AIAudiogramIngestionEngine setIsRetrievingLatestModelSilently:](self, "setIsRetrievingLatestModelSilently:", 1);
  -[AIAudiogramIngestionEngine _retrieveModel](self, "_retrieveModel");
}

- (void)_retrieveModel
{
  NSObject *v3;
  id v4;
  uint8_t buf[16];

  if (-[AIAudiogramIngestionEngine isRetrievingLatestModel](self, "isRetrievingLatestModel"))
  {
    AXLogAudiogram();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FB4F000, v3, OS_LOG_TYPE_INFO, "AIAudiogramIngestionEngine is already retrieving a model. No need to start retrieving again", buf, 2u);
    }

  }
  else
  {
    -[AIAudiogramIngestionEngine setIsRetrievingLatestModel:](self, "setIsRetrievingLatestModel:", 1);
    -[AIAudiogramIngestionEngine assetManager](self, "assetManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refreshAssets");

  }
}

- (void)_stopRetrievingLatestModel
{
  -[AIAudiogramIngestionEngine setIsRetrievingLatestModel:](self, "setIsRetrievingLatestModel:", 0);
}

- (void)_loadModelFromAssetPath:(id)a3 assetProperties:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  double v53;
  __int16 v54;
  __CFString *v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AIAudiogramIngestionEngine setAssetProperties:](self, "setAssetProperties:", v7);
  if (!_os_feature_enabled_impl())
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("LeftEarSymbolName"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (const __CFString *)v8;
    else
      v10 = CFSTR("Left Ear");
    -[AIAudiogramIngestionEngine setModelLabelLeftEarSymbol:](self, "setModelLabelLeftEarSymbol:", v10);

    objc_msgSend(v7, "objectForKey:", CFSTR("RightEarSymbolName"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = CFSTR("Right Ear");
    -[AIAudiogramIngestionEngine setModelLabelRightEarSymbol:](self, "setModelLabelRightEarSymbol:", v13);

    objc_msgSend(v7, "objectForKey:", CFSTR("GraphName"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (const __CFString *)v14;
    else
      v16 = CFSTR("Graph");
    -[AIAudiogramIngestionEngine setModelLabelGraph:](self, "setModelLabelGraph:", v16);

    objc_msgSend(v7, "objectForKey:", CFSTR("SymbolConfidenceThreshold"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17;
    if (v17)
      objc_msgSend(v17, "floatValue");
    else
      LODWORD(v18) = 0.5;
    -[AIAudiogramIngestionEngine setModelLabelConfidenceThreshold:](self, "setModelLabelConfidenceThreshold:", v18);
    objc_msgSend(v7, "objectForKey:", CFSTR("IsModelCompiled"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
      v22 = objc_msgSend(v20, "BOOLValue");
    else
      v22 = 0;
    objc_msgSend(v7, "objectForKey:", CFSTR("ModelName"), v19);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v25 = CFSTR("SymbolsDetector");
    if (v23)
      v25 = (__CFString *)v23;
    v26 = v25;

    AXLogAudiogram();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      -[AIAudiogramIngestionEngine modelLabelLeftEarSymbol](self, "modelLabelLeftEarSymbol");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[AIAudiogramIngestionEngine modelLabelRightEarSymbol](self, "modelLabelRightEarSymbol");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[AIAudiogramIngestionEngine modelLabelGraph](self, "modelLabelGraph");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[AIAudiogramIngestionEngine modelLabelConfidenceThreshold](self, "modelLabelConfidenceThreshold");
      *(_DWORD *)buf = 138413570;
      v47 = v28;
      v48 = 2112;
      v49 = v29;
      v50 = 2112;
      v51 = v30;
      v52 = 2048;
      v53 = v31;
      v54 = 2112;
      v55 = v26;
      v56 = 1024;
      v57 = v22;
      _os_log_impl(&dword_22FB4F000, v27, OS_LOG_TYPE_INFO, "Loading audiogram model properties. left='%@', right='%@', graph='%@', confidence=%f, model name='%@', compiled=%i", buf, 0x3Au);

    }
    objc_msgSend(v6, "URLByAppendingPathComponent:", v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if ((v22 & 1) != 0)
    {
      objc_msgSend(v32, "URLByAppendingPathExtension:", CFSTR("mlmodelc"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v32, "URLByAppendingPathExtension:", CFSTR("mlmodel"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = 0;
      objc_msgSend(MEMORY[0x24BDBFFC8], "compileModelAtURL:error:", v35, &v45);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v45;
      if (v36)
      {
        v37 = v36;
        AXLogAudiogram();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          -[AIAudiogramIngestionEngine _loadModelFromAssetPath:assetProperties:].cold.3();
        v39 = v42;
        goto LABEL_38;
      }
      v33 = v35;
    }

    v44 = 0;
    objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v34, &v44);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v44;
    if (v40)
    {
      v37 = v40;
      AXLogAudiogram();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v42;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[AIAudiogramIngestionEngine _loadModelFromAssetPath:assetProperties:].cold.2();
    }
    else
    {
      v43 = 0;
      objc_msgSend(MEMORY[0x24BDF9B28], "modelForMLModel:error:", v35, &v43);
      v38 = objc_claimAutoreleasedReturnValue();
      v37 = v43;
      v39 = v42;
      if (v37)
      {
        AXLogAudiogram();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          -[AIAudiogramIngestionEngine _loadModelFromAssetPath:assetProperties:].cold.1();
      }
      else
      {
        -[AIAudiogramIngestionEngine setModel:](self, "setModel:", v38);
        AXLogAudiogram();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22FB4F000, v41, OS_LOG_TYPE_INFO, "Successfully loaded model!", buf, 2u);
        }
      }

    }
LABEL_38:

    goto LABEL_39;
  }
  -[AIAudiogramIngestionEngine _loadV2ModelFromAssetPath:assetProperties:](self, "_loadV2ModelFromAssetPath:assetProperties:", v6, v7);
LABEL_39:

}

- (void)_loadV2ModelFromAssetPath:(id)a3 assetProperties:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  float v34;
  double v35;
  void *v36;
  float v37;
  double v38;
  void *v39;
  float v40;
  double v41;
  void *v42;
  float v43;
  double v44;
  uint64_t v45;
  void *v46;
  __CFString *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  int v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  NSObject *v66;
  void *v67;
  _TtC18AudiogramIngestion27AudiogramGraphDetectorModel *v68;
  double v69;
  _TtC18AudiogramIngestion27AudiogramGraphDetectorModel *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  id v74;
  NSObject *v75;
  _TtC18AudiogramIngestion28AudiogramSymbolDetectorModel *v76;
  double v77;
  _TtC18AudiogramIngestion28AudiogramSymbolDetectorModel *v78;
  void *v79;
  __CFString *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  __CFString *v88;
  id v89;
  id v90;
  uint8_t buf[4];
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKey:", CFSTR("LeftEarACUnmaskedSymbolName"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("x");
  -[AIAudiogramIngestionEngine setLeftEarAirConductionUnmaskedSymbol:](self, "setLeftEarAirConductionUnmaskedSymbol:", v10);

  objc_msgSend(v7, "objectForKey:", CFSTR("LeftEarACMaskedSymbolName"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = CFSTR("square");
  -[AIAudiogramIngestionEngine setLeftEarAirConductionMaskedSymbol:](self, "setLeftEarAirConductionMaskedSymbol:", v13);

  objc_msgSend(v7, "objectForKey:", CFSTR("RightEarACUnmaskedSymbolName"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("o");
  -[AIAudiogramIngestionEngine setRightEarAirConductionUnmaskedSymbol:](self, "setRightEarAirConductionUnmaskedSymbol:", v16);

  objc_msgSend(v7, "objectForKey:", CFSTR("RightEarACMaskedSymbolName"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("triangle");
  -[AIAudiogramIngestionEngine setRightEarAirConductionMaskedSymbol:](self, "setRightEarAirConductionMaskedSymbol:", v19);

  objc_msgSend(v7, "objectForKey:", CFSTR("SymbolNames"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v22 = &unk_24FD778A0;
  if (v20)
    v22 = (void *)v20;
  v23 = v22;

  objc_msgSend(v7, "objectForKey:", CFSTR("CollisionMitigationSymbolNames"));
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  v26 = &unk_24FD778B8;
  if (v24)
    v26 = (void *)v24;
  v87 = v26;

  objc_msgSend(v7, "objectForKey:", CFSTR("SymbolConfidenceThreshold"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v27;
  if (v27)
  {
    objc_msgSend(v27, "floatValue");
    v29 = v28;
  }
  else
  {
    v29 = 1045220557;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("GraphConfidenceThreshold"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v30;
  if (v30)
  {
    objc_msgSend(v30, "floatValue");
    v32 = v31;
  }
  else
  {
    v32 = 1041865114;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("GraphModelInputWidth"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v33;
  if (v33)
  {
    objc_msgSend(v33, "floatValue");
    v35 = v34;
  }
  else
  {
    v35 = 960.0;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("GraphModelInputHeight"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v36;
  if (v36)
  {
    objc_msgSend(v36, "floatValue");
    v38 = v37;
  }
  else
  {
    v38 = 960.0;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("SymbolModelInputWidth"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v39;
  if (v39)
  {
    objc_msgSend(v39, "floatValue");
    v41 = v40;
  }
  else
  {
    v41 = 960.0;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("SymbolModelInputHeight"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v42;
  if (v42)
  {
    objc_msgSend(v42, "floatValue");
    v44 = v43;
  }
  else
  {
    v44 = 960.0;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("GraphModelName"));
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v45;
  v47 = CFSTR("GraphDetector");
  if (v45)
    v47 = (__CFString *)v45;
  v48 = v47;

  objc_msgSend(v7, "objectForKey:", CFSTR("IsGraphModelCompiled"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v49)
    v51 = objc_msgSend(v49, "BOOLValue") ^ 1;
  else
    v51 = 1;
  objc_msgSend(v7, "objectForKey:", CFSTR("SymbolModelName"), v23);
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v52;
  v54 = CFSTR("SymbolDetector");
  if (v52)
    v54 = (__CFString *)v52;
  v88 = v54;

  objc_msgSend(v7, "objectForKey:", CFSTR("IsSymbolModelCompiled"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
    v57 = objc_msgSend(v55, "BOOLValue") ^ 1;
  else
    v57 = 1;
  AXLogAudiogram();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v92 = v7;
    _os_log_impl(&dword_22FB4F000, v58, OS_LOG_TYPE_INFO, "Loading v2 audiogram model properties %@", buf, 0xCu);
  }

  v80 = v48;
  objc_msgSend(v6, "URLByAppendingPathComponent:", v48);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (v51)
  {
    v61 = v6;
    objc_msgSend(v59, "URLByAppendingPathExtension:", CFSTR("mlmodel"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v90 = 0;
    objc_msgSend(MEMORY[0x24BDBFFC8], "compileModelAtURL:error:", v62, &v90);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v90;
    if (v64)
    {
      v65 = v64;
      AXLogAudiogram();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        -[AIAudiogramIngestionEngine _loadV2ModelFromAssetPath:assetProperties:].cold.2();
      v67 = v79;
      goto LABEL_66;
    }
    v60 = v62;
  }
  else
  {
    objc_msgSend(v59, "URLByAppendingPathExtension:", CFSTR("mlmodelc"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v68 = [_TtC18AudiogramIngestion27AudiogramGraphDetectorModel alloc];
  LODWORD(v69) = v32;
  v70 = -[AudiogramGraphDetectorModel initWithModelUrl:modelInputSize:confidenceThreshold:](v68, "initWithModelUrl:modelInputSize:confidenceThreshold:", v63, v35, v38, v69);
  -[AIAudiogramIngestionEngine setGraphModel:](self, "setGraphModel:", v70);

  AXLogAudiogram();
  v71 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FB4F000, v71, OS_LOG_TYPE_INFO, "Successfully loaded graph model!", buf, 2u);
  }

  v61 = v6;
  objc_msgSend(v6, "URLByAppendingPathComponent:", v88);
  v72 = objc_claimAutoreleasedReturnValue();
  v73 = v72;
  if (v57)
  {
    -[NSObject URLByAppendingPathExtension:](v72, "URLByAppendingPathExtension:", CFSTR("mlmodel"));
    v66 = objc_claimAutoreleasedReturnValue();

    v89 = 0;
    objc_msgSend(MEMORY[0x24BDBFFC8], "compileModelAtURL:error:", v66, &v89);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v89;
    if (v74)
    {
      v65 = v74;
      AXLogAudiogram();
      v75 = objc_claimAutoreleasedReturnValue();
      v67 = v79;
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        -[AIAudiogramIngestionEngine _loadV2ModelFromAssetPath:assetProperties:].cold.1();

      goto LABEL_66;
    }
    v73 = v66;
  }
  else
  {
    -[NSObject URLByAppendingPathExtension:](v72, "URLByAppendingPathExtension:", CFSTR("mlmodelc"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v67 = v79;

  v76 = [_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel alloc];
  LODWORD(v77) = v29;
  v78 = -[AudiogramSymbolDetectorModel initWithModelUrl:modelInputSize:confidenceThreshold:classNames:collisionMitigationClassNames:](v76, "initWithModelUrl:modelInputSize:confidenceThreshold:classNames:collisionMitigationClassNames:", v62, v79, v87, v41, v44, v77);
  -[AIAudiogramIngestionEngine setSymbolModel:](self, "setSymbolModel:", v78);

  AXLogAudiogram();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FB4F000, v66, OS_LOG_TYPE_INFO, "Successfully loaded symbol model!", buf, 2u);
  }
  v65 = 0;
LABEL_66:

}

- (void)modelDidUpdate:(id)a3 assetProperties:(id)a4 assetVersion:(unint64_t)a5 withError:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v11)
  {
    AXLogAudiogram();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v11;
      _os_log_impl(&dword_22FB4F000, v12, OS_LOG_TYPE_INFO, "AIAudiogramIngestionEngine failed to download model: %@", (uint8_t *)&v16, 0xCu);
    }

    if (-[AIAudiogramIngestionEngine isRetrievingLatestModelSilently](self, "isRetrievingLatestModelSilently"))
      goto LABEL_12;
    -[AIAudiogramIngestionEngine delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "audiogramIngestionEngineModelDownloadFailed:", v11);
LABEL_11:

LABEL_12:
    -[AIAudiogramIngestionEngine _stopRetrievingLatestModel](self, "_stopRetrievingLatestModel");
    goto LABEL_13;
  }
  AXLogAudiogram();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v9)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_22FB4F000, v15, OS_LOG_TYPE_INFO, "AIAudiogramIngestionEngine finished downloading model", (uint8_t *)&v16, 2u);
    }

    -[AIAudiogramIngestionEngine _loadModelFromAssetPath:assetProperties:](self, "_loadModelFromAssetPath:assetProperties:", v9, v10);
    if (-[AIAudiogramIngestionEngine isRetrievingLatestModelSilently](self, "isRetrievingLatestModelSilently"))
      goto LABEL_12;
    -[AIAudiogramIngestionEngine delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "audiogramIngestionEngineModelDownloadComplete");
    goto LABEL_11;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[AIAudiogramIngestionEngine modelDidUpdate:assetProperties:assetVersion:withError:].cold.1();

LABEL_13:
}

- (void)modelDownloadProgressDidUpdate:(float)a3
{
  NSObject *v5;
  void *v6;
  double v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  AXLogAudiogram();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = (float)(a3 * 100.0);
    _os_log_impl(&dword_22FB4F000, v5, OS_LOG_TYPE_INFO, "AIAudiogramIngestionEngine downloading model %0.1f%%", (uint8_t *)&v8, 0xCu);
  }

  -[AIAudiogramIngestionEngine delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "audiogramIngestionEngineModelDownloadProgressed:", v7);

}

- (id)_textFromAudiogramImage:(id)a3 regionOfInterest:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  _QWORD v30[2];
  CGRect v31;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v30[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)objc_opt_new();
  v10 = objc_alloc_init(MEMORY[0x24BDF9C78]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRecognitionLanguages:", v11);

  objc_msgSend(v10, "setUsesLanguageCorrection:", 1);
  LODWORD(v12) = 0;
  objc_msgSend(v10, "setMinimumTextHeight:", v12);
  objc_msgSend(v10, "setRecognitionLevel:", 0);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  if (!CGRectIsEmpty(v31))
    objc_msgSend(v10, "setRegionOfInterest:", x, y, width, height);
  v13 = objc_alloc(MEMORY[0x24BDF9C28]);
  v14 = (void *)objc_msgSend(v13, "initWithCIImage:options:", v8, MEMORY[0x24BDBD1B8]);

  v30[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v14, "performRequests:error:", v15, &v29);
  v16 = v29;

  if (v16)
  {
    AXLogAudiogram();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[AIAudiogramIngestionEngine _textFromAudiogramImage:regionOfInterest:].cold.1();

    v18 = v9;
  }
  else
  {
    objc_msgSend(v10, "results");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __71__AIAudiogramIngestionEngine__textFromAudiogramImage_regionOfInterest___block_invoke;
    v23[3] = &unk_24FD6CF58;
    v25 = x;
    v26 = y;
    v27 = width;
    v28 = height;
    v20 = v9;
    v24 = v20;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v23);

    v21 = v20;
  }

  return v9;
}

void __71__AIAudiogramIngestionEngine__textFromAudiogramImage_regionOfInterest___block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  id v4;
  _QWORD v5[4];
  id v6;
  __int128 v7;
  __int128 v8;

  objc_msgSend(a2, "blocksWithTypes:inRegion:", 16, 0.0, 0.0, 1.0, 1.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__AIAudiogramIngestionEngine__textFromAudiogramImage_regionOfInterest___block_invoke_2;
  v5[3] = &unk_24FD6CF30;
  v3 = *(_OWORD *)(a1 + 56);
  v7 = *(_OWORD *)(a1 + 40);
  v8 = v3;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __71__AIAudiogramIngestionEngine__textFromAudiogramImage_regionOfInterest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  BOOL IsEmpty;
  AIRecognizedText *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    IsEmpty = CGRectIsEmpty(*(CGRect *)(a1 + 40));
    v6 = [AIRecognizedText alloc];
    if (IsEmpty)
      v7 = -[AIRecognizedText initWithTextObservation:](v6, "initWithTextObservation:", v4);
    else
      v7 = -[AIRecognizedText initWithTextObservation:regionOfInterest:](v6, "initWithTextObservation:regionOfInterest:", v4, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v8 = (void *)v7;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    AXLogAudiogram();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __71__AIAudiogramIngestionEngine__textFromAudiogramImage_regionOfInterest___block_invoke_2_cold_1();

  }
}

- (id)_observationsFromCIImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AIAudiogramIngestionEngine model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDF9B30]);
    -[AIAudiogramIngestionEngine model](self, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithModel:", v7);

    v9 = objc_alloc(MEMORY[0x24BDF9C28]);
    v10 = (void *)objc_msgSend(v9, "initWithCIImage:options:", v4, MEMORY[0x24BDBD1B8]);
    v17[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v10, "performRequests:error:", v11, &v16);
    v12 = v16;

    if (v12)
    {
      AXLogAudiogram();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[AIAudiogramIngestionEngine _observationsFromCIImage:].cold.2();

      v14 = (void *)MEMORY[0x24BDBD1A8];
    }
    else
    {
      objc_msgSend(v8, "results");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    AXLogAudiogram();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AIAudiogramIngestionEngine _observationsFromCIImage:].cold.1();
    v14 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v14;
}

- (id)_cropEdgesFromImage:(id)a3 graphRect:(CGRect)a4 symbolsRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  NSObject *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  NSObject *v36;
  void *v37;
  double v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  double v44;
  double v45;
  double MaxX;
  double MinY;
  double MinX;
  double v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  CGFloat rect;
  double MaxY;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.size.height;
  v10 = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v60 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = (void *)objc_opt_new();
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  v80.origin.x = v12;
  v80.origin.y = v11;
  v80.size.width = v10;
  v80.size.height = v9;
  if (!CGRectIntersectsRect(v61, v80))
  {
    AXLogAudiogram();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v78.origin.x = x;
      v78.origin.y = y;
      v78.size.width = width;
      v78.size.height = height;
      NSStringFromCGRect(v78);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v79.origin.x = v12;
      v79.origin.y = v11;
      v79.size.width = v10;
      v79.size.height = v9;
      NSStringFromCGRect(v79);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v57 = v41;
      v58 = 2112;
      v59 = v42;
      _os_log_impl(&dword_22FB4F000, v40, OS_LOG_TYPE_INFO, "No valid crops from rects: %@ %@", buf, 0x16u);

      goto LABEL_23;
    }
LABEL_24:

    goto LABEL_25;
  }
  objc_msgSend(v13, "extent");
  v53 = v15;
  objc_msgSend(v13, "extent");
  v52 = v16;
  v62.origin.x = v12;
  v62.origin.y = v11;
  v62.size.width = v10;
  v62.size.height = v9;
  MinX = CGRectGetMinX(v62);
  v63.origin.x = v12;
  v63.origin.y = v11;
  v63.size.width = v10;
  v63.size.height = v9;
  MaxX = CGRectGetMaxX(v63);
  v64.origin.x = v12;
  v64.origin.y = v11;
  v64.size.width = v10;
  v64.size.height = v9;
  MinY = CGRectGetMinY(v64);
  v65.origin.x = v12;
  v50 = v9;
  v51 = v11;
  v65.origin.y = v11;
  rect = v10;
  v65.size.width = v10;
  v65.size.height = v9;
  MaxY = CGRectGetMaxY(v65);
  v66.origin.x = x;
  v66.origin.y = y;
  v66.size.width = width;
  v66.size.height = height;
  v17 = CGRectGetMinX(v66);
  v67.origin.x = x;
  v67.origin.y = y;
  v67.size.width = width;
  v67.size.height = height;
  v18 = CGRectGetMaxX(v67);
  v68.origin.x = x;
  v68.origin.y = y;
  v68.size.width = width;
  v68.size.height = height;
  v45 = CGRectGetMinY(v68);
  v69.origin.x = x;
  v69.origin.y = y;
  v19 = MinX;
  v69.size.width = width;
  v69.size.height = height;
  v20 = CGRectGetMaxY(v69);
  v21 = MaxX;
  v44 = v20;
  if (MinX < v17 && MaxX > v17)
  {
    v70.origin.x = v12;
    v70.size.height = v50;
    v70.origin.y = v51;
    v70.size.width = rect;
    v22 = CGRectGetHeight(v70) / v53;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", MinX / v52, MinY / v53, (v17 - MinX) / v52, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v23);

    AXLogAudiogram();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v71.origin.x = MinX / v52;
      v71.origin.y = MinY / v53;
      v71.size.width = (v17 - MinX) / v52;
      v71.size.height = v22;
      NSStringFromCGRect(v71);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v57 = v25;
      _os_log_impl(&dword_22FB4F000, v24, OS_LOG_TYPE_INFO, "Cropped left edge: %@", buf, 0xCu);

    }
    v19 = MinX;
    v20 = v44;
    v21 = MaxX;
  }
  if (v19 < v18 && v21 > v18)
  {
    v26 = v18 / v52;
    v27 = (v21 - v18) / v52;
    v72.origin.x = v12;
    v72.origin.y = v51;
    v72.size.width = rect;
    v72.size.height = v50;
    v28 = CGRectGetHeight(v72) / v53;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v26, MinY / v53, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v29);

    AXLogAudiogram();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v73.origin.x = v26;
      v73.origin.y = MinY / v53;
      v73.size.width = v27;
      v73.size.height = v28;
      NSStringFromCGRect(v73);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v57 = v31;
      _os_log_impl(&dword_22FB4F000, v30, OS_LOG_TYPE_INFO, "Cropped right edge: %@", buf, 0xCu);

    }
    v20 = v44;
  }
  if (MinY < v20 && MaxY > v20)
  {
    v32 = v20 / v53;
    v49 = v12;
    v74.origin.x = v12;
    v33 = v20;
    v74.origin.y = v51;
    v74.size.width = rect;
    v74.size.height = v50;
    v34 = CGRectGetWidth(v74) / v52;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v19 / v52, v32, v34, (MaxY - v33) / v53);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v35);

    AXLogAudiogram();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v75.origin.x = v19 / v52;
      v75.origin.y = v32;
      v75.size.width = v34;
      v75.size.height = (MaxY - v33) / v53;
      NSStringFromCGRect(v75);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v57 = v37;
      _os_log_impl(&dword_22FB4F000, v36, OS_LOG_TYPE_INFO, "Cropped top edge: %@", buf, 0xCu);

    }
    v12 = v49;
  }
  if (MinY < v45 && MaxY > v45)
  {
    v76.origin.x = v12;
    v76.origin.y = v51;
    v76.size.width = rect;
    v76.size.height = v50;
    v38 = CGRectGetWidth(v76) / v52;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v19 / v52, MinY / v53, v38, (v45 - MinY) / v53);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v39);

    AXLogAudiogram();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v77.origin.x = v19 / v52;
      v77.origin.y = MinY / v53;
      v77.size.width = v38;
      v77.size.height = (v45 - MinY) / v53;
      NSStringFromCGRect(v77);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v57 = v41;
      _os_log_impl(&dword_22FB4F000, v40, OS_LOG_TYPE_INFO, "Cropped bottom edge: %@", buf, 0xCu);
LABEL_23:

      goto LABEL_24;
    }
    goto LABEL_24;
  }
LABEL_25:

  return v14;
}

- (id)_rectsOfSymbolsFromImage:(id)a3 objectData:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  unint64_t v19;
  const char *v20;
  double v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  NSObject *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  NSObject *v50;
  void *v51;
  double v52;
  CGFloat x;
  CGFloat y;
  CGFloat v55;
  CGFloat height;
  NSObject *v57;
  void *v58;
  void *v59;
  const char *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  id v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  double Width;
  double v77;
  double v78;
  _QWORD v79[5];
  id v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[5];
  _QWORD v84[5];
  uint8_t buf[4];
  id v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  _QWORD v91[5];
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  v91[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "extent");
  v9 = v8;
  v70 = v6;
  objc_msgSend(v6, "extent");
  v11 = v10;
  v12 = (void *)objc_msgSend(v7, "mutableCopy");
  v69 = v7;
  v13 = (void *)objc_msgSend(v7, "mutableCopy");
  v14 = MEMORY[0x24BDAC760];
  v84[0] = MEMORY[0x24BDAC760];
  v84[1] = 3221225472;
  v84[2] = __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke;
  v84[3] = &unk_24FD6CF80;
  v84[4] = self;
  objc_msgSend(v12, "ax_removeObjectsFromArrayUsingBlock:", v84);
  v83[0] = v14;
  v83[1] = 3221225472;
  v83[2] = __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_2;
  v83[3] = &unk_24FD6CF80;
  v83[4] = self;
  objc_msgSend(v13, "ax_removeObjectsFromArrayUsingBlock:", v83);
  v15 = (void *)objc_opt_new();
  v67 = v13;
  v68 = v12;
  v91[0] = v12;
  v91[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v91, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v14;
  v79[1] = 3221225472;
  v79[2] = __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_3;
  v79[3] = &unk_24FD6D020;
  v79[4] = self;
  v81 = v9;
  v82 = v11;
  v17 = v15;
  v80 = v17;
  v66 = v16;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v79);
  AXLogAudiogram();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v86 = v17;
    _os_log_impl(&dword_22FB4F000, v18, OS_LOG_TYPE_INFO, "Uncombined symbol rects %@", buf, 0xCu);
  }

  if (objc_msgSend(v17, "count"))
  {
    v19 = 0;
    v20 = "RectB %@";
    v21 = 0.5;
    do
    {
      objc_msgSend(v17, "objectAtIndex:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "symbolsRect");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      soft_AX_CGRectGetCenter(v23, v25, v27, v29);
      v77 = v32;
      v78 = v31;
      v74 = v26;
      v75 = v24;
      v92.origin.x = v24;
      v92.origin.y = v26;
      v72 = v30;
      v73 = v28;
      v92.size.width = v28;
      v92.size.height = v30;
      Width = CGRectGetWidth(v92);
      AXLogAudiogram();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v93.origin.y = v26;
        v93.origin.x = v24;
        v93.size.height = v30;
        v93.size.width = v28;
        NSStringFromCGRect(v93);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v86 = v34;
        _os_log_impl(&dword_22FB4F000, v33, OS_LOG_TYPE_INFO, "RectA %@", buf, 0xCu);

      }
      v71 = v19 + 1;
      if (objc_msgSend(v17, "count") > v19 + 1)
      {
        v35 = v19 + 1;
        do
        {
          objc_msgSend(v17, "objectAtIndex:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "symbolsRect");
          v38 = v37;
          v40 = v39;
          v42 = v41;
          v44 = v43;

          soft_AX_CGRectGetCenter(v38, v40, v42, v44);
          v46 = v45;
          v48 = v47;
          v94.origin.x = v38;
          v94.origin.y = v40;
          v94.size.width = v42;
          v94.size.height = v44;
          v49 = CGRectGetWidth(v94);
          AXLogAudiogram();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            v95.origin.x = v38;
            v95.origin.y = v40;
            v95.size.width = v42;
            v95.size.height = v44;
            NSStringFromCGRect(v95);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v86 = v51;
            _os_log_impl(&dword_22FB4F000, v50, OS_LOG_TYPE_INFO, v20, buf, 0xCu);

          }
          if (Width >= v49)
            v49 = Width;
          soft_AX_CGPointGetDistanceToPoint(v78, v77, v46, v48);
          if (v52 < v49 * v21)
          {
            v96.origin.y = v74;
            v96.origin.x = v75;
            v96.size.height = v72;
            v96.size.width = v73;
            v101.origin.x = v38;
            v101.origin.y = v40;
            v101.size.width = v42;
            v101.size.height = v44;
            v97 = CGRectUnion(v96, v101);
            x = v97.origin.x;
            y = v97.origin.y;
            v55 = v97.size.width;
            height = v97.size.height;
            objc_msgSend(v22, "setSymbolsRect:");
            objc_msgSend(v17, "removeObjectAtIndex:", v35);
            AXLogAudiogram();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
            {
              v98.origin.y = v74;
              v98.origin.x = v75;
              v98.size.height = v72;
              v98.size.width = v73;
              NSStringFromCGRect(v98);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v99.origin.x = v38;
              v99.origin.y = v40;
              v99.size.width = v42;
              v99.size.height = v44;
              NSStringFromCGRect(v99);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v100.origin.x = x;
              v100.origin.y = y;
              v100.size.width = v55;
              v100.size.height = height;
              NSStringFromCGRect(v100);
              v60 = v20;
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v86 = v58;
              v87 = 2112;
              v88 = v59;
              v89 = 2112;
              v90 = v61;
              _os_log_impl(&dword_22FB4F000, v57, OS_LOG_TYPE_INFO, "Combining two symbol rects into one %@ + %@ = %@", buf, 0x20u);

              v20 = v60;
            }
            --v35;

            v21 = 0.5;
          }
          ++v35;
        }
        while (v35 < objc_msgSend(v17, "count"));
      }

      v19 = v71;
    }
    while (objc_msgSend(v17, "count") > v71);
  }
  AXLogAudiogram();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v86 = v17;
    _os_log_impl(&dword_22FB4F000, v62, OS_LOG_TYPE_INFO, "All symbol rects %@", buf, 0xCu);
  }

  v63 = v80;
  v64 = v17;

  return v64;
}

uint64_t __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(v3, "labels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "confidence");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "modelLabelConfidenceThreshold");
  if (v7 <= v8)
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(v3, "labels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "modelLabelLeftEarSymbol");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12) ^ 1;

  }
  return v13;
}

uint64_t __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(v3, "labels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "confidence");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "modelLabelConfidenceThreshold");
  if (v7 <= v8)
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(v3, "labels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "modelLabelRightEarSymbol");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12) ^ 1;

  }
  return v13;
}

void __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  _QWORD v25[8];
  uint64_t v26;
  double *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  unint64_t v37;
  uint8_t buf[8];
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[9];
  _QWORD v43[4];
  id v44;
  id v45;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_opt_new();
    v6 = MEMORY[0x24BDAC760];
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_4;
    v43[3] = &unk_24FD6CFA8;
    v7 = v4;
    v44 = v7;
    v8 = v5;
    v45 = v8;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v43);
    objc_msgSend(*(id *)(a1 + 32), "_stddevFromNumbers:", v7);
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "_stddevFromNumbers:", v8);
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "_meanFromNumbers:", v7);
    v14 = v13;
    objc_msgSend(*(id *)(a1 + 32), "_meanFromNumbers:", v8);
    v16 = v15;
    AXLogAudiogram();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FB4F000, v17, OS_LOG_TYPE_INFO, "Unfiltered ear object data:", buf, 2u);
    }

    v42[0] = v6;
    v42[1] = 3221225472;
    v42[2] = __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_154;
    v42[3] = &unk_24FD6CFD0;
    v42[4] = *(_QWORD *)(a1 + 32);
    v42[5] = v14;
    v42[6] = v10;
    v42[7] = v16;
    v42[8] = v12;
    objc_msgSend(v3, "ax_removeObjectsFromArrayUsingBlock:", v42);
    if (objc_msgSend(v3, "count"))
    {
      *(_QWORD *)buf = 0;
      v39 = buf;
      v40 = 0x2020000000;
      v41 = 0x4000000000000000;
      v34 = 0;
      v35 = (double *)&v34;
      v36 = 0x2020000000;
      v37 = 0xBFF0000000000000;
      v30 = 0;
      v31 = (double *)&v30;
      v32 = 0x2020000000;
      v33 = 0x4000000000000000;
      v26 = 0;
      v27 = (double *)&v26;
      v28 = 0x2020000000;
      v29 = 0xBFF0000000000000;
      v25[0] = v6;
      v25[1] = 3221225472;
      v25[2] = __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_155;
      v25[3] = &unk_24FD6CFF8;
      v25[4] = buf;
      v25[5] = &v30;
      v25[6] = &v34;
      v25[7] = &v26;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v25);
      v18 = *((double *)v39 + 3);
      v19 = v31[3];
      v21 = *(double *)(a1 + 48);
      v20 = *(double *)(a1 + 56);
      v22 = v35[3];
      v23 = v27[3];
      v24 = (void *)objc_opt_new();
      objc_msgSend(v24, "setSymbolsRect:", v18 * v21, v19 * v20, v21 * (v22 - v18), v20 * (v23 - v19));
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v24);

      _Block_object_dispose(&v26, 8);
      _Block_object_dispose(&v30, 8);
      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(buf, 8);
    }

  }
}

void __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  id v17;
  CGRect v18;
  CGRect v19;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a2;
  objc_msgSend(v5, "boundingBox");
  objc_msgSend(v4, "numberWithDouble:", CGRectGetMidX(v18));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = *(void **)(a1 + 40);
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "boundingBox");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v19.origin.x = v10;
  v19.origin.y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  objc_msgSend(v8, "numberWithDouble:", CGRectGetMidY(v19));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v17);

}

uint64_t __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_154(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  double v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  int v22;
  void *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "boundingBox");
  objc_msgSend(v4, "_zScoreFromNumber:mean:stddev:", CGRectGetMidX(v33), *(double *)(a1 + 40), *(double *)(a1 + 48));
  v6 = v5;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v3, "boundingBox");
  objc_msgSend(v7, "_zScoreFromNumber:mean:stddev:", CGRectGetMidY(v34), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v9 = v8;
  AXLogAudiogram();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "labels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "labels");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "confidence");
    v17 = v16;
    objc_msgSend(v3, "boundingBox");
    NSStringFromCGRect(v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138413314;
    v23 = v13;
    v24 = 2048;
    v25 = v17;
    v26 = 2048;
    v27 = v6;
    v28 = 2048;
    v29 = v9;
    v30 = 2112;
    v31 = v18;
    _os_log_impl(&dword_22FB4F000, v10, OS_LOG_TYPE_INFO, "Ear %@ %0.3f z-score=%0.3f,%0.3f %@", (uint8_t *)&v22, 0x34u);

  }
  v19 = fabs(v6) > 1.75;
  v20 = fabs(v9) > 1.75 || v19;

  return v20;
}

void __66__AIAudiogramIngestionEngine__rectsOfSymbolsFromImage_objectData___block_invoke_155(_QWORD *a1, void *a2)
{
  id v3;
  double MinX;
  double MaxX;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v3 = a2;
  objc_msgSend(v3, "boundingBox");
  MinX = CGRectGetMinX(v23);
  objc_msgSend(v3, "boundingBox");
  MaxX = CGRectGetMaxX(v24);
  objc_msgSend(v3, "boundingBox");
  v6 = 1.0 - CGRectGetMaxY(v25);
  objc_msgSend(v3, "boundingBox");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  v15 = 1.0 - CGRectGetMinY(v26);
  v16 = *(_QWORD *)(a1[4] + 8);
  v17 = *(double *)(v16 + 24);
  if (v17 >= MinX)
    v17 = MinX;
  *(double *)(v16 + 24) = v17;
  v18 = *(_QWORD *)(a1[5] + 8);
  v19 = *(double *)(v18 + 24);
  if (v19 >= v6)
    v19 = v6;
  *(double *)(v18 + 24) = v19;
  v20 = *(_QWORD *)(a1[6] + 8);
  v21 = *(double *)(v20 + 24);
  if (v21 < MaxX)
    v21 = MaxX;
  *(double *)(v20 + 24) = v21;
  v22 = *(_QWORD *)(a1[7] + 8);
  if (*(double *)(v22 + 24) >= v15)
    v15 = *(double *)(v22 + 24);
  *(double *)(v22 + 24) = v15;
}

- (id)_rectsOfGraphFromImage:(id)a3 objectData:(id)a4
{
  id v6;
  id v7;
  CGFloat Width;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat Height;
  void *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  CGFloat v25;
  CGFloat v26;
  CGRect v27;
  CGRect v28;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "extent");
  Width = CGRectGetWidth(v27);
  objc_msgSend(v7, "extent");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v28.origin.x = v10;
  v28.origin.y = v12;
  v28.size.width = v14;
  v28.size.height = v16;
  Height = CGRectGetHeight(v28);
  v18 = (void *)objc_opt_new();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __64__AIAudiogramIngestionEngine__rectsOfGraphFromImage_objectData___block_invoke;
  v23[3] = &unk_24FD6D048;
  v23[4] = self;
  v25 = Width;
  v26 = Height;
  v19 = v18;
  v24 = v19;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v23);

  v20 = v24;
  v21 = v19;

  return v21;
}

void __64__AIAudiogramIngestionEngine__rectsOfGraphFromImage_objectData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  CGRect v26;
  CGRect v27;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "labels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "confidence");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "modelLabelConfidenceThreshold");
  if (v7 <= v8)
  {

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v3, "labels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "modelLabelGraph");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (v13)
  {
    objc_msgSend(v3, "boundingBox");
    v15 = *(double *)(a1 + 48) * v14;
    objc_msgSend(v3, "boundingBox");
    v16 = (1.0 - CGRectGetMaxY(v26)) * *(double *)(a1 + 56);
    objc_msgSend(v3, "boundingBox");
    v18 = *(double *)(a1 + 48) * v17;
    objc_msgSend(v3, "boundingBox");
    v20 = *(double *)(a1 + 56) * v19;
    AXLogAudiogram();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v27.origin.x = v15;
      v27.origin.y = v16;
      v27.size.width = v18;
      v27.size.height = v20;
      NSStringFromCGRect(v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v22;
      _os_log_impl(&dword_22FB4F000, v21, OS_LOG_TYPE_INFO, "Found graph %@", (uint8_t *)&v23, 0xCu);

    }
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setGraphRect:", v15, v16, v18, v20);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    goto LABEL_7;
  }
LABEL_8:

}

- (id)_cropResultsFromImage:(id)a3 observations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AIAudiogramIngestionEngine _rectsOfGraphFromImage:objectData:](self, "_rectsOfGraphFromImage:objectData:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIngestionEngine _rectsOfSymbolsFromImage:objectData:](self, "_rectsOfSymbolsFromImage:objectData:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  v11 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __65__AIAudiogramIngestionEngine__cropResultsFromImage_observations___block_invoke;
  v22[3] = &unk_24FD6D098;
  v12 = v9;
  v23 = v12;
  v13 = v10;
  v24 = v13;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v22);
  objc_msgSend(v13, "addObjectsFromArray:", v12);
  AXLogAudiogram();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v13;
    _os_log_impl(&dword_22FB4F000, v14, OS_LOG_TYPE_INFO, "Crop rects %@", buf, 0xCu);
  }

  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __65__AIAudiogramIngestionEngine__cropResultsFromImage_observations___block_invoke_160;
  v20[3] = &unk_24FD6D098;
  v20[4] = self;
  v21 = v6;
  v15 = v6;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v20);
  AXLogAudiogram();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[AIAudiogramIngestionEngine _cropResultsFromImage:observations:].cold.1();

  v17 = v21;
  v18 = v13;

  return v18;
}

void __65__AIAudiogramIngestionEngine__cropResultsFromImage_observations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[12];
  _QWORD v18[4];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v3 = a2;
  objc_msgSend(v3, "graphRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  soft_AX_CGRectGetCenter(v4, v6, v8, v10);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v12 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __65__AIAudiogramIngestionEngine__cropResultsFromImage_observations___block_invoke_158;
  v17[3] = &unk_24FD6D070;
  *(double *)&v17[6] = v5;
  *(double *)&v17[7] = v7;
  *(double *)&v17[8] = v9;
  *(double *)&v17[9] = v11;
  v17[10] = v13;
  v17[11] = v14;
  v17[4] = &v19;
  v17[5] = v18;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setGraphRect:", v5, v7, v9, v11);
  v16 = (void *)v20[5];
  if (v16)
  {
    objc_msgSend(v16, "symbolsRect");
    objc_msgSend(v15, "setSymbolsRect:");
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v20[5]);
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);

}

void __65__AIAudiogramIngestionEngine__cropResultsFromImage_observations___block_invoke_158(uint64_t a1, void *a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  id *v15;
  uint64_t v16;
  id v17;
  CGPoint v18;

  v17 = a2;
  objc_msgSend(v17, "symbolsRect");
  soft_AX_CGRectGetCenter(v4, v5, v6, v7);
  v9 = v8;
  v11 = v10;
  v18.x = v8;
  v18.y = v10;
  if (CGRectContainsPoint(*(CGRect *)(a1 + 48), v18))
  {
    soft_AX_CGPointGetDistanceToPoint(v9, v11, *(double *)(a1 + 80), *(double *)(a1 + 88));
    v13 = v12;
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(_QWORD *)(v14 + 40);
    v15 = (id *)(v14 + 40);
    if (!v16 || v12 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_storeStrong(v15, a2);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v13;
    }
  }

}

void __65__AIAudiogramIngestionEngine__cropResultsFromImage_observations___block_invoke_160(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  int v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "graphRect");
  if (CGRectIsEmpty(v51))
  {
    objc_msgSend(v3, "symbolsRect");
    if (!CGRectIsEmpty(v52))
    {
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v3, "symbolsRect");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      objc_msgSend(v3, "symbolsRect");
      v13 = CGRectGetHeight(v53) * -1.5;
      objc_msgSend(v3, "symbolsRect");
      v14 = CGRectGetWidth(v54) * -1.5;
      objc_msgSend(*(id *)(a1 + 40), "extent");
      objc_msgSend(v4, "_shrinkRect:width:height:insideBounds:", v6, v8, v10, v12, v13, v14, v15, v16);
      objc_msgSend(v3, "setGraphRect:");
      AXLogAudiogram();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "symbolsRect");
        NSStringFromCGRect(v55);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "graphRect");
        NSStringFromCGRect(v56);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138412546;
        v47 = v18;
        v48 = 2112;
        v49 = v19;
        _os_log_impl(&dword_22FB4F000, v17, OS_LOG_TYPE_INFO, "No graph rect found. Building from symbols rect: %@ -> %@", (uint8_t *)&v46, 0x16u);

      }
    }
  }
  objc_msgSend(v3, "graphRect");
  if (!CGRectIsEmpty(v57))
  {
    v20 = *(void **)(a1 + 32);
    objc_msgSend(v3, "graphRect");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v3, "graphRect");
    v29 = CGRectGetWidth(v58) * -0.75;
    objc_msgSend(v3, "graphRect");
    v30 = CGRectGetHeight(v59) * -0.75;
    objc_msgSend(*(id *)(a1 + 40), "extent");
    objc_msgSend(v20, "_shrinkRect:width:height:insideBounds:", v22, v24, v26, v28, v29, v30, v31, v32);
    objc_msgSend(v3, "setGraphRect:");
  }
  objc_msgSend(v3, "symbolsRect");
  if (!CGRectIsEmpty(v60))
  {
    v33 = *(void **)(a1 + 32);
    objc_msgSend(v3, "symbolsRect");
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    objc_msgSend(v3, "symbolsRect");
    v42 = CGRectGetWidth(v61) * 0.1;
    objc_msgSend(v3, "symbolsRect");
    v43 = CGRectGetHeight(v62) * 0.1;
    objc_msgSend(*(id *)(a1 + 40), "extent");
    objc_msgSend(v33, "_shrinkRect:width:height:insideBounds:", v35, v37, v39, v41, v42, v43, v44, v45);
    objc_msgSend(v3, "setSymbolsRect:");
  }

}

- (CGRect)_shrinkRect:(CGRect)a3 width:(double)a4 height:(double)a5 insideBounds:(CGSize)a6
{
  double height;
  double width;
  double x;
  double y;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  height = a6.height;
  width = a6.width;
  v18 = CGRectInset(a3, a4 * 0.5, a5 * 0.5);
  x = v18.origin.x;
  y = v18.origin.y;
  v12 = v18.size.width;
  v13 = v18.size.height;
  if (a4 < 0.0)
  {
    if (CGRectGetMinX(v18) < 0.0)
      x = 0.0;
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = v12;
    v19.size.height = v13;
    if (CGRectGetMaxX(v19) > width)
    {
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = v12;
      v20.size.height = v13;
      v12 = width - CGRectGetMinX(v20);
    }
  }
  if (a5 < 0.0)
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = v12;
    v21.size.height = v13;
    if (CGRectGetMinY(v21) < 0.0)
      y = 0.0;
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = v12;
    v22.size.height = v13;
    if (CGRectGetMaxY(v22) > height)
    {
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = v12;
      v23.size.height = v13;
      v13 = height - CGRectGetMinY(v23);
    }
  }
  v14 = x;
  v15 = y;
  v16 = v12;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)_audiogramMapFromRecognizedText:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  AIAudiogramMap *v10;
  AIAudiogramMap *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[AIAudiogramIngestionEngine _formatNumbersFromRecognizedText:](self, "_formatNumbersFromRecognizedText:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIngestionEngine _groupNumbersByAxisFromRecognizedText:](self, "_groupNumbersByAxisFromRecognizedText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__AIAudiogramIngestionEngine__audiogramMapFromRecognizedText___block_invoke;
  v13[3] = &unk_24FD6D0C0;
  v13[4] = &v20;
  v13[5] = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);
  AXLogAudiogram();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v21[5];
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl(&dword_22FB4F000, v6, OS_LOG_TYPE_DEFAULT, "Found X Axis Group: %@", buf, 0xCu);
  }

  AXLogAudiogram();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v15[5];
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl(&dword_22FB4F000, v8, OS_LOG_TYPE_DEFAULT, "Found Y Axis Group: %@", buf, 0xCu);
  }

  if (v21[5] && v15[5])
  {
    v10 = [AIAudiogramMap alloc];
    v11 = -[AIAudiogramMap initWithFrequencies:hearingLevels:](v10, "initWithFrequencies:hearingLevels:", v21[5], v15[5]);
  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __62__AIAudiogramIngestionEngine__audiogramMapFromRecognizedText___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "axis"))
    v4 = *(_QWORD *)(a1 + 40);
  else
    v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (id)_formatNumbersFromRecognizedText:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "characterSetWithCharactersInString:", CFSTR("0123456789,.-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("kK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__AIAudiogramIngestionEngine__formatNumbersFromRecognizedText___block_invoke;
  v14[3] = &unk_24FD6D0E8;
  v15 = v5;
  v16 = v6;
  v8 = v7;
  v17 = v8;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v14);

  v11 = v17;
  v12 = v8;

  return v12;
}

void __63__AIAudiogramIngestionEngine__formatNumbersFromRecognizedText___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  uint64_t v10;
  id v11;
  int v12;
  uint64_t v13;
  id v14;
  int v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  void *v24;
  int v25;
  float v26;
  float v27;
  int v28;
  float v29;
  void *v30;
  uint64_t v31;
  double v32;
  double Width;
  double v34;
  double MidX;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  AIRecognizedText *v46;
  AIRecognizedText *v47;
  NSObject *v48;
  double v49;
  AIRecognizedText *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  id v57;
  CGRect v58;
  CGRect v59;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDD17A8];
  objc_msgSend(v3, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedScannerWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 32);
  v57 = 0;
  objc_msgSend(v6, "scanUpToCharactersFromSet:intoString:", v7, &v57);
  v8 = v57;
  v9 = objc_msgSend(v8, "length");
  v10 = *(_QWORD *)(a1 + 32);
  v56 = 0;
  objc_msgSend(v6, "scanCharactersFromSet:intoString:", v10, &v56);
  v11 = v56;
  v12 = objc_msgSend(v11, "length");
  v13 = *(_QWORD *)(a1 + 40);
  v55 = 0;
  objc_msgSend(v6, "scanCharactersFromSet:intoString:", v13, &v55);
  v14 = v55;
  v15 = objc_msgSend(v14, "length") + v12;
  if (v15)
  {
    objc_msgSend(v3, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsString:", CFSTR("d8"));

    if ((v17 & 1) == 0)
    {
      v19 = objc_msgSend(v11, "hasPrefix:", CFSTR("-"));
      objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_24FD6E4F8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v18, "length"))
        goto LABEL_32;
      if (v19)
      {
        objc_msgSend(CFSTR("-"), "stringByAppendingString:", v18);
        v20 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v20;
      }
      if (objc_msgSend(v18, "containsString:", CFSTR(","))
        && (v21 = objc_msgSend(v18, "rangeOfString:", CFSTR(",")),
            (unint64_t)(objc_msgSend(v18, "length") - v21) >= 3))
      {
        v22 = v9;
        objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), &stru_24FD6E4F8);
        v23 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v23;
      }
      else
      {
        v22 = v9;
      }
      v53 = objc_msgSend(v18, "integerValue");
      objc_msgSend(v14, "lowercaseString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("k"));

      if (v25)
      {
        if (objc_msgSend(v18, "containsString:", CFSTR(".")))
        {
          objc_msgSend(v18, "floatValue");
          v53 = (uint64_t)(float)(v26 * 1000.0);
        }
        else
        {
          v53 *= 1000;
        }
      }
      objc_msgSend(v18, "floatValue");
      if (v27 <= 0.0)
      {
        v28 = v22;
      }
      else
      {
        v28 = v22;
        if (v53 <= 9 && v53 != 5 && !objc_msgSend(v8, "length") && !objc_msgSend(v14, "length"))
        {
          objc_msgSend(v18, "floatValue");
          v53 = (uint64_t)(float)(v29 * 1000.0);
        }
      }
      if (v28
        || (objc_msgSend(v3, "string"),
            v30 = (void *)objc_claimAutoreleasedReturnValue(),
            v31 = objc_msgSend(v30, "length"),
            v30,
            v28 = 0,
            v15 != v31))
      {
        v54 = 0;
        objc_msgSend(v3, "boundingBoxForRange:error:", v28, v15, &v54);
        v39 = v38;
        v41 = v40;
        v43 = v42;
        v45 = v44;
        v46 = (AIRecognizedText *)v54;
        if (v46)
        {
          v47 = v46;
          AXLogAudiogram();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            __63__AIAudiogramIngestionEngine__formatNumbersFromRecognizedText___block_invoke_cold_1();

          goto LABEL_31;
        }
        v58.origin.x = v39;
        v58.origin.y = v41;
        v58.size.width = v43;
        v58.size.height = v45;
        MidX = CGRectGetMidX(v58);
        objc_msgSend(v3, "center");
        v37 = v49;
        v59.origin.x = v39;
        v59.origin.y = v41;
        v59.size.width = v43;
        v59.size.height = v45;
        Width = CGRectGetWidth(v59);
      }
      else
      {
        objc_msgSend(v3, "width");
        Width = v32;
        objc_msgSend(v3, "center");
        MidX = v34;
        v37 = v36;
      }
      v50 = [AIRecognizedText alloc];
      objc_msgSend(v3, "string");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v53);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[AIRecognizedText initWithString:center:width:numericalValue:](v50, "initWithString:center:width:numericalValue:", v51, v52, MidX, v37, Width);

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v47);
LABEL_31:

      goto LABEL_32;
    }
  }
  v18 = v11;
LABEL_32:

}

- (id)_groupNumbersByAxisFromRecognizedText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[7];
  _QWORD v18[7];
  _QWORD v19[4];
  _QWORD v20[4];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;

  v4 = a3;
  objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_2;
  v33[3] = &unk_24FD6D0E8;
  v9 = v5;
  v34 = v9;
  v35 = v6;
  v36 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v33);
  -[AIAudiogramIngestionEngine _removeDuplicateSetsFromTextSets:](self, "_removeDuplicateSetsFromTextSets:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AIAudiogramIngestionEngine _removeDuplicateSetsFromTextSets:](self, "_removeDuplicateSetsFromTextSets:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2;
  v31 = __Block_byref_object_dispose__2;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_4;
  v18[3] = &unk_24FD6D1A0;
  v18[4] = self;
  v18[5] = v20;
  v18[6] = &v27;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v18);
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_185;
  v17[3] = &unk_24FD6D1A0;
  v17[4] = self;
  v17[5] = v19;
  v17[6] = &v21;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);
  v14 = (void *)objc_opt_new();
  v15 = v14;
  if (v28[5])
    objc_msgSend(v14, "addObject:");
  if (v22[5])
    objc_msgSend(v15, "addObject:");
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v15;
}

BOOL __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "numericalValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_3;
  v12[3] = &unk_24FD6D150;
  v16 = a3;
  v11 = v5;
  v13 = v11;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "addObject:", v11);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "addObject:", v11);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
  }

}

void __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;

  v5 = a2;
  if (*(_QWORD *)(a1 + 56) != a3)
  {
    v24 = v5;
    objc_msgSend(*(id *)(a1 + 32), "center");
    v7 = v6;
    objc_msgSend(v24, "center");
    if (vabdd_f64(v7, v8) < 0.1)
    {
      objc_msgSend(v24, "numericalValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "numericalValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "compare:", v10) == -1)
      {

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "center");
        v12 = v11;
        objc_msgSend(v24, "center");
        v14 = v13;

        if (v12 < v14)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v24);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "center");
    v16 = v15;
    objc_msgSend(v24, "center");
    v5 = v24;
    if (vabdd_f64(v16, v17) < 0.1)
    {
      objc_msgSend(v24, "numericalValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "numericalValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "compare:", v19) == -1)
      {

        goto LABEL_12;
      }
      objc_msgSend(*(id *)(a1 + 32), "center");
      v21 = v20;
      objc_msgSend(v24, "center");
      v23 = v22;

      v5 = v24;
      if (v21 > v23)
      {
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v24);
LABEL_12:
        v5 = v24;
      }
    }
  }

}

void __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  AIAudiogramAxis *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[7];
  uint8_t v16[4];
  void *v17;
  __int128 buf;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "count") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    AXLogAudiogram();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_22FB4F000, v4, OS_LOG_TYPE_INFO, "Starting validation for X axis with matches %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_sortAndRemoveInvalidAxisValues:forAxis:error:", v3, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v19 = 0x2020000000;
    v20 = 0;
    objc_msgSend((id)AIAudiogramValidFrequencies, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend((id)AIAudiogramValidFrequencies, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_183;
    v15[3] = &unk_24FD6D178;
    v15[5] = v7;
    v15[6] = v9;
    v15[4] = &buf;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v10 = objc_msgSend(v5, "count");
      if (v10 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        AXLogAudiogram();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v16 = 138412290;
          v17 = v5;
          _os_log_impl(&dword_22FB4F000, v11, OS_LOG_TYPE_INFO, "Matches are now the largest X axis group: %@", v16, 0xCu);
        }

        v12 = -[AIAudiogramAxis initWithAxis:values:]([AIAudiogramAxis alloc], "initWithAxis:values:", 0, v5);
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
      }
    }
    _Block_object_dispose(&buf, 8);

  }
}

void __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_183(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "numericalValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "integerValue") <= a1[5])
  {

    v7 = v8;
  }
  else
  {
    objc_msgSend(v8, "numericalValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");
    v6 = a1[6];

    v7 = v8;
    if (v5 < v6)
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  }

}

void __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_185(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  AIAudiogramAxis *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  uint8_t v12[4];
  void *v13;
  __int128 buf;
  uint64_t v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "count") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    AXLogAudiogram();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_22FB4F000, v4, OS_LOG_TYPE_INFO, "Starting validation for Y axis with matches %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_sortAndRemoveInvalidAxisValues:forAxis:error:", v3, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x2020000000;
    v16 = 0;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_186;
    v11[3] = &unk_24FD6D1C8;
    v11[4] = &buf;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v6 = objc_msgSend(v5, "count");
      if (v6 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        AXLogAudiogram();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v12 = 138412290;
          v13 = v5;
          _os_log_impl(&dword_22FB4F000, v7, OS_LOG_TYPE_INFO, "Matches are now the largest Y axis group: %@", v12, 0xCu);
        }

        v8 = -[AIAudiogramAxis initWithAxis:values:]([AIAudiogramAxis alloc], "initWithAxis:values:", 1, v5);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
      }
    }
    _Block_object_dispose(&buf, 8);

  }
}

void __68__AIAudiogramIngestionEngine__groupNumbersByAxisFromRecognizedText___block_invoke_186(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "numericalValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)objc_msgSend(v3, "integerValue");
  if (v4 <= -20.0)
  {

    v7 = v8;
  }
  else
  {
    objc_msgSend(v8, "numericalValue", v4, -20.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (double)objc_msgSend(v5, "integerValue");

    v7 = v8;
    if (v6 < 120.0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

- (id)_removeDuplicateSetsFromTextSets:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__AIAudiogramIngestionEngine__removeDuplicateSetsFromTextSets___block_invoke;
  v6[3] = &unk_24FD6D240;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v4, "ax_removeObjectsFromArrayUsingBlock:", v6);

  return v4;
}

uint64_t __63__AIAudiogramIngestionEngine__removeDuplicateSetsFromTextSets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a2;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__AIAudiogramIngestionEngine__removeDuplicateSetsFromTextSets___block_invoke_2;
  v10[3] = &unk_24FD6D218;
  v13 = a3;
  v7 = v5;
  v11 = v7;
  v12 = &v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v8 = *((unsigned __int8 *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __63__AIAudiogramIngestionEngine__removeDuplicateSetsFromTextSets___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v7 = a2;
  v8 = v7;
  if (a1[6] != a3)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 1;
    v9 = (void *)a1[4];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __63__AIAudiogramIngestionEngine__removeDuplicateSetsFromTextSets___block_invoke_3;
    v10[3] = &unk_24FD6D1F0;
    v11 = v7;
    v12 = &v13;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
    if (*((_BYTE *)v14 + 24))
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      *a4 = 1;
    }

    _Block_object_dispose(&v13, 8);
  }

}

uint64_t __63__AIAudiogramIngestionEngine__removeDuplicateSetsFromTextSets___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((result & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (void)audiogramFromImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AIAudiogramIngestionEngine analysisQueue](self, "analysisQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__AIAudiogramIngestionEngine_audiogramFromImages_completion___block_invoke;
  block[3] = &unk_24FD6D268;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __61__AIAudiogramIngestionEngine_audiogramFromImages_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "audiogramFromImages:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

- (id)audiogramFromImage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AIAudiogramIngestionEngine audiogramFromImages:](self, "audiogramFromImages:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)audiogramFromImages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  AIAudiogramIngestionEngine *v14;
  id v15;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    -[AIAudiogramIngestionEngine _audiogramFromImagesV2:](self, "_audiogramFromImagesV2:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_opt_new();
    if (objc_msgSend(v4, "count"))
    {
      v10 = MEMORY[0x24BDAC760];
      v11 = 3221225472;
      v12 = __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke;
      v13 = &unk_24FD6D2E0;
      v14 = self;
      v7 = v6;
      v15 = v7;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v10);
      -[AIAudiogramIngestionEngine _combineAudiograms:](self, "_combineAudiograms:", v7, v10, v11, v12, v13, v14);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        AXLogAudiogram();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[AIAudiogramIngestionEngine audiogramFromImages:].cold.1();

      }
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

void __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  AXLogAudiogram();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FB4F000, v4, OS_LOG_TYPE_DEFAULT, "Starting next image!", buf, 2u);
  }

  v5 = objc_msgSend(*(id *)(a1 + 32), "_propertyOrientationFromOrientation:", objc_msgSend(v3, "imageOrientation"));
  AXLogAudiogram();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(v3, "imageOrientation");
    *(_DWORD *)buf = 134218240;
    v30 = v7;
    v31 = 1024;
    v32 = v5;
    _os_log_impl(&dword_22FB4F000, v6, OS_LOG_TYPE_INFO, "Orienting image %ld -> %d", buf, 0x12u);
  }

  v8 = objc_alloc(MEMORY[0x24BDBF660]);
  v9 = objc_retainAutorelease(v3);
  v10 = (void *)objc_msgSend(v8, "initWithCGImage:options:", objc_msgSend(v9, "CGImage"), 0);
  objc_msgSend(v10, "imageByApplyingCGOrientation:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_observationsFromCIImage:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_cropResultsFromImage:observations:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke_190;
    v24 = &unk_24FD6D2B8;
    v25 = *(_QWORD *)(a1 + 32);
    v15 = v11;
    v26 = v15;
    v16 = v12;
    v27 = v16;
    v17 = v14;
    v28 = v17;
    -[NSObject enumerateObjectsUsingBlock:](v13, "enumerateObjectsUsingBlock:", &v21);
    if (objc_msgSend(v17, "count", v21, v22, v23, v24, v25))
    {
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v17);
    }
    else
    {
      AXLogAudiogram();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22FB4F000, v18, OS_LOG_TYPE_INFO, "Attempting find audiogram text without cropping", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_textFromAudiogramImage:regionOfInterest:", v15, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_audiogramFromSymbols:recognizedText:", v16, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);

    }
  }
  else
  {
    AXLogAudiogram();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FB4F000, v13, OS_LOG_TYPE_INFO, "No observations for audiogram image", buf, 2u);
    }
  }

}

void __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke_190(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  double Width;
  double Height;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint8_t buf[16];
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v3 = a2;
  objc_msgSend(v3, "graphRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "symbolsRect");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.width = v9;
  v38.size.height = v11;
  if (!CGRectIsEmpty(v38))
  {
    v39.origin.x = v13;
    v39.origin.y = v15;
    v39.size.width = v17;
    v39.size.height = v19;
    if (!CGRectIsEmpty(v39))
    {
      AXLogAudiogram();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22FB4F000, v20, OS_LOG_TYPE_INFO, "Attempting to crop graph edges for audiogram text", buf, 2u);
      }

      v21 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "_cropEdgesFromImage:graphRect:symbolsRect:", *(_QWORD *)(a1 + 40), v5, v7, v9, v11, v13, v15, v17, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke_191;
      v34[3] = &unk_24FD6D290;
      v23 = *(void **)(a1 + 40);
      v34[4] = *(_QWORD *)(a1 + 32);
      v35 = v23;
      v36 = v21;
      v24 = v21;
      objc_msgSend(v22, "enumerateObjectsUsingBlock:", v34);
      objc_msgSend(*(id *)(a1 + 32), "_audiogramFromSymbols:recognizedText:", *(_QWORD *)(a1 + 48), v24);
      v25 = objc_claimAutoreleasedReturnValue();

      if (v25)
        goto LABEL_10;
    }
  }
  v40.origin.x = v5;
  v40.origin.y = v7;
  v40.size.width = v9;
  v40.size.height = v11;
  if (CGRectIsEmpty(v40))
    goto LABEL_11;
  AXLogAudiogram();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FB4F000, v26, OS_LOG_TYPE_INFO, "Attempting to crop graph for audiogram text", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "imageByCroppingToRect:", v5, v7, v9, v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "extent");
  Width = CGRectGetWidth(v41);
  objc_msgSend(*(id *)(a1 + 40), "extent");
  Height = CGRectGetHeight(v42);
  v43.origin.x = v5;
  v43.origin.y = v7;
  v43.size.width = v9;
  v43.size.height = v11;
  v30 = CGRectGetMinX(v43) / Width;
  v44.origin.x = v5;
  v44.origin.y = v7;
  v44.size.width = v9;
  v44.size.height = v11;
  v31 = CGRectGetMinY(v44) / Height;
  v45.origin.x = v5;
  v45.origin.y = v7;
  v45.size.width = v9;
  v45.size.height = v11;
  v32 = CGRectGetWidth(v45) / Width;
  v46.origin.x = v5;
  v46.origin.y = v7;
  v46.size.width = v9;
  v46.size.height = v11;
  objc_msgSend(*(id *)(a1 + 32), "_textFromAudiogramImage:regionOfInterest:", v27, v30, v31, v32, CGRectGetHeight(v46) / Height);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_audiogramFromSymbols:recognizedText:", *(_QWORD *)(a1 + 48), v33);
  v25 = objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
LABEL_11:
    AXLogAudiogram();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke_190_cold_1();
  }
  else
  {
LABEL_10:
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v25);
  }

}

void __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke_191(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "CGRectValue");
  objc_msgSend(*(id *)(a1 + 32), "_textFromAudiogramImage:regionOfInterest:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v3);
  AXLogAudiogram();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_22FB4F000, v4, OS_LOG_TYPE_INFO, "Found text from edge crop: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (id)_audiogramFromSymbols:(id)a3 recognizedText:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[AIAudiogramIngestionEngine _audiogramMapFromRecognizedText:](self, "_audiogramMapFromRecognizedText:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIngestionEngine _audiogramFromSymbols:onAudiogramMap:](self, "_audiogramFromSymbols:onAudiogramMap:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_audiogramFromSymbols:(id)a3 onAudiogramMap:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id HKAudiogramSampleClass;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[5];
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  uint8_t buf[4];
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  v9 = 0;
  if (v7 && v8)
  {
    v49 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(getHKUnitClass_1(), "hertzUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getHKUnitClass_1(), "decibelHearingLevelUnit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    v53 = v6;
    v13 = (void *)objc_opt_new();
    v14 = (void *)objc_opt_new();
    v15 = (void *)objc_opt_new();
    v16 = (void *)objc_opt_new();
    v17 = MEMORY[0x24BDAC760];
    v59[0] = MEMORY[0x24BDAC760];
    v59[1] = 3221225472;
    v59[2] = __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke;
    v59[3] = &unk_24FD6D330;
    v59[4] = self;
    v60 = v7;
    v52 = v15;
    v61 = v52;
    v18 = v11;
    v62 = v18;
    v19 = v13;
    v6 = v53;
    v20 = v19;
    v63 = v19;
    v21 = v12;
    v64 = v21;
    v51 = v16;
    v65 = v51;
    v22 = v14;
    v66 = v22;
    objc_msgSend(v53, "enumerateObjectsUsingBlock:", v59);
    AXLogAudiogram();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v20;
      _os_log_impl(&dword_22FB4F000, v23, OS_LOG_TYPE_INFO, "Unsorted results (left): %@", buf, 0xCu);
    }

    AXLogAudiogram();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v22;
      _os_log_impl(&dword_22FB4F000, v24, OS_LOG_TYPE_INFO, "Unsorted results (right): %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", &stru_24FD6E4F8, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v67, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sortUsingDescriptors:", v26);

    AXLogAudiogram();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v21;
      _os_log_impl(&dword_22FB4F000, v27, OS_LOG_TYPE_INFO, "Sorted frequencies: %@", buf, 0xCu);
    }

    v54[0] = v17;
    v54[1] = 3221225472;
    v54[2] = __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_199;
    v54[3] = &unk_24FD6D358;
    v28 = v20;
    v55 = v28;
    v29 = v22;
    v56 = v29;
    v30 = v10;
    v57 = v30;
    v31 = v49;
    v58 = v31;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v54);
    v32 = objc_msgSend(v31, "count");
    if (v32)
    {
      HKAudiogramSampleClass = getHKAudiogramSampleClass(v32, v33, v34, v35, v36, v37, v38, v39);
      v41 = v28;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v50 = v29;
      v42 = v21;
      v43 = v7;
      v44 = v18;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      metadataForHKAudiogramSample();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(HKAudiogramSampleClass, "audiogramSampleWithSensitivityPoints:startDate:endDate:metadata:", v31, v45, v46, v47);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v41;
      v6 = v53;

      v18 = v44;
      v7 = v43;
      v21 = v42;
      v29 = v50;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

void __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  double v42;
  double v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;
  CGPoint v51;
  CGRect v52;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "labels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "modelLabelLeftEarSymbol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(v3, "labels");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = v3;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "modelLabelRightEarSymbol");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v11, "isEqualToString:", v12);

    v3 = v10;
    if ((v31 & 1) == 0)
      goto LABEL_9;
  }
  objc_msgSend(v3, "boundingBox");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = v13 + v17 * 0.5;
  v22 = v15 + v19 * 0.5;
  AXLogAudiogram();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "labels");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v51.x = v21;
    v51.y = v22;
    NSStringFromCGPoint(v51);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v52.origin.x = v14;
    v52.origin.y = v16;
    v52.size.width = v18;
    v52.size.height = v20;
    NSStringFromCGRect(v52);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v45 = v26;
    v46 = 2112;
    v47 = v27;
    v48 = 2112;
    v49 = v28;
    _os_log_impl(&dword_22FB4F000, v23, OS_LOG_TYPE_INFO, "Got %@ center %@ from box %@", buf, 0x20u);

  }
  objc_msgSend(a1[5], "frequencyAtPoint:", v21, v22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)AIAudiogramValidFrequencies, "containsObject:", v29))
  {
    objc_msgSend(v3, "labels");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_196;
    v32[3] = &unk_24FD6D308;
    v32[4] = a1[4];
    v33 = a1[6];
    v34 = v29;
    v35 = a1[5];
    v42 = v21;
    v43 = v22;
    v36 = a1[7];
    v37 = a1[8];
    v38 = v3;
    v39 = a1[9];
    v40 = a1[10];
    v41 = a1[11];
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v32);

  }
LABEL_9:

}

void __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_196(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  float v7;
  float v8;
  float v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  float v22;
  float v23;
  void *v25;
  double v26;
  double v27;
  void *v28;
  NSObject *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  float v36;
  float v37;
  void *v38;
  double v39;
  double v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  float v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  float v52;
  int v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  double v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "confidence");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "modelLabelConfidenceThreshold");
  if (v8 >= v9)
  {
    objc_msgSend(v6, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "modelLabelLeftEarSymbol");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqualToString:", v19);

    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *(_QWORD *)(a1 + 48));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      v23 = v22;

      if (v23 != 0.0 && v8 <= v23)
        goto LABEL_20;
      objc_msgSend(*(id *)(a1 + 56), "hearingLevelAtPoint:", *(double *)(a1 + 112), *(double *)(a1 + 120));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v27 = v26;

      objc_msgSend(getHKQuantityClass_0(), "quantityWithUnit:doubleValue:", *(_QWORD *)(a1 + 64), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      AXLogAudiogram();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v43 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 80), "labels");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "firstObject");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "confidence");
        v53 = 138413058;
        v54 = v43;
        v55 = 2112;
        v56 = v44;
        v57 = 2112;
        v58 = v28;
        v59 = 2048;
        v60 = v47;
        _os_log_debug_impl(&dword_22FB4F000, v29, OS_LOG_TYPE_DEBUG, "New most confident result: %@ Hz left %@ -> %@, confidence %f", (uint8_t *)&v53, 0x2Au);

      }
      objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v28, *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 88), "addObject:", *(_QWORD *)(a1 + 48));
      v31 = *(void **)(a1 + 40);
    }
    else
    {
      objc_msgSend(v6, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "modelLabelRightEarSymbol");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqualToString:", v33);

      if (!v34)
        goto LABEL_20;
      objc_msgSend(*(id *)(a1 + 96), "objectForKey:", *(_QWORD *)(a1 + 48));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "floatValue");
      v37 = v36;

      if (v37 != 0.0 && v8 <= v37)
        goto LABEL_20;
      objc_msgSend(*(id *)(a1 + 56), "hearingLevelAtPoint:", *(double *)(a1 + 112), *(double *)(a1 + 120));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "doubleValue");
      v40 = v39;

      objc_msgSend(getHKQuantityClass_0(), "quantityWithUnit:doubleValue:", *(_QWORD *)(a1 + 64), v40);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      AXLogAudiogram();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        v48 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 104), "objectForKey:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 80), "labels");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "firstObject");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "confidence");
        v53 = 138413058;
        v54 = v48;
        v55 = 2112;
        v56 = v49;
        v57 = 2112;
        v58 = v28;
        v59 = 2048;
        v60 = v52;
        _os_log_debug_impl(&dword_22FB4F000, v41, OS_LOG_TYPE_DEBUG, "New most confident result: %@ Hz right %@ -> %@, confidence %f", (uint8_t *)&v53, 0x2Au);

      }
      objc_msgSend(*(id *)(a1 + 104), "setObject:forKey:", v28, *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 88), "addObject:", *(_QWORD *)(a1 + 48));
      v31 = *(void **)(a1 + 96);
    }
    *(float *)&v30 = v8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v30);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKey:", v42, *(_QWORD *)(a1 + 48));

    goto LABEL_20;
  }
  AXLogAudiogram();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_196_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

  *a4 = 1;
LABEL_20:

}

void __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_199(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id HKQuantityClass_0;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKQuantityClass_0 = getHKQuantityClass_0();
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "doubleValue");
  v10 = v9;

  objc_msgSend(HKQuantityClass_0, "quantityWithUnit:doubleValue:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(getHKAudiogramSensitivityPointClass(), "sensitivityPointWithFrequency:leftEarSensitivity:rightEarSensitivity:error:", v11, v5, v6, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;
  if (v13)
  {
    AXLogAudiogram();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_199_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
  }

}

- (id)_combineAudiograms:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id HKAudiogramSampleClass;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  void *v44;
  uint8_t buf[4];
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 == 1)
  {
    AXLogAudiogram();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FB4F000, v8, OS_LOG_TYPE_INFO, "Only one audiogram. No need to combine", buf, 2u);
    }

    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
    if (v4)
    {
      AXLogAudiogram();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v46 = v5;
        _os_log_impl(&dword_22FB4F000, v9, OS_LOG_TYPE_INFO, "%i audiograms to combine", buf, 8u);
      }

      v10 = (void *)objc_opt_new();
      v11 = (void *)objc_opt_new();
      v12 = (void *)objc_opt_new();
      v13 = MEMORY[0x24BDAC760];
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __49__AIAudiogramIngestionEngine__combineAudiograms___block_invoke;
      v40[3] = &unk_24FD6D3A8;
      v14 = v10;
      v41 = v14;
      v15 = v11;
      v42 = v15;
      v16 = v12;
      v43 = v16;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v40);
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", &stru_24FD6E4F8, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sortUsingDescriptors:", v18);

      v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v36[0] = v13;
      v36[1] = 3221225472;
      v36[2] = __49__AIAudiogramIngestionEngine__combineAudiograms___block_invoke_205;
      v36[3] = &unk_24FD6D3D0;
      v20 = v15;
      v37 = v20;
      v21 = v16;
      v38 = v21;
      v22 = v19;
      v39 = v22;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v36);
      v23 = objc_msgSend(v22, "count");
      if (v23)
      {
        HKAudiogramSampleClass = getHKAudiogramSampleClass(v23, v24, v25, v26, v27, v28, v29, v30);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        metadataForHKAudiogramSample();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(HKAudiogramSampleClass, "audiogramSampleWithSensitivityPoints:startDate:endDate:metadata:", v22, v32, v33, v34);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      AXLogAudiogram();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22FB4F000, v6, OS_LOG_TYPE_INFO, "No audiogram to combine", buf, 2u);
      }

      v7 = 0;
    }
  }

  return v7;
}

void __49__AIAudiogramIngestionEngine__combineAudiograms___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  AXLogAudiogram();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_22FB4F000, v4, OS_LOG_TYPE_INFO, "Combining audiogram %@", buf, 0xCu);
  }

  objc_msgSend(v3, "sensitivityPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__AIAudiogramIngestionEngine__combineAudiograms___block_invoke_202;
  v6[3] = &unk_24FD6D380;
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void __49__AIAudiogramIngestionEngine__combineAudiograms___block_invoke_202(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(v3, "frequency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(v3, "leftEarSensitivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)a1[5];
    objc_msgSend(v3, "leftEarSensitivity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frequency");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  objc_msgSend(v3, "rightEarSensitivity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)a1[6];
    objc_msgSend(v3, "rightEarSensitivity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frequency");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, v13);

  }
  AXLogAudiogram();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = a1[4];
    v20 = 138412290;
    v21 = v15;
    _os_log_impl(&dword_22FB4F000, v14, OS_LOG_TYPE_INFO, "Frequencies: %@", (uint8_t *)&v20, 0xCu);
  }

  AXLogAudiogram();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = a1[5];
    v20 = 138412290;
    v21 = v17;
    _os_log_impl(&dword_22FB4F000, v16, OS_LOG_TYPE_INFO, "leftEarSensitivities: %@", (uint8_t *)&v20, 0xCu);
  }

  AXLogAudiogram();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = a1[6];
    v20 = 138412290;
    v21 = v19;
    _os_log_impl(&dword_22FB4F000, v18, OS_LOG_TYPE_INFO, "rightEarSensitivities: %@", (uint8_t *)&v20, 0xCu);
  }

}

void __49__AIAudiogramIngestionEngine__combineAudiograms___block_invoke_205(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(getHKAudiogramSensitivityPointClass(), "sensitivityPointWithFrequency:leftEarSensitivity:rightEarSensitivity:error:", v4, v5, v6, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v8)
  {
    AXLogAudiogram();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_199_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
  }

}

- (id)_audiogramFromImagesV2:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AIAudiogramIngestionEngine setFailureMode:](self, "setFailureMode:", 0);
  -[AIAudiogramIngestionEngine audiogramPointsFromImages:](self, "audiogramPointsFromImages:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AIAudiogramIngestionEngine _audiogramFromAudiogramPoints:](self, "_audiogramFromAudiogramPoints:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)audiogramPointsFromImages:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  AIAudiogramIngestionEngine *v15;
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_opt_new();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke;
    v14 = &unk_24FD6D2E0;
    v15 = self;
    v6 = v5;
    v16 = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v11);
    if (!objc_msgSend(v6, "count", v11, v12, v13, v14, v15))
    {
      AXLogAudiogram();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[AIAudiogramIngestionEngine audiogramPointsFromImages:].cold.1();

    }
    v8 = v16;
    v9 = v6;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  AXLogAudiogram();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FB4F000, v4, OS_LOG_TYPE_DEFAULT, "v2: Starting next image!", buf, 2u);
  }

  v5 = objc_msgSend(*(id *)(a1 + 32), "_propertyOrientationFromOrientation:", objc_msgSend(v3, "imageOrientation"));
  v6 = objc_alloc(MEMORY[0x24BDBF660]);
  v7 = objc_retainAutorelease(v3);
  v8 = (void *)objc_msgSend(v6, "initWithCGImage:options:", objc_msgSend(v7, "CGImage"), 0);
  objc_msgSend(v8, "imageByApplyingCGOrientation:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogAudiogram();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_msgSend(v7, "imageOrientation");
    *(_DWORD *)buf = 134218240;
    v21 = v11;
    v22 = 1024;
    v23 = v5;
    _os_log_impl(&dword_22FB4F000, v10, OS_LOG_TYPE_INFO, "v2: Orienting image %ld -> %d", buf, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "audiogramDetectorResultsFromImage:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_207;
  v16[3] = &unk_24FD6D420;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v17 = v9;
  v18 = v13;
  v19 = v14;
  v15 = v9;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

}

void __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_207(id *a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double *v15;
  __int128 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  _QWORD *p_x;
  CGFloat v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double Width;
  CGFloat v34;
  CGFloat x;
  CGFloat y;
  CGFloat v37;
  CGFloat height;
  double MinX;
  double v40;
  double v41;
  double v42;
  double v43;
  CGRect *v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  double MinY;
  int8x16_t v83;
  double v84;
  _QWORD v85[4];
  int8x16_t v86;
  id v87;
  uint8_t buf[8];
  _QWORD v89[9];
  uint64_t v90;
  CGRect *v91;
  uint64_t v92;
  const char *v93;
  __int128 v94;
  __int128 v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;

  v3 = a2;
  objc_msgSend(v3, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "extent");
  objc_msgSend(v4, "scaledBoxWithSize:", v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v90 = 0;
  v91 = (CGRect *)&v90;
  v92 = 0x4010000000;
  v93 = "";
  v15 = (double *)MEMORY[0x24BDBF090];
  v16 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v94 = *MEMORY[0x24BDBF090];
  v95 = v16;
  objc_msgSend(v3, "symbols");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v89[0] = MEMORY[0x24BDAC760];
  v89[1] = 3221225472;
  v89[2] = __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_2;
  v89[3] = &unk_24FD6D3F8;
  *(double *)&v89[5] = v8;
  *(double *)&v89[6] = v10;
  *(double *)&v89[7] = v12;
  *(double *)&v89[8] = v14;
  v89[4] = &v90;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v89);

  v19 = (void *)objc_opt_new();
  objc_msgSend(a1[5], "_adjustedRectForVisionCoordinateSpace:inImage:", a1[4], v8, v10, v12, v14);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  objc_msgSend(a1[5], "_adjustedRectForVisionCoordinateSpace:inImage:", a1[4], v91[1].origin.x, v91[1].origin.y, v91[1].size.width, v91[1].size.height);
  p_x = (_QWORD *)&v91->origin.x;
  v91[1].origin.x = v29;
  p_x[5] = v30;
  p_x[6] = v31;
  p_x[7] = v32;
  v96.origin.x = v21;
  v96.origin.y = v23;
  v96.size.width = v25;
  v96.size.height = v27;
  Width = CGRectGetWidth(v96);
  v97.origin.x = v21;
  v97.origin.y = v23;
  v97.size.width = v25;
  v97.size.height = v27;
  v34 = CGRectGetHeight(v97) * -0.05;
  v98.origin.x = v21;
  v98.origin.y = v23;
  v98.size.width = v25;
  v98.size.height = v27;
  v99 = CGRectInset(v98, Width * -0.05, v34);
  x = v99.origin.x;
  y = v99.origin.y;
  v37 = v99.size.width;
  height = v99.size.height;
  MinX = CGRectGetMinX(v99);
  v100.origin.x = x;
  v100.origin.y = y;
  v100.size.width = v37;
  v100.size.height = height;
  MinY = CGRectGetMinY(v100);
  objc_msgSend(a1[4], "extent");
  v40 = CGRectGetWidth(v101);
  v102.origin.x = x;
  v102.origin.y = y;
  v102.size.width = v37;
  v102.size.height = height;
  v41 = CGRectGetWidth(v102);
  objc_msgSend(a1[4], "extent");
  v42 = CGRectGetHeight(v103);
  v104.origin.x = x;
  v104.origin.y = y;
  v104.size.width = v37;
  v104.size.height = height;
  v43 = CGRectGetHeight(v104);
  v44 = v91;
  v45 = CGRectGetWidth(v91[1]);
  v46 = CGRectGetHeight(v91[1]) * 0.1;
  v105 = CGRectInset(v44[1], v45 * 0.1, v46);
  v47 = fmax(MinX, 0.0);
  v48 = fmax(MinY, 0.0);
  v49 = fmin(v40 - v47, v41);
  v91[1] = v105;
  v50 = fmin(v42 - v48, v43);
  v105.origin.x = v47;
  v105.origin.y = v48;
  v105.size.width = v49;
  v105.size.height = v50;
  if (!CGRectIsEmpty(v105) && !CGRectIsEmpty(v91[1]))
  {
    AXLogAudiogram();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FB4F000, v51, OS_LOG_TYPE_INFO, "v2: Attempting to crop graph edges for audiogram text", buf, 2u);
    }

    v52 = (void *)objc_opt_new();
    objc_msgSend(a1[5], "_cropEdgesFromImage:graphRect:symbolsRect:", a1[4], v47, v48, v49, v50, v91[1].origin.x, v91[1].origin.y, v91[1].size.width, v91[1].size.height);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v18;
    v85[1] = 3221225472;
    v85[2] = __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_210;
    v85[3] = &unk_24FD6D290;
    v83 = *((int8x16_t *)a1 + 2);
    v54 = (id)v83.i64[0];
    v86 = vextq_s8(v83, v83, 8uLL);
    v55 = v52;
    v87 = v55;
    objc_msgSend(v53, "enumerateObjectsUsingBlock:", v85);
    objc_msgSend(a1[4], "extent");
    v83.i64[0] = CGRectGetWidth(v106);
    objc_msgSend(a1[4], "extent");
    v56 = CGRectGetHeight(v107);
    v108.origin.x = v47;
    v108.origin.y = v48;
    v108.size.width = v49;
    v108.size.height = v50;
    v57 = CGRectGetMinX(v108);
    v109.origin.x = v47;
    v109.origin.y = v48;
    v109.size.width = v49;
    v109.size.height = v50;
    v58 = CGRectGetMinY(v109);
    v110.origin.x = v47;
    v110.origin.y = v48;
    v110.size.width = v49;
    v110.size.height = v50;
    v59 = CGRectGetWidth(v110);
    v111.origin.x = v47;
    v111.origin.y = v48;
    v111.size.width = v49;
    v111.size.height = v50;
    objc_msgSend(a1[5], "_textFromAudiogramImage:regionOfInterest:", a1[4], v57 / *(double *)v83.i64, v58 / v56, v59 / *(double *)v83.i64, CGRectGetHeight(v111) / v56);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addObjectsFromArray:", v60);
    v61 = a1[5];
    objc_msgSend(v3, "symbols");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "graph");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "box");
    objc_msgSend(v61, "_audiogramPointsFromSymbolsV2:inGraphRect:recognizedText:", v62, v55);
    v64 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v64;
  }
  if (!objc_msgSend(v19, "count"))
  {
    v112.origin.x = v47;
    v112.origin.y = v48;
    v112.size.width = v49;
    v112.size.height = v50;
    if (!CGRectIsEmpty(v112))
    {
      AXLogAudiogram();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22FB4F000, v65, OS_LOG_TYPE_INFO, "v2: Attempting to crop graph for audiogram text", buf, 2u);
      }

      objc_msgSend(a1[4], "extent");
      v84 = CGRectGetWidth(v113);
      objc_msgSend(a1[4], "extent");
      v66 = CGRectGetHeight(v114);
      v115.origin.x = v47;
      v115.origin.y = v48;
      v115.size.width = v49;
      v115.size.height = v50;
      v67 = CGRectGetMinX(v115);
      v116.origin.x = v47;
      v116.origin.y = v48;
      v116.size.width = v49;
      v116.size.height = v50;
      v68 = CGRectGetMinY(v116);
      v117.origin.x = v47;
      v117.origin.y = v48;
      v117.size.width = v49;
      v117.size.height = v50;
      v69 = CGRectGetWidth(v117);
      v118.origin.x = v47;
      v118.origin.y = v48;
      v118.size.width = v49;
      v118.size.height = v50;
      objc_msgSend(a1[5], "_textFromAudiogramImage:regionOfInterest:", a1[4], v67 / v84, v68 / v66, v69 / v84, CGRectGetHeight(v118) / v66);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = a1[5];
      objc_msgSend(v3, "symbols");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "graph");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "box");
      objc_msgSend(v71, "_audiogramPointsFromSymbolsV2:inGraphRect:recognizedText:", v72, v70);
      v74 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v74;
    }
  }
  if (!objc_msgSend(v19, "count"))
  {
    AXLogAudiogram();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FB4F000, v75, OS_LOG_TYPE_INFO, "v2: Attempting find audiogram text without cropping", buf, 2u);
    }

    objc_msgSend(a1[5], "_textFromAudiogramImage:regionOfInterest:", a1[4], *v15, v15[1], v15[2], v15[3]);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = a1[5];
    objc_msgSend(v3, "symbols");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "graph");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "box");
    objc_msgSend(v77, "_audiogramPointsFromSymbolsV2:inGraphRect:recognizedText:", v78, v76);
    v80 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v80;
  }
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(a1[6], "addObjectsFromArray:", v19);
  }
  else
  {
    AXLogAudiogram();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_207_cold_1();

  }
  _Block_object_dispose(&v90, 8);

}

void __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(a2, "scaledBoxWithSize:offset:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 40), *(double *)(a1 + 48));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (a3)
  {
    *(CGRect *)&v5 = CGRectUnion(*(CGRect *)(v13 + 32), *(CGRect *)&v6);
    v8 = v14;
    v10 = v15;
    v12 = v16;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_QWORD *)(v13 + 32) = v5;
  *(_QWORD *)(v13 + 40) = v8;
  *(_QWORD *)(v13 + 48) = v10;
  *(_QWORD *)(v13 + 56) = v12;
}

void __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_210(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "CGRectValue");
  objc_msgSend(*(id *)(a1 + 32), "_textFromAudiogramImage:regionOfInterest:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v3);
  AXLogAudiogram();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_22FB4F000, v4, OS_LOG_TYPE_INFO, "v2: Found text from edge crop: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (id)audiogramDetectorResultsFromImage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  int v22;
  void *v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[AIAudiogramIngestionEngine _propertyOrientationFromOrientation:](self, "_propertyOrientationFromOrientation:", objc_msgSend(v4, "imageOrientation"));
  -[AIAudiogramIngestionEngine graphModel](self, "graphModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v4);
  objc_msgSend(v7, "getGraphDetectorResult:orientation:", objc_msgSend(v8, "CGImage"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogAudiogram();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v25 = objc_msgSend(v9, "count");
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_22FB4F000, v10, OS_LOG_TYPE_DEFAULT, "Found %lu graphs for audiogram image: %@", buf, 0x16u);
  }

  if (!objc_msgSend(v9, "count"))
  {
    -[AIAudiogramIngestionEngine setFailureMode:](self, "setFailureMode:", 1);
    AXLogAudiogram();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FB4F000, v11, OS_LOG_TYPE_INFO, "Adding full-size pseudo-graph to proceed with symbol detection", buf, 2u);
    }

    +[AudiogramGraphDetectorResult defaultResult](_TtC18AudiogramIngestion28AudiogramGraphDetectorResult, "defaultResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __64__AIAudiogramIngestionEngine_audiogramDetectorResultsFromImage___block_invoke;
  v19[3] = &unk_24FD6D448;
  v19[4] = self;
  v20 = v8;
  v22 = v6;
  v14 = v5;
  v21 = v14;
  v15 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v19);
  v16 = v21;
  v17 = v14;

  return v17;
}

void __64__AIAudiogramIngestionEngine_audiogramDetectorResultsFromImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _TtC18AudiogramIngestion23AudiogramDetectorResult *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "symbolModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getSymbolDetectorResult:orientation:in:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGImage"), *(unsigned int *)(a1 + 56), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") <= 3)
    objc_msgSend(*(id *)(a1 + 32), "setFailureMode:", 2);
  AXLogAudiogram();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218498;
    v12 = objc_msgSend(v7, "count");
    v13 = 2048;
    v14 = a3;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_22FB4F000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu symbols for audiogram graph %lu: %@", (uint8_t *)&v11, 0x20u);
  }

  v9 = *(void **)(a1 + 48);
  v10 = -[AudiogramDetectorResult initWithGraph:symbols:]([_TtC18AudiogramIngestion23AudiogramDetectorResult alloc], "initWithGraph:symbols:", v5, v7);
  objc_msgSend(v9, "addObject:", v10);

}

- (CGRect)_adjustedRectForVisionCoordinateSpace:(CGRect)a3 inImage:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat MinX;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a4, "extent");
  v8 = CGRectGetHeight(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MinX = CGRectGetMinX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v10 = v8 - CGRectGetMaxY(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v11 = CGRectGetWidth(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v12 = CGRectGetHeight(v20);
  v13 = MinX;
  v14 = v10;
  v15 = v11;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_audiogramPointsFromSymbolsV2:(id)a3 inGraphRect:(CGRect)a4 recognizedText:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  -[AIAudiogramIngestionEngine _audiogramMapFromRecognizedText:](self, "_audiogramMapFromRecognizedText:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIngestionEngine _audiogramPointsFromSymbolsV2:inGraphRect:onAudiogramMap:](self, "_audiogramPointsFromSymbolsV2:inGraphRect:onAudiogramMap:", v11, v12, x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_audiogramPointsFromSymbolsV2:(id)a3 inGraphRect:(CGRect)a4 onAudiogramMap:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  id v36;
  id v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v44 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = objc_msgSend(v11, "count");
  if (!v12 || !v13)
  {
    if (v12)
      v19 = 2;
    else
      v19 = 3;
    -[AIAudiogramIngestionEngine setFailureMode:](self, "setFailureMode:", v19);
    v20 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v12, "frequencies");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "values");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v15, "count") <= 3)
  {

    goto LABEL_11;
  }
  objc_msgSend(v12, "hearingLevels");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "values");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18 <= 3)
LABEL_11:
    -[AIAudiogramIngestionEngine setFailureMode:](self, "setFailureMode:", 3);
  objc_msgSend(v12, "hearingLevelSlope");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  if (fabs(v22) < 10.0)
  {

  }
  else
  {
    objc_msgSend(v12, "frequencySlope");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = fabs(v24);

    if (v25 <= 0.1)
      goto LABEL_17;
  }
  -[AIAudiogramIngestionEngine setFailureMode:](self, "setFailureMode:", 4);
LABEL_17:
  v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v32 = MEMORY[0x24BDAC760];
  v33 = 3221225472;
  v34 = __87__AIAudiogramIngestionEngine__audiogramPointsFromSymbolsV2_inGraphRect_onAudiogramMap___block_invoke;
  v35 = &unk_24FD6D470;
  v38 = x;
  v39 = y;
  v40 = width;
  v41 = height;
  v36 = v12;
  v27 = v26;
  v37 = v27;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v32);
  AXLogAudiogram();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = objc_msgSend(v27, "count", v32, v33, v34, v35, v36);
    *(_DWORD *)buf = 134217984;
    v43 = v29;
    _os_log_impl(&dword_22FB4F000, v28, OS_LOG_TYPE_DEFAULT, "Found db + frequency values for %lu points", buf, 0xCu);
  }

  v30 = v37;
  v20 = v27;

LABEL_20:
  return v20;
}

void __87__AIAudiogramIngestionEngine__audiogramPointsFromSymbolsV2_inGraphRect_onAudiogramMap___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  AIAudiogramPoint *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  AIAudiogramPoint *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;
  CGPoint v38;
  CGRect v39;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "scaledBoxWithSize:offset:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 48), *(double *)(a1 + 56));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = v4 + v8 * 0.5;
  v13 = 1.0 - (v6 + v10 * 0.5);
  AXLogAudiogram();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "labelName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38.x = v12;
    v38.y = v13;
    NSStringFromCGPoint(v38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39.origin.x = v5;
    v39.origin.y = v7;
    v39.size.width = v9;
    v39.size.height = v11;
    NSStringFromCGRect(v39);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412802;
    v32 = v15;
    v33 = 2112;
    v34 = v16;
    v35 = 2112;
    v36 = v17;
    _os_log_impl(&dword_22FB4F000, v14, OS_LOG_TYPE_INFO, "Got %@ center %@ from box %@", (uint8_t *)&v31, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "frequencyAtPoint:", v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)AIAudiogramValidFrequencies, "containsObject:", v18))
  {
    objc_msgSend(*(id *)(a1 + 32), "hearingLevelAtPoint:", v12, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    if (v20 <= 120.0)
    {
      objc_msgSend(v19, "doubleValue");
      if (v21 >= -20.0)
      {
        objc_msgSend(v3, "confidence");
        v23 = v22;
        v24 = *(void **)(a1 + 40);
        v25 = [AIAudiogramPoint alloc];
        objc_msgSend(v3, "labelName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v28 = v27;
        objc_msgSend(v19, "doubleValue");
        v30 = -[AIAudiogramPoint initWithSymbolName:frequency:dbValue:confidence:](v25, "initWithSymbolName:frequency:dbValue:confidence:", v26, v28, v29, v23);
        objc_msgSend(v24, "addObject:", v30);

      }
    }

  }
}

- (id)_audiogramFromAudiogramPoints:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  void *v41;
  id HKAudiogramSampleClass;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  uint8_t buf[4];
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v43 = objc_alloc_init(v4);
  objc_msgSend(getHKUnitClass_1(), "hertzUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass_1(), "decibelHearingLevelUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __60__AIAudiogramIngestionEngine__audiogramFromAudiogramPoints___block_invoke;
  v49[3] = &unk_24FD6D498;
  v49[4] = self;
  v13 = v11;
  v50 = v13;
  v14 = v7;
  v51 = v14;
  v15 = v9;
  v52 = v15;
  v16 = v8;
  v53 = v16;
  v17 = v12;
  v54 = v17;
  v18 = v10;
  v55 = v18;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v49);

  AXLogAudiogram();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v58 = (uint64_t)v15;
    _os_log_impl(&dword_22FB4F000, v19, OS_LOG_TYPE_INFO, "Unsorted results (left): %@", buf, 0xCu);
  }

  AXLogAudiogram();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v58 = (uint64_t)v18;
    _os_log_impl(&dword_22FB4F000, v20, OS_LOG_TYPE_INFO, "Unsorted results (right): %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", &stru_24FD6E4F8, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortUsingDescriptors:", v22);

  AXLogAudiogram();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v58 = (uint64_t)v16;
    _os_log_impl(&dword_22FB4F000, v23, OS_LOG_TYPE_INFO, "Sorted frequencies: %@", buf, 0xCu);
  }

  if (objc_msgSend(v16, "containsObject:", &unk_24FD77488)
    && objc_msgSend(v16, "containsObject:", &unk_24FD774A0)
    && objc_msgSend(v16, "containsObject:", &unk_24FD774B8)
    && objc_msgSend(v16, "containsObject:", &unk_24FD774D0))
  {
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __60__AIAudiogramIngestionEngine__audiogramFromAudiogramPoints___block_invoke_222;
    v44[3] = &unk_24FD6D358;
    v45 = v15;
    v46 = v18;
    v47 = v6;
    v24 = v43;
    v48 = v24;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v44);
    if (objc_msgSend(v24, "count"))
    {
      AXLogAudiogram();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_msgSend(v24, "count");
        *(_DWORD *)buf = 134217984;
        v58 = v26;
        _os_log_impl(&dword_22FB4F000, v25, OS_LOG_TYPE_DEFAULT, "Writing %lu points to new audiogram sample", buf, 0xCu);
      }

      HKAudiogramSampleClass = getHKAudiogramSampleClass(v27, v28, v29, v30, v31, v32, v33, v34);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v40 = v24;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v35 = objc_claimAutoreleasedReturnValue();
      metadataForHKAudiogramSample();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)v35;
      objc_msgSend(HKAudiogramSampleClass, "audiogramSampleWithSensitivityPoints:startDate:endDate:metadata:", v40, v41, v35, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v38 = 0;
    }

  }
  else
  {
    v38 = 0;
  }

  return v38;
}

void __60__AIAudiogramIngestionEngine__audiogramFromAudiogramPoints___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  double v30;
  double v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "leftEarAirConductionUnmaskedSymbol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObjects:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "rightEarAirConductionUnmaskedSymbol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObjects:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "symbolName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v10))
  {

    goto LABEL_4;
  }
  objc_msgSend(v3, "symbolName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "containsObject:", v11);

  if (v12)
  {
LABEL_4:
    v13 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "frequency");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dbValue");
    v16 = v15;
    objc_msgSend(v3, "confidence");
    v18 = v17;
    objc_msgSend(v3, "symbolName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v6, "containsObject:", v19);

    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      v23 = v22;

      if (v23 != 0.0 && v18 <= v23)
        goto LABEL_17;
      objc_msgSend(getHKQuantityClass_0(), "quantityWithUnit:doubleValue:", *(_QWORD *)(a1 + 48), v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      AXLogAudiogram();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v14);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v37 = v14;
        v38 = 2112;
        v39 = v34;
        v40 = 2112;
        v41 = v24;
        v42 = 2048;
        v43 = v18;
        _os_log_debug_impl(&dword_22FB4F000, v25, OS_LOG_TYPE_DEBUG, "New most confident result: %@ Hz left %@ -> %@, confidence %f", buf, 0x2Au);

      }
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v24, v14);
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v14);
      v26 = *(void **)(a1 + 40);
    }
    else
    {
      objc_msgSend(v3, "symbolName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v9, "containsObject:", v27);

      if (!v28)
        goto LABEL_17;
      objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v14);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      v31 = v30;

      if (v31 != 0.0 && v18 <= v31)
        goto LABEL_17;
      objc_msgSend(getHKQuantityClass_0(), "quantityWithUnit:doubleValue:", *(_QWORD *)(a1 + 48), v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      AXLogAudiogram();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 80), "objectForKey:", v14);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v37 = v14;
        v38 = 2112;
        v39 = v35;
        v40 = 2112;
        v41 = v24;
        v42 = 2048;
        v43 = v18;
        _os_log_debug_impl(&dword_22FB4F000, v32, OS_LOG_TYPE_DEBUG, "New most confident result: %@ Hz right %@ -> %@, confidence %f", buf, 0x2Au);

      }
      objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:", v24, v14);
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v14);
      v26 = *(void **)(a1 + 72);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v33, v14);

LABEL_17:
  }

}

void __60__AIAudiogramIngestionEngine__audiogramFromAudiogramPoints___block_invoke_222(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id HKQuantityClass_0;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKQuantityClass_0 = getHKQuantityClass_0();
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "doubleValue");
  v10 = v9;

  objc_msgSend(HKQuantityClass_0, "quantityWithUnit:doubleValue:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(getHKAudiogramSensitivityPointClass(), "sensitivityPointWithFrequency:leftEarSensitivity:rightEarSensitivity:error:", v11, v5, v6, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;
  if (v13 || !v12)
  {
    AXLogAudiogram();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_199_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
  }

}

- (void)_setAudiogramAxisError:(unint64_t)a3 onError:(id *)a4
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown error: %d"), a4, a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24FD6D5E0[a3];
    if (a4)
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v10[0] = *MEMORY[0x24BDD0FC8];
      v10[1] = CFSTR("AIAudiogramAxisErrorKey");
      v11[0] = v5;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("AudiogramIngestion"), 0, v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      AXLogAudiogram();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AIAudiogramIngestionEngine _setAudiogramAxisError:onError:].cold.1();

    }
  }

}

- (id)_sortAndRemoveInvalidAxisValues:(id)a3 forAxis:(unint64_t)a4 error:(id *)a5
{
  id v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  int v36;
  int v37;
  NSObject *v38;
  unint64_t v39;
  int v40;
  int v41;
  int v42;
  int v43;
  void *v44;
  _BOOL4 v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  NSObject *v51;
  NSObject *v52;
  void *v54;
  _QWORD v57[4];
  int v58;
  int v59;
  _QWORD v60[4];
  id v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[5];
  _QWORD v68[4];
  id v69;
  int v70;
  _QWORD v71[5];
  uint8_t buf[4];
  _BYTE v73[10];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v71[0] = MEMORY[0x24BDAC760];
  v71[1] = 3221225472;
  v71[2] = __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke;
  v71[3] = &__block_descriptor_40_e47_q24__0__AIRecognizedText_8__AIRecognizedText_16l;
  v71[4] = a4;
  objc_msgSend(v6, "sortedArrayUsingComparator:", v71);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogAudiogram();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AIAudiogramIngestionEngine _sortAndRemoveInvalidAxisValues:forAxis:error:].cold.4();

  v68[0] = MEMORY[0x24BDAC760];
  v68[1] = 3221225472;
  v68[2] = __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_237;
  v68[3] = &unk_24FD6D4E0;
  v70 = v7;
  v69 = v8;
  objc_msgSend(v8, "ax_filteredArrayUsingBlock:", v68);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = MEMORY[0x24BDAC760];
  v67[1] = 3221225472;
  v67[2] = __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_2;
  v67[3] = &__block_descriptor_40_e33_B32__0__AIRecognizedText_8Q16_B24l;
  v67[4] = a4;
  objc_msgSend(v10, "ax_filteredArrayUsingBlock:", v67);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogAudiogram();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[AIAudiogramIngestionEngine _sortAndRemoveInvalidAxisValues:forAxis:error:].cold.3();

  if ((unint64_t)objc_msgSend(v11, "count") > 2)
  {
    -[AIAudiogramIngestionEngine _valueDifferencesForValues:stepDistance:forAxis:](self, "_valueDifferencesForValues:stepDistance:forAxis:", v11, a4, 0.1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogAudiogram();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[AIAudiogramIngestionEngine _sortAndRemoveInvalidAxisValues:forAxis:error:].cold.2();

    v64 = 0;
    v65[0] = &v64;
    v65[1] = 0x3032000000;
    v65[2] = __Block_byref_object_copy__2;
    v65[3] = __Block_byref_object_dispose__2;
    v66 = 0;
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_239;
    v60[3] = &unk_24FD6D550;
    v16 = v14;
    v62 = &v64;
    v63 = 0x3FC999999999999ALL;
    v61 = v16;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v60);
    v54 = v16;
    AXLogAudiogram();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[AIAudiogramIngestionEngine _sortAndRemoveInvalidAxisValues:forAxis:error:].cold.1((uint64_t)v65, v17, v18, v19, v20, v21, v22, v23);

    -[AIAudiogramIngestionEngine _meanFromNumbers:](self, "_meanFromNumbers:", *(_QWORD *)(v65[0] + 40));
    v25 = v24;
    if ((a4 != 1 || v24 >= 0.0) && (a4 || v24 >= 1.0))
    {
      v27 = 0;
      v28 = 4;
      do
      {
        -[AIAudiogramIngestionEngine _validMapForPointPairs:stepDistance:forValueDifference:forAxis:](self, "_validMapForPointPairs:stepDistance:forValueDifference:forAxis:", v11, a4, 0.1, v25, v54);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        AXLogAudiogram();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v73 = v11;
          _os_log_impl(&dword_22FB4F000, v30, OS_LOG_TYPE_INFO, "Pre-clean values: %@", buf, 0xCu);
        }

        AXLogAudiogram();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v73 = v29;
          _os_log_impl(&dword_22FB4F000, v31, OS_LOG_TYPE_INFO, "Pre-clean valid point map: %@", buf, 0xCu);
        }

        -[AIAudiogramIngestionEngine _validPointsFromMap:forValues:](self, "_validPointsFromMap:forValues:", v29, v11);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        -[AIAudiogramIngestionEngine _validMapForPointPairs:stepDistance:forValueDifference:forAxis:](self, "_validMapForPointPairs:stepDistance:forValueDifference:forAxis:", v32, a4, 0.1, v25);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        AXLogAudiogram();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v73 = v32;
          _os_log_impl(&dword_22FB4F000, v34, OS_LOG_TYPE_INFO, "Post-clean values: %@", buf, 0xCu);
        }

        AXLogAudiogram();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v73 = v33;
          _os_log_impl(&dword_22FB4F000, v35, OS_LOG_TYPE_INFO, "Post-clean valid point map: %@", buf, 0xCu);
        }

        v36 = objc_msgSend(v29, "isEqualToArray:", v33);
        if (v28)
          v37 = v36;
        else
          v37 = 1;
        --v28;
        v11 = v32;
        v27 = v33;
      }
      while (v37 != 1);
      if (objc_msgSend(v33, "ax_containsObjectUsingBlock:", &__block_literal_global_243))
      {
        AXLogAudiogram();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22FB4F000, v38, OS_LOG_TYPE_INFO, "Could not validate all values after multiple tries. Group is not valid, searching for largest valid section..", buf, 2u);
        }

        v39 = 0;
        v40 = -1;
        v41 = -1;
        v42 = -1;
        v43 = -1;
        while (objc_msgSend(v33, "count") > v39)
        {
          objc_msgSend(v33, "objectAtIndexedSubscript:", v39);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "integerValue") == 1;

          if (v43 - v42 <= v41 - v40)
            v46 = v40;
          else
            v46 = v42;
          if (v43 - v42 <= v41 - v40)
            v47 = v41;
          else
            v47 = v43;
          if (v42 == -1)
            v48 = v39;
          else
            v48 = v42;
          if (v45)
          {
            v42 = v48;
          }
          else
          {
            v40 = v46;
            v41 = v47;
            v42 = -1;
          }
          if (v45)
            v43 = v39;
          else
            v43 = -1;
          ++v39;
        }
        if (v43 - v42 <= v41 - v40)
          v49 = v40;
        else
          v49 = v42;
        if (v43 - v42 <= v41 - v40)
          v50 = v41;
        else
          v50 = v43;
        AXLogAudiogram();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v73 = v49;
          *(_WORD *)&v73[4] = 1024;
          *(_DWORD *)&v73[6] = v50;
          _os_log_impl(&dword_22FB4F000, v51, OS_LOG_TYPE_INFO, "Largest valid section is from %i to %i", buf, 0xEu);
        }

        v57[0] = MEMORY[0x24BDAC760];
        v57[1] = 3221225472;
        v57[2] = __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_244;
        v57[3] = &__block_descriptor_40_e33_B32__0__AIRecognizedText_8Q16_B24l;
        v58 = v49;
        v59 = v50;
        objc_msgSend(v32, "ax_filteredArrayUsingBlock:", v57);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = v32;
      }
      if ((unint64_t)objc_msgSend(v11, "count") > 1)
      {
        v13 = v11;
      }
      else
      {
        AXLogAudiogram();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22FB4F000, v52, OS_LOG_TYPE_INFO, "Could not validate enough values. Group is not valid", buf, 2u);
        }

        -[AIAudiogramIngestionEngine _setAudiogramAxisError:onError:](self, "_setAudiogramAxisError:onError:", 2, a5);
        v13 = 0;
      }

    }
    else
    {
      AXLogAudiogram();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v73 = v11;
        _os_log_impl(&dword_22FB4F000, v26, OS_LOG_TYPE_INFO, "Most frequently occuring value was less than 0 or 1 indicating the set is not increasing and not valid: %@", buf, 0xCu);
      }

      -[AIAudiogramIngestionEngine _setAudiogramAxisError:onError:](self, "_setAudiogramAxisError:onError:", 1, a5, v54);
      v13 = 0;
    }

    _Block_object_dispose(&v64, 8);
  }
  else
  {
    -[AIAudiogramIngestionEngine _setAudiogramAxisError:onError:](self, "_setAudiogramAxisError:onError:", 0, a5);
    v13 = 0;
  }

  return v13;
}

BOOL __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "center");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "center");
  v11 = v10;
  v13 = v12;

  if (v4)
    return v9 < v13;
  else
    return v7 > v11;
}

BOOL __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_237(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL8 v16;

  v5 = a2;
  if (*(int *)(a1 + 40) - 1 <= a3)
  {
    v16 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numericalValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numericalValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToNumber:", v8)
      && (objc_msgSend(v5, "center"), v10 = v9, objc_msgSend(v6, "center"), vabdd_f64(v10, v11) < 0.02))
    {
      objc_msgSend(v5, "center");
      v13 = v12;
      objc_msgSend(v6, "center");
      v15 = vabdd_f64(v13, v14);

      v16 = v15 >= 0.02;
    }
    else
    {

      v16 = 1;
    }

  }
  return v16;
}

uint64_t __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "numericalValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  v6 = *(_QWORD *)(a1 + 32);
  if (v6 == 1)
  {
    if (v5 >= -20.0 && v5 <= 120.0)
      return 1;
  }
  else
  {
    if (v6)
      return 1;
    v7 = AIAudiogramValidFrequencies;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend((id)v7, "containsObject:", v8);

    if ((v7 & 1) != 0)
      return 1;
  }
  return 0;
}

void __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_239(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t);
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v20[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = (void *)a1[4];
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_2_240;
  v15 = &unk_24FD6D528;
  v18 = a3;
  v9 = v5;
  v16 = v9;
  v19 = a1[6];
  v10 = v7;
  v17 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v12);
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "count", v12, v13, v14, v15);
  if (v11 < objc_msgSend(v10, "count"))
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v7);

}

void __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_2_240(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  v5 = a2;
  if (*(_QWORD *)(a1 + 48) != a3)
  {
    v11 = v5;
    objc_msgSend(*(id *)(a1 + 32), "doubleValue");
    v7 = v6;
    objc_msgSend(v11, "doubleValue");
    v9 = vabdd_f64(v7, v8);
    objc_msgSend(*(id *)(a1 + 32), "doubleValue");
    v5 = v11;
    if (v9 < v10 * *(double *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
      v5 = v11;
    }
  }

}

BOOL __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_241(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "integerValue") == 0;
}

BOOL __76__AIAudiogramIngestionEngine__sortAndRemoveInvalidAxisValues_forAxis_error___block_invoke_244(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return *(int *)(a1 + 32) <= a3 && *(int *)(a1 + 36) + 1 >= a3;
}

- (id)_valueDifferencesForValues:(id)a3 stepDistance:(double)a4 forAxis:(unint64_t)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  NSObject *v34;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  v9 = (void *)objc_opt_new();
  v11 = (v8 << 32) - 0x100000000;
  if (v11 >= 1)
  {
    v12 = 0;
    v13 = HIDWORD(v11);
    if (v13 <= 1)
      v14 = 1;
    else
      v14 = v13;
    *(_QWORD *)&v10 = 138413058;
    v36 = v10;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v12, v36);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", ++v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numericalValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (a5 == 1)
      {
        v19 = objc_msgSend(v17, "integerValue");
        objc_msgSend(v15, "numericalValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (double)(v19 - objc_msgSend(v20, "integerValue"));

        objc_msgSend(v15, "center");
        v23 = v22;
        objc_msgSend(v16, "center");
        v25 = v23 - v24;
      }
      else
      {
        objc_msgSend(v17, "doubleValue");
        v27 = v26;
        objc_msgSend(v15, "numericalValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "doubleValue");
        v21 = v27 / v29;

        objc_msgSend(v16, "center");
        v31 = v30;
        objc_msgSend(v15, "center");
        v25 = v31 - v32;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21 / (v25 / a4));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      AXLogAudiogram();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v36;
        v38 = v33;
        v39 = 2048;
        v40 = v25;
        v41 = 2048;
        v42 = v25 / a4;
        v43 = 2048;
        v44 = v21;
        _os_log_debug_impl(&dword_22FB4F000, v34, OS_LOG_TYPE_DEBUG, "Step value difference: %@ distance: %f distance factor: %f original val diff: %f", buf, 0x2Au);
      }

      objc_msgSend(v9, "addObject:", v33);
    }
    while (v14 != v12);
  }

  return v9;
}

- (id)_validMapForPointPairs:(id)a3 stepDistance:(double)a4 forValueDifference:(double)a5 forAxis:(unint64_t)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;

  v10 = a3;
  v11 = objc_msgSend(v10, "count");
  v12 = (void *)objc_opt_new();
  v13 = (v11 << 32) - 0x100000000;
  if (v13 >= 1)
  {
    v14 = 0;
    v15 = HIDWORD(v13);
    if (v15 <= 1)
      v16 = 1;
    else
      v16 = v15;
    do
    {
      objc_msgSend(v10, "objectAtIndex:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", ++v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[AIAudiogramIngestionEngine _isValidObject:toObject:withValueDifference:stepDistance:forAxis:](self, "_isValidObject:toObject:withValueDifference:stepDistance:forAxis:", v17, v18, a6, a5, a4);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v20);

    }
    while (v16 != v14);
  }

  return v12;
}

- (id)_validPointsFromMap:(id)a3 forValues:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  __int128 v26;
  void *v27;
  uint8_t buf[4];
  NSObject *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = objc_msgSend(v5, "count");
  if (v8 << 32 >= 1)
  {
    v10 = 0;
    v11 = ((v8 << 32) - 0x100000000) >> 32;
    if (v8 <= 1uLL)
      v12 = 1;
    else
      v12 = v8;
    *(_QWORD *)&v9 = 138412546;
    v26 = v9;
    v27 = v7;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v10, v26);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      if (v11 == v10)
      {
        if (v14)
        {
          objc_msgSend(v6, "objectAtIndex:", v11 + 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);
          AXLogAudiogram();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            goto LABEL_25;
          objc_msgSend(v15, "numericalValue");
          v17 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v29 = v17;
          _os_log_impl(&dword_22FB4F000, v16, OS_LOG_TYPE_INFO, "pairA valid. Add %@", buf, 0xCu);
LABEL_17:

          goto LABEL_25;
        }
      }
      else
      {
        objc_msgSend(v5, "objectAtIndex:", v10 + 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "BOOLValue");

        if (v10)
        {
          if (v19)
          {
            objc_msgSend(v6, "objectAtIndex:", v10 + 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v15);
            AXLogAudiogram();
            v16 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              goto LABEL_25;
LABEL_23:
            objc_msgSend(v15, "numericalValue");
            v22 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v29 = v22;
            v23 = v16;
            v24 = "pairB valid. Add %@";
LABEL_24:
            _os_log_impl(&dword_22FB4F000, v23, OS_LOG_TYPE_INFO, v24, buf, 0xCu);

            v7 = v27;
            goto LABEL_25;
          }
          if (v14)
          {
            objc_msgSend(v6, "objectAtIndex:", v10 + 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v15);
            AXLogAudiogram();
            v16 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              goto LABEL_25;
            objc_msgSend(v15, "numericalValue");
            v22 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v29 = v22;
            v23 = v16;
            v24 = "pairA valid. Add %@";
            goto LABEL_24;
          }
        }
        else
        {
          if (v14)
          {
            objc_msgSend(v6, "objectAtIndex:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectAtIndex:", 1);
            v16 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v15);
            objc_msgSend(v7, "addObject:", v16);
            AXLogAudiogram();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v15, "numericalValue");
              v20 = objc_claimAutoreleasedReturnValue();
              -[NSObject numericalValue](v16, "numericalValue");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v26;
              v29 = v20;
              v30 = 2112;
              v31 = v21;
              _os_log_impl(&dword_22FB4F000, v17, OS_LOG_TYPE_INFO, "pairA valid. Add %@, %@", buf, 0x16u);

              v7 = v27;
            }
            goto LABEL_17;
          }
          if (v19)
          {
            objc_msgSend(v6, "objectAtIndex:", 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v15);
            AXLogAudiogram();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              goto LABEL_23;
LABEL_25:

          }
        }
      }
      ++v10;
    }
    while (v12 != v10);
  }

  return v7;
}

- (BOOL)_isValidObject:(id)a3 toObject:(id)a4 withValueDifference:(double)a5 stepDistance:(double)a6 forAxis:(unint64_t)a7
{
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  BOOL v45;
  double v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  double v63;
  __int16 v64;
  double v65;
  __int16 v66;
  double v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (a7 == 1)
  {
    objc_msgSend(v11, "center");
    v15 = v14;
    objc_msgSend(v13, "center");
    v17 = v15 - v16;
  }
  else
  {
    objc_msgSend(v12, "center");
    v19 = v18;
    objc_msgSend(v11, "center");
    v17 = v19 - v20;
  }
  v21 = v17 / a6;
  v22 = v21 * a5;
  AXLogAudiogram();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "numericalValue");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numericalValue");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 138413314;
    v59 = v56;
    v60 = 2112;
    v61 = v57;
    v62 = 2048;
    v63 = v17;
    v64 = 2048;
    v65 = v21;
    v66 = 2048;
    v67 = v22;
    _os_log_debug_impl(&dword_22FB4F000, v23, OS_LOG_TYPE_DEBUG, "Pair (%@, %@), distance: %f distance factor: %f adjusted target value difference: %f", (uint8_t *)&v58, 0x34u);

  }
  objc_msgSend(v13, "numericalValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (a7 == 1)
  {
    v26 = objc_msgSend(v24, "integerValue");
    objc_msgSend(v11, "numericalValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (double)(v26 - objc_msgSend(v27, "integerValue"));

    v29 = v28 / v22;
    AXLogAudiogram();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[AIAudiogramIngestionEngine _isValidObject:toObject:withValueDifference:stepDistance:forAxis:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);

    v38 = v29 > 0.5;
    v39 = 1.5;
  }
  else
  {
    objc_msgSend(v24, "doubleValue");
    v41 = v40;
    objc_msgSend(v11, "numericalValue");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "doubleValue");
    v44 = v41 / v43;

    if (v44 <= 1.0)
    {
      v45 = 0;
      goto LABEL_18;
    }
    v46 = log(v44);
    v29 = fabs(v46 / log(v22));
    AXLogAudiogram();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      -[AIAudiogramIngestionEngine _isValidObject:toObject:withValueDifference:stepDistance:forAxis:].cold.2(v47, v48, v49, v50, v51, v52, v53, v54);

    v38 = v29 > 0.1;
    v39 = 8.0;
  }
  v45 = v29 < v39 && v38;
LABEL_18:

  return v45;
}

- (double)_stddevFromNumbers:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1548];
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expressionForFunction:arguments:", CFSTR("stddev:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "expressionValueWithObject:context:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  return v9;
}

- (double)_meanFromNumbers:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1548];
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expressionForFunction:arguments:", CFSTR("average:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "expressionValueWithObject:context:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  return v9;
}

- (double)_zScoreFromNumber:(double)a3 mean:(double)a4 stddev:(double)a5
{
  double result;

  result = 0.0;
  if (a5 != 0.0)
    return (a3 - a4) / a5;
  return result;
}

- (unsigned)_propertyOrientationFromOrientation:(int64_t)a3
{
  NSObject *v4;

  if ((unint64_t)a3 < 8)
    return dword_22FB903C0[a3];
  AXLogAudiogram();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[AIAudiogramIngestionEngine _propertyOrientationFromOrientation:].cold.1();

  return 1;
}

- (unint64_t)failureMode
{
  return self->_failureMode;
}

- (void)setFailureMode:(unint64_t)a3
{
  self->_failureMode = a3;
}

- (NSDictionary)assetProperties
{
  return self->_assetProperties;
}

- (void)setAssetProperties:(id)a3
{
  objc_storeStrong((id *)&self->_assetProperties, a3);
}

- (AIAudiogramIngestionEngineDelegate)delegate
{
  return (AIAudiogramIngestionEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VNCoreMLModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (AIAudiogramAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (BOOL)isRetrievingLatestModel
{
  return self->_isRetrievingLatestModel;
}

- (void)setIsRetrievingLatestModel:(BOOL)a3
{
  self->_isRetrievingLatestModel = a3;
}

- (BOOL)isRetrievingLatestModelSilently
{
  return self->_isRetrievingLatestModelSilently;
}

- (void)setIsRetrievingLatestModelSilently:(BOOL)a3
{
  self->_isRetrievingLatestModelSilently = a3;
}

- (NSString)modelLabelLeftEarSymbol
{
  return self->_modelLabelLeftEarSymbol;
}

- (void)setModelLabelLeftEarSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_modelLabelLeftEarSymbol, a3);
}

- (NSString)modelLabelRightEarSymbol
{
  return self->_modelLabelRightEarSymbol;
}

- (void)setModelLabelRightEarSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_modelLabelRightEarSymbol, a3);
}

- (NSString)modelLabelGraph
{
  return self->_modelLabelGraph;
}

- (void)setModelLabelGraph:(id)a3
{
  objc_storeStrong((id *)&self->_modelLabelGraph, a3);
}

- (float)modelLabelConfidenceThreshold
{
  return self->_modelLabelConfidenceThreshold;
}

- (void)setModelLabelConfidenceThreshold:(float)a3
{
  self->_modelLabelConfidenceThreshold = a3;
}

- (OS_dispatch_queue)analysisQueue
{
  return self->_analysisQueue;
}

- (void)setAnalysisQueue:(id)a3
{
  objc_storeStrong((id *)&self->_analysisQueue, a3);
}

- (_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel)symbolModel
{
  return self->_symbolModel;
}

- (void)setSymbolModel:(id)a3
{
  objc_storeStrong((id *)&self->_symbolModel, a3);
}

- (_TtC18AudiogramIngestion27AudiogramGraphDetectorModel)graphModel
{
  return self->_graphModel;
}

- (void)setGraphModel:(id)a3
{
  objc_storeStrong((id *)&self->_graphModel, a3);
}

- (NSString)leftEarAirConductionUnmaskedSymbol
{
  return self->_leftEarAirConductionUnmaskedSymbol;
}

- (void)setLeftEarAirConductionUnmaskedSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_leftEarAirConductionUnmaskedSymbol, a3);
}

- (NSString)leftEarAirConductionMaskedSymbol
{
  return self->_leftEarAirConductionMaskedSymbol;
}

- (void)setLeftEarAirConductionMaskedSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_leftEarAirConductionMaskedSymbol, a3);
}

- (NSString)rightEarAirConductionUnmaskedSymbol
{
  return self->_rightEarAirConductionUnmaskedSymbol;
}

- (void)setRightEarAirConductionUnmaskedSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_rightEarAirConductionUnmaskedSymbol, a3);
}

- (NSString)rightEarAirConductionMaskedSymbol
{
  return self->_rightEarAirConductionMaskedSymbol;
}

- (void)setRightEarAirConductionMaskedSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_rightEarAirConductionMaskedSymbol, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEarAirConductionMaskedSymbol, 0);
  objc_storeStrong((id *)&self->_rightEarAirConductionUnmaskedSymbol, 0);
  objc_storeStrong((id *)&self->_leftEarAirConductionMaskedSymbol, 0);
  objc_storeStrong((id *)&self->_leftEarAirConductionUnmaskedSymbol, 0);
  objc_storeStrong((id *)&self->_graphModel, 0);
  objc_storeStrong((id *)&self->_symbolModel, 0);
  objc_storeStrong((id *)&self->_analysisQueue, 0);
  objc_storeStrong((id *)&self->_modelLabelGraph, 0);
  objc_storeStrong((id *)&self->_modelLabelRightEarSymbol, 0);
  objc_storeStrong((id *)&self->_modelLabelLeftEarSymbol, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetProperties, 0);
}

- (void)_loadModelFromAssetPath:assetProperties:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "Failed to create vn core ml model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadModelFromAssetPath:assetProperties:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "Failed to create ml model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadModelFromAssetPath:assetProperties:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "Failed to compile ml model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadV2ModelFromAssetPath:assetProperties:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "Failed to compile symbol model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadV2ModelFromAssetPath:assetProperties:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "Failed to compile graph model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)modelDidUpdate:assetProperties:assetVersion:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22FB4F000, v0, v1, "AIAudiogramIngestionEngine received a model update with no error and no completion url", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_textFromAudiogramImage:regionOfInterest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "Error handling VNRecognizeTextRequest %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__AIAudiogramIngestionEngine__textFromAudiogramImage_regionOfInterest___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_22FB4F000, v0, v1, "Found text: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_observationsFromCIImage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22FB4F000, v0, v1, "Attempted to make object observation without a model", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_observationsFromCIImage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "Error handling VNCoreMLRequest %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_cropResultsFromImage:observations:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_22FB4F000, v0, v1, "Crop rects adjusted %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__AIAudiogramIngestionEngine__formatNumbersFromRecognizedText___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "Error getting bounding box: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)audiogramFromImages:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22FB4F000, v0, v1, "Could not ingest audiogram from image", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__AIAudiogramIngestionEngine_audiogramFromImages___block_invoke_190_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22FB4F000, v0, v1, "Could not ingest audiogram from image crop", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_196_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_22FB4F000, a1, a3, "Confidence %f too low", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __67__AIAudiogramIngestionEngine__audiogramFromSymbols_onAudiogramMap___block_invoke_199_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "Error creating sensitivity point: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)audiogramPointsFromImages:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22FB4F000, v0, v1, "v2: Could not ingest audiogram from image", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__AIAudiogramIngestionEngine_audiogramPointsFromImages___block_invoke_207_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22FB4F000, v0, v1, "v2: Could not ingest audiogram from image crop", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_setAudiogramAxisError:onError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "Audiogram axis: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sortAndRemoveInvalidAxisValues:(uint64_t)a3 forAxis:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_22FB4F000, a2, a3, "Filtered value differences: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_sortAndRemoveInvalidAxisValues:forAxis:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_22FB4F000, v0, v1, "Possible differences in values: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sortAndRemoveInvalidAxisValues:forAxis:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_22FB4F000, v0, v1, "Filtered values: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sortAndRemoveInvalidAxisValues:forAxis:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_22FB4F000, v0, v1, "Sorted values: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_isValidObject:(uint64_t)a3 toObject:(uint64_t)a4 withValueDifference:(uint64_t)a5 stepDistance:(uint64_t)a6 forAxis:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_22FB4F000, a1, a3, "Steps per Y distance: %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_isValidObject:(uint64_t)a3 toObject:(uint64_t)a4 withValueDifference:(uint64_t)a5 stepDistance:(uint64_t)a6 forAxis:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_22FB4F000, a1, a3, "Steps per X distance: %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_propertyOrientationFromOrientation:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_22FB4F000, v0, OS_LOG_TYPE_FAULT, "Unable to handle unknown UIImageOrientation (%ld)", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
