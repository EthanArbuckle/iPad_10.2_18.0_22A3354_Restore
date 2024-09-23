@implementation VCPEspressoV2Data

- (VCPEspressoV2Data)initWithTensorType:(unint64_t)a3 size:(unint64_t)a4 dataPtr:(void *)a5
{
  VCPEspressoV2Data *v6;
  VCPEspressoV2Data *v9;
  VCPEspressoV2Data *v10;
  objc_super v12;
  uint8_t buf[4];
  unint64_t v14;
  uint64_t v15;

  v6 = self;
  v15 = *MEMORY[0x1E0C80C00];
  if (a3 >= 3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v14 = a3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unsupported Tensor type %lu", buf, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)VCPEspressoV2Data;
    v9 = -[VCPEspressoV2Data init](&v12, sel_init);
    if (v9)
    {
      v9->_tensorType = a3;
      v9->_tensorSize = a4;
      v9->_dataPtr = a5;
      v6 = v9;
      v9->_allocated = 0;
    }
    else
    {
      v6 = 0;
    }
  }
  v10 = v9;

  return v10;
}

- (VCPEspressoV2Data)initWithTensorType:(unint64_t)a3 size:(unint64_t)a4
{
  VCPEspressoV2Data *v5;
  NSObject *v6;
  const char *v7;
  uint32_t v8;
  VCPEspressoV2Data *v10;
  size_t v11;
  void *v12;
  VCPEspressoV2Data *v13;
  VCPEspressoV2Data *v14;
  objc_super v16;
  uint8_t buf[4];
  unint64_t v18;
  uint64_t v19;

  v5 = self;
  v19 = *MEMORY[0x1E0C80C00];
  if (a3 >= 3)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buf = 134217984;
    v18 = a3;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Unsupported Tensor type %lu";
    v8 = 12;
    goto LABEL_5;
  }
  v16.receiver = self;
  v16.super_class = (Class)VCPEspressoV2Data;
  v10 = -[VCPEspressoV2Data init](&v16, sel_init);
  v5 = v10;
  if (!v10)
    goto LABEL_22;
  v10->_tensorType = a3;
  v10->_tensorSize = a4;
  v10->_allocated = 1;
  if (a3)
  {
    if (a3 == 1)
    {
      if ((a4 & 0x8000000000000000) != 0)
        v11 = -1;
      else
        v11 = 2 * a4;
      goto LABEL_16;
    }
    if (a3 != 2)
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      *(_WORD *)buf = 0;
      v6 = MEMORY[0x1E0C81028];
      v7 = "Unsupported tensor type";
      v8 = 2;
LABEL_5:
      _os_log_impl(&dword_1B6C4A000, v6, OS_LOG_TYPE_ERROR, v7, buf, v8);
LABEL_22:
      v13 = 0;
      goto LABEL_23;
    }
  }
  if (a4 >> 62)
    v11 = -1;
  else
    v11 = 4 * a4;
LABEL_16:
  v12 = operator new[](v11, MEMORY[0x1E0DE4E10]);
  v5->_dataPtr = v12;
  if (v12)
    v13 = v5;
  else
    v13 = 0;
LABEL_23:
  v14 = v13;

  return v14;
}

- (void)dealloc
{
  objc_super v3;
  uint8_t buf[16];

  if (self->_dataPtr && self->_allocated)
  {
    if (self->_tensorType <= 2uLL)
      goto LABEL_8;
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "unsupported tensor type with valid data pointer", buf, 2u);
    }
    if (self->_dataPtr)
LABEL_8:
      MEMORY[0x1BCCA128C]();
    self->_dataPtr = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)VCPEspressoV2Data;
  -[VCPEspressoV2Data dealloc](&v3, sel_dealloc);
}

- (void)setData:(id)a3 padding:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (self->_tensorSize)
  {
    v7 = 0;
    do
    {
      if (v7 >= objc_msgSend(v9, "count"))
      {
        -[VCPEspressoV2Data setValue:atIndex:](self, "setValue:atIndex:", v6, v7);
      }
      else
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPEspressoV2Data setValue:atIndex:](self, "setValue:atIndex:", v8, v7);

      }
      ++v7;
    }
    while (v7 < self->_tensorSize);
  }

}

- (void)setValue:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  int64_t tensorType;
  _DWORD *v9;
  unint64_t tensorSize;
  NSObject *v11;
  const char *v12;
  os_log_type_t v13;
  uint32_t v14;
  _DWORD *dataPtr;
  int v16;
  _WORD *v17;
  int v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (self->_tensorSize <= a4)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      tensorSize = self->_tensorSize;
      v23 = 134218240;
      v24 = a4;
      v25 = 2048;
      v26 = tensorSize;
      v11 = MEMORY[0x1E0C81028];
      v12 = "Setting data out of boundary (%llu - %llu)";
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 22;
LABEL_9:
      _os_log_impl(&dword_1B6C4A000, v11, v13, v12, (uint8_t *)&v23, v14);
    }
  }
  else
  {
    tensorType = self->_tensorType;
    switch(tensorType)
    {
      case 2:
        dataPtr = self->_dataPtr;
        objc_msgSend(v6, "floatValue");
        dataPtr[a4] = v16;
        goto LABEL_15;
      case 1:
        v17 = self->_dataPtr;
        objc_msgSend(v6, "floatValue");
        __asm { FCVT            H0, S0 }
        v17[a4] = _S0;
        goto LABEL_15;
      case 0:
        v9 = self->_dataPtr;
        v9[a4] = objc_msgSend(v6, "intValue");
        goto LABEL_15;
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      v11 = MEMORY[0x1E0C81028];
      v12 = "Unsupported tensor type";
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 2;
      goto LABEL_9;
    }
  }
LABEL_15:

}

- (void)setValueFP:(float)_S0 atIndex:(unint64_t)a4
{
  int64_t tensorType;
  unint64_t tensorSize;
  NSObject *v8;
  const char *v9;
  os_log_type_t v10;
  uint32_t v11;
  int v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_tensorSize <= a4)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      tensorSize = self->_tensorSize;
      v17 = 134218240;
      v18 = a4;
      v19 = 2048;
      v20 = tensorSize;
      v8 = MEMORY[0x1E0C81028];
      v9 = "Setting data out of boundary (%llu - %llu)";
      v10 = OS_LOG_TYPE_DEFAULT;
      v11 = 22;
LABEL_9:
      _os_log_impl(&dword_1B6C4A000, v8, v10, v9, (uint8_t *)&v17, v11);
    }
  }
  else
  {
    tensorType = self->_tensorType;
    switch(tensorType)
    {
      case 2:
        *((float *)self->_dataPtr + a4) = _S0;
        break;
      case 1:
        __asm { FCVT            H0, S0 }
        *((_WORD *)self->_dataPtr + a4) = _H0;
        break;
      case 0:
        *((_DWORD *)self->_dataPtr + a4) = (int)_S0;
        return;
      default:
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          LOWORD(v17) = 0;
          v8 = MEMORY[0x1E0C81028];
          v9 = "Unsupported tensor type";
          v10 = OS_LOG_TYPE_ERROR;
          v11 = 2;
          goto LABEL_9;
        }
        break;
    }
  }
}

- (void)getData:(unint64_t)a3
{
  NSObject *v4;
  const char *v5;
  uint32_t v6;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 >= 3)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return 0;
    v8 = 134217984;
    v9 = a3;
    v4 = MEMORY[0x1E0C81028];
    v5 = "Unsupported Tensor type %lu";
    v6 = 12;
    goto LABEL_10;
  }
  if (self->_tensorType == a3)
    return self->_dataPtr;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v8) = 0;
    v4 = MEMORY[0x1E0C81028];
    v5 = "tensor type mismatch!";
    v6 = 2;
LABEL_10:
    _os_log_impl(&dword_1B6C4A000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v8, v6);
  }
  return 0;
}

- (void)copyDataFrom:(void *)a3 srcStart:(unint64_t)a4 dstStart:(unint64_t)a5 length:(unint64_t)a6
{
  int64_t tensorType;

  tensorType = self->_tensorType;
  if (tensorType != 2)
  {
    if (tensorType == 1)
    {
      memcpy((char *)self->_dataPtr + 2 * a5, (char *)a3 + 2 * a4, 2 * a6);
      return;
    }
    if (tensorType)
      return;
  }
  memcpy((char *)self->_dataPtr + 4 * a5, (char *)a3 + 4 * a4, 4 * a6);
}

- (int64_t)tensorType
{
  return self->_tensorType;
}

- (unint64_t)tensorSize
{
  return self->_tensorSize;
}

@end
