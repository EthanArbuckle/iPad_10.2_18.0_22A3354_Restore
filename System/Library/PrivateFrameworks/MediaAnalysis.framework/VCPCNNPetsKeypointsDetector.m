@implementation VCPCNNPetsKeypointsDetector

- (VCPCNNPetsKeypointsDetector)initWithForceCPU:(BOOL)a3 sharedModel:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  VCPCNNPetsKeypointsDetector *v6;
  void *v7;
  void *v8;
  void *v9;
  VCPCNNModelEspresso *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v16;
  VCPCNNPetsKeypointsDetector *v17;
  VCPCNNModelEspresso *v18;
  VCPCNNModelEspresso *v19;
  VCPCNNModelEspresso *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  size_t v24;
  VCPCNNModelEspresso *v25;
  VCPCNNModelEspresso *v26;
  int v27;
  VCPCNNPetsKeypointsDetector *v28;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  objc_super v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v4 = a4;
  v5 = a3;
  v36[2] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)VCPCNNPetsKeypointsDetector;
  v6 = -[VCPCNNPetsKeypointsDetector init](&v34, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resourceURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_pet_pose.espresso.net"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [VCPCNNModelEspresso alloc];
    v35[0] = CFSTR("forceCPU");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v11;
    v35[1] = CFSTR("sharedContext");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:](v10, "initWithParameters:inputNames:outputNames:properties:", v9, 0, 0, v13);
    modelEspresso = v6->_modelEspresso;
    v6->_modelEspresso = (VCPCNNModelEspresso *)v14;

    v16 = v6->_modelEspresso;
    if (!v16 || -[VCPCNNModelEspresso prepareModelWithConfig:](v16, "prepareModelWithConfig:", &stru_1E6B1C190))
    {
      v17 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v18 = v6->_modelEspresso;
    if (v18 && (-[VCPCNNModelEspresso inputBlob](v18, "inputBlob"), (v19 = v6->_modelEspresso) != 0))
    {
      -[VCPCNNModelEspresso inputBlob](v19, "inputBlob");
      v20 = v6->_modelEspresso;
      v21 = v31 * v33;
      if (v20)
      {
        -[VCPCNNModelEspresso inputBlob](v20, "inputBlob");
        v22 = v30;
LABEL_12:
        v23 = v21 * v22;
        if (v23 >> 62)
          v24 = -1;
        else
          v24 = 4 * v23;
        v6->_inputData = (float *)operator new[](v24, MEMORY[0x1E0DE4E10]);
        v25 = v6->_modelEspresso;
        if (v25)
        {
          -[VCPCNNModelEspresso inputBlob](v25, "inputBlob");
          v26 = v6->_modelEspresso;
          v6->_inputWidth = v32;
          if (v26)
          {
            -[VCPCNNModelEspresso inputBlob](v26, "inputBlob");
            v27 = v33;
          }
          else
          {
            v27 = 0;
          }
        }
        else
        {
          v27 = 0;
          v6->_inputWidth = 0;
        }
        v6->_inputHeight = v27;
        if (v6->_inputData)
          v17 = v6;
        else
          v17 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      v21 = 0;
    }
    v22 = 0;
    goto LABEL_12;
  }
  v17 = 0;
LABEL_24:
  v28 = v17;

  return v28;
}

- (void)dealloc
{
  float *inputData;
  objc_super v4;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNPetsKeypointsDetector;
  -[VCPCNNPetsKeypointsDetector dealloc](&v4, sel_dealloc);
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
            v34 = ((double)*(unint64_t *)&v28 / 255.0 + -0.485000014) / 0.229000002;
            *(float *)&v34 = v34;
            v30[i] = *(float *)&v34;
            LOBYTE(v34) = BaseAddress[(int)(i * 4) + 1];
            v35 = ((double)*(unint64_t *)&v34 / 255.0 + -0.456) / 0.224000007;
            *(float *)&v35 = v35;
            v31[i] = *(float *)&v35;
            LOBYTE(v35) = BaseAddress[(int)(i * 4) + 2];
            v28 = ((double)*(unint64_t *)&v35 / 255.0 + -0.405999988) / 0.224999994;
            *(float *)&v28 = v28;
            a4[i] = *(float *)&v28;
          }
        }
        BaseAddress += BytesPerRow;
        ++v29;
        a4 = (float *)((char *)a4 + v32);
        v31 = (float *)((char *)v31 + v32);
        v30 = (float *)((char *)v30 + v32);
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

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 box:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  id v12;
  void *v13;
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
  int v25;
  CFTypeRef cf;
  CGRect v28;

  v7 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a5;
  v12 = a7;
  v13 = v12;
  if (a3)
  {
    cf = 0;
    objc_msgSend(v12, "minX");
    v15 = v14;
    objc_msgSend(v13, "minY");
    v17 = v16;
    objc_msgSend(v13, "maxX");
    v19 = v18;
    objc_msgSend(v13, "minX");
    v21 = v20;
    objc_msgSend(v13, "maxY");
    v23 = v22;
    objc_msgSend(v13, "minY");
    v28.origin.y = v17;
    v28.size.width = (float)(v19 - v21);
    v28.size.height = (float)(v23 - v24);
    v28.origin.x = v15;
    v25 = Scaler::ScaleCropped(&self->_scaler, v28, a4, (__CVBuffer **)&cf, v7, v8, 1111970369);
    if (!v25)
      v25 = -[VCPCNNPetsKeypointsDetector copyImage:toData:](self, "copyImage:toData:", cf, a3);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    v25 = -108;
  }

  return v25;
}

- (int)parseHeatmap2Keypoints:(id)a3
{
  double v4;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v6;
  int v7;
  VCPCNNModelEspresso *v8;
  VCPCNNModelEspresso *v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  float v14;
  float v15;
  int v16;
  float v17;
  float v18;
  int v19;
  float v20;
  uint64_t i;
  float v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  int v33;
  id v34;
  uint8_t buf[80];
  int v36;
  int v37;
  int v38;
  _QWORD v39[5];

  v39[3] = *MEMORY[0x1E0C80C00];
  v34 = a3;
  modelEspresso = self->_modelEspresso;
  if (!modelEspresso)
  {
    v33 = 0;
    goto LABEL_8;
  }
  -[VCPCNNModelEspresso outputBlob](modelEspresso, "outputBlob");
  v6 = self->_modelEspresso;
  v33 = v38;
  if (!v6)
  {
LABEL_8:
    v7 = 0;
LABEL_9:
    v11 = 0;
    v10 = 0;
    if (!v7)
      goto LABEL_31;
    goto LABEL_10;
  }
  -[VCPCNNModelEspresso outputBlob](v6, "outputBlob");
  v7 = v37;
  v8 = self->_modelEspresso;
  if (!v8)
    goto LABEL_9;
  -[VCPCNNModelEspresso outputBlob](v8, "outputBlob");
  v9 = self->_modelEspresso;
  v10 = v36;
  if (v9)
  {
    -[VCPCNNModelEspresso outputBlob](v9, "outputBlob");
    v11 = *(_QWORD *)buf;
    if (!v37)
    {
LABEL_31:
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_35;
      *(_WORD *)buf = 0;
      v30 = MEMORY[0x1E0C81028];
      v31 = "Wrong outHeight in parseHeatmap2Keypoints";
LABEL_34:
      _os_log_impl(&dword_1B6C4A000, v30, OS_LOG_TYPE_ERROR, v31, buf, 2u);
LABEL_35:
      v29 = -50;
      goto LABEL_36;
    }
  }
  else
  {
    v11 = 0;
    if (!v37)
      goto LABEL_31;
  }
LABEL_10:
  if (!v10)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    *(_WORD *)buf = 0;
    v30 = MEMORY[0x1E0C81028];
    v31 = "Wrong outWidth in parseHeatmap2Keypoints";
    goto LABEL_34;
  }
  if (v33 >= 1)
  {
    v12 = 0;
    v13 = 0;
    v14 = (float)(self->_inputWidth / v10);
    v15 = (float)(self->_inputHeight / v7);
    do
    {
      if (v7 < 1)
      {
        LODWORD(v4) = 0;
        v18 = 1.1755e-38;
        v20 = 0.0;
        v17 = 0.0;
      }
      else
      {
        v16 = 0;
        v17 = 0.0;
        v18 = 1.1755e-38;
        v19 = v12;
        v20 = 0.0;
        LODWORD(v4) = 0;
        do
        {
          if (v10 >= 1)
          {
            for (i = 0; i != v10; ++i)
            {
              v22 = *(float *)(v11 + 4 * (v19 + (int)i));
              if (v22 > 0.1)
              {
                if (v17 <= v22)
                  v17 = *(float *)(v11 + 4 * (v19 + (int)i));
                *(float *)&v4 = *(float *)&v4 + (float)((float)(int)i * v22);
                v20 = v20 + (float)((float)v16 * v22);
                v18 = v18 + v22;
              }
            }
          }
          ++v16;
          v19 += v10;
        }
        while (v16 != v7);
      }
      *(float *)&v4 = (float)(*(float *)&v4 / v18) * v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v23;
      *(float *)&v24 = (float)(v20 / v18) * v15;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v25;
      *(float *)&v26 = v17;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", v28);

      ++v13;
      v12 += v7 * v10;
    }
    while (v13 != v33);
  }
  v29 = 0;
LABEL_36:

  return v29;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withBox:(id)a4 keypoints:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int Width;
  int Height;
  int v13;
  int v14;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1BCCA1B2C]();
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (Height >= Width)
    v13 = Width;
  else
    v13 = Height;
  if (v13 >= 64)
  {
    v14 = -[VCPCNNPetsKeypointsDetector createInput:withBuffer:cnnInputHeight:cnnInputWidth:box:](self, "createInput:withBuffer:cnnInputHeight:cnnInputWidth:box:", self->_inputData, a3, self->_inputHeight, self->_inputWidth, v8);
    if (!v14)
    {
      v14 = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", self->_inputData);
      if (!v14)
        v14 = -[VCPCNNPetsKeypointsDetector parseHeatmap2Keypoints:](self, "parseHeatmap2Keypoints:", v9);
    }
  }
  else
  {
    v14 = 0;
  }
  objc_autoreleasePoolPop(v10);

  return v14;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_DWORD *)self + 14) = 0;
  return self;
}

@end
