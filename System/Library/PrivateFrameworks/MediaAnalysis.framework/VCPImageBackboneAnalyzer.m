@implementation VCPImageBackboneAnalyzer

+ (id)sharedModel:(id)a3 identifier:(id)a4 outputNames:(id)a5 inputNames:(id)a6 functionName:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __87__VCPImageBackboneAnalyzer_sharedModel_identifier_outputNames_inputNames_functionName___block_invoke;
  v23[3] = &unk_1E6B16800;
  v17 = v11;
  v24 = v17;
  v18 = v13;
  v25 = v18;
  v19 = v14;
  v26 = v19;
  v20 = v15;
  v27 = v20;
  objc_msgSend(v16, "sharedInstanceWithIdentifier:andCreationBlock:", v12, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

VCPCNNModelEspressoV2 *__87__VCPImageBackboneAnalyzer_sharedModel_identifier_outputNames_inputNames_functionName___block_invoke(_QWORD *a1)
{
  return -[VCPCNNModelEspressoV2 initWithParameters:outputNames:inputNames:functionName:]([VCPCNNModelEspressoV2 alloc], "initWithParameters:outputNames:inputNames:functionName:", a1[4], a1[5], a1[6], a1[7]);
}

- (VCPImageBackboneAnalyzer)initWithRequestedAnalyses:(unint64_t)a3 andRevision:(id)a4 useSharedModel:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  VCPImageBackboneAnalyzer *v12;
  VCPImageBackboneAnalyzer *v13;
  VCPEspressoV2Data *inputData;
  VCPTransforms *v15;
  VCPTransforms *transformImage;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  VCPCNNModelEspressoV2 *v25;
  int v26;
  VCPCNNModelEspressoV2 *modelEspressoV2;
  double v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  VCPImageBackboneAnalyzer *v32;
  VCPImageBackboneAnalyzer *v33;
  objc_super v35;
  uint8_t buf[4];
  int v37;
  uint64_t v38;

  v5 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPPhotoAnalyzer_Image_VCPImageBackboneInit", ", buf, 2u);
  }

  self->_isFP16 = 0;
  self->_revision = +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision");
  if (!v7)
    goto LABEL_8;
  if (objc_msgSend(v7, "intValue") == 4 || objc_msgSend(v7, "intValue") == 5)
  {
    self->_revision = (int)objc_msgSend(v7, "intValue");
LABEL_8:
    v35.receiver = self;
    v35.super_class = (Class)VCPImageBackboneAnalyzer;
    v12 = -[VCPImageBackboneAnalyzer init](&v35, sel_init);
    v13 = v12;
    if (v12)
    {
      v12->_inputWidth = 352;
      v12->_inputHeight = 352;
      inputData = v12->_inputData;
      v12->_inputData = 0;

      v15 = -[VCPTransforms initImageTransform:transformedImageWidth:transformedImageHeight:]([VCPTransforms alloc], "initImageTransform:transformedImageWidth:transformedImageHeight:", 128, v13->_inputWidth, v13->_inputHeight);
      transformImage = v13->_transformImage;
      v13->_transformImage = v15;

      objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "resourceURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13->_revision == 5)
        v19 = CFSTR("mubb_md5");
      else
        v19 = CFSTR("mubb_md4");
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v19, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13->_revision);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("image_backbone"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend((id)objc_opt_class(), "sharedModel:identifier:outputNames:inputNames:functionName:", v20, v24, &unk_1E6B76260, &unk_1E6B76278, CFSTR("main_image"));
        v25 = (VCPCNNModelEspressoV2 *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = -[VCPCNNModelEspressoV2 initWithParameters:outputNames:inputNames:functionName:]([VCPCNNModelEspressoV2 alloc], "initWithParameters:outputNames:inputNames:functionName:", v20, &unk_1E6B76260, &unk_1E6B76290, CFSTR("main_image"));
      }
      modelEspressoV2 = v13->_modelEspressoV2;
      v13->_modelEspressoV2 = v25;

      if (v13->_modelEspressoV2)
      {
        LODWORD(v28) = 1.0;
        v26 = -[VCPImageBackboneAnalyzer configForAspectRatio:](v13, "configForAspectRatio:", v28);
      }
      else
      {
        v26 = -108;
      }

      self = v13;
    }
    else
    {
      v26 = 0;
      self = 0;
    }
    goto LABEL_24;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v29 = objc_msgSend(v7, "intValue");
    *(_DWORD *)buf = 67109120;
    v37 = v29;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPImageBackboneAnalyzer] revision %d is not supported", buf, 8u);
  }
  v26 = -18;
LABEL_24:
  VCPSignPostLog();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v31, OS_SIGNPOST_INTERVAL_END, v9, "VCPPhotoAnalyzer_Image_VCPImageBackboneInit", ", buf, 2u);
  }

  if (v26)
    v32 = 0;
  else
    v32 = self;
  v33 = v32;

  return v33;
}

- (int)configForAspectRatio:(float)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  VCPEspressoV2Data *v10;
  VCPEspressoV2Data *inputData;

  -[VCPCNNModelEspressoV2 inputsSize](self->_modelEspressoV2, "inputsSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  if (v6 != 3 * self->_inputHeight * self->_inputWidth)
    return -50;
  -[VCPCNNModelEspressoV2 inputsType](self->_modelEspressoV2, "inputsType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  v10 = -[VCPEspressoV2Data initWithTensorType:size:]([VCPEspressoV2Data alloc], "initWithTensorType:size:", v9, v6);
  inputData = self->_inputData;
  self->_inputData = v10;

  if (self->_inputData)
    return 0;
  else
    return -108;
}

- (int)prepareInput:(__CVBuffer *)a3 withChannels:(int)a4 settling:(BOOL)a5
{
  unint64_t v8;
  int v9;
  int Width;
  int Height;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  float v20;
  int inputHeight;
  int inputWidth;
  __CVBuffer *v23;
  __CVBuffer *v24;
  CVReturn v25;
  _BYTE *BaseAddress;
  int BytesPerRow;
  double v28;
  int v29;
  int v30;
  BOOL v31;
  char v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  unsigned int v41;
  double v42;
  unsigned int v43;
  double v44;
  __CVBuffer *v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  int v51;
  int v52;
  CVReturn v53;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  uint8_t buf[4];
  __CVBuffer *v57;
  __int16 v58;
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = self->_revision - 3;
  if (v8 >= 3)
    v9 = 14;
  else
    v9 = 11;
  v48 = v9;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (a4 != 3)
    return -50;
  v12 = (float)Width;
  v13 = (float)Height;
  if ((float)((float)Height * 1.2) >= (float)Width)
  {
    if ((float)(v12 * 1.2) >= v13)
    {
      v15 = *MEMORY[0x1E0C9D648];
      v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      v20 = v12 / v13;
      v18 = (float)((float)(Height - Width) / (float)(v13 + v13));
      v17 = v20;
      v16 = 1.0;
      v15 = 0.0;
    }
  }
  else
  {
    v14 = v13 / v12;
    v15 = (float)((float)(Width - Height) / (float)(v12 + v12));
    v16 = v14;
    v17 = 1.0;
    v18 = 0.0;
  }
  inputHeight = self->_inputHeight;
  inputWidth = self->_inputWidth;
  v23 = -[VCPTransforms cropAndScale:regionCrop:](self->_transformImage, "cropAndScale:regionCrop:", a3, v15, v18, v16, v17);
  if (!v23)
    return -18;
  v24 = v23;
  pixelBuffer = v23;
  unlockFlags = 1;
  v25 = CVPixelBufferLockBaseAddress(v23, 1uLL);
  v53 = v25;
  if (!v25
    || (v19 = v25, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    && (*(_DWORD *)buf = 134218240,
        v57 = v24,
        v58 = 1024,
        v59 = v19,
        _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v19 = v53) == 0))
  {
    BaseAddress = CVPixelBufferGetBaseAddress(v24);
    BytesPerRow = CVPixelBufferGetBytesPerRow(v24);
    v46 = v24;
    v29 = self->_inputHeight;
    if (v29 >= 1)
    {
      v30 = 0;
      v50 = inputWidth * (uint64_t)inputHeight;
      v31 = v8 >= 3;
      if (v8 >= 3)
        v32 = 4;
      else
        v32 = 5;
      if (v31)
        v33 = 15;
      else
        v33 = 31;
      v52 = v33;
      if (v31)
        v34 = 196;
      else
        v34 = 121;
      v51 = v34;
      v47 = BytesPerRow;
      LODWORD(v35) = self->_inputWidth;
      do
      {
        if ((int)v35 >= 1)
        {
          v36 = 0;
          v37 = (v30 >> v32) * v48;
          v49 = v30;
          v38 = (v30 & v52) << v32;
          v39 = 1;
          do
          {
            LOBYTE(v28) = BaseAddress[v39 + 1];
            v40 = (v36 >> v32) + v37 + ((v52 & v36) + v38) * v51;
            *(float *)&v28 = (float)((float)((float)LODWORD(v28) / 255.0) + -0.48145) / 0.26863;
            -[VCPEspressoV2Data setValueFP:atIndex:](self->_inputData, "setValueFP:atIndex:", v40, v28);
            LOBYTE(v41) = BaseAddress[v39];
            *(float *)&v42 = (float)((float)((float)v41 / 255.0) + -0.45783) / 0.2613;
            -[VCPEspressoV2Data setValueFP:atIndex:](self->_inputData, "setValueFP:atIndex:", v40 + v50, v42);
            LOBYTE(v43) = BaseAddress[v39 - 1];
            *(float *)&v44 = (float)((float)((float)v43 / 255.0) + -0.40821) / 0.27578;
            -[VCPEspressoV2Data setValueFP:atIndex:](self->_inputData, "setValueFP:atIndex:", v40 + 2 * (int)v50, v44);
            ++v36;
            v35 = self->_inputWidth;
            v39 += 4;
          }
          while (v36 < v35);
          v29 = self->_inputHeight;
          v30 = v49;
        }
        BaseAddress += v47;
        ++v30;
      }
      while (v30 < v29);
    }
    v19 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v53);
    v24 = v46;
  }
  CFRelease(v24);
  if (pixelBuffer
    && !v53
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
  }
  return v19;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  VCPCNNModelEspressoV2 *modelEspressoV2;
  uint64_t v21;
  CMTimeValue value;
  NSData *v23;
  NSData *embedding;
  VCPCNNModelEspressoV2 *v25;
  uint64_t v26;
  CMTimeValue v27;
  unint64_t v29;
  NSData *v30;
  NSData *spatialEmbedding;
  NSData *v32;
  NSData *hiddenEmbedding;
  NSData *v34;
  NSData *v35;
  void *v36;
  CMTime *v37;
  CFDictionaryRef v38;
  CFDictionaryRef v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CMTime *p_buf;
  CMTime buf;
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[3];
  _QWORD v49[3];
  void *v50;
  const __CFString *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  VCPSignPostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "VCPPhotoAnalyzer_Image_VCPImageBackbonePreProcess", ", (uint8_t *)&buf, 2u);
  }

  v13 = -[VCPImageBackboneAnalyzer prepareInput:withChannels:settling:](self, "prepareInput:withChannels:settling:", a3, 3, 0);
  if (!v13)
  {
    VCPSignPostLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
    {
      LOWORD(buf.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v15, OS_SIGNPOST_INTERVAL_END, v10, "VCPPhotoAnalyzer_Image_VCPImageBackbonePreProcess", ", (uint8_t *)&buf, 2u);
    }

    -[VCPCNNModelEspressoV2 inputsType](self->_modelEspressoV2, "inputsType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntValue");

    v13 = -[VCPCNNModelEspressoV2 espressoForward:](self->_modelEspressoV2, "espressoForward:", -[VCPEspressoV2Data getData:](self->_inputData, "getData:", v18));
    if (!v13)
    {
      -[VCPCNNModelEspressoV2 outputsSize](self->_modelEspressoV2, "outputsSize");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count"))
      {
        modelEspressoV2 = self->_modelEspressoV2;
        if (modelEspressoV2)
        {
          -[VCPCNNModelEspressoV2 outputs](modelEspressoV2, "outputs");
          value = buf.value;
          v21 = *(_QWORD *)&buf.timescale;
          p_buf = &buf;
          std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
          if (v21 != value)
          {
            -[VCPCNNModelEspressoV2 outputs](self->_modelEspressoV2, "outputs");
            +[VCPVideoTransformerBackbone getNSDataFromOuput:isFP16:](VCPVideoTransformerBackbone, "getNSDataFromOuput:isFP16:", *(_QWORD *)buf.value, 0);
            v23 = (NSData *)objc_claimAutoreleasedReturnValue();
            embedding = self->_embedding;
            self->_embedding = v23;

            p_buf = &buf;
            std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
            if ((self->_revision & 0xFFFFFFFFFFFFFFFELL) != 4)
              goto LABEL_23;
            if ((unint64_t)objc_msgSend(v19, "count") >= 3)
            {
              v25 = self->_modelEspressoV2;
              if (v25)
              {
                -[VCPCNNModelEspressoV2 outputs](v25, "outputs");
                v27 = buf.value;
                v26 = *(_QWORD *)&buf.timescale;
              }
              else
              {
                v27 = 0;
                v26 = 0;
                memset(&buf, 0, sizeof(buf));
              }
              v29 = v26 - v27;
              p_buf = &buf;
              std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
              if (v29 >= 0x18)
              {
                -[VCPCNNModelEspressoV2 outputs](self->_modelEspressoV2, "outputs");
                +[VCPVideoTransformerBackbone getNSDataFromOuput:isFP16:](VCPVideoTransformerBackbone, "getNSDataFromOuput:isFP16:", *(_QWORD *)(buf.value + 8), 0);
                v30 = (NSData *)objc_claimAutoreleasedReturnValue();
                spatialEmbedding = self->_spatialEmbedding;
                self->_spatialEmbedding = v30;

                p_buf = &buf;
                std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
                -[VCPCNNModelEspressoV2 outputs](self->_modelEspressoV2, "outputs");
                +[VCPVideoTransformerBackbone getNSDataFromOuput:isFP16:](VCPVideoTransformerBackbone, "getNSDataFromOuput:isFP16:", *(_QWORD *)(buf.value + 16), 0);
                v32 = (NSData *)objc_claimAutoreleasedReturnValue();
                hiddenEmbedding = self->_hiddenEmbedding;
                self->_hiddenEmbedding = v32;

                p_buf = &buf;
                std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
LABEL_23:
                if (!self->_bypassNormalizaton && self->_revision == 3)
                {
                  +[VCPTextEncoder applyL2Norm:isFP16:](VCPTextEncoder, "applyL2Norm:isFP16:", self->_embedding, 0);
                  v34 = (NSData *)objc_claimAutoreleasedReturnValue();
                  v35 = self->_embedding;
                  self->_embedding = v34;

                }
                +[VCPTextEncoder convertFloat32ToFloat16:](VCPTextEncoder, "convertFloat32ToFloat16:", self->_embedding);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = CFSTR("ImageEmbeddingResults");
                v48[0] = CFSTR("start");
                v37 = (CMTime *)MEMORY[0x1E0CA2E68];
                buf = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
                v38 = CMTimeCopyAsDictionary(&buf, 0);
                v49[0] = v38;
                v48[1] = CFSTR("duration");
                buf = *v37;
                v39 = CMTimeCopyAsDictionary(&buf, 0);
                v49[1] = v39;
                v48[2] = CFSTR("attributes");
                v47[0] = v36;
                v46[0] = CFSTR("embeddings");
                v46[1] = CFSTR("embeddingVersion");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[VCPVideoTransformerBackbone embeddingVersionForRevision:](VCPVideoTransformerBackbone, "embeddingVersionForRevision:", self->_revision));
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v47[1] = v40;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v49[2] = v41;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = v42;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v52[0] = v43;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
                *a5 = (id)objc_claimAutoreleasedReturnValue();

                v13 = 0;
                goto LABEL_18;
              }
            }
          }
        }
        else
        {
          memset(&buf, 0, sizeof(buf));
          p_buf = &buf;
          std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
        }
      }
      v13 = 1;
LABEL_18:

    }
  }
  return v13;
}

- (BOOL)isFP16
{
  return self->_isFP16;
}

- (NSData)embedding
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (NSData)spatialEmbedding
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (NSData)hiddenEmbedding
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)bypassNormalizaton
{
  return self->_bypassNormalizaton;
}

- (void)setBypassNormalizaton:(BOOL)a3
{
  self->_bypassNormalizaton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenEmbedding, 0);
  objc_storeStrong((id *)&self->_spatialEmbedding, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
  objc_storeStrong((id *)&self->_modelEspressoV2, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_transformImage, 0);
}

@end
