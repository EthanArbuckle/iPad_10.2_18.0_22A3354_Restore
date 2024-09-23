@implementation _MFXTemporalScalingEffectV3

- (unint64_t)executionMode
{
  return !self->_net_wrapper._prewarmComplete || !self->_useANE;
}

- (void)setJitterOffsetX:(float)a3
{
  *(float *)&self->_jitterOffset[4] = a3;
}

- (float)jitterOffsetX
{
  uint64_t v2;
  float result;

  v2 = *(_QWORD *)&self->_jitterOffset[4];
  LODWORD(result) = v2;
  return result;
}

- (void)setJitterOffsetY:(float)a3
{
  *(float *)self->_motionVectorScale = a3;
}

- (float)jitterOffsetY
{
  return *(float *)self->_motionVectorScale;
}

- (void)setMotionVectorScaleX:(float)a3
{
  *(float *)&self->_motionVectorScale[4] = a3;
}

- (float)motionVectorScaleX
{
  uint64_t v2;
  float result;

  v2 = *(_QWORD *)&self->_motionVectorScale[4];
  LODWORD(result) = v2;
  return result;
}

- (void)setMotionVectorScaleY:(float)a3
{
  *(float *)&self->_motionVectorScale[8] = a3;
}

- (float)motionVectorScaleY
{
  return *(float *)&self->_motionVectorScale[8];
}

- (void)setReversedDepth:(BOOL)a3
{
  self->_reversedDepth = a3;
}

- (BOOL)reversedDepth
{
  return self->_reversedDepth;
}

- (void)setJitterOffset:(CGPoint)a3
{
  CGFloat y;

  y = a3.y;
  *(float32x2_t *)&self->_jitterOffset[4] = vcvt_f32_f64((float64x2_t)a3);
}

- (CGPoint)jitterOffset
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)&self->_jitterOffset[4]);
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)setMotionVectorScale:(CGPoint)a3
{
  CGFloat y;

  y = a3.y;
  *(float32x2_t *)&self->_motionVectorScale[4] = vcvt_f32_f64((float64x2_t)a3);
}

- (CGPoint)motionVectorScale
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)&self->_motionVectorScale[4]);
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (_MFXTemporalScalingEffectV3)initWithDevice:(id)a3 descriptor:(id)a4 history:(id)a5
{
  id v9;
  char *v10;
  id *v11;
  float v12;
  uint64_t v13;
  float v14;
  char *v15;
  char *v16;
  SEL v17;
  Class v18;
  void *v19;
  char *v20;
  id *v21;
  _OWORD *v22;
  id v23;
  char *v24;
  char *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  dispatch_queue_t v51;
  void *v52;
  char *v53;
  int v54;
  float v55;
  float v56;
  float v57;
  float v58;
  unint64_t v59;
  float v60;
  float v61;
  unint64_t v62;
  float v63;
  _MFXTemporalScalingEffectV3 *v64;
  float v65;
  float v66;
  int v67;
  float v68;
  int v69;
  unsigned int v70;
  unsigned int v71;
  MPSGraphCompilationDescriptor *v72;
  MPSGraphCompilationDescriptor *v73;
  uint64_t v74;
  NSData *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  int *v84;
  void *v85;
  void *v86;
  BOOL v87;
  int v89;
  int v90;
  uint64_t v91;
  char *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  MPSGraphDevice *v99;
  id v100;
  id v101;
  int v102[2];
  id v103;
  objc_super v104;

  v101 = a3;
  v9 = a4;
  v100 = a5;
  v104.receiver = self;
  v104.super_class = (Class)_MFXTemporalScalingEffectV3;
  v10 = -[_MTLFXEffect init](&v104, sel_init);
  v11 = (id *)(v10 + 32);
  objc_storeStrong((id *)v10 + 4, a3);
  *((_QWORD *)v10 + 9) = objc_msgSend(v9, "colorTextureFormat");
  *((_QWORD *)v10 + 10) = objc_msgSend(v9, "depthTextureFormat");
  *((_QWORD *)v10 + 11) = objc_msgSend(v9, "motionTextureFormat");
  *((_QWORD *)v10 + 102) = objc_msgSend(v9, "outputTextureFormat");
  *((_QWORD *)v10 + 12) = objc_msgSend(v9, "reactiveMaskTextureFormat");
  *((_QWORD *)v10 + 5) = objc_msgSend(v9, "inputWidth");
  *((_QWORD *)v10 + 6) = objc_msgSend(v9, "inputHeight");
  *((_QWORD *)v10 + 7) = objc_msgSend(v9, "outputWidth");
  *((_QWORD *)v10 + 8) = objc_msgSend(v9, "outputHeight");
  *((_DWORD *)v10 + 26) = 1065353216;
  v10[144] = 1;
  v12 = (float)*((unint64_t *)v10 + 5);
  *(float *)&v13 = -v12;
  *((_DWORD *)v10 + 30) = v13;
  v14 = (float)*((unint64_t *)v10 + 6);
  *((float *)&v13 + 1) = -v14;
  *((_QWORD *)v10 + 15) = v13;
  v10[145] = 1;
  v10[147] = 1;
  v10[149] = objc_msgSend(v9, "isReactiveMaskTextureEnabled");
  v10[148] = 1;
  v10[150] = 1;
  if (isInternalBuild(void)::once != -1)
    dispatch_once(&isInternalBuild(void)::once, &__block_literal_global);
  if (isInternalBuild(void)::isInternal)
  {
    v15 = getenv("MTLFX_FORCE_GPU");
    if (!v15)
      v15 = "0";
    if (strtol(v15, 0, 0))
      v10[147] = 0;
    v16 = getenv("MTLFX_PRE_BICUBIC");
    if (!v16)
      v16 = "0";
    if (strtol(v16, 0, 0))
      v10[148] = 0;
  }
  v17 = NSSelectorFromString(CFSTR("instance"));
  v18 = NSClassFromString(CFSTR("_CADeveloperHUDProperties"));
  if (v18)
  {
    ((void (*)(Class, SEL))-[objc_class methodForSelector:](v18, "methodForSelector:", v17))(v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  v20 = getenv("MTLFX_HUD_ENABLED");
  if (!v20)
    v20 = "0";
  v21 = (id *)(v10 + 792);
  v97 = v19;
  if (strtol(v20, 0, 0))
  {
    objc_storeStrong((id *)v10 + 99, v19);
    if (*v21)
    {
      objc_msgSend(*v21, "addLabel:after:", CFSTR("com.apple.hud-label.metalfx"), CFSTR("com.apple.hud-graph.default"));
      objc_msgSend(*v21, "addLabel:after:", CFSTR("com.apple.hud-label.metalfx.resolution"), CFSTR("com.apple.hud-label.metalfx"));
      objc_msgSend(*v21, "addLabel:after:", CFSTR("com.apple.hud-label.metalfx.timing"), CFSTR("com.apple.hud-label.metalfx.resolution"));
      v22 = (_OWORD *)operator new();
      v22[29] = 0u;
      v22[30] = 0u;
      v22[27] = 0u;
      v22[28] = 0u;
      v22[25] = 0u;
      v22[26] = 0u;
      v22[23] = 0u;
      v22[24] = 0u;
      v22[21] = 0u;
      v22[22] = 0u;
      v22[19] = 0u;
      v22[20] = 0u;
      v22[17] = 0u;
      v22[18] = 0u;
      v22[15] = 0u;
      v22[16] = 0u;
      v22[13] = 0u;
      v22[14] = 0u;
      v22[11] = 0u;
      v22[12] = 0u;
      v22[9] = 0u;
      v22[10] = 0u;
      v22[7] = 0u;
      v22[8] = 0u;
      v22[5] = 0u;
      v22[6] = 0u;
      v22[3] = 0u;
      v22[4] = 0u;
      v22[1] = 0u;
      v22[2] = 0u;
      *v22 = 0u;
      *(_OWORD *)((char *)v22 + 492) = 0u;
      *((_QWORD *)v10 + 100) = v22;
    }
  }
  else
  {
    v23 = *v21;
    *v21 = 0;

  }
  v24 = getenv("MTLFX_DISABLE_LATE_LATCH");
  if (!v24)
    v24 = "0";
  if (strtol(v24, 0, 0))
    v10[150] = 0;
  v25 = getenv("MTLFX_EXECUTION_MODE");
  v92 = v25;
  if (!v25)
    v25 = "0";
  v91 = strtol(v25, 0, 0);
  if (v91 == 1)
    v10[147] = 0;
  *((_QWORD *)v10 + 93) = 1;
  *((_QWORD *)v10 + 94) = 1;
  *((_QWORD *)v10 + 95) = 1;
  *((_QWORD *)v10 + 96) = 1;
  *((_QWORD *)v10 + 97) = 7;
  objc_msgSend(MEMORY[0x24BDDE538], "deviceWithMTLDevice:", *v11);
  v99 = (MPSGraphDevice *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "pathForResource:ofType:", CFSTR("default"), CFSTR("metallib"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v94);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0;
  v96 = (void *)objc_msgSend(v101, "newLibraryWithURL:error:", v26, &v103);
  v93 = v103;

  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, *((_QWORD *)v10 + 7), *((_QWORD *)v10 + 8), 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setUsage:", 3);
  objc_msgSend(v98, "setCompressionMode:", 1);
  v27 = v100;
  if (!v100)
    v27 = (void *)objc_msgSend(*v11, "newTextureWithDescriptor:", v98);
  objc_storeStrong((id *)v10 + 25, v27);
  if (!v100)

  if (v10[149])
  {
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", *((_QWORD *)v10 + 12), *((_QWORD *)v10 + 5), *((_QWORD *)v10 + 6), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setUsage:", 3);
    objc_msgSend(v28, "setCompressionMode:", 1);
    v29 = objc_msgSend(*v11, "newTextureWithDescriptor:", v28);
    v30 = (void *)*((_QWORD *)v10 + 26);
    *((_QWORD *)v10 + 26) = v29;

  }
  v31 = (void *)objc_opt_new();
  v32 = v31;
  if (v10[150])
  {
    objc_msgSend(v31, "setEnableLowLatencySignalSharedEvent:", 1);
    objc_msgSend(v32, "setEnableLowLatencyWaitSharedEvent:", 1);
    objc_msgSend(v32, "setDisableIOFencing:", 1);
  }
  v33 = *v11;
  v34 = objc_msgSend(v33, "newCommandQueueWithDescriptor:", v32);
  v35 = (void *)*((_QWORD *)v10 + 47);
  *((_QWORD *)v10 + 47) = v34;

  v36 = objc_msgSend(*v11, "newEvent");
  v37 = (void *)*((_QWORD *)v10 + 48);
  *((_QWORD *)v10 + 48) = v36;

  v38 = objc_msgSend(*v11, "newEvent");
  v39 = (void *)*((_QWORD *)v10 + 49);
  *((_QWORD *)v10 + 49) = v38;

  v40 = objc_msgSend(*v11, "newEvent");
  v41 = (void *)*((_QWORD *)v10 + 50);
  *((_QWORD *)v10 + 50) = v40;

  v42 = objc_msgSend(*v11, "newEvent");
  v43 = (void *)*((_QWORD *)v10 + 51);
  *((_QWORD *)v10 + 51) = v42;

  if (v10[147])
  {
    v44 = objc_msgSend(*v11, "newSharedEvent");
    v45 = (void *)*((_QWORD *)v10 + 52);
    *((_QWORD *)v10 + 52) = v44;

    v46 = objc_msgSend(*v11, "newSharedEvent");
  }
  else
  {
    v47 = (void *)*((_QWORD *)v10 + 52);
    *((_QWORD *)v10 + 52) = 0;

    v46 = objc_msgSend(*v11, "newEvent");
  }
  v48 = (void *)*((_QWORD *)v10 + 53);
  *((_QWORD *)v10 + 53) = v46;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*((id *)v10 + 49), "setEnableBarrier:", 0);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v49 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v49, QOS_CLASS_USER_INTERACTIVE, 0);
  v50 = objc_claimAutoreleasedReturnValue();

  v51 = dispatch_queue_create("MetalFX", v50);
  v52 = (void *)*((_QWORD *)v10 + 56);
  *((_QWORD *)v10 + 56) = v51;

  *((_QWORD *)v10 + 90) = *((_QWORD *)v10 + 5);
  *((_QWORD *)v10 + 91) = *((_QWORD *)v10 + 6);
  v10[146] = objc_msgSend(v9, "isAutoExposureEnabled");
  v53 = getenv("MTLFX_FORCE_AUTO_EXPOSURE");
  if (!v53)
    v53 = "0";
  if (strtol(v53, 0, 0))
    v10[146] = 1;
  if ((objc_msgSend(v9, "isInputContentPropertiesEnabled") & 1) != 0)
  {
    objc_msgSend(v9, "inputContentMinScale");
    *((_DWORD *)v10 + 184) = v54;
    objc_msgSend(v9, "inputContentMaxScale");
    *((float *)v10 + 185) = v55;
    v56 = *((float *)v10 + 184);
    v57 = v55;
  }
  else
  {
    v58 = (float)*((unint64_t *)v10 + 7);
    v59 = *((_QWORD *)v10 + 5);
    v60 = v58 / (float)v59;
    v61 = (float)*((unint64_t *)v10 + 8);
    v62 = *((_QWORD *)v10 + 6);
    v63 = v61 / (float)v62;
    v56 = fminf(v60, v63);
    v55 = fmaxf(v60, v63);
    *((float *)v10 + 184) = v56;
    *((float *)v10 + 185) = v55;
    v57 = fmaxf(v58 / (float)(v59 + 1), v61 / (float)(v62 + 1));
  }
  if (v56 >= 1.0 && v57 <= 3.0)
  {
    v89 = *((_DWORD *)v10 + 12);
    v90 = *((_DWORD *)v10 + 10);
    if (v55 <= 2.0)
    {
      v67 = *((_DWORD *)v10 + 14);
      v69 = *((_DWORD *)v10 + 16);
    }
    else if ((objc_msgSend(v9, "isInputContentPropertiesEnabled") & 1) != 0)
    {
      v65 = *((float *)v10 + 185);
      v66 = ceilf((float)*((unint64_t *)v10 + 7) / v65);
      v67 = (int)(float)(v66 + v66);
      v68 = ceilf((float)*((unint64_t *)v10 + 8) / v65);
      v69 = (int)(float)(v68 + v68);
    }
    else
    {
      v67 = 2 * *((_DWORD *)v10 + 10);
      v69 = 2 * *((_DWORD *)v10 + 12);
    }
    v70 = ((v67 + 63) >> 1) & 0x7FFFFFE0;
    v71 = ((v69 + 63) >> 1) & 0x7FFFFFE0;
    *((_DWORD *)v10 + 64) = 0;
    *((_DWORD *)v10 + 65) = v67;
    *((_DWORD *)v10 + 66) = v69;
    *((_DWORD *)v10 + 67) = v70;
    *((_DWORD *)v10 + 68) = v71;
    *(_QWORD *)(v10 + 276) = 0x100000005;
    *((_DWORD *)v10 + 71) = v70;
    *((_DWORD *)v10 + 72) = v71;
    *(_QWORD *)(v10 + 292) = 0x200000005;
    *((_DWORD *)v10 + 75) = v70 >> 1;
    *((_DWORD *)v10 + 76) = v71 >> 1;
    *(_OWORD *)(v10 + 308) = xmmword_23455A9E0;
    *(_QWORD *)(v10 + 324) = 0x8000000040;
    v72 = (MPSGraphCompilationDescriptor *)objc_opt_new();
    v73 = v72;
    if (v10[147])
    {
      -[MPSGraphCompilationDescriptor setOptimizationLevel:](v72, "setOptimizationLevel:", 1);
      -[MPSGraphCompilationDescriptor setOptimizationProfile:](v73, "setOptimizationProfile:", 1);
      v74 = objc_msgSend(v101, "supportsFamily:", 1008) ? 3 : 2;
      -[MPSGraphCompilationDescriptor setAneCompilerSpatialSplitting:](v73, "setAneCompilerSpatialSplitting:", v74);
      if (v10[150])
      {
        -[MPSGraphCompilationDescriptor setEnableANELateLatch:](v73, "setEnableANELateLatch:", 1);
        -[MPSGraphCompilationDescriptor setEnableANEFWToFWSignal:](v73, "setEnableANEFWToFWSignal:", 1);
      }
    }
    getEmitModelWeightsData(0, 1, 0);
    v75 = (NSData *)objc_claimAutoreleasedReturnValue();
    EmitBR_Net_V35_getMPSGraphExecutable(v75, (const BRNetDescriptor *)(v10 + 256), v73);
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = (void *)*((_QWORD *)v10 + 28);
    *((_QWORD *)v10 + 28) = v76;

    -[MPSGraphCompilationDescriptor setOptimizationProfile:](v73, "setOptimizationProfile:", 0);
    EmitBR_Net_V35_getMPSGraphExecutable(v75, (const BRNetDescriptor *)(v10 + 256), v73);
    v78 = objc_claimAutoreleasedReturnValue();
    v79 = (void *)*((_QWORD *)v10 + 29);
    *((_QWORD *)v10 + 29) = v78;

    *(_QWORD *)v102 = 0;
    makeMPSTensorDataWithData(v99, *((unsigned int *)v10 + 71), *((unsigned int *)v10 + 72), *((unsigned int *)v10 + 73), 0, &v102[1], 0);
    v80 = objc_claimAutoreleasedReturnValue();
    v81 = (void *)*((_QWORD *)v10 + 45);
    *((_QWORD *)v10 + 45) = v80;

    makeMPSTensorDataWithData(v99, *((unsigned int *)v10 + 75), *((unsigned int *)v10 + 76), *((unsigned int *)v10 + 77), 0, v102, 0);
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = (void *)*((_QWORD *)v10 + 46);
    *((_QWORD *)v10 + 46) = v82;

    v84 = (int *)operator new();
    BRNet_v3_Filter::BRNet_v3_Filter(v84, v101, v96, v90, v89, *((_DWORD *)v10 + 14), *((_DWORD *)v10 + 16), (uint64_t)(v10 + 256), v102[1], v102[0], v10[147], v10[148], 1, v10[149]);
    *((_QWORD *)v10 + 44) = v84;
    v85 = (void *)objc_msgSend(*v11, "newSharedEvent");
    v86 = (void *)objc_msgSend(*v11, "newSharedEvent");
    MPSGraphMPSGraphExecutableWrapper::prewarm((uint64_t)(v10 + 216), *((void **)v10 + 47), *((void **)v10 + 45), *((void **)v10 + 46), v10[147], (uint64_t)v10, v85, v86, 0, 1);
    if ((objc_msgSend(v9, "requiresSynchronousInitialization") & 1) != 0)
      goto LABEL_64;
    if (v97)
    {
      if (v91)
        v87 = 1;
      else
        v87 = v92 == 0;
      if (!v87 || !*((_QWORD *)v10 + 99))
        goto LABEL_64;
    }
    else if (v92 && !v91)
    {
LABEL_64:
      if (!v10[344])
        dispatch_group_wait(*((dispatch_group_t *)v10 + 42), 0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_77;
    }
    MPSGraphMPSGraphExecutableWrapper::run((uint64_t)(v10 + 216), *((void **)v10 + 47), *((void **)v10 + 45), *((void **)v10 + 46), 1, v10[147], 0, 0, 0, 0);
LABEL_77:
    objc_msgSend(v10, "_emitTelemetry:forDevice:", v9, *v11);
    v64 = v10;

    goto LABEL_78;
  }
  MTLReportFailure();
  v64 = 0;
LABEL_78:

  return v64;
}

- (void)dealloc
{
  BRNet_v3_Filter *filter;
  objc_super v4;

  filter = self->_filter;
  if (filter)
  {
    BRNet_v3_Filter::~BRNet_v3_Filter(filter);
    MEMORY[0x23493FFC8]();
  }
  self->_filter = 0;
  v4.receiver = self;
  v4.super_class = (Class)_MFXTemporalScalingEffectV3;
  -[_MFXTemporalScalingEffectV3 dealloc](&v4, sel_dealloc);
}

- (void)encodeToCommandQueue:(id)a3
{
  id v4;

  objc_msgSend(a3, "commandBuffer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_MFXTemporalScalingEffectV3 encodeToCommandBuffer:](self, "encodeToCommandBuffer:");
  objc_msgSend(v4, "commit");

}

- (void)encodeToCommandBuffer:(id)a3
{
  unint64_t inputContentWidth;
  unint64_t inputContentHeight;
  float inputContentMinScale;
  float inputContentMaxScale;
  float outputWidth;
  float outputHeight;
  float v10;
  float v11;
  unint64_t encodeID;
  unint64_t inputEventValue;
  float preExposure;
  float32x2_t v15;
  MTLTexture *v16;
  MTLTexture *v17;
  uint64_t v18;
  void *v19;
  float32x2_t v25;
  double v26;
  uint64_t v27;
  id v28;
  MTLTexture *v29;
  MTLTexture *v30;
  MTLTexture *v31;
  MTLTexture *v32;
  MTLTexture *v33;
  MTLTexture *v34;
  double v35;
  double v36;
  BOOL reset;
  uint64x2_t v38;
  MTLTexture *v39;
  MTLTexture *v40;
  MTLTexture *v41;
  MTLTexture *v42;
  id v43;
  unint64_t v44;
  uint64_t v45;
  _BOOL4 reversedDepth;
  double v47;
  unsigned int v48;
  _QWORD v49[5];
  id v50;
  MTLTexture *v51;
  MTLTexture *v52;
  MTLTexture *v53;
  MTLTexture *v54;
  MTLTexture *v55;
  MTLTexture *v56;
  _QWORD *v57;
  _QWORD *v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  float32x2_t v62;
  float32x2_t v63;
  double v64;
  uint64_t v65;
  unint64_t v66;
  float v67;
  __int16 v68;
  __int16 v69;
  BOOL v70;
  BOOL v71;
  _QWORD v72[4];
  _QWORD v73[5];

  v43 = a3;
  -[_MTLFXEffect _beginEncode](self, "_beginEncode");
  if ((MTLReportFailureTypeEnabled() & 1) != 0)
  {
    checkInputOutputTextures(self->_colorTexture, self->_depthTexture, self->_motionTexture, self->_outputTexture, self->_inputWidth, self->_inputHeight, self->_colorTextureFormat, self->_inputContentWidth, self->_inputContentHeight, self->_outputWidth, self->_outputHeight, self->_outputTextureFormat);
    inputContentWidth = self->_inputContentWidth;
    inputContentHeight = self->_inputContentHeight;
    inputContentMinScale = self->_inputContentMinScale;
    inputContentMaxScale = self->_inputContentMaxScale;
    outputWidth = (float)self->_outputWidth;
    outputHeight = (float)self->_outputHeight;
    v10 = fminf(outputWidth / (float)inputContentWidth, outputHeight / (float)inputContentHeight);
    if (v10 < inputContentMinScale)
    {
      v35 = v10;
      v36 = inputContentMinScale;
      MTLReportFailure();
    }
    v11 = fmaxf(outputWidth / (float)(inputContentWidth + 1), outputHeight / (float)(inputContentHeight + 1));
    if (v11 > inputContentMaxScale)
    {
      v35 = v11;
      v36 = inputContentMaxScale;
      MTLReportFailure();
    }
    if (-[MTLTexture storageMode](self->_outputTexture, "storageMode", *(_QWORD *)&v35, *(_QWORD *)&v36) != 2)
      MTLReportFailure();
  }
  encodeID = self->super.super._encodeID;
  ++self->_inputEventValue;
  v44 = self->_outputEventValue + 1;
  self->_outputEventValue = v44;
  inputEventValue = self->_inputEventValue;
  v47 = *(double *)&self->_jitterOffset[4];
  reset = self->_reset;
  reversedDepth = self->_reversedDepth;
  preExposure = self->_preExposure;
  v15 = *(float32x2_t *)&self->_motionVectorScale[4];
  v38 = *(uint64x2_t *)&self->_inputContentWidth;
  v16 = self->_colorTexture;
  v17 = self->_depthTexture;
  v42 = self->_motionTexture;
  v41 = self->_outputTexture;
  v40 = self->_exposureTexture;
  v39 = self->_reactiveMaskTexture;
  LOWORD(v18) = self->_inputContentWidth;
  WORD2(v18) = self->_inputContentHeight;
  v45 = v18;
  objc_msgSend(v43, "encodeSignalEvent:value:", self->_inputEvent, self->_inputEventValue);
  objc_msgSend(v43, "encodeWaitForEvent:value:", self->_midProcessingStartEvent, 2 * inputEventValue);
  objc_msgSend(v43, "computeCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLabel:", CFSTR("MetalFX_TemporalV3_MidProcessing"));
  -[_MTLFXEffect _didCreateComputeCommandEncoder:forEncode:](self, "_didCreateComputeCommandEncoder:forEncode:", v19, encodeID);
  __asm { FMOV            V1.2S, #1.0 }
  v25 = vdiv_f32(_D1, vcvt_f32_f64(vcvtq_f64_u64(v38)));
  LODWORD(v26) = HIDWORD(v47);
  HIWORD(v48) = WORD2(v45);
  LOWORD(v48) = v45;
  BRNet_v3_Filter::encodeMid(&self->_filter->var0, v43, v19, self->_history, v17, reversedDepth, v48, v15, v25, *(float *)&v47, v26, v47);
  objc_msgSend(v19, "endEncoding");
  objc_msgSend(v43, "encodeSignalEvent:value:", self->_midProcessingDoneEvent, v44);

  objc_msgSend(v43, "encodeWaitForEvent:value:", self->_outputEvent, self->_outputEventValue);
  v27 = (2 * inputEventValue) | 1;
  v28 = v43;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  v73[3] = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  v72[3] = 0;
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke;
  v49[3] = &unk_2505A05A0;
  v49[4] = self;
  v50 = v28;
  v59 = inputEventValue;
  v60 = 2 * inputEventValue;
  v61 = encodeID;
  v29 = v16;
  v51 = v29;
  v30 = v17;
  v52 = v30;
  v31 = v42;
  v53 = v31;
  v32 = v40;
  v62 = v15;
  v63 = v25;
  v64 = v47;
  v70 = reset;
  v71 = reversedDepth;
  v67 = preExposure;
  v69 = WORD2(v45);
  v68 = v45;
  v54 = v32;
  v57 = v73;
  v65 = v27;
  v66 = v44;
  v33 = v41;
  v55 = v33;
  v34 = v39;
  v56 = v34;
  v58 = v72;
  objc_msgSend(v28, "addSynchronizationNotification:", v49);
  self->_reset = 0;

  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v73, 8);

}

- (unint64_t)inputWidth
{
  return self->_inputWidth;
}

- (unint64_t)inputHeight
{
  return self->_inputHeight;
}

- (unint64_t)outputWidth
{
  return self->_outputWidth;
}

- (unint64_t)outputHeight
{
  return self->_outputHeight;
}

- (unint64_t)colorTextureFormat
{
  return self->_colorTextureFormat;
}

- (unint64_t)depthTextureFormat
{
  return self->_depthTextureFormat;
}

- (unint64_t)motionTextureFormat
{
  return self->_motionTextureFormat;
}

- (unint64_t)outputTextureFormat
{
  return self->_outputTextureFormat;
}

- (float)inputContentMinScale
{
  return self->_inputContentMinScale;
}

- (float)inputContentMaxScale
{
  return self->_inputContentMaxScale;
}

- (float)preExposure
{
  return self->_preExposure;
}

- (void)setPreExposure:(float)a3
{
  self->_preExposure = a3;
}

- (CGPoint)previousJitterOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousJitterOffset.x;
  y = self->_previousJitterOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousJitterOffset:(CGPoint)a3
{
  self->_previousJitterOffset = a3;
}

- (BOOL)reset
{
  return self->_reset;
}

- (void)setReset:(BOOL)a3
{
  self->_reset = a3;
}

- (BOOL)isDepthReversed
{
  return self->_reversedDepth;
}

- (void)setDepthReversed:(BOOL)a3
{
  self->_reversedDepth = a3;
}

- (MTLTexture)colorTexture
{
  return self->_colorTexture;
}

- (void)setColorTexture:(id)a3
{
  objc_storeStrong((id *)&self->_colorTexture, a3);
}

- (MTLTexture)depthTexture
{
  return self->_depthTexture;
}

- (void)setDepthTexture:(id)a3
{
  objc_storeStrong((id *)&self->_depthTexture, a3);
}

- (MTLTexture)motionTexture
{
  return self->_motionTexture;
}

- (void)setMotionTexture:(id)a3
{
  objc_storeStrong((id *)&self->_motionTexture, a3);
}

- (MTLTexture)outputTexture
{
  return self->_outputTexture;
}

- (void)setOutputTexture:(id)a3
{
  objc_storeStrong((id *)&self->_outputTexture, a3);
}

- (MTLTexture)debugTexture
{
  return self->_debugTexture;
}

- (void)setDebugTexture:(id)a3
{
  objc_storeStrong((id *)&self->_debugTexture, a3);
}

- (MTLTexture)exposureTexture
{
  return self->_exposureTexture;
}

- (void)setExposureTexture:(id)a3
{
  objc_storeStrong((id *)&self->_exposureTexture, a3);
}

- (MTLTexture)reactiveMaskTexture
{
  return self->_reactiveMaskTexture;
}

- (void)setReactiveMaskTexture:(id)a3
{
  objc_storeStrong((id *)&self->_reactiveMaskTexture, a3);
}

- (__n128)currentWorldToViewMatrix
{
  return a1[29];
}

- (__n128)setCurrentWorldToViewMatrix:(__n128)a3
{
  result[29] = a2;
  result[30] = a3;
  result[31] = a4;
  result[32] = a5;
  return result;
}

- (__n128)currentViewToClipMatrix
{
  return a1[33];
}

- (__n128)setCurrentViewToClipMatrix:(__n128)a3
{
  result[33] = a2;
  result[34] = a3;
  result[35] = a4;
  result[36] = a5;
  return result;
}

- (__n128)previousWorldToViewMatrix
{
  return a1[37];
}

- (__n128)setPreviousWorldToViewMatrix:(__n128)a3
{
  result[37] = a2;
  result[38] = a3;
  result[39] = a4;
  result[40] = a5;
  return result;
}

- (__n128)previousViewToClipMatrix
{
  return a1[41];
}

- (__n128)setPreviousViewToClipMatrix:(__n128)a3
{
  result[41] = a2;
  result[42] = a3;
  result[43] = a4;
  result[44] = a5;
  return result;
}

- (unint64_t)inputContentWidth
{
  return self->_inputContentWidth;
}

- (void)setInputContentWidth:(unint64_t)a3
{
  self->_inputContentWidth = a3;
}

- (unint64_t)inputContentHeight
{
  return self->_inputContentHeight;
}

- (void)setInputContentHeight:(unint64_t)a3
{
  self->_inputContentHeight = a3;
}

- (unint64_t)colorTextureUsage
{
  return self->_colorTextureUsage;
}

- (unint64_t)depthTextureUsage
{
  return self->_depthTextureUsage;
}

- (unint64_t)motionTextureUsage
{
  return self->_motionTextureUsage;
}

- (unint64_t)reactiveTextureUsage
{
  return self->_reactiveTextureUsage;
}

- (unint64_t)outputTextureUsage
{
  return self->_outputTextureUsage;
}

- (MTLFence)fence
{
  return self->_fence;
}

- (void)setFence:(id)a3
{
  objc_storeStrong((id *)&self->_fence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reactiveMaskTexture, 0);
  objc_storeStrong((id *)&self->_debugTexture, 0);
  objc_storeStrong((id *)&self->_hudProperties, 0);
  objc_storeStrong((id *)&self->_fence, 0);
  objc_storeStrong((id *)&self->_asyncQueue, 0);
  objc_storeStrong((id *)&self->_frameSharedEvent, 0);
  objc_storeStrong((id *)&self->_framePowerOnSharedEvent, 0);
  objc_storeStrong((id *)&self->_midProcessingDoneEvent, 0);
  objc_storeStrong((id *)&self->_midProcessingStartEvent, 0);
  objc_storeStrong((id *)&self->_outputEvent, 0);
  objc_storeStrong((id *)&self->_inputEvent, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_output_TensorData, 0);
  objc_storeStrong((id *)&self->_input_TensorData, 0);
  MPSGraphMPSGraphExecutableWrapper::~MPSGraphMPSGraphExecutableWrapper(&self->_net_wrapper);
  objc_storeStrong((id *)&self->_prevReactiveTexture, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_exposureTexture, 0);
  objc_storeStrong((id *)&self->_outputTexture, 0);
  objc_storeStrong((id *)&self->_reactiveTexture, 0);
  objc_storeStrong((id *)&self->_motionTexture, 0);
  objc_storeStrong((id *)&self->_depthTexture, 0);
  objc_storeStrong((id *)&self->_colorTexture, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 42) = 0;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *((_QWORD *)self + 31) = 0;
  return self;
}

@end
