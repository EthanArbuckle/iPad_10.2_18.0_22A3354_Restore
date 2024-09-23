@implementation VCPCNNPetsDetectorEspresso

- (VCPCNNPetsDetectorEspresso)initWithMaxNumRegions:(int)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSString *resConfig;
  VCPCNNPetsDetectorEspresso *v9;
  VCPCNNModelEspresso *v10;
  VCPCNNPetsDetectorEspresso *v11;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNPetsDetectorEspresso *v13;
  objc_super v15;

  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_pets.espresso.net"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_maxNumRegions = a3;
  resConfig = self->_resConfig;
  self->_resConfig = (NSString *)&stru_1E6B1C190;

  v15.receiver = self;
  v15.super_class = (Class)VCPCNNPetsDetectorEspresso;
  v9 = -[VCPCNNPetsDetectorEspresso init](&v15, sel_init);
  if (v9)
  {
    if (DeviceHasANE())
    {
      objc_msgSend((id)objc_opt_class(), "sharedModel:", v7);
      v10 = (VCPCNNModelEspresso *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", v7, 0, 0, 0);
    }
    modelEspresso = v9->_modelEspresso;
    v9->_modelEspresso = v10;

    if (v9->_modelEspresso)
      v11 = v9;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v13 = v11;

  return v13;
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
  v8[2] = __42__VCPCNNPetsDetectorEspresso_sharedModel___block_invoke;
  v8[3] = &unk_1E6B168B8;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("VCPPetsEspresso"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

VCPCNNModelEspresso *__42__VCPCNNPetsDetectorEspresso_sharedModel___block_invoke(uint64_t a1)
{
  return -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", *(_QWORD *)(a1 + 32), 0, 0, 0);
}

- (int)createModel:(int)a3 srcWidth:(int)a4
{
  int result;
  NSString *resConfig;
  __CFString *v9;
  float *inputData;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v12;
  VCPCNNModelEspresso *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  size_t v17;
  float *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (self->_srcWidth == a4 && self->_srcHeight == a3)
    return 0;
  if (a3 == a4)
  {
    resConfig = self->_resConfig;
    v9 = CFSTR("res_0");
  }
  else
  {
    resConfig = self->_resConfig;
    if (a3 >= a4)
      v9 = CFSTR("res_2");
    else
      v9 = CFSTR("res_1");
  }
  self->_resConfig = &v9->isa;

  result = -[VCPCNNModelEspresso prepareModelWithConfig:](self->_modelEspresso, "prepareModelWithConfig:", self->_resConfig);
  if (!result)
  {
    self->_srcHeight = 0;
    self->_srcWidth = 0;
    inputData = self->_inputData;
    if (inputData)
      MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
    modelEspresso = self->_modelEspresso;
    if (modelEspresso
      && (-[VCPCNNModelEspresso inputBlob](modelEspresso, "inputBlob"), (v12 = self->_modelEspresso) != 0))
    {
      -[VCPCNNModelEspresso inputBlob](v12, "inputBlob");
      v13 = self->_modelEspresso;
      v14 = v20 * v21;
      if (v13)
      {
        -[VCPCNNModelEspresso inputBlob](v13, "inputBlob");
        v15 = v19;
LABEL_18:
        v16 = v14 * v15;
        if (v16 >> 62)
          v17 = -1;
        else
          v17 = 4 * v16;
        v18 = (float *)operator new[](v17, MEMORY[0x1E0DE4E10]);
        self->_inputData = v18;
        if (!v18)
          return -108;
        result = 0;
        self->_srcWidth = a4;
        self->_srcHeight = a3;
        return result;
      }
    }
    else
    {
      v14 = 0;
    }
    v15 = 0;
    goto LABEL_18;
  }
  return result;
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

- (int)generatePetsBoxes:(id)a3 faceBoxes:(id)a4 cancel:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v14;
  uint64_t v15;
  uint64_t v16;
  VCPCNNModelEspresso *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10 || ((*((uint64_t (**)(id))v10 + 2))(v10) & 1) == 0)
  {
    v12 = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", self->_inputData);
    if (v12)
      goto LABEL_13;
    modelEspresso = self->_modelEspresso;
    if (modelEspresso)
    {
      -[VCPCNNModelEspresso outputBlob](modelEspresso, "outputBlob");
      v14 = self->_modelEspresso;
      v15 = DWORD2(v25);
      if (v14)
      {
        -[VCPCNNModelEspresso outputBlob](v14, "outputBlob");
        v16 = v25;
        v17 = self->_modelEspresso;
        if (v17)
        {
          -[VCPCNNModelEspresso outputBlob](v17, "outputBlob");
          v18 = v20;
LABEL_12:
          v12 = -[VCPCNNPetsDetector generatePetsRegions:outHeight:outWidth:boxes:faceBoxes:maxNumRegions:](self, "generatePetsRegions:outHeight:outWidth:boxes:faceBoxes:maxNumRegions:", v18, v15, v16, v8, v9, self->_maxNumRegions, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
          goto LABEL_13;
        }
LABEL_11:
        v18 = 0;
        v30 = 0;
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        goto LABEL_12;
      }
    }
    else
    {
      v15 = 0;
    }
    v16 = 0;
    goto LABEL_11;
  }
  v12 = -128;
LABEL_13:

  return v12;
}

- (void)dealloc
{
  float *inputData;
  objc_super v4;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNPetsDetectorEspresso;
  -[VCPCNNPetsDetectorEspresso dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end
