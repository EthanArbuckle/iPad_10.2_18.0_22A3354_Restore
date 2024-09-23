@implementation VCPVideoFaceMeshAnalyzer

- (VCPVideoFaceMeshAnalyzer)initWithFocalLengthInPixels:(float)a3 offline:(BOOL)a4 isFastMode:(BOOL)a5
{
  _BOOL8 v5;
  VCPVideoFaceMeshAnalyzer *v8;
  VCPVideoFaceMeshAnalyzer *v9;
  VCPFaceShapeModel *v10;
  VCPFaceShapeModel *shapeModel;
  VCPFaceShapeModel *v12;
  void *v13;
  void *v14;
  VCPRTLandmarkDetector *v15;
  VCPRTLandmarkDetector *lmDetector;
  VCPRTLandmarkDetector *v17;
  VCPRTLandmarkDetector *lmTracker;
  dispatch_queue_t v19;
  OS_dispatch_queue *validationQueue;
  dispatch_group_t v21;
  OS_dispatch_group *validationGroup;
  id v23;
  FILE *v24;
  uint64_t v25;
  size_t v26;
  void *v27;
  id v28;
  FILE *v29;
  unint64_t v30;
  BOOL v31;
  void *v32;
  void *v33;
  VCPLandmarkValidator *v34;
  VCPLandmarkValidator **v35;
  VCPLandmarkValidator *v36;
  VCPVideoFaceMeshAnalyzer *v37;
  VCPVideoFaceMeshAnalyzer *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned __int8 __ptr;
  objc_super v46;
  uint64_t v47;
  int v48;
  uint64_t v49;

  v5 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)VCPVideoFaceMeshAnalyzer;
  v8 = -[VCPVideoFaceMeshAnalyzer init](&v46, sel_init);
  v9 = v8;
  if (!v8)
  {
LABEL_19:
    v37 = v9;
    goto LABEL_20;
  }
  v8->_focalLengthInPixels = a3;
  v8->_offline = a4;
  v8->_initialized = 0;
  v8->_vertexCount = 0;
  *(_QWORD *)v8->_meshVertices = 0;
  v10 = -[VCPFaceShapeModel initWithMode:]([VCPFaceShapeModel alloc], "initWithMode:", v5);
  shapeModel = v9->_shapeModel;
  v9->_shapeModel = v10;

  v12 = v9->_shapeModel;
  if (v12 && -[VCPFaceShapeModel vertexCount](v12, "vertexCount"))
  {
    v9->_vertexCount = -[VCPFaceShapeModel vertexCount](v9->_shapeModel, "vertexCount");
    v13 = (void *)operator new[]();
    *(_QWORD *)v9->_meshVertices = v13;
    bzero(v13, 16 * v9->_vertexCount);
    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resourceURL");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("regressiontree_landmark.dat"), v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("rtree_landmark_tracking.dat"), v44);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[VCPRTLandmarkDetector initFromConfigFile:numStage:numLandmarks:numTreePerStage:depthOfTree:numFeatures:]([VCPRTLandmarkDetector alloc], "initFromConfigFile:numStage:numLandmarks:numTreePerStage:depthOfTree:numFeatures:", v43, 15, 68, 500, 5, 500);
    lmDetector = v9->_lmDetector;
    v9->_lmDetector = v15;

    v17 = -[VCPRTLandmarkDetector initFromConfigFile:numStage:numLandmarks:numTreePerStage:depthOfTree:numFeatures:]([VCPRTLandmarkDetector alloc], "initFromConfigFile:numStage:numLandmarks:numTreePerStage:depthOfTree:numFeatures:", v42, 10, 68, 500, 5, 400);
    lmTracker = v9->_lmTracker;
    v9->_lmTracker = v17;

    if (v9->_lmDetector
      && v9->_lmTracker
      && (v9->_prevLM = (float *)operator new[](), v9->_curLM = (float *)operator new[](), v9->_prevLM))
    {
      v9->_validationScore = 1.0;
      v9->_validateFailedOnce = 0;
      v9->_trackingModeCounter = 0;
      v9->_lostTrackCounter = 0;
      v9->_valBuffer = 0;
      v19 = dispatch_queue_create("com.apple.mediaanalysisd.VCPVideoFaceValidation", 0);
      validationQueue = v9->_validationQueue;
      v9->_validationQueue = (OS_dispatch_queue *)v19;

      v21 = dispatch_group_create();
      validationGroup = v9->_validationGroup;
      v9->_validationGroup = (OS_dispatch_group *)v21;

      v9->_inDetectionMode = 1;
      v9->_detectionModeCounter = 0;
      v9->_valLM = (float *)operator new[]();
      *(_QWORD *)v9->_eulerAngle = 0;
      v9->_eulerAngle[2] = 0.0;
      __ptr = 0;
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("face_validation_warp_tri_list.dat"), v44);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "path");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v24 = fopen((const char *)objc_msgSend(v23, "UTF8String"), "rb");

      if (fread(&__ptr, 1uLL, 1uLL, v24) == 1)
      {
        v25 = __ptr;
        v26 = 3 * __ptr;
        v27 = (void *)operator new[]();
        fread(v27, 1uLL, v26, v24);
        fclose(v24);
        v48 = 0;
        v47 = 0;
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("face_validation_warp_params.dat"), v44);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "path");
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v29 = fopen((const char *)objc_msgSend(v28, "UTF8String"), "rb");

        v30 = 0;
        v31 = 0;
        while (1)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d.dat"), CFSTR("face_validation_warp"), v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v32, v44);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          HIDWORD(v47) = dword_1B6FBF7A8[v30];
          v34 = -[VCPLandmarkValidator initWithModelFile:paramFile:numTri:triList:angle:]([VCPLandmarkValidator alloc], "initWithModelFile:paramFile:numTri:triList:angle:", v33, v29, v25, v27, &v47);
          v35 = &v9->_faceValidator[v30];
          v36 = *v35;
          *v35 = v34;

          LOBYTE(v35) = *v35 == 0;
          if ((v35 & 1) != 0)
            break;
          v31 = v30++ > 3;
          if (v30 == 5)
          {

            v31 = 1;
            goto LABEL_16;
          }
        }

LABEL_16:
        if (v29)
          fclose(v29);
        MEMORY[0x1BCCA128C](v27, 0x1000C8077774924);
        if (v31)
          goto LABEL_19;
      }
      else
      {

      }
    }
    else
    {

    }
  }
  v37 = 0;
LABEL_20:
  v38 = v37;

  return v38;
}

- (BOOL)updateFocalLengthInPixels:(float)a3
{
  VCPFaceShapeModel *shapeModel;

  self->_focalLengthInPixels = a3;
  shapeModel = self->_shapeModel;
  if (shapeModel)
    -[VCPFaceShapeModel updateFocalLengthInPixels:](shapeModel, "updateFocalLengthInPixels:");
  return 1;
}

- (void)updateIntrinsicWhenRotated
{
  float uc;

  uc = self->_uc;
  self->_uc = self->_vc;
  self->_vc = uc;
  -[VCPFaceShapeModel updateIntrinsic:vc:](self->_shapeModel, "updateIntrinsic:vc:");
  self->_bufferRotated ^= 1u;
}

- (int)setFrame:(__CVBuffer *)a3
{
  int Width;
  int Height;
  double v8;

  if (self->_initialized)
    return -18;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  self->_uc = (float)Width * 0.5;
  self->_vc = (float)Height * 0.5;
  self->_bufferRotated = 0;
  *(float *)&v8 = self->_focalLengthInPixels;
  return -[VCPFaceShapeModel setCameraIntrinsics:uc:vc:](self->_shapeModel, "setCameraIntrinsics:uc:vc:", v8);
}

- (void)dealloc
{
  float *prevLM;
  float *curLM;
  float *valLM;
  uint64_t v6;
  __CVBuffer *valBuffer;
  __CVBuffer *valBufferRotated;
  objc_super v9;

  prevLM = self->_prevLM;
  if (prevLM)
    MEMORY[0x1BCCA128C](prevLM, 0x1000C8052888210);
  curLM = self->_curLM;
  if (curLM)
    MEMORY[0x1BCCA128C](curLM, 0x1000C8052888210);
  valLM = self->_valLM;
  if (valLM)
    MEMORY[0x1BCCA128C](valLM, 0x1000C8052888210);
  v6 = *(_QWORD *)self->_meshVertices;
  if (v6)
    MEMORY[0x1BCCA128C](v6, 0x1000C80451B5BE8);
  valBuffer = self->_valBuffer;
  if (valBuffer)
    CFRelease(valBuffer);
  valBufferRotated = self->_valBufferRotated;
  if (valBufferRotated)
    CFRelease(valBufferRotated);
  v9.receiver = self;
  v9.super_class = (Class)VCPVideoFaceMeshAnalyzer;
  -[VCPVideoFaceMeshAnalyzer dealloc](&v9, sel_dealloc);
}

- (void)makeValidationDecision
{
  float v2;
  float validationScore;
  BOOL v4;

  if (fabsf(self->_eulerAngle[1]) <= 10.0)
    v2 = flt_1B6FBF798[fabsf(self->_eulerAngle[2]) > 10.0];
  else
    v2 = 0.1;
  validationScore = self->_validationScore;
  v4 = validationScore >= v2 || !self->_validateFailedOnce;
  if (v4 && validationScore >= 0.015)
  {
    if (validationScore < 0.2)
      self->_validateFailedOnce = 1;
  }
  else
  {
    self->_inDetectionMode = 1;
    *(_QWORD *)&self->_detectionModeCounter = 0;
    ++self->_lostTrackCounter;
  }
}

- (int)validateFace:(__CVBuffer *)a3 eulerAngles:(float *)a4
{
  size_t BytesPerRowOfPlane;
  int HeightOfPlane;
  size_t v9;
  int v10;
  uint64_t BaseAddressOfPlane;
  uint64_t v13;
  __CVBuffer *v14;
  __CVBuffer *v15;
  CVReturn v16;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *validationGroup;
  NSObject *validationQueue;
  _QWORD v43[7];
  CVReturn v44;
  CVPixelBufferRef v45;
  CVPixelBufferLockFlags v46;
  uint8_t buf[4];
  _BYTE pixelBuffer[20];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  v9 = CVPixelBufferGetBytesPerRowOfPlane(self->_valBuffer, 0);
  v10 = CVPixelBufferGetHeightOfPlane(self->_valBuffer, 0);
  if (self->_bufferRotated)
  {
    v9 = CVPixelBufferGetBytesPerRowOfPlane(self->_valBufferRotated, 0);
    v10 = CVPixelBufferGetHeightOfPlane(self->_valBufferRotated, 0);
  }
  if (BytesPerRowOfPlane != v9 || HeightOfPlane != v10)
    goto LABEL_7;
  v13 = 136;
  if (!self->_bufferRotated)
    v13 = 128;
  v14 = (__CVBuffer *)CFRetain(*(CFTypeRef *)((char *)&self->super.isa + v13));
  v44 = 0;
  v45 = v14;
  v46 = 0;
  if (!v14)
  {
    v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v18)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
LABEL_7:
    LODWORD(BaseAddressOfPlane) = -50;
    return BaseAddressOfPlane;
  }
  v15 = v14;
  v16 = CVPixelBufferLockBaseAddress(v14, 0);
  v44 = v16;
  if (!v16
    || (LODWORD(BaseAddressOfPlane) = v16, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    && (*(_DWORD *)buf = 134218240,
        *(_QWORD *)pixelBuffer = v15,
        *(_WORD *)&pixelBuffer[8] = 1024,
        *(_DWORD *)&pixelBuffer[10] = BaseAddressOfPlane,
        _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (LODWORD(BaseAddressOfPlane) = v44) == 0))
  {
    *(_QWORD *)&pixelBuffer[4] = a3;
    *(_QWORD *)&pixelBuffer[12] = 1;
    if (a3)
    {
      BaseAddressOfPlane = CVPixelBufferLockBaseAddress(a3, 1uLL);
      *(_DWORD *)buf = BaseAddressOfPlane;
      if ((_DWORD)BaseAddressOfPlane)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[VCPImageConverter convertImage:yuvFrame:].cold.3((uint64_t)a3, BaseAddressOfPlane, v26, v27, v28, v29, v30, v31);
      }
      else
      {
        BaseAddressOfPlane = (uint64_t)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
        v40 = CVPixelBufferGetBaseAddressOfPlane(v15, 0);
        memcpy(v40, (const void *)BaseAddressOfPlane, HeightOfPlane * BytesPerRowOfPlane);
        LODWORD(BaseAddressOfPlane) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
        if (!(_DWORD)BaseAddressOfPlane)
        {
          LODWORD(BaseAddressOfPlane) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v44);
          if (!(_DWORD)BaseAddressOfPlane)
          {
            memcpy(self->_valLM, self->_curLM, 0x1F8uLL);
            validationQueue = self->_validationQueue;
            validationGroup = self->_validationGroup;
            v43[0] = MEMORY[0x1E0C809B0];
            v43[1] = 3221225472;
            v43[2] = __53__VCPVideoFaceMeshAnalyzer_validateFace_eulerAngles___block_invoke;
            v43[3] = &unk_1E6B19CC8;
            v43[4] = self;
            v43[5] = a4;
            v43[6] = v15;
            dispatch_group_async(validationGroup, validationQueue, v43);
            CFRelease(v15);
            LODWORD(BaseAddressOfPlane) = 0;
          }
        }
      }
    }
    else
    {
      v32 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v32)
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v32, v33, v34, v35, v36, v37, v38, v39);
      LODWORD(BaseAddressOfPlane) = -50;
      *(_DWORD *)buf = -50;
    }
    if (*(_QWORD *)&pixelBuffer[4]
      && !*(_DWORD *)buf
      && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)&pixelBuffer[4], *(CVPixelBufferLockFlags *)&pixelBuffer[12])&& os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
    }
    if (v45
      && !v44
      && CVPixelBufferUnlockBaseAddress(v45, v46)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
    }
  }
  return BaseAddressOfPlane;
}

_BYTE *__53__VCPVideoFaceMeshAnalyzer_validateFace_eulerAngles___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  float v5;
  uint64_t v6;
  float v7;
  float v8;
  uint64_t v9;
  int v10;
  int v11;
  _BYTE *result;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a1[5];
  if (v2)
  {
    v3 = 0;
    v4 = 0;
    v5 = 3.4028e38;
    do
    {
      v6 = 0;
      v7 = 0.0;
      do
      {
        v8 = *(float *)(a1[5] + v6);
        v9 = objc_msgSend(*(id *)(a1[4] + 8 * v3 + 176), "orientation");
        v7 = v7 + (float)((float)(v8 - *(float *)(v9 + v6)) * (float)(v8 - *(float *)(v9 + v6)));
        v6 += 4;
      }
      while (v6 != 12);
      if (v7 < v5)
      {
        v5 = v7;
        v4 = v3;
      }
      ++v3;
    }
    while (v3 != 5);
    v2 = v4;
  }
  v10 = objc_msgSend(*(id *)(a1[4] + 8 * v2 + 176), "validateOneImage:landmarks:numofLandmarks:score:", a1[6], *(_QWORD *)(a1[4] + 152), 63, a1[4] + 104);
  if (v10)
  {
    v11 = v10;
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13[0] = 67109120;
      v13[1] = v11;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPLandmarkValidator failed to validate image (%d)", (uint8_t *)v13, 8u);
    }
    *(_DWORD *)(a1[4] + 104) = 0;
  }
  result = (_BYTE *)a1[4];
  if (!result[48])
    return (_BYTE *)objc_msgSend(result, "makeValidationDecision");
  return result;
}

- (int)checkResolutionChange:(__CVBuffer *)a3 withRotation:(int)a4
{
  size_t BytesPerRowOfPlane;
  int Width;
  int HeightOfPlane;
  __CVBuffer **p_valBuffer;
  size_t v11;
  int v12;
  __CVBuffer *valBufferRotated;
  OSType PixelFormatType;
  int v16;
  int v17;
  const __CFAllocator *v18;
  size_t v19;
  size_t v20;

  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  Width = CVPixelBufferGetWidth(a3);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  p_valBuffer = &self->_valBuffer;
  v11 = CVPixelBufferGetBytesPerRowOfPlane(self->_valBuffer, 0);
  v12 = CVPixelBufferGetHeightOfPlane(self->_valBuffer, 0);
  if (a4 == 270 || a4 == 90)
    -[VCPVideoFaceMeshAnalyzer updateIntrinsicWhenRotated](self, "updateIntrinsicWhenRotated");
  if (self->_bufferRotated)
  {
    v11 = CVPixelBufferGetBytesPerRowOfPlane(self->_valBufferRotated, 0);
    v12 = CVPixelBufferGetHeightOfPlane(self->_valBufferRotated, 0);
  }
  if (BytesPerRowOfPlane == v11 && HeightOfPlane == v12)
    return 0;
  if (*p_valBuffer)
    CFRelease(*p_valBuffer);
  valBufferRotated = self->_valBufferRotated;
  if (valBufferRotated)
    CFRelease(valBufferRotated);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (self->_bufferRotated)
    v16 = HeightOfPlane;
  else
    v16 = Width;
  if (self->_bufferRotated)
    v17 = Width;
  else
    v17 = HeightOfPlane;
  v18 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v19 = v16;
  v20 = v17;
  if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v16, v17, PixelFormatType, 0, &self->_valBuffer)
    && !CVPixelBufferCreate(v18, v20, v19, PixelFormatType, 0, &self->_valBufferRotated))
  {
    self->_uc = (float)Width * 0.5;
    self->_vc = (float)HeightOfPlane * 0.5;
    -[VCPFaceShapeModel updateIntrinsic:vc:](self->_shapeModel, "updateIntrinsic:vc:");
    return 0;
  }
  return -108;
}

- (BOOL)isTracked
{
  return self->_initialized && self->_lostTrackCounter < 5;
}

- (void)rotateLandmarks:(int)a3 width:(int)a4 height:(int)a5 landmarks:(float *)a6 numLandmarks:(int)a7
{
  float32x2_t *v9;
  float32x2_t *v12;
  uint64_t v13;
  float *v14;
  float *v15;
  int v16;
  uint64_t v17;
  float *v18;
  float *v19;
  float v20;
  float32x2_t v21;
  uint64_t v22;
  float32x2_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (a3 && a3 != 360)
  {
    v9 = (float32x2_t *)a6;
    v12 = (float32x2_t *)((char *)v24 - ((4 * (2 * a7) + 15) & 0x7FFFFFFF0));
    memcpy(v12, a6, 8 * a7);
    if (a3 == 270)
    {
      if (a7 >= 1)
      {
        v17 = a7;
        v18 = (float *)v12 + 1;
        v19 = (float *)v9 + 1;
        do
        {
          v20 = (float)(a5 - 1) - *(v18 - 1);
          *(v19 - 1) = *v18;
          *v19 = v20;
          v18 += 2;
          v19 += 2;
          --v17;
        }
        while (v17);
      }
    }
    else if (a3 == 180)
    {
      if (a7 >= 1)
      {
        v21 = vcvt_f32_s32(vadd_s32((int32x2_t)__PAIR64__(a5, a4), (int32x2_t)-1));
        v22 = a7;
        do
        {
          v23 = *v12++;
          *v9++ = vsub_f32(v21, v23);
          --v22;
        }
        while (v22);
      }
    }
    else if (a3 == 90 && a7 >= 1)
    {
      v13 = a7;
      v14 = (float *)v12 + 1;
      v15 = (float *)v9 + 1;
      do
      {
        v16 = *((_DWORD *)v14 - 1);
        *(v15 - 1) = (float)(a4 - 1) - *v14;
        *(_DWORD *)v15 = v16;
        v14 += 2;
        v15 += 2;
        --v13;
      }
      while (v13);
    }
  }
}

- (int)analyzeFrame:(__CVBuffer *)a3 withFaceRect:(CGRect)a4 withRotation:(int)a5 withTimestamp:(id *)a6
{
  uint64_t v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSDictionary *blendShapes;
  uint64_t v14;
  CGPoint v15;
  __int128 v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CVReturn v20;
  size_t BytesPerRowOfPlane;
  size_t v22;
  size_t v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  double v29;
  char v30;
  OSType PixelFormatType;
  OSType v32;
  int lostTrackCounter;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  CGPoint v51;
  CGSize v52;
  __int128 v53;
  unint64_t vertexCount;
  void *v55;
  BOOL v56;
  void *v57;
  void *v58;
  NSDictionary *v59;
  NSDictionary *v60;
  float *curLM;
  double v63;
  int v64;
  char v65;
  VCPFaceShapeModel *shapeModel;
  _BOOL4 v67;
  BOOL v68;
  int v69;
  float validationScore;
  float *prevLM;
  int v72;
  int v73;
  float *v74;
  int v75;
  int v76;
  CGAffineTransform v77;
  uint8_t buf[4];
  _BYTE pixelBuffer[20];
  int v80;
  CVPixelBufferRef v81;
  CVPixelBufferLockFlags v82;
  _DWORD v83[4];
  uint8_t v84[4];
  uint64_t v85;
  __int16 v86;
  CVReturn v87;
  uint64_t v88;
  CGRect v89;
  CGRect v90;

  v6 = *(_QWORD *)&a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v88 = *MEMORY[0x1E0C80C00];
  blendShapes = self->_blendShapes;
  self->_blendShapes = 0;

  v14 = MEMORY[0x1E0C83FF0];
  v15 = *(CGPoint *)(MEMORY[0x1E0C83FF0] + 16);
  *(_OWORD *)&self[1].super.isa = *MEMORY[0x1E0C83FF0];
  self[1]._faceBounds.origin = v15;
  v16 = *(_OWORD *)(v14 + 48);
  self[1]._faceBounds.size = *(CGSize *)(v14 + 32);
  *(_OWORD *)&self[1]._inDetectionMode = v16;
  v17 = x;
  *(CGFloat *)&v16 = y;
  v18 = width;
  v19 = height;
  if (CGRectIsEmpty(*(CGRect *)((char *)&v16 - 8)) && self->_inDetectionMode)
  {
    v20 = 0;
    ++self->_lostTrackCounter;
    return v20;
  }
  self->_faceCount = 1;
  if (self->_initialized)
  {
    -[VCPVideoFaceMeshAnalyzer checkResolutionChange:withRotation:](self, "checkResolutionChange:withRotation:", a3, v6);
  }
  else
  {
    v20 = -[VCPVideoFaceMeshAnalyzer setFrame:](self, "setFrame:", a3);
    if (v20)
      return v20;
    self->_initialized = 1;
  }
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v22 = CVPixelBufferGetWidth(a3);
  v23 = CVPixelBufferGetHeight(a3);
  if (!self->_valBuffer)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (int)v22, (int)v23, PixelFormatType, 0, &self->_valBuffer))
    {
      return -108;
    }
  }
  if (!self->_valBufferRotated)
  {
    v32 = CVPixelBufferGetPixelFormatType(a3);
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (int)v23, (int)v22, v32, 0, &self->_valBufferRotated))
    {
      return -108;
    }
  }
  v77.b = 0.0;
  v77.c = 0.0;
  v77.a = (double)(int)v22;
  v77.d = (double)-(int)v23;
  v77.tx = 0.0;
  v77.ty = (double)(int)v23;
  v89.origin.x = x;
  v89.origin.y = y;
  v89.size.width = width;
  v89.size.height = height;
  v90 = CGRectApplyAffineTransform(v89, &v77);
  v24 = v90.origin.y;
  v25 = v90.origin.x;
  *(float *)v83 = v24;
  *(float *)&v83[1] = v25;
  v26 = v90.size.height;
  v27 = v24 + v26;
  v28 = v90.size.width;
  *(float *)&v83[2] = v27;
  *(float *)&v83[3] = v25 + v28;
  if (!self->_inDetectionMode)
  {
    -[VCPVideoFaceMeshAnalyzer rotateLandmarks:width:height:landmarks:numLandmarks:](self, "rotateLandmarks:width:height:landmarks:numLandmarks:", v6, v22, v23, self->_prevLM, 63);
    -[VCPRTLandmarkDetector calculateFaceRectFromPrevLM:result:numOfLandmarks:](self->_lmTracker, "calculateFaceRectFromPrevLM:result:numOfLandmarks:", self->_prevLM, v83, 63);
    *(_DWORD *)buf = 0;
    *(_OWORD *)&pixelBuffer[4] = (unint64_t)a3;
    if (a3)
    {
      v20 = CVPixelBufferLockBaseAddress(a3, 0);
      *(_DWORD *)buf = v20;
      if (v20)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_28;
        *(_DWORD *)v84 = 134218240;
        v85 = *(_QWORD *)&pixelBuffer[4];
        v86 = 1024;
        v87 = v20;
        _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v84, 0x12u);
        v20 = *(_DWORD *)buf;
        if (*(_DWORD *)buf)
          goto LABEL_28;
      }
      -[VCPRTLandmarkDetector detectLandmark:width:height:stride:facerect:prevResult:result:](self->_lmTracker, "detectLandmark:width:height:stride:facerect:prevResult:result:", CVPixelBufferGetBaseAddressOfPlane(a3, 0), v22, v23, BytesPerRowOfPlane, v83, self->_prevLM, self->_curLM);
      v20 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
      if (v20)
      {
LABEL_28:
        v30 = 0;
      }
      else
      {
        -[VCPFaceShapeModel moveBoundaryLandmarks:output:isInput:](self->_shapeModel, "moveBoundaryLandmarks:output:isInput:", self->_curLM, &v80, 1);
        curLM = self->_curLM;
        *(float *)&v63 = *curLM;
        if (*curLM == 0.0)
        {
          self->_validationScore = 0.0;
          v65 = 1;
          self->_inDetectionMode = 1;
          -[VCPFaceShapeModel resetIdentityAndExpressions](self->_shapeModel, "resetIdentityAndExpressions", v63);
          v64 = 0;
        }
        else
        {
          if (self->_lostTrackCounter > 0 || self->_validateFailedOnce)
          {
            -[VCPVideoFaceMeshAnalyzer validateFace:eulerAngles:](self, "validateFace:eulerAngles:", a3, self->_eulerAngle, v63);
            curLM = self->_curLM;
            v64 = 1;
          }
          else
          {
            v64 = 0;
          }
          if (-[VCPFaceShapeModel trackFaceMesh:](self->_shapeModel, "trackFaceMesh:", curLM))
          {
            v65 = 0;
          }
          else
          {
            self->_validationScore = 0.0;
            -[VCPFaceShapeModel resetIdentityAndExpressions](self->_shapeModel, "resetIdentityAndExpressions");
            v64 = 0;
            v65 = 1;
            self->_inDetectionMode = 1;
          }
        }
        v69 = (self->_trackingModeCounter + 1) % 600;
        if (self->_offline)
          v69 = 0;
        self->_trackingModeCounter = v69;
        if ((v65 & 1) == 0 && (v64 & 1) == 0 && !((__int16)v69 % 3))
          -[VCPVideoFaceMeshAnalyzer validateFace:eulerAngles:](self, "validateFace:eulerAngles:", a3, self->_eulerAngle);
        if (v64)
          dispatch_group_wait((dispatch_group_t)self->_validationGroup, 0xFFFFFFFFFFFFFFFFLL);
        validationScore = self->_validationScore;
        if (validationScore > 0.2)
        {
          self->_lostTrackCounter = 0;
          self->_validateFailedOnce = 0;
          if (validationScore > 0.9)
          {
            -[VCPFaceShapeModel setDetectionModeCounterShapeModel:](self->_shapeModel, "setDetectionModeCounterShapeModel:", 0);
            -[VCPFaceShapeModel updateIdentityShape:](self->_shapeModel, "updateIdentityShape:", &v80);
          }
        }
        if (self->_inDetectionMode)
        {
          v20 = 0;
        }
        else
        {
          memcpy(self->_prevLM, self->_curLM, 0x1F8uLL);
          v20 = 0;
          prevLM = self->_prevLM;
          v72 = *((_DWORD *)prevLM + 124);
          *((_DWORD *)prevLM + 126) = v72;
          v73 = *((_DWORD *)prevLM + 125);
          *((_DWORD *)prevLM + 127) = v73;
          *((_DWORD *)prevLM + 128) = v72;
          *((_DWORD *)prevLM + 129) = v73;
          *((_DWORD *)prevLM + 130) = v72;
          *((_DWORD *)prevLM + 131) = v73;
          *((_OWORD *)prevLM + 33) = 0u;
        }
        v30 = 1;
      }
    }
    else
    {
      v34 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v34)
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);
      v30 = 0;
      v20 = -50;
      *(_DWORD *)buf = -50;
    }
    if (*(_QWORD *)&pixelBuffer[4]
      && !*(_DWORD *)buf
      && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)&pixelBuffer[4], *(CVPixelBufferLockFlags *)&pixelBuffer[12])&& os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      goto LABEL_47;
    }
    goto LABEL_48;
  }
  if (self->_faceCount < 1)
  {
    self->_detectionModeCounter = 0;
    lostTrackCounter = self->_lostTrackCounter;
    if (lostTrackCounter >= 1)
    {
      self->_lostTrackCounter = lostTrackCounter + 1;
      if (lostTrackCounter >= 0x1E)
        -[VCPFaceShapeModel resetIdentityAndExpressions](self->_shapeModel, "resetIdentityAndExpressions");
    }
    goto LABEL_49;
  }
  if (CGRectIsEmpty(v90))
    return -18;
  v80 = 0;
  v81 = a3;
  v82 = 0;
  if (a3)
  {
    v20 = CVPixelBufferLockBaseAddress(a3, 0);
    v80 = v20;
    if (v20)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)pixelBuffer = v81;
      *(_WORD *)&pixelBuffer[8] = 1024;
      *(_DWORD *)&pixelBuffer[10] = v20;
      _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u);
      v20 = v80;
      if (v80)
        goto LABEL_16;
    }
    -[VCPRTLandmarkDetector detectLandmark:width:height:stride:facerect:prevResult:result:](self->_lmDetector, "detectLandmark:width:height:stride:facerect:prevResult:result:", CVPixelBufferGetBaseAddressOfPlane(a3, 0), v22, v23, BytesPerRowOfPlane, v83, 0, self->_curLM);
    v20 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v80);
    if (v20)
    {
LABEL_16:
      v30 = 0;
      goto LABEL_43;
    }
    *(float *)&v29 = *self->_curLM;
    shapeModel = self->_shapeModel;
    if (*(float *)&v29 == 0.0)
    {
      -[VCPFaceShapeModel resetIdentityAndExpressions](shapeModel, "resetIdentityAndExpressions", v29);
      self->_detectionModeCounter = 0;
    }
    else
    {
      v67 = -[VCPFaceShapeModel isIdentityInit](shapeModel, "isIdentityInit", v29);
      v68 = v67;
      if (v67)
        -[VCPVideoFaceMeshAnalyzer validateFace:eulerAngles:](self, "validateFace:eulerAngles:", a3, self->_eulerAngle);
      if (-[VCPFaceShapeModel fitOneImage:](self->_shapeModel, "fitOneImage:", self->_curLM))
      {
        if (!v68)
        {
          v20 = 0;
          ++self->_detectionModeCounter;
LABEL_92:
          v30 = 1;
          goto LABEL_43;
        }
LABEL_87:
        dispatch_group_wait((dispatch_group_t)self->_validationGroup, 0xFFFFFFFFFFFFFFFFLL);
        if (self->_validationScore <= 0.2)
        {
          v20 = 0;
          ++self->_lostTrackCounter;
        }
        else
        {
          self->_inDetectionMode = 0;
          *(_QWORD *)&self->_detectionModeCounter = 0;
          self->_validateFailedOnce = 0;
          memcpy(self->_prevLM, self->_curLM, 0x1F8uLL);
          v20 = 0;
          v74 = self->_prevLM;
          v75 = *((_DWORD *)v74 + 124);
          *((_DWORD *)v74 + 126) = v75;
          v76 = *((_DWORD *)v74 + 125);
          *((_DWORD *)v74 + 127) = v76;
          *((_DWORD *)v74 + 128) = v75;
          *((_DWORD *)v74 + 129) = v76;
          *((_DWORD *)v74 + 130) = v75;
          *((_DWORD *)v74 + 131) = v76;
          *((_OWORD *)v74 + 33) = 0u;
        }
        goto LABEL_92;
      }
      -[VCPFaceShapeModel resetIdentityAndExpressions](self->_shapeModel, "resetIdentityAndExpressions");
      self->_detectionModeCounter = 0;
      if (v68)
        goto LABEL_87;
    }
    v20 = 0;
    v30 = 1;
    self->_detectionModeCounter = 1;
    ++self->_lostTrackCounter;
    goto LABEL_43;
  }
  v42 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v42)
    -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v42, v43, v44, v45, v46, v47, v48, v49);
  v30 = 0;
  v20 = -50;
  v80 = -50;
LABEL_43:
  if (v81
    && !v80
    && CVPixelBufferUnlockBaseAddress(v81, v82)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
LABEL_47:
    -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
  }
LABEL_48:
  if ((v30 & 1) == 0)
    return v20;
LABEL_49:
  -[VCPFaceShapeModel getEulerAngle:](self->_shapeModel, "getEulerAngle:", self->_eulerAngle);
  -[VCPFaceShapeModel getPose](self->_shapeModel, "getPose");
  *(_OWORD *)&self[1].super.isa = v50;
  self[1]._faceBounds.origin = v51;
  self[1]._faceBounds.size = v52;
  *(_OWORD *)&self[1]._inDetectionMode = v53;
  -[VCPFaceShapeModel updateMeshVertices](self->_shapeModel, "updateMeshVertices");
  vertexCount = self->_vertexCount;
  if (vertexCount != -[VCPFaceShapeModel vertexCount](self->_shapeModel, "vertexCount") || !self->_vertexCount)
    return -18;
  memcpy(*(void **)self->_meshVertices, (const void *)-[VCPFaceShapeModel meshVertices](self->_shapeModel, "meshVertices"), 16 * self->_vertexCount);
  -[VCPVideoFaceMeshAnalyzer mapToCameraNegativeZ](self, "mapToCameraNegativeZ");
  -[VCPFaceShapeModel blendShapes](self->_shapeModel, "blendShapes");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55 == 0;

  if (!v56)
  {
    v57 = (void *)MEMORY[0x1E0C99D80];
    -[VCPFaceShapeModel blendShapes](self->_shapeModel, "blendShapes");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "dictionaryWithDictionary:", v58);
    v59 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v60 = self->_blendShapes;
    self->_blendShapes = v59;

  }
  return 0;
}

- (uint64_t)vertices
{
  return *(_QWORD *)(a1 + 160);
}

- (const)landmarks
{
  return self->_curLM;
}

- (void)mapToCameraNegativeZ
{
  int8x16_t v2;
  int8x16_t origin;
  int8x16_t v4;
  float32x4_t size;
  float32x4_t v6;
  __int128 v7;

  v2 = *(int8x16_t *)&self[1].super.isa;
  origin = (int8x16_t)self[1]._faceBounds.origin;
  size = (float32x4_t)self[1]._faceBounds.size;
  v4 = *(int8x16_t *)&self[1]._inDetectionMode;
  v6 = vnegq_f32(size);
  *(float32x2_t *)&v7 = vdiv_f32(*(float32x2_t *)v4.i8, (float32x2_t)0xC47A0000447A0000);
  HIDWORD(v7) = vextq_s8(v4, v4, 8uLL).i32[1];
  size.i32[1] = v6.i32[1];
  size.i32[2] = v6.i32[2];
  *(uint64_t *)((char *)v2.i64 + 4) = vnegq_f32((float32x4_t)vextq_s8(v2, v2, 4uLL)).u64[0];
  v6.i64[0] = vnegq_f32((float32x4_t)vextq_s8(origin, v2, 4uLL)).u64[0];
  origin.i32[1] = v6.i32[0];
  *(float *)v4.i32 = COERCE_FLOAT(self[1]._lmDetector);
  origin.i32[2] = v6.i32[1];
  *(int8x16_t *)&self[1].super.isa = v2;
  self[1]._faceBounds.origin = (CGPoint)origin;
  *((float *)&v7 + 2) = *(float *)v4.i32 / -1000.0;
  self[1]._faceBounds.size = (CGSize)size;
  *(_OWORD *)&self[1]._inDetectionMode = v7;
}

- (__n128)pose
{
  return a1[17];
}

- (NSDictionary)blendShapes
{
  return self->_blendShapes;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- (BOOL)bufferRotated
{
  return self->_bufferRotated;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_blendShapes, 0);
  for (i = 0; i != -5; --i)
    objc_storeStrong((id *)&self->_faceValidator[i + 4], 0);
  objc_storeStrong((id *)&self->_shapeModel, 0);
  objc_storeStrong((id *)&self->_validationGroup, 0);
  objc_storeStrong((id *)&self->_validationQueue, 0);
  objc_storeStrong((id *)&self->_lmTracker, 0);
  objc_storeStrong((id *)&self->_lmDetector, 0);
}

@end
