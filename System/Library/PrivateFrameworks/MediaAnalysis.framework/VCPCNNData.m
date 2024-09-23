@implementation VCPCNNData

+ (Class)cnnDataClass
{
  void *v2;

  v2 = (void *)objc_opt_class();
  if (+[VCPCNNMetalContext supportGPU](VCPCNNMetalContext, "supportGPU"))
    v2 = (void *)objc_opt_class();
  return (Class)v2;
}

+ (id)cnnData
{
  return objc_alloc_init(VCPCNNData);
}

+ (id)cnnDataWithGPUContext:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(+[VCPCNNData cnnDataClass](VCPCNNData, "cnnDataClass")), "initWithGPUContext:", v3);

  return v4;
}

+ (id)cnnDataWithPlane:(int)a3 height:(int)a4 width:(int)a5 context:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v9 = a6;
  v10 = (void *)objc_msgSend(objc_alloc(+[VCPCNNData cnnDataClass](VCPCNNData, "cnnDataClass")), "initWithParameters:height:width:context:", v8, v7, v6, v9);

  return v10;
}

- (VCPCNNData)init
{
  VCPCNNData *v2;
  VCPCNNData *v3;
  NSMutableArray *v4;
  NSMutableArray *size;
  MPSImage *mpsImg;
  VCPCNNData *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VCPCNNData;
  v2 = -[VCPCNNData init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_data = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    size = v3->_size;
    v3->_size = v4;

    objc_storeWeak((id *)&v3->_context, 0);
    mpsImg = v3->_mpsImg;
    v3->_mpsImg = 0;

    v7 = v3;
  }

  return v3;
}

- (VCPCNNData)initWithGPUContext:(id)a3
{
  id v4;
  VCPCNNData *v5;
  VCPCNNData *v6;
  NSMutableArray *v7;
  NSMutableArray *size;
  MPSImage *mpsImg;
  VCPCNNData *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VCPCNNData;
  v5 = -[VCPCNNData init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_data = 0;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    size = v6->_size;
    v6->_size = v7;

    objc_storeWeak((id *)&v6->_context, v4);
    mpsImg = v6->_mpsImg;
    v6->_mpsImg = 0;

    v10 = v6;
  }

  return v6;
}

- (VCPCNNData)initWithParameters:(int)a3 height:(int)a4 width:(int)a5 context:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  VCPCNNData *v11;
  NSMutableArray *v12;
  NSMutableArray *size;
  NSMutableArray *v14;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  NSMutableArray *v18;
  void *v19;
  MPSImage *mpsImg;
  VCPCNNData *v21;
  objc_super v23;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v23.receiver = self;
  v23.super_class = (Class)VCPCNNData;
  v11 = -[VCPCNNData init](&v23, sel_init);
  if (v11)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    size = v11->_size;
    v11->_size = v12;

    v14 = v11->_size;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v14, "addObject:", v15);

    v16 = v11->_size;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v16, "addObject:", v17);

    v18 = v11->_size;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v18, "addObject:", v19);

    v11->_data = 0;
    objc_storeWeak((id *)&v11->_context, v10);
    mpsImg = v11->_mpsImg;
    v11->_mpsImg = 0;

    v21 = v11;
  }

  return v11;
}

- (void)dealloc
{
  float *data;
  objc_super v4;

  data = self->_data;
  if (data)
    MEMORY[0x1BCCA128C](data, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNData;
  -[VCPCNNData dealloc](&v4, sel_dealloc);
}

- (int)allocBuffers:(BOOL)a3
{
  self->_isInputOutput = a3;
  return -[VCPCNNData bufferAllocCPU](self, "bufferAllocCPU");
}

- (int)randInit
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int i;
  int v12;
  float *v13;
  float v14;

  -[NSMutableArray objectAtIndexedSubscript:](self->_size, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  -[NSMutableArray objectAtIndexedSubscript:](self->_size, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  -[NSMutableArray objectAtIndexedSubscript:](self->_size, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  if (v4 >= 1)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      if (v6 >= 1)
      {
        for (i = 0; i != v6; ++i)
        {
          if (v8 >= 1)
          {
            v12 = 0;
            v13 = &self->_data[v10];
            do
            {
              v14 = (double)((10 * v9 + (255 - i) * (255 - i) + (v12 + 255) * (v12 + 255)) % 0xFFu) / 255.0;
              *v13++ = v14;
              --v12;
            }
            while (-v8 != v12);
            v10 -= v12;
          }
        }
      }
      ++v9;
    }
    while (v9 != v4);
  }
  return 0;
}

- (int)bufferAllocCPU
{
  unint64_t v4;
  int v5;
  void *v6;
  size_t v7;
  size_t v8;
  float *v9;

  if (self->_data)
    return -18;
  if (-[NSMutableArray count](self->_size, "count"))
  {
    v4 = 0;
    v5 = 1;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_size, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 *= objc_msgSend(v6, "intValue");

      ++v4;
    }
    while (-[NSMutableArray count](self->_size, "count") > v4);
    v7 = 4 * v5;
    if (v5 < 0)
      v8 = -1;
    else
      v8 = 4 * v5;
  }
  else
  {
    v7 = 4;
    v8 = 4;
  }
  v9 = (float *)operator new[](v8, MEMORY[0x1E0DE4E10]);
  self->_data = v9;
  if (!v9)
    return -108;
  bzero(v9, v7);
  return 0;
}

- (int)convertCPUData2GPU
{
  return -4;
}

- (int)convertGPUData2CPU
{
  return 0;
}

- (int)reallocGPUTemporalBuffers
{
  return -4;
}

- (int)copyImage:(__CVBuffer *)a3 withChunk:(int)a4
{
  size_t Width;
  size_t Height;
  NSMutableArray *size;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  int v13;
  CVReturn v14;
  _BYTE *BaseAddress;
  int BytesPerRow;
  id WeakRetained;
  _BOOL4 v19;
  float *data;
  float v21;
  int v22;
  uint64_t v23;
  float *v24;
  float *v25;
  float *v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  float v40;
  int v41;
  float *v42;
  float *v43;
  float *v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  unsigned int v48;
  CVReturn v49;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  uint8_t buf[4];
  __CVBuffer *v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369)
    return -50;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  -[NSMutableArray addObject:](self->_size, "addObject:", &unk_1E6B74AB0);
  size = self->_size;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", Height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](size, "addObject:", v10);

  v11 = self->_size;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", Width);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v11, "addObject:", v12);

  v13 = -[VCPCNNData allocBuffers:](self, "allocBuffers:", 1);
  if (v13)
    return v13;
  pixelBuffer = a3;
  unlockFlags = 1;
  if (!a3)
  {
    v31 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v31)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);
    return -50;
  }
  v14 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  v49 = v14;
  if (!v14
    || (v13 = v14, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    && (*(_DWORD *)buf = 134218240,
        v53 = a3,
        v54 = 1024,
        v55 = v13,
        _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v13 = v49) == 0))
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    v19 = a4 != 4 || WeakRetained != 0;

    data = self->_data;
    if (v19)
    {
      bzero(data, 16 * (int)Width * (int)Height);
      if ((int)Height >= 1)
      {
        v22 = 0;
        v23 = (int)Height * (uint64_t)(int)Width;
        v24 = &data[2 * v23];
        v25 = &data[3 * v23];
        v26 = &data[v23];
        v27 = 4 * (int)Width;
        do
        {
          if ((int)Width >= 1)
          {
            v28 = 0;
            do
            {
              LOBYTE(v21) = BaseAddress[(int)(v28 * 4) + 2];
              *(float *)&v29 = (float)LODWORD(v21) / 255.0;
              data[v28] = *(float *)&v29;
              LOBYTE(v29) = BaseAddress[(int)(v28 * 4) + 1];
              *(float *)&v30 = (float)v29 / 255.0;
              v26[v28] = *(float *)&v30;
              LOBYTE(v30) = BaseAddress[(int)(v28 * 4)];
              v21 = (float)v30 / 255.0;
              v24[v28] = v21;
              v25[v28++] = 0.0;
            }
            while (Width != v28);
          }
          BaseAddress += BytesPerRow;
          ++v22;
          v25 = (float *)((char *)v25 + v27);
          v24 = (float *)((char *)v24 + v27);
          v26 = (float *)((char *)v26 + v27);
          data = (float *)((char *)data + v27);
        }
        while (v22 != (_DWORD)Height);
      }
    }
    else
    {
      bzero(data, 16 * (int)Width * (int)Height);
      if ((int)Height >= 1)
      {
        v41 = 0;
        v42 = data + 3;
        v43 = data + 2;
        v44 = data + 1;
        do
        {
          if ((int)Width >= 1)
          {
            v45 = 0;
            do
            {
              LOBYTE(v40) = BaseAddress[(int)v45 + 2];
              *(float *)&v46 = (float)LODWORD(v40) / 255.0;
              v47 = v45;
              data[v47] = *(float *)&v46;
              LOBYTE(v46) = BaseAddress[(int)v45 + 1];
              *(float *)&v48 = (float)v46 / 255.0;
              v44[v47] = *(float *)&v48;
              LOBYTE(v48) = BaseAddress[(int)v45];
              v40 = (float)v48 / 255.0;
              v43[v47] = v40;
              v42[v47] = 0.0;
              v45 += 4;
            }
            while (4 * Width != v45);
          }
          data += 4 * (int)Width;
          v44 += 4 * (int)Width;
          v43 += 4 * (int)Width;
          BaseAddress += BytesPerRow;
          ++v41;
          v42 += 4 * (int)Width;
        }
        while (v41 != (_DWORD)Height);
      }
    }
    v13 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v49);
    if (pixelBuffer
      && !v49
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
    }
  }
  return v13;
}

- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  int v4;
  unint64_t v7;
  int v8;
  void *v9;
  float *data;
  unint64_t v11;
  __int16 *v12;
  float *v13;
  uint64_t v14;
  __int16 *v15;
  __int16 v16;

  v4 = a4;
  if (-[NSMutableArray count](self->_size, "count"))
  {
    v7 = 0;
    v8 = 1;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_size, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 *= objc_msgSend(v9, "intValue");

      ++v7;
    }
    while (-[NSMutableArray count](self->_size, "count") > v7);
  }
  else
  {
    v8 = 1;
  }
  if (v4 > 1)
  {
    if (fread(self->_data, 2uLL, v8, a3))
    {
      if (v8 >= 1)
      {
        data = self->_data;
        v11 = v8 + 1;
        do
        {
          data[(v11 - 2)] = (float)*((__int16 *)data + (v11 - 2)) / (float)v4;
          --v11;
        }
        while (v11 > 1);
      }
      return 0;
    }
    return -19;
  }
  if (v4 == 1)
  {
    if (fread(self->_data, 4uLL, v8, a3))
      return 0;
    return -19;
  }
  if (!v4)
  {
    v12 = (__int16 *)operator new[]();
    if (fread(v12, 2uLL, v8, a3))
    {
      if (v8 >= 1)
      {
        v13 = self->_data;
        v14 = v8;
        v15 = v12;
        do
        {
          v16 = *v15++;
          _H0 = v16;
          __asm { FCVT            S0, H0 }
          *(_DWORD *)v13++ = _S0;
          --v14;
        }
        while (v14);
      }
      MEMORY[0x1BCCA128C](v12, 0x1000C80BDFB0063);
      return 0;
    }
    return -19;
  }
  return -50;
}

- (int)normalization
{
  unint64_t v3;
  int v4;
  void *v5;
  float *data;
  uint64_t v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float *v13;
  uint64_t v14;

  if (!-[NSMutableArray count](self->_size, "count"))
  {
    v4 = 1;
LABEL_7:
    data = self->_data;
    v7 = v4;
    v8 = 0.0;
    v9 = 0.0;
    do
    {
      v10 = *data++;
      v9 = v9 + v10;
      v8 = v8 + (float)(v10 * v10);
      --v7;
    }
    while (v7);
    v11 = v9 / (float)v4;
    v12 = fmaxf(sqrtf((float)(v8 / (float)v4) - (float)(v11 * v11)), 1.0e-10);
    v13 = self->_data;
    v14 = v4;
    do
    {
      *v13 = (float)(*v13 - v11) / v12;
      ++v13;
      --v14;
    }
    while (v14);
    return 0;
  }
  v3 = 0;
  v4 = 1;
  do
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_size, "objectAtIndexedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 *= objc_msgSend(v5, "intValue");

    ++v3;
  }
  while (-[NSMutableArray count](self->_size, "count") > v3);
  if (v4 >= 1)
    goto LABEL_7;
  return 0;
}

- (int)softmax
{
  void *v3;
  int v4;
  float *data;
  uint64_t v6;
  float v7;
  uint64_t v8;
  float v9;
  float v10;
  float *v11;
  float v12;
  uint64_t v13;
  float v14;
  float *v15;

  if (-[NSMutableArray count](self->_size, "count") == 1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_size, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "intValue");

    if (v4 >= 1)
    {
      data = self->_data;
      v6 = v4;
      v7 = -1.0e10;
      v8 = v4;
      do
      {
        v9 = *data++;
        v10 = v9;
        if (v9 > v7)
          v7 = v10;
        --v8;
      }
      while (v8);
      v11 = self->_data;
      v12 = 0.0;
      v13 = v6;
      do
      {
        v14 = expf(*v11 - v7);
        *v11++ = v14;
        v12 = v12 + v14;
        --v13;
      }
      while (v13);
      v15 = self->_data;
      do
      {
        *v15 = *v15 / v12;
        ++v15;
        --v6;
      }
      while (v6);
    }
  }
  return 0;
}

- (NSMutableArray)size
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (float)data
{
  return self->_data;
}

- (void)setData:(float *)a3
{
  self->_data = a3;
}

- (BOOL)isInputOutput
{
  return self->_isInputOutput;
}

- (void)setIsInputOutput:(BOOL)a3
{
  self->_isInputOutput = a3;
}

- (MPSImage)mpsImg
{
  return (MPSImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMpsImg:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (VCPCNNMetalContext)context
{
  return (VCPCNNMetalContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_mpsImg, 0);
  objc_storeStrong((id *)&self->_size, 0);
}

@end
