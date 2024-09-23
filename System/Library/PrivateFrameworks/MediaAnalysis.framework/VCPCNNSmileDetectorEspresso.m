@implementation VCPCNNSmileDetectorEspresso

- (VCPCNNSmileDetectorEspresso)init
{
  void *v3;
  void *v4;
  void *v5;
  VCPCNNSmileDetectorEspresso *v6;
  float *v7;
  uint64_t v8;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v10;
  VCPCNNSmileDetectorEspresso *v11;
  VCPCNNSmileDetectorEspresso *v12;
  objc_super v14;

  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_smile.espresso.net"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)VCPCNNSmileDetectorEspresso;
  v6 = -[VCPCNNSmileDetectorEspresso init](&v14, sel_init);
  if (!v6)
    goto LABEL_6;
  v7 = (float *)operator new[](0x1900uLL, MEMORY[0x1E0DE4E10]);
  v6->_inputData = v7;
  if (!v7)
    goto LABEL_5;
  objc_msgSend((id)objc_opt_class(), "sharedModel:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  modelEspresso = v6->_modelEspresso;
  v6->_modelEspresso = (VCPCNNModelEspresso *)v8;

  v10 = v6->_modelEspresso;
  if (v10 && !-[VCPCNNModelEspresso prepareModelWithConfig:](v10, "prepareModelWithConfig:", &stru_1E6B1C190))
LABEL_6:
    v11 = v6;
  else
LABEL_5:
    v11 = 0;
  v12 = v11;

  return v12;
}

- (float)getInputBuffer
{
  return self->_inputData;
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
  v8[2] = __43__VCPCNNSmileDetectorEspresso_sharedModel___block_invoke;
  v8[3] = &unk_1E6B168B8;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("VCPSmileEspresso"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

VCPCNNModelEspresso *__43__VCPCNNSmileDetectorEspresso_sharedModel___block_invoke(uint64_t a1)
{
  return -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", *(_QWORD *)(a1 + 32), 0, 0, 0);
}

- (int)computeSmileScore:(float *)a3
{
  int result;
  uint64_t v6;

  result = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", self->_inputData);
  if (!result)
  {
    result = -[VCPCNNModelEspresso softmax](self->_modelEspresso, "softmax");
    if (!result)
    {
      -[VCPCNNModelEspresso outputBlob](self->_modelEspresso, "outputBlob");
      result = 0;
      *a3 = *(float *)(v6 + 4);
    }
  }
  return result;
}

- (void)dealloc
{
  float *inputData;
  objc_super v4;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNSmileDetectorEspresso;
  -[VCPCNNSmileDetectorEspresso dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end
