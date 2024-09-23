@implementation VCPCNNFastGestureRecognition

- (VCPCNNFastGestureRecognition)init
{
  VCPCNNFastGestureRecognition *v2;
  void *v3;
  void *v4;
  void *v5;
  VCPCNNModelEspresso *v6;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v8;
  NSObject *v9;
  id v10;
  VCPCNNModelEspresso *v11;
  int v12;
  VCPCNNModelEspresso *v13;
  int v14;
  VCPCNNModelEspresso *v15;
  int v16;
  VCPCNNFastGestureRecognition *v17;
  VCPCNNModelEspresso *v18;
  VCPCNNModelEspresso *v19;
  int v20;
  VCPCNNModelEspresso *v21;
  int v22;
  int v23;
  float *v24;
  VCPCNNFastGestureRecognition *v25;
  int v27;
  int v28;
  uint8_t buf[16];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  objc_super v40;
  uint8_t v41[4];
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)VCPCNNFastGestureRecognition;
  v2 = -[VCPCNNFastGestureRecognition init](&v40, sel_init);
  if (v2)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "CNNFastGestureRecognition: start loading model", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resourceURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("gesture_recognition.espresso.net"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", v5, 0, 0, 0);
    modelEspresso = v2->_modelEspresso;
    v2->_modelEspresso = v6;

    v8 = v2->_modelEspresso;
    if (!v8 || -[VCPCNNModelEspresso prepareModelWithConfig:](v8, "prepareModelWithConfig:", &stru_1E6B1C190))
      goto LABEL_30;
    if ((int)MediaAnalysisLogLevel() < 7)
    {
LABEL_19:
      v18 = v2->_modelEspresso;
      if (v18 && (-[VCPCNNModelEspresso inputBlob](v18, "inputBlob"), (v19 = v2->_modelEspresso) != 0))
      {
        v20 = DWORD2(v34);
        -[VCPCNNModelEspresso inputBlob](v19, "inputBlob");
        v21 = v2->_modelEspresso;
        v22 = v28 * v20;
        if (v21)
        {
          -[VCPCNNModelEspresso inputBlob](v21, "inputBlob");
          v23 = v27;
LABEL_25:
          if (v22 * v23 == 378)
          {
            v24 = (float *)operator new[](0x5E8uLL, MEMORY[0x1E0DE4E10]);
            v2->_inputData = v24;
            if (v24)
            {
              v17 = v2;
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v17 = v2;
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "CNNFastGestureRecognition: successfully loaded model", buf, 2u);
                  v17 = v2;
                }
              }
              goto LABEL_31;
            }
          }
LABEL_30:
          v17 = 0;
LABEL_31:

          goto LABEL_32;
        }
      }
      else
      {
        v22 = 0;
      }
      v23 = 0;
      goto LABEL_25;
    }
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
LABEL_18:

      goto LABEL_19;
    }
    v11 = v2->_modelEspresso;
    if (v11)
    {
      -[VCPCNNModelEspresso inputBlob](v11, "inputBlob");
      v12 = DWORD2(v34);
      v13 = v2->_modelEspresso;
      if (v13)
      {
        -[VCPCNNModelEspresso inputBlob](v13, "inputBlob");
        v14 = v28;
        v15 = v2->_modelEspresso;
        if (v15)
        {
          -[VCPCNNModelEspresso inputBlob](v15, "inputBlob");
          v16 = v27;
LABEL_17:
          *(_DWORD *)v41 = 67109632;
          v42 = v12;
          v43 = 1024;
          v44 = v14;
          v45 = 1024;
          v46 = v16;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "CNNFastGestureRecognition: inputBlob.height = %d, inputBlob.width = %d, inputBlob.channels = %d", v41, 0x14u);
          goto LABEL_18;
        }
LABEL_16:
        v16 = 0;
        v27 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      v12 = 0;
      v39 = 0;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      *(_OWORD *)buf = 0u;
      v30 = 0u;
    }
    v14 = 0;
    v28 = 0;
    goto LABEL_16;
  }
  v17 = 0;
LABEL_32:
  v25 = v17;

  return v25;
}

- (void)dealloc
{
  float *inputData;
  objc_super v4;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNFastGestureRecognition;
  -[VCPCNNFastGestureRecognition dealloc](&v4, sel_dealloc);
}

+ (id)detector
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[VCPCNNFastGestureRecognition detector]::analyzerClass = objc_opt_class();
  }
  return objc_alloc_init((Class)+[VCPCNNFastGestureRecognition detector]::analyzerClass);
}

- (int)planDestroy
{
  return 0;
}

- (int)createInput:(float *)a3 keypoints:(id)a4
{
  id v5;
  uint64_t v6;
  float *v7;
  void *v8;
  uint64_t v9;
  float *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  int v18;

  v5 = a4;
  if (a3)
  {
    v6 = 0;
    v7 = a3 + 21;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      v10 = v7;
      do
      {
        objc_msgSend(v8, "objectAtIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndex:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatValue");
        *((_DWORD *)v10 - 21) = v13;

        objc_msgSend(v11, "objectAtIndex:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "floatValue");
        *(_DWORD *)v10 = v15;

        objc_msgSend(v11, "objectAtIndex:", 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        *((_DWORD *)v10 + 21) = v17;

        ++v9;
        ++v10;
      }
      while (v9 != 21);

      ++v6;
      v7 += 63;
    }
    while (v6 != 6);
    v18 = 0;
  }
  else
  {
    v18 = -108;
  }

  return v18;
}

- (int)getDetectionScore:(float *)a3
{
  int v5;
  uint64_t v7;

  v5 = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", self->_inputData);
  if (!v5)
  {
    -[VCPCNNModelEspresso outputBlob](self->_modelEspresso, "outputBlob");
    -[VCPCNNModelEspresso outputBlob](self->_modelEspresso, "outputBlob");
    -[VCPCNNModelEspresso outputBlob](self->_modelEspresso, "outputBlob");
    -[VCPCNNModelEspresso outputBlob](self->_modelEspresso, "outputBlob");
    *a3 = *(float *)(v7 + 4);
  }
  return v5;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  return 0;
}

- (int)gestureDetection:(id)a3 score:(float *)a4
{
  void *v7;
  int v8;

  v7 = (void *)MEMORY[0x1BCCA1B2C](self, a2);
  v8 = -[VCPCNNFastGestureRecognition createInput:keypoints:](self, "createInput:keypoints:", self->_inputData, a3);
  if (!v8)
    v8 = -[VCPCNNFastGestureRecognition getDetectionScore:](self, "getDetectionScore:", a4);
  objc_autoreleasePoolPop(v7);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end
