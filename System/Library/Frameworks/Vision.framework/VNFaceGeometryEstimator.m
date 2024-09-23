@implementation VNFaceGeometryEstimator

+ (const)allLandmarksPointsIndexes
{
  if (+[VNFaceGeometryEstimator allLandmarksPointsIndexes]::onceToken != -1)
    dispatch_once(&+[VNFaceGeometryEstimator allLandmarksPointsIndexes]::onceToken, &__block_literal_global_13028);
  return (const void *)+[VNFaceGeometryEstimator allLandmarksPointsIndexes]::allLandmarksPointsIndexes;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

std::vector<int> *__52__VNFaceGeometryEstimator_allLandmarksPointsIndexes__block_invoke()
{
  std::vector<int> *v0;
  std::vector<int> *result;
  uint64_t v2;
  std::vector<int>::pointer begin;
  std::vector<int>::value_type __x;

  v0 = (std::vector<int> *)operator new();
  __x = 0;
  result = std::vector<int>::vector(v0, 0x3FuLL, &__x);
  v2 = 0;
  +[VNFaceGeometryEstimator allLandmarksPointsIndexes]::allLandmarksPointsIndexes = (uint64_t)v0;
  begin = v0->__begin_;
  do
  {
    begin[v2] = v2;
    ++v2;
  }
  while (v2 != 63);
  return result;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  return 1;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  void *v28;
  id v29;
  uint64_t i;
  uint64_t v31;
  float v32;
  uint64_t v33;
  float v34;
  uint64_t v35;
  float v36;
  uint64_t v37;
  float v38;
  uint64_t v39;
  float v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v47;
  void *v48;
  _QWORD aBlock[5];
  id v50;
  id v51;
  id v52;
  uint64_t *v53;
  uint64_t *v54;
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  __n128 (*v59)(uint64_t, uint64_t);
  uint64_t (*v60)();
  const char *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  __n128 (*v68)(__n128 *, __n128 *);
  void (*v69)(uint64_t);
  const char *v70;
  void *__p[3];
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v11, a8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    VNCloneFaceObservationFromOptions((uint64_t)v11, a8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v11, a8);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        objc_msgSend(v11, "objectForKey:", CFSTR("VNFaceGeometryEstimatorProcessOption_EstimatePoseOnly"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v14;
        if (v14)
          v15 = objc_msgSend(v14, "BOOLValue");
        else
          v15 = 0;
        v17 = objc_msgSend(v12, "width");
        v18 = objc_msgSend(v12, "height");
        v65 = 0;
        v66 = &v65;
        v67 = 0x4812000000;
        v68 = __Block_byref_object_copy__13037;
        v69 = __Block_byref_object_dispose__13038;
        v70 = "";
        std::vector<_Geometry2D_point2D_>::vector(__p, 0x3FuLL);
        objc_msgSend(v13, "landmarkPoints");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "alignedBoundingBox", v19);
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v56 = 0;
        v57 = &v56;
        v58 = 0x6012000000;
        v59 = __Block_byref_object_copy__26;
        v60 = __Block_byref_object_dispose__27;
        v61 = "";
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v28 = (void *)v66[6];
        v29 = objc_retainAutorelease(v19);
        memcpy(v28, (const void *)objc_msgSend(v29, "bytes"), 0x1F8uLL);
        for (i = 0; i != 504; i += 8)
        {
          v31 = v66[6];
          v32 = (double)v17 * v27 * *(float *)(v31 + i);
          *(float *)(v31 + i) = v32;
          v33 = v66[6] + i;
          v34 = (double)v18 * v25 * *(float *)(v33 + 4);
          *(float *)(v33 + 4) = v34;
          v35 = v66[6];
          v36 = (double)v17 * v21 + *(float *)(v35 + i);
          *(float *)(v35 + i) = v36;
          v37 = v66[6] + i;
          v38 = (double)v18 * v23 + *(float *)(v37 + 4);
          *(float *)(v37 + 4) = v38;
          v39 = v66[6] + i;
          v40 = (double)v18 - *(float *)(v39 + 4);
          *(float *)(v39 + 4) = v40;
        }
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __125__VNFaceGeometryEstimator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
        aBlock[3] = &unk_1E4545738;
        aBlock[4] = self;
        v55 = v15;
        v50 = v11;
        v53 = &v65;
        v54 = &v56;
        v41 = v13;
        v51 = v41;
        v42 = v48;
        v52 = v42;
        v43 = _Block_copy(aBlock);
        if ((VNExecuteBlock(v43, (uint64_t)a8) & 1) != 0)
        {
          v44 = objc_alloc(MEMORY[0x1E0C99D50]);
          v45 = (void *)objc_msgSend(v44, "initWithBytes:length:", v57 + 6, 48);
          objc_msgSend(v41, "setPoseData:originatingRequestSpecifier:", v45, v42);
          v72[0] = v41;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v16 = 0;
        }

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v65, 8);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_buildCalibrationMatrix:(id)a3 calibrationMatrix:(float *)a4 error:(id *)a5
{
  id v7;
  double v8;
  BOOL v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  int32x2_t v12;
  BOOL v13;
  int v14;
  float64x2_t v16;
  id v17;
  int v18;

  v7 = a3;
  v18 = 0;
  LODWORD(v8) = 1161527296;
  if (+[VNValidationUtilities getFloatValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:withDefaultValue:error:", &v18, CFSTR("VNFaceGeometryEstimatorInitOption_CameraFocalLength"), v7, a5, v8))
  {
    v17 = 0;
    v9 = +[VNValidationUtilities getOptionalObject:ofClass:forKey:inOptions:error:](VNValidationUtilities, "getOptionalObject:ofClass:forKey:inOptions:error:", &v17, objc_opt_class(), CFSTR("VNFaceGeometryEstimatorInitOption_ImageSize"), v7, a5);
    v10 = (const __CFDictionary *)v17;
    v11 = v10;
    if (v9)
    {
      if (!v10)
      {
        v12 = (int32x2_t)0x4400000044000000;
        if (!a4)
        {
LABEL_10:
          v13 = 1;
LABEL_14:

          goto LABEL_15;
        }
LABEL_9:
        v14 = v18;
        *(_DWORD *)a4 = v18;
        *((_QWORD *)a4 + 1) = 0;
        a4[1] = 0.0;
        *((_DWORD *)a4 + 4) = v14;
        a4[5] = 0.0;
        *((int32x2_t *)a4 + 3) = vrev64_s32(v12);
        a4[8] = 1.0;
        goto LABEL_10;
      }
      v16 = *(float64x2_t *)MEMORY[0x1E0C9D820];
      if (CGSizeMakeWithDictionaryRepresentation(v10, (CGSize *)&v16))
      {
        v12 = vrev64_s32((int32x2_t)vmul_f32(vcvt_f32_f64(v16), (float32x2_t)0x3F0000003F000000));
        if (!a4)
          goto LABEL_10;
        goto LABEL_9;
      }
      if (a5)
      {
        +[VNError errorForInvalidOption:named:](VNError, "errorForInvalidOption:named:", v11, CFSTR("VNFaceGeometryEstimatorInitOption_ImageSize"));
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v13 = 0;
    goto LABEL_14;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

BOOL __125__VNFaceGeometryEstimator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  FILE *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  __int128 v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t v17;
  char v18;
  _BOOL8 v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  __int128 v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  int v29;
  char v30;
  int v31;
  size_t v32;
  void *v33;
  float *v34;
  uint64_t v35;
  float *v36;
  uint64_t v37;
  _DWORD *v38;
  _DWORD *v39;
  unsigned __int8 v40;
  _QWORD *v41;
  _DWORD *v42;
  _DWORD *v43;
  _DWORD *v44;
  uint64_t v45;
  int *v46;
  _DWORD *v47;
  _DWORD *v48;
  _DWORD *v49;
  int v50;
  float *v51;
  float *v52;
  float *v53;
  _DWORD *v54;
  _DWORD *v55;
  _DWORD *v56;
  uint64_t v57;
  float *v58;
  _DWORD *v59;
  float *v60;
  float *v61;
  float v62;
  int v63;
  __CLPK_real *v64;
  float *v65;
  float v66;
  float v67;
  float v68;
  uint64_t v69;
  uint64_t v70;
  float v71;
  float v72;
  uint64_t v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  uint64_t v82;
  __CLPK_real *v83;
  __CLPK_real *v84;
  float *__C;
  __CLPK_real *v86;
  uint64_t v87;
  float v88;
  float *v89;
  float v90;
  const float *v91;
  float v92;
  float v93;
  float v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  float v99;
  float v100;
  float v101;
  float *v102;
  float *v103;
  uint64_t v104;
  float v105;
  float v106;
  float v107;
  float v108;
  int v109;
  size_t v110;
  float *v111;
  uint64_t v112;
  _DWORD *v113;
  _DWORD *v114;
  int *v115;
  _DWORD *v116;
  int v117;
  float v118;
  __int128 v119;
  vDSP_Length v120;
  char *v121;
  char *v122;
  char *v123;
  uint64_t v124;
  float v125;
  float v126;
  float v127;
  float v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  float v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float v144;
  float v145;
  float v146;
  float v147;
  uint64_t v148;
  float v149;
  float v150;
  float v151;
  float v152;
  float v153;
  float *v154;
  float *v155;
  float *v156;
  void *v157;
  uint64_t v159;
  int *v160;
  int *v161;
  int *v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  float *v168;
  _QWORD *exception;
  uint64_t v170;
  float *v171;
  float *v172;
  float *v173;
  float *__dst;
  float v175;
  float v176;
  float v177;
  float v178;
  __CLPK_real *v179;
  float *v180;
  float *v181;
  float *v182;
  size_t __sz;
  float *v184;
  float *v185;
  int v186;
  uint64_t v187;
  float *v188;
  float *__A;
  float *v190;
  void *v191;
  void *v192;
  _QWORD *v193;
  id v194;
  unsigned int v195;
  __int128 v196;
  __int128 v197;
  unsigned int v198;
  float *v199;
  __int128 v200;
  __int128 v201;
  float v202;
  void *__p[2];
  void *v204[2];
  float *v205;
  float *v206;
  uint64_t v207;
  float v208;
  __CLPK_integer __lwork;
  __CLPK_real __work;
  __CLPK_integer __info;
  __CLPK_integer __ldb;
  __CLPK_integer v213;
  __CLPK_integer __nrhs;
  __CLPK_integer __n;
  __CLPK_integer __m;
  char __trans;
  __int128 v218;
  __int128 v219;
  float v220;
  __int128 __B;
  __int128 v222;
  float v223;
  uint64_t v224;

  v224 = *MEMORY[0x1E0C80C00];
  v220 = 0.0;
  v218 = 0u;
  v219 = 0u;
  if (objc_msgSend(*(id *)(a1 + 32), "_buildCalibrationMatrix:calibrationMatrix:error:", *(_QWORD *)(a1 + 40), &v218, a2))
  {
    VNBinModelFilePathFromModelNameAndThrow(CFSTR("eigenshape"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNModelFilesCache sharedInstance](VNModelFilesCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "load:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      if (!a2)
      {
        v19 = 0;
LABEL_135:

        return v19;
      }
      v194 = 0;
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("Could not read face geometry estimator model data"));
      v19 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_134:
      v6 = v194;
      goto LABEL_135;
    }
    v193 = a2;
    v194 = v6;
    v191 = v4;
    v192 = v5;
    v7 = (FILE *)objc_msgSend(v6, "ptrFile");
    v195 = 63;
    v199 = 0;
    v196 = 0u;
    v197 = 0u;
    __B = 0u;
    v222 = 0u;
    v223 = 1.0;
    vision::mod::readBinSerializedModelValues(v7, 0, vision::mod::Face3D::modelFileInfo(void)::tempInfo, &__B);
    v200 = v218;
    v201 = v219;
    v202 = v220;
    std::string::basic_string[abi:ne180100]<0>(__p, "mu");
    v8 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(&__B, (unsigned __int8 *)__p);
    if (v8 && (v9 = v8, *((_DWORD *)v8 + 10) == 2))
    {
      v10 = *((_OWORD *)v8 + 3);
      v11 = *((_QWORD *)v8 + 7);
      if (v11)
      {
        v12 = (unint64_t *)(v11 + 8);
        do
          v13 = __ldxr(v12);
        while (__stxr(v13 + 1, v12));
      }
      v14 = (std::__shared_weak_count *)*((_QWORD *)&v197 + 1);
      v197 = v10;
      if (v14)
      {
        p_shared_owners = (unint64_t *)&v14->__shared_owners_;
        do
          v16 = __ldaxr(p_shared_owners);
        while (__stlxr(v16 - 1, p_shared_owners));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
      v17 = *((_QWORD *)v9 + 8) / 3uLL;
      v18 = 1;
    }
    else
    {
      LODWORD(v17) = 0;
      v18 = 0;
    }
    if (SHIBYTE(v204[0]) < 0)
      operator delete(__p[0]);
    if ((v18 & 1) == 0)
      goto LABEL_146;
    std::string::basic_string[abi:ne180100]<0>(__p, "S");
    v20 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(&__B, (unsigned __int8 *)__p);
    if (v20 && (v21 = v20, *((_DWORD *)v20 + 10) == 2))
    {
      v22 = *((_OWORD *)v20 + 3);
      v23 = *((_QWORD *)v20 + 7);
      if (v23)
      {
        v24 = (unint64_t *)(v23 + 8);
        do
          v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }
      v26 = (std::__shared_weak_count *)*((_QWORD *)&v196 + 1);
      v196 = v22;
      if (v26)
      {
        v27 = (unint64_t *)&v26->__shared_owners_;
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
      v29 = *((_DWORD *)v21 + 16);
      v30 = 1;
    }
    else
    {
      v29 = 0;
      v30 = 0;
    }
    if (SHIBYTE(v204[0]) < 0)
      operator delete(__p[0]);
    if ((v30 & 1) != 0)
    {
      if (v195 == (_DWORD)v17)
      {
        v31 = v29 / (3 * (int)v17);
        v198 = v31;
        if (v31 < 0)
          v32 = -1;
        else
          v32 = 4 * v31;
        v33 = (void *)operator new[]();
        v34 = (float *)&v200;
        bzero(v33, v32);
        v199 = (float *)v33;
        std::__hash_table<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>>>::~__hash_table((uint64_t)&__B);
        v35 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v36 = *(float **)(*(_QWORD *)(a1 + 72) + 8);
        v37 = (uint64_t)(v36 + 12);
        if (*(_BYTE *)(a1 + 80))
        {
          __p[0] = 0;
          __p[1] = 0;
          v204[0] = 0;
          __B = 0u;
          v222 = 0u;
          if (v195 == ((*(_QWORD *)(v35 + 56) - *(_QWORD *)(v35 + 48)) >> 3))
          {
            Geometry2D_mallocCart2D(__p, v195);
            v39 = __p[0];
            v38 = __p[1];
            v40 = 123;
            v41 = v193;
            if (__p[0])
            {
              if (__p[1])
              {
                if (SLODWORD(v204[0]) >= 1)
                {
                  Geometry3D_mallocCart3D((uint64_t)&__B, v195);
                  v42 = (_DWORD *)__B;
                  v40 = 123;
                  if ((_QWORD)__B)
                  {
                    v43 = (_DWORD *)*((_QWORD *)&__B + 1);
                    if (*((_QWORD *)&__B + 1))
                    {
                      v44 = (_DWORD *)v222;
                      if ((_QWORD)v222)
                      {
                        if (SDWORD2(v222) >= 1)
                        {
                          v45 = v195;
                          v46 = (int *)(*(_QWORD *)(v35 + 48) + 4);
                          v47 = (_DWORD *)(v197 + 4);
                          v48 = v38;
                          v49 = v39;
                          do
                          {
                            *v49++ = *(v46 - 1);
                            v50 = *v46;
                            v46 += 2;
                            *v48++ = v50;
                            *v42++ = *(v47 - 1);
                            *v43++ = *v47;
                            *v44++ = v47[1];
                            v47 += 3;
                            --v45;
                          }
                          while (v45);
                          v40 = Face3D_estimateCameraProjective((uint64_t)__p, (uint64_t)&__B, (float *)&v200, v37);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          else
          {
            v38 = 0;
            v39 = 0;
            v40 = 124;
            v41 = v193;
          }
          free(v39);
          free(v38);
          free((void *)__B);
          *(_QWORD *)&__B = 0;
          free(*((void **)&__B + 1));
          *((_QWORD *)&__B + 1) = 0;
          free((void *)v222);
          v156 = 0;
          goto LABEL_126;
        }
        __A = (float *)v196;
        v208 = 3.4028e38;
        v205 = 0;
        v206 = 0;
        v207 = 0;
        *(_OWORD *)__p = 0u;
        *(_OWORD *)v204 = 0u;
        if (v195 != ((*(_QWORD *)(v35 + 56) - *(_QWORD *)(v35 + 48)) >> 3))
        {
          v53 = 0;
          v52 = 0;
          v51 = 0;
          v40 = 124;
          goto LABEL_124;
        }
        v181 = v36;
        v185 = (float *)v197;
        Geometry2D_mallocCart2D(&v205, v195);
        v51 = 0;
        v52 = v205;
        v53 = v206;
        v40 = 123;
        v41 = v193;
        if (!v205)
          goto LABEL_125;
        if (!v206)
          goto LABEL_125;
        v187 = v207;
        if ((int)v207 < 1)
          goto LABEL_125;
        v180 = v205;
        Geometry3D_mallocCart3D((uint64_t)__p, v195);
        v51 = 0;
        v54 = __p[0];
        v40 = 123;
        if (!__p[0])
        {
LABEL_141:
          v52 = v180;
          goto LABEL_125;
        }
        v55 = __p[1];
        v52 = v180;
        if (!__p[1] || (v56 = v204[0]) == 0 || SLODWORD(v204[1]) < 1)
        {
LABEL_125:
          free(v52);
          free(v53);
          free(__p[0]);
          __p[0] = 0;
          free(__p[1]);
          __p[1] = 0;
          free(v204[0]);
          v156 = v51;
LABEL_126:
          v19 = v40 == 128;
          if (v40 == 128)
          {
            v5 = v192;
            if (!*(_BYTE *)(a1 + 80))
            {
              v157 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v156, 756);
              objc_msgSend(*(id *)(a1 + 48), "setLandmark3DPointsData:originatingRequestSpecifier:", v157, *(_QWORD *)(a1 + 56));

            }
          }
          else
          {
            v5 = v192;
            if (v41)
            {
              +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Failed to estimate face geometry"));
              v5 = v192;
              *v193 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
          if (v156)
            operator delete(v156);
          vision::mod::Face3D::~Face3D((vision::mod::Face3D *)&v195);
          goto LABEL_134;
        }
        v57 = v195;
        v58 = (float *)(*(_QWORD *)(v35 + 48) + 4);
        v59 = (_DWORD *)(v197 + 4);
        v60 = v53;
        v61 = v180;
        do
        {
          *v61++ = *(v58 - 1);
          v62 = *v58;
          v58 += 2;
          *v60++ = v62;
          *v54++ = *(v59 - 1);
          *v55++ = *v59;
          *v56++ = v59[1];
          v59 += 3;
          --v57;
        }
        while (v57);
        v63 = 0;
        v184 = v53;
        v172 = v53;
        v173 = v180;
        v188 = v53;
        v190 = v180;
        v182 = v53;
        __sz = v37;
        while (1)
        {
          v40 = Face3D_estimateCameraProjective((uint64_t)&v205, (uint64_t)__p, v34, v37);
          if ((v40 & 0x80) == 0)
          {
LABEL_137:
            v51 = 0;
            goto LABEL_141;
          }
          v186 = v63;
          v64 = 0;
          v65 = v185;
          if (v182)
          {
            if (!__A || !v185)
            {
              v64 = 0;
              v83 = 0;
              goto LABEL_79;
            }
            v66 = v181[12];
            v67 = v181[13];
            v68 = *((float *)&v200 + 3);
            v69 = v200;
            v70 = *((_QWORD *)&v201 + 1);
            v71 = v181[14];
            v72 = v181[15];
            v73 = v201;
            *(float *)&__B = (float)((float)(*((float *)&v200 + 3) * v67) + (float)(*(float *)&v200 * v66))
                           + (float)(*((float *)&v201 + 2) * v71);
            *((float *)&__B + 1) = (float)((float)(v67 * *(float *)&v201) + (float)(*((float *)&v200 + 1) * v66))
                                 + (float)(*((float *)&v201 + 3) * v71);
            v74 = v202;
            v75 = (float)((float)(v67 * *((float *)&v201 + 1)) + (float)(*((float *)&v200 + 2) * v66))
                + (float)(v202 * v71);
            v76 = v181[16];
            v77 = v181[17];
            *((float *)&__B + 2) = v75;
            *((float *)&__B + 3) = (float)((float)(*((float *)&v200 + 3) * v76) + (float)(*(float *)&v200 * v72))
                                 + (float)(*((float *)&v201 + 2) * v77);
            *(float *)&v222 = (float)((float)(*(float *)&v201 * v76) + (float)(*((float *)&v200 + 1) * v72))
                            + (float)(*((float *)&v201 + 3) * v77);
            *((float *)&v222 + 1) = (float)((float)(*((float *)&v201 + 1) * v76) + (float)(*((float *)&v200 + 2) * v72))
                                  + (float)(v202 * v77);
            v78 = v181[18];
            v79 = v181[19];
            v80 = v181[20];
            v81 = v181[21];
            *((float *)&v222 + 2) = (float)((float)(*((float *)&v200 + 3) * v79) + (float)(*(float *)&v200 * v78))
                                  + (float)(*((float *)&v201 + 2) * v80);
            *((float *)&v222 + 3) = (float)((float)(*(float *)&v201 * v79) + (float)(*((float *)&v200 + 1) * v78))
                                  + (float)(*((float *)&v201 + 3) * v80);
            v82 = v198;
            __dst = v199;
            v178 = *((float *)&v200 + 2);
            v223 = (float)((float)(*((float *)&v201 + 1) * v79) + (float)(*((float *)&v200 + 2) * v78))
                 + (float)(v202 * v80);
            v175 = v181[22];
            v176 = v181[23];
            v177 = v81;
            v83 = (__CLPK_real *)malloc_type_malloc(4 * (int)(2 * v187 * v198), 0x100004052888210uLL);
            if (!v83)
            {
              v64 = 0;
LABEL_79:
              v84 = 0;
LABEL_80:
              __C = 0;
LABEL_81:
              v40 = 125;
              goto LABEL_83;
            }
            v84 = (__CLPK_real *)malloc_type_malloc(8 * (int)v187, 0x100004052888210uLL);
            if (!v84)
            {
              v64 = 0;
              goto LABEL_80;
            }
            __C = (float *)malloc_type_malloc(4 * (int)(3 * v198), 0x100004052888210uLL);
            if (!__C)
            {
              v64 = 0;
              goto LABEL_81;
            }
            v171 = v34;
            v86 = v83;
            v87 = 0;
            v88 = (float)((float)(v68 * v175) + (float)(*(float *)&v69 * v177)) + (float)(*(float *)&v70 * v176);
            v89 = v84;
            v90 = (float)((float)(*((float *)&v73 + 1) * v175) + (float)(v178 * v177)) + (float)(v74 * v176);
            v179 = v86;
            v91 = __A;
            do
            {
              cblas_sgemm(CblasColMajor, CblasTrans, CblasTrans, v82, 3, 3, 1.0, v91, 3 * v187, (const float *)&__B, 3, 0.0, __C, v82);
              v92 = *v65;
              v93 = v65[1];
              v94 = v65[2];
              v95 = __B;
              v96 = *((_QWORD *)&v222 + 1);
              v97 = *((_QWORD *)&__B + 1);
              v98 = v222;
              v99 = v223;
              v100 = v190[v87];
              if ((int)v82 >= 1)
              {
                v101 = v188[v87];
                v102 = __C;
                v103 = v86;
                v104 = v82;
                do
                {
                  *v103 = -(float)(*v102 - (float)(v102[2 * (int)v82] * v100));
                  v103[(int)v82] = -(float)(v102[(int)v82] - (float)(v102[2 * (int)v82] * v101));
                  ++v103;
                  ++v102;
                  --v104;
                }
                while (v104);
                v100 = v190[v87];
              }
              v91 += 3;
              v105 = (float)((float)(*((float *)&v97 + 1) * v93) + (float)(*(float *)&v95 * v92))
                   + (float)(*(float *)&v96 * v94);
              v106 = (float)((float)(v93 * *(float *)&v98) + (float)(*((float *)&v95 + 1) * v92))
                   + (float)(*((float *)&v96 + 1) * v94);
              v65 += 3;
              v107 = v90
                   + (float)((float)((float)(v93 * *((float *)&v98 + 1)) + (float)(*(float *)&v97 * v92))
                           + (float)(v99 * v94));
              *v89 = (float)(v88 + v105) - (float)(v107 * v100);
              v89[1] = (float)((float)((float)((float)(*(float *)&v73 * v175) + (float)(*((float *)&v69 + 1) * v177))
                                     + (float)(*((float *)&v70 + 1) * v176))
                             + v106)
                     - (float)(v107 * v188[v87]);
              v89 += 2;
              ++v87;
              v86 += 2 * (int)v82;
            }
            while (v87 != v187);
            __trans = 84;
            __m = v82;
            __n = 2 * v187;
            __nrhs = 1;
            v213 = v82;
            __ldb = 2 * v187;
            __info = 0;
            __lwork = -1;
            sgels_(&__trans, &__m, &__n, &__nrhs, 0, &v213, 0, &__ldb, &__work, &__lwork, &__info);
            v34 = v171;
            v65 = v185;
            v83 = v179;
            LODWORD(v108) = (int)__work;
            v64 = (__CLPK_real *)malloc_type_malloc(4 * (int)__work, 0x100004052888210uLL);
            __work = v108;
            sgels_(&__trans, &__m, &__n, &__nrhs, v179, &v213, v84, &__ldb, v64, (__CLPK_integer *)&__work, &__info);
            if (__info)
            {
              v182 = v188;
              v40 = 111;
            }
            else
            {
              memcpy(__dst, v84, 4 * (int)v82);
              v182 = v188;
              v40 = 0x80;
            }
          }
          else
          {
            v40 = 124;
            v83 = 0;
            v84 = 0;
            __C = 0;
          }
LABEL_83:
          free(v64);
          free(v83);
          free(v84);
          free(__C);
          if ((v40 & 0x80) == 0)
          {
            v51 = 0;
LABEL_140:
            v4 = v191;
            v41 = v193;
            v53 = v184;
            goto LABEL_141;
          }
          v109 = 3 * LODWORD(v204[1]);
          v110 = 12 * SLODWORD(v204[1]);
          v111 = (float *)malloc_type_malloc(v110, 0x100004052888210uLL);
          v51 = v111;
          if (!v111)
          {
            v40 = 125;
            goto LABEL_140;
          }
          memcpy(v111, v65, v110);
          cblas_sgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, v109, 1, v198, 1.0, __A, v109, v199, v198, 1.0, v51, v109);
          v112 = LODWORD(v204[1]);
          if (SLODWORD(v204[1]) >= 1)
          {
            v113 = __p[0];
            v114 = __p[1];
            v115 = (int *)(v51 + 2);
            v116 = v204[0];
            do
            {
              *v113++ = *(v115 - 2);
              *v114++ = *(v115 - 1);
              v117 = *v115;
              v115 += 3;
              *v116++ = v117;
              --v112;
            }
            while (v112);
          }
          free(v51);
          v118 = v208;
          __B = 0uLL;
          *(_QWORD *)&v222 = 0;
          Geometry2D_mallocCart2D(&__B, v187);
          v119 = __B;
          v4 = v191;
          v41 = v193;
          v53 = v184;
          if ((_QWORD)__B && *((_QWORD *)&__B + 1) && (v120 = v222, (int)v222 >= 1))
          {
            v121 = (char *)__p[0];
            if (__p[0] && (v122 = (char *)__p[1]) != 0 && (v123 = (char *)v204[0]) != 0 && SLODWORD(v204[1]) >= 1)
            {
              if ((_DWORD)v222 == LODWORD(v204[1]))
              {
                v124 = 0;
                v125 = v181[12];
                v126 = v181[13];
                v127 = v181[14];
                v128 = v181[15];
                v129 = (float)((float)(*((float *)&v200 + 3) * v126) + (float)(*(float *)&v200 * v125))
                     + (float)(*((float *)&v201 + 2) * v127);
                v130 = v181[16];
                v131 = v181[17];
                v132 = (float)((float)(*((float *)&v200 + 3) * v130) + (float)(*(float *)&v200 * v128))
                     + (float)(*((float *)&v201 + 2) * v131);
                v133 = v181[18];
                v134 = v181[19];
                v135 = v181[20];
                v136 = v181[21];
                v137 = (float)((float)(*((float *)&v200 + 3) * v134) + (float)(*(float *)&v200 * v133))
                     + (float)(*((float *)&v201 + 2) * v135);
                v138 = (float)((float)(v126 * *(float *)&v201) + (float)(*((float *)&v200 + 1) * v125))
                     + (float)(*((float *)&v201 + 3) * v127);
                v139 = (float)((float)(v130 * *(float *)&v201) + (float)(*((float *)&v200 + 1) * v128))
                     + (float)(*((float *)&v201 + 3) * v131);
                v140 = (float)((float)(v126 * *((float *)&v201 + 1)) + (float)(*((float *)&v200 + 2) * v125))
                     + (float)(v202 * v127);
                v141 = (float)((float)(v134 * *(float *)&v201) + (float)(*((float *)&v200 + 1) * v133))
                     + (float)(*((float *)&v201 + 3) * v135);
                v142 = (float)((float)(v130 * *((float *)&v201 + 1)) + (float)(*((float *)&v200 + 2) * v128))
                     + (float)(v202 * v131);
                v143 = (float)((float)(v134 * *((float *)&v201 + 1)) + (float)(*((float *)&v200 + 2) * v133))
                     + (float)(v202 * v135);
                v144 = v181[22];
                v145 = v181[23];
                v146 = (float)((float)(*((float *)&v200 + 3) * v144) + (float)(*(float *)&v200 * v136))
                     + (float)(*((float *)&v201 + 2) * v145);
                v147 = (float)((float)(*(float *)&v201 * v144) + (float)(*((float *)&v200 + 1) * v136))
                     + (float)(*((float *)&v201 + 3) * v145);
                v148 = 4 * v222;
                v149 = (float)((float)(*((float *)&v201 + 1) * v144) + (float)(*((float *)&v200 + 2) * v136))
                     + (float)(v202 * v145);
                do
                {
                  v150 = *(float *)&v121[v124];
                  v151 = *(float *)&v122[v124];
                  v152 = *(float *)&v123[v124];
                  v153 = v149 + (float)((float)((float)(v142 * v151) + (float)(v140 * v150)) + (float)(v143 * v152));
                  *(float *)(v119 + v124) = (float)(v146
                                                  + (float)((float)((float)(v132 * v151) + (float)(v129 * v150))
                                                          + (float)(v137 * v152)))
                                          / v153;
                  *(float *)(*((_QWORD *)&v119 + 1) + v124) = (float)(v147
                                                                    + (float)((float)((float)(v139
                                                                                            * *(float *)&v122[v124])
                                                                                    + (float)(v138
                                                                                            * *(float *)&v121[v124]))
                                                                            + (float)(v141 * *(float *)&v123[v124])))
                                                            / v153;
                  v124 += 4;
                }
                while (v148 != v124);
                v154 = (float *)malloc_type_malloc(4 * (int)v187, 0x100004052888210uLL);
                v155 = v154;
                if (v154)
                {
                  if (v172)
                  {
                    if ((int)v187 >= 1)
                    {
                      if ((_DWORD)v187 == (_DWORD)v120)
                      {
                        vDSP_vpythg(v180, 1, v184, 1, (const float *)v119, 1, *((const float **)&v119 + 1), 1, v154, 1, v120);
                        vDSP_sve(v155, 1, &v208, (int)v187);
                        v172 = v184;
                        v173 = v180;
                        v188 = v184;
                        v190 = v180;
                        v182 = v184;
                        v40 = 0x80;
                      }
                      else
                      {
                        v188 = v172;
                        v190 = v173;
                        v182 = v172;
                        v40 = 124;
                      }
                      goto LABEL_118;
                    }
                    v188 = v172;
                    v190 = v173;
                    v182 = v172;
                  }
                  else
                  {
                    v172 = 0;
                    v188 = 0;
                    v182 = 0;
                    v190 = v173;
                  }
                  v40 = 125;
                }
                else
                {
                  v40 = 123;
                }
LABEL_118:
                free(v155);
                v53 = v184;
                goto LABEL_105;
              }
              v40 = 124;
            }
            else
            {
              v40 = 125;
            }
          }
          else
          {
            v40 = 123;
          }
LABEL_105:
          free((void *)v119);
          free(*((void **)&v119 + 1));
          if ((v40 & 0x80) == 0)
            goto LABEL_137;
          v37 = __sz;
          if ((float)(vabds_f32(v208, v118) / v118) >= 0.00001)
          {
            v63 = v186 + 1;
            if (v186 != 499)
              continue;
          }
          if ((v187 & 0x80000000) != 0)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          v51 = (float *)operator new(12 * (int)v187);
          bzero(v51, 12 * ((12 * (int)v187 - 12) / 0xCuLL) + 12);
          v159 = 0;
          v160 = (int *)__p[0];
          v161 = (int *)__p[1];
          v162 = (int *)v204[0];
          do
          {
            v163 = *v160++;
            v164 = v163;
            v165 = *v161++;
            v166 = v165;
            v167 = *v162++;
            v168 = &v51[v159];
            *(_DWORD *)v168 = v164;
            *((_DWORD *)v168 + 1) = v166;
            *((_DWORD *)v168 + 2) = v167;
            v159 += 3;
          }
          while (3 * v187 != v159);
          v52 = v205;
          v53 = v206;
LABEL_124:
          v41 = v193;
          goto LABEL_125;
        }
      }
      exception = __cxa_allocate_exception(8uLL);
      v170 = 892;
    }
    else
    {
LABEL_146:
      exception = __cxa_allocate_exception(8uLL);
      v170 = 888;
    }
    *exception = v170;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  return 0;
}

@end
