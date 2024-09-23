@implementation VCPVideoActivityAnalyzer

- (VCPVideoActivityAnalyzer)init
{
  char *v2;
  VCPVideoActivityDescriptor *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  VCPCNNModel *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  VCPVideoActivityAnalyzer *v45;
  _BOOL4 v47;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)VCPVideoActivityAnalyzer;
  v2 = -[VCPVideoActivityAnalyzer init](&v48, sel_init);
  if (!v2)
    goto LABEL_23;
  v47 = +[VCPCNNMetalContext supportGPU](VCPCNNMetalContext, "supportGPU");
  v3 = objc_alloc_init(VCPVideoActivityDescriptor);
  v4 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 2) = v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)*((_QWORD *)v2 + 3);
  *((_QWORD *)v2 + 3) = v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)*((_QWORD *)v2 + 4);
  *((_QWORD *)v2 + 4) = v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)*((_QWORD *)v2 + 5);
  *((_QWORD *)v2 + 5) = v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)*((_QWORD *)v2 + 6);
  *((_QWORD *)v2 + 6) = v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)*((_QWORD *)v2 + 7);
  *((_QWORD *)v2 + 7) = v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)*((_QWORD *)v2 + 8);
  *((_QWORD *)v2 + 8) = v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)*((_QWORD *)v2 + 9);
  *((_QWORD *)v2 + 9) = v19;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)*((_QWORD *)v2 + 10);
  *((_QWORD *)v2 + 10) = v21;

  *((_DWORD *)v2 + 22) = 0;
  *((_QWORD *)v2 + 12) = 0;
  v23 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  *(_OWORD *)(v2 + 104) = *MEMORY[0x1E0CA2E68];
  *((_QWORD *)v2 + 15) = v23;
  *((_DWORD *)v2 + 32) = 0;
  objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mad_extendedSceneIdFromSceneName:", CFSTR("sport"));
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)*((_QWORD *)v2 + 19);
  *((_QWORD *)v2 + 19) = v25;

  v27 = (void *)*((_QWORD *)v2 + 1);
  if (v27)
  {
    v27 = (void *)*((_QWORD *)v2 + 2);
    if (v27)
    {
      v27 = (void *)*((_QWORD *)v2 + 3);
      if (v27)
      {
        v27 = (void *)*((_QWORD *)v2 + 4);
        if (v27)
        {
          v27 = (void *)*((_QWORD *)v2 + 5);
          if (v27)
          {
            v27 = (void *)*((_QWORD *)v2 + 6);
            if (v27)
            {
              v27 = (void *)*((_QWORD *)v2 + 7);
              if (v27)
              {
                v27 = (void *)*((_QWORD *)v2 + 8);
                if (v27)
                {
                  v27 = (void *)*((_QWORD *)v2 + 9);
                  if (v27)
                  {
                    v27 = (void *)*((_QWORD *)v2 + 10);
                    if (v27)
                    {
                      v28 = -[VCPCNNModel initWithParameters:useGPU:]([VCPCNNModel alloc], "initWithParameters:useGPU:", 1, v47);
                      v29 = (void *)*((_QWORD *)v2 + 17);
                      *((_QWORD *)v2 + 17) = v28;

                      v30 = (void *)*((_QWORD *)v2 + 17);
                      if (!v30)
                        goto LABEL_22;
                      objc_msgSend(v30, "getGPUContext");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      +[VCPCNNData cnnDataWithPlane:height:width:context:](VCPCNNData, "cnnDataWithPlane:height:width:context:", 1, 10, 1, v31);
                      v32 = objc_claimAutoreleasedReturnValue();
                      v33 = (void *)*((_QWORD *)v2 + 18);
                      *((_QWORD *)v2 + 18) = v32;

                      objc_msgSend(*((id *)v2 + 18), "allocBuffers:", 1);
                      +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:NeuronType:](VCPCNNFullConnectionBlock, "fcBlockWithNumNeurons:NeuronType:", 16, 1);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      v35 = objc_msgSend(*((id *)v2 + 17), "add:", v34);
                      if (!v35)
                      {
                        +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:NeuronType:](VCPCNNFullConnectionBlock, "fcBlockWithNumNeurons:NeuronType:", 8, 1);
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        v35 = objc_msgSend(*((id *)v2 + 17), "add:", v36);
                        if (!v35)
                        {
                          +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:NeuronType:](VCPCNNFullConnectionBlock, "fcBlockWithNumNeurons:NeuronType:", 4, 1);
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          v35 = objc_msgSend(*((id *)v2 + 17), "add:", v37);
                          if (!v35)
                          {
                            +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:NeuronType:](VCPCNNFullConnectionBlock, "fcBlockWithNumNeurons:NeuronType:", 3, 0);
                            v38 = (void *)objc_claimAutoreleasedReturnValue();
                            v35 = objc_msgSend(*((id *)v2 + 17), "add:", v38);
                            if (!v35)
                            {
                              objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
                              v39 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v39, "resourceURL");
                              v40 = objc_claimAutoreleasedReturnValue();

                              v41 = (void *)v40;
                              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_activitylevel.dat"), v40);
                              v42 = (void *)objc_claimAutoreleasedReturnValue();
                              v43 = (void *)*((_QWORD *)v2 + 17);
                              objc_msgSend(*((id *)v2 + 18), "size");
                              v44 = (void *)objc_claimAutoreleasedReturnValue();
                              v35 = objc_msgSend(v43, "prepareNetworkFromURL:withInputSize:", v42, v44);

                            }
                          }

                        }
                      }

                      if (v35)
                      {
LABEL_22:
                        v27 = 0;
                        goto LABEL_24;
                      }
LABEL_23:
                      v27 = v2;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_24:
  v45 = v27;

  return v45;
}

- (void)generateActivityDescriptor
{
  uint64_t i;
  float numOfFrames;
  float *v5;

  if (self->_numOfFrames < 1)
  {
    -[VCPVideoActivityDescriptor reset](self->_activityDescriptor, "reset");
  }
  else
  {
    for (i = 0; i != 10; ++i)
    {
      numOfFrames = (float)self->_numOfFrames;
      v5 = -[VCPVideoActivityDescriptor descriptors](self->_activityDescriptor, "descriptors");
      v5[i] = v5[i] / numOfFrames;
    }
    -[VCPVideoActivityAnalyzer normalizeActivityDescriptor](self, "normalizeActivityDescriptor");
  }
}

- (void)normalizeActivityDescriptor
{
  uint64_t i;
  float v4;

  for (i = 0; i != 10; ++i)
  {
    v4 = (float)(-[VCPVideoActivityDescriptor descriptors](self->_activityDescriptor, "descriptors")[i * 4]
               - *(float *)&-[VCPVideoActivityAnalyzer normalizeActivityDescriptor]::kCenter[i])
       / *(float *)&-[VCPVideoActivityAnalyzer normalizeActivityDescriptor]::kScaler[i];
    -[VCPVideoActivityDescriptor descriptors](self->_activityDescriptor, "descriptors")[i * 4] = v4;
  }
}

- (void)resetActivityStatsAtTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_lastProcessTime.value = *(_OWORD *)&a3->var0;
  self->_lastProcessTime.epoch = var3;
  self->_numOfFrames = 0;
  -[VCPVideoActivityDescriptor reset](self->_activityDescriptor, "reset");
}

- (int)computeActivityScoreAtTime:(id *)a3
{
  CMTime *p_lastProcessTime;
  uint64_t i;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  float v11;
  void *v12;
  float v13;
  uint64_t j;
  void *v15;
  float v16;
  float v17;
  NSMutableArray *activityScores;
  VCPCompactResult *v19;
  VCPCompactResult *v20;
  CMTimeRange v22;
  CMTime duration;
  CMTime start;
  CMTimeRange time1;
  CMTime rhs;
  CMTime time2;

  p_lastProcessTime = (CMTime *)&self->_lastProcessTime;
  time1.start = (CMTime)*a3;
  time2 = (CMTime)self->_lastProcessTime;
  if (CMTimeCompare(&time1.start, &time2) < 0)
    return -50;
  for (i = 0; i != 40; i += 4)
  {
    v7 = (int)-[VCPVideoActivityDescriptor descriptors](self->_activityDescriptor, "descriptors")[i];
    *(_DWORD *)(-[VCPCNNData data](self->_input, "data") + i) = v7;
  }
  v8 = -[VCPCNNModel forward:](self->_model, "forward:", self->_input);
  if (!v8)
  {
    -[VCPCNNModel output](self->_model, "output");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "softmax");

    if (!v8)
    {
      v10 = 0;
      v11 = 0.0;
      do
      {
        -[VCPCNNModel output](self->_model, "output");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v11 + *(float *)(objc_msgSend(v12, "data") + v10);

        v10 += 4;
      }
      while (v10 != 12);
      v13 = 0.0;
      if (v11 != 0.0)
      {
        for (j = 0; j != 3; ++j)
        {
          -[VCPCNNModel output](self->_model, "output");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v13
              + (float)((float)(*(float *)(objc_msgSend(v15, "data") + j * 4)
                              * *(float *)&-[VCPVideoActivityAnalyzer computeActivityScoreAtTime:]::kClassScore[j])
                      / v11);

        }
      }
      memset(&time1, 0, sizeof(time1));
      v16 = 1.0;
      if (v13 < 1.0)
        v16 = v13;
      if (v13 <= 0.0)
        v17 = 0.0;
      else
        v17 = v16;
      start = *p_lastProcessTime;
      time2 = (CMTime)*a3;
      rhs = *p_lastProcessTime;
      CMTimeSubtract(&duration, &time2, &rhs);
      CMTimeRangeMake(&time1, &start, &duration);
      activityScores = self->_activityScores;
      v19 = [VCPCompactResult alloc];
      v22 = time1;
      v20 = -[VCPCompactResult initWithTimerange:andScore:](v19, "initWithTimerange:andScore:", &v22, COERCE_DOUBLE(__PAIR64__(time1.duration.flags, LODWORD(v17))));
      -[NSMutableArray addObject:](activityScores, "addObject:", v20);

      return 0;
    }
  }
  return v8;
}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7
{
  id v9;
  uint64_t i;
  void *v11;
  float v12;
  float *v13;
  int v14;
  __int128 v16;
  int64_t v17;
  __int128 v18;
  int64_t var3;
  CMTime time;
  CMTime rhs;
  CMTime lhs;

  v9 = a6;
  for (i = 0; i != 10; ++i)
  {
    objc_msgSend(v9, "videoActivityDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(float *)(objc_msgSend(v11, "descriptors") + i * 4);
    v13 = -[VCPVideoActivityDescriptor descriptors](self->_activityDescriptor, "descriptors");
    v13[i] = v12 + v13[i];

  }
  ++self->_numOfFrames;
  lhs = (CMTime)*a4;
  rhs = (CMTime)self->_lastProcessTime;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) < 1.0)
    goto LABEL_6;
  -[VCPVideoActivityAnalyzer generateActivityDescriptor](self, "generateActivityDescriptor");
  v18 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v14 = -[VCPVideoActivityAnalyzer computeActivityScoreAtTime:](self, "computeActivityScoreAtTime:", &v18);
  if (!v14)
  {
    v16 = *(_OWORD *)&a4->var0;
    v17 = a4->var3;
    -[VCPVideoActivityAnalyzer resetActivityStatsAtTime:](self, "resetActivityStatsAtTime:", &v16);
LABEL_6:
    v14 = 0;
  }

  return v14;
}

- (int)preProcessQualityResults:(id)a3 interestingnessResults:(id)a4 obstructionResults:(id)a5 classificationResults:(id)a6 fineActionResults:(id)a7 faceResults:(id)a8 sceneSwitchFrequency:(float)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = -[VCPVideoActivityAnalyzer extractRequiredInfoFrom:toArray:](self, "extractRequiredInfoFrom:toArray:", a3, self->_qualityResults);
  if (!v21)
  {
    v21 = -[VCPVideoActivityAnalyzer extractRequiredInfoFrom:toArray:](self, "extractRequiredInfoFrom:toArray:", v16, self->_interestingnessResults);
    if (!v21)
    {
      v21 = -[VCPVideoActivityAnalyzer extractRequiredInfoFrom:toArray:](self, "extractRequiredInfoFrom:toArray:", v17, self->_obstructionResults);
      if (!v21)
      {
        v21 = -[VCPVideoActivityAnalyzer extractRequiredClassificationInfoFrom:toArray:](self, "extractRequiredClassificationInfoFrom:toArray:", v18, self->_classificationResults);
        if (!v21)
        {
          v21 = -[VCPVideoActivityAnalyzer extractRequiredInfoFrom:toArray:](self, "extractRequiredInfoFrom:toArray:", v19, self->_fineActionResults);
          if (!v21)
          {
            v21 = -[VCPVideoActivityAnalyzer extractRequiredFaceInfoFrom:toArray:](self, "extractRequiredFaceInfoFrom:toArray:", v20, self->_faceResults);
            if (!v21)
              self->_sceneSwitchFrequency = a9;
          }
        }
      }
    }
  }

  return v21;
}

- (int)extractRequiredInfoFrom:(id)a3 toArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const __CFDictionary *v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  VCPCompactResult *v15;
  VCPCompactResult *v16;
  CMTimeRange v18;
  CMTimeRange v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        v11 = *(const __CFDictionary **)(*((_QWORD *)&v20 + 1) + 8 * i);
        memset(&v19, 0, sizeof(v19));
        CMTimeRangeMakeFromDictionary(&v19, v11);
        -[__CFDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("quality"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatValue");
        v14 = v13;

        v15 = [VCPCompactResult alloc];
        v18 = v19;
        v16 = -[VCPCompactResult initWithTimerange:andScore:](v15, "initWithTimerange:andScore:", &v18, COERCE_DOUBLE(__PAIR64__(v19.duration.flags, v14)));
        if (!v16)
        {
          LODWORD(v8) = -50;
          goto LABEL_11;
        }
        objc_msgSend(v6, "addObject:", v16);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (int)extractRequiredFaceInfoFrom:(id)a3 toArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const __CFDictionary *v11;
  void *v12;
  NSString *v13;
  double width;
  double height;
  VCPCompactResult *v16;
  double v17;
  VCPCompactResult *v18;
  CMTimeRange v20;
  CMTimeRange v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  NSRect v28;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v7);
        v11 = *(const __CFDictionary **)(*((_QWORD *)&v22 + 1) + 8 * i);
        memset(&v21, 0, sizeof(v21));
        CMTimeRangeMakeFromDictionary(&v21, v11);
        -[__CFDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("attributes"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("faceBounds"));
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        v28 = NSRectFromString(v13);
        width = v28.size.width;
        height = v28.size.height;

        v16 = [VCPCompactResult alloc];
        v17 = width * height;
        *(float *)&v17 = width * height;
        v20 = v21;
        v18 = -[VCPCompactResult initWithTimerange:andScore:](v16, "initWithTimerange:andScore:", &v20, v17);
        if (!v18)
        {

          LODWORD(v8) = -50;
          goto LABEL_11;
        }
        objc_msgSend(v6, "addObject:", v18);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (int)extractRequiredClassificationInfoFrom:(id)a3 toArray:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const __CFDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  VCPCompactResult *v17;
  VCPCompactResult *v18;
  int v19;
  void *v21;
  id obj;
  CMTimeRange v23;
  CMTimeRange v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = v6;
  if (self->_sportsSceneId)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16, v6);
    if (v8)
    {
      v9 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(obj);
          v11 = *(const __CFDictionary **)(*((_QWORD *)&v25 + 1) + 8 * i);
          memset(&v24, 0, sizeof(v24));
          CMTimeRangeMakeFromDictionary(&v24, v11);
          -[__CFDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("attributes"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSNumber stringValue](self->_sportsSceneId, "stringValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v14, "floatValue");
            v16 = v15;
            v17 = [VCPCompactResult alloc];
            v23 = v24;
            v18 = -[VCPCompactResult initWithTimerange:andScore:](v17, "initWithTimerange:andScore:", &v23, COERCE_DOUBLE(__PAIR64__(v24.duration.flags, v16)));
            if (!v18)
            {

              v19 = -50;
              goto LABEL_15;
            }
            objc_msgSend(v7, "addObject:", v18);

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v8)
          continue;
        break;
      }
    }
    v19 = 0;
LABEL_15:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (float)validationScoreOfTimeRange:(id *)a3 fromResult:(id)a4 startIdx:(int *)a5
{
  id v7;
  int v8;
  __int128 v9;
  unint64_t v10;
  float v11;
  CMTime *v12;
  float v13;
  void *v14;
  void *v15;
  __int128 v16;
  Float64 Seconds;
  void *v18;
  float v19;
  float v20;
  float v21;
  CMTime duration;
  CMTime v24;
  CMTime v25;
  CMTimeRange otherRange;
  CMTimeRange v27;
  CMTimeRange time1;
  CMTimeRange v29;
  CMTimeRange range;
  CMTime v31;
  CMTime time2;

  v7 = a4;
  v8 = *a5;
  memset(&v31, 0, sizeof(v31));
  v9 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v9;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v31, &range);
  v10 = v8;
  v11 = 0.0;
  v12 = (CMTime *)MEMORY[0x1E0CA2E68];
  v13 = 0.0;
  while (objc_msgSend(v7, "count") > v10)
  {
    memset(&v29, 0, sizeof(v29));
    objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      objc_msgSend(v14, "timerange");
    else
      memset(&v29, 0, sizeof(v29));

    *(_OWORD *)&time1.start.value = *(_OWORD *)&v29.start.value;
    time1.start.epoch = v29.start.epoch;
    time2 = v31;
    if (CMTimeCompare(&time1.start, &time2) >= 1)
      break;
    v16 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&v27.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&v27.start.epoch = v16;
    *(_OWORD *)&v27.duration.timescale = *(_OWORD *)&a3->var1.var1;
    memset(&time1, 0, sizeof(time1));
    otherRange = v29;
    CMTimeRangeGetIntersection(&time1, &v27, &otherRange);
    if ((time1.start.flags & 1) == 0
      || (time1.duration.flags & 1) == 0
      || time1.duration.epoch
      || time1.duration.value < 0
      || (v25 = time1.duration, v24 = *v12, CMTimeCompare(&v25, &v24)))
    {
      duration = time1.duration;
      Seconds = CMTimeGetSeconds(&duration);
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "score");
      v20 = v19;
      *(float *)&Seconds = Seconds;

      v11 = v11 + (float)(*(float *)&Seconds * v20);
      v13 = v13 + *(float *)&Seconds;
      v8 = v10;
    }
    ++v10;
  }
  *a5 = v8;
  if (v13 == 0.0)
    v21 = 0.0;
  else
    v21 = v11 / v13;

  return v21;
}

- (void)validateActivityScores
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  int *v6;
  int *v7;
  uint64_t i;
  void *v9;
  float v10;
  float v11;
  int *v12;
  unint64_t v13;
  float v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableArray *obj;
  CMTime time;
  CMTimeRange otherRange;
  CMTimeRange v21;
  CMTimeRange time1;
  CMTimeRange v23;
  CMTimeRange v24;
  CMTimeRange v25;
  CMTimeRange range;
  CMTime v27;
  CMTimeRange v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  CMTime time2;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_activityScores;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v30;
    v6 = &OBJC_IVAR___VCPImageConverter__rgbColorSpace;
    v7 = &OBJC_IVAR___VCPImageConverter__rgbColorSpace;
    v17 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        memset(&v28, 0, sizeof(v28));
        if (v9)
          objc_msgSend(v9, "timerange");
        memset(&v27, 0, sizeof(v27));
        range = v28;
        CMTimeRangeGetEnd(&v27, &range);
        v25 = v28;
        -[VCPVideoActivityAnalyzer validationScoreOfTimeRange:fromResult:startIdx:](self, "validationScoreOfTimeRange:fromResult:startIdx:", &v25, *(Class *)((char *)&self->super.super.isa + v6[906]), (char *)&v33 + 4);
        if (v10 > 0.35)
        {
          v24 = v28;
          -[VCPVideoActivityAnalyzer validationScoreOfTimeRange:fromResult:startIdx:](self, "validationScoreOfTimeRange:fromResult:startIdx:", &v24, *(Class *)((char *)&self->super.super.isa + v7[907]), &v33);
          if (v11 > 0.343)
          {
            v12 = v6;
            v13 = v4;
            v14 = 0.0;
            while (-[NSMutableArray count](self->_obstructionResults, "count", v17) > v13)
            {
              memset(&v23, 0, sizeof(v23));
              -[NSMutableArray objectAtIndexedSubscript:](self->_obstructionResults, "objectAtIndexedSubscript:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              if (v15)
                objc_msgSend(v15, "timerange");
              else
                memset(&v23, 0, sizeof(v23));

              *(_OWORD *)&time1.start.value = *(_OWORD *)&v23.start.value;
              time1.start.epoch = v23.start.epoch;
              time2 = v27;
              if (CMTimeCompare(&time1.start, &time2) >= 1)
                break;
              v21 = v28;
              memset(&time1, 0, sizeof(time1));
              otherRange = v23;
              CMTimeRangeGetIntersection(&time1, &v21, &otherRange);
              time = time1.duration;
              v4 = v13;
              v14 = CMTimeGetSeconds(&time) + v14;
              ++v13;
            }
            if (v14 <= 0.2)
              -[NSMutableArray addObject:](self->_validActivityScores, "addObject:", v9);
            v6 = v12;
            v5 = v17;
            v7 = &OBJC_IVAR___VCPImageConverter__rgbColorSpace;
          }
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v3);
  }

}

- (float)scaleBasedOnFaceForTimeRange:(id *)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  CMTime *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  float v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  float result;
  CMTime v19;
  CMTimeRange v20;
  CMTimeRange v21;
  CMTimeRange v22;
  CMTime time1;
  CMTimeRange v24;
  CMTimeRange v25;
  CMTimeRange v26;
  CMTimeRange v27;
  CMTimeRange v28;
  CMTimeRange v29;
  CMTimeRange v30;
  CMTimeRange v31;
  CMTimeRange v32;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v4 = self->_faceResults;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v37;
    v7 = 0.0;
    v8 = (CMTime *)MEMORY[0x1E0CA2E68];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        if (v10)
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v9), "timerange");
        else
          memset(&range, 0, sizeof(range));
        v11 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&otherRange.start.epoch = v11;
        *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v35, &range, &otherRange);
        if ((v35.start.flags & 1) == 0)
          goto LABEL_18;
        if (v10)
          objc_msgSend(v10, "timerange");
        else
          memset(&v31, 0, sizeof(v31));
        v12 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v30.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v30.start.epoch = v12;
        *(_OWORD *)&v30.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v32, &v31, &v30);
        if ((v32.duration.flags & 1) == 0)
          goto LABEL_18;
        if (v10)
          objc_msgSend(v10, "timerange");
        else
          memset(&v28, 0, sizeof(v28));
        v13 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v27.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v27.start.epoch = v13;
        *(_OWORD *)&v27.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v29, &v28, &v27);
        if (v29.duration.epoch)
          goto LABEL_18;
        if (v10)
          objc_msgSend(v10, "timerange");
        else
          memset(&v25, 0, sizeof(v25));
        v15 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v24.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v24.start.epoch = v15;
        *(_OWORD *)&v24.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v26, &v25, &v24);
        if (v26.duration.value < 0)
          goto LABEL_18;
        if (v10)
          objc_msgSend(v10, "timerange");
        else
          memset(&v21, 0, sizeof(v21));
        v16 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v20.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v20.start.epoch = v16;
        *(_OWORD *)&v20.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v22, &v21, &v20);
        time1 = v22.duration;
        v19 = *v8;
        if (CMTimeCompare(&time1, &v19))
        {
LABEL_18:
          objc_msgSend(v10, "score");
          if (v7 < v14)
            v7 = v14;
        }
        ++v9;
      }
      while (v5 != v9);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      v5 = v17;
    }
    while (v17);
  }
  else
  {
    v7 = 0.0;
  }

  result = 0.8;
  if (v7 <= 0.1)
    return 1.0;
  return result;
}

- (void)addSceneSwitchFrequencyConstributionToActivityLevel:(float *)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;

  v3 = *a3;
  v4 = 0.9;
  if (*a3 < 0.9)
  {
    v5 = 0.9 - v3;
    if ((float)(0.9 - v3) < 0.0)
      v5 = 0.0;
    v6 = v3 + (float)(v5 * self->_sceneSwitchFrequency);
    if (v6 < 0.9)
      v4 = v6;
    if (v6 <= 0.0)
      v7 = 0.0;
    else
      v7 = v4;
    *a3 = v7;
  }
}

- (float)actionScoreInTimeRange:(id *)a3
{
  __int128 v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  CMTime *v10;
  float v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  double Seconds;
  float v16;
  float v17;
  float result;
  CMTime duration;
  CMTime v20;
  CMTime v21;
  CMTimeRange otherRange;
  CMTimeRange v23;
  CMTimeRange v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTimeRange range;
  CMTime v30;
  CMTime time2;
  CMTime time1;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  memset(&v30, 0, sizeof(v30));
  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v30, &range);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = self->_fineActionResults;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v26;
    v9 = 0.0;
    v10 = (CMTime *)MEMORY[0x1E0CA2E68];
    v11 = 0.0;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
      if (v13)
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12), "timerange");
      else
        memset(&v24, 0, sizeof(v24));
      time1 = v24.start;
      time2 = v30;
      if (CMTimeCompare(&time1, &time2) > 0)
        break;
      v14 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v23.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v23.start.epoch = v14;
      *(_OWORD *)&v23.duration.timescale = *(_OWORD *)&a3->var1.var1;
      memset(&v24, 0, sizeof(v24));
      if (v13)
        objc_msgSend(v13, "timerange");
      else
        memset(&otherRange, 0, sizeof(otherRange));
      CMTimeRangeGetIntersection(&v24, &v23, &otherRange);
      if ((v24.start.flags & 1) == 0
        || (v24.duration.flags & 1) == 0
        || v24.duration.epoch
        || v24.duration.value < 0
        || (v21 = v24.duration, v20 = *v10, CMTimeCompare(&v21, &v20)))
      {
        duration = v24.duration;
        Seconds = CMTimeGetSeconds(&duration);
        objc_msgSend(v13, "score");
        v16 = Seconds;
        v11 = v11 + (float)(v16 * v17);
        v9 = v9 + v16;
      }
      if (v7 == ++v12)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v9 = 0.0;
    v11 = 0.0;
  }

  result = v11 / v9;
  if (v9 == 0.0)
    return 0.0;
  return result;
}

- (void)addSceneClassificationContributionToActivityLevel:(float *)a3
{
  float v5;
  float v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  BOOL v18;
  float v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*a3 < 0.9)
  {
    v5 = 0.0;
    if ((float)(0.9 - *a3) >= 0.0)
      v6 = 0.9 - *a3;
    else
      v6 = 0.0;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = self->_classificationResults;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v11, "score", v20, v21, v22, (_QWORD)v23);
          v13 = v12;
          if (v11)
          {
            objc_msgSend(v11, "timerange");
          }
          else
          {
            v21 = 0u;
            v22 = 0u;
            v20 = 0u;
          }
          -[VCPVideoActivityAnalyzer actionScoreInTimeRange:](self, "actionScoreInTimeRange:", &v20);
          v15 = sqrtf(v13 * v14);
          if (v5 < v15)
            v5 = v15;
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

    v16 = *a3 + (float)(v6 * v5);
    if (v16 < 0.9)
      v17 = *a3 + (float)(v6 * v5);
    else
      v17 = 0.9;
    v18 = v16 > 0.0;
    v19 = 0.0;
    if (v18)
      v19 = v17;
    *a3 = v19;
  }
}

- (int)finishAnalysisPass:(id *)a3 fpsRate:(float)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *p_var1;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  float v12;
  uint64_t i;
  void *v14;
  double Seconds;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  NSMutableArray *results;
  CFDictionaryRef v22;
  CFDictionaryRef v23;
  double v24;
  void *v25;
  void *v26;
  CMTime v28;
  _OWORD v29[3];
  CMTime v30[2];
  CMTime v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTime time;
  float v37;
  CMTime time2;
  CMTime time1;
  _QWORD v40[3];
  _QWORD v41[3];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if ((a3->var0.var2 & 1) != 0
    && (a3->var1.var2 & 1) != 0
    && !a3->var1.var3
    && (a3->var1.var0 & 0x8000000000000000) == 0)
  {
    time1 = (CMTime)a3->var1;
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    if (!CMTimeCompare(&time1, &time2))
      return -50;
  }
  v37 = 0.0;
  time = (CMTime)a3->var1;
  p_var1 = &a3->var1;
  if (CMTimeGetSeconds(&time) / a4 >= 3.0)
  {
    -[VCPVideoActivityAnalyzer validateActivityScores](self, "validateActivityScores");
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v8 = self->_validActivityScores;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v33;
      v11 = 0.0;
      v12 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (v14)
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "timerange");
          else
            memset(v30, 0, sizeof(v30));
          v31 = v30[1];
          Seconds = CMTimeGetSeconds(&v31);
          if (v14)
            objc_msgSend(v14, "timerange");
          else
            memset(v29, 0, sizeof(v29));
          -[VCPVideoActivityAnalyzer scaleBasedOnFaceForTimeRange:](self, "scaleBasedOnFaceForTimeRange:", v29);
          v17 = v16;
          objc_msgSend(v14, "score");
          v18 = Seconds;
          v11 = v11 + (float)((float)(v17 * v19) * v18);
          v37 = v11;
          v12 = v12 + v18;
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      }
      while (v9);

      if (v12 != 0.0)
        v37 = v11 / v12;
    }
    else
    {

      v12 = 0.0;
    }
    *(_OWORD *)&v28.value = *(_OWORD *)&p_var1->var0;
    v28.epoch = a3->var1.var3;
    v20 = v12 / CMTimeGetSeconds(&v28);
    if (v20 <= 0.15)
    {
      v37 = 0.0;
    }
    else
    {
      -[VCPVideoActivityAnalyzer addSceneSwitchFrequencyConstributionToActivityLevel:](self, "addSceneSwitchFrequencyConstributionToActivityLevel:", &v37);
      -[VCPVideoActivityAnalyzer addSceneClassificationContributionToActivityLevel:](self, "addSceneClassificationContributionToActivityLevel:", &v37);
    }
  }
  results = self->_results;
  v40[0] = CFSTR("start");
  v30[0] = (CMTime)a3->var0;
  v22 = CMTimeCopyAsDictionary(v30, 0);
  v41[0] = v22;
  v40[1] = CFSTR("duration");
  *(_OWORD *)&v30[0].value = *(_OWORD *)&p_var1->var0;
  v30[0].epoch = a3->var1.var3;
  v23 = CMTimeCopyAsDictionary(v30, 0);
  v41[1] = v23;
  v40[2] = CFSTR("quality");
  *(float *)&v24 = v37;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](results, "addObject:", v26);

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
    v5 = CFSTR("ActivityLevelResults");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsSceneId, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_faceResults, 0);
  objc_storeStrong((id *)&self->_fineActionResults, 0);
  objc_storeStrong((id *)&self->_classificationResults, 0);
  objc_storeStrong((id *)&self->_obstructionResults, 0);
  objc_storeStrong((id *)&self->_interestingnessResults, 0);
  objc_storeStrong((id *)&self->_qualityResults, 0);
  objc_storeStrong((id *)&self->_validActivityScores, 0);
  objc_storeStrong((id *)&self->_activityScores, 0);
  objc_storeStrong((id *)&self->_activityDescriptor, 0);
}

@end
