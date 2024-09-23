@implementation VCPCNNFlattenBlock

- (VCPCNNFlattenBlock)initWithParameters:(int)a3
{
  VCPCNNFlattenBlock *v4;
  VCPCNNFlattenBlock *v5;
  VCPCNNFlattenBlock *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCPCNNFlattenBlock;
  v4 = -[VCPCNNFlattenBlock init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)(&v4->super._executedOnGPU + 3) = a3;
    v6 = v4;
  }

  return v5;
}

- (int)forward
{
  float *v3;
  id WeakRetained;
  const void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  int *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int i;
  int v20;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;

  if (*(_DWORD *)(&self->super._executedOnGPU + 3) == 1)
  {
    v3 = -[VCPCNNData data](self->super._output, "data");
    WeakRetained = objc_loadWeakRetained((id *)&self->super._input);
    v5 = (const void *)objc_msgSend(WeakRetained, "data");
    -[NSMutableArray objectAtIndexedSubscript:](self->super._outputSize, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    memcpy(v3, v5, 4 * (int)objc_msgSend(v6, "intValue"));

  }
  else
  {
    v7 = objc_loadWeakRetained((id *)&self->super._inputSize);
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v8, "intValue");

    v9 = objc_loadWeakRetained((id *)&self->super._inputSize);
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v10, "intValue");

    v11 = objc_loadWeakRetained((id *)&self->super._inputSize);
    objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v12, "intValue");

    v13 = objc_loadWeakRetained((id *)&self->super._input);
    v14 = (int *)objc_msgSend(v13, "data");

    v15 = *(_DWORD *)(&self->super._executedOnGPU + 3);
    if (v23 / v15 >= 1)
    {
      v16 = 0;
      do
      {
        if (v22 >= 1)
        {
          v17 = 0;
          do
          {
            v25 = v17;
            if (v24 >= 1)
            {
              v18 = 0;
              v26 = v17 * v24;
              do
              {
                if (v15 >= 1)
                {
                  for (i = 0; i < v15; ++i)
                  {
                    v20 = *v14++;
                    *(_DWORD *)(-[VCPCNNData data](self->super._output, "data")
                              + 4 * (v18 + v26 + v24 * v22 * (uint64_t)(i + v16 * v15))) = v20;
                    v15 = *(_DWORD *)(&self->super._executedOnGPU + 3);
                  }
                }
                ++v18;
              }
              while (v18 != v24);
            }
            v17 = v25 + 1;
          }
          while (v25 + 1 != v22);
        }
        ++v16;
      }
      while (v16 < v23 / v15);
    }
  }
  return 0;
}

- (int)constructBlock:(id)a3 context:(id)a4
{
  id v5;
  VCPCNNData *v6;
  VCPCNNData *output;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;
  NSMutableArray *outputSize;
  void *v12;
  id v13;
  int v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v21;
  id WeakRetained;
  void *v23;

  v5 = a3;
  +[VCPCNNData cnnData](VCPCNNData, "cnnData");
  v6 = (VCPCNNData *)objc_claimAutoreleasedReturnValue();
  output = self->super._output;
  self->super._output = v6;

  if (self->super._output
    && (v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]),
        v9 = self->super._outputSize,
        self->super._outputSize = v8,
        v9,
        self->super._outputSize))
  {
    v10 = objc_storeWeak((id *)&self->super._inputSize, v5);
    outputSize = self->super._outputSize;
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = v10;
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v23, "intValue");
    WeakRetained = objc_loadWeakRetained((id *)&self->super._inputSize);
    objc_msgSend(WeakRetained, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v21, "intValue");
    v16 = objc_loadWeakRetained((id *)&self->super._inputSize);
    objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithInt:", v15 * v14 * objc_msgSend(v17, "intValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](outputSize, "addObject:", v18);

    -[VCPCNNData setSize:](self->super._output, "setSize:", self->super._outputSize);
    v19 = -[VCPCNNData allocBuffers:](self->super._output, "allocBuffers:", self->super._generateOutput);
  }
  else
  {
    v19 = -108;
  }

  return v19;
}

@end
