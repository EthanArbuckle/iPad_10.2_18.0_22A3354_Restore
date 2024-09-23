@implementation VNFaceAnalyzerMultiDetectorBase

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  double x;
  double y;
  double width;
  double height;
  BOOL v19;
  __CVBuffer *v21;
  CGRect v22;

  v12 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[VNValidationUtilities requiredFaceObservationInOptions:error:](VNValidationUtilities, "requiredFaceObservationInOptions:error:", v12, a8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14
      && (objc_msgSend(v13, "orientation"), (VNSetFaceOrientationInOptionsDictionary(v14, v12, a8) & 1) != 0)
      && (objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool")), -[VNFaceAnalyzerMultiDetectorBase calculateCropRectForInputFace:imageBuffer:options:error:](self, "calculateCropRectForInputFace:imageBuffer:options:error:", v14, v13, v12, a8), x = v22.origin.x, y = v22.origin.y, width = v22.size.width, height = v22.size.height, !CGRectIsNull(v22)))
    {
      v21 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", -[VNEspressoModelFileBasedDetector networkRequiredInputImageWidth](self, "networkRequiredInputImageWidth"), -[VNEspressoModelFileBasedDetector networkRequiredInputImageHeight](self, "networkRequiredInputImageHeight"), objc_msgSend((id)objc_opt_class(), "networkRequiredInputImagePixelFormatForConfigurationOptions:", v12), v12, a8, x, y, width, height);
      *a7 = v21;
      v19 = v21 != 0;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  objc_super v31;
  BOOL v32;
  BOOL v33;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = *(_QWORD *)&a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v33 = 0;
  if (+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v33, CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceprint"), v17, 0, a7))
  {
    v32 = 0;
    if (+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v32, CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceAnalyzer"), v17, 0, a7))
    {
      +[VNError VNAssert:log:](VNError, "VNAssert:log:", v33 || v32, CFSTR("Unexpected options parameter passed to face analyzer multi-detector"));
      +[VNValidationUtilities requiredFaceObservationInOptions:error:](VNValidationUtilities, "requiredFaceObservationInOptions:error:", v17, a7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (!v20)
      {
        v24 = 0;
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(v20, "faceprint");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(v21, "faceAttributes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {

          goto LABEL_10;
        }
        v29 = v33 || v32;

        if (v29)
          goto LABEL_20;
      }
      else if (v33 || v32)
      {
LABEL_20:
        v31.receiver = self;
        v31.super_class = (Class)VNFaceAnalyzerMultiDetectorBase;
        -[VNDetector internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](&v31, sel_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler_, v15, v17, v18, a7, v19, x, y, width, height);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
LABEL_10:
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
      if (v33)
      {
        VNCloneFaceObservationFromOptions((uint64_t)v17, a7);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          v24 = 0;
          goto LABEL_22;
        }
        objc_msgSend(v25, "addObject:", v26);
        objc_msgSend(v26, "faceprint");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v27 == 0;

      }
      else
      {
        v26 = 0;
      }
      if (v32)
      {
        VNCloneFaceObservationFromOptions((uint64_t)v17, a7);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
LABEL_18:

LABEL_22:
          goto LABEL_23;
        }
        objc_msgSend(v25, "addObject:", v24);
        objc_msgSend(v24, "faceAttributes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v28 == 0;

      }
      v24 = v25;
      goto LABEL_18;
    }
  }
  v24 = 0;
LABEL_24:

  return v24;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;

  v5 = a3;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_15;
  if (objc_msgSend(v6, "specifiesRequestClass:", objc_opt_class()))
  {
    v7 = objc_msgSend(v6, "requestRevision");
    switch(v7)
    {
      case 4:
      case 5:
      case 6:
      case 7:
        goto LABEL_16;
      default:
        if (v7 != 100 && v7 != 101)
          goto LABEL_13;
        goto LABEL_16;
    }
  }
  if (objc_msgSend(v6, "specifiesRequestClass:", objc_opt_class()))
  {
    if ((unint64_t)(objc_msgSend(v6, "requestRevision") - 3737841665) < 6)
    {
LABEL_16:
      objc_opt_class();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  else if (objc_msgSend(v6, "specifiesRequestClass:", objc_opt_class()))
  {
    v8 = objc_msgSend(v6, "requestRevision") - 3737841664;
    if (v8 < 7 && ((0x6Fu >> v8) & 1) != 0)
      goto LABEL_16;
  }
LABEL_13:
  if (a4)
  {
    +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v6);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_15:
    v9 = 0;
  }
LABEL_17:

  return (Class)v9;
}

+ (id)keyForDetectorWithConfigurationOptions:(id)a3
{
  id v4;
  uint64_t v5;
  size_t v6;
  const void *v7;
  void **v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void **v14;
  void *v15;
  objc_super v17;
  void *__dst[2];
  int64_t v19;

  v4 = a3;
  v5 = objc_msgSend(a1, "modelVersionForOptions:", v4);
  v6 = *(_QWORD *)(v5 + 8);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v7 = *(const void **)v5;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    v8 = (void **)operator new(v9 + 1);
    __dst[1] = (void *)v6;
    v19 = v10 | 0x8000000000000000;
    __dst[0] = v8;
    goto LABEL_8;
  }
  HIBYTE(v19) = *(_QWORD *)(v5 + 8);
  v8 = __dst;
  if (v6)
LABEL_8:
    memmove(v8, v7, v6);
  *((_BYTE *)v8 + v6) = 0;
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___VNFaceAnalyzerMultiDetectorBase;
  objc_msgSendSuper2(&v17, sel_keyForDetectorWithConfigurationOptions_, v4);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = __dst;
  if (v19 < 0)
    v14 = (void **)__dst[0];
  v15 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@:%s"), v12, v14);

  if (SHIBYTE(v19) < 0)
    operator delete(__dst[0]);

  return v15;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__VNFaceAnalyzerMultiDetectorBase_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNFaceAnalyzerMultiDetectorBase configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNFaceAnalyzerMultiDetectorBase configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNFaceAnalyzerMultiDetectorBase configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v14;
  __objc2_class_ro **p_info;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *data;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _OWORD *v29;
  FaceprintAndAttributes *ptr;
  _QWORD *v31;
  std::__shared_weak_count *height;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v42;
  _OWORD *v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  unsigned __int8 *v50;
  vImagePixelCount i;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  unsigned __int8 *v55;
  vImagePixelCount v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  int v62;
  int32x4_t v63;
  int32x4_t v64;
  void *v65;
  float *v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t **v76;
  __int128 v77;
  unint64_t *v78;
  unint64_t v79;
  std::__shared_weak_count *v80;
  unint64_t *p_shared_owners;
  unint64_t v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  uint64_t *v92;
  uint64_t v93;
  int32x4_t v94;
  std::__shared_weak_count *v95;
  unint64_t *v96;
  unint64_t v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD *v104;
  uint64_t **v105;
  uint64_t v106;
  uint64_t **v107;
  uint64_t DeepCopy;
  uint64_t **v109;
  __int128 v110;
  std::__shared_weak_count *v111;
  unint64_t *v112;
  unint64_t v113;
  std::__shared_weak_count *v114;
  unint64_t *v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  _BOOL4 v125;
  uint64_t v126;
  uint64_t v127;
  _BOOL4 v128;
  uint64_t v129;
  int v130;
  uint64_t v131;
  size_t v132;
  void *p_buf;
  const void *v134;
  const std::string::value_type *v135;
  vImagePixelCount width_high;
  std::string *v137;
  __int128 v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t *v143;
  uint64_t **v144;
  std::__shared_weak_count *v145;
  unint64_t *v146;
  unint64_t v147;
  std::__shared_weak_count *v148;
  unint64_t *v149;
  unint64_t v150;
  uint64_t v151;
  double v152;
  FaceprintAndAttributes *v153;
  uint64_t *v154;
  void *v155;
  char *v156;
  vImage_Buffer *v157;
  void *v158;
  void *v159;
  id v160;
  uint64_t v161;
  FaceprintAndAttributes *v162;
  uint64_t *v163;
  void *v164;
  char *v165;
  vImage_Buffer *v166;
  void *v167;
  void *v168;
  unint64_t *v169;
  unint64_t v170;
  BOOL v171;
  uint64_t v172;
  void *FaceAttributesOutput;
  void *v174;
  char *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  char *v180;
  vImage_Buffer *v181;
  void *v182;
  void *v183;
  uint64_t v185;
  uint64_t v186;
  int32x4_t v187;
  _OWORD *v188;
  uint64_t v189;
  void *v190;
  uint64_t v191;
  id *v192;
  void *v193;
  void *v194;
  VNFaceAnalyzerMultiDetectorBase *v195;
  void *v196;
  id v197;
  id v198;
  _QWORD v199[2];
  char v200;
  BOOL v201;
  BOOL v202;
  int32x4_t v203;
  _QWORD *v204;
  vImage_Buffer src;
  uint64_t *v206;
  _QWORD *v207[2];
  int32x4_t v208;
  vImage_Buffer v209;
  vImage_Buffer buf;
  __int128 matrix;
  vImage_Buffer v212[3];
  uint64_t v213;
  int v214;
  void *v215;
  int16_t pre_bias[4];
  uint64_t v217;

  v217 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v198 = a7;
  v197 = a9;
  v202 = 0;
  if (!+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v202, CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceprint"), v14, 0, a8)|| (v195 = self, v201 = 0, !+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v201, CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceAnalyzer"), v14, 0, a8)))
  {
    v18 = 0;
    goto LABEL_286;
  }
  p_info = &OBJC_METACLASS___VNFaceRegionMapGenerator.info;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v202 || v201, CFSTR("Unexpected options parameter passed to face analyzer multi-detector"));
  v196 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  if (v202)
  {
    VNCloneFaceObservationFromOptions((uint64_t)v14, a8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v18 = 0;
      goto LABEL_285;
    }
    objc_msgSend(v196, "addObject:", v16);
    objc_msgSend(v16, "faceprint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = v17 == 0;

  }
  else
  {
    v16 = 0;
  }
  v194 = v16;
  if (v201)
  {
    VNCloneFaceObservationFromOptions((uint64_t)v14, a8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v18 = 0;
      goto LABEL_284;
    }
    objc_msgSend(v196, "addObject:", v19);
    objc_msgSend(v19, "faceAttributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = v19;
    v201 = v20 == 0;

  }
  else
  {
    v193 = 0;
  }
  v200 = 0;
  if (!+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v200, CFSTR("VNDetectorInternalProcessOption_RecordImageTooSmallWarning"), v14, 0, a8))goto LABEL_282;
  if (v200)
  {
    buf.data = 0;
    if (!+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:withDefaultValue:error:", &buf, CFSTR("VNDetectorInternalProcessOption_DesiredMinimumFacePrintingLongDimension"), v14, 0, a8))goto LABEL_282;
    data = buf.data;
    v22 = v198;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", data);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "recordWarning:value:", CFSTR("VNRequestWarningImageMinimumLongDimension"), v23);

    v24 = v22;
    v25 = v16;
    v26 = v25;
    if (v25)
    {
      v212[0].data = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v212, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "recordWarning:value:", CFSTR("VNRequestWarningImageTooSmallForFaceObservations"), v27);

    }
  }
  v28 = -[VNFaceAnalyzerMultiDetectorBase prepare_vImageBufferForCVPixelBuffer:error:](v195, "prepare_vImageBufferForCVPixelBuffer:error:", a4, a8);
  v29 = (_OWORD *)v28;
  if (!v28)
  {
LABEL_282:
    v18 = 0;
    goto LABEL_283;
  }
  v190 = v14;
  ptr = v195->_mMultiHeadedFaceClassifier.__ptr_;
  v188 = (_OWORD *)v28;
  if (*((_BYTE *)ptr + 6620))
  {
    v31 = operator new(0x90uLL);
    v31[1] = 0;
    v31[2] = 0;
    *v31 = &off_1E453B958;
    v31[4] = 0;
    v31[5] = 0;
    v31[9] = 0;
    v31[8] = 0;
    v31[6] = 0;
    v31[7] = v31 + 8;
    *((_OWORD *)v31 + 5) = 0u;
    *((_OWORD *)v31 + 6) = 0u;
    *((_BYTE *)v31 + 112) = 0;
    v31[3] = &off_1E453A8D0;
    v31[15] = 0;
    *((_DWORD *)v31 + 32) = 1;
    v31[17] = 0;
    v212[0].data = v31 + 3;
    v212[0].height = (vImagePixelCount)v31;
    std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)ptr + 6704, (__int128 *)v212);
    height = (std::__shared_weak_count *)v212[0].height;
    if (v212[0].height)
    {
      v33 = (unint64_t *)(v212[0].height + 8);
      do
        v34 = __ldaxr(v33);
      while (__stlxr(v34 - 1, v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))height->__on_zero_shared)(height);
        std::__shared_weak_count::__release_weak(height);
      }
    }
    *((_DWORD *)ptr + 1674) = 0;
  }
  *((_BYTE *)ptr + 6620) = 0;
  v35 = vision::mod::ImageDescriptorAugmenterAbstract::augment(*(_QWORD **)ptr, v29, 4u);
  if ((v35 & 0x80) == 0)
    goto LABEL_222;
  vision::mod::ImageDescriptorAugmenterAbstract::getAugmentedImages((vision::mod::ImageDescriptorAugmenterAbstract *)v212, *(_QWORD *)ptr);
  v208 = 0uLL;
  v207[0] = 0;
  v207[1] = 0;
  v206 = (uint64_t *)v207;
  v36 = *(_OWORD *)&v212[0].data;
  v186 = (uint64_t)(v212[0].height - (unint64_t)v212[0].data) >> 5;
  if ((int)v186 < 1)
  {
LABEL_141:
    if (*((_BYTE *)ptr + 66))
    {
      v117 = *((_QWORD *)ptr + 774);
      v118 = *((_QWORD *)ptr + 773);
      if (v117 != v118)
      {
        v119 = 0;
        v192 = a8;
        do
        {
          v120 = *((_QWORD *)ptr + 828) + 24 * v119;
          if (*(char *)(v120 + 23) < 0)
          {
            v120 = *(_QWORD *)v120;
            v121 = *(_QWORD *)(*((_QWORD *)ptr + 828) + 24 * v119 + 8);
          }
          else
          {
            v121 = *(unsigned __int8 *)(v120 + 23);
          }
          if (v121 == 9)
          {
            v122 = *(_QWORD *)v120;
            v123 = *(unsigned __int8 *)(v120 + 8);
            v125 = v122 == 0x5F4E574F4E4B4E55 && v123 == 57;
          }
          else
          {
            v125 = 0;
          }
          v126 = *(_QWORD *)(v118 + 168 * v119 + 24)
               * *(_QWORD *)(v118 + 168 * v119 + 16)
               * *(_QWORD *)(v118 + 168 * v119 + 32)
               * *(_QWORD *)(v118 + 168 * v119 + 40);
          if ((int)v126 >= 1)
          {
            v127 = 0;
            v128 = (_DWORD)v126 == 2 && v125;
            v129 = (*(_DWORD *)(v118 + 168 * v119 + 24)
                                * *(_DWORD *)(v118 + 168 * v119 + 16)
                                * *(_DWORD *)(v118 + 168 * v119 + 32)
                                * *(_DWORD *)(v118 + 168 * v119 + 40));
            do
            {
              v130 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 773) + 168 * v119) + 4 * v127);
              v131 = *((_QWORD *)ptr + 828) + 24 * v119;
              if (*(char *)(v131 + 23) >= 0)
                v132 = *(unsigned __int8 *)(v131 + 23);
              else
                v132 = *(_QWORD *)(v131 + 8);
              std::string::basic_string[abi:ne180100]((uint64_t)&buf, v132 + 8);
              if ((buf.width & 0x8000000000000000) == 0)
                p_buf = &buf;
              else
                p_buf = buf.data;
              if (v132)
              {
                if (*(char *)(v131 + 23) >= 0)
                  v134 = (const void *)v131;
                else
                  v134 = *(const void **)v131;
                memmove(p_buf, v134, v132);
              }
              strcpy((char *)p_buf + v132, "_unknown");
              std::to_string((std::string *)&v209, v128 + v127);
              if ((v209.width & 0x8000000000000000) == 0)
                v135 = (const std::string::value_type *)&v209;
              else
                v135 = (const std::string::value_type *)v209.data;
              if ((v209.width & 0x8000000000000000) == 0)
                width_high = HIBYTE(v209.width);
              else
                width_high = v209.height;
              v137 = std::string::append((std::string *)&buf, v135, width_high);
              v138 = *(_OWORD *)&v137->__r_.__value_.__l.__data_;
              v212[0].width = v137->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v212[0].data = v138;
              v137->__r_.__value_.__l.__size_ = 0;
              v137->__r_.__value_.__r.__words[2] = 0;
              v137->__r_.__value_.__r.__words[0] = 0;
              src.data = v212;
              *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)ptr + 834, v212, &src)+ 14) = v130;
              if (SHIBYTE(v212[0].width) < 0)
                operator delete(v212[0].data);
              if (SHIBYTE(v209.width) < 0)
                operator delete(v209.data);
              if (SHIBYTE(buf.width) < 0)
                operator delete(buf.data);
              ++v127;
            }
            while (v129 != v127);
            v117 = *((_QWORD *)ptr + 774);
            v118 = *((_QWORD *)ptr + 773);
          }
          ++v119;
          a8 = v192;
          p_info = (__objc2_class_ro **)(&OBJC_METACLASS___VNFaceRegionMapGenerator + 32);
        }
        while (0xCF3CF3CF3CF3CF3DLL * ((v117 - v118) >> 3) > v119);
      }
    }
    if (!*((_BYTE *)ptr + 64)
      || (*(_QWORD *)(*((_QWORD *)ptr + 838) + 96) = *((int *)ptr + 19),
          v35 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)ptr + 24))(*(_QWORD *)ptr, v208.i64[0]),
          (v35 & 0x80) != 0))
    {
      if (*((_BYTE *)ptr + 65) && *((_QWORD *)&v36 + 1) != (_QWORD)v36)
        *((float *)ptr + 1674) = *((float *)ptr + 1674) / (float)(unint64_t)v186;
      if (!*((_BYTE *)ptr + 67) || (v139 = *((_QWORD *)ptr + 831), v140 = *((_QWORD *)ptr + 832), v139 == v140))
      {
LABEL_200:
        *((_BYTE *)ptr + 6620) = 1;
        v35 = 9088;
      }
      else
      {
        while (1)
        {
          if (*(char *)(v139 + 23) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v212, *(const std::string::value_type **)v139, *(_QWORD *)(v139 + 8));
          }
          else
          {
            *(_OWORD *)&v212[0].data = *(_OWORD *)v139;
            v212[0].width = *(_QWORD *)(v139 + 16);
          }
          v141 = *((int *)ptr + 21);
          std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)ptr + 840, v212, (uint64_t)v212)[7][12] = v141;
          v142 = *(_QWORD *)ptr;
          v143 = std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v206, v212, (uint64_t)v212)[7];
          v144 = std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)ptr + 840, v212, (uint64_t)v212);
          v35 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v142 + 24))(v142, v143, v144[7]);
          if (SHIBYTE(v212[0].width) < 0)
            operator delete(v212[0].data);
          if ((v35 & 0x80) == 0)
            break;
          v139 += 24;
          if (v139 == v140)
            goto LABEL_200;
        }
      }
    }
    goto LABEL_215;
  }
  v37 = 0;
  v185 = 4221;
  __asm { FMOV            V0.4S, #1.0 }
  v187 = _Q0;
  v189 = ((v212[0].height - (unint64_t)v212[0].data) >> 5);
  v42 = v189;
  while (1)
  {
    v43 = (_OWORD *)(v36 + 32 * --v42);
    v44 = v43[1];
    *(_OWORD *)&src.data = *v43;
    *(_OWORD *)&src.width = v44;
    v203 = 0uLL;
    LODWORD(v204) = 0;
    if (*((int *)ptr + 20) >= 2)
    {
      if (src.height)
      {
        v45 = 0;
        v46 = 0;
        v47 = 0;
        v48 = 0;
        v49 = (char *)src.data + 2;
        do
        {
          v50 = (unsigned __int8 *)v49;
          for (i = src.width; i; --i)
          {
            v46 += *(v50 - 2);
            v47 += *(v50 - 1);
            v52 = *v50;
            v50 += 4;
            v48 += v52;
          }
          ++v45;
          v49 += src.rowBytes;
        }
        while (v45 != src.height);
      }
      else
      {
        v48 = 0;
        v47 = 0;
        v46 = 0;
      }
      v57 = (float)(src.width * src.height);
      v58 = (float)v46 / v57;
      v59 = (float)v47 / v57;
      v203.i32[3] = *((_DWORD *)ptr + 17);
      v60 = (float)v48 / v57;
      if (*((_BYTE *)ptr + 75))
      {
        *(float *)v203.i32 = -v58;
        *(float *)&v203.i32[1] = -v59;
        v61 = -v60;
      }
      else
      {
        if (!*((_BYTE *)ptr + 74))
        {
LABEL_54:
          LOBYTE(v204) = *((_BYTE *)ptr + 73);
          v212[0] = src;
          v62 = espresso_network_bind_input_vimagebuffer_bgra8();
          goto LABEL_57;
        }
        v61 = (float)(v58 + (float)(v60 + v59)) / -3.0;
        *(float *)v203.i32 = v61;
        *(float *)&v203.i32[1] = v61;
      }
      *(float *)&v203.i32[2] = v61;
      goto LABEL_54;
    }
    memset(&buf, 0, sizeof(buf));
    vImageBuffer_Init(&buf, src.width, src.height, 8u, 0);
    if (!src.data || !src.width || !src.height || src.rowBytes < 2)
      goto LABEL_214;
    *(_QWORD *)&matrix = 0x4C0096001DLL;
    *(_QWORD *)pre_bias = 0;
    if (vImageMatrixMultiply_ARGB8888ToPlanar8(&src, &buf, (const int16_t *)&matrix, 256, pre_bias, 0, 0))
    {
      v185 = 4218;
LABEL_214:
      v35 = v185;
      goto LABEL_215;
    }
    if (buf.height)
    {
      v53 = 0;
      v54 = 0;
      v55 = (unsigned __int8 *)buf.data;
      do
      {
        if (buf.width)
        {
          v56 = 0;
          do
          {
            v54 += v55[v56];
            v56 += 4;
          }
          while (buf.width > v56);
        }
        ++v53;
        v55 += buf.rowBytes;
      }
      while (v53 != buf.height);
    }
    else
    {
      v54 = 0;
    }
    v63 = v187;
    *(float *)v63.i32 = (float)-(float)v54 / (float)(buf.width * buf.height);
    v64 = vzip1q_s32(v63, v63);
    *(float *)&v64.i32[2] = (float)-(float)v54 / (float)(buf.width * buf.height);
    v203 = v64;
    LOBYTE(v204) = 0;
    v209 = buf;
    v62 = espresso_network_bind_input_vimagebuffer_planar8();
LABEL_57:
    if (v62 || espresso_plan_execute_sync())
    {
      v35 = 9086;
      goto LABEL_215;
    }
    if (*((_BYTE *)ptr + 64))
      break;
LABEL_72:
    if (*((_BYTE *)ptr + 65))
      *((float *)ptr + 1674) = **((float **)ptr + 806) + *((float *)ptr + 1674);
    if (*((_BYTE *)ptr + 67))
    {
      v191 = v42;
      buf.height = 0;
      buf.width = 0;
      buf.data = &buf.height;
      v73 = *((_QWORD *)ptr + 831);
      v74 = *((_QWORD *)ptr + 832);
      if (v73 == v74)
        goto LABEL_96;
      do
      {
        if (*(char *)(v73 + 23) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)v212, *(const std::string::value_type **)v73, *(_QWORD *)(v73 + 8));
        }
        else
        {
          *(_OWORD *)&v212[0].data = *(_OWORD *)v73;
          v212[0].width = *(_QWORD *)(v73 + 16);
        }
        v75 = malloc_type_malloc(4 * *((int *)ptr + 21), 0x100004052888210uLL);
        std::shared_ptr<float>::shared_ptr[abi:ne180100]<float,void (*)(void *),void>(&v209, (uint64_t)v75);
        v76 = std::__tree<std::__value_type<std::string,std::shared_ptr<float>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<float>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<float>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&buf, v212, (uint64_t)v212);
        v77 = *(_OWORD *)&v209.data;
        if (v209.height)
        {
          v78 = (unint64_t *)(v209.height + 8);
          do
            v79 = __ldxr(v78);
          while (__stxr(v79 + 1, v78));
        }
        v80 = (std::__shared_weak_count *)v76[8];
        *(_OWORD *)(v76 + 7) = v77;
        if (v80)
        {
          p_shared_owners = (unint64_t *)&v80->__shared_owners_;
          do
            v82 = __ldaxr(p_shared_owners);
          while (__stlxr(v82 - 1, p_shared_owners));
          if (!v82)
          {
            ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
            std::__shared_weak_count::__release_weak(v80);
          }
        }
        v83 = (std::__shared_weak_count *)v209.height;
        if (v209.height)
        {
          v84 = (unint64_t *)(v209.height + 8);
          do
            v85 = __ldaxr(v84);
          while (__stlxr(v85 - 1, v84));
          if (!v85)
          {
            ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
            std::__shared_weak_count::__release_weak(v83);
          }
        }
        if (SHIBYTE(v212[0].width) < 0)
          operator delete(v212[0].data);
        v73 += 24;
      }
      while (v73 != v74);
      if (*((_BYTE *)ptr + 67))
      {
LABEL_96:
        v86 = *((_QWORD *)ptr + 832);
        v87 = *((_QWORD *)ptr + 831);
        if (v86 != v87)
        {
          v88 = 0;
          LODWORD(v89) = *((_DWORD *)ptr + 21);
          do
          {
            if ((int)v89 >= 1)
            {
              v90 = 0;
              do
              {
                v91 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 776) + 168 * v88) + 4 * v90);
                *((_DWORD *)std::__tree<std::__value_type<std::string,std::shared_ptr<float>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<float>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<float>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&buf, (_QWORD *)(*((_QWORD *)ptr + 831) + 24 * v88), *((_QWORD *)ptr + 831) + 24 * v88)[7]+ v90++) = v91;
                v89 = *((int *)ptr + 21);
              }
              while (v90 < v89);
              v86 = *((_QWORD *)ptr + 832);
              v87 = *((_QWORD *)ptr + 831);
            }
            ++v88;
          }
          while (0xAAAAAAAAAAAAAAABLL * ((v86 - v87) >> 3) > v88);
        }
        v92 = &CVML_status_ok;
      }
      else
      {
        v92 = &CVML_status_IOError;
      }
      v101 = *v92 + 128;
      if ((v101 & 0x80) == 0)
      {
        v35 = v101 | 0x2300;
        std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>>>::destroy((_QWORD *)buf.height);
        p_info = (__objc2_class_ro **)(&OBJC_METACLASS___VNFaceRegionMapGenerator + 32);
        goto LABEL_215;
      }
      v102 = *((_QWORD *)ptr + 831);
      v103 = *((_QWORD *)ptr + 832);
      while (v102 != v103)
      {
        if (*(char *)(v102 + 23) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&v209, *(const std::string::value_type **)v102, *(_QWORD *)(v102 + 8));
        }
        else
        {
          *(_OWORD *)&v209.data = *(_OWORD *)v102;
          v209.width = *(_QWORD *)(v102 + 16);
        }
        v104 = operator new(8uLL);
        *v104 = v37;
        v203.i64[1] = (uint64_t)(v104 + 1);
        v204 = v104 + 1;
        v203.i64[0] = (uint64_t)v104;
        v105 = std::__tree<std::__value_type<std::string,std::shared_ptr<float>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<float>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<float>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&buf, &v209, (uint64_t)&v209);
        v106 = *((int *)ptr + 21);
        vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v212, &v203, v105[7], 4 * v106, 1, 0);
        v214 = 1;
        v215 = 0;
        v212[0].data = &off_1E453A8D0;
        v213 = v106 & 0x3FFFFFFFFFFFFFFFLL;
        if (v37)
        {
          v107 = std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v206, &v209, (uint64_t)&v209);
          (*(void (**)(uint64_t *, vImage_Buffer *))(*v107[7] + 40))(v107[7], v212);
        }
        else
        {
          DeepCopy = vision::mod::ImageDescriptorBufferAbstract::createDeepCopy((vision::mod::ImageDescriptorBufferAbstract *)v212);
          std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>::shared_ptr[abi:ne180100]<vision::mod::ImageDescriptorBufferAbstract,void>(&matrix, DeepCopy);
          v109 = std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v206, &v209, (uint64_t)&v209);
          v110 = matrix;
          matrix = 0uLL;
          v111 = (std::__shared_weak_count *)v109[8];
          *(_OWORD *)(v109 + 7) = v110;
          if (v111)
          {
            v112 = (unint64_t *)&v111->__shared_owners_;
            do
              v113 = __ldaxr(v112);
            while (__stlxr(v113 - 1, v112));
            if (!v113)
            {
              ((void (*)(std::__shared_weak_count *))v111->__on_zero_shared)(v111);
              std::__shared_weak_count::__release_weak(v111);
            }
          }
          v114 = (std::__shared_weak_count *)*((_QWORD *)&matrix + 1);
          if (*((_QWORD *)&matrix + 1))
          {
            v115 = (unint64_t *)(*((_QWORD *)&matrix + 1) + 8);
            do
              v116 = __ldaxr(v115);
            while (__stlxr(v116 - 1, v115));
            if (!v116)
            {
              ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
              std::__shared_weak_count::__release_weak(v114);
            }
          }
          v104 = (_QWORD *)v203.i64[0];
        }
        v212[0].data = &off_1E453A8D0;
        free(v215);
        vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(&v212[0].data);
        if (v104)
          operator delete(v104);
        if (SHIBYTE(v209.width) < 0)
          operator delete(v209.data);
        v102 += 24;
      }
      std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>>>::destroy((_QWORD *)buf.height);
      p_info = (__objc2_class_ro **)(&OBJC_METACLASS___VNFaceRegionMapGenerator + 32);
      v42 = v191;
    }
    if (++v37 == v189)
      goto LABEL_141;
  }
  v65 = malloc_type_malloc(4 * *((int *)ptr + 19), 0x100004052888210uLL);
  std::shared_ptr<float>::shared_ptr[abi:ne180100]<float,void (*)(void *),void>(&v209, (uint64_t)v65);
  if (!v209.data)
  {
    v35 = 9084;
    goto LABEL_208;
  }
  if (!*((_BYTE *)ptr + 64))
  {
    v35 = 9077;
    goto LABEL_208;
  }
  v67 = vision::mod::FaceprintAndAttributes::normalizeFacePrintData(*((vision::mod::FaceprintAndAttributes **)ptr + 785), (const void *)*((unsigned int *)ptr + 19), *((unsigned __int8 *)ptr + 72), (float *)v209.data, v66);
  if ((v67 & 0x80) != 0)
  {
    v68 = operator new(8uLL);
    *v68 = v37;
    buf.height = (vImagePixelCount)(v68 + 1);
    buf.width = (vImagePixelCount)(v68 + 1);
    v69 = *((int *)ptr + 19);
    buf.data = v68;
    vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v212, &buf, v209.data, 4 * v69, 1, 0);
    v214 = 1;
    v215 = 0;
    v212[0].data = &off_1E453A8D0;
    v213 = v69 & 0x3FFFFFFFFFFFFFFFLL;
    if (v37)
    {
      (*(void (**)(uint64_t, vImage_Buffer *))(*(_QWORD *)v208.i64[0] + 40))(v208.i64[0], v212);
    }
    else
    {
      v93 = vision::mod::ImageDescriptorBufferAbstract::createDeepCopy((vision::mod::ImageDescriptorBufferAbstract *)v212);
      std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>::shared_ptr[abi:ne180100]<vision::mod::ImageDescriptorBufferAbstract,void>(&v203, v93);
      v94 = v203;
      v203 = 0uLL;
      v95 = (std::__shared_weak_count *)v208.i64[1];
      v208 = v94;
      if (v95)
      {
        v96 = (unint64_t *)&v95->__shared_owners_;
        do
          v97 = __ldaxr(v96);
        while (__stlxr(v97 - 1, v96));
        if (!v97)
        {
          ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
          std::__shared_weak_count::__release_weak(v95);
        }
      }
      v98 = (std::__shared_weak_count *)v203.i64[1];
      if (v203.i64[1])
      {
        v99 = (unint64_t *)(v203.i64[1] + 8);
        do
          v100 = __ldaxr(v99);
        while (__stlxr(v100 - 1, v99));
        if (!v100)
        {
          ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
          std::__shared_weak_count::__release_weak(v98);
        }
      }
    }
    v212[0].data = &off_1E453A8D0;
    free(v215);
    vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(&v212[0].data);
    if (buf.data)
      operator delete(buf.data);
    v70 = (std::__shared_weak_count *)v209.height;
    if (v209.height)
    {
      v71 = (unint64_t *)(v209.height + 8);
      do
        v72 = __ldaxr(v71);
      while (__stlxr(v72 - 1, v71));
      if (!v72)
      {
        ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
        std::__shared_weak_count::__release_weak(v70);
      }
    }
    goto LABEL_72;
  }
  v35 = v67;
LABEL_208:
  v145 = (std::__shared_weak_count *)v209.height;
  if (v209.height)
  {
    v146 = (unint64_t *)(v209.height + 8);
    do
      v147 = __ldaxr(v146);
    while (__stlxr(v147 - 1, v146));
    if (!v147)
    {
      ((void (*)(std::__shared_weak_count *))v145->__on_zero_shared)(v145);
      std::__shared_weak_count::__release_weak(v145);
    }
  }
LABEL_215:
  std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>>>::destroy(v207[0]);
  v148 = (std::__shared_weak_count *)v208.i64[1];
  v29 = v188;
  if (v208.i64[1])
  {
    v149 = (unint64_t *)(v208.i64[1] + 8);
    do
      v150 = __ldaxr(v149);
    while (__stlxr(v150 - 1, v149));
    if (!v150)
    {
      ((void (*)(std::__shared_weak_count *))v148->__on_zero_shared)(v148);
      std::__shared_weak_count::__release_weak(v148);
    }
  }
  if ((_QWORD)v36)
    operator delete((void *)v36);
LABEL_222:
  if (v35 != 128)
  {
    v14 = v190;
    if (a8)
    {
      v155 = (void *)MEMORY[0x1E0CB3940];
      espresso_plan_get_error_info();
      std::string::basic_string[abi:ne180100]<0>(v212, v156);
      if ((v212[0].width & 0x8000000000000000) == 0)
        v157 = v212;
      else
        v157 = (vImage_Buffer *)v212[0].data;
      objc_msgSend(v155, "stringWithFormat:", CFSTR("Could not run network. Error = %s"), v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(v212[0].width) < 0)
        operator delete(v212[0].data);
      VNErrorForCVMLStatus((id)v35);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_info + 446, "errorForInternalErrorWithLocalizedDescription:underlyingError:", v158, v159);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    free(v29);
    goto LABEL_282;
  }
  free(v29);
  v14 = v190;
  if (!v202)
    goto LABEL_257;
  v151 = (uint64_t)v195->_mMultiHeadedFaceClassifier.__ptr_;
  if (!*(_BYTE *)(v151 + 64))
  {
    if (!a8)
      goto LABEL_282;
    objc_msgSend(p_info + 446, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Error calculating print"));
    v160 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_265;
  }
  vision::mod::FaceprintAndAttributes::createDescriptorBuffer((vision::mod::FaceprintAndAttributes *)&buf, v151);
  v153 = v195->_mMultiHeadedFaceClassifier.__ptr_;
  if (*((_BYTE *)v153 + 6620))
  {
    (*(void (**)(void *, _QWORD))(*(_QWORD *)buf.data + 40))(buf.data, *((_QWORD *)v153 + 838));
    v154 = &CVML_status_ok;
  }
  else
  {
    v154 = &CVML_status_IOError;
  }
  v161 = *v154 + 128;
  if ((*(_BYTE *)v154 + 0x80) != 128)
  {
    if (a8)
    {
      v164 = (void *)MEMORY[0x1E0CB3940];
      espresso_plan_get_error_info();
      std::string::basic_string[abi:ne180100]<0>(v212, v165);
      if ((v212[0].width & 0x8000000000000000) == 0)
        v166 = v212;
      else
        v166 = (vImage_Buffer *)v212[0].data;
      objc_msgSend(v164, "stringWithFormat:", CFSTR("Could not get print output. Error = %s"), v166);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(v212[0].width) < 0)
        operator delete(v212[0].data);
      goto LABEL_280;
    }
LABEL_281:
    std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&buf);
    goto LABEL_282;
  }
  v162 = v195->_mMultiHeadedFaceClassifier.__ptr_;
  if (!*((_BYTE *)v162 + 65))
  {
    LODWORD(v152) = 1.0;
    goto LABEL_252;
  }
  if (*((_BYTE *)v162 + 6620))
  {
    LODWORD(v152) = *((_DWORD *)v162 + 1674);
    v163 = &CVML_status_ok;
  }
  else
  {
    v163 = &CVML_status_IOError;
    LODWORD(v152) = 1.0;
  }
  v161 = *v163 + 128;
  if ((*(_BYTE *)v163 + 0x80) != 128)
  {
    if (a8)
    {
      v179 = (void *)MEMORY[0x1E0CB3940];
      espresso_plan_get_error_info();
      std::string::basic_string[abi:ne180100]<0>(v212, v180);
      if ((v212[0].width & 0x8000000000000000) == 0)
        v181 = v212;
      else
        v181 = (vImage_Buffer *)v212[0].data;
      objc_msgSend(v179, "stringWithFormat:", CFSTR("Could not get confidence output. Error = %s"), v181);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(v212[0].width) < 0)
        operator delete(v212[0].data);
LABEL_280:
      v182 = p_info + 446;
      VNErrorForCVMLStatus((id)(v161 | 0x2300));
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "errorForInternalErrorWithLocalizedDescription:underlyingError:", v167, v183);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_281;
    }
    goto LABEL_281;
  }
LABEL_252:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v152);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "setValue:forKey:", v168, CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionFaceprintConfidence"));

  v199[0] = buf.data;
  v199[1] = buf.height;
  if (buf.height)
  {
    v169 = (unint64_t *)(buf.height + 8);
    do
      v170 = __ldxr(v169);
    while (__stxr(v170 + 1, v169));
  }
  v171 = -[VNFaceAnalyzerMultiDetectorBase _saveFaceprint:toFaceObservation:options:error:](v195, "_saveFaceprint:toFaceObservation:options:error:", v199, v194, v190, a8);
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)v199);
  if (!v171)
    goto LABEL_281;
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&buf);
LABEL_257:
  if (v201)
  {
    v172 = (uint64_t)v195->_mMultiHeadedFaceClassifier.__ptr_;
    if (*(_BYTE *)(v172 + 66))
    {
      *(_OWORD *)&v212[0].height = 0uLL;
      v212[0].data = &v212[0].height;
      FaceAttributesOutput = (void *)vision::mod::FaceprintAndAttributes::getFaceAttributesOutput(v172, (uint64_t **)v212);
      if (FaceAttributesOutput == 128)
      {
        if (-[VNFaceAnalyzerMultiDetectorBase _saveFaceAttributes:toFaceObservation:options:error:](v195, "_saveFaceAttributes:toFaceObservation:options:error:", v212, v193, v190, a8))
        {
          std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::destroy((char *)v212[0].height);
          goto LABEL_262;
        }
      }
      else if (a8)
      {
        v174 = (void *)MEMORY[0x1E0CB3940];
        espresso_plan_get_error_info();
        std::string::basic_string[abi:ne180100]<0>(&buf, v175);
        if ((buf.width & 0x8000000000000000) == 0)
          v176 = &buf;
        else
          v176 = buf.data;
        objc_msgSend(v174, "stringWithFormat:", CFSTR("Could not get attributes output. Error = %s"), v176);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        if (SHIBYTE(buf.width) < 0)
          operator delete(buf.data);
        VNErrorForCVMLStatus(FaceAttributesOutput);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(p_info + 446, "errorForInternalErrorWithLocalizedDescription:underlyingError:", v177, v178);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

      }
      std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::destroy((char *)v212[0].height);
      goto LABEL_282;
    }
    if (!a8)
      goto LABEL_282;
    objc_msgSend(p_info + 446, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Error classifying attributes"));
    v160 = (id)objc_claimAutoreleasedReturnValue();
LABEL_265:
    v18 = 0;
    *a8 = v160;
  }
  else
  {
LABEL_262:
    v18 = v196;
  }
LABEL_283:

  v16 = v194;
LABEL_284:

LABEL_285:
LABEL_286:

  return v18;
}

- (BOOL)_saveFaceprint:(shared_ptr<vision:(id)a4 :(id)a5 mod:(id *)a6 :ImageDescriptorBufferAbstract>)a3 toFaceObservation:options:error:
{
  ImageDescriptorBufferAbstract *var0;
  __shared_weak_count *v10;
  id v11;
  void *v12;
  size_t v13;
  void *v14;
  const void *DataForKthDescriptor;
  BOOL v16;
  VNFaceprint *v17;
  void *v18;
  int v19;
  uint64_t v20;
  double v21;
  VNFaceprint *v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  uint64_t v38;
  int v39;
  void *__p[3];
  vision::mod::ImageDescriptorBufferAbstract *v41;
  std::__shared_weak_count *v42;
  char v43;

  var0 = a3.var0;
  v10 = a3.var1;
  v11 = a4;
  v43 = 0;
  if (+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v43, CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionFaceprintForceFaceprintCreation"), v11, 0, a5))
  {
    +[VNValidationUtilities originatingRequestSpecifierForKey:inOptions:specifyingRequestClass:error:](VNValidationUtilities, "originatingRequestSpecifierForKey:inOptions:specifyingRequestClass:error:", CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionFaceprintOriginatingRequestSpecifier"), v11, objc_opt_class(), a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (v43)
      {
LABEL_4:
        v13 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)var0 + 104))(*(_QWORD *)var0);
        std::vector<unsigned char>::vector(__p, v13);
        v14 = __p[0];
        DataForKthDescriptor = (const void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)var0, 0);
        memcpy(v14, DataForKthDescriptor, v13);
        v39 = -1082130432;
        v16 = +[VNValidationUtilities getFloatValue:forKey:inOptions:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:error:", &v39, CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionFaceprintConfidence"), v11, a5);
        if (v16)
        {
          v17 = [VNFaceprint alloc];
          v18 = __p[0];
          v19 = v39;
          v20 = objc_msgSend(v12, "requestRevision");
          LODWORD(v21) = v19;
          v22 = -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](v17, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v18, v13 >> 2, 1, v13, v20, v21);
          -[__shared_weak_count setFaceprint:](v10, "setFaceprint:", v22);

        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        goto LABEL_21;
      }
      v23 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
      v41 = *(vision::mod::ImageDescriptorBufferAbstract **)var0;
      v42 = v23;
      if (v23)
      {
        p_shared_owners = (unint64_t *)&v23->__shared_owners_;
        do
          v25 = __ldxr(p_shared_owners);
        while (__stxr(v25 + 1, p_shared_owners));
      }
      v26 = -[VNFaceAnalyzerMultiDetectorBase _isFaceprintJunk:](self, "_isFaceprintJunk:", &v41);
      v33 = v26;
      v34 = v42;
      if (!v42)
        goto LABEL_17;
      v35 = (unint64_t *)&v42->__shared_owners_;
      do
        v36 = __ldaxr(v35);
      while (__stlxr(v36 - 1, v35));
      if (!v36)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
        if (!v33)
          goto LABEL_4;
      }
      else
      {
LABEL_17:
        if (!v26)
          goto LABEL_4;
      }
      VNValidatedLog(2, (uint64_t)CFSTR("Poor quality face print candidate detected.  Not generating faceprint"), v27, v28, v29, v30, v31, v32, v38);
      -[__shared_weak_count setFaceprint:](v10, "setFaceprint:", 0);
      v16 = 1;
    }
    else
    {
      v16 = 0;
    }
LABEL_21:

    goto LABEL_22;
  }
  v16 = 0;
LABEL_22:

  return v16;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  const void *v12;
  void **p_dst;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  size_t v22;
  int v23;
  void **v24;
  std::vector<std::string> *v25;
  BOOL v26;
  void **v27;
  int v28;
  int v29;
  int *v30;
  shared_ptr<vision::mod::FaceprintAndAttributes> v31;
  uint64_t v32;
  void **v33;
  char *v34;
  int *v35;
  _DWORD *v36;
  int v37;
  int v38;
  std::string::value_type v39;
  __int16 v40;
  std::string::size_type size;
  std::string *p_p;
  char v44;
  float v45;
  BOOL v47;
  unint64_t *v50;
  uint64_t *v51;
  unsigned __int16 *v52;
  uint64_t v53;
  int v54;
  BOOL v55;
  BOOL v56;
  BOOL v58;
  int v59;
  int v60;
  BOOL v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  uint64_t j;
  char *v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  char *v72;
  unint64_t *v73;
  uint64_t v74;
  __int128 *v75;
  __int128 *v76;
  __int128 v77;
  std::string *v78;
  std::string::size_type v79;
  char v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  std::string::size_type v92;
  std::string *v93;
  std::string *v94;
  unint64_t v95;
  unint64_t v96;
  __int128 v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  __int128 v104;
  uint64_t v105;
  int v106;
  std::string::size_type v107;
  std::string *v108;
  std::string *v109;
  unint64_t v110;
  unint64_t v111;
  __int128 v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  __int128 v119;
  uint64_t v120;
  int v121;
  unint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  uint64_t v129;
  unint64_t v130;
  char *v131;
  char *v132;
  unint64_t v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  unint64_t v142;
  unint64_t v143;
  unint64_t v144;
  uint64_t v145;
  unint64_t v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  uint64_t v150;
  unint64_t v151;
  char *v152;
  char *v153;
  unint64_t v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  uint64_t v163;
  uint64_t k;
  _QWORD *v165;
  uint64_t **v166;
  std::__shared_weak_count *v167;
  unint64_t *v168;
  unint64_t v169;
  _QWORD *v170;
  std::__shared_weak_count *v171;
  unint64_t *v172;
  unint64_t v173;
  unint64_t v174;
  shared_ptr<vision::mod::FaceprintAndAttributes> *p_mMultiHeadedFaceClassifier;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v178;
  void *v179;
  _DWORD *v181;
  uint64_t v182;
  unint64_t *v183;
  void *v184;
  id *v185;
  VNFaceAnalyzerMultiDetectorBase *v186;
  char **v187;
  std::vector<std::string> *v188;
  std::vector<std::string> *v189;
  std::vector<std::string> *v190;
  void **__dst;
  size_t v192;
  int64_t v193;
  objc_super v194;
  char *v195;
  char *v196;
  std::string v197;
  std::string __p;
  _BYTE __v[48];
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  uint64_t v207;
  _QWORD v208[3];
  _QWORD v209[3];
  _QWORD v210[3];
  __int128 v211;
  _QWORD v212[3];
  _QWORD v213[3];
  _QWORD v214[3];
  _QWORD v215[3];
  _QWORD v216[3];
  _QWORD v217[3];
  __int128 v218;
  uint64_t v219;
  _QWORD v220[5];

  v220[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v194.receiver = self;
  v194.super_class = (Class)VNFaceAnalyzerMultiDetectorBase;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v194, sel_completeInitializationForSession_error_, v6, a4))
  {
    v14 = 0;
    goto LABEL_314;
  }
  v186 = self;
  -[VNDetector configurationOptions](self, "configurationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_RequestDetectionLevel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = a4;
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v10 = objc_msgSend((id)objc_opt_class(), "modelVersionForOptions:", v7);
  v11 = *(_QWORD *)(v10 + 8);
  if (v11 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v12 = *(const void **)v10;
  if (v11 >= 0x17)
  {
    v15 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17)
      v15 = v11 | 7;
    v16 = v15 + 1;
    p_dst = (void **)operator new(v15 + 1);
    v192 = v11;
    v193 = v16 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_10;
  }
  HIBYTE(v193) = *(_QWORD *)(v10 + 8);
  p_dst = (void **)&__dst;
  if (v11)
LABEL_10:
    memmove(p_dst, v12, v11);
  *((_BYTE *)p_dst + v11) = 0;
  -[VNEspressoModelFileBasedDetector espressoResources](v186, "espressoResources");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v184, "network");
  if (!v18)
  {
    syslog(5, "[Error] Cannot initialize FaceprintAndAttributes object with null plan");
    v31 = (shared_ptr<vision::mod::FaceprintAndAttributes>)0;
    v32 = -4;
    goto LABEL_303;
  }
  v19 = v17;
  v20 = (char *)operator new(0x1A70uLL);
  v21 = v20;
  *(_OWORD *)(v20 + 8) = 0u;
  v183 = (unint64_t *)(v20 + 8);
  *(_QWORD *)v20 = &off_1E453BA00;
  *((_DWORD *)v20 + 39) = 65568;
  v20[6644] = 0;
  *((_QWORD *)v20 + 837) = v20 + 6704;
  *((_QWORD *)v20 + 843) = v20 + 6752;
  *((_QWORD *)v20 + 15) = v18;
  *((_QWORD *)v20 + 16) = v18;
  *((_QWORD *)v20 + 17) = v19;
  v22 = HIBYTE(v193);
  v23 = SHIBYTE(v193);
  v24 = __dst;
  if (v193 < 0)
    v22 = v192;
  *(_OWORD *)(v20 + 24) = 0uLL;
  v25 = (std::vector<std::string> *)(v20 + 24);
  *(_OWORD *)(v20 + 40) = 0uLL;
  *(_OWORD *)(v20 + 56) = 0uLL;
  *(_OWORD *)(v20 + 72) = 0uLL;
  *(_OWORD *)(v20 + 88) = 0uLL;
  *(_OWORD *)(v20 + 104) = 0uLL;
  *(_QWORD *)(v20 + 148) = 0xFFFFFFFF00000000;
  *((_DWORD *)v20 + 1660) = 0;
  *((_OWORD *)v20 + 419) = 0uLL;
  *((_OWORD *)v20 + 10) = 0uLL;
  *((_OWORD *)v20 + 11) = 0uLL;
  *((_OWORD *)v20 + 12) = 0uLL;
  *((_OWORD *)v20 + 13) = 0uLL;
  *((_OWORD *)v20 + 14) = 0uLL;
  *((_OWORD *)v20 + 15) = 0uLL;
  *((_OWORD *)v20 + 16) = 0uLL;
  *((_OWORD *)v20 + 17) = 0uLL;
  *((_OWORD *)v20 + 18) = 0uLL;
  *((_OWORD *)v20 + 19) = 0uLL;
  *((_DWORD *)v20 + 80) = 0;
  *((_DWORD *)v20 + 122) = 0;
  *(_OWORD *)(v20 + 456) = 0uLL;
  *(_OWORD *)(v20 + 472) = 0uLL;
  *(_OWORD *)(v20 + 424) = 0uLL;
  *(_OWORD *)(v20 + 440) = 0uLL;
  *(_OWORD *)(v20 + 392) = 0uLL;
  *(_OWORD *)(v20 + 408) = 0uLL;
  *(_OWORD *)(v20 + 360) = 0uLL;
  *(_OWORD *)(v20 + 376) = 0uLL;
  *(_OWORD *)(v20 + 328) = 0uLL;
  *(_OWORD *)(v20 + 344) = 0uLL;
  *((_DWORD *)v20 + 164) = 0;
  *((_OWORD *)v20 + 37) = 0uLL;
  *((_OWORD *)v20 + 38) = 0uLL;
  *((_OWORD *)v20 + 35) = 0uLL;
  *((_OWORD *)v20 + 36) = 0uLL;
  *((_OWORD *)v20 + 33) = 0uLL;
  *((_OWORD *)v20 + 34) = 0uLL;
  *((_OWORD *)v20 + 31) = 0uLL;
  *((_OWORD *)v20 + 32) = 0uLL;
  *((_OWORD *)v20 + 39) = 0uLL;
  *((_OWORD *)v20 + 40) = 0uLL;
  *((_DWORD *)v20 + 206) = 0;
  *(_OWORD *)(v20 + 792) = 0uLL;
  *(_OWORD *)(v20 + 808) = 0uLL;
  *(_OWORD *)(v20 + 760) = 0uLL;
  *(_OWORD *)(v20 + 776) = 0uLL;
  *(_OWORD *)(v20 + 728) = 0uLL;
  *(_OWORD *)(v20 + 744) = 0uLL;
  *(_OWORD *)(v20 + 696) = 0uLL;
  *(_OWORD *)(v20 + 712) = 0uLL;
  *(_OWORD *)(v20 + 664) = 0uLL;
  *(_OWORD *)(v20 + 680) = 0uLL;
  *((_OWORD *)v20 + 52) = 0uLL;
  *((_OWORD *)v20 + 53) = 0uLL;
  *((_OWORD *)v20 + 54) = 0uLL;
  *((_OWORD *)v20 + 55) = 0uLL;
  *((_OWORD *)v20 + 56) = 0uLL;
  *((_OWORD *)v20 + 57) = 0uLL;
  *((_OWORD *)v20 + 58) = 0uLL;
  *((_OWORD *)v20 + 59) = 0uLL;
  *((_OWORD *)v20 + 60) = 0uLL;
  *((_OWORD *)v20 + 61) = 0uLL;
  *((_DWORD *)v20 + 248) = 0;
  *((_DWORD *)v20 + 290) = 0;
  *(_OWORD *)(v20 + 1144) = 0uLL;
  *(_OWORD *)(v20 + 1128) = 0uLL;
  *(_OWORD *)(v20 + 1112) = 0uLL;
  *(_OWORD *)(v20 + 1096) = 0uLL;
  *(_OWORD *)(v20 + 1080) = 0uLL;
  *(_OWORD *)(v20 + 1064) = 0uLL;
  *(_OWORD *)(v20 + 1032) = 0uLL;
  *(_OWORD *)(v20 + 1048) = 0uLL;
  *(_OWORD *)(v20 + 1000) = 0uLL;
  *(_OWORD *)(v20 + 1016) = 0uLL;
  *((_DWORD *)v20 + 332) = 0;
  *((_OWORD *)v20 + 82) = 0uLL;
  *((_OWORD *)v20 + 81) = 0uLL;
  *((_OWORD *)v20 + 80) = 0uLL;
  *((_OWORD *)v20 + 79) = 0uLL;
  *((_OWORD *)v20 + 78) = 0uLL;
  *((_OWORD *)v20 + 77) = 0uLL;
  *((_OWORD *)v20 + 76) = 0uLL;
  *((_OWORD *)v20 + 75) = 0uLL;
  *((_OWORD *)v20 + 74) = 0uLL;
  *((_OWORD *)v20 + 73) = 0uLL;
  *((_DWORD *)v20 + 374) = 0;
  *(_OWORD *)(v20 + 1480) = 0uLL;
  *(_OWORD *)(v20 + 1464) = 0uLL;
  *(_OWORD *)(v20 + 1448) = 0uLL;
  *(_OWORD *)(v20 + 1432) = 0uLL;
  *(_OWORD *)(v20 + 1416) = 0uLL;
  *(_OWORD *)(v20 + 1400) = 0uLL;
  *(_OWORD *)(v20 + 1384) = 0uLL;
  *(_OWORD *)(v20 + 1368) = 0uLL;
  *(_OWORD *)(v20 + 1352) = 0uLL;
  *(_OWORD *)(v20 + 1336) = 0uLL;
  *((_DWORD *)v20 + 416) = 0;
  *((_OWORD *)v20 + 103) = 0uLL;
  *((_OWORD *)v20 + 102) = 0uLL;
  *((_OWORD *)v20 + 101) = 0uLL;
  *((_OWORD *)v20 + 100) = 0uLL;
  *((_OWORD *)v20 + 99) = 0uLL;
  *((_OWORD *)v20 + 98) = 0uLL;
  *((_OWORD *)v20 + 97) = 0uLL;
  *((_OWORD *)v20 + 96) = 0uLL;
  *((_OWORD *)v20 + 95) = 0uLL;
  *((_OWORD *)v20 + 94) = 0uLL;
  *((_DWORD *)v20 + 458) = 0;
  *(_OWORD *)(v20 + 1816) = 0uLL;
  *(_OWORD *)(v20 + 1800) = 0uLL;
  *(_OWORD *)(v20 + 1784) = 0uLL;
  *(_OWORD *)(v20 + 1768) = 0uLL;
  *(_OWORD *)(v20 + 1752) = 0uLL;
  *(_OWORD *)(v20 + 1736) = 0uLL;
  *(_OWORD *)(v20 + 1720) = 0uLL;
  *(_OWORD *)(v20 + 1704) = 0uLL;
  *(_OWORD *)(v20 + 1688) = 0uLL;
  *(_OWORD *)(v20 + 1672) = 0uLL;
  *((_DWORD *)v20 + 500) = 0;
  *((_OWORD *)v20 + 124) = 0uLL;
  *((_OWORD *)v20 + 123) = 0uLL;
  *((_OWORD *)v20 + 122) = 0uLL;
  *((_OWORD *)v20 + 121) = 0uLL;
  *((_OWORD *)v20 + 120) = 0uLL;
  *((_OWORD *)v20 + 119) = 0uLL;
  *((_OWORD *)v20 + 118) = 0uLL;
  *((_OWORD *)v20 + 117) = 0uLL;
  *((_OWORD *)v20 + 116) = 0uLL;
  *((_OWORD *)v20 + 115) = 0uLL;
  *((_DWORD *)v20 + 542) = 0;
  *(_OWORD *)(v20 + 2152) = 0uLL;
  *(_OWORD *)(v20 + 2136) = 0uLL;
  *(_OWORD *)(v20 + 2120) = 0uLL;
  *(_OWORD *)(v20 + 2104) = 0uLL;
  *(_OWORD *)(v20 + 2088) = 0uLL;
  *(_OWORD *)(v20 + 2072) = 0uLL;
  *(_OWORD *)(v20 + 2056) = 0uLL;
  *(_OWORD *)(v20 + 2040) = 0uLL;
  *(_OWORD *)(v20 + 2024) = 0uLL;
  *(_OWORD *)(v20 + 2008) = 0uLL;
  *((_DWORD *)v20 + 584) = 0;
  *((_OWORD *)v20 + 145) = 0uLL;
  *((_OWORD *)v20 + 144) = 0uLL;
  *((_OWORD *)v20 + 143) = 0uLL;
  *((_OWORD *)v20 + 142) = 0uLL;
  *((_OWORD *)v20 + 141) = 0uLL;
  *((_OWORD *)v20 + 140) = 0uLL;
  *((_OWORD *)v20 + 139) = 0uLL;
  *((_OWORD *)v20 + 138) = 0uLL;
  *((_OWORD *)v20 + 137) = 0uLL;
  *((_OWORD *)v20 + 136) = 0uLL;
  *((_DWORD *)v20 + 626) = 0;
  *(_OWORD *)(v20 + 2488) = 0uLL;
  *(_OWORD *)(v20 + 2472) = 0uLL;
  *(_OWORD *)(v20 + 2456) = 0uLL;
  *(_OWORD *)(v20 + 2440) = 0uLL;
  *(_OWORD *)(v20 + 2424) = 0uLL;
  *(_OWORD *)(v20 + 2408) = 0uLL;
  *(_OWORD *)(v20 + 2392) = 0uLL;
  *(_OWORD *)(v20 + 2376) = 0uLL;
  *(_OWORD *)(v20 + 2360) = 0uLL;
  *(_OWORD *)(v20 + 2344) = 0uLL;
  *((_DWORD *)v20 + 668) = 0;
  *((_OWORD *)v20 + 166) = 0uLL;
  *((_OWORD *)v20 + 165) = 0uLL;
  *((_OWORD *)v20 + 164) = 0uLL;
  *((_OWORD *)v20 + 163) = 0uLL;
  *((_OWORD *)v20 + 162) = 0uLL;
  *((_OWORD *)v20 + 161) = 0uLL;
  *((_OWORD *)v20 + 160) = 0uLL;
  *((_OWORD *)v20 + 159) = 0uLL;
  *((_OWORD *)v20 + 158) = 0uLL;
  *((_OWORD *)v20 + 157) = 0uLL;
  *((_DWORD *)v20 + 710) = 0;
  *(_OWORD *)(v20 + 2824) = 0uLL;
  *(_OWORD *)(v20 + 2808) = 0uLL;
  *(_OWORD *)(v20 + 2792) = 0uLL;
  *(_OWORD *)(v20 + 2776) = 0uLL;
  *(_OWORD *)(v20 + 2760) = 0uLL;
  *(_OWORD *)(v20 + 2744) = 0uLL;
  *(_OWORD *)(v20 + 2728) = 0uLL;
  *(_OWORD *)(v20 + 2712) = 0uLL;
  *(_OWORD *)(v20 + 2696) = 0uLL;
  *(_OWORD *)(v20 + 2680) = 0uLL;
  *((_DWORD *)v20 + 752) = 0;
  *((_OWORD *)v20 + 187) = 0uLL;
  *((_OWORD *)v20 + 186) = 0uLL;
  *((_OWORD *)v20 + 185) = 0uLL;
  *((_OWORD *)v20 + 184) = 0uLL;
  *((_OWORD *)v20 + 183) = 0uLL;
  *((_OWORD *)v20 + 182) = 0uLL;
  *((_OWORD *)v20 + 181) = 0uLL;
  *((_OWORD *)v20 + 180) = 0uLL;
  *((_OWORD *)v20 + 179) = 0uLL;
  *((_OWORD *)v20 + 178) = 0uLL;
  *((_DWORD *)v20 + 794) = 0;
  *(_OWORD *)(v20 + 3160) = 0uLL;
  *(_OWORD *)(v20 + 3144) = 0uLL;
  *(_OWORD *)(v20 + 3128) = 0uLL;
  *(_OWORD *)(v20 + 3112) = 0uLL;
  *(_OWORD *)(v20 + 3096) = 0uLL;
  *(_OWORD *)(v20 + 3080) = 0uLL;
  *(_OWORD *)(v20 + 3064) = 0uLL;
  *(_OWORD *)(v20 + 3048) = 0uLL;
  *(_OWORD *)(v20 + 3032) = 0uLL;
  *(_OWORD *)(v20 + 3016) = 0uLL;
  *((_DWORD *)v20 + 836) = 0;
  *((_OWORD *)v20 + 208) = 0uLL;
  *((_OWORD *)v20 + 207) = 0uLL;
  *((_OWORD *)v20 + 206) = 0uLL;
  *((_OWORD *)v20 + 205) = 0uLL;
  *((_OWORD *)v20 + 204) = 0uLL;
  *((_OWORD *)v20 + 203) = 0uLL;
  *((_OWORD *)v20 + 202) = 0uLL;
  *((_OWORD *)v20 + 201) = 0uLL;
  *((_OWORD *)v20 + 200) = 0uLL;
  *((_OWORD *)v20 + 199) = 0uLL;
  *((_DWORD *)v20 + 878) = 0;
  *(_OWORD *)(v20 + 3496) = 0uLL;
  *(_OWORD *)(v20 + 3480) = 0uLL;
  *(_OWORD *)(v20 + 3464) = 0uLL;
  *(_OWORD *)(v20 + 3448) = 0uLL;
  *(_OWORD *)(v20 + 3432) = 0uLL;
  *(_OWORD *)(v20 + 3416) = 0uLL;
  *(_OWORD *)(v20 + 3400) = 0uLL;
  *(_OWORD *)(v20 + 3384) = 0uLL;
  *(_OWORD *)(v20 + 3368) = 0uLL;
  *(_OWORD *)(v20 + 3352) = 0uLL;
  *((_DWORD *)v20 + 920) = 0;
  *((_OWORD *)v20 + 229) = 0uLL;
  *((_OWORD *)v20 + 228) = 0uLL;
  *((_OWORD *)v20 + 227) = 0uLL;
  *((_OWORD *)v20 + 226) = 0uLL;
  *((_OWORD *)v20 + 225) = 0uLL;
  *((_OWORD *)v20 + 224) = 0uLL;
  *((_OWORD *)v20 + 223) = 0uLL;
  *((_OWORD *)v20 + 222) = 0uLL;
  *((_OWORD *)v20 + 221) = 0uLL;
  *((_OWORD *)v20 + 220) = 0uLL;
  *((_DWORD *)v20 + 962) = 0;
  *(_OWORD *)(v20 + 3688) = 0uLL;
  *((_DWORD *)v20 + 1004) = 0;
  *((_OWORD *)v20 + 250) = 0uLL;
  *((_OWORD *)v20 + 249) = 0uLL;
  *((_OWORD *)v20 + 248) = 0uLL;
  *((_OWORD *)v20 + 247) = 0uLL;
  *((_OWORD *)v20 + 246) = 0uLL;
  *((_OWORD *)v20 + 245) = 0uLL;
  *((_OWORD *)v20 + 244) = 0uLL;
  *((_OWORD *)v20 + 243) = 0uLL;
  *((_OWORD *)v20 + 242) = 0uLL;
  *((_OWORD *)v20 + 241) = 0uLL;
  *((_DWORD *)v20 + 1046) = 0;
  *(_OWORD *)(v20 + 4168) = 0uLL;
  *(_OWORD *)(v20 + 4152) = 0uLL;
  *(_OWORD *)(v20 + 4136) = 0uLL;
  *(_OWORD *)(v20 + 4120) = 0uLL;
  *(_OWORD *)(v20 + 4104) = 0uLL;
  *(_OWORD *)(v20 + 4088) = 0uLL;
  *(_OWORD *)(v20 + 4072) = 0uLL;
  *(_OWORD *)(v20 + 4056) = 0uLL;
  *(_OWORD *)(v20 + 4040) = 0uLL;
  *(_OWORD *)(v20 + 4024) = 0uLL;
  *((_DWORD *)v20 + 1088) = 0;
  *((_OWORD *)v20 + 271) = 0uLL;
  *((_OWORD *)v20 + 270) = 0uLL;
  *((_OWORD *)v20 + 269) = 0uLL;
  *((_OWORD *)v20 + 268) = 0uLL;
  *((_OWORD *)v20 + 267) = 0uLL;
  *((_OWORD *)v20 + 266) = 0uLL;
  *((_OWORD *)v20 + 265) = 0uLL;
  *((_OWORD *)v20 + 264) = 0uLL;
  *((_OWORD *)v20 + 263) = 0uLL;
  *((_OWORD *)v20 + 262) = 0uLL;
  *((_DWORD *)v20 + 1130) = 0;
  *(_OWORD *)(v20 + 4504) = 0uLL;
  *(_OWORD *)(v20 + 4488) = 0uLL;
  *(_OWORD *)(v20 + 4472) = 0uLL;
  *(_OWORD *)(v20 + 4456) = 0uLL;
  *(_OWORD *)(v20 + 4440) = 0uLL;
  *(_OWORD *)(v20 + 4424) = 0uLL;
  *(_OWORD *)(v20 + 4408) = 0uLL;
  *(_OWORD *)(v20 + 4392) = 0uLL;
  *(_OWORD *)(v20 + 4376) = 0uLL;
  *(_OWORD *)(v20 + 4360) = 0uLL;
  *((_DWORD *)v20 + 1172) = 0;
  *((_OWORD *)v20 + 292) = 0uLL;
  *((_OWORD *)v20 + 291) = 0uLL;
  *((_OWORD *)v20 + 290) = 0uLL;
  *((_OWORD *)v20 + 289) = 0uLL;
  *((_OWORD *)v20 + 288) = 0uLL;
  *((_OWORD *)v20 + 287) = 0uLL;
  *((_OWORD *)v20 + 286) = 0uLL;
  *((_OWORD *)v20 + 285) = 0uLL;
  *((_OWORD *)v20 + 284) = 0uLL;
  *((_OWORD *)v20 + 283) = 0uLL;
  *((_DWORD *)v20 + 1214) = 0;
  *(_OWORD *)(v20 + 4840) = 0uLL;
  *(_OWORD *)(v20 + 4824) = 0uLL;
  *(_OWORD *)(v20 + 4808) = 0uLL;
  *(_OWORD *)(v20 + 4792) = 0uLL;
  *(_OWORD *)(v20 + 4776) = 0uLL;
  *(_OWORD *)(v20 + 4760) = 0uLL;
  *(_OWORD *)(v20 + 4744) = 0uLL;
  *(_OWORD *)(v20 + 4728) = 0uLL;
  *(_OWORD *)(v20 + 4712) = 0uLL;
  *(_OWORD *)(v20 + 4696) = 0uLL;
  *((_DWORD *)v20 + 1256) = 0;
  *((_OWORD *)v20 + 313) = 0uLL;
  *((_OWORD *)v20 + 312) = 0uLL;
  *((_OWORD *)v20 + 311) = 0uLL;
  *((_OWORD *)v20 + 310) = 0uLL;
  *((_OWORD *)v20 + 309) = 0uLL;
  *((_OWORD *)v20 + 308) = 0uLL;
  *((_OWORD *)v20 + 307) = 0uLL;
  *((_OWORD *)v20 + 306) = 0uLL;
  *((_OWORD *)v20 + 305) = 0uLL;
  *((_OWORD *)v20 + 304) = 0uLL;
  *((_DWORD *)v20 + 1298) = 0;
  *(_OWORD *)(v20 + 5176) = 0uLL;
  *(_OWORD *)(v20 + 5160) = 0uLL;
  *(_OWORD *)(v20 + 5144) = 0uLL;
  *(_OWORD *)(v20 + 5128) = 0uLL;
  *(_OWORD *)(v20 + 5112) = 0uLL;
  *(_OWORD *)(v20 + 5096) = 0uLL;
  *(_OWORD *)(v20 + 5080) = 0uLL;
  *(_OWORD *)(v20 + 5064) = 0uLL;
  *(_OWORD *)(v20 + 5048) = 0uLL;
  *(_OWORD *)(v20 + 5032) = 0uLL;
  *((_DWORD *)v20 + 1340) = 0;
  *((_OWORD *)v20 + 334) = 0uLL;
  *((_OWORD *)v20 + 333) = 0uLL;
  *((_OWORD *)v20 + 332) = 0uLL;
  *((_OWORD *)v20 + 331) = 0uLL;
  *((_OWORD *)v20 + 330) = 0uLL;
  *((_OWORD *)v20 + 329) = 0uLL;
  *((_OWORD *)v20 + 328) = 0uLL;
  *((_OWORD *)v20 + 327) = 0uLL;
  *((_OWORD *)v20 + 326) = 0uLL;
  *((_OWORD *)v20 + 325) = 0uLL;
  *((_DWORD *)v20 + 1382) = 0;
  *(_OWORD *)(v20 + 5512) = 0uLL;
  *(_OWORD *)(v20 + 5496) = 0uLL;
  *(_OWORD *)(v20 + 5480) = 0uLL;
  *(_OWORD *)(v20 + 5464) = 0uLL;
  *(_OWORD *)(v20 + 5448) = 0uLL;
  *(_OWORD *)(v20 + 5432) = 0uLL;
  *(_OWORD *)(v20 + 5416) = 0uLL;
  *(_OWORD *)(v20 + 5400) = 0uLL;
  *(_OWORD *)(v20 + 5384) = 0uLL;
  *(_OWORD *)(v20 + 5368) = 0uLL;
  *((_DWORD *)v20 + 1424) = 0;
  *((_OWORD *)v20 + 355) = 0uLL;
  *((_OWORD *)v20 + 354) = 0uLL;
  *((_OWORD *)v20 + 353) = 0uLL;
  *((_OWORD *)v20 + 352) = 0uLL;
  *((_OWORD *)v20 + 351) = 0uLL;
  *((_OWORD *)v20 + 350) = 0uLL;
  *((_OWORD *)v20 + 349) = 0uLL;
  *((_OWORD *)v20 + 348) = 0uLL;
  *((_OWORD *)v20 + 347) = 0uLL;
  *((_OWORD *)v20 + 346) = 0uLL;
  *((_DWORD *)v20 + 1466) = 0;
  *(_OWORD *)(v20 + 5848) = 0uLL;
  *(_OWORD *)(v20 + 5832) = 0uLL;
  *(_OWORD *)(v20 + 5816) = 0uLL;
  *(_OWORD *)(v20 + 5800) = 0uLL;
  *(_OWORD *)(v20 + 5784) = 0uLL;
  *(_OWORD *)(v20 + 5768) = 0uLL;
  *(_OWORD *)(v20 + 5752) = 0uLL;
  *(_OWORD *)(v20 + 5736) = 0uLL;
  *(_OWORD *)(v20 + 5720) = 0uLL;
  *(_OWORD *)(v20 + 5704) = 0uLL;
  *((_DWORD *)v20 + 1508) = 0;
  *((_OWORD *)v20 + 376) = 0uLL;
  *((_OWORD *)v20 + 375) = 0uLL;
  *((_OWORD *)v20 + 374) = 0uLL;
  *((_OWORD *)v20 + 373) = 0uLL;
  *((_OWORD *)v20 + 372) = 0uLL;
  *((_OWORD *)v20 + 371) = 0uLL;
  *((_OWORD *)v20 + 370) = 0uLL;
  *((_OWORD *)v20 + 369) = 0uLL;
  *((_OWORD *)v20 + 368) = 0uLL;
  *((_OWORD *)v20 + 367) = 0uLL;
  *((_DWORD *)v20 + 1550) = 0;
  *(_OWORD *)(v20 + 6184) = 0uLL;
  *(_OWORD *)(v20 + 6168) = 0uLL;
  *(_OWORD *)(v20 + 6152) = 0uLL;
  *(_OWORD *)(v20 + 6136) = 0uLL;
  *(_OWORD *)(v20 + 6120) = 0uLL;
  *(_OWORD *)(v20 + 6104) = 0uLL;
  *(_OWORD *)(v20 + 6088) = 0uLL;
  *(_OWORD *)(v20 + 6072) = 0uLL;
  *(_OWORD *)(v20 + 6056) = 0uLL;
  *(_OWORD *)(v20 + 6040) = 0uLL;
  *((_DWORD *)v20 + 1616) = 0;
  *((_OWORD *)v20 + 403) = 0uLL;
  *((_OWORD *)v20 + 402) = 0uLL;
  *((_OWORD *)v20 + 401) = 0uLL;
  *((_OWORD *)v20 + 400) = 0uLL;
  *((_OWORD *)v20 + 399) = 0uLL;
  *((_OWORD *)v20 + 398) = 0uLL;
  *((_OWORD *)v20 + 397) = 0uLL;
  *((_OWORD *)v20 + 396) = 0uLL;
  *((_OWORD *)v20 + 395) = 0uLL;
  *((_OWORD *)v20 + 394) = 0uLL;
  *((_OWORD *)v20 + 393) = 0uLL;
  *((_OWORD *)v20 + 392) = 0uLL;
  *((_OWORD *)v20 + 391) = 0uLL;
  *((_OWORD *)v20 + 390) = 0uLL;
  *((_OWORD *)v20 + 389) = 0uLL;
  *((_OWORD *)v20 + 388) = 0uLL;
  *((_DWORD *)v20 + 1658) = 0;
  *(_OWORD *)(v20 + 6616) = 0uLL;
  *(_OWORD *)(v20 + 6600) = 0uLL;
  *(_OWORD *)(v20 + 6584) = 0uLL;
  *(_OWORD *)(v20 + 6568) = 0uLL;
  *(_OWORD *)(v20 + 6552) = 0uLL;
  *(_OWORD *)(v20 + 6536) = 0uLL;
  *(_OWORD *)(v20 + 6520) = 0uLL;
  *(_OWORD *)(v20 + 6504) = 0uLL;
  *(_OWORD *)(v20 + 3832) = 0uLL;
  *(_OWORD *)(v20 + 6488) = 0uLL;
  *(_OWORD *)(v20 + 6472) = 0uLL;
  *(_OWORD *)(v20 + 6648) = 0uLL;
  *(_OWORD *)(v20 + 6664) = 0uLL;
  *(_OWORD *)(v20 + 6680) = 0uLL;
  *((_DWORD *)v20 + 1680) = 0;
  *(_OWORD *)(v20 + 6728) = 0uLL;
  *((_OWORD *)v20 + 422) = 0uLL;
  v195 = v20 + 24;
  v196 = v20;
  v20[144] = 0;
  *(_OWORD *)(v20 + 3816) = 0uLL;
  *(_OWORD *)(v20 + 3800) = 0uLL;
  *(_OWORD *)(v20 + 3704) = 0uLL;
  memset(&__p, 0, sizeof(__p));
  *(_OWORD *)(v20 + 3784) = 0uLL;
  *(_OWORD *)(v20 + 3768) = 0uLL;
  *(_OWORD *)(v20 + 3752) = 0uLL;
  *(_OWORD *)(v20 + 3736) = 0uLL;
  *(_OWORD *)(v20 + 3720) = 0uLL;
  if (v22 == 2)
  {
    v26 = v23 < 0;
    v33 = (void **)&__dst;
    if (v26)
      v33 = v24;
    switch(*(_WORD *)v33)
    {
      case 0x3176:
        *((_BYTE *)&__p.__r_.__value_.__s + 23) = 3;
        qmemcpy(&__p, "2.2", 3);
        if (v20[87] < 0)
        {
          *((_QWORD *)v20 + 9) = 3;
          v35 = (int *)*((_QWORD *)v20 + 8);
        }
        else
        {
          v35 = (int *)(v20 + 64);
          v20[87] = 3;
        }
        v37 = 3157553;
        break;
      case 0x3276:
        *((_BYTE *)&__p.__r_.__value_.__s + 23) = 3;
        qmemcpy(&__p, "2.2", 3);
        if (v20[87] < 0)
        {
          *((_QWORD *)v20 + 9) = 3;
          v35 = (int *)*((_QWORD *)v20 + 8);
        }
        else
        {
          v35 = (int *)(v20 + 64);
          v20[87] = 3;
        }
        v37 = 3223089;
        break;
      case 0x3376:
        *((_BYTE *)&__p.__r_.__value_.__s + 23) = 3;
        qmemcpy(&__p, "2.2", 3);
        if (v20[87] < 0)
        {
          *((_QWORD *)v20 + 9) = 3;
          v36 = (_DWORD *)*((_QWORD *)v20 + 8);
        }
        else
        {
          v36 = v20 + 64;
          v20[87] = 3;
        }
        *v36 = 3288625;
        v20[88] = 1;
        v40 = 257;
LABEL_54:
        *((_WORD *)v20 + 45) = v40;
        goto LABEL_62;
      default:
        switch(*(_WORD *)v33)
        {
          case 0x3476:
            *((_BYTE *)&__p.__r_.__value_.__s + 23) = 3;
            LOWORD(__p.__r_.__value_.__l.__data_) = 11827;
            v39 = 48;
            break;
          case 0x3576:
            *((_BYTE *)&__p.__r_.__value_.__s + 23) = 3;
            LOWORD(__p.__r_.__value_.__l.__data_) = 11827;
            v39 = 49;
            break;
          case 0x3676:
            *((_BYTE *)&__p.__r_.__value_.__s + 23) = 5;
            qmemcpy(&__p, "3.1.3", 5);
            if (v20[87] < 0)
            {
              *((_QWORD *)v20 + 9) = 3;
              v181 = (_DWORD *)*((_QWORD *)v20 + 8);
            }
            else
            {
              v181 = v20 + 64;
              v20[87] = 3;
            }
            *v181 = 3354161;
            goto LABEL_61;
          case 0x3776:
          case 0x3876:
            goto LABEL_21;
          default:
            v28 = *(unsigned __int16 *)v33;
            v29 = 14710;
LABEL_20:
            if (v28 == v29)
            {
LABEL_21:
              *((_BYTE *)&__p.__r_.__value_.__s + 23) = 3;
              qmemcpy(&__p, "4.0", 3);
              if (v20[87] < 0)
              {
                *((_QWORD *)v20 + 9) = 3;
                v30 = (int *)*((_QWORD *)v20 + 8);
              }
              else
              {
                v30 = (int *)(v20 + 64);
                v20[87] = 3;
              }
              v38 = 3419697;
LABEL_60:
              *v30 = v38;
LABEL_61:
              *((_DWORD *)v20 + 22) = 16843009;
              goto LABEL_62;
            }
LABEL_35:
            syslog(5, "[Error] version %s is not supported");
LABEL_95:
            v50 = v183;
            v51 = &CVML_status_invalidParameter;
            goto LABEL_156;
        }
        __p.__r_.__value_.__s.__data_[2] = v39;
        if (v20[87] < 0)
        {
          *((_QWORD *)v20 + 9) = 3;
          v30 = (int *)*((_QWORD *)v20 + 8);
        }
        else
        {
          v30 = (int *)(v20 + 64);
          v20[87] = 3;
        }
        v38 = 3354161;
        goto LABEL_60;
    }
    *v35 = v37;
    v40 = 1;
    v20[88] = 1;
    goto LABEL_54;
  }
  if (v22 != 4)
    goto LABEL_35;
  v26 = v23 < 0;
  v27 = (void **)&__dst;
  if (v26)
    v27 = v24;
  if (*(_DWORD *)v27 != 825111670)
  {
    v28 = *(_DWORD *)v27;
    v29 = 845101174;
    goto LABEL_20;
  }
  *((_BYTE *)&__p.__r_.__value_.__s + 23) = 3;
  qmemcpy(&__p, "3.0", 3);
  if (v20[87] < 0)
  {
    *((_QWORD *)v20 + 9) = 15;
    v34 = (char *)*((_QWORD *)v20 + 8);
  }
  else
  {
    v34 = v20 + 64;
    v20[87] = 15;
  }
  strcpy(v34, "1.3_lightweight");
  *((_DWORD *)v20 + 22) = 16842752;
LABEL_62:
  size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __p.__r_.__value_.__l.__size_;
  if (size == 3)
  {
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    if (LOWORD(p_p->__r_.__value_.__l.__data_) == 11826 && p_p->__r_.__value_.__s.__data_[2] == 50)
    {
      v45 = 1.0;
      v44 = 1;
    }
    else
    {
      v47 = LOWORD(p_p->__r_.__value_.__l.__data_) == 11827 && p_p->__r_.__value_.__s.__data_[2] == 48;
      v45 = 0.0039216;
      if (!v47
        && (LOWORD(p_p->__r_.__value_.__l.__data_) != 11827 || p_p->__r_.__value_.__s.__data_[2] != 49)
        && (LOWORD(p_p->__r_.__value_.__l.__data_) != 11828 || p_p->__r_.__value_.__s.__data_[2] != 48))
      {
LABEL_94:
        syslog(5, "[Error] Failed to find the default network options for version . %s");
        goto LABEL_95;
      }
      v44 = 0;
    }
  }
  else
  {
    if (size != 5)
      goto LABEL_94;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    if (LODWORD(p_p->__r_.__value_.__l.__data_) != 774975027 || p_p->__r_.__value_.__s.__data_[4] != 51)
      goto LABEL_94;
    v44 = 0;
    v45 = 0.0039216;
  }
  v20[97] = v44;
  v20[98] = v44;
  v20[99] = 0;
  *((float *)v20 + 23) = v45;
  v20[96] = 1;
  v52 = (unsigned __int16 *)(v20 + 64);
  v53 = v20[87];
  v54 = (char)v53;
  if ((v53 & 0x80u) != 0)
    v53 = *((_QWORD *)v20 + 9);
  if (v53 == 15)
  {
    if (v54 < 0)
      v52 = *(unsigned __int16 **)v52;
    v63 = *(_QWORD *)v52;
    v64 = *(_QWORD *)((char *)v52 + 7);
    if (v63 == 0x6867696C5F332E31 && v64 == 0x7468676965777468)
    {
      std::string::basic_string[abi:ne180100]<0>(__v, "UNKNOWN_1");
      std::string::basic_string[abi:ne180100]<0>(&__v[24], "UNKNOWN_16");
      std::string::basic_string[abi:ne180100]<0>(&v200, "UNKNOWN_17");
      std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>(v25 + 276, (std::string *)__v, (__int128 *)((char *)&v201 + 8), 3uLL);
      for (i = 0; i != -72; i -= 24)
      {
        if (*((char *)&v201 + i + 7) < 0)
          operator delete(*(void **)((char *)&v200 + i));
      }
    }
  }
  else if (v53 == 3)
  {
    if (v54 < 0)
      v52 = *(unsigned __int16 **)v52;
    v55 = *v52 == 11825 && *((_BYTE *)v52 + 2) == 48;
    if (v55 || (*v52 == 11825 ? (v56 = *((_BYTE *)v52 + 2) == 49) : (v56 = 0), v56))
    {
      std::string::basic_string[abi:ne180100]<0>(__v, "UNKNOWN_0");
      std::string::basic_string[abi:ne180100]<0>(&__v[24], "UNKNOWN_1");
      std::string::basic_string[abi:ne180100]<0>(&v200, "UNKNOWN_2");
      std::string::basic_string[abi:ne180100]<0>((_QWORD *)&v201 + 1, "UNKNOWN_3");
      std::string::basic_string[abi:ne180100]<0>(&v203, "UNKNOWN_4");
      std::string::basic_string[abi:ne180100]<0>((_QWORD *)&v204 + 1, "UNKNOWN_6");
      std::string::basic_string[abi:ne180100]<0>(&v206, "UNKNOWN_7");
      std::string::basic_string[abi:ne180100]<0>(v208, "UNKNOWN_5");
      std::string::basic_string[abi:ne180100]<0>(v209, "UNKNOWN_8");
      std::string::basic_string[abi:ne180100]<0>(v210, "UNKNOWN_9");
      std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>(v25 + 276, (std::string *)__v, &v211, 0xAuLL);
      for (j = 0; j != -30; j -= 3)
      {
        if (SHIBYTE(v210[j + 2]) < 0)
          operator delete((void *)v210[j]);
      }
    }
    else if (*v52 == 11825 && *((_BYTE *)v52 + 2) == 50)
    {
      std::string::basic_string[abi:ne180100]<0>(__v, "UNKNOWN_0");
      std::string::basic_string[abi:ne180100]<0>(&__v[24], "UNKNOWN_1");
      std::string::basic_string[abi:ne180100]<0>(&v200, "UNKNOWN_2");
      std::string::basic_string[abi:ne180100]<0>((_QWORD *)&v201 + 1, "UNKNOWN_3");
      std::string::basic_string[abi:ne180100]<0>(&v203, "UNKNOWN_4");
      std::string::basic_string[abi:ne180100]<0>((_QWORD *)&v204 + 1, "UNKNOWN_6");
      std::string::basic_string[abi:ne180100]<0>(&v206, "UNKNOWN_7");
      std::string::basic_string[abi:ne180100]<0>(v208, "UNKNOWN_5");
      std::string::basic_string[abi:ne180100]<0>(v209, "UNKNOWN_8");
      std::string::basic_string[abi:ne180100]<0>(v210, "UNKNOWN_9");
      std::string::basic_string[abi:ne180100]<0>(&v211, "UNKNOWN_10");
      std::string::basic_string[abi:ne180100]<0>(v212, "UNKNOWN_11");
      std::string::basic_string[abi:ne180100]<0>(v213, "UNKNOWN_12");
      std::string::basic_string[abi:ne180100]<0>(v214, "UNKNOWN_13");
      std::string::basic_string[abi:ne180100]<0>(v215, "UNKNOWN_14");
      std::string::basic_string[abi:ne180100]<0>(v216, "UNKNOWN_15");
      std::string::basic_string[abi:ne180100]<0>(v217, "UNKNOWN_16");
      std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>(v25 + 276, (std::string *)__v, &v218, 0x11uLL);
      v182 = 51;
      do
      {
        if ((char)__v[v182 * 8 - 1] < 0)
          operator delete((void *)__p.__r_.__value_.__r.__words[v182 + 1]);
        v182 -= 3;
      }
      while (v182 * 8);
    }
    else
    {
      v58 = *v52 == 11825 && *((_BYTE *)v52 + 2) == 51;
      if (v58 || ((v59 = *v52, v60 = *((unsigned __int8 *)v52 + 2), v59 == 11825) ? (v61 = v60 == 52) : (v61 = 0), v61))
      {
        std::string::basic_string[abi:ne180100]<0>(__v, "UNKNOWN_0");
        std::string::basic_string[abi:ne180100]<0>(&__v[24], "UNKNOWN_1");
        std::string::basic_string[abi:ne180100]<0>(&v200, "UNKNOWN_2");
        std::string::basic_string[abi:ne180100]<0>((_QWORD *)&v201 + 1, "UNKNOWN_3");
        std::string::basic_string[abi:ne180100]<0>(&v203, "UNKNOWN_4");
        std::string::basic_string[abi:ne180100]<0>((_QWORD *)&v204 + 1, "UNKNOWN_6");
        std::string::basic_string[abi:ne180100]<0>(&v206, "UNKNOWN_7");
        std::string::basic_string[abi:ne180100]<0>(v208, "UNKNOWN_5");
        std::string::basic_string[abi:ne180100]<0>(v209, "UNKNOWN_8");
        std::string::basic_string[abi:ne180100]<0>(v210, "UNKNOWN_9");
        std::string::basic_string[abi:ne180100]<0>(&v211, "UNKNOWN_10");
        std::string::basic_string[abi:ne180100]<0>(v212, "UNKNOWN_11");
        std::string::basic_string[abi:ne180100]<0>(v213, "UNKNOWN_12");
        std::string::basic_string[abi:ne180100]<0>(v214, "UNKNOWN_13");
        std::string::basic_string[abi:ne180100]<0>(v215, "UNKNOWN_14");
        std::string::basic_string[abi:ne180100]<0>(v216, "UNKNOWN_15");
        std::string::basic_string[abi:ne180100]<0>(v217, "UNKNOWN_16");
        std::string::basic_string[abi:ne180100]<0>(&v218, "UNKNOWN_17");
        std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>(v25 + 276, (std::string *)__v, (__int128 *)&v219, 0x12uLL);
        v62 = 54;
        do
        {
          if ((char)__v[v62 * 8 - 1] < 0)
            operator delete((void *)__p.__r_.__value_.__r.__words[v62 + 1]);
          v62 -= 3;
        }
        while (v62 * 8);
      }
    }
  }
  *((_DWORD *)v21 + 1660) = v9 != 2;
  if (v9 == 2)
  {
    v72 = (char *)operator new(0x48uLL);
    v50 = v183;
    *((_QWORD *)v72 + 1) = 0;
    *((_QWORD *)v72 + 2) = 0;
    *(_QWORD *)v72 = &off_1E453B920;
    *(_OWORD *)(v72 + 40) = 0u;
    *(_OWORD *)(v72 + 56) = 0u;
    *((_QWORD *)v72 + 3) = &off_1E453A8A0;
    *((_QWORD *)v72 + 4) = 1;
    *(_QWORD *)__v = v72 + 24;
    *(_QWORD *)&__v[8] = v72;
    std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)v25, (__int128 *)__v);
    v69 = *(std::__shared_weak_count **)&__v[8];
    if (*(_QWORD *)&__v[8])
    {
      v73 = (unint64_t *)(*(_QWORD *)&__v[8] + 8);
      do
        v71 = __ldaxr(v73);
      while (__stlxr(v71 - 1, v73));
LABEL_153:
      if (!v71)
      {
        ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
        std::__shared_weak_count::__release_weak(v69);
      }
    }
  }
  else
  {
    v68 = (char *)operator new(0x50uLL);
    v50 = v183;
    *((_QWORD *)v68 + 1) = 0;
    *((_QWORD *)v68 + 2) = 0;
    *(_QWORD *)v68 = &off_1E453B8E8;
    *(_OWORD *)(v68 + 40) = 0u;
    *((_QWORD *)v68 + 3) = &off_1E453A870;
    *(_OWORD *)(v68 + 56) = 0u;
    *((_DWORD *)v68 + 18) = 2;
    *((_QWORD *)v68 + 4) = 2;
    *(_QWORD *)__v = v68 + 24;
    *(_QWORD *)&__v[8] = v68;
    std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)v25, (__int128 *)__v);
    v69 = *(std::__shared_weak_count **)&__v[8];
    if (*(_QWORD *)&__v[8])
    {
      v70 = (unint64_t *)(*(_QWORD *)&__v[8] + 8);
      do
        v71 = __ldaxr(v70);
      while (__stlxr(v71 - 1, v70));
      goto LABEL_153;
    }
  }
  v51 = &CVML_status_ok;
LABEL_156:
  v74 = *v51;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if ((((_DWORD)v74 + 128) & 0x80) == 0)
  {
    v32 = (v74 + 128) | 0x2300;
    goto LABEL_297;
  }
  v187 = (char **)(v21 + 6208);
  v75 = (__int128 *)*((_QWORD *)v21 + 831);
  v76 = (__int128 *)*((_QWORD *)v21 + 832);
  if (v75 != v76)
  {
    v190 = (std::vector<std::string> *)(v21 + 6256);
    v189 = (std::vector<std::string> *)(v21 + 6280);
    v188 = (std::vector<std::string> *)(v21 + 6672);
    do
    {
      if (*((char *)v75 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v75, *((_QWORD *)v75 + 1));
      }
      else
      {
        v77 = *v75;
        __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v75 + 2);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v77;
      }
      std::operator+<char>();
      v78 = std::string::append(&v197, "_output", 7uLL);
      v79 = v78->__r_.__value_.__r.__words[0];
      v220[0] = v78->__r_.__value_.__l.__size_;
      *(_QWORD *)((char *)v220 + 7) = *(std::string::size_type *)((char *)&v78->__r_.__value_.__r.__words[1] + 7);
      v80 = HIBYTE(v78->__r_.__value_.__r.__words[2]);
      v78->__r_.__value_.__l.__size_ = 0;
      v78->__r_.__value_.__r.__words[2] = 0;
      v78->__r_.__value_.__r.__words[0] = 0;
      v81 = *((_QWORD *)v21 + 783);
      v82 = *((_QWORD *)v21 + 784);
      if (v81 >= v82)
      {
        v85 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v81 - (unint64_t)v190->__begin_) >> 3);
        v86 = v85 + 1;
        if (v85 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        v87 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v82 - (unint64_t)v190->__begin_) >> 3);
        if (2 * v87 > v86)
          v86 = 2 * v87;
        if (v87 >= 0x555555555555555)
          v88 = 0xAAAAAAAAAAAAAAALL;
        else
          v88 = v86;
        *(_QWORD *)&__v[32] = v21 + 6272;
        if (v88)
          v88 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v88);
        else
          v89 = 0;
        v90 = v88 + 24 * v85;
        *(_QWORD *)__v = v88;
        *(_QWORD *)&__v[8] = v90;
        *(_QWORD *)&__v[24] = v88 + 24 * v89;
        v91 = v220[0];
        *(_QWORD *)v90 = v79;
        *(_QWORD *)(v90 + 8) = v91;
        *(_QWORD *)(v90 + 15) = *(_QWORD *)((char *)v220 + 7);
        *(_BYTE *)(v90 + 23) = v80;
        *(_QWORD *)&__v[16] = v90 + 24;
        std::vector<std::string>::__swap_out_circular_buffer(v190, (std::__split_buffer<std::string> *)__v);
        v84 = *((_QWORD *)v21 + 783);
        std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)__v);
      }
      else
      {
        v83 = v220[0];
        *(_QWORD *)v81 = v79;
        *(_QWORD *)(v81 + 8) = v83;
        *(_QWORD *)(v81 + 15) = *(_QWORD *)((char *)v220 + 7);
        *(_BYTE *)(v81 + 23) = v80;
        v84 = v81 + 24;
        *((_QWORD *)v21 + 783) = v81 + 24;
      }
      *((_QWORD *)v21 + 783) = v84;
      if (SHIBYTE(v197.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v197.__r_.__value_.__l.__data_);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v92 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v92 = __p.__r_.__value_.__l.__size_;
      std::string::basic_string[abi:ne180100]((uint64_t)&v197, v92 + 8);
      if ((v197.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v93 = &v197;
      else
        v93 = (std::string *)v197.__r_.__value_.__r.__words[0];
      if (v92)
      {
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v94 = &__p;
        else
          v94 = (std::string *)__p.__r_.__value_.__r.__words[0];
        memmove(v93, v94, v92);
      }
      strcpy((char *)v93 + v92, "_fc/Relu");
      v95 = *((_QWORD *)v21 + 786);
      v96 = *((_QWORD *)v21 + 787);
      if (v95 >= v96)
      {
        v98 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v95 - (unint64_t)v189->__begin_) >> 3);
        v99 = v98 + 1;
        if (v98 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        v100 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v96 - (unint64_t)v189->__begin_) >> 3);
        if (2 * v100 > v99)
          v99 = 2 * v100;
        if (v100 >= 0x555555555555555)
          v101 = 0xAAAAAAAAAAAAAAALL;
        else
          v101 = v99;
        *(_QWORD *)&__v[32] = v21 + 6296;
        if (v101)
          v101 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v101);
        else
          v102 = 0;
        v103 = v101 + 24 * v98;
        *(_QWORD *)__v = v101;
        *(_QWORD *)&__v[8] = v103;
        *(_QWORD *)&__v[24] = v101 + 24 * v102;
        v104 = *(_OWORD *)&v197.__r_.__value_.__l.__data_;
        *(_QWORD *)(v103 + 16) = *((_QWORD *)&v197.__r_.__value_.__l + 2);
        *(_OWORD *)v103 = v104;
        memset(&v197, 0, sizeof(v197));
        *(_QWORD *)&__v[16] = v103 + 24;
        std::vector<std::string>::__swap_out_circular_buffer(v189, (std::__split_buffer<std::string> *)__v);
        v105 = *((_QWORD *)v21 + 786);
        std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)__v);
        v106 = SHIBYTE(v197.__r_.__value_.__r.__words[2]);
        *((_QWORD *)v21 + 786) = v105;
        if (v106 < 0)
          operator delete(v197.__r_.__value_.__l.__data_);
      }
      else
      {
        v97 = *(_OWORD *)&v197.__r_.__value_.__l.__data_;
        *(_QWORD *)(v95 + 16) = *((_QWORD *)&v197.__r_.__value_.__l + 2);
        *(_OWORD *)v95 = v97;
        *((_QWORD *)v21 + 786) = v95 + 24;
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v107 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v107 = __p.__r_.__value_.__l.__size_;
      std::string::basic_string[abi:ne180100]((uint64_t)&v197, v107 + 10);
      if ((v197.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v108 = &v197;
      else
        v108 = (std::string *)v197.__r_.__value_.__r.__words[0];
      if (v107)
      {
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v109 = &__p;
        else
          v109 = (std::string *)__p.__r_.__value_.__r.__words[0];
        memmove(v108, v109, v107);
      }
      strcpy((char *)v108 + v107, "_embedding");
      v110 = *((_QWORD *)v21 + 835);
      v111 = *((_QWORD *)v21 + 836);
      if (v110 >= v111)
      {
        v113 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v110 - (unint64_t)v188->__begin_) >> 3);
        v114 = v113 + 1;
        if (v113 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        v115 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v111 - (unint64_t)v188->__begin_) >> 3);
        if (2 * v115 > v114)
          v114 = 2 * v115;
        if (v115 >= 0x555555555555555)
          v116 = 0xAAAAAAAAAAAAAAALL;
        else
          v116 = v114;
        *(_QWORD *)&__v[32] = v21 + 6688;
        if (v116)
          v116 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v116);
        else
          v117 = 0;
        v118 = v116 + 24 * v113;
        *(_QWORD *)__v = v116;
        *(_QWORD *)&__v[8] = v118;
        *(_QWORD *)&__v[24] = v116 + 24 * v117;
        v119 = *(_OWORD *)&v197.__r_.__value_.__l.__data_;
        *(_QWORD *)(v118 + 16) = *((_QWORD *)&v197.__r_.__value_.__l + 2);
        *(_OWORD *)v118 = v119;
        memset(&v197, 0, sizeof(v197));
        *(_QWORD *)&__v[16] = v118 + 24;
        std::vector<std::string>::__swap_out_circular_buffer(v188, (std::__split_buffer<std::string> *)__v);
        v120 = *((_QWORD *)v21 + 835);
        std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)__v);
        v121 = SHIBYTE(v197.__r_.__value_.__r.__words[2]);
        *((_QWORD *)v21 + 835) = v120;
        if (v121 < 0)
          operator delete(v197.__r_.__value_.__l.__data_);
      }
      else
      {
        v112 = *(_OWORD *)&v197.__r_.__value_.__l.__data_;
        *(_QWORD *)(v110 + 16) = *((_QWORD *)&v197.__r_.__value_.__l + 2);
        *(_OWORD *)v110 = v112;
        *((_QWORD *)v21 + 835) = v110 + 24;
      }
      v207 = 0;
      v205 = 0u;
      v206 = 0u;
      v203 = 0u;
      v204 = 0u;
      v201 = 0u;
      v202 = 0u;
      v200 = 0u;
      memset(__v, 0, sizeof(__v));
      v122 = *((_QWORD *)v21 + 777);
      v123 = *((_QWORD *)v21 + 778);
      if (v122 >= v123)
      {
        v125 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v122 - (_QWORD)*v187) >> 3);
        v126 = v125 + 1;
        if (v125 + 1 > 0x186186186186186)
          goto LABEL_326;
        v127 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v123 - (_QWORD)*v187) >> 3);
        if (2 * v127 > v126)
          v126 = 2 * v127;
        if (v127 >= 0xC30C30C30C30C3)
          v128 = 0x186186186186186;
        else
          v128 = v126;
        if (v128)
          v128 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<espresso_buffer_t>>(v128);
        else
          v129 = 0;
        v130 = v128 + 168 * v125;
        *(_QWORD *)(v130 + 160) = 0;
        *(_OWORD *)(v130 + 128) = 0u;
        *(_OWORD *)(v130 + 144) = 0u;
        *(_OWORD *)(v130 + 96) = 0u;
        *(_OWORD *)(v130 + 112) = 0u;
        *(_OWORD *)(v130 + 64) = 0u;
        *(_OWORD *)(v130 + 80) = 0u;
        *(_OWORD *)(v130 + 32) = 0u;
        *(_OWORD *)(v130 + 48) = 0u;
        *(_OWORD *)v130 = 0u;
        *(_OWORD *)(v130 + 16) = 0u;
        v131 = (char *)*((_QWORD *)v21 + 777);
        v132 = (char *)*((_QWORD *)v21 + 776);
        v133 = v130;
        if (v131 != v132)
        {
          do
          {
            v134 = *(_OWORD *)(v131 - 168);
            v135 = *(_OWORD *)(v131 - 152);
            *(_OWORD *)(v133 - 136) = *(_OWORD *)(v131 - 136);
            *(_OWORD *)(v133 - 152) = v135;
            *(_OWORD *)(v133 - 168) = v134;
            v136 = *(_OWORD *)(v131 - 120);
            v137 = *(_OWORD *)(v131 - 104);
            v138 = *(_OWORD *)(v131 - 88);
            *(_OWORD *)(v133 - 72) = *(_OWORD *)(v131 - 72);
            *(_OWORD *)(v133 - 88) = v138;
            *(_OWORD *)(v133 - 104) = v137;
            *(_OWORD *)(v133 - 120) = v136;
            v139 = *(_OWORD *)(v131 - 56);
            v140 = *(_OWORD *)(v131 - 40);
            v141 = *(_OWORD *)(v131 - 24);
            *(_QWORD *)(v133 - 8) = *((_QWORD *)v131 - 1);
            *(_OWORD *)(v133 - 24) = v141;
            *(_OWORD *)(v133 - 40) = v140;
            *(_OWORD *)(v133 - 56) = v139;
            v133 -= 168;
            v131 -= 168;
          }
          while (v131 != v132);
          v131 = *v187;
        }
        *((_QWORD *)v21 + 776) = v133;
        v124 = v130 + 168;
        *((_QWORD *)v21 + 777) = v130 + 168;
        *((_QWORD *)v21 + 778) = v128 + 168 * v129;
        if (v131)
          operator delete(v131);
      }
      else
      {
        *(_QWORD *)(v122 + 160) = 0;
        *(_OWORD *)(v122 + 128) = 0uLL;
        *(_OWORD *)(v122 + 144) = 0uLL;
        *(_OWORD *)(v122 + 96) = 0uLL;
        *(_OWORD *)(v122 + 112) = 0uLL;
        *(_OWORD *)(v122 + 64) = 0uLL;
        *(_OWORD *)(v122 + 80) = 0uLL;
        *(_OWORD *)(v122 + 32) = 0uLL;
        *(_OWORD *)(v122 + 48) = 0uLL;
        v124 = v122 + 168;
        *(_OWORD *)v122 = 0uLL;
        *(_OWORD *)(v122 + 16) = 0uLL;
      }
      *((_QWORD *)v21 + 777) = v124;
      v142 = *((_QWORD *)v21 + 780);
      v143 = *((_QWORD *)v21 + 781);
      if (v142 >= v143)
      {
        v145 = *((_QWORD *)v21 + 779);
        v146 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v142 - v145) >> 3);
        v147 = v146 + 1;
        if (v146 + 1 > 0x186186186186186)
LABEL_326:
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        v148 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v143 - v145) >> 3);
        if (2 * v148 > v147)
          v147 = 2 * v148;
        if (v148 >= 0xC30C30C30C30C3)
          v149 = 0x186186186186186;
        else
          v149 = v147;
        if (v149)
          v149 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<espresso_buffer_t>>(v149);
        else
          v150 = 0;
        v151 = v149 + 168 * v146;
        *(_OWORD *)(v151 + 96) = v203;
        *(_OWORD *)(v151 + 80) = v202;
        *(_OWORD *)(v151 + 64) = v201;
        *(_OWORD *)(v151 + 48) = v200;
        *(_QWORD *)(v151 + 160) = v207;
        *(_OWORD *)(v151 + 144) = v206;
        *(_OWORD *)(v151 + 128) = v205;
        *(_OWORD *)(v151 + 112) = v204;
        *(_OWORD *)v151 = *(_OWORD *)__v;
        *(_OWORD *)(v151 + 16) = *(_OWORD *)&__v[16];
        *(_OWORD *)(v151 + 32) = *(_OWORD *)&__v[32];
        v152 = (char *)*((_QWORD *)v21 + 780);
        v153 = (char *)*((_QWORD *)v21 + 779);
        v154 = v151;
        if (v152 != v153)
        {
          do
          {
            v155 = *(_OWORD *)(v152 - 168);
            v156 = *(_OWORD *)(v152 - 152);
            *(_OWORD *)(v154 - 136) = *(_OWORD *)(v152 - 136);
            *(_OWORD *)(v154 - 152) = v156;
            *(_OWORD *)(v154 - 168) = v155;
            v157 = *(_OWORD *)(v152 - 120);
            v158 = *(_OWORD *)(v152 - 104);
            v159 = *(_OWORD *)(v152 - 88);
            *(_OWORD *)(v154 - 72) = *(_OWORD *)(v152 - 72);
            *(_OWORD *)(v154 - 88) = v159;
            *(_OWORD *)(v154 - 104) = v158;
            *(_OWORD *)(v154 - 120) = v157;
            v160 = *(_OWORD *)(v152 - 56);
            v161 = *(_OWORD *)(v152 - 40);
            v162 = *(_OWORD *)(v152 - 24);
            *(_QWORD *)(v154 - 8) = *((_QWORD *)v152 - 1);
            *(_OWORD *)(v154 - 24) = v162;
            *(_OWORD *)(v154 - 40) = v161;
            *(_OWORD *)(v154 - 56) = v160;
            v154 -= 168;
            v152 -= 168;
          }
          while (v152 != v153);
          v152 = (char *)*((_QWORD *)v21 + 779);
        }
        *((_QWORD *)v21 + 779) = v154;
        v144 = v151 + 168;
        *((_QWORD *)v21 + 780) = v151 + 168;
        *((_QWORD *)v21 + 781) = v149 + 168 * v150;
        if (v152)
          operator delete(v152);
      }
      else
      {
        *(_OWORD *)(v142 + 112) = v204;
        *(_OWORD *)(v142 + 128) = v205;
        *(_OWORD *)(v142 + 144) = v206;
        *(_QWORD *)(v142 + 160) = v207;
        *(_OWORD *)(v142 + 48) = v200;
        *(_OWORD *)(v142 + 64) = v201;
        *(_OWORD *)(v142 + 80) = v202;
        *(_OWORD *)(v142 + 96) = v203;
        *(_OWORD *)v142 = *(_OWORD *)__v;
        *(_OWORD *)(v142 + 16) = *(_OWORD *)&__v[16];
        *(_OWORD *)(v142 + 32) = *(_OWORD *)&__v[32];
        v144 = v142 + 168;
      }
      *((_QWORD *)v21 + 780) = v144;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v75 = (__int128 *)((char *)v75 + 24);
    }
    while (v75 != v76);
  }
  memset(__v, 0, 32);
  espresso_network_query_blob_dimensions();
  v50 = v183;
  *((_DWORD *)v21 + 26) = *(_DWORD *)&__v[16];
  memset(__v, 0, 32);
  espresso_network_query_blob_dimensions();
  *((_DWORD *)v21 + 25) = *(_DWORD *)&__v[8] * *(_DWORD *)__v * *(_DWORD *)&__v[16];
  memset(__v, 0, 32);
  espresso_network_query_blob_dimensions();
  *((_DWORD *)v21 + 27) = *(_DWORD *)__v * *(_DWORD *)&__v[8] * *(_DWORD *)&__v[16];
  if (v21[88])
  {
    v32 = espresso_network_bind_buffer() ? 9083 : 9088;
    if (v32 != 128)
    {
      syslog(5, "ERROR: Could not bind to faceprint output.");
      goto LABEL_297;
    }
  }
  if (v21[89])
  {
    v32 = espresso_network_bind_buffer() ? 9083 : 9088;
    if (v32 != 128)
    {
      syslog(5, "ERROR: Could not bind to faceprint confidence output.");
      goto LABEL_297;
    }
  }
  if (v21[90])
  {
    v32 = vision::mod::FaceprintAndAttributes::bindFaceAttributes((uint64_t)v25, (_QWORD *)v21 + 782);
    if (v32 != 128)
    {
      syslog(5, "ERROR: Could not bind to face attribute output.");
      goto LABEL_297;
    }
  }
  if (v21[91])
  {
    v32 = vision::mod::FaceprintAndAttributes::bindFaceAttributes((uint64_t)v25, (_QWORD *)v21 + 785);
    if (v32 != 128)
    {
      syslog(5, "ERROR: Could not bind to face attribute embedding output.");
LABEL_297:
      if (v32 != 128)
      {
        syslog(5, "ERROR: Failed to initialize FaceprintAndAttribute object");
        do
          v174 = __ldaxr(v50);
        while (__stlxr(v174 - 1, v50));
        v31 = (shared_ptr<vision::mod::FaceprintAndAttributes>)0;
        if (!v174)
        {
          (*(void (**)(char *, __n128))(*(_QWORD *)v21 + 16))(v21, (__n128)0);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v21);
          v31 = (shared_ptr<vision::mod::FaceprintAndAttributes>)0;
        }
        goto LABEL_303;
      }
      goto LABEL_298;
    }
  }
  v163 = *((_QWORD *)v21 + 834);
  for (k = *((_QWORD *)v21 + 835); v163 != k; v163 += 24)
  {
    if (*(char *)(v163 + 23) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)__v, *(const std::string::value_type **)v163, *(_QWORD *)(v163 + 8));
    }
    else
    {
      *(_OWORD *)__v = *(_OWORD *)v163;
      *(_QWORD *)&__v[16] = *(_QWORD *)(v163 + 16);
    }
    v165 = operator new(0x90uLL);
    v165[1] = 0;
    v165[2] = 0;
    *v165 = &off_1E453B958;
    v165[4] = 0;
    v165[5] = 0;
    v165[9] = 0;
    v165[8] = 0;
    v165[6] = 0;
    v165[7] = v165 + 8;
    *((_OWORD *)v165 + 5) = 0u;
    *((_OWORD *)v165 + 6) = 0u;
    v165[3] = &off_1E453A8D0;
    *((_BYTE *)v165 + 112) = 0;
    v165[15] = 0;
    *((_DWORD *)v165 + 32) = 1;
    v165[17] = 0;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)(v165 + 3);
    __p.__r_.__value_.__l.__size_ = (std::string::size_type)v165;
    v166 = std::__tree<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<vision::mod::ImageDescriptorBufferFloat32>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)v21 + 843, __v, (uint64_t)__v);
    std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)(v166 + 7), (__int128 *)&__p);
    v167 = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
    if (__p.__r_.__value_.__l.__size_)
    {
      v168 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
      do
        v169 = __ldaxr(v168);
      while (__stlxr(v169 - 1, v168));
      if (!v169)
      {
        ((void (*)(std::__shared_weak_count *))v167->__on_zero_shared)(v167);
        std::__shared_weak_count::__release_weak(v167);
      }
    }
    if ((__v[23] & 0x80000000) != 0)
      operator delete(*(void **)__v);
  }
  v170 = operator new(0x90uLL);
  v170[1] = 0;
  v170[2] = 0;
  *v170 = &off_1E453B958;
  v170[4] = 0;
  v170[5] = 0;
  v170[8] = 0;
  v170[9] = 0;
  v170[6] = 0;
  v170[7] = v170 + 8;
  *((_OWORD *)v170 + 5) = 0u;
  *((_OWORD *)v170 + 6) = 0u;
  *((_BYTE *)v170 + 112) = 0;
  v170[3] = &off_1E453A8D0;
  v170[15] = 0;
  *((_DWORD *)v170 + 32) = 1;
  v170[17] = 0;
  *(_QWORD *)__v = v170 + 3;
  *(_QWORD *)&__v[8] = v170;
  std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)&v25[279].__end_, (__int128 *)__v);
  v171 = *(std::__shared_weak_count **)&__v[8];
  if (*(_QWORD *)&__v[8])
  {
    v172 = (unint64_t *)(*(_QWORD *)&__v[8] + 8);
    do
      v173 = __ldaxr(v172);
    while (__stlxr(v173 - 1, v172));
    if (!v173)
    {
      ((void (*)(std::__shared_weak_count *))v171->__on_zero_shared)(v171);
      std::__shared_weak_count::__release_weak(v171);
    }
  }
LABEL_298:
  v32 = 0;
  v31.__ptr_ = (FaceprintAndAttributes *)v25;
  v31.__cntrl_ = (__shared_weak_count *)v21;
LABEL_303:
  p_mMultiHeadedFaceClassifier = &v186->_mMultiHeadedFaceClassifier;
  cntrl = (std::__shared_weak_count *)v186->_mMultiHeadedFaceClassifier.__cntrl_;
  v186->_mMultiHeadedFaceClassifier = v31;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v178 = __ldaxr(p_shared_owners);
    while (__stlxr(v178 - 1, p_shared_owners));
    if (!v178)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }

  if (SHIBYTE(v193) < 0)
    operator delete(__dst);
  v14 = p_mMultiHeadedFaceClassifier->__ptr_ != 0;
  if (v185 && !p_mMultiHeadedFaceClassifier->__ptr_)
  {
    VNErrorForCVMLStatus((id)v32);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", CFSTR("Failure to create face multi-headed classifier."), v179);
    *v185 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_314:

  return v14;
}

+ (unint64_t)numberOfImageChannels
{
  return 4;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

+ (BOOL)producesObservationsForMultipleRequestClasses
{
  return 1;
}

+ (const)modelVersionForOptions:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ must override %@"), v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Method not implemented"), v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v10);
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  if (+[VNFaceAnalyzerMultiDetectorBase espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::onceToken != -1)
    dispatch_once(&+[VNFaceAnalyzerMultiDetectorBase espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::onceToken, &__block_literal_global_323);
  return (id)+[VNFaceAnalyzerMultiDetectorBase espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::inputImageDimensionsBlobName;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1111970369;
}

void __100__VNFaceAnalyzerMultiDetectorBase_espressoModelInputImageDimensionsBlobNameForConfigurationOptions___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", "data");
  v1 = (void *)+[VNFaceAnalyzerMultiDetectorBase espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::inputImageDimensionsBlobName;
  +[VNFaceAnalyzerMultiDetectorBase espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::inputImageDimensionsBlobName = v0;

}

void __72__VNFaceAnalyzerMultiDetectorBase_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceAnalyzerMultiDetectorBase;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorOption_RequestDetectionLevel"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNFaceAnalyzerMultiDetectorBase configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNFaceAnalyzerMultiDetectorBase configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (vImage_Buffer)prepare_vImageBufferForCVPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  if (a4)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, self);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)_addFaceAnalysisResultsFromMap:(void *)a3 toFaceAttributeObject:(id)a4 forOriginatingRequestSpecifier:(id)a5
{
  id v7;
  uint64_t v8;
  VNFaceAttributeCategory *v9;
  VNFaceAttributeCategory *v10;
  VNFaceAttributeCategory *v11;
  VNClassificationObservation *v12;
  double v13;
  VNClassificationObservation *v14;
  VNClassificationObservation *v15;
  double v16;
  VNClassificationObservation *v17;
  VNClassificationObservation *v18;
  double v19;
  VNClassificationObservation *v20;
  VNClassificationObservation *v21;
  double v22;
  VNClassificationObservation *v23;
  VNClassificationObservation *v24;
  double v25;
  VNClassificationObservation *v26;
  void *v27;
  void *v28;
  VNClassificationObservation *v29;
  double v30;
  VNClassificationObservation *v31;
  double v32;
  VNClassificationObservation *v33;
  VNClassificationObservation *v34;
  double v35;
  VNClassificationObservation *v36;
  VNClassificationObservation *v37;
  double v38;
  VNClassificationObservation *v39;
  VNClassificationObservation *v40;
  double v41;
  VNClassificationObservation *v42;
  VNClassificationObservation *v43;
  double v44;
  VNClassificationObservation *v45;
  void *v46;
  void *v47;
  VNClassificationObservation *v48;
  double v49;
  VNClassificationObservation *v50;
  VNClassificationObservation *v51;
  double v52;
  VNClassificationObservation *v53;
  void *v54;
  void *v55;
  VNFaceAttributeCategory *v56;
  VNFaceAttributeCategory *v57;
  VNFaceAttributeCategory *v58;
  VNFaceAttributeCategory *v59;
  VNFaceAttributeCategory *v60;
  VNFaceAttributeCategory *v61;
  VNFaceAttributeCategory *v62;
  VNFaceAttributeCategory *v63;
  VNFaceAttributeCategory *v64;
  VNFaceAttributeCategory *v65;
  VNFaceAttributeCategory *v66;
  VNFaceAttributeCategory *v67;
  VNFaceAttributeCategory *v68;
  VNFaceAttributeCategory *v69;
  VNFaceAttributeCategory *v70;
  VNFaceAttributeCategory *v71;
  VNFaceAttributeCategory *v72;
  VNFaceAttributeCategory *v73;
  VNClassificationObservation *v74;
  double v75;
  VNClassificationObservation *v76;
  VNClassificationObservation *v77;
  double v78;
  VNClassificationObservation *v79;
  VNClassificationObservation *v80;
  double v81;
  VNClassificationObservation *v82;
  VNClassificationObservation *v83;
  double v84;
  VNClassificationObservation *v85;
  VNClassificationObservation *v86;
  double v87;
  VNClassificationObservation *v88;
  void *v89;
  void *v90;
  VNClassificationObservation *v91;
  double v92;
  VNClassificationObservation *v93;
  VNClassificationObservation *v94;
  double v95;
  VNClassificationObservation *v96;
  void *v97;
  void *v98;
  VNClassificationObservation *v99;
  double v100;
  VNClassificationObservation *v101;
  VNClassificationObservation *v102;
  double v103;
  VNClassificationObservation *v104;
  void *v105;
  void *v106;
  VNClassificationObservation *v107;
  double v108;
  VNClassificationObservation *v109;
  VNClassificationObservation *v110;
  double v111;
  VNClassificationObservation *v112;
  void *v113;
  void *v114;
  VNClassificationObservation *v115;
  double v116;
  VNClassificationObservation *v117;
  VNClassificationObservation *v118;
  double v119;
  VNClassificationObservation *v120;
  VNClassificationObservation *v121;
  double v122;
  VNClassificationObservation *v123;
  VNClassificationObservation *v124;
  double v125;
  VNClassificationObservation *v126;
  VNClassificationObservation *v127;
  double v128;
  VNClassificationObservation *v129;
  void *v130;
  void *v131;
  VNClassificationObservation *v132;
  double v133;
  VNClassificationObservation *v134;
  double v135;
  VNClassificationObservation *v136;
  VNClassificationObservation *v137;
  double v138;
  VNClassificationObservation *v139;
  VNClassificationObservation *v140;
  double v141;
  VNClassificationObservation *v142;
  VNClassificationObservation *v143;
  double v144;
  VNClassificationObservation *v145;
  VNClassificationObservation *v146;
  double v147;
  VNClassificationObservation *v148;
  void *v149;
  void *v150;
  VNClassificationObservation *v151;
  double v152;
  VNClassificationObservation *v153;
  VNClassificationObservation *v154;
  double v155;
  VNClassificationObservation *v156;
  void *v157;
  void *v158;
  VNClassificationObservation *v159;
  double v160;
  VNClassificationObservation *v161;
  VNClassificationObservation *v162;
  double v163;
  VNClassificationObservation *v164;
  VNClassificationObservation *v165;
  double v166;
  VNClassificationObservation *v167;
  void *v168;
  void *v169;
  VNClassificationObservation *v170;
  double v171;
  VNClassificationObservation *v172;
  VNClassificationObservation *v173;
  double v174;
  VNClassificationObservation *v175;
  VNClassificationObservation *v176;
  double v177;
  VNClassificationObservation *v178;
  void *v179;
  void *v180;
  VNClassificationObservation *v181;
  double v182;
  VNClassificationObservation *v183;
  VNClassificationObservation *v184;
  double v185;
  VNClassificationObservation *v186;
  VNClassificationObservation *v187;
  double v188;
  VNClassificationObservation *v189;
  void *v190;
  void *v191;
  VNClassificationObservation *v192;
  double v193;
  VNClassificationObservation *v194;
  VNClassificationObservation *v195;
  double v196;
  VNClassificationObservation *v197;
  VNClassificationObservation *v198;
  double v199;
  VNClassificationObservation *v200;
  VNClassificationObservation *v201;
  double v202;
  VNClassificationObservation *v203;
  VNClassificationObservation *v204;
  double v205;
  VNClassificationObservation *v206;
  void *v207;
  void *v208;
  VNClassificationObservation *v209;
  double v210;
  VNClassificationObservation *v211;
  VNClassificationObservation *v212;
  double v213;
  VNClassificationObservation *v214;
  VNClassificationObservation *v215;
  double v216;
  VNClassificationObservation *v217;
  VNClassificationObservation *v218;
  double v219;
  VNClassificationObservation *v220;
  VNClassificationObservation *v221;
  double v222;
  VNClassificationObservation *v223;
  VNClassificationObservation *v224;
  double v225;
  VNClassificationObservation *v226;
  void *v227;
  void *v228;
  VNClassificationObservation *v229;
  double v230;
  VNClassificationObservation *v231;
  double v232;
  VNClassificationObservation *v233;
  VNClassificationObservation *v234;
  double v235;
  VNClassificationObservation *v236;
  VNClassificationObservation *v237;
  double v238;
  VNClassificationObservation *v239;
  VNClassificationObservation *v240;
  double v241;
  VNClassificationObservation *v242;
  VNClassificationObservation *v243;
  double v244;
  VNClassificationObservation *v245;
  VNClassificationObservation *v246;
  double v247;
  VNClassificationObservation *v248;
  void *v249;
  void *v250;
  VNClassificationObservation *v251;
  double v252;
  VNClassificationObservation *v253;
  VNClassificationObservation *v254;
  double v255;
  VNClassificationObservation *v256;
  VNClassificationObservation *v257;
  double v258;
  VNClassificationObservation *v259;
  VNClassificationObservation *v260;
  double v261;
  VNClassificationObservation *v262;
  VNClassificationObservation *v263;
  double v264;
  VNClassificationObservation *v265;
  void *v266;
  void *v267;
  VNClassificationObservation *v268;
  double v269;
  VNClassificationObservation *v270;
  double v271;
  VNClassificationObservation *v272;
  VNClassificationObservation *v273;
  double v274;
  VNClassificationObservation *v275;
  VNClassificationObservation *v276;
  double v277;
  VNClassificationObservation *v278;
  VNClassificationObservation *v279;
  double v280;
  VNClassificationObservation *v281;
  VNClassificationObservation *v282;
  double v283;
  VNClassificationObservation *v284;
  VNClassificationObservation *v285;
  double v286;
  VNClassificationObservation *v287;
  void *v288;
  void *v289;
  VNClassificationObservation *v290;
  double v291;
  VNClassificationObservation *v292;
  VNClassificationObservation *v293;
  double v294;
  VNClassificationObservation *v295;
  VNClassificationObservation *v296;
  double v297;
  VNClassificationObservation *v298;
  VNClassificationObservation *v299;
  double v300;
  VNClassificationObservation *v301;
  VNClassificationObservation *v302;
  double v303;
  VNClassificationObservation *v304;
  void *v305;
  void *v306;
  VNClassificationObservation *v307;
  double v308;
  VNClassificationObservation *v309;
  VNClassificationObservation *v310;
  double v311;
  VNClassificationObservation *v312;
  VNClassificationObservation *v313;
  double v314;
  VNClassificationObservation *v315;
  VNClassificationObservation *v316;
  double v317;
  VNClassificationObservation *v318;
  VNClassificationObservation *v319;
  double v320;
  VNClassificationObservation *v321;
  VNClassificationObservation *v322;
  double v323;
  VNClassificationObservation *v324;
  void *v325;
  void *v326;
  VNClassificationObservation *v327;
  double v328;
  VNClassificationObservation *v329;
  double v330;
  VNClassificationObservation *v331;
  void *v332;
  void *v333;
  VNClassificationObservation *v334;
  VNClassificationObservation *v335;
  VNClassificationObservation *v336;
  VNClassificationObservation *v337;
  id v338;
  void *v339[2];
  char v340;
  void *v341[2];
  char v342;
  void *__p[2];
  char v344;
  void *v345[2];
  char v346;
  void *v347[2];
  char v348;
  void *v349[2];
  char v350;
  void *v351[2];
  char v352;
  void **v353;
  _QWORD v354[2];
  _QWORD v355[6];
  _QWORD v356[5];
  _QWORD v357[7];
  _QWORD v358[5];
  _QWORD v359[7];
  _QWORD v360[6];
  _QWORD v361[5];
  _QWORD v362[3];
  _QWORD v363[3];
  _QWORD v364[3];
  _QWORD v365[2];
  _QWORD v366[6];
  _QWORD v367[5];
  _QWORD v368[2];
  _QWORD v369[2];
  _QWORD v370[2];
  _QWORD v371[5];
  _QWORD v372[2];
  _QWORD v373[6];
  _QWORD v374[7];

  v374[5] = *MEMORY[0x1E0C80C00];
  v338 = a4;
  v7 = a5;
  v8 = objc_msgSend(v7, "requestRevision");
  if (v8 == 3737841664)
  {
    v9 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", 3737841664);
    objc_msgSend(v338, "setAgeCategory:", v9);

    v10 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", 3737841664);
    -[VNFaceAttributes setVN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq:]((uint64_t)v338, v10);

    v11 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", 3737841664);
    -[VNFaceAttributes setFacemaskCategory:]((uint64_t)v338, v11);

    v12 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_1_unknown0"), "UTF8String"));
    v349[0] = v351;
    LODWORD(v13) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v14 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v12, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_1_unknown0"), v13);
    v374[0] = v14;
    v15 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_1_unknown1"), "UTF8String"));
    v347[0] = v349;
    LODWORD(v16) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v17 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v15, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_1_unknown1"), v16);
    v374[1] = v17;
    v18 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_1_unknown2"), "UTF8String"));
    v345[0] = v347;
    LODWORD(v19) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v20 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v18, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_1_unknown2"), v19);
    v374[2] = v20;
    v21 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)objc_msgSend(CFSTR("UNKNOWN_1_unknown3"), "UTF8String"));
    __p[0] = v345;
    LODWORD(v22) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v23 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v21, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_1_unknown3"), v22);
    v374[3] = v23;
    v24 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("UNKNOWN_1_unknown4"), "UTF8String"));
    v341[0] = __p;
    LODWORD(v25) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v26 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v24, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_1_unknown4"), v25);
    v374[4] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v374, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "ageCategory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAllLabelsWithConfidences:", v27);

    if (v344 < 0)
      operator delete(__p[0]);

    if (v346 < 0)
      operator delete(v345[0]);

    if (v348 < 0)
      operator delete(v347[0]);

    if (v350 < 0)
      operator delete(v349[0]);

    if (v352 < 0)
      operator delete(v351[0]);
    v29 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_16_unknown0"), "UTF8String"));
    v349[0] = v351;
    LODWORD(v30) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v334 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v29, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_16_unknown0"), v30);
    v373[0] = v334;
    v31 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_16_unknown1"), "UTF8String"));
    v347[0] = v349;
    LODWORD(v32) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v33 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v31, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_16_unknown1"), v32);
    v373[1] = v33;
    v34 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_16_unknown2"), "UTF8String"));
    v345[0] = v347;
    LODWORD(v35) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v36 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v34, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_16_unknown2"), v35);
    v373[2] = v36;
    v37 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)objc_msgSend(CFSTR("UNKNOWN_16_unknown3"), "UTF8String"));
    __p[0] = v345;
    LODWORD(v38) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v39 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v37, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_16_unknown3"), v38);
    v373[3] = v39;
    v40 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("UNKNOWN_16_unknown4"), "UTF8String"));
    v341[0] = __p;
    LODWORD(v41) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v42 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v40, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_16_unknown4"), v41);
    v373[4] = v42;
    v43 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v341, (char *)objc_msgSend(CFSTR("UNKNOWN_16_unknown5"), "UTF8String"));
    v339[0] = v341;
    LODWORD(v44) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v341, (_OWORD **)v339)+ 14);
    v45 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v43, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_16_unknown5"), v44);
    v373[5] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v373, 6);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setAllLabelsWithConfidences:", v46);

    if (v342 < 0)
      operator delete(v341[0]);

    if (v344 < 0)
      operator delete(__p[0]);

    if (v346 < 0)
      operator delete(v345[0]);

    if (v348 < 0)
      operator delete(v347[0]);

    if (v350 < 0)
      operator delete(v349[0]);

    if (v352 < 0)
      operator delete(v351[0]);
    v48 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_17_unknown0"), "UTF8String"));
    v349[0] = v351;
    LODWORD(v49) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v50 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v48, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_17_unknown0"), v49);
    v372[0] = v50;
    v51 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_17_unknown1"), "UTF8String"));
    v347[0] = v349;
    LODWORD(v52) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v53 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v51, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_17_unknown1"), v52);
    v372[1] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v372, 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "facemaskCategory");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setAllLabelsWithConfidences:", v54);

    if (v350 < 0)
      operator delete(v349[0]);
LABEL_182:

    if (v352 < 0)
      operator delete(v351[0]);
    goto LABEL_184;
  }
  v56 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
  objc_msgSend(v338, "setAgeCategory:", v56);

  v57 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
  -[VNFaceAttributes setVN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE:]((uint64_t)v338, v57);

  v58 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
  -[VNFaceAttributes setEyesCategory:]((uint64_t)v338, v58);

  v59 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
  -[VNFaceAttributes setSmilingCategory:]((uint64_t)v338, v59);

  v60 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
  -[VNFaceAttributes setFaceHairCategory:]((uint64_t)v338, v60);

  v61 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
  -[VNFaceAttributes setHairColorCategory:]((uint64_t)v338, v61);

  v62 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
  -[VNFaceAttributes setBaldCategory:]((uint64_t)v338, v62);

  v63 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
  -[VNFaceAttributes setGlassesCategory:]((uint64_t)v338, v63);

  v64 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
  -[VNFaceAttributes setMakeupEyesCategory:]((uint64_t)v338, v64);

  v65 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
  -[VNFaceAttributes setMakeupLipsCategory:]((uint64_t)v338, v65);

  if ((unint64_t)(v8 - 3737841665) <= 5 && v8 != 3737841668)
  {
    v66 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
    -[VNFaceAttributes setVN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB:]((uint64_t)v338, v66);

    v67 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
    -[VNFaceAttributes setVN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1:]((uint64_t)v338, v67);

    v68 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
    -[VNFaceAttributes setVN7CbCeAogPS2iHE6VQwu6H96xanljtMqk:]((uint64_t)v338, v68);

    v69 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
    -[VNFaceAttributes setVN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP:]((uint64_t)v338, v69);

    v70 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
    -[VNFaceAttributes setVN2riiZbQrloRhCzYW56f0rk4N3ROe151S:]((uint64_t)v338, v70);

    v71 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
    -[VNFaceAttributes setVNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk:]((uint64_t)v338, v71);

    v72 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
    -[VNFaceAttributes setVN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq:]((uint64_t)v338, v72);

    v73 = -[VNFaceAttributeCategory initWithRequestRevision:]([VNFaceAttributeCategory alloc], "initWithRequestRevision:", v8);
    -[VNFaceAttributes setFacemaskCategory:]((uint64_t)v338, v73);

  }
  v74 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_1_unknown0"), "UTF8String"));
  v349[0] = v351;
  LODWORD(v75) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  v76 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v74, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_1_unknown0"), v75);
  v371[0] = v76;
  v77 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_1_unknown1"), "UTF8String"));
  v347[0] = v349;
  LODWORD(v78) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  v79 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v77, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_1_unknown1"), v78);
  v371[1] = v79;
  v80 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_1_unknown2"), "UTF8String"));
  v345[0] = v347;
  LODWORD(v81) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
  v82 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v80, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_1_unknown2"), v81);
  v371[2] = v82;
  v83 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v345, (char *)objc_msgSend(CFSTR("UNKNOWN_1_unknown3"), "UTF8String"));
  __p[0] = v345;
  LODWORD(v84) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
  v85 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v83, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_1_unknown3"), v84);
  v371[3] = v85;
  v86 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("UNKNOWN_1_unknown4"), "UTF8String"));
  v341[0] = __p;
  LODWORD(v87) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
  v88 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v86, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_1_unknown4"), v87);
  v371[4] = v88;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v371, 5);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "ageCategory");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setAllLabelsWithConfidences:", v89);

  if (v344 < 0)
    operator delete(__p[0]);

  if (v346 < 0)
    operator delete(v345[0]);

  if (v348 < 0)
    operator delete(v347[0]);

  if (v350 < 0)
    operator delete(v349[0]);

  if (v352 < 0)
    operator delete(v351[0]);
  v91 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_6_unknown0"), "UTF8String"));
  v349[0] = v351;
  LODWORD(v92) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  v93 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v91, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_6_unknown0"), v92);
  v370[0] = v93;
  v94 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_6_unknown1"), "UTF8String"));
  v347[0] = v349;
  LODWORD(v95) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  v96 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v94, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_6_unknown1"), v95);
  v370[1] = v96;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v370, 2);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setAllLabelsWithConfidences:", v97);

  if (v350 < 0)
    operator delete(v349[0]);

  if (v352 < 0)
    operator delete(v351[0]);
  v99 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_3_unknown0"), "UTF8String"));
  v349[0] = v351;
  LODWORD(v100) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  v101 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v99, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_3_unknown0"), v100);
  v369[0] = v101;
  v102 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_3_unknown1"), "UTF8String"));
  v347[0] = v349;
  LODWORD(v103) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  v104 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v102, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_3_unknown1"), v103);
  v369[1] = v104;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v369, 2);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "eyesCategory");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setAllLabelsWithConfidences:", v105);

  if (v350 < 0)
    operator delete(v349[0]);

  if (v352 < 0)
    operator delete(v351[0]);
  v107 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_7_unknown0"), "UTF8String"));
  v349[0] = v351;
  LODWORD(v108) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  v109 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v107, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_7_unknown0"), v108);
  v368[0] = v109;
  v110 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_7_unknown1"), "UTF8String"));
  v347[0] = v349;
  LODWORD(v111) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  v112 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v110, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_7_unknown1"), v111);
  v368[1] = v112;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v368, 2);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "smilingCategory");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setAllLabelsWithConfidences:", v113);

  if (v350 < 0)
    operator delete(v349[0]);

  if (v352 < 0)
    operator delete(v351[0]);
  v115 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_4_unknown0"), "UTF8String"));
  v349[0] = v351;
  LODWORD(v116) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  v117 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v115, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_4_unknown0"), v116);
  v367[0] = v117;
  v118 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_4_unknown1"), "UTF8String"));
  v347[0] = v349;
  LODWORD(v119) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  v120 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v118, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_4_unknown1"), v119);
  v367[1] = v120;
  v121 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_4_unknown2"), "UTF8String"));
  v345[0] = v347;
  LODWORD(v122) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
  v123 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v121, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_4_unknown2"), v122);
  v367[2] = v123;
  v124 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v345, (char *)objc_msgSend(CFSTR("UNKNOWN_4_unknown3"), "UTF8String"));
  __p[0] = v345;
  LODWORD(v125) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
  v126 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v124, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_4_unknown3"), v125);
  v367[3] = v126;
  v127 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("UNKNOWN_4_unknown4"), "UTF8String"));
  v341[0] = __p;
  LODWORD(v128) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
  v129 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v127, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_4_unknown4"), v128);
  v367[4] = v129;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v367, 5);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "faceHairCategory");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setAllLabelsWithConfidences:", v130);

  if (v344 < 0)
    operator delete(__p[0]);

  if (v346 < 0)
    operator delete(v345[0]);

  if (v348 < 0)
    operator delete(v347[0]);

  if (v350 < 0)
    operator delete(v349[0]);

  if (v352 < 0)
    operator delete(v351[0]);
  v132 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_5_unknown0"), "UTF8String"));
  v349[0] = v351;
  LODWORD(v133) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  v335 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v132, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_5_unknown0"), v133);
  v366[0] = v335;
  v134 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_5_unknown1"), "UTF8String"));
  v347[0] = v349;
  LODWORD(v135) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  v136 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v134, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_5_unknown1"), v135);
  v366[1] = v136;
  v137 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_5_unknown2"), "UTF8String"));
  v345[0] = v347;
  LODWORD(v138) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
  v139 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v137, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_5_unknown2"), v138);
  v366[2] = v139;
  v140 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v345, (char *)objc_msgSend(CFSTR("UNKNOWN_5_unknown3"), "UTF8String"));
  __p[0] = v345;
  LODWORD(v141) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
  v142 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v140, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_5_unknown3"), v141);
  v366[3] = v142;
  v143 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("UNKNOWN_5_unknown4"), "UTF8String"));
  v341[0] = __p;
  LODWORD(v144) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
  v145 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v143, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_5_unknown4"), v144);
  v366[4] = v145;
  v146 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v341, (char *)objc_msgSend(CFSTR("UNKNOWN_5_unknown5"), "UTF8String"));
  v339[0] = v341;
  LODWORD(v147) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v341, (_OWORD **)v339)+ 14);
  v148 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v146, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_5_unknown5"), v147);
  v366[5] = v148;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v366, 6);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "hairColorCategory");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "setAllLabelsWithConfidences:", v149);

  if (v342 < 0)
    operator delete(v341[0]);

  if (v344 < 0)
    operator delete(__p[0]);

  if (v346 < 0)
    operator delete(v345[0]);

  if (v348 < 0)
    operator delete(v347[0]);

  if (v350 < 0)
    operator delete(v349[0]);

  if (v352 < 0)
    operator delete(v351[0]);
  v151 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_2_unknown0"), "UTF8String"));
  v349[0] = v351;
  LODWORD(v152) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  v153 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v151, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_2_unknown0"), v152);
  v365[0] = v153;
  v154 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_2_unknown1"), "UTF8String"));
  v347[0] = v349;
  LODWORD(v155) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  v156 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v154, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_2_unknown1"), v155);
  v365[1] = v156;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v365, 2);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "baldCategory");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "setAllLabelsWithConfidences:", v157);

  if (v350 < 0)
    operator delete(v349[0]);

  if (v352 < 0)
    operator delete(v351[0]);
  v159 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_0_unknown0"), "UTF8String"));
  v349[0] = v351;
  LODWORD(v160) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  v161 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v159, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_0_unknown0"), v160);
  v364[0] = v161;
  v162 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_0_unknown1"), "UTF8String"));
  v347[0] = v349;
  LODWORD(v163) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  v164 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v162, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_0_unknown1"), v163);
  v364[1] = v164;
  v165 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_0_unknown2"), "UTF8String"));
  v345[0] = v347;
  LODWORD(v166) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
  v167 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v165, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_0_unknown2"), v166);
  v364[2] = v167;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v364, 3);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "glassesCategory");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "setAllLabelsWithConfidences:", v168);

  if (v348 < 0)
    operator delete(v347[0]);

  if (v350 < 0)
    operator delete(v349[0]);

  if (v352 < 0)
    operator delete(v351[0]);
  v170 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_8_unknown0"), "UTF8String"));
  v349[0] = v351;
  LODWORD(v171) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  v172 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v170, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_8_unknown0"), v171);
  v363[0] = v172;
  v173 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_8_unknown1"), "UTF8String"));
  v347[0] = v349;
  LODWORD(v174) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  v175 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v173, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_8_unknown1"), v174);
  v363[1] = v175;
  v176 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_8_unknown2"), "UTF8String"));
  v345[0] = v347;
  LODWORD(v177) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
  v178 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v176, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_8_unknown2"), v177);
  v363[2] = v178;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v363, 3);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "makeupEyesCategory");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "setAllLabelsWithConfidences:", v179);

  if (v348 < 0)
    operator delete(v347[0]);

  if (v350 < 0)
    operator delete(v349[0]);

  if (v352 < 0)
    operator delete(v351[0]);
  v181 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_9_unknown0"), "UTF8String"));
  v349[0] = v351;
  LODWORD(v182) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
  v183 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v181, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_9_unknown0"), v182);
  v362[0] = v183;
  v184 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_9_unknown1"), "UTF8String"));
  v347[0] = v349;
  LODWORD(v185) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
  v186 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v184, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_9_unknown1"), v185);
  v362[1] = v186;
  v187 = [VNClassificationObservation alloc];
  std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_9_unknown2"), "UTF8String"));
  v345[0] = v347;
  LODWORD(v188) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
  v189 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v187, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_9_unknown2"), v188);
  v362[2] = v189;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v362, 3);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "makeupLipsCategory");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "setAllLabelsWithConfidences:", v190);

  if (v348 < 0)
    operator delete(v347[0]);

  if (v350 < 0)
    operator delete(v349[0]);

  if (v352 < 0)
    operator delete(v351[0]);
  if ((unint64_t)(v8 - 3737841665) <= 5 && v8 != 3737841668)
  {
    v192 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_10_unknown0"), "UTF8String"));
    v349[0] = v351;
    LODWORD(v193) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v194 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v192, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_10_unknown0"), v193);
    v361[0] = v194;
    v195 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_10_unknown1"), "UTF8String"));
    v347[0] = v349;
    LODWORD(v196) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v197 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v195, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_10_unknown1"), v196);
    v361[1] = v197;
    v198 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_10_unknown2"), "UTF8String"));
    v345[0] = v347;
    LODWORD(v199) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v200 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v198, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_10_unknown2"), v199);
    v361[2] = v200;
    v201 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)objc_msgSend(CFSTR("UNKNOWN_10_unknown3"), "UTF8String"));
    __p[0] = v345;
    LODWORD(v202) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v203 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v201, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_10_unknown3"), v202);
    v361[3] = v203;
    v204 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("UNKNOWN_10_unknown4"), "UTF8String"));
    v341[0] = __p;
    LODWORD(v205) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v206 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v204, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_10_unknown4"), v205);
    v361[4] = v206;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v361, 5);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "setAllLabelsWithConfidences:", v207);

    if (v344 < 0)
      operator delete(__p[0]);

    if (v346 < 0)
      operator delete(v345[0]);

    if (v348 < 0)
      operator delete(v347[0]);

    if (v350 < 0)
      operator delete(v349[0]);

    if (v352 < 0)
      operator delete(v351[0]);
    v209 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_11_unknown0"), "UTF8String"));
    v349[0] = v351;
    LODWORD(v210) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v211 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v209, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_11_unknown0"), v210);
    v360[0] = v211;
    v212 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_11_unknown1"), "UTF8String"));
    v347[0] = v349;
    LODWORD(v213) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v214 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v212, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_11_unknown1"), v213);
    v360[1] = v214;
    v215 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_11_unknown2"), "UTF8String"));
    v345[0] = v347;
    LODWORD(v216) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v217 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v215, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_11_unknown2"), v216);
    v360[2] = v217;
    v218 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)objc_msgSend(CFSTR("UNKNOWN_11_unknown3"), "UTF8String"));
    __p[0] = v345;
    LODWORD(v219) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v220 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v218, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_11_unknown3"), v219);
    v360[3] = v220;
    v221 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("UNKNOWN_11_unknown4"), "UTF8String"));
    v341[0] = __p;
    LODWORD(v222) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v223 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v221, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_11_unknown4"), v222);
    v360[4] = v223;
    v224 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v341, (char *)objc_msgSend(CFSTR("UNKNOWN_11_unknown5"), "UTF8String"));
    v339[0] = v341;
    LODWORD(v225) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v341, (_OWORD **)v339)+ 14);
    v226 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v224, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_11_unknown5"), v225);
    v360[5] = v226;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v360, 6);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v228, "setAllLabelsWithConfidences:", v227);

    if (v342 < 0)
      operator delete(v341[0]);

    if (v344 < 0)
      operator delete(__p[0]);

    if (v346 < 0)
      operator delete(v345[0]);

    if (v348 < 0)
      operator delete(v347[0]);

    if (v350 < 0)
      operator delete(v349[0]);

    if (v352 < 0)
      operator delete(v351[0]);
    v229 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_13_unknown0"), "UTF8String"));
    v349[0] = v351;
    LODWORD(v230) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v336 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v229, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_13_unknown0"), v230);
    v359[0] = v336;
    v231 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_13_unknown1"), "UTF8String"));
    v347[0] = v349;
    LODWORD(v232) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v233 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v231, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_13_unknown1"), v232);
    v359[1] = v233;
    v234 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_13_unknown2"), "UTF8String"));
    v345[0] = v347;
    LODWORD(v235) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v236 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v234, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_13_unknown2"), v235);
    v359[2] = v236;
    v237 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)objc_msgSend(CFSTR("UNKNOWN_13_unknown3"), "UTF8String"));
    __p[0] = v345;
    LODWORD(v238) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v239 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v237, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_13_unknown3"), v238);
    v359[3] = v239;
    v240 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("UNKNOWN_13_unknown4"), "UTF8String"));
    v341[0] = __p;
    LODWORD(v241) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v242 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v240, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_13_unknown4"), v241);
    v359[4] = v242;
    v243 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v341, (char *)objc_msgSend(CFSTR("UNKNOWN_13_unknown5"), "UTF8String"));
    v339[0] = v341;
    LODWORD(v244) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v341, (_OWORD **)v339)+ 14);
    v245 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v243, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_13_unknown5"), v244);
    v359[5] = v245;
    v246 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v339, (char *)objc_msgSend(CFSTR("UNKNOWN_13_unknown6"), "UTF8String"));
    v353 = v339;
    LODWORD(v247) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v339, (_OWORD **)&v353)+ 14);
    v248 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v246, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_13_unknown6"), v247);
    v359[6] = v248;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v359, 7);
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v250, "setAllLabelsWithConfidences:", v249);

    if (v340 < 0)
      operator delete(v339[0]);

    if (v342 < 0)
      operator delete(v341[0]);

    if (v344 < 0)
      operator delete(__p[0]);

    if (v346 < 0)
      operator delete(v345[0]);

    if (v348 < 0)
      operator delete(v347[0]);

    if (v350 < 0)
      operator delete(v349[0]);

    if (v352 < 0)
      operator delete(v351[0]);
    v251 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_14_unknown0"), "UTF8String"));
    v349[0] = v351;
    LODWORD(v252) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v253 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v251, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_14_unknown0"), v252);
    v358[0] = v253;
    v254 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_14_unknown1"), "UTF8String"));
    v347[0] = v349;
    LODWORD(v255) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v256 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v254, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_14_unknown1"), v255);
    v358[1] = v256;
    v257 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_14_unknown2"), "UTF8String"));
    v345[0] = v347;
    LODWORD(v258) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v259 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v257, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_14_unknown2"), v258);
    v358[2] = v259;
    v260 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)objc_msgSend(CFSTR("UNKNOWN_14_unknown3"), "UTF8String"));
    __p[0] = v345;
    LODWORD(v261) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v262 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v260, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_14_unknown3"), v261);
    v358[3] = v262;
    v263 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("UNKNOWN_14_unknown4"), "UTF8String"));
    v341[0] = __p;
    LODWORD(v264) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v265 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v263, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_14_unknown4"), v264);
    v358[4] = v265;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v358, 5);
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP");
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v267, "setAllLabelsWithConfidences:", v266);

    if (v344 < 0)
      operator delete(__p[0]);

    if (v346 < 0)
      operator delete(v345[0]);

    if (v348 < 0)
      operator delete(v347[0]);

    if (v350 < 0)
      operator delete(v349[0]);

    if (v352 < 0)
      operator delete(v351[0]);
    v268 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_12_unknown0"), "UTF8String"));
    v349[0] = v351;
    LODWORD(v269) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v337 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v268, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_12_unknown0"), v269);
    v357[0] = v337;
    v270 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_12_unknown1"), "UTF8String"));
    v347[0] = v349;
    LODWORD(v271) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v272 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v270, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_12_unknown1"), v271);
    v357[1] = v272;
    v273 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_12_unknown2"), "UTF8String"));
    v345[0] = v347;
    LODWORD(v274) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v275 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v273, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_12_unknown2"), v274);
    v357[2] = v275;
    v276 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)objc_msgSend(CFSTR("UNKNOWN_12_unknown3"), "UTF8String"));
    __p[0] = v345;
    LODWORD(v277) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v278 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v276, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_12_unknown3"), v277);
    v357[3] = v278;
    v279 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("UNKNOWN_12_unknown4"), "UTF8String"));
    v341[0] = __p;
    LODWORD(v280) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v281 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v279, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_12_unknown4"), v280);
    v357[4] = v281;
    v282 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v341, (char *)objc_msgSend(CFSTR("UNKNOWN_12_unknown5"), "UTF8String"));
    v339[0] = v341;
    LODWORD(v283) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v341, (_OWORD **)v339)+ 14);
    v284 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v282, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_12_unknown5"), v283);
    v357[5] = v284;
    v285 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v339, (char *)objc_msgSend(CFSTR("UNKNOWN_12_unknown6"), "UTF8String"));
    v353 = v339;
    LODWORD(v286) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v339, (_OWORD **)&v353)+ 14);
    v287 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v285, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_12_unknown6"), v286);
    v357[6] = v287;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v357, 7);
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "VN2riiZbQrloRhCzYW56f0rk4N3ROe151S");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v289, "setAllLabelsWithConfidences:", v288);

    if (v340 < 0)
      operator delete(v339[0]);

    if (v342 < 0)
      operator delete(v341[0]);

    if (v344 < 0)
      operator delete(__p[0]);

    if (v346 < 0)
      operator delete(v345[0]);

    if (v348 < 0)
      operator delete(v347[0]);

    if (v350 < 0)
      operator delete(v349[0]);

    if (v352 < 0)
      operator delete(v351[0]);
    v290 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_15_unknown0"), "UTF8String"));
    v349[0] = v351;
    LODWORD(v291) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v292 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v290, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_15_unknown0"), v291);
    v356[0] = v292;
    v293 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_15_unknown1"), "UTF8String"));
    v347[0] = v349;
    LODWORD(v294) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v295 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v293, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_15_unknown1"), v294);
    v356[1] = v295;
    v296 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_15_unknown2"), "UTF8String"));
    v345[0] = v347;
    LODWORD(v297) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v298 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v296, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_15_unknown2"), v297);
    v356[2] = v298;
    v299 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)objc_msgSend(CFSTR("UNKNOWN_15_unknown3"), "UTF8String"));
    __p[0] = v345;
    LODWORD(v300) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v301 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v299, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_15_unknown3"), v300);
    v356[3] = v301;
    v302 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("UNKNOWN_15_unknown4"), "UTF8String"));
    v341[0] = __p;
    LODWORD(v303) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v304 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v302, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_15_unknown4"), v303);
    v356[4] = v304;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v356, 5);
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk");
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v306, "setAllLabelsWithConfidences:", v305);

    if (v344 < 0)
      operator delete(__p[0]);

    if (v346 < 0)
      operator delete(v345[0]);

    if (v348 < 0)
      operator delete(v347[0]);

    if (v350 < 0)
      operator delete(v349[0]);

    if (v352 < 0)
      operator delete(v351[0]);
    v307 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_16_unknown0"), "UTF8String"));
    v349[0] = v351;
    LODWORD(v308) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v309 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v307, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_16_unknown0"), v308);
    v355[0] = v309;
    v310 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_16_unknown1"), "UTF8String"));
    v347[0] = v349;
    LODWORD(v311) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v312 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v310, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_16_unknown1"), v311);
    v355[1] = v312;
    v313 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v347, (char *)objc_msgSend(CFSTR("UNKNOWN_16_unknown2"), "UTF8String"));
    v345[0] = v347;
    LODWORD(v314) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v347, (_OWORD **)v345)+ 14);
    v315 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v313, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_16_unknown2"), v314);
    v355[2] = v315;
    v316 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v345, (char *)objc_msgSend(CFSTR("UNKNOWN_16_unknown3"), "UTF8String"));
    __p[0] = v345;
    LODWORD(v317) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v345, (_OWORD **)__p)+ 14);
    v318 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v316, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_16_unknown3"), v317);
    v355[3] = v318;
    v319 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("UNKNOWN_16_unknown4"), "UTF8String"));
    v341[0] = __p;
    LODWORD(v320) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)v341)+ 14);
    v321 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v319, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_16_unknown4"), v320);
    v355[4] = v321;
    v322 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v341, (char *)objc_msgSend(CFSTR("UNKNOWN_16_unknown5"), "UTF8String"));
    v339[0] = v341;
    LODWORD(v323) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v341, (_OWORD **)v339)+ 14);
    v324 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v322, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_16_unknown5"), v323);
    v355[5] = v324;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v355, 6);
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq");
    v326 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v326, "setAllLabelsWithConfidences:", v325);

    if (v342 < 0)
      operator delete(v341[0]);

    if (v344 < 0)
      operator delete(__p[0]);

    if (v346 < 0)
      operator delete(v345[0]);

    if (v348 < 0)
      operator delete(v347[0]);

    if (v350 < 0)
      operator delete(v349[0]);

    if (v352 < 0)
      operator delete(v351[0]);
    v327 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v351, (char *)objc_msgSend(CFSTR("UNKNOWN_17_unknown0"), "UTF8String"));
    v349[0] = v351;
    LODWORD(v328) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v351, (_OWORD **)v349)+ 14);
    v50 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v327, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_17_unknown0"), v328);
    v354[0] = v50;
    v329 = [VNClassificationObservation alloc];
    std::string::basic_string[abi:ne180100]<0>(v349, (char *)objc_msgSend(CFSTR("UNKNOWN_17_unknown1"), "UTF8String"));
    v347[0] = v349;
    LODWORD(v330) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, v349, (_OWORD **)v347)+ 14);
    v331 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v329, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, CFSTR("UNKNOWN_17_unknown1"), v330);
    v354[1] = v331;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v354, 2);
    v332 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "facemaskCategory");
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v333, "setAllLabelsWithConfidences:", v332);

    if (v350 < 0)
      operator delete(v349[0]);
    goto LABEL_182;
  }
LABEL_184:

}

- (BOOL)_isFaceprintJunk:(shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ must override %@"), v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Method not implemented"), v8, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (BOOL)_saveFaceAttributes:(void *)a3 toFaceObservation:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  VNFaceAttributes *v12;

  v10 = a4;
  +[VNValidationUtilities originatingRequestSpecifierForKey:inOptions:error:](VNValidationUtilities, "originatingRequestSpecifierForKey:inOptions:error:", CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionFaceAnalyzerOriginatingRequestSpecifier"), a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[VNFaceAttributes initWithRequestRevision:]([VNFaceAttributes alloc], "initWithRequestRevision:", objc_msgSend(v11, "requestRevision"));
    -[VNFaceAnalyzerMultiDetectorBase _addFaceAnalysisResultsFromMap:toFaceAttributeObject:forOriginatingRequestSpecifier:](self, "_addFaceAnalysisResultsFromMap:toFaceAttributeObject:forOriginatingRequestSpecifier:", a3, v12, v11);
    objc_msgSend(v10, "setFaceAttributes:", v12);

  }
  return v11 != 0;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_mMultiHeadedFaceClassifier.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

@end
