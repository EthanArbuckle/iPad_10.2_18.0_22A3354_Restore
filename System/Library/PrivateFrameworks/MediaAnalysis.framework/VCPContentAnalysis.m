@implementation VCPContentAnalysis

- (VCPContentAnalysis)init
{
  _BOOL8 v3;
  uint64_t v4;
  VCPContentAnalysis *v5;
  VCPCNNModel *v6;
  VCPCNNModel *model;
  void *v8;
  VCPContentAnalysis *v9;
  OSStatus v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  VCPCNNFlattenBlock *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  VCPCNNData *input;
  void *v23;
  uint64_t v24;
  VCPCNNModel *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v3 = +[VCPCNNMetalContext supportGPU](VCPCNNMetalContext, "supportGPU");
  if (v3 || !+[VCPCNNMetalContext supportVectorForward](VCPCNNMetalContext, "supportVectorForward"))
    v4 = 1;
  else
    v4 = 4;
  v30.receiver = self;
  v30.super_class = (Class)VCPContentAnalysis;
  v5 = -[VCPContentAnalysis init](&v30, sel_init);
  if (!v5)
    goto LABEL_21;
  v6 = -[VCPCNNModel initWithParameters:useGPU:]([VCPCNNModel alloc], "initWithParameters:useGPU:", 1, v3);
  model = v5->_model;
  v5->_model = v6;

  v8 = v5->_model;
  if (!v8)
  {
LABEL_22:
    v9 = v8;
    goto LABEL_23;
  }
  +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 5, 16, v4, 1, 0);
  v9 = (VCPContentAnalysis *)objc_claimAutoreleasedReturnValue();
  v10 = -[VCPCNNModel add:](v5->_model, "add:", v9);
  if (v10)
    goto LABEL_18;
  +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", 2, 2, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VCPCNNModel add:](v5->_model, "add:", v11);
  if (v10)
  {
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 5, 32, v4, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VCPCNNModel add:](v5->_model, "add:", v12);
  if (v10)
  {
LABEL_16:

    goto LABEL_17;
  }
  +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", 2, 2, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VCPCNNModel add:](v5->_model, "add:", v13);
  if (v10)
  {
LABEL_15:

    goto LABEL_16;
  }
  +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:", 5, 16, v4, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VCPCNNModel add:](v5->_model, "add:", v14);
  if (v10)
  {
LABEL_14:

    goto LABEL_15;
  }
  +[VCPCNNPoolingBlock poolingBlockWithPoolX:poolY:chunk:](VCPCNNPoolingBlock, "poolingBlockWithPoolX:poolY:chunk:", 2, 2, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VCPCNNModel add:](v5->_model, "add:", v15);
  if (v10
    || !v3
    && (v17 = -[VCPCNNFlattenBlock initWithParameters:]([VCPCNNFlattenBlock alloc], "initWithParameters:", v4), v10 = -[VCPCNNModel add:](v5->_model, "add:", v17), v17, v10))
  {

    goto LABEL_14;
  }
  +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:NeuronType:](VCPCNNFullConnectionBlock, "fcBlockWithNumNeurons:NeuronType:", 64, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VCPCNNModel add:](v5->_model, "add:", v18);
  if (v10)
  {
    v19 = 4;
  }
  else
  {
    +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:NeuronType:](VCPCNNFullConnectionBlock, "fcBlockWithNumNeurons:NeuronType:", 2, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[VCPCNNModel add:](v5->_model, "add:", v29);
    if (v10)
    {
      v19 = 4;
    }
    else
    {
      -[VCPCNNModel getGPUContext](v5->_model, "getGPUContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[VCPCNNData cnnDataWithPlane:height:width:context:](VCPCNNData, "cnnDataWithPlane:height:width:context:", 4, 64, 64, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      input = v5->_input;
      v5->_input = (VCPCNNData *)v21;

      -[VCPCNNData allocBuffers:](v5->_input, "allocBuffers:", 1);
      objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "resourceURL");
      v24 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v24;
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_content.dat"), v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v5->_model;
      -[VCPCNNData size](v5->_input, "size");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[VCPCNNModel prepareNetworkFromURL:withInputSize:](v25, "prepareNetworkFromURL:withInputSize:", v28, v26);

      if (v10)
      {
        v19 = 4;
      }
      else
      {
        v5->_previousContentType = 2;
        v5->_argbPixelBuffer = 0;
        v10 = VTPixelTransferSessionCreate(0, &v5->_argbTransferSession);
        v19 = 4 * (v10 != 0);
      }

    }
  }

  if ((v19 | 4) == 4)
  {
LABEL_19:
    if (v10)
    {
      v8 = 0;
      goto LABEL_22;
    }
LABEL_21:
    v8 = v5;
    goto LABEL_22;
  }
LABEL_23:

  return v9;
}

+ (id)contentAnalysis
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)dealloc
{
  __CVBuffer *argbPixelBuffer;
  OpaqueVTPixelTransferSession *argbTransferSession;
  objc_super v5;

  argbPixelBuffer = self->_argbPixelBuffer;
  if (argbPixelBuffer)
    CFRelease(argbPixelBuffer);
  argbTransferSession = self->_argbTransferSession;
  if (argbTransferSession)
    CFRelease(argbTransferSession);
  v5.receiver = self;
  v5.super_class = (Class)VCPContentAnalysis;
  -[VCPContentAnalysis dealloc](&v5, sel_dealloc);
}

- (void)copyBlock:(char *)a3 withStride:(unint64_t)a4 toBlock:(float *)a5
{
  double v5;
  int i;
  uint64_t j;

  for (i = 0; i != 64; ++i)
  {
    for (j = 0; j != 256; ++j)
    {
      LOBYTE(v5) = a3[j];
      v5 = ((double)*(unint64_t *)&v5 / 255.0 + -0.444431007) / 0.339706987;
      *(float *)&v5 = v5;
      a5[j] = *(float *)&v5;
    }
    a3 += a4;
    a5 += 256;
  }
}

- (int)blockContentDetection:(unint64_t *)a3
{
  size_t Width;
  size_t Height;
  __CVBuffer *argbPixelBuffer;
  CVReturn v8;
  int v9;
  char *BaseAddress;
  size_t BytesPerRow;
  uint64_t v12;
  int v13;
  float v14;
  float v15;
  uint64_t v16;
  char *v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  float v22;
  void *v23;
  float v24;
  void *v25;
  float v26;
  void *v27;
  void *v28;
  unsigned int v29;
  BOOL v30;
  unint64_t previousContentType;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v41;
  unint64_t *v42;
  int v43;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  uint64_t v46;
  _QWORD v47[3];
  _QWORD v48[3];
  uint8_t buf[4];
  __CVBuffer *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  Width = CVPixelBufferGetWidth(self->_argbPixelBuffer);
  Height = CVPixelBufferGetHeight(self->_argbPixelBuffer);
  v48[0] = 0;
  v48[1] = ((2 * Width) & 0xFFFFFFFFFFFFFFFCLL) - 132;
  v48[2] = 4 * Width - 260;
  v47[0] = 0;
  v47[1] = (Height >> 1) - 33;
  v47[2] = Height - 65;
  unlockFlags = 0;
  v46 = 0;
  argbPixelBuffer = self->_argbPixelBuffer;
  v43 = 0;
  pixelBuffer = argbPixelBuffer;
  if (argbPixelBuffer)
  {
    v42 = a3;
    v8 = CVPixelBufferLockBaseAddress(argbPixelBuffer, 0);
    v43 = v8;
    if (!v8
      || (v9 = v8, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      && (*(_DWORD *)buf = 134218240,
          v50 = argbPixelBuffer,
          v51 = 1024,
          v52 = v9,
          _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v9 = v43) == 0))
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(self->_argbPixelBuffer);
      BytesPerRow = CVPixelBufferGetBytesPerRow(self->_argbPixelBuffer);
      v12 = 0;
      v13 = 0;
      v14 = 0.0;
      v15 = 0.0;
      v41 = BaseAddress;
LABEL_6:
      v16 = 0;
      v17 = &BaseAddress[v47[v12] * BytesPerRow];
      while (1)
      {
        -[VCPContentAnalysis copyBlock:withStride:toBlock:](self, "copyBlock:withStride:toBlock:", &v17[v48[v16]], BytesPerRow, -[VCPCNNData data](self->_input, "data", v41));
        v9 = -[VCPCNNModel forward:](self->_model, "forward:", self->_input);
        if (v9)
          break;
        -[VCPCNNModel output](self->_model, "output");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v18, "softmax");

        if (v9)
          break;
        -[VCPCNNModel output](self->_model, "output");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(float *)objc_msgSend(v19, "data");
        -[VCPCNNModel output](self->_model, "output");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(float *)(objc_msgSend(v21, "data") + 4);
        ++*(_DWORD *)((unint64_t)&v46 | (4 * (v20 <= v22)));

        -[VCPCNNModel output](self->_model, "output");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(float *)objc_msgSend(v23, "data");

        -[VCPCNNModel output](self->_model, "output");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(float *)(objc_msgSend(v25, "data") + 4);

        -[VCPCNNModel output](self->_model, "output");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "data");

        -[VCPCNNModel output](self->_model, "output");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(float *)(objc_msgSend(v28, "data") + 4) > 0.95)
          ++v13;

        ++v16;
        v15 = v15 + v24;
        v14 = v14 + v26;
        if (v16 == 3)
        {
          ++v12;
          BaseAddress = v41;
          if (v12 != 3)
            goto LABEL_6;
          v9 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v43);
          if (!v9)
          {
            if (vabds_f32(v15, v14) <= 2.0)
              goto LABEL_33;
            v29 = v46 - HIDWORD(v46);
            if ((int)v46 - HIDWORD(v46) < 0)
              v29 = HIDWORD(v46) - v46;
            if (v29 < 2)
            {
LABEL_33:
              previousContentType = self->_previousContentType;
            }
            else
            {
              v30 = v13 >= 4 || v15 <= v14;
              previousContentType = 1;
              if (v30)
                previousContentType = 2;
            }
            v9 = 0;
            *v42 = previousContentType;
            self->_previousContentType = previousContentType;
          }
          break;
        }
      }
    }
  }
  else
  {
    v32 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v32)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v32, v33, v34, v35, v36, v37, v38, v39);
    v9 = -50;
    v43 = -50;
  }
  if (pixelBuffer
    && !v43
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
  }
  return v9;
}

- (int)detectPixelBuffer:(__CVBuffer *)a3 contentType:(unint64_t *)a4
{
  int result;
  size_t Width;
  size_t Height;
  unint64_t v10;
  float v11;
  signed int v12;
  signed int v13;
  __CVBuffer *argbPixelBuffer;
  __CVBuffer **p_argbPixelBuffer;
  size_t v16;

  result = -50;
  if (a3 && a4)
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    if (Width >= Height)
      v10 = Height;
    else
      v10 = Width;
    if (v10 < 0xC0)
      return -50;
    v11 = fminf((float)v10 / 192.0, 4.0);
    v12 = (vcvtps_s32_f32((float)Width / v11) + 1) & 0xFFFFFFFE;
    v13 = (vcvtps_s32_f32((float)Height / v11) + 1) & 0xFFFFFFFE;
    p_argbPixelBuffer = &self->_argbPixelBuffer;
    argbPixelBuffer = self->_argbPixelBuffer;
    v16 = v12;
    if (argbPixelBuffer)
    {
      if (CVPixelBufferGetWidth(argbPixelBuffer) == v12 && CVPixelBufferGetHeight(*p_argbPixelBuffer) == v13)
      {
LABEL_14:
        result = VTPixelTransferSessionTransferImage(self->_argbTransferSession, a3, self->_argbPixelBuffer);
        if (!result)
          return -[VCPContentAnalysis blockContentDetection:](self, "blockContentDetection:", a4);
        return result;
      }
      if (*p_argbPixelBuffer)
      {
        CFRelease(*p_argbPixelBuffer);
        *p_argbPixelBuffer = 0;
      }
    }
    result = CVPixelBufferCreate(0, v16, v13, 0x20u, 0, &self->_argbPixelBuffer);
    if (result)
      return result;
    goto LABEL_14;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
