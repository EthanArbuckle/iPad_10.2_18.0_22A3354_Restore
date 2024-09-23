@implementation VCPRequest

- (VCPRequest)init
{
  uint8_t v4[16];

  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Not implemented, please use initWithOptions", v4, 2u);
  }

  return 0;
}

- (VCPRequest)initWithOptions:(id)a3
{
  id v4;
  VCPRequest *v5;
  void *v6;
  void *v7;
  int v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  float v41;
  float v42;
  BOOL v43;
  float v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)VCPRequest;
  v5 = -[VCPRequest init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("forceCPU"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("forceCPU"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      if (v8)
        v5->_useCPUOnly = 1;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("revision"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("revision"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_revision = objc_msgSend(v10, "intValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frameWidth"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frameWidth"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_width = objc_msgSend(v12, "intValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frameHeight"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frameHeight"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_height = objc_msgSend(v14, "intValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxNumberHands"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxNumberHands"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_maxNumHands = objc_msgSend(v16, "intValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxNumberPets"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxNumberPets"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_maxNumPets = objc_msgSend(v18, "intValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("humanActionWindowSize"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("humanActionWindowSize"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_humanActionWindowSize = objc_msgSend(v20, "intValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("motionFlowComputationAccuracy"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("motionFlowComputationAccuracy"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_motionFlowComputationAccuracy = objc_msgSend(v22, "unsignedIntValue");

    }
    v5->_enableHandDetection = 1;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disableHandDetection"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disableHandDetection"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_enableHandDetection = objc_msgSend(v24, "BOOLValue") ^ 1;

    }
    v5->_enableANSTHandDetection = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enableANSTHandDetection"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enableANSTHandDetection"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_enableANSTHandDetection = objc_msgSend(v26, "BOOLValue");

    }
    v5->_enableRejectHandsNearBoundaries = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enableRejectHandsNearBoundaries"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enableRejectHandsNearBoundaries"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_enableRejectHandsNearBoundaries = objc_msgSend(v28, "BOOLValue");

    }
    v5->_maxNumOfPersons = 1;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxNumOfPersons"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxNumOfPersons"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_maxNumOfPersons = objc_msgSend(v30, "intValue");

    }
    v5->_maxNumOfPersonsForPose = 4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxNumOfPersons"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxNumOfPersons"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_maxNumOfPersonsForPose = objc_msgSend(v32, "intValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("optimizeForDistance"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("optimizeForDistance"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_optimizeForDistance = objc_msgSend(v34, "BOOLValue");

    }
    v5->_enableHandPoseLite = objc_msgSend((id)objc_opt_class(), "useHandsLitePoseForVision");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("handPoseLite"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("handPoseLite"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_enableHandPoseLite = objc_msgSend(v36, "BOOLValue");

    }
    v5->_useAsync = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useAsync"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useAsync"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_useAsync = objc_msgSend(v38, "BOOLValue");

    }
    v5->_minHandSize = 0.05;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minHandSize"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minHandSize"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "floatValue");
      v42 = 1.0;
      if (v41 < 1.0)
        v42 = v41;
      v43 = v41 > 0.0;
      v44 = 0.0;
      if (v43)
        v44 = v42;
      v5->_minHandSize = v44;

    }
  }

  return v5;
}

+ (BOOL)useHandsLitePoseForVision
{
  return 0;
}

- (BOOL)updateWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("frameWidth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("frameWidth"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_width = objc_msgSend(v7, "intValue");

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("frameWidth"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("frameHeight"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_height = objc_msgSend(v9, "intValue");

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("motionFlowComputationAccuracy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("motionFlowComputationAccuracy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_motionFlowComputationAccuracy = objc_msgSend(v11, "unsignedIntValue");

  }
  return 1;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  double v5;
  double v6;
  CGSize result;

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (unsigned)preferredPixelFormat
{
  return 0;
}

- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)useCPUOnly
{
  return self->_useCPUOnly;
}

- (unsigned)revision
{
  return self->_revision;
}

@end
