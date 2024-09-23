@implementation VCPCNNDataGPU

- (int)allocBuffers:(BOOL)a3
{
  int result;

  self->super._isInputOutput = a3;
  if (!a3)
    return -[VCPCNNDataGPU bufferAllocGPU](self, "bufferAllocGPU");
  result = -[VCPCNNData bufferAllocCPU](self, "bufferAllocCPU");
  if (!result)
    return -[VCPCNNDataGPU bufferAllocGPU](self, "bufferAllocGPU");
  return result;
}

- (int)reallocGPUTemporalBuffers
{
  if (self->super._isInputOutput)
    return 0;
  else
    return -[VCPCNNDataGPU bufferAllocGPU](self, "bufferAllocGPU");
}

- (int)bufferAllocGPU
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id WeakRetained;
  void *v13;
  MPSImage *v14;
  int v15;
  void *v16;
  MPSImage *mpsImg;

  if (-[NSMutableArray count](self->super._size, "count") != 1
    && -[NSMutableArray count](self->super._size, "count") != 3)
  {
    return -50;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->super._size, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (-[NSMutableArray count](self->super._size, "count") == 3)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->super._size, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v5, "intValue");

    -[NSMutableArray objectAtIndexedSubscript:](self->super._size, "objectAtIndexedSubscript:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v6, "intValue");

    v7 = (int)v7;
    v8 = (int)v8;
  }
  else
  {
    v8 = 1;
    v7 = 1;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0CC6E38]);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setWidth:", v7);
    objc_msgSend(v10, "setHeight:", v8);
    objc_msgSend(v10, "setFeatureChannels:", v4);
    objc_msgSend(v10, "setNumberOfImages:", 1);
    objc_msgSend(v10, "setUsage:", 3);
    objc_msgSend(v10, "setChannelFormat:", 3);
    objc_msgSend(v10, "setFeatureChannelsLayout:", 1);
    if (self->super._isInputOutput)
    {
      v11 = objc_alloc(MEMORY[0x1E0CC6DF0]);
      WeakRetained = objc_loadWeakRetained((id *)&self->super._context);
      objc_msgSend(WeakRetained, "device");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (MPSImage *)objc_msgSend(v11, "initWithDevice:imageDescriptor:", v13, v10);
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CC7230];
      WeakRetained = objc_loadWeakRetained((id *)&self->super._context);
      objc_msgSend(WeakRetained, "commandBuffer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "temporaryImageWithCommandBuffer:imageDescriptor:", v13, v10);
      v14 = (MPSImage *)objc_claimAutoreleasedReturnValue();
    }
    mpsImg = self->super._mpsImg;
    self->super._mpsImg = v14;

    if (self->super._mpsImg)
      v15 = 0;
    else
      v15 = -108;
  }
  else
  {
    v15 = -108;
  }

  return v15;
}

- (int)convertCPUData2GPU
{
  id WeakRetained;
  float *data;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  int v12;
  size_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  _WORD *v18;
  uint64_t v19;
  _WORD *v20;
  float *v21;
  uint64_t v22;
  _WORD *v23;
  int v24;
  int result;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._context);
  if (!WeakRetained)
    return -50;
  data = self->super._data;

  if (!data)
    return -50;
  if (self->super._mpsImg || (result = -[VCPCNNDataGPU bufferAllocGPU](self, "bufferAllocGPU")) == 0)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->super._size, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");

    -[NSMutableArray objectAtIndexedSubscript:](self->super._size, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    -[NSMutableArray objectAtIndexedSubscript:](self->super._size, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    if (v6 != 1 && (v6 & 3) != 0)
      return -50;
    v12 = v8 * v6 * v10;
    if (v12 < 0)
      v13 = -1;
    else
      v13 = 2 * v12;
    v14 = operator new[](v13, MEMORY[0x1E0DE4E10]);
    if (v14)
    {
      v15 = v14;
      if (v6 >= 1)
      {
        v16 = 0;
        v17 = 0;
        v18 = v14;
        do
        {
          if (v8 >= 1)
          {
            v19 = 0;
            v20 = v18;
            do
            {
              if (v10 >= 1)
              {
                v21 = &self->super._data[v17];
                v17 += v10;
                v22 = v10;
                v23 = v20;
                do
                {
                  v24 = *(_DWORD *)v21++;
                  _S0 = v24;
                  __asm { FCVT            H0, S0 }
                  *v23 = _S0;
                  v23 += v6;
                  --v22;
                }
                while (v22);
              }
              ++v19;
              v20 += v10 * (unint64_t)v6;
            }
            while (v19 != v8);
          }
          ++v16;
          ++v18;
        }
        while (v16 != v6);
      }
      -[MPSImage writeBytes:dataLayout:imageIndex:](self->super._mpsImg, "writeBytes:dataLayout:imageIndex:", v15, 0, 0);
      MEMORY[0x1BCCA128C](v15, 0x1000C80BDFB0063);
      return 0;
    }
    else
    {
      return -108;
    }
  }
  return result;
}

- (int)convertGPUData2CPU
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  double v12;
  size_t v13;
  __int16 *v14;
  __int16 *v15;
  float *data;
  __int16 *v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v26;
  int v27;
  __int16 *v28;
  uint64_t v29;
  __int16 *v30;
  float *v31;
  uint64_t v32;
  __int16 *v33;

  if (!self->super._mpsImg)
    return -50;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._context);

  if (!WeakRetained
    || -[NSMutableArray count](self->super._size, "count") != 1
    && -[NSMutableArray count](self->super._size, "count") != 3)
  {
    return -50;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->super._size, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if (-[NSMutableArray count](self->super._size, "count") == 3)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->super._size, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    -[NSMutableArray objectAtIndexedSubscript:](self->super._size, "objectAtIndexedSubscript:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

  }
  else
  {
    v7 = 1;
    v9 = 1;
  }
  v11 = v5 + 3;
  if (v5 < -3)
    v11 = v5 + 6;
  v12 = fmax((double)(v11 >> 2), 1.0);
  if ((((int)v12 * v7 * v9) & 0x20000000) != 0)
    v13 = -1;
  else
    v13 = 8 * (int)v12 * v7 * v9;
  v14 = (__int16 *)operator new[](v13, MEMORY[0x1E0DE4E10]);
  if (!v14)
    return -108;
  v15 = v14;
  -[MPSImage readBytes:dataLayout:imageIndex:](self->super._mpsImg, "readBytes:dataLayout:imageIndex:", v14, 0, 0);
  if (self->super._data || (v10 = -[VCPCNNData bufferAllocCPU](self, "bufferAllocCPU")) == 0)
  {
    if (v7 == 1 && v9 == 1)
    {
      if (v5 >= 1)
      {
        data = self->super._data;
        v17 = v15;
        v18 = v5;
        do
        {
          v19 = *v17++;
          _H0 = v19;
          __asm { FCVT            S0, H0 }
          *(_DWORD *)data++ = _S0;
          --v18;
        }
        while (v18);
      }
    }
    else if (v5 >= 1)
    {
      v26 = 0;
      v27 = 0;
      v28 = v15;
      do
      {
        if (v7 >= 1)
        {
          v29 = 0;
          v30 = v28;
          do
          {
            if (v9 >= 1)
            {
              v31 = &self->super._data[v27];
              v27 += v9;
              v32 = v9;
              v33 = v30;
              do
              {
                _H0 = *v33;
                __asm { FCVT            S0, H0 }
                *(_DWORD *)v31++ = _S0;
                v33 += v5;
                --v32;
              }
              while (v32);
            }
            ++v29;
            v30 += v9 * (unint64_t)v5;
          }
          while (v29 != v7);
        }
        ++v26;
        ++v28;
      }
      while (v26 != v5);
    }
    v10 = 0;
  }
  MEMORY[0x1BCCA128C](v15, 0x1000C80BDFB0063);
  return v10;
}

@end
