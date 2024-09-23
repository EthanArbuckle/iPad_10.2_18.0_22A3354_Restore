@implementation VCPImageSaliencyAnalyzerFull

- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  NSURL *v8;
  NSURL *modelURL;
  VCPCNNModel *v10;
  VCPCNNModel *model;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v5 = +[VCPCNNMetalContext supportGPU](VCPCNNMetalContext, "supportGPU", *(_QWORD *)&a3, *(_QWORD *)&a4);
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_saliency.dat"), v7);
  v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
  modelURL = self->_modelURL;
  self->_modelURL = v8;

  v10 = -[VCPCNNModel initWithParameters:useGPU:]([VCPCNNModel alloc], "initWithParameters:useGPU:", 3200, v5);
  model = self->_model;
  self->_model = v10;

  if (self->_model)
  {
    +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 32, self->super._chunk, 1, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[VCPCNNModel add:](self->_model, "add:", v12);
    if (!v13)
    {
      +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 32, self->super._chunk, 1, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[VCPCNNModel add:](self->_model, "add:", v14);
      if (!v13)
      {
        +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", 2, 2, self->super._chunk);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[VCPCNNModel add:](self->_model, "add:", v15);
        if (!v13)
        {
          +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 64, self->super._chunk, 1, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[VCPCNNModel add:](self->_model, "add:", v27);
          if (!v13)
          {
            +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 64, self->super._chunk, 1, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[VCPCNNModel add:](self->_model, "add:", v26);
            if (!v13)
            {
              +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", 2, 2, self->super._chunk);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = -[VCPCNNModel add:](self->_model, "add:", v25);
              if (!v13)
              {
                +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 128, self->super._chunk, 1, 1);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = -[VCPCNNModel add:](self->_model, "add:", v24);
                if (!v13)
                {
                  +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 128, self->super._chunk, 1, 1);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v13 = -[VCPCNNModel add:](self->_model, "add:", v23);
                  if (!v13)
                  {
                    +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 128, self->super._chunk, 1, 1);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v13 = -[VCPCNNModel add:](self->_model, "add:", v22);
                    if (!v13)
                    {
                      +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", 2, 2, self->super._chunk);
                      v16 = (void *)objc_claimAutoreleasedReturnValue();
                      v13 = -[VCPCNNModel add:](self->_model, "add:", v16);
                      if (!v13)
                      {
                        +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 256, self->super._chunk, 1, 1);
                        v21 = (void *)objc_claimAutoreleasedReturnValue();
                        v13 = -[VCPCNNModel add:](self->_model, "add:", v21);
                        if (!v13)
                        {
                          +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 256, self->super._chunk, 1, 1);
                          v20 = (void *)objc_claimAutoreleasedReturnValue();
                          v13 = -[VCPCNNModel add:](self->_model, "add:", v20);
                          if (!v13)
                          {
                            +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 256, self->super._chunk, 1, 1);
                            v19 = (void *)objc_claimAutoreleasedReturnValue();
                            v13 = -[VCPCNNModel add:](self->_model, "add:", v19);
                            if (!v13)
                            {
                              +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 1, 4, self->super._chunk, 1, 1);
                              v17 = (void *)objc_claimAutoreleasedReturnValue();
                              v13 = -[VCPCNNModel add:](self->_model, "add:", v17);

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

        }
      }

    }
  }
  else
  {
    v13 = -108;
  }

  return v13;
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
  +[VCPCNNData cnnDataWithPlane:height:width:context:](VCPCNNData, "cnnDataWithPlane:height:width:context:", 4, v8, v6, v9);
  v10 = (VCPCNNData *)objc_claimAutoreleasedReturnValue();
  input = self->_input;
  self->_input = v10;

  -[VCPCNNData allocBuffers:](self->_input, "allocBuffers:", 1);
  return -[VCPCNNData data](self->_input, "data");
}

- (int)getSalientRegions:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = -[VCPCNNModel dynamicForward:paramFileUrl:cancel:](self->_model, "dynamicForward:paramFileUrl:cancel:", self->_input, self->_modelURL, a3);
  if (!v4)
  {
    -[VCPCNNModel output](self->_model, "output");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    -[VCPCNNModel output](self->_model, "output");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");

    -[VCPCNNModel output](self->_model, "output");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[VCPImageSaliencyAnalyzer generateSalientRegion:outHeight:outWidth:](self, "generateSalientRegion:outHeight:outWidth:", objc_msgSend(v13, "data"), v8, v12);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
