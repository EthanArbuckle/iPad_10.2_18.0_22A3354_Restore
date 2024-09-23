@implementation VCPVideoCNNHighlight

- (VCPVideoCNNHighlight)init
{
  VCPVideoCNNHighlight *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSMutableArray *results;
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
  v16.super_class = (Class)VCPVideoCNNHighlight;
  v2 = -[VCPVideoCNNHighlight init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resourceURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("highlight_head.espresso.net"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    results = v2->_results;
    v2->_results = (NSMutableArray *)v6;

    inputNames = v2->_inputNames;
    v2->_inputNames = (NSArray *)&unk_1E6B76350;

    std::vector<void *>::resize((uint64_t)&v2->_inputsData, -[NSArray count](v2->_inputNames, "count"));
    v2->_analysisInput = (float *)operator new[]();
    v9 = [VCPCNNModelEspresso alloc];
    v10 = v2->_inputNames;
    v17 = CFSTR("forceCPU");
    v18[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:](v9, "initWithParameters:inputNames:outputNames:properties:", v5, v10, &unk_1E6B76368, v11);
    modelEspresso = v2->_modelEspresso;
    v2->_modelEspresso = (VCPCNNModelEspresso *)v12;

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
  v4.super_class = (Class)VCPVideoCNNHighlight;
  -[VCPVideoCNNHighlight dealloc](&v4, sel_dealloc);
}

- (int)loadAnalysisResults:(id)a3
{
  unsigned __int8 v4;
  float *analysisInput;
  char *v6;
  void *v7;
  const __CFDictionary *v8;
  void *v9;
  const __CFDictionary *v10;
  unint64_t i;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t j;
  const __CFDictionary *v18;
  void *v19;
  float v20;
  float v21;
  float Seconds;
  float v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  float v33;
  id v35;
  unint64_t v36;
  CMTime time;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange v41;
  CMTimeRange v42;
  CMTimeRange v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CMTime end;
  CMTime start;
  CMTimeRange range;
  CMTime v51;
  CMTimeRange v52;
  CMTime v53;
  _BYTE v54[128];
  _QWORD v55[10];

  v55[8] = *MEMORY[0x1E0C80C00];
  v35 = a3;
  if ((v4 & 1) == 0
  {
    v55[0] = CFSTR("QualityResults");
    v55[1] = CFSTR("FineSubjectMotionResults");
    v55[2] = CFSTR("SubtleMotionResults");
    v55[3] = CFSTR("HumanActionResults");
    v55[4] = CFSTR("HumanPoseResults");
    v55[5] = CFSTR("InterestingnessResults");
    v55[6] = CFSTR("CameraMotionResults");
    v55[7] = CFSTR("VoiceResults");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 8);
    -[VCPVideoCNNHighlight loadAnalysisResults:]::analysisKeys = objc_claimAutoreleasedReturnValue();
  }
  bzero(self->_analysisInput, 0x500uLL);
  analysisInput = self->_analysisInput;
  v6 = (char *)operator new[]();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("QualityResults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeRangeMakeFromDictionary(&v52, v8);
  v53 = v52.start;

  memset(&v51, 0, sizeof(v51));
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("QualityResults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeRangeMakeFromDictionary(&range, v10);
  CMTimeRangeGetEnd(&v51, &range);

  memset(&v52, 0, sizeof(v52));
  start = v53;
  end = v51;
  CMTimeRangeFromTimeToTime(&v52, &start, &end);
  for (i = 0; objc_msgSend((id)-[VCPVideoCNNHighlight loadAnalysisResults:]::analysisKeys, "count") > i; i = v36 + 1)
  {
    v36 = i;
    objc_msgSend((id)-[VCPVideoCNNHighlight loadAnalysisResults:]::analysisKeys, "objectAtIndexedSubscript:", i);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    bzero(v6, 0x320uLL);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v35, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v14)
    {
      v15 = 0;
      v16 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v45 != v16)
            objc_enumerationMutation(v13);
          v18 = *(const __CFDictionary **)(*((_QWORD *)&v44 + 1) + 8 * j);
          memset(&v43, 0, sizeof(v43));
          CMTimeRangeMakeFromDictionary(&v43, v18);
          if (v12 == CFSTR("VoiceResults"))
          {
            v41 = v52;
            memset(&v42, 0, sizeof(v42));
            otherRange = v43;
            CMTimeRangeGetIntersection(&v42, &v41, &otherRange);
            if ((v42.start.flags & 1) != 0
              && (v42.duration.flags & 1) != 0
              && !v42.duration.epoch
              && (v42.duration.value & 0x8000000000000000) == 0)
            {
              time1 = v42.duration;
              time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
              if (!CMTimeCompare(&time1, &time2))
                continue;
            }
            v21 = 1.0;
          }
          else
          {
            -[__CFDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("quality"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "floatValue");
            v21 = v20;

          }
          time = v43.duration;
          Seconds = CMTimeGetSeconds(&time);
          v23 = roundf(Seconds / 0.01);
          if (v23 > 0.0)
          {
            v24 = 0;
            do
            {
              if (200 - v15 == v24)
                break;
              *(float *)&v6[4 * v15 + 4 * v24++] = v21;
            }
            while (v23 > (float)(int)v24);
          }
          v15 = (int)(float)(v23 + (float)v15);
          if (v15 >= 100)
            goto LABEL_24;
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      }
      while (v14);
    }
LABEL_24:

    v25 = 0;
    v26 = 0;
    v27 = 1;
    do
    {
      v28 = 0;
      v29 = v27;
      v30 = v25 + (20 * v36);
      v31 = &v6[20 * v26];
      do
      {
        v32 = 0;
        v33 = 0.0;
        do
        {
          v33 = v33 + *(float *)&v31[v32];
          v32 += 4;
        }
        while (v32 != 20);
        analysisInput[v30 + v28] = v33 / 5.0;
        ++v26;
        ++v28;
        v31 += 20;
      }
      while (v28 != 20);
      v27 = 0;
      v25 = 160;
    }
    while ((v29 & 1) != 0);

  }
  MEMORY[0x1BCCA128C](v6, 0x1000C8052888210);

  return 0;
}

- (int)run:(id)a3 withPersons:(id)a4 andRegionCrop:(CGRect)a5 atTime:(id *)a6 andDuration:(id *)a7
{
  id v10;
  vector<float *, std::allocator<float *>> *p_inputsData;
  float **begin;
  VCPCNNModelEspresso *modelEspresso;
  int v14;
  VCPCNNModelEspresso *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  float v20;
  uint64_t v21;
  float v22;
  NSMutableArray *results;
  CFDictionaryRef v24;
  CFDictionaryRef v25;
  double v26;
  void *v27;
  void *v28;
  CMTimeValue value;
  void *v31;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  CMTime v35;
  CMTime time;
  void *v37;
  void *v38;
  uint64_t v39;
  CMTime rhs;
  _QWORD v41[3];
  _QWORD v42[5];

  v42[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  p_inputsData = &self->_inputsData;
  v31 = v10;
  if ((float **)((char *)self->_inputsData.__end_ - (char *)self->_inputsData.__begin_) != (float **)16)
    goto LABEL_16;
  *p_inputsData->__begin_ = (float *)objc_msgSend(v10, "outputBeforeTemporalPooling");
  *((_QWORD *)p_inputsData->__begin_ + 1) = self->_analysisInput;
  begin = p_inputsData->__begin_;
  if (!*p_inputsData->__begin_ || !begin[1])
    goto LABEL_16;
  modelEspresso = self->_modelEspresso;
  v38 = 0;
  v39 = 0;
  v37 = 0;
  std::vector<float *>::__init_with_size[abi:ne180100]<float **,float **>(&v37, begin, (uint64_t)self->_inputsData.__end_, self->_inputsData.__end_ - begin);
  v14 = -[VCPCNNModelEspresso espressoForwardInputs:](modelEspresso, "espressoForwardInputs:", &v37);
  if (v37)
  {
    v38 = v37;
    operator delete(v37);
  }
  if (!v14)
  {
    v15 = self->_modelEspresso;
    if (v15)
    {
      -[VCPCNNModelEspresso outputBlob](v15, "outputBlob");
      value = time.value;
      if (time.value)
      {
        v16 = 0;
        v17 = 1;
        do
        {
          v18 = 0;
          v19 = v17;
          v20 = 0.0;
          do
          {
            v20 = v20 + expf(*(float *)(value + 20 * v16 + v18));
            v18 += 4;
          }
          while (v18 != 20);
          v21 = 0;
          v22 = 0.0;
          do
          {
            v22 = v22
                + (float)((float)(expf(*(float *)(value + 20 * v16 + v21 * 4)) / v20)
                        * *(float *)&-[VCPVideoCNNHighlight run:withPersons:andRegionCrop:atTime:andDuration:]::kClassScore[v21]);
            ++v21;
          }
          while (v21 != 5);
          memset(&v35, 0, sizeof(v35));
          time = (CMTime)*a7;
          CMTimeMultiply(&v33, &time, v16);
          time = v33;
          CMTimeMultiplyByRatio(&v34, &time, 1, 2);
          time = v34;
          rhs = (CMTime)*a6;
          CMTimeAdd(&v35, &time, &rhs);
          results = self->_results;
          v41[0] = CFSTR("start");
          time = v35;
          v24 = CMTimeCopyAsDictionary(&time, 0);
          v42[0] = v24;
          v41[1] = CFSTR("duration");
          time = (CMTime)*a7;
          CMTimeMultiplyByRatio(&v32, &time, 1, 2);
          time = v32;
          v25 = CMTimeCopyAsDictionary(&time, 0);
          v42[1] = v25;
          v41[2] = CFSTR("quality");
          *(float *)&v26 = v22;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v42[2] = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](results, "addObject:", v28);

          v17 = 0;
          v14 = 0;
          v16 = 1;
        }
        while ((v19 & 1) != 0);
        goto LABEL_17;
      }
    }
LABEL_16:
    v14 = -18;
  }
LABEL_17:

  return v14;
}

- (int)finishAnalysisPass:(id *)a3
{
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
    v5 = CFSTR("MLHighlightScoreResults");
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
  objc_storeStrong((id *)&self->_results, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
