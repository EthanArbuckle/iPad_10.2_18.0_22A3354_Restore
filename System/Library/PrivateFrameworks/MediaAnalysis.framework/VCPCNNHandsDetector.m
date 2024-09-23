@implementation VCPCNNHandsDetector

+ (id)detector:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6 revision:(int)a7
{
  uint64_t v7;
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v10;
  id v11;
  void *v12;

  v7 = *(_QWORD *)&a7;
  v8 = a5;
  v9 = a4;
  v10 = *(_QWORD *)&a3;
  v11 = a6;
  if (+[VCPCNNHandsDetector detector:forceCPU:sharedModel:inputConfig:revision:]::once != -1)
    dispatch_once(&+[VCPCNNHandsDetector detector:forceCPU:sharedModel:inputConfig:revision:]::once, &__block_literal_global_69);
  v12 = (void *)objc_msgSend(objc_alloc((Class)+[VCPCNNHandsDetector detector:forceCPU:sharedModel:inputConfig:revision:]::analyzerClass), "initWithMaxNumRegions:forceCPU:sharedModel:inputConfig:revision:", v10, v9, v8, v11, v7);

  return v12;
}

uint64_t __74__VCPCNNHandsDetector_detector_forceCPU_sharedModel_inputConfig_revision___block_invoke()
{
  uint64_t result;

  result = objc_opt_class();
  +[VCPCNNHandsDetector detector:forceCPU:sharedModel:inputConfig:revision:]::analyzerClass = result;
  return result;
}

- (VCPCNNHandsDetector)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6 revision:(int)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  __CFString *v12;
  NSArray *outputNames;
  VCPCNNHandsDetector *v14;
  VCPCNNHandsDetector *v15;
  void *v16;
  void *v17;
  void *v18;
  VCPCNNModelEspresso *v19;
  NSArray *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNHandsDetector *v26;
  VCPCNNModelEspresso *v28;
  VCPCNNModelEspresso *v29;
  uint64_t v30;
  VCPCNNModelEspresso *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  size_t v35;
  VCPCNNModelEspresso *v36;
  VCPCNNModelEspresso *v37;
  int v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v42;
  uint8_t buf[4];
  const __CFString *v44;
  int v45;
  uint64_t v46;
  _QWORD v47[2];
  _QWORD v48[5];

  v8 = a5;
  v9 = a4;
  v48[2] = *MEMORY[0x1E0C80C00];
  v12 = (__CFString *)a6;
  self->_maxNumRegions = a3;
  self->_numClass = 2;
  self->_revision = a7;
  outputNames = self->_outputNames;
  self->_outputNames = (NSArray *)&unk_1E6B76848;

  v42.receiver = self;
  v42.super_class = (Class)VCPCNNHandsDetector;
  v14 = -[VCPCNNHandsDetector init](&v42, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resourceURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v44 = CFSTR("cnn_hand_detector_v2.espresso.net");
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "CNNHandsDetector: Loading model %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_hand_detector_v2.espresso.net"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = [VCPCNNModelEspresso alloc];
    v20 = v14->_outputNames;
    v47[0] = CFSTR("forceCPU");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v21;
    v47[1] = CFSTR("sharedContext");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:](v19, "initWithParameters:inputNames:outputNames:properties:", v18, 0, v20, v23);
    modelEspresso = v14->_modelEspresso;
    v14->_modelEspresso = (VCPCNNModelEspresso *)v24;

    if (!v14->_modelEspresso)
      goto LABEL_10;
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "CNNHandsDetector: adopting model config: %@", buf, 0xCu);
    }
    if (-[VCPCNNModelEspresso prepareModelWithConfig:](v14->_modelEspresso, "prepareModelWithConfig:", v12))
    {
LABEL_10:

LABEL_11:
      v15 = 0;
      goto LABEL_12;
    }
    v28 = v14->_modelEspresso;
    if (v28 && (-[VCPCNNModelEspresso inputBlob](v28, "inputBlob"), (v29 = v14->_modelEspresso) != 0))
    {
      v30 = v46;
      -[VCPCNNModelEspresso inputBlob](v29, "inputBlob");
      v31 = v14->_modelEspresso;
      v32 = v41 * v30;
      if (v31)
      {
        -[VCPCNNModelEspresso inputBlob](v31, "inputBlob");
        v33 = v40;
        goto LABEL_19;
      }
    }
    else
    {
      v32 = 0;
    }
    v33 = 0;
LABEL_19:
    v34 = v32 * v33;
    if (v34 >> 62)
      v35 = -1;
    else
      v35 = 4 * v34;
    v14->_inputData = (float *)operator new[](v35, MEMORY[0x1E0DE4E10]);
    v36 = v14->_modelEspresso;
    if (v36)
    {
      -[VCPCNNModelEspresso inputBlob](v36, "inputBlob");
      v37 = v14->_modelEspresso;
      v14->_cnnInputHeight = v46;
      if (v37)
      {
        -[VCPCNNModelEspresso inputBlob](v37, "inputBlob");
        v38 = v45;
      }
      else
      {
        v38 = 0;
      }
    }
    else
    {
      v38 = 0;
      v14->_cnnInputHeight = 0;
    }
    v14->_cnnInputWidth = v38;
    v39 = v14->_inputData == 0;

    if (!v39)
    {
      v15 = v14;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_12:
  v26 = v15;

  return v26;
}

- (int)updateModelWithResConfig:(id)a3
{
  id v4;
  int v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_modelEspresso)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "CNNHandsDetectorEspresso: updating model config to %@", (uint8_t *)&v7, 0xCu);
    }
    v5 = -[VCPCNNHandsDetector createModelWithResConfig:](self, "createModelWithResConfig:", v4);
  }
  else
  {
    v5 = -108;
  }

  return v5;
}

- (void)dealloc
{
  float *inputData;
  objc_super v4;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  self->_inputData = 0;
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNHandsDetector;
  -[VCPCNNHandsDetector dealloc](&v4, sel_dealloc);
}

- (int)createModelWithResConfig:(id)a3
{
  id v4;
  float *inputData;
  int v6;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v8;
  VCPCNNModelEspresso *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  size_t v13;
  VCPCNNModelEspresso *v14;
  VCPCNNModelEspresso *v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  v4 = a3;
  inputData = self->_inputData;
  if (inputData)
  {
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
    self->_inputData = 0;
  }
  v6 = -[VCPCNNModelEspresso prepareModelWithConfig:](self->_modelEspresso, "prepareModelWithConfig:", v4);
  if (!v6)
  {
    modelEspresso = self->_modelEspresso;
    if (modelEspresso
      && (-[VCPCNNModelEspresso inputBlob](modelEspresso, "inputBlob"), (v8 = self->_modelEspresso) != 0))
    {
      -[VCPCNNModelEspresso inputBlob](v8, "inputBlob");
      v9 = self->_modelEspresso;
      v10 = v19 * v21;
      if (v9)
      {
        -[VCPCNNModelEspresso inputBlob](v9, "inputBlob");
        v11 = v18;
LABEL_10:
        v12 = v10 * v11;
        if (v12 >> 62)
          v13 = -1;
        else
          v13 = 4 * v12;
        self->_inputData = (float *)operator new[](v13, MEMORY[0x1E0DE4E10]);
        v14 = self->_modelEspresso;
        if (v14)
        {
          -[VCPCNNModelEspresso inputBlob](v14, "inputBlob");
          v15 = self->_modelEspresso;
          self->_cnnInputWidth = v20;
          if (v15)
          {
            -[VCPCNNModelEspresso inputBlob](v15, "inputBlob");
            v16 = v21;
          }
          else
          {
            v16 = 0;
          }
        }
        else
        {
          v16 = 0;
          self->_cnnInputWidth = 0;
        }
        self->_cnnInputHeight = v16;
        if (self->_inputData)
          v6 = 0;
        else
          v6 = -108;
        goto LABEL_21;
      }
    }
    else
    {
      v10 = 0;
    }
    v11 = 0;
    goto LABEL_10;
  }
LABEL_21:

  return v6;
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
  float v25;
  int v26;
  float *v27;
  float *v28;
  uint64_t v29;
  uint64_t i;
  float v31;
  float v32;
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
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "copyImageToBGRHandDetectorCallFromSPI", ", buf, 2u);
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
              v31 = (float)LODWORD(v25);
              a4[i] = v31;
              LOBYTE(v31) = BaseAddress[(int)(i * 4) + 1];
              v32 = (float)LODWORD(v31);
              v28[i] = v32;
              LOBYTE(v32) = BaseAddress[(int)(i * 4)];
              v25 = (float)LODWORD(v32);
              v27[i] = v25;
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
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v34, OS_SIGNPOST_INTERVAL_END, v7, "copyImageToBGRHandDetectorCallFromSPI", ", v36, 2u);
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

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4
{
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t buf[8];
  CFTypeRef cf;

  if (!a3)
    return -108;
  cf = 0;
  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "scalerHandDetectorCallFromSPI", ", buf, 2u);
  }

  Scaler::Scale(&self->_scaler, a4, (__CVBuffer **)&cf, self->_cnnInputWidth, self->_cnnInputHeight, 1111970369);
  v12 = v11;
  if (!v11)
  {
    VCPSignPostLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)v16 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v14, OS_SIGNPOST_INTERVAL_END, v8, "scalerHandDetectorCallFromSPI", ", v16, 2u);
    }

    v12 = -[VCPCNNHandsDetector copyImage:toData:](self, "copyImage:toData:", cf, a3);
  }
  if (cf)
    CFRelease(cf);
  return v12;
}

- (int)updateMaxNumRegions:(int)a3
{
  self->_maxNumRegions = a3;
  return 0;
}

- (int)generateHandsBoxes:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  VCPCNNModelEspresso *modelEspresso;
  void *__p;
  void *v15;
  uint64_t v16;

  v4 = a3;
  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(__p) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "inferenceHandDetectorCallFromSPI", ", (uint8_t *)&__p, 2u);
  }

  v9 = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", self->_inputData);
  if (!v9)
  {
    VCPSignPostLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(__p) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_END, v6, "inferenceHandDetectorCallFromSPI", ", (uint8_t *)&__p, 2u);
    }

    modelEspresso = self->_modelEspresso;
    if (modelEspresso)
    {
      -[VCPCNNModelEspresso outputBlobs](modelEspresso, "outputBlobs");
    }
    else
    {
      __p = 0;
      v15 = 0;
      v16 = 0;
    }
    v9 = -[VCPCNNHandsDetector generateHandsRegions:boxes:maxNumRegions:](self, "generateHandsRegions:boxes:maxNumRegions:", &__p, v4, self->_maxNumRegions);
    if (__p)
    {
      v15 = __p;
      operator delete(__p);
    }
  }

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
              if (v15 > 0.6)
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
  float v11;
  uint64_t v12;
  float *v13;
  int v14;
  int v15;
  int v16;
  float v17;
  int v18;
  float *v19;
  float v20;
  int v21;
  float *v22;
  float v23;
  float *v24;
  float v25;
  float *v26;
  float v27;
  float *v28;
  float v29;
  float v30;
  int numClass;
  int v32;
  int v33;
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
  VCPBoundingBox *v46;
  unsigned int v47;
  uint64_t v48;
  int v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  float *v54;
  uint64_t v55;
  int v56;
  int v57;
  double v58;
  double v59;
  uint64_t v60;
  id v63;
  float v64;
  int cnnInputHeight;
  int cnnInputWidth;
  uint64_t v67;

  v63 = a6;
  if ((v9 & 1) == 0
  {
    -[VCPCNNHandsDetector retrieveBoxes:outHeight:outWidth:boxes:anchorBox:]::kAnchorStride = self->_numClass + 5;
  }
  if (a4 >= 1)
  {
    v56 = 0;
    v10 = a5 * a4;
    v60 = a5 * a4;
    v58 = (double)a4;
    v59 = (double)a5;
    v52 = a4;
    v53 = a5;
    v67 = a5;
    v54 = &a3[4 * a5 * a4];
    v55 = 0;
    v50 = a5;
    v51 = 4 * a5;
    v11 = 0.5;
    v57 = a5 * a4;
    do
    {
      if (a5 >= 1)
      {
        v12 = 0;
        v13 = v54;
        v14 = -[VCPCNNHandsDetector retrieveBoxes:outHeight:outWidth:boxes:anchorBox:]::kAnchorStride;
        v15 = v56;
        do
        {
          v16 = 0;
          v17 = 0.0;
          v18 = -1;
          v19 = v13;
          do
          {
            v20 = 1.0 / (float)(expf(-*v19) + 1.0);
            if (v20 > v17)
            {
              v17 = v20;
              v18 = v16;
            }
            ++v16;
            v19 += v14 * v10;
          }
          while (v16 != 3);
          if (v17 > v11)
          {
            v21 = v18 * v10 * v14;
            v22 = &a3[(int)v12 + (int)v55 * v50 + v21];
            v23 = expf(-*v22);
            cnnInputWidth = self->_cnnInputWidth;
            v24 = &v22[v60];
            v25 = expf(-*v24);
            cnnInputHeight = self->_cnnInputHeight;
            v26 = &v24[v60];
            v27 = expf(-*v26);
            v28 = &(*a7)[2 * v18];
            v64 = *v28;
            v29 = expf(-v26[v60]);
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
              v33 = 0;
              v34 = &a3[4 * v60 + v15 + v21];
              v35 = -1.0;
              do
              {
                v36 = v17 * (float)(1.0 / (float)(expf(-*v34) + 1.0));
                if (v36 > v35)
                {
                  v35 = v36;
                  v33 = v32;
                }
                ++v32;
                v34 += v60;
              }
              while (numClass != v32);
            }
            v37 = [VCPBoundingBox alloc];
            v38 = ((double)(int)v12 + (float)(1.0 / (float)(v23 + 1.0)) * 2.0 + -0.5) * (double)cnnInputWidth / v59;
            *(float *)&v38 = v38;
            v39 = ((double)(int)v55 + (float)(1.0 / (float)(v25 + 1.0)) * 2.0 + -0.5) * (double)cnnInputHeight / v58;
            *(float *)&v39 = v39;
            v40 = (float)((float)(1.0 / (float)(v27 + 1.0)) + (float)(1.0 / (float)(v27 + 1.0)));
            v41 = v40 * v40 * v64;
            *(float *)&v41 = v41;
            v42 = (float)((float)(1.0 / (float)(v29 + 1.0)) + (float)(1.0 / (float)(v29 + 1.0)));
            v43 = v30;
            v44 = v42 * v42 * v30;
            *(float *)&v44 = v44;
            if (numClass >= 2)
              *(float *)&v43 = v35;
            else
              *(float *)&v43 = 1.0;
            *(float *)&v43 = v17 * *(float *)&v43;
            v45 = -[VCPBoundingBox initWithCenterAndSize:y:width:height:confidence:](v37, "initWithCenterAndSize:y:width:height:confidence:", v38, v39, v41, v44, v43);
            v46 = v45;
            if (v33)
              v47 = -1;
            else
              v47 = 1;
            if (self->_numClass >= 2)
              v48 = v47;
            else
              v48 = 0;
            -[VCPBoundingBox setClassIndex:](v45, "setClassIndex:", v48);
            objc_msgSend(v63, "addObject:", v46);

            v14 = -[VCPCNNHandsDetector retrieveBoxes:outHeight:outWidth:boxes:anchorBox:]::kAnchorStride;
            v10 = v57;
            v11 = 0.5;
          }
          ++v12;
          ++v13;
          ++v15;
        }
        while (v12 != v67);
      }
      v54 = (float *)((char *)v54 + v51);
      ++v55;
      a5 = v53;
      v56 += v53;
    }
    while (v55 != v52);
  }

  return 0;
}

- (int)generateHandsRegions:(const void *)a3 boxes:(id)a4 maxNumRegions:(int)a5
{
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  float v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  __int16 v21[8];
  uint8_t buf[16];

  v8 = a4;
  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  VCPSignPostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "postProcessingHandDetectorCallFromSPI", ", buf, 2u);
  }

  v13 = *(_QWORD *)a3;
  if (*(_QWORD *)a3 != *((_QWORD *)a3 + 1))
  {
    v14 = (char *)&kAnchorBoxes;
    do
    {
      -[VCPCNNHandsDetector retrieveBoxes:outHeight:outWidth:boxes:anchorBox:](self, "retrieveBoxes:outHeight:outWidth:boxes:anchorBox:", *(_QWORD *)v13, *(unsigned int *)(v13 + 88), *(unsigned int *)(v13 + 80), v8, v14);
      v14 += 24;
      v13 += 168;
    }
    while (v13 != *((_QWORD *)a3 + 1));
  }
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_20);
  -[VCPCNNHandsDetector nonMaxSuppression:](self, "nonMaxSuppression:", v8);
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_21_0);
  while (objc_msgSend(v8, "count") > (unint64_t)a5)
    objc_msgSend(v8, "removeLastObject");
  objc_msgSend(v8, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    do
    {
      objc_msgSend(v15, "flag");
      if (v16 != 0.0)
        break;
      objc_msgSend(v8, "removeLastObject");
      objc_msgSend(v8, "lastObject");
      v17 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v17;
    }
    while (v17);
  }
  VCPSignPostLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v21[0] = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v19, OS_SIGNPOST_INTERVAL_END, v10, "postProcessingHandDetectorCallFromSPI", ", (uint8_t *)v21, 2u);
  }

  return 0;
}

uint64_t __64__VCPCNNHandsDetector_generateHandsRegions_boxes_maxNumRegions___block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __64__VCPCNNHandsDetector_generateHandsRegions_boxes_maxNumRegions___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (int)drawLine:(char *)a3 width:(int)a4 height:(int)a5 stride:(int)a6 point0:(CGPoint)a7 point1:(CGPoint)a8 drawPoint:(int)a9
{
  int x;
  int v10;
  int y;
  int v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  float v38;
  float v39;
  float v40;
  float v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  uint64_t v50;
  char *v51;

  x = (int)a7.x;
  v10 = (int)a8.x;
  y = (int)a7.y;
  v12 = (int)a8.y;
  v13 = (int)a8.x - (int)a7.x;
  v14 = (int)a8.y - (int)a7.y;
  if (v13 >= 0)
    v15 = (int)a8.x - (int)a7.x;
  else
    v15 = (int)a7.x - (int)a8.x;
  if (v14 >= 0)
    v16 = (int)a8.y - (int)a7.y;
  else
    v16 = (int)a7.y - (int)a8.y;
  if (v15 <= v16)
    v15 = v16;
  if (a9)
  {
    if (y <= 5)
      v17 = 5;
    else
      v17 = (int)a7.y;
    v18 = v17 - 5;
    v19 = y + 5;
    if (y + 5 >= a5 - 1)
      v19 = a5 - 1;
    if (v18 < v19)
    {
      if (x <= 5)
        v20 = 5;
      else
        v20 = x;
      v21 = v20 - 5;
      v22 = a4 - 1;
      if (x + 5 < a4 - 1)
        v22 = x + 5;
      v23 = a6 * v18 + 4 * v20 - 19;
      v24 = v22 - v20 + 5;
      do
      {
        v25 = v24;
        v26 = v23;
        if (v21 < v22)
        {
          do
          {
            a3[v26] = -1;
            a3[v26 + 1] = -1;
            v26 += 4;
            --v25;
          }
          while (v25);
        }
        ++v18;
        v23 += a6;
      }
      while (v18 != v19);
    }
    if (v12 <= 5)
      v27 = 5;
    else
      v27 = (int)a8.y;
    v28 = v27 - 5;
    v29 = v12 + 5;
    if (v29 >= a5 - 1)
      v29 = a5 - 1;
    if (v28 < v29)
    {
      if (v10 <= 5)
        v30 = 5;
      else
        v30 = v10;
      v31 = v30 - 5;
      v32 = v10 + 5;
      if (v32 >= a4 - 1)
        v32 = a4 - 1;
      v33 = a6 * v28 + 4 * v30 - 19;
      v34 = v32 - v30 + 5;
      do
      {
        v35 = v34;
        v36 = v33;
        if (v31 < v32)
        {
          do
          {
            a3[v36] = -1;
            a3[v36 + 1] = -1;
            v36 += 4;
            --v35;
          }
          while (v35);
        }
        ++v28;
        v33 += a6;
      }
      while (v28 != v29);
    }
  }
  if (v15)
  {
    v37 = 0;
    v38 = (float)x;
    v39 = (float)v15;
    v40 = (float)y;
    v41 = (float)v14;
    do
    {
      v42 = (int)(float)((float)((float)((float)v13 * (float)v37) / v39) + v38);
      v43 = (int)(float)((float)((float)(v41 * (float)v37) / v39) + v40);
      if (v42 >= a4 - 1)
        v44 = a4 - 1;
      else
        v44 = (int)(float)((float)((float)((float)v13 * (float)v37) / v39) + v38);
      if (v43 >= a5 - 1)
        v45 = a5 - 1;
      else
        v45 = (int)(float)((float)((float)(v41 * (float)v37) / v39) + v40);
      if (v43 <= 0)
        v46 = 0;
      else
        v46 = v45;
      v47 = 4 * v44;
      v48 = v46 * a6;
      if (v42 <= 0)
        v49 = 0;
      else
        v49 = v47;
      v50 = v48 + (uint64_t)v49;
      v51 = &a3[(int)v50];
      v51[2] = -1;
      a3[v50] = 0;
      v51[1] = 0;
      ++v37;
    }
    while (v15 != v37);
  }
  return 0;
}

- (int)drawRectangle:(char *)a3 width:(int)a4 height:(int)a5 stride:(int)a6 keypoints:(CGPoint *)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  for (i = 0; i != 3; ++i)
    -[VCPCNNHandsDetector drawLine:width:height:stride:point0:point1:drawPoint:](self, "drawLine:width:height:stride:point0:point1:drawPoint:", a3, v10, v9, v8, 0, a7[i].x, a7[i].y, a7[i + 1].x, a7[i + 1].y);
  -[VCPCNNHandsDetector drawLine:width:height:stride:point0:point1:drawPoint:](self, "drawLine:width:height:stride:point0:point1:drawPoint:", a3, v10, v9, v8, 0, a7[3].x, a7[3].y, a7->x, a7->y);
  return 0;
}

- (int)handsDetection:(__CVBuffer *)a3 handsRegions:(id)a4 cancel:(id)a5
{
  int v5;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  __int128 v16;
  unint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  int v22;
  __int128 v24;
  uint8_t buf[4];
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10 && ((*((uint64_t (**)(id))v10 + 2))(v10) & 1) != 0)
  {
    v12 = -128;
LABEL_19:
    v5 = v12;
    goto LABEL_20;
  }
  v13 = (void *)MEMORY[0x1BCCA1B2C]();
  CVPixelBufferGetBaseAddress(a3);
  CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferGetWidthOfPlane(a3, 0);
  CVPixelBufferGetHeightOfPlane(a3, 0);
  v12 = -[VCPCNNHandsDetector createInput:withBuffer:](self, "createInput:withBuffer:", self->_inputData, a3);
  if (v12)
  {
    v14 = 4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[VCPCNNHandsDetector generateHandsBoxes:](self, "generateHandsBoxes:", v15);
    if (v5)
    {
      v12 = 0;
      v14 = 1;
    }
    else
    {
      v17 = 0;
      *(_QWORD *)&v16 = 67109120;
      v24 = v16;
      while (1)
      {
        if (objc_msgSend(v15, "count", v24) <= v17)
        {
          v14 = 0;
          v12 = 0;
          goto LABEL_17;
        }
        objc_msgSend(v15, "objectAtIndexedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v22 = objc_msgSend(v18, "classIndex");
          *(_DWORD *)buf = v24;
          v26 = v22;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "CNNHandsDetector: hand class index: %d", buf, 8u);
        }
        *(float *)&v20 = (float)self->_cnnInputWidth;
        *(float *)&v21 = (float)self->_cnnInputHeight;
        LODWORD(v19) = 1028443341;
        v12 = objc_msgSend(v18, "extendBoxBy:scaleX:scaleY:", v19, v20, v21);
        if (v12)
          break;
        objc_msgSend(v9, "addObject:", v18);

        ++v17;
      }

      v14 = 4;
    }
LABEL_17:

  }
  objc_autoreleasePoolPop(v13);
  if ((v14 | 4) == 4)
    goto LABEL_19;
LABEL_20:

  return v5;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_DWORD *)self + 18) = 0;
  return self;
}

@end
