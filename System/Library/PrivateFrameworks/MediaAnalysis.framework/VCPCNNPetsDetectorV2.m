@implementation VCPCNNPetsDetectorV2

+ (id)detector:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 revision:(int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v8 = a4;
  v9 = *(_QWORD *)&a3;
  if (+[VCPCNNPetsDetectorV2 detector:forceCPU:sharedModel:revision:]::once != -1)
    dispatch_once(&+[VCPCNNPetsDetectorV2 detector:forceCPU:sharedModel:revision:]::once, &__block_literal_global_75);
  return (id)objc_msgSend(objc_alloc((Class)+[VCPCNNPetsDetectorV2 detector:forceCPU:sharedModel:revision:]::analyzerClass), "initWithMaxNumRegions:forceCPU:sharedModel:revision:", v9, v8, v7, v6);
}

uint64_t __63__VCPCNNPetsDetectorV2_detector_forceCPU_sharedModel_revision___block_invoke()
{
  uint64_t result;

  result = objc_opt_class();
  +[VCPCNNPetsDetectorV2 detector:forceCPU:sharedModel:revision:]::analyzerClass = result;
  return result;
}

- (VCPCNNPetsDetectorV2)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 revision:(int)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  NSArray *outputNames;
  VCPCNNPetsDetectorV2 *v10;
  void *v11;
  void *v12;
  void *v13;
  VCPCNNModelEspresso *v14;
  NSArray *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNPetsDetectorV2 *v21;
  VCPCNNPetsDetectorV2 *v22;
  objc_super v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  const __CFString *v28;
  uint64_t v29;

  v6 = a5;
  v7 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  self->_maxNumRegions = a3;
  self->_numClass = 4;
  self->_revision = a6;
  outputNames = self->_outputNames;
  self->_outputNames = (NSArray *)&unk_1E6B76938;

  v24.receiver = self;
  v24.super_class = (Class)VCPCNNPetsDetectorV2;
  v10 = -[VCPCNNPetsDetectorV2 init](&v24, sel_init);
  if (!v10)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resourceURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v28 = CFSTR("cnn_pets_detector_v2.espresso.net");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "CNNPetsDetectorV2: Loading model %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_pets_detector_v2.espresso.net"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [VCPCNNModelEspresso alloc];
  v15 = v10->_outputNames;
  v25[0] = CFSTR("forceCPU");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v25[1] = CFSTR("sharedContext");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:](v14, "initWithParameters:inputNames:outputNames:properties:", v13, 0, v15, v18);
  modelEspresso = v10->_modelEspresso;
  v10->_modelEspresso = (VCPCNNModelEspresso *)v19;

  LOBYTE(v18) = v10->_modelEspresso == 0;
  if ((v18 & 1) != 0)
    v21 = 0;
  else
LABEL_6:
    v21 = v10;
  v22 = v21;

  return v22;
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4
{
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  int Width;
  int Height;
  int v12;
  CVReturn v13;
  int v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *BaseAddress;
  int BytesPerRow;
  double v25;
  int v26;
  float *v27;
  float *v28;
  uint64_t v29;
  uint64_t i;
  double v31;
  double v32;
  NSObject *v33;
  NSObject *v34;
  uint8_t v36[16];
  uint8_t buf[8];
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "copyImageToRGBPetsDetectorV2CallFromSPI", ", buf, 2u);
  }

  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369)
    return -50;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBuffer = a3;
  unlockFlags = 1;
  if (a3)
  {
    v12 = Height;
    v13 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    *(_DWORD *)buf = v13;
    if (v13)
    {
      v14 = v13;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.3();
    }
    else
    {
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      bzero(a4, 3 * 4 * Width * v12);
      if (v12 >= 1)
      {
        v26 = 0;
        v27 = &a4[2 * v12 * Width];
        v28 = &a4[v12 * Width];
        v29 = 4 * Width;
        do
        {
          if (Width >= 1)
          {
            for (i = 0; i != Width; ++i)
            {
              LOBYTE(v25) = BaseAddress[(int)(i * 4) + 2];
              v31 = (double)*(unint64_t *)&v25 / 255.0;
              *(float *)&v31 = v31;
              a4[i] = *(float *)&v31;
              LOBYTE(v31) = BaseAddress[(int)(i * 4) + 1];
              v32 = (double)*(unint64_t *)&v31 / 255.0;
              *(float *)&v32 = v32;
              v28[i] = *(float *)&v32;
              LOBYTE(v32) = BaseAddress[(int)(i * 4)];
              v25 = (double)*(unint64_t *)&v32 / 255.0;
              *(float *)&v25 = v25;
              v27[i] = *(float *)&v25;
            }
          }
          BaseAddress += BytesPerRow;
          ++v26;
          v27 = (float *)((char *)v27 + v29);
          v28 = (float *)((char *)v28 + v29);
          a4 = (float *)((char *)a4 + v29);
        }
        while (v26 != v12);
      }
      v14 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
      if (!v14)
      {
        VCPSignPostLog();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          *(_WORD *)v36 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v34, OS_SIGNPOST_INTERVAL_END, v7, "copyImageToRGBPetsDetectorV2CallFromSPI", ", v36, 2u);
        }

        v14 = 0;
      }
    }
  }
  else
  {
    v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v15)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    v14 = -50;
    *(_DWORD *)buf = -50;
  }
  if (pixelBuffer
    && !*(_DWORD *)buf
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:].cold.1();
  }
  return v14;
}

- (int64_t)getClosestAspectRatio:(id)a3
{
  id v3;
  int64_t v4;
  uint64_t v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  float v15;
  float v16;

  v3 = a3;
  v4 = objc_msgSend(&unk_1E6B76950, "indexOfObject:inSortedRange:options:usingComparator:", v3, 0, objc_msgSend(&unk_1E6B76950, "count"), 1280, &__block_literal_global_148_0);
  v5 = objc_msgSend(&unk_1E6B76950, "count");
  if (v4 >= (unint64_t)(v5 - 1))
    v4 = v5 - 1;
  if (v4 >= 1)
  {
    objc_msgSend(&unk_1E6B76950, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;
    objc_msgSend(v3, "floatValue");
    v10 = v9;
    objc_msgSend(v3, "floatValue");
    v12 = v11;
    objc_msgSend(&unk_1E6B76950, "objectAtIndexedSubscript:", v4 - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v14 = v8 - v10;
    v16 = v12 - v15;

    if (v14 > v16)
      --v4;
  }

  return v4;
}

uint64_t __46__VCPCNNPetsDetectorV2_getClosestAspectRatio___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (int)configForAspectRatio:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  void *v10;
  int v11;
  float v12;
  float *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  NSString *v19;
  NSString *resConfig;
  uint8_t buf[4];
  _BYTE v23[10];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "floatValue");
    v8 = v7;
    objc_msgSend(v5, "floatValue");
    *(float *)&v9 = 1.0 / *(float *)&v9;
    if (v8 >= *(float *)&v9)
      *(float *)&v9 = v8;
    objc_msgSend(v6, "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v23 = v5;
      *(_WORD *)&v23[8] = 2112;
      v24 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "CNNPetsDetectorV2: aspectRatio = %@, queryAspectRatioVal = %@", buf, 0x16u);
    }
    v11 = -[VCPCNNPetsDetectorV2 getClosestAspectRatio:](self, "getClosestAspectRatio:", v10);
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v23 = v11;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "CNNPetsDetectorV2: feasibleShapeIndex = %d", buf, 8u);
    }
    objc_msgSend(v5, "floatValue");
    v13 = (float *)((char *)&kFeasibleInputShape + 8 * v11);
    v14 = *v13;
    v15 = v13[1];
    if (*v13 >= v15)
      v16 = v13[1];
    else
      v16 = *v13;
    if (*v13 < v15)
      v14 = v13[1];
    if (v12 <= 1.0)
      v17 = v16;
    else
      v17 = v14;
    if (v12 <= 1.0)
      v18 = v14;
    else
      v18 = v16;
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v23 = (int)v18;
      *(_WORD *)&v23[4] = 1024;
      *(_DWORD *)&v23[6] = (int)v17;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "CNNPetsDetectorV2: detectorHeight = %d, detectorWidth = %d", buf, 0xEu);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("res_%dx%d"), (int)v17, (int)v18);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    resConfig = self->_resConfig;
    self->_resConfig = v19;

  }
  return 0;
}

- (int)createModel:(int)a3 srcWidth:(int)a4
{
  double v4;
  int v8;
  void *v9;
  NSString *resConfig;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v12;
  int v13;
  float *inputData;
  VCPCNNModelEspresso *v15;
  VCPCNNModelEspresso *v16;
  uint64_t v17;
  VCPCNNModelEspresso *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  size_t v22;
  float *v23;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  NSString *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_srcWidth == a4 && self->_srcHeight == a3)
    return 0;
  *(float *)&v4 = (float)a4 / (float)a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VCPCNNPetsDetectorV2 configForAspectRatio:](self, "configForAspectRatio:", v9);

  if (!v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      resConfig = self->_resConfig;
      *(_DWORD *)buf = 138412290;
      v28 = resConfig;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "CNNPetsDetectorV2: _resConfig = %@", buf, 0xCu);
    }
    v8 = -[VCPCNNModelEspresso prepareModelWithConfig:](self->_modelEspresso, "prepareModelWithConfig:", self->_resConfig);
    if (!v8)
    {
      modelEspresso = self->_modelEspresso;
      if (modelEspresso)
      {
        -[VCPCNNModelEspresso inputBlob](modelEspresso, "inputBlob");
        v12 = self->_modelEspresso;
        self->_cnnInputHeight = v30;
        if (v12)
        {
          -[VCPCNNModelEspresso inputBlob](v12, "inputBlob");
          v13 = v29;
        }
        else
        {
          v13 = 0;
        }
      }
      else
      {
        v13 = 0;
        self->_cnnInputHeight = 0;
      }
      self->_cnnInputWidth = v13;
      self->_srcWidth = 0;
      self->_srcHeight = 0;
      inputData = self->_inputData;
      if (inputData)
        MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
      v15 = self->_modelEspresso;
      if (v15 && (-[VCPCNNModelEspresso inputBlob](v15, "inputBlob"), (v16 = self->_modelEspresso) != 0))
      {
        v17 = v30;
        -[VCPCNNModelEspresso inputBlob](v16, "inputBlob");
        v18 = self->_modelEspresso;
        v19 = v26 * v17;
        if (v18)
        {
          -[VCPCNNModelEspresso inputBlob](v18, "inputBlob");
          v20 = v25;
LABEL_22:
          v21 = v19 * v20;
          if (v21 >> 62)
            v22 = -1;
          else
            v22 = 4 * v21;
          v23 = (float *)operator new[](v22, MEMORY[0x1E0DE4E10]);
          self->_inputData = v23;
          if (!v23)
            return -108;
          v8 = 0;
          self->_srcWidth = a4;
          self->_srcHeight = a3;
          return v8;
        }
      }
      else
      {
        v19 = 0;
      }
      v20 = 0;
      goto LABEL_22;
    }
  }
  return v8;
}

- (void)dealloc
{
  float *inputData;
  objc_super v4;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNPetsDetectorV2;
  -[VCPCNNPetsDetectorV2 dealloc](&v4, sel_dealloc);
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  VCPCNNModelEspresso *modelEspresso;
  int v10;
  VCPCNNModelEspresso *v11;
  int v12;
  int v14;
  int v15;

  modelEspresso = self->_modelEspresso;
  if (modelEspresso)
  {
    -[VCPCNNModelEspresso inputBlob](modelEspresso, "inputBlob", *(_QWORD *)&a3, *(_QWORD *)&a4);
    v10 = v15;
  }
  else
  {
    v10 = 0;
  }
  *a5 = v10;
  v11 = self->_modelEspresso;
  if (v11)
  {
    -[VCPCNNModelEspresso inputBlob](v11, "inputBlob");
    v12 = v14;
  }
  else
  {
    v12 = 0;
  }
  *a6 = v12;
  return self->_inputData;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6
{
  int v8;
  int v9;
  CFTypeRef cf;

  if (!a3)
    return -108;
  cf = 0;
  Scaler::Scale(&self->_scaler, a4, (__CVBuffer **)&cf, *(uint64_t *)&a6, *(uint64_t *)&a5, 1111970369);
  v9 = v8;
  if (!v8)
    v9 = -[VCPCNNPetsDetectorV2 copyImage:toData:](self, "copyImage:toData:", cf, a3);
  if (cf)
    CFRelease(cf);
  return v9;
}

- (void)nonMaxSuppression:(id)a3
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  float v10;
  BOOL v11;
  unint64_t v12;
  void *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  double v18;
  id v19;

  v19 = a3;
  v3 = objc_msgSend(v19, "count");
  if (v3)
  {
    v4 = 0;
    do
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setFlag:", v6);

      ++v4;
    }
    while (v3 != v4);
    if (v3)
    {
      v7 = 0;
      v8 = 1;
      do
      {
        objc_msgSend(v19, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "flag");
        v11 = v10 == 1.0 && v3 > ++v7;
        v12 = v8;
        if (v11)
        {
          do
          {
            objc_msgSend(v19, "objectAtIndexedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "flag");
            if (v14 == 1.0)
            {
              objc_msgSend(v9, "computeIntersectionOverUnion:", v13);
              if (v15 > 0.45)
              {
                objc_msgSend(v9, "confidence");
                v17 = v16;
                objc_msgSend(v13, "confidence");
                if (v17 <= *(float *)&v18)
                {
                  LODWORD(v18) = 0;
                  objc_msgSend(v9, "setFlag:", v18);

                  break;
                }
                LODWORD(v18) = 0;
                objc_msgSend(v13, "setFlag:", v18);
              }
            }

            ++v12;
          }
          while (v3 > v12);
        }

        ++v8;
      }
      while (v7 != v3);
    }
  }

}

- (int)retrieveBoxes:(float *)a3 outHeight:(int)a4 outWidth:(int)a5 boxes:(id)a6 anchorBox:(float)a7[3][2]
{
  unsigned __int8 v9;
  int v10;
  uint64_t v11;
  float *v12;
  int v13;
  int v14;
  int v15;
  float v16;
  int v17;
  float *v18;
  float v19;
  int v20;
  float *v21;
  float v22;
  int cnnInputWidth;
  float *v24;
  float v25;
  float *v26;
  float v27;
  float *v28;
  float v29;
  float v30;
  int numClass;
  unsigned int v32;
  uint64_t v33;
  float *v34;
  float v35;
  float v36;
  VCPBoundingBox *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  VCPBoundingBox *v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  float *v51;
  uint64_t v52;
  int v53;
  int v54;
  double v55;
  double v56;
  uint64_t v57;
  id v61;
  int v62;
  float v63;
  int cnnInputHeight;
  uint64_t v65;

  v61 = a6;
  if ((v9 & 1) == 0
  {
    -[VCPCNNPetsDetectorV2 retrieveBoxes:outHeight:outWidth:boxes:anchorBox:]::kAnchorStride = self->_numClass + 5;
  }
  if (a4 >= 1)
  {
    v53 = 0;
    v10 = a5 * a4;
    v57 = a5 * a4;
    v55 = (double)a4;
    v56 = (double)a5;
    v49 = a4;
    v65 = a5;
    v51 = &a3[4 * a5 * a4];
    v52 = 0;
    v47 = a5;
    v48 = 4 * a5;
    v50 = a5;
    v54 = a5 * a4;
    do
    {
      if (a5 >= 1)
      {
        v11 = 0;
        v12 = v51;
        v62 = v52 * v47;
        v13 = -[VCPCNNPetsDetectorV2 retrieveBoxes:outHeight:outWidth:boxes:anchorBox:]::kAnchorStride;
        v14 = v53;
        do
        {
          v15 = 0;
          v16 = 0.0;
          v17 = -1;
          v18 = v12;
          do
          {
            v19 = 1.0 / (float)(expf(-*v18) + 1.0);
            if (v19 > v16)
            {
              v16 = v19;
              v17 = v15;
            }
            ++v15;
            v18 += v13 * v10;
          }
          while (v15 != 3);
          if (v16 > 0.45)
          {
            v20 = v17 * v10 * v13;
            v21 = &a3[(int)v11 + v62 + v20];
            v22 = expf(-*v21);
            cnnInputWidth = self->_cnnInputWidth;
            v24 = &v21[v57];
            v25 = expf(-*v24);
            cnnInputHeight = self->_cnnInputHeight;
            v26 = &v24[v57];
            v27 = expf(-*v26);
            v28 = &(*a7)[2 * v17];
            v63 = *v28;
            v29 = expf(-v26[v57]);
            v30 = v28[1];
            numClass = self->_numClass;
            if (numClass < 1)
            {
              v33 = 0;
              v35 = -1.0;
            }
            else
            {
              v32 = 0;
              LODWORD(v33) = 0;
              v34 = &a3[4 * v57 + v14 + v20];
              v35 = -1.0;
              do
              {
                v36 = v16 * (float)(1.0 / (float)(expf(-*v34) + 1.0));
                if (v36 <= v35)
                {
                  v33 = v33;
                }
                else
                {
                  v35 = v36;
                  v33 = v32;
                }
                ++v32;
                v34 += v57;
              }
              while (numClass != v32);
            }
            v37 = [VCPBoundingBox alloc];
            v38 = ((double)(int)v11 + (float)(1.0 / (float)(v22 + 1.0)) * 2.0 + -0.5) * (double)cnnInputWidth / v56;
            *(float *)&v38 = v38;
            v39 = ((double)(int)v52 + (float)(1.0 / (float)(v25 + 1.0)) * 2.0 + -0.5) * (double)cnnInputHeight / v55;
            *(float *)&v39 = v39;
            v40 = (float)((float)(1.0 / (float)(v27 + 1.0)) + (float)(1.0 / (float)(v27 + 1.0)));
            v41 = v40 * v40 * v63;
            *(float *)&v41 = v41;
            v42 = (float)((float)(1.0 / (float)(v29 + 1.0)) + (float)(1.0 / (float)(v29 + 1.0)));
            v43 = v30;
            v44 = v42 * v42 * v30;
            *(float *)&v44 = v44;
            if (numClass >= 2)
              *(float *)&v43 = v35;
            else
              *(float *)&v43 = 1.0;
            *(float *)&v43 = v16 * *(float *)&v43;
            v45 = -[VCPBoundingBox initWithCenterAndSize:y:width:height:confidence:](v37, "initWithCenterAndSize:y:width:height:confidence:", v38, v39, v41, v44, v43, v47);
            -[VCPBoundingBox setClassIndex:](v45, "setClassIndex:", v33);
            objc_msgSend(v61, "addObject:", v45);

            v13 = -[VCPCNNPetsDetectorV2 retrieveBoxes:outHeight:outWidth:boxes:anchorBox:]::kAnchorStride;
            v10 = v54;
          }
          ++v11;
          ++v12;
          ++v14;
        }
        while (v11 != v65);
      }
      v51 = (float *)((char *)v51 + v48);
      ++v52;
      a5 = v50;
      v53 += v50;
    }
    while (v52 != v49);
  }

  return 0;
}

- (int)generatePetsRegions:(const void *)a3 boxes:(id)a4 maxNumRegions:(int)a5
{
  id v8;
  uint64_t v9;
  char *v10;
  void *v11;
  float v12;
  uint64_t v13;

  v8 = a4;
  v9 = *(_QWORD *)a3;
  if (*(_QWORD *)a3 != *((_QWORD *)a3 + 1))
  {
    v10 = (char *)&kAnchorBoxes;
    do
    {
      -[VCPCNNPetsDetectorV2 retrieveBoxes:outHeight:outWidth:boxes:anchorBox:](self, "retrieveBoxes:outHeight:outWidth:boxes:anchorBox:", *(_QWORD *)v9, *(unsigned int *)(v9 + 88), *(unsigned int *)(v9 + 80), v8, v10);
      v10 += 24;
      v9 += 168;
    }
    while (v9 != *((_QWORD *)a3 + 1));
  }
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_156_0);
  -[VCPCNNPetsDetectorV2 nonMaxSuppression:](self, "nonMaxSuppression:", v8);
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_157);
  while (objc_msgSend(v8, "count") > (unint64_t)a5)
    objc_msgSend(v8, "removeLastObject");
  objc_msgSend(v8, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    do
    {
      objc_msgSend(v11, "flag");
      if (v12 != 0.0)
        break;
      objc_msgSend(v8, "removeLastObject");
      objc_msgSend(v8, "lastObject");
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    while (v13);

  }
  return 0;
}

uint64_t __64__VCPCNNPetsDetectorV2_generatePetsRegions_boxes_maxNumRegions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v6, "confidence");
  v9 = v8;
  objc_msgSend(v7, "confidence");
  if (v9 <= v10)
    v11 = 1;
  else
    v11 = -1;

  return v11;
}

uint64_t __64__VCPCNNPetsDetectorV2_generatePetsRegions_boxes_maxNumRegions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  uint64_t v26;
  float v27;
  float v28;
  float v29;
  uint64_t v30;
  float v32;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v6, "maxX");
  v32 = v8;
  objc_msgSend(v6, "minX");
  v10 = v9;
  objc_msgSend(v6, "maxY");
  v12 = v11;
  objc_msgSend(v6, "minY");
  v14 = v13;
  objc_msgSend(v7, "maxX");
  v16 = v15;
  objc_msgSend(v7, "minX");
  v18 = v17;
  objc_msgSend(v7, "maxY");
  v20 = v19;
  objc_msgSend(v7, "minY");
  v22 = v21;
  objc_msgSend(v6, "flag");
  v24 = v23;
  objc_msgSend(v7, "flag");
  if (v24 <= v25)
  {
    objc_msgSend(v6, "flag");
    v28 = v27;
    objc_msgSend(v7, "flag");
    v30 = -1;
    if ((float)((float)(v32 - v10) * (float)(v12 - v14)) <= (float)((float)(v16 - v18) * (float)(v20 - v22)))
      v30 = 1;
    if (v28 >= v29)
      v26 = v30;
    else
      v26 = 1;
  }
  else
  {
    v26 = -1;
  }

  return v26;
}

- (int)generatePetsBoxes:(id)a3
{
  id v4;
  int v5;
  VCPCNNModelEspresso *modelEspresso;
  void *__p;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", self->_inputData);
  if (!v5)
  {
    modelEspresso = self->_modelEspresso;
    if (modelEspresso)
    {
      -[VCPCNNModelEspresso outputBlobs](modelEspresso, "outputBlobs");
    }
    else
    {
      __p = 0;
      v9 = 0;
      v10 = 0;
    }
    v5 = -[VCPCNNPetsDetectorV2 generatePetsRegions:boxes:maxNumRegions:](self, "generatePetsRegions:boxes:maxNumRegions:", &__p, v4, self->_maxNumRegions);
    if (__p)
    {
      v9 = __p;
      operator delete(__p);
    }
  }

  return v5;
}

- (int)petsDetection:(__CVBuffer *)a3 petsRegions:(id)a4 petsFaceRegions:(id)a5 cancel:(id)a6
{
  int v6;
  id v11;
  id v12;
  void *v13;
  int v14;
  size_t Width;
  size_t Height;
  size_t v17;
  int v18;
  float *v19;
  int v20;
  void *v22;
  __int128 v23;
  unint64_t v24;
  void *v25;
  int v26;
  float v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  int numClass;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  void *v47;
  void *context;
  id v49;
  uint64_t v50;
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  uint8_t buf[4];
  int v56;
  __int16 v57;
  double v58;
  uint64_t v59;
  NSRect v60;
  NSRect v61;

  v59 = *MEMORY[0x1E0C80C00];
  v49 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v12 && ((*((uint64_t (**)(id))v12 + 2))(v12) & 1) != 0)
  {
    v14 = -128;
LABEL_13:
    v6 = v14;
    goto LABEL_14;
  }
  context = (void *)MEMORY[0x1BCCA1B2C]();
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v17 = Height;
  v50 = 0;
  if ((int)Height >= (int)Width)
    v18 = Width;
  else
    v18 = Height;
  if (v18 < 224)
  {
    v14 = 0;
LABEL_11:
    v20 = 4;
    goto LABEL_12;
  }
  v14 = -[VCPCNNPetsDetectorV2 createModel:srcWidth:](self, "createModel:srcWidth:", Height, Width);
  if (v14)
    goto LABEL_11;
  v19 = -[VCPCNNPetsDetectorV2 getInputBuffer:srcWidth:cnnInputHeight:cnnInputWidth:](self, "getInputBuffer:srcWidth:cnnInputHeight:cnnInputWidth:", v17, Width, &v50, (char *)&v50 + 4);
  v14 = -[VCPCNNPetsDetectorV2 createInput:withBuffer:cnnInputHeight:cnnInputWidth:](self, "createInput:withBuffer:cnnInputHeight:cnnInputWidth:", v19, a3, v50, HIDWORD(v50));
  if (v14)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VCPCNNPetsDetectorV2 generatePetsBoxes:](self, "generatePetsBoxes:", v22);
  if (v6)
  {
    v20 = 1;
  }
  else
  {
    v47 = v22;
    v24 = 0;
    *(_QWORD *)&v23 = 67109376;
    v46 = v23;
    while (objc_msgSend(v47, "count", v46) > v24)
    {
      objc_msgSend(v47, "objectAtIndexedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v26 = objc_msgSend(v25, "classIndex");
        objc_msgSend(v25, "confidence");
        *(_DWORD *)buf = v46;
        v56 = v26;
        v57 = 2048;
        v58 = v27;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "CNNPetsDetectorV2: pet class index : %d, confidence = %f", buf, 0x12u);
      }
      objc_msgSend(v25, "confidence");
      if (*(float *)&v28 >= 0.3)
      {
        *(float *)&v28 = (float)(HIDWORD(v50) - 1);
        *(float *)&v29 = (float)(v50 - 1);
        objc_msgSend(v25, "getCGRectWithClipWidth:height:", v28, v29);
        v31 = v30;
        v33 = v32;
        v35 = v34;
        v37 = v36;
        numClass = objc_msgSend(v25, "classIndex");
        if (!numClass)
          numClass = self->_numClass;
        v39 = (numClass - 1);
        if (v39 > 1)
        {
          v51[0] = CFSTR("petsBounds");
          v61.origin.x = v31;
          v61.origin.y = v33;
          v61.size.width = v35;
          v61.size.height = v37;
          NSStringFromRect(v61);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = v40;
          v51[1] = CFSTR("petsConfidence");
          v45 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "confidence");
          objc_msgSend(v45, "numberWithFloat:");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v52[1] = v42;
          v51[2] = CFSTR("petsType");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v39);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v52[2] = v43;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v44);
        }
        else
        {
          v53[0] = CFSTR("petsBounds");
          v60.origin.x = v31;
          v60.origin.y = v33;
          v60.size.width = v35;
          v60.size.height = v37;
          NSStringFromRect(v60);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v54[0] = v40;
          v53[1] = CFSTR("petsConfidence");
          v41 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "confidence");
          objc_msgSend(v41, "numberWithFloat:");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v54[1] = v42;
          v53[2] = CFSTR("petsType");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v39);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v54[2] = v43;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 3);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v44);
        }

      }
      ++v24;
    }
    v20 = 0;
    v22 = v47;
  }

  v14 = 0;
LABEL_12:
  objc_autoreleasePoolPop(context);
  if ((v20 | 4) == 4)
    goto LABEL_13;
LABEL_14:

  return v6;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_DWORD *)self + 22) = 0;
  return self;
}

@end
