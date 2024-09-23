@implementation VCPImageBlurAnalyzer

- (VCPImageBlurAnalyzer)initWithFaceResults:(id)a3 sdof:(BOOL)a4 revision:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  VCPImageBlurAnalyzer *v9;
  uint64_t v10;
  NSArray *faces;
  uint64_t v12;
  VCPCNNBlurAnalyzer *blurAnalyzer;
  VCPCNNBlurAnalyzer *v14;
  NSArray *framePTSResults;
  NSArray *homographyResults;
  VCPImageBlurAnalyzer *v17;
  VCPImageBlurAnalyzer *v18;
  objc_super v20;

  v6 = a4;
  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VCPImageBlurAnalyzer;
  v9 = -[VCPImageBlurAnalyzer init](&v20, sel_init);
  if (!v9)
    goto LABEL_6;
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("FaceResults"));
    v10 = objc_claimAutoreleasedReturnValue();
    faces = v9->_faces;
    v9->_faces = (NSArray *)v10;

  }
  v9->_sdof = v6;
  v9->_contrast = 0.0;
  v9->_useGPU = +[VCPCNNMetalContext supportGPU](VCPCNNMetalContext, "supportGPU");
  +[VCPCNNBlurAnalyzer analyzerWithRevision:](VCPCNNBlurAnalyzer, "analyzerWithRevision:", a5);
  v12 = objc_claimAutoreleasedReturnValue();
  blurAnalyzer = v9->_blurAnalyzer;
  v9->_blurAnalyzer = (VCPCNNBlurAnalyzer *)v12;

  v14 = v9->_blurAnalyzer;
  if (v14)
  {
    -[VCPCNNBlurAnalyzer setSdof:](v14, "setSdof:", v6);
    v9->_livePhotoStillDisplayTime = -1.0;
    v9->_imageExposureTime = -1.0;
    framePTSResults = v9->_framePTSResults;
    v9->_framePTSResults = 0;

    homographyResults = v9->_homographyResults;
    v9->_homographyResults = 0;

    v17 = v9;
  }
  else
  {
LABEL_6:
    v17 = 0;
  }
  v18 = v17;

  return v18;
}

- (VCPImageBlurAnalyzer)initWithFaceResults:(id)a3 sdof:(BOOL)a4
{
  return -[VCPImageBlurAnalyzer initWithFaceResults:sdof:revision:](self, "initWithFaceResults:sdof:revision:", a3, a4, 1);
}

- (void)setGyroSharpnessParam:(id)a3 homographyResults:(id)a4 livePhotoStillDisplayTime:(float)a5 imageExposureTime:(float)a6
{
  NSArray *v10;
  NSArray *v11;
  NSArray *framePTSResults;
  NSArray *homographyResults;
  NSArray *v14;

  v10 = (NSArray *)a3;
  v11 = (NSArray *)a4;
  self->_livePhotoStillDisplayTime = a5;
  self->_imageExposureTime = a6;
  framePTSResults = self->_framePTSResults;
  self->_framePTSResults = v10;
  v14 = v10;

  homographyResults = self->_homographyResults;
  self->_homographyResults = v11;

}

- (void)setFaceResults:(id)a3
{
  NSArray *v4;
  NSArray *faces;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "count");
  if (v4)
    v4 = (NSArray *)v6;
  faces = self->_faces;
  self->_faces = v4;

}

- (float)getFaceScoreFromOutput:(id)a3 ratio:(float)a4
{
  id v5;
  uint64_t v6;
  float v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  float v12;

  v5 = a3;
  v6 = 0;
  v7 = -1.0;
  v8 = -1;
  while (1)
  {
    objc_msgSend(v5, "size");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    if (v6 >= v11)
      break;
    if (*(float *)(objc_msgSend(v5, "data") + 4 * v6) > v7)
    {
      v7 = *(float *)(objc_msgSend(v5, "data") + 4 * v6);
      v8 = v6;
    }
    ++v6;
  }
  if (v8)
    v12 = a4 * 0.3;
  else
    v12 = *(float *)objc_msgSend(v5, "data");

  return v12;
}

- (int)computeCNNFaceSharpness:(__CVBuffer *)a3 result:(float *)a4 cancel:(id)a5
{
  void *v7;
  uint64_t v8;
  int Height;
  VCPCNNData *faceInput;
  VCPCNNModel *faceModel;
  double v12;
  double v13;
  float v14;
  float v15;
  float v16;
  char v17;
  float v18;
  NSArray *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSString *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  int v34;
  VCPCNNData *v35;
  void *v36;
  VCPCNNData *v37;
  VCPCNNData *v38;
  VCPCNNData *v39;
  VCPCNNModel *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  float v45;
  float v46;
  float v47;
  VCPCNNData *v48;
  VCPCNNModel *v49;
  char v50;
  float v51;
  _BOOL8 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v62;
  int v63;
  void *v64;
  char v65;
  void *context;
  char v67;
  __CVBuffer *v68;
  VCPCNNModel *obj;
  int Width;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t (**v74)(void);
  CGAffineTransform v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  CVReturn v80;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  _BYTE buf[24];
  double v84;
  _BYTE v85[128];
  uint64_t v86;
  NSRect v87;
  CGRect v88;

  v86 = *MEMORY[0x1E0C80C00];
  v74 = (uint64_t (**)(void))a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceURL");
  v8 = objc_claimAutoreleasedReturnValue();

  v62 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_faceblur.dat"), v8);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  faceInput = self->_faceInput;
  self->_faceInput = 0;

  faceModel = self->_faceModel;
  self->_faceModel = 0;

  v80 = 0;
  pixelBuffer = a3;
  unlockFlags = 1;
  if (a3)
  {
    v68 = a3;
    v80 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    v63 = v80;
    if (v80)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = pixelBuffer;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v80;
        _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u);
        v63 = v80;
      }
    }
    else
    {
      v67 = 0;
      v73 = 0;
      v63 = 0;
      v12 = (double)Width;
      v13 = (double)Height;
      v14 = (float)Width;
      v15 = (float)Height;
      v16 = 0.0;
      v17 = 1;
      v18 = 0.0;
      while (1)
      {
        v65 = v17;
        context = (void *)MEMORY[0x1BCCA1B2C]();
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v19 = self->_faces;
        v71 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
        if (v71)
        {
          v72 = *(_QWORD *)v77;
          obj = (VCPCNNModel *)v19;
LABEL_8:
          v20 = 0;
          while (1)
          {
            if (*(_QWORD *)v77 != v72)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v20);
            if (v74)
            {
              if ((v74[2]() & 1) != 0)
                break;
            }
            objc_msgSend(v21, "objectForKey:", CFSTR("attributes"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKey:", CFSTR("faceBounds"));
            v23 = (NSString *)objc_claimAutoreleasedReturnValue();
            v87 = NSRectFromString(v23);
            v75.b = 0.0;
            v75.c = 0.0;
            v75.a = 1.0;
            *(_OWORD *)&v75.d = xmmword_1B6FBCA30;
            v75.ty = 1.0;
            v88 = CGRectApplyAffineTransform(v87, &v75);
            v24 = (int)(v88.origin.x * v12);
            if (v24 >= Width)
              v25 = Width;
            else
              v25 = (int)(v88.origin.x * v12);
            if (v24 <= 0)
              v26 = 0;
            else
              v26 = v25;
            v27 = (int)(v88.origin.y * v13);
            if (v27 >= Height)
              v28 = Height;
            else
              v28 = (int)(v88.origin.y * v13);
            if (v27 <= 0)
              v29 = 0;
            else
              v29 = v28;
            if (Width - v26 >= (int)(v88.size.width * v12))
              v30 = (int)(v88.size.width * v12);
            else
              v30 = Width - v26;
            if (Height - v29 >= (int)(v88.size.height * v13))
              v31 = (int)(v88.size.height * v13);
            else
              v31 = Height - v29;
            if (v30 >= 60)
              v32 = 60;
            else
              v32 = 0;
            if (v30 >= 172)
              v33 = 172;
            else
              v33 = v32;
            *(double *)buf = (float)((float)v26 / v14);
            *(double *)&buf[8] = (float)((float)v29 / v15);
            *(double *)&buf[16] = (float)((float)v30 / v14);
            v84 = (float)((float)v31 / v15);
            if ((_DWORD)v33 == -[VCPImageBlurAnalyzer computeCNNFaceSharpness:result:cancel:]::kNetworkInputRes[v73])
            {
              if (!self->_faceModel)
              {
                v34 = -[VCPImageBlurAnalyzer prepareFaceBlurModel:](self, "prepareFaceBlurModel:", v67 & 1);
                if (v34)
                  goto LABEL_54;
              }
              v35 = self->_faceInput;
              if (!v35)
              {
                -[VCPCNNModel getGPUContext](self->_faceModel, "getGPUContext");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                +[VCPCNNData cnnDataWithPlane:height:width:context:](VCPCNNData, "cnnDataWithPlane:height:width:context:", 1, v33, v33, v36);
                v37 = (VCPCNNData *)objc_claimAutoreleasedReturnValue();
                v38 = self->_faceInput;
                self->_faceInput = v37;

                v39 = self->_faceInput;
                if (!v39)
                {
                  v34 = -50;
LABEL_54:

                  v50 = 0;
                  v63 = v34;
LABEL_55:
                  v49 = obj;
                  goto LABEL_56;
                }
                v34 = -[VCPCNNData allocBuffers:](v39, "allocBuffers:", 1);
                if (v34)
                  goto LABEL_54;
                v40 = self->_faceModel;
                -[VCPCNNData size](self->_faceInput, "size");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = -[VCPCNNModel prepareNetworkFromURL:withInputSize:](v40, "prepareNetworkFromURL:withInputSize:", v64, v41);

                if (v34)
                  goto LABEL_54;
                v35 = self->_faceInput;
              }
              v34 = -[VCPImageBlurAnalyzer scaleRegion:ofImage:toData:withWidth:andHeight:](self, "scaleRegion:ofImage:toData:withWidth:andHeight:", buf, v68, v35, v33, v33);
              if (v34)
                goto LABEL_54;
              v34 = -[VCPCNNModel forward:](self->_faceModel, "forward:", self->_faceInput);
              if (v34)
                goto LABEL_54;
              -[VCPCNNModel output](self->_faceModel, "output");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v42, "softmax");

              if (v34)
                goto LABEL_54;
              -[VCPCNNModel output](self->_faceModel, "output");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(float *)&v44 = (float)(int)v33 / (float)v30;
              -[VCPImageBlurAnalyzer getFaceScoreFromOutput:ratio:](self, "getFaceScoreFromOutput:ratio:", v43, v44);
              v46 = v45;

              v47 = (float)(v30 * v31);
              v16 = v16 + (float)(v46 * v47);
              v18 = v18 + v47;
            }

            if (v71 == ++v20)
            {
              v19 = (NSArray *)obj;
              v71 = -[VCPCNNModel countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
              if (v71)
                goto LABEL_8;
              goto LABEL_51;
            }
          }
          v50 = 0;
          v63 = -128;
          goto LABEL_55;
        }
LABEL_51:

        v48 = self->_faceInput;
        self->_faceInput = 0;

        v49 = self->_faceModel;
        self->_faceModel = 0;
        v50 = 1;
LABEL_56:

        objc_autoreleasePoolPop(context);
        if ((v50 & 1) == 0)
          break;
        v17 = 0;
        v67 = 1;
        v73 = 1;
        if ((v65 & 1) == 0)
        {
          v63 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v80);
          if (!v63)
          {
            v63 = 0;
            v51 = v16 / v18;
            if (v18 == 0.0)
              v51 = 0.5;
            *a4 = v51;
          }
          break;
        }
      }
    }
  }
  else
  {
    v52 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v52)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v52, v53, v54, v55, v56, v57, v58, v59);
    v63 = -50;
    v80 = -50;
  }
  if (pixelBuffer
    && !v80
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
  }

  return v63;
}

- (int)computeSharpnessScore:(float *)a3 forFacesInImage:(__CVBuffer *)a4
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  float *v14;
  __CVBuffer *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v14 = a3;
  v15 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_faces;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "objectForKey:", CFSTR("attributes"), v14, v15, (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("faceBounds"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v12 = -[VCPBlurAnalyzer computeSharpnessScore:forObjects:inImage:](self, "computeSharpnessScore:forObjects:inImage:", v14, v5, v15);
  return v12;
}

- (void)spatialPooling
{
  int v2;
  float v3;
  float v4;
  float v5;
  uint64_t v6;
  int v7;
  int v8;
  float v9;
  float v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  char *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  BOOL v24;
  float v25;
  float v26;
  float v27;
  float v28;
  uint64_t v29;
  float sharpness;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  char v37;
  _QWORD v38[3];

  v2 = 0;
  v38[2] = *MEMORY[0x1E0C80C00];
  v38[0] = 0;
  v38[1] = 0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  do
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 1.0;
    v10 = 0.0;
    do
    {
      v11 = *((unsigned __int8 *)v38 + v6);
      if ((!v2 || v11 == 1) && self->_sharpnessBlocks[v6] >= v10)
      {
        v8 = v6;
        v10 = self->_sharpnessBlocks[v6];
      }
      if (v11 != 3 && self->_sharpnessBlocks[v6] <= v9)
      {
        v7 = v6;
        v9 = self->_sharpnessBlocks[v6];
      }
      ++v6;
    }
    while (v6 != 16);
    *((_BYTE *)v38 + v8) = 2;
    *((_BYTE *)v38 + v7) = 3;
    if (v4 < v10)
      v4 = v10;
    v12 = v8 / 4;
    if (v8 / 4 <= 1)
      v13 = 1;
    else
      v13 = v12;
    if (v12 >= 2)
      v14 = 2;
    else
      v14 = v8 / 4;
    if ((int)v13 - 1 <= v14 + 1)
    {
      v15 = v8 % 4;
      if (v8 % 4 <= 1)
        v16 = 1;
      else
        v16 = v15;
      if (v15 >= 2)
        v17 = 2;
      else
        v17 = v15;
      v18 = v13 - 1;
      v19 = 4 * v13 - 4;
      do
      {
        if ((int)v16 - 1 <= v17 + 1)
        {
          v20 = &v37 + v19;
          v21 = v16;
          do
          {
            v22 = v20[v21];
            if (v22 <= 1)
              LOBYTE(v22) = 1;
            v20[v21] = v22;
            v23 = v21++ - 1;
          }
          while (v23 <= v17);
        }
        v19 += 4;
        v24 = v18++ <= v14;
      }
      while (v24);
    }
    v3 = v3 + v10;
    v5 = v5 + v9;
    ++v2;
  }
  while (v2 != 4);
  v25 = v5 * 0.25;
  if ((float)(v5 * 0.25) < 0.05)
  {
    if (self->_sdof)
    {
      v26 = (float)(v4 - v25) + -0.4;
      v27 = 0.2;
    }
    else
    {
      v26 = (float)((float)(v3 * 0.25) - v25) + -0.4;
      v27 = 0.1;
    }
    if (v26 < v27)
      v27 = v26;
    v24 = v26 > 0.0;
    v28 = 0.0;
    if (v24)
      v28 = v27;
    self->_contrast = v28;
  }
  v29 = 0;
  sharpness = self->_sharpness;
  v31 = 0.0;
  do
  {
    if (*((_BYTE *)v38 + v29) == 2)
      v32 = 1.0;
    else
      v32 = 0.05;
    sharpness = sharpness + (float)(v32 * self->_sharpnessBlocks[v29]);
    self->_sharpness = sharpness;
    v31 = v31 + v32;
    ++v29;
  }
  while (v29 != 16);
  v33 = sharpness / v31;
  self->_sharpness = v33;
  v34 = v33 + self->_contrast;
  v35 = v34 * 100.0;
  if (v34 >= 1.0)
    v35 = 100.0;
  v24 = v34 > 0.0;
  v36 = 0.0;
  if (v24)
    v36 = v35;
  self->_sharpness = roundf(v36) / 100.0;
}

- (int)computeLocalSharpness:(__CVBuffer *)a3
{
  CVReturn v5;
  int v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int Width;
  int Height;
  size_t BytesPerRowOfPlane;
  char *BaseAddressOfPlane;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  CVReturn v24;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  pixelBuffer = a3;
  unlockFlags = 1;
  if (a3)
  {
    v5 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    v24 = v5;
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VCPImageBlurAnalyzer computeLocalSharpness:].cold.3();
    }
    else
    {
      Width = CVPixelBufferGetWidth(a3);
      Height = CVPixelBufferGetHeight(a3);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      v20 = 0;
      *(_OWORD *)self->_sharpnessBlocks = 0u;
      *(_OWORD *)&self->_sharpnessBlocks[4] = 0u;
      *(_OWORD *)&self->_sharpnessBlocks[8] = 0u;
      *(_OWORD *)&self->_sharpnessBlocks[12] = 0u;
      v21 = (Width / 4);
      v22 = (Height / 4);
      do
      {
        -[VCPBlurAnalyzer computeRegionSharpness:width:height:stride:](self, "computeRegionSharpness:width:height:stride:", &BaseAddressOfPlane[BytesPerRowOfPlane * (int)((v20 >> 2) * v22) + (int)((v20 & 3) * v21)], v21, v22, BytesPerRowOfPlane);
        self->_sharpnessBlocks[v20++] = v23;
      }
      while (v20 != 16);
      v6 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v24);
      if (pixelBuffer
        && !v24
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
      }
    }
  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v7)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    return -50;
  }
  return v6;
}

- (int)prepareFaceBlurModel:(BOOL)a3
{
  uint64_t v3;
  VCPCNNModel *v5;
  VCPCNNModel *faceModel;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  VCPCNNFlattenBlock *v16;
  void *v18;

  if (a3)
    v3 = 4;
  else
    v3 = 2;
  if (!self->_useGPU)
    return -50;
  v5 = -[VCPCNNModel initWithParameters:useGPU:]([VCPCNNModel alloc], "initWithParameters:useGPU:", 1, self->_useGPU);
  faceModel = self->_faceModel;
  self->_faceModel = v5;

  if (!self->_faceModel)
    return -108;
  +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 5, 20, 1, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VCPCNNModel add:](self->_faceModel, "add:", v7);
  if (!v8)
  {
    +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", 2, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[VCPCNNModel add:](self->_faceModel, "add:", v9);
    if (!v8)
    {
      +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 5, 32, 1, 1, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[VCPCNNModel add:](self->_faceModel, "add:", v10);
      if (!v8)
      {
        +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", v3, v3, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[VCPCNNModel add:](self->_faceModel, "add:", v18);
        if (!v8)
        {
          +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 5, 64, 1, 1, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[VCPCNNModel add:](self->_faceModel, "add:", v11);
          if (!v8)
          {
            +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", v3, v3, 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = -[VCPCNNModel add:](self->_faceModel, "add:", v12);
            if (!v8)
            {
              if (self->_useGPU
                || (v16 = -[VCPCNNFlattenBlock initWithParameters:]([VCPCNNFlattenBlock alloc], "initWithParameters:", 1), v8 = -[VCPCNNModel add:](self->_faceModel, "add:", v16), v16, !v8))
              {
                v13 = v11;
                +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:NeuronType:](VCPCNNFullConnectionBlock, "fcBlockWithNumNeurons:NeuronType:", 256, 1);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v8 = -[VCPCNNModel add:](self->_faceModel, "add:", v14);
                if (!v8)
                {
                  +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:NeuronType:](VCPCNNFullConnectionBlock, "fcBlockWithNumNeurons:NeuronType:", 26, 0);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  v8 = -[VCPCNNModel add:](self->_faceModel, "add:", v15);

                }
                v11 = v13;
              }
            }

          }
        }

      }
    }

  }
  return v8;
}

- (int)scaleRegion:(CGRect *)a3 ofImage:(__CVBuffer *)a4 toData:(id)a5 withWidth:(int)a6 andHeight:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  id v12;
  CGRect *v13;
  int v14;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  int Width;
  int Height;
  uint64_t v28;
  float v29;
  int i;
  uint64_t j;
  int v32;
  CVPixelBufferRef v33;
  CVPixelBufferLockFlags unlockFlags;
  CVPixelBufferRef pixelBuffer;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v12 = a5;
  pixelBuffer = 0;
  v13 = (CGRect *)MEMORY[0x1E0C9D648];
  if (a3)
    v13 = a3;
  v14 = Scaler::ScaleCropped(&self->_scaler, *v13, a4, &pixelBuffer, v8, v7, 875704438);
  if (!v14)
  {
    v33 = pixelBuffer;
    unlockFlags = 1;
    if (pixelBuffer)
    {
      v14 = CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
      v32 = v14;
      if (v14)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[VCPImageBlurAnalyzer computeLocalSharpness:].cold.3();
      }
      else
      {
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
        Width = CVPixelBufferGetWidth(pixelBuffer);
        Height = CVPixelBufferGetHeight(pixelBuffer);
        v28 = objc_msgSend(v12, "data");
        if (Height >= 1)
        {
          for (i = 0; i != Height; ++i)
          {
            if (Width >= 1)
            {
              for (j = 0; j != Width; *(float *)(v28 + 4 * j++) = v29)
              {
                LOBYTE(v29) = BaseAddressOfPlane[j];
                v29 = (float)LODWORD(v29) / 255.0;
              }
            }
            BaseAddressOfPlane += BytesPerRowOfPlane;
            v28 += 4 * Width;
          }
        }
        v14 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v32);
        if (v33
          && !v32
          && CVPixelBufferUnlockBaseAddress(v33, unlockFlags)
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
        }
      }
    }
    else
    {
      v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v16)
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
      v14 = -50;
    }
  }
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);

  return v14;
}

- (int)computeGyroSharpness:(float *)a3
{
  const __CFDictionary *v5;
  uint64_t v6;
  unint64_t v7;
  float v8;
  const __CFDictionary *v9;
  float v10;
  float v11;
  const __CFDictionary *v12;
  double Seconds;
  float imageExposureTime;
  const __CFDictionary *v15;
  float v16;
  float v17;
  float v18;
  const __CFDictionary *v19;
  float v20;
  const __CFDictionary *v21;
  float v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  void *v31;
  void *v32;
  float v33;
  float v34;
  float v35;
  uint64_t v37;
  float *v38;
  void *v39;
  CMTime v40;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTime time;
  CMTime v45;
  CMTime v46;
  CMTime rhs;
  CMTime lhs;

  memset(&v46, 0, sizeof(v46));
  -[NSArray objectAtIndexedSubscript:](self->_framePTSResults, "objectAtIndexedSubscript:", 0);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v46, v5);

  v6 = -1;
  if (-[NSArray count](self->_framePTSResults, "count") >= 2)
  {
    v7 = 1;
    v8 = 10000.0;
    do
    {
      memset(&v45, 0, sizeof(v45));
      -[NSArray objectAtIndexedSubscript:](self->_framePTSResults, "objectAtIndexedSubscript:", v7);
      v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&v45, v9);

      lhs = v45;
      rhs = v46;
      CMTimeSubtract(&time, &lhs, &rhs);
      v10 = CMTimeGetSeconds(&time) - self->_livePhotoStillDisplayTime;
      v11 = fabsf(v10);
      if (v8 > v11)
      {
        v8 = v11;
        v6 = v7;
      }
      ++v7;
    }
    while (v7 < -[NSArray count](self->_framePTSResults, "count"));
  }
  -[NSArray objectAtIndexedSubscript:](self->_framePTSResults, "objectAtIndexedSubscript:", v6);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v45, v12);
  lhs = v45;
  rhs = v46;
  CMTimeSubtract(&v43, &lhs, &rhs);
  Seconds = CMTimeGetSeconds(&v43);

  imageExposureTime = self->_imageExposureTime;
  -[NSArray objectAtIndexedSubscript:](self->_framePTSResults, "objectAtIndexedSubscript:", 1);
  v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v45, v15);
  lhs = v45;
  rhs = v46;
  CMTimeSubtract(&v42, &lhs, &rhs);
  v16 = Seconds;
  v17 = imageExposureTime / CMTimeGetSeconds(&v42);

  v18 = v17;
  if (v6 >= 2)
  {
    -[NSArray objectAtIndexedSubscript:](self->_framePTSResults, "objectAtIndexedSubscript:", v6 - 1);
    v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v45, v19);
    lhs = v45;
    rhs = v46;
    CMTimeSubtract(&v41, &lhs, &rhs);
    v20 = CMTimeGetSeconds(&v41);

    v18 = self->_imageExposureTime / (float)(v16 - v20);
  }
  if (v6 + 1 < -[NSArray count](self->_framePTSResults, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_framePTSResults, "objectAtIndexedSubscript:", v6 + 1);
    v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v45, v21);
    lhs = v45;
    rhs = v46;
    CMTimeSubtract(&v40, &lhs, &rhs);
    v22 = CMTimeGetSeconds(&v40);

    v17 = self->_imageExposureTime / (float)(v22 - v16);
  }
  -[NSArray objectAtIndexedSubscript:](self->_homographyResults, "objectAtIndexedSubscript:", v6, v6 + 1, a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("attributes"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("MetaHomographyResults"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray objectAtIndexedSubscript:](self->_homographyResults, "objectAtIndexedSubscript:", v6 - 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("attributes"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("MetaHomographyResults"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if ((float)(v16 - self->_livePhotoStillDisplayTime) > (float)(self->_imageExposureTime * 0.5)
    || v37 == -[NSArray count](self->_framePTSResults, "count"))
  {
    -[VCPImageBlurAnalyzer estimateDistance:prevHomography:](self, "estimateDistance:prevHomography:", v39, v27);
    v29 = v18 * v28;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_homographyResults, "objectAtIndexedSubscript:", v37);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("attributes"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("MetaHomographyResults"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[VCPImageBlurAnalyzer estimateDistance:prevHomography:](self, "estimateDistance:prevHomography:", v39, v27);
    v34 = v33;
    -[VCPImageBlurAnalyzer estimateDistance:prevHomography:](self, "estimateDistance:prevHomography:", v32, v39);
    v29 = (float)((float)(v17 * v35) + (float)(v18 * v34)) * 0.5;

  }
  *v38 = v29;

  return 0;
}

- (float)estimateDistance:(id)a3 prevHomography:(id)a4
{
  id v5;
  id v6;
  uint64_t i;
  void *v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float __C[9];
  float v18[9];
  float __B[9];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  for (i = 0; i != 9; ++i)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    __B[i] = v9;

    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v18[i] = v11;

  }
  v12 = -1.0;
  if (!vcp_matrix_invert(__B, 3))
  {
    matrix_multiplication(v18, __B, __C, 3, 3, 3);
    v13 = __C[8] + (float)((float)(__C[7] * 1512.0) + (float)(__C[6] * 2016.0));
    v14 = (float)(__C[5] + (float)((float)(__C[4] * 1512.0) + (float)(__C[3] * 2016.0))) / v13;
    v15 = (float)((float)(__C[2] + (float)((float)(__C[1] * 1512.0) + (float)(__C[0] * 2016.0))) / v13) + -2016.0;
    v12 = sqrtf((float)((float)(v14 + -1512.0) * (float)(v14 + -1512.0)) + (float)(v15 * v15));
  }

  return v12;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  double v6;

  LODWORD(v6) = -1.0;
  return -[VCPImageBlurAnalyzer analyzePixelBuffer:flags:withPreAnalysisScore:results:cancel:](self, "analyzePixelBuffer:flags:withPreAnalysisScore:results:cancel:", a3, a4, a5, a6, v6);
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 withPreAnalysisScore:(float)a5 results:(id *)a6 cancel:(id)a7
{
  id v11;
  void *v12;
  float *p_sharpness;
  void *v14;
  double v15;
  int v16;
  void *v17;
  NSArray *faces;
  int v19;
  double v20;
  int v21;
  void *v22;
  NSArray *framePTSResults;
  NSArray *homographyResults;
  uint64_t v25;
  void *v26;
  void *v27;
  int v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  p_sharpness = &self->_sharpness;
  self->_sharpness = 0.0;
  self->_textureScore = 1.0;
  v14 = (void *)MEMORY[0x1BCCA1B2C]();
  if (self->_sdof)
  {
    v16 = -[VCPImageBlurAnalyzer computeLocalSharpness:](self, "computeLocalSharpness:", a3);
    if (v16)
      goto LABEL_14;
    -[VCPImageBlurAnalyzer spatialPooling](self, "spatialPooling");
  }
  if (a5 == -1.0)
  {
    *(float *)&v15 = self->_contrast;
    v16 = -[VCPCNNBlurAnalyzer computeCNNBasedSharpness:sharpnessScore:textureScore:contrast:cancel:](self->_blurAnalyzer, "computeCNNBasedSharpness:sharpnessScore:textureScore:contrast:cancel:", a3, &self->_sharpness, &self->_textureScore, v11, v15);
    if (v16)
      goto LABEL_14;
    a5 = *p_sharpness;
  }
  else
  {
    *p_sharpness = a5;
  }
  *(float *)&v15 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v17, CFSTR("sharpness"));

  faces = self->_faces;
  if (faces && -[NSArray count](faces, "count"))
  {
    v29 = 0;
    if (self->_useGPU)
      v19 = -[VCPImageBlurAnalyzer computeCNNFaceSharpness:result:cancel:](self, "computeCNNFaceSharpness:result:cancel:", a3, &v29, v11);
    else
      v19 = -[VCPImageBlurAnalyzer computeSharpnessScore:forFacesInImage:](self, "computeSharpnessScore:forFacesInImage:", &v29, a3);
    v16 = v19;
    if (v19)
      goto LABEL_14;
    LODWORD(v20) = v29;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v22, CFSTR("sharpnessFaces"));

  }
  framePTSResults = self->_framePTSResults;
  if (framePTSResults)
  {
    if (-[NSArray count](framePTSResults, "count"))
    {
      homographyResults = self->_homographyResults;
      if (homographyResults)
      {
        v25 = -[NSArray count](homographyResults, "count");
        if (v25 == -[NSArray count](self->_framePTSResults, "count")
          && self->_livePhotoStillDisplayTime != -1.0
          && self->_imageExposureTime != -1.0)
        {
          v29 = 0;
          v16 = -[VCPImageBlurAnalyzer computeGyroSharpness:](self, "computeGyroSharpness:", &v29);
          if (v16)
          {
LABEL_14:
            v21 = 0;
            goto LABEL_24;
          }
        }
      }
    }
  }
  v16 = 0;
  v21 = 1;
LABEL_24:
  objc_autoreleasePoolPop(v14);
  if (v21)
  {
    v33 = CFSTR("BlurResults");
    v30 = CFSTR("attributes");
    v31 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v16 = 0;
  }

  return v16;
}

- (float)sharpness
{
  return self->_sharpness;
}

- (float)textureScore
{
  return self->_textureScore;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_blurAnalyzer, 0);
  objc_storeStrong((id *)&self->_faceInput, 0);
  objc_storeStrong((id *)&self->_faceModel, 0);
  objc_storeStrong((id *)&self->_homographyResults, 0);
  objc_storeStrong((id *)&self->_framePTSResults, 0);
  objc_storeStrong((id *)&self->_faces, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 22) = 0;
  *((_DWORD *)self + 46) = 0;
  return self;
}

- (void)computeLocalSharpness:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B6C4A000, MEMORY[0x1E0C81028], v0, "Failed to lock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
