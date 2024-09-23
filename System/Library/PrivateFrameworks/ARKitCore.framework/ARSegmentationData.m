@implementation ARSegmentationData

- (ARSegmentationData)initWithTimestamp:(double)a3 segmentationBuffer:(__CVBuffer *)a4
{
  return -[ARSegmentationData initWithTimestamp:segmentationBuffer:confidenceBuffer:uncertaintyBuffer:source:](self, "initWithTimestamp:segmentationBuffer:confidenceBuffer:uncertaintyBuffer:source:", a4, 0, 0, 1, a3);
}

- (ARSegmentationData)initWithTimestamp:(double)a3 segmentationBuffer:(__CVBuffer *)a4 confidenceBuffer:(__CVBuffer *)a5 source:(int64_t)a6
{
  return -[ARSegmentationData initWithTimestamp:segmentationBuffer:confidenceBuffer:uncertaintyBuffer:source:](self, "initWithTimestamp:segmentationBuffer:confidenceBuffer:uncertaintyBuffer:source:", a4, a5, 0, a6, a3);
}

- (ARSegmentationData)initWithTimestamp:(double)a3 segmentationBuffer:(__CVBuffer *)a4 confidenceBuffer:(__CVBuffer *)a5 uncertaintyBuffer:(__CVBuffer *)a6 source:(int64_t)a7
{
  ARSegmentationData *v12;
  ARSegmentationData *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ARSegmentationData;
  v12 = -[ARSegmentationData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_timestamp = a3;
    v12->_segmentationBuffer = CVPixelBufferRetain(a4);
    if (a5)
      v13->_confidenceBuffer = CVPixelBufferRetain(a5);
    if (a6)
      v13->_uncertaintyBuffer = CVPixelBufferRetain(a6);
    v13->_source = a7;
  }
  return v13;
}

- (BOOL)hasSegmentedPeople
{
  BOOL v3;
  __CVBuffer *segmentationBuffer;
  size_t BytesPerRow;
  size_t Width;
  size_t Height;
  unsigned __int8 *BaseAddress;
  size_t v9;
  unint64_t v10;
  uint8x16_t v11;
  _QWORD v13[2];
  uint64_t (*v14)(uint64_t);
  void *v15;
  __CVBuffer *v16;

  if (self->_hasSegmentedPeopleComputed)
  {
    return self->_hasSegmentedPeople;
  }
  else
  {
    segmentationBuffer = self->_segmentationBuffer;
    BytesPerRow = CVPixelBufferGetBytesPerRow(segmentationBuffer);
    Width = CVPixelBufferGetWidth(segmentationBuffer);
    Height = CVPixelBufferGetHeight(segmentationBuffer);
    CVPixelBufferLockBaseAddress(segmentationBuffer, 1uLL);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v14 = __bufferContainsSegmentedPeople_block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0l;
    v16 = segmentationBuffer;
    BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(segmentationBuffer);
    if (Height)
    {
      v9 = 0;
      v3 = 1;
      while (Width < 0x41)
      {
        v10 = 0;
LABEL_11:
        if (v10 < Width)
        {
          while (BaseAddress[v10] != 255)
          {
            if (Width == ++v10)
              goto LABEL_14;
          }
          goto LABEL_16;
        }
LABEL_14:
        ++v9;
        BaseAddress += BytesPerRow;
        v3 = v9 < Height;
        if (v9 == Height)
          goto LABEL_15;
      }
      v10 = 0;
      while (1)
      {
        v11 = vmaxq_u8(vmaxq_u8(*(uint8x16_t *)&BaseAddress[v10], *(uint8x16_t *)&BaseAddress[v10 + 32]), vmaxq_u8(*(uint8x16_t *)&BaseAddress[v10 + 16], *(uint8x16_t *)&BaseAddress[v10 + 48]));
        v11.i8[0] = vmaxvq_u8(v11);
        if (v11.i32[0] == 255)
          break;
        v10 += 64;
        if (v10 > Width - 64)
          goto LABEL_11;
      }
    }
    else
    {
LABEL_15:
      v3 = 0;
    }
LABEL_16:
    v14((uint64_t)v13);
    self->_hasSegmentedPeople = v3;
    self->_hasSegmentedPeopleComputed = 1;
  }
  return v3;
}

- (void)adjustedIntrinics
{
  void *v2;
  float v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __CVBuffer *v10;
  double Width;
  double Height;
  double v13;
  double v14;
  float v15;

  v2 = *(void **)(a1 + 96);
  if (v2)
  {
    objc_msgSend(v2, "cameraIntrinsics");
    v14 = v4;
    v15 = v3;
    v13 = v5;
    objc_msgSend(*(id *)(a1 + 96), "imageResolution");
    v7 = v6;
    v9 = v8;
    v10 = *(__CVBuffer **)(a1 + 24);
    if (v10)
    {
      Width = (double)CVPixelBufferGetWidth(v10);
      Height = (double)CVPixelBufferGetHeight(v10);
    }
    else
    {
      Width = *MEMORY[0x1E0C9D820];
      Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    ARAdjustIntrinsicsForViewportSize(v15, v14, v13, v7, v9, Width, Height);
  }
}

- (uint64_t)resampleSemanticsToDepthCPU:(float32x4_t)a3 depthToSemantics:(float32x4_t)a4 semanticsIntrinsics:(float32x4_t)a5 depthIntrinsics:(float32x4_t)a6
{
  BOOL v19;
  uint64_t result;
  size_t Width;
  size_t Height;
  size_t v24;
  size_t v25;
  const __CFDictionary *v26;
  const __CFAllocator *v27;
  OSType PixelFormatType;
  __CVBuffer *v29;
  OSType v30;
  size_t v31;
  char *v32;
  __CVBuffer *v33;
  OSType v34;
  _DWORD *v35;
  char *v36;
  size_t v37;
  float *v38;
  _BYTE *v39;
  _BYTE *v40;
  float32x4_t v41;
  unint64_t v42;
  unint64_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __CVBuffer *v50;
  __CVBuffer *v51;
  __CVBuffer *v52;
  __CVBuffer *v53;
  __CVBuffer *v54;
  size_t BytesPerRow;
  size_t v56;
  size_t v57;
  size_t v58;
  size_t v59;
  size_t v60;
  _DWORD *BaseAddress;
  size_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  __CVBuffer *pixelBuffer;
  const __CFDictionary *v74;
  unsigned int v75;
  CVPixelBufferRef v76;
  CVPixelBufferRef v77;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v79;
  _QWORD v80[3];
  simd_float3x3 v81;
  simd_float3x3 v82;

  v80[1] = *MEMORY[0x1E0C80C00];
  if (a10)
    v19 = a1[3] == 0;
  else
    v19 = 1;
  result = !v19;
  if (!v19)
  {
    v75 = result;
    v81.columns[1] = a17;
    v81.columns[2] = a18;
    v81.columns[0] = a16;
    v82 = __invert_f3(v81);
    v64 = (float32x4_t)v82.columns[1];
    v65 = (float32x4_t)v82.columns[0];
    v63 = (float32x4_t)v82.columns[2];
    Width = CVPixelBufferGetWidth(a10);
    Height = CVPixelBufferGetHeight(a10);
    v24 = CVPixelBufferGetWidth(a1[3]);
    v25 = CVPixelBufferGetHeight(a1[3]);
    pixelBufferOut = 0;
    v79 = *MEMORY[0x1E0CA8FF0];
    v80[0] = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
    v26 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v27 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    PixelFormatType = CVPixelBufferGetPixelFormatType(a1[3]);
    CVPixelBufferCreate(v27, Width, Height, PixelFormatType, v26, &pixelBufferOut);
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    v77 = 0;
    v29 = a1[4];
    if (v29)
    {
      v30 = CVPixelBufferGetPixelFormatType(v29);
      v31 = Height;
      CVPixelBufferCreate(v27, Width, Height, v30, v26, &v77);
      CVPixelBufferLockBaseAddress(v77, 0);
      v62 = CVPixelBufferGetBytesPerRow(a1[4]) >> 2;
      v57 = CVPixelBufferGetBytesPerRow(v77) >> 2;
      CVPixelBufferLockBaseAddress(a1[4], 1uLL);
      BaseAddress = CVPixelBufferGetBaseAddress(a1[4]);
      v32 = (char *)CVPixelBufferGetBaseAddress(v77);
    }
    else
    {
      v31 = Height;
      v32 = 0;
      BaseAddress = 0;
      v62 = 0;
      v57 = 0;
    }
    v76 = 0;
    v33 = a1[5];
    v74 = v26;
    v59 = v31;
    if (v33)
    {
      v34 = CVPixelBufferGetPixelFormatType(v33);
      CVPixelBufferCreate(v27, Width, v31, v34, v26, &v76);
      CVPixelBufferLockBaseAddress(v76, 0);
      v60 = CVPixelBufferGetBytesPerRow(a1[5]) >> 2;
      v56 = CVPixelBufferGetBytesPerRow(v76) >> 2;
      CVPixelBufferLockBaseAddress(a1[5], 1uLL);
      v35 = CVPixelBufferGetBaseAddress(a1[5]);
      v36 = (char *)CVPixelBufferGetBaseAddress(v76);
    }
    else
    {
      v60 = 0;
      v56 = 0;
      v35 = 0;
      v36 = 0;
    }
    BytesPerRow = CVPixelBufferGetBytesPerRow(a10);
    v37 = CVPixelBufferGetBytesPerRow(a1[3]);
    v58 = CVPixelBufferGetBytesPerRow(pixelBufferOut);
    CVPixelBufferLockBaseAddress(a1[3], 1uLL);
    CVPixelBufferLockBaseAddress(a10, 1uLL);
    pixelBuffer = a10;
    v38 = (float *)CVPixelBufferGetBaseAddress(a10);
    v39 = CVPixelBufferGetBaseAddress(a1[3]);
    v40 = CVPixelBufferGetBaseAddress(pixelBufferOut);
    if (v59)
    {
      v42 = 0;
      do
      {
        if (Width)
        {
          v43 = 0;
          v41.f32[0] = (float)v42;
          v41 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 0);
          do
          {
            v44 = vmulq_n_f32(vaddq_f32(v63, vmlaq_f32(vmulq_n_f32(v65, (float)v43), v41, v64)), v38[v43]);
            v45 = vaddq_f32(a5, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v44.f32[0]), a3, *(float32x2_t *)v44.f32, 1), a4, v44, 2));
            v46 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, v45.f32[0]), a7, *(float32x2_t *)v45.f32, 1), a8, v45, 2);
            v47 = vdivq_f32(v46, (float32x4_t)vdupq_laneq_s32((int32x4_t)v46, 2)).u64[0];
            v48 = (int)*((float *)&v47 + 1);
            if ((v48 & 0x80000000) == 0)
            {
              v49 = (int)*(float *)&v47;
              if ((v49 & 0x80000000) == 0 && v25 > v48 && v24 > v49)
              {
                v40[v43] = v39[v37 * v48 + v49];
                if (a1[4])
                  *(_DWORD *)&v32[4 * v43] = BaseAddress[v62 * v48 + v49];
                if (a1[5])
                  *(_DWORD *)&v36[4 * v43] = v35[v60 * v48 + v49];
              }
            }
            ++v43;
          }
          while (Width != v43);
        }
        ++v42;
        v36 += 4 * v56;
        v32 += 4 * v57;
        v40 += v58;
        v38 += BytesPerRow >> 2;
      }
      while (v42 != v59);
    }
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
    CVPixelBufferUnlockBaseAddress(a1[3], 1uLL);
    v50 = a1[4];
    if (v50)
      CVPixelBufferUnlockBaseAddress(v50, 1uLL);
    v51 = a1[5];
    if (v51)
      CVPixelBufferUnlockBaseAddress(v51, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    v52 = a1[8];
    if (v52)
      CVPixelBufferRelease(v52);
    a1[8] = pixelBufferOut;
    if (a1[4])
    {
      CVPixelBufferUnlockBaseAddress(v77, 0);
      v53 = a1[9];
      if (v53)
        CVPixelBufferRelease(v53);
      a1[9] = v77;
    }
    if (a1[5])
    {
      CVPixelBufferUnlockBaseAddress(v76, 0);
      v54 = a1[10];
      if (v54)
        CVPixelBufferRelease(v54);
      a1[10] = v76;
    }

    return v75;
  }
  return result;
}

- (void)setNormalsBuffer:(__CVBuffer *)a3
{
  __CVBuffer *normalsBuffer;

  normalsBuffer = self->_normalsBuffer;
  if (normalsBuffer != a3)
  {
    CVPixelBufferRelease(normalsBuffer);
    self->_normalsBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setSemanticsSampledForDepth:(__CVBuffer *)a3
{
  __CVBuffer *semanticsSampledForDepth;

  semanticsSampledForDepth = self->_semanticsSampledForDepth;
  if (semanticsSampledForDepth != a3)
  {
    CVPixelBufferRelease(semanticsSampledForDepth);
    self->_semanticsSampledForDepth = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setConfidenceSampledForDepth:(__CVBuffer *)a3
{
  __CVBuffer *confidenceSampledForDepth;

  confidenceSampledForDepth = self->_confidenceSampledForDepth;
  if (confidenceSampledForDepth != a3)
  {
    CVPixelBufferRelease(confidenceSampledForDepth);
    self->_confidenceSampledForDepth = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setUncertaintySampledForDepth:(__CVBuffer *)a3
{
  __CVBuffer *uncertaintySampledForDepth;

  uncertaintySampledForDepth = self->_uncertaintySampledForDepth;
  if (uncertaintySampledForDepth != a3)
  {
    CVPixelBufferRelease(uncertaintySampledForDepth);
    self->_uncertaintySampledForDepth = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setMaskedSemanticsSampledForDepth:(__CVBuffer *)a3
{
  __CVBuffer *maskedSemanticsSampledForDepth;

  maskedSemanticsSampledForDepth = self->_maskedSemanticsSampledForDepth;
  if (maskedSemanticsSampledForDepth != a3)
  {
    CVPixelBufferRelease(maskedSemanticsSampledForDepth);
    self->_maskedSemanticsSampledForDepth = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)updateTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_segmentationBuffer);
  CVPixelBufferRelease(self->_confidenceBuffer);
  CVPixelBufferRelease(self->_uncertaintyBuffer);
  CVPixelBufferRelease(self->_normalsBuffer);
  CVPixelBufferRelease(self->_semanticsSampledForDepth);
  CVPixelBufferRelease(self->_confidenceSampledForDepth);
  CVPixelBufferRelease(self->_uncertaintySampledForDepth);
  CVPixelBufferRelease(self->_maskedSemanticsSampledForDepth);
  v3.receiver = self;
  v3.super_class = (Class)ARSegmentationData;
  -[ARSegmentationData dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSegmentationData timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%p): %f"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSDictionary)tracingEntry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  OSType PixelFormatType;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  ARQATraceableDefaultEntryForResultData(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v11[0] = CFSTR("width");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetWidth(-[ARSegmentationData segmentationBuffer](self, "segmentationBuffer")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("height");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetHeight(-[ARSegmentationData segmentationBuffer](self, "segmentationBuffer")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("imageResolution"));

  PixelFormatType = CVPixelBufferGetPixelFormatType(-[ARSegmentationData segmentationBuffer](self, "segmentationBuffer"));
  AROSTypeToString(PixelFormatType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("pixelBufferFormat"));

  return (NSDictionary *)v4;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (__CVBuffer)segmentationBuffer
{
  return self->_segmentationBuffer;
}

- (__CVBuffer)confidenceBuffer
{
  return self->_confidenceBuffer;
}

- (__CVBuffer)uncertaintyBuffer
{
  return self->_uncertaintyBuffer;
}

- (int64_t)source
{
  return self->_source;
}

- (__CVBuffer)normalsBuffer
{
  return self->_normalsBuffer;
}

- (__CVBuffer)semanticsSampledForDepth
{
  return self->_semanticsSampledForDepth;
}

- (__CVBuffer)confidenceSampledForDepth
{
  return self->_confidenceSampledForDepth;
}

- (__CVBuffer)uncertaintySampledForDepth
{
  return self->_uncertaintySampledForDepth;
}

- (__CVBuffer)maskedSemanticsSampledForDepth
{
  return self->_maskedSemanticsSampledForDepth;
}

- (ARImageData)sourceImageData
{
  return self->_sourceImageData;
}

- (void)setSourceImageData:(id)a3
{
  objc_storeStrong((id *)&self->_sourceImageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceImageData, 0);
}

@end
