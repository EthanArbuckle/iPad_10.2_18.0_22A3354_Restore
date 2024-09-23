@implementation VCPCNNFaceLandmarkDetectorMPS

- (VCPCNNFaceLandmarkDetectorMPS)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  VCPCNNFaceLandmarkDetectorMPS *v6;
  VCPCNNModel *v7;
  VCPCNNModel *modelLandmarks;
  VCPCNNModel *v9;
  void *v10;
  uint64_t v11;
  VCPCNNData *faceInput;
  VCPCNNFaceLandmarkDetectorMPS *v13;
  int v14;
  void *v15;
  VCPCNNFaceLandmarkDetectorMPS *v16;
  void *v18;
  void *v19;
  int v20;
  VCPCNNFlattenBlock *v21;
  void *v22;
  void *v23;
  VCPCNNModel *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v3 = +[VCPCNNMetalContext supportGPU](VCPCNNMetalContext, "supportGPU");
  if (+[VCPCNNMetalContext supportVectorForward](VCPCNNMetalContext, "supportVectorForward"))
    v4 = 4;
  else
    v4 = 1;
  if (v3)
    v5 = 1;
  else
    v5 = v4;
  v33.receiver = self;
  v33.super_class = (Class)VCPCNNFaceLandmarkDetectorMPS;
  v6 = -[VCPCNNFaceLandmarkDetectorMPS init](&v33, sel_init);
  if (!v6)
    goto LABEL_23;
  v7 = -[VCPCNNModel initWithParameters:useGPU:]([VCPCNNModel alloc], "initWithParameters:useGPU:", 1, v3);
  modelLandmarks = v6->_modelLandmarks;
  v6->_modelLandmarks = v7;

  v9 = v6->_modelLandmarks;
  if (!v9)
  {
LABEL_22:
    v16 = 0;
LABEL_24:
    v13 = v16;
    goto LABEL_25;
  }
  -[VCPCNNModel getGPUContext](v9, "getGPUContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPCNNData cnnDataWithPlane:height:width:context:](VCPCNNData, "cnnDataWithPlane:height:width:context:", 1, 40, 40, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  faceInput = v6->_faceInput;
  v6->_faceInput = (VCPCNNData *)v11;

  -[VCPCNNData allocBuffers:](v6->_faceInput, "allocBuffers:", 1);
  +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 5, 20, v5, 1, 0);
  v13 = (VCPCNNFaceLandmarkDetectorMPS *)objc_claimAutoreleasedReturnValue();
  v14 = -[VCPCNNModel add:](v6->_modelLandmarks, "add:", v13);
  if (v14)
    goto LABEL_20;
  +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", 2, 2, v5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VCPCNNModel add:](v6->_modelLandmarks, "add:", v32);
  if (v14)
  {
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 48, v5, 1, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VCPCNNModel add:](v6->_modelLandmarks, "add:", v31);
  if (v14)
  {
LABEL_18:

    goto LABEL_19;
  }
  +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", 2, 2, v5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VCPCNNModel add:](v6->_modelLandmarks, "add:", v30);
  if (v14)
  {
LABEL_17:

    goto LABEL_18;
  }
  +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 3, 64, v5, 1, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VCPCNNModel add:](v6->_modelLandmarks, "add:", v29);
  if (v14)
  {
LABEL_16:

    goto LABEL_17;
  }
  +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", 2, 2, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VCPCNNModel add:](v6->_modelLandmarks, "add:", v15);
  if (v14)
  {

    goto LABEL_16;
  }
  +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 2, 64, v5, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VCPCNNModel add:](v6->_modelLandmarks, "add:", v18);
  if (v14
    || !v3
    && (v21 = -[VCPCNNFlattenBlock initWithParameters:]([VCPCNNFlattenBlock alloc], "initWithParameters:", v4), v14 = -[VCPCNNModel add:](v6->_modelLandmarks, "add:", v21), v21, v14))
  {
    v19 = v15;
    v20 = 4;
  }
  else
  {
    v19 = v15;
    +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:NeuronType:](VCPCNNFullConnectionBlock, "fcBlockWithNumNeurons:NeuronType:", 100, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[VCPCNNModel add:](v6->_modelLandmarks, "add:", v22);
    if (v14)
    {
      v20 = 4;
    }
    else
    {
      +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:NeuronType:](VCPCNNFullConnectionBlock, "fcBlockWithNumNeurons:NeuronType:", 14, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[VCPCNNModel add:](v6->_modelLandmarks, "add:", v28);
      if (v14)
      {
        v20 = 4;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "resourceURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_lm.dat"), v27);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v6->_modelLandmarks;
        -[VCPCNNData size](v6->_faceInput, "size");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[VCPCNNModel prepareNetworkFromURL:withInputSize:](v24, "prepareNetworkFromURL:withInputSize:", v26, v25);

        v20 = 4 * (v14 != 0);
      }

    }
  }

  if ((v20 | 4) == 4)
  {
LABEL_21:
    if (v14)
      goto LABEL_22;
LABEL_23:
    v16 = v6;
    goto LABEL_24;
  }
LABEL_25:

  return v13;
}

- (float)getInputBuffer
{
  return -[VCPCNNData data](self->_faceInput, "data");
}

- (int)computeLandmarks:(float *)a3
{
  int result;
  unint64_t v6;
  int v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  result = -[VCPCNNData normalization](self->_faceInput, "normalization");
  if (!result)
  {
    result = -[VCPCNNModel forward:](self->_modelLandmarks, "forward:", self->_faceInput);
    if (!result)
    {
      v6 = 0;
      v7 = 1;
      while (1)
      {
        -[VCPCNNModel output](self->_modelLandmarks, "output");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "size");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        -[VCPCNNModel output](self->_modelLandmarks, "output");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v10 <= v6)
          break;
        objc_msgSend(v11, "size");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v7 *= objc_msgSend(v14, "intValue");

        ++v6;
      }
      memcpy(a3, (const void *)objc_msgSend(v11, "data"), 4 * v7);

      return 0;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceInput, 0);
  objc_storeStrong((id *)&self->_modelLandmarks, 0);
}

@end
