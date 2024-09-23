@implementation VCPVideoCNNQuality

- (VCPVideoCNNQuality)init
{
  VCPVideoCNNQuality *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSMutableArray *results;
  VCPCNNModelEspresso *v8;
  uint64_t v9;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VCPVideoCNNQuality;
  v2 = -[VCPVideoCNNQuality init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resourceURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("quality_head.espresso.net"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    results = v2->_results;
    v2->_results = (NSMutableArray *)v6;

    v8 = [VCPCNNModelEspresso alloc];
    v9 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:](v8, "initWithParameters:inputNames:outputNames:properties:", v5, &unk_1E6B76230, 0, MEMORY[0x1E0C9AA70]);
    modelEspresso = v2->_modelEspresso;
    v2->_modelEspresso = (VCPCNNModelEspresso *)v9;

    v11 = v2->_modelEspresso;
    if (v11)
      -[VCPCNNModelEspresso prepareModelWithConfig:](v11, "prepareModelWithConfig:", &stru_1E6B1C190);

  }
  return v2;
}

- (int)run:(id)a3 withPersons:(id)a4 andRegionCrop:(CGRect)a5 atTime:(id *)a6 andDuration:(id *)a7
{
  id v10;
  int v11;
  VCPCNNModelEspresso *modelEspresso;
  CMTimeValue value;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  float v18;
  uint64_t v19;
  float v20;
  NSMutableArray *results;
  CFDictionaryRef v22;
  CFDictionaryRef v23;
  double v24;
  void *v25;
  void *v26;
  id v28;
  VCPVideoCNNQuality *v29;
  CMTime v30;
  CMTime v31;
  CMTime v32;
  CMTime v33;
  CMTime time;
  CMTime rhs;
  _QWORD v36[3];
  _QWORD v37[5];

  v37[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v29 = self;
  v11 = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", objc_msgSend(v10, "outputBeforeTemporalPooling"));
  if (!v11)
  {
    modelEspresso = v29->_modelEspresso;
    if (modelEspresso && (-[VCPCNNModelEspresso outputBlob](modelEspresso, "outputBlob"), (value = time.value) != 0))
    {
      v28 = v10;
      v14 = 0;
      v15 = 1;
      do
      {
        v16 = 0;
        v17 = v15;
        v18 = 0.0;
        do
        {
          v18 = v18 + expf(*(float *)(value + 20 * v14 + v16));
          v16 += 4;
        }
        while (v16 != 20);
        v19 = 0;
        v20 = 0.0;
        do
        {
          v20 = v20
              + (float)((float)(expf(*(float *)(value + 20 * v14 + v19 * 4)) / v18)
                      * *(float *)&-[VCPVideoCNNQuality run:withPersons:andRegionCrop:atTime:andDuration:]::kClassScore[v19]);
          ++v19;
        }
        while (v19 != 5);
        memset(&v33, 0, sizeof(v33));
        time = (CMTime)*a7;
        CMTimeMultiply(&v31, &time, v14);
        time = v31;
        CMTimeMultiplyByRatio(&v32, &time, 1, 2);
        time = v32;
        rhs = (CMTime)*a6;
        CMTimeAdd(&v33, &time, &rhs);
        results = v29->_results;
        v36[0] = CFSTR("start");
        time = v33;
        v22 = CMTimeCopyAsDictionary(&time, 0);
        v37[0] = v22;
        v36[1] = CFSTR("duration");
        time = (CMTime)*a7;
        CMTimeMultiplyByRatio(&v30, &time, 1, 2);
        time = v30;
        v23 = CMTimeCopyAsDictionary(&time, 0);
        v37[1] = v23;
        v36[2] = CFSTR("quality");
        *(float *)&v24 = v20;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v37[2] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](results, "addObject:", v26);

        v15 = 0;
        v14 = 1;
      }
      while ((v17 & 1) != 0);
      v11 = 0;
      v10 = v28;
    }
    else
    {
      v11 = -18;
    }
  }

  return v11;
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
    v5 = CFSTR("MLQualityResults");
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
  objc_storeStrong((id *)&self->_modelEspresso, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
