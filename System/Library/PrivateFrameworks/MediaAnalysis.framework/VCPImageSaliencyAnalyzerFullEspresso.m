@implementation VCPImageSaliencyAnalyzerFullEspresso

- (void)dealloc
{
  float *inputData;
  objc_super v4;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPImageSaliencyAnalyzerFullEspresso;
  -[VCPImageSaliencyAnalyzerFullEspresso dealloc](&v4, sel_dealloc);
}

- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4
{
  void *v7;
  void *v8;
  void *v9;
  VCPCNNModelEspresso *v10;
  VCPCNNModelEspresso *modelEspresso;
  int v12;
  NSString *resConfig;
  __CFString *v14;
  float *inputData;
  VCPCNNModelEspresso *v16;
  VCPCNNModelEspresso *v17;
  VCPCNNModelEspresso *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  size_t v22;
  float *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_saliency.espresso.net"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_modelEspresso)
  {
    objc_msgSend((id)objc_opt_class(), "sharedModel:", v9);
    v10 = (VCPCNNModelEspresso *)objc_claimAutoreleasedReturnValue();
    modelEspresso = self->_modelEspresso;
    self->_modelEspresso = v10;

    if (!self->_modelEspresso)
      goto LABEL_25;
  }
  if (self->_srcWidth == a3 && self->_srcHeight == a4)
  {
    v12 = 0;
    goto LABEL_26;
  }
  if (a4 == a3)
  {
    resConfig = self->_resConfig;
    v14 = CFSTR("res_0");
  }
  else
  {
    resConfig = self->_resConfig;
    if (a4 >= a3)
      v14 = CFSTR("res_2");
    else
      v14 = CFSTR("res_1");
  }
  self->_resConfig = &v14->isa;

  v12 = -[VCPCNNModelEspresso prepareModelWithConfig:](self->_modelEspresso, "prepareModelWithConfig:", self->_resConfig);
  if (!v12)
  {
    self->_srcHeight = 0;
    self->_srcWidth = 0;
    inputData = self->_inputData;
    if (inputData)
      MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
    v16 = self->_modelEspresso;
    if (v16 && (-[VCPCNNModelEspresso inputBlob](v16, "inputBlob"), (v17 = self->_modelEspresso) != 0))
    {
      -[VCPCNNModelEspresso inputBlob](v17, "inputBlob");
      v18 = self->_modelEspresso;
      v19 = v26 * v27;
      if (v18)
      {
        -[VCPCNNModelEspresso inputBlob](v18, "inputBlob");
        v20 = v25;
        goto LABEL_20;
      }
    }
    else
    {
      v19 = 0;
    }
    v20 = 0;
LABEL_20:
    v21 = v19 * v20;
    if (v21 >> 62)
      v22 = -1;
    else
      v22 = 4 * v21;
    v23 = (float *)operator new[](v22, MEMORY[0x1E0DE4E10]);
    self->_inputData = v23;
    if (v23)
    {
      v12 = 0;
      self->_srcWidth = a3;
      self->_srcHeight = a4;
      goto LABEL_26;
    }
LABEL_25:
    v12 = -108;
  }
LABEL_26:

  return v12;
}

+ (id)sharedModel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__VCPImageSaliencyAnalyzerFullEspresso_sharedModel___block_invoke;
  v8[3] = &unk_1E6B168B8;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("VCPSaliencyFullEspresso"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

VCPCNNModelEspresso *__52__VCPImageSaliencyAnalyzerFullEspresso_sharedModel___block_invoke(uint64_t a1)
{
  return -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", *(_QWORD *)(a1 + 32), 0, 0, 0);
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  VCPCNNModelEspresso *modelEspresso;
  int v10;
  VCPCNNModelEspresso *v11;
  int v12;
  int v14;
  int v15;

  modelEspresso = self->_modelEspresso;
  if (modelEspresso)
  {
    -[VCPCNNModelEspresso inputBlob](modelEspresso, "inputBlob", *(_QWORD *)&a3, *(_QWORD *)&a4);
    v10 = v15;
  }
  else
  {
    v10 = 0;
  }
  *a5 = v10;
  v11 = self->_modelEspresso;
  if (v11)
  {
    -[VCPCNNModelEspresso inputBlob](v11, "inputBlob");
    v12 = v14;
  }
  else
  {
    v12 = 0;
  }
  *a6 = v12;
  return self->_inputData;
}

- (int)getSalientRegions:(id)a3
{
  uint64_t (**v4)(_QWORD);
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  VCPCNNModelEspresso *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v4 = (uint64_t (**)(_QWORD))a3;
  modelEspresso = self->_modelEspresso;
  if (modelEspresso)
  {
    -[VCPCNNModelEspresso outputBlob](modelEspresso, "outputBlob");
    v6 = self->_modelEspresso;
    v7 = DWORD2(v18);
    if (v6)
    {
      -[VCPCNNModelEspresso outputBlob](v6, "outputBlob");
      v8 = v18;
      if (!v4)
        goto LABEL_10;
    }
    else
    {
      v8 = 0;
      if (!v4)
        goto LABEL_10;
    }
  }
  else
  {
    v8 = 0;
    v7 = 0;
    if (!v4)
      goto LABEL_10;
  }
  if ((v4[2](v4) & 1) != 0)
  {
    v9 = -128;
    goto LABEL_15;
  }
LABEL_10:
  v9 = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", self->_inputData);
  if (!v9)
  {
    v10 = self->_modelEspresso;
    if (v10)
    {
      -[VCPCNNModelEspresso outputBlob](v10, "outputBlob");
      v11 = v13;
    }
    else
    {
      v11 = 0;
      v23 = 0;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
    }
    v9 = -[VCPImageSaliencyAnalyzer generateSalientRegion:outHeight:outWidth:](self, "generateSalientRegion:outHeight:outWidth:", v11, v7, v8, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
  }
LABEL_15:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end
