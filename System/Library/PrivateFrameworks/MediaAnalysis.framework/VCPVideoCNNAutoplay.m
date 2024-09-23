@implementation VCPVideoCNNAutoplay

- (VCPVideoCNNAutoplay)init
{
  VCPVideoCNNAutoplay *v2;
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *summaryResults;
  NSMutableDictionary *settlingGatingResults;
  NSArray *inputNames;
  VCPCNNModelEspresso *v9;
  NSArray *v10;
  void *v11;
  uint64_t v12;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v14;
  objc_super v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)VCPVideoCNNAutoplay;
  v2 = -[VCPVideoCNNAutoplay init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resourceURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("autoplay_head.espresso.net"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    summaryResults = v2->_summaryResults;
    v2->_summaryResults = 0;

    settlingGatingResults = v2->_settlingGatingResults;
    v2->_settlingGatingResults = 0;

    inputNames = v2->_inputNames;
    v2->_inputNames = (NSArray *)&unk_1E6B76650;

    std::vector<void *>::resize((uint64_t)&v2->_inputsData, -[NSArray count](v2->_inputNames, "count"));
    v2->_analysisInput = (float *)operator new[]();
    v9 = [VCPCNNModelEspresso alloc];
    v10 = v2->_inputNames;
    v17 = CFSTR("forceCPU");
    v18[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:](v9, "initWithParameters:inputNames:outputNames:properties:", v5, v10, &unk_1E6B76668, v11);
    modelEspresso = v2->_modelEspresso;
    v2->_modelEspresso = (VCPCNNModelEspresso *)v12;

    v2->_skip = 0;
    v14 = v2->_modelEspresso;
    if (v14)
      -[VCPCNNModelEspresso prepareModelWithConfig:](v14, "prepareModelWithConfig:", &stru_1E6B1C190);

  }
  return v2;
}

- (void)dealloc
{
  float *analysisInput;
  objc_super v4;

  analysisInput = self->_analysisInput;
  if (analysisInput)
    MEMORY[0x1BCCA128C](analysisInput, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPVideoCNNAutoplay;
  -[VCPVideoCNNAutoplay dealloc](&v4, sel_dealloc);
}

- (int)loadAnalysisResults:(id)a3 audioResults:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *summaryResults;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *settlingGatingResults;
  float *analysisInput;
  void *v19;
  const __CFDictionary *v20;
  __CFString *v21;
  void *v23;
  BOOL v24;
  void *v25;
  unint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  float v33;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  void *v40;
  int v41;
  int v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  float v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  const __CFDictionary *v55;
  double Seconds;
  void *v57;
  float v58;
  float v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  float v64;
  void *v65;
  float v66;
  float v67;
  float v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  float v73;
  id v75;
  id obj;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t i;
  char *v81;
  CMTime time;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v87;
  CMTimeRange v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  CMTimeRange v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _QWORD v100[10];

  v100[8] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v75 = a4;
  v79 = v6;
  if ((v7 & 1) == 0
  {
    v100[0] = CFSTR("QualityResults");
    v100[1] = CFSTR("FineSubjectMotionResults");
    v100[2] = CFSTR("SubtleMotionResults");
    v100[3] = CFSTR("HumanActionResults");
    v100[4] = CFSTR("InterestingnessResults");
    v100[5] = CFSTR("CameraMotionResults");
    v100[6] = CFSTR("expressionChangeScore");
    v100[7] = CFSTR("visualPleasingScore");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 8);
    -[VCPVideoCNNAutoplay loadAnalysisResults:audioResults:]::analysisKeys = objc_claimAutoreleasedReturnValue();
  }
  bzero(self->_analysisInput, 0x300uLL);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MovieSummaryResults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v9)
  {
    self->_skip = 1;
  }
  else
  {
    objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("MovieSummaryResults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (NSMutableDictionary *)objc_msgSend(v11, "mutableCopy");
    summaryResults = self->_summaryResults;
    self->_summaryResults = v12;

  }
  objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("SettlingEffectsGatingResults"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSMutableDictionary *)objc_msgSend(v15, "mutableCopy");
  settlingGatingResults = self->_settlingGatingResults;
  self->_settlingGatingResults = v16;

  analysisInput = self->_analysisInput;
  memset(&v97, 0, sizeof(v97));
  objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("MovieSummaryResults"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeRangeMakeFromDictionary(&v97, v20);

  v81 = (char *)operator new[]();
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = (id)-[VCPVideoCNNAutoplay loadAnalysisResults:audioResults:]::analysisKeys;
  v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
  if (v78)
  {
    v77 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v78; ++i)
      {
        if (*(_QWORD *)v94 != v77)
          objc_enumerationMutation(obj);
        v21 = *(__CFString **)(*((_QWORD *)&v93 + 1) + 8 * i);
        bzero(v81, 0x5A0uLL);
        if (v21 == CFSTR("visualPleasingScore") || v21 == CFSTR("expressionChangeScore"))
        {
          objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("KeyFrameResults"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23 == 0;

          if (v24)
            continue;
          objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("KeyFrameResults"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0;
          v27 = 0;
          do
          {
            if (objc_msgSend(v25, "count") <= v26)
              break;
            objc_msgSend(v25, "objectAtIndexedSubscript:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("attributes"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("timestamp"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "floatValue");
            v32 = v31;

            ++v26;
            v33 = 0.2;
            if (objc_msgSend(v25, "count") > v26)
            {
              objc_msgSend(v25, "objectAtIndexedSubscript:", v26);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("attributes"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("timestamp"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "floatValue");
              v38 = v37;

              v33 = v38 - v32;
            }
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("attributes"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKeyedSubscript:", v21);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "floatValue");
            v42 = v41;

            v43 = roundf(v33 / 0.01);
            if (v43 > 0.0)
            {
              v44 = 0;
              do
              {
                if (360 - v27 == v44)
                  break;
                *(_DWORD *)&v81[4 * v27 + 4 * v44++] = v42;
              }
              while (v43 > (float)(int)v44);
            }
            v27 = (int)(float)(v43 + (float)v27);

          }
          while (v27 < 360);
          v45 = 0;
          v46 = v81;
          do
          {
            v47 = 0;
            v48 = 0.0;
            do
            {
              v48 = v48 + *(float *)&v46[v47];
              v47 += 4;
            }
            while (v47 != 60);
            analysisInput[v45++] = v48 / 15.0;
            v46 += 60;
          }
          while (v45 != 24);

        }
        else
        {
          v91 = 0u;
          v92 = 0u;
          v89 = 0u;
          v90 = 0u;
          objc_msgSend(v79, "objectForKeyedSubscript:", v21);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
          v51 = v50;
          if (v50)
          {
            v52 = 0;
            v53 = *(_QWORD *)v90;
LABEL_32:
            v54 = 0;
            while (1)
            {
              if (*(_QWORD *)v90 != v53)
                objc_enumerationMutation(v49);
              v55 = *(const __CFDictionary **)(*((_QWORD *)&v89 + 1) + 8 * v54);
              memset(&v88, 0, sizeof(v88));
              CMTimeRangeMakeFromDictionary(&v88, v55);
              range = v97;
              memset(&v87, 0, sizeof(v87));
              otherRange = v88;
              CMTimeRangeGetIntersection(&v87, &range, &otherRange);
              if ((v87.start.flags & 1) == 0
                || (v87.duration.flags & 1) == 0
                || v87.duration.epoch
                || v87.duration.value < 0
                || (time1 = v87.duration,
                    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
                    CMTimeCompare(&time1, &time2)))
              {
                time = v87.duration;
                Seconds = CMTimeGetSeconds(&time);
                if (v21 == CFSTR("CameraMotionResults"))
                {
                  -[__CFDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", CFSTR("flags"));
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  v61 = objc_msgSend(v60, "intValue");

                  v59 = (v61 - 512) >> 9 >= 0xF ? 0.0 : 1.0;
                }
                else if (v21 == CFSTR("HumanActionResults"))
                {
                  -[__CFDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", CFSTR("attributes"));
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("absoluteScore"));
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "floatValue");
                  v59 = v64;

                }
                else
                {
                  if (v21 == CFSTR("HumanPoseResults"))
                  {
                    -[__CFDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", CFSTR("attributes"));
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("humanScore"));
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "floatValue");
                    v59 = v66;

                  }
                  else
                  {
                    -[__CFDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", CFSTR("quality"));
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v57, "floatValue");
                    v59 = v58;
                  }

                }
                v67 = Seconds;
                v68 = roundf(v67 / 0.01);
                if (v68 > 0.0)
                {
                  v69 = 0;
                  do
                  {
                    if (360 - v52 == v69)
                      break;
                    *(float *)&v81[4 * v52 + 4 * v69++] = v59;
                  }
                  while (v68 > (float)(int)v69);
                }
                v52 = (int)(float)(v68 + (float)v52);
                if (v52 >= 360)
                  break;
              }
              if (++v54 == v51)
              {
                v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
                if (v51)
                  goto LABEL_32;
                break;
              }
            }
          }

          v70 = 0;
          v71 = v81;
          do
          {
            v72 = 0;
            v73 = 0.0;
            do
            {
              v73 = v73 + *(float *)&v71[v72];
              v72 += 4;
            }
            while (v72 != 60);
            analysisInput[v70++] = v73 / 15.0;
            v71 += 60;
          }
          while (v70 != 24);
        }
        analysisInput += 24;
      }
      v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
    }
    while (v78);
  }

  MEMORY[0x1BCCA128C](v81, 0x1000C8052888210);
  return 0;
}

- (int)run:(id)a3
{
  id v4;
  VCPCNNModelEspresso *v5;
  int v6;
  VCPCNNModelEspresso *v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  char v11;
  char v12;
  float v13;
  float v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  void *v28;
  float v29;
  float v30;
  float v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v39;
  uint64_t v40;
  float v41;
  char v42;
  char v43;
  float v44;
  void *v45;
  double v46;
  float v47;
  BOOL v48;
  void *v49;
  void *__p;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;

  v4 = a3;
  if (objc_msgSend(v4, "outputBeforeFc") && !self->_skip)
  {
    *self->_inputsData.__begin_ = (float *)objc_msgSend(v4, "outputBeforeFc");
    *((_QWORD *)self->_inputsData.__begin_ + 1) = self->_analysisInput;
    modelEspresso = self->_modelEspresso;
    v56 = 0;
    v57 = 0;
    v55 = 0;
    std::vector<float *>::__init_with_size[abi:ne180100]<float **,float **>(&v55, self->_inputsData.__begin_, (uint64_t)self->_inputsData.__end_, self->_inputsData.__end_ - self->_inputsData.__begin_);
    v6 = -[VCPCNNModelEspresso espressoForwardInputs:](modelEspresso, "espressoForwardInputs:", &v55);
    if (v55)
    {
      v56 = v55;
      operator delete(v55);
    }
    if (v6)
      goto LABEL_26;
    v39 = self->_modelEspresso;
    if (!v39)
      goto LABEL_25;
    -[VCPCNNModelEspresso outputBlob](v39, "outputBlob");
    if (!v54)
      goto LABEL_25;
    v40 = 0;
    v41 = 0.0;
    v42 = 1;
    do
    {
      v43 = v42;
      v44 = expf(*(float *)(v54 + 4 * v40));
      v42 = 0;
      v41 = v41 + v44;
      v40 = 1;
    }
    while ((v43 & 1) != 0);
    v45 = (void *)MEMORY[0x1E0CB37E8];
    *(float *)&v46 = (float)(expf(*(float *)(v54 + 4)) / v41) + -0.2;
    v47 = 1.0;
    if (*(float *)&v46 < 1.0)
      v47 = *(float *)&v46;
    v48 = *(float *)&v46 > 0.0;
    LODWORD(v46) = 0;
    if (v48)
      *(float *)&v46 = v47;
    objc_msgSend(v45, "numberWithFloat:", v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_summaryResults, "setObject:forKeyedSubscript:", v49, CFSTR("quality"));

  }
  if (!objc_msgSend(v4, "outputBeforeFcSettling"))
  {
LABEL_12:
    v6 = 0;
    goto LABEL_26;
  }
  *self->_inputsData.__begin_ = (float *)objc_msgSend(v4, "outputBeforeFcSettling");
  *((_QWORD *)self->_inputsData.__begin_ + 1) = self->_analysisInput;
  v5 = self->_modelEspresso;
  v52 = 0;
  v53 = 0;
  __p = 0;
  std::vector<float *>::__init_with_size[abi:ne180100]<float **,float **>(&__p, self->_inputsData.__begin_, (uint64_t)self->_inputsData.__end_, self->_inputsData.__end_ - self->_inputsData.__begin_);
  v6 = -[VCPCNNModelEspresso espressoForwardInputs:](v5, "espressoForwardInputs:", &__p);
  if (__p)
  {
    v52 = __p;
    operator delete(__p);
  }
  if (!v6)
  {
    v7 = self->_modelEspresso;
    if (v7)
    {
      -[VCPCNNModelEspresso outputBlob](v7, "outputBlob");
      v8 = v54;
      if (v54)
      {
        v9 = 0;
        v10 = 0.0;
        v11 = 1;
        do
        {
          v12 = v11;
          v13 = expf(*(float *)(v8 + 4 * v9));
          v11 = 0;
          v10 = v10 + v13;
          v9 = 1;
        }
        while ((v12 & 1) != 0);
        v14 = expf(*(float *)(v8 + 4));
        -[NSMutableDictionary objectForKeyedSubscript:](self->_settlingGatingResults, "objectForKeyedSubscript:", CFSTR("attributes"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ExposureChangeScore"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v18 = v17;

        -[NSMutableDictionary objectForKeyedSubscript:](self->_settlingGatingResults, "objectForKeyedSubscript:", CFSTR("attributes"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("SharpnessScore"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "floatValue");
        v22 = v21;

        -[NSMutableDictionary objectForKeyedSubscript:](self->_settlingGatingResults, "objectForKeyedSubscript:", CFSTR("attributes"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ZoomChangeScore"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "floatValue");
        v26 = v25;

        -[NSMutableDictionary objectForKeyedSubscript:](self->_settlingGatingResults, "objectForKeyedSubscript:", CFSTR("attributes"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("FlashScore"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "floatValue");
        v30 = v29;
        v31 = v14 / v10;

        *(float *)&v32 = (float)((float)((float)(v31 * v18) * v22) * v26) * v30;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_settlingGatingResults, "setObject:forKeyedSubscript:", v33, CFSTR("quality"));

        -[NSMutableDictionary objectForKeyedSubscript:](self->_settlingGatingResults, "objectForKeyedSubscript:", CFSTR("attributes"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v34, "mutableCopy");

        *(float *)&v36 = v31;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v37, CFSTR("AutoplayScore"));

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_settlingGatingResults, "setObject:forKeyedSubscript:", v35, CFSTR("attributes"));
        goto LABEL_12;
      }
    }
LABEL_25:
    v6 = -18;
  }
LABEL_26:

  return v6;
}

- (int)finishAnalysisPass:(id *)a3
{
  return 0;
}

- (id)results
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *settlingGatingResults;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_summaryResults)
  {
    v8[0] = self->_summaryResults;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("MovieSummaryResults"));

  }
  if (self->_settlingGatingResults)
  {
    settlingGatingResults = self->_settlingGatingResults;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &settlingGatingResults, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("SettlingEffectsGatingResults"));

  }
  return v3;
}

- (void).cxx_destruct
{
  vector<float *, std::allocator<float *>> *p_inputsData;
  float **begin;

  p_inputsData = &self->_inputsData;
  begin = self->_inputsData.__begin_;
  if (begin)
  {
    p_inputsData->__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
  objc_storeStrong((id *)&self->_settlingGatingResults, 0);
  objc_storeStrong((id *)&self->_summaryResults, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
