@implementation VCPCNNBlurAnalyzerEspresso

+ (id)sharedModelPoolWithRevision:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPCNNBlurAnalyzerEspresso.sharedModelPool-%lu"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__VCPCNNBlurAnalyzerEspresso_sharedModelPoolWithRevision___block_invoke;
  v8[3] = &__block_descriptor_40_e20___VCPObjectPool_8__0l;
  v8[4] = a3;
  objc_msgSend(v5, "sharedInstanceWithIdentifier:andCreationBlock:", v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __58__VCPCNNBlurAnalyzerEspresso_sharedModelPoolWithRevision___block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__VCPCNNBlurAnalyzerEspresso_sharedModelPoolWithRevision___block_invoke_2;
  v2[3] = &__block_descriptor_40_e26___VCPCNNModelEspresso_8__0l;
  v2[4] = *(_QWORD *)(a1 + 32);
  +[VCPObjectPool objectPoolWithAllocator:](VCPObjectPool, "objectPoolWithAllocator:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

VCPCNNModelEspresso *__58__VCPCNNBlurAnalyzerEspresso_sharedModelPoolWithRevision___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  VCPCNNModelEspresso *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32) == 2)
    v4 = CFSTR("cnn_blurV2.espresso.net");
  else
    v4 = CFSTR("cnn_blur.espresso.net");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", v5, 0, 0, 0);

  return v6;
}

- (VCPCNNBlurAnalyzerEspresso)initWithRevision:(unint64_t)a3
{
  VCPCNNBlurAnalyzerEspresso *v4;
  void *v5;
  uint64_t v6;
  VCPLoaned *modelEspresso;
  void *v8;
  NSString *resConfig;
  VCPCNNBlurAnalyzerEspresso *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VCPCNNBlurAnalyzerEspresso;
  v4 = -[VCPCNNBlurAnalyzer initWithRevision:](&v12, sel_initWithRevision_);
  if (v4)
  {
    +[VCPCNNBlurAnalyzerEspresso sharedModelPoolWithRevision:](VCPCNNBlurAnalyzerEspresso, "sharedModelPoolWithRevision:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getObject");
    v6 = objc_claimAutoreleasedReturnValue();
    modelEspresso = v4->_modelEspresso;
    v4->_modelEspresso = (VCPLoaned *)v6;

    v8 = v4->_modelEspresso;
    if (v8)
    {
      resConfig = v4->_resConfig;
      v4->_resConfig = (NSString *)&stru_1E6B1C190;

      v8 = v4;
    }
  }
  else
  {
    v8 = 0;
  }
  v10 = v8;

  return v10;
}

- (VCPCNNBlurAnalyzerEspresso)init
{
  return -[VCPCNNBlurAnalyzerEspresso initWithRevision:](self, "initWithRevision:", 1);
}

- (void)dealloc
{
  float *inputData;
  objc_super v4;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNBlurAnalyzerEspresso;
  -[VCPCNNBlurAnalyzerEspresso dealloc](&v4, sel_dealloc);
}

+ (id)sharedModel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__VCPCNNBlurAnalyzerEspresso_sharedModel___block_invoke;
  v8[3] = &unk_1E6B168B8;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("VCPBlurEspresso"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

VCPCNNModelEspresso *__42__VCPCNNBlurAnalyzerEspresso_sharedModel___block_invoke(uint64_t a1)
{
  return -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", *(_QWORD *)(a1 + 32), 0, 0, 0);
}

- (float)calculateScoreFromNetworkOutputV2:(float *)a3
{
  __int128 v3;
  uint64_t v5;
  float v6;
  float32x4_t v7;
  __int128 v9;
  float32x4_t v10;
  uint64_t v11;

  v5 = 0;
  v11 = *MEMORY[0x1E0C80C00];
  LODWORD(v3) = 0;
  do
  {
    v9 = v3;
    v6 = expf(a3[v5]);
    v3 = v9;
    v10.f32[v5] = v6;
    *(float *)&v3 = *(float *)&v9 + v6;
    ++v5;
  }
  while (v5 != 4);
  v7 = vmulq_f32(vdivq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v3, 0)), (float32x4_t)xmmword_1B6FBEFA0);
  return (float)((float)((float)(v7.f32[0] + 0.0) + v7.f32[1]) + v7.f32[2]) + v7.f32[3];
}

- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4
{
  int v7;
  NSString *resConfig;
  __CFString *v10;
  void *v11;
  float *inputData;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  size_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (self->_srcWidth == a3 && self->_srcHeight == a4)
    return 0;
  if (a4 == 299 && a3 == 299)
  {
    resConfig = self->_resConfig;
    v10 = CFSTR("res_299x299");
  }
  else if (a4 == a3)
  {
    resConfig = self->_resConfig;
    v10 = CFSTR("res_400x400");
  }
  else
  {
    resConfig = self->_resConfig;
    if (a4 >= a3)
      v10 = CFSTR("res_300x400");
    else
      v10 = CFSTR("res_400x300");
  }
  self->_resConfig = &v10->isa;

  -[VCPLoaned object](self->_modelEspresso, "object");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v11, "prepareModelWithConfig:", self->_resConfig);

  if (!v7)
  {
    self->_srcHeight = 0;
    self->_srcWidth = 0;
    inputData = self->_inputData;
    if (inputData)
      MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
    -[VCPLoaned object](self->_modelEspresso, "object");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "inputBlob");
      v15 = v27;
    }
    else
    {
      v15 = 0;
    }
    -[VCPLoaned object](self->_modelEspresso, "object");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "inputBlob");
      v18 = v26;
    }
    else
    {
      v18 = 0;
    }
    -[VCPLoaned object](self->_modelEspresso, "object");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "inputBlob");
      v21 = v25;
    }
    else
    {
      v21 = 0;
    }
    v22 = v18 * v15 * v21;
    if (v22 >> 62)
      v23 = -1;
    else
      v23 = 4 * v22;
    self->_inputData = (float *)operator new[](v23, MEMORY[0x1E0DE4E10]);

    if (self->_inputData)
    {
      v7 = 0;
      self->_srcWidth = a3;
      self->_srcHeight = a4;
    }
    else
    {
      return -108;
    }
  }
  return v7;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  int v16;
  int v17;

  -[VCPLoaned object](self->_modelEspresso, "object", *(_QWORD *)&a3, *(_QWORD *)&a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "inputBlob");
    v11 = v17;
  }
  else
  {
    v11 = 0;
    v16 = 0;
  }
  *a5 = v11;

  -[VCPLoaned object](self->_modelEspresso, "object");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "inputBlob");
    v14 = v16;
  }
  else
  {
    v14 = 0;
  }
  *a6 = v14;

  return self->_inputData;
}

- (int)computeSharpnessScore:(float *)a3 textureness:(char *)a4 contrast:(float)a5 imgWidth:(int)a6 cancel:(id)a7
{
  uint64_t v7;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  uint64_t v32;
  int v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v7 = *(_QWORD *)&a6;
  v12 = a7;
  v13 = v12;
  if (v12 && ((*((uint64_t (**)(id))v12 + 2))(v12) & 1) != 0)
  {
    v14 = -128;
  }
  else
  {
    -[VCPLoaned object](self->_modelEspresso, "object");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "espressoForward:", self->_inputData);

    if (!v14)
    {
      if (-[VCPCNNBlurAnalyzer getRevision](self, "getRevision") == 2)
      {
        -[VCPLoaned object](self->_modelEspresso, "object");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "outputBlob");
          v18 = v35;
        }
        else
        {
          v18 = 0;
          v45 = 0;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
        }
        -[VCPCNNBlurAnalyzerEspresso calculateScoreFromNetworkOutputV2:](self, "calculateScoreFromNetworkOutputV2:", v18, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45);
        *(_DWORD *)a3 = v22;

      }
      else
      {
        -[VCPLoaned object](self->_modelEspresso, "object");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          objc_msgSend(v19, "outputBlob");
          v21 = v41;
        }
        else
        {
          v21 = 0;
          v45 = 0;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
        }

        -[VCPLoaned object](self->_modelEspresso, "object");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "outputBlob");
          v25 = DWORD2(v40);
        }
        else
        {
          v25 = 0;
          v45 = 0;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
        }

        -[VCPLoaned object](self->_modelEspresso, "object");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          objc_msgSend(v26, "outputBlob");
          v28 = v40;
        }
        else
        {
          v28 = 0;
          v45 = 0;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
        }

        -[VCPLoaned object](self->_modelEspresso, "object");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          objc_msgSend(v29, "outputBlob");
          v32 = v35;
        }
        else
        {
          v32 = 0;
          v45 = 0;
          HIDWORD(v31) = 0;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
        }
        *(float *)&v31 = a5;
        -[VCPCNNBlurAnalyzer calculateScoreFromNetworkOutput:outChannel:outHeight:outWidth:textureness:contrast:imgWidth:](self, "calculateScoreFromNetworkOutput:outChannel:outHeight:outWidth:textureness:contrast:imgWidth:", v32, v21, v25, v28, a4, v7, v31, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44,
          v45);
        *(_DWORD *)a3 = v33;

      }
      v14 = 0;
    }
  }

  return v14;
}

- (void)copyBufferFrom:(char *)a3 fromStride:(int64_t)a4 toPtr:(float *)a5 toStride:(int64_t)a6 toWidth:(int)a7 toHeight:(int)a8
{
  uint64_t v8;
  uint64_t v9;
  float v15;
  int v16;
  float v17;
  char *v18;
  uint64_t v19;
  float v20;
  int v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  if (-[VCPCNNBlurAnalyzer getRevision](self, "getRevision") == 2)
  {
    if ((int)v8 >= 1)
    {
      v16 = 0;
      v17 = 0.0;
      v18 = a3;
      do
      {
        if ((int)v9 >= 1)
        {
          v19 = 0;
          do
          {
            LOBYTE(v15) = v18[v19];
            v15 = (float)LODWORD(v15);
            v17 = v17 + v15;
            ++v19;
          }
          while (v9 != v19);
        }
        v18 += a4;
        ++v16;
      }
      while (v16 != (_DWORD)v8);
      v20 = v17 / (float)((float)((float)(int)v9 * 255.0) * (float)(int)v8);
      v21 = 0;
      v22 = 4 * a6;
      if (v20 >= 0.1)
      {
        do
        {
          if ((int)v9 >= 1)
          {
            v24 = 0;
            do
            {
              LOBYTE(v20) = a3[v24];
              v20 = (float)LODWORD(v20) / 255.0;
              a5[v24++] = v20;
            }
            while (v9 != v24);
          }
          a3 += a4;
          ++v21;
          a5 = (float *)((char *)a5 + v22);
        }
        while (v21 != (_DWORD)v8);
      }
      else
      {
        do
        {
          if ((int)v9 >= 1)
          {
            v23 = 0;
            do
            {
              LOBYTE(v20) = a3[v23];
              v20 = (float)((float)LODWORD(v20) + (float)LODWORD(v20)) / 255.0;
              a5[v23++] = v20;
            }
            while (v9 != v23);
          }
          a3 += a4;
          ++v21;
          a5 = (float *)((char *)a5 + v22);
        }
        while (v21 != (_DWORD)v8);
      }
    }
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)VCPCNNBlurAnalyzerEspresso;
    -[VCPCNNBlurAnalyzer copyBufferFrom:fromStride:toPtr:toStride:toWidth:toHeight:](&v25, sel_copyBufferFrom_fromStride_toPtr_toStride_toWidth_toHeight_, a3, a4, a5, a6, v9, v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end
