@implementation VCPVideoCNNCameraMotion

- (VCPVideoCNNCameraMotion)init
{
  VCPVideoCNNCameraMotion *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *results;
  VCPCNNModelEspresso *v9;
  uint64_t v10;
  VCPCNNModelEspresso *motionTypeModel;
  VCPCNNModelEspresso *v12;
  VCPCNNModelEspresso *v13;
  uint64_t v14;
  VCPCNNModelEspresso *motionScoreModel;
  VCPCNNModelEspresso *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VCPVideoCNNCameraMotion;
  v2 = -[VCPVideoCNNCameraMotion init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resourceURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cameramotiontype_head.espresso.net"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cameramotionscore_head.espresso.net"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    results = v2->_results;
    v2->_results = (NSMutableArray *)v7;

    v9 = [VCPCNNModelEspresso alloc];
    v10 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:](v9, "initWithParameters:inputNames:outputNames:properties:", v5, &unk_1E6B76A40, 0, MEMORY[0x1E0C9AA70]);
    motionTypeModel = v2->_motionTypeModel;
    v2->_motionTypeModel = (VCPCNNModelEspresso *)v10;

    v12 = v2->_motionTypeModel;
    if (v12)
    {
      if (!-[VCPCNNModelEspresso prepareModelWithConfig:](v12, "prepareModelWithConfig:", &stru_1E6B1C190))
      {
        v13 = [VCPCNNModelEspresso alloc];
        v14 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:](v13, "initWithParameters:inputNames:outputNames:properties:", v6, &unk_1E6B76A58, 0, MEMORY[0x1E0C9AA70]);
        motionScoreModel = v2->_motionScoreModel;
        v2->_motionScoreModel = (VCPCNNModelEspresso *)v14;

        v16 = v2->_motionScoreModel;
        if (v16)
          -[VCPCNNModelEspresso prepareModelWithConfig:](v16, "prepareModelWithConfig:", &stru_1E6B1C190);
      }
    }

  }
  return v2;
}

- (int)run:(id)a3 withPersons:(id)a4 andRegionCrop:(CGRect)a5 atTime:(id *)a6 andDuration:(id *)a7
{
  id v9;
  int v10;
  VCPCNNModelEspresso *motionTypeModel;
  double v12;
  CMTimeValue value;
  uint64_t v14;
  char v15;
  char v16;
  _DWORD *v17;
  uint64_t i;
  float v19;
  VCPCNNModelEspresso *motionScoreModel;
  uint64_t v21;
  char v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  float v26;
  NSMutableArray *results;
  CFDictionaryRef v28;
  CFDictionaryRef v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  char v35;
  CMTimeValue v36;
  CMTime v38;
  CMTime v39;
  CMTime v40;
  CMTime v41;
  CMTime time;
  CMTime rhs;
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = -[VCPCNNModelEspresso espressoForward:](self->_motionTypeModel, "espressoForward:", objc_msgSend(v9, "outputBeforeTemporalPooling"));
  if (v10)
    goto LABEL_21;
  motionTypeModel = self->_motionTypeModel;
  if (!motionTypeModel)
    goto LABEL_20;
  -[VCPCNNModelEspresso outputBlob](motionTypeModel, "outputBlob");
  value = time.value;
  if (!time.value)
    goto LABEL_20;
  v14 = 0;
  v46[0] = 0;
  v15 = 1;
  do
  {
    v16 = v15;
    v17 = (_DWORD *)(value + 44 * v14);
    LODWORD(v12) = *v17;
    for (i = 1; i != 11; ++i)
    {
      v19 = *(float *)&v17[i];
      if (v19 > *(float *)&v12)
      {
        *((_DWORD *)v46 + v14) = i;
        *(float *)&v12 = v19;
      }
    }
    v15 = 0;
    *((_DWORD *)v46 + v14) = 1 << (-[VCPVideoCNNCameraMotion run:withPersons:andRegionCrop:atTime:andDuration:]::kClassType[*((int *)v46 + v14)]
                                 + 6);
    v14 = 1;
  }
  while ((v16 & 1) != 0);
  v10 = -[VCPCNNModelEspresso espressoForward:](self->_motionScoreModel, "espressoForward:", objc_msgSend(v9, "outputBeforeTemporalPooling", v12));
  if (!v10)
  {
    motionScoreModel = self->_motionScoreModel;
    if (motionScoreModel)
    {
      -[VCPCNNModelEspresso outputBlob](motionScoreModel, "outputBlob");
      v36 = time.value;
      if (time.value)
      {
        v21 = 0;
        v22 = 1;
        do
        {
          v23 = 0;
          v35 = v22;
          v24 = 0.0;
          do
          {
            v24 = v24 + expf(*(float *)(v36 + 20 * v21 + v23));
            v23 += 4;
          }
          while (v23 != 20);
          v25 = 0;
          v26 = 0.0;
          do
          {
            v26 = v26
                + (float)((float)(expf(*(float *)(v36 + 20 * v21 + v25 * 4)) / v24)
                        * *(float *)&-[VCPVideoCNNCameraMotion run:withPersons:andRegionCrop:atTime:andDuration:]::kClassScore[v25]);
            ++v25;
          }
          while (v25 != 5);
          memset(&v41, 0, sizeof(v41));
          time = (CMTime)*a7;
          CMTimeMultiply(&v39, &time, v21);
          time = v39;
          CMTimeMultiplyByRatio(&v40, &time, 1, 2);
          time = v40;
          rhs = (CMTime)*a6;
          CMTimeAdd(&v41, &time, &rhs);
          results = self->_results;
          v44[0] = CFSTR("start");
          time = v41;
          v28 = CMTimeCopyAsDictionary(&time, 0);
          v45[0] = v28;
          v44[1] = CFSTR("duration");
          time = (CMTime)*a7;
          CMTimeMultiplyByRatio(&v38, &time, 1, 2);
          time = v38;
          v29 = CMTimeCopyAsDictionary(&time, 0);
          v45[1] = v29;
          v44[2] = CFSTR("flags");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v46 + v21));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v31 = 1.0 - v26;
          v45[2] = v30;
          v44[3] = CFSTR("quality");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v45[3] = v32;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](results, "addObject:", v33);

          v22 = 0;
          v21 = 1;
        }
        while ((v35 & 1) != 0);
        v10 = 0;
        goto LABEL_21;
      }
    }
LABEL_20:
    v10 = -18;
  }
LABEL_21:

  return v10;
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
    v5 = CFSTR("MLCameraMotionResults");
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
  objc_storeStrong((id *)&self->_motionScoreModel, 0);
  objc_storeStrong((id *)&self->_motionTypeModel, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
