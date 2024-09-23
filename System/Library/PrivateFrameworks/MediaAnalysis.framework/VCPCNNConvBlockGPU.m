@implementation VCPCNNConvBlockGPU

- (void)releaseBatchNormMemory
{
  float *batchNormMean;
  float *batchNormVar;
  float *batchNormBeta;
  float *batchNormGamma;

  batchNormMean = self->_batchNormMean;
  if (batchNormMean)
    MEMORY[0x1BCCA128C](batchNormMean, 0x1000C8052888210);
  batchNormVar = self->_batchNormVar;
  if (batchNormVar)
    MEMORY[0x1BCCA128C](batchNormVar, 0x1000C8052888210);
  batchNormBeta = self->_batchNormBeta;
  if (batchNormBeta)
    MEMORY[0x1BCCA128C](batchNormBeta, 0x1000C8052888210);
  batchNormGamma = self->_batchNormGamma;
  if (batchNormGamma)
    MEMORY[0x1BCCA128C](batchNormGamma, 0x1000C8052888210);
  self->_batchNormMean = 0;
  self->_batchNormVar = 0;
  self->_batchNormBeta = 0;
  self->_batchNormGamma = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[VCPCNNConvBlockGPU releaseBatchNormMemory](self, "releaseBatchNormMemory");
  v3.receiver = self;
  v3.super_class = (Class)VCPCNNConvBlockGPU;
  -[VCPCNNConvBlockGPU dealloc](&v3, sel_dealloc);
}

- (int)gpuForward
{
  int result;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  MPSCNNConvolution *mpsConv;
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
          mpsConv = self->_mpsConv;
          -[VCPCNNMetalContext commandBuffer](self->super.super._context, "commandBuffer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_loadWeakRetained((id *)&self->super.super._input);
          objc_msgSend(v11, "mpsImg");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPCNNData mpsImg](self->super.super._output, "mpsImg");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSCNNConvolution encodeToCommandBuffer:sourceImage:destinationImage:](mpsConv, "encodeToCommandBuffer:sourceImage:destinationImage:", v10, v12, v13);

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

- (int)fillConvWeightsGPU
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  int v19;
  void *v20;
  int v21;
  uint64_t v22;
  int v23;
  size_t v24;
  float *v25;
  float *v26;
  float *v27;
  int v28;
  uint64_t v29;
  float *v30;
  uint64_t v31;
  float *v32;
  float *v33;
  uint64_t v34;
  float *v35;
  float *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  VCPCNNMPSDataSource *v44;
  id v45;
  void *v46;
  MPSCNNConvolution *v47;
  MPSCNNConvolution *mpsConv;
  MPSCNNConvolution *v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  int v54;
  uint64_t v55;
  int v56;
  MPSCNNConvolution *v57;
  MPSCNNConvolution *v58;
  uint64_t v60;
  int v61;
  _QWORD v62[6];
  _QWORD v63[3];

  -[VCPCNNData size](self->super._filter, "size");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  -[VCPCNNData size](self->super._filter, "size");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  -[VCPCNNData size](self->super._filter, "size");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");
  -[VCPCNNData size](self->super._filter, "size");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "intValue");

  -[VCPCNNData size](self->super._filter, "size");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v16, "intValue");

  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  objc_msgSend(WeakRetained, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "intValue");

  -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "intValue");
  v22 = (v14 * v11);

  v23 = v8 * v5 * v22;
  if (v23 < 0)
    v24 = -1;
  else
    v24 = 4 * v23;
  v25 = (float *)operator new[](v24, MEMORY[0x1E0DE4E10]);
  if (!v25)
    return -108;
  v26 = v25;
  memcpy(v25, -[VCPCNNData data](self->super._filter, "data"), 4 * v5 * (uint64_t)v8 * (int)v22);
  v27 = -[VCPCNNData data](self->super._filter, "data");
  if (v5 >= 1)
  {
    v28 = 0;
    v29 = 4 * (int)v22 * v8;
    v30 = v26;
    do
    {
      if ((int)v22 >= 1)
      {
        v31 = 0;
        v32 = v30;
        v33 = v27;
        do
        {
          v34 = v8;
          v35 = v32;
          v36 = v33;
          if (v8 >= 1)
          {
            do
            {
              *v36++ = *v35;
              v35 += (int)v22;
              --v34;
            }
            while (v34);
          }
          ++v31;
          v33 += v8;
          ++v32;
        }
        while (v31 != v22);
      }
      ++v28;
      v27 = (float *)((char *)v27 + v29);
      v30 = (float *)((char *)v30 + v29);
    }
    while (v28 != v5);
  }
  MEMORY[0x1BCCA128C](v26, 0x1000C8052888210);
  if (v19 != v21 || v19 != self->super._groups)
  {
    objc_msgSend(MEMORY[0x1E0CC6CB0], "cnnConvolutionDescriptorWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:", (int)v60, (int)v60, v19, v21, v60);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v38 = v39;
      objc_msgSend(v39, "setGroups:", self->super._groups);
      goto LABEL_19;
    }
    return -108;
  }
  objc_msgSend(MEMORY[0x1E0CC6CE8], "cnnConvolutionDescriptorWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:", (int)v60, (int)v60, v19, v19);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v37)
    return -108;
  v38 = v37;
  objc_msgSend(v37, "setGroups:", 1);
LABEL_19:
  if (self->super._reLU)
  {
    objc_msgSend(v38, "fusedNeuronDescriptor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setNeuronType:", 1);

    objc_msgSend(v38, "fusedNeuronDescriptor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v42) = 0;
    objc_msgSend(v41, "setA:", v42);

  }
  objc_msgSend(v38, "setStrideInPixelsX:", self->super._stride, v60);
  objc_msgSend(v38, "setStrideInPixelsY:", self->super._stride);
  objc_msgSend(v38, "setFeatureChannelsLayout:", 1);
  if (self->super._batchNorm)
  {
    LODWORD(v43) = 925353388;
    objc_msgSend(v38, "setBatchNormalizationParametersForInferenceWithMean:variance:gamma:beta:epsilon:", self->_batchNormMean, self->_batchNormVar, self->_batchNormGamma, self->_batchNormBeta, v43);
  }
  v44 = -[VCPCNNMPSDataSource initWith:convolutionDescriptor:kernelWeights:biasTerm:]([VCPCNNMPSDataSource alloc], "initWith:convolutionDescriptor:kernelWeights:biasTerm:", 268435488, v38, -[VCPCNNData data](self->super._filter, "data"), -[VCPCNNData data](self->super._bias, "data"));
  if (!v44)
    goto LABEL_29;
  v45 = objc_alloc(MEMORY[0x1E0CC6CA8]);
  -[VCPCNNMetalContext device](self->super.super._context, "device");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (MPSCNNConvolution *)objc_msgSend(v45, "initWithDevice:weights:", v46, v44);
  mpsConv = self->_mpsConv;
  self->_mpsConv = v47;

  v49 = self->_mpsConv;
  if (v49)
  {
    -[MPSCNNConvolution setEdgeMode:](v49, "setEdgeMode:", 0);
    -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "intValue");
    -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "intValue");

    if (!self->super._padding)
    {
      v54 = v61 - 1;
      if (v61 == 1)
      {
        v55 = 0;
      }
      else
      {
        if (v54 < 0)
          v54 = v61;
        LODWORD(v55) = v54 >> 1;
        if ((int)v55 <= 1)
          v55 = 1;
        else
          v55 = v55;
      }
      v57 = self->_mpsConv;
      v63[0] = v55;
      v63[1] = v55;
      v63[2] = 0;
      -[MPSCNNConvolution setOffset:](v57, "setOffset:", v63);
    }
    v58 = self->_mpsConv;
    memset(v62, 0, 24);
    v62[3] = v51;
    v62[4] = v53;
    v62[5] = 1;
    -[MPSCNNConvolution setClipRect:](v58, "setClipRect:", v62);
    v56 = 0;
  }
  else
  {
LABEL_29:
    v56 = -108;
  }

  return v56;
}

- (int)readBatchNormParam:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  int v4;
  size_t filterSize;
  size_t v8;
  float *v9;
  float *v10;
  float *v11;
  float *v12;
  size_t v13;
  float *v14;
  float *v15;
  float *v16;
  float *v17;
  void *v18;
  uint64_t v19;
  float *batchNormMean;
  uint64_t v21;
  float *batchNormVar;
  __int16 *v29;
  __int16 v30;
  uint64_t v34;
  float *batchNormGamma;
  uint64_t v36;
  float *batchNormBeta;
  __int16 *v40;
  __int16 v41;

  if (!self->super._batchNorm)
    return 0;
  v4 = a4;
  -[VCPCNNConvBlockGPU releaseBatchNormMemory](self, "releaseBatchNormMemory");
  filterSize = self->super._filterSize;
  if (v4)
  {
    if (v4 != 1)
      return -50;
    if ((filterSize & 0x80000000) != 0)
      v8 = -1;
    else
      v8 = 4 * filterSize;
    v9 = (float *)operator new[](v8, MEMORY[0x1E0DE4E10]);
    self->_batchNormMean = v9;
    if (v9)
    {
      v10 = (float *)operator new[](v8, MEMORY[0x1E0DE4E10]);
      self->_batchNormVar = v10;
      if (v10)
      {
        v11 = (float *)operator new[](v8, MEMORY[0x1E0DE4E10]);
        self->_batchNormGamma = v11;
        if (v11)
        {
          v12 = (float *)operator new[](v8, MEMORY[0x1E0DE4E10]);
          self->_batchNormBeta = v12;
          if (v12)
          {
            if (fread(self->_batchNormMean, 4uLL, filterSize, a3) != filterSize
              || fread(self->_batchNormVar, 4uLL, filterSize, a3) != filterSize
              || fread(self->_batchNormGamma, 4uLL, filterSize, a3) != filterSize
              || fread(self->_batchNormBeta, 4uLL, filterSize, a3) != filterSize)
            {
              return -19;
            }
            return 0;
          }
        }
      }
    }
    return -108;
  }
  if ((filterSize & 0x80000000) != 0)
    v13 = -1;
  else
    v13 = 4 * filterSize;
  v14 = (float *)operator new[](v13, MEMORY[0x1E0DE4E10]);
  self->_batchNormMean = v14;
  if (!v14)
    return -108;
  v15 = (float *)operator new[](v13, MEMORY[0x1E0DE4E10]);
  self->_batchNormVar = v15;
  if (!v15)
    return -108;
  v16 = (float *)operator new[](v13, MEMORY[0x1E0DE4E10]);
  self->_batchNormGamma = v16;
  if (!v16)
    return -108;
  v17 = (float *)operator new[](v13, MEMORY[0x1E0DE4E10]);
  self->_batchNormBeta = v17;
  if (!v17)
    return -108;
  v18 = (void *)operator new[]();
  if (fread(v18, 2uLL, filterSize, a3) == filterSize)
  {
    if ((int)filterSize < 1)
    {
      if (fread(v18, 2uLL, filterSize, a3) != filterSize)
        return -19;
    }
    else
    {
      v19 = 0;
      batchNormMean = self->_batchNormMean;
      v21 = filterSize;
      do
      {
        _H0 = *((_WORD *)v18 + v19);
        __asm { FCVT            S0, H0 }
        batchNormMean[v19++] = _S0;
      }
      while (filterSize != v19);
      if (fread(v18, 2uLL, filterSize, a3) != filterSize)
        return -19;
      batchNormVar = self->_batchNormVar;
      v29 = (__int16 *)v18;
      do
      {
        v30 = *v29++;
        _H0 = v30;
        __asm { FCVT            S0, H0 }
        *(_DWORD *)batchNormVar++ = _S0;
        --v21;
      }
      while (v21);
    }
    if (fread(v18, 2uLL, filterSize, a3) == filterSize)
    {
      if ((int)filterSize >= 1)
      {
        v34 = 0;
        batchNormGamma = self->_batchNormGamma;
        v36 = filterSize;
        do
        {
          _H0 = *((_WORD *)v18 + v34);
          __asm { FCVT            S0, H0 }
          batchNormGamma[v34++] = _S0;
        }
        while (filterSize != v34);
        if (fread(v18, 2uLL, filterSize, a3) != filterSize)
          return -19;
        batchNormBeta = self->_batchNormBeta;
        v40 = (__int16 *)v18;
        do
        {
          v41 = *v40++;
          _H0 = v41;
          __asm { FCVT            S0, H0 }
          *(_DWORD *)batchNormBeta++ = _S0;
          --v36;
        }
        while (v36);
        goto LABEL_43;
      }
      if (fread(v18, 2uLL, filterSize, a3) == filterSize)
      {
LABEL_43:
        MEMORY[0x1BCCA128C](v18, 0x1000C80BDFB0063);
        return 0;
      }
    }
  }
  return -19;
}

- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  uint64_t v4;
  int result;

  v4 = a4;
  result = -[VCPCNNData readFromDisk:quantFactor:](self->super._filter, "readFromDisk:quantFactor:");
  if (!result)
  {
    result = -[VCPCNNData readFromDisk:quantFactor:](self->super._bias, "readFromDisk:quantFactor:", a3, v4);
    if (!result)
    {
      result = -[VCPCNNConvBlockGPU readBatchNormParam:quantFactor:](self, "readBatchNormParam:quantFactor:", a3, v4);
      if (!result)
        return -[VCPCNNConvBlockGPU fillConvWeightsGPU](self, "fillConvWeightsGPU");
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mpsConv, 0);
}

@end
