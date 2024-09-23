@implementation VCPCNNConvBlock

+ (Class)convBlockClass:(int)a3
{
  if (!+[VCPCNNMetalContext supportGPU](VCPCNNMetalContext, "supportGPU"))
    +[VCPCNNMetalContext supportVectorForward](VCPCNNMetalContext, "supportVectorForward");
  return (Class)(id)objc_opt_class();
}

+ (id)convBlockWithFilterSize:(int)a3 filterNum:(int)a4 chunk:(int)a5 reLU:(BOOL)a6 padding:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v14;

  v7 = a7;
  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v11 = *(_QWORD *)&a3;
  v12 = +[VCPCNNConvBlock convBlockClass:](VCPCNNConvBlock, "convBlockClass:", *(_QWORD *)&a5);
  if (v12)
  {
    BYTE4(v14) = 0;
    LODWORD(v14) = 1;
    v12 = (objc_class *)objc_msgSend([v12 alloc], "initWithParameters:filterNum:chunk:reLU:padding:groups:stride:batchNorm:", v11, v10, v9, v8, v7, 1, v14);
  }
  return v12;
}

+ (id)convBlockWithFilterSize:(int)a3 filterNum:(int)a4 chunk:(int)a5 reLU:(BOOL)a6 padding:(BOOL)a7 groups:(int)a8 stride:(int)a9 batchNorm:(BOOL)a10
{
  uint64_t v10;
  _BOOL8 v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  uint64_t v18;

  v10 = *(_QWORD *)&a8;
  v11 = a7;
  v12 = a6;
  v13 = *(_QWORD *)&a5;
  v14 = *(_QWORD *)&a4;
  v15 = *(_QWORD *)&a3;
  v16 = +[VCPCNNConvBlock convBlockClass:](VCPCNNConvBlock, "convBlockClass:", *(_QWORD *)&a5);
  if (v16)
  {
    BYTE4(v18) = a10;
    LODWORD(v18) = a9;
    v16 = (objc_class *)objc_msgSend([v16 alloc], "initWithParameters:filterNum:chunk:reLU:padding:groups:stride:batchNorm:", v15, v14, v13, v12, v11, v10, v18);
  }
  return v16;
}

- (VCPCNNConvBlock)initWithParameters:(int)a3 filterNum:(int)a4 chunk:(int)a5 reLU:(BOOL)a6 padding:(BOOL)a7 groups:(int)a8 stride:(int)a9 batchNorm:(BOOL)a10
{
  _BOOL4 v11;
  VCPCNNConvBlock *result;
  int v17;
  int v18;
  int v19;
  objc_super v20;

  v11 = a7;
  v20.receiver = self;
  v20.super_class = (Class)VCPCNNConvBlock;
  result = -[VCPCNNConvBlock init](&v20, sel_init);
  if (result)
  {
    v17 = a9;
    *(_DWORD *)(&result->super._executedOnGPU + 3) = a3;
    result->_filterSize = a4;
    result->_chunk = a5;
    result->_reLU = a6;
    result->_padding = v11;
    result->_padSize = 0;
    if (v11)
    {
      v18 = *(_DWORD *)(&result->super._executedOnGPU + 3);
      if (v18 >= 1)
        --v18;
      result->_padSize = v18 >> 1;
    }
    if (a8 <= 1)
      v19 = 1;
    else
      v19 = a8;
    result->_groups = v19;
    if (a9 <= 1)
      v17 = 1;
    result->_stride = v17;
    result->_batchNorm = a10;
    result->super._executedOnGPU = 0;
  }
  return result;
}

- (int)constructBlock:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  VCPCNNData *v8;
  VCPCNNData *output;
  VCPCNNData *v10;
  VCPCNNData *filter;
  VCPCNNData *v12;
  VCPCNNData *bias;
  NSMutableArray *v14;
  NSMutableArray *v15;
  NSMutableArray *v16;
  void *v17;
  NSMutableArray *outputSize;
  void *v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id WeakRetained;
  id v46;
  id v47;
  id *location;

  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->super._context, a4);
  +[VCPCNNData cnnDataWithGPUContext:](VCPCNNData, "cnnDataWithGPUContext:", v7);
  v8 = (VCPCNNData *)objc_claimAutoreleasedReturnValue();
  output = self->super._output;
  self->super._output = v8;

  +[VCPCNNData cnnData](VCPCNNData, "cnnData");
  v10 = (VCPCNNData *)objc_claimAutoreleasedReturnValue();
  filter = self->_filter;
  self->_filter = v10;

  +[VCPCNNData cnnData](VCPCNNData, "cnnData");
  v12 = (VCPCNNData *)objc_claimAutoreleasedReturnValue();
  bias = self->_bias;
  self->_bias = v12;

  if (self->super._output
    && self->_filter
    && self->_bias
    && (location = (id *)&self->super._inputSize,
        objc_storeWeak((id *)&self->super._inputSize, v6),
        v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]),
        v15 = self->super._outputSize,
        self->super._outputSize = v14,
        v15,
        (v16 = self->super._outputSize) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_filterSize);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v6;
    -[NSMutableArray addObject:](v16, "addObject:", v17);

    LODWORD(v17) = self->_padding;
    outputSize = self->super._outputSize;
    v19 = (void *)MEMORY[0x1E0CB37E8];
    WeakRetained = objc_loadWeakRetained(location);
    objc_msgSend(WeakRetained, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v17)
    {
      objc_msgSend(v19, "numberWithInt:", ((int)objc_msgSend(v20, "intValue") / self->_stride));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](outputSize, "addObject:", v21);

      v22 = self->super._outputSize;
      v23 = (void *)MEMORY[0x1E0CB37E8];
      v46 = objc_loadWeakRetained(location);
      objc_msgSend(v46, "objectAtIndexedSubscript:", 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "numberWithInt:", ((int)objc_msgSend(v24, "intValue") / self->_stride));
    }
    else
    {
      objc_msgSend(v19, "numberWithInt:", ((int)(objc_msgSend(v20, "intValue") - *(_DWORD *)(&self->super._executedOnGPU + 3) + 1)/ self->_stride));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](outputSize, "addObject:", v28);

      v22 = self->super._outputSize;
      v29 = (void *)MEMORY[0x1E0CB37E8];
      v46 = objc_loadWeakRetained(location);
      objc_msgSend(v46, "objectAtIndexedSubscript:", 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "numberWithInt:", ((int)(objc_msgSend(v24, "intValue") - *(_DWORD *)(&self->super._executedOnGPU + 3) + 1)/ self->_stride));
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v22, "addObject:", v25);

    v6 = v47;
    -[VCPCNNData setSize:](self->super._output, "setSize:", self->super._outputSize);
    v26 = -[VCPCNNData allocBuffers:](self->super._output, "allocBuffers:", self->super._generateOutput);
    if (!v26)
    {
      v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[VCPCNNData setSize:](self->_filter, "setSize:", v30);

      -[VCPCNNData size](self->_filter, "size");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_filterSize);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v32);

      -[VCPCNNData size](self->_filter, "size");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0CB37E8];
      v35 = objc_loadWeakRetained(location);
      objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "numberWithInt:", ((int)objc_msgSend(v36, "intValue") / self->_groups));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v37);

      v6 = v47;
      -[VCPCNNData size](self->_filter, "size");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(&self->super._executedOnGPU + 3));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v39);

      -[VCPCNNData size](self->_filter, "size");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(&self->super._executedOnGPU + 3));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObject:", v41);

      v26 = -[VCPCNNData allocBuffers:](self->_filter, "allocBuffers:", 0);
      if (!v26)
      {
        v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[VCPCNNData setSize:](self->_bias, "setSize:", v42);

        -[VCPCNNData size](self->_bias, "size");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_filterSize);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObject:", v44);

        v26 = -[VCPCNNData allocBuffers:](self->_bias, "allocBuffers:", 0);
      }
    }
  }
  else
  {
    v26 = -108;
  }

  return v26;
}

- (BOOL)supportGPU
{
  return 1;
}

- (BOOL)useGPU
{
  return self->super._context != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bias, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

@end
