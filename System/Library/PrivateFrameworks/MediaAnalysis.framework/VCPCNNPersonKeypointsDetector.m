@implementation VCPCNNPersonKeypointsDetector

- (VCPCNNPersonKeypointsDetector)initWithForceCPU:(BOOL)a3 sharedModel:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  VCPCNNPersonKeypointsDetector *v6;
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
  VCPCNNPersonKeypointsDetector *v17;
  VCPCNNModelEspresso *v18;
  VCPCNNModelEspresso *v19;
  VCPCNNModelEspresso *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  size_t v24;
  VCPCNNModelEspresso *v25;
  VCPCNNModelEspresso *v26;
  VCPCNNModelEspresso *v27;
  VCPCNNModelEspresso *v28;
  int v29;
  VCPCNNPersonKeypointsDetector *v30;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  objc_super v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v4 = a4;
  v5 = a3;
  v38[2] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)VCPCNNPersonKeypointsDetector;
  v6 = -[VCPCNNPersonKeypointsDetector init](&v36, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resourceURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_human_pose_single.espresso.net"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [VCPCNNModelEspresso alloc];
    v37[0] = CFSTR("forceCPU");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v11;
    v37[1] = CFSTR("sharedContext");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:](v10, "initWithParameters:inputNames:outputNames:properties:", v9, 0, 0, v13);
    modelEspresso = v6->_modelEspresso;
    v6->_modelEspresso = (VCPCNNModelEspresso *)v14;

    v16 = v6->_modelEspresso;
    if (!v16 || -[VCPCNNModelEspresso prepareModelWithConfig:](v16, "prepareModelWithConfig:", &stru_1E6B1C190))
    {
      v17 = 0;
LABEL_26:

      goto LABEL_27;
    }
    v18 = v6->_modelEspresso;
    if (v18 && (-[VCPCNNModelEspresso inputBlob](v18, "inputBlob"), (v19 = v6->_modelEspresso) != 0))
    {
      -[VCPCNNModelEspresso inputBlob](v19, "inputBlob");
      v20 = v6->_modelEspresso;
      v21 = v33 * v35;
      if (v20)
      {
        -[VCPCNNModelEspresso inputBlob](v20, "inputBlob");
        v22 = v32;
        goto LABEL_12;
      }
    }
    else
    {
      v21 = 0;
    }
    v22 = 0;
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
      v6->_inputWidth = v34;
      if (v26)
      {
        -[VCPCNNModelEspresso inputBlob](v26, "inputBlob");
        v27 = v6->_modelEspresso;
        v6->_inputHeight = v35;
        if (v27)
        {
          -[VCPCNNModelEspresso outputBlob](v27, "outputBlob");
          v28 = v6->_modelEspresso;
          v6->_outputWidth = v34;
          if (v28)
          {
            -[VCPCNNModelEspresso outputBlob](v28, "outputBlob");
            v29 = v35;
          }
          else
          {
            v29 = 0;
          }
          goto LABEL_23;
        }
LABEL_22:
        v29 = 0;
        v6->_outputWidth = 0;
LABEL_23:
        v6->_outputHeight = v29;
        if (v6->_inputData)
          v17 = v6;
        else
          v17 = 0;
        goto LABEL_26;
      }
    }
    else
    {
      v6->_inputWidth = 0;
    }
    v6->_inputHeight = 0;
    goto LABEL_22;
  }
  v17 = 0;
LABEL_27:
  v30 = v17;

  return v30;
}

- (void)dealloc
{
  float *inputData;
  objc_super v4;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNPersonKeypointsDetector;
  -[VCPCNNPersonKeypointsDetector dealloc](&v4, sel_dealloc);
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6
{
  int Width;
  int Height;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *BaseAddress;
  int BytesPerRow;
  double v33;
  int padY;
  int v35;
  float *v36;
  float *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t padX;
  float *v41;
  float *v42;
  float *v43;
  double v44;
  double v45;
  int v46;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369)
  {
LABEL_8:
    LODWORD(v15) = -50;
    return v15;
  }
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBuffer = a3;
  unlockFlags = 1;
  if (!a3)
  {
    v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v22)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_8;
  }
  v13 = Height;
  v14 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  v46 = v14;
  if ((_DWORD)v14)
  {
    v15 = v14;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[VCPImageConverter convertImage:yuvFrame:].cold.3((uint64_t)a3, v15, v16, v17, v18, v19, v20, v21);
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    bzero(a4, 12 * a5 * (uint64_t)a6);
    padY = self->_padY;
    if (padY + v13 >= 1)
    {
      v35 = 0;
      v36 = &a4[2 * a6 * a5];
      v37 = &a4[a6 * a5];
      v38 = 4 * a6;
      do
      {
        if (v35 >= padY)
        {
          if (Width >= 1)
          {
            v39 = 0;
            padX = self->_padX;
            v41 = &v36[padX];
            v42 = &v37[padX];
            v43 = &a4[padX];
            do
            {
              LOBYTE(v33) = BaseAddress[(int)(v39 * 4)];
              v44 = ((double)*(unint64_t *)&v33 / 255.0 + -0.405999988) / 0.224999994;
              *(float *)&v44 = v44;
              v41[v39] = *(float *)&v44;
              LOBYTE(v44) = BaseAddress[(int)(v39 * 4) + 1];
              v45 = ((double)*(unint64_t *)&v44 / 255.0 + -0.456) / 0.224000007;
              *(float *)&v45 = v45;
              v42[v39] = *(float *)&v45;
              LOBYTE(v45) = BaseAddress[(int)(v39 * 4) + 2];
              v33 = ((double)*(unint64_t *)&v45 / 255.0 + -0.485000014) / 0.229000002;
              *(float *)&v33 = v33;
              v43[v39++] = *(float *)&v33;
            }
            while (Width != v39);
          }
          BaseAddress += BytesPerRow;
        }
        ++v35;
        v36 = (float *)((char *)v36 + v38);
        v37 = (float *)((char *)v37 + v38);
        a4 = (float *)((char *)a4 + v38);
      }
      while (v35 != padY + v13);
    }
    LODWORD(v15) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v46);
    if (pixelBuffer
      && !v46
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
    }
  }
  return v15;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 box:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  id v12;
  int Width;
  int Height;
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
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  double v39;
  double v40;
  int padX;
  int padY;
  float v44;
  CFTypeRef cf;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  double v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  uint64_t v56;
  CGRect v57;

  v7 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a5;
  v56 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  if (a3)
  {
    Width = CVPixelBufferGetWidth(a4);
    Height = CVPixelBufferGetHeight(a4);
    cf = 0;
    objc_msgSend(v12, "minX");
    v44 = v15;
    objc_msgSend(v12, "minY");
    v17 = v16;
    objc_msgSend(v12, "maxX");
    v19 = v18;
    objc_msgSend(v12, "minX");
    v21 = v20;
    objc_msgSend(v12, "maxY");
    v23 = v22;
    objc_msgSend(v12, "minY");
    v25 = v24;
    objc_msgSend(v12, "maxX");
    v27 = v26;
    objc_msgSend(v12, "minX");
    v29 = v28;
    objc_msgSend(v12, "maxY");
    v31 = v30;
    objc_msgSend(v12, "minY");
    v33 = (float)((float)((float)(v27 - v29) / (float)(v31 - v32)) * (float)Width) / (float)Height;
    if (v33 <= (float)((float)(int)v7 / (float)(int)v8))
    {
      v36 = 0;
      v37 = (int)(float)(v33 * (float)(int)v8);
      v34 = (int)((double)(self->_inputWidth - (int)v37) * 0.5);
      v35 = v8;
    }
    else
    {
      v34 = 0;
      v35 = (int)(float)((float)(int)v7 / v33);
      v36 = (int)((double)(self->_inputHeight - (int)v35) * 0.5);
      v37 = v7;
    }
    self->_padX = v34;
    self->_padY = v36;
    v39 = v17;
    v40 = (float)(v19 - v21);
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      padX = self->_padX;
      padY = self->_padY;
      *(_DWORD *)buf = 67110144;
      v47 = v37;
      v48 = 1024;
      v49 = v35;
      v50 = 2048;
      v51 = v33;
      v52 = 1024;
      v53 = padX;
      v54 = 1024;
      v55 = padY;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPCNNPersonKeypointsDetector - cropWidth = %d, cropHeight = %d, boxWHRatio = %f, _paxX = %d, _padY = %d", buf, 0x24u);
    }
    v57.origin.x = v44;
    v57.origin.y = v39;
    v57.size.width = v40;
    v57.size.height = (float)(v23 - v25);
    v38 = Scaler::ScaleCropped(&self->_scaler, v57, a4, (__CVBuffer **)&cf, v37, v35, 1111970369);
    if (!v38)
      v38 = -[VCPCNNPersonKeypointsDetector copyImage:toData:cnnInputHeight:cnnInputWidth:](self, "copyImage:toData:cnnInputHeight:cnnInputWidth:", cf, a3, v8, v7);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    v38 = -108;
  }

  return v38;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withBox:(id)a4 keypoints:(id)a5 padX:(int *)a6 padY:(int *)a7
{
  id v12;
  id v13;
  size_t Height;
  void *v15;
  int v16;

  v12 = a4;
  v13 = a5;
  CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v15 = (void *)MEMORY[0x1BCCA1B2C](Height);
  v16 = -[VCPCNNPersonKeypointsDetector createInput:withBuffer:cnnInputHeight:cnnInputWidth:box:](self, "createInput:withBuffer:cnnInputHeight:cnnInputWidth:box:", self->_inputData, a3, self->_inputHeight, self->_inputWidth, v12);
  if (!v16)
  {
    *a6 = self->_padX;
    *a7 = self->_padY;
    v16 = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", self->_inputData);
    if (!v16)
      v16 = -[VCPCNNPersonKeypointsDetector parseKeypoints:](self, "parseKeypoints:", v13);
  }
  objc_autoreleasePoolPop(v15);

  return v16;
}

- (int)parseKeypoints:(id)a3
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
  int v14;
  float v15;
  float v16;
  int v17;
  float v18;
  float v19;
  int v20;
  float v21;
  uint64_t i;
  float v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  int v31;
  id v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  _QWORD v37[5];

  v37[3] = *MEMORY[0x1E0C80C00];
  v32 = a3;
  modelEspresso = self->_modelEspresso;
  if (!modelEspresso)
  {
    v31 = 0;
    goto LABEL_7;
  }
  -[VCPCNNModelEspresso outputBlob](modelEspresso, "outputBlob");
  v6 = self->_modelEspresso;
  v31 = v36;
  if (!v6)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  -[VCPCNNModelEspresso outputBlob](v6, "outputBlob");
  v7 = v35;
  v8 = self->_modelEspresso;
  if (!v8)
  {
LABEL_8:
    v11 = 0;
    v10 = 0;
    goto LABEL_9;
  }
  -[VCPCNNModelEspresso outputBlob](v8, "outputBlob");
  v9 = self->_modelEspresso;
  v10 = v34;
  if (v9)
  {
    -[VCPCNNModelEspresso outputBlob](v9, "outputBlob");
    v11 = v33;
  }
  else
  {
    v11 = 0;
  }
LABEL_9:
  v12 = -50;
  if (v7 && v10)
  {
    if (v31 >= 1)
    {
      v13 = 0;
      v14 = 0;
      v15 = (float)(self->_inputWidth / v10);
      v16 = (float)(self->_inputHeight / v7);
      do
      {
        if (v7 < 1)
        {
          LODWORD(v4) = 0;
          v19 = 1.1755e-38;
          v21 = 0.0;
          v18 = 0.0;
        }
        else
        {
          v17 = 0;
          v18 = 0.0;
          v19 = 1.1755e-38;
          v20 = v13;
          v21 = 0.0;
          LODWORD(v4) = 0;
          do
          {
            if (v10 >= 1)
            {
              for (i = 0; i != v10; ++i)
              {
                v23 = *(float *)(v11 + 4 * (v20 + (int)i));
                if (v23 > 0.1)
                {
                  if (v18 <= v23)
                    v18 = *(float *)(v11 + 4 * (v20 + (int)i));
                  *(float *)&v4 = *(float *)&v4 + (float)((float)(int)i * v23);
                  v21 = v21 + (float)((float)v17 * v23);
                  v19 = v19 + v23;
                }
              }
            }
            ++v17;
            v20 += v10;
          }
          while (v17 != v7);
        }
        *(float *)&v4 = (float)(*(float *)&v4 / v19) * v15;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v24;
        *(float *)&v25 = (float)(v21 / v19) * v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v26;
        *(float *)&v27 = v18;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v37[2] = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v29);

        ++v14;
        v13 += v7 * v10;
      }
      while (v14 != v31);
    }
    v12 = 0;
  }

  return v12;
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
  *((_QWORD *)self + 8) = 0;
  *((_DWORD *)self + 18) = 0;
  return self;
}

@end
