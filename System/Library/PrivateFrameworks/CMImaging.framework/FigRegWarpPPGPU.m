@implementation FigRegWarpPPGPU

- (int)allocateResourcesWithWidth:(unsigned int)a3 height:(unsigned int)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  MTLTexture *v25;
  char *v26;
  MTLTexture *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  MTLBuffer *v32;
  MTLBuffer *v33;
  int v34;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;

  -[FigMetalContext allocator](self->_metal, "allocator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_allocateBuffersWithAllocator = objc_msgSend(v7, "allocatorType") == 2;

  -[FigMetalContext allocator](self->_metal, "allocator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "newTextureDescriptor");

  if (v9)
  {
    v36 = a3;
    v37 = a4;
    v38 = a4 >> 1;
    v39 = a3 >> 1;
    objc_msgSend(v9, "desc");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPixelFormat:", 25);

    objc_msgSend(v9, "desc");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUsage:", 7);

    v12 = 0;
    v13 = 0;
    v14 = 488;
    while (1)
    {
      v15 = v39 >> v13;
      v16 = v38 >> v13;
      v17 = (char *)self + v12 * 8;
      *((_DWORD *)v17 + 6) = v15;
      *((_DWORD *)v17 + 7) = v16;
      v18 = -[FigRegWarpPPGPU _setNormCoefs:width:height:](self, "_setNormCoefs:width:height:", (char *)self + v14, v15, v16);
      if (v18)
        break;
      self->_inlierThreshold[v13] = 2.0 / fmaxf((float)v15, (float)v16);
      objc_msgSend(v9, "desc");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setWidth:", v15);

      objc_msgSend(v9, "desc");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setHeight:", v16);

      objc_msgSend(v9, "setLabel:", 0);
      -[FigMetalContext allocator](self->_metal, "allocator");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "newTextureWithDescriptor:", v9);
      v23 = (void *)*((_QWORD *)v17 + 11);
      *((_QWORD *)v17 + 11) = v22;

      if (!*((_QWORD *)v17 + 11))
        goto LABEL_12;
      objc_msgSend(v9, "setLabel:", 0);
      -[FigMetalContext allocator](self->_metal, "allocator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (MTLTexture *)objc_msgSend(v24, "newTextureWithDescriptor:", v9);
      v26 = (char *)self + v12 * 8;
      v27 = self->_nonReferencePyramidImage[v12];
      self->_nonReferencePyramidImage[v12] = v25;

      if (!self->_nonReferencePyramidImage[v12])
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_referencePyramidCorners[%d]"), v13);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[FigRegWarpPPGPU _newBufferWithLength:options:label:](self, "_newBufferWithLength:options:label:", 6400, 0, v28);
      v30 = (void *)*((_QWORD *)v26 + 27);
      *((_QWORD *)v26 + 27) = v29;

      if (!*((_QWORD *)v26 + 27))
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_nonReferencePyramidCorners[%d]"), v13);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[FigRegWarpPPGPU _newBufferWithLength:options:label:](self, "_newBufferWithLength:options:label:", 6400, 0, v31);
      v33 = self->_nonReferencePyramidCorners[v12];
      self->_nonReferencePyramidCorners[v12] = v32;

      if (!self->_nonReferencePyramidCorners[v12])
        goto LABEL_12;
      ++v13;
      ++v12;
      v14 += 32;
      if (v13 == 8)
      {
        v34 = 0;
        self->_imageWidth = v36;
        self->_imageHeight = v37;
        *(_QWORD *)&self->_roi.x = 0;
        self->_roi.width = v36;
        self->_roi.height = v37;
        goto LABEL_10;
      }
    }
    v34 = v18;
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  else
  {
LABEL_12:
    FigDebugAssert3();
    v34 = FigSignalErrorAt();
  }
LABEL_10:

  return v34;
}

- (id)_newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 label:(id)a5
{
  id v8;
  FigMetalContext *metal;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  metal = self->_metal;
  if (self->_allocateBuffersWithAllocator)
  {
    -[FigMetalContext allocator](metal, "allocator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "newBufferDescriptor");

    if (v11)
    {
      objc_msgSend(v11, "setLength:", a3);
      objc_msgSend(v11, "setOptions:", a4);
      objc_msgSend(v11, "setLabel:", 0);
      -[FigMetalContext allocator](self->_metal, "allocator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "newBufferWithDescriptor:", v11);

    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();
      v13 = 0;
    }
  }
  else
  {
    -[FigMetalContext device](metal, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v14, "newBufferWithLength:options:", a3, a4);

    objc_msgSend(v13, "setLabel:", 0);
  }

  return v13;
}

- (int)_setNormCoefs:(id *)a3 width:(unsigned int)a4 height:(unsigned int)a5
{
  int result;
  float v6;
  float v7;

  if (a3)
  {
    result = 0;
    v6 = fmaxf((float)a4, (float)a5);
    a3->var0[0] = 2.0 / v6;
    a3->var0[1] = (float)-(float)a4 / v6;
    a3->var1[0] = 2.0 / v6;
    a3->var1[1] = (float)-(float)a5 / v6;
    v7 = v6 * 0.5;
    a3->var2[0] = v7;
    a3->var2[1] = (float)a4 * 0.5;
    a3->var3[0] = v7;
    a3->var3[1] = (float)a5 * 0.5;
  }
  else
  {
    FigDebugAssert3();
    return -1;
  }
  return result;
}

- (void)setAllocator:(id)a3
{
  -[FigMetalContext setAllocator:](self->_metal, "setAllocator:", a3);
}

- (FigMetalAllocator)allocator
{
  return -[FigMetalContext allocator](self->_metal, "allocator");
}

- (FigRegWarpPPGPU)initWithOptionalCommandQueue:(id)a3 config:(id *)a4
{
  id v6;
  char *v7;
  FigMetalContext *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL var12;
  unsigned int var10;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  FigRegWarpPPGPU *v30;
  NSObject *v32;
  objc_super v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v33.receiver = self;
  v33.super_class = (Class)FigRegWarpPPGPU;
  v7 = -[FigRegWarpPPGPU init](&v33, sel_init);
  if (!v7)
  {
    FigDebugAssert3();
LABEL_16:
    v30 = 0;
    goto LABEL_11;
  }
  v7[1393] = FigGetCFPreferenceNumberWithDefault() != 0;
  v8 = [FigMetalContext alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v8, "initWithbundle:andOptionalCommandQueue:", v9, v6);
  v11 = (void *)*((_QWORD *)v7 + 1);
  *((_QWORD *)v7 + 1) = v10;

  if (!*((_QWORD *)v7 + 1))
  {
LABEL_15:
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v32 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_16;
  }
  +[FigRegWarpPPGPUShared sharedInstance](FigRegWarpPPGPUShared, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getShaders:", *((_QWORD *)v7 + 1));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)*((_QWORD *)v7 + 2);
  *((_QWORD *)v7 + 2) = v13;

  if (!*((_QWORD *)v7 + 2))
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_16;
  }
  if (a4)
  {
    v7[1380] = a4->var11;
    var12 = a4->var12;
    *((_DWORD *)v7 + 346) = a4->var9;
    var10 = a4->var10;
  }
  else
  {
    var12 = 0;
    v7[1380] = 0;
    *((_DWORD *)v7 + 346) = 6;
    LOBYTE(var10) = 4;
  }
  v7[1389] = var12;
  v7[1388] = 0;
  v7[1390] = var10;
  v7[1394] = 0;
  *(_WORD *)(v7 + 1391) = 0;
  *((_QWORD *)v7 + 126) = 256;
  v7[1016] = 0;
  *((_OWORD *)v7 + 64) = 0u;
  __asm { FMOV            V0.4S, #1.0 }
  *((_OWORD *)v7 + 65) = _Q0;
  if (!v7[1393])
  {
    v22 = objc_alloc(MEMORY[0x1E0CC6E68]);
    objc_msgSend(*((id *)v7 + 1), "device");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "initWithDevice:histogramInfo:", v23, v7 + 1008);
    v25 = (void *)*((_QWORD *)v7 + 132);
    *((_QWORD *)v7 + 132) = v24;

    if (!*((_QWORD *)v7 + 132))
      goto LABEL_15;
    v26 = objc_alloc(MEMORY[0x1E0CC6E70]);
    objc_msgSend(*((id *)v7 + 1), "device");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "initWithDevice:histogramInfo:", v27, v7 + 1008);
    v29 = (void *)*((_QWORD *)v7 + 133);
    *((_QWORD *)v7 + 133) = v28;

    if (!*((_QWORD *)v7 + 133))
      goto LABEL_15;
  }
  v30 = v7;
LABEL_11:

  return v30;
}

+ (int)prewarmShaders:(id)a3
{
  id v3;
  FigRegWarpPPGPUShaders *v4;
  int v5;

  v3 = a3;
  if (v3
    && (v4 = -[FigRegWarpPPGPUShaders initWithMetalContext:]([FigRegWarpPPGPUShaders alloc], "initWithMetalContext:", v3)) != 0)
  {
    v5 = 0;
  }
  else
  {
    FigDebugAssert3();
    v5 = FigSignalErrorAt();
    v4 = 0;
  }

  return v5;
}

- (void)releaseResources
{
  uint64_t v3;

  v3 = 0x1FFFFFFFFFFFFFF8;
  do
  {
    FigMetalDecRef((id *)&self->_nonReferencePyramidImage[v3]);
    FigMetalDecRef((id *)&self->_referencePyramidCorners[v3]);
    -[FigRegWarpPPGPU _releaseBuffer:](self, "_releaseBuffer:", &self->_nonReferencePyramidCorners[v3]);
    -[FigRegWarpPPGPU _releaseBuffer:](self, "_releaseBuffer:", (char *)&self->_roi + v3 * 8);
    ++v3;
  }
  while (v3 * 8);
}

- (void)dealloc
{
  objc_super v3;

  -[FigRegWarpPPGPU releaseResources](self, "releaseResources");
  v3.receiver = self;
  v3.super_class = (Class)FigRegWarpPPGPU;
  -[FigRegWarpPPGPU dealloc](&v3, sel_dealloc);
}

- (int)processReference:(__CVBuffer *)a3 regionOfInterest:(CGRect *)a4 numKeypoints:(unsigned int *)a5
{
  return -[FigRegWarpPPGPU processReference:gdcParams:regionOfInterest:numKeypoints:](self, "processReference:gdcParams:regionOfInterest:numKeypoints:", a3, 0, a4, a5);
}

- (int)processReference:(__CVBuffer *)a3 gdcParams:(id *)a4 regionOfInterest:(CGRect *)a5 numKeypoints:(unsigned int *)a6
{
  uint64_t v10;
  void *v11;
  int v12;

  if (a3)
  {
    -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, getMetalLumaFormat(a3), 1, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = -[FigRegWarpPPGPU processReferenceTexture:gdcParams:regionOfInterest:numKeypoints:](self, "processReferenceTexture:gdcParams:regionOfInterest:numKeypoints:", v10, a4, a5, a6);

      return v12;
    }
    else
    {
      FigDebugAssert3();
      return -2;
    }
  }
  else
  {
    FigDebugAssert3();
    return -1;
  }
}

- (int)processReferenceTexture:(id)a3 regionOfInterest:(CGRect *)a4 numKeypoints:(unsigned int *)a5
{
  return -[FigRegWarpPPGPU processReferenceTexture:gdcParams:regionOfInterest:numKeypoints:mapping:](self, "processReferenceTexture:gdcParams:regionOfInterest:numKeypoints:mapping:", a3, 0, a4, a5, 0);
}

- (int)processReferenceTexture:(id)a3 gdcParams:(id *)a4 regionOfInterest:(CGRect *)a5 numKeypoints:(unsigned int *)a6
{
  return -[FigRegWarpPPGPU processReferenceTexture:gdcParams:regionOfInterest:numKeypoints:mapping:](self, "processReferenceTexture:gdcParams:regionOfInterest:numKeypoints:mapping:", a3, a4, a5, a6, 0);
}

- (int)processReferenceTexture:(id)a3 gdcParams:(id *)a4 regionOfInterest:(CGRect *)a5 numKeypoints:(unsigned int *)a6 mapping:(id *)a7
{
  id v12;
  _DWORD *v13;
  int v14;
  int v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  int v22;
  int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  float *p_minCornerResponseThreshold;
  float32x4_t v30;
  int32x4_t v31;
  uint64_t v32;
  float32x4_t v33;
  int v34;

  v12 = a3;
  v13 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (!v12)
  {
    FigDebugAssert3();
    v34 = -1;
    goto LABEL_22;
  }
  v14 = -[FigRegWarpPPGPU _verifyInputPixelFormat:](self, "_verifyInputPixelFormat:", objc_msgSend(v12, "pixelFormat"));
  if (v14)
  {
    v34 = v14;
LABEL_26:
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_22;
  }
  v15 = -[FigRegWarpPPGPU _setTuningParams](self, "_setTuningParams");
  if (v15)
  {
    v34 = v15;
    goto LABEL_26;
  }
  v16 = -[FigRegWarpPPGPU _determineNumPyrLevels:pyramid0Height:](self, "_determineNumPyrLevels:pyramid0Height:", -[MTLTexture width](self->_referencePyramidImage[0], "width"), -[MTLTexture height](self->_referencePyramidImage[0], "height"));
  if (v16)
  {
    v34 = v16;
    goto LABEL_26;
  }
  if (self->_applyGDC)
  {
    if (!a4)
    {
      FigDebugAssert3();
      v34 = FigSignalErrorAt();
      goto LABEL_22;
    }
    v17 = *(_OWORD *)&a4->var0;
    v18 = *(_OWORD *)&a4->var2[6];
    *(_OWORD *)&self->_anon_308[16] = *(_OWORD *)&a4->var2[2];
    *(_OWORD *)&self->_anon_308[32] = v18;
    *(_OWORD *)self->_anon_308 = v17;
    v19 = *(_OWORD *)&a4->var3[2];
    v20 = *(_OWORD *)&a4->var3[6];
    v21 = *(_OWORD *)&a4[1].var2[3];
    *(_OWORD *)&self->_anon_308[80] = *(_OWORD *)&a4[1].var1;
    *(_OWORD *)&self->_anon_308[96] = v21;
    *(_OWORD *)&self->_anon_308[48] = v19;
    *(_OWORD *)&self->_anon_308[64] = v20;
  }
  if (a5)
    self->_roi = ($CE4B8E79EC58BE83E46087239061619A)vuzp1q_s32((int32x4_t)vcvtq_u64_f64((float64x2_t)a5->origin), (int32x4_t)vcvtq_u64_f64((float64x2_t)a5->size));
  v22 = -[FigRegWarpPPGPU _updatePyramidRoi](self, "_updatePyramidRoi");
  if (v22)
  {
    v34 = v22;
    FigDebugAssert3();
    goto LABEL_22;
  }
  v23 = -[FigRegWarpPPGPU _constructPyramid:withTexture:mapping:level0Only:](self, "_constructPyramid:withTexture:mapping:level0Only:", self->_referencePyramidImage, v12, a7, 0);
  if (v23)
  {
    v34 = v23;
    goto LABEL_26;
  }
  if (self->_numPyrLevels)
  {
    v24 = 0;
    v25 = 368;
    v26 = 216;
    while (1)
    {
      v27 = -[FigRegWarpPPGPU _detectCorners:roi:corners:pyrLevel:](self, "_detectCorners:roi:corners:pyrLevel:", *(_QWORD *)((char *)self + v26 - 128), *(_QWORD *)((char *)self + v25 - 8), *(Class *)((char *)&self->super.isa + v25), *(Class *)((char *)&self->super.isa + v26), v24);
      if (v27)
        break;
      ++v24;
      v26 += 8;
      v25 += 16;
      if (v24 >= self->_numPyrLevels)
        goto LABEL_18;
    }
    v34 = v27;
    goto LABEL_26;
  }
LABEL_18:
  -[FigMetalContext waitForIdle](self->_metal, "waitForIdle");
  v28 = -[MTLBuffer contents](objc_retainAutorelease(self->_referencePyramidCorners[0]), "contents");
  p_minCornerResponseThreshold = &self->_cornerMatchingParams.minCornerResponseThreshold;
  v30 = vld1q_dup_f32(p_minCornerResponseThreshold);
  v31 = 0uLL;
  v32 = -6400;
  do
  {
    v33.i32[0] = *(_DWORD *)(v28 + v32 + 6408);
    v33.i32[1] = *(_DWORD *)(v28 + v32 + 6424);
    v33.i32[2] = *(_DWORD *)(v28 + v32 + 6440);
    v33.i32[3] = *(_DWORD *)(v28 + v32 + 6456);
    v31 = vsubq_s32(v31, vcgeq_f32(v33, v30));
    v32 += 64;
  }
  while (v32);
  v34 = 0;
  if (a6)
    *a6 = vaddvq_s32(v31);
LABEL_22:
  if (*v13 == 1)
    kdebug_trace();

  return v34;
}

- (int)processNonReference:(__CVBuffer *)a3 outputTransform:(id *)a4
{
  return -[FigRegWarpPPGPU processNonReference:gdcParams:outputTransform:](self, "processNonReference:gdcParams:outputTransform:", a3, 0, a4);
}

- (int)processNonReference:(__CVBuffer *)a3 gdcParams:(id *)a4 outputTransform:(id *)a5
{
  uint64_t v8;
  void *v9;
  int v10;

  if (a3 && a5)
  {
    -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, getMetalLumaFormat(a3), 1, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = -[FigRegWarpPPGPU processNonReferenceTexture:gdcParams:outputTransform:](self, "processNonReferenceTexture:gdcParams:outputTransform:", v8, a4, a5);

      return v10;
    }
    else
    {
      FigDebugAssert3();
      return -2;
    }
  }
  else
  {
    FigDebugAssert3();
    return -1;
  }
}

- (int)processNonReferenceTexture:(id)a3 outputTransform:(id *)a4
{
  return -[FigRegWarpPPGPU processNonReferenceTexture:gdcParams:outputTransform:mapping:](self, "processNonReferenceTexture:gdcParams:outputTransform:mapping:", a3, 0, a4, 0);
}

- (int)processNonReferenceTexture:(id)a3 gdcParams:(id *)a4 outputTransform:(id *)a5
{
  return -[FigRegWarpPPGPU processNonReferenceTexture:gdcParams:outputTransform:mapping:](self, "processNonReferenceTexture:gdcParams:outputTransform:mapping:", a3, a4, a5, 0);
}

- (int)processNonReferenceTexture:(id)a3 gdcParams:(id *)a4 outputTransform:(id *)a5 mapping:(id *)a6
{
  uint64_t v6;
  id v11;
  _DWORD *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int v19;
  int v20;
  unint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  _OWORD *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  int v43;
  void *v44;
  $7FC4C79D0826BB61D2B795282A69B861 *v45;
  FigRegWarpPPGPU *v46;
  _QWORD *v47;
  double *v48;
  int v49;
  __int128 v50;
  __int32 v51;
  int8x16_t v52;
  int v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  $7FC4C79D0826BB61D2B795282A69B861 *v59;
  id v60;
  unsigned int *p_ransacMinNumInliers;
  $6CC04F8F2B0670351D31989F75CD7B49 *p_cornerMatchingParams;
  unint64_t v63;
  unint64_t v64;
  float *p_minCornerResponseThreshold;
  unsigned __int8 *anon_378;
  unsigned __int8 *v67;
  unsigned __int8 *anon_308;
  double *p_var0;
  $767800ACE08CB8E153311B933E5EDF06 *p_normCoef;
  $CE4B8E79EC58BE83E46087239061619A *p_roi;
  id v72;
  id v73;
  int64x2_t v74;
  int8x16_t v75;
  int8x16_t v76;
  __int128 v77;
  id v78;
  id v79;
  id v80;
  int64x2_t v81;
  uint64_t v82;
  int64x2_t v83;
  uint64_t v84;
  int64x2_t v85;
  uint64_t v86;
  int64x2_t v87;
  uint64_t v88;
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  int v93;
  id v94;
  __int128 v95;
  int8x16_t v96;
  int8x16_t v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102[2];

  v11 = a3;
  v101 = 0;
  v102[0] = 0;
  v99 = 0;
  v100 = 0;
  v98 = 0;
  v76 = *(int8x16_t *)(MEMORY[0x1E0C83FE8] + 16);
  v77 = *MEMORY[0x1E0C83FE8];
  v95 = *MEMORY[0x1E0C83FE8];
  v96 = v76;
  v75 = *(int8x16_t *)(MEMORY[0x1E0C83FE8] + 32);
  v97 = v75;
  v12 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (!v11)
  {
    v58 = v6;
    LODWORD(v57) = 0;
    FigDebugAssert3();
    a5 = 0;
LABEL_38:
    v80 = 0;
    v73 = 0;
    v32 = 0;
    v19 = -1;
    goto LABEL_29;
  }
  if (!a5)
  {
    v58 = v6;
    LODWORD(v57) = 0;
    FigDebugAssert3();
    goto LABEL_38;
  }
  v13 = -[FigRegWarpPPGPU _verifyInputPixelFormat:](self, "_verifyInputPixelFormat:", objc_msgSend(v11, "pixelFormat"));
  if (v13)
  {
    v58 = v6;
    LODWORD(v57) = v13;
    v54 = v13;
    FigDebugAssert3();
    v19 = v54;
    FigSignalErrorAt();
LABEL_52:
    a5 = 0;
    v80 = 0;
    v73 = 0;
    goto LABEL_49;
  }
  if (!self->_applyGDC)
  {
    v73 = 0;
    goto LABEL_11;
  }
  if (!a4)
  {
    v58 = v6;
    LODWORD(v57) = 0;
    FigDebugAssert3();
    v19 = FigSignalErrorAt();
    goto LABEL_52;
  }
  v14 = *(_OWORD *)&a4->var0;
  v15 = *(_OWORD *)&a4->var2[6];
  *(_OWORD *)&self->_anon_378[16] = *(_OWORD *)&a4->var2[2];
  *(_OWORD *)&self->_anon_378[32] = v15;
  *(_OWORD *)self->_anon_378 = v14;
  v16 = *(_OWORD *)&a4->var3[2];
  v17 = *(_OWORD *)&a4->var3[6];
  v18 = *(_OWORD *)&a4[1].var2[3];
  *(_OWORD *)&self->_anon_378[80] = *(_OWORD *)&a4[1].var1;
  *(_OWORD *)&self->_anon_378[96] = v18;
  *(_OWORD *)&self->_anon_378[48] = v16;
  *(_OWORD *)&self->_anon_378[64] = v17;
  v94 = 0;
  v19 = +[CMIDistortionModel generateInverseScalingLUT:withGDCParams:metalCtx:](CMIDistortionModel, "generateInverseScalingLUT:withGDCParams:metalCtx:", &v94);
  v73 = v94;
  if (v19)
  {
    v58 = v6;
    LODWORD(v57) = v19;
    FigDebugAssert3();
LABEL_48:
    a5 = 0;
    v80 = 0;
LABEL_49:
    v32 = 0;
    goto LABEL_29;
  }
LABEL_11:
  v20 = -[FigRegWarpPPGPU _constructPyramid:withTexture:mapping:level0Only:](self, "_constructPyramid:withTexture:mapping:level0Only:", self->_nonReferencePyramidImage, v11, a6, 0);
  if (v20)
  {
    v58 = v6;
    LODWORD(v57) = v20;
    v55 = v20;
    FigDebugAssert3();
    v19 = v55;
    FigSignalErrorAt();
    goto LABEL_48;
  }
  v21 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_shaders->_cornerMatchingPipeline, "maxTotalThreadsPerThreadgroup");
  v93 = 32;
  v102[0] = -[FigRegWarpPPGPU _newBufferWithLength:options:label:](self, "_newBufferWithLength:options:label:", 6400, 0, CFSTR("normReferenceCorners"));
  v72 = v102[0];
  if (!v102[0])
  {
    v58 = v6;
    LODWORD(v57) = 0;
LABEL_47:
    FigDebugAssert3();
    v19 = FigSignalErrorAt();
    goto LABEL_48;
  }
  v22 = -[FigRegWarpPPGPU _newBufferWithLength:options:label:](self, "_newBufferWithLength:options:label:", 6400, 0, CFSTR("normNonReferenceCorners"));
  v101 = v22;
  if (!v22)
  {
    v58 = v6;
    LODWORD(v57) = 0;
    goto LABEL_47;
  }
  v23 = v22;
  v24 = -[FigRegWarpPPGPU _newBufferWithLength:options:label:](self, "_newBufferWithLength:options:label:", 64, 0, CFSTR("solverParams"));
  v99 = v24;
  if (!v24)
  {
    v58 = v6;
    LODWORD(v57) = 0;
    goto LABEL_47;
  }
  v25 = v24;
  v26 = -[FigRegWarpPPGPU _newBufferWithLength:options:label:](self, "_newBufferWithLength:options:label:", 2560, 0, CFSTR("solverResults"));
  v100 = v26;
  if (!v26)
  {
    v58 = v6;
    LODWORD(v57) = 0;
    goto LABEL_47;
  }
  v27 = v26;
  v98 = -[FigRegWarpPPGPU _newBufferWithLength:options:label:](self, "_newBufferWithLength:options:label:", 1600, 0, CFSTR("inlierIndices"));
  if (!v98)
  {
    v58 = v6;
    LODWORD(v57) = 0;
    goto LABEL_47;
  }
  v79 = v27;
  -[FigMetalContext device](self->_metal, "device");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "newBufferWithLength:options:", 80, 0);

  if (!v29)
  {
    v58 = v6;
    LODWORD(v57) = 0;
    goto LABEL_47;
  }
  v59 = a5;
  v60 = v11;
  v80 = objc_retainAutorelease(v29);
  v30 = (_OWORD *)objc_msgSend(v80, "contents");
  v30[2] = v76;
  v30[3] = v75;
  v30[1] = v77;
  LODWORD(v31) = self->_numPyrLevels;
  if ((int)v31 - 1 < 0)
  {
    v45 = 0;
    v44 = 0;
LABEL_26:
    -[FigMetalContext commitAndWait](self->_metal, "commitAndWait");
    v80 = objc_retainAutorelease(v80);
    v48 = (double *)objc_msgSend(v80, "contents");
    v49 = -[FigRegWarpPPGPU _convertTransform:toGPUTransform:](self, "_convertTransform:toGPUTransform:", &v95, v48[2], v48[4], v48[6]);
    v12 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (v49)
    {
      v58 = v6;
      LODWORD(v57) = v49;
      v56 = v49;
      FigDebugAssert3();
      v19 = v56;
      FigSignalErrorAt();
    }
    else
    {
      v19 = 0;
      v50 = v95;
      HIDWORD(v50) = v96.i32[0];
      v51 = v97.i32[2];
      v52 = vextq_s8(vextq_s8(v96, v96, 0xCuLL), v97, 8uLL);
      *(_OWORD *)v59->var0 = v50;
      *(int8x16_t *)&v59->var0[4] = v52;
      LODWORD(v59->var0[8]) = v51;
    }
    a5 = v45;
    v32 = v44;
    v11 = v60;
  }
  else
  {
    v78 = v25;
    v32 = 0;
    a5 = 0;
    v63 = 196 * (v21 / 0x31);
    v64 = v21 / 0x31;
    p_roi = &self->_cornerMatchingParams.roi;
    p_normCoef = &self->_cornerMatchingParams.normCoef;
    p_var0 = &self->_cornerMatchingParams.var0;
    anon_308 = self->_anon_308;
    v67 = &self->_anon_480[96];
    anon_378 = self->_anon_378;
    p_minCornerResponseThreshold = &self->_cornerMatchingParams.minCornerResponseThreshold;
    p_ransacMinNumInliers = &self->_ransacMinNumInliers;
    p_cornerMatchingParams = &self->_cornerMatchingParams;
    v33 = (v31 - 1);
    v34 = 16 * (v31 - 1) + 360;
    v35 = (v31 - 1);
    v74 = vdupq_n_s64(1uLL);
    while (1)
    {
      v31 = (v31 - 1);
      self->_cornerMatchingParams.dims = self->_pyramidLevelsDim[v33];
      *p_roi = *($CE4B8E79EC58BE83E46087239061619A *)((char *)&self->super.isa + v34);
      v36 = *(_OWORD *)self->_normCoefs[v35].inverseX;
      *(_OWORD *)p_normCoef->normX = *(_OWORD *)self->_normCoefs[v35].normX;
      *(_OWORD *)p_normCoef->inverseX = v36;
      self->_anon_480[208] = self->_applyGDC;
      v37 = *((_OWORD *)anon_308 + 5);
      *((_OWORD *)p_var0 + 4) = *((_OWORD *)anon_308 + 4);
      *((_OWORD *)p_var0 + 5) = v37;
      *((_OWORD *)p_var0 + 6) = *((_OWORD *)anon_308 + 6);
      v38 = *((_OWORD *)anon_308 + 1);
      *(_OWORD *)p_var0 = *(_OWORD *)anon_308;
      *((_OWORD *)p_var0 + 1) = v38;
      v39 = *((_OWORD *)anon_308 + 3);
      *((_OWORD *)p_var0 + 2) = *((_OWORD *)anon_308 + 2);
      *((_OWORD *)p_var0 + 3) = v39;
      v40 = *((_OWORD *)anon_378 + 5);
      *((_OWORD *)v67 + 4) = *((_OWORD *)anon_378 + 4);
      *((_OWORD *)v67 + 5) = v40;
      *((_OWORD *)v67 + 6) = *((_OWORD *)anon_378 + 6);
      v41 = *((_OWORD *)anon_378 + 1);
      *(_OWORD *)v67 = *(_OWORD *)anon_378;
      *((_OWORD *)v67 + 1) = v41;
      v42 = *((_OWORD *)anon_378 + 3);
      *((_OWORD *)v67 + 2) = *((_OWORD *)anon_378 + 2);
      *((_OWORD *)v67 + 3) = v42;
      v43 = -[FigRegWarpPPGPUTuningParams getMinCornerResponseThreshold:forBand:](self->_tuningParams, "getMinCornerResponseThreshold:forBand:", p_minCornerResponseThreshold, v31);
      if (v43)
      {
        v58 = v6;
        v19 = v43;
        LODWORD(v57) = v43;
        FigDebugAssert3();
        goto LABEL_35;
      }
      -[FigMetalContext commandBuffer](self->_metal, "commandBuffer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        v58 = v6;
        LODWORD(v57) = 0;
        FigDebugAssert3();
        v19 = FigSignalErrorAt();
        v32 = 0;
        goto LABEL_35;
      }
      objc_msgSend(v44, "computeCommandEncoder");
      v45 = ($7FC4C79D0826BB61D2B795282A69B861 *)objc_claimAutoreleasedReturnValue();

      if (!v45)
        break;
      v46 = self;
      -[$7FC4C79D0826BB61D2B795282A69B861 setComputePipelineState:](v45, "setComputePipelineState:", self->_shaders->_cornerMatchingPipeline);
      v47 = (Class *)((char *)&self->super.isa + v33 * 8);
      -[$7FC4C79D0826BB61D2B795282A69B861 setTexture:atIndex:](v45, "setTexture:atIndex:", v47[11], 0);
      -[$7FC4C79D0826BB61D2B795282A69B861 setTexture:atIndex:](v45, "setTexture:atIndex:", v47[19], 1);
      -[$7FC4C79D0826BB61D2B795282A69B861 setTexture:atIndex:](v45, "setTexture:atIndex:", v73, 2);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBytes:length:atIndex:](v45, "setBytes:length:atIndex:", p_cornerMatchingParams, 296, 0);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v80, 0, 1);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v47[27], 0, 2);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v47[35], 0, 3);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v72, 0, 4);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v23, 0, 5);
      -[$7FC4C79D0826BB61D2B795282A69B861 setThreadgroupMemoryLength:atIndex:](v45, "setThreadgroupMemoryLength:atIndex:", v63, 0);
      v91 = xmmword_1D3305440;
      v92 = 1;
      *(_QWORD *)&v89 = 49;
      *((_QWORD *)&v89 + 1) = v64;
      v90 = 1;
      -[$7FC4C79D0826BB61D2B795282A69B861 dispatchThreads:threadsPerThreadgroup:](v45, "dispatchThreads:threadsPerThreadgroup:", &v91, &v89);
      -[$7FC4C79D0826BB61D2B795282A69B861 setComputePipelineState:](v45, "setComputePipelineState:", v46->_shaders->_reorderCornersPipeline);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v72, 0, 0);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v23, 0, 1);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v47[27], 0, 2);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v47[35], 0, 3);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v78, 0, 4);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBytes:length:atIndex:](v45, "setBytes:length:atIndex:", &v46->_inlierThreshold[v35], 4, 5);
      v87 = v74;
      v88 = 1;
      v85 = v74;
      v86 = 1;
      -[$7FC4C79D0826BB61D2B795282A69B861 dispatchThreads:threadsPerThreadgroup:](v45, "dispatchThreads:threadsPerThreadgroup:", &v87, &v85);
      -[$7FC4C79D0826BB61D2B795282A69B861 setComputePipelineState:](v45, "setComputePipelineState:", v46->_shaders->_rigidMinSamplesSolverPipeline);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v72, 0, 0);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v23, 0, 1);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v78, 0, 2);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v79, 0, 3);
      -[$7FC4C79D0826BB61D2B795282A69B861 setThreadgroupMemoryLength:atIndex:](v45, "setThreadgroupMemoryLength:atIndex:", 5120, 0);
      v91 = xmmword_1D3305450;
      v92 = 1;
      v89 = xmmword_1D3305460;
      v90 = 1;
      -[$7FC4C79D0826BB61D2B795282A69B861 dispatchThreadgroups:threadsPerThreadgroup:](v45, "dispatchThreadgroups:threadsPerThreadgroup:", &v91, &v89);
      -[$7FC4C79D0826BB61D2B795282A69B861 setComputePipelineState:](v45, "setComputePipelineState:", v46->_shaders->_homographyMinSamplesSolverPipeline);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v72, 0, 0);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v23, 0, 1);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v78, 0, 2);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v79, (unint64_t)objc_msgSend(v79, "length") >> 1, 3);
      -[$7FC4C79D0826BB61D2B795282A69B861 setThreadgroupMemoryLength:atIndex:](v45, "setThreadgroupMemoryLength:atIndex:", 5120, 0);
      v91 = xmmword_1D3305450;
      v92 = 1;
      v89 = xmmword_1D3305460;
      v90 = 1;
      -[$7FC4C79D0826BB61D2B795282A69B861 dispatchThreadgroups:threadsPerThreadgroup:](v45, "dispatchThreadgroups:threadsPerThreadgroup:", &v91, &v89);
      self = v46;
      -[$7FC4C79D0826BB61D2B795282A69B861 setComputePipelineState:](v45, "setComputePipelineState:", v46->_shaders->_homographySolverUsingInliersPipeline);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v72, 0, 0);
      v23 = v101;
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v101, 0, 1);
      v78 = v99;
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:");
      v79 = v100;
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:");
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v80, 0, 4);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBytes:length:atIndex:](v45, "setBytes:length:atIndex:", &v93, 4, 5);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBytes:length:atIndex:](v45, "setBytes:length:atIndex:", p_ransacMinNumInliers, 4, 6);
      -[$7FC4C79D0826BB61D2B795282A69B861 setBuffer:offset:atIndex:](v45, "setBuffer:offset:atIndex:", v98, 0, 7);
      v83 = v74;
      v84 = 1;
      v81 = v74;
      v82 = 1;
      -[$7FC4C79D0826BB61D2B795282A69B861 dispatchThreads:threadsPerThreadgroup:](v45, "dispatchThreads:threadsPerThreadgroup:", &v83, &v81);
      -[$7FC4C79D0826BB61D2B795282A69B861 endEncoding](v45, "endEncoding");
      v34 -= 16;
      --v35;
      --v33;
      v32 = v44;
      a5 = v45;
      if ((int)v31 <= 0)
        goto LABEL_26;
    }
    v58 = v6;
    LODWORD(v57) = 0;
    FigDebugAssert3();
    v19 = FigSignalErrorAt();
    a5 = 0;
    v32 = v44;
LABEL_35:
    v11 = v60;
    v12 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  }
LABEL_29:
  -[FigRegWarpPPGPU _releaseBuffer:](self, "_releaseBuffer:", v102, v57, v58);
  -[FigRegWarpPPGPU _releaseBuffer:](self, "_releaseBuffer:", &v101);
  -[FigRegWarpPPGPU _releaseBuffer:](self, "_releaseBuffer:", &v100);
  -[FigRegWarpPPGPU _releaseBuffer:](self, "_releaseBuffer:", &v99);
  -[FigRegWarpPPGPU _releaseBuffer:](self, "_releaseBuffer:", &v98);
  if (*v12 == 1)
    kdebug_trace();

  return v19;
}

- (int)computeHomography:(id *)a3 referenceKeypoints:(id)a4 nonReferenceKeypoints:(id)a5 keypointsCount:(unsigned int)a6
{
  id v10;
  id v11;
  _DWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  int32x4_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  int v30;
  int64x2_t v32;
  uint64_t v33;
  int64x2_t v34;
  uint64_t v35;
  _OWORD v36[4];

  v10 = a4;
  v11 = a5;
  v12 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (a3
    && a6
    && v10
    && v11
    && (v13 = objc_msgSend(v10, "length"), v13 == 16 * a6)
    && objc_msgSend(v11, "length") == v13)
  {
    -[FigMetalContext device](self->_metal, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "newBufferWithLength:options:", 80, 0);

    if (v15)
    {
      v16 = objc_retainAutorelease(v15);
      v17 = objc_msgSend(v16, "contents");
      *(_DWORD *)(v17 + 64) = 0;
      v18 = MEMORY[0x1E0C83FE8];
      v19 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
      *(_OWORD *)(v17 + 16) = *MEMORY[0x1E0C83FE8];
      *(_OWORD *)(v17 + 32) = v19;
      *(_OWORD *)(v17 + 48) = *(_OWORD *)(v18 + 32);
      -[FigMetalContext commandBuffer](self->_metal, "commandBuffer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = v20;
        objc_msgSend(v20, "computeCommandEncoder");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = v22;
          memset(v36, 0, sizeof(v36));
          LODWORD(v36[0]) = a6;
          objc_msgSend(v22, "setComputePipelineState:", self->_shaders->_homographySolverUsingAllCornersPipeline);
          objc_msgSend(v23, "setBuffer:offset:atIndex:", v10, 0, 0);
          objc_msgSend(v23, "setBuffer:offset:atIndex:", v11, 0, 1);
          objc_msgSend(v23, "setBytes:length:atIndex:", v36, 64, 2);
          objc_msgSend(v23, "setBuffer:offset:atIndex:", v16, 0, 3);
          objc_msgSend(v23, "setThreadgroupMemoryLength:atIndex:", 80, 0);
          v34 = vdupq_n_s64(1uLL);
          v35 = 1;
          v32 = v34;
          v33 = 1;
          objc_msgSend(v23, "dispatchThreads:threadsPerThreadgroup:", &v34, &v32);
          objc_msgSend(v23, "endEncoding");
          -[FigMetalContext commitAndWait](self->_metal, "commitAndWait");
          v24 = objc_retainAutorelease(v16);
          v25 = objc_msgSend(v24, "contents");
          v26 = *(int32x4_t *)(v25 + 16);
          LODWORD(v27) = v26.i32[0];
          v28 = *((_OWORD *)a3 + 1);
          HIDWORD(v27) = HIDWORD(*(_QWORD *)a3);
          *((_DWORD *)a3 + 2) = *((_QWORD *)a3 + 1);
          *(_QWORD *)a3 = v27;
          v26.i64[0] = vzip1q_s32(v26, *(int32x4_t *)(v25 + 32)).u64[0];
          *(_QWORD *)a3 = v26.i64[0];
          LODWORD(v27) = *(_DWORD *)(v25 + 48);
          *(_QWORD *)a3 = v26.i64[0];
          *((_DWORD *)a3 + 2) = v27;
          v26.i32[1] = DWORD1(v28);
          v26.i32[0] = *(_DWORD *)(v25 + 20);
          *((_DWORD *)a3 + 6) = DWORD2(v28);
          *((_QWORD *)a3 + 2) = v26.i64[0];
          v26.i32[1] = *(_DWORD *)(v25 + 36);
          *((_DWORD *)a3 + 6) = DWORD2(v28);
          *((_QWORD *)a3 + 2) = v26.i64[0];
          *((_DWORD *)a3 + 6) = *(_DWORD *)(v25 + 52);
          *((_QWORD *)a3 + 2) = v26.i64[0];
          v29 = *((_OWORD *)a3 + 2);
          HIDWORD(v27) = HIDWORD(*((_QWORD *)a3 + 4));
          LODWORD(v27) = *(_DWORD *)(v25 + 24);
          *((_DWORD *)a3 + 10) = DWORD2(v29);
          *((_QWORD *)a3 + 4) = v27;
          HIDWORD(v27) = *(_DWORD *)(v25 + 40);
          *((_DWORD *)a3 + 10) = DWORD2(v29);
          *((_QWORD *)a3 + 4) = v27;
          *((_DWORD *)a3 + 10) = *(_DWORD *)(v25 + 56);
          *((_QWORD *)a3 + 4) = v27;

          v30 = 0;
        }
        else
        {
          FigDebugAssert3();
          v30 = FigSignalErrorAt();

        }
      }
      else
      {
        FigDebugAssert3();
        v30 = FigSignalErrorAt();

      }
    }
    else
    {
      FigDebugAssert3();
      v30 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    v30 = -1;
  }
  if (*v12 == 1)
    kdebug_trace();

  return v30;
}

- (int)_constructPyramid:(id *)a3 withTexture:(id)a4 mapping:(id *)a5 level0Only:(BOOL)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  FigRegWarpPPGPUShaders *shaders;
  void *v32;
  uint32x2_t v33;
  __int128 v34;
  __int128 *v35;
  int64x2_t *v36;
  $6CB4B7FBEADC3B56486F2A4FA86826A5 v37;
  __int128 v38;
  uint64_t v39;
  id *v40;
  $6CB4B7FBEADC3B56486F2A4FA86826A5 v41;
  __int128 v42;
  unint64_t v43;
  int v44;
  NSObject *v46;
  void *v47;
  int64x2_t v48;
  int64x2_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  int64x2_t v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  int64x2_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  os_log_type_t type;
  int v62;
  id v63[21];

  v63[19] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  v63[0] = 0;
  if (self->_performHistEq)
  {
    -[FigMetalContext device](self->_metal, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "newBufferWithLength:options:", -[MPSImageHistogram histogramSizeForSourceFormat:](self->_mpsHist, "histogramSizeForSourceFormat:", 10), 32);

    if (!v11)
    {
      v62 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v46 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v44 = -1;
      goto LABEL_19;
    }
    -[FigMetalContext allocator](self->_metal, "allocator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "newTextureDescriptor");

    if (!v13)
    {
      FigDebugAssert3();
      v44 = FigSignalErrorAt();
      goto LABEL_25;
    }
    objc_msgSend(v13, "desc");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPixelFormat:", 25);

    objc_msgSend(v13, "desc");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUsage:", 7);

    v16 = objc_msgSend(v9, "width");
    objc_msgSend(v13, "desc");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWidth:", v16);

    v18 = objc_msgSend(v9, "height");
    objc_msgSend(v13, "desc");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHeight:", v18);

    objc_msgSend(v13, "setLabel:", 0);
    objc_msgSend(v13, "desc");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCompressionMode:", 2);

    objc_msgSend(v13, "desc");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCompressionFootprint:", 0);

    -[FigMetalContext allocator](self->_metal, "allocator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "newTextureWithDescriptor:", v13);
    v63[0] = v23;

    if (!v23
      || (-[FigMetalContext commandQueue](self->_metal, "commandQueue"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v24, "commandBuffer"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v24,
          !v25))
    {
      FigDebugAssert3();
      v44 = FigSignalErrorAt();

      goto LABEL_25;
    }
    -[MPSImageHistogram encodeToCommandBuffer:sourceTexture:histogram:histogramOffset:](self->_mpsHist, "encodeToCommandBuffer:sourceTexture:histogram:histogramOffset:", v25, v9, v11, 0);
    -[MPSImageHistogramEqualization encodeTransformToCommandBuffer:sourceTexture:histogram:histogramOffset:](self->_mpsHistEq, "encodeTransformToCommandBuffer:sourceTexture:histogram:histogramOffset:", v25, v9, v11, 0);
    -[MPSImageHistogramEqualization encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_mpsHistEq, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v25, v9, v23);
    objc_msgSend(v25, "commit");
    v26 = v23;

  }
  else
  {
    v26 = v8;
    v11 = 0;
    v13 = 0;
  }
  -[FigMetalContext commandQueue](self->_metal, "commandQueue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commandBuffer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    FigDebugAssert3();
    v44 = FigSignalErrorAt();

LABEL_25:
    goto LABEL_19;
  }
  objc_msgSend(v28, "computeCommandEncoder");
  v29 = objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    FigDebugAssert3();
    v44 = FigSignalErrorAt();

LABEL_27:
    goto LABEL_19;
  }
  v30 = (void *)v29;
  shaders = self->_shaders;
  v47 = v9;
  if (!self->_skipInitialDownsample)
  {
    if ((unint64_t)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](shaders->_downscaleImagePipeline, "maxTotalThreadsPerThreadgroup") >= 0x400)
    {
      objc_msgSend(v30, "setComputePipelineState:", self->_shaders->_downscaleImagePipeline);
      v32 = v26;
      objc_msgSend(v30, "setTexture:atIndex:", v26, 0);
      objc_msgSend(v30, "setTexture:atIndex:", *a3, 1);
      objc_msgSend(v30, "setImageblockWidth:height:", 32, 32);
      v37 = self->_pyramidLevelsDim[0];
      *(_QWORD *)&v38 = v37.w;
      *((_QWORD *)&v38 + 1) = v37.h;
      v55 = v38;
      v56 = 1;
      v53 = vdupq_n_s64(0x20uLL);
      v54 = 1;
      v35 = &v55;
      v36 = &v53;
      goto LABEL_15;
    }
    goto LABEL_26;
  }
  if ((unint64_t)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](shaders->_copyImagePipeline, "maxTotalThreadsPerThreadgroup") < 0x100)
  {
LABEL_26:
    FigDebugAssert3();
    v44 = FigSignalErrorAt();

    goto LABEL_27;
  }
  objc_msgSend(v30, "setComputePipelineState:", self->_shaders->_copyImagePipeline);
  v32 = v26;
  objc_msgSend(v30, "setTexture:atIndex:", v26, 0);
  objc_msgSend(v30, "setTexture:atIndex:", *a3, 1);
  objc_msgSend(v30, "setImageblockWidth:height:", 32, 32);
  v33 = vshr_n_u32((uint32x2_t)self->_pyramidLevelsDim[0], 1uLL);
  *(_QWORD *)&v34 = v33.u32[0];
  *((_QWORD *)&v34 + 1) = v33.u32[1];
  v59 = v34;
  v60 = 1;
  v57 = vdupq_n_s64(0x10uLL);
  v58 = 1;
  v35 = &v59;
  v36 = &v57;
LABEL_15:
  objc_msgSend(v30, "dispatchThreads:threadsPerThreadgroup:", v35, v36);
  if (self->_numPyrLevels >= 2)
  {
    v39 = 0;
    v48 = vdupq_n_s64(0x20uLL);
    do
    {
      objc_msgSend(v30, "setComputePipelineState:", self->_shaders->_downscaleImagePipeline);
      v40 = &a3[v39];
      objc_msgSend(v30, "setTexture:atIndex:", *v40, 0);
      objc_msgSend(v30, "setTexture:atIndex:", v40[1], 1);
      objc_msgSend(v30, "setImageblockWidth:height:", 32, 32);
      v41 = self->_pyramidLevelsDim[v39 + 1];
      *(_QWORD *)&v42 = v41.w;
      *((_QWORD *)&v42 + 1) = v41.h;
      v51 = v42;
      v52 = 1;
      v49 = v48;
      v50 = 1;
      objc_msgSend(v30, "dispatchThreads:threadsPerThreadgroup:", &v51, &v49);
      v43 = v39 + 2;
      ++v39;
    }
    while (v43 < self->_numPyrLevels);
  }
  objc_msgSend(v30, "endEncoding");
  objc_msgSend(v28, "commit");

  v44 = 0;
  v9 = v47;
LABEL_19:
  FigMetalDecRef(v63);

  return v44;
}

- (int)_detectCorners:(id)a3 roi:(id)a4 corners:(id)a5 pyrLevel:(unsigned int)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint32x2_t v37;
  __int128 v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint32x2_t v48;
  uint64_t v49;
  id v50;
  __int128 v56;
  uint64_t v57;
  id v58;
  unint64_t v59;
  unint64_t v60;
  int v61;
  uint32x2_t v63;
  _QWORD v64[3];
  _QWORD v65[3];
  _WORD v66[2];
  int v67;
  int64x2_t v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  int64x2_t v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;
  int64x2_t v76;
  uint64_t v77;
  _QWORD v78[3];
  id v79;
  id v80;
  id v81;
  int32x2_t v82;
  uint32x2_t v83;

  v82 = *(int32x2_t *)&a4.var0;
  v83 = *(uint32x2_t *)&a4.var2;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  v80 = 0;
  v81 = 0;
  v79 = 0;
  if (!v8 || !v9)
  {
    FigDebugAssert3();
    v61 = -1;
    goto LABEL_25;
  }
  -[FigMetalContext commandQueue](self->_metal, "commandQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commandBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    FigDebugAssert3();
    v61 = FigSignalErrorAt();
    goto LABEL_25;
  }
  objc_msgSend(v12, "computeCommandEncoder");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    FigDebugAssert3();
    v61 = FigSignalErrorAt();
LABEL_30:

    goto LABEL_25;
  }
  v14 = (void *)v13;
  -[FigMetalContext allocator](self->_metal, "allocator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "newTextureDescriptor");

  if (!v16)
  {
    FigDebugAssert3();
    v61 = FigSignalErrorAt();

    goto LABEL_30;
  }
  v17 = objc_msgSend(v8, "pixelFormat");
  objc_msgSend(v16, "desc");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPixelFormat:", v17);

  objc_msgSend(v16, "desc");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUsage:", 7);

  v20 = objc_msgSend(v8, "width");
  objc_msgSend(v16, "desc");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWidth:", v20);

  v22 = objc_msgSend(v8, "height");
  objc_msgSend(v16, "desc");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHeight:", v22);

  objc_msgSend(v16, "setLabel:", 0);
  -[FigMetalContext allocator](self->_metal, "allocator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "newTextureWithDescriptor:", v16);
  v81 = v25;

  if (!v25)
    goto LABEL_33;
  if ((unint64_t)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_shaders->_boxFilterPipeline, "maxTotalThreadsPerThreadgroup") <= 0xFF)
  {
    FigDebugAssert3();
LABEL_34:
    v61 = FigSignalErrorAt();
LABEL_36:

    goto LABEL_25;
  }
  objc_msgSend(v14, "setComputePipelineState:", self->_shaders->_boxFilterPipeline);
  objc_msgSend(v14, "setTexture:atIndex:", v8, 0);
  objc_msgSend(v14, "setTexture:atIndex:", v25, 1);
  objc_msgSend(v14, "setImageblockWidth:height:", 32, 32);
  v78[0] = (unint64_t)(objc_msgSend(v25, "width") + 1) >> 1;
  v78[1] = (unint64_t)(objc_msgSend(v25, "height") + 1) >> 1;
  v78[2] = 1;
  v76 = vdupq_n_s64(0x10uLL);
  v77 = 1;
  objc_msgSend(v14, "dispatchThreads:threadsPerThreadgroup:", v78, &v76);
  v26 = self->_useHalfPrecisionCornerResponse ? 25 : 24;
  objc_msgSend(v16, "desc");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPixelFormat:", v26);

  objc_msgSend(v16, "desc");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setUsage:", 7);

  v29 = objc_msgSend(v81, "width");
  objc_msgSend(v16, "desc");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWidth:", v29);

  v31 = objc_msgSend(v81, "height");
  objc_msgSend(v16, "desc");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setHeight:", v31);

  objc_msgSend(v16, "setLabel:", 0);
  -[FigMetalContext allocator](self->_metal, "allocator");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "newTextureWithDescriptor:", v16);
  v80 = v34;

  if (!v34)
  {
LABEL_33:
    FigDebugAssert3();
    goto LABEL_34;
  }
  v35 = 40;
  if (!self->_useHalfPrecisionCornerResponse)
    v35 = 32;
  v36 = *(id *)((char *)&self->_shaders->super.isa + v35);
  if ((unint64_t)objc_msgSend(v36, "maxTotalThreadsPerThreadgroup") <= 0xFF)
  {
    FigDebugAssert3();
    v61 = FigSignalErrorAt();

    goto LABEL_36;
  }
  objc_msgSend(v14, "setComputePipelineState:", v36);
  objc_msgSend(v14, "setTexture:atIndex:", v81, 0);
  objc_msgSend(v14, "setTexture:atIndex:", v34, 1);
  objc_msgSend(v14, "setBytes:length:atIndex:", &v82, 16, 0);
  objc_msgSend(v14, "setBytes:length:atIndex:", &self->_normalizeCornerResponse, 1, 1);
  objc_msgSend(v14, "setImageblockWidth:height:", 32, 32);
  v37 = vshr_n_u32(v83, 1uLL);
  *(_QWORD *)&v38 = v37.u32[0];
  *((_QWORD *)&v38 + 1) = v37.u32[1];
  v74 = v38;
  v75 = 1;
  v72 = vdupq_n_s64(0x10uLL);
  v73 = 1;
  objc_msgSend(v14, "dispatchThreads:threadsPerThreadgroup:", &v74, &v72);
  FigMetalDecRef(&v81);
  if (self->_useHalfPrecisionCornerResponse)
    v39 = 115;
  else
    v39 = 114;
  objc_msgSend(v16, "desc");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setPixelFormat:", v39);

  objc_msgSend(v16, "desc");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setUsage:", 7);

  v42 = (unint64_t)objc_msgSend(v34, "width") >> 2;
  objc_msgSend(v16, "desc");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setWidth:", v42);

  v44 = (unint64_t)objc_msgSend(v34, "height") >> 2;
  objc_msgSend(v16, "desc");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setHeight:", v44);

  objc_msgSend(v16, "setLabel:", 0);
  -[FigMetalContext allocator](self->_metal, "allocator");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v46, "newTextureWithDescriptor:", v16);
  v79 = v47;

  if (!v47)
  {
    FigDebugAssert3();
    v61 = FigSignalErrorAt();

LABEL_39:
    goto LABEL_25;
  }
  v48 = (uint32x2_t)vadd_s32((int32x2_t)v83, (int32x2_t)0x1500000015);
  v82 = vadd_s32(v82, (int32x2_t)0xB0000000BLL);
  v83 = v48;
  v49 = 56;
  if (!self->_useHalfPrecisionCornerResponse)
    v49 = 48;
  v50 = *(id *)((char *)&self->_shaders->super.isa + v49);

  if ((unint64_t)objc_msgSend(v50, "maxTotalThreadsPerThreadgroup") <= 0x3FF)
  {
    FigDebugAssert3();
    v61 = FigSignalErrorAt();

    goto LABEL_39;
  }
  objc_msgSend(v14, "setComputePipelineState:", v50);
  objc_msgSend(v14, "setTexture:atIndex:", v34, 0);
  objc_msgSend(v14, "setTexture:atIndex:", v47, 1);
  objc_msgSend(v14, "setBytes:length:atIndex:", &v82, 16, 0);
  objc_msgSend(v14, "setImageblockWidth:height:", 32, 32);
  __asm { FMOV            V0.2S, #0.25 }
  v63 = vcvt_u32_f32(vrndp_f32(vmul_f32(vcvt_f32_u32(v48), _D0)));
  *(_QWORD *)&v56 = v63.u32[0];
  *((_QWORD *)&v56 + 1) = v63.u32[1];
  v70 = v56;
  v71 = 1;
  v68 = vdupq_n_s64(0x20uLL);
  v69 = 1;
  objc_msgSend(v14, "dispatchThreads:threadsPerThreadgroup:", &v70, &v68);
  v67 = 1310740;
  v66[1] = v63.i16[2];
  v66[0] = v63.i16[0];
  v57 = 72;
  if (!self->_useHalfPrecisionCornerResponse)
    v57 = 64;
  v58 = *(id *)((char *)&self->_shaders->super.isa + v57);

  objc_msgSend(v14, "setComputePipelineState:", v58);
  objc_msgSend(v14, "setTexture:atIndex:", v47, 0);
  objc_msgSend(v14, "setBytes:length:atIndex:", v66, 8, 0);
  objc_msgSend(v14, "setBuffer:offset:atIndex:", v10, 0, 1);
  v59 = objc_msgSend(v58, "threadExecutionWidth");
  v60 = objc_msgSend(v58, "maxTotalThreadsPerThreadgroup");
  v65[0] = (unsigned __int16)v67;
  v65[1] = HIWORD(v67);
  v65[2] = 1;
  v64[0] = v59;
  v64[1] = v60 / v59;
  v64[2] = 1;
  objc_msgSend(v14, "dispatchThreads:threadsPerThreadgroup:", v65, v64);
  objc_msgSend(v14, "endEncoding");
  objc_msgSend(v12, "commit");

  v61 = 0;
LABEL_25:
  FigMetalDecRef(&v81);
  FigMetalDecRef(&v80);
  FigMetalDecRef(&v79);

  return v61;
}

- (int)_verifyInputPixelFormat:(unint64_t)a3
{
  int result;
  int v4;

  if (a3 > 0x19 || (result = 0, ((1 << a3) & 0x2100400) == 0))
  {
    if (a3 == 588)
      v4 = 0;
    else
      v4 = -1;
    if (a3 == 576)
      return 0;
    else
      return v4;
  }
  return result;
}

- (int)_determineNumPyrLevels:(unsigned int)a3 pyramid0Height:(unsigned int)a4
{
  int v4;
  int maxNumberOfPyramidLevels;
  BOOL v6;

  self->_numPyrLevels = 0;
  if (a3 >= 0x3E && a4 >= 0x3E)
  {
    v4 = 0;
    maxNumberOfPyramidLevels = self->_maxNumberOfPyramidLevels;
    while (maxNumberOfPyramidLevels != v4)
    {
      self->_numPyrLevels = ++v4;
      if (a3 >= 0x7C)
      {
        a3 >>= 1;
        v6 = a4 > 0x7B;
        a4 >>= 1;
        if (v6)
          continue;
      }
      goto LABEL_9;
    }
    v4 = maxNumberOfPyramidLevels;
LABEL_9:
    if (v4)
      return 0;
  }
  FigDebugAssert3();
  return -1;
}

- (int)_updatePyramidRoi
{
  int8x16_t v2;
  int8x16_t v3;
  uint32x4_t v4;
  uint64_t v5;
  unint64_t v6;

  v2.i32[0] = 0;
  v3.i8[0] = self->_skipInitialDownsample;
  v4 = (uint32x4_t)vbslq_s8(vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v3, v2), 0), (int8x16_t)vshrq_n_u32((uint32x4_t)self->_roi, 1uLL), (int8x16_t)self->_roi);
  self->_pyramidLevelsRoi[0] = ($CE4B8E79EC58BE83E46087239061619A)v4;
  if (self->_numPyrLevels >= 2)
  {
    v5 = 0;
    do
    {
      v4 = vshrq_n_u32(v4, 1uLL);
      self->_pyramidLevelsRoi[v5 + 1] = ($CE4B8E79EC58BE83E46087239061619A)v4;
      v6 = v5 + 2;
      ++v5;
    }
    while (v6 < self->_numPyrLevels);
  }
  return 0;
}

- (int)_setTuningParams
{
  FigRegWarpPPGPUTuningParams *tuningParams;

  *(_QWORD *)&self->_cornerMatchingParams.minNCCThreshold = 0x3F8000003E99999ALL;
  tuningParams = self->_tuningParams;
  if (tuningParams)
  {
    self->_maxNumberOfPyramidLevels = -[FigRegWarpPPGPUTuningParams maxNumberOfPyramidLevels](tuningParams, "maxNumberOfPyramidLevels");
    self->_normalizeCornerResponse = -[FigRegWarpPPGPUTuningParams normalizeCornerResponse](self->_tuningParams, "normalizeCornerResponse");
    self->_performHistEq = -[FigRegWarpPPGPUTuningParams performHistEq](self->_tuningParams, "performHistEq");
    self->_useHalfPrecisionCornerResponse = -[FigRegWarpPPGPUTuningParams useHalfPrecisionCornerResponse](self->_tuningParams, "useHalfPrecisionCornerResponse");
  }
  return 0;
}

- (uint64_t)_convertTransform:(int8x16_t)a3 toGPUTransform:(double)a4
{
  uint64_t result;
  uint32x2_t v11;
  float32x2_t v12;
  unsigned int v13;
  float v14;
  float v15;
  float v16;
  float32x2_t v17;
  float v18;

  if (a9)
  {
    result = 0;
    v11 = a1[44];
    a9[5].i32[0] = 1065353216;
    v12 = vcvt_f32_u32(v11);
    *(float *)&a7 = fmaxf(v12.f32[0], v12.f32[1]);
    *(float *)&v13 = vmuls_lane_f32(*(float *)a3.i32, v12, 1) / v12.f32[0];
    v14 = (float)(*(float *)&a7 * *(float *)&a4) / v12.f32[0];
    v15 = vmuls_lane_f32(v12.f32[0], *(float32x2_t *)a2.i8, 1) / v12.f32[1];
    v16 = vmuls_lane_f32(*(float *)&a7, *(float32x2_t *)&a4, 1) / v12.f32[1];
    v17 = vdiv_f32(vmul_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a2, a2, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a3, a3, 8uLL)), v12), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a7, 0));
    v18 = 1.0 / (float)((float)(1.0 - v17.f32[0]) - v17.f32[1]);
    a9[1].f32[0] = v18
                 * (float)((float)((float)(v17.f32[1]
                                         + (float)(v17.f32[0] + (float)(*(float *)a2.i32 + (float)(*(float *)&v13 - v14))))
                                 + -1.0)
                         * -0.5);
    *a9 = vmul_n_f32(vadd_f32((float32x2_t)__PAIR64__(v13, a2.u32[0]), v17), v18);
    *(float *)a3.i32 = v15;
    a9[3].f32[0] = v18
                 * (float)((float)((float)(v17.f32[1]
                                         + (float)(v17.f32[0] + (float)((float)(*(float *)&a3.i32[1] + v15) - v16)))
                                 + -1.0)
                         * -0.5);
    a9[2] = vmul_n_f32(vadd_f32(*(float32x2_t *)a3.i8, v17), v18);
    a9[4] = vmul_n_f32(vadd_f32(v17, v17), v18);
  }
  else
  {
    FigDebugAssert3();
    return 0xFFFFFFFFLL;
  }
  return result;
}

- (void)_releaseBuffer:(id *)a3
{
  if (self->_allocateBuffersWithAllocator)
    FigMetalDecRef(a3);
}

- (BOOL)applyGDC
{
  return self->_applyGDC;
}

- (void)setApplyGDC:(BOOL)a3
{
  self->_applyGDC = a3;
}

- (FigRegWarpPPGPUTuningParams)tuningParams
{
  return self->_tuningParams;
}

- (void)setTuningParams:(id)a3
{
  objc_storeStrong((id *)&self->_tuningParams, a3);
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;

  objc_storeStrong((id *)&self->_tuningParams, 0);
  objc_storeStrong((id *)&self->_mpsHistEq, 0);
  objc_storeStrong((id *)&self->_mpsHist, 0);
  for (i = 0; i != -8; --i)
    objc_storeStrong((id *)&self->_nonReferencePyramidCorners[i + 7], 0);
  for (j = 0; j != -8; --j)
    objc_storeStrong((id *)&self->_referencePyramidCorners[j + 7], 0);
  for (k = 0; k != -8; --k)
    objc_storeStrong((id *)&self->_nonReferencePyramidImage[k + 7], 0);
  for (m = 144; m != 80; m -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + m), 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end
