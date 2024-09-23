@implementation VCPCNNBlurAnalyzerMPS

- (VCPCNNBlurAnalyzerMPS)init
{
  VCPCNNBlurAnalyzerMPS *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSURL *modelURL;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCPCNNBlurAnalyzerMPS;
  v2 = -[VCPCNNBlurAnalyzer init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resourceURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_blur.dat"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    modelURL = v2->_modelURL;
    v2->_modelURL = (NSURL *)v5;

  }
  return v2;
}

- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4
{
  VCPCNNModel *v5;
  VCPCNNModel *model;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  if (!+[VCPCNNMetalContext supportGPU](VCPCNNMetalContext, "supportGPU", *(_QWORD *)&a3, *(_QWORD *)&a4))
    return -50;
  v5 = -[VCPCNNModel initWithParameters:useGPU:]([VCPCNNModel alloc], "initWithParameters:useGPU:", 1, 1);
  model = self->_model;
  self->_model = v5;

  if (!self->_model)
    return -108;
  +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 5, 20, 1, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VCPCNNModel add:](self->_model, "add:", v7);
  if (!v8)
  {
    +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 32, 1, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[VCPCNNModel add:](self->_model, "add:", v9);
    if (!v8)
    {
      +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", 2, 2, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[VCPCNNModel add:](self->_model, "add:", v10);
      if (!v8)
      {
        +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 64, 1, 1, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[VCPCNNModel add:](self->_model, "add:", v11);
        if (!v8)
        {
          +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 64, 1, 1, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[VCPCNNModel add:](self->_model, "add:", v12);
          if (!v8)
          {
            +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", 2, 2, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = -[VCPCNNModel add:](self->_model, "add:", v13);
            if (!v8)
            {
              +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 4, 100, 1, 1, 0);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = -[VCPCNNModel add:](self->_model, "add:", v16);
              if (!v8)
              {
                +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 1, 36, 1, 0, 0);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v8 = -[VCPCNNModel add:](self->_model, "add:", v14);

              }
            }

          }
        }

      }
    }

  }
  return v8;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  uint64_t v6;
  uint64_t v8;
  void *v9;
  VCPCNNData *v10;
  VCPCNNData *input;

  v6 = *(_QWORD *)&a4;
  *a5 = a3;
  *a6 = a4;
  v8 = *a5;
  -[VCPCNNModel getGPUContext](self->_model, "getGPUContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPCNNData cnnDataWithPlane:height:width:context:](VCPCNNData, "cnnDataWithPlane:height:width:context:", 1, v8, v6, v9);
  v10 = (VCPCNNData *)objc_claimAutoreleasedReturnValue();
  input = self->_input;
  self->_input = v10;

  -[VCPCNNData allocBuffers:](self->_input, "allocBuffers:", 1);
  return -[VCPCNNData data](self->_input, "data");
}

- (int)computeSharpnessScore:(float *)a3 textureness:(char *)a4 contrast:(float)a5 imgWidth:(int)a6 cancel:(id)a7
{
  uint64_t v7;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  int v20;
  unsigned int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v7 = *(_QWORD *)&a6;
  v12 = -[VCPCNNModel dynamicForward:paramFileUrl:cancel:](self->_model, "dynamicForward:paramFileUrl:cancel:", self->_input, self->_modelURL, a7);
  if (!v12)
  {
    -[VCPCNNModel output](self->_model, "output");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v29, "data");
    -[VCPCNNModel output](self->_model, "output");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "size");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v26, "intValue");
    -[VCPCNNModel output](self->_model, "output");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "size");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");
    -[VCPCNNModel output](self->_model, "output");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");
    *(float *)&v19 = a5;
    -[VCPCNNBlurAnalyzer calculateScoreFromNetworkOutput:outChannel:outHeight:outWidth:textureness:contrast:imgWidth:](self, "calculateScoreFromNetworkOutput:outChannel:outHeight:outWidth:textureness:contrast:imgWidth:", v24, v22, v14, v18, a4, v7, v19);
    *(_DWORD *)a3 = v20;

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
