@implementation VCPCNNPetsDetector

+ (id)detector:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (+[VCPCNNPetsDetector detector:]::once != -1)
    dispatch_once(&+[VCPCNNPetsDetector detector:]::once, &__block_literal_global_12);
  return (id)objc_msgSend(objc_alloc((Class)+[VCPCNNPetsDetector detector:]::analyzerClass), "initWithMaxNumRegions:", v3);
}

uint64_t __31__VCPCNNPetsDetector_detector___block_invoke()
{
  uint64_t result;

  result = objc_opt_class();
  +[VCPCNNPetsDetector detector:]::analyzerClass = result;
  return result;
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 withChannels:(int)a5
{
  int Width;
  int Height;
  int v10;
  CVReturn v11;
  int v12;
  _BYTE *BaseAddress;
  int BytesPerRow;
  float v15;
  int v16;
  float *v17;
  float *v18;
  uint64_t v19;
  uint64_t i;
  unsigned int v21;
  unsigned int v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float v32;
  int v33;
  float *v34;
  float *v35;
  float *v36;
  uint64_t v37;
  uint64_t j;
  unsigned int v39;
  unsigned int v40;
  CVReturn v41;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  uint8_t buf[4];
  __CVBuffer *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369)
    return -50;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBuffer = a3;
  unlockFlags = 1;
  if (!a3)
  {
    v23 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v23)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
    return -50;
  }
  v10 = Height;
  v11 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  v41 = v11;
  if (!v11
    || (v12 = v11, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    && (*(_DWORD *)buf = 134218240,
        v45 = a3,
        v46 = 1024,
        v47 = v12,
        _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v12 = v41) == 0))
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    if (a5 == 3)
    {
      bzero(a4, 3 * 4 * Width * v10);
      if (v10 >= 1)
      {
        v16 = 0;
        v17 = &a4[2 * v10 * Width];
        v18 = &a4[v10 * Width];
        v19 = 4 * Width;
        do
        {
          if (Width >= 1)
          {
            for (i = 0; i != Width; ++i)
            {
              LOBYTE(v15) = BaseAddress[(int)(i * 4) + 2];
              *(float *)&v21 = (float)((float)((float)LODWORD(v15) / 255.0) + -0.485) / 0.229;
              a4[i] = *(float *)&v21;
              LOBYTE(v21) = BaseAddress[(int)(i * 4) + 1];
              *(float *)&v22 = (float)((float)((float)v21 / 255.0) + -0.456) / 0.224;
              v18[i] = *(float *)&v22;
              LOBYTE(v22) = BaseAddress[(int)(i * 4)];
              v15 = (float)((float)((float)v22 / 255.0) + -0.406) / 0.225;
              v17[i] = v15;
            }
          }
          BaseAddress += BytesPerRow;
          ++v16;
          v17 = (float *)((char *)v17 + v19);
          v18 = (float *)((char *)v18 + v19);
          a4 = (float *)((char *)a4 + v19);
        }
        while (v16 != v10);
      }
    }
    else
    {
      bzero(a4, 16 * Width * v10);
      if (v10 >= 1)
      {
        v33 = 0;
        v34 = &a4[2 * v10 * Width];
        v35 = &a4[3 * v10 * Width];
        v36 = &a4[v10 * Width];
        v37 = 4 * Width;
        do
        {
          if (Width >= 1)
          {
            for (j = 0; j != Width; ++j)
            {
              LOBYTE(v32) = BaseAddress[(int)(j * 4) + 2];
              *(float *)&v39 = (float)LODWORD(v32) / 255.0;
              a4[j] = *(float *)&v39;
              LOBYTE(v39) = BaseAddress[(int)(j * 4) + 1];
              *(float *)&v40 = (float)v39 / 255.0;
              v36[j] = *(float *)&v40;
              LOBYTE(v40) = BaseAddress[(int)(j * 4)];
              v32 = (float)v40 / 255.0;
              v34[j] = v32;
              v35[j] = 0.0;
            }
          }
          BaseAddress += BytesPerRow;
          ++v33;
          v35 = (float *)((char *)v35 + v37);
          v34 = (float *)((char *)v34 + v37);
          v36 = (float *)((char *)v36 + v37);
          a4 = (float *)((char *)a4 + v37);
        }
        while (v33 != v10);
      }
    }
    v12 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v41);
    if (pixelBuffer
      && !v41
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
    }
  }
  return v12;
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
    v9 = -[VCPCNNPetsDetector copyImage:toData:withChannels:](self, "copyImage:toData:withChannels:", cf, a3, 3);
  if (cf)
    CFRelease(cf);
  return v9;
}

- (int)createModel:(int)a3 srcWidth:(int)a4
{
  return -4;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  return 0;
}

- (int)generatePetsBoxes:(id)a3 faceBoxes:(id)a4 cancel:(id)a5
{
  return -4;
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
              if (v15 > 0.4)
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

- (int)generatePetsRegions:(float *)a3 outHeight:(int)a4 outWidth:(int)a5 boxes:(id)a6 faceBoxes:(id)a7 maxNumRegions:(int)a8
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  float *v16;
  uint64_t v17;
  float *v18;
  float v19;
  float *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  VCPBoundingBox *v27;
  float v28;
  float v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  VCPBoundingBox *v35;
  float v36;
  float *v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  VCPBoundingBox *v44;
  float v45;
  float v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  VCPBoundingBox *v52;
  float *v56;
  uint64_t v58;
  uint64_t i;
  uint64_t v61;
  id v62;
  id v63;
  float v64;
  float v65;

  v63 = a6;
  v62 = a7;
  if (a4 >= 1)
  {
    v10 = 4 * a5 * a4;
    v11 = a5 * a4;
    v56 = &a3[36 * a5 * a4];
    v58 = a4;
    for (i = 0; i != v58; ++i)
    {
      if (a5 >= 1)
      {
        v12 = 0;
        v64 = (float)(int)((32 * i) | 0x10);
        do
        {
          v13 = 0;
          v14 = 0;
          v15 = (uint64_t)&v56[i * a5 + v12];
          v16 = &a3[i * a5 + v12];
          v61 = v12;
          v65 = (float)(int)((32 * v12) | 0x10);
          do
          {
            v17 = v13;
            v18 = (float *)(v15 + 4 * v13);
            v19 = fmaxf(*v18, v18[v11]);
            if (v19 > 0.2)
            {
              v20 = &v16[v13];
              v22 = *(float *)((char *)&unk_1B6FBCB54 + v14);
              v21 = *(float *)((char *)&unk_1B6FBCB54 + v14 + 4);
              v23 = v20[v11];
              v24 = *v20;
              v25 = v20[2 * v11];
              v26 = v20[3 * v11];
              v27 = [VCPBoundingBox alloc];
              v28 = expf(v26 * 0.2);
              v29 = v22 * expf(v25 * 0.2);
              *(float *)&v30 = 1.0 / (float)(expf(-v19) + 1.0);
              *(float *)&v31 = v65 + (float)((float)(v24 * 0.1) * v22);
              *(float *)&v32 = v64 + (float)((float)(v23 * 0.1) * v21);
              *(float *)&v33 = v29;
              *(float *)&v34 = v21 * v28;
              v35 = -[VCPBoundingBox initWithCenterAndSize:y:width:height:confidence:](v27, "initWithCenterAndSize:y:width:height:confidence:", v31, v32, v33, v34, v30);
              objc_msgSend(v63, "addObject:", v35);

            }
            v36 = fmaxf(v18[2 * v11], v18[3 * v11]);
            if (v36 > 0.2)
            {
              v37 = &v16[v17];
              v39 = *(float *)((char *)&unk_1B6FBCB54 + v14);
              v38 = *(float *)((char *)&unk_1B6FBCB54 + v14 + 4);
              v40 = v37[v11];
              v41 = *v37;
              v42 = v37[2 * v11];
              v43 = v37[3 * v11];
              v44 = [VCPBoundingBox alloc];
              v45 = expf(v43 * 0.2);
              v46 = v39 * expf(v42 * 0.2);
              *(float *)&v47 = 1.0 / (float)(expf(-v36) + 1.0);
              *(float *)&v48 = v65 + (float)((float)(v41 * 0.1) * v39);
              *(float *)&v49 = v64 + (float)((float)(v40 * 0.1) * v38);
              *(float *)&v50 = v46;
              *(float *)&v51 = v38 * v45;
              v52 = -[VCPBoundingBox initWithCenterAndSize:y:width:height:confidence:](v44, "initWithCenterAndSize:y:width:height:confidence:", v48, v49, v50, v51, v47);
              objc_msgSend(v62, "addObject:", v52);

            }
            v14 += 8;
            v13 = v17 + v10;
          }
          while (v14 != 72);
          v12 = v61 + 1;
        }
        while (v61 + 1 != a5);
      }
    }
  }
  -[VCPCNNPetsDetector postProcBoxes:maxNumRegions:](self, "postProcBoxes:maxNumRegions:", v63, a8);
  -[VCPCNNPetsDetector postProcBoxes:maxNumRegions:](self, "postProcBoxes:maxNumRegions:", v62, a8);

  return 0;
}

- (int)postProcBoxes:(id)a3 maxNumRegions:(int)a4
{
  unint64_t i;
  id v6;
  void *v7;
  float v8;
  uint64_t v9;

  LODWORD(i) = a4;
  v6 = a3;
  -[VCPCNNPetsDetector nonMaxSuppression:](self, "nonMaxSuppression:", v6);
  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_130);
  if (objc_msgSend(v6, "count") > (unint64_t)(int)i)
  {
    for (i = (int)i; objc_msgSend(v6, "count") > i; ++i)
      objc_msgSend(v6, "removeLastObject");
  }
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    do
    {
      objc_msgSend(v7, "flag");
      if (v8 != 0.0)
        break;
      objc_msgSend(v6, "removeLastObject");
      objc_msgSend(v6, "lastObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
    while (v9);

  }
  return 0;
}

uint64_t __50__VCPCNNPetsDetector_postProcBoxes_maxNumRegions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v6, "flag");
  v9 = v8;
  objc_msgSend(v7, "flag");
  if (v9 <= v10)
  {
    objc_msgSend(v6, "flag");
    v13 = v12;
    objc_msgSend(v7, "flag");
    if (v13 >= v14)
    {
      objc_msgSend(v6, "confidence");
      v16 = v15;
      objc_msgSend(v7, "confidence");
      if (v16 <= v17)
        v11 = 1;
      else
        v11 = -1;
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = -1;
  }

  return v11;
}

- (int)petsDetection:(__CVBuffer *)a3 petsRegions:(id)a4 petsFaceRegions:(id)a5 cancel:(id)a6
{
  id v10;
  void *v11;
  size_t Width;
  size_t Height;
  size_t v14;
  int v15;
  int v16;
  int v17;
  float *v18;
  int v19;
  int v20;
  id v22;
  unint64_t i;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t j;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[3];
  NSRect v48;
  NSRect v49;

  v47[2] = *MEMORY[0x1E0C80C00];
  v42 = a4;
  v10 = a5;
  v41 = a6;
  v11 = (void *)MEMORY[0x1BCCA1B2C]();
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v14 = Height;
  if ((int)Width <= (int)Height)
    v15 = Height;
  else
    v15 = Width;
  v43 = 0;
  if (v15 >= 417)
  {
    Width = (416 * (int)Width / v15) & 0xFFFFFFFE;
    v14 = (416 * (int)Height / v15) & 0xFFFFFFFE;
  }
  if ((int)v14 >= (int)Width)
    v16 = Width;
  else
    v16 = v14;
  if (v16 < 224)
  {
    v17 = 0;
LABEL_13:
    v19 = 4;
    goto LABEL_14;
  }
  v17 = -[VCPCNNPetsDetector createModel:srcWidth:](self, "createModel:srcWidth:", v14, Width);
  if (v17)
    goto LABEL_13;
  v18 = -[VCPCNNPetsDetector getInputBuffer:srcWidth:cnnInputHeight:cnnInputWidth:](self, "getInputBuffer:srcWidth:cnnInputHeight:cnnInputWidth:", v14, Width, &v43, (char *)&v43 + 4);
  v17 = -[VCPCNNPetsDetector createInput:withBuffer:cnnInputHeight:cnnInputWidth:](self, "createInput:withBuffer:cnnInputHeight:cnnInputWidth:", v18, a3, v43, HIDWORD(v43));
  if (v17)
    goto LABEL_13;
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = -[VCPCNNPetsDetector generatePetsBoxes:faceBoxes:cancel:](self, "generatePetsBoxes:faceBoxes:cancel:", v40, v22, v41);
  if (v39)
  {
    v19 = 1;
  }
  else
  {
    for (i = 0; objc_msgSend(v40, "count") > i; ++i)
    {
      objc_msgSend(v40, "objectAtIndexedSubscript:", i);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v25 = (float)(HIDWORD(v43) - 1);
      *(float *)&v26 = (float)(v43 - 1);
      objc_msgSend(v24, "getCGRectWithClipWidth:height:", v25, v26);
      v46[0] = CFSTR("petsBounds");
      NSStringFromRect(v48);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = CFSTR("petsConfidence");
      v47[0] = v27;
      v28 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v24, "confidence");
      objc_msgSend(v28, "numberWithFloat:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v30);

    }
    for (j = 0; objc_msgSend(v22, "count") > j; ++j)
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", j);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v33 = (float)(HIDWORD(v43) - 1);
      *(float *)&v34 = (float)(v43 - 1);
      objc_msgSend(v32, "getCGRectWithClipWidth:height:", v33, v34);
      v44[0] = CFSTR("petsBounds");
      NSStringFromRect(v49);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = CFSTR("petsConfidence");
      v45[0] = v35;
      v36 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v32, "confidence");
      objc_msgSend(v36, "numberWithFloat:");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v37;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v38);

    }
    v19 = 0;
  }

  v17 = 0;
LABEL_14:
  objc_autoreleasePoolPop(v11);
  if ((v19 | 4) == 4)
    v20 = v17;
  else
    v20 = v39;

  return v20;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_DWORD *)self + 6) = 0;
  return self;
}

@end
