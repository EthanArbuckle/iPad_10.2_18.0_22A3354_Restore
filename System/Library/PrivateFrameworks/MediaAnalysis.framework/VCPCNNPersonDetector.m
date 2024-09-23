@implementation VCPCNNPersonDetector

- (VCPCNNPersonDetector)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  NSArray *outputNames;
  VCPCNNPersonDetector *v12;
  void *v13;
  void *v14;
  void *v15;
  VCPCNNModelEspresso *v16;
  NSArray *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v23;
  VCPCNNPersonDetector *v24;
  VCPCNNPersonDetector *v25;
  VCPCNNModelEspresso *v27;
  uint64_t v28;
  VCPCNNModelEspresso *v29;
  uint64_t v30;
  VCPCNNModelEspresso *v31;
  uint64_t v32;
  unint64_t v33;
  size_t v34;
  VCPCNNModelEspresso *v35;
  int v36;
  VCPCNNModelEspresso *v37;
  int v38;
  uint64_t v39;
  unint64_t v40;
  const std::nothrow_t *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  size_t v45;
  float *v46;
  char *__p;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  __int128 v52;
  objc_super v53;
  _QWORD v54[2];
  _QWORD v55[3];

  v6 = a5;
  v7 = a4;
  v55[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  self->_maxNumRegions = a3;
  outputNames = self->_outputNames;
  self->_outputNames = (NSArray *)&unk_1E6B769E0;

  std::vector<void *>::resize((uint64_t)&self->_outputsData, -[NSArray count](self->_outputNames, "count"));
  v53.receiver = self;
  v53.super_class = (Class)VCPCNNPersonDetector;
  v12 = -[VCPCNNPersonDetector init](&v53, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resourceURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_person_detector.espresso.net"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = [VCPCNNModelEspresso alloc];
    v17 = v12->_outputNames;
    v54[0] = CFSTR("forceCPU");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v18;
    v54[1] = CFSTR("sharedContext");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:](v16, "initWithParameters:inputNames:outputNames:properties:", v15, 0, v17, v20);
    modelEspresso = v12->_modelEspresso;
    v12->_modelEspresso = (VCPCNNModelEspresso *)v21;

    v23 = v12->_modelEspresso;
    if (!v23 || -[VCPCNNModelEspresso prepareModelWithConfig:](v23, "prepareModelWithConfig:", v10))
      goto LABEL_4;
    v27 = v12->_modelEspresso;
    if (v27)
    {
      -[VCPCNNModelEspresso inputBlob](v27, "inputBlob");
      v28 = *((_QWORD *)&v52 + 1);
    }
    else
    {
      v28 = 0;
      v52 = 0u;
      v51 = 0;
    }
    v29 = v12->_modelEspresso;
    if (v29)
    {
      -[VCPCNNModelEspresso inputBlob](v29, "inputBlob");
      v30 = v50;
    }
    else
    {
      v30 = 0;
      v49 = 0;
    }
    v31 = v12->_modelEspresso;
    if (v31)
    {
      -[VCPCNNModelEspresso inputBlob](v31, "inputBlob");
      v32 = v48;
    }
    else
    {
      v32 = 0;
    }
    v33 = v30 * v28 * v32;
    v34 = v33 >> 62 ? -1 : 4 * v33;
    v12->_inputData = (float *)operator new[](v34, MEMORY[0x1E0DE4E10]);
    v35 = v12->_modelEspresso;
    if (v35)
    {
      -[VCPCNNModelEspresso inputBlob](v35, "inputBlob");
      v36 = v52;
    }
    else
    {
      v36 = 0;
    }
    v12->_inputWidth = v36;
    v37 = v12->_modelEspresso;
    if (v37)
    {
      -[VCPCNNModelEspresso inputBlob](v37, "inputBlob");
      v38 = DWORD2(v52);
    }
    else
    {
      v38 = 0;
    }
    v12->_inputHeight = v38;
    if (v12->_inputData)
    {
      v39 = 0;
      v40 = 0;
      v41 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
      while (-[NSArray count](v12->_outputNames, "count") > v40)
      {
        -[VCPCNNModelEspresso outputBlobs](v12->_modelEspresso, "outputBlobs");
        v42 = *(_QWORD *)&v51[v39 + 88];
        -[VCPCNNModelEspresso outputBlobs](v12->_modelEspresso, "outputBlobs");
        v43 = *(_QWORD *)&v49[v39 + 80];
        -[VCPCNNModelEspresso outputBlobs](v12->_modelEspresso, "outputBlobs");
        v44 = v43 * v42 * *(_QWORD *)&__p[v39 + 96];
        if (v44 >> 62)
          v45 = -1;
        else
          v45 = 4 * v44;
        v12->_outputsData.__begin_[v40] = (float *)operator new[](v45, v41);
        if (__p)
          operator delete(__p);
        if (v49)
          operator delete(v49);
        if (v51)
          operator delete(v51);
        v46 = v12->_outputsData.__begin_[v40++];
        v39 += 168;
        if (!v46)
          goto LABEL_4;
      }
      v24 = v12;
    }
    else
    {
LABEL_4:
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }
  v25 = v24;

  return v25;
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4
{
  int Width;
  int Height;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *BaseAddress;
  int BytesPerRow;
  double v28;
  int v29;
  float *v30;
  float *v31;
  uint64_t v32;
  uint64_t i;
  double v34;
  double v35;
  int v36;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369)
  {
LABEL_8:
    LODWORD(v10) = -50;
    return v10;
  }
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBuffer = a3;
  unlockFlags = 1;
  if (!a3)
  {
    v17 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v17)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_8;
  }
  v8 = Height;
  v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  v36 = v9;
  if ((_DWORD)v9)
  {
    v10 = v9;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[VCPImageConverter convertImage:yuvFrame:].cold.3((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    bzero(a4, 3 * 4 * Width * v8);
    if (v8 >= 1)
    {
      v29 = 0;
      v30 = &a4[2 * v8 * Width];
      v31 = &a4[v8 * Width];
      v32 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          for (i = 0; i != Width; ++i)
          {
            LOBYTE(v28) = BaseAddress[(int)(i * 4)];
            v34 = (double)*(unint64_t *)&v28 / 255.0;
            *(float *)&v34 = v34;
            a4[i] = *(float *)&v34;
            LOBYTE(v34) = BaseAddress[(int)(i * 4) + 1];
            v35 = (double)*(unint64_t *)&v34 / 255.0;
            *(float *)&v35 = v35;
            v31[i] = *(float *)&v35;
            LOBYTE(v35) = BaseAddress[(int)(i * 4) + 2];
            v28 = (double)*(unint64_t *)&v35 / 255.0;
            *(float *)&v28 = v28;
            v30[i] = *(float *)&v28;
          }
        }
        BaseAddress += BytesPerRow;
        ++v29;
        v30 = (float *)((char *)v30 + v32);
        v31 = (float *)((char *)v31 + v32);
        a4 = (float *)((char *)a4 + v32);
      }
      while (v29 != v8);
    }
    LODWORD(v10) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v36);
    if (pixelBuffer
      && !v36
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
    }
  }
  return v10;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 inputHeight:(int)a5 inputWidth:(int)a6
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
    v9 = -[VCPCNNPersonDetector copyImage:toData:](self, "copyImage:toData:", cf, a3);
  if (cf)
    CFRelease(cf);
  return v9;
}

- (int)generatePersonBoxes:(id)a3
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
    v5 = -[VCPCNNPersonDetector generatePersonRegions:boxes:maxNumRegions:](self, "generatePersonRegions:boxes:maxNumRegions:", &__p, v4, self->_maxNumRegions);
    if (__p)
    {
      v9 = __p;
      operator delete(__p);
    }
  }

  return v5;
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
  uint64_t v9;
  float v10;
  uint64_t v11;
  float *v12;
  int v13;
  float v14;
  int v15;
  float *v16;
  float v17;
  float *v18;
  float v19;
  float *v20;
  float v21;
  int inputWidth;
  int inputHeight;
  float *v24;
  float v25;
  float *v26;
  float v27;
  float v28;
  float v29;
  VCPBoundingBox *v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  VCPBoundingBox *v42;
  uint64_t v44;
  float *v46;
  uint64_t v47;
  float v48;
  int v49;
  id v52;

  v52 = a6;
  if (a4 >= 1)
  {
    v9 = a5 * a4;
    v48 = (float)a4;
    v44 = a4;
    v46 = &a3[4 * a5 * a4];
    v47 = 0;
    v49 = 6 * a5 * a4;
    v10 = 0.5;
    do
    {
      if (a5 >= 1)
      {
        v11 = 0;
        v12 = v46;
        do
        {
          v13 = 0;
          v14 = 0.0;
          v15 = -1;
          v16 = v12;
          do
          {
            v17 = 1.0 / (float)(expf(-*v16) + 1.0);
            if (v17 > v14)
            {
              v14 = v17;
              v15 = v13;
            }
            ++v13;
            v16 += v49;
          }
          while (v13 != 3);
          if (v14 > v10)
          {
            v18 = &a3[(int)v11 + (int)v47 * a5 + v49 * v15];
            v19 = *v18;
            v20 = &v18[v9];
            v21 = *v20;
            inputWidth = self->_inputWidth;
            inputHeight = self->_inputHeight;
            v24 = &v20[v9];
            v25 = *v24;
            v26 = &(*a7)[2 * v15];
            v27 = v24[v9];
            v28 = *v26;
            v29 = v26[1];
            v30 = [VCPBoundingBox alloc];
            v31 = expf(v27);
            v32 = expf(v25);
            v33 = expf(-v21) + 1.0;
            v34 = -v19;
            v35 = 1.0 / v33;
            v36 = expf(v34);
            *(float *)&v37 = v31 * v29;
            *(float *)&v38 = v32 * v28;
            *(float *)&v39 = (float)((float)(v35 + (float)(int)v47) * (float)inputHeight) / v48;
            *(float *)&v40 = (float)((float)((float)(1.0 / (float)(v36 + 1.0)) + (float)(int)v11) * (float)inputWidth)
                           / (float)a5;
            *(float *)&v41 = v14;
            v42 = -[VCPBoundingBox initWithCenterAndSize:y:width:height:confidence:](v30, "initWithCenterAndSize:y:width:height:confidence:", v40, v39, v38, v37, v41);
            objc_msgSend(v52, "addObject:", v42);

            v10 = 0.5;
          }
          ++v11;
          ++v12;
        }
        while (v11 != a5);
      }
      v46 += a5;
      ++v47;
    }
    while (v47 != v44);
  }

  return 0;
}

- (int)generatePersonRegions:(const void *)a3 boxes:(id)a4 maxNumRegions:(int)a5
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
      -[VCPCNNPersonDetector retrieveBoxes:outHeight:outWidth:boxes:anchorBox:](self, "retrieveBoxes:outHeight:outWidth:boxes:anchorBox:", *(_QWORD *)v9, *(unsigned int *)(v9 + 88), *(unsigned int *)(v9 + 80), v8, v10);
      v10 += 24;
      v9 += 168;
    }
    while (v9 != *((_QWORD *)a3 + 1));
  }
  -[VCPCNNPersonDetector nonMaxSuppression:](self, "nonMaxSuppression:", v8);
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_83);
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

uint64_t __66__VCPCNNPersonDetector_generatePersonRegions_boxes_maxNumRegions___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (int)personDetection:(__CVBuffer *)a3 personRegions:(id)a4 cancel:(id)a5
{
  int v5;
  id v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  unint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;

  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1BCCA1B2C]();
  v12 = -[VCPCNNPersonDetector createInput:withBuffer:inputHeight:inputWidth:](self, "createInput:withBuffer:inputHeight:inputWidth:", self->_inputData, a3, self->_inputHeight, self->_inputWidth);
  if (v12)
  {
    v13 = 4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[VCPCNNPersonDetector generatePersonBoxes:](self, "generatePersonBoxes:", v14);
    if (v5)
    {
      v13 = 1;
    }
    else
    {
      for (i = 0; objc_msgSend(v14, "count") > i; ++i)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "minX");
        *(float *)&v17 = *(float *)&v17 / (float)self->_inputWidth;
        if (*(float *)&v17 < 0.0)
          *(float *)&v17 = 0.0;
        objc_msgSend(v16, "setMinX:", v17);
        objc_msgSend(v16, "maxX");
        *(float *)&v18 = *(float *)&v18 / (float)self->_inputWidth;
        if (*(float *)&v18 > 1.0)
          *(float *)&v18 = 1.0;
        objc_msgSend(v16, "setMaxX:", v18);
        objc_msgSend(v16, "minY");
        *(float *)&v19 = *(float *)&v19 / (float)self->_inputHeight;
        if (*(float *)&v19 < 0.0)
          *(float *)&v19 = 0.0;
        objc_msgSend(v16, "setMinY:", v19);
        objc_msgSend(v16, "maxY");
        *(float *)&v20 = *(float *)&v20 / (float)self->_inputHeight;
        if (*(float *)&v20 > 1.0)
          *(float *)&v20 = 1.0;
        objc_msgSend(v16, "setMaxY:", v20);
        objc_msgSend(v9, "addObject:", v16);

      }
      v13 = 0;
    }

  }
  objc_autoreleasePoolPop(v11);
  if ((v13 | 4) == 4)
    v21 = v12;
  else
    v21 = v5;

  return v21;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;
  float **begin;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
  begin = self->_outputsData.__begin_;
  if (begin)
  {
    self->_outputsData.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_outputNames, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_DWORD *)self + 22) = 0;
  return self;
}

@end
