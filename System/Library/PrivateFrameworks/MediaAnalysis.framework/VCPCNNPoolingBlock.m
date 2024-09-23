@implementation VCPCNNPoolingBlock

+ (id)poolingBlockWithPoolX:(int)a3 poolY:(int)a4 chunk:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  if (!+[VCPCNNMetalContext supportGPU](VCPCNNMetalContext, "supportGPU"))
    +[VCPCNNMetalContext supportVectorForward](VCPCNNMetalContext, "supportVectorForward");
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParameters:poolY:chunk:", v7, v6, v5);
}

- (VCPCNNPoolingBlock)initWithParameters:(int)a3 poolY:(int)a4 chunk:(int)a5
{
  VCPCNNPoolingBlock *v5;
  VCPCNNPoolingBlock *v9;
  objc_super v11;

  v5 = 0;
  if (a3 >= 2 && a4 >= 2)
  {
    v11.receiver = self;
    v11.super_class = (Class)VCPCNNPoolingBlock;
    v9 = -[VCPCNNPoolingBlock init](&v11, sel_init);
    if (v9)
    {
      *(_DWORD *)(&v9->super._executedOnGPU + 3) = a3;
      v9->_px = a4;
      v9->_py = a5;
      v9->super._executedOnGPU = 0;
    }
    self = v9;
    v5 = self;
  }

  return v5;
}

- (int)constructBlock:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  int v13;
  id v14;
  void *v15;
  int v16;
  VCPCNNData *v17;
  VCPCNNData *output;
  NSMutableArray *v19;
  NSMutableArray *outputSize;
  NSMutableArray *v21;
  void *v22;
  NSMutableArray *v23;
  void *v24;
  NSMutableArray *v25;
  void *v26;
  int v27;

  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->super._context, a4);
  v8 = objc_storeWeak((id *)&self->super._inputSize, v6);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  WeakRetained = objc_loadWeakRetained((id *)&self->super._inputSize);
  objc_msgSend(WeakRetained, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  v14 = objc_loadWeakRetained((id *)&self->super._inputSize);
  objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "intValue");

  +[VCPCNNData cnnDataWithGPUContext:](VCPCNNData, "cnnDataWithGPUContext:", v7);
  v17 = (VCPCNNData *)objc_claimAutoreleasedReturnValue();
  output = self->super._output;
  self->super._output = v17;

  v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  outputSize = self->super._outputSize;
  self->super._outputSize = v19;

  if (self->super._output && (v21 = self->super._outputSize) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v21, "addObject:", v22);

    v23 = self->super._outputSize;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v13 / self->_px));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v23, "addObject:", v24);

    v25 = self->super._outputSize;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v16 / *(_DWORD *)(&self->super._executedOnGPU + 3)));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v25, "addObject:", v26);

    -[VCPCNNData setSize:](self->super._output, "setSize:", self->super._outputSize);
    v27 = -[VCPCNNData allocBuffers:](self->super._output, "allocBuffers:", self->super._generateOutput);
  }
  else
  {
    v27 = -108;
  }

  return v27;
}

- (int)forward
{
  return -4;
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
