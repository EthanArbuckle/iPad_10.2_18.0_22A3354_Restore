@implementation VCPImageMotionFlowAnalyzer

- (VCPImageMotionFlowAnalyzer)init
{

  return 0;
}

+ (id)analyzeWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 computationAccuracy:(unsigned int)a5 forceCPU:(BOOL)a6 sharedModel:(BOOL)a7 flushModel:(BOOL)a8 cancel:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v12;
  _BOOL8 v13;
  id v14;
  id v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v12 = *(_QWORD *)&a5;
  v13 = a3;
  v14 = a4;
  v15 = a9;
  v16 = objc_opt_class();
  if (v11 || (v17 = (objc_class *)v16, (DeviceHasANE() & 1) == 0))
    v17 = (objc_class *)objc_opt_class();
  v18 = (void *)objc_msgSend([v17 alloc], "initWithLightweightOption:aspectRatio:computationAccuracy:forceCPU:sharedModel:flushModel:cancel:", v13, v14, v12, v11, v10, v9, v15);

  return v18;
}

- (VCPImageMotionFlowAnalyzer)initWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 computationAccuracy:(unsigned int)a5 forceCPU:(BOOL)a6 sharedModel:(BOOL)a7 flushModel:(BOOL)a8 cancel:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v13;
  id v15;
  id v16;
  VCPImageMotionFlowAnalyzer *v17;
  MTLDeviceSPI *v18;
  MTLDeviceSPI *device;
  uint64_t v20;
  MTLCommandQueue *commandQueue;
  int v22;
  VCPImageMotionFlowAnalyzer *v23;
  VCPImageMotionFlowAnalyzer *v24;
  uint64_t v26;
  MPSImageBilinearScale *bilinearScale;
  double v28;
  void *v29;
  uint64_t v30;
  MPSImageSpatioTemporalGuidedFilter *guidedFilter;
  MPSImageSpatioTemporalGuidedFilter *v32;
  uint64_t v33;
  objc_super v34;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v13 = a3;
  v15 = a4;
  v16 = a9;
  v34.receiver = self;
  v34.super_class = (Class)VCPImageMotionFlowAnalyzer;
  v17 = -[VCPImageMotionFlowAnalyzer init](&v34, sel_init);
  if (!v17)
    goto LABEL_7;
  v18 = (MTLDeviceSPI *)MTLCreateSystemDefaultDevice();
  device = v17->_device;
  v17->_device = v18;

  v20 = -[MTLDeviceSPI newCommandQueue](v17->_device, "newCommandQueue");
  commandQueue = v17->_commandQueue;
  v17->_commandQueue = (MTLCommandQueue *)v20;

  v17->_computationAccuracy = a5;
  if (v11 || (DeviceHasANE() & 1) == 0)
    v22 = -[VCPImageMotionFlowAnalyzer prepareWithLightweightOption:aspectRatio:forceCPU:sharedModel:flushModel:](v17, "prepareWithLightweightOption:aspectRatio:forceCPU:sharedModel:flushModel:", v13, v15, v11, v10, v9);
  else
    v22 = -[VCPImageMotionFlowAnalyzer prepareWithLightweightOption:aspectRatio:numLevels:startLevel:cancel:](v17, "prepareWithLightweightOption:aspectRatio:numLevels:startLevel:cancel:", v13, v15, 7, 2, v16);
  if (v22)
    goto LABEL_7;
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E08]), "initWithDevice:", v17->_device);
  bilinearScale = v17->_bilinearScale;
  v17->_bilinearScale = (MPSImageBilinearScale *)v26;

  if (!v17->_bilinearScale)
    goto LABEL_7;
  LOBYTE(v33) = 1;
  LODWORD(v28) = 953267991;
  objc_msgSend(MEMORY[0x1E0CC6E98], "filterDescriptorWithWidth:height:arrayLength:kernelSpatialDiameter:kernelTemporalDiameter:epsilon:sourceChannels:guideChannels:preallocateIntermediates:", v17->_cnnInputWidth, (uint64_t)(v17->_cnnInputHeight + (v17->_cnnInputHeight < 0 ? 3 : 0)) >> 2, 1, 3, 1, 2, v28, 3, v33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E90]), "initWithDevice:filterDescriptor:", v17->_device, v29);
  guidedFilter = v17->_guidedFilter;
  v17->_guidedFilter = (MPSImageSpatioTemporalGuidedFilter *)v30;

  v32 = v17->_guidedFilter;
  v23 = v17;
  if (!v32)
LABEL_7:
    v23 = 0;
  v24 = v23;

  return v24;
}

- (int)prepareWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 forceCPU:(BOOL)a5 sharedModel:(BOOL)a6 flushModel:(BOOL)a7
{
  return -4;
}

- (int)prepareWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 numLevels:(int)a5 startLevel:(int)a6 cancel:(id)a7
{
  return -4;
}

- (int)reInitModel
{
  return -4;
}

- (int)configForAspectRatio:(id)a3
{
  return -4;
}

- (int)analyzeImages:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 cancel:(id)a5
{
  return -4;
}

- (float)getFlowWithHeight:(int *)a3 andWidth:(int *)a4
{
  return 0;
}

- (int)getFlowToBuffer:(__CVBuffer *)a3
{
  return -4;
}

- (int)flowScalingTo:(__CVBuffer *)a3 scalerX:(float)a4 scalerY:(float)a5
{
  return -4;
}

- (int)flowScalingTo:(__CVBuffer *)a3 flowBufferY:(__CVBuffer *)a4 scalerX:(float)a5 scalerY:(float)a6
{
  return -4;
}

- (int)scaleFlowTo:(__CVBuffer *)a3
{
  int Width;
  size_t cnnOutputHeight;
  size_t cnnOutputWidth;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  __CVBuffer *PixelBuffer;

  Width = CVPixelBufferGetWidth(a3);
  _S0 = (float)(int)CVPixelBufferGetHeight(a3);
  __asm
  {
    FCVT            H0, S0
    FCVT            S0, H0
  }
  cnnOutputHeight = self->_cnnOutputHeight;
  _S0 = _S0 / (float)(int)cnnOutputHeight;
  __asm { FCVT            H8, S0 }
  _S0 = (float)Width;
  __asm
  {
    FCVT            H0, S0
    FCVT            S0, H0
  }
  cnnOutputWidth = self->_cnnOutputWidth;
  _S0 = _S0 / (float)(int)cnnOutputWidth;
  __asm { FCVT            H9, S0 }
  PixelBuffer = VCPFlowCreatePixelBuffer(cnnOutputWidth, cnnOutputHeight, 0x32433068u, 32);
  __asm
  {
    FCVT            S0, H8
    FCVT            S1, H9
  }
  -[VCPImageMotionFlowAnalyzer flowScalingTo:scalerX:scalerY:](self, "flowScalingTo:scalerX:scalerY:", PixelBuffer, _D0, _D1);
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  createTextureFromBuffer(PixelBuffer, self->_device, 1, 1uLL);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  createTextureFromBuffer(a3, self->_device, 1, 1uLL);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  v26 = -108;
  if (v23 && v24)
  {
    -[MPSImageBilinearScale encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_bilinearScale, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v22, v23, v24);
    objc_msgSend(v22, "commit");
    objc_msgSend(v22, "waitUntilCompleted");
    if (needDeepCopy(objc_msgSend(v25, "width"), objc_msgSend(v25, "arrayLength")))
      v26 = copyTextureToBuffer(v25, a3);
    else
      v26 = 0;
  }

  CF<opaqueCMSampleBuffer *>::~CF((const void **)&PixelBuffer);
  return v26;
}

- (int)combineBufferTo:(__CVBuffer *)a3 flowX:(__CVBuffer *)a4 flowY:(__CVBuffer *)a5
{
  int Width;
  int Height;
  int BytesPerRow;
  int v11;
  int v12;
  int v13;
  CVReturn v14;
  CVReturn v15;
  char *BaseAddress;
  char *v17;
  char *v18;
  int i;
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
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CVReturn v47;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  uint8_t v50[4];
  _QWORD v51[3];
  uint8_t buf[4];
  _BYTE v53[20];
  uint8_t v54[4];
  uint64_t v55;
  __int16 v56;
  CVReturn v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  v11 = CVPixelBufferGetBytesPerRow(a4);
  v12 = CVPixelBufferGetBytesPerRow(a5);
  v47 = 0;
  pixelBuffer = a4;
  unlockFlags = 1;
  if (a4)
  {
    v13 = v12;
    v14 = CVPixelBufferLockBaseAddress(a4, 1uLL);
    v47 = v14;
    if (!v14
      || (v15 = v14, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      && (*(_DWORD *)buf = 134218240,
          *(_QWORD *)v53 = a4,
          *(_WORD *)&v53[8] = 1024,
          *(_DWORD *)&v53[10] = v15,
          _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v15 = v47) == 0))
    {
      *(_DWORD *)buf = 0;
      *(_QWORD *)&v53[4] = a5;
      *(_QWORD *)&v53[12] = 1;
      if (a5)
      {
        v15 = CVPixelBufferLockBaseAddress(a5, 1uLL);
        *(_DWORD *)buf = v15;
        if (!v15
          || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
          && (*(_DWORD *)v50 = 134218240,
              v51[0] = *(_QWORD *)&v53[4],
              LOWORD(v51[1]) = 1024,
              *(_DWORD *)((char *)&v51[1] + 2) = v15,
              _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v50, 0x12u), (v15 = *(_DWORD *)buf) == 0))
        {
          *(_DWORD *)v50 = 0;
          *(_OWORD *)((char *)v51 + 4) = (unint64_t)a3;
          if (a3)
          {
            v15 = CVPixelBufferLockBaseAddress(a3, 0);
            *(_DWORD *)v50 = v15;
            if (!v15
              || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
              && (*(_DWORD *)v54 = 134218240,
                  v55 = *(_QWORD *)((char *)v51 + 4),
                  v56 = 1024,
                  v57 = v15,
                  _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v54, 0x12u), (v15 = *(_DWORD *)v50) == 0))
            {
              BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
              v17 = (char *)CVPixelBufferGetBaseAddress(a5);
              v18 = (char *)CVPixelBufferGetBaseAddress(a3);
              if (Height >= 1)
              {
                for (i = 0; i != Height; ++i)
                {
                  if (Width >= 1)
                  {
                    v20 = 0;
                    v21 = 0;
                    do
                    {
                      *(_WORD *)&v18[v20 >> 31] = *(_WORD *)&BaseAddress[v21];
                      *(_WORD *)&v18[2 * (int)v21 + 2] = *(_WORD *)&v17[v21];
                      v21 += 2;
                      v20 += 0x200000000;
                    }
                    while (2 * Width != v21);
                  }
                  v18 += 2 * ((uint64_t)BytesPerRow >> 1);
                  v17 += 2 * ((uint64_t)v13 >> 1);
                  BaseAddress += 2 * ((uint64_t)v11 >> 1);
                }
              }
              v15 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)v50);
              if (!v15)
              {
                v15 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
                if (!v15)
                  v15 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v47);
              }
            }
          }
          else
          {
            v39 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v39)
              -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v39, v40, v41, v42, v43, v44, v45, v46);
            v15 = -50;
            *(_DWORD *)v50 = -50;
          }
          if (*(_QWORD *)((char *)v51 + 4)
            && !*(_DWORD *)v50
            && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)((char *)v51 + 4), *(_QWORD *)((char *)&v51[1] + 4))
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
          }
          if (*(_QWORD *)&v53[4]
            && !*(_DWORD *)buf
            && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)&v53[4], *(CVPixelBufferLockFlags *)&v53[12])
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
          }
        }
      }
      else
      {
        v31 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v31)
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);
        v15 = -50;
      }
      if (pixelBuffer
        && !v47
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
      }
    }
  }
  else
  {
    v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v22)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
    return -50;
  }
  return v15;
}

- (int)guidedUpsampling:(__CVBuffer *)a3 inBGRA:(__CVBuffer *)a4
{
  int Width;
  int Height;
  int cnnOutputHeight;
  int cnnOutputWidth;
  CVPixelBufferRef v11;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MPSImageSpatioTemporalGuidedFilter *guidedFilter;
  void *v30;
  void *v31;
  uint64_t v33;
  id v34;
  __CVBuffer *v35;
  __CVBuffer *v36;
  __CVBuffer *v37;
  __CVBuffer *PixelBuffer;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  cnnOutputHeight = self->_cnnOutputHeight;
  cnnOutputWidth = self->_cnnOutputWidth;
  PixelBuffer = VCPFlowCreatePixelBuffer(cnnOutputWidth, cnnOutputHeight, 0x4C303068u, 32);
  v37 = VCPFlowCreatePixelBuffer(self->_cnnOutputWidth, self->_cnnOutputHeight, 0x4C303068u, 32);
  v36 = VCPFlowCreatePixelBuffer(Width, Height, 0x4C303068u, 32);
  v11 = VCPFlowCreatePixelBuffer(Width, Height, 0x4C303068u, 32);
  _S0 = (float)Height;
  __asm
  {
    FCVT            H0, S0
    FCVT            S0, H0
  }
  _S0 = _S0 / (float)cnnOutputHeight;
  _S1 = (float)Width;
  __asm
  {
    FCVT            H0, S0
    FCVT            H1, S1
    FCVT            S1, H1
  }
  _S1 = _S1 / (float)cnnOutputWidth;
  __asm { FCVT            H1, S1 }
  v35 = v11;
  __asm
  {
    FCVT            S0, H0
    FCVT            S1, H1
  }
  -[VCPImageMotionFlowAnalyzer flowScalingTo:flowBufferY:scalerX:scalerY:](self, "flowScalingTo:flowBufferY:scalerX:scalerY:", PixelBuffer, v37, _D0, _D1);
  createRGBA8TextureFromBuffer(a4, self->_device);
  v33 = objc_claimAutoreleasedReturnValue();
  createTextureFromBuffer(PixelBuffer, self->_device, 0, 1uLL);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  createTextureFromBuffer(v37, self->_device, 0, 1uLL);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  createTextureFromBuffer(v36, self->_device, 0, 1uLL);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  createTextureFromBuffer(v35, self->_device, 0, 1uLL);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  guidedFilter = self->_guidedFilter;
  v40[0] = v24;
  v40[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v26;
  v39[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSImageSpatioTemporalGuidedFilter encodeToCommandBuffer:sourceTextureArray:guidanceTexture:constraintsTextureArray:numberOfIterations:destinationTextureArray:](guidedFilter, "encodeToCommandBuffer:sourceTextureArray:guidanceTexture:constraintsTextureArray:numberOfIterations:destinationTextureArray:", v28, v30, v33, 0, 1, v31);

  objc_msgSend(v28, "commit");
  objc_msgSend(v28, "waitUntilCompleted");
  if (needDeepCopy(objc_msgSend(v26, "width"), objc_msgSend(v26, "arrayLength")))
  {
    copyTextureToBuffer(v26, v36);
    copyTextureToBuffer(v27, v35);
  }
  -[VCPImageMotionFlowAnalyzer combineBufferTo:flowX:flowY:](self, "combineBufferTo:flowX:flowY:", a3, v36, v35, v33);

  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v35);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v36);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v37);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&PixelBuffer);
  return 0;
}

- (int)updateModelForAspectRatio:(id)a3 computationAccuracy:(unsigned int)a4
{
  return -4;
}

- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5
{
  int result;

  result = -50;
  if (a3 && a4)
  {
    if (a5)
    {
      result = 0;
      *a3 = self->_cnnInputWidth;
      *a4 = self->_cnnInputHeight;
      *a5 = 1111970369;
    }
  }
  return result;
}

- (int)cnnOutputHeight
{
  return self->_cnnOutputHeight;
}

- (int)cnnOutputWidth
{
  return self->_cnnOutputWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_bilinearScale, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
