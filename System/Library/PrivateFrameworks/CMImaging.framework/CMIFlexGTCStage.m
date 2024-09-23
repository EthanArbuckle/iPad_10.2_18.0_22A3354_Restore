@implementation CMIFlexGTCStage

- (CMIFlexGTCStage)initWithOptionalCommandQueue:(id)a3
{
  id v4;
  CMIFlexGTCStage *v5;
  FigMetalContext *v6;
  void *v7;
  uint64_t v8;
  FigMetalContext *metal;
  CMIFlexGTCStage *v10;
  int v11;
  CMIFlexGTCStage *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CMIFlexGTCStage;
  v5 = -[CMIFlexGTCStage init](&v14, sel_init);
  if (!v5)
    goto LABEL_6;
  v6 = [FigMetalContext alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v6, "initWithbundle:andOptionalCommandQueue:", v7, v4);
  metal = v5->_metal;
  v5->_metal = (FigMetalContext *)v8;

  v10 = v5;
  if (v5->_metal)
  {
    v11 = -[CMIFlexGTCStage _compileShaders](v5, "_compileShaders");
    v10 = v5;
    if (v11)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
LABEL_6:
      v10 = 0;
    }
  }
  v12 = v10;

  return v12;
}

- (int)_compileShaders
{
  MTLComputePipelineState *v3;
  MTLComputePipelineState *FlexGTCDownsampleRGBA8_to_LA;
  MTLComputePipelineState *v5;
  MTLComputePipelineState *FlexGTCDownsampleGM8_to_NLGM;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *FlexGTCDownsampleGM10_to_NLGM;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *FlexGTCConvertSDRLA_NLGM_to_HDRLA;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *FlexGTCHistogramLumaAndGain;

  -[FigMetalContext computePipelineStateFor:constants:](self->_metal, "computePipelineStateFor:constants:", CFSTR("FlexGTCDownsampleRGBA8_to_LA"), 0);
  v3 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  FlexGTCDownsampleRGBA8_to_LA = self->_FlexGTCDownsampleRGBA8_to_LA;
  self->_FlexGTCDownsampleRGBA8_to_LA = v3;

  if (self->_FlexGTCDownsampleRGBA8_to_LA)
  {
    -[FigMetalContext computePipelineStateFor:constants:](self->_metal, "computePipelineStateFor:constants:", CFSTR("FlexGTCDownsampleGM8_to_NLGM"), 0);
    v5 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    FlexGTCDownsampleGM8_to_NLGM = self->_FlexGTCDownsampleGM8_to_NLGM;
    self->_FlexGTCDownsampleGM8_to_NLGM = v5;

    if (self->_FlexGTCDownsampleGM8_to_NLGM)
    {
      -[FigMetalContext computePipelineStateFor:constants:](self->_metal, "computePipelineStateFor:constants:", CFSTR("FlexGTCDownsampleGM10_to_NLGM"), 0);
      v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      FlexGTCDownsampleGM10_to_NLGM = self->_FlexGTCDownsampleGM10_to_NLGM;
      self->_FlexGTCDownsampleGM10_to_NLGM = v7;

      if (self->_FlexGTCDownsampleGM10_to_NLGM)
      {
        -[FigMetalContext computePipelineStateFor:constants:](self->_metal, "computePipelineStateFor:constants:", CFSTR("FlexGTCConvertSDRLA_NLGM_to_HDRLA"), 0);
        v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        FlexGTCConvertSDRLA_NLGM_to_HDRLA = self->_FlexGTCConvertSDRLA_NLGM_to_HDRLA;
        self->_FlexGTCConvertSDRLA_NLGM_to_HDRLA = v9;

        if (self->_FlexGTCConvertSDRLA_NLGM_to_HDRLA)
        {
          -[FigMetalContext computePipelineStateFor:constants:](self->_metal, "computePipelineStateFor:constants:", CFSTR("FlexGTCHistogramLumaAndGain"), 0);
          v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
          FlexGTCHistogramLumaAndGain = self->_FlexGTCHistogramLumaAndGain;
          self->_FlexGTCHistogramLumaAndGain = v11;

          if (self->_FlexGTCHistogramLumaAndGain)
            return 0;
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)computeFlexGTCWithSDRImage:(__CVBuffer *)a3 gainMap:(__CVBuffer *)a4 gainMapMetadata:(id)a5 config:(id *)a6 cropRect:(CGRect)a7 gainMapCropRect:(CGRect)a8
{
  uint64_t v8;
  uint64_t v9;
  __CVBuffer *v10;
  __CVBuffer *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __CVBuffer *v24;
  __CVBuffer *v25;
  id *v26;
  id v27;
  id v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  size_t Width;
  void *v44;
  IOSurfaceRef IOSurface;
  void *v46;
  void *v47;
  size_t v48;
  void *v49;
  void *v50;
  unint64_t v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  int v62;
  int v63;
  int v64;
  float v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  id v87;
  _BYTE *v88;
  uint64_t v89;
  __int128 v90;
  float32x4_t v91;
  float32x4_t v92;
  int32x4_t v93;
  _BYTE *v94;
  uint64_t v95;
  int32x4_t v96;
  int32x4_t v97;
  uint64_t v98;
  int v99;
  int v100;
  int32x4_t v101;
  float32x4_t v102;
  uint64_t v103;
  float32x4_t v104;
  float v105;
  int32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  void *v109;
  double v110;
  int v111;
  _DWORD *v112;
  void *v113;
  double v114;
  void *v115;
  double v116;
  void *v117;
  void *v118;
  _BYTE *v119;
  uint64_t v120;
  __int128 v121;
  float32x4_t v122;
  float32x4_t v123;
  int32x4_t v124;
  _BYTE *v125;
  uint64_t v126;
  int32x4_t v127;
  int32x4_t v128;
  uint64_t v129;
  int v130;
  int v131;
  int32x4_t v132;
  float32x4_t v133;
  uint64_t v134;
  float32x4_t v135;
  float v136;
  int32x4_t v137;
  float32x4_t v138;
  float32x4_t v139;
  double v140;
  int v141;
  _DWORD *v142;
  void *v143;
  double v144;
  void *v145;
  double v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  id v167;
  uint64_t v168;
  void *v169;
  void *v170;
  id v171;
  id v172;
  int v173;
  void *v174;
  void *v175;
  _QWORD v176[3];
  _QWORD v177[3];
  _QWORD v178[3];
  _QWORD v179[3];
  _QWORD v180[3];
  _QWORD v181[3];
  _QWORD v182[3];
  _QWORD v183[3];
  _QWORD v184[3];
  _QWORD v185[3];
  int v186;
  _BYTE __dst[4096];
  uint64_t v188;
  uint64_t v189;
  id v190;
  id v191;
  id v192;
  _QWORD v193[3];
  _QWORD v194[3];
  _QWORD v195[3];
  _QWORD v196[3];
  _DWORD v197[2];
  _DWORD v198[2];
  _BYTE v199[4480];
  _QWORD v200[115];

  v8 = MEMORY[0x1E0C80A78](self, a2, a3, a4, a5, a6, (__n128)a7.origin, *(__n128 *)&a7.origin.y, (__n128)a7.size, *(__n128 *)&a7.size.height, (__n128)a8.origin, *(__n128 *)&a8.origin.y, (__n128)a8.size, *(__n128 *)&a8.size.height);
  v168 = v9;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = (id *)v8;
  v200[112] = *MEMORY[0x1E0C80C00];
  v28 = v27;
  v29 = 0;
  v30 = 0;
  memset(__dst, 0, 512);
  v192 = 0;
  v191 = 0;
  v190 = 0;
  v189 = 0;
  v188 = 0;
  v186 = 0;
  v174 = v28;
  if (!v25 || !v11 || !v28)
  {
    v31 = 0;
    v175 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    goto LABEL_45;
  }
  v31 = 0;
  v175 = 0;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v40 = 0;
  v41 = 0;
  if (v168)
  {
    v42 = (void *)MEMORY[0x1E0CC6BB0];
    Width = CVPixelBufferGetWidth(v25);
    objc_msgSend(v42, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 500, Width, CVPixelBufferGetHeight(v25), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setUsage:", 1);
    IOSurface = CVPixelBufferGetIOSurface(v25);
    objc_msgSend(v26[1], "device");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v46, "newTextureWithDescriptor:iosurface:plane:", v44, IOSurface, 0);

    if (!v35)
    {
      v31 = 0;
      v175 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v36 = 0;
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v41 = 0;
      v29 = 0;
      v40 = v44;
      v30 = 0;
      goto LABEL_45;
    }
    v47 = (void *)MEMORY[0x1E0CC6BB0];
    v48 = CVPixelBufferGetWidth(v11);
    objc_msgSend(v47, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, v48, CVPixelBufferGetHeight(v11), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v49, "setUsage:", 1);
    objc_msgSend(v26[1], "device");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v50, "newTextureWithDescriptor:iosurface:plane:", v49, CVPixelBufferGetIOSurface(v11), 0);

    if (v38)
    {
      if (v26[2] && v26[3] && v26[5] && v26[6])
      {
        v165 = v38;
        v51 = (unint64_t)((int)rint(v19) + 7) >> 3;
        v52 = (unint64_t)((int)rint(v17) + 7) >> 3;
        objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, v51, v52, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "setUsage:", 3);
        objc_msgSend(v26[1], "device");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v53, "newTextureWithDescriptor:", v40);
        v192 = v30;

        if (v30)
        {
          objc_msgSend(v26[1], "device");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = (void *)objc_msgSend(v54, "newTextureWithDescriptor:", v40);
          v191 = v55;

          if (v55)
          {
            objc_msgSend(v26[1], "device");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = (void *)objc_msgSend(v56, "newTextureWithDescriptor:", v40);
            v190 = v57;

            if (v57)
            {
              v164 = v35;
              v189 = 0;
              v188 = 0;
              objc_msgSend(v174, "objectForKeyedSubscript:", *MEMORY[0x1E0D05ED8]);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v58;
              if (v58)
              {
                objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x1E0D05EE0]);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (v35)
                {
                  objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0D05ED0]);
                  v59 = objc_claimAutoreleasedReturnValue();
                  if (v59)
                  {
                    v162 = (void *)v59;
                    v163 = v35;
                    objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0D05EC8]);
                    v161 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v161)
                    {
                      v159 = v36;
                      objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0D05EA8]);
                      v60 = objc_claimAutoreleasedReturnValue();
                      if (v60)
                      {
                        v61 = (void *)v60;
                        objc_msgSend(v35, "floatValue");
                        LODWORD(v188) = v62;
                        objc_msgSend(v162, "floatValue");
                        HIDWORD(v188) = v63;
                        objc_msgSend(v161, "floatValue");
                        LODWORD(v189) = v64;
                        v158 = v61;
                        objc_msgSend(v61, "floatValue");
                        HIDWORD(v189) = exp2f(v65);
                        objc_msgSend(v26[1], "device");
                        v66 = (void *)objc_claimAutoreleasedReturnValue();
                        v67 = objc_msgSend(v66, "newBufferWithBytes:length:options:", &v188, 16, 0);

                        if (v67)
                        {
                          bzero(__dst, 0x1000uLL);
                          objc_msgSend(v26[1], "device");
                          v68 = (void *)objc_claimAutoreleasedReturnValue();
                          v69 = objc_msgSend(v68, "newBufferWithBytes:length:options:", __dst, 4096, 0);

                          objc_msgSend(v26[1], "device");
                          v70 = (void *)objc_claimAutoreleasedReturnValue();
                          v171 = (id)objc_msgSend(v70, "newBufferWithBytes:length:options:", __dst, 4096, 0);

                          objc_msgSend(v26[1], "commandQueue");
                          v71 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v71, "commandBuffer");
                          v72 = objc_claimAutoreleasedReturnValue();
                          v73 = v26[7];
                          v26[7] = (id)v72;

                          v74 = v26[7];
                          if (v74)
                          {
                            v160 = v67;
                            objc_msgSend(v74, "setLabel:", CFSTR("_FlexGTC"));
                            objc_msgSend(v26[7], "computeCommandEncoder");
                            v75 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v75)
                            {
                              v157 = v40;
                              v198[0] = (int)rint(v23);
                              v198[1] = (int)rint(v21);
                              v197[0] = (int)rint(v15);
                              v197[1] = (int)rint(v13);
                              v166 = (void *)v69;
                              v76 = v75;
                              objc_msgSend(v75, "setComputePipelineState:", v26[2]);
                              objc_msgSend(v76, "setTexture:atIndex:", v164, 0);
                              objc_msgSend(v76, "setTexture:atIndex:", v30, 1);
                              objc_msgSend(v76, "setBytes:length:atIndex:", v198, 8, 0);
                              v77 = objc_msgSend(v26[2], "threadExecutionWidth");
                              v78 = objc_msgSend(v26[2], "maxTotalThreadsPerThreadgroup");
                              v185[0] = v51;
                              v185[1] = v52;
                              v185[2] = 1;
                              v184[0] = v77;
                              v184[1] = v78 / v77;
                              v184[2] = 1;
                              objc_msgSend(v76, "dispatchThreads:threadsPerThreadgroup:", v185, v184);
                              objc_msgSend(v76, "setComputePipelineState:", v26[3]);
                              objc_msgSend(v76, "setTexture:atIndex:", v165, 0);
                              objc_msgSend(v76, "setTexture:atIndex:", v57, 1);
                              objc_msgSend(v76, "setBuffer:offset:atIndex:", v160, 0, 0);
                              objc_msgSend(v76, "setBytes:length:atIndex:", v197, 8, 1);
                              v79 = objc_msgSend(v26[3], "threadExecutionWidth");
                              v80 = objc_msgSend(v26[3], "maxTotalThreadsPerThreadgroup");
                              v183[0] = v51;
                              v183[1] = v52;
                              v183[2] = 1;
                              v182[0] = v79;
                              v182[1] = v80 / v79;
                              v182[2] = 1;
                              objc_msgSend(v76, "dispatchThreads:threadsPerThreadgroup:", v183, v182);
                              objc_msgSend(v76, "setComputePipelineState:", v26[5]);
                              objc_msgSend(v76, "setTexture:atIndex:", v30, 0);
                              objc_msgSend(v76, "setTexture:atIndex:", v57, 1);
                              objc_msgSend(v76, "setTexture:atIndex:", v55, 2);
                              objc_msgSend(v76, "setBuffer:offset:atIndex:", v160, 0, 0);
                              v81 = objc_msgSend(v26[5], "threadExecutionWidth");
                              v82 = objc_msgSend(v26[5], "maxTotalThreadsPerThreadgroup");
                              v181[0] = v51;
                              v181[1] = v52;
                              v181[2] = 1;
                              v180[0] = v81;
                              v180[1] = v82 / v81;
                              v180[2] = 1;
                              objc_msgSend(v76, "dispatchThreads:threadsPerThreadgroup:", v181, v180);
                              objc_msgSend(v76, "setComputePipelineState:", v26[6]);
                              objc_msgSend(v76, "setTexture:atIndex:", v30, 0);
                              objc_msgSend(v76, "setTexture:atIndex:", v57, 1);
                              objc_msgSend(v76, "setBuffer:offset:atIndex:", v166, 0, 0);
                              v83 = objc_msgSend(v26[6], "threadExecutionWidth");
                              v84 = objc_msgSend(v26[6], "maxTotalThreadsPerThreadgroup");
                              v179[0] = v51;
                              v179[1] = v52;
                              v179[2] = 1;
                              v178[0] = v83;
                              v178[1] = v84 / v83;
                              v178[2] = 1;
                              objc_msgSend(v76, "dispatchThreads:threadsPerThreadgroup:", v179, v178);
                              objc_msgSend(v76, "setComputePipelineState:", v26[6]);
                              objc_msgSend(v76, "setTexture:atIndex:", v191, 0);
                              objc_msgSend(v76, "setTexture:atIndex:", v190, 1);
                              objc_msgSend(v76, "setBuffer:offset:atIndex:", v171, 0, 0);
                              v85 = objc_msgSend(v26[6], "threadExecutionWidth");
                              v86 = objc_msgSend(v26[6], "maxTotalThreadsPerThreadgroup");
                              v177[0] = v51;
                              v177[1] = v52;
                              v177[2] = 1;
                              v176[0] = v85;
                              v176[1] = v86 / v85;
                              v176[2] = 1;
                              objc_msgSend(v76, "dispatchThreads:threadsPerThreadgroup:", v177, v176);
                              v169 = v76;
                              objc_msgSend(v76, "endEncoding");
                              objc_msgSend(v26[7], "commit");
                              objc_msgSend(v26[7], "waitUntilCompleted");
                              v87 = objc_retainAutorelease(v166);
                              memmove(__dst, (const void *)objc_msgSend(v87, "contents"), 0x1000uLL);
                              v88 = v199;
                              bzero(v199, 0x1180uLL);
                              v89 = 0;
                              v90 = xmmword_1D33053A0;
                              v91.i64[0] = 0x3F0000003F000000;
                              v91.i64[1] = 0x3F0000003F000000;
                              v92.i64[0] = 0x3D0000003D000000;
                              v92.i64[1] = 0x3D0000003D000000;
                              v93.i64[0] = 0x400000004;
                              v93.i64[1] = 0x400000004;
                              v94 = __dst;
                              do
                              {
                                v95 = 0;
                                v96 = 0uLL;
                                do
                                {
                                  v97 = *(int32x4_t *)&v94[v95];
                                  v96 = vaddq_s32(v97, v96);
                                  v95 += 16;
                                }
                                while (v95 != 128);
                                v98 = 0;
                                v99 = vaddvq_s32(v96);
                                *(_DWORD *)v88 = v99;
                                v100 = v99;
                                v97.i32[0] = 0;
                                v101 = (int32x4_t)v90;
                                do
                                {
                                  v102 = vmulq_f32(vmulq_f32(vaddq_f32(vcvtq_f32_s32(v101), v91), v92), vcvtq_f32_u32(*(uint32x4_t *)&v94[v98]));
                                  *(float *)v97.i32 = (float)((float)((float)(*(float *)v97.i32 + v102.f32[0])
                                                                    + v102.f32[1])
                                                            + v102.f32[2])
                                                    + v102.f32[3];
                                  v101 = vaddq_s32(v101, v93);
                                  v98 += 16;
                                }
                                while (v98 != 128);
                                v103 = 0;
                                *(float *)v97.i32 = *(float *)v97.i32 / (float)v100;
                                *((_DWORD *)v88 + 1) = v97.i32[0];
                                v104 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v97.i8, 0);
                                v105 = 0.0;
                                v106 = (int32x4_t)v90;
                                do
                                {
                                  v107 = vsubq_f32(vmulq_f32(vaddq_f32(vcvtq_f32_s32(v106), v91), v92), v104);
                                  v108 = vmulq_f32(vmulq_f32(v107, vcvtq_f32_u32(*(uint32x4_t *)&v94[v103])), v107);
                                  v105 = (float)((float)((float)(v105 + v108.f32[0]) + v108.f32[1]) + v108.f32[2])
                                       + v108.f32[3];
                                  v106 = vaddq_s32(v106, v93);
                                  v103 += 16;
                                }
                                while (v103 != 128);
                                *((float *)v88 + 2) = sqrtf(v105 / (float)v100);
                                memmove(v88 + 12, &__dst[128 * v89], 0x80uLL);
                                v93.i64[0] = 0x400000004;
                                v93.i64[1] = 0x400000004;
                                v92.i64[0] = 0x3D0000003D000000;
                                v92.i64[1] = 0x3D0000003D000000;
                                v91.i64[0] = 0x3F0000003F000000;
                                v91.i64[1] = 0x3F0000003F000000;
                                ++v89;
                                v88 += 140;
                                v94 += 128;
                                v90 = xmmword_1D33053A0;
                              }
                              while (v89 != 32);
                              v167 = v87;
                              fillGaps((uint64_t)v199, *(unsigned __int8 *)(v168 + 8), *(float *)(v168 + 4));
                              curveFit((uint64_t)v199, *(unsigned __int8 *)(v168 + 8), (uint64_t)v200, &v186, *(float *)(v168 + 4), *(float *)v168);
                              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                              v109 = (void *)objc_claimAutoreleasedReturnValue();
                              v111 = v186;
                              if (v186 >= 1)
                              {
                                v112 = v200;
                                do
                                {
                                  v195[0] = CFSTR("X");
                                  LODWORD(v110) = *v112;
                                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v110);
                                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                                  v196[0] = v113;
                                  v195[1] = CFSTR("Y");
                                  LODWORD(v114) = v112[1];
                                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v114);
                                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                                  v196[1] = v115;
                                  v195[2] = CFSTR("Slope");
                                  LODWORD(v116) = v112[2];
                                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v116);
                                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                                  v196[2] = v117;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v196, v195, 3);
                                  v118 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v109, "addObject:", v118);

                                  v112 += 7;
                                  --v111;
                                }
                                while (v111);
                              }
                              objc_msgSend(v174, "setObject:forKeyedSubscript:", v109, *MEMORY[0x1E0D05F68]);
                              v172 = objc_retainAutorelease(v171);
                              memmove(__dst, (const void *)objc_msgSend(v172, "contents"), 0x1000uLL);
                              v119 = v199;
                              bzero(v199, 0x1180uLL);
                              v120 = 0;
                              v121 = xmmword_1D33053A0;
                              v122.i64[0] = 0x3F0000003F000000;
                              v122.i64[1] = 0x3F0000003F000000;
                              v123.i64[0] = 0x3D0000003D000000;
                              v123.i64[1] = 0x3D0000003D000000;
                              v124.i64[0] = 0x400000004;
                              v124.i64[1] = 0x400000004;
                              v125 = __dst;
                              do
                              {
                                v126 = 0;
                                v127 = 0uLL;
                                do
                                {
                                  v128 = *(int32x4_t *)&v125[v126];
                                  v127 = vaddq_s32(v128, v127);
                                  v126 += 16;
                                }
                                while (v126 != 128);
                                v129 = 0;
                                v130 = vaddvq_s32(v127);
                                *(_DWORD *)v119 = v130;
                                v131 = v130;
                                v128.i32[0] = 0;
                                v132 = (int32x4_t)v121;
                                do
                                {
                                  v133 = vmulq_f32(vmulq_f32(vaddq_f32(vcvtq_f32_s32(v132), v122), v123), vcvtq_f32_u32(*(uint32x4_t *)&v125[v129]));
                                  *(float *)v128.i32 = (float)((float)((float)(*(float *)v128.i32 + v133.f32[0])
                                                                     + v133.f32[1])
                                                             + v133.f32[2])
                                                     + v133.f32[3];
                                  v132 = vaddq_s32(v132, v124);
                                  v129 += 16;
                                }
                                while (v129 != 128);
                                v134 = 0;
                                *(float *)v128.i32 = *(float *)v128.i32 / (float)v131;
                                *((_DWORD *)v119 + 1) = v128.i32[0];
                                v135 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v128.i8, 0);
                                v136 = 0.0;
                                v137 = (int32x4_t)v121;
                                do
                                {
                                  v138 = vsubq_f32(vmulq_f32(vaddq_f32(vcvtq_f32_s32(v137), v122), v123), v135);
                                  v139 = vmulq_f32(vmulq_f32(v138, vcvtq_f32_u32(*(uint32x4_t *)&v125[v134])), v138);
                                  v136 = (float)((float)((float)(v136 + v139.f32[0]) + v139.f32[1]) + v139.f32[2])
                                       + v139.f32[3];
                                  v137 = vaddq_s32(v137, v124);
                                  v134 += 16;
                                }
                                while (v134 != 128);
                                *((float *)v119 + 2) = sqrtf(v136 / (float)v131);
                                memmove(v119 + 12, &__dst[128 * v120], 0x80uLL);
                                v124.i64[0] = 0x400000004;
                                v124.i64[1] = 0x400000004;
                                v123.i64[0] = 0x3D0000003D000000;
                                v123.i64[1] = 0x3D0000003D000000;
                                v122.i64[0] = 0x3F0000003F000000;
                                v122.i64[1] = 0x3F0000003F000000;
                                ++v120;
                                v119 += 140;
                                v125 += 128;
                                v121 = xmmword_1D33053A0;
                              }
                              while (v120 != 32);
                              fillGaps((uint64_t)v199, *(unsigned __int8 *)(v168 + 8), *(float *)(v168 + 4));
                              curveFit((uint64_t)v199, *(unsigned __int8 *)(v168 + 8), (uint64_t)v200, &v186, *(float *)(v168 + 4), *(float *)v168);
                              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                              v175 = (void *)objc_claimAutoreleasedReturnValue();

                              v141 = v186;
                              if (v186 >= 1)
                              {
                                v142 = v200;
                                do
                                {
                                  v193[0] = CFSTR("com.apple.ColorSync.FlexGTCNodeX");
                                  LODWORD(v140) = *v142;
                                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v140);
                                  v143 = (void *)objc_claimAutoreleasedReturnValue();
                                  v194[0] = v143;
                                  v193[1] = CFSTR("com.apple.ColorSync.FlexGTCNodeY");
                                  LODWORD(v144) = v142[1];
                                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v144);
                                  v145 = (void *)objc_claimAutoreleasedReturnValue();
                                  v194[1] = v145;
                                  v193[2] = CFSTR("com.apple.ColorSync.FlexGTCNodeSlope");
                                  LODWORD(v146) = v142[2];
                                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v146);
                                  v147 = (void *)objc_claimAutoreleasedReturnValue();
                                  v194[2] = v147;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v194, v193, 3);
                                  v148 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v175, "addObject:", v148);

                                  v142 += 7;
                                  --v141;
                                }
                                while (v141);
                              }
                              objc_msgSend(v174, "setObject:forKeyedSubscript:", v175, *MEMORY[0x1E0D05F60]);
                              FigMetalDecRef(&v192);
                              FigMetalDecRef(&v191);
                              FigMetalDecRef(&v190);
                              v29 = 0;
                              v39 = v164;
                              v38 = v165;
                              v40 = v157;
                              v31 = v158;
                              v30 = v161;
                              v34 = v162;
                              v36 = v159;
                              v37 = (void *)v160;
                              v35 = v163;
                              v32 = v167;
                              v41 = v169;
                              v33 = v172;
                              goto LABEL_45;
                            }
                            v175 = 0;
                            v41 = 0;
                            v29 = 0;
                            v38 = v165;
                            v30 = v161;
                            v34 = v162;
                            v32 = (void *)v69;
                            v31 = v158;
                            v36 = v159;
                            v35 = v163;
                            v37 = (void *)v160;
                          }
                          else
                          {
                            v175 = 0;
                            v41 = 0;
                            v29 = 0;
                            v38 = v165;
                            v30 = v161;
                            v34 = v162;
                            v32 = (void *)v69;
                            v31 = v158;
                            v36 = v159;
                            v37 = (void *)v67;
                            v35 = v163;
                          }
                          v33 = v171;
LABEL_64:
                          v39 = v164;
                          goto LABEL_45;
                        }
                        v175 = 0;
                        v32 = 0;
                        v33 = 0;
                        v37 = 0;
                        v41 = 0;
                        v29 = -1;
                        v38 = v165;
                        v30 = v161;
                        v31 = v158;
                      }
                      else
                      {
                        v31 = 0;
                        v175 = 0;
                        v32 = 0;
                        v33 = 0;
                        v37 = 0;
                        v41 = 0;
                        v29 = -1;
                        v38 = v165;
                        v30 = v161;
                      }
                    }
                    else
                    {
                      v30 = 0;
                      v31 = 0;
                      v175 = 0;
                      v32 = 0;
                      v33 = 0;
                      v37 = 0;
                      v41 = 0;
                      v29 = -1;
                      v38 = v165;
                    }
                    v34 = v162;
                    v35 = v163;
                    goto LABEL_64;
                  }
                }
                v30 = 0;
                v31 = 0;
                v175 = 0;
                v32 = 0;
                v33 = 0;
                v34 = 0;
              }
              else
              {
                v30 = 0;
                v31 = 0;
                v175 = 0;
                v32 = 0;
                v33 = 0;
                v34 = 0;
                v35 = 0;
              }
              v37 = 0;
              v41 = 0;
              v29 = -1;
              v39 = v164;
              v38 = v165;
              goto LABEL_45;
            }
          }
          fig_log_get_emitter();
          FigDebugAssert3();
          v29 = FigSignalErrorAt();
          v30 = 0;
        }
        else
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          v29 = FigSignalErrorAt();
        }
        v31 = 0;
        v175 = 0;
        v32 = 0;
        v33 = 0;
        v34 = 0;
        v39 = v35;
        v35 = 0;
        v36 = 0;
        v37 = 0;
        v41 = 0;
        v38 = v165;
        goto LABEL_45;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      v29 = FigSignalErrorAt();
      v30 = 0;
      v31 = 0;
      v175 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v39 = v35;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v41 = 0;
    }
    else
    {
      v30 = 0;
      v31 = 0;
      v175 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v39 = v35;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v41 = 0;
      v29 = 0;
    }
    v40 = v49;
  }
LABEL_45:
  v170 = v41;
  v173 = v29;
  v149 = v31;
  v150 = v32;
  v151 = v40;
  v152 = v37;
  v153 = (void *)v38;
  v154 = v34;
  v155 = v39;

  return v173;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gainMapMetadataBuffer, 0);
  objc_storeStrong((id *)&self->_extractBuffer, 0);
  objc_storeStrong((id *)&self->_currentCommandBuffer, 0);
  objc_storeStrong((id *)&self->_FlexGTCHistogramLumaAndGain, 0);
  objc_storeStrong((id *)&self->_FlexGTCConvertSDRLA_NLGM_to_HDRLA, 0);
  objc_storeStrong((id *)&self->_FlexGTCDownsampleGM10_to_NLGM, 0);
  objc_storeStrong((id *)&self->_FlexGTCDownsampleGM8_to_NLGM, 0);
  objc_storeStrong((id *)&self->_FlexGTCDownsampleRGBA8_to_LA, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end
