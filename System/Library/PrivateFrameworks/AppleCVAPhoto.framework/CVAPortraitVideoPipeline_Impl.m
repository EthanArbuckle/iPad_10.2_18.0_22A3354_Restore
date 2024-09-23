@implementation CVAPortraitVideoPipeline_Impl

- (int)makeMetalContextWithOptionalCommandQueue:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MTLDeviceSPI *device;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
  }
  else
  {
    v8 = MTLCreateSystemDefaultDevice();
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MTLCreateSystemDefaultDevice() is nil"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl makeMetalContextWithOptionalCommandQueue:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 669, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B5658D40(v8 == 0, a4, 0, 4294944382, v21);

    if (!v8)
    {
      v9 = 0;
      v18 = -22914;
      goto LABEL_10;
    }
    v9 = (void *)objc_msgSend(v8, "newCommandQueue");
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[(_Nonnull id<MTLDeviceSPI>) newCommandQueue] is nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl makeMetalContextWithOptionalCommandQueue:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 678, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B5658D40(v9 == 0, a4, 0, 4294944382, v24);

    if (!v9)
    {
      v18 = -22914;
      goto LABEL_10;
    }
  }
  objc_storeStrong((id *)&self->_metalContext.device, v8);
  objc_storeStrong((id *)&self->_metalContext.commandQueue, v9);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLForResource:withExtension:", CFSTR("cvadepth-iOS"), CFSTR("metallib"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  device = self->_metalContext.device;
  v26 = 0;
  v13 = (void *)-[MTLDeviceSPI newLibraryWithURL:error:](device, "newLibraryWithURL:error:", v11, &v26);
  v14 = v26;
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error creating metal library"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl makeMetalContextWithOptionalCommandQueue:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 694, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v13 == 0, a4, v14, 4294944382, v17);

  if (v13)
  {
    objc_storeStrong((id *)&self->_metalContext.library, v13);
    v18 = 0;
  }
  else
  {
    v18 = -22914;
  }

LABEL_10:
  return v18;
}

- (CVAPortraitVideoPipeline_Impl)initWithProperties:(id)a3 error:(id *)a4
{
  return -[CVAPortraitVideoPipeline_Impl initWithProperties:commandQueue:notificationQueue:error:](self, "initWithProperties:commandQueue:notificationQueue:error:", a3, 0, 0, a4);
}

- (CVAPortraitVideoPipeline_Impl)initWithProperties:(id)a3 commandQueue:(id)a4 notificationQueue:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  unsigned __int8 *v14;
  id v15;
  NSObject *v16;
  CVAPortraitVideoPipeline_Impl *v17;
  dispatch_queue_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  BOOL v25;
  int v26;
  char v28;
  char v29;
  BOOL v30;
  int v31;
  size_t v32;
  size_t v33;
  OSType v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  float v43;
  float v44;
  float v45;
  float v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  CVPixelBufferRef *v55;
  OSType v56;
  size_t v57;
  size_t v58;
  float32x2_t v59;
  int8x8_t v60;
  CVPixelBufferRef *v61;
  int v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unsigned __int16 v68;
  unsigned __int16 v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  int v73;
  uint64_t v74;
  void *v75;
  int v76;
  int v77;
  void *v78;
  int v79;
  int v80;
  void *v81;
  int v82;
  int v83;
  void *v84;
  int v85;
  int v86;
  CVPixelBufferRef *v87;
  CVPixelBufferRef *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  unsigned int v100;
  void *v101;
  unsigned int v102;
  void *v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  char v122;
  void *v123;
  char v124;
  int v125;
  int v126;
  uint64_t v127;
  unsigned __int8 v128;
  __int128 v129;
  _QWORD *v130;
  void *v131;
  void *v132;
  int v133;
  int v134;
  int v135;
  int v136;
  uint64_t v137;
  size_t v138;
  char *v139;
  char *v140;
  _QWORD *v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  size_t v145;
  char *v146;
  char *v147;
  void *v148;
  int v149;
  int v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  int v155;
  int v156;
  void *v157;
  int v158;
  int v159;
  uint64_t v160;
  int v161;
  int v162;
  uint64_t v163;
  uint64_t v164;
  int v165;
  int v166;
  uint64_t v167;
  uint64_t v168;
  int v169;
  int v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  int v175;
  int v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  int v195;
  int v196;
  int v197;
  BOOL v198;
  char v199;
  int v200;
  float v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  uint64_t v206;
  void *v207;
  _QWORD *v208;
  void *v209;
  void *v210;
  void *v211;
  uint64_t v212;
  void *v213;
  VideoMattingMetal *v214;
  int v215;
  int v216;
  int v217;
  int v218;
  int v219;
  double v220;
  double v221;
  double v222;
  uint64_t v223;
  void *v224;
  double v225;
  double v226;
  void *v227;
  VideoRelightingMetal *v228;
  void *v229;
  CVAFilterAlphaBlend *v230;
  void *v231;
  void *v232;
  id *v233;
  id v234;
  id v235;
  id v236;
  unsigned int v237;
  int v238;
  int v239;
  int v240;
  int v241;
  unsigned __int32 v242;
  int v243;
  unsigned int v244;
  unsigned int v245;
  int v246;
  unsigned int v247;
  unsigned int v248;
  OSType pixelFormatType;
  unsigned int pixelFormatTypec;
  unsigned int pixelFormatTypea;
  int32x2_t pixelFormatTypeb;
  uint64_t v253;
  objc_super v254;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v254.receiver = self;
  v254.super_class = (Class)CVAPortraitVideoPipeline_Impl;
  v14 = -[CVAPortraitVideoPipeline_Impl init](&v254, sel_init);
  if (!v14)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -22900, 0);
      v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  if (v13)
  {
    v15 = v13;
    v16 = *((_QWORD *)v14 + 2);
    *((_QWORD *)v14 + 2) = v15;
  }
  else
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("CVAPortraitPipelineResultQueue", v16);
    v19 = (void *)*((_QWORD *)v14 + 2);
    *((_QWORD *)v14 + 2) = v18;

  }
  if (objc_msgSend(v14, "makeMetalContextWithOptionalCommandQueue:error:", v12, a6))
    goto LABEL_18;
  if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EF1337C0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v232 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20 = objc_msgSend(v11, "copy");
  v21 = (void *)*((_QWORD *)v14 + 3);
  *((_QWORD *)v14 + 3) = v20;

  if (!objc_msgSend(*((id *)v14 + 3), "validateWithError:", a6))
    goto LABEL_18;
  v235 = v12;
  v236 = v11;
  v234 = v13;
  v253 = sub_1B5669B50(objc_msgSend(*((id *)v14 + 3), "videoPipelineDevice"));
  v22 = sub_1B569090C(CFSTR("guided_depth_restoration_enabled"), CFSTR("com.apple.coremedia"), 0);
  v23 = sub_1B569090C(CFSTR("CVAPhotoForceDensePipeline"), CFSTR("com.apple.coremedia"), 0);
  v24 = sub_1B569090C(CFSTR("portraitPreviewDisableForegroundBlur"), CFSTR("com.apple.coremedia"), 0);
  if (objc_msgSend(*((id *)v14 + 3), "supportsForegroundBlur"))
  {
    if (sub_1B569090C(CFSTR("enableFGBlur"), CFSTR("com.apple.coremedia"), 1))
      v25 = v24 == 0;
    else
      v25 = 0;
    v26 = v25;
  }
  else
  {
    v26 = 0;
  }
  v14[34] = v26;
  if ((_DWORD)v253 == 1 && v22)
  {
    v28 = objc_msgSend(*((id *)v14 + 3), "canSkipDisparityHoleFillingAndTemporalRejection");
    if (v23)
      v29 = 1;
    else
      v29 = v28;
    if ((v29 & 1) == 0)
    {
      v26 = v14[34];
LABEL_30:
      v30 = v26 != 0;
      goto LABEL_31;
    }
  }
  else if (!v23)
  {
    goto LABEL_30;
  }
  v30 = 1;
LABEL_31:
  v14[32] = v30;
  v31 = sub_1B569090C(CFSTR("CVAPhotoForceHighPrecisionForDenseDisparityConversion"), CFSTR("com.apple.coremedia"), 0);
  pixelFormatType = 1278226534;
  v14[33] = v31 == 0;
  if (!v14[32] || v31)
  {
    v32 = objc_msgSend(*((id *)v14 + 3), "inputDisparityPixelBufferWidth");
    v33 = objc_msgSend(*((id *)v14 + 3), "inputDisparityPixelBufferHeight");
    v34 = 1278226534;
  }
  else
  {
    v32 = objc_msgSend(*((id *)v14 + 3), "inputDisparityPixelBufferWidth");
    v33 = objc_msgSend(*((id *)v14 + 3), "inputDisparityPixelBufferHeight");
    v34 = 1751411059;
  }
  CVPixelBufferCreate(0, v32, v33, v34, 0, (CVPixelBufferRef *)v14 + 5);
  if (v14[32] && v14[33])
  {
    v35 = objc_msgSend(*((id *)v14 + 3), "outputDisparityPixelBufferWidth");
    v36 = objc_msgSend(*((id *)v14 + 3), "outputDisparityPixelBufferHeight");
    v37 = 1751411059;
  }
  else
  {
    v35 = objc_msgSend(*((id *)v14 + 3), "outputDisparityPixelBufferWidth");
    v36 = objc_msgSend(*((id *)v14 + 3), "outputDisparityPixelBufferHeight");
    v37 = 1278226534;
  }
  +[CVAPortraitVideoPipeline_Impl pixelBufferPoolCreateWithWidth:height:pixelFormat:pool:](CVAPortraitVideoPipeline_Impl, "pixelBufferPoolCreateWithWidth:height:pixelFormat:pool:", v35, v36, v37, v14 + 48);
  v233 = a6;
  v38 = objc_msgSend(*((id *)v14 + 3), "inputDisparityPixelBufferWidth");
  v39 = objc_msgSend(*((id *)v14 + 3), "inputDisparityPixelBufferHeight");
  v248 = objc_msgSend(*((id *)v14 + 3), "outputDisparityPixelBufferWidth");
  v247 = objc_msgSend(*((id *)v14 + 3), "outputDisparityPixelBufferHeight");
  v40 = objc_msgSend(*((id *)v14 + 3), "depthPixelBufferXPadding");
  v41 = objc_msgSend(*((id *)v14 + 3), "depthPixelBufferYPadding");
  if (v14[34])
  {
    v244 = 0;
    v42 = 0;
  }
  else
  {
    v244 = objc_msgSend(*((id *)v14 + 3), "depthPixelBufferXReplication");
    if (v14[34])
      v42 = 0;
    else
      v42 = objc_msgSend(*((id *)v14 + 3), "depthPixelBufferYReplication");
  }
  objc_msgSend(*((id *)v14 + 3), "depthPixelBufferMaxRightOcclusionDisparityChange");
  v44 = v43;
  objc_msgSend(*((id *)v14 + 3), "depthPixelBufferMaxLeftOcclusionDisparityChange");
  v46 = v44 - v45;
  if (v14[32])
    v46 = 0.0;
  *(float *)&v242 = v46;
  objc_msgSend(v11, "outputDisparityOffset");
  *((_DWORD *)v14 + 9) = v47;
  objc_msgSend(*((id *)v14 + 3), "disparityStereoFocalLengthPixels");
  v49 = v48;
  objc_msgSend(*((id *)v14 + 3), "disparityStereoBaselineMeters");
  v51 = v50;
  v52 = operator new();
  v53 = v52;
  v54 = *((_DWORD *)v14 + 9);
  *(_QWORD *)v52 = 0;
  *(_QWORD *)(v52 + 8) = 0;
  *(_QWORD *)(v52 + 16) = 0;
  *(_QWORD *)(v52 + 24) = (int)v38;
  *(_QWORD *)(v52 + 32) = (int)v39;
  *(_DWORD *)(v52 + 40) = v49;
  *(_DWORD *)(v52 + 44) = v51;
  *(_DWORD *)(v52 + 48) = v54;
  if ((_DWORD)v253 == 3)
  {
    v55 = (CVPixelBufferRef *)(v52 + 16);
    v56 = 1278226488;
    v57 = (int)v38;
    v58 = (int)v39;
  }
  else
  {
    CVPixelBufferCreate(0, (int)v38, (int)v39, 0x4C303066u, 0, (CVPixelBufferRef *)v52);
    v57 = *(_QWORD *)(v53 + 24);
    v58 = *(_QWORD *)(v53 + 32);
    v56 = 1278226534;
    v55 = (CVPixelBufferRef *)(v53 + 8);
  }
  CVPixelBufferCreate(0, v57, v58, v56, 0, v55);
  v59.i32[0] = 0;
  v59.i32[1] = v242;
  *(float *)v60.i32 = -*(float *)&v242;
  v60.i32[1] = v242;
  *(int8x8_t *)(v53 + 52) = vand_s8(v60, (int8x8_t)vcgt_f32(v59, (float32x2_t)v242));
  *(_DWORD *)(v53 + 60) = 0;
  *(_DWORD *)(v53 + 64) = 0;
  v61 = (CVPixelBufferRef *)*((_QWORD *)v14 + 40);
  *((_QWORD *)v14 + 40) = v53;
  if (v61)
  {
    CVPixelBufferRelease(*v61);
    *v61 = 0;
    CVPixelBufferRelease(v61[1]);
    v61[1] = 0;
    CVPixelBufferRelease(v61[2]);
    v61[2] = 0;
    MEMORY[0x1B5E4DE7C](v61, 0x1020C4092A1A721);
  }
  if (v14[32])
  {
    if (v14[33])
      v62 = 1751411059;
    else
      v62 = 1278226534;
    pixelFormatType = v62;
  }
  v63 = objc_msgSend(*((id *)v14 + 3), "inputToOutputDisparityPixelBufferRotation");
  v64 = operator new();
  v65 = v64;
  v66 = (v39 << 32) | v38;
  *(_DWORD *)v64 = pixelFormatType;
  *(_QWORD *)(v64 + 4) = v66;
  *(_QWORD *)(v64 + 12) = v248 | ((unint64_t)v247 << 32);
  *(_QWORD *)(v64 + 28) = v40 | (unint64_t)(v41 << 32);
  *(_QWORD *)(v64 + 36) = v244 | (unint64_t)(v42 << 32);
  *(_DWORD *)(v64 + 44) = v63;
  if ((v63 & 0xFFFFFFFD) != 0)
  {
    *(_DWORD *)(v64 + 20) = v39;
    *(_DWORD *)(v64 + 24) = v38;
  }
  else
  {
    *(_QWORD *)(v64 + 20) = v66;
  }
  if (CVPixelBufferCreate(0, (int)v38, (int)v39, pixelFormatType, 0, (CVPixelBufferRef *)(v64 + 48)))
    *(_QWORD *)(v65 + 48) = 0;
  if (CVPixelBufferCreate(0, *(int *)(v65 + 20), *(int *)(v65 + 24), *(_DWORD *)v65, 0, (CVPixelBufferRef *)(v65 + 56)))
  {
    *(_QWORD *)(v65 + 56) = 0;
  }
  v67 = *((_QWORD *)v14 + 41);
  *((_QWORD *)v14 + 41) = v65;
  if (v67)
  {
    CVPixelBufferRelease(*(CVPixelBufferRef *)(v67 + 56));
    *(_QWORD *)(v67 + 56) = 0;
    CVPixelBufferRelease(*(CVPixelBufferRef *)(v67 + 48));
    *(_QWORD *)(v67 + 48) = 0;
    MEMORY[0x1B5E4DE7C](v67, 0x1020C40FBAF4977);
  }
  v68 = objc_msgSend(*((id *)v14 + 3), "focusStatisticsXTileCount");
  v69 = objc_msgSend(*((id *)v14 + 3), "focusStatisticsYTileCount");
  objc_msgSend(*((id *)v14 + 3), "colorPixelBufferFocalLength_mm");
  pixelFormatTypec = v70;
  objc_msgSend(*((id *)v14 + 3), "colorPixelBufferPixelSize_um");
  v245 = v71;
  objc_msgSend(*((id *)v14 + 3), "colorPixelBufferFocalRatio");
  v73 = v72;
  v74 = operator new();
  *(_QWORD *)(v74 + 44) = 0x9902007800A00100;
  *(_BYTE *)(v74 + 52) = 0x80;
  *(_QWORD *)(v74 + 56) = 0x3EA3D70A3F000000;
  *(_DWORD *)(v74 + 64) = 1082130432;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "floatForKey:", CFSTR("nearSubjectDisparityScalingFactor"));
  v77 = v76;

  *(_DWORD *)(v74 + 68) = v77;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "floatForKey:", CFSTR("farSubjectDisparityScalingFactor"));
  v80 = v79;

  *(_DWORD *)(v74 + 72) = v80;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "floatForKey:", CFSTR("nearFocusDistanceRatioThreshold"));
  v83 = v82;

  *(_DWORD *)(v74 + 76) = v83;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "floatForKey:", CFSTR("farFocusDistanceRatioThreshold"));
  v86 = v85;

  *(_DWORD *)(v74 + 80) = v86;
  *(_OWORD *)(v74 + 84) = xmmword_1B56AC0F0;
  *(_QWORD *)(v74 + 100) = 0x3FC0FF9700000000;
  *(_DWORD *)(v74 + 108) = 1061158912;
  bzero((void *)(v74 + 240), 0x400uLL);
  *(_WORD *)(v74 + 24) = v68;
  *(_WORD *)(v74 + 26) = v69;
  *(float32x2_t *)(v74 + 28) = vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v245, pixelFormatTypec)), (float64x2_t)xmmword_1B56AC100));
  *(_DWORD *)(v74 + 36) = v73;
  CVPixelBufferCreate(0, v68, v69, 0x4C303066u, 0, (CVPixelBufferRef *)(v74 + 136));
  CVPixelBufferCreate(0, *(unsigned __int16 *)(v74 + 24), *(unsigned __int16 *)(v74 + 26), 0x4C303038u, 0, (CVPixelBufferRef *)(v74 + 144));
  CVPixelBufferCreate(0, *(unsigned __int16 *)(v74 + 24) + 2, *(unsigned __int16 *)(v74 + 26) + 2, 0x4C303038u, 0, (CVPixelBufferRef *)(v74 + 152));
  CVPixelBufferCreate(0, *(unsigned __int16 *)(v74 + 24) + 2, *(unsigned __int16 *)(v74 + 26) + 2, 0x4C303038u, 0, (CVPixelBufferRef *)(v74 + 160));
  CVPixelBufferCreate(0, *(unsigned __int16 *)(v74 + 24) + 2, *(unsigned __int16 *)(v74 + 26) + 2, 0x4C303038u, 0, (CVPixelBufferRef *)(v74 + 168));
  CVPixelBufferCreate(0, *(unsigned __int16 *)(v74 + 24) + 2, *(unsigned __int16 *)(v74 + 26) + 2, 0x4C303038u, 0, (CVPixelBufferRef *)(v74 + 176));
  CVPixelBufferCreate(0, *(unsigned __int16 *)(v74 + 24) + 2, *(unsigned __int16 *)(v74 + 26) + 2, 0x4C303038u, 0, (CVPixelBufferRef *)(v74 + 184));
  CVPixelBufferCreate(0, *(unsigned __int16 *)(v74 + 24) + 2, *(unsigned __int16 *)(v74 + 26) + 2, 0x4C303066u, 0, (CVPixelBufferRef *)(v74 + 192));
  CVPixelBufferCreate(0, *(unsigned __int16 *)(v74 + 24) + 2, *(unsigned __int16 *)(v74 + 26) + 2, 0x4C303066u, 0, (CVPixelBufferRef *)(v74 + 200));
  CVPixelBufferCreate(0, *(unsigned __int16 *)(v74 + 24) + 2, *(unsigned __int16 *)(v74 + 26) + 2, 0x4C303066u, 0, (CVPixelBufferRef *)(v74 + 208));
  CVPixelBufferCreate(0, *(unsigned __int16 *)(v74 + 24) + 2, *(unsigned __int16 *)(v74 + 26) + 2, 0x4C303066u, 0, (CVPixelBufferRef *)(v74 + 216));
  CVPixelBufferCreate(0, *(unsigned __int16 *)(v74 + 46), *(unsigned __int16 *)(v74 + 48), 0x4C303038u, 0, (CVPixelBufferRef *)(v74 + 224));
  CVPixelBufferCreate(0, *(unsigned __int16 *)(v74 + 46), *(unsigned __int16 *)(v74 + 48), 0x4C303038u, 0, (CVPixelBufferRef *)(v74 + 232));
  v87 = (CVPixelBufferRef *)*((_QWORD *)v14 + 42);
  *((_QWORD *)v14 + 42) = v74;
  if (v87)
  {
    v88 = sub_1B5690A68(v87);
    MEMORY[0x1B5E4DE7C](v88, 0x1020C4097AB94F3);
  }
  v11 = v236;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "floatForKey:", CFSTR("bgShiftUpdateRate"));

  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v90, "integerForKey:", CFSTR("kCVAFusionProperty_bgShiftStatsWindowSize"));

  if (v91 != (int)v91)
    syslog(3, "Integer %ld is outside [%d, %d]", v91, 0x80000000, 0x7FFFFFFF);
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "floatForKey:", CFSTR("cntDeltaShift"));

  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "floatForKey:", CFSTR("minDeltaShift"));

  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "floatForKey:", CFSTR("maxDeltaShift"));

  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "floatForKey:", CFSTR("dsLowThld"));

  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "floatForKey:", CFSTR("dsLowScale"));

  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "floatForKey:", CFSTR("dsHighThld"));

  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "floatForKey:", CFSTR("dsHighScale"));

  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "floatForKey:", CFSTR("kCVAFusionProperty_backgroundSeparationLikelihoodTemporalUpdateRate"));
  pixelFormatTypea = v100;

  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "floatForKey:", CFSTR("kCVAFusionProperty_backgroundSeparationLikelihoodUpdateRate"));
  v237 = v102;

  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "floatForKey:", CFSTR("kCVAFusionProperty_backgroundSeparationLikelihoodUpdateThreshold"));
  v105 = v104;

  objc_msgSend(*((id *)v14 + 3), "backgroundDisparityUpdateRate");
  v107 = v106;
  v108 = objc_msgSend(*((id *)v14 + 3), "backgroundDisparityStatsWindowSize");
  objc_msgSend(*((id *)v14 + 3), "centerDeltaCanonicalDisparity");
  v110 = v109;
  objc_msgSend(*((id *)v14 + 3), "minDeltaCanonicalDisparity");
  v112 = v111;
  objc_msgSend(*((id *)v14 + 3), "maxDeltaCanonicalDisparity");
  v114 = v113;
  objc_msgSend(*((id *)v14 + 3), "dsCanonicalLowThld");
  v116 = v115;
  objc_msgSend(*((id *)v14 + 3), "dsCanonicalLowScale");
  v246 = v117;
  objc_msgSend(*((id *)v14 + 3), "dsCanonicalHighThld");
  v243 = v118;
  objc_msgSend(*((id *)v14 + 3), "linearDeltaDepthMultiplier");
  v241 = v119;
  objc_msgSend(*((id *)v14 + 3), "linearDeltaDepthOffset");
  v240 = v120;
  objc_msgSend(*((id *)v14 + 3), "dsCanonicalHighScale");
  v239 = v121;
  if ((_DWORD)v253)
  {
    v122 = 0;
  }
  else
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(v123, "BOOLForKey:", CFSTR("disableDepthQualityMetric"));

    v122 = v124 ^ 1;
  }
  objc_msgSend(*((id *)v14 + 3), "foregroundPercentile");
  v126 = v125;
  v127 = operator new();
  pixelFormatTypeb = (int32x2_t)__PAIR64__(v237, pixelFormatTypea);
  v128 = v14[34];
  *(_QWORD *)&v129 = 0x4500000045000000;
  *((_QWORD *)&v129 + 1) = 0x4500000045000000;
  *(_OWORD *)v127 = v129;
  *(_DWORD *)(v127 + 16) = -1082130432;
  BYTE3(v129) = 0;
  BYTE7(v129) = 0;
  BYTE11(v129) = 0;
  HIBYTE(v129) = 0;
  *(_OWORD *)(v127 + 24) = v129;
  *(_OWORD *)(v127 + 40) = v129;
  *(_OWORD *)(v127 + 56) = v129;
  *(_DWORD *)(v127 + 72) = 0;
  *(_DWORD *)(v127 + 80) = 1;
  bzero((void *)(v127 + 116), 0x400uLL);
  *(_DWORD *)(v127 + 1144) = 1157627904;
  *(_DWORD *)(v127 + 1148) = v126;
  *(_QWORD *)(v127 + 1152) = 0x41700000C0A00000;
  *(_DWORD *)(v127 + 1160) = v107;
  *(_DWORD *)(v127 + 1164) = v108;
  *(_DWORD *)(v127 + 1168) = v110;
  *(_DWORD *)(v127 + 1172) = v112;
  *(_DWORD *)(v127 + 1176) = v114;
  *(_DWORD *)(v127 + 1180) = v116;
  *(_DWORD *)(v127 + 1184) = v246;
  *(_DWORD *)(v127 + 1188) = v243;
  *(_DWORD *)(v127 + 1192) = v241;
  *(_DWORD *)(v127 + 1196) = v240;
  *(_DWORD *)(v127 + 1200) = v239;
  *(int32x2_t *)(v127 + 1204) = pixelFormatTypeb;
  *(_DWORD *)(v127 + 1212) = v105;
  *(_BYTE *)(v127 + 1216) = v128;
  *(_DWORD *)(v127 + 1220) = 0;
  v130 = (_QWORD *)*((_QWORD *)v14 + 43);
  *((_QWORD *)v14 + 43) = v127;
  if (v130)
  {
    v131 = (void *)v130[6];
    if (v131)
    {
      v130[7] = v131;
      operator delete(v131);
    }
    v132 = (void *)v130[3];
    if (v132)
    {
      v130[4] = v132;
      operator delete(v132);
    }
    MEMORY[0x1B5E4DE7C](v130, 0x1080C400297598BLL);
  }
  v238 = v105;
  objc_msgSend(*((id *)v14 + 3), "deltaDepth");
  v134 = v133;
  objc_msgSend(*((id *)v14 + 3), "closeDisparityPercentile");
  v136 = v135;
  v137 = operator new();
  *(_QWORD *)(v137 + 24) = 0;
  *(_OWORD *)(v137 + 48) = 0u;
  *(_OWORD *)(v137 + 64) = 0u;
  *(_OWORD *)(v137 + 80) = 0u;
  *(_QWORD *)(v137 + 96) = (int)v248;
  *(_QWORD *)(v137 + 104) = (int)v247;
  *(_QWORD *)(v137 + 112) = 0x41700000C0A00000;
  *(_DWORD *)(v137 + 120) = v107;
  *(_DWORD *)(v137 + 124) = v108;
  *(_DWORD *)(v137 + 128) = v110;
  *(_DWORD *)(v137 + 132) = v112;
  *(_DWORD *)(v137 + 136) = v114;
  *(_DWORD *)(v137 + 140) = v116;
  *(_DWORD *)(v137 + 144) = v246;
  *(_DWORD *)(v137 + 148) = v243;
  *(_DWORD *)(v137 + 152) = v241;
  *(_DWORD *)(v137 + 156) = v240;
  *(_DWORD *)(v137 + 160) = v239;
  *(int32x2_t *)(v137 + 164) = pixelFormatTypeb;
  *(_DWORD *)(v137 + 172) = v238;
  *(_DWORD *)(v137 + 176) = v134;
  *(_DWORD *)(v137 + 180) = v136;
  *(_DWORD *)(v137 + 184) = 0;
  *(_BYTE *)(v137 + 188) = v122;
  *(_QWORD *)(v137 + 208) = 0;
  *(_QWORD *)(v137 + 216) = 0;
  *(_QWORD *)(v137 + 224) = 0;
  if (v108 != -1)
  {
    if (v108 <= -2)
      goto LABEL_109;
    v138 = 4 * (v108 + 1);
    v139 = (char *)operator new(v138);
    *(_QWORD *)(v137 + 208) = v139;
    v140 = &v139[v138];
    *(_QWORD *)(v137 + 224) = &v139[v138];
    bzero(v139, v138);
    *(_QWORD *)(v137 + 216) = v140;
  }
  *(_QWORD *)(v137 + 232) = 0;
  *(_QWORD *)(v137 + 240) = 0;
  *(_DWORD *)(v137 + 248) = 2143289344;
  v141 = (_QWORD *)(v137 + 256);
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend(v142, "integerForKey:", CFSTR("kCVAFusionProperty_invalidShiftRatioStatsWindowSize"));

  if (v143 != (int)v143)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v143, 0x80000000, 0x7FFFFFFF);
    *v141 = 0;
    *(_QWORD *)(v137 + 264) = 0;
    v144 = 1;
    *(_QWORD *)(v137 + 272) = 0;
LABEL_86:
    v145 = 4 * v144;
    v146 = (char *)operator new(4 * v144);
    *(_QWORD *)(v137 + 256) = v146;
    v147 = &v146[v145];
    *(_QWORD *)(v137 + 272) = &v146[v145];
    bzero(v146, v145);
    *(_QWORD *)(v137 + 264) = v147;
    goto LABEL_87;
  }
  *v141 = 0;
  *(_QWORD *)(v137 + 264) = 0;
  *(_QWORD *)(v137 + 272) = 0;
  LODWORD(v144) = v143 + 1;
  if ((_DWORD)v143 != -1)
  {
    if ((int)v143 > -2)
    {
      v144 = (int)v144;
      goto LABEL_86;
    }
LABEL_109:
    abort();
  }
LABEL_87:
  *(_QWORD *)(v137 + 280) = 0;
  *(_QWORD *)(v137 + 288) = 0;
  *(_DWORD *)(v137 + 296) = 2143289344;
  bzero((void *)(v137 + 304), 0x400uLL);
  *(int32x2_t *)(v137 + 1332) = vrev64_s32(pixelFormatTypeb);
  *(_DWORD *)(v137 + 1340) = v238;
  *(_DWORD *)(v137 + 1344) = -1082130432;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "floatForKey:", CFSTR("kCVAFusionProperty_invalidShiftRatioUpdateRate"));
  v150 = v149;

  *(_DWORD *)(v137 + 1352) = v150;
  CVPixelBufferCreate(0, *(_QWORD *)(v137 + 96), *(_QWORD *)(v137 + 104), 0x4C303038u, 0, (CVPixelBufferRef *)(v137 + 192));
  CVPixelBufferCreate(0, *(_QWORD *)(v137 + 96), *(_QWORD *)(v137 + 104), 0x4C303038u, 0, (CVPixelBufferRef *)(v137 + 200));
  v151 = *((_QWORD *)v14 + 44);
  *((_QWORD *)v14 + 44) = v137;
  if (v151)
  {
    v152 = sub_1B56752A8(v151);
    MEMORY[0x1B5E4DE7C](v152, 0x10A0C401CF549CELL);
  }
  v153 = operator new();
  *(_QWORD *)v153 = 0;
  *(_DWORD *)(v153 + 8) = 2139095040;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "floatForKey:", CFSTR("kCVAVideoMattingProperty_focusMachineVariationThreshold"));
  v156 = v155;

  *(_DWORD *)(v153 + 12) = v156;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "floatForKey:", CFSTR("kCVAVideoMattingProperty_focusMachineMinFastFrames"));
  v159 = v158;

  *(_DWORD *)(v153 + 16) = v159;
  v160 = *((_QWORD *)v14 + 45);
  *((_QWORD *)v14 + 45) = v153;
  if (v160)
    MEMORY[0x1B5E4DE7C](v160, 0x1000C40A86A77D5);
  objc_msgSend(*((id *)v14 + 3), "stageLightStateMachineIntensityIncrement");
  v162 = v161;
  objc_msgSend(*((id *)v14 + 3), "stageLightStageMachineMaxOrientationDifference");
  v164 = v163;
  objc_msgSend(*((id *)v14 + 3), "backgroundSeparationLikelihoodLow");
  v166 = v165;
  v167 = operator new();
  *(_DWORD *)v167 = v162;
  *(_DWORD *)(v167 + 4) = -1082130432;
  *(_QWORD *)(v167 + 8) = v164;
  *(_DWORD *)(v167 + 16) = v166;
  *(_DWORD *)(v167 + 20) = 0;
  *(_QWORD *)(v167 + 24) = 0x3FF0000000000000;
  *(_QWORD *)(v167 + 32) = 0;
  *(_QWORD *)(v167 + 40) = 0;
  *(_QWORD *)(v167 + 48) = 0;
  v168 = *((_QWORD *)v14 + 46);
  *((_QWORD *)v14 + 46) = v167;
  if (v168)
    MEMORY[0x1B5E4DE7C](v168, 0x1000C4021716A34);
  objc_msgSend(*((id *)v14 + 3), "sdofStateMachineIntensityIncrement");
  v170 = v169;
  objc_msgSend(*((id *)v14 + 3), "sdofStateMachineMaxOrientationDifference");
  v172 = v171;
  v173 = operator new();
  *(_DWORD *)v173 = v170;
  *(_DWORD *)(v173 + 4) = -1082130432;
  *(_QWORD *)(v173 + 8) = v172;
  *(_DWORD *)(v173 + 16) = 1065353216;
  *(_QWORD *)(v173 + 24) = 0x3FF0000000000000;
  *(_QWORD *)(v173 + 32) = 0;
  *(_QWORD *)(v173 + 40) = 0;
  *(_QWORD *)(v173 + 48) = 0;
  v174 = *((_QWORD *)v14 + 47);
  *((_QWORD *)v14 + 47) = v173;
  if (v174)
    MEMORY[0x1B5E4DE7C](v174, 0x1000C4095CF6A33);
  v14[80] = v14[34];
  *((_DWORD *)v14 + 21) = objc_msgSend(*((id *)v14 + 3), "colorPixelBufferWidth");
  *((_DWORD *)v14 + 22) = objc_msgSend(*((id *)v14 + 3), "colorPixelBufferHeight");
  *((_DWORD *)v14 + 23) = objc_msgSend(*((id *)v14 + 3), "outputDisparityPixelBufferWidth");
  *((_DWORD *)v14 + 24) = objc_msgSend(*((id *)v14 + 3), "outputDisparityPixelBufferHeight");
  *((_DWORD *)v14 + 25) = objc_msgSend(*((id *)v14 + 3), "alphaMattePixelBufferWidth");
  *((_DWORD *)v14 + 26) = objc_msgSend(*((id *)v14 + 3), "alphaMattePixelBufferHeight");
  *((_DWORD *)v14 + 27) = objc_msgSend(*((id *)v14 + 3), "guidedFilterWidth");
  *((_DWORD *)v14 + 28) = objc_msgSend(*((id *)v14 + 3), "guidedFilterHeight");
  objc_msgSend(*((id *)v14 + 3), "guidedFilterUnconfidentWeight");
  *((_DWORD *)v14 + 31) = v175;
  objc_msgSend(*((id *)v14 + 3), "guidedFilterMinDistToDeweight");
  *((_DWORD *)v14 + 32) = v176;
  objc_msgSend(*((id *)v14 + 3), "referenceDisparity");
  *((_DWORD *)v14 + 30) = v177;
  objc_msgSend(*((id *)v14 + 3), "alphaMaxLaplacian");
  *((_DWORD *)v14 + 33) = v178;
  objc_msgSend(*((id *)v14 + 3), "alphaContrastExponent");
  *((_DWORD *)v14 + 34) = v179;
  objc_msgSend(*((id *)v14 + 3), "disparityFilterColorStd");
  *((_DWORD *)v14 + 35) = v180;
  objc_msgSend(*((id *)v14 + 3), "disparityFilterUpdateRate");
  *((_DWORD *)v14 + 36) = v181;
  objc_msgSend(*((id *)v14 + 3), "minimumConfidenceToKeepDisparity");
  *((_DWORD *)v14 + 37) = v182;
  objc_msgSend(*((id *)v14 + 3), "maximumSimilarityToKeepDisparity");
  *((_DWORD *)v14 + 38) = v183;
  objc_msgSend(*((id *)v14 + 3), "maxDisparityFillingInconsistency");
  *((_DWORD *)v14 + 39) = v184;
  objc_msgSend(*((id *)v14 + 3), "maxDisparityFillingDistFromForeground");
  *((_DWORD *)v14 + 40) = v185;
  *((_DWORD *)v14 + 41) = objc_msgSend(*((id *)v14 + 3), "maxDistToPushDisparityEdgesFwd");
  *((_DWORD *)v14 + 42) = objc_msgSend(*((id *)v14 + 3), "maxDistToPushDisparityEdgesRev");
  *((_DWORD *)v14 + 43) = objc_msgSend(*((id *)v14 + 3), "disparityPushingBackgroundToForegroundDisparityDifference");
  objc_msgSend(*((id *)v14 + 3), "foregroundMaskDilationRadius");
  *((_DWORD *)v14 + 44) = v186;
  objc_msgSend(*((id *)v14 + 3), "infConvolutionDownsampling");
  *((_DWORD *)v14 + 45) = v187;
  objc_msgSend(*((id *)v14 + 3), "laplacianLimitingDownsampling");
  *((_DWORD *)v14 + 46) = v188;
  objc_msgSend(*((id *)v14 + 3), "laplacianLimitingBlurSize");
  *((_DWORD *)v14 + 47) = v189;
  objc_msgSend(*((id *)v14 + 3), "mattingUpdateRate");
  *((_DWORD *)v14 + 70) = v190;
  objc_msgSend(*((id *)v14 + 3), "mattingUpdateRateFast");
  *((_DWORD *)v14 + 71) = v191;
  objc_msgSend(*((id *)v14 + 3), "alphaCoeffFilterColorStd");
  *((_DWORD *)v14 + 72) = v192;
  objc_msgSend(*((id *)v14 + 3), "alphaCoeffFilterColorStdFast");
  *((_DWORD *)v14 + 73) = v193;
  *((_DWORD *)v14 + 48) = *((_DWORD *)v14 + 70);
  objc_msgSend(*((id *)v14 + 3), "deltaCanonicalDisparity");
  *((_DWORD *)v14 + 49) = v194;
  objc_msgSend(*((id *)v14 + 3), "deltaCanonicalDisparity");
  *((_DWORD *)v14 + 58) = v195;
  objc_msgSend(*((id *)v14 + 3), "alphaGammaExponent");
  *((_DWORD *)v14 + 51) = v196;
  objc_msgSend(*((id *)v14 + 3), "focusThresholdHardness");
  *((_DWORD *)v14 + 54) = v197;
  if ((_DWORD)v253)
    v198 = (_DWORD)v253 == 3;
  else
    v198 = 1;
  v199 = v198;
  v14[56] = BYTE4(v253) & v199;
  objc_msgSend(*((id *)v14 + 3), "faceSizeRatioInFocus");
  *((_DWORD *)v14 + 15) = v200;
  v14[64] = (_DWORD)v253 == 0;
  v201 = 10.0;
  if (!(_DWORD)v253)
    v201 = 0.0;
  *((float *)v14 + 18) = v201;
  v14[76] = (_DWORD)v253 == 1;
  *((_DWORD *)v14 + 75) = sub_1B569090C(CFSTR("overlayShiftOnRendering"), CFSTR("com.apple.coremedia"), 0);
  *((_DWORD *)v14 + 76) = sub_1B569090C(CFSTR("displaySDoFPreviewTime"), CFSTR("com.apple.coremedia"), 0);
  v14[296] = 1;
  *((_DWORD *)v14 + 77) = sub_1B569090C(CFSTR("noiseBits"), CFSTR("com.apple.coremedia"), 0xFFFFFFFFLL);
  *((_DWORD *)v14 + 78) = sub_1B569090C(CFSTR("fNumber_tenths"), CFSTR("com.apple.coremedia"), 0xFFFFFFFFLL);
  v14[316] = sub_1B569090C(CFSTR("bypassPreviewGPUProcessing"), CFSTR("com.apple.coremedia"), 0) != 0;
  v14[317] = sub_1B569090C(CFSTR("bypassPreviewCPUProcessing"), CFSTR("com.apple.coremedia"), 0) != 0;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v14[524] = objc_msgSend(v202, "BOOLForKey:", CFSTR("CVAPhotoLogTransition"));

  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v14[525] = objc_msgSend(v203, "BOOLForKey:", CFSTR("CVAPhotoLogTransitionPrintTrivial01"));

  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)v14 + 130) = objc_msgSend(v204, "integerForKey:", CFSTR("CVAPhotoGPUCaptureFrameNumber"));

  *((_DWORD *)v14 + 110) = 2143289344;
  objc_msgSend(MEMORY[0x1E0CC6A48], "sharedCaptureManager");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = objc_msgSend(v205, "newCaptureScopeWithCommandQueue:", *((_QWORD *)v14 + 59));
  v207 = (void *)*((_QWORD *)v14 + 62);
  *((_QWORD *)v14 + 62) = v206;

  objc_msgSend(*((id *)v14 + 62), "setLabel:", CFSTR("CVAPortraitVideoPipeline"));
  v208 = v14 + 464;
  if (!sub_1B569090C(CFSTR("harvesting.enabled"), CFSTR("com.apple.coremedia"), 0))
  {
    +[CVAVideoPipelineLibrarySPI identifyGPU:](CVAVideoPipelineLibrarySPI, "identifyGPU:", *v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    v210 = (void *)*v208;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/System/Library/PrivateFrameworks/AppleCVAPhoto.framework/Resources/"), v209);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = objc_msgSend(v210, "newPipelineLibraryWithFilePath:error:", v211, 0);
    v213 = (void *)*((_QWORD *)v14 + 61);
    *((_QWORD *)v14 + 61) = v212;

  }
  v214 = [VideoMattingMetal alloc];
  objc_msgSend(*((id *)v14 + 3), "renderingDisparityUpdateRate");
  v216 = v215;
  objc_msgSend(*((id *)v14 + 3), "renderingDisparityBlurRadius");
  v218 = v217;
  objc_msgSend(*((id *)v14 + 3), "renderingLensFocalLength");
  LODWORD(v220) = v219;
  LODWORD(v221) = v216;
  LODWORD(v222) = v218;
  v223 = -[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:](v214, "initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:", v14 + 80, (_DWORD)v253 == 1, v14 + 464, v233, v221, v222, v220);
  v224 = (void *)*((_QWORD *)v14 + 48);
  *((_QWORD *)v14 + 48) = v223;

  v227 = (void *)*((_QWORD *)v14 + 48);
  if (v227)
  {
    LODWORD(v225) = *((_DWORD *)v14 + 34);
    LODWORD(v226) = *((_DWORD *)v14 + 51);
    objc_msgSend(v227, "setAlphaLut:gammaExponent:", v225, v226);
    objc_msgSend(*((id *)v14 + 48), "setBypassShiftCleanup:", (_DWORD)v253 == 2);
    *((_DWORD *)v14 + 115) = 2139095040;
    v228 = -[VideoRelightingMetal initWithMetalContext:]([VideoRelightingMetal alloc], "initWithMetalContext:", v14 + 464);
    v229 = (void *)*((_QWORD *)v14 + 49);
    *((_QWORD *)v14 + 49) = v228;

    v230 = -[CVAFilterAlphaBlend initWithMetalContext:]([CVAFilterAlphaBlend alloc], "initWithMetalContext:", v14 + 464);
    v231 = (void *)*((_QWORD *)v14 + 50);
    *((_QWORD *)v14 + 50) = v230;

    v17 = v14;
  }
  else
  {
    v17 = 0;
  }
  v13 = v234;
  v12 = v235;
LABEL_19:

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_untransformedCanonicalDisparityPixelBuffer);
  CVPixelBufferPoolRelease(self->_canonicalDisparityPixelBufferPool);
  v3.receiver = self;
  v3.super_class = (Class)CVAPortraitVideoPipeline_Impl;
  -[CVAPortraitVideoPipeline_Impl dealloc](&v3, sel_dealloc);
}

- (void)setVideoPipelineProperties:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  int v18;
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
  float v34;
  float v35;
  float v36;
  int v37;
  int v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  char v48;
  id v49;
  CVAVideoPipelinePropertiesSPI *v50;
  CVAVideoPipelinePropertiesSPI *properties;
  uint64_t v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  BOOL v74;
  float v75;
  float v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  uint8_t buf[4];
  id v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF1337C0))
    v6 = v5;
  else
    v6 = 0;
  v7 = objc_msgSend(v5, "colorPixelBufferWidth");
  if (v7 != -[CVAVideoPipelinePropertiesSPI colorPixelBufferWidth](self->_properties, "colorPixelBufferWidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1029, CFSTR("Dynamic resolution change is unsupported"));

  }
  v8 = objc_msgSend(v5, "colorPixelBufferHeight");
  if (v8 != -[CVAVideoPipelinePropertiesSPI colorPixelBufferHeight](self->_properties, "colorPixelBufferHeight"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1031, CFSTR("Dynamic resolution change is unsupported"));

  }
  v9 = objc_msgSend(v5, "alphaMattePixelBufferWidth");
  if (v9 != -[CVAVideoPipelinePropertiesSPI alphaMattePixelBufferWidth](self->_properties, "alphaMattePixelBufferWidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1033, CFSTR("Dynamic resolution change is unsupported"));

  }
  v10 = objc_msgSend(v5, "alphaMattePixelBufferHeight");
  if (v10 != -[CVAVideoPipelinePropertiesSPI alphaMattePixelBufferHeight](self->_properties, "alphaMattePixelBufferHeight"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1035, CFSTR("Dynamic resolution change is unsupported"));

  }
  v11 = objc_msgSend(v5, "inputDisparityPixelBufferWidth");
  if (v11 != -[CVAVideoPipelinePropertiesSPI inputDisparityPixelBufferWidth](self->_properties, "inputDisparityPixelBufferWidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1037, CFSTR("Dynamic resolution change is unsupported"));

  }
  v12 = objc_msgSend(v5, "inputDisparityPixelBufferHeight");
  if (v12 != -[CVAVideoPipelinePropertiesSPI inputDisparityPixelBufferHeight](self->_properties, "inputDisparityPixelBufferHeight"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1039, CFSTR("Dynamic resolution change is unsupported"));

  }
  v13 = objc_msgSend(v5, "outputDisparityPixelBufferWidth");
  if (v13 != -[CVAVideoPipelinePropertiesSPI outputDisparityPixelBufferWidth](self->_properties, "outputDisparityPixelBufferWidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1041, CFSTR("Dynamic resolution change is unsupported"));

  }
  v14 = objc_msgSend(v5, "outputDisparityPixelBufferHeight");
  if (v14 == -[CVAVideoPipelinePropertiesSPI outputDisparityPixelBufferHeight](self->_properties, "outputDisparityPixelBufferHeight"))
  {
    if (!v6)
    {
LABEL_48:
      v52 = sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice"));
      -[CVAVideoPipelinePropertiesSPI guidedFilterUnconfidentWeight](self->_properties, "guidedFilterUnconfidentWeight");
      self->_vmStaticParams.guidedFilterUnconfidentWeight = v53;
      -[CVAVideoPipelinePropertiesSPI guidedFilterMinDistToDeweight](self->_properties, "guidedFilterMinDistToDeweight");
      self->_vmStaticParams.guidedFilterMinDistToDeweight = v54;
      -[CVAVideoPipelinePropertiesSPI referenceDisparity](self->_properties, "referenceDisparity");
      self->_vmStaticParams.referenceShift = v55;
      -[CVAVideoPipelinePropertiesSPI alphaMaxLaplacian](self->_properties, "alphaMaxLaplacian");
      self->_vmStaticParams.alphaMaxLaplacian = v56;
      -[CVAVideoPipelinePropertiesSPI alphaContrastExponent](self->_properties, "alphaContrastExponent");
      self->_vmStaticParams.alphaContrastExponent = v57;
      -[CVAVideoPipelinePropertiesSPI disparityFilterColorStd](self->_properties, "disparityFilterColorStd");
      self->_vmStaticParams.shiftFilterColorStd = v58;
      -[CVAVideoPipelinePropertiesSPI disparityFilterUpdateRate](self->_properties, "disparityFilterUpdateRate");
      self->_vmStaticParams.shiftFilterUpdateRate = v59;
      -[CVAVideoPipelinePropertiesSPI minimumConfidenceToKeepDisparity](self->_properties, "minimumConfidenceToKeepDisparity");
      self->_vmStaticParams.minimumConfidenceToKeepDisparity = v60;
      -[CVAVideoPipelinePropertiesSPI maximumSimilarityToKeepDisparity](self->_properties, "maximumSimilarityToKeepDisparity");
      self->_vmStaticParams.maximumSimilarityToKeepDisparity = v61;
      -[CVAVideoPipelinePropertiesSPI maxDisparityFillingInconsistency](self->_properties, "maxDisparityFillingInconsistency");
      self->_vmStaticParams.maxShiftFillingInconsistency = v62;
      -[CVAVideoPipelinePropertiesSPI maxDisparityFillingDistFromForeground](self->_properties, "maxDisparityFillingDistFromForeground");
      self->_vmStaticParams.maxShiftFillingDistFromFg = v63;
      self->_vmStaticParams.maxDistToPushShiftEdgesFwd = -[CVAVideoPipelinePropertiesSPI maxDistToPushDisparityEdgesFwd](self->_properties, "maxDistToPushDisparityEdgesFwd");
      self->_vmStaticParams.maxDistToPushShiftEdgesRev = -[CVAVideoPipelinePropertiesSPI maxDistToPushDisparityEdgesRev](self->_properties, "maxDistToPushDisparityEdgesRev");
      self->_vmStaticParams.shiftPushingBgToFgShiftDifference = -[CVAVideoPipelinePropertiesSPI disparityPushingBackgroundToForegroundDisparityDifference](self->_properties, "disparityPushingBackgroundToForegroundDisparityDifference");
      -[CVAVideoPipelinePropertiesSPI foregroundMaskDilationRadius](self->_properties, "foregroundMaskDilationRadius");
      self->_vmStaticParams.foregroundMaskDilationRadius = v64;
      -[CVAVideoPipelinePropertiesSPI infConvolutionDownsampling](self->_properties, "infConvolutionDownsampling");
      self->_vmStaticParams.infConvolutionDownsampling = v65;
      -[CVAVideoPipelinePropertiesSPI mattingUpdateRate](self->_properties, "mattingUpdateRate");
      self->_vmDynamicMetaParams.mattingCoeffUpdateRate = v66;
      -[CVAVideoPipelinePropertiesSPI mattingUpdateRateFast](self->_properties, "mattingUpdateRateFast");
      self->_vmDynamicMetaParams.mattingCoeffUpdateRateFast = v67;
      -[CVAVideoPipelinePropertiesSPI alphaCoeffFilterColorStd](self->_properties, "alphaCoeffFilterColorStd");
      self->_vmDynamicMetaParams.mattingCoeffColorStd = v68;
      -[CVAVideoPipelinePropertiesSPI alphaCoeffFilterColorStdFast](self->_properties, "alphaCoeffFilterColorStdFast");
      self->_vmDynamicMetaParams.mattingCoeffColorStdFast = v69;
      self->_vmDynamicParams.updateRate = self->_vmDynamicMetaParams.mattingCoeffUpdateRate;
      -[CVAVideoPipelinePropertiesSPI deltaCanonicalDisparity](self->_properties, "deltaCanonicalDisparity");
      self->_vmDynamicParams.sdofDeltaCanonicalDisparity = v70;
      -[CVAVideoPipelinePropertiesSPI deltaCanonicalDisparity](self->_properties, "deltaCanonicalDisparity");
      self->_vmDynamicParams.alphaMatteDeltaCanonicalDisparity = v71;
      -[CVAVideoPipelinePropertiesSPI alphaGammaExponent](self->_properties, "alphaGammaExponent");
      self->_vmDynamicParams.alphaGammaExponent = v72;
      -[CVAVideoPipelinePropertiesSPI focusThresholdHardness](self->_properties, "focusThresholdHardness");
      self->_vmDynamicParams.thresholdHardness = v73;
      v74 = BYTE4(v52) & ((_DWORD)v52 == 0);
      if ((_DWORD)v52 == 3)
        v74 = 1;
      self->_vmPostprocessingParams.useFaceAsFocus = v74;
      -[CVAVideoPipelinePropertiesSPI faceSizeRatioInFocus](self->_properties, "faceSizeRatioInFocus");
      self->_vmPostprocessingParams.faceSizeRatioInFocus = v75;
      self->_vmPostprocessingParams.fillLargeHolesWithBackground = (_DWORD)v52 == 0;
      v76 = 10.0;
      if (!(_DWORD)v52)
        v76 = 0.0;
      self->_vmPostprocessingParams.backgroundFillMarginFromValidDisparity_px = v76;
      self->_vmPostprocessingParams.useTemporalRejection = (_DWORD)v52 == 1;
      goto LABEL_56;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1043, CFSTR("Dynamic resolution change is unsupported"));

    if (!v6)
      goto LABEL_48;
  }
  objc_msgSend(v6, "backgroundDisparityUpdateRate");
  v16 = v15;
  -[CVAVideoPipelinePropertiesSPI backgroundDisparityUpdateRate](self->_properties, "backgroundDisparityUpdateRate");
  if (v16 != v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1051, CFSTR("Dynamic change to backgroundDisparityUpdateRate is unsupported"));

  }
  v18 = objc_msgSend(v6, "backgroundDisparityStatsWindowSize");
  if (v18 != -[CVAVideoPipelinePropertiesSPI backgroundDisparityStatsWindowSize](self->_properties, "backgroundDisparityStatsWindowSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1053, CFSTR("Dynamic change to backgroundDisparityStatsWindowSize is unsupported"));

  }
  objc_msgSend(v6, "minDeltaCanonicalDisparity");
  v20 = v19;
  -[CVAVideoPipelinePropertiesSPI minDeltaCanonicalDisparity](self->_properties, "minDeltaCanonicalDisparity");
  if (v20 != v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1055, CFSTR("Dynamic change to minDeltaCanonicalDisparity is unsupported"));

  }
  objc_msgSend(v6, "maxDeltaCanonicalDisparity");
  v23 = v22;
  -[CVAVideoPipelinePropertiesSPI maxDeltaCanonicalDisparity](self->_properties, "maxDeltaCanonicalDisparity");
  if (v23 != v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1057, CFSTR("Dynamic change to maxDeltaCanonicalDisparity is unsupported"));

  }
  objc_msgSend(v6, "dsCanonicalLowThld");
  v26 = v25;
  -[CVAVideoPipelinePropertiesSPI dsCanonicalLowThld](self->_properties, "dsCanonicalLowThld");
  if (v26 != v27)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1059, CFSTR("Dynamic change to dsCanonicalLowThld is unsupported"));

  }
  objc_msgSend(v6, "dsCanonicalLowScale");
  v29 = v28;
  -[CVAVideoPipelinePropertiesSPI dsCanonicalLowScale](self->_properties, "dsCanonicalLowScale");
  if (v29 != v30)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1061, CFSTR("Dynamic change to dsCanonicalLowScale is unsupported"));

  }
  objc_msgSend(v6, "dsCanonicalHighThld");
  v32 = v31;
  -[CVAVideoPipelinePropertiesSPI dsCanonicalHighThld](self->_properties, "dsCanonicalHighThld");
  if (v32 != v33)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1063, CFSTR("Dynamic change to dsCanonicalHighThld is unsupported"));

  }
  objc_msgSend(v6, "dsCanonicalHighScale");
  v35 = v34;
  -[CVAVideoPipelinePropertiesSPI dsCanonicalHighScale](self->_properties, "dsCanonicalHighScale");
  if (v35 != v36)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1065, CFSTR("Dynamic change to dsCanonicalHighScale is unsupported"));

  }
  v37 = objc_msgSend(v6, "depthPixelBufferXPadding");
  if (v37 != -[CVAVideoPipelinePropertiesSPI depthPixelBufferXPadding](self->_properties, "depthPixelBufferXPadding"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1067, CFSTR("Dynamic change to depthPixelBufferXPadding is unsupported"));

  }
  v38 = objc_msgSend(v6, "depthPixelBufferYPadding");
  if (v38 != -[CVAVideoPipelinePropertiesSPI depthPixelBufferYPadding](self->_properties, "depthPixelBufferYPadding"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1069, CFSTR("Dynamic change to depthPixelBufferYPadding is unsupported"));

  }
  objc_msgSend(v6, "foregroundPercentile");
  v40 = v39;
  -[CVAVideoPipelinePropertiesSPI foregroundPercentile](self->_properties, "foregroundPercentile");
  if (v40 != v41)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1071, CFSTR("Dynamic change to foregroundPercentile is unsupported"));

  }
  objc_msgSend(v6, "closeDisparityPercentile");
  v43 = v42;
  -[CVAVideoPipelinePropertiesSPI closeDisparityPercentile](self->_properties, "closeDisparityPercentile");
  if (v43 != v44)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1073, CFSTR("Dynamic change to closeDisparityPercentile is unsupported"));

  }
  objc_msgSend(v6, "deltaDepth");
  v46 = v45;
  -[CVAVideoPipelinePropertiesSPI deltaDepth](self->_properties, "deltaDepth");
  if (v46 != v47)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAVideoPipeline.mm"), 1075, CFSTR("Dynamic change to deltaDepth is unsupported"));

  }
  v98 = 0;
  v48 = objc_msgSend(v6, "validateWithError:", &v98);
  v49 = v98;
  if ((v48 & 1) != 0)
  {
    v50 = (CVAVideoPipelinePropertiesSPI *)objc_msgSend(v6, "copy");
    properties = self->_properties;
    self->_properties = v50;

    goto LABEL_48;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v100 = v49;
    _os_log_fault_impl(&dword_1B5656000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
  }

LABEL_56:
}

- (CVAVideoPipelineProperties)videoPipelineProperties
{
  return (CVAVideoPipelineProperties *)(id)-[CVAVideoPipelinePropertiesSPI copy](self->_properties, "copy");
}

- (BOOL)validateSegmentationPixelBuffer:(__CVBuffer *)a3 matchFormat:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t PixelFormatType;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a4;
  if (a3)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PixelFormatType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "containsObject:", v9);
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PixelFormatType);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Unexpected pixel format for inputSegmentation. Supported formats: %@ was %@"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateSegmentationPixelBuffer:matchFormat:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1174, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B5658D40(v10 ^ 1u, a5, 0, 4294944393, v15);

  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)validateDisparityPostprocessingRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  size_t Width;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  size_t Height;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  size_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  size_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  OSType PixelFormatType;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  size_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  size_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  OSType v75;
  void *v76;
  void *v77;
  void *v78;
  BOOL v79;
  double v81;
  double v82;
  double v83;
  _BOOL8 v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;

  v6 = a3;
  v7 = objc_msgSend(v6, "sourceColorPixelBuffer");
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CVADisparityPostprocessingRequest.sourceColorPixelBuffer is nil"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1193, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v7 == 0, a4, 0, 4294944393, v10);

  if (!v7)
    goto LABEL_24;
  if (sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice")) == 2)
  {
    v11 = objc_msgSend(v6, "segmentationPixelBuffer");
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CVADisparityPostprocessingRequest.segmentationPixelBuffer is nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1204, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B5658D40(v11 == 0, a4, 0, 4294944393, v14);

    if (!v11)
      goto LABEL_24;
    objc_msgSend(v6, "focusTileData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CVADisparityPostprocessingRequest.focusTileData is nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1213, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B5658D40(v15 == 0, a4, 0, 4294944393, v18);

    if (!v15)
      goto LABEL_24;
  }
  else
  {
    if (sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice")) == 3)
    {
      v19 = objc_msgSend(v6, "networkDisparityPixelBuffer");
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CVADisparityPostprocessingRequest.networkDisparityPixelBuffer is nil"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1225, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1B5658D40(v19 == 0, a4, 0, 4294944393, v22);

      if (!v19)
        goto LABEL_24;
      v23 = objc_msgSend(v6, "segmentationPixelBuffer");
      v24 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CVADisparityPostprocessingRequest.segmentationPixelBuffer is nil"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1234, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1B5658D40(v23 == 0, a4, 0, 4294944393, v26);
    }
    else
    {
      v23 = objc_msgSend(v6, "fixedPointDisparityPixelBuffer");
      v27 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CVADisparityPostprocessingRequest.fixedPointDisparityPixelBuffer is nil"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1246, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1B5658D40(v23 == 0, a4, 0, 4294944393, v26);
    }

    if (!v23)
      goto LABEL_24;
  }
  v28 = objc_msgSend(v6, "destinationDisparityPixelBuffer");
  v29 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CVADisparityPostprocessingRequest.destinationDisparityPixelBuffer is nil"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1256, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v28 == 0, a4, 0, 4294944393, v31);

  if (v28)
  {
    v32 = -[CVAVideoPipelinePropertiesSPI colorPixelBufferWidth](self->_properties, "colorPixelBufferWidth");
    Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v6, "sourceColorPixelBuffer"));
    v34 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected width of srcColor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1267, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B5658D40(v32 != Width, a4, 0, 4294944393, v36);

    if (v32 == Width)
    {
      v37 = -[CVAVideoPipelinePropertiesSPI colorPixelBufferHeight](self->_properties, "colorPixelBufferHeight");
      Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v6, "sourceColorPixelBuffer"));
      v39 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected height of srcColor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1276, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1B5658D40(v37 != Height, a4, 0, 4294944393, v41);

      if (v37 == Height)
      {
        v42 = objc_msgSend(v6, "segmentationPixelBuffer");
        -[CVAVideoPipelinePropertiesSPI supportedInputSegmentationPixelBufferPixelFormats](self->_properties, "supportedInputSegmentationPixelBufferPixelFormats");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v42) = -[CVAPortraitVideoPipeline_Impl validateSegmentationPixelBuffer:matchFormat:error:](self, "validateSegmentationPixelBuffer:matchFormat:error:", v42, v43, a4);

        if ((v42 & 1) != 0)
        {
          if (sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice")) != 1&& sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice")))
          {
            goto LABEL_29;
          }
          v44 = -[CVAVideoPipelinePropertiesSPI inputDisparityPixelBufferWidth](self->_properties, "inputDisparityPixelBufferWidth");
          v45 = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v6, "fixedPointDisparityPixelBuffer"));
          v46 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected width of fixedPointDisparity: %zu != %zu"), -[CVAVideoPipelinePropertiesSPI inputDisparityPixelBufferWidth](self->_properties, "inputDisparityPixelBufferWidth"), CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v6, "fixedPointDisparityPixelBuffer")));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1294, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1B5658D40(v44 != v45, a4, 0, 4294944393, v48);

          if (v44 == v45)
          {
            v49 = -[CVAVideoPipelinePropertiesSPI inputDisparityPixelBufferHeight](self->_properties, "inputDisparityPixelBufferHeight");
            v50 = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v6, "fixedPointDisparityPixelBuffer"));
            v51 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected height of fixedPointDisparity"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1302, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1B5658D40(v49 != v50, a4, 0, 4294944393, v53);

            if (v49 == v50)
            {
              v54 = -[CVAVideoPipelinePropertiesSPI inputDisparityPixelBufferPixelFormat](self->_properties, "inputDisparityPixelBufferPixelFormat");
              PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v6, "fixedPointDisparityPixelBuffer"));
              v56 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected pixel format for fixedPointDisparity"));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1310, v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              sub_1B5658D40(v54 != PixelFormatType, a4, 0, 4294944393, v58);

              if (v54 == PixelFormatType)
              {
LABEL_29:
                v59 = -[CVAVideoPipelinePropertiesSPI outputDisparityPixelBufferWidth](self->_properties, "outputDisparityPixelBufferWidth");
                v60 = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v6, "destinationDisparityPixelBuffer"));
                v61 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected width of destinationDisparity"));
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1319, v62);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                sub_1B5658D40(v59 != v60, a4, 0, 4294944393, v63);

                if (v59 == v60)
                {
                  v64 = -[CVAVideoPipelinePropertiesSPI outputDisparityPixelBufferHeight](self->_properties, "outputDisparityPixelBufferHeight");
                  v65 = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v6, "destinationDisparityPixelBuffer"));
                  v66 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected height of destinationDisparity"));
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1327, v67);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  sub_1B5658D40(v64 != v65, a4, 0, 4294944393, v68);

                  if (v64 == v65)
                  {
                    -[CVAVideoPipelinePropertiesSPI supportedColorPixelBufferPixelFormats](self->_properties, "supportedColorPixelBufferPixelFormats");
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v6, "sourceColorPixelBuffer")));
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    v70 = objc_msgSend(v88, "containsObject:", v69);
                    v71 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected pixel format for srcColor"));
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1335, v72);
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    sub_1B5658D40(v70 ^ 1u, a4, 0, 4294944393, v73);

                    if ((v70 & 1) != 0)
                    {
                      v74 = -[CVAVideoPipelinePropertiesSPI outputDisparityPixelBufferPixelFormat](self->_properties, "outputDisparityPixelBufferPixelFormat");
                      v75 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v6, "destinationDisparityPixelBuffer"));
                      v76 = (void *)MEMORY[0x1E0CB3940];
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected pixel format for destinationDisparity"));
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v76, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1343, v77);
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      sub_1B5658D40(v74 != v75, a4, 0, 4294944393, v78);

                      if (v74 == v75)
                      {
                        objc_msgSend(v6, "sourceColorPixelBufferGravity");
                        objc_msgSend(v6, "sourceColorPixelBufferGravity");
                        v84 = sqrt(v81 * v81 + v82 * v82 + v83 * v83) <= 0.00000011920929;
                        v85 = (void *)MEMORY[0x1E0CB3940];
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Gravity vector should be NAN or have nonzero length"));
                        v86 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v85, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1352, v86);
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        sub_1B5658D40(v84, a4, 0, 4294944393, v87);

                        v79 = !v84;
                        goto LABEL_25;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_24:
  v79 = 0;
LABEL_25:

  return v79;
}

- (BOOL)validateMattingRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  size_t Width;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  size_t Height;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  int v33;
  OSType PixelFormatType;
  void *v35;
  void *v36;
  void *v37;

  v6 = a3;
  objc_msgSend(v6, "disparityPostprocessingRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CVAMattingRequest.disparityPostprocessingRequest is nil"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateMattingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1370, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v7 == 0, a4, 0, 4294944393, v10);

  if (!v7)
    goto LABEL_8;
  objc_msgSend(v6, "disparityPostprocessingRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:](self, "validateDisparityPostprocessingRequest:error:", v11, a4);

  if (!v12)
    goto LABEL_8;
  v13 = objc_msgSend(v6, "segmentationPixelBuffer");
  -[CVAVideoPipelinePropertiesSPI supportedInputSegmentationPixelBufferPixelFormats](self->_properties, "supportedInputSegmentationPixelBufferPixelFormats");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = -[CVAPortraitVideoPipeline_Impl validateSegmentationPixelBuffer:matchFormat:error:](self, "validateSegmentationPixelBuffer:matchFormat:error:", v13, v14, a4);

  if ((v13 & 1) == 0)
    goto LABEL_8;
  v15 = objc_msgSend(v6, "skinSegmentationPixelBuffer");
  -[CVAVideoPipelinePropertiesSPI supportedInputSegmentationPixelBufferPixelFormats](self->_properties, "supportedInputSegmentationPixelBufferPixelFormats");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = -[CVAPortraitVideoPipeline_Impl validateSegmentationPixelBuffer:matchFormat:error:](self, "validateSegmentationPixelBuffer:matchFormat:error:", v15, v16, a4);

  if ((v15 & 1) == 0)
    goto LABEL_8;
  v17 = objc_msgSend(v6, "destinationAlphaMattePixelBuffer");
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CVAMattingRequest.destinationAlphaMattePixelBuffer is nil"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateMattingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1399, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v17 == 0, a4, 0, 4294944393, v20);

  if (!v17)
    goto LABEL_8;
  v21 = -[CVAVideoPipelinePropertiesSPI alphaMattePixelBufferWidth](self->_properties, "alphaMattePixelBufferWidth");
  Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v6, "destinationAlphaMattePixelBuffer"));
  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected width of destinationAlpha"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateMattingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1409, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v21 != Width, a4, 0, 4294944393, v25);

  if (v21 != Width)
    goto LABEL_8;
  v26 = -[CVAVideoPipelinePropertiesSPI alphaMattePixelBufferHeight](self->_properties, "alphaMattePixelBufferHeight");
  Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v6, "destinationAlphaMattePixelBuffer"));
  v28 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected height of destinationAlpha"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateMattingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1417, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v26 != Height, a4, 0, 4294944393, v30);

  if (v26 == Height)
  {
    v33 = -[CVAVideoPipelinePropertiesSPI alphaMattePixelBufferPixelFormat](self->_properties, "alphaMattePixelBufferPixelFormat");
    PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v6, "destinationAlphaMattePixelBuffer"));
    v35 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected pixel format for destinationAlpha"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validateMattingRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1426, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B5658D40(v33 != PixelFormatType, a4, 0, 4294944393, v37);
    v31 = v33 == PixelFormatType;

  }
  else
  {
LABEL_8:
    v31 = 0;
  }

  return v31;
}

- (BOOL)validatePortraitRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  size_t Width;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  size_t Height;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  float v34;
  float v35;
  void *v36;
  void *v37;
  void *v38;
  float v39;
  float v40;
  void *v41;
  void *v42;
  void *v43;
  float v44;
  float v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  id v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  void *v60;
  void *v61;
  BOOL v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  void *v68;

  v6 = a3;
  objc_msgSend(v6, "mattingRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CVAPortraitRequest.mattingRequest is nil"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1458, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v7 == 0, a4, 0, 4294944393, v10);

  if (!v7)
    goto LABEL_35;
  objc_msgSend(v6, "mattingRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CVAPortraitVideoPipeline_Impl validateMattingRequest:error:](self, "validateMattingRequest:error:", v11, a4);

  if (!v12)
    goto LABEL_35;
  v13 = objc_msgSend(v6, "destinationColorPixelBuffer");
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CVAPortraitRequest.destinationColorPixelBuffer is nil"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1472, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v13 == 0, a4, 0, 4294944393, v16);

  if (!v13)
    goto LABEL_35;
  v17 = -[CVAVideoPipelinePropertiesSPI colorPixelBufferWidth](self->_properties, "colorPixelBufferWidth");
  Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v6, "destinationColorPixelBuffer"));
  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected width of destinationColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1483, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v17 != Width, a4, 0, 4294944393, v21);

  if (v17 != Width)
    goto LABEL_35;
  v22 = -[CVAVideoPipelinePropertiesSPI colorPixelBufferHeight](self->_properties, "colorPixelBufferHeight");
  Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v6, "destinationColorPixelBuffer"));
  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected height of destinationColor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1492, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v22 != Height, a4, 0, 4294944393, v26);

  if (v22 != Height)
    goto LABEL_35;
  -[CVAVideoPipelinePropertiesSPI supportedColorPixelBufferPixelFormats](self->_properties, "supportedColorPixelBufferPixelFormats");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v6, "destinationColorPixelBuffer")));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "containsObject:", v28);
  v30 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected pixel format for destinationColor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1502, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v29 ^ 1, a4, 0, 4294944393, v32);

  if ((v29 & 1) == 0)
    goto LABEL_35;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = v6;
    objc_msgSend(v33, "simulatedFocalRatio");
    v35 = v34;
    v36 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("simulatedFocalRatio outside allowable range"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1515, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B5658D40(v35 < 1.0, a4, 0, 4294944393, v38);

    if (v35 >= 1.0)
    {
      objc_msgSend(v33, "sourceColorGain");
      v40 = v39;
      v41 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("srcColorGain outside allowable range [0, inf)"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1523, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1B5658D40(v40 < 0.0, a4, 0, 4294944393, v43);

      if (v40 >= 0.0)
      {
        objc_msgSend(v33, "sourceColorLux");
        v45 = v44;
        v46 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("srcColorLux outside allowable range [0, inf)"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1531, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1B5658D40(v45 < 0.0, a4, 0, 4294944393, v48);

        if (v45 >= 0.0)
        {
          objc_msgSend(v33, "backgroundColorCube");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (v49)
          {
            objc_msgSend(v33, "backgroundColorCube");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = sub_1B566BB20(v67);
          }
          else
          {
            v50 = 1;
          }
          v63 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid background color cube data"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1539, v64);
          v29 = objc_claimAutoreleasedReturnValue();
          sub_1B5658D40(!v50, a4, 0, 4294944393, (void *)v29);

          if (v49)
          if (v50)
          {
            objc_msgSend(v33, "foregroundColorCube");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            if (v57)
            {
              objc_msgSend(v33, "foregroundColorCube");
              v29 = objc_claimAutoreleasedReturnValue();
              v58 = sub_1B566BB20((void *)v29);
            }
            else
            {
              v58 = 1;
            }
            v66 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid foreground color cube data"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1547, v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1B5658D40(!v58, a4, 0, 4294944393, v61);
LABEL_24:

            if (v57)
            if (v58)
              goto LABEL_27;
LABEL_35:
            v62 = 0;
            goto LABEL_36;
          }
        }
      }
    }
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = v6;
    v68 = v51;
    objc_msgSend(v51, "proxyCubeData");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(v51, "proxyCubeData");
      v29 = objc_claimAutoreleasedReturnValue();
      v53 = sub_1B566BB20((void *)v29);
    }
    else
    {
      v53 = 1;
    }
    v54 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid background color cube data"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1559, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B5658D40(!v53, a4, 0, 4294944393, v56);

    if (v52)
    v33 = v68;
    if (v53)
    {
      objc_msgSend(v68, "proxyCubeData");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (v57)
      {
        objc_msgSend(v68, "cubeData");
        v29 = objc_claimAutoreleasedReturnValue();
        v58 = sub_1B566BB20((void *)v29);
      }
      else
      {
        v58 = 1;
      }
      v59 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid background color cube data"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 1567, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1B5658D40(!v58, a4, 0, 4294944393, v61);
      goto LABEL_24;
    }
LABEL_34:

    goto LABEL_35;
  }
LABEL_27:
  v62 = 1;
LABEL_36:

  return v62;
}

- (id)internal_postprocessDisparityWithRequest:(id)a3 disparityPostprocessingCompletionHandler:(id)a4 isFinalStage:(BOOL)a5 status:(int *)a6
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  float *v14;
  double v15;
  float v16;
  double v17;
  float v18;
  float v19;
  float v20;
  char v21;
  int v22;
  float v23;
  float v24;
  float v25;
  float v26;
  int v27;
  float v28;
  float v29;
  char *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  float *v37;
  float *v38;
  DisparityConversion *value;
  GeometricTransformation *v40;
  const __CFAllocator *v41;
  __CVPixelBufferPool *canonicalDisparityPixelBufferPool;
  void (*v43)(uint64_t, CVPixelBufferRef, int, __CVBuffer *, float, float);
  void (*v44)(uint64_t, CVPixelBufferRef, __CVBuffer *);
  void (*v45)(uint64_t@<X0>, __CVBuffer *@<X1>, int@<W2>, _QWORD *@<X3>, uint64_t@<X8>, float@<S0>);
  uint64_t (*v46)(uint64_t, CVPixelBufferRef, uint64_t, float, float, float);
  unsigned __int8 v47;
  const __CFString *v48;
  const __CFString *v49;
  void *v50;
  float v51;
  void *v52;
  float v53;
  id v54;
  id v55;
  int v56;
  int v57;
  int v58;
  __int16 v59;
  __int16 v60;
  unsigned __int16 v61;
  unsigned __int16 v62;
  float v63;
  float v64;
  float v65;
  float v66;
  void *v67;
  __CVBuffer *v68;
  DisparityAutofocus *v69;
  _BYTE *v70;
  _BYTE *v71;
  size_t v72;
  void *v73;
  unsigned __int8 v74;
  void *v75;
  float v76;
  void *v77;
  float v78;
  __CVBuffer *v79;
  __CVBuffer *v80;
  __CVBuffer *untransformedCanonicalDisparityPixelBuffer;
  signed int v82;
  float32x2_t *BaseAddress;
  size_t Height;
  size_t Width;
  size_t BytesPerRow;
  char *v87;
  size_t v88;
  float *v89;
  float *v90;
  float v91;
  double v92;
  float v93;
  float v94;
  double v95;
  float v96;
  float v97;
  double v98;
  float v99;
  float v100;
  float v101;
  double v102;
  float v103;
  float v104;
  double v105;
  float v106;
  float v107;
  double v108;
  float v109;
  __CVBuffer *v110;
  void *v111;
  _BYTE *v112;
  _BYTE *v113;
  size_t v114;
  void *v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  float v127;
  unsigned __int8 v128;
  void *v129;
  float v130;
  void *v131;
  float v132;
  void *v133;
  float v134;
  void *v135;
  float v136;
  void *v137;
  float v138;
  uint64_t v139;
  int8x16_t *v140;
  float32x2_t *v141;
  float64x2_t v142;
  int8x16_t v148;
  float *v149;
  float *v150;
  float32x2_t *v151;
  int8x16_t *v152;
  unint64_t v153;
  float *v154;
  float *v155;
  size_t v156;
  float v157;
  float v158;
  int8x16_t v159;
  uint64_t v160;
  int8x16_t *v161;
  float32x2_t *v162;
  float64x2_t v163;
  int8x16_t v165;
  float32x2_t *v166;
  char *v167;
  unint64_t v168;
  float32x2_t *v169;
  int8x16_t *v170;
  unint64_t v171;
  int8x16_t v172;
  size_t v173;
  uint64_t v174;
  float *v175;
  float *v176;
  float v177;
  float v178;
  __CVBuffer *v179;
  size_t v180;
  size_t v181;
  char *v182;
  size_t v183;
  _BYTE *v184;
  size_t v185;
  unint64_t j;
  unint64_t k;
  char v190;
  __CVBuffer *v191;
  char *v192;
  size_t v193;
  size_t v194;
  size_t v195;
  size_t v196;
  size_t v197;
  size_t v198;
  size_t v199;
  unint64_t v200;
  uint64_t v201;
  double v202;
  double v203;
  double v204;
  double v205;
  int v206;
  unint64_t v207;
  char *v208;
  int64_t v209;
  uint64_t v210;
  uint64_t v211;
  unint64_t v212;
  int v213;
  unsigned int v214;
  uint64_t v215;
  size_t v216;
  unint64_t v217;
  uint64_t v218;
  char *v219;
  int v220;
  unint64_t v221;
  int v222;
  unsigned int v223;
  char *v224;
  uint64_t v225;
  uint64_t v226;
  unint64_t v227;
  unint64_t v228;
  uint64_t v229;
  unint64_t v230;
  unint64_t v231;
  unint64_t v232;
  uint64_t v233;
  unsigned int v234;
  unint64_t v235;
  uint64_t v236;
  char *v237;
  unint64_t v238;
  unint64_t v239;
  char *v240;
  size_t v241;
  void *v242;
  float v243;
  float v244;
  uint64_t v245;
  __int128 v246;
  int v247;
  unsigned __int8 v248;
  DisparityAutofocus *v249;
  int v250;
  DisparityAutofocus *v251;
  float v252;
  unsigned __int8 v253;
  int v254;
  DisparityAutofocus *v255;
  float v256;
  float v257;
  StageLightStateMachine *v258;
  int v259;
  int v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  float v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  double v269;
  float *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  SdofStateMachine *v274;
  int v275;
  int v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  double v284;
  float *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  void *v290;
  void *v291;
  double v292;
  _DWORD *v293;
  _DWORD *m;
  void *v295;
  _DWORD *v296;
  _DWORD *n;
  void *v298;
  void *v299;
  void *v300;
  CVADisparityPostprocessingResult_Impl *v301;
  uint64_t v302;
  CVPixelBufferRef v303;
  float focusCanonicalDisparity;
  int v305;
  uint64_t v306;
  double v307;
  uint64_t v308;
  void *v309;
  void *v310;
  double v311;
  double v312;
  double v313;
  double v314;
  double v315;
  double v316;
  double v317;
  double v318;
  CVADisparityPostprocessingResult_Impl *v319;
  NSObject *notificationQueue;
  VideoMattingMetal *vmAccelerator;
  CVPixelBufferRef v322;
  uint64_t v323;
  uint64_t v324;
  void *v325;
  OS_dispatch_queue *v326;
  MTLTexture *v327;
  MTLTexture *yuvSourceDownsampledAlias;
  CVADisparityPostprocessingResult_Impl *v329;
  void *v331;
  char v332;
  void *v333;
  char v334;
  void *v335;
  char v336;
  void *v337;
  char v338;
  uint64_t v339;
  uint64_t v340;
  __CVBuffer *v341;
  unsigned int v342;
  __CVBuffer *pixelBuffer;
  void (*v344)(uint64_t, CVPixelBufferRef, __CVBuffer *);
  GeometricTransformation *v345;
  void (*v346)(uint64_t@<X0>, __CVBuffer *@<X1>, int@<W2>, _QWORD *@<X3>, uint64_t@<X8>, float@<S0>);
  size_t v347;
  char *v348;
  int v349;
  size_t v350;
  uint64_t (*v351)(uint64_t, CVPixelBufferRef, uint64_t, float, float, float);
  unsigned __int16 v352;
  size_t v353;
  char *v354;
  void (*v355)(CVPixelBufferRef@<X1>, float *@<X0>, int@<W2>, uint64_t@<X8>);
  unsigned __int16 v357;
  size_t v358;
  unint64_t v359;
  DisparityStatistics *v360;
  float *v361;
  id v363;
  float v364;
  unsigned __int16 *v365;
  DisparityConversion *v366;
  char *v367;
  id v368;
  void *v369;
  _QWORD v370[4];
  id v371;
  CVADisparityPostprocessingResult_Impl *v372;
  id v373;
  _QWORD block[4];
  id v375;
  CVADisparityPostprocessingResult_Impl *v376;
  id v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  char v382[24];
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  char v387[24];
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  char v392[24];
  void *v393;
  void *v394;
  void *__p;
  void *v396;
  char v397[24];
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  __int128 v402;
  double v403;
  double v404;
  uint64_t v405;
  int v406;
  void *v407[2];
  void *v408[2];
  __int128 v409;
  float v410;
  float v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  void *v416;
  float *v417;
  float *v418;
  CVPixelBufferRef pixelBufferOut;
  _BYTE v420[24];
  uint64_t v421;
  _BYTE v422[128];
  uint64_t v423;

  v423 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v363 = a4;
  pixelBufferOut = 0;
  v417 = 0;
  v416 = 0;
  v418 = 0;
  v369 = v8;
  objc_msgSend(v8, "facesArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v414 = 0u;
    v415 = 0u;
    v412 = 0u;
    v413 = 0u;
    objc_msgSend(v8, "facesArray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v412, v422, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v413;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v413 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v412 + 1) + 8 * i), "getValue:size:", &v402, 32);
          v15 = *(double *)&v402;
          v16 = *((double *)&v402 + 1);
          *(float *)&v378 = v16;
          v17 = v403;
          v18 = v404;
          v410 = v18;
          sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice"));
          v19 = v15;
          v20 = v17;
          if ((v21 & 1) != 0)
          {
            v22 = sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice"));
            v23 = (float)((float)(v18 * 0.5) + v16) + -1.0;
            v24 = -v23;
            v25 = v23 + 1.0;
            if (v22)
              v25 = v24;
            v411 = v18;
            v410 = v17;
            *(float *)v420 = v25 - (float)(v18 * 0.5);
            *(float *)&v378 = (float)((float)(v20 * 0.5) + v19) - (float)(v20 * 0.5);
            sub_1B566B7A0((float *)v420, (float *)&v378, &v411, &v410, self->_metadata);
            v19 = *(float *)v420;
            v20 = v411;
          }
          v26 = v19 + (float)(v20 * 0.5);
          if (v26 <= 1.0 && v26 >= 0.0)
          {
            v27 = v378;
            v28 = v410;
            v29 = *(float *)&v378 + (float)(v410 * 0.5);
            if (v29 <= 1.0 && v29 >= 0.0)
            {
              v30 = (char *)v417;
              if (v417 < v418)
              {
                *v417 = v19;
                *((_DWORD *)v30 + 1) = v27;
                v14 = (float *)(v30 + 16);
                *((float *)v30 + 2) = v20;
                *((float *)v30 + 3) = v28;
              }
              else
              {
                v31 = (char *)v416;
                v32 = ((char *)v417 - (_BYTE *)v416) >> 4;
                v33 = v32 + 1;
                if ((unint64_t)(v32 + 1) >> 60)
                  abort();
                v34 = (char *)v418 - (_BYTE *)v416;
                if (((char *)v418 - (_BYTE *)v416) >> 3 > v33)
                  v33 = v34 >> 3;
                if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0)
                  v35 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v35 = v33;
                if (v35)
                {
                  if (v35 >> 60)
                    sub_1B566A9AC();
                  v36 = (char *)operator new(16 * v35);
                }
                else
                {
                  v36 = 0;
                }
                v37 = (float *)&v36[16 * v32];
                *v37 = v19;
                *((_DWORD *)v37 + 1) = v27;
                v37[2] = v20;
                v37[3] = v28;
                v38 = v37;
                if (v30 != v31)
                {
                  do
                  {
                    *((_OWORD *)v38 - 1) = *((_OWORD *)v30 - 1);
                    v38 -= 4;
                    v30 -= 16;
                  }
                  while (v30 != v31);
                  v30 = (char *)v416;
                }
                v14 = v37 + 4;
                v416 = v38;
                v417 = v37 + 4;
                v418 = (float *)&v36[16 * v35];
                if (v30)
                  operator delete(v30);
              }
              v417 = v14;
            }
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v412, v422, 16);
      }
      while (v11);
    }

  }
  v404 = 0.0;
  *(_OWORD *)v407 = 0u;
  *(_OWORD *)v408 = 0u;
  v409 = 0u;
  value = self->_disparityConversion.__ptr_.__value_;
  v40 = self->_disparityGeometricTransformation.__ptr_.__value_;
  v360 = self->_disparityStatistics.__ptr_.__value_;
  v361 = (float *)self->_disparityAutofocus.__ptr_.__value_;
  if (!self->_treatFixedPointDisparityAsDense)
  {
    v41 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    canonicalDisparityPixelBufferPool = self->_canonicalDisparityPixelBufferPool;
    goto LABEL_40;
  }
  v41 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  canonicalDisparityPixelBufferPool = self->_canonicalDisparityPixelBufferPool;
  if (!self->_useSixteenBitPrecisionForDenseStereoDisparityConversion)
  {
LABEL_40:
    CVPixelBufferPoolCreatePixelBuffer(v41, canonicalDisparityPixelBufferPool, &pixelBufferOut);
    v43 = (void (*)(uint64_t, CVPixelBufferRef, int, __CVBuffer *, float, float))sub_1B568F768;
    v44 = (void (*)(uint64_t, CVPixelBufferRef, __CVBuffer *))sub_1B56A0DFC;
    v45 = sub_1B5689D08;
    v355 = sub_1B568D048;
    v46 = sub_1B5675320;
    goto LABEL_41;
  }
  CVPixelBufferPoolCreatePixelBuffer(v41, canonicalDisparityPixelBufferPool, &pixelBufferOut);
  value = self->_disparityConversion.__ptr_.__value_;
  v40 = self->_disparityGeometricTransformation.__ptr_.__value_;
  v43 = (void (*)(uint64_t, CVPixelBufferRef, int, __CVBuffer *, float, float))sub_1B569000C;
  v44 = (void (*)(uint64_t, CVPixelBufferRef, __CVBuffer *))sub_1B56A1388;
  v45 = sub_1B568B82C;
  v360 = self->_disparityStatistics.__ptr_.__value_;
  v361 = (float *)self->_disparityAutofocus.__ptr_.__value_;
  v355 = sub_1B568D764;
  v46 = sub_1B56765B8;
LABEL_41:
  v351 = v46;
  v47 = atomic_load((unsigned __int8 *)&qword_1EF12D3F0);
  if ((v47 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D3F0))
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v331 = (void *)objc_claimAutoreleasedReturnValue();
    v332 = objc_msgSend(v331, "BOOLForKey:", CFSTR("CVAPhotoDebugDrawDisparityConversionSettings"));

    byte_1EF12D69A = v332;
    __cxa_guard_release(&qword_1EF12D3F0);
  }
  if (byte_1EF12D69A)
  {
    if (self->_treatFixedPointDisparityAsDense)
      v48 = CFSTR("true");
    else
      v48 = CFSTR("false");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_treatFixedPointDisparityAsDense: %@"), v48);

    if (self->_useSixteenBitPrecisionForDenseStereoDisparityConversion)
      v49 = CFSTR("true");
    else
      v49 = CFSTR("false");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_useSixteenBitPrecisionFor...Conversion: %@"), v49);

    v50 = (void *)MEMORY[0x1E0CB3940];
    -[CVAVideoPipelinePropertiesSPI depthPixelBufferMaxLeftOcclusionDisparityChange](self->_properties, "depthPixelBufferMaxLeftOcclusionDisparityChange");
    objc_msgSend(v50, "stringWithFormat:", CFSTR("depthPixelBufferMaxLeftOcclusionDisparityChange: %f"), v51);

    v52 = (void *)MEMORY[0x1E0CB3940];
    -[CVAVideoPipelinePropertiesSPI depthPixelBufferMaxRightOcclusionDisparityChange](self->_properties, "depthPixelBufferMaxRightOcclusionDisparityChange");
    objc_msgSend(v52, "stringWithFormat:", CFSTR("depthPixelBufferMaxRightOcclusionDisparityChange: %f"), v53);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_disparityOffset: %f"), self->_disparityOffset);
  }
  if (self->_preferences.bypassCPUProcessing)
  {
    v54 = 0;
    v55 = 0;
    v364 = 0.0;
    goto LABEL_237;
  }
  if (sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice")) == 2)
  {
    *(_DWORD *)v420 = 0;
    v365 = (unsigned __int16 *)self->_focusStatsPostprocessing.__ptr_.__value_;
    v357 = objc_msgSend(v369, "focusTileXOffset");
    v352 = objc_msgSend(v369, "focusTileYOffset");
    v349 = objc_msgSend(v369, "focusTileWidth");
    v56 = objc_msgSend(v369, "focusTileHeight");
    v57 = objc_msgSend(v369, "focusMapWidth");
    v58 = objc_msgSend(v369, "focusMapHeight");
    v59 = objc_msgSend(v369, "totalSensorCropXOffset");
    v60 = objc_msgSend(v369, "totalSensorCropYOffset");
    v61 = objc_msgSend(v369, "totalSensorCropWidth");
    v62 = objc_msgSend(v369, "totalSensorCropHeight");
    objc_msgSend(v369, "phaseToBlurFactor");
    v64 = v63;
    objc_msgSend(v369, "focusDistanceToMaxAllowedFocusDistanceRatio");
    v66 = v65;
    objc_msgSend(v369, "focusTileData");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (__CVBuffer *)objc_msgSend(v369, "segmentationPixelBuffer");
    sub_1B5690B24(v365, v357, v352, v349, v56, v57, v58, v59, v64, v66, v60, v61, v62, v67, v68, pixelBufferOut, v420);

    v69 = self->_disparityAutofocus.__ptr_.__value_;
    *(_DWORD *)v69 = *(_DWORD *)v420;
    v71 = (_BYTE *)*((_QWORD *)v69 + 3);
    v70 = (_BYTE *)*((_QWORD *)v69 + 4);
    v72 = v70 - v71;
    if (v70 == v71)
    {
      v73 = 0;
    }
    else
    {
      if ((v72 & 0x8000000000000000) != 0)
        abort();
      v73 = operator new(v70 - v71);
      memcpy(v73, v71, v72);
    }
    v113 = (_BYTE *)*((_QWORD *)v69 + 6);
    v112 = (_BYTE *)*((_QWORD *)v69 + 7);
    v114 = v112 - v113;
    if (v112 != v113)
    {
      if ((v114 & 0x8000000000000000) != 0)
        abort();
      v115 = operator new(v112 - v113);
      memcpy(v115, v113, v114);
      operator delete(v115);
    }
    if (!v73)
      goto LABEL_193;
    v111 = v73;
    goto LABEL_97;
  }
  if (sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice")) == 3)
  {
    v74 = atomic_load((unsigned __int8 *)&qword_1EF12D6A8);
    if ((v74 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D6A8))
    {
      +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
      v335 = (void *)objc_claimAutoreleasedReturnValue();
      v336 = objc_msgSend(v335, "BOOLForKey:", CFSTR("CVAPhotoDebugDrawAutofocus"));

      byte_1EF12D6A0 = v336;
      __cxa_guard_release(&qword_1EF12D6A8);
    }
    if (byte_1EF12D6A0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("properties.rawShiftInvalidThreshold: %d"), -[CVAVideoPipelinePropertiesSPI rawShiftInvalidThreshold](self->_properties, "rawShiftInvalidThreshold"));

      v75 = (void *)MEMORY[0x1E0CB3940];
      -[CVAVideoPipelinePropertiesSPI disparityStereoFocalLengthPixels](self->_properties, "disparityStereoFocalLengthPixels");
      objc_msgSend(v75, "stringWithFormat:", CFSTR("properties.disparityStereoFocalLengthPixels: %f"), v76);

      v77 = (void *)MEMORY[0x1E0CB3940];
      -[CVAVideoPipelinePropertiesSPI disparityStereoBaselineMeters](self->_properties, "disparityStereoBaselineMeters");
      objc_msgSend(v77, "stringWithFormat:", CFSTR("properties.disparityStereoBaselineMeters: %f"), v78);

    }
    v366 = self->_disparityConversion.__ptr_.__value_;
    v79 = (__CVBuffer *)objc_msgSend(v369, "networkDisparityPixelBuffer");
    v80 = (__CVBuffer *)objc_msgSend(v369, "segmentationPixelBuffer");
    untransformedCanonicalDisparityPixelBuffer = self->_untransformedCanonicalDisparityPixelBuffer;
    v82 = -[CVAVideoPipelinePropertiesSPI segmentationBinarizationThreshold](self->_properties, "segmentationBinarizationThreshold");
    v342 = -[CVAVideoPipelinePropertiesSPI depthErosionRadius](self->_properties, "depthErosionRadius");
    v344 = v44;
    v345 = v40;
    v346 = v45;
    CVPixelBufferLockBaseAddress(v79, 1uLL);
    CVPixelBufferLockBaseAddress(untransformedCanonicalDisparityPixelBuffer, 0);
    BaseAddress = (float32x2_t *)CVPixelBufferGetBaseAddress(v79);
    Height = CVPixelBufferGetHeight(v79);
    Width = CVPixelBufferGetWidth(v79);
    BytesPerRow = CVPixelBufferGetBytesPerRow(v79);
    v87 = (char *)CVPixelBufferGetBaseAddress(untransformedCanonicalDisparityPixelBuffer);
    CVPixelBufferGetHeight(untransformedCanonicalDisparityPixelBuffer);
    CVPixelBufferGetWidth(untransformedCanonicalDisparityPixelBuffer);
    v88 = CVPixelBufferGetBytesPerRow(untransformedCanonicalDisparityPixelBuffer);
    if (Height && Width)
    {
      if (Width > 7)
      {
        if (Width == (Width & 0xFFFFFFFFFFFFFFF8))
        {
          v139 = 0;
          v140 = (int8x16_t *)(v87 + 16);
          v141 = BaseAddress + 2;
          v142 = (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL);
          __asm { FMOV            V3.4S, #1.0 }
          v148 = (int8x16_t)vdupq_n_s32(0x42C80000u);
          v149 = (float *)BaseAddress;
          v150 = (float *)v87;
          do
          {
            v151 = v141;
            v152 = v140;
            v153 = Width & 0xFFFFFFFFFFFFFFF8;
            if ((unint64_t)(&v87[v139 * v88] - ((char *)BaseAddress + v139 * BytesPerRow)) >= 0x20)
            {
              do
              {
                v159 = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(v142, vcvtq_f64_f32(*v151)), (int32x4_t)vcgtq_f64(v142, vcvt_hight_f64_f32(*(float32x4_t *)v151->f32))), v148, (int8x16_t)vdivq_f32(_Q3, *(float32x4_t *)v151->f32));
                v152[-1] = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(v142, vcvtq_f64_f32(v151[-2])), (int32x4_t)vcgtq_f64(v142, vcvt_hight_f64_f32(*(float32x4_t *)v151[-2].f32))), v148, (int8x16_t)vdivq_f32(_Q3, *(float32x4_t *)v151[-2].f32));
                *v152 = v159;
                v152 += 2;
                v151 += 4;
                v153 -= 8;
              }
              while (v153);
            }
            else
            {
              v154 = v149;
              v155 = v150;
              v156 = Width;
              do
              {
                v157 = *v154++;
                v158 = 1.0 / v157;
                if (v157 < 0.01)
                  v158 = 100.0;
                *v155++ = v158;
                --v156;
              }
              while (v156);
            }
            ++v139;
            v140 = (int8x16_t *)((char *)v140 + v88);
            v141 = (float32x2_t *)((char *)v141 + BytesPerRow);
            v150 = (float *)((char *)v150 + v88);
            v149 = (float *)((char *)v149 + BytesPerRow);
          }
          while (v139 != Height);
        }
        else
        {
          v160 = 0;
          v161 = (int8x16_t *)(v87 + 16);
          v162 = BaseAddress + 2;
          v163 = (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL);
          __asm { FMOV            V3.4S, #1.0 }
          v165 = (int8x16_t)vdupq_n_s32(0x42C80000u);
          v166 = BaseAddress;
          v167 = v87;
          do
          {
            if ((unint64_t)(&v87[v160 * v88] - ((char *)BaseAddress + v160 * BytesPerRow)) >= 0x20)
            {
              v169 = v162;
              v170 = v161;
              v171 = Width & 0xFFFFFFFFFFFFFFF8;
              do
              {
                v172 = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(v163, vcvtq_f64_f32(*v169)), (int32x4_t)vcgtq_f64(v163, vcvt_hight_f64_f32(*(float32x4_t *)v169->f32))), v165, (int8x16_t)vdivq_f32(_Q3, *(float32x4_t *)v169->f32));
                v170[-1] = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(v163, vcvtq_f64_f32(v169[-2])), (int32x4_t)vcgtq_f64(v163, vcvt_hight_f64_f32(*(float32x4_t *)v169[-2].f32))), v165, (int8x16_t)vdivq_f32(_Q3, *(float32x4_t *)v169[-2].f32));
                *v170 = v172;
                v170 += 2;
                v169 += 4;
                v171 -= 8;
              }
              while (v171);
              v168 = Width & 0xFFFFFFFFFFFFFFF8;
            }
            else
            {
              v168 = 0;
            }
            v173 = Width - v168;
            v174 = 4 * v168;
            v175 = (float *)&v167[4 * v168];
            v176 = (float *)((char *)v166 + v174);
            do
            {
              v177 = *v176++;
              v178 = 1.0 / v177;
              if (v177 < 0.01)
                v178 = 100.0;
              *v175++ = v178;
              --v173;
            }
            while (v173);
            ++v160;
            v161 = (int8x16_t *)((char *)v161 + v88);
            v162 = (float32x2_t *)((char *)v162 + BytesPerRow);
            v167 += v88;
            v166 = (float32x2_t *)((char *)v166 + BytesPerRow);
          }
          while (v160 != Height);
        }
      }
      else
      {
        v89 = (float *)&BaseAddress[1] + 1;
        v90 = (float *)(v87 + 12);
        do
        {
          v91 = *(v89 - 3);
          v92 = v91;
          v93 = 1.0 / v91;
          if (v92 < 0.01)
            v93 = 100.0;
          *(v90 - 3) = v93;
          if (Width != 1)
          {
            v94 = *(v89 - 2);
            v95 = v94;
            v96 = 1.0 / v94;
            if (v95 < 0.01)
              v96 = 100.0;
            *(v90 - 2) = v96;
            if (Width != 2)
            {
              v97 = *(v89 - 1);
              v98 = v97;
              v99 = 1.0 / v97;
              if (v98 < 0.01)
                v99 = 100.0;
              *(v90 - 1) = v99;
              if (Width != 3)
              {
                v100 = 1.0 / *v89;
                if (*v89 < 0.01)
                  v100 = 100.0;
                *v90 = v100;
                if (Width != 4)
                {
                  v101 = v89[1];
                  v102 = v101;
                  v103 = 1.0 / v101;
                  if (v102 < 0.01)
                    v103 = 100.0;
                  v90[1] = v103;
                  if (Width != 5)
                  {
                    v104 = v89[2];
                    v105 = v104;
                    v106 = 1.0 / v104;
                    if (v105 < 0.01)
                      v106 = 100.0;
                    v90[2] = v106;
                    if (Width != 6)
                    {
                      v107 = v89[3];
                      v108 = v107;
                      v109 = 1.0 / v107;
                      if (v108 < 0.01)
                        v109 = 100.0;
                      v90[3] = v109;
                    }
                  }
                }
              }
            }
          }
          v89 = (float *)((char *)v89 + BytesPerRow);
          v90 = (float *)((char *)v90 + v88);
          --Height;
        }
        while (Height);
      }
    }
    if (v80)
    {
      pixelBuffer = untransformedCanonicalDisparityPixelBuffer;
      v179 = (__CVBuffer *)*((_QWORD *)v366 + 2);
      CVPixelBufferLockBaseAddress(v80, 1uLL);
      CVPixelBufferLockBaseAddress(v179, 0);
      v358 = CVPixelBufferGetWidth(v80);
      v353 = CVPixelBufferGetHeight(v80);
      v180 = CVPixelBufferGetWidth(v179);
      v181 = CVPixelBufferGetHeight(v179);
      v182 = (char *)CVPixelBufferGetBaseAddress(v80);
      CVPixelBufferGetHeight(v80);
      CVPixelBufferGetWidth(v80);
      v183 = CVPixelBufferGetBytesPerRow(v80);
      v184 = CVPixelBufferGetBaseAddress(v179);
      CVPixelBufferGetHeight(v179);
      CVPixelBufferGetWidth(v179);
      v185 = CVPixelBufferGetBytesPerRow(v179);
      if (v181 && v180)
      {
        for (j = 0; j != v181; ++j)
        {
          for (k = 0; k != v180; ++k)
          {
            _H5 = *(_WORD *)&v182[2 * (int)(((double)k + 0.5) * (double)v358 / (double)v180)
                                + v183 * (int)(((double)j + 0.5) * (double)v353 / (double)v181)];
            __asm { FCVT            S5, H5 }
            if (v82 <= (int)llroundf(_S5 * 255.0))
              v190 = 32;
            else
              v190 = 16;
            v184[k] = v190;
          }
          v184 += v185;
        }
      }
      CVPixelBufferUnlockBaseAddress(v80, 1uLL);
      CVPixelBufferUnlockBaseAddress(v179, 0);
      v191 = (__CVBuffer *)*((_QWORD *)v366 + 2);
      CVPixelBufferLockBaseAddress(pixelBuffer, 0);
      CVPixelBufferLockBaseAddress(v191, 1uLL);
      v192 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
      v193 = CVPixelBufferGetHeight(pixelBuffer);
      v194 = CVPixelBufferGetWidth(pixelBuffer);
      v195 = CVPixelBufferGetBytesPerRow(pixelBuffer);
      v354 = (char *)CVPixelBufferGetBaseAddress(v191);
      v196 = CVPixelBufferGetHeight(v191);
      v197 = CVPixelBufferGetWidth(v191);
      v198 = CVPixelBufferGetBytesPerRow(v191);
      if (v193)
      {
        v199 = v194;
        if (v194)
        {
          v348 = v192;
          v350 = v198;
          v341 = v79;
          v200 = 0;
          v201 = v342;
          v202 = (double)v196;
          v203 = (double)v193;
          v204 = (double)v197;
          v205 = (double)v194;
          v206 = v194 - 1;
          v347 = v193;
          do
          {
            v207 = 0;
            v367 = &v348[v195 * v200];
            v359 = v200;
            v208 = &v354[v350 * (int)(((double)v200 + 0.5) * v202 / v203)];
            v209 = (unint64_t)v342 << 32;
            do
            {
              v210 = (v207 - v342) & ~((int)(v207 - v342) >> 31);
              v211 = v209 >> 32;
              if (v209 >> 32 >= v206)
                v211 = v206;
              v212 = v211 + 1;
              if (v212 <= v210 + 1)
                v212 = v210 + 1;
              v213 = (int)(((double)v207 + 0.5) * v204 / v205);
              if (v213 >= 1 && v208[v213] != v208[v213 - 1])
              {
                v214 = v201 + v207;
                if (v206 < (int)v201 + (int)v207)
                  v214 = v194 - 1;
                if (v210 <= v214)
                {
                  v215 = v201;
                  v216 = v199;
                  memset_pattern16(&v367[4 * v210], &unk_1B56AC270, 4 * (v212 - v210));
                  v199 = v216;
                  v201 = v215;
                }
              }
              ++v207;
              v209 += 0x100000000;
            }
            while (v199 != v207);
            v200 = v359 + 1;
          }
          while (v359 + 1 != v347);
          v217 = 0;
          v218 = (int)v347 - 1;
          v79 = v341;
          v219 = v348;
          while (1)
          {
            v220 = (int)(((double)v217 + 0.5) * v204 / v205);
            if (v220 >= 1)
              break;
LABEL_157:
            ++v217;
            v219 += 4;
            if (v217 == v199)
              goto LABEL_185;
          }
          v221 = 0;
          v222 = -v342;
          v223 = v342;
          v224 = &v354[v220];
          while (1)
          {
            v225 = v222 & ~(v222 >> 31);
            v226 = (int)v223;
            if ((int)v223 >= v218)
              v226 = (int)v347 - 1;
            v227 = v226 + 1;
            if (v227 <= v225 + 1)
              v228 = v225 + 1;
            else
              v228 = v227;
            v229 = (int)v221 + (int)v201;
            if (v229 >= v218)
              v229 = (int)v347 - 1;
            v230 = v229 + 1;
            v231 = (v221 - v342) & ~((int)(v221 - v342) >> 31);
            if (v230 <= v231 + 1)
              v232 = v231 + 1;
            else
              v232 = v230;
            v233 = (int)(((double)v221 + 0.5) * v202 / v203);
            if ((int)v233 < 1 || v224[v350 * v233] == v224[v350 * (v233 - 1)])
              goto LABEL_160;
            v234 = v342 + v221;
            if ((int)v218 < (int)(v342 + v221))
              v234 = v347 - 1;
            if (v231 > v234)
              goto LABEL_160;
            v235 = v232 - v231;
            if (v235 >= 2 && v195 == 1)
            {
              v236 = 0;
              v237 = &v219[v225];
              v238 = (v228 - v225) & 0xFFFFFFFFFFFFFFFELL;
              v239 = v235 & 0xFFFFFFFFFFFFFFFELL;
              do
              {
                v240 = &v237[v236];
                *(_DWORD *)v240 = 1157627904;
                *(_DWORD *)(v240 + 1) = 1157627904;
                v236 += 2;
              }
              while (v238 != v236);
              if (v235 == v239)
                goto LABEL_160;
              v231 += v239;
            }
            v241 = v195 * v231;
            do
            {
              *(_DWORD *)&v219[v241] = 1157627904;
              ++v231;
              v241 += v195;
            }
            while (v231 <= (int)v234);
LABEL_160:
            ++v221;
            ++v223;
            ++v222;
            if (v221 == v347)
              goto LABEL_157;
          }
        }
      }
LABEL_185:
      CVPixelBufferUnlockBaseAddress(v191, 1uLL);
      untransformedCanonicalDisparityPixelBuffer = pixelBuffer;
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    }
    CVPixelBufferUnlockBaseAddress(v79, 1uLL);
    CVPixelBufferUnlockBaseAddress(untransformedCanonicalDisparityPixelBuffer, 0);
    v344((uint64_t)v345, self->_untransformedCanonicalDisparityPixelBuffer, pixelBufferOut);
    -[CVAPortraitVideoPipeline_Impl internal_fixFocusPositionWithDisparityPostprocessingRequest:](self, "internal_fixFocusPositionWithDisparityPostprocessingRequest:", v369);
    v346((uint64_t)v361, pixelBufferOut, self->_vmPostprocessingParams.useFaceAsFocus, &v416, (uint64_t)v397, self->_vmPostprocessingParams.faceSizeRatioInFocus);
    if (v400)
    {
      v401 = v400;
      operator delete(v400);
    }
    if (v398)
    {
      v399 = v398;
      operator delete(v398);
    }
    -[CVAVideoPipelinePropertiesSPI focusDistanceOverride](self->_properties, "focusDistanceOverride");
    if (byte_1EF12D6A0)
    {
      v242 = (void *)MEMORY[0x1E0CB3940];
      -[CVAVideoPipelinePropertiesSPI focusDistanceOverride](self->_properties, "focusDistanceOverride");
      objc_msgSend(v242, "stringWithFormat:", CFSTR("properties.focusDistanceOverride: %f"), v243);

    }
LABEL_192:
    -[CVAVideoPipelinePropertiesSPI focusDistanceOverride](self->_properties, "focusDistanceOverride");
    *(float *)self->_disparityAutofocus.__ptr_.__value_ = 1.0 / v244;
    goto LABEL_193;
  }
  if (!self->_renderForegroundBlur)
  {
    objc_msgSend(v369, "disparityNormalizationMultiplier");
    objc_msgSend(v369, "disparityNormalizationMultiplier");
    v117 = v116;
    -[CVAVideoPipelinePropertiesSPI disparityStereoFocalLengthPixels](self->_properties, "disparityStereoFocalLengthPixels");
    v119 = v118;
    -[CVAVideoPipelinePropertiesSPI disparityStereoBaselineMeters](self->_properties, "disparityStereoBaselineMeters");
    v121 = 1.0 / (float)((float)(v117 * v119) * v120);
    objc_msgSend(v369, "disparityNormalizationOffset");
    objc_msgSend(v369, "disparityNormalizationOffset");
    v123 = v122;
    -[CVAVideoPipelinePropertiesSPI disparityStereoFocalLengthPixels](self->_properties, "disparityStereoFocalLengthPixels");
    v125 = v124;
    -[CVAVideoPipelinePropertiesSPI disparityStereoBaselineMeters](self->_properties, "disparityStereoBaselineMeters");
    v127 = (float)(v123 * v125) * v126;
    v128 = atomic_load((unsigned __int8 *)&qword_1EF12D3D8);
    if ((v128 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D3D8))
    {
      +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
      v337 = (void *)objc_claimAutoreleasedReturnValue();
      v338 = objc_msgSend(v337, "BOOLForKey:", CFSTR("CVAPhotoDebugDrawAutofocus"));

      byte_1EF12D6B0 = v338;
      __cxa_guard_release(&qword_1EF12D3D8);
    }
    if (byte_1EF12D6B0)
    {
      v129 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v369, "disparityNormalizationMultiplier");
      objc_msgSend(v129, "stringWithFormat:", CFSTR("disparityNormalizationMultiplier: %f"), v130);

      v131 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v369, "disparityNormalizationOffset");
      objc_msgSend(v131, "stringWithFormat:", CFSTR("disparityNormalizationOffset: %f"), v132);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("properties.rawShiftInvalidThreshold: %d"), -[CVAVideoPipelinePropertiesSPI rawShiftInvalidThreshold](self->_properties, "rawShiftInvalidThreshold"));
      v133 = (void *)MEMORY[0x1E0CB3940];
      -[CVAVideoPipelinePropertiesSPI disparityStereoFocalLengthPixels](self->_properties, "disparityStereoFocalLengthPixels");
      objc_msgSend(v133, "stringWithFormat:", CFSTR("properties.disparityStereoFocalLengthPixels: %f"), v134);

      v135 = (void *)MEMORY[0x1E0CB3940];
      -[CVAVideoPipelinePropertiesSPI disparityStereoBaselineMeters](self->_properties, "disparityStereoBaselineMeters");
      objc_msgSend(v135, "stringWithFormat:", CFSTR("properties.disparityStereoBaselineMeters: %f"), v136);

    }
    v43((uint64_t)value, (CVPixelBufferRef)objc_msgSend(v369, "fixedPointDisparityPixelBuffer"), -[CVAVideoPipelinePropertiesSPI rawShiftInvalidThreshold](self->_properties, "rawShiftInvalidThreshold"), self->_untransformedCanonicalDisparityPixelBuffer, v121, v127);
    v44((uint64_t)v40, self->_untransformedCanonicalDisparityPixelBuffer, pixelBufferOut);
    -[CVAPortraitVideoPipeline_Impl internal_fixFocusPositionWithDisparityPostprocessingRequest:](self, "internal_fixFocusPositionWithDisparityPostprocessingRequest:", v369);
    v45((uint64_t)v361, pixelBufferOut, self->_vmPostprocessingParams.useFaceAsFocus, &v416, (uint64_t)v387, self->_vmPostprocessingParams.faceSizeRatioInFocus);
    if (v390)
    {
      v391 = v390;
      operator delete(v390);
    }
    if (v388)
    {
      v389 = v388;
      operator delete(v388);
    }
    -[CVAVideoPipelinePropertiesSPI focusDistanceOverride](self->_properties, "focusDistanceOverride");
    if (byte_1EF12D6B0)
    {
      v137 = (void *)MEMORY[0x1E0CB3940];
      -[CVAVideoPipelinePropertiesSPI focusDistanceOverride](self->_properties, "focusDistanceOverride");
      objc_msgSend(v137, "stringWithFormat:", CFSTR("properties.focusDistanceOverride: %f"), v138);

    }
    goto LABEL_192;
  }
  v110 = (__CVBuffer *)objc_msgSend(v369, "fixedPointDisparityPixelBuffer");
  v44((uint64_t)v40, v110, pixelBufferOut);
  -[CVAPortraitVideoPipeline_Impl internal_fixFocusPositionWithDisparityPostprocessingRequest:](self, "internal_fixFocusPositionWithDisparityPostprocessingRequest:", v369);
  v45((uint64_t)v361, pixelBufferOut, self->_vmPostprocessingParams.useFaceAsFocus, &v416, (uint64_t)v392, self->_vmPostprocessingParams.faceSizeRatioInFocus);
  if (__p)
  {
    v396 = __p;
    operator delete(__p);
  }
  v111 = v393;
  if (!v393)
    goto LABEL_193;
  v394 = v393;
LABEL_97:
  operator delete(v111);
LABEL_193:
  v355(pixelBufferOut, v361, 0, (uint64_t)v382);
  if (v385)
  {
    v386 = v385;
    operator delete(v385);
  }
  if (v383)
  {
    v384 = v383;
    operator delete(v383);
  }
  if (-[CVAVideoPipelinePropertiesSPI sceneMonitorUsesDisparityStatistics](self->_properties, "sceneMonitorUsesDisparityStatistics"))
  {
    v245 = v351((uint64_t)v360, pixelBufferOut, (uint64_t)self->_disparityAutofocus.__ptr_.__value_ + 16, *(float *)self->_disparityAutofocus.__ptr_.__value_, *((float *)self->_disparityAutofocus.__ptr_.__value_ + 2), self->_vmPostprocessingParams.disparityIntervalInHoleSearch);
    v246 = *(_OWORD *)v245;
    v403 = *(double *)(v245 + 16);
    v402 = v246;
    v404 = *(double *)(v245 + 24);
    v247 = *(_DWORD *)(v245 + 40);
    v405 = *(_QWORD *)(v245 + 32);
    v406 = v247;
    if (&v402 != (__int128 *)v245)
    {
      sub_1B566B968(v407, *(char **)(v245 + 48), *(char **)(v245 + 56), (uint64_t)(*(_QWORD *)(v245 + 56) - *(_QWORD *)(v245 + 48)) >> 2);
      sub_1B566B968(&v408[1], *(char **)(v245 + 72), *(char **)(v245 + 80), (uint64_t)(*(_QWORD *)(v245 + 80) - *(_QWORD *)(v245 + 72)) >> 2);
    }
    v248 = atomic_load((unsigned __int8 *)&qword_1EF12D3E0);
    if ((v248 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D3E0))
    {
      +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
      v333 = (void *)objc_claimAutoreleasedReturnValue();
      v334 = objc_msgSend(v333, "BOOLForKey:", CFSTR("CVAPhotoDebugDrawDisparityStatistics"));

      byte_1EF12D6B8 = v334;
      __cxa_guard_release(&qword_1EF12D3E0);
    }
    if (byte_1EF12D6B8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bgShiftSum: %f"), *(float *)&v402);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bgShiftSumVariance: %f"), *((float *)&v402 + 1));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bgShiftArea: %f"), *((float *)&v402 + 2));

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalidPixelCount: %d"), HIDWORD(v402));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalidShiftRatio: %f"), *(float *)&v403);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalidShiftRatioVariance: %f"), *((float *)&v403 + 1));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("depthQuality: (%f %f)"), *(float *)&v404, *((float *)&v404 + 1));

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("backgroundSeparationLikelihood: %f"), *(float *)&v405);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("closeCanonicalDisparityAverage: %f"), *((float *)&v405 + 1));

    }
  }
  v249 = self->_disparityAutofocus.__ptr_.__value_;
  self->_vmDynamicParams.focusCanonicalDisparity = *(float *)v249;
  self->_vmDynamicParams.backgroundCanonicalDisparity = *((float *)v249 + 2);
  self->_vmDynamicParams.doDisparityHoleFilling = !self->_treatFixedPointDisparityAsDense;
  LOBYTE(v249) = atomic_load((unsigned __int8 *)&qword_1EF12D3F8);
  if ((v249 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D3F8))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    qword_1EF12D468 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D3F8);
  }
  if ((byte_1EF12D450 & 1) == 0)
  {
    *(_QWORD *)v420 = operator new(0x28uLL);
    *(_OWORD *)&v420[8] = xmmword_1B56AC110;
    strcpy(*(char **)v420, "useMinLinearFgBgSeparationForAlphaMatte");
    sub_1B5667F7C((uint64_t)&qword_1EF12D468, (uint64_t)v420);
    if ((v420[23] & 0x80000000) != 0)
      operator delete(*(void **)v420);
    byte_1EF12D450 = 1;
  }
  v250 = objc_msgSend((id)qword_1EF12D468, "BOOLValue");
  v251 = self->_disparityAutofocus.__ptr_.__value_;
  if (v250)
    v252 = fmaxf(*((float *)v251 + 3), *((float *)v251 + 1));
  else
    v252 = *((float *)v251 + 1);
  self->_vmDynamicParams.alphaMatteDeltaCanonicalDisparity = v252;
  v253 = atomic_load((unsigned __int8 *)&qword_1EF12D3E8);
  if ((v253 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D3E8))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    qword_1EF12D460 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D3E8);
  }
  if ((byte_1EF12D458 & 1) == 0)
  {
    *(_QWORD *)v420 = operator new(0x28uLL);
    *(_OWORD *)&v420[8] = xmmword_1B56AC120;
    strcpy(*(char **)v420, "useMinLinearFgBgSeparationForSDOF");
    sub_1B5667F7C((uint64_t)&qword_1EF12D460, (uint64_t)v420);
    if ((v420[23] & 0x80000000) != 0)
      operator delete(*(void **)v420);
    byte_1EF12D458 = 1;
  }
  v254 = objc_msgSend((id)qword_1EF12D460, "BOOLValue");
  v255 = self->_disparityAutofocus.__ptr_.__value_;
  v256 = *((float *)v255 + 1);
  if (v254)
    v257 = fmaxf(*((float *)v255 + 3), v256);
  else
    v257 = *((float *)v255 + 1);
  self->_vmDynamicParams.sdofDeltaCanonicalDisparity = v257;
  v258 = self->_stageLightStateMachine.__ptr_.__value_;
  v259 = objc_msgSend(v369, "isFocalPlaneLocked");
  v260 = *(_DWORD *)self->_focusStateMachine.__ptr_.__value_;
  objc_msgSend(v369, "sourceColorPixelBufferOrientation");
  v378 = v261;
  v379 = v262;
  v380 = v263;
  v381 = v264;
  v265 = *(float *)&v405;
  *(_QWORD *)v420 = sub_1B56599B0((double *)&v378);
  *(_QWORD *)&v420[8] = v266;
  *(_QWORD *)&v420[16] = v267;
  v421 = v268;
  v269 = sub_1B5659A98((double *)v258 + 3, (double *)v420);
  if (((v260 != 0) & ~v259) != 0
    || v269 >= *((double *)v258 + 1)
    || (v270 = (float *)v258, *((float *)v258 + 4) >= v265))
  {
    v270 = (float *)((char *)v258 + 4);
  }
  *((float *)v258 + 5) = fmaxf(fminf(*v270 + *((float *)v258 + 5), 1.0), 0.0);
  *((double *)v258 + 3) = sub_1B56599B0((double *)&v378);
  *((_QWORD *)v258 + 4) = v271;
  *((_QWORD *)v258 + 5) = v272;
  *((_QWORD *)v258 + 6) = v273;
  v274 = self->_sdofIntensityStateMachine.__ptr_.__value_;
  v275 = objc_msgSend(v369, "isFocalPlaneLocked");
  v276 = *(_DWORD *)self->_focusStateMachine.__ptr_.__value_;
  objc_msgSend(v369, "sourceColorPixelBufferOrientation");
  v378 = v277;
  v379 = v278;
  v380 = v279;
  v381 = v280;
  *(_QWORD *)v420 = sub_1B56599B0((double *)&v378);
  *(_QWORD *)&v420[8] = v281;
  *(_QWORD *)&v420[16] = v282;
  v421 = v283;
  v284 = sub_1B5659A98((double *)v274 + 3, (double *)v420);
  if (((v276 != 0) & ~v275) != 0 || (v285 = (float *)v274, v284 >= *((double *)v274 + 1)))
    v285 = (float *)((char *)v274 + 4);
  *((float *)v274 + 4) = fmaxf(fminf(*v285 + *((float *)v274 + 4), 1.0), 0.0);
  *((double *)v274 + 3) = sub_1B56599B0((double *)&v378);
  *((_QWORD *)v274 + 4) = v286;
  *((_QWORD *)v274 + 5) = v287;
  *((_QWORD *)v274 + 6) = v288;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v290 = v289;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v293 = v407[0];
  for (m = v407[1]; v293 != m; ++v293)
  {
    LODWORD(v292) = *v293;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v292);
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v289, "addObject:", v295);

  }
  v296 = v408[1];
  for (n = (_DWORD *)v409; v296 != n; ++v296)
  {
    LODWORD(v292) = *v296;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v292);
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v291, "addObject:", v298);

  }
  if (objc_msgSend(v289, "count"))
    v299 = v289;
  else
    v299 = 0;
  v55 = v299;

  if (objc_msgSend(v291, "count"))
    v300 = v291;
  else
    v300 = 0;
  v54 = v300;

  v364 = v256;
LABEL_237:
  v301 = [CVADisparityPostprocessingResult_Impl alloc];
  v302 = objc_msgSend(v369, "destinationDisparityPixelBuffer");
  v303 = pixelBufferOut;
  focusCanonicalDisparity = self->_vmDynamicParams.focusCanonicalDisparity;
  v305 = v406;
  v306 = *(_QWORD *)((char *)&v402 + 4);
  v307 = v403;
  v308 = v405;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v55);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v54);
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v339) = LODWORD(self->_previousFramePersonSegmentationRatio);
  LODWORD(v339) = 0;
  *(float *)&v311 = focusCanonicalDisparity;
  LODWORD(v312) = v305;
  LODWORD(v314) = HIDWORD(v306);
  LODWORD(v313) = v306;
  LODWORD(v316) = HIDWORD(v307);
  LODWORD(v315) = LODWORD(v307);
  *(float *)&v317 = v364;
  LODWORD(v318) = v308;
  v319 = -[CVADisparityPostprocessingResult_Impl initWithPostprocessedDisparityBuffer:canonicalDisparityPixelBuffer:focusCanonicalDisparity:backgroundDisparitySum:backgroundDisparitySumVariance:backgroundDisparityRatio:invalidDisparityRatio:invalidDisparityRatioVariance:deltaCanonicalDisparity:backgroundSeparationLikelihood:closeCanonicalDisparityAverage:faceCanonicalDisparityAverage:faceInvalidDisparityRatio:foregroundRatio:erodedForegroundRatio:personSegmentationRatio:](v301, "initWithPostprocessedDisparityBuffer:canonicalDisparityPixelBuffer:focusCanonicalDisparity:backgroundDisparitySum:backgroundDisparitySumVariance:backgroundDisparityRatio:invalidDisparityRatio:invalidDisparityRatioVariance:deltaCanonicalDisparity:backgroundSeparationLikelihood:closeCanonicalDisparityAverage:faceCanonicalDisparityAverage:faceInvalidDisparityRatio:foregroundRatio:erodedForegroundRatio:personSegmentationRatio:", v302, v303, v309, v310, v311, v312, v313, v314, v315, v316, v317, v318, HIDWORD(v308), v339);

  if (self->_preferences.bypassGPUProcessing)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B566BAA8;
    block[3] = &unk_1E6936BF8;
    v377 = v363;
    v375 = v369;
    v376 = v319;
    dispatch_async(notificationQueue, block);

  }
  else
  {
    *(_OWORD *)v420 = *(_OWORD *)&self->_vmPostprocessingParams.useFaceAsFocus;
    *(_QWORD *)&v420[16] = *(_QWORD *)&self->_vmPostprocessingParams.backgroundFillMarginFromValidDisparity_px;
    if (self->_transitionData._inTransition)
      v420[20] = 0;
    v368 = v55;
    if (sub_1B566B6C4())
      NSLog(CFSTR("> > > CVAPhoto: TRANSITION: useTemporalRejection = %i"), v420[20]);
    vmAccelerator = self->_vmAccelerator;
    v322 = pixelBufferOut;
    v323 = objc_msgSend(v369, "sourceColorPixelBuffer");
    v324 = objc_msgSend(v369, "destinationDisparityPixelBuffer");
    objc_msgSend(v369, "facesArray");
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    v326 = self->_notificationQueue;
    v370[0] = MEMORY[0x1E0C809B0];
    v370[1] = 3221225472;
    v370[2] = sub_1B566BAC4;
    v370[3] = &unk_1E6936BF8;
    v373 = v363;
    v371 = v369;
    v372 = v319;
    LOBYTE(v340) = a5;
    -[VideoMattingMetal disparityPostprocessingWithCanonicalDisparity:color:postProcessedDisparity:staticParams:dynamicParams:postProcessingParams:facesArray:faceModel:isFinalStage:callbackQueue:callback:](vmAccelerator, "disparityPostprocessingWithCanonicalDisparity:color:postProcessedDisparity:staticParams:dynamicParams:postProcessingParams:facesArray:faceModel:isFinalStage:callbackQueue:callback:", v322, v323, v324, &self->_vmStaticParams, &self->_vmDynamicParams, v420, v325, 0, v340, v326, v370);
    v327 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    yuvSourceDownsampledAlias = self->_yuvSourceDownsampledAlias;
    self->_yuvSourceDownsampledAlias = v327;

    v55 = v368;
  }
  if (a6)
    *a6 = 0;
  objc_msgSend(v369, "fixedPointDisparityPixelBuffer");
  objc_msgSend(v369, "networkDisparityPixelBuffer");
  objc_msgSend(v369, "sourceColorPixelBuffer");
  CVPixelBufferRelease(pixelBufferOut);
  v329 = v319;

  if (v408[1])
  {
    *(void **)&v409 = v408[1];
    operator delete(v408[1]);
  }
  if (v407[0])
  {
    v407[1] = v407[0];
    operator delete(v407[0]);
  }
  if (v416)
  {
    v417 = (float *)v416;
    operator delete(v416);
  }

  return v329;
}

- (int)internal_fixFocusPositionWithDisparityPostprocessingRequest:(id)a3
{
  id v4;
  float v5;
  float v6;
  int v7;
  float v8;
  float v9;
  FocusStateMachine *value;
  int v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  float v33;
  float v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  float v39;
  float v40;
  char v41;
  int v42;
  float v43;
  float v44;
  float v45;
  char v46;
  float v47;
  float v48;
  float v49;
  DisparityAutofocus *v51;
  float v52;
  float v53;
  int v54;
  float v55;
  float v56;
  float v57;
  float v58;

  v4 = a3;
  -[CVAVideoPipelinePropertiesSPI focusUpdateRateFast](self->_properties, "focusUpdateRateFast");
  v6 = v5;
  v7 = -[CVAVideoPipelinePropertiesSPI maxFramesWithoutFace](self->_properties, "maxFramesWithoutFace");
  objc_msgSend(v4, "currentFocusPosition");
  v9 = v8;
  value = self->_focusStateMachine.__ptr_.__value_;
  if (*((float *)value + 2) >= INFINITY)
    *((float *)value + 2) = v8;
  v11 = ((uint64_t (*)(char *, char *, float))off_1E6936798[*(_DWORD *)value])((char *)value + 4, (char *)value + 12, v8);
  *(_DWORD *)value = v11;
  if (self->_referenceLensPosition_um >= INFINITY)
  {
    self->_referenceLensPosition_um = v9;
    v6 = 1.0;
    goto LABEL_8;
  }
  v12 = v11;
  if (!objc_msgSend(v4, "isFocalPlaneLocked"))
  {
    if (v12 == 2)
    {
      syslog(3, "NUM_STATES is not a state. You're doing it wrong.");
      goto LABEL_8;
    }
    if (v12 == 1)
    {
      -[CVAVideoPipelinePropertiesSPI focusUpdateRateFast](self->_properties, "focusUpdateRateFast");
    }
    else
    {
      if (v12)
        goto LABEL_8;
      -[CVAVideoPipelinePropertiesSPI focusUpdateRateSlow](self->_properties, "focusUpdateRateSlow");
    }
    v6 = v49;
    goto LABEL_8;
  }
  v6 = 0.0;
  if (self->_renderForegroundBlur)
  {
LABEL_8:
    objc_msgSend(v4, "focusRegion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14
      && (objc_msgSend(v4, "focusRegion"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "count"),
          v15,
          v14,
          v16))
    {
      objc_msgSend(v4, "focusRegion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "focusRegion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v18, "count") - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("X"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v22 = v21;

      v58 = v22;
      objc_msgSend(v4, "focusRegion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "focusRegion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v24, "count") - 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Y"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "floatValue");
      v28 = v27;

      v57 = v28;
      objc_msgSend(v4, "focusRegion");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "focusRegion");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v30, "count") - 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Width"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");
      v34 = v33;

      v56 = v34;
      v55 = 0.0;
      objc_msgSend(v4, "focusRegion");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "focusRegion");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v36, "count") - 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Height"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "floatValue");
      v40 = v39;

      sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice"));
      if ((v41 & 1) != 0)
      {
        v42 = sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice"));
        v43 = (float)(v28 + (float)(v40 * 0.5)) + -1.0;
        v44 = -v43;
        v45 = v43 + 1.0;
        if (v42)
          v45 = v44;
        v55 = v34;
        v56 = v40;
        v57 = (float)(v22 + (float)(v34 * 0.5)) - (float)(v34 * 0.5);
        v58 = v45 - (float)(v40 * 0.5);
        sub_1B566B7A0(&v58, &v57, &v56, &v55, self->_metadata);
        v40 = v55;
        v34 = v56;
      }
      if (v34 > 0.0 && v40 > 0.0)
      {
        if (v34 > 1.0 || v40 > 1.0)
        {
          v57 = v57 / 1000.0;
          v58 = v58 / 1000.0;
          v34 = v34 / 1000.0;
          v40 = v40 / 1000.0;
        }
        sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice"));
        if ((v46 & 1) == 0)
        {
          if (self->_renderForegroundBlur)
          {
            if (objc_msgSend(v4, "focusRegionType") == 2)
            {
              v47 = fmaxf(v40, 0.2);
              v48 = fmaxf(v34, 0.2);
            }
            else
            {
              v47 = 0.2;
              v48 = 0.2;
            }
          }
          else
          {
            v48 = fmaxf(v34, 0.2);
            v47 = fmaxf(v40, 0.2);
          }
          v57 = fmaxf(v57 - (float)((float)(v47 - v40) * 0.5), 0.0);
          v58 = fmaxf(v58 - (float)((float)(v48 - v34) * 0.5), 0.0);
          v40 = v47;
          v34 = v48;
        }
        if ((sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice")) & 0x100000000) != 0
          && objc_msgSend(v4, "focusRegionType") != 1)
        {
          if (v6 < 0.0 || v6 > 1.0)
            goto LABEL_46;
          v54 = 0;
          v51 = self->_disparityAutofocus.__ptr_.__value_;
          v34 = 0.5;
          v52 = 0.25;
          v53 = 0.25;
          v40 = 0.5;
        }
        else
        {
          v51 = self->_disparityAutofocus.__ptr_.__value_;
          v53 = v57;
          v52 = v58;
          v54 = objc_msgSend(v4, "focusRegionType");
          if (v6 < 0.0 || v6 > 1.0)
          {
LABEL_46:
            syslog(3, "Fusion update rate (%.2f) not in [0,1]", v6);
            v13 = -22900;
            goto LABEL_30;
          }
        }
        v13 = 0;
        *((float *)v51 + 21) = v52;
        *((float *)v51 + 22) = v53;
        *((float *)v51 + 23) = v34;
        *((float *)v51 + 24) = v40;
        *((_DWORD *)v51 + 25) = -1082130432;
        *((_DWORD *)v51 + 26) = v54;
        *((float *)v51 + 27) = v6;
        *((_DWORD *)v51 + 28) = v7;
        goto LABEL_30;
      }
      syslog(3, "Invalid focus region (%.3f %.3f %.3f %.3f)", v58, v57, v34, v40);
    }
    else
    {
      syslog(3, "Focus region not present");
    }
    v13 = -22903;
    goto LABEL_30;
  }
  v13 = 0;
LABEL_30:

  return v13;
}

- (id)internal_extractMatteWithRequest:(id)a3 disparityPostprocessingResult:(id)a4 usePostprocessedDisparity:(BOOL)a5 dilateForegroundMask:(BOOL)a6 gravity:(CVAVector)a7 transitionData:(const TransitionData *)a8 mattingCompletionHandler:(id)a9 isFinalStage:(BOOL)a10 status:(int *)a11
{
  uint64_t v12;

  LOBYTE(v12) = a10;
  -[CVAPortraitVideoPipeline_Impl internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:isMattingNeeded:mattingCompletionHandler:isFinalStage:status:](self, "internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:isMattingNeeded:mattingCompletionHandler:isFinalStage:status:", a3, a4, a5, a6, a8, 1, a7.x, a7.y, a7.z, a9, v12, a11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)internal_extractMatteWithRequest:(id)a3 disparityPostprocessingResult:(id)a4 usePostprocessedDisparity:(BOOL)a5 dilateForegroundMask:(BOOL)a6 gravity:(CVAVector)a7 transitionData:(const TransitionData *)a8 isMattingNeeded:(BOOL)a9 mattingCompletionHandler:(id)a10 isFinalStage:(BOOL)a11 status:(int *)a12
{
  double z;
  double y;
  double x;
  id v20;
  id v21;
  float mattingCoeffUpdateRate;
  float mattingCoeffColorStd;
  void *v24;
  char v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  float v28;
  float v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  float v32;
  unsigned __int8 v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  CVAMattingResult_Impl *v39;
  unsigned __int8 v40;
  void *v41;
  float v42;
  void *v43;
  float v44;
  void *v45;
  float v46;
  void *v47;
  void *v48;
  void *v49;
  float v50;
  void *v51;
  float v52;
  void *v53;
  void *v54;
  uint64_t v55;
  VideoMattingMetal *vmAccelerator;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  CVAVideoPipelinePropertiesSPI *properties;
  OS_dispatch_queue *notificationQueue;
  id *v62;
  id *v63;
  id *v64;
  NSObject *v65;
  void *v67;
  char v68;
  void *v69;
  char v70;
  double v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  void *v76;
  id v77;
  BOOL v78;
  CVAMattingResult_Impl *v80;
  id v81;
  _QWORD v82[4];
  id v83;
  CVAMattingResult_Impl *v84;
  id v85;
  _QWORD block[4];
  id v87;
  CVAMattingResult_Impl *v88;
  id v89;
  char *v90;
  __int128 v91;

  z = a7.z;
  y = a7.y;
  x = a7.x;
  v20 = a3;
  v21 = a4;
  v81 = a10;
  mattingCoeffUpdateRate = self->_vmDynamicMetaParams.mattingCoeffUpdateRate;
  mattingCoeffColorStd = self->_vmDynamicMetaParams.mattingCoeffColorStd;
  objc_msgSend(v20, "disparityPostprocessingRequest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isFocalPlaneLocked");

  if ((v25 & 1) == 0)
  {
    if (*(_DWORD *)self->_focusStateMachine.__ptr_.__value_ == 1
      || *((float *)self->_sdofIntensityStateMachine.__ptr_.__value_ + 4) < 0.5)
    {
      mattingCoeffUpdateRate = self->_vmDynamicMetaParams.mattingCoeffUpdateRateFast;
      mattingCoeffColorStd = self->_vmDynamicMetaParams.mattingCoeffColorStdFast;
      v26 = atomic_load((unsigned __int8 *)&qword_1EF12D518);
      if ((v26 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D518))
      {
        LODWORD(v71) = -1.0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v71);
        qword_1EF12D620 = objc_claimAutoreleasedReturnValue();
        __cxa_guard_release(&qword_1EF12D518);
      }
      if ((byte_1EF12D5F0 & 1) == 0)
      {
        v90 = (char *)operator new(0x20uLL);
        v91 = xmmword_1B56AC130;
        strcpy(v90, "mattingUpdateRateFastOverride");
        sub_1B5667F7C((uint64_t)&qword_1EF12D620, (uint64_t)&v90);
        if (SHIBYTE(v91) < 0)
          operator delete(v90);
        byte_1EF12D5F0 = 1;
      }
      v27 = atomic_load((unsigned __int8 *)&qword_1EF12D508);
      if ((v27 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D508))
      {
        LODWORD(v72) = -1.0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v72);
        qword_1EF12D610 = objc_claimAutoreleasedReturnValue();
        __cxa_guard_release(&qword_1EF12D508);
      }
      if ((byte_1EF12D5F8 & 1) == 0)
      {
        v90 = (char *)operator new(0x20uLL);
        v91 = xmmword_1B56AC140;
        strcpy(v90, "mattingColorStdFastOverride");
        sub_1B5667F7C((uint64_t)&qword_1EF12D610, (uint64_t)&v90);
        if (SHIBYTE(v91) < 0)
          operator delete(v90);
        byte_1EF12D5F8 = 1;
      }
      if (sub_1B5669844("mattingUpdateRateFastOverride"))
      {
        objc_msgSend((id)qword_1EF12D620, "floatValue");
        mattingCoeffUpdateRate = v28;
      }
      if (sub_1B5669844("mattingColorStdFastOverride"))
      {
        objc_msgSend((id)qword_1EF12D610, "floatValue");
LABEL_32:
        mattingCoeffColorStd = v29;
      }
    }
    else
    {
      mattingCoeffUpdateRate = self->_vmDynamicMetaParams.mattingCoeffUpdateRate;
      mattingCoeffColorStd = self->_vmDynamicMetaParams.mattingCoeffColorStd;
      v30 = atomic_load((unsigned __int8 *)&qword_1EF12D520);
      if ((v30 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D520))
      {
        LODWORD(v73) = -1.0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v73);
        qword_1EF12D628 = objc_claimAutoreleasedReturnValue();
        __cxa_guard_release(&qword_1EF12D520);
      }
      if ((byte_1EF12D600 & 1) == 0)
      {
        v90 = (char *)operator new(0x20uLL);
        v91 = xmmword_1B56AC130;
        strcpy(v90, "mattingUpdateRateSlowOverride");
        sub_1B5667F7C((uint64_t)&qword_1EF12D628, (uint64_t)&v90);
        if (SHIBYTE(v91) < 0)
          operator delete(v90);
        byte_1EF12D600 = 1;
      }
      v31 = atomic_load((unsigned __int8 *)&qword_1EF12D510);
      if ((v31 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D510))
      {
        LODWORD(v74) = -1.0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v74);
        qword_1EF12D618 = objc_claimAutoreleasedReturnValue();
        __cxa_guard_release(&qword_1EF12D510);
      }
      if ((byte_1EF12D608 & 1) == 0)
      {
        v90 = (char *)operator new(0x20uLL);
        v91 = xmmword_1B56AC140;
        strcpy(v90, "mattingColorStdSlowOverride");
        sub_1B5667F7C((uint64_t)&qword_1EF12D618, (uint64_t)&v90);
        if (SHIBYTE(v91) < 0)
          operator delete(v90);
        byte_1EF12D608 = 1;
      }
      if (sub_1B5669844("mattingUpdateRateSlowOverride"))
      {
        objc_msgSend((id)qword_1EF12D628, "floatValue");
        mattingCoeffUpdateRate = v32;
      }
      if (sub_1B5669844("mattingColorStdSlowOverride"))
      {
        objc_msgSend((id)qword_1EF12D618, "floatValue");
        goto LABEL_32;
      }
    }
  }
  v33 = atomic_load((unsigned __int8 *)&qword_1EF12D4F8);
  if ((v33 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D4F8))
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "BOOLForKey:", CFSTR("CVAPhotoDebugStyle"));

    byte_1EF12D6C1 = v68;
    __cxa_guard_release(&qword_1EF12D4F8);
  }
  if (byte_1EF12D6C1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mattingUpdateRate = %.3f"), mattingCoeffUpdateRate);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mattingColorStd = %.3f"), mattingCoeffColorStd);
  }
  if (a8->_inTransition)
    mattingCoeffUpdateRate = 1.0;
  if (sub_1B566B6C4())
    NSLog(CFSTR("> > > CVAPhoto: TRANSITION: mattingUpdateRate = %.3f"), mattingCoeffUpdateRate);
  self->_vmDynamicParams.updateRate = mattingCoeffUpdateRate;
  self->_vmDynamicParams.alphaCoeffFilterColorStd = mattingCoeffColorStd;
  objc_msgSend(v21, "focusDisparity");
  self->_vmDynamicParams.focusCanonicalDisparity = v34;
  -[CVAVideoPipelinePropertiesSPI focusThresholdHardness](self->_properties, "focusThresholdHardness");
  v78 = a5;
  v35 = y;
  v36 = x;
  v37 = z;
  self->_vmDynamicParams.thresholdHardness = v38;
  self->_vmDynamicParams.gravity.__elems_[0] = -v35;
  self->_vmDynamicParams.gravity.__elems_[1] = -v36;
  self->_vmDynamicParams.gravity.__elems_[2] = -v37;
  v39 = -[CVAMattingResult_Impl initWithDisparityPostprocessingResult:alphaMattePixelBuffer:]([CVAMattingResult_Impl alloc], "initWithDisparityPostprocessingResult:alphaMattePixelBuffer:", v21, objc_msgSend(v20, "destinationAlphaMattePixelBuffer"));
  v40 = atomic_load((unsigned __int8 *)&qword_1EF12D500);
  if ((v40 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D500))
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "BOOLForKey:", CFSTR("CVAPhotoDebugSceneMonitorValues"));

    byte_1EF12D6C8 = v70;
    __cxa_guard_release(&qword_1EF12D500);
  }
  if (byte_1EF12D6C8)
  {
    v41 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v21, "backgroundDisparitySum");
    objc_msgSend(v41, "stringWithFormat:", CFSTR("backgroundDisparitySum: %f"), v42);

    v43 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v21, "invalidDisparityRatio");
    objc_msgSend(v43, "stringWithFormat:", CFSTR("invalidDisparityRatio: %f"), v44);

    v45 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v21, "closeCanonicalDisparityAverage");
    objc_msgSend(v45, "stringWithFormat:", CFSTR("closeCanonicalDisparityAverage: %f"), v46);

    v47 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v21, "faceCanonicalDisparityAverage");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringWithFormat:", CFSTR("faceCanonicalDisparityAverage: %@"), v48);

    v49 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v21, "erodedForegroundRatio");
    objc_msgSend(v49, "stringWithFormat:", CFSTR("erodedForegroundRatio: %f"), v50);

    v51 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v21, "foregroundRatio");
    objc_msgSend(v51, "stringWithFormat:", CFSTR("foregroundRatio: %f"), v52);

  }
  if (objc_msgSend(v20, "segmentationPixelBuffer"))
  {
    -[CVAVideoPipelinePropertiesSPI supportedInputSegmentationPixelBufferPixelFormats](self->_properties, "supportedInputSegmentationPixelBufferPixelFormats");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v20, "segmentationPixelBuffer")));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v53, "containsObject:", v54))
      v55 = objc_msgSend(v20, "segmentationPixelBuffer");
    else
      v55 = 0;

    if (self->_preferences.bypassGPUProcessing)
      goto LABEL_52;
  }
  else
  {
    v55 = 0;
    if (self->_preferences.bypassGPUProcessing)
      goto LABEL_52;
  }
  if (a9)
  {
    vmAccelerator = self->_vmAccelerator;
    v57 = objc_msgSend(v21, "postprocessedDisparityPixelBuffer");
    objc_msgSend(v20, "disparityPostprocessingRequest");
    v80 = v39;
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v21;
    v58 = objc_msgSend(v76, "sourceColorPixelBuffer");
    v59 = objc_msgSend(v20, "destinationAlphaMattePixelBuffer");
    notificationQueue = self->_notificationQueue;
    properties = self->_properties;
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = sub_1B566B784;
    v82[3] = &unk_1E6936BF8;
    v85 = v81;
    v83 = v20;
    v84 = v80;
    BYTE2(v75) = a6;
    BYTE1(v75) = a11;
    LOBYTE(v75) = v78;
    -[VideoMattingMetal alphaMattingWithPostprocessedDisparity:source:inSegmentation:alpha:staticParams:dynamicParams:usePostprocessedDisparity:isFinalStage:dilateForegroundMask:properties:callbackQueue:callback:](vmAccelerator, "alphaMattingWithPostprocessedDisparity:source:inSegmentation:alpha:staticParams:dynamicParams:usePostprocessedDisparity:isFinalStage:dilateForegroundMask:properties:callbackQueue:callback:", v57, v58, v55, v59, &self->_vmStaticParams, &self->_vmDynamicParams, v75, properties, notificationQueue, v82);
    v62 = &v85;
    v63 = &v83;
    v64 = (id *)&v84;

    v21 = v77;
    v39 = v80;
    goto LABEL_53;
  }
LABEL_52:
  v65 = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B566B768;
  block[3] = &unk_1E6936BF8;
  v62 = &v89;
  v89 = v81;
  v63 = &v87;
  v87 = v20;
  v64 = (id *)&v88;
  v88 = v39;
  dispatch_async(v65, block);
LABEL_53:

  objc_msgSend(v20, "segmentationPixelBuffer");
  objc_msgSend(v20, "skinSegmentationPixelBuffer");
  if (a12)
    *a12 = 0;

  return v39;
}

- (void)internal_renderWithRequest:(id)a3 dstBuffer:(__CVBuffer *)a4 mattingResult:(id)a5 portraitCompletionHandler:(id)a6 status:(int *)a7 timestamp:(int64_t)a8
{
  id v13;
  id v14;
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
  float focusCanonicalDisparity;
  float sdofDeltaCanonicalDisparity;
  float v29;
  float v30;
  int fNumber_tenths;
  float v32;
  SdofStateMachine *value;
  void *v34;
  void *v35;
  int v36;
  int v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  float v52;
  void *v53;
  void *v54;
  void *v55;
  __CVBuffer *v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  BOOL v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  CVAPortraitResult_Impl *v80;
  double v81;
  unsigned __int8 v82;
  int overlayShiftOnRendering;
  BOOL v84;
  id v85;
  id v86;
  id v87;
  CVAPortraitResult_Impl *v88;
  void *v89;
  float v90;
  uint64_t v91;
  VideoMattingMetal *vmAccelerator;
  float v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  int v98;
  float v99;
  float v100;
  OS_dispatch_queue *v101;
  OS_dispatch_queue *notificationQueue;
  OS_dispatch_queue **p_notificationQueue;
  uint64_t v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  VideoMattingMetal *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  float v127;
  CVAPortraitResult_Impl *v128;
  id v130;
  void *v131;
  void *v132;
  __CVBuffer *v133;
  void *v134;
  _QWORD v135[5];
  id v136;
  id v137;
  CVAPortraitResult_Impl *v138;
  id v139;
  int64_t v140;
  BOOL v141;
  double v142[4];
  double v143[6];

  v13 = a3;
  v14 = a5;
  v130 = a6;
  v134 = v14;
  v132 = v13;
  objc_msgSend(v14, "disparityPostprocessingResult");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[CVAVideoPipelinePropertiesSPI offsetNoiseBitCalculation](self->_properties, "offsetNoiseBitCalculation");
  v16 = v15;
  -[CVAVideoPipelinePropertiesSPI gainMultiplierNoiseBitCalculation](self->_properties, "gainMultiplierNoiseBitCalculation");
  v18 = v17;
  -[CVAVideoPipelinePropertiesSPI luxMultiplierNoiseBitCalculation](self->_properties, "luxMultiplierNoiseBitCalculation");
  v20 = v19;
  objc_msgSend(v13, "sourceColorGain");
  v22 = v21;
  objc_msgSend(v13, "sourceColorLux");
  v24 = v23;
  v25 = log2f(fmaxf(v22, 1.0));
  v26 = log2f(fmaxf(v24, 1.0));
  focusCanonicalDisparity = self->_vmDynamicParams.focusCanonicalDisparity;
  sdofDeltaCanonicalDisparity = self->_vmDynamicParams.sdofDeltaCanonicalDisparity;
  objc_msgSend(v131, "focusDisparity");
  v30 = v29;
  if (sub_1B568AFE8())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sdof.cutoffCanonicalDisparity = %5.3f"), (float)(v30 - self->_vmDynamicParams.sdofDeltaCanonicalDisparity));

  }
  fNumber_tenths = self->_preferences.fNumber_tenths;
  if (fNumber_tenths < 1)
    objc_msgSend(v13, "simulatedFocalRatio");
  else
    v32 = (float)fNumber_tenths / 10.0;
  v127 = v32;
  value = self->_sdofIntensityStateMachine.__ptr_.__value_;
  objc_msgSend(v13, "mattingRequest");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "disparityPostprocessingRequest");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = a4;
  v36 = objc_msgSend(v35, "isFocalPlaneLocked");
  v37 = *(_DWORD *)self->_focusStateMachine.__ptr_.__value_;
  objc_msgSend(v13, "mattingRequest");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "disparityPostprocessingRequest");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sourceColorPixelBufferOrientation");
  v142[0] = v40;
  v142[1] = v41;
  v142[2] = v42;
  v142[3] = v43;
  v143[0] = sub_1B56599B0(v142);
  v143[1] = v44;
  v143[2] = v45;
  v143[3] = v46;
  v47 = sub_1B5659A98((double *)value + 3, v143);
  if (((v37 != 0) & ~v36) != 0 || (v48 = (float *)value, v47 >= *((double *)value + 1)))
    v48 = (float *)((char *)value + 4);
  *((float *)value + 4) = fmaxf(fminf(*v48 + *((float *)value + 4), 1.0), 0.0);
  v126 = sdofDeltaCanonicalDisparity;
  *((double *)value + 3) = sub_1B56599B0(v142);
  *((_QWORD *)value + 4) = v49;
  *((_QWORD *)value + 5) = v50;
  *((_QWORD *)value + 6) = v51;
  v52 = *((float *)value + 4);

  v53 = v132;
  objc_msgSend(v132, "mattingRequest");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v131;
  objc_msgSend(v54, "primaryCaptureRect");
  v56 = v133;
  v122 = v26;
  v123 = focusCanonicalDisparity;
  v124 = v25;
  v125 = v20;
  self->_vmDynamicParams.primaryCaptureRect.origin.x = v57;
  self->_vmDynamicParams.primaryCaptureRect.origin.y = v58;
  self->_vmDynamicParams.primaryCaptureRect.size.width = v59;
  self->_vmDynamicParams.primaryCaptureRect.size.height = v60;

  objc_msgSend(v131, "backgroundDisparitySumVariance");
  v62 = v61;
  -[CVAVideoPipelinePropertiesSPI stableBackgroundDisparitySumVariance](self->_properties, "stableBackgroundDisparitySumVariance");
  v64 = v63;
  -[CVAVideoPipelinePropertiesSPI unstableBackgroundDisparitySumVariance](self->_properties, "unstableBackgroundDisparitySumVariance");
  v66 = (float)(v62 - v64) / (float)(v65 - v64);
  v67 = fminf(v66, 1.0);
  v68 = v66 < 0.0;
  v69 = 0.0;
  if (!v68)
    v69 = v67;
  v121 = v69;
  objc_msgSend(v131, "invalidDisparityRatio");
  v71 = v70;
  -[CVAVideoPipelinePropertiesSPI stableInvalidDisparityRatio](self->_properties, "stableInvalidDisparityRatio");
  v73 = v72;
  -[CVAVideoPipelinePropertiesSPI unstableInvalidDisparityRatio](self->_properties, "unstableInvalidDisparityRatio");
  v75 = (float)(v71 - v73) / (float)(v74 - v73);
  v76 = fminf(v75, 1.0);
  if (v75 >= 0.0)
    v77 = v76;
  else
    v77 = 0.0;
  if (-[CVAVideoPipelinePropertiesSPI modulateFocalRatio](self->_properties, "modulateFocalRatio"))
  {
    v78 = 2.0 - v52;
  }
  else
  {
    -[CVAVideoPipelinePropertiesSPI fNumberMultiplier](self->_properties, "fNumberMultiplier");
    v78 = v79;
  }
  v80 = [CVAPortraitResult_Impl alloc];
  *(float *)&v81 = v52;
  v128 = -[CVAPortraitResult_Impl initWithMattingResult:portraitPixelBuffer:portraitStability:](v80, "initWithMattingResult:portraitPixelBuffer:portraitStability:", v14, v133, v81);
  v82 = atomic_load((unsigned __int8 *)&qword_1EF12D3D0);
  if ((v82 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D3D0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    qword_1EF12D448 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D3D0);
    v55 = v131;
    v53 = v132;
    v56 = v133;
  }
  if ((byte_1EF12D440 & 1) == 0)
  {
    HIBYTE(v143[2]) = 21;
    strcpy((char *)v143, "drawDisparityOverride");
    sub_1B5667F7C((uint64_t)&qword_1EF12D448, (uint64_t)v143);
    if (SHIBYTE(v143[2]) < 0)
      operator delete(*(void **)&v143[0]);
    byte_1EF12D440 = 1;
  }
  if (sub_1B5669844("drawDisparityOverride"))
    overlayShiftOnRendering = objc_msgSend((id)qword_1EF12D448, "BOOLValue");
  else
    overlayShiftOnRendering = self->_preferences.overlayShiftOnRendering;
  v84 = overlayShiftOnRendering != 0;
  v135[0] = MEMORY[0x1E0C809B0];
  v135[1] = 3221225472;
  v135[2] = sub_1B566B4B4;
  v135[3] = &unk_1E6936C20;
  v135[4] = self;
  v85 = v53;
  v136 = v85;
  v141 = v84;
  v86 = v55;
  v137 = v86;
  v87 = v130;
  v139 = v87;
  v88 = v128;
  v138 = v88;
  v140 = a8;
  v89 = (void *)MEMORY[0x1B5E4E2A8](v135);
  if (self->_preferences.bypassGPUProcessing)
  {
    if ((__CVBuffer *)objc_msgSend(v85, "destinationColorPixelBuffer") == v56)
      dispatch_async((dispatch_queue_t)self->_notificationQueue, v89);
  }
  else
  {
    -[CVAVideoPipelinePropertiesSPI renderingDisparityUpdateRate](self->_properties, "renderingDisparityUpdateRate");
    if (self->_transitionData._inTransition)
      v90 = 1.0;
    v120 = v90;
    if (sub_1B566B6C4())
      NSLog(CFSTR("> > > CVAPhoto: TRANSITION: sdof.disparityUpdateRate = %.3f"), v120);
    v91 = objc_msgSend(v86, "postprocessedDisparityPixelBuffer");
    if (self->_renderForegroundBlur
      && sub_1B569090C(CFSTR("CVAPhotoDeadzoneInCinematic"), CFSTR("com.apple.coremedia"), 0) == 1)
    {
      v91 = objc_msgSend(v86, "canonicalDisparityPixelBuffer");
    }
    vmAccelerator = self->_vmAccelerator;
    objc_msgSend(v85, "mattingRequest");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "disparityPostprocessingRequest");
    v116 = vmAccelerator;
    v117 = v91;
    v93 = v30;
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend(v118, "sourceColorPixelBuffer");
    objc_msgSend(v85, "mattingRequest");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v94, "segmentationPixelBuffer");
    v96 = objc_msgSend(v134, "alphaMattePixelBuffer");
    -[CVAVideoPipelinePropertiesSPI focusThresholdHardness](self->_properties, "focusThresholdHardness");
    v98 = v97;
    objc_msgSend(v85, "colorCubeIntensity");
    v100 = v99;
    p_notificationQueue = &self->_notificationQueue;
    notificationQueue = self->_notificationQueue;
    v101 = p_notificationQueue[1];
    v104 = objc_msgSend(v85, "destinationColorPixelBuffer");
    *(float *)&v111 = fmaxf((float)(v16 + (float)(v18 * v124)) + (float)(v125 * v122), 1.0);
    LODWORD(v112) = 1.0;
    if ((__CVBuffer *)v104 == v133)
      v113 = v89;
    else
      v113 = 0;
    LOBYTE(v114) = 1;
    *(float *)&v106 = v93;
    *(float *)&v108 = v120;
    LODWORD(v109) = v98;
    *(float *)&v105 = v123 - v126;
    *(float *)&v107 = v127 * v78;
    *(float *)&v110 = (float)((float)(v52
                                    * (float)(1.0 - (float)((float)(v121 * v121) * (float)((float)(v121 * -2.0) + 3.0))))
                            * (float)(1.0 - (float)((float)(v77 * v77) * (float)((float)(v77 * -2.0) + 3.0))))
                    * v100;
    -[VideoMattingMetal renderContinuousWithSource:segmentationPixelBuffer:alpha:canonicalDisparity:disparityInFocus:focusCanonicalDisparity:fNumber:infConvolutionScale:noiseBits:disparityUpdateRate:focusThresholdHardness:cubeIntensity:usePostprocessedDisparity:dstColor:isFinalStage:properties:callbackQueue:withCallback:](v116, "renderContinuousWithSource:segmentationPixelBuffer:alpha:canonicalDisparity:disparityInFocus:focusCanonicalDisparity:fNumber:infConvolutionScale:noiseBits:disparityUpdateRate:focusThresholdHardness:cubeIntensity:usePostprocessedDisparity:dstColor:isFinalStage:properties:callbackQueue:withCallback:", v115, v95, v96, v117, 1, v105, v106, v107, v112, v111, v108, v109, v110, v114, v101,
      notificationQueue,
      v113);

  }
  if (a7)
    *a7 = 0;

}

- (void)internal_renderStageLightWithRequest:(id)a3 mattingResult:(id)a4 portraitCompletionHandler:(id)a5 status:(int *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  CVAPortraitResult_Impl *v18;
  uint64_t v19;
  double v20;
  unsigned __int8 v21;
  char v22;
  id v23;
  id v24;
  id v25;
  CVAPortraitResult_Impl *v26;
  void *v27;
  void *v28;
  int *v29;
  VideoMattingMetal *vmAccelerator;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  uint64_t v37;
  VideoMattingMetal *v38;
  void *v39;
  void *v40;
  CVAPortraitResult_Impl *v41;
  _QWORD v43[5];
  id v44;
  id v45;
  CVAPortraitResult_Impl *v46;
  id v47;
  char v48;
  void *v49[4];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "disparityPostprocessingResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *((_DWORD *)self->_stageLightStateMachine.__ptr_.__value_ + 5);
  objc_msgSend(v9, "vignetteIntensity");
  objc_msgSend(v9, "vignetteIntensity");
  v15 = v14;
  objc_msgSend(v9, "stageLightIntensity");
  objc_msgSend(v9, "stageLightIntensity");
  v17 = v16;
  v18 = [CVAPortraitResult_Impl alloc];
  v19 = objc_msgSend(v9, "destinationColorPixelBuffer");
  LODWORD(v20) = v13;
  v41 = -[CVAPortraitResult_Impl initWithMattingResult:portraitPixelBuffer:portraitStability:](v18, "initWithMattingResult:portraitPixelBuffer:portraitStability:", v10, v19, v20);
  v21 = atomic_load((unsigned __int8 *)&qword_1EF12D6D8);
  if ((v21 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D6D8))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    qword_1EF12D6D0 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D6D8);
  }
  if ((byte_1EF12D6E0 & 1) == 0)
  {
    HIBYTE(v49[2]) = 21;
    strcpy((char *)v49, "drawDisparityOverride");
    sub_1B5667F7C((uint64_t)&qword_1EF12D6D0, (uint64_t)v49);
    if (SHIBYTE(v49[2]) < 0)
      operator delete(v49[0]);
    byte_1EF12D6E0 = 1;
  }
  if (sub_1B5669844("drawDisparityOverride"))
    v22 = objc_msgSend((id)qword_1EF12D6D0, "BOOLValue");
  else
    v22 = self->_preferences.overlayShiftOnRendering != 0;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = sub_1B566B2B8;
  v43[3] = &unk_1E6936C48;
  v43[4] = self;
  v23 = v9;
  v44 = v23;
  v48 = v22;
  v24 = v12;
  v45 = v24;
  v25 = v11;
  v47 = v25;
  v26 = v41;
  v46 = v26;
  v27 = (void *)MEMORY[0x1B5E4E2A8](v43);
  v28 = v27;
  if (!self->_preferences.bypassGPUProcessing)
  {
    vmAccelerator = self->_vmAccelerator;
    v40 = v10;
    objc_msgSend(v23, "mattingRequest");
    v38 = vmAccelerator;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "disparityPostprocessingRequest");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v31, "sourceColorPixelBuffer");
    v32 = objc_msgSend(v40, "alphaMattePixelBuffer");
    v33 = objc_msgSend(v24, "canonicalDisparityPixelBuffer");
    v34 = objc_msgSend(v23, "destinationColorPixelBuffer");
    LODWORD(v35) = v17;
    LODWORD(v36) = v15;
    -[VideoMattingMetal renderStageLightWithSource:alpha:canonicalDisparity:dstColor:blackBackgroundIntensity:vignetteIntensity:isFinalStage:callbackQueue:withCallback:](v38, "renderStageLightWithSource:alpha:canonicalDisparity:dstColor:blackBackgroundIntensity:vignetteIntensity:isFinalStage:callbackQueue:withCallback:", v37, v32, v33, v34, 1, self->_notificationQueue, v35, v36, v28);

    v10 = v40;
    v29 = a6;
    if (!a6)
      goto LABEL_12;
    goto LABEL_11;
  }
  dispatch_async((dispatch_queue_t)self->_notificationQueue, v27);
  v29 = a6;
  if (a6)
LABEL_11:
    *v29 = 0;
LABEL_12:

}

- (void)internal_relightWithRequest:(id)a3 intermediateSourceBuffer:(__CVBuffer *)a4 faceKitProcessOutput:(id)a5 portraitStyleStrength:(float)a6 mattingResult:(id)a7 singleCubeData:(id)a8 portraitCompletionHandler:(id)a9 timestamp:(int64_t)a10 status:(int *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  CVAPortraitResult_Impl *v22;
  uint64_t v23;
  int v24;
  double v25;
  double v26;
  CVAPortraitResult_Impl *v27;
  unsigned __int8 v28;
  int overlayShiftOnRendering;
  void *v30;
  BOOL v31;
  id v32;
  CVAPortraitResult_Impl *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  unint64_t v38;
  unsigned int v39;
  VideoRelightingMetal *vrAccelerator;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  CVAVideoPipelinePropertiesSPI *properties;
  OS_dispatch_queue *notificationQueue;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  MTLTexture *yuvSourceDownsampledAlias;
  _BOOL4 v55;
  uint64_t v56;
  unint64_t v57;
  id v58;
  __CVBuffer *v59;
  void *v60;
  id v62;
  id v63;
  void *v64;
  id v65;
  _QWORD v66[5];
  id v67;
  id v68;
  CVAPortraitResult_Impl *v69;
  id v70;
  int64_t v71;
  BOOL v72;
  void *v73[4];

  v17 = a3;
  v18 = a5;
  v19 = a7;
  v63 = a8;
  v20 = a9;
  objc_msgSend(v19, "disparityPostprocessingResult");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [CVAPortraitResult_Impl alloc];
  v23 = objc_msgSend(v17, "destinationColorPixelBuffer");
  -[VideoRelightingMetal relightingStability](self->_vrAccelerator, "relightingStability");
  LODWORD(v25) = v24;
  LODWORD(v26) = 1.0;
  v27 = -[CVAPortraitResult_Impl initWithMattingResult:portraitPixelBuffer:portraitStability:relightingStability:](v22, "initWithMattingResult:portraitPixelBuffer:portraitStability:relightingStability:", v19, v23, v26, v25);
  v28 = atomic_load((unsigned __int8 *)&qword_1EF12D6F0);
  if ((v28 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D6F0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    qword_1EF12D6E8 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D6F0);
  }
  if ((byte_1EF12D6F8 & 1) == 0)
  {
    HIBYTE(v73[2]) = 21;
    strcpy((char *)v73, "drawDisparityOverride");
    sub_1B5667F7C((uint64_t)&qword_1EF12D6E8, (uint64_t)v73);
    if (SHIBYTE(v73[2]) < 0)
      operator delete(v73[0]);
    byte_1EF12D6F8 = 1;
  }
  if (sub_1B5669844("drawDisparityOverride"))
  {
    overlayShiftOnRendering = objc_msgSend((id)qword_1EF12D6E8, "BOOLValue");
    v30 = v18;
  }
  else
  {
    v30 = v18;
    overlayShiftOnRendering = self->_preferences.overlayShiftOnRendering;
  }
  v31 = overlayShiftOnRendering != 0;
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = sub_1B566B0A8;
  v66[3] = &unk_1E6936C20;
  v66[4] = self;
  v65 = v17;
  v67 = v65;
  v72 = v31;
  v62 = v21;
  v68 = v62;
  v32 = v20;
  v70 = v32;
  v33 = v27;
  v69 = v33;
  v71 = a10;
  v34 = (void *)MEMORY[0x1B5E4E2A8](v66);
  v64 = v34;
  if (self->_preferences.bypassGPUProcessing)
  {
    dispatch_async((dispatch_queue_t)self->_notificationQueue, v34);
    v35 = v62;
    v36 = v63;
  }
  else
  {
    v60 = v30;
    v58 = v19;
    v37 = sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice"));
    v57 = v38;
    v39 = v37;
    vrAccelerator = self->_vrAccelerator;
    v59 = a4;
    if (!a4)
    {
      objc_msgSend(v65, "mattingRequest");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "disparityPostprocessingRequest");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (__CVBuffer *)objc_msgSend(v51, "sourceColorPixelBuffer");
    }
    v56 = objc_msgSend(v19, "alphaMattePixelBuffer");
    if (v39 == 1)
    {
      v55 = 0;
    }
    else
    {
      objc_msgSend(v65, "mattingRequest");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v53, "segmentationPixelBuffer") != 0;
    }
    v41 = v39;
    yuvSourceDownsampledAlias = self->_yuvSourceDownsampledAlias;
    objc_msgSend(v65, "mattingRequest");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "skinSegmentationPixelBuffer");
    v44 = objc_msgSend(v65, "destinationColorPixelBuffer");
    -[VideoMattingMetal colorSim](self->_vmAccelerator, "colorSim");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideoMattingMetal filteredBeforeSmoothDisparity](self->_vmAccelerator, "filteredBeforeSmoothDisparity");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    notificationQueue = self->_notificationQueue;
    properties = self->_properties;
    *(float *)&v49 = 1.0 / self->_vmDynamicParams.focusCanonicalDisparity;
    v36 = v63;
    *(float *)&v50 = a6;
    -[VideoRelightingMetal renderWithSrcImage:srcAlpha:trustAlpha:isUnifiedRendering:yuvSourceDownsampled:skinSegmentation:dstImage:faceKitProcessOutput:portraitStyleStrength:colorSim:disparity:focusDistance:singleCubeData:properties:callbackQueue:callback:](vrAccelerator, "renderWithSrcImage:srcAlpha:trustAlpha:isUnifiedRendering:yuvSourceDownsampled:skinSegmentation:dstImage:faceKitProcessOutput:portraitStyleStrength:colorSim:disparity:focusDistance:singleCubeData:properties:callbackQueue:callback:", v59, v56, v55, (v57 >> 8) & 1, yuvSourceDownsampledAlias, v43, v50, v49, v44, v60, v45, v46, v63, properties, notificationQueue, v64);

    if (v41 != 1)
    v30 = v60;
    v19 = v58;
    v35 = v62;
    if (!a4)
    {

    }
  }
  if (a11)
    *a11 = 0;

}

- (int)postprocessDisparityWithRequest:(id)a3 disparityPostprocessingCompletionHandler:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  int v11;
  id v13;
  int v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0;
  v13 = 0;
  v8 = -[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:](self, "validateDisparityPostprocessingRequest:error:", v6, &v13);
  v9 = v13;
  if (v8)
  {
    v10 = -[CVAPortraitVideoPipeline_Impl internal_postprocessDisparityWithRequest:disparityPostprocessingCompletionHandler:isFinalStage:status:](self, "internal_postprocessDisparityWithRequest:disparityPostprocessingCompletionHandler:isFinalStage:status:", v6, v7, 1, &v14);
    v11 = v14;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_fault_impl(&dword_1B5656000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
    }
    v11 = objc_msgSend(v9, "code");
  }

  return v11;
}

- (int)postprocessDisparityWithRequest:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  id v7;
  int v8;
  id v10;
  int v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0;
  v10 = 0;
  v5 = -[CVAPortraitVideoPipeline_Impl validateDisparityPostprocessingRequest:error:](self, "validateDisparityPostprocessingRequest:error:", v4, &v10);
  v6 = v10;
  if (v5)
  {
    v7 = -[CVAPortraitVideoPipeline_Impl internal_postprocessDisparityWithRequest:disparityPostprocessingCompletionHandler:isFinalStage:status:](self, "internal_postprocessDisparityWithRequest:disparityPostprocessingCompletionHandler:isFinalStage:status:", v4, 0, 1, &v11);
    v8 = v11;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_fault_impl(&dword_1B5656000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
    }
    v8 = objc_msgSend(v6, "code");
  }

  return v8;
}

- (int)extractMatteWithRequest:(id)a3 disparityPostprocessingCompletionHandler:(id)a4 mattingCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  uint64_t v18;
  id v19;
  int v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v19 = 0;
  v11 = -[CVAPortraitVideoPipeline_Impl validateMattingRequest:error:](self, "validateMattingRequest:error:", v8, &v19);
  v12 = v19;
  if (v11)
  {
    objc_msgSend(v8, "disparityPostprocessingRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAPortraitVideoPipeline_Impl internal_postprocessDisparityWithRequest:disparityPostprocessingCompletionHandler:isFinalStage:status:](self, "internal_postprocessDisparityWithRequest:disparityPostprocessingCompletionHandler:isFinalStage:status:", v13, v9, 0, &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    buf[0] = 0;
    LOBYTE(v18) = 1;
    v15 = -[CVAPortraitVideoPipeline_Impl internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:mattingCompletionHandler:isFinalStage:status:](self, "internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:mattingCompletionHandler:isFinalStage:status:", v8, v14, 1, 0, buf, v10, NAN, NAN, NAN, v18, &v20);
    v16 = v20;

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v12;
      _os_log_fault_impl(&dword_1B5656000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
    }
    v16 = objc_msgSend(v12, "code");
  }

  return v16;
}

- (int)extractMatteWithRequest:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v12;
  id v13;
  int v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v13 = 0;
  v5 = -[CVAPortraitVideoPipeline_Impl validateMattingRequest:error:](self, "validateMattingRequest:error:", v4, &v13);
  v6 = v13;
  if (v5)
  {
    objc_msgSend(v4, "disparityPostprocessingRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAPortraitVideoPipeline_Impl internal_postprocessDisparityWithRequest:disparityPostprocessingCompletionHandler:isFinalStage:status:](self, "internal_postprocessDisparityWithRequest:disparityPostprocessingCompletionHandler:isFinalStage:status:", v7, 0, 0, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    buf[0] = 0;
    LOBYTE(v12) = 1;
    v9 = -[CVAPortraitVideoPipeline_Impl internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:mattingCompletionHandler:isFinalStage:status:](self, "internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:mattingCompletionHandler:isFinalStage:status:", v4, v8, 1, 0, buf, 0, NAN, NAN, NAN, v12, &v14);
    v10 = v14;

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_fault_impl(&dword_1B5656000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
    }
    v10 = objc_msgSend(v6, "code");
  }

  return v10;
}

- (int)renderWithRequest:(id)a3 disparityPostprocessingCompletionHandler:(id)a4 mattingCompletionHandler:(id)a5 portraitCompletionHandler:(id)a6
{
  id v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  int v14;
  int v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  BOOL IsEmpty;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  char isKindOfClass;
  int v41;
  BOOL v42;
  int v43;
  char v44;
  int v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  char v58;
  VideoMattingMetal *vmAccelerator;
  void *v60;
  uint64_t v61;
  OS_dispatch_queue *notificationQueue;
  VideoMattingMetal *v63;
  void *v64;
  void *v65;
  VideoMattingMetal *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  unint64_t v72;
  _BOOL8 v73;
  void *v74;
  _BOOL8 v75;
  void *v76;
  void *v77;
  unsigned __int8 v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  BOOL v84;
  void *v85;
  void *v86;
  void *v87;
  BOOL v88;
  void *v89;
  void *v90;
  BOOL v91;
  void *v92;
  unsigned __int8 v93;
  unsigned __int8 v94;
  void *v95;
  BOOL v96;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v97;
  void *m_ptr;
  void *v99;
  void *v100;
  void *faceKitProcessOutput;
  int v102;
  int v103;
  void *v104;
  double v105;
  _QWORD *v106;
  uint64_t v107;
  int result;
  int v109;
  void *v110;
  char v111;
  void *v112;
  char v113;
  void *v114;
  char v115;
  uint64_t v116;
  BOOL v117;
  int v118;
  void *v119;
  std::chrono::system_clock::time_point v120;
  id v121;
  id v122;
  id v123;
  id v124;
  _QWORD v125[5];
  id v126;
  int v127;
  void *__p[4];
  _QWORD v129[3];
  _QWORD *v130;
  uint64_t v131;
  CGRect v132;

  v131 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v124 = a4;
  v123 = a5;
  v121 = a6;
  sub_1B56A2EE4(v129, (uint64_t)&self->_metalContext, self->_debugGPUCaptureFrameNumber);
  v120.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  v11 = atomic_load((unsigned __int8 *)&qword_1EF12D400);
  if ((v11 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D400))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    qword_1EF12D470 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D400);
  }
  if ((byte_1EF12D480 & 1) == 0)
  {
    HIBYTE(__p[2]) = 10;
    strcpy((char *)__p, "enableSDoF");
    sub_1B5667F7C((uint64_t)&qword_1EF12D470, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    byte_1EF12D480 = 1;
  }
  v12 = atomic_load((unsigned __int8 *)&qword_1EF12D410);
  if ((v12 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D410))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    qword_1EF12D478 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D410);
  }
  if ((byte_1EF12D488 & 1) == 0)
  {
    HIBYTE(__p[2]) = 16;
    strcpy((char *)__p, "enableRelighting");
    sub_1B5667F7C((uint64_t)&qword_1EF12D478, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    byte_1EF12D488 = 1;
  }
  v13 = atomic_load((unsigned __int8 *)&qword_1EF12D420);
  if ((v13 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D420))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    qword_1EF12D498 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D420);
  }
  if ((byte_1EF12D490 & 1) == 0)
  {
    __p[0] = operator new(0x28uLL);
    *(_OWORD *)&__p[1] = xmmword_1B56AC150;
    strcpy((char *)__p[0], "enableInfimumConvolutionInRelighting");
    sub_1B5667F7C((uint64_t)&qword_1EF12D498, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    byte_1EF12D490 = 1;
  }
  v14 = -[CVAVideoPipelinePropertiesSPI relightDisplayMode](self->_properties, "relightDisplayMode");
  if ((byte_1EF12D9B9 & 1) == 0)
  {
    v15 = v14;
    v16 = atomic_load((unsigned __int8 *)&qword_1EF12D310);
    if ((v16 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D310))
    {
      sub_1B5669E3C();
      __cxa_atexit((void (*)(void *))sub_1B566A020, &xmmword_1EF12D318, &dword_1B5656000);
      __cxa_guard_release(&qword_1EF12D310);
    }
    v17 = atomic_load((unsigned __int8 *)&qword_1EF12D4A8);
    if ((v17 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D4A8))
    {
      if (v15 == 0x7FFFFFFF)
        v109 = 0;
      else
        v109 = v15 + 1;
      dword_1EF12D738 = v109;
      __cxa_guard_release(&qword_1EF12D4A8);
    }
    if (dword_1EF12D738 != v15)
    {
      dword_1EF12D738 = v15;
      if (v15 == 0x7FFFFFFF)
      {
        v18 = (void *)qword_1EF12D3A0;
        qword_1EF12D3A0 = 0;

        v19 = (void *)qword_1EF12D390;
        qword_1EF12D390 = 0;

        if (!byte_1EF12D3B8)
          goto LABEL_29;
        v20 = 0x7FFFFFFFLL;
        goto LABEL_27;
      }
      if (objc_msgSend((id)qword_1EF12D398, "count"))
      {
        v20 = (v15 % (int)objc_msgSend((id)qword_1EF12D398, "count"));
        if ((v20 & 0x80000000) != 0)
          v20 = v20 + objc_msgSend((id)qword_1EF12D398, "count");
        v21 = (void *)qword_1EF12D3A8;
        objc_msgSend((id)qword_1EF12D398, "objectAtIndexedSubscript:", (int)v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringByAppendingString:", v22);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)qword_1EF12D3A0;
        qword_1EF12D3A0 = v23;

        v25 = (void *)qword_1EF12D390;
        qword_1EF12D390 = 0;

        if (byte_1EF12D3B8)
LABEL_27:
          NSLog(CFSTR(">>>>>>>>> FileConfig: switchToPersistentConfig() - singleton = (%p), index = %d"), &xmmword_1EF12D318, v20);
      }
      else
      {
        v26 = (void *)qword_1EF12D3A0;
        qword_1EF12D3A0 = 0;

      }
    }
  }
LABEL_29:
  sub_1B5668204();
  v27 = -[CVAVideoPipelinePropertiesSPI colorPixelBufferWidth](self->_properties, "colorPixelBufferWidth");
  v28 = -[CVAVideoPipelinePropertiesSPI colorPixelBufferHeight](self->_properties, "colorPixelBufferHeight");
  objc_msgSend(v10, "mattingRequest");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "primaryCaptureRect");
  IsEmpty = CGRectIsEmpty(v132);

  if (IsEmpty)
  {
    v31 = (double)v27;
    v32 = (double)v28;
    v33 = 0.0;
    v34 = 0.0;
  }
  else
  {
    objc_msgSend(v10, "mattingRequest");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "primaryCaptureRect");
    v33 = v36;
    v34 = v37;
    v31 = v38;
    v32 = v39;

  }
  -[VideoMattingMetal setPrimaryCaptureRect:](self->_vmAccelerator, "setPrimaryCaptureRect:", v33, v34, v31, v32);
  -[VideoRelightingMetal setPrimaryCaptureRect:](self->_vrAccelerator, "setPrimaryCaptureRect:", v33, v34, v31, v32);
  v127 = 0;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v41 = objc_opt_isKindOfClass();
  v126 = 0;
  v42 = -[CVAPortraitVideoPipeline_Impl validatePortraitRequest:error:](self, "validatePortraitRequest:error:", v10, &v126);
  v122 = v126;
  if (v42)
  {
    v118 = objc_msgSend((id)qword_1EF12D470, "BOOLValue");
    if ((isKindOfClass & 1) != 0)
    {
      v43 = objc_msgSend((id)qword_1EF12D478, "BOOLValue") & (v41 ^ 1);
      if (v41 & 1 | ((v43 & 1) == 0))
      {
        v44 = v41;
        if ((v41 & 1) == 0)
        {
LABEL_36:
          v45 = v43 & (v118 ^ 1);
          goto LABEL_42;
        }
      }
      else
      {
        v44 = objc_msgSend((id)qword_1EF12D498, "BOOLValue");
        if ((v41 & 1) == 0)
          goto LABEL_36;
      }
    }
    else
    {
      v43 = 0;
      v44 = v41;
      if ((v41 & 1) == 0)
        goto LABEL_36;
    }
    v45 = 1;
LABEL_42:
    v117 = (objc_msgSend((id)qword_1EF12D470, "BOOLValue") & 1) == 0 && sub_1B5669844("enableSDoF");
    if ((v44 & 1) != 0)
    {
      objc_msgSend(v10, "mattingRequest");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "disparityPostprocessingRequest");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "sourceColorPixelBufferGravity");
      __p[0] = v49;
      __p[1] = v50;
      __p[2] = v51;

      v52 = sub_1B5673E38((double *)__p);
      v54 = v53;
      v56 = v55;
    }
    else
    {
      v52 = NAN;
      v54 = NAN;
      v56 = NAN;
    }
    objc_msgSend(v10, "mattingRequest");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v57, "segmentationPixelBuffer"))
    {
      v58 = -[CVAVideoPipelinePropertiesSPI sceneMonitorUsesDisparityStatistics](self->_properties, "sceneMonitorUsesDisparityStatistics");

      if ((v58 & 1) == 0)
      {
        vmAccelerator = self->_vmAccelerator;
        objc_msgSend(v10, "mattingRequest");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "segmentationPixelBuffer");
        notificationQueue = self->_notificationQueue;
        v125[0] = MEMORY[0x1E0C809B0];
        v125[1] = 3221225472;
        v125[2] = sub_1B5669B44;
        v125[3] = &unk_1E6936C70;
        v125[4] = self;
        -[VideoMattingMetal segmentationAverage:callbackQueue:callback:](vmAccelerator, "segmentationAverage:callbackQueue:callback:", v61, notificationQueue, v125);

        if (v45 & 1 | ((isKindOfClass & 1) == 0))
          goto LABEL_59;
        goto LABEL_54;
      }
    }
    else
    {

    }
    self->_previousFramePersonSegmentationRatio = 1.0;
    if (v45 & 1 | ((isKindOfClass & 1) == 0))
    {
LABEL_59:
      if (v45)
      {
        v66 = self->_vmAccelerator;
        if ((v41 & 1) != 0)
        {
          objc_msgSend(v10, "proxyCubeData");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "cubeData");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[VideoMattingMetal setStageLightProxyCubeData:cubeData:](v66, "setStageLightProxyCubeData:cubeData:", v67, v68);

        }
        else
        {
          -[VideoMattingMetal setStageLightProxyCubeData:cubeData:](self->_vmAccelerator, "setStageLightProxyCubeData:cubeData:", 0, 0);
        }
      }
      objc_msgSend(v10, "mattingRequest");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "disparityPostprocessingRequest");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[CVAPortraitVideoPipeline_Impl internal_postprocessDisparityWithRequest:disparityPostprocessingCompletionHandler:isFinalStage:status:](self, "internal_postprocessDisparityWithRequest:disparityPostprocessingCompletionHandler:isFinalStage:status:", v70, v124, 0, &v127);
      v119 = (void *)objc_claimAutoreleasedReturnValue();

      v71 = sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice"));
      v72 = (v71 >> 40) & ((_DWORD)v71 == 1);
      if ((v71 >> 40) & ((_DWORD)v71 == 1) | v45 & 1)
      {
        v73 = 1;
      }
      else if ((_DWORD)v71)
      {
        v73 = 0;
      }
      else
      {
        objc_msgSend(v10, "mattingRequest");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v74, "segmentationPixelBuffer") == 0;

      }
      v75 = ((v45 | v43) & 1) != 0 || !self->_renderForegroundBlur;
      objc_msgSend(v10, "mattingRequest");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v116) = v45;
      -[CVAPortraitVideoPipeline_Impl internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:isMattingNeeded:mattingCompletionHandler:isFinalStage:status:](self, "internal_extractMatteWithRequest:disparityPostprocessingResult:usePostprocessedDisparity:dilateForegroundMask:gravity:transitionData:isMattingNeeded:mattingCompletionHandler:isFinalStage:status:", v76, v119, v73, v72, &self->_transitionData, v75, v52, v54, v56, v123, v116, &v127);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      v78 = atomic_load((unsigned __int8 *)&qword_1EF12D418);
      if ((v78 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D418))
      {
        +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = objc_msgSend(v110, "BOOLForKey:", CFSTR("CVAPhotoDebugBuffers"));

        byte_1EF12D701 = v111;
        __cxa_guard_release(&qword_1EF12D418);
      }
      if (byte_1EF12D701)
      {
        objc_msgSend(v77, "disparityPostprocessingResult");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mattingRequest");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "disparityPostprocessingRequest");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1B5669D60(CFSTR("IN.colorPixelBuffer"), (__CVBuffer *)objc_msgSend(v81, "sourceColorPixelBuffer"));

        objc_msgSend(v10, "mattingRequest");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "disparityPostprocessingRequest");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v83, "fixedPointDisparityPixelBuffer") == 0;

        if (!v84)
        {
          objc_msgSend(v10, "mattingRequest");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "disparityPostprocessingRequest");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1B5669D60(CFSTR("IN.fixedPointDisparityPixelBuffer"), (__CVBuffer *)objc_msgSend(v86, "fixedPointDisparityPixelBuffer"));

        }
        objc_msgSend(v10, "mattingRequest");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "segmentationPixelBuffer") == 0;

        if (!v88)
        {
          objc_msgSend(v10, "mattingRequest");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1B5669D60(CFSTR("IN.segmentationPixelBuffer"), (__CVBuffer *)objc_msgSend(v89, "segmentationPixelBuffer"));

        }
        objc_msgSend(v10, "mattingRequest");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = objc_msgSend(v90, "skinSegmentationPixelBuffer") == 0;

        if (!v91)
        {
          objc_msgSend(v10, "mattingRequest");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1B5669D60(CFSTR("IN.skinSegmentationPixelBuffer"), (__CVBuffer *)objc_msgSend(v92, "skinSegmentationPixelBuffer"));

        }
        if (v79 && objc_msgSend(v79, "postprocessedDisparityPixelBuffer"))
          sub_1B5669D60(CFSTR("OUT.postprocessedDisparityPixelBuffer"), (__CVBuffer *)objc_msgSend(v79, "postprocessedDisparityPixelBuffer"));
        if (objc_msgSend(v77, "alphaMattePixelBuffer"))
          sub_1B5669D60(CFSTR("OUT.alphaMattePixelBuffer"), (__CVBuffer *)objc_msgSend(v77, "alphaMattePixelBuffer"));
        if (objc_msgSend(v10, "destinationColorPixelBuffer"))
          sub_1B5669D60(CFSTR("OUT.colorPixelBuffer"), (__CVBuffer *)objc_msgSend(v10, "destinationColorPixelBuffer"));

      }
      v93 = atomic_load((unsigned __int8 *)&qword_1EF12D408);
      if ((v93 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D408))
      {
        +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = objc_msgSend(v112, "BOOLForKey:", CFSTR("CVAPhotoLogValidation"));

        byte_1EF12D708 = v113;
        __cxa_guard_release(&qword_1EF12D408);
      }
      if (byte_1EF12D708)
      {
        v94 = atomic_load((unsigned __int8 *)&qword_1EF12D718);
        if ((v94 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D718))
        {
          +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = objc_msgSend(v114, "BOOLForKey:", CFSTR("CVAPhotoLogValidationPassed"));

          byte_1EF12D710 = v115;
          __cxa_guard_release(&qword_1EF12D718);
        }
        if ((sub_1B5669B50(-[CVAVideoPipelinePropertiesSPI videoPipelineDevice](self->_properties, "videoPipelineDevice")) & 0x1000000000000) != 0)
        {
          objc_msgSend(v10, "mattingRequest");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = objc_msgSend(v95, "segmentationPixelBuffer") == 0;

          if (v96)
          {
            NSLog(CFSTR("%s mattingRequest.segmentationPixelBuffer is nil!"), "> > > CVAPhoto validation FAILED:");
          }
          else if (byte_1EF12D710)
          {
            NSLog(CFSTR("%s (mattingRequest.segmentationPixelBuffer != nil) check PASSED"), "> > > CVAPhoto validation PASSED:");
          }
        }
      }
      v97 = v120.__d_.__rep_ / 1000;
      if (v43)
      {
        if (v118)
        {
          if (!self->_intermediateRelightSourceBuffer.m_ptr)
          {
            sub_1B5667BD4(__p, (CVPixelBufferRef)objc_msgSend(v10, "destinationColorPixelBuffer"));
            m_ptr = self->_intermediateRelightSourceBuffer.m_ptr;
            self->_intermediateRelightSourceBuffer.m_ptr = __p[0];
            if (m_ptr)
              CFRelease(m_ptr);
          }
          -[CVAPortraitVideoPipeline_Impl internal_renderWithRequest:dstBuffer:mattingResult:portraitCompletionHandler:status:timestamp:](self, "internal_renderWithRequest:dstBuffer:mattingResult:portraitCompletionHandler:status:timestamp:", v10);
          v99 = self->_intermediateRelightSourceBuffer.m_ptr;
        }
        else
        {
          v99 = 0;
        }
        -[CVAVideoPipelinePropertiesSPI faceKitProcessOutputOverride](self->_properties, "faceKitProcessOutputOverride");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        if (v100)
        {
          -[CVAVideoPipelinePropertiesSPI faceKitProcessOutputOverride](self->_properties, "faceKitProcessOutputOverride");
          faceKitProcessOutput = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          faceKitProcessOutput = self->_faceKitProcessOutput;
        }
        -[CVAVideoPipelinePropertiesSPI portraitStyleStrengthOverride](self->_properties, "portraitStyleStrengthOverride");
        -[CVAVideoPipelinePropertiesSPI portraitStyleStrengthOverride](self->_properties, "portraitStyleStrengthOverride");
        v103 = v102;
        objc_msgSend(v10, "foregroundColorCube");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v105) = v103;
        -[CVAPortraitVideoPipeline_Impl internal_relightWithRequest:intermediateSourceBuffer:faceKitProcessOutput:portraitStyleStrength:mattingResult:singleCubeData:portraitCompletionHandler:timestamp:status:](self, "internal_relightWithRequest:intermediateSourceBuffer:faceKitProcessOutput:portraitStyleStrength:mattingResult:singleCubeData:portraitCompletionHandler:timestamp:status:", v10, v99, faceKitProcessOutput, v77, v104, v121, v105, v97, &v127);

        if (v100)
      }
      else if (v41 & 1 | !v117)
      {
        if ((isKindOfClass & 1) != 0)
        {
          -[CVAPortraitVideoPipeline_Impl internal_renderWithRequest:dstBuffer:mattingResult:portraitCompletionHandler:status:timestamp:](self, "internal_renderWithRequest:dstBuffer:mattingResult:portraitCompletionHandler:status:timestamp:", v10, objc_msgSend(v10, "destinationColorPixelBuffer"), v77, v121, &v127, v97);
        }
        else if ((v41 & 1) != 0)
        {
          -[CVAPortraitVideoPipeline_Impl internal_renderStageLightWithRequest:mattingResult:portraitCompletionHandler:status:](self, "internal_renderStageLightWithRequest:mattingResult:portraitCompletionHandler:status:", v10, v77, v121, &v127);
        }
      }
      v46 = v127;

      goto LABEL_112;
    }
LABEL_54:
    v63 = self->_vmAccelerator;
    if ((v43 & 1) != 0)
    {
      -[VideoMattingMetal setPortraitForegroundCubeData:backgroundCubeData:](self->_vmAccelerator, "setPortraitForegroundCubeData:backgroundCubeData:", 0, 0);
    }
    else
    {
      objc_msgSend(v10, "foregroundColorCube");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "backgroundColorCube");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[VideoMattingMetal setPortraitForegroundCubeData:backgroundCubeData:](v63, "setPortraitForegroundCubeData:backgroundCubeData:", v64, v65);

    }
    goto LABEL_59;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    LODWORD(__p[0]) = 138412290;
    *(void **)((char *)__p + 4) = v122;
    _os_log_fault_impl(&dword_1B5656000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%@", (uint8_t *)__p, 0xCu);
  }
  v46 = objc_msgSend(v122, "code");
LABEL_112:

  if (v130)
  {
    (*(void (**)(_QWORD *))(*v130 + 48))(v130);
    v106 = v130;
    if (v130 == v129)
    {
      v107 = 4;
      v106 = v129;
    }
    else
    {
      if (!v130)
      {
LABEL_118:

        return v46;
      }
      v107 = 5;
    }
    (*(void (**)(void))(*v106 + 8 * v107))();
    goto LABEL_118;
  }
  result = sub_1B5658FA0();
  __break(1u);
  return result;
}

- (int)renderWithRequest:(id)a3
{
  return -[CVAPortraitVideoPipeline_Impl renderWithRequest:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:](self, "renderWithRequest:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:", a3, 0, 0, 0);
}

- (int)renderSingleEffectWithRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 error:(id *)a5 disparityPostprocessingCompletionHandler:(id)a6 mattingCompletionHandler:(id)a7 portraitCompletionHandler:(id)a8 requestFrom:(id)a9 requestTo:(id)a10
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CVAPortraitVideoPipeline_Impl *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  char v37;
  void *v38;
  float v39;
  float v40;
  unsigned __int8 v41;
  void *v42;
  float v43;
  float v44;
  float v45;
  float v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  NSDictionary *v52;
  NSDictionary *metadata;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  int v61;
  int v62;
  int v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  NSDictionary *v70;
  NSDictionary *faceKitProcessOutput;
  void *v72;
  char v73;
  uint64_t v74;
  NSDictionary *v75;
  void *v76;
  char v77;
  unsigned __int8 v78;
  void *v79;
  void *v80;
  char v81;
  unsigned int v82;
  void *v83;
  int v84;
  NSDictionary *v85;
  void *v87;
  void *v88;
  char v89;
  uint64_t v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  CGRect v96;

  v16 = a3;
  v94 = a6;
  v93 = a7;
  v92 = a8;
  v95 = a9;
  v17 = a10;
  objc_msgSend(v16, "post");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18
    && (objc_msgSend(v16, "post"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v19,
        v18,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v16, "post");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(v16, "background");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v23 = objc_opt_isKindOfClass();

  if ((v23 & 1) != 0)
  {
    objc_msgSend(v16, "background");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "sourceColorPixelBuffer");
    if (v21)
    {
      objc_msgSend(v21, "singleColorCube");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    +[CVAVideoPipelineLibrary colorCubePortraitRequestForPortraitVideoPipeline:withWithSourceColorPixelBuffer:destinationColorPixelBuffer:cubeData:](CVAVideoPipelineLibrary, "colorCubePortraitRequestForPortraitVideoPipeline:withWithSourceColorPixelBuffer:destinationColorPixelBuffer:cubeData:", self, v25, a4, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)

    objc_msgSend(v29, "setParentGenericRequestFrom:", v95);
    objc_msgSend(v29, "setParentGenericRequestTo:", v17);
    v30 = self;
    v32 = v93;
    v31 = v94;
    v33 = v92;
    v34 = -[CVAPortraitVideoPipeline_Impl renderWithRequest:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:](v30, "renderWithRequest:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:", v29, v94, v93, v92);
    v35 = v34;
    if (a5 && v34 == -22914)
    {
      +[CVAPhotoExceptionMetalResourceUnavailable error](CVAPhotoExceptionMetalResourceUnavailable, "error");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v35 = -22914;
    }
    goto LABEL_64;
  }
  objc_msgSend(v16, "background");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HIDWORD(v90) = objc_opt_isKindOfClass();

  if (v21)
  {
    objc_msgSend(v21, "singleColorCube");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v21, "singleColorCube");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "singleColorCube");
    }
    else
    {
      objc_msgSend(v21, "foregroundColorCube");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "backgroundColorCube");
    }
    v91 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v91 = 0;
    v29 = 0;
  }
  objc_msgSend(v16, "background");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v37 = objc_opt_isKindOfClass();

  if ((v37 & 1) != 0)
  {
    objc_msgSend(v16, "background");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "simulatedFocalRatio");
    v40 = v39;
    v41 = atomic_load((unsigned __int8 *)&qword_1EF12D430);
    if ((v41 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D430))
    {
      +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v90) = objc_msgSend(v87, "BOOLForKey:", CFSTR("CVAPhotoFSliderOverridesPortraitStyleStrength"));

      byte_1EF12D2F8 = v90;
      __cxa_guard_release(&qword_1EF12D430);
    }
    if (byte_1EF12D2F8
      && (objc_msgSend(v16, "light"), v42 = (void *)objc_claimAutoreleasedReturnValue(), v42, v42))
    {
      objc_msgSend(v38, "simulatedFocalRatio");
      v44 = (float)((float)(v43 + -1.4) / 14.6) + 0.0;
      v45 = fminf(v44, 1.0);
      if (v44 >= 0.0)
        v46 = v45;
      else
        v46 = 0.0;
      v40 = 4.5;
    }
    else
    {
      v46 = NAN;
    }
    objc_msgSend(v38, "sbufMetadata", v90);
    v52 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    metadata = self->_metadata;
    self->_metadata = v52;

    objc_msgSend(v38, "sbufMetadata");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideoMattingMetal setSbufMetadata:](self->_vmAccelerator, "setSbufMetadata:", v54);

    objc_msgSend(v38, "primaryCaptureRect");
    if (CGRectIsNull(v96))
    {
      v55 = -[CVAVideoPipelinePropertiesSPI colorPixelBufferWidth](self->_properties, "colorPixelBufferWidth");
      v56 = -[CVAVideoPipelinePropertiesSPI colorPixelBufferHeight](self->_properties, "colorPixelBufferHeight");
      v57 = (double)v55;
      v58 = (double)v56;
      v59 = 0.0;
      v60 = 0.0;
    }
    else
    {
      objc_msgSend(v38, "primaryCaptureRect");
    }
    -[VideoMattingMetal setPrimaryCaptureRect:](self->_vmAccelerator, "setPrimaryCaptureRect:", v59, v60, v57, v58);
    objc_msgSend(v38, "mattingRequest");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sourceColorGain");
    v62 = v61;
    objc_msgSend(v38, "sourceColorLux");
    LODWORD(v64) = v63;
    LODWORD(v65) = 0.5;
    *(float *)&v66 = v40;
    LODWORD(v67) = v62;
    +[CVAVideoPipelineLibrary syntheticDepthOfFieldPortraitRequestWithMattingRequest:destinationColorPixelBuffer:backgroundColorCube:foregroundColorCube:colorCubeIntensity:simulatedFocalRatio:sourceColorGain:sourceColorLux:](CVAVideoPipelineLibrary, "syntheticDepthOfFieldPortraitRequestWithMattingRequest:destinationColorPixelBuffer:backgroundColorCube:foregroundColorCube:colorCubeIntensity:simulatedFocalRatio:sourceColorGain:sourceColorLux:", v47, a4, v91, v29, v65, v66, v67, v64);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((v90 & 0x100000000) == 0)
    {
      v24 = 0;
      v46 = NAN;
      goto LABEL_37;
    }
    objc_msgSend(v16, "background");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "mattingRequest");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v48) = 0;
    LODWORD(v49) = 1.0;
    LODWORD(v50) = 0;
    LODWORD(v51) = 0;
    +[CVAVideoPipelineLibrary syntheticDepthOfFieldPortraitRequestWithMattingRequest:destinationColorPixelBuffer:backgroundColorCube:foregroundColorCube:colorCubeIntensity:simulatedFocalRatio:sourceColorGain:sourceColorLux:](CVAVideoPipelineLibrary, "syntheticDepthOfFieldPortraitRequestWithMattingRequest:destinationColorPixelBuffer:backgroundColorCube:foregroundColorCube:colorCubeIntensity:simulatedFocalRatio:sourceColorGain:sourceColorLux:", v47, a4, 0, v29, v48, v49, v50, v51);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = NAN;
  }

LABEL_37:
  objc_msgSend(v16, "light");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend(v16, "light");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "faceKitProcessOutput");
    v70 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    faceKitProcessOutput = self->_faceKitProcessOutput;
    self->_faceKitProcessOutput = v70;

    self->_portraitStyleStrength = v46;
    objc_msgSend(v16, "light");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v73 = objc_opt_isKindOfClass();

    if ((v73 & 1) != 0)
    {
      if ((v90 & 0x100000000) != 0)
        v74 = 5;
      else
        v74 = 1;
LABEL_55:
      -[CVAVideoPipelinePropertiesSPI setRelightDisplayMode:](self->_properties, "setRelightDisplayMode:", v74);
      goto LABEL_56;
    }
    objc_msgSend(v16, "light");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v77 = objc_opt_isKindOfClass();

    if ((v77 & 1) != 0)
    {
      v78 = atomic_load((unsigned __int8 *)&qword_1EF12D728);
      if ((v78 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D728))
      {
        +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v88, "BOOLForKey:", CFSTR("CVAPhotoEnforceNewAPI")) ^ 1;

        byte_1EF12D720 = v89;
        __cxa_guard_release(&qword_1EF12D728);
      }
      if (byte_1EF12D720)
      {
        objc_msgSend(v16, "post");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (v79)
        {
          objc_msgSend(v16, "post");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v81 = objc_opt_isKindOfClass();

          if ((v81 & 1) != 0)
            goto LABEL_48;
        }
      }
      else
      {
        objc_msgSend(v16, "post");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v83, "isMono");

        if (v84)
        {
LABEL_48:
          v82 = 4;
          goto LABEL_52;
        }
      }
      v82 = 3;
LABEL_52:
      if ((v90 & 0x100000000) != 0)
        v74 = v82;
      else
        v74 = 2;
      goto LABEL_55;
    }
  }
  else
  {
    v75 = self->_faceKitProcessOutput;
    self->_faceKitProcessOutput = 0;

    self->_portraitStyleStrength = NAN;
  }
  -[CVAVideoPipelinePropertiesSPI setRelightDisplayMode:](self->_properties, "setRelightDisplayMode:", 0);
LABEL_56:
  if (objc_msgSend(v16, "isTmpConfig"))
    -[CVAVideoPipelinePropertiesSPI setRelightDisplayMode:](self->_properties, "setRelightDisplayMode:", 0x7FFFFFFFLL);
  objc_msgSend(v24, "setParentGenericRequestFrom:", v95);
  objc_msgSend(v24, "setParentGenericRequestTo:", v17);
  if (v24)
  {
    v35 = -[CVAPortraitVideoPipeline_Impl renderWithRequest:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:](self, "renderWithRequest:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:", v24, v94, v93, v92);
    v85 = self->_faceKitProcessOutput;
    self->_faceKitProcessOutput = 0;

    if (a5 && v35 == -22914)
    {
      +[CVAPhotoExceptionMetalResourceUnavailable error](CVAPhotoExceptionMetalResourceUnavailable, "error");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v35 = -22914;
    }
  }
  else
  {
    v35 = -22913;
  }

  v32 = v93;
  v31 = v94;
  v33 = v92;
LABEL_64:

  return v35;
}

- (int)renderWithRequest:(id)a3 requestTo:(id)a4 mixValue:(float)a5 destinationColorPixelBuffer:(__CVBuffer *)a6 error:(id *)a7 disparityPostprocessingCompletionHandler:(id)a8 mattingCompletionHandler:(id)a9 portraitCompletionHandler:(id)a10
{
  return -[CVAPortraitVideoPipeline_Impl renderWithRequest:requestTo:mixValue:destinationColorPixelBuffer:error:sceneMonitorUsesDisparityStatistics:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:](self, "renderWithRequest:requestTo:mixValue:destinationColorPixelBuffer:error:sceneMonitorUsesDisparityStatistics:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:", a3, a4, a6, a7, 1, a8, a9, a10);
}

- (int)renderWithRequest:(id)a3 requestTo:(id)a4 mixValue:(float)a5 destinationColorPixelBuffer:(__CVBuffer *)a6 error:(id *)a7 sceneMonitorUsesDisparityStatistics:(BOOL)a8 disparityPostprocessingCompletionHandler:(id)a9 mattingCompletionHandler:(id)a10 portraitCompletionHandler:(id)a11
{
  _BOOL8 v12;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  unint64_t i;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  BOOL v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  int v53;
  CVAPortraitVideoPipeline_Impl *v54;
  id v55;
  id v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  void *v61;
  int v62;
  void *v63;
  int v64;
  void *v65;
  int v66;
  void *v67;
  int v68;
  BOOL v69;
  void *m_ptr;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  __CVBuffer *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  CVAFilterAlphaBlend *filterAlphaBlend;
  void *v84;
  CFTypeRef v85;
  CFTypeRef v86;
  CFTypeRef v87;
  CFTypeRef v88;
  _QWORD *v89;
  uint64_t v90;
  unsigned __int8 v91;
  int isKindOfClass;
  id v94;
  id v95;
  id v96;
  void *v97;
  id v98;
  id *v99;
  CFTypeRef v100;
  CFTypeRef v101;
  CFTypeRef v102;
  CFTypeRef v103;
  _QWORD v104[4];
  id v105;
  id v106;
  CVAPortraitVideoPipeline_Impl *v107;
  id v108;
  _QWORD *v109;
  __CVBuffer *v110;
  _QWORD v111[5];
  _QWORD v112[5];
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  CVAPortraitVideoPipeline_Impl *v118;
  _QWORD v119[4];
  _QWORD v120[3];
  _QWORD *v121;
  _BYTE v122[128];
  void *v123;
  _QWORD v124[2];
  _QWORD v125[3];
  _QWORD *v126;
  uint64_t v127;

  v12 = a8;
  v127 = *MEMORY[0x1E0C80C00];
  v118 = self;
  v17 = a3;
  v98 = a4;
  v94 = a9;
  v95 = a10;
  v96 = a11;
  v97 = v17;
  sub_1B56A2EE4(v125, (uint64_t)&self->_metalContext, self->_debugGPUCaptureFrameNumber);
  if (a7)
    *a7 = 0;
  v99 = a7;
  -[CVAVideoPipelinePropertiesSPI setSceneMonitorUsesDisparityStatistics:](self->_properties, "setSceneMonitorUsesDisparityStatistics:", v12);
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: requestFrom is nil."));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl renderWithRequest:requestTo:mixValue:destinationColorPixelBuffer:error:sceneMonitorUsesDisparityStatistics:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 3311, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v17 == 0, a7, 0, 4294944393, v20);

  if (!v17)
    goto LABEL_10;
  v21 = a5 > 1.0 || (unint64_t)(a5 < 0.0);
  v22 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: 0 <= mixValue <= 1 is false."));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl renderWithRequest:requestTo:mixValue:destinationColorPixelBuffer:error:sceneMonitorUsesDisparityStatistics:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 3320, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v21, a7, 0, 4294944393, v24);

  if (v21)
    goto LABEL_10;
  v25 = v17;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v26 = v98;
  if (v98)
  {
    objc_opt_class();
    v91 = objc_opt_isKindOfClass();
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: requestFrom and requestTo should be of the same kind."));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPortraitVideoPipeline_Impl renderWithRequest:requestTo:mixValue:destinationColorPixelBuffer:error:sceneMonitorUsesDisparityStatistics:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipeline.mm", 3334, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B5658D40((isKindOfClass ^ v91) & 1, a7, 0, 4294944393, v29);

    v25 = v17;
    v26 = v98;
    if (((isKindOfClass ^ v91) & 1) != 0)
    {
LABEL_10:
      v30 = -22903;
      goto LABEL_11;
    }
  }
  else
  {
    v91 = 0;
  }
  if (v118->_debugLogTransition)
  {
    v34 = ++dword_1EF12CFC0;
    if (v118->_debugLogTransitionPrintTrivial01 || a5 != 0.0 && a5 != 1.0)
    {
      NSLog(CFSTR("TRANSITION: renderWithRequest - frame=%3i, rqFrom = %@,         mixV=%5.3f"), v34, v25, a5);
      if (v26)
      {
        v124[0] = v25;
        v124[1] = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 2);
        v35 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v123 = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
        v35 = objc_claimAutoreleasedReturnValue();
      }
      v36 = (void *)v35;
      for (i = 0; i < objc_msgSend(v36, "count"); ++i)
      {
        objc_msgSend(v36, "objectAtIndexedSubscript:", i);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)v38;
        if (i == 1)
          NSLog(CFSTR("TRANSITION:                                rqTo   = %@"), v38);
        if (v39)
        {
          v116 = 0u;
          v117 = 0u;
          v114 = 0u;
          v115 = 0u;
          v40 = objc_msgSend(&unk_1E6949298, "countByEnumeratingWithState:objects:count:", &v114, v122, 16);
          if (v40)
          {
            v41 = *(_QWORD *)v115;
            do
            {
              for (j = 0; j != v40; ++j)
              {
                if (*(_QWORD *)v115 != v41)
                  objc_enumerationMutation(&unk_1E6949298);
                v43 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * j);
                objc_msgSend(v39, "valueForKey:", v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                NSLog(CFSTR("TRANSITION:                                      .%@ = %@"), v43, v44);

              }
              v40 = objc_msgSend(&unk_1E6949298, "countByEnumeratingWithState:objects:count:", &v114, v122, 16);
            }
            while (v40);
          }
        }

      }
      v25 = v97;
      v26 = v98;
    }
  }
  v45 = a5 <= 0.5 || v26 == 0;
  if ((v45 && (v46 = v25, ((isKindOfClass ^ 1) & 1) == 0) || (v46 = v26, ((a5 > 0.5) & v91) == 1))
    && (v47 = v46) != 0)
  {
    v48 = v47;
    objc_msgSend(v47, "portraitVideoPipeline");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "sourceColorPixelBuffer");
    objc_msgSend(v48, "cubeData");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[CVAVideoPipelineLibrary colorCubePortraitRequestForPortraitVideoPipeline:withWithSourceColorPixelBuffer:destinationColorPixelBuffer:cubeData:](CVAVideoPipelineLibrary, "colorCubePortraitRequestForPortraitVideoPipeline:withWithSourceColorPixelBuffer:destinationColorPixelBuffer:cubeData:", v49, v50, a6, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "setParentGenericRequestFrom:", v97);
    objc_msgSend(v52, "setParentGenericRequestTo:", v98);
    v53 = -[CVAPortraitVideoPipeline_Impl renderWithRequest:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:](v118, "renderWithRequest:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:", v52, v94, v95, v96);
    v30 = v53;
    if (v99 && v53 == -22914)
    {
      +[CVAPhotoExceptionMetalResourceUnavailable error](CVAPhotoExceptionMetalResourceUnavailable, "error");
      *v99 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v54 = v118;
    v118->_transitionData._inTransition = 0;
    v119[0] = &off_1E6936760;
    v119[1] = &v118;
    v119[3] = v119;
    v120[0] = &off_1E6936760;
    v121 = v120;
    v120[1] = &v118;
    if (a5 == 0.0 || a5 == 1.0)
    {
      if (a5 == 0.0)
        v78 = v25;
      else
        v78 = v26;
      if (v26)
        v79 = v78;
      else
        v79 = v25;
      v30 = -[CVAPortraitVideoPipeline_Impl renderSingleEffectWithRequest:destinationColorPixelBuffer:error:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:requestFrom:requestTo:](v54, "renderSingleEffectWithRequest:destinationColorPixelBuffer:error:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:requestFrom:requestTo:", v79, a6, v99, v94, v95, v96, v25, v26);
    }
    else
    {
      if (v26)
      {
        v55 = v25;
        v56 = v26;
        objc_msgSend(v55, "background");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v58 = objc_opt_isKindOfClass();
        objc_msgSend(v56, "background");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v60 = objc_opt_isKindOfClass();

        if (((v58 ^ v60) & 1) != 0)
          goto LABEL_58;
        objc_msgSend(v55, "background");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v62 = objc_opt_isKindOfClass();
        objc_msgSend(v56, "background");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v64 = objc_opt_isKindOfClass();

        if (((v62 ^ v64) & 1) != 0)
          goto LABEL_58;
        objc_msgSend(v55, "background");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v66 = objc_opt_isKindOfClass();
        objc_msgSend(v56, "background");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v68 = objc_opt_isKindOfClass();

        if (((v66 ^ v68) & 1) != 0)
        {
LABEL_58:
          v69 = a5 > 0.0;
          if (a5 >= 1.0)
            v69 = 0;
          v118->_transitionData._inTransition = v69;
        }

        v54 = v118;
        v25 = v97;
        v26 = v98;
      }
      if (!v54->_intermediateTransitionBufferFrom.m_ptr)
      {
        sub_1B5667BD4(v112, a6);
        v54 = v118;
        m_ptr = v118->_intermediateTransitionBufferFrom.m_ptr;
        v118->_intermediateTransitionBufferFrom.m_ptr = (void *)v112[0];
        if (m_ptr)
        {
          CFRelease(m_ptr);
          v54 = v118;
        }
      }
      v30 = -[CVAPortraitVideoPipeline_Impl renderSingleEffectWithRequest:destinationColorPixelBuffer:error:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:requestFrom:requestTo:](v54, "renderSingleEffectWithRequest:destinationColorPixelBuffer:error:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:requestFrom:requestTo:", v25, v25, v26);
      if (!v30)
      {
        if (!v118->_intermediateTransitionBufferTo.m_ptr)
        {
          sub_1B5667BD4(v112, a6);
          v71 = v118->_intermediateTransitionBufferTo.m_ptr;
          v118->_intermediateTransitionBufferTo.m_ptr = (void *)v112[0];
          if (v71)
            CFRelease(v71);
        }
        v112[0] = 0;
        v112[1] = v112;
        v112[2] = 0x3032000000;
        v112[3] = sub_1B5667D90;
        v112[4] = sub_1B5667DA0;
        v72 = MEMORY[0x1E0C809B0];
        v113 = 0;
        v111[0] = MEMORY[0x1E0C809B0];
        v111[1] = 3221225472;
        v111[2] = sub_1B5667DA8;
        v111[3] = &unk_1E6936C98;
        v111[4] = v112;
        v73 = (void *)MEMORY[0x1B5E4E2A8](v111);
        if (!v26
          || (v30 = -[CVAPortraitVideoPipeline_Impl renderSingleEffectWithRequest:destinationColorPixelBuffer:error:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:requestFrom:requestTo:](v118, "renderSingleEffectWithRequest:destinationColorPixelBuffer:error:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:requestFrom:requestTo:", v97, v98)) == 0)
        {
          if (a6)
            CFRetain(a6);
          v104[0] = v72;
          v104[1] = 3221225472;
          v104[2] = sub_1B5667DBC;
          v104[3] = &unk_1E6936CC0;
          v108 = v96;
          v109 = v112;
          v110 = a6;
          v74 = v97;
          v105 = v74;
          v106 = v98;
          v107 = v118;
          v75 = (void *)MEMORY[0x1B5E4E2A8](v104);
          v103 = 0;
          if (v98)
          {
            v76 = a6;
            sub_1B5667EC4(&v103, v118->_intermediateTransitionBufferTo.m_ptr);
          }
          else
          {
            objc_msgSend(v74, "background");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "mattingRequest");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "disparityPostprocessingRequest");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1B5667EC4(&v103, (CFTypeRef)objc_msgSend(v82, "sourceColorPixelBuffer"));

            v76 = a6;
          }
          if (v118->_preferences.bypassGPUProcessing)
          {
            dispatch_async((dispatch_queue_t)v118->_notificationQueue, v75);
          }
          else
          {
            filterAlphaBlend = v118->_filterAlphaBlend;
            v84 = v118->_intermediateTransitionBufferFrom.m_ptr;
            v102 = v84;
            if (v84)
              CFRetain(v84);
            v101 = v103;
            if (v103)
              CFRetain(v103);
            v100 = v76;
            if (v76)
              CFRetain(v76);
            *(float *)&v77 = a5;
            -[CVAFilterAlphaBlend alphaBlendPixelBuffer:inPixelBufferSecond:outPixelBuffer:alpha:callbackQueue:callback:](filterAlphaBlend, "alphaBlendPixelBuffer:inPixelBufferSecond:outPixelBuffer:alpha:callbackQueue:callback:", &v102, &v101, &v100, v118->_notificationQueue, v75, v77);
            v85 = v100;
            v100 = 0;
            if (v85)
              CFRelease(v85);
            v86 = v101;
            v101 = 0;
            if (v86)
              CFRelease(v86);
            v87 = v102;
            v102 = 0;
            if (v87)
              CFRelease(v87);
          }
          v88 = v103;
          v103 = 0;
          if (v88)
            CFRelease(v88);

          if (v76)
            CFRelease(a6);
          v30 = 0;
        }

        _Block_object_dispose(v112, 8);
      }
    }
    if (!v121)
    {
LABEL_109:
      sub_1B5658FA0();
      __break(1u);
      JUMPOUT(0x1B5666E68);
    }
    (*(void (**)(_QWORD *))(*v121 + 48))(v121);
    v89 = v121;
    if (v121 == v120)
    {
      v90 = 4;
      v89 = v120;
    }
    else
    {
      if (!v121)
        goto LABEL_11;
      v90 = 5;
    }
    (*(void (**)(void))(*v89 + 8 * v90))();
  }
LABEL_11:
  if (!v126)
    goto LABEL_109;
  (*(void (**)(_QWORD *))(*v126 + 48))(v126);
  v31 = v126;
  if (v126 == v125)
  {
    v32 = 4;
    v31 = v125;
    goto LABEL_16;
  }
  if (v126)
  {
    v32 = 5;
LABEL_16:
    (*(void (**)(void))(*v31 + 8 * v32))();
  }

  return v30;
}

- (void).cxx_destruct
{
  CVAPerfEndTimeProfilerSet *value;
  char *v4;
  void *v5;
  void *m_ptr;
  void *v7;
  void *v8;
  SdofStateMachine *v9;
  StageLightStateMachine *v10;
  FocusStateMachine *v11;
  DisparityStatistics *v12;
  uint64_t v13;
  DisparityAutofocus *v14;
  void *v15;
  void *v16;
  FocusStatsPostprocessing *v17;
  CVPixelBufferRef *v18;
  GeometricTransformation *v19;
  DisparityConversion *v20;
  char *v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;

  objc_storeStrong((id *)&self->_yuvSourceDownsampledAlias, 0);
  value = self->_metalContext.profiler.__ptr_.__value_;
  self->_metalContext.profiler.__ptr_.__value_ = 0;
  if (value)
  {

    std::mutex::~mutex((std::mutex *)((char *)value + 80));
    if (*((_BYTE *)value + 56))
      *((_BYTE *)value + 56) = 0;
    v4 = (char *)*((_QWORD *)value + 4);
    if (v4)
    {
      do
      {
        v21 = *(char **)v4;
        v22 = (std::__shared_weak_count *)*((_QWORD *)v4 + 6);
        if (v22)
        {
          p_shared_owners = (unint64_t *)&v22->__shared_owners_;
          do
            v24 = __ldaxr(p_shared_owners);
          while (__stlxr(v24 - 1, p_shared_owners));
          if (!v24)
          {
            ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
            std::__shared_weak_count::__release_weak(v22);
          }
        }
        if (v4[39] < 0)
          operator delete(*((void **)v4 + 2));
        operator delete(v4);
        v4 = v21;
      }
      while (v21);
    }
    v5 = (void *)*((_QWORD *)value + 2);
    *((_QWORD *)value + 2) = 0;
    if (v5)
      operator delete(v5);
    MEMORY[0x1B5E4DE7C](value, 0x10A0C4075515932);
  }

  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_faceKitProcessOutput, 0);
  m_ptr = self->_intermediateTransitionBufferTo.m_ptr;
  self->_intermediateTransitionBufferTo.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v7 = self->_intermediateTransitionBufferFrom.m_ptr;
  self->_intermediateTransitionBufferFrom.m_ptr = 0;
  if (v7)
    CFRelease(v7);
  v8 = self->_intermediateRelightSourceBuffer.m_ptr;
  self->_intermediateRelightSourceBuffer.m_ptr = 0;
  if (v8)
    CFRelease(v8);
  objc_storeStrong((id *)&self->_filterAlphaBlend, 0);
  objc_storeStrong((id *)&self->_vrAccelerator, 0);
  objc_storeStrong((id *)&self->_vmAccelerator, 0);
  v9 = self->_sdofIntensityStateMachine.__ptr_.__value_;
  self->_sdofIntensityStateMachine.__ptr_.__value_ = 0;
  if (v9)
    MEMORY[0x1B5E4DE7C](v9, 0x1000C4095CF6A33);
  v10 = self->_stageLightStateMachine.__ptr_.__value_;
  self->_stageLightStateMachine.__ptr_.__value_ = 0;
  if (v10)
    MEMORY[0x1B5E4DE7C](v10, 0x1000C4021716A34);
  v11 = self->_focusStateMachine.__ptr_.__value_;
  self->_focusStateMachine.__ptr_.__value_ = 0;
  if (v11)
    MEMORY[0x1B5E4DE7C](v11, 0x1000C40A86A77D5);
  v12 = self->_disparityStatistics.__ptr_.__value_;
  self->_disparityStatistics.__ptr_.__value_ = 0;
  if (v12)
  {
    v13 = sub_1B56752A8((uint64_t)v12);
    MEMORY[0x1B5E4DE7C](v13, 0x10A0C401CF549CELL);
  }
  v14 = self->_disparityAutofocus.__ptr_.__value_;
  self->_disparityAutofocus.__ptr_.__value_ = 0;
  if (v14)
  {
    v15 = (void *)*((_QWORD *)v14 + 6);
    if (v15)
    {
      *((_QWORD *)v14 + 7) = v15;
      operator delete(v15);
    }
    v16 = (void *)*((_QWORD *)v14 + 3);
    if (v16)
    {
      *((_QWORD *)v14 + 4) = v16;
      operator delete(v16);
    }
    MEMORY[0x1B5E4DE7C](v14, 0x1080C400297598BLL);
  }
  v17 = self->_focusStatsPostprocessing.__ptr_.__value_;
  self->_focusStatsPostprocessing.__ptr_.__value_ = 0;
  if (v17)
  {
    v18 = sub_1B5690A68((CVPixelBufferRef *)v17);
    MEMORY[0x1B5E4DE7C](v18, 0x1020C4097AB94F3);
  }
  v19 = self->_disparityGeometricTransformation.__ptr_.__value_;
  self->_disparityGeometricTransformation.__ptr_.__value_ = 0;
  if (v19)
  {
    CVPixelBufferRelease(*((CVPixelBufferRef *)v19 + 7));
    *((_QWORD *)v19 + 7) = 0;
    CVPixelBufferRelease(*((CVPixelBufferRef *)v19 + 6));
    *((_QWORD *)v19 + 6) = 0;
    MEMORY[0x1B5E4DE7C](v19, 0x1020C40FBAF4977);
  }
  v20 = self->_disparityConversion.__ptr_.__value_;
  self->_disparityConversion.__ptr_.__value_ = 0;
  if (v20)
  {
    CVPixelBufferRelease(*(CVPixelBufferRef *)v20);
    *(_QWORD *)v20 = 0;
    CVPixelBufferRelease(*((CVPixelBufferRef *)v20 + 1));
    *((_QWORD *)v20 + 1) = 0;
    CVPixelBufferRelease(*((CVPixelBufferRef *)v20 + 2));
    *((_QWORD *)v20 + 2) = 0;
    MEMORY[0x1B5E4DE7C](v20, 0x1020C4092A1A721);
  }
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

- (id).cxx_construct
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  float v30;
  float v31;
  void *v32;
  float v33;
  float v34;
  void *v35;
  float v36;
  float v37;
  void *v38;
  float v39;
  float v40;
  void *v41;
  float v42;
  float v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;

  self->_vmPostprocessingParams.useFaceAsFocus = 0;
  self->_vmPostprocessingParams.faceSizeRatioInFocus = 1.0;
  self->_vmPostprocessingParams.fillLargeHolesWithBackground = 0;
  *(_QWORD *)&self->_vmPostprocessingParams.disparityIntervalInHoleSearch = 1050673152;
  self->_vmPostprocessingParams.useTemporalRejection = 1;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("colorWidth"));

  if (v4 != (int)v4)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v4, 0x80000000, 0x7FFFFFFF);
    LODWORD(v4) = 0;
  }
  self->_vmStaticParams.colorWidth = v4;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerForKey:", CFSTR("colorHeight"));

  if (v6 != (int)v6)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v6, 0x80000000, 0x7FFFFFFF);
    LODWORD(v6) = 0;
  }
  self->_vmStaticParams.colorHeight = v6;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerForKey:", CFSTR("shiftWidth"));

  if (v8 != (int)v8)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v8, 0x80000000, 0x7FFFFFFF);
    LODWORD(v8) = 0;
  }
  self->_vmStaticParams.shiftWidth = v8;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerForKey:", CFSTR("shiftHeight"));

  if (v10 != (int)v10)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v10, 0x80000000, 0x7FFFFFFF);
    LODWORD(v10) = 0;
  }
  self->_vmStaticParams.shiftHeight = v10;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerForKey:", CFSTR("alphaWidth"));

  if (v12 != (int)v12)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v12, 0x80000000, 0x7FFFFFFF);
    LODWORD(v12) = 0;
  }
  self->_vmStaticParams.alphaWidth = v12;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerForKey:", CFSTR("alphaHeight"));

  if (v14 != (int)v14)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v14, 0x80000000, 0x7FFFFFFF);
    LODWORD(v14) = 0;
  }
  self->_vmStaticParams.alphaHeight = v14;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerForKey:", CFSTR("kernelSize"));

  if (v16 != (int)v16)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v16, 0x80000000, 0x7FFFFFFF);
    LODWORD(v16) = 0;
  }
  self->_vmStaticParams.kernelSize = v16;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatForKey:", CFSTR("referenceShift"));
  v19 = v18;

  self->_vmStaticParams.referenceShift = v19;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatForKey:", CFSTR("guidedFilterUnconfidentWeight"));
  v22 = v21;

  self->_vmStaticParams.guidedFilterUnconfidentWeight = v22;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatForKey:", CFSTR("guidedFilterMinDistToDeweight"));
  v25 = v24;

  self->_vmStaticParams.guidedFilterMinDistToDeweight = v25;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatForKey:", CFSTR("alphaMaxLaplacian"));
  v28 = v27;

  self->_vmStaticParams.alphaMaxLaplacian = v28;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "floatForKey:", CFSTR("alphaContrastExponent"));
  v31 = v30;

  self->_vmStaticParams.alphaContrastExponent = v31;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "floatForKey:", CFSTR("shiftFilterColorStd"));
  v34 = v33;

  self->_vmStaticParams.shiftFilterColorStd = v34;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "floatForKey:", CFSTR("shiftFilterUpdateRate"));
  v37 = v36;

  self->_vmStaticParams.shiftFilterUpdateRate = v37;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "floatForKey:", CFSTR("maxShiftFillingInconsistency"));
  v40 = v39;

  self->_vmStaticParams.maxShiftFillingInconsistency = v40;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "floatForKey:", CFSTR("maxShiftFillingDistFromFg"));
  v43 = v42;

  self->_vmStaticParams.maxShiftFillingDistFromFg = v43;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "integerForKey:", CFSTR("maxDistToPushShiftEdgesFwd"));

  if (v45 != (int)v45)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v45, 0x80000000, 0x7FFFFFFF);
    LODWORD(v45) = 0;
  }
  self->_vmStaticParams.maxDistToPushShiftEdgesFwd = v45;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "integerForKey:", CFSTR("maxDistToPushShiftEdgesRev"));

  if (v47 != (int)v47)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v47, 0x80000000, 0x7FFFFFFF);
    LODWORD(v47) = 0;
  }
  self->_vmStaticParams.maxDistToPushShiftEdgesRev = v47;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "integerForKey:", CFSTR("shiftPushingBgToFgShiftDifference"));

  if (v49 != (int)v49)
  {
    syslog(3, "Integer %ld is outside [%d, %d]", v49, 0x80000000, 0x7FFFFFFF);
    LODWORD(v49) = 0;
  }
  self->_vmStaticParams.shiftPushingBgToFgShiftDifference = v49;
  self->_vmDynamicParams.doDisparityHoleFilling = 1;
  self->_transitionData._inTransition = 0;
  *(_OWORD *)&self->_disparityConversion.__ptr_.__value_ = 0u;
  *(_OWORD *)&self->_focusStatsPostprocessing.__ptr_.__value_ = 0u;
  *(_OWORD *)&self->_disparityStatistics.__ptr_.__value_ = 0u;
  *(_OWORD *)&self->_stageLightStateMachine.__ptr_.__value_ = 0u;
  self->_intermediateTransitionBufferFrom.m_ptr = 0;
  self->_intermediateTransitionBufferTo.m_ptr = 0;
  self->_intermediateRelightSourceBuffer.m_ptr = 0;
  *(_OWORD *)&self->_metalContext.device = 0u;
  *(_OWORD *)&self->_metalContext.library = 0u;
  self->_metalContext.captureScope = 0;
  v50 = operator new();
  *(_WORD *)v50 = 0;
  *(_QWORD *)(v50 + 8) = -1;
  *(_OWORD *)(v50 + 16) = 0u;
  *(_OWORD *)(v50 + 32) = 0u;
  *(_DWORD *)(v50 + 48) = 1065353216;
  *(_BYTE *)(v50 + 56) = 0;
  *(_QWORD *)(v50 + 80) = 850045863;
  *(_OWORD *)(v50 + 88) = 0u;
  *(_OWORD *)(v50 + 104) = 0u;
  *(_OWORD *)(v50 + 120) = 0u;
  *(_OWORD *)(v50 + 136) = 0u;
  *(_QWORD *)(v50 + 152) = 0;
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)v50 = objc_msgSend(v51, "BOOLForKey:", CFSTR("CVAPhotoDebugDisplayProfiler"));

  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(v50 + 1) = objc_msgSend(v52, "BOOLForKey:", CFSTR("CVAPhotoLogProfiler"));

  self->_metalContext.profiler.__ptr_.__value_ = (CVAPerfEndTimeProfilerSet *)v50;
  self->_metalContext._alreadyInCaptureScope = 0;
  return self;
}

+ (void)drawDisparity:(const __CVBuffer *)a3 onColor:(__CVBuffer *)a4 canonical:(BOOL)a5 rawShiftInvalidThreshold:(int)a6 focusMachineState:(int)a7 offsetX:(unint64_t)a8 offsetY:(unint64_t)a9
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t HeightOfPlane;
  size_t v16;
  size_t BytesPerRowOfPlane;
  size_t v18;
  float *BaseAddress;
  char *v20;
  float v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  unint64_t v39;
  char *v40;
  uint64_t i;
  __int16 v42;
  char v43;
  float v44;
  int v45;
  float v46;
  unint64_t v47;
  char *v48;
  uint64_t j;
  int v50;
  size_t v51;
  char *v52;
  _BOOL4 v55;
  __CVBuffer *pixelBuffer;
  char *BaseAddressOfPlane;

  v55 = a5;
  CVPixelBufferLockBaseAddress(a3, 0);
  CVPixelBufferLockBaseAddress(a4, 0);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, 0);
  v16 = CVPixelBufferGetHeightOfPlane(a4, 1uLL);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
  v18 = CVPixelBufferGetBytesPerRowOfPlane(a4, 1uLL);
  pixelBuffer = a3;
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
  v20 = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 1uLL);
  if (BaseAddress)
  {
    if (BaseAddressOfPlane)
    {
      if (v20)
      {
        if (Width <= BytesPerRowOfPlane && Width <= v18)
        {
          v22 = Height;
          if (Height < HeightOfPlane)
          {
            v23 = Height >> 1;
            if (Height >> 1 < v16)
            {
              v52 = v20;
              if (v55)
              {
                if ((int)Width < 89 || (int)Height < 24)
                {
                  syslog(1, "drawText(): text does not fit: (%d..%d,%d..%d) not a subrect of (0..%d, 0..%d)", 8, 88, 8, 23, Width, Height);
                  v23 = Height >> 1;
                  v22 = Height;
                }
                else
                {
                  v24 = 0;
                  v25 = 102;
                  v26 = 115;
                  if (!a7)
                    v25 = 115;
                  v27 = 97;
                  if (!a7)
                  {
                    v27 = 108;
                    v26 = 111;
                  }
                  v28 = 116;
                  if (!a7)
                    v28 = 119;
                  v29 = (uint64_t)&BaseAddress[2 * (int)BytesPerRow + 42];
                  do
                  {
                    v30 = (int)v24 / 5;
                    v31 = &byte_1B56AC2C6[9 * v25];
                    if (v31[3 * v30])
                    {
                      *(_QWORD *)(v29 - 136) = 0;
                      *(_QWORD *)(v29 - 128) = 0;
                      *(_DWORD *)(v29 - 120) = 0;
                    }
                    if (v31[3 * v30 + 1])
                    {
                      *(_QWORD *)(v29 - 108) = 0;
                      *(_QWORD *)(v29 - 116) = 0;
                      *(_DWORD *)(v29 - 100) = 0;
                    }
                    if (byte_1B56AC2C6[9 * v25 + 2 + 3 * v30])
                    {
                      *(_QWORD *)(v29 - 96) = 0;
                      *(_QWORD *)(v29 - 88) = 0;
                      *(_DWORD *)(v29 - 80) = 0;
                    }
                    v32 = &byte_1B56AC2C6[9 * v27];
                    if (v32[3 * v30])
                    {
                      *(_QWORD *)(v29 - 56) = 0;
                      *(_QWORD *)(v29 - 48) = 0;
                      *(_DWORD *)(v29 - 40) = 0;
                    }
                    if (v32[3 * v30 + 1])
                    {
                      *(_QWORD *)(v29 - 28) = 0;
                      *(_QWORD *)(v29 - 36) = 0;
                      *(_DWORD *)(v29 - 20) = 0;
                    }
                    if (byte_1B56AC2C6[9 * v27 + 2 + 3 * v30])
                    {
                      *(_QWORD *)(v29 - 16) = 0;
                      *(_QWORD *)(v29 - 8) = 0;
                      *(_DWORD *)v29 = 0;
                    }
                    v33 = &byte_1B56AC2C6[9 * v26];
                    if (v33[3 * v30])
                    {
                      *(_QWORD *)(v29 + 24) = 0;
                      *(_QWORD *)(v29 + 32) = 0;
                      *(_DWORD *)(v29 + 40) = 0;
                    }
                    if (v33[3 * v30 + 1])
                    {
                      *(_QWORD *)(v29 + 48) = 0;
                      *(_QWORD *)(v29 + 56) = 0;
                      *(_DWORD *)(v29 + 44) = 0;
                    }
                    if (byte_1B56AC2C6[9 * v26 + 2 + 3 * v30])
                    {
                      *(_QWORD *)(v29 + 64) = 0;
                      *(_QWORD *)(v29 + 72) = 0;
                      *(_DWORD *)(v29 + 80) = 0;
                    }
                    v34 = &byte_1B56AC2C6[9 * v28];
                    if (v34[3 * v30])
                    {
                      *(_QWORD *)(v29 + 104) = 0;
                      *(_QWORD *)(v29 + 112) = 0;
                      *(_DWORD *)(v29 + 120) = 0;
                    }
                    if (v34[3 * v30 + 1])
                    {
                      *(_QWORD *)(v29 + 128) = 0;
                      *(_QWORD *)(v29 + 136) = 0;
                      *(_DWORD *)(v29 + 124) = 0;
                    }
                    if (byte_1B56AC2C6[9 * v28 + 2 + 3 * v30])
                    {
                      *(_QWORD *)(v29 + 144) = 0;
                      *(_QWORD *)(v29 + 152) = 0;
                      *(_DWORD *)(v29 + 160) = 0;
                    }
                    ++v24;
                    v29 += (int)BytesPerRow;
                  }
                  while (v24 != 15);
                }
              }
              v51 = BytesPerRowOfPlane;
              v35 = a9 >> 1;
              if (v22 >= 2)
              {
                if (v23 <= 1)
                  v36 = 1;
                else
                  v36 = v23;
                v37 = &v52[a8 + v18 * v35];
                do
                {
                  memset(v37, 128, Width);
                  v37 += v18;
                  --v36;
                }
                while (v36);
              }
              if (Height && Width)
              {
                v38 = &v52[a8];
                if (v55)
                {
                  v39 = 0;
                  v40 = &BaseAddressOfPlane[a8 + v51 * a9];
                  while (1)
                  {
                    for (i = 0; i != Width; ++i)
                    {
                      v44 = BaseAddress[i] / 6.6667;
                      v45 = (int)(float)(v44 * 255.0);
                      if (v44 > 1.0)
                        LOBYTE(v45) = -1;
                      if (v44 < 0.0)
                        LOBYTE(v45) = 0;
                      v40[i] = v45;
                      v46 = BaseAddress[i];
                      if (v46 < 0.0)
                      {
                        v42 = -27648;
                        v43 = -31;
LABEL_57:
                        v40[i] = v43;
                        *(_WORD *)&v38[(v35 + (v39 >> 1)) * v18 + (i & 0xFFFFFFFFFFFFFFFELL)] = v42;
                        continue;
                      }
                      if (v46 == 2048.0)
                      {
                        v42 = -5420;
                        v43 = 105;
                        goto LABEL_57;
                      }
                    }
                    ++v39;
                    v40 += v51;
                    BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
                    if (v39 == Height)
                      goto LABEL_76;
                  }
                }
                v47 = 0;
                v48 = &BaseAddressOfPlane[a8 + v51 * a9];
                do
                {
                  for (j = 0; j != Width; ++j)
                  {
                    LOWORD(v21) = *((_WORD *)BaseAddress + j);
                    v21 = (float)LODWORD(v21) / (float)a6;
                    v50 = (int)(float)(v21 * 255.0);
                    if (v21 > 1.0)
                      LOBYTE(v50) = -1;
                    if (v21 < 0.0)
                      LOBYTE(v50) = 0;
                    v48[j] = v50;
                    if (*((unsigned __int16 *)BaseAddress + j) >= a6)
                    {
                      v48[j] = 105;
                      *(_WORD *)&v38[(v35 + (v47 >> 1)) * v18 + (j & 0xFFFFFFFFFFFFFFFELL)] = -5420;
                    }
                  }
                  ++v47;
                  v48 += v51;
                  BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
                }
                while (v47 != Height);
              }
            }
          }
        }
      }
    }
  }
LABEL_76:
  CVPixelBufferUnlockBaseAddress(a4, 0);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
}

+ (int)pixelBufferPoolCreateWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 pool:(__CVPixelBufferPool *)a6
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFDictionary *v13;
  CVReturn v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v17[0] = MEMORY[0x1E0C9AA70];
  v9 = *MEMORY[0x1E0CA9040];
  v16[0] = *MEMORY[0x1E0CA8FF0];
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  v16[2] = *MEMORY[0x1E0CA90E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  v16[3] = *MEMORY[0x1E0CA8FD8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v14 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v13, a6);
  if (v14)
  {
    NSLog(CFSTR("Unable to create pool"));
    *a6 = 0;
  }

  return v14;
}

@end
