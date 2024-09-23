@implementation VCPLandmarkValidator

- (VCPLandmarkValidator)initWithModelFile:(id)a3 paramFile:(__sFILE *)a4 numTri:(unsigned __int8)a5 triList:(char *)a6 angle:(float *)a7
{
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  VCPLandmarkValidator *v15;
  VCPCNNModel *v16;
  VCPCNNModel *model;
  VCPCNNModel *v18;
  void *v19;
  uint64_t v20;
  VCPCNNData *input;
  void *v22;
  int v23;
  void *v24;
  VCPCNNFlattenBlock *v25;
  void *v26;
  void *v27;
  VCPCNNModel *v28;
  void *v29;
  float *v30;
  char *v31;
  char *v32;
  float *orientation;
  uint64_t v34;
  VCPLandmarkValidator *v35;
  VCPLandmarkValidator *v36;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  float *v42;
  objc_super v44;

  v11 = a3;
  v12 = +[VCPCNNMetalContext supportGPU](VCPCNNMetalContext, "supportGPU");
  v42 = a7;
  if (+[VCPCNNMetalContext supportVectorForward](VCPCNNMetalContext, "supportVectorForward"))
    v13 = 4;
  else
    v13 = 1;
  if (v12)
    v14 = 1;
  else
    v14 = v13;
  v44.receiver = self;
  v44.super_class = (Class)VCPLandmarkValidator;
  v15 = -[VCPLandmarkValidator init](&v44, sel_init);
  if (!v15)
    goto LABEL_30;
  v16 = -[VCPCNNModel initWithParameters:useGPU:]([VCPCNNModel alloc], "initWithParameters:useGPU:", 1, v12);
  model = v15->_model;
  v15->_model = v16;

  v18 = v15->_model;
  if (!v18)
    goto LABEL_29;
  -[VCPCNNModel getGPUContext](v18, "getGPUContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPCNNData cnnDataWithPlane:height:width:context:](VCPCNNData, "cnnDataWithPlane:height:width:context:", 1, 66, 66, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  input = v15->_input;
  v15->_input = (VCPCNNData *)v20;

  -[VCPCNNData allocBuffers:](v15->_input, "allocBuffers:", 1);
  BYTE4(v38) = 1;
  LODWORD(v38) = 1;
  +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:groups:stride:batchNorm:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:groups:stride:batchNorm:", 7, 10, v14, 1, 0, 1, v38);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[VCPCNNModel add:](v15->_model, "add:", v22);
  if (!v23)
  {
    +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", 2, 2, v14);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[VCPCNNModel add:](v15->_model, "add:", v41);
    if (!v23)
    {
      BYTE4(v39) = 1;
      LODWORD(v39) = 1;
      +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:groups:stride:batchNorm:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:groups:stride:batchNorm:", 7, 10, v14, 1, 0, 1, v39);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[VCPCNNModel add:](v15->_model, "add:", v24);
      if (!v23)
      {
        +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", 2, 2, v14);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[VCPCNNModel add:](v15->_model, "add:", v40);
        if (!v23)
        {
          if (v12
            || (v25 = -[VCPCNNFlattenBlock initWithParameters:]([VCPCNNFlattenBlock alloc], "initWithParameters:", v13), v23 = -[VCPCNNModel add:](v15->_model, "add:", v25), v25, !v23))
          {
            +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:NeuronType:](VCPCNNFullConnectionBlock, "fcBlockWithNumNeurons:NeuronType:", 50, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[VCPCNNModel add:](v15->_model, "add:", v26);
            if (!v23)
            {
              +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:NeuronType:](VCPCNNFullConnectionBlock, "fcBlockWithNumNeurons:NeuronType:", 2, 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = -[VCPCNNModel add:](v15->_model, "add:", v27);
              if (!v23)
              {
                v28 = v15->_model;
                -[VCPCNNData size](v15->_input, "size");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = -[VCPCNNModel prepareNetworkFromURL:withInputSize:](v28, "prepareNetworkFromURL:withInputSize:", v11, v29);

                if (!v23)
                {
                  v30 = (float *)operator new[]();
                  v15->_meanLandmarkLoc = v30;
                  if (fread(v30, 4uLL, 0x7EuLL, a4) == 126
                    && (v31 = (char *)operator new[](), v15->_triIndexMap = v31, fread(v31, 1uLL, 0x1104uLL, a4) == 4356))
                  {
                    v15->_numTri = a5;
                    v32 = (char *)operator new[]();
                    v15->_triList = v32;
                    memcpy(v32, a6, 3 * v15->_numTri);
                    v15->_orientation = (float *)operator new[]();
                    v15->_transArray = (float *)operator new[]();
                    orientation = v15->_orientation;
                    if (orientation)
                    {
                      v23 = 0;
                      v34 = *(_QWORD *)v42;
                      orientation[2] = v42[2];
                      *(_QWORD *)orientation = v34;
                    }
                    else
                    {
                      v23 = -108;
                    }
                  }
                  else
                  {
                    v23 = -19;
                  }
                }
              }

            }
          }
        }

      }
    }

  }
  if (v23)
LABEL_29:
    v35 = 0;
  else
LABEL_30:
    v35 = v15;
  v36 = v35;

  return v36;
}

- (void)dealloc
{
  float *transArray;
  float *meanLandmarkLoc;
  char *triIndexMap;
  char *triList;
  float *orientation;
  objc_super v8;

  transArray = self->_transArray;
  if (transArray)
    MEMORY[0x1BCCA128C](transArray, 0x1000C8052888210);
  meanLandmarkLoc = self->_meanLandmarkLoc;
  if (meanLandmarkLoc)
    MEMORY[0x1BCCA128C](meanLandmarkLoc, 0x1000C8052888210);
  triIndexMap = self->_triIndexMap;
  if (triIndexMap)
    MEMORY[0x1BCCA128C](triIndexMap, 0x1000C8077774924);
  triList = self->_triList;
  if (triList)
    MEMORY[0x1BCCA128C](triList, 0x1000C8077774924);
  orientation = self->_orientation;
  if (orientation)
    MEMORY[0x1BCCA128C](orientation, 0x1000C8052888210);
  v8.receiver = self;
  v8.super_class = (Class)VCPLandmarkValidator;
  -[VCPLandmarkValidator dealloc](&v8, sel_dealloc);
}

- (int)validateOneImage:(__CVBuffer *)a3 landmarks:(float *)a4 numofLandmarks:(int)a5 score:(float *)a6
{
  signed int WidthOfPlane;
  signed int HeightOfPlane;
  size_t BytesPerRowOfPlane;
  uint64_t v12;
  uint64_t v13;
  float *meanLandmarkLoc;
  char *v15;
  unsigned int v16;
  uint64_t v17;
  float *v18;
  unsigned int v19;
  float v20;
  uint8_t *v21;
  int v22;
  CVReturn v23;
  int v24;
  _BYTE *BaseAddressOfPlane;
  float *v26;
  uint64_t v27;
  float v28;
  float v29;
  float *v30;
  float *v31;
  uint64_t v32;
  float v33;
  char v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  signed int v38;
  signed int v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  float v47;
  float v48;
  size_t v49;
  size_t v50;
  unsigned int v51;
  float v52;
  float v53;
  uint64_t v54;
  float v55;
  char *triIndexMap;
  uint64_t i;
  float v58;
  void *v59;
  int v60;
  void *v61;
  _BOOL8 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v72;
  unint64_t v73;
  float *__C;
  float *__Ca;
  float v76;
  float v77;
  uint8_t buf[4];
  uint64_t v79;
  __int16 v80;
  int v81;
  float v82[2];
  CVPixelBufferRef v83;
  CVPixelBufferLockFlags unlockFlags;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  if (self->_numTri)
  {
    v12 = 0;
    v73 = 0;
    __C = self->_transArray;
    while (1)
    {
      v13 = 0;
      meanLandmarkLoc = self->_meanLandmarkLoc;
      v72 = v12;
      v15 = &self->_triList[v12];
      do
      {
        v16 = *v15++;
        v17 = 2 * v16;
        v18 = &v82[v13];
        *v18 = a4[v17];
        v19 = (2 * v16) | 1;
        v18[3] = a4[v19];
        v18[6] = 1.0;
        v20 = meanLandmarkLoc[v17] * 66.0;
        v21 = &buf[v13 * 4];
        *(float *)v21 = v20;
        *((float *)v21 + 3) = meanLandmarkLoc[v19] * 66.0;
        *((_DWORD *)v21 + 6) = 1065353216;
        ++v13;
      }
      while (v13 != 3);
      v22 = vcp_matrix_invert((float *)buf, 3);
      if (v22)
        return v22;
      matrix_multiplication(v82, (const float *)buf, __C, 3, 3, 3);
      v12 = v72 + 3;
      ++v73;
      __C += 9;
      if (v73 >= self->_numTri)
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v82[0] = 0.0;
    v83 = a3;
    unlockFlags = 1;
    if (a3)
    {
      v23 = CVPixelBufferLockBaseAddress(a3, 1uLL);
      LODWORD(v82[0]) = v23;
      if (!v23
        || (v24 = v23, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        && (*(float *)buf = 3.8521e-34,
            v79 = (uint64_t)v83,
            v80 = 1024,
            v81 = v24,
            _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v24 = LODWORD(v82[0])) == 0))
      {
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
        v26 = -[VCPCNNData data](self->_input, "data");
        v27 = 0;
        v28 = 0.0;
        v29 = 255.0;
        v30 = 0;
        v31 = v26;
        do
        {
          v32 = 0;
          __Ca = v30;
          v33 = (float)(int)v30;
          do
          {
            v34 = self->_triIndexMap[v27 + v32];
            if (v34)
            {
              *(float *)buf = (float)(int)v32;
              v79 = LODWORD(v33) | 0x3F80000000000000;
              matrix_multiplication(&self->_transArray[9 * (v34 - 1)], (const float *)buf, &v76, 3, 3, 1);
              v38 = vcvtms_s32_f32(v76);
              v39 = vcvtms_s32_f32(v77);
              if (WidthOfPlane >= v38)
                v40 = v38;
              else
                v40 = WidthOfPlane;
              v41 = v40 & ~(v40 >> 31);
              if (v38 + 1 < WidthOfPlane)
                v42 = v38 + 1;
              else
                v42 = WidthOfPlane;
              v43 = v42 & ~(v42 >> 31);
              if (HeightOfPlane >= v39)
                v44 = v39;
              else
                v44 = HeightOfPlane;
              v45 = v44 & ~(v44 >> 31);
              if (v39 + 1 < HeightOfPlane)
                v46 = v39 + 1;
              else
                v46 = HeightOfPlane;
              v47 = v76 - (float)(int)v41;
              v48 = v77 - (float)(int)v45;
              v49 = BytesPerRowOfPlane * v45;
              v50 = BytesPerRowOfPlane * (v46 & ~(v46 >> 31));
              LOBYTE(v35) = BaseAddressOfPlane[v49 + v41];
              LOBYTE(v36) = BaseAddressOfPlane[v49 + v43];
              *(float *)&v51 = v47 * (float)v36;
              v52 = *(float *)&v51 + (float)((float)v35 * (float)(1.0 - v47));
              LOBYTE(v51) = BaseAddressOfPlane[v50 + v41];
              LOBYTE(v37) = BaseAddressOfPlane[v50 + v43];
              v53 = (float)(v48 * (float)((float)(v47 * (float)v37) + (float)((float)v51 * (float)(1.0 - v47))))
                  + (float)(v52 * (float)(1.0 - v48));
              v29 = fminf(v29, v53);
              v28 = fmaxf(v28, v53);
              v31[v32] = v53;
            }
            else
            {
              v31[v32] = 0.0;
            }
            ++v32;
          }
          while (v32 != 66);
          v30 = (float *)((char *)__Ca + 1);
          v31 += 66;
          v27 += 66;
        }
        while (__Ca != (float *)65);
        v24 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)v82);
        if (!v24)
        {
          v54 = 0;
          v55 = fmax((float)(v28 - v29), 1.0);
          triIndexMap = self->_triIndexMap;
          do
          {
            for (i = 0; i != 66; ++i)
            {
              if (triIndexMap[i])
                v58 = (float)(v26[i] - v29) / v55;
              else
                v58 = 0.0;
              v26[i] = v58;
            }
            ++v54;
            v26 += 66;
            triIndexMap += 66;
          }
          while (v54 != 66);
          v24 = -[VCPCNNModel forward:](self->_model, "forward:", self->_input);
          if (!v24)
          {
            -[VCPCNNModel output](self->_model, "output");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v59, "softmax");

            v24 = v60;
            if (!v60)
            {
              -[VCPCNNModel output](self->_model, "output");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *a6 = *(float *)(objc_msgSend(v61, "data") + 4);

              v24 = 0;
            }
          }
        }
      }
    }
    else
    {
      v62 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v62)
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v62, v63, v64, v65, v66, v67, v68, v69);
      v24 = -50;
      v82[0] = NAN;
    }
    if (v83
      && !LODWORD(v82[0])
      && CVPixelBufferUnlockBaseAddress(v83, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
    }
  }
  return v24;
}

- (float)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(float *)a3
{
  self->_orientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
