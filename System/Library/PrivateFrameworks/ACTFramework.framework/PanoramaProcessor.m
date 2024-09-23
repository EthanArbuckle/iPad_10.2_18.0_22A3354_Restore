@implementation PanoramaProcessor

+ (void)prewarm
{
  void *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  const char *v8;
  void *inited;
  PanoramaRegistrationStage *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  PanoramaParallaxStage *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  PanoramaStitchingStage *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  PanoramaAssemblyStage *v22;
  const char *v23;
  void *v24;
  ACTPanoGPUDownscaler *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  LKTFlowGPU *v30;
  const char *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v2 = (void *)MEMORY[0x24BDD1488];
  v3 = objc_opt_class();
  objc_msgSend_bundleForClass_(v2, v4, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BE11A10]);
  inited = (void *)objc_msgSend_initWithbundle_andOptionalCommandQueue_(v7, v8, (uint64_t)v6, 0);
  v10 = [PanoramaRegistrationStage alloc];
  v13 = (void *)objc_msgSend_initWithContext_(v10, v11, (uint64_t)inited, v12);
  if (!v13)
  {
    v17 = 0;
    goto LABEL_9;
  }
  v14 = [PanoramaParallaxStage alloc];
  v17 = (void *)objc_msgSend_initWithContext_(v14, v15, (uint64_t)inited, v16);
  if (!v17)
  {
LABEL_9:
    v21 = 0;
    goto LABEL_10;
  }
  v18 = [PanoramaStitchingStage alloc];
  v21 = (void *)objc_msgSend_initWithContext_(v18, v19, (uint64_t)inited, v20);
  if (!v21)
  {
LABEL_10:
    v24 = 0;
    goto LABEL_7;
  }
  v22 = [PanoramaAssemblyStage alloc];
  v32 = xmmword_22764B9E0;
  v34 = 0;
  v35 = 0;
  v33 = 0;
  v36 = 2;
  v24 = (void *)objc_msgSend_initWithContext_robustPanoParams_(v22, v23, (uint64_t)inited, (uint64_t)&v32);
  if (v24)
  {
    v25 = [ACTPanoGPUDownscaler alloc];
    v28 = objc_msgSend_initWithContext_(v25, v26, (uint64_t)inited, v27);
    if (v28)
    {
      v29 = (void *)v28;
      v30 = [LKTFlowGPU alloc];

    }
  }
LABEL_7:

}

- (id)init:(id *)a3
{
  PanoramaProcessor *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  void *inited;
  const char *v16;
  PanoramaProcessor *v17;
  _OWORD v19[3];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PanoramaProcessor;
  v4 = -[PanoramaProcessor init](&v20, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1488];
    v6 = objc_opt_class();
    objc_msgSend_bundleForClass_(v5, v7, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_OWORD *)&a3->var2;
    v19[0] = *(_OWORD *)&a3->var0;
    v19[1] = v10;
    v19[2] = *(_OWORD *)&a3->var6;
    objc_msgSend_setPanoramaParameters_(v4, v11, (uint64_t)v19, v12);
    v13 = objc_alloc(MEMORY[0x24BE11A10]);
    inited = (void *)objc_msgSend_initWithbundle_andOptionalCommandQueue_(v13, v14, (uint64_t)v9, 0);
    if (objc_msgSend__commonInitWithContext_NRFversion_(v4, v16, (uint64_t)inited, a3->var8))
    {
      v17 = 0;
    }
    else
    {
      fig_note_initialize_category_with_default_work();
      v17 = v4;
    }
  }
  else
  {
    v17 = 0;
    v9 = 0;
    inited = 0;
  }

  return v17;
}

- (int)_commonInitWithContext:(id)a3 NRFversion:(int)a4
{
  uint64_t v4;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSDictionary *v15;
  NSDictionary *cameraSetupPlist;
  void *v17;
  const char *v18;
  uint64_t v19;
  PanoramaRegistrationStage *v20;
  const char *v21;
  uint64_t v22;
  PanoramaRegistrationStage *v23;
  PanoramaRegistrationStage *registrationStage;
  PanoramaParallaxStage *v25;
  const char *v26;
  uint64_t v27;
  PanoramaParallaxStage *v28;
  PanoramaParallaxStage *parallaxStage;
  PanoramaStitchingStage *v30;
  const char *v31;
  uint64_t v32;
  PanoramaStitchingStage *v33;
  PanoramaStitchingStage *stitchingStage;
  PanoramaAssemblyStage *v35;
  FigMetalContext *metal;
  __int128 v37;
  const char *v38;
  PanoramaAssemblyStage *v39;
  PanoramaAssemblyStage *assemblyStage;
  const char *v41;
  uint64_t v42;
  ACTPanoGPUDownscaler *v43;
  const char *v44;
  uint64_t v45;
  ACTPanoGPUDownscaler *v46;
  ACTPanoGPUDownscaler *downscaler;
  OS_dispatch_queue *v48;
  OS_dispatch_queue *processingQueue;
  PanoramaGyroStage *v50;
  PanoramaGyroStage *gyroStage;
  OSStatus v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  id v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  NRFProcessor *v69;
  NRFProcessor *nrfProcessor;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  CVReturn v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  const __CFDictionary *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  const __CFDictionary *v95;
  CVReturn v96;
  const char *v97;
  void *v98;
  const char *v99;
  void *v100;
  const __CFDictionary *v101;
  const __CFDictionary *v102;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  void *v107;
  id v108;
  id v109;
  _OWORD v110[3];
  _QWORD v111[4];
  _QWORD v112[4];
  uint64_t v113;
  void *v114;
  _QWORD v115[4];
  _QWORD v116[4];
  uint64_t v117;
  void *v118;
  _QWORD v119[4];
  _QWORD v120[6];

  v4 = *(_QWORD *)&a4;
  v120[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_storeStrong((id *)&self->_metal, a3);
  objc_msgSend_sharedInstance(MEMORY[0x24BE103F0], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cameraParameters(v11, v12, v13, v14);
  v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  cameraSetupPlist = self->_cameraSetupPlist;
  self->_cameraSetupPlist = v15;

  v17 = (void *)objc_opt_new();
  objc_msgSend_setPreviewOutput_(self, v18, (uint64_t)v17, v19);

  v20 = [PanoramaRegistrationStage alloc];
  v23 = (PanoramaRegistrationStage *)objc_msgSend_initWithContext_(v20, v21, (uint64_t)self->_metal, v22);
  registrationStage = self->_registrationStage;
  self->_registrationStage = v23;

  if (!self->_registrationStage)
    goto LABEL_19;
  v25 = [PanoramaParallaxStage alloc];
  v28 = (PanoramaParallaxStage *)objc_msgSend_initWithContext_(v25, v26, (uint64_t)self->_metal, v27);
  parallaxStage = self->_parallaxStage;
  self->_parallaxStage = v28;

  if (!self->_parallaxStage)
    goto LABEL_19;
  v30 = [PanoramaStitchingStage alloc];
  v33 = (PanoramaStitchingStage *)objc_msgSend_initWithContext_(v30, v31, (uint64_t)self->_metal, v32);
  stitchingStage = self->_stitchingStage;
  self->_stitchingStage = v33;

  if (!self->_stitchingStage)
    goto LABEL_19;
  v35 = [PanoramaAssemblyStage alloc];
  metal = self->_metal;
  v37 = *(_OWORD *)&self->_panoramaParams.enableTranslationCorrection;
  v110[0] = *(_OWORD *)&self->_panoramaParams.frameWidth;
  v110[1] = v37;
  v110[2] = *(_OWORD *)&self->_panoramaParams.atlasTranslationShiftHighThreshold;
  v39 = (PanoramaAssemblyStage *)objc_msgSend_initWithContext_robustPanoParams_(v35, v38, (uint64_t)metal, (uint64_t)v110);
  assemblyStage = self->_assemblyStage;
  self->_assemblyStage = v39;

  if (!self->_assemblyStage)
    goto LABEL_19;
  objc_msgSend_setRegistrationProvider_(self, v41, (uint64_t)self->_registrationStage, v42);
  v43 = [ACTPanoGPUDownscaler alloc];
  v46 = (ACTPanoGPUDownscaler *)objc_msgSend_initWithContext_(v43, v44, (uint64_t)self->_metal, v45);
  downscaler = self->_downscaler;
  self->_downscaler = v46;

  if (!self->_downscaler)
    goto LABEL_19;
  v48 = (OS_dispatch_queue *)dispatch_queue_create("PanoramaProcessing", 0);
  processingQueue = self->_processingQueue;
  self->_processingQueue = v48;

  if (!self->_processingQueue
    || (v50 = objc_alloc_init(PanoramaGyroStage),
        gyroStage = self->_gyroStage,
        self->_gyroStage = v50,
        gyroStage,
        !self->_gyroStage))
  {
LABEL_19:
    v62 = 0;
    v59 = 0;
    goto LABEL_21;
  }
  v52 = VTPixelTransferSessionCreate(0, &self->_vtSession);
  if (v52)
  {
    v96 = v52;
    v62 = 0;
    v59 = 0;
    goto LABEL_17;
  }
  self->_doParallaxCorrection = 1;
  self->_direction = 1;
  v55 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v53, (uint64_t)CFSTR("/System/Library/VideoProcessors/NRFV%d.bundle"), v54, v4);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleWithPath_(v55, v57, (uint64_t)v56, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v59)
    goto LABEL_20;
  v109 = 0;
  objc_msgSend_loadAndReturnError_(v59, v60, (uint64_t)&v109, v61);
  v62 = v109;
  if (v62)
  {
LABEL_21:
    v96 = 2;
    goto LABEL_17;
  }
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v63, (uint64_t)CFSTR("NRFProcessorV%d"), v64, v4);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend_classNamed_(v59, v66, (uint64_t)v65, v67);

  if (!v68)
  {
LABEL_20:
    v62 = 0;
    goto LABEL_21;
  }
  v69 = (NRFProcessor *)objc_opt_new();
  nrfProcessor = self->_nrfProcessor;
  self->_nrfProcessor = v69;

  objc_msgSend_objectForKeyedSubscript_(self->_cameraSetupPlist, v71, (uint64_t)CFSTR("TuningParameters"), v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTuningParameters_(self, v74, (uint64_t)v73, v75);
  v76 = *MEMORY[0x24BE11870];
  v119[0] = *MEMORY[0x24BE10878];
  v119[1] = v76;
  v120[0] = v73;
  v120[1] = &unk_24EFCA400;
  v77 = *MEMORY[0x24BE11878];
  v119[2] = *MEMORY[0x24BE11868];
  v119[3] = v77;
  v120[2] = &unk_24EFCA418;
  v120[3] = &unk_24EFCA430;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v78, (uint64_t)v120, (uint64_t)v119, 4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend_setupWithOptions_(self->_nrfProcessor, v80, (uint64_t)v79, v81);
  if (v82)
  {
    v96 = v82;

    v62 = 0;
  }
  else
  {
    v107 = v59;
    v108 = v7;
    objc_msgSend_setFusionMode_(self->_nrfProcessor, v83, 1, v84);
    objc_msgSend_setNrfProcessor_(self->_assemblyStage, v85, (uint64_t)self->_nrfProcessor, v86);

    v87 = *MEMORY[0x24BDC56F0];
    v117 = *MEMORY[0x24BDC56F0];
    v118 = &unk_24EFCA448;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v88, (uint64_t)&v118, (uint64_t)&v117, 1);
    v89 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v90 = *MEMORY[0x24BDC5668];
    v91 = *MEMORY[0x24BDC5708];
    v115[0] = *MEMORY[0x24BDC5668];
    v115[1] = v91;
    v116[0] = MEMORY[0x24BDBD1B8];
    v116[1] = &unk_24EFCA460;
    v92 = *MEMORY[0x24BDC5650];
    v93 = *MEMORY[0x24BDC56B8];
    v115[2] = *MEMORY[0x24BDC5650];
    v115[3] = v93;
    v116[2] = &unk_24EFCA478;
    v116[3] = &unk_24EFCA490;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v94, (uint64_t)v116, (uint64_t)v115, 4);
    v95 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v96 = CVPixelBufferPoolCreate(0, v89, v95, &self->_downsampledRegistrationPool);

    if (v96)
      goto LABEL_15;
    v113 = v87;
    v114 = &unk_24EFCA448;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v97, (uint64_t)&v114, (uint64_t)&v113, 1);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v111[0] = v90;
    v111[1] = v91;
    v112[0] = MEMORY[0x24BDBD1B8];
    v112[1] = &unk_24EFCA4A8;
    v111[2] = v92;
    v111[3] = v93;
    v112[2] = &unk_24EFCA4C0;
    v112[3] = &unk_24EFCA490;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v99, (uint64_t)v112, (uint64_t)v111, 4);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v98;
    v102 = v100;
    v96 = CVPixelBufferPoolCreate(0, v101, v102, &self->_inputSlicePool);

    if (v96)
    {
LABEL_15:
      v62 = 0;
    }
    else
    {
      v62 = 0;
      v104 = *MEMORY[0x24BDAEDF8];
      v105 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
      v106 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 32);
      self->_poolOccupancy = 0;
      self->_prevFrameDropped = 0;
      *(_OWORD *)&self->_anon_110[16] = v105;
      *(_OWORD *)&self->_anon_110[32] = v106;
      *(_OWORD *)self->_anon_e0 = v104;
      *(_OWORD *)&self->_anon_e0[16] = v105;
      *(_OWORD *)&self->_anon_e0[32] = v106;
      *(_OWORD *)self->_anon_110 = v104;
      self->_toACTFramework = 0;
      self->_nbFramesDropped = 0;
      self->_nbFramesReceived = 0;
      self->_nbFramesSkipped = 0;
    }
    v59 = v107;
    v7 = v108;
  }
LABEL_17:

  return v96;
}

- (void)dealloc
{
  __CVBuffer *toACTFramework;
  OpaqueVTPixelTransferSession *vtSession;
  __CVPixelBufferPool *downsampledRegistrationPool;
  __CVPixelBufferPool *inputSlicePool;
  objc_super v7;

  toACTFramework = self->_toACTFramework;
  if (toACTFramework)
  {
    CVPixelBufferRelease(toACTFramework);
    self->_toACTFramework = 0;
  }
  vtSession = self->_vtSession;
  if (vtSession)
  {
    VTPixelTransferSessionInvalidate(vtSession);
    CFRelease(self->_vtSession);
    self->_vtSession = 0;
  }
  downsampledRegistrationPool = self->_downsampledRegistrationPool;
  if (downsampledRegistrationPool)
  {
    CVPixelBufferPoolRelease(downsampledRegistrationPool);
    self->_downsampledRegistrationPool = 0;
  }
  inputSlicePool = self->_inputSlicePool;
  if (inputSlicePool)
  {
    CVPixelBufferPoolRelease(inputSlicePool);
    self->_inputSlicePool = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)PanoramaProcessor;
  -[PanoramaProcessor dealloc](&v7, sel_dealloc);
}

- (id)metalContext
{
  return self->_metal;
}

- (float32x4_t)refineInitialHomography:(float32x4_t)a3
{
  uint32x4_t v4;

  v4 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a3, *(float32x4_t *)(MEMORY[0x24BDAEDF8] + 16)), (int8x16_t)vceqq_f32(result, *MEMORY[0x24BDAEDF8])), (int8x16_t)vceqq_f32(a4, *(float32x4_t *)(MEMORY[0x24BDAEDF8] + 32)));
  v4.i32[3] = v4.i32[2];
  if ((vminvq_u32(v4) & 0x80000000) != 0)
    return (float32x4_t)a1[17];
  return result;
}

- (void)getRegistrationWidth:(unint64_t *)a3 height:(unint64_t *)a4
{
  *a3 >>= 2;
  *a4 >>= 2;
}

- (uint64_t)addFrameForStitching:(double)a3 withInitialHomography:(double)a4 registrationCallback:(uint64_t)a5
{
  void *ImageBuffer;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  double HostTime;
  Float64 Seconds;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  id v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const void *SampleBuffer;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  double v58;
  const char *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  NSObject *v72;
  double v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  double v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  double v130;
  double v133;
  double v135;
  double v137;
  id v138;
  void *v139;
  CMTime time;
  CVPixelBufferRef pixelBufferOut;
  unsigned int v142[32];
  uint64_t v143;

  v143 = *MEMORY[0x24BDAC8D0];
  v138 = a7;
  pixelBufferOut = 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(a6);
  CMGetAttachment(a6, CFSTR("MetadataDictionary"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CMGetAttachment(ImageBuffer, CFSTR("MetadataDictionary"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v12, (uint64_t)CFSTR("SliceNumber"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_intValue(v14, v15, v16, v17);

  HostTime = getHostTime();
  CMSampleBufferGetPresentationTimeStamp(&time, a6);
  Seconds = CMTimeGetSeconds(&time);
  panoLog(32, "FrameID:%04d time %.3f: starting processing PTS:%.3f\n", v18, HostTime, Seconds);
  v21 = *MEMORY[0x24BE10DB0];
  objc_msgSend_objectForKey_(v10, v22, *MEMORY[0x24BE10DB0], v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v139 = v11;
  if (!v24)
  {
    v28 = (void *)objc_msgSend_mutableCopy(v10, v25, v26, v27);
    objc_msgSend_objectForKeyedSubscript_(v11, v29, *MEMORY[0x24BE11488], v30);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (!v33)
      v33 = (id)*MEMORY[0x24BE10588];
    objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 376), v31, (uint64_t)CFSTR("DefaultSensorIDs"), v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v34, v35, (uint64_t)v33, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v142[0] = -559038737;
    objc_msgSend_scannerWithString_(MEMORY[0x24BDD17A8], v38, (uint64_t)v37, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scanHexInt_(v40, v41, (uint64_t)v142, v42);

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v43, v142[0], v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v28, v46, (uint64_t)v45, v21);

    v50 = objc_msgSend_copy(v28, v47, v48, v49);
    v10 = (void *)v50;
    v11 = v139;
  }
  CVPixelBufferPoolCreatePixelBuffer(0, *(CVPixelBufferPoolRef *)(a1 + 80), &pixelBufferOut);
  if (pixelBufferOut)
  {
    SampleBuffer = (const void *)CreateSampleBuffer();
    CVPixelBufferRelease(pixelBufferOut);
    if (SampleBuffer)
    {
      objc_msgSend_downsample_to_(*(void **)(a1 + 64), v52, (uint64_t)ImageBuffer, (uint64_t)pixelBufferOut);
      v56 = (void *)objc_msgSend_copy(v10, v53, v54, v55);
      v57 = 1;
      CMSetAttachment(SampleBuffer, CFSTR("MetadataDictionary"), v56, 1u);

      *(_QWORD *)(a1 + 112) = CVPixelBufferGetWidth((CVPixelBufferRef)ImageBuffer);
      *(_QWORD *)(a1 + 120) = CVPixelBufferGetHeight((CVPixelBufferRef)ImageBuffer);
      v58 = getHostTime();
      panoLog(32, "FrameID:%04d time %.3f: starting registration\n", v18, v58);
      v60 = *(void **)(a1 + 392);
      if (v60)
      {
        v61 = v138;
        objc_msgSend_registerNewSlice_withHFromGyro_registrationCallback_(v60, v59, (uint64_t)SampleBuffer, (uint64_t)v138, a2, a3, a4);
        v135 = v63;
        v137 = v62;
        v133 = v64;
        if (objc_msgSend_hasHomographyFailureFlag(*(void **)(a1 + 16), v65, v66, v67))
        {
          fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v71 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          getHostTime();
          panoLog(4, "FrameID:%04d time %.3f: registration has FAILURE flag\n");
LABEL_20:
          v110 = 0;
          v57 = 0;
LABEL_25:
          CFRelease(SampleBuffer);

          v11 = v139;
          goto LABEL_26;
        }
        if (objc_msgSend_hasRetrogradeMotionFlag(*(void **)(a1 + 16), v68, v69, v70))
        {
          fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v72 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          getHostTime();
          panoLog(4, "FrameID:%04d time %.3f: registration detected possible retrograde motion\n");
          goto LABEL_20;
        }
        v73 = getHostTime();
        panoLog(32, "FrameID:%04d time %.3f: starting stitching\n", v18, v73);
        objc_msgSend_objectForKeyedSubscript_(v10, v74, (uint64_t)CFSTR("SliceType"), v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend_intValue(v76, v77, v78, v79);

        v82 = objc_msgSend_addSlice_sliceHomography_sliceType_(*(void **)(a1 + 32), v81, (uint64_t)ImageBuffer, v80, v137, v135, v133);
        if ((_DWORD)v82)
        {
          v57 = v82;
        }
        else
        {
          objc_msgSend_registrationWeights(*(void **)(a1 + 16), v83, v84, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setMotionMask_(*(void **)(a1 + 32), v87, (uint64_t)v86, v88);

          if (!*(_BYTE *)(a1 + 352) || !(_DWORD)v80)
          {
            objc_msgSend_stitchingMask(*(void **)(a1 + 32), v89, v90, v91);
            v109 = objc_claimAutoreleasedReturnValue();
LABEL_18:
            v110 = (void *)v109;
            v111 = getHostTime();
            panoLog(32, "FrameID:%04d time %.3f: starting assembly\n", v18, v111);
            v112 = *(void **)(a1 + 40);
            objc_msgSend_registrationWeights(*(void **)(a1 + 16), v113, v114, v115);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_roi(*(void **)(a1 + 32), v117, v118, v119);
            v57 = objc_msgSend_addSlice_metadata_sliceHomography_stitchingMask_motionCue_roi_sliceType_(v112, v120, (uint64_t)ImageBuffer, (uint64_t)v10, v110, v116, v80, v137, v135, v133, v121, v122, v123, v124);

            if (!(_DWORD)v57)
            {
              v128 = objc_msgSend_copy(v10, v125, v126, v127);
              v129 = *(void **)(a1 + 336);
              *(_QWORD *)(a1 + 336) = v128;

            }
            goto LABEL_24;
          }
          v92 = getHostTime();
          panoLog(32, "FrameID:%04d time %.3f: starting parallax correction\n", v18, v92);
          v93 = *(void **)(a1 + 24);
          objc_msgSend_stitchingMask(*(void **)(a1 + 32), v94, v95, v96);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = objc_msgSend_residualFlow(*(void **)(a1 + 392), v98, v99, v100);
          v57 = objc_msgSend_addSlice_mask_homography_residualFlow_(v93, v102, (uint64_t)ImageBuffer, (uint64_t)v97, v101, v137, v135, v133);

          if (!(_DWORD)v57)
          {
            ImageBuffer = (void *)objc_msgSend_warpedFrame(*(void **)(a1 + 24), v103, v104, v105);
            objc_msgSend_warpedMask(*(void **)(a1 + 24), v106, v107, v108);
            v109 = objc_claimAutoreleasedReturnValue();
            goto LABEL_18;
          }
        }
      }
      v110 = 0;
LABEL_24:
      v61 = v138;
      goto LABEL_25;
    }
  }
  v57 = 2;
  v61 = v138;
LABEL_26:
  v130 = getHostTime();
  panoLog(32, "FrameID:%04d time %.3f: processing done\n\n", v18, v130);

  return v57;
}

- (int)addFrameWithoutStitching:(opaqueCMSampleBuffer *)a3 registrationCallback:(id)a4
{
  return 0;
}

- (void)_setPreviousFrameDroppedFlag:(opaqueCMSampleBuffer *)a3 dropped:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *value;

  v4 = a4;
  CMGetAttachment(a3, CFSTR("MetadataDictionary"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = v6;
    value = (void *)objc_msgSend_mutableCopy(v6, v7, v8, v9);

  }
  else
  {
    value = (void *)objc_opt_new();
  }
  if (v4)
    objc_msgSend_setObject_forKeyedSubscript_(value, v11, MEMORY[0x24BDBD1C8], (uint64_t)CFSTR("PreviousFrameDropped"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(value, v11, MEMORY[0x24BDBD1C0], (uint64_t)CFSTR("PreviousFrameDropped"));
  CMSetAttachment(a3, CFSTR("MetadataDictionary"), value, 1u);

}

- (int)addFrame:(opaqueCMSampleBuffer *)a3 registrationCallback:(id)a4
{
  id v6;
  void *v7;
  __CVBuffer *ImageBuffer;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  double HostTime;
  Float64 Seconds;
  const void *SampleBuffer;
  char v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  CVPixelBufferRef v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *processingQueue;
  uint64_t v52;
  id v53;
  id v54;
  NSObject *v55;
  size_t Height;
  size_t Width;
  void *v59;
  _QWORD v60[5];
  id v61;
  id v62;
  const void *v63;
  _QWORD block[4];
  id v65;
  PanoramaProcessor *v66;
  id v67;
  float v68;
  float v69;
  CMTime time;
  CVPixelBufferRef pixelBufferOut;

  v6 = a4;
  pixelBufferOut = 0;
  CMGetAttachment(a3, CFSTR("MetadataDictionary"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  Width = CVPixelBufferGetWidth(ImageBuffer);
  Height = CVPixelBufferGetHeight(ImageBuffer);
  ++self->_nbFramesReceived;
  CMGetAttachment(a3, CFSTR("ClientSpecifiedMetadata"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_mutableCopy(v9, v10, v11, v12);

  objc_msgSend_objectForKey_(v7, v14, (uint64_t)CFSTR("DebugMotionDataFromISP"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_objectForKeyedSubscript_(v7, v17, (uint64_t)CFSTR("DebugMotionDataFromISP"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v13, v20, (uint64_t)v19, (uint64_t)CFSTR("DebugMotionDataFromISP"));

  }
  objc_msgSend_objectForKey_(v7, v17, (uint64_t)CFSTR("FocalLenIn35mmFilm"), v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend_objectForKeyedSubscript_(v7, v22, (uint64_t)CFSTR("FocalLenIn35mmFilm"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v13, v25, (uint64_t)v24, (uint64_t)CFSTR("FocalLenIn35mmFilm"));

  }
  v59 = v6;
  objc_msgSend_objectForKey_(v7, v22, (uint64_t)CFSTR("SkipFrame"), v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v26;
  if (v26 && objc_msgSend_BOOLValue(v26, v27, v28, v29))
  {
    ++self->_nbFramesSkipped;
    objc_msgSend_objectForKeyedSubscript_(v7, v31, (uint64_t)CFSTR("SliceNumber"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_intValue(v33, v34, v35, v36);
    HostTime = getHostTime();
    CMSampleBufferGetPresentationTimeStamp(&time, a3);
    Seconds = CMTimeGetSeconds(&time);
    panoLog(32, "FrameID:%04d time %.3f: frame skipped PTS:%.3f , total frames skipped %zu\n", v37, HostTime, Seconds, self->_nbFramesSkipped);

    SampleBuffer = 0;
    v41 = 1;
  }
  else
  {
    CVPixelBufferPoolCreatePixelBuffer(0, self->_inputSlicePool, &pixelBufferOut);
    scalePixelBuffer(self->_vtSession, ImageBuffer, pixelBufferOut);
    ++self->_poolOccupancy;
    SampleBuffer = (const void *)CreateSampleBuffer();
    CVPixelBufferRelease(pixelBufferOut);
    v45 = (void *)objc_msgSend_copy(v7, v42, v43, v44);
    CMSetAttachment(SampleBuffer, CFSTR("MetadataDictionary"), v45, 1u);

    v46 = pixelBufferOut;
    v50 = (void *)objc_msgSend_copy(v13, v47, v48, v49);
    CMSetAttachment(v46, CFSTR("MetadataDictionary"), v50, 1u);

    CMPropagateAttachments(ImageBuffer, pixelBufferOut);
    v41 = 0;
  }
  if (a3)
    CFRelease(a3);
  processingQueue = self->_processingQueue;
  v52 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227621028;
  block[3] = &unk_24EFC2AA8;
  v53 = v7;
  v65 = v53;
  v66 = self;
  v54 = v13;
  v67 = v54;
  v68 = (float)Width;
  v69 = (float)Height;
  dispatch_async(processingQueue, block);
  if ((v41 & 1) == 0)
  {
    v55 = self->_processingQueue;
    v60[0] = v52;
    v60[1] = 3221225472;
    v60[2] = sub_2276211AC;
    v60[3] = &unk_24EFC2AD0;
    v60[4] = self;
    v61 = v53;
    v63 = SampleBuffer;
    v62 = v59;
    dispatch_async(v55, v60);

  }
  return 0;
}

- (int)_addLastSlice
{
  uint64_t v2;
  uint64_t v3;
  PanoramaStitchingStage *stitchingStage;
  uint64_t v6;
  const char *v7;
  int result;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  PanoramaAssemblyStage *assemblyStage;
  uint64_t v13;
  NSDictionary *lastMetadata;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  stitchingStage = self->_stitchingStage;
  v6 = objc_msgSend_warpedFrame(self->_parallaxStage, a2, v2, v3);
  v33 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
  v34 = *MEMORY[0x24BDAEDF8];
  v32 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 32);
  result = objc_msgSend_addSlice_sliceHomography_sliceType_(stitchingStage, v7, v6, 2);
  if (!result)
  {
    assemblyStage = self->_assemblyStage;
    v13 = objc_msgSend_warpedFrame(self->_parallaxStage, v9, v10, v11);
    lastMetadata = self->_lastMetadata;
    objc_msgSend_stitchingMask(self->_stitchingStage, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_registrationWeights(self->_registrationStage, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_roi(self->_stitchingStage, v23, v24, v25);
    v31 = objc_msgSend_addSlice_metadata_sliceHomography_stitchingMask_motionCue_roi_sliceType_(assemblyStage, v26, v13, (uint64_t)lastMetadata, v18, v22, 2, *(double *)&v34, *(double *)&v33, *(double *)&v32, v27, v28, v29, v30);

    return v31;
  }
  return result;
}

- (int)finishProcessing
{
  NSObject *processingQueue;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  processingQueue = self->_processingQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_227621660;
  v16[3] = &unk_24EFC2AF8;
  v16[4] = self;
  v16[5] = &v17;
  dispatch_sync(processingQueue, v16);
  v7 = *((_DWORD *)v18 + 6);
  if (!v7)
  {
    objc_msgSend_cropRect(self->_assemblyStage, v4, v5, v6);
    objc_msgSend_setCropRect_(self->_output, v12, v13, v14, (v8 + 0.300000012) * (double)self->_sliceWidth, (v9 + 0.075000003) * (double)self->_sliceHeight, (v10 + -0.150000006) * (double)self->_sliceWidth, (v11 + -0.150000006) * (double)self->_sliceHeight);
    v7 = *((_DWORD *)v18 + 6);
  }
  _Block_object_dispose(&v17, 8);
  return v7;
}

- (int)_createDummyOutput
{
  void *v3;
  PanoramaOutput *v4;
  const __CFDictionary *v5;
  const char *v6;
  uint64_t v7;
  PanoramaOutput *output;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = *MEMORY[0x24BDC5668];
  v12[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (PanoramaOutput *)objc_opt_new();
  v5 = v3;
  CVPixelBufferCreate(0, 0x1226uLL, 0x3FFEuLL, 0x34323066u, v5, (CVPixelBufferRef *)&v10);
  objc_msgSend_setPixelBuffer_(v4, v6, v10, v7);
  output = self->_output;
  self->_output = v4;

  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  NSObject *processingQueue;
  int v4;
  _QWORD block[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22762189C;
  block[3] = &unk_24EFC2B20;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(processingQueue, block);
  v4 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (int)prepareToProcess_PanoSpecific:(unsigned int)a3 frameWidth:(unint64_t)a4 frameHeight:(unint64_t)a5
{
  NSObject *processingQueue;
  int v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  processingQueue = self->_processingQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_227621A9C;
  v8[3] = &unk_24EFC2B48;
  v8[6] = a4;
  v8[7] = a5;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(processingQueue, v8);
  v6 = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)encodedResult
{
  NSObject *processingQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_227621C40;
  v11 = sub_227621C50;
  v12 = (id)objc_opt_new();
  processingQueue = self->_processingQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_227621C58;
  v6[3] = &unk_24EFC2AF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(processingQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (int)prewarm
{
  return 0;
}

- (int)process
{
  return 0;
}

- (int)purgeResources
{
  return 0;
}

- (int)resetState
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  objc_msgSend_resetState(self->_registrationStage, a2, v2, v3);
  objc_msgSend_resetState(self->_parallaxStage, v5, v6, v7);
  objc_msgSend_resetState(self->_stitchingStage, v8, v9, v10);
  objc_msgSend_resetState(self->_assemblyStage, v11, v12, v13);
  objc_msgSend_resetState(self->_gyroStage, v14, v15, v16);
  self->_poolOccupancy = 0;
  self->_prevFrameDropped = 0;
  self->_nbFramesDropped = 0;
  self->_nbFramesReceived = 0;
  self->_nbFramesSkipped = 0;
  v17 = *MEMORY[0x24BDAEDF8];
  v18 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
  v19 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 32);
  *(_OWORD *)&self->_anon_110[16] = v18;
  *(_OWORD *)&self->_anon_110[32] = v19;
  *(_OWORD *)self->_anon_e0 = v17;
  *(_OWORD *)&self->_anon_e0[16] = v18;
  *(_OWORD *)&self->_anon_e0[32] = v19;
  *(_OWORD *)self->_anon_110 = v17;
  return 0;
}

- (int)setup
{
  return 0;
}

- (int)setDirection:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  v4 = *(_QWORD *)&a3;
  self->_direction = a3;
  objc_msgSend_setDirection_(self->_registrationStage, a2, *(uint64_t *)&a3, v3);
  objc_msgSend_setDirection_(self->_parallaxStage, v6, v4, v7);
  objc_msgSend_setDirection_(self->_stitchingStage, v8, v4, v9);
  objc_msgSend_setDirection_(self->_assemblyStage, v10, v4, v11);
  return 0;
}

- (int)setPanoramaParameters:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_panoramaParams.atlasTranslationShiftHighThreshold = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_panoramaParams.enableTranslationCorrection = v4;
  *(_OWORD *)&self->_panoramaParams.frameWidth = v3;
  return 0;
}

- (int)getMaskAsBuffer:(char *)a3 widthOut:(unint64_t *)a4 heightOut:(unint64_t *)a5
{
  return objc_msgSend_getMaskAsBuffer_widthOut_heightOut_(self->_assemblyStage, a2, (uint64_t)a3, (uint64_t)a4, a5);
}

- (CGRect)autocropMask
{
  NSObject *processingQueue;
  double x;
  double y;
  double width;
  double height;
  _QWORD block[5];
  CGRect result;

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227621FAC;
  block[3] = &unk_24EFC2B70;
  block[4] = self;
  dispatch_sync(processingQueue, block);
  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->cameraInfoByPortType, a3);
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->metalCommandQueue, a3);
}

- (NSDictionary)tuningParameters
{
  return self->tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->tuningParameters, a3);
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (PanoRegistrationProvider)registrationProvider
{
  return self->_registrationProvider;
}

- (void)setRegistrationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_registrationProvider, a3);
}

- (BOOL)doParallaxCorrection
{
  return self->_doParallaxCorrection;
}

- (void)setDoParallaxCorrection:(BOOL)a3
{
  self->_doParallaxCorrection = a3;
}

- (PanoramaPreviewOutput)previewOutput
{
  return self->_previewOutput;
}

- (void)setPreviewOutput:(id)a3
{
  objc_storeStrong((id *)&self->_previewOutput, a3);
}

- (PanoramaOutput)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (NSNumber)writeSlicesToDisc
{
  return self->_writeSlicesToDisc;
}

- (void)setWriteSlicesToDisc:(id)a3
{
  objc_storeStrong((id *)&self->_writeSlicesToDisc, a3);
}

- (NSNumber)previewScale
{
  return self->_previewScale;
}

- (NSNumber)maxWidth
{
  return self->_maxWidth;
}

- (NSNumber)previewWidth
{
  return self->_previewWidth;
}

- (NSNumber)previewHeight
{
  return self->_previewHeight;
}

- (NSNumber)defaultDirection
{
  return self->_defaultDirection;
}

- (NSNumber)defaultRegistrationMethod
{
  return self->_defaultRegistrationMethod;
}

- (NSNumber)defaultPredictionMethod
{
  return self->_defaultPredictionMethod;
}

- (NSNumber)defaultPrediction
{
  return self->_defaultPrediction;
}

- (NSNumber)defaultFallback
{
  return self->_defaultFallback;
}

- (NSNumber)defaultBlendingConfig
{
  return self->_defaultBlendingConfig;
}

- (unint64_t)nbFramesReceived
{
  return self->_nbFramesReceived;
}

- (unint64_t)nbFramesSkipped
{
  return self->_nbFramesSkipped;
}

- (unint64_t)nbFramesDropped
{
  return self->_nbFramesDropped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBlendingConfig, 0);
  objc_storeStrong((id *)&self->_defaultFallback, 0);
  objc_storeStrong((id *)&self->_defaultPrediction, 0);
  objc_storeStrong((id *)&self->_defaultPredictionMethod, 0);
  objc_storeStrong((id *)&self->_defaultRegistrationMethod, 0);
  objc_storeStrong((id *)&self->_defaultDirection, 0);
  objc_storeStrong((id *)&self->_previewHeight, 0);
  objc_storeStrong((id *)&self->_previewWidth, 0);
  objc_storeStrong((id *)&self->_maxWidth, 0);
  objc_storeStrong((id *)&self->_previewScale, 0);
  objc_storeStrong((id *)&self->_writeSlicesToDisc, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_previewOutput, 0);
  objc_storeStrong((id *)&self->_registrationProvider, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->tuningParameters, 0);
  objc_storeStrong((id *)&self->metalCommandQueue, 0);
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_nrfProcessor, 0);
  objc_storeStrong((id *)&self->_lastMetadata, 0);
  objc_storeStrong((id *)&self->_cameraSetupPlist, 0);
  objc_storeStrong((id *)&self->_downscaler, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_gyroStage, 0);
  objc_storeStrong((id *)&self->_assemblyStage, 0);
  objc_storeStrong((id *)&self->_stitchingStage, 0);
  objc_storeStrong((id *)&self->_parallaxStage, 0);
  objc_storeStrong((id *)&self->_registrationStage, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end
