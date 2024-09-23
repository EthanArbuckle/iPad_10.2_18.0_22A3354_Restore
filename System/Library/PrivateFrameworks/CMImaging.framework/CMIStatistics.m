@implementation CMIStatistics

- (CMIStatistics)initWithOptionalCommandQueue:(id)a3
{
  id v4;
  CMIStatistics *v5;
  FigMetalContext *v6;
  void *v7;
  uint64_t v8;
  FigMetalContext *metal;
  FigMetalContext *v10;
  uint64_t v11;
  MTLComputePipelineState *reduceStep1Shader;
  uint64_t v13;
  MTLComputePipelineState *reduceStep2Shader;
  CMIStatistics *v15;
  CMIStatistics *v16;
  int v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CMIStatistics;
  v5 = -[CMIStatistics init](&v19, sel_init);
  if (!v5)
    goto LABEL_7;
  v6 = [FigMetalContext alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v6, "initWithbundle:andOptionalCommandQueue:", v7, v4);
  metal = v5->_metal;
  v5->_metal = (FigMetalContext *)v8;

  v10 = v5->_metal;
  if (v10)
  {
    -[FigMetalContext computePipelineStateFor:constants:](v10, "computePipelineStateFor:constants:", CFSTR("CMIStatistics::reduceStep1"), 0);
    v11 = objc_claimAutoreleasedReturnValue();
    reduceStep1Shader = v5->_reduceStep1Shader;
    v5->_reduceStep1Shader = (MTLComputePipelineState *)v11;

    if (v5->_reduceStep1Shader)
    {
      -[FigMetalContext computePipelineStateFor:constants:](v5->_metal, "computePipelineStateFor:constants:", CFSTR("CMIStatistics::reduceStep2"), 0);
      v13 = objc_claimAutoreleasedReturnValue();
      reduceStep2Shader = v5->_reduceStep2Shader;
      v5->_reduceStep2Shader = (MTLComputePipelineState *)v13;

      if (v5->_reduceStep2Shader)
        goto LABEL_5;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = FigSignalErrorAt();
    v15 = 0;
    if (!v18)
LABEL_5:
      v15 = v5;
  }
  else
  {
LABEL_7:
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
  }
  v16 = v15;

  return v16;
}

- (int)getStatisticsFromPixelBuffer:(__CVBuffer *)a3 withRoi:(CGRect)a4 toResult:(id *)a5 withOptionalChannelConfig:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  OSType PixelFormatType;
  void *v15;
  int v16;
  int v17;
  id v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, determineMTLPixelFormatsForCVPixelFormat(PixelFormatType), 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v15;
  if (v15)
  {
    v16 = -[CMIStatistics getStatisticsFromTexture:withRoi:toResult:withOptionalChannelConfig:](self, "getStatisticsFromTexture:withRoi:toResult:withOptionalChannelConfig:", v15, a5, a6, x, y, width, height);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = FigSignalErrorAt();
  }
  v17 = v16;
  FigMetalDecRef(&v19);

  return v17;
}

- (int)getStatisticsFromTexture:(id)a3 withRoi:(CGRect)a4 toResult:(id *)a5 withOptionalChannelConfig:(id *)a6
{
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  void *v14;
  float64x2_t v15;
  int32x2_t v16;
  int v17;
  __int128 v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  uint64_t v42;
  BOOL v43;
  id v44;
  id v45;
  id v46;
  id v47;
  CMIDeferredObject *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  CMIDeferredObject *v53;
  int v54;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  id *v60;
  id v61;
  CGFloat x;
  int v63;
  CGFloat y;
  int v65;
  int64x2_t v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  int v73;
  int v74;
  int64x2_t v75;
  uint64_t v76;
  uint64_t v77;
  int64x2_t v78;
  unsigned int v79;
  int64x2_t v80;
  uint64_t v81;
  _QWORD v82[3];
  __int128 v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  y = a4.origin.y;
  v94 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v92 = 0;
  v93 = 0;
  v90 = 0;
  v91 = 0;
  v88 = 0;
  v89 = 0;
  v86 = 0;
  v87 = 0;
  v85 = 0;
  v84 = 0;
  if (!a6)
  {
    LODWORD(v84) = 1;
    v85 = 1056964608;
    a6 = ($1230CF39250A084FEEB876D19862D23B *)&v84;
  }
  -[FigMetalContext commandBuffer](self->_metal, "commandBuffer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLabel:", 0);
  if (v12 && (objc_msgSend(v12, "computeCommandEncoder"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = v13;
    v60 = a5;
    v15.f64[0] = x;
    v15.f64[1] = y;
    v16 = vmovn_s64(vcvtq_s64_f64(v15));
    v17 = (int)height;
    objc_msgSend(v13, "setComputePipelineState:", self->_reduceStep1Shader);
    v61 = v11;
    objc_msgSend(v14, "setTexture:atIndex:", v11, 0);
    *(float32x2_t *)&v18 = vcvt_f32_s32(v16);
    *((float *)&v18 + 2) = (float)(int)width;
    *((float *)&v18 + 3) = (float)(int)height;
    v83 = v18;
    objc_msgSend(v14, "setBytes:length:atIndex:", &v83, 16, 0);
    objc_msgSend(v14, "setBytes:length:atIndex:", a6, 12, 1);
    v19 = (int)width + 31;
    if ((int)width < -31)
      v19 = (int)width + 62;
    v65 = v19;
    v20 = v19 >> 5;
    v21 = v17 + 31;
    if (v17 < -31)
      v21 = v17 + 62;
    v63 = v21;
    v22 = v20 * (v21 >> 5);
    v23 = 4 * v22;
    v24 = v22 + 1023;
    if (v22 < -1023)
      v24 = v22 + 2046;
    v25 = 4 * (v24 >> 10);
    -[FigMetalContext device](self->_metal, "device");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v23;
    v28 = objc_msgSend(v26, "newBufferWithLength:options:", v23, 0);
    v92 = v28;

    -[FigMetalContext device](self->_metal, "device");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v29, "newBufferWithLength:options:", v25, 0);

    -[FigMetalContext device](self->_metal, "device");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "newBufferWithLength:options:", v23, 0);
    v90 = v31;

    -[FigMetalContext device](self->_metal, "device");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v32, "newBufferWithLength:options:", v25, 0);

    -[FigMetalContext device](self->_metal, "device");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "newBufferWithLength:options:", v27, 0);
    v88 = v34;

    -[FigMetalContext device](self->_metal, "device");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v35, "newBufferWithLength:options:", v25, 0);

    -[FigMetalContext device](self->_metal, "device");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "newBufferWithLength:options:", v27, 0);
    v86 = v37;

    -[FigMetalContext device](self->_metal, "device");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v38, "newBufferWithLength:options:", v25, 0);

    objc_msgSend(v14, "setBuffer:offset:atIndex:", v28, 0, 2);
    objc_msgSend(v14, "setBuffer:offset:atIndex:", v31, 0, 3);
    objc_msgSend(v14, "setBuffer:offset:atIndex:", v34, 0, 4);
    objc_msgSend(v14, "setBuffer:offset:atIndex:", v37, 0, 5);
    v82[0] = (uint64_t)v65 >> 5;
    v82[1] = (uint64_t)v63 >> 5;
    v82[2] = 1;
    v80 = vdupq_n_s64(0x20uLL);
    v81 = 1;
    objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", v82, &v80);
    objc_msgSend(v14, "endEncoding");
    -[FigMetalContext commit](self->_metal, "commit");
    v79 = v22;
    if (v22 < 2)
    {
      v42 = 0;
      v41 = v14;
LABEL_18:
      v44 = (id)*(&v92 + v42);
      v45 = (id)*(&v90 + v42);
      v46 = (id)*(&v88 + v42);
      v47 = (id)*(&v86 + v42);
      v48 = [CMIDeferredObject alloc];
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __85__CMIStatistics_getStatisticsFromTexture_withRoi_toResult_withOptionalChannelConfig___block_invoke;
      v67[3] = &unk_1E94EB588;
      v12 = v12;
      v68 = v12;
      v49 = v44;
      v69 = v49;
      v50 = v45;
      v70 = v50;
      v51 = v46;
      v71 = v51;
      v52 = v47;
      v72 = v52;
      v73 = (int)width;
      v74 = (int)height;
      v53 = -[CMIDeferredObject initWithBlock:](v48, "initWithBlock:", v67);
      *v60 = v53;
      if (v53)
      {
        v54 = 0;
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v54 = FigSignalErrorAt();
      }

    }
    else
    {
      v66 = vdupq_n_s64(0x20uLL);
      v39 = 1;
      while (1)
      {
        v40 = v12;
        -[FigMetalContext commandBuffer](self->_metal, "commandBuffer");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "setLabel:", 0);
        if (!v12)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          v54 = FigSignalErrorAt();
          v41 = v14;
          goto LABEL_21;
        }
        objc_msgSend(v12, "computeCommandEncoder");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v41)
          break;
        v42 = v39 & 1;
        objc_msgSend(v41, "setComputePipelineState:", self->_reduceStep2Shader);
        objc_msgSend(v41, "setBytes:length:atIndex:", &v79, 4, 0);
        objc_msgSend(v41, "setBuffer:offset:atIndex:", *(&v92 + (((_BYTE)v39 - 1) & 1)), 0, 1);
        objc_msgSend(v41, "setBuffer:offset:atIndex:", *(&v92 + v42), 0, 2);
        objc_msgSend(v41, "setBuffer:offset:atIndex:", *(&v90 + (((_BYTE)v39 - 1) & 1)), 0, 3);
        objc_msgSend(v41, "setBuffer:offset:atIndex:", *(&v90 + v42), 0, 4);
        objc_msgSend(v41, "setBuffer:offset:atIndex:", *(&v88 + (((_BYTE)v39 - 1) & 1)), 0, 5);
        objc_msgSend(v41, "setBuffer:offset:atIndex:", *(&v88 + v42), 0, 6);
        objc_msgSend(v41, "setBuffer:offset:atIndex:", *(&v86 + (((_BYTE)v39 - 1) & 1)), 0, 7);
        objc_msgSend(v41, "setBuffer:offset:atIndex:", *(&v86 + v42), 0, 8);
        v77 = (v22 + 1023) >> 10;
        v78 = vdupq_n_s64(1uLL);
        v75 = v66;
        v76 = 1;
        objc_msgSend(v41, "dispatchThreadgroups:threadsPerThreadgroup:", &v77, &v75);
        objc_msgSend(v41, "endEncoding");
        -[FigMetalContext commit](self->_metal, "commit");
        v79 = (v22 + 1023) >> 10;
        ++v39;
        v14 = v41;
        v43 = v22 >= 0x401;
        v22 = v79;
        if (!v43)
          goto LABEL_18;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      v54 = FigSignalErrorAt();
    }
LABEL_21:
    v11 = v61;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v54 = FigSignalErrorAt();
    v41 = 0;
  }
  for (i = 8; i != -8; i -= 8)

  for (j = 8; j != -8; j -= 8)
  for (k = 8; k != -8; k -= 8)

  for (m = 8; m != -8; m -= 8)
  return v54;
}

CMIStatisticsResult *__85__CMIStatistics_getStatisticsFromTexture_withRoi_toResult_withOptionalChannelConfig___block_invoke(uint64_t a1)
{
  CMIStatisticsResult *v2;
  int v3;
  int v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(*(id *)(a1 + 32), "waitUntilCompleted");
  v2 = [CMIStatisticsResult alloc];
  v3 = *(_DWORD *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "contents");
  v4 = *(_DWORD *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "contents");
  v5 = *(_DWORD *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "contents");
  LODWORD(v6) = *(_DWORD *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 64)), "contents");
  *(float *)&v7 = (float)(*(_DWORD *)(a1 + 76) * *(_DWORD *)(a1 + 72));
  LODWORD(v8) = v3;
  LODWORD(v9) = v4;
  LODWORD(v10) = v5;
  return -[CMIStatisticsResult initWithMin:max:sum:sumOfSquares:area:](v2, "initWithMin:max:sum:sumOfSquares:area:", v8, v9, v10, v6, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reduceStep2Shader, 0);
  objc_storeStrong((id *)&self->_reduceStep1Shader, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end
