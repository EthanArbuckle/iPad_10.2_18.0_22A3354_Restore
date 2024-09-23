@implementation VCPCNNFullConnectionBlock

+ (id)fcBlockWithNumNeurons:(int)a3 NeuronType:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  +[VCPCNNMetalContext supportGPU](VCPCNNMetalContext, "supportGPU");
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParameters:NeuronType:", v5, v4);
}

- (VCPCNNFullConnectionBlock)initWithParameters:(int)a3 NeuronType:(int)a4
{
  VCPCNNFullConnectionBlock *v6;
  VCPCNNFullConnectionBlock *v7;
  objc_super v9;

  if (a3 < 1)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VCPCNNFullConnectionBlock;
    v6 = -[VCPCNNFullConnectionBlock init](&v9, sel_init);
    if (v6)
    {
      v6->_numNeurons = a3;
      v6->_weight = 0;
      v6->_bias = 0;
      v6->_neuronType = a4;
      v6->super._executedOnGPU = 0;
    }
    self = v6;
    v7 = self;
  }

  return v7;
}

- (void)dealloc
{
  float *weight;
  float *bias;
  objc_super v5;

  weight = self->_weight;
  if (weight)
    MEMORY[0x1BCCA128C](weight, 0x1000C8052888210);
  bias = self->_bias;
  if (bias)
    MEMORY[0x1BCCA128C](bias, 0x1000C8052888210);
  v5.receiver = self;
  v5.super_class = (Class)VCPCNNFullConnectionBlock;
  -[VCPCNNFullConnectionBlock dealloc](&v5, sel_dealloc);
}

- (int)constructBlock:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  VCPCNNData *v9;
  VCPCNNData *output;
  NSMutableArray *v11;
  NSMutableArray *outputSize;
  NSMutableArray *v13;
  void *v14;
  int v15;

  v7 = a4;
  objc_storeStrong((id *)&self->super._context, a4);
  v8 = a3;
  objc_storeWeak((id *)&self->super._inputSize, v8);

  +[VCPCNNData cnnDataWithGPUContext:](VCPCNNData, "cnnDataWithGPUContext:", self->super._context);
  v9 = (VCPCNNData *)objc_claimAutoreleasedReturnValue();
  output = self->super._output;
  self->super._output = v9;

  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  outputSize = self->super._outputSize;
  self->super._outputSize = v11;

  if (self->super._output && (v13 = self->super._outputSize) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numNeurons);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v13, "addObject:", v14);

    -[VCPCNNData setSize:](self->super._output, "setSize:", self->super._outputSize);
    v15 = -[VCPCNNData allocBuffers:](self->super._output, "allocBuffers:", self->super._generateOutput);
  }
  else
  {
    v15 = -108;
  }

  return v15;
}

- (int)readWeightsBias:(__sFILE *)a3 weights:(float *)a4 bias:(float *)a5 inputDim:(int)a6 outputDim:(int)a7 quantFactor:(int)a8
{
  float *v10;
  uint64_t v12;
  void *v13;
  __int16 *v14;
  __int16 v15;
  uint64_t v22;
  __int16 *v23;
  __int16 v24;

  v10 = a4;
  v12 = (a7 * a6);
  if (!a8)
  {
    v13 = (void *)operator new[]();
    if (!fread(v13, 2uLL, (int)v12, a3))
      return -19;
    if ((int)v12 >= 1)
    {
      v14 = (__int16 *)v13;
      do
      {
        v15 = *v14++;
        _H0 = v15;
        __asm { FCVT            S0, H0 }
        *(_DWORD *)v10++ = _S0;
        --v12;
      }
      while (v12);
    }
    if (!fread(a5, 2uLL, a7, a3))
      return -19;
    if (a7 >= 1)
    {
      v22 = a7;
      v23 = (__int16 *)v13;
      do
      {
        v24 = *v23++;
        _H0 = v24;
        __asm { FCVT            S0, H0 }
        *(_DWORD *)a5++ = _S0;
        --v22;
      }
      while (v22);
    }
    MEMORY[0x1BCCA128C](v13, 0x1000C80BDFB0063);
    return 0;
  }
  if (a8 == 1)
  {
    if (!fread(a4, 4uLL, (int)v12, a3) || !fread(a5, 4uLL, a7, a3))
      return -19;
    return 0;
  }
  return -50;
}

- (int)loadWeights:(__sFILE *)a3 inputDim:(int)a4 outputDim:(int)a5 quantFactor:(int)a6
{
  return -4;
}

- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  unint64_t v6;
  NSMutableArray **p_inputSize;
  uint64_t v8;
  id WeakRetained;
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int result;
  size_t v16;
  const std::nothrow_t *v17;
  size_t v18;
  float *v19;

  if (a4 != 1)
    return -50;
  v6 = 0;
  p_inputSize = &self->super._inputSize;
  v8 = 1;
  while (1)
  {
    WeakRetained = objc_loadWeakRetained((id *)p_inputSize);
    v10 = objc_msgSend(WeakRetained, "count");

    if (v10 <= v6)
      break;
    v11 = objc_loadWeakRetained((id *)p_inputSize);
    objc_msgSend(v11, "objectAtIndexedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v12, "intValue") * v8;

    ++v6;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->super._outputSize, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "intValue");

  if (self->_weight || self->_bias)
    return -50;
  if ((int)v14 * (int)v8 < 0)
    v16 = -1;
  else
    v16 = 4 * (int)v14 * (int)v8;
  v17 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
  self->_weight = (float *)operator new[](v16, MEMORY[0x1E0DE4E10]);
  if ((int)v14 < 0)
    v18 = -1;
  else
    v18 = 4 * (int)v14;
  v19 = (float *)operator new[](v18, v17);
  self->_bias = v19;
  result = -108;
  if (self->_weight)
  {
    if (v19)
      return -[VCPCNNFullConnectionBlock loadWeights:inputDim:outputDim:quantFactor:](self, "loadWeights:inputDim:outputDim:quantFactor:", a3, v8, v14, 1);
  }
  return result;
}

- (BOOL)supportGPU
{
  return 1;
}

- (BOOL)useGPU
{
  return self->super._context != 0;
}

@end
