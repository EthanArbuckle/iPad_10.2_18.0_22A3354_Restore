@implementation VCPCNNFullConnectionBlockGPU

- (int)convVCPNeuronTypeToMPS:(int)a3
{
  return a3 == 1;
}

- (int)setupMPS
{
  NSMutableArray **p_inputSize;
  id WeakRetained;
  unint64_t v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  VCPCNNMPSDataSource *v24;
  id v25;
  void *v26;
  MPSCNNFullyConnected *v27;
  MPSCNNFullyConnected *mpsFullConn;
  MPSCNNFullyConnected *v29;
  MPSCNNFullyConnected *v30;
  int v31;
  uint64_t v32;
  int v33;
  MPSCNNFullyConnected *v34;
  int v35;
  _QWORD v37[3];
  _QWORD v38[3];
  int64x2_t v39;
  uint64_t v40;

  p_inputSize = &self->super.super._inputSize;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  v5 = objc_msgSend(WeakRetained, "count");

  v6 = objc_loadWeakRetained((id *)p_inputSize);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  if (v5 < 3)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v17, "intValue");

    -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "intValue");
    v11 = 1;
    v14 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    v9 = objc_loadWeakRetained((id *)p_inputSize);
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    v12 = objc_loadWeakRetained((id *)p_inputSize);
    objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");

    -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "intValue");
  }

  objc_msgSend(MEMORY[0x1E0CC6CB0], "cnnConvolutionDescriptorWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:", v14, v11, v8, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "setFeatureChannelsLayout:", 1);
    v20 = -[VCPCNNFullConnectionBlockGPU convVCPNeuronTypeToMPS:](self, "convVCPNeuronTypeToMPS:", self->super._neuronType);
    objc_msgSend(v19, "fusedNeuronDescriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNeuronType:", v20);

    if (self->super._neuronType == 1)
    {
      objc_msgSend(v19, "fusedNeuronDescriptor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23) = 0;
      objc_msgSend(v22, "setA:", v23);

    }
    v24 = -[VCPCNNMPSDataSource initWith:convolutionDescriptor:kernelWeights:biasTerm:]([VCPCNNMPSDataSource alloc], "initWith:convolutionDescriptor:kernelWeights:biasTerm:", 268435488, v19, self->super._weight, self->super._bias);
    if (!v24)
      goto LABEL_19;
    v25 = objc_alloc(MEMORY[0x1E0CC6D00]);
    -[VCPCNNMetalContext device](self->super.super._context, "device");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (MPSCNNFullyConnected *)objc_msgSend(v25, "initWithDevice:weights:", v26, v24);
    mpsFullConn = self->_mpsFullConn;
    self->_mpsFullConn = v27;

    v29 = self->_mpsFullConn;
    if (v29)
    {
      -[MPSCNNFullyConnected setEdgeMode:](v29, "setEdgeMode:", 0);
      memset(v38, 0, sizeof(v38));
      v30 = self->_mpsFullConn;
      v39 = vdupq_n_s64(1uLL);
      v40 = 1;
      -[MPSCNNFullyConnected setClipRect:](v30, "setClipRect:", v38);
      if (v11 != 1 || v14 != 1)
      {
        if (v14 >= 0)
          v31 = v14;
        else
          v31 = v14 + 1;
        v32 = (uint64_t)v31 >> 1;
        if (v11 >= 0)
          v33 = v11;
        else
          v33 = v11 + 1;
        v34 = self->_mpsFullConn;
        v37[0] = v32;
        v37[1] = (uint64_t)v33 >> 1;
        v37[2] = 0;
        -[MPSCNNFullyConnected setOffset:](v34, "setOffset:", v37);
      }
      v35 = 0;
    }
    else
    {
LABEL_19:
      v35 = -108;
    }

  }
  else
  {
    v35 = -108;
  }

  return v35;
}

- (int)shuffleWeights:(float *)a3 fromSrc:(float *)a4 inputChannels:(int)a5 inputHeight:(int)a6 inputWidth:(int)a7 outputChannels:(int)a8
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float *v12;
  float *v13;
  uint64_t v14;
  float *v15;
  float *v16;

  if (a8 >= 1)
  {
    v8 = 0;
    v9 = (a7 * a6);
    v10 = 4 * (int)v9 * a5;
    do
    {
      if ((int)v9 >= 1)
      {
        v11 = 0;
        v12 = a4;
        v13 = a3;
        do
        {
          v14 = a5;
          v15 = v12;
          v16 = v13;
          if (a5 >= 1)
          {
            do
            {
              *v16++ = *v15;
              v15 += (int)v9;
              --v14;
            }
            while (v14);
          }
          ++v11;
          v13 += a5;
          ++v12;
        }
        while (v11 != v9);
      }
      ++v8;
      a3 = (float *)((char *)a3 + v10);
      a4 = (float *)((char *)a4 + v10);
    }
    while (v8 != a8);
  }
  return 0;
}

- (int)loadWeights:(__sFILE *)a3 inputDim:(int)a4 outputDim:(int)a5 quantFactor:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray **p_inputSize;
  id WeakRetained;
  uint64_t v13;
  int v14;
  size_t v16;
  void *v17;
  void *v18;
  float *weight;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  p_inputSize = &self->super.super._inputSize;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  v13 = objc_msgSend(WeakRetained, "count");

  if (v13 == 1)
  {
    v14 = -[VCPCNNFullConnectionBlock readWeightsBias:weights:bias:inputDim:outputDim:quantFactor:](self, "readWeightsBias:weights:bias:inputDim:outputDim:quantFactor:", a3, self->super._weight, self->super._bias, v8, v7, v6);
    if (!v14)
      return -[VCPCNNFullConnectionBlockGPU setupMPS](self, "setupMPS");
  }
  else
  {
    if ((int)v7 * (int)v8 < 0)
      v16 = -1;
    else
      v16 = 4 * (int)v7 * (int)v8;
    v17 = operator new[](v16, MEMORY[0x1E0DE4E10]);
    if (v17)
    {
      v18 = v17;
      v14 = -[VCPCNNFullConnectionBlock readWeightsBias:weights:bias:inputDim:outputDim:quantFactor:](self, "readWeightsBias:weights:bias:inputDim:outputDim:quantFactor:", a3, v17, self->super._bias, v8, v7, v6);
      if (!v14)
      {
        weight = self->super._weight;
        v20 = objc_loadWeakRetained((id *)p_inputSize);
        objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v29, "intValue");
        v28 = objc_loadWeakRetained((id *)p_inputSize);
        objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v27, "intValue");
        v23 = objc_loadWeakRetained((id *)p_inputSize);
        objc_msgSend(v23, "objectAtIndexedSubscript:", 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "intValue");
        -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[VCPCNNFullConnectionBlockGPU shuffleWeights:fromSrc:inputChannels:inputHeight:inputWidth:outputChannels:](self, "shuffleWeights:fromSrc:inputChannels:inputHeight:inputWidth:outputChannels:", weight, v18, v21, v22, v25, objc_msgSend(v26, "intValue"));

        if (!v14)
        {
          MEMORY[0x1BCCA128C](v18, 0x1000C8052888210);
          return -[VCPCNNFullConnectionBlockGPU setupMPS](self, "setupMPS");
        }
      }
    }
    else
    {
      return -108;
    }
  }
  return v14;
}

- (int)forward
{
  int result;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  MPSCNNFullyConnected *mpsFullConn;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  if (!self->super.super._executedOnGPU
    || (result = -[VCPCNNData reallocGPUTemporalBuffers](self->super.super._output, "reallocGPUTemporalBuffers")) == 0)
  {
    -[VCPCNNMetalContext commandBuffer](self->super.super._context, "commandBuffer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->super.super._input);
      objc_msgSend(WeakRetained, "mpsImg");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[VCPCNNData mpsImg](self->super.super._output, "mpsImg");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          mpsFullConn = self->_mpsFullConn;
          -[VCPCNNMetalContext commandBuffer](self->super.super._context, "commandBuffer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_loadWeakRetained((id *)&self->super.super._input);
          objc_msgSend(v11, "mpsImg");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPCNNData mpsImg](self->super.super._output, "mpsImg");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSCNNFullyConnected encodeToCommandBuffer:sourceImage:destinationImage:](mpsFullConn, "encodeToCommandBuffer:sourceImage:destinationImage:", v10, v12, v13);

          result = 0;
          self->super.super._executedOnGPU = 1;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mpsFullConn, 0);
}

@end
