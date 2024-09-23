@implementation VNFaceRegionMapGenerator

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  char v7;
  _QWORD aBlock[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VNFaceRegionMapGenerator;
  if (!-[VNDetector completeInitializationForSession:error:](&v10, sel_completeInitializationForSession_error_, a3))
    return 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__VNFaceRegionMapGenerator_completeInitializationForSession_error___block_invoke;
  aBlock[3] = &unk_1E4547B88;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v7 = VNExecuteBlock(v6, (uint64_t)a4);

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  VNBinModelFilePathFromModelNameAndThrow(CFSTR("faceRegionMap-current"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNModelFilesCache sharedInstance](VNModelFilesCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unload:", v3);

  v5.receiver = self;
  v5.super_class = (Class)VNFaceRegionMapGenerator;
  -[VNDetector dealloc](&v5, sel_dealloc);
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  return 1;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v13;
  id v14;
  id v15;
  float v16;
  float v17;
  float32x2_t *v18;
  id v19;
  uint64_t v20;
  float32x2_t *v21;
  FaceRegionMap *ptr;
  void *v23;
  _OWORD *v24;
  _OWORD *v25;
  float v26;
  uint64_t v27;
  float *v28;
  float *v29;
  uint64_t v30;
  uint64_t v31;
  size_t v32;
  char *v33;
  BOOL v34;
  char v36;
  void *v37;
  float *v38;
  int v39;
  uint64_t *v40;
  float *v41;
  BOOL v42;
  char v44;
  char v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  float *v50;
  float v51;
  float v52;
  float *v53;
  float v54;
  float v55;
  uint64_t v56;
  float *v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float *v65;
  float v66;
  float *v67;
  float *v68;
  float *v69;
  uint64_t v70;
  float v71;
  float v72;
  float v73;
  uint64_t v74;
  float *v75;
  float v76;
  float v77;
  float *v78;
  float v79;
  float v80;
  float *v81;
  float v82;
  float v83;
  uint64_t i;
  float v85;
  float v87;
  float v89;
  uint64_t v91;
  void *v92;
  FaceRegionMap *v93;
  _QWORD *v94;
  _QWORD *v95;
  _QWORD *v96;
  uint64_t *v97;
  uint64_t **v98;
  uint64_t *v99;
  uint64_t **v100;
  unsigned int v101;
  uint64_t **v102;
  uint64_t **v103;
  char *v104;
  std::string *v105;
  __int128 v106;
  unsigned int v107;
  _QWORD *v108;
  _QWORD *v109;
  id v110;
  void *v111;
  uint64_t **v112;
  _QWORD *v113;
  void *v114;
  void *v115;
  uint64_t *v116;
  uint64_t **v117;
  VNFaceRegionMap *v118;
  uint64_t v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  int v128;
  double v129;
  int v130;
  double v131;
  int v132;
  double v133;
  int v134;
  double v135;
  VNFaceRegionMap *v136;
  float32x2_t *v138;
  VNFaceRegionMapGenerator *v139;
  id *v140;
  id v141;
  id v142;
  uint64_t v143;
  char v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  float *v150;
  char v151;
  char v152;
  vDSP_Length v153;
  vDSP_Length __N;
  float v155;
  float *v156;
  float __D;
  float *__Da;
  _OWORD v159[2];
  void *__p;
  float32x2_t *v161;
  uint64_t v162;
  float __A;
  float *__C;
  float *v165;
  uint64_t v166;
  float __B;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t **v171;
  float *v172;
  uint64_t v173;
  float v174;
  float v175;
  float v176;
  float v177;
  void *v178;
  float v179;
  float v180;
  float v181;
  float v182;
  float v183;
  float v184;
  uint64_t v185;

  v185 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a7;
  v15 = a9;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v13, a8);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v148)
  {
    v92 = 0;
    goto LABEL_133;
  }
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v13, a8);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v146)
  {
    v92 = 0;
    goto LABEL_132;
  }
  VNCloneFaceObservationFromOptions((uint64_t)v13, a8);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v147)
  {
    v92 = 0;
    goto LABEL_131;
  }
  objc_msgSend(v148, "width");
  objc_msgSend(v148, "height");
  objc_msgSend(v147, "alignedBoundingBox");
  __D = v16;
  v155 = v17;
  __p = 0;
  v161 = 0;
  v162 = 0;
  std::vector<_Geometry2D_point2D_>::resize((char **)&__p);
  v18 = (float32x2_t *)__p;
  objc_msgSend(v147, "landmarkPoints65");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  memcpy(v18, (const void *)objc_msgSend(v19, "bytes"), 0x1F8uLL);

  v20 = (uint64_t)v161;
  if (v18 != v161)
  {
    v21 = v18;
    do
    {
      *v21 = vmul_f32((float32x2_t)__PAIR64__(LODWORD(__D), LODWORD(v155)), *v21);
      ++v21;
    }
    while (v21 != (float32x2_t *)v20);
  }
  ptr = self->mFaceRegionMapAlgorithmImpl.__ptr_;
  memset(v159, 0, sizeof(v159));
  v168 = 0;
  v169 = 0;
  v170 = 0;
  std::vector<_Geometry2D_point2D_>::__init_with_size[abi:ne180100]<_Geometry2D_point2D_*,_Geometry2D_point2D_*>(&v168, v18, v20, (v20 - (uint64_t)v18) >> 3);
  v23 = v168;
  if (v169 - (_QWORD)v168 != 504)
  {
    v91 = 5756;
    if (!v168)
      goto LABEL_85;
    goto LABEL_84;
  }
  v141 = v15;
  v142 = v13;
  v143 = FaceRegionMap_addForeheadLandmarks((uint64_t)&v168);
  if ((v143 & 0x80) == 0)
    goto LABEL_77;
  *(int64x2_t *)((char *)v159 + 8) = vdupq_n_s64(0x100uLL);
  *((_QWORD *)&v159[1] + 1) = 256;
  v24 = malloc_type_malloc(0x10000uLL, 0x100004077774924uLL);
  v25 = v24;
  *(_QWORD *)&v159[0] = v24;
  if (!v24)
  {
    v91 = 5755;
    goto LABEL_78;
  }
  bzero(v24, 0x10000uLL);
  __B = v155 * 0.0039062;
  v26 = __D * 0.0039062;
  __C = 0;
  v165 = 0;
  v166 = 0;
  Geometry2D_mallocCart2D(&__C, 256);
  v27 = 0;
  v28 = __C;
  do
  {
    v28[v27] = (float)(int)v27;
    ++v27;
  }
  while (v27 != 256);
  v138 = v18;
  v139 = self;
  v140 = a8;
  v29 = v28;
  vDSP_vsmul(v28, 1, &__B, v28, 1, 0x100uLL);
  v30 = 0;
  v31 = (int)v166;
  v32 = 4 * v166;
  v33 = v168;
  v150 = v29;
  v156 = v165;
  if (v29)
    v34 = v165 == 0;
  else
    v34 = 1;
  v36 = v34 || (int)v166 < 1;
  v144 = v36;
  v145 = 4 * v166;
  do
  {
    __A = v26 * (float)v30;
    vDSP_vfill(&__A, v156, 1, 0x100uLL);
    v149 = v30;
    v25[14] = 0u;
    v25[15] = 0u;
    v25[12] = 0u;
    v25[13] = 0u;
    v25[10] = 0u;
    v25[11] = 0u;
    v25[8] = 0u;
    v25[9] = 0u;
    v25[6] = 0u;
    v25[7] = 0u;
    v25[4] = 0u;
    v25[5] = 0u;
    v25[2] = 0u;
    v25[3] = 0u;
    *v25 = 0u;
    v25[1] = 0u;
    if ((int)v31 < 1)
    {
      v37 = 0;
LABEL_27:
      free(v37);
      v37 = 0;
      v38 = 0;
      v39 = 0;
      goto LABEL_28;
    }
    v37 = malloc_type_malloc(v32, 0x100004052888210uLL);
    if (!v37)
      goto LABEL_27;
    v38 = (float *)malloc_type_malloc(v32, 0x100004052888210uLL);
    v39 = v31;
    if (!v38)
      goto LABEL_27;
LABEL_28:
    v171 = 0;
    v172 = 0;
    v173 = 0;
    Geometry2D_mallocCart2D(&v171, v31);
    v40 = (uint64_t *)*((_QWORD *)ptr + 10);
    v41 = (float *)v171;
    __Da = v172;
    if (v40 != *((uint64_t **)ptr + 11))
    {
      if (v171)
        v42 = v172 == 0;
      else
        v42 = 1;
      v44 = v42 || (int)v173 < 1;
      v45 = v144;
      if (!v37)
      {
        v45 = 1;
        v44 = 1;
      }
      if (!v38)
      {
        v45 = 1;
        v44 = 1;
      }
      if (v39 < 1)
      {
        v45 = 1;
        v44 = 1;
      }
      __N = v173;
      if ((_DWORD)v31 == v39)
        v46 = v45;
      else
        v46 = 1;
      v153 = (int)v173;
      if ((_DWORD)v173 == v39)
        v47 = v44;
      else
        v47 = 1;
      v151 = v47;
      v152 = v46;
      do
      {
        v48 = *v40;
        v49 = v40[1];
        v50 = (float *)&v33[8 * *v40];
        v51 = *v50;
        v182 = *v50;
        v52 = v50[1];
        v179 = v52;
        v53 = (float *)&v33[8 * v49];
        v54 = *v53;
        v183 = *v53;
        v55 = v53[1];
        v180 = v55;
        v56 = v40[2];
        v57 = (float *)&v33[8 * v56];
        v58 = *v57;
        v184 = *v57;
        v59 = v57[1];
        v181 = v59;
        if ((v46 & 1) == 0)
        {
          v60 = v51 - v54;
          v61 = v52 - v59;
          v62 = v51 - v58;
          v63 = v52 - v55;
          v64 = (float)(v60 * (float)(v52 - v59)) - (float)(v62 * v63);
          v65 = v150;
          v66 = -v60;
          v67 = v156;
          v68 = (float *)v37;
          v69 = v38;
          v70 = v39;
          do
          {
            v71 = *v65++;
            v72 = v71 - v51;
            v73 = *v67++;
            *v68++ = (float)((float)(v62 * (float)(v73 - v52)) - (float)(v72 * v61)) / v64;
            *v69++ = (float)((float)((float)(v73 - v52) * v66) + (float)(v72 * v63)) / v64;
            --v70;
          }
          while (v70);
          v48 = *v40;
          v49 = v40[1];
          v56 = v40[2];
        }
        v74 = *((_QWORD *)ptr + 3);
        v75 = (float *)(v74 + 8 * v48);
        v76 = *v75;
        v182 = *v75;
        v77 = v75[1];
        v179 = v77;
        v78 = (float *)(v74 + 8 * v49);
        v79 = *v78;
        v183 = *v78;
        v80 = v78[1];
        v180 = v80;
        v81 = (float *)(v74 + 8 * v56);
        v82 = *v81;
        v184 = *v81;
        v83 = v81[1];
        v181 = v83;
        if ((v47 & 1) == 0)
        {
          v176 = v80 - v77;
          v177 = v79 - v76;
          v174 = v83 - v77;
          v175 = v82 - v76;
          vDSP_vsmsa((const float *)v37, 1, &v177, &v182, v41, 1, __N);
          vDSP_vsma(v38, 1, &v175, v41, 1, v41, 1, v153);
          vDSP_vsmsa((const float *)v37, 1, &v176, &v179, __Da, 1, v153);
          vDSP_vsma(v38, 1, &v174, __Da, 1, __Da, 1, v153);
          v47 = v151;
          v46 = v152;
        }
        if ((int)v31 >= 1)
        {
          for (i = 0; i < v31; ++i)
          {
            if (!*((_BYTE *)v25 + i))
            {
              v85 = *((float *)v37 + i);
              if (v85 >= 0.0 && v85 <= 1.0)
              {
                v87 = v38[i];
                if (v87 >= 0.0 && v87 <= 1.0)
                {
                  v89 = v85 + v87;
                  if (v89 >= 0.0 && v89 <= 1.0)
                    *((_BYTE *)v25 + i) = *(_BYTE *)(*((_QWORD *)ptr + 6)
                                                   + (unint64_t)v41[i]
                                                   + *((_QWORD *)ptr + 9) * (unint64_t)__Da[i]);
                }
              }
            }
          }
        }
        v40 += 3;
      }
      while (v40 != *((uint64_t **)ptr + 11));
    }
    free(v41);
    free(__Da);
    free(v37);
    free(v38);
    v25 += 16;
    v30 = v149 + 1;
    v32 = v145;
  }
  while (v149 != 255);
  free(v150);
  free(v156);
  self = v139;
  a8 = v140;
  v18 = v138;
LABEL_77:
  v91 = v143;
LABEL_78:
  v23 = v168;
  v13 = v142;
  v15 = v141;
  if (v168)
LABEL_84:
    operator delete(v23);
LABEL_85:
  if (v91 == 5760)
  {
    v93 = self->mFaceRegionMapAlgorithmImpl.__ptr_;
    v172 = 0;
    v173 = 0;
    v171 = (uint64_t **)&v172;
    v96 = *(_QWORD **)v93;
    v94 = (_QWORD *)((char *)v93 + 8);
    v95 = v96;
    if (v96 != v94)
    {
      do
      {
        v97 = (uint64_t *)v172;
        v98 = (uint64_t **)&v172;
        if (v171 == (uint64_t **)&v172)
          goto LABEL_93;
        v99 = (uint64_t *)v172;
        v100 = (uint64_t **)&v172;
        if (v172)
        {
          do
          {
            v98 = (uint64_t **)v99;
            v99 = (uint64_t *)v99[1];
          }
          while (v99);
        }
        else
        {
          do
          {
            v98 = (uint64_t **)v100[2];
            v34 = *v98 == (uint64_t *)v100;
            v100 = v98;
          }
          while (v34);
        }
        v101 = *((unsigned __int8 *)v95 + 32);
        if (*((unsigned __int8 *)v98 + 32) < v101)
        {
LABEL_93:
          if (v172)
            v102 = v98;
          else
            v102 = (uint64_t **)&v172;
          if (v172)
            v103 = v98 + 1;
          else
            v103 = (uint64_t **)&v172;
        }
        else
        {
          v102 = (uint64_t **)&v172;
          v103 = (uint64_t **)&v172;
          if (v172)
          {
            v103 = (uint64_t **)&v172;
            while (1)
            {
              while (1)
              {
                v102 = (uint64_t **)v97;
                v107 = *((unsigned __int8 *)v97 + 32);
                if (v101 >= v107)
                  break;
                v97 = *v102;
                v103 = v102;
                if (!*v102)
                  goto LABEL_100;
              }
              if (v107 >= v101)
                break;
              v103 = v102 + 1;
              v97 = v102[1];
              if (!v97)
                goto LABEL_100;
            }
          }
        }
        if (!*v103)
        {
LABEL_100:
          v104 = (char *)operator new(0x40uLL);
          v104[32] = *((_BYTE *)v95 + 32);
          v105 = (std::string *)(v104 + 40);
          if (*((char *)v95 + 63) < 0)
          {
            std::string::__init_copy_ctor_external(v105, (const std::string::value_type *)v95[5], v95[6]);
          }
          else
          {
            v106 = *(_OWORD *)(v95 + 5);
            *((_QWORD *)v104 + 7) = v95[7];
            *(_OWORD *)&v105->__r_.__value_.__l.__data_ = v106;
          }
          *(_QWORD *)v104 = 0;
          *((_QWORD *)v104 + 1) = 0;
          *((_QWORD *)v104 + 2) = v102;
          *v103 = (uint64_t *)v104;
          if (*v171)
          {
            v171 = (uint64_t **)*v171;
            v104 = (char *)*v103;
          }
          std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v172, (uint64_t *)v104);
          ++v173;
        }
        v108 = (_QWORD *)v95[1];
        if (v108)
        {
          do
          {
            v109 = v108;
            v108 = (_QWORD *)*v108;
          }
          while (v108);
        }
        else
        {
          do
          {
            v109 = (_QWORD *)v95[2];
            v34 = *v109 == (_QWORD)v95;
            v95 = v109;
          }
          while (!v34);
        }
        v95 = v109;
      }
      while (v109 != v94);
    }
    v110 = objc_alloc(MEMORY[0x1E0C99E08]);
    v111 = (void *)objc_msgSend(v110, "initWithCapacity:", v173);
    v112 = v171;
    if (v171 != (uint64_t **)&v172)
    {
      do
      {
        v113 = v112 + 5;
        if (*((char *)v112 + 63) < 0)
          v113 = (_QWORD *)*v113;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v113);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *((unsigned __int8 *)v112 + 32));
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "setObject:forKey:", v114, v115);

        v116 = v112[1];
        if (v116)
        {
          do
          {
            v117 = (uint64_t **)v116;
            v116 = (uint64_t *)*v116;
          }
          while (v116);
        }
        else
        {
          do
          {
            v117 = (uint64_t **)v112[2];
            v34 = *v117 == (uint64_t *)v112;
            v112 = v117;
          }
          while (!v34);
        }
        v112 = v117;
      }
      while (v117 != (uint64_t **)&v172);
    }
    v118 = [VNFaceRegionMap alloc];
    v119 = objc_msgSend(v146, "requestRevision");
    objc_msgSend(v147, "boundingBox");
    v121 = v120;
    v123 = v122;
    v125 = v124;
    v127 = v126;
    objc_msgSend(v147, "alignedBoundingBox");
    LODWORD(v129) = v128;
    LODWORD(v131) = v130;
    LODWORD(v133) = v132;
    LODWORD(v135) = v134;
    v136 = -[VNFaceRegionMap initWithRequestRevision:regionMap:deallocateBuffer:userBBox:alignedBBox:valueToLabelMap:](v118, "initWithRequestRevision:regionMap:deallocateBuffer:userBBox:alignedBBox:valueToLabelMap:", v119, v159, 1, v111, v121, v123, v125, v127, v129, v131, v133, v135);
    objc_msgSend(v147, "setFaceRegionMap:", v136);
    v178 = v147;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v178, 1);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy((char *)v172);
    v18 = (float32x2_t *)__p;
    if (__p)
LABEL_130:
      operator delete(v18);
  }
  else if (a8)
  {
    VNErrorForCVMLStatus((id)v91);
    v92 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
      goto LABEL_130;
  }
  else
  {
    v92 = 0;
    if (v18)
      goto LABEL_130;
  }
LABEL_131:

LABEL_132:
LABEL_133:

  return v92;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->mFaceRegionMapAlgorithmImpl.__cntrl_;
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

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

BOOL __67__VNFaceRegionMapGenerator_completeInitializationForSession_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  FILE *v8;
  char *v9;
  uint64_t **v10;
  _QWORD *v11;
  unsigned __int8 *v12;
  std::__shared_weak_count *v13;
  float *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  char v17;
  uint64_t v18;
  unsigned __int8 *v19;
  std::__shared_weak_count *v20;
  float *v21;
  unint64_t *v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  unsigned __int8 *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  float v33;
  float v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t i;
  unint64_t *v39;
  unint64_t v40;
  unsigned __int8 *v41;
  unsigned __int8 *v42;
  std::__shared_weak_count *v43;
  uint64_t v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  char v50;
  uint64_t v51;
  unint64_t *v52;
  uint64_t j;
  unint64_t v54;
  unint64_t v55;
  unint64_t *v56;
  unint64_t *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t *v63;
  unint64_t v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  unsigned __int8 *v68;
  unsigned __int8 *v69;
  std::__shared_weak_count *v70;
  uint64_t v71;
  unint64_t *v72;
  unint64_t v73;
  std::__shared_weak_count *v74;
  unint64_t *v75;
  unint64_t v76;
  char v77;
  uint64_t v78;
  _DWORD *v79;
  unint64_t k;
  int v81;
  int v82;
  unint64_t v83;
  _DWORD *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  _DWORD *v90;
  _DWORD *v91;
  uint64_t v92;
  std::__shared_weak_count *v93;
  unint64_t *v94;
  unint64_t v95;
  uint64_t **v96;
  char *v97;
  uint64_t **v98;
  char *v99;
  uint64_t **v100;
  char *v101;
  uint64_t **v102;
  char *v103;
  uint64_t **v104;
  char *v105;
  uint64_t **v106;
  char *v107;
  uint64_t **v108;
  char *v109;
  uint64_t **v110;
  char *v111;
  uint64_t **v112;
  char *v113;
  uint64_t **v114;
  char *v115;
  uint64_t **v116;
  char *v117;
  uint64_t **v118;
  char *v119;
  uint64_t **v120;
  char *v121;
  uint64_t **v122;
  char *v123;
  uint64_t **v124;
  char *v125;
  uint64_t **v126;
  char *v127;
  uint64_t **v128;
  char *v129;
  uint64_t **v130;
  char *v131;
  uint64_t **v132;
  char *v133;
  uint64_t **v134;
  char *v135;
  uint64_t **v136;
  char *v137;
  uint64_t **v138;
  char *v139;
  uint64_t **v140;
  char *v141;
  std::__shared_weak_count *v142;
  unint64_t *v143;
  unint64_t v144;
  std::__shared_weak_count *v145;
  unint64_t *v146;
  unint64_t v147;
  std::__shared_weak_count *v148;
  unint64_t *v149;
  unint64_t v150;
  __int128 v151;
  std::__shared_weak_count *v152;
  unint64_t *v153;
  unint64_t v154;
  _QWORD *exception;
  _QWORD *v157;
  _QWORD *v158;
  _QWORD *v159;
  _QWORD *v160;
  _QWORD *v161;
  _QWORD *v162;
  _QWORD *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  void *v167;
  void **v168;
  _OWORD v169[2];
  int v170;
  void *__p[2];
  char v172;
  uint64_t v173;
  std::__shared_weak_count *v174;
  float *v175;
  std::__shared_weak_count *v176;
  float *v177;
  std::__shared_weak_count *v178;

  VNBinModelFilePathFromModelNameAndThrow(CFSTR("faceRegionMap-current"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNModelFilesCache sharedInstance](VNModelFilesCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "load:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v164 = a1;
    v165 = v6;
    v166 = v5;
    v167 = v4;
    v8 = (FILE *)objc_msgSend(v6, "ptrFile");
    v9 = (char *)operator new(0x80uLL);
    *(_OWORD *)(v9 + 8) = 0u;
    *((_QWORD *)v9 + 4) = 0;
    *((_QWORD *)v9 + 3) = v9 + 32;
    v10 = (uint64_t **)(v9 + 24);
    *(_QWORD *)v9 = &off_1E453B4C0;
    *(_OWORD *)(v9 + 40) = 0u;
    v11 = v9 + 48;
    *((_QWORD *)v9 + 13) = 0;
    v168 = (void **)(v9 + 104);
    *(_OWORD *)(v9 + 56) = 0u;
    *((_OWORD *)v9 + 7) = 0u;
    memset(v169, 0, sizeof(v169));
    v170 = 1065353216;
    vision::mod::readBinSerializedModelValues(v8, 0, vision::mod::FaceRegionMap::sModelFileInfo, v169);
    v177 = 0;
    v178 = 0;
    v175 = 0;
    v176 = 0;
    v173 = 0;
    v174 = 0;
    std::string::basic_string[abi:ne180100]<0>(__p, "FaceRegionMap::Width");
    v12 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v169, (unsigned __int8 *)__p);
    if (v12 && *((_DWORD *)v12 + 10) == 2)
    {
      v14 = (float *)*((_QWORD *)v12 + 6);
      v13 = (std::__shared_weak_count *)*((_QWORD *)v12 + 7);
      if (v13)
      {
        p_shared_owners = (unint64_t *)&v13->__shared_owners_;
        do
          v16 = __ldxr(p_shared_owners);
        while (__stxr(v16 + 1, p_shared_owners));
      }
      v177 = v14;
      v178 = v13;
      v17 = 1;
      v18 = *((_QWORD *)v12 + 8);
    }
    else
    {
      v14 = 0;
      v18 = 0;
      v17 = 0;
    }
    if (v172 < 0)
      operator delete(__p[0]);
    if ((v17 & 1) == 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      *exception = 5751;
      __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
    }
    if (v18 != 1)
    {
      v157 = __cxa_allocate_exception(8uLL);
      *v157 = 5751;
      __cxa_throw(v157, MEMORY[0x1E0DE4F28], 0);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "FaceRegionMap::Height");
    v19 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v169, (unsigned __int8 *)__p);
    if (v19 && *((_DWORD *)v19 + 10) == 2)
    {
      v21 = (float *)*((_QWORD *)v19 + 6);
      v20 = (std::__shared_weak_count *)*((_QWORD *)v19 + 7);
      if (v20)
      {
        v22 = (unint64_t *)&v20->__shared_owners_;
        do
          v23 = __ldxr(v22);
        while (__stxr(v23 + 1, v22));
      }
      v175 = v21;
      v176 = v20;
      v24 = 1;
      v25 = *((_QWORD *)v19 + 8);
    }
    else
    {
      v21 = 0;
      v24 = 0;
      v25 = 1;
    }
    if (v172 < 0)
      operator delete(__p[0]);
    if ((v24 & 1) == 0)
    {
      v158 = __cxa_allocate_exception(8uLL);
      *v158 = 5751;
      __cxa_throw(v158, MEMORY[0x1E0DE4F28], 0);
    }
    if (v25 != 1)
    {
      v159 = __cxa_allocate_exception(8uLL);
      *v159 = 5751;
      __cxa_throw(v159, MEMORY[0x1E0DE4F28], 0);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "FaceRegionMap::Data");
    v26 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v169, (unsigned __int8 *)__p);
    if (v26 && *((_DWORD *)v26 + 10) == 2)
    {
      v27 = *((_QWORD *)v26 + 6);
      v28 = (std::__shared_weak_count *)*((_QWORD *)v26 + 7);
      if (v28)
      {
        v29 = (unint64_t *)&v28->__shared_owners_;
        do
          v30 = __ldxr(v29);
        while (__stxr(v30 + 1, v29));
      }
      v173 = v27;
      v174 = v28;
      v31 = 1;
      v32 = *((_QWORD *)v26 + 8);
    }
    else
    {
      v28 = 0;
      v27 = 0;
      v31 = 0;
      v32 = 1;
    }
    if (v172 < 0)
      operator delete(__p[0]);
    if ((v31 & 1) == 0)
    {
      v160 = __cxa_allocate_exception(8uLL);
      *v160 = 5751;
      __cxa_throw(v160, MEMORY[0x1E0DE4F28], 0);
    }
    v33 = roundf(*v14);
    v34 = roundf(*v21);
    if ((float)(v33 * v34) != (float)v32)
    {
      v161 = __cxa_allocate_exception(8uLL);
      *v161 = 5751;
      __cxa_throw(v161, MEMORY[0x1E0DE4F28], 0);
    }
    *((_QWORD *)v9 + 10) = (unint64_t)v34;
    *((_QWORD *)v9 + 11) = (unint64_t)v33;
    *((_QWORD *)v9 + 12) = (unint64_t)v33;
    *((_QWORD *)v9 + 9) = malloc_type_malloc((unint64_t)v34 * (unint64_t)v33, 0x503882BFuLL);
    v35 = *((_QWORD *)v9 + 10);
    if (v35)
    {
      v36 = 0;
      v37 = *((_QWORD *)v9 + 11);
      do
      {
        if (v37)
        {
          for (i = 0; i < v37; ++i)
          {
            *(_BYTE *)(*((_QWORD *)v9 + 9) + v36 * *((_QWORD *)v9 + 12) + i) = llroundf(*(float *)(v27
                                                                                                 + 4 * (i + v36 * v37)));
            v37 = *((_QWORD *)v9 + 11);
          }
          v35 = *((_QWORD *)v9 + 10);
        }
        ++v36;
      }
      while (v35 > v36);
    }
    v173 = 0;
    v174 = 0;
    if (v28)
    {
      v39 = (unint64_t *)&v28->__shared_owners_;
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "FaceRegionMap::Triangles");
    v41 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v169, (unsigned __int8 *)__p);
    if (v41 && (v42 = v41, *((_DWORD *)v41 + 10) == 2))
    {
      v44 = *((_QWORD *)v41 + 6);
      v43 = (std::__shared_weak_count *)*((_QWORD *)v41 + 7);
      if (v43)
      {
        v45 = (unint64_t *)&v43->__shared_owners_;
        do
          v46 = __ldxr(v45);
        while (__stxr(v46 + 1, v45));
      }
      v47 = v174;
      v173 = v44;
      v174 = v43;
      if (v47)
      {
        v48 = (unint64_t *)&v47->__shared_owners_;
        do
          v49 = __ldaxr(v48);
        while (__stlxr(v49 - 1, v48));
        if (!v49)
        {
          ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
          std::__shared_weak_count::__release_weak(v47);
        }
      }
      v32 = *((_QWORD *)v42 + 8);
      v50 = 1;
    }
    else
    {
      v50 = 0;
    }
    if (v172 < 0)
      operator delete(__p[0]);
    if ((v50 & 1) == 0)
    {
      v162 = __cxa_allocate_exception(8uLL);
      *v162 = 5751;
      __cxa_throw(v162, MEMORY[0x1E0DE4F28], 0);
    }
    v51 = v173;
    v52 = (unint64_t *)*((_QWORD *)v9 + 13);
    *((_QWORD *)v9 + 14) = v52;
    if (v32)
    {
      for (j = 0; j != v32; ++j)
      {
        v54 = vcvtas_u32_f32(*(float *)(v51 + 4 * j));
        v55 = *((_QWORD *)v9 + 15);
        if ((unint64_t)v52 >= v55)
        {
          v57 = (unint64_t *)*v168;
          v58 = ((char *)v52 - (_BYTE *)*v168) >> 3;
          v59 = v58 + 1;
          if ((unint64_t)(v58 + 1) >> 61)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          v60 = v55 - (_QWORD)v57;
          if (v60 >> 2 > v59)
            v59 = v60 >> 2;
          if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF8)
            v61 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v61 = v59;
          if (v61)
          {
            v61 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v61);
            v57 = (unint64_t *)*((_QWORD *)v9 + 13);
            v52 = (unint64_t *)*((_QWORD *)v9 + 14);
          }
          else
          {
            v62 = 0;
          }
          v63 = (unint64_t *)(v61 + 8 * v58);
          *v63 = v54;
          v56 = v63 + 1;
          while (v52 != v57)
          {
            v64 = *--v52;
            *--v63 = v64;
          }
          *((_QWORD *)v9 + 13) = v63;
          *((_QWORD *)v9 + 14) = v56;
          *((_QWORD *)v9 + 15) = v61 + 8 * v62;
          if (v57)
            operator delete(v57);
        }
        else
        {
          *v52 = v54;
          v56 = v52 + 1;
        }
        *((_QWORD *)v9 + 14) = v56;
        v52 = v56;
      }
    }
    v65 = v174;
    v173 = 0;
    v174 = 0;
    if (v65)
    {
      v66 = (unint64_t *)&v65->__shared_owners_;
      do
        v67 = __ldaxr(v66);
      while (__stlxr(v67 - 1, v66));
      if (!v67)
      {
        ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
        std::__shared_weak_count::__release_weak(v65);
      }
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "FaceRegionMap::NormalizedLandmarks");
    v68 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v169, (unsigned __int8 *)__p);
    if (v68 && (v69 = v68, *((_DWORD *)v68 + 10) == 2))
    {
      v71 = *((_QWORD *)v68 + 6);
      v70 = (std::__shared_weak_count *)*((_QWORD *)v68 + 7);
      if (v70)
      {
        v72 = (unint64_t *)&v70->__shared_owners_;
        do
          v73 = __ldxr(v72);
        while (__stxr(v73 + 1, v72));
      }
      v74 = v174;
      v173 = v71;
      v174 = v70;
      if (v74)
      {
        v75 = (unint64_t *)&v74->__shared_owners_;
        do
          v76 = __ldaxr(v75);
        while (__stlxr(v76 - 1, v75));
        if (!v76)
        {
          ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
          std::__shared_weak_count::__release_weak(v74);
        }
      }
      v32 = *((_QWORD *)v69 + 8);
      v77 = 1;
    }
    else
    {
      v77 = 0;
    }
    if (v172 < 0)
      operator delete(__p[0]);
    if ((v77 & 1) == 0)
    {
      v163 = __cxa_allocate_exception(8uLL);
      *v163 = 5751;
      __cxa_throw(v163, MEMORY[0x1E0DE4F28], 0);
    }
    v78 = v173;
    v79 = (_DWORD *)*((_QWORD *)v9 + 6);
    *((_QWORD *)v9 + 7) = v79;
    if (v32)
    {
      for (k = 0; k < v32; k += 2)
      {
        v81 = *(_DWORD *)(v78 + 4 * k);
        v82 = *(_DWORD *)(v78 + ((4 * k) | 4));
        v83 = *((_QWORD *)v9 + 8);
        if ((unint64_t)v79 >= v83)
        {
          v84 = (_DWORD *)*v11;
          v85 = ((uint64_t)v79 - *v11) >> 3;
          v86 = v85 + 1;
          if ((unint64_t)(v85 + 1) >> 61)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          v87 = v83 - (_QWORD)v84;
          if (v87 >> 2 > v86)
            v86 = v87 >> 2;
          if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFF8)
            v88 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v88 = v86;
          if (v88)
          {
            v88 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v88);
            v84 = (_DWORD *)*((_QWORD *)v9 + 6);
            v79 = (_DWORD *)*((_QWORD *)v9 + 7);
          }
          else
          {
            v89 = 0;
          }
          v90 = (_DWORD *)(v88 + 8 * v85);
          *v90 = v81;
          v90[1] = v82;
          v91 = v90;
          if (v79 != v84)
          {
            do
            {
              v92 = *((_QWORD *)v79 - 1);
              v79 -= 2;
              *((_QWORD *)v91 - 1) = v92;
              v91 -= 2;
            }
            while (v79 != v84);
            v84 = (_DWORD *)*v11;
          }
          v79 = v90 + 2;
          *((_QWORD *)v9 + 6) = v91;
          *((_QWORD *)v9 + 7) = v90 + 2;
          *((_QWORD *)v9 + 8) = v88 + 8 * v89;
          if (v84)
            operator delete(v84);
        }
        else
        {
          *v79 = v81;
          v79[1] = v82;
          v79 += 2;
        }
        *((_QWORD *)v9 + 7) = v79;
      }
    }
    FaceRegionMap_addForeheadLandmarks((uint64_t)v11);
    v93 = v174;
    v173 = 0;
    v174 = 0;
    if (v93)
    {
      v94 = (unint64_t *)&v93->__shared_owners_;
      do
        v95 = __ldaxr(v94);
      while (__stlxr(v95 - 1, v94));
      if (!v95)
      {
        ((void (*)(std::__shared_weak_count *))v93->__on_zero_shared)(v93);
        std::__shared_weak_count::__release_weak(v93);
      }
    }
    LOBYTE(__p[0]) = 0;
    v96 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0, __p);
    if (*((char *)v96 + 63) < 0)
    {
      v96[6] = (uint64_t *)10;
      v97 = (char *)v96[5];
    }
    else
    {
      v97 = (char *)(v96 + 5);
      *((_BYTE *)v96 + 63) = 10;
    }
    strcpy(v97, "Background");
    LOBYTE(__p[0]) = 10;
    v98 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xAu, __p);
    if (*((char *)v98 + 63) < 0)
    {
      v98[6] = (uint64_t *)8;
      v99 = (char *)v98[5];
    }
    else
    {
      v99 = (char *)(v98 + 5);
      *((_BYTE *)v98 + 63) = 8;
    }
    strcpy(v99, "Left eye");
    LOBYTE(__p[0]) = 20;
    v100 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x14u, __p);
    if (*((char *)v100 + 63) < 0)
    {
      v100[6] = (uint64_t *)9;
      v101 = (char *)v100[5];
    }
    else
    {
      v101 = (char *)(v100 + 5);
      *((_BYTE *)v100 + 63) = 9;
    }
    strcpy(v101, "Right eye");
    LOBYTE(__p[0]) = 30;
    v102 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x1Eu, __p);
    if (*((char *)v102 + 63) < 0)
    {
      v102[6] = (uint64_t *)12;
      v103 = (char *)v102[5];
    }
    else
    {
      v103 = (char *)(v102 + 5);
      *((_BYTE *)v102 + 63) = 12;
    }
    strcpy(v103, "Left eyebrow");
    LOBYTE(__p[0]) = 40;
    v104 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x28u, __p);
    if (*((char *)v104 + 63) < 0)
    {
      v104[6] = (uint64_t *)13;
      v105 = (char *)v104[5];
    }
    else
    {
      v105 = (char *)(v104 + 5);
      *((_BYTE *)v104 + 63) = 13;
    }
    strcpy(v105, "Right eyebrow");
    LOBYTE(__p[0]) = 50;
    v106 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x32u, __p);
    if (*((char *)v106 + 63) < 0)
    {
      v106[6] = (uint64_t *)12;
      v107 = (char *)v106[5];
    }
    else
    {
      v107 = (char *)(v106 + 5);
      *((_BYTE *)v106 + 63) = 12;
    }
    strcpy(v107, "Root of nose");
    LOBYTE(__p[0]) = 60;
    v108 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x3Cu, __p);
    if (*((char *)v108 + 63) < 0)
    {
      v108[6] = (uint64_t *)4;
      v109 = (char *)v108[5];
    }
    else
    {
      v109 = (char *)(v108 + 5);
      *((_BYTE *)v108 + 63) = 4;
    }
    strcpy(v109, "Nose");
    LOBYTE(__p[0]) = 70;
    v110 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x46u, __p);
    if (*((char *)v110 + 63) < 0)
    {
      v110[6] = (uint64_t *)4;
      v111 = (char *)v110[5];
    }
    else
    {
      v111 = (char *)(v110 + 5);
      *((_BYTE *)v110 + 63) = 4;
    }
    strcpy(v111, "Chin");
    LOBYTE(__p[0]) = 80;
    v112 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x50u, __p);
    if (*((char *)v112 + 63) < 0)
    {
      v112[6] = (uint64_t *)16;
      v113 = (char *)v112[5];
    }
    else
    {
      v113 = (char *)(v112 + 5);
      *((_BYTE *)v112 + 63) = 16;
    }
    strcpy(v113, "Lower left cheek");
    LOBYTE(__p[0]) = 90;
    v114 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x5Au, __p);
    if (*((char *)v114 + 63) < 0)
    {
      v114[6] = (uint64_t *)17;
      v115 = (char *)v114[5];
    }
    else
    {
      v115 = (char *)(v114 + 5);
      *((_BYTE *)v114 + 63) = 17;
    }
    strcpy(v115, "Lower right cheek");
    LOBYTE(__p[0]) = 100;
    v116 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x64u, __p);
    if (*((char *)v116 + 63) < 0)
    {
      v116[6] = (uint64_t *)22;
      v117 = (char *)v116[5];
    }
    else
    {
      v117 = (char *)(v116 + 5);
      *((_BYTE *)v116 + 63) = 22;
    }
    strcpy(v117, "Between mouth and nose");
    LOBYTE(__p[0]) = 110;
    v118 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x6Eu, __p);
    if (*((char *)v118 + 63) < 0)
    {
      v118[6] = (uint64_t *)10;
      v119 = (char *)v118[5];
    }
    else
    {
      v119 = (char *)(v118 + 5);
      *((_BYTE *)v118 + 63) = 10;
    }
    strcpy(v119, "Left cheek");
    LOBYTE(__p[0]) = 120;
    v120 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x78u, __p);
    if (*((char *)v120 + 63) < 0)
    {
      v120[6] = (uint64_t *)11;
      v121 = (char *)v120[5];
    }
    else
    {
      v121 = (char *)(v120 + 5);
      *((_BYTE *)v120 + 63) = 11;
    }
    strcpy(v121, "Right cheek");
    LOBYTE(__p[0]) = -126;
    v122 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x82u, __p);
    if (*((char *)v122 + 63) < 0)
    {
      v122[6] = (uint64_t *)11;
      v123 = (char *)v122[5];
    }
    else
    {
      v123 = (char *)(v122 + 5);
      *((_BYTE *)v122 + 63) = 11;
    }
    strcpy(v123, "Left temple");
    LOBYTE(__p[0]) = -116;
    v124 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x8Cu, __p);
    if (*((char *)v124 + 63) < 0)
    {
      v124[6] = (uint64_t *)12;
      v125 = (char *)v124[5];
    }
    else
    {
      v125 = (char *)(v124 + 5);
      *((_BYTE *)v124 + 63) = 12;
    }
    strcpy(v125, "Right temple");
    LOBYTE(__p[0]) = -106;
    v126 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x96u, __p);
    if (*((char *)v126 + 63) < 0)
    {
      v126[6] = (uint64_t *)16;
      v127 = (char *)v126[5];
    }
    else
    {
      v127 = (char *)(v126 + 5);
      *((_BYTE *)v126 + 63) = 16;
    }
    strcpy(v127, "Between eyebrows");
    LOBYTE(__p[0]) = -96;
    v128 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xA0u, __p);
    if (*((char *)v128 + 63) < 0)
    {
      v128[6] = (uint64_t *)14;
      v129 = (char *)v128[5];
    }
    else
    {
      v129 = (char *)(v128 + 5);
      *((_BYTE *)v128 + 63) = 14;
    }
    strcpy(v129, "Above left eye");
    LOBYTE(__p[0]) = -86;
    v130 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xAAu, __p);
    if (*((char *)v130 + 63) < 0)
    {
      v130[6] = (uint64_t *)15;
      v131 = (char *)v130[5];
    }
    else
    {
      v131 = (char *)(v130 + 5);
      *((_BYTE *)v130 + 63) = 15;
    }
    strcpy(v131, "Above right eye");
    LOBYTE(__p[0]) = -76;
    v132 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xB4u, __p);
    if (*((char *)v132 + 63) < 0)
    {
      v132[6] = (uint64_t *)9;
      v133 = (char *)v132[5];
    }
    else
    {
      v133 = (char *)(v132 + 5);
      *((_BYTE *)v132 + 63) = 9;
    }
    strcpy(v133, "Upper lip");
    LOBYTE(__p[0]) = -66;
    v134 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xBEu, __p);
    if (*((char *)v134 + 63) < 0)
    {
      v134[6] = (uint64_t *)9;
      v135 = (char *)v134[5];
    }
    else
    {
      v135 = (char *)(v134 + 5);
      *((_BYTE *)v134 + 63) = 9;
    }
    strcpy(v135, "Lower lip");
    LOBYTE(__p[0]) = -56;
    v136 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xC8u, __p);
    if (*((char *)v136 + 63) < 0)
    {
      v136[6] = (uint64_t *)12;
      v137 = (char *)v136[5];
    }
    else
    {
      v137 = (char *)(v136 + 5);
      *((_BYTE *)v136 + 63) = 12;
    }
    strcpy(v137, "Between lips");
    LOBYTE(__p[0]) = -46;
    v138 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xD2u, __p);
    if (*((char *)v138 + 63) < 0)
    {
      v138[6] = (uint64_t *)8;
      v139 = (char *)v138[5];
    }
    else
    {
      v139 = (char *)(v138 + 5);
      *((_BYTE *)v138 + 63) = 8;
    }
    strcpy(v139, "Forehead");
    LOBYTE(__p[0]) = -36;
    v140 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xDCu, __p);
    if (*((char *)v140 + 63) < 0)
    {
      v140[6] = (uint64_t *)11;
      v141 = (char *)v140[5];
    }
    else
    {
      v141 = (char *)(v140 + 5);
      *((_BYTE *)v140 + 63) = 11;
    }
    strcpy(v141, "Tip of nose");
    v142 = v174;
    if (v174)
    {
      v143 = (unint64_t *)&v174->__shared_owners_;
      do
        v144 = __ldaxr(v143);
      while (__stlxr(v144 - 1, v143));
      if (!v144)
      {
        ((void (*)(std::__shared_weak_count *))v142->__on_zero_shared)(v142);
        std::__shared_weak_count::__release_weak(v142);
      }
    }
    v145 = v176;
    if (v176)
    {
      v146 = (unint64_t *)&v176->__shared_owners_;
      do
        v147 = __ldaxr(v146);
      while (__stlxr(v147 - 1, v146));
      if (!v147)
      {
        ((void (*)(std::__shared_weak_count *))v145->__on_zero_shared)(v145);
        std::__shared_weak_count::__release_weak(v145);
      }
    }
    v148 = v178;
    if (v178)
    {
      v149 = (unint64_t *)&v178->__shared_owners_;
      do
        v150 = __ldaxr(v149);
      while (__stlxr(v150 - 1, v149));
      if (!v150)
      {
        ((void (*)(std::__shared_weak_count *))v148->__on_zero_shared)(v148);
        std::__shared_weak_count::__release_weak(v148);
      }
    }
    std::__hash_table<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>>>::~__hash_table((uint64_t)v169);
    *(_QWORD *)&v151 = v9 + 24;
    *((_QWORD *)&v151 + 1) = v9;
    v7 = v165;
    v152 = *(std::__shared_weak_count **)(*(_QWORD *)(v164 + 32) + 64);
    *(_OWORD *)(*(_QWORD *)(v164 + 32) + 56) = v151;
    v5 = v166;
    v4 = v167;
    if (v152)
    {
      v153 = (unint64_t *)&v152->__shared_owners_;
      do
        v154 = __ldaxr(v153);
      while (__stlxr(v154 - 1, v153));
      if (!v154)
      {
        ((void (*)(std::__shared_weak_count *))v152->__on_zero_shared)(v152);
        std::__shared_weak_count::__release_weak(v152);
      }
    }
  }
  else if (a2)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("Could not read face region map model data"));
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 != 0;
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

@end
