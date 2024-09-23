@implementation VCPVideoSceneClassifier

- (VCPVideoSceneClassifier)init
{
  char *v2;
  VCPVideoSceneClassifier *v3;
  uint64_t v4;
  uint64_t v5;
  NSMutableDictionary *existingScenes;
  int64_t v7;
  uint64_t v8;
  NSMutableArray *results;
  NSArray *sceneResults;
  NSArray *qualityResults;
  NSMutableDictionary *internalFrameScenes;
  uint64_t v13;
  NSMutableDictionary *thresholdBySceneID;
  uint64_t v15;
  NSMutableArray *objectsOfInterest;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VCPVideoSceneClassifier;
  v2 = -[VCPVideoSceneClassifier init](&v18, sel_init);
  v3 = (VCPVideoSceneClassifier *)v2;
  if (v2)
  {
    v4 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
    *(_OWORD *)(v2 + 8) = *MEMORY[0x1E0CA2E28];
    *((_QWORD *)v2 + 3) = v4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    existingScenes = v3->_existingScenes;
    v3->_existingScenes = (NSMutableDictionary *)v5;

    v7 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    *(_OWORD *)&v3->_start.value = *MEMORY[0x1E0CA2E18];
    v3->_start.epoch = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    results = v3->_results;
    v3->_results = (NSMutableArray *)v8;

    sceneResults = v3->_sceneResults;
    v3->_sceneResults = 0;

    qualityResults = v3->_qualityResults;
    v3->_qualityResults = 0;

    internalFrameScenes = v3->_internalFrameScenes;
    v3->_internalFrameScenes = 0;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    thresholdBySceneID = v3->_thresholdBySceneID;
    v3->_thresholdBySceneID = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E6B76248);
    v15 = objc_claimAutoreleasedReturnValue();
    objectsOfInterest = v3->_objectsOfInterest;
    v3->_objectsOfInterest = (NSMutableArray *)v15;

  }
  return v3;
}

- (float)adjustedConfidence:(id)a3 confidence:(float)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  float v21;

  v6 = a3;
  if (-[NSMutableDictionary count](self->_thresholdBySceneID, "count")
    && (-[NSMutableDictionary allKeys](self->_thresholdBySceneID, "allKeys"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsObject:", v6),
        v7,
        v8))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_thresholdBySceneID, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    a4 = a4 - v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nodeForSceneClassId:", objc_msgSend(v6, "unsignedIntValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v9, "highPrecisionThreshold");
      v14 = v13;
      objc_msgSend(v9, "highRecallThreshold");
      v16 = v15;
      objc_msgSend(v9, "searchThreshold");
      if (v16 >= v14)
        v18 = v14;
      else
        v18 = v16;
      if (v17 >= v18)
        v17 = v18;
      objc_msgSend(v12, "numberWithDouble:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_thresholdBySceneID, "setObject:forKeyedSubscript:", v19, v6);

      -[NSMutableDictionary objectForKeyedSubscript:](self->_thresholdBySceneID, "objectForKeyedSubscript:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      a4 = a4 - v21;

    }
  }

  return a4;
}

- (BOOL)compareObjectsOfInterest:(id)a3 withScenes:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_objectsOfInterest;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "allKeys", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v12);
        objc_msgSend(v7, "allKeys");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = objc_msgSend(v15, "containsObject:", v12);

        if (((v14 ^ v12) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)addResult:(id)a3 start:(id *)a4 duration:(id *)a5 keyIsName:(BOOL)a6
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *results;
  CFDictionaryRef v20;
  CFDictionaryRef v21;
  void *v22;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime time;
  _QWORD v30[3];
  _QWORD v31[3];
  _BYTE v32[128];
  uint64_t v33;

  v6 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v8, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "mad_extendedSceneIdFromSceneName:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringValue");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v18);

          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
      }
      while (v11);
    }

    v8 = v9;
  }
  if (objc_msgSend(v8, "count"))
  {
    results = self->_results;
    v30[0] = CFSTR("start");
    time = (CMTime)*a4;
    v20 = CMTimeCopyAsDictionary(&time, 0);
    v31[0] = v20;
    v30[1] = CFSTR("duration");
    time = (CMTime)*a5;
    v21 = CMTimeCopyAsDictionary(&time, 0);
    v30[2] = CFSTR("attributes");
    v31[1] = v21;
    v31[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](results, "addObject:", v22);

  }
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  NSMutableDictionary *internalFrameScenes;
  CMTime *p_timeLastProcess;
  int v11;
  __int128 v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  void *v25;
  char v26;
  int v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  float v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  NSMutableDictionary *existingScenes;
  uint64_t v56;
  NSMutableDictionary *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  NSMutableDictionary *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id *p_existingScenes;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t k;
  id v72;
  void *v73;
  void *v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t m;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  float v83;
  float v84;
  double v85;
  void *v86;
  id v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t n;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  __int128 v97;
  void *v99;
  id v100;
  id v101;
  id v102;
  id obj;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  CMTime *v109;
  void *context;
  uint64_t v111;
  VCPVideoSceneClassifier *v112;
  NSMutableDictionary *v113;
  id v114;
  id v115;
  CMTime v116;
  __int128 v117;
  int64_t v118;
  CMTime v119;
  __int128 v120;
  int64_t epoch;
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
  _QWORD v138[5];
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  id v147;
  id v148;
  id v149;
  id v150;
  CMTime time;
  CMTime rhs;
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  CMTime lhs;
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  internalFrameScenes = self->_internalFrameScenes;
  self->_internalFrameScenes = 0;

  v112 = self;
  p_timeLastProcess = (CMTime *)&self->_timeLastProcess;
  lhs = *(CMTime *)a4;
  v109 = (CMTime *)a4;
  rhs = *p_timeLastProcess;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) < 1.0)
    return 0;
  v12 = *(_OWORD *)&a4->var0;
  p_timeLastProcess->epoch = a4->var3;
  *(_OWORD *)&p_timeLastProcess->value = v12;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v112->_internalFrameScenes;
  v112->_internalFrameScenes = (NSMutableDictionary *)v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v114 = (id)objc_claimAutoreleasedReturnValue();
  v107 = (void *)MEMORY[0x1BCCA1B2C]();
  v15 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v108 = (void *)objc_msgSend(v15, "initWithCVPixelBuffer:options:", a3, MEMORY[0x1E0C9AA70]);
  if (v108)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0CEE020]);
    v17 = v16;
    v104 = v16;
    if (!v16)
    {
      v27 = 1;
LABEL_74:

      v11 = -18;
      goto LABEL_75;
    }
    objc_msgSend(v16, "setPreferBackgroundProcessing:", 1);
    v150 = 0;
    v18 = objc_msgSend(v17, "setRevision:error:", 3737841665, &v150);
    v19 = v150;
    if ((v18 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(lhs.value) = 134218242;
        *(CMTimeValue *)((char *)&lhs.value + 4) = 3737841665;
        LOWORD(lhs.flags) = 2112;
        *(_QWORD *)((char *)&lhs.flags + 2) = v19;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to set VNSceneClassificationRequest with revision %lu - %@", (uint8_t *)&lhs, 0x16u);
      }
      v27 = 1;
      goto LABEL_73;
    }
    v20 = objc_alloc_init(MEMORY[0x1E0CEDD88]);
    v21 = v20;
    if (!v20)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        v27 = 1;
LABEL_72:

LABEL_73:
        goto LABEL_74;
      }
      v102 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v28 = objc_opt_class();
        LODWORD(lhs.value) = 138412290;
        *(CMTimeValue *)((char *)&lhs.value + 4) = v28;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create %@", (uint8_t *)&lhs, 0xCu);
      }
      v27 = 1;
LABEL_71:
      v21 = v102;
      goto LABEL_72;
    }
    v102 = v20;
    objc_msgSend(v20, "setPreferBackgroundProcessing:", 1);
    v149 = v19;
    v22 = objc_msgSend(v21, "setRevision:error:", 2, &v149);
    v100 = v149;

    if ((v22 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(lhs.value) = 134218242;
        *(CMTimeValue *)((char *)&lhs.value + 4) = 2;
        LOWORD(lhs.flags) = 2112;
        *(_QWORD *)((char *)&lhs.flags + 2) = v100;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to set VNClassifySignificantEventRequest::setRevision %lu: %@", (uint8_t *)&lhs, 0x16u);
      }
      v27 = 1;
      v19 = v100;
      goto LABEL_71;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v108;
    objc_msgSend(v99, "addObject:", v104);
    objc_msgSend(v99, "addObject:", v102);
    if (objc_msgSend(MEMORY[0x1E0CEE018], "mad_includeEntityNet"))
    {
      v24 = objc_alloc_init(MEMORY[0x1E0CEDDD8]);
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "setPreferBackgroundProcessing:", 1);
        v148 = v100;
        v26 = objc_msgSend(v25, "setRevision:error:", 3737841667, &v148);
        v19 = v148;

        if ((v26 & 1) != 0)
        {
          objc_msgSend(v25, "setMaximumLeafObservations:", 15);
          objc_msgSend(v25, "setMaximumHierarchicalObservations:", 15);
          objc_msgSend(v99, "addObject:", v25);

          v23 = v108;
LABEL_28:
          v147 = v19;
          v29 = objc_msgSend(v23, "performRequests:error:", v99, &v147);
          v101 = v147;

          if ((v29 & 1) != 0)
          {
            v145 = 0u;
            v146 = 0u;
            v143 = 0u;
            v144 = 0u;
            obj = v99;
            v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v158, 16);
            if (v30)
            {
              v105 = *(_QWORD *)v144;
              do
              {
                v31 = 0;
                v106 = v30;
                do
                {
                  if (*(_QWORD *)v144 != v105)
                    objc_enumerationMutation(obj);
                  v111 = v31;
                  v32 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * v31);
                  context = (void *)MEMORY[0x1BCCA1B2C]();
                  v141 = 0u;
                  v142 = 0u;
                  v139 = 0u;
                  v140 = 0u;
                  objc_msgSend(v32, "results");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v139, v157, 16);
                  if (v34)
                  {
                    v35 = *(_QWORD *)v140;
                    do
                    {
                      for (i = 0; i != v34; ++i)
                      {
                        if (*(_QWORD *)v140 != v35)
                          objc_enumerationMutation(v33);
                        v37 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * i);
                        objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy");
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v37, "identifier");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v38, "nodeForName:", v39);
                        v40 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v40)
                        {
                          if (objc_msgSend(v40, "isIndexed"))
                          {
                            objc_msgSend(v40, "highPrecisionThreshold");
                            v42 = v41;
                            objc_msgSend(v40, "highRecallThreshold");
                            v44 = v43;
                            objc_msgSend(v40, "searchThreshold");
                            v46 = v45;
                            objc_msgSend(v37, "confidence");
                            if (v44 >= v42)
                              v48 = v42;
                            else
                              v48 = v44;
                            if (v46 < v48)
                              v48 = v46;
                            v49 = v47;
                            if (v48 < 0.01)
                              v48 = 0.01;
                            if (v48 < v49)
                              objc_msgSend(v114, "addObject:", v37);
                          }
                          else if ((int)MediaAnalysisLogLevel() >= 7
                                 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                          {
                            objc_msgSend(v37, "identifier");
                            v51 = (void *)objc_claimAutoreleasedReturnValue();
                            LODWORD(lhs.value) = 138412290;
                            *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)v51;
                            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VideoSceneClassifier] Not-indexed scene label - %@", (uint8_t *)&lhs, 0xCu);

                          }
                        }
                        else if ((int)MediaAnalysisLogLevel() >= 7
                               && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                        {
                          objc_msgSend(v37, "identifier");
                          v50 = (void *)objc_claimAutoreleasedReturnValue();
                          LODWORD(lhs.value) = 138412290;
                          *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)v50;
                          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VideoSceneClassifier] Unsupported scene label - %@", (uint8_t *)&lhs, 0xCu);

                        }
                      }
                      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v139, v157, 16);
                    }
                    while (v34);
                  }

                  objc_autoreleasePoolPop(context);
                  v31 = v111 + 1;
                }
                while (v111 + 1 != v106);
                v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v158, 16);
              }
              while (v30);
            }

            v27 = 0;
            v19 = v101;
            goto LABEL_70;
          }
          v19 = v101;
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            LODWORD(lhs.value) = 138412290;
            *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)v101;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoSceneClassifier] Failed to classify scene - %@", (uint8_t *)&lhs, 0xCu);
          }
LABEL_69:
          v27 = 1;
LABEL_70:

          goto LABEL_71;
        }
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          LODWORD(lhs.value) = 134218242;
          *(CMTimeValue *)((char *)&lhs.value + 4) = 3737841667;
          LOWORD(lhs.flags) = 2112;
          *(_QWORD *)((char *)&lhs.flags + 2) = v19;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to set VNClassifyImageRequest with revision %lu - %@", (uint8_t *)&lhs, 0x16u);
        }
      }
      else
      {
        v19 = v100;
      }

      goto LABEL_69;
    }
    v19 = v100;
    goto LABEL_28;
  }
  v11 = -108;
  v27 = 1;
LABEL_75:

  objc_autoreleasePoolPop(v107);
  if (v27)
  {
    v52 = v114;
  }
  else
  {
    if (objc_msgSend(v114, "count"))
    {
      if ((unint64_t)objc_msgSend(v114, "count") < 0x29)
      {
        v54 = v114;
      }
      else
      {
        v138[0] = MEMORY[0x1E0C809B0];
        v138[1] = 3221225472;
        v138[2] = __72__VCPVideoSceneClassifier_analyzeFrame_withTimestamp_andDuration_flags___block_invoke;
        v138[3] = &unk_1E6B168F0;
        v138[4] = v112;
        objc_msgSend(v114, "sortUsingComparator:", v138);
        objc_msgSend(v114, "subarrayWithRange:", 0, 40);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)objc_msgSend(v53, "mutableCopy");

      }
      v136 = 0u;
      v137 = 0u;
      v134 = 0u;
      v135 = 0u;
      v115 = v54;
      v58 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v134, v156, 16);
      if (v58)
      {
        v59 = *(_QWORD *)v135;
        do
        {
          for (j = 0; j != v58; ++j)
          {
            if (*(_QWORD *)v135 != v59)
              objc_enumerationMutation(v115);
            v61 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * j);
            v62 = v112->_internalFrameScenes;
            v63 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v61, "confidence");
            objc_msgSend(v63, "numberWithFloat:");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "identifier");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v62, "setObject:forKey:", v64, v65);

          }
          v58 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v134, v156, 16);
        }
        while (v58);
      }

      v66 = objc_msgSend(v115, "count");
      p_existingScenes = (id *)&v112->_existingScenes;
      if (v66 == -[NSMutableDictionary count](v112->_existingScenes, "count"))
      {
        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        v68 = v115;
        v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v130, v155, 16);
        if (v69)
        {
          v70 = *(_QWORD *)v131;
          while (2)
          {
            for (k = 0; k != v69; ++k)
            {
              if (*(_QWORD *)v131 != v70)
                objc_enumerationMutation(v68);
              v72 = *p_existingScenes;
              objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * k), "identifier");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "objectForKeyedSubscript:", v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v72) = v74 == 0;

              if ((v72 & 1) != 0)
              {
                v75 = 0;
                goto LABEL_101;
              }
            }
            v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v130, v155, 16);
            if (v69)
              continue;
            break;
          }
        }
        v75 = 1;
LABEL_101:

      }
      else
      {
        v75 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v113 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      if (v75)
      {
        v128 = 0uLL;
        v129 = 0uLL;
        v126 = 0uLL;
        v127 = 0uLL;
        v52 = v115;
        v76 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v126, v154, 16);
        if (v76)
        {
          v77 = *(_QWORD *)v127;
          do
          {
            for (m = 0; m != v76; ++m)
            {
              if (*(_QWORD *)v127 != v77)
                objc_enumerationMutation(v52);
              v79 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * m);
              v80 = *p_existingScenes;
              objc_msgSend(v79, "identifier");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "objectForKeyedSubscript:", v81);
              v82 = (void *)objc_claimAutoreleasedReturnValue();

              if (v82)
              {
                objc_msgSend(v82, "floatValue");
                v84 = v83;
                objc_msgSend(v79, "confidence");
                if (v84 >= *(float *)&v85)
                  *(float *)&v85 = v84;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v85);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                v87 = *p_existingScenes;
                objc_msgSend(v79, "identifier");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "setObject:forKeyedSubscript:", v86, v88);

              }
            }
            v76 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v126, v154, 16);
          }
          while (v76);
        }

      }
      else
      {
        v124 = 0uLL;
        v125 = 0uLL;
        v122 = 0uLL;
        v123 = 0uLL;
        v52 = v115;
        v89 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v122, v153, 16);
        if (v89)
        {
          v90 = *(_QWORD *)v123;
          do
          {
            for (n = 0; n != v89; ++n)
            {
              if (*(_QWORD *)v123 != v90)
                objc_enumerationMutation(v52);
              v92 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * n);
              v93 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v92, "confidence");
              objc_msgSend(v93, "numberWithFloat:");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "identifier");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v113, "setObject:forKeyedSubscript:", v94, v95);

            }
            v89 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v122, v153, 16);
          }
          while (v89);
        }

        v96 = *p_existingScenes;
        v120 = *(_OWORD *)&v112->_start.value;
        epoch = v112->_start.epoch;
        lhs = *v109;
        rhs = (CMTime)v112->_start;
        CMTimeSubtract(&v119, &lhs, &rhs);
        -[VCPVideoSceneClassifier addResult:start:duration:keyIsName:](v112, "addResult:start:duration:keyIsName:", v96, &v120, &v119, 1);
        objc_storeStrong(p_existingScenes, v113);
        v97 = *(_OWORD *)&v109->value;
        v112->_start.epoch = v109->epoch;
        *(_OWORD *)&v112->_start.value = v97;
      }
      v57 = v113;
    }
    else
    {
      existingScenes = v112->_existingScenes;
      v117 = *(_OWORD *)&v112->_start.value;
      v118 = v112->_start.epoch;
      lhs = *v109;
      rhs = (CMTime)v112->_start;
      CMTimeSubtract(&v116, &lhs, &rhs);
      -[VCPVideoSceneClassifier addResult:start:duration:keyIsName:](v112, "addResult:start:duration:keyIsName:", existingScenes, &v117, &v116, 1);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v112->_existingScenes;
      v112->_existingScenes = (NSMutableDictionary *)v56;
      v52 = v114;
    }

    v11 = 0;
  }

  return v11;
}

uint64_t __72__VCPVideoSceneClassifier_analyzeFrame_withTimestamp_andDuration_flags___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  uint64_t v23;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nodeForName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sceneClassId");

  v11 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "confidence");
  objc_msgSend(v11, "adjustedConfidence:confidence:", v12);
  v14 = v13;

  objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "nodeForName:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "sceneClassId");

  v19 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "confidence");
  objc_msgSend(v19, "adjustedConfidence:confidence:", v20);
  v22 = v21;

  if (v14 > v22)
    v23 = -1;
  else
    v23 = v14 < v22;

  return v23;
}

- (id)sortScenesWithMaxNumCap:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_14);
  if ((unint64_t)objc_msgSend(v4, "count") >= 0x29)
  {
    objc_msgSend(v4, "subarrayWithRange:", 0, 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mutableCopy");

    v4 = (void *)v6;
  }
  return v4;
}

uint64_t __51__VCPVideoSceneClassifier_sortScenesWithMaxNumCap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "sumAdjustConfidence");
  v7 = v6;
  objc_msgSend(v5, "sumAdjustConfidence");
  if (v7 <= v8)
  {
    objc_msgSend(v4, "sumAdjustConfidence");
    v11 = v10;
    objc_msgSend(v5, "sumAdjustConfidence");
    v9 = v11 < v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (void)addAggregatedScenes:(id)a3 timerange:(id *)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  int64_t v25;
  __int128 v26;
  int64_t var3;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[VCPVideoSceneClassifier sortScenesWithMaxNumCap:](self, "sortScenesWithMaxNumCap:", a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v23;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "adjustDuration");
        if (v12 != 0.0)
        {
          objc_msgSend(v11, "sumAdjustConfidence");
          v14 = v13;
          objc_msgSend(v11, "adjustDuration");
          if ((float)(v14 / v15) >= 0.0)
          {
            v16 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v11, "sumConfidence");
            v18 = v17;
            objc_msgSend(v11, "duration");
            *(float *)&v20 = v18 / v19;
            objc_msgSend(v16, "numberWithFloat:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "sceneId");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, v22);

          }
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

  v26 = *(_OWORD *)&a4->var0.var0;
  var3 = a4->var0.var3;
  v24 = *(_OWORD *)&a4->var1.var0;
  v25 = a4->var1.var3;
  -[VCPVideoSceneClassifier addResult:start:duration:keyIsName:](self, "addResult:start:duration:keyIsName:", v6, &v26, &v24, 0);

}

- (id)filteredKeyFrameResults
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  BOOL v13;
  id v15;
  CMTime time;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v19;
  CMTimeRange v20;
  CMTime v21;
  CMTimeRange v22;
  CMTime rhs;
  CMTime lhs;
  CMTime time2;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_results);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[NSArray count](self->_qualityResults, "count");
  v4 = objc_msgSend(v15, "count");
  if (v4 >= 1)
  {
    LODWORD(v5) = v3 - 1;
    v6 = v4;
    do
    {
      memset(&v22, 0, sizeof(v22));
      objc_msgSend(v15, "objectAtIndexedSubscript:", (v6 - 1));
      v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeRangeMakeFromDictionary(&v22, v7);

      v21 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      if ((v5 & 0x80000000) == 0)
      {
        v5 = v5;
        while (1)
        {
          memset(&v20, 0, sizeof(v20));
          -[NSArray objectAtIndexedSubscript:](self->_qualityResults, "objectAtIndexedSubscript:", v5);
          v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CMTimeRangeMakeFromDictionary(&v20, v8);

          -[NSArray objectAtIndexedSubscript:](self->_qualityResults, "objectAtIndexedSubscript:", v5);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("quality"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "floatValue");
          v12 = v11;

          if (v12 < 0.3)
          {
            range = v20;
            memset(&v19, 0, sizeof(v19));
            otherRange = v22;
            CMTimeRangeGetIntersection(&v19, &range, &otherRange);
            lhs = v21;
            rhs = v19.duration;
            CMTimeAdd(&time2, &lhs, &rhs);
            v21 = time2;
          }
          *(_OWORD *)&v19.start.value = *(_OWORD *)&v20.start.value;
          v19.start.epoch = v20.start.epoch;
          time2 = v22.start;
          if (CMTimeCompare(&v19.start, &time2) < 1)
            break;
          v13 = v5-- <= 0;
          if (v13)
          {
            LODWORD(v5) = -1;
            break;
          }
        }
      }
      time = v21;
      if (CMTimeGetSeconds(&time) > 0.0)
        objc_msgSend(v15, "removeObjectAtIndex:", (v6 - 1));
      v13 = v6-- <= 1;
    }
    while (!v13);
  }
  return v15;
}

- (void)findObjectsOfInterest:(id)a3
{
  void *v4;
  const __CFDictionary *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  float v14;
  float v15;
  double Seconds;
  void *v17;
  double v18;
  float v19;
  float v20;
  void *v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  double v26;
  float v27;
  double v28;
  float v29;
  double v30;
  double v31;
  float v32;
  VCPClassification *v33;
  double v34;
  double v35;
  double v36;
  VCPClassification *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  float v43;
  float v44;
  float v45;
  float v46;
  NSMutableArray *objectsOfInterest;
  void *v48;
  id v49;
  unint64_t i;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CMTime time;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  CMTimeRange v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; objc_msgSend(v49, "count") > i; ++i)
  {
    memset(&v60, 0, sizeof(v60));
    objc_msgSend(v49, "objectAtIndexedSubscript:");
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeRangeMakeFromDictionary(&v60, v5);

    objc_msgSend(v49, "objectAtIndexedSubscript:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("attributes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)v57 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          objc_msgSend(v8, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "floatValue");
          v15 = v14;

          time = v60.duration;
          Seconds = CMTimeGetSeconds(&time);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "intValue"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v18 = v15;
          -[VCPVideoSceneClassifier adjustedConfidence:confidence:](self, "adjustedConfidence:confidence:", v17, v18);
          v20 = v19;

          objc_msgSend(v4, "objectForKeyedSubscript:", v12);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          v23 = Seconds;
          v24 = v15 * v23;
          if (v21)
          {
            objc_msgSend(v21, "sumConfidence");
            *(float *)&v26 = v24 + v25;
            objc_msgSend(v22, "setSumConfidence:", v26);
            objc_msgSend(v22, "sumAdjustConfidence");
            *(float *)&v28 = v20 + v27;
            objc_msgSend(v22, "setSumAdjustConfidence:", v28);
            objc_msgSend(v22, "duration");
            *(float *)&v30 = v29 + v23;
            objc_msgSend(v22, "setDuration:", v30);
            objc_msgSend(v22, "adjustDuration");
            if (v20 <= 0.0)
              v32 = 0.0;
            else
              v32 = v23;
            *(float *)&v31 = v32 + *(float *)&v31;
            objc_msgSend(v22, "setAdjustDuration:", v31);
          }
          else
          {
            v33 = [VCPClassification alloc];
            *(float *)&v34 = v23;
            *(float *)&v35 = v24;
            *(float *)&v36 = v20;
            v37 = -[VCPClassification initWithSceneId:withDuration:withConfidence:withAdjustConfidence:](v33, "initWithSceneId:withDuration:withConfidence:withAdjustConfidence:", v12, v34, v35, v36);
            if (v37)
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, v12);

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v9);
    }

  }
  -[VCPVideoSceneClassifier sortScenesWithMaxNumCap:](self, "sortScenesWithMaxNumCap:", v4);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v52 != v40)
          objc_enumerationMutation(v38);
        v42 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * k);
        objc_msgSend(v42, "adjustDuration");
        if (v43 != 0.0)
        {
          objc_msgSend(v42, "sumAdjustConfidence");
          v45 = v44;
          objc_msgSend(v42, "adjustDuration");
          if ((float)(v45 / v46) >= 0.0)
          {
            objectsOfInterest = self->_objectsOfInterest;
            objc_msgSend(v42, "sceneId");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](objectsOfInterest, "addObject:", v48);

          }
        }
      }
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v39);
  }

}

- (int)finishAnalysisPass:(id *)a3
{
  unsigned __int8 v5;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 *p_start;
  NSMutableDictionary *existingScenes;
  int v9;
  const __CFDictionary *v10;
  void *v11;
  CMTimeFlags v12;
  unint64_t j;
  const __CFDictionary *v14;
  void *v15;
  uint64_t v16;
  CMTimeFlags v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  void *v23;
  float v24;
  float v25;
  double Seconds;
  void *v27;
  double v28;
  float v29;
  float v30;
  void *v31;
  void *v32;
  float v33;
  float v34;
  float v35;
  double v36;
  float v37;
  double v38;
  float v39;
  double v40;
  double v41;
  float v42;
  VCPClassification *v43;
  double v44;
  double v45;
  double v46;
  VCPClassification *v47;
  NSArray *obj;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  CMTimeScale v53;
  CMTimeEpoch v54;
  CMTimeEpoch v55;
  CMTimeValue v56;
  CMTimeFlags flags;
  CMTimeFlags v58;
  void *v59;
  void *v60;
  unint64_t v61;
  CMTimeValue v62;
  CMTimeScale v63;
  CMTimeFlags v64;
  CMTimeEpoch v65;
  CMTimeValue v66;
  CMTimeScale v67;
  CMTimeFlags v68;
  uint64_t v69;
  CMTime time;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  CMTimeRange v75;
  CMTimeRange v76;
  CMTimeRange v77;
  CMTimeValue v78;
  CMTimeScale v79;
  CMTimeFlags v80;
  CMTimeEpoch v81;
  CMTimeValue v82;
  CMTimeScale v83;
  CMTimeFlags v84;
  uint64_t v85;
  CMTime v86;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange v89;
  CMTimeRange v90;
  CMTimeRange time2;
  CMTimeRange rhs;
  CMTimeRange lhs;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  CMTime v98;
  __int128 v99;
  int64_t epoch;
  CMTimeRange range;
  CMTime v102;
  CMTime start;
  _BYTE v104[128];
  CMTimeValue value;
  CMTimeScale timescale;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  if ((v5 & 1) == 0
  {
    CMTimeMake((CMTime *)&-[VCPVideoSceneClassifier finishAnalysisPass:]::kMinSceneSegmentDuration, 300, 600);
  }
  memset(&v102, 0, sizeof(v102));
  v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v102, &range);
  p_start = &self->_start;
  if ((self->_start.flags & 1) != 0)
  {
    existingScenes = self->_existingScenes;
    v99 = *(_OWORD *)&p_start->value;
    epoch = self->_start.epoch;
    lhs.start = v102;
    *(_OWORD *)&rhs.start.value = *(_OWORD *)&p_start->value;
    rhs.start.epoch = self->_start.epoch;
    CMTimeSubtract(&v98, &lhs.start, &rhs.start);
    -[VCPVideoSceneClassifier addResult:start:duration:keyIsName:](self, "addResult:start:duration:keyIsName:", existingScenes, &v99, &v98, 1);
  }
  if (self->_sceneResults)
  {
    -[VCPVideoSceneClassifier filteredKeyFrameResults](self, "filteredKeyFrameResults");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPVideoSceneClassifier findObjectsOfInterest:](self, "findObjectsOfInterest:", v60);
    -[NSMutableArray removeAllObjects](self->_results, "removeAllObjects");
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    obj = self->_sceneResults;
    v50 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
    if (v50)
    {
      v9 = 0;
      v51 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v95 != v51)
            objc_enumerationMutation(obj);
          v10 = *(const __CFDictionary **)(*((_QWORD *)&v94 + 1) + 8 * i);
          memset(&lhs, 0, sizeof(lhs));
          CMTimeRangeMakeFromDictionary(&lhs, v10);
          rhs.start = lhs.duration;
          *(_OWORD *)&time2.start.value = -[VCPVideoSceneClassifier finishAnalysisPass:]::kMinSceneSegmentDuration;
          time2.start.epoch = qword_1EF150D68;
          if ((CMTimeCompare(&rhs.start, &time2.start) & 0x80000000) == 0)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            memset(&rhs, 0, sizeof(rhs));
            CMTimeRangeMakeFromDictionary(&rhs, v10);
            value = *MEMORY[0x1E0CA2E40];
            v12 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 12);
            timescale = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 8);
            v56 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 24);
            v53 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 32);
            flags = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 36);
            v58 = v12;
            v54 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 16);
            v55 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 40);
            for (j = v9; ; j = v61 + 1)
            {
              v61 = j;
              if (objc_msgSend(v60, "count") <= j)
                break;
              memset(&time2, 0, sizeof(time2));
              objc_msgSend(v60, "objectAtIndexedSubscript:");
              v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              CMTimeRangeMakeFromDictionary(&time2, v14);

              v89 = rhs;
              memset(&v90, 0, sizeof(v90));
              otherRange = time2;
              CMTimeRangeGetIntersection(&v90, &v89, &otherRange);
              if ((v90.start.flags & 1) == 0
                || (v90.duration.flags & 1) == 0
                || v90.duration.epoch
                || v90.duration.value < 0
                || (time1 = v90.duration, v86 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&time1, &v86)))
              {
                objc_msgSend(v60, "objectAtIndexedSubscript:", v61);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("attributes"));
                v59 = (void *)objc_claimAutoreleasedReturnValue();

                if (-[VCPVideoSceneClassifier compareObjectsOfInterest:withScenes:](self, "compareObjectsOfInterest:withScenes:", v59, v11)&& objc_msgSend(v11, "count")&& (v58 & 1) != 0&& (flags & 1) != 0&& !v55&& (v56 & 0x8000000000000000) == 0)
                {
                  v78 = value;
                  v79 = timescale;
                  v80 = v58;
                  v81 = v54;
                  v82 = v56;
                  v83 = v53;
                  v84 = flags;
                  v85 = 0;
                  -[VCPVideoSceneClassifier addAggregatedScenes:timerange:](self, "addAggregatedScenes:timerange:", v11, &v78);
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v16 = objc_claimAutoreleasedReturnValue();

                  value = *MEMORY[0x1E0CA2E40];
                  v17 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 12);
                  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 8);
                  v56 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 24);
                  v53 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 32);
                  flags = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 36);
                  v58 = v17;
                  v54 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 16);
                  v55 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 40);
                  v11 = (void *)v16;
                }
                if ((v58 & 1) == 0 || (flags & 1) == 0 || v55 || v56 < 0)
                {
                  v77 = v90;
                }
                else
                {
                  v76.start.value = value;
                  v76.start.timescale = timescale;
                  v76.start.flags = v58;
                  v76.start.epoch = v54;
                  v76.duration.value = v56;
                  v76.duration.timescale = v53;
                  v76.duration.flags = flags;
                  v76.duration.epoch = 0;
                  v75 = v90;
                  CMTimeRangeGetUnion(&v77, &v76, &v75);
                }
                value = v77.start.value;
                timescale = v77.start.timescale;
                v56 = v77.duration.value;
                v53 = v77.duration.timescale;
                flags = v77.duration.flags;
                v58 = v77.start.flags;
                v54 = v77.start.epoch;
                v55 = v77.duration.epoch;
                v71 = 0u;
                v72 = 0u;
                v73 = 0u;
                v74 = 0u;
                v18 = v59;
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v104, 16);
                if (v19)
                {
                  v20 = *(_QWORD *)v72;
                  do
                  {
                    for (k = 0; k != v19; ++k)
                    {
                      if (*(_QWORD *)v72 != v20)
                        objc_enumerationMutation(v18);
                      v22 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * k);
                      objc_msgSend(v18, "objectForKeyedSubscript:", v22);
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v23, "floatValue");
                      v25 = v24;

                      time = v90.duration;
                      Seconds = CMTimeGetSeconds(&time);
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v22, "intValue"));
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      *(float *)&v28 = v25;
                      -[VCPVideoSceneClassifier adjustedConfidence:confidence:](self, "adjustedConfidence:confidence:", v27, v28);
                      v30 = v29;

                      objc_msgSend(v11, "objectForKeyedSubscript:", v22);
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      v32 = v31;
                      v33 = Seconds;
                      v34 = v25 * v33;
                      if (v31)
                      {
                        objc_msgSend(v31, "sumConfidence");
                        *(float *)&v36 = v34 + v35;
                        objc_msgSend(v32, "setSumConfidence:", v36);
                        objc_msgSend(v32, "sumAdjustConfidence");
                        *(float *)&v38 = v30 + v37;
                        objc_msgSend(v32, "setSumAdjustConfidence:", v38);
                        objc_msgSend(v32, "duration");
                        *(float *)&v40 = v39 + v33;
                        objc_msgSend(v32, "setDuration:", v40);
                        objc_msgSend(v32, "adjustDuration");
                        if (v30 <= 0.0)
                          v42 = 0.0;
                        else
                          v42 = v33;
                        *(float *)&v41 = v42 + *(float *)&v41;
                        objc_msgSend(v32, "setAdjustDuration:", v41);
                      }
                      else
                      {
                        v43 = [VCPClassification alloc];
                        *(float *)&v44 = v33;
                        *(float *)&v45 = v34;
                        *(float *)&v46 = v30;
                        v47 = -[VCPClassification initWithSceneId:withDuration:withConfidence:withAdjustConfidence:](v43, "initWithSceneId:withDuration:withConfidence:withAdjustConfidence:", v22, v44, v45, v46);
                        if (v47)
                          objc_msgSend(v11, "setObject:forKeyedSubscript:", v47, v22);

                      }
                    }
                    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v104, 16);
                  }
                  while (v19);
                }

              }
              else
              {
                *(_OWORD *)&v77.start.value = *(_OWORD *)&time2.start.value;
                v77.start.epoch = time2.start.epoch;
                start = rhs.start;
                if (CMTimeCompare(&v77.start, &start) >= 1)
                  break;
              }
            }
            if (objc_msgSend(v11, "count")
              && (v58 & 1) != 0
              && (flags & 1) != 0
              && !v55
              && (v56 & 0x8000000000000000) == 0)
            {
              v62 = value;
              v63 = timescale;
              v64 = v58;
              v65 = v54;
              v66 = v56;
              v67 = v53;
              v68 = flags;
              v69 = 0;
              -[VCPVideoSceneClassifier addAggregatedScenes:timerange:](self, "addAggregatedScenes:timerange:", v11, &v62);
            }

            v9 = v61;
          }
        }
        v50 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
      }
      while (v50);
    }

  }
  return 0;
}

- (id)results
{
  NSMutableArray *results;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  results = self->_results;
  if (results)
  {
    v5 = CFSTR("ClassificationResults");
    v6[0] = results;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSDictionary)frameScenes
{
  void *v2;

  if (self->_internalFrameScenes)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (NSArray)sceneResults
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSceneResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSArray)qualityResults
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setQualityResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualityResults, 0);
  objc_storeStrong((id *)&self->_sceneResults, 0);
  objc_storeStrong((id *)&self->_objectsOfInterest, 0);
  objc_storeStrong((id *)&self->_thresholdBySceneID, 0);
  objc_storeStrong((id *)&self->_internalFrameScenes, 0);
  objc_storeStrong((id *)&self->_existingScenes, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
