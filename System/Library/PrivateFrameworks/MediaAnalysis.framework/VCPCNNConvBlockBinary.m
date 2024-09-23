@implementation VCPCNNConvBlockBinary

- (VCPCNNConvBlockBinary)initWithParameters:(int)a3 filterNum:(int)a4 convType:(unint64_t)a5 reLU:(BOOL)a6 padding:(BOOL)a7
{
  _BOOL4 v7;
  VCPCNNConvBlockBinary *v12;
  VCPCNNConvBlockBinary *v13;
  MPSCNNBinaryConvolution *mpsBinaryConv;
  VCPCNNConvBlockBinary *v15;
  objc_super v17;

  v7 = a7;
  v17.receiver = self;
  v17.super_class = (Class)VCPCNNConvBlockBinary;
  v12 = -[VCPCNNConvBlockBinary init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    *(_DWORD *)(&v12->super._executedOnGPU + 3) = a3;
    v12->_filterSize = a4;
    v12->_filterWeightsBinary = 0;
    v12->_filterWeightSize = 1;
    v12->_filterScaling = 0;
    v12->_bias = 0;
    v12->_padding = v7;
    v12->_convType = a5;
    v12->_reLU = a6;
    mpsBinaryConv = v12->_mpsBinaryConv;
    v12->_mpsBinaryConv = 0;

    v15 = v13;
  }

  return v13;
}

- (void)dealloc
{
  unsigned int *filterWeightsBinary;
  float *filterScaling;
  float *bias;
  objc_super v6;

  filterWeightsBinary = self->_filterWeightsBinary;
  if (filterWeightsBinary)
    MEMORY[0x1BCCA128C](filterWeightsBinary, 0x1000C8052888210);
  filterScaling = self->_filterScaling;
  if (filterScaling)
    MEMORY[0x1BCCA128C](filterScaling, 0x1000C8052888210);
  bias = self->_bias;
  if (bias)
    MEMORY[0x1BCCA128C](bias, 0x1000C8052888210);
  v6.receiver = self;
  v6.super_class = (Class)VCPCNNConvBlockBinary;
  -[VCPCNNConvBlockBinary dealloc](&v6, sel_dealloc);
}

- (int)constructBlock:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  VCPCNNData *v8;
  VCPCNNData *output;
  NSMutableArray *v10;
  NSMutableArray *outputSize;
  NSMutableArray *v12;
  void *v13;
  int padding;
  NSMutableArray *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  int v30;
  int v31;
  uint64_t filterWeightSize;
  size_t v33;
  const std::nothrow_t *v34;
  uint64_t filterSize;
  size_t v36;
  float *v37;
  BOOL v38;
  id v40;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v25 = -50;
    goto LABEL_25;
  }
  objc_storeStrong((id *)&self->super._context, a4);
  +[VCPCNNData cnnDataWithGPUContext:](VCPCNNData, "cnnDataWithGPUContext:", v7);
  v8 = (VCPCNNData *)objc_claimAutoreleasedReturnValue();
  output = self->super._output;
  self->super._output = v8;

  objc_storeWeak((id *)&self->super._inputSize, v6);
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  outputSize = self->super._outputSize;
  self->super._outputSize = v10;

  v12 = self->super._outputSize;
  if (!v12)
    goto LABEL_24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_filterSize);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v6;
  -[NSMutableArray addObject:](v12, "addObject:", v13);

  padding = self->_padding;
  v15 = self->super._outputSize;
  v16 = (void *)MEMORY[0x1E0CB37E8];
  WeakRetained = objc_loadWeakRetained((id *)&self->super._inputSize);
  objc_msgSend(WeakRetained, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (padding)
  {
    objc_msgSend(v16, "numberWithInt:", objc_msgSend(v18, "intValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v15, "addObject:", v19);

    v20 = self->super._outputSize;
    v21 = (void *)MEMORY[0x1E0CB37E8];
    v22 = objc_loadWeakRetained((id *)&self->super._inputSize);
    objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithInt:", objc_msgSend(v23, "intValue"));
  }
  else
  {
    objc_msgSend(v16, "numberWithInt:", objc_msgSend(v18, "intValue") - *(_DWORD *)(&self->super._executedOnGPU + 3) + 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v15, "addObject:", v26);

    v20 = self->super._outputSize;
    v27 = (void *)MEMORY[0x1E0CB37E8];
    v22 = objc_loadWeakRetained((id *)&self->super._inputSize);
    objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithInt:", objc_msgSend(v23, "intValue") - *(_DWORD *)(&self->super._executedOnGPU + 3) + 1);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v20, "addObject:", v24);

  v6 = v40;
  -[VCPCNNData setSize:](self->super._output, "setSize:", self->super._outputSize);
  v25 = -[VCPCNNData allocBuffers:](self->super._output, "allocBuffers:", self->super._generateOutput);
  if (v25)
    goto LABEL_25;
  v28 = objc_loadWeakRetained((id *)&self->super._inputSize);
  objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "intValue");
  v31 = v30 + 31;
  if (v30 < -31)
    v31 = v30 + 62;
  self->_filterWeightSize = self->_filterSize
                          * (v31 >> 5)
                          * *(_DWORD *)(&self->super._executedOnGPU + 3)
                          * *(_DWORD *)(&self->super._executedOnGPU + 3);

  filterWeightSize = self->_filterWeightSize;
  v33 = (int)filterWeightSize < 0 ? -1 : 4 * filterWeightSize;
  v34 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
  self->_filterWeightsBinary = (unsigned int *)operator new[](v33, MEMORY[0x1E0DE4E10]);
  filterSize = self->_filterSize;
  v36 = (int)filterSize < 0 ? -1 : 4 * filterSize;
  self->_filterScaling = (float *)operator new[](v36, v34);
  v37 = (float *)operator new[](v36, v34);
  self->_bias = v37;
  if (!self->super._output)
  {
LABEL_24:
    v25 = -108;
    goto LABEL_25;
  }
  v25 = -108;
  if (self->_filterWeightsBinary)
  {
    if (v37)
      v38 = self->_filterScaling == 0;
    else
      v38 = 1;
    if (v38)
      v25 = -108;
    else
      v25 = 0;
  }
LABEL_25:

  return v25;
}

- (int)forward
{
  if (self->super._context)
    return -[VCPCNNConvBlockBinary gpuForward](self, "gpuForward");
  else
    return -50;
}

- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  if (!self->super._context)
    return 0;
  if (fread(self->_filterWeightsBinary, 4uLL, self->_filterWeightSize, a3)
    && fread(self->_filterScaling, 4uLL, self->_filterSize, a3)
    && fread(self->_bias, 4uLL, self->_filterSize, a3))
  {
    return -[VCPCNNConvBlockBinary fillConvWeightsGPU](self, "fillConvWeightsGPU");
  }
  return -19;
}

- (BOOL)supportGPU
{
  return 1;
}

- (BOOL)useGPU
{
  return self->super._context != 0;
}

- (int)gpuForward
{
  int result;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  MPSCNNBinaryConvolution *mpsBinaryConv;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  if (!self->super._executedOnGPU
    || (result = -[VCPCNNData reallocGPUTemporalBuffers](self->super._output, "reallocGPUTemporalBuffers")) == 0)
  {
    -[VCPCNNMetalContext commandBuffer](self->super._context, "commandBuffer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->super._input);
      objc_msgSend(WeakRetained, "mpsImg");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[VCPCNNData mpsImg](self->super._output, "mpsImg");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          mpsBinaryConv = self->_mpsBinaryConv;
          -[VCPCNNMetalContext commandBuffer](self->super._context, "commandBuffer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_loadWeakRetained((id *)&self->super._input);
          objc_msgSend(v11, "mpsImg");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPCNNData mpsImg](self->super._output, "mpsImg");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSCNNBinaryConvolution encodeToCommandBuffer:sourceImage:destinationImage:](mpsBinaryConv, "encodeToCommandBuffer:sourceImage:destinationImage:", v10, v12, v13);

          result = 0;
          self->super._executedOnGPU = 1;
          return result;
        }
      }
      else
      {

      }
    }
    return -108;
  }
  return result;
}

- (int)fillConvWeightsGPU
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  VCPCNNMPSDataSource *v13;
  id v14;
  void *v15;
  MPSCNNBinaryConvolution *v16;
  MPSCNNBinaryConvolution *mpsBinaryConv;
  MPSCNNBinaryConvolution *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  MPSCNNBinaryConvolution *v26;
  MPSCNNBinaryConvolution *v27;
  _QWORD v29[6];
  _QWORD v30[3];

  v3 = *(int *)(&self->super._executedOnGPU + 3);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._inputSize);
  objc_msgSend(WeakRetained, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  -[NSMutableArray objectAtIndexedSubscript:](self->super._outputSize, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "intValue");

  objc_msgSend(MEMORY[0x1E0CC6CB0], "cnnConvolutionDescriptorWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:", v3, v3, v6, (int)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (self->_reLU)
    {
      objc_msgSend(v8, "fusedNeuronDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNeuronType:", 1);

      objc_msgSend(v9, "fusedNeuronDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = 0;
      objc_msgSend(v11, "setA:", v12);

    }
    objc_msgSend(v9, "setFeatureChannelsLayout:", 1);
    v13 = -[VCPCNNMPSDataSource initWith:convolutionDescriptor:kernelWeights:biasTerm:]([VCPCNNMPSDataSource alloc], "initWith:convolutionDescriptor:kernelWeights:biasTerm:", 268435488, v9, self->_filterWeightsBinary, 0);
    if (!v13)
      goto LABEL_9;
    v14 = objc_alloc(MEMORY[0x1E0CC6CA0]);
    -[VCPCNNMetalContext device](self->super._context, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (MPSCNNBinaryConvolution *)objc_msgSend(v14, "initWithDevice:convolutionData:outputBiasTerms:outputScaleTerms:inputBiasTerms:inputScaleTerms:type:flags:", v15, v13, self->_bias, self->_filterScaling, 0, 0, self->_convType, 0);
    mpsBinaryConv = self->_mpsBinaryConv;
    self->_mpsBinaryConv = v16;

    v18 = self->_mpsBinaryConv;
    if (v18)
    {
      -[MPSCNNBinaryConvolution setEdgeMode:](v18, "setEdgeMode:", 0);
      -[NSMutableArray objectAtIndexedSubscript:](self->super._outputSize, "objectAtIndexedSubscript:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "intValue");
      -[NSMutableArray objectAtIndexedSubscript:](self->super._outputSize, "objectAtIndexedSubscript:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "intValue");

      if (!self->_padding)
      {
        if ((_DWORD)v3 == 1)
        {
          v23 = 0;
        }
        else
        {
          v25 = v3 - 1;
          if ((int)v3 < 1)
            v25 = v3;
          LODWORD(v23) = v25 >> 1;
          if ((int)v23 <= 1)
            v23 = 1;
          else
            v23 = v23;
        }
        v26 = self->_mpsBinaryConv;
        v30[0] = v23;
        v30[1] = v23;
        v30[2] = 0;
        -[MPSCNNBinaryConvolution setOffset:](v26, "setOffset:", v30);
      }
      v27 = self->_mpsBinaryConv;
      memset(v29, 0, 24);
      v29[3] = v20;
      v29[4] = v22;
      v29[5] = 1;
      -[MPSCNNBinaryConvolution setClipRect:](v27, "setClipRect:", v29);
      v24 = 0;
    }
    else
    {
LABEL_9:
      v24 = -108;
    }

  }
  else
  {
    v24 = -108;
  }

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mpsBinaryConv, 0);
}

@end
