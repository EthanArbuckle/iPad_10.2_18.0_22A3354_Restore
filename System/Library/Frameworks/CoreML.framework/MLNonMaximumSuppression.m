@implementation MLNonMaximumSuppression

- (MLNonMaximumSuppression)initWithParameters:(id)a3 modelDescription:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v10;
  MLNonMaximumSuppression *v11;
  MLNonMaximumSuppression *v12;
  objc_super v14;

  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MLNonMaximumSuppression;
  v11 = -[MLModelEngine initWithDescription:configuration:](&v14, sel_initWithDescription_configuration_, a4, a5);
  v12 = v11;
  if (v11)
    objc_storeStrong((id *)&v11->_parameters, a3);

  return v12;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  MLNonMaximumSuppressionParameters *parameters;
  unint64_t v24;
  uint64_t v25;
  MLMultiArray *v26;
  MLNonMaximumSuppressionParameters *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (**v32)(_QWORD);
  MLMultiArray *v33;
  MLMultiArray *v34;
  void *v35;
  void (**v36)(_QWORD);
  MLMultiArray *v37;
  void *v38;
  MLMultiArray *v39;
  MLNonMaximumSuppressionParameters *v40;
  unint64_t v41;
  uint64_t v42;
  MLNonMaximumSuppressionParameters *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  void (**v50)(_QWORD);
  MLMultiArray *v51;
  void *v52;
  uint64_t v53;
  void (**v54)(_QWORD);
  MLMultiArray *v55;
  void *v56;
  MLMultiArray *v57;
  void *v58;
  void *v59;
  MLDictionaryFeatureProvider *v60;
  char *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  void *v66;
  vDSP_Length v67;
  _BOOL4 v68;
  unint64_t v69;
  uint64_t v70;
  const double *v71;
  unint64_t v72;
  double *v73;
  char *v74;
  double *v75;
  unint64_t v76;
  double v77;
  void *v78;
  void *v79;
  char *v80;
  void *v81;
  void *v82;
  unint64_t v83;
  void *v84;
  void *v85;
  vDSP_Length v86;
  _BOOL4 v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const float *v91;
  unint64_t v92;
  float *v93;
  char *v94;
  double *v95;
  unint64_t v96;
  float v97;
  char *v98;
  void *v99;
  void *v100;
  char *v101;
  uint64_t v102;
  unint64_t v103;
  double *v104;
  char *v105;
  char *v106;
  __int128 v107;
  char *v108;
  uint64_t v109;
  unint64_t v110;
  double *v111;
  vDSP_Length *v112;
  vDSP_Length i;
  unint64_t v114;
  unint64_t v115;
  char *v116;
  char *v117;
  unint64_t v123;
  vDSP_Length v124;
  vDSP_Length v125;
  uint64_t v126;
  vDSP_Length *v127;
  _QWORD *v128;
  unint64_t v129;
  char *v130;
  vDSP_Length v131;
  uint64_t v132;
  uint64_t v133;
  float64x2_t *v134;
  float64x2_t *v135;
  float64x2_t v136;
  float64x2_t v137;
  float64x2_t v138;
  float64x2_t v139;
  float64x2_t v140;
  uint64_t v141;
  MLMultiArray *v142;
  vDSP_Length *v143;
  vDSP_Length *v144;
  void *v145;
  MLMultiArray *v146;
  char *v147;
  void *v148;
  MLMultiArray *v149;
  MLMultiArray *v150;
  char *v151;
  MLMultiArray *v152;
  char *v153;
  void *v154;
  void *v155;
  unint64_t v156;
  MLDictionaryFeatureProvider *v157;
  void *v158;
  void *v159;
  void *v160;
  vDSP_Length *v161;
  vDSP_Length j;
  unint64_t v163;
  unint64_t v164;
  char *v165;
  char *v166;
  unint64_t v167;
  vDSP_Length v168;
  vDSP_Length v169;
  uint64_t v170;
  vDSP_Length *v171;
  _QWORD *v172;
  unint64_t v173;
  char *v174;
  vDSP_Length v175;
  uint64_t v176;
  uint64_t v177;
  float32x2_t *v178;
  float32x2_t *v179;
  float32x2_t v180;
  float32x2_t v181;
  float32x2_t v182;
  float32x2_t v183;
  float32x2_t v184;
  uint64_t v185;
  MLMultiArray *v186;
  vDSP_Length *v187;
  vDSP_Length *v188;
  void *v189;
  MLMultiArray *v190;
  MLMultiArray *v191;
  char *v192;
  void *v193;
  MLMultiArray *v194;
  char *v195;
  MLMultiArray *v196;
  char *v197;
  void *v198;
  void *v199;
  char *v200;
  MLDictionaryFeatureProvider *v201;
  void *v202;
  void *v203;
  void *v204;
  char *__p;
  uint64_t v207;
  double *v208;
  void (**v209)(_QWORD);
  char *v210;
  void (**v211)(_QWORD);
  MLMultiArray *v212;
  double *__A;
  double *__Aa;
  double *__Ab;
  float *v216;
  float *v217;
  float *v218;
  MLMultiArray *v219;
  MLMultiArray *v220;
  id v221;
  MLNonMaximumSuppressionParameters *v222;
  id v223;
  void *v224;
  void *v225;
  void *v227;
  void *v228;
  id v229;
  MLNonMaximumSuppressionParameters *v230;
  id v231[2];
  MLMultiArray *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t (*v235)();
  void *v236;
  unint64_t v237;
  uint64_t v238;
  void *v239;
  void *v240;
  uint64_t v241;
  void *__src;
  uint64_t v243;
  uint64_t v244;
  char *v245;
  char *v246;
  uint64_t v247;
  char *v248;
  char *v249;
  uint64_t v250;
  void *v251;
  void *v252;
  double *__C;
  double *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t (*v257)();
  void *v258;
  unint64_t v259;
  uint64_t aBlock;
  uint64_t v261;
  uint64_t (*v262)();
  void *v263;
  unint64_t v264;
  void *v265;
  void *v266;
  double *v267;
  MLMultiArray *v268;
  char *v269;
  void *v270;
  vDSP_Length *v271;
  vDSP_Length *v272;
  uint64_t v273;

  v273 = *MEMORY[0x1E0C80C00];
  v229 = a3;
  v221 = a4;
  -[MLNonMaximumSuppressionParameters iouThreshold](self->_parameters, "iouThreshold");
  v8 = v7;
  -[MLNonMaximumSuppressionParameters confidenceThreshold](self->_parameters, "confidenceThreshold");
  v10 = v9;
  -[MLNonMaximumSuppressionParameters iouThresholdInputFeatureName](self->_parameters, "iouThresholdInputFeatureName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[MLNonMaximumSuppressionParameters iouThresholdInputFeatureName](self->_parameters, "iouThresholdInputFeatureName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v229, "featureValueForName:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "doubleValue");
      v8 = v15;
    }

  }
  -[MLNonMaximumSuppressionParameters confidenceThresholdInputFeatureName](self->_parameters, "confidenceThresholdInputFeatureName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    -[MLNonMaximumSuppressionParameters confidenceThresholdInputFeatureName](self->_parameters, "confidenceThresholdInputFeatureName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v229, "featureValueForName:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "doubleValue");
      v10 = v20;
    }

  }
  -[MLNonMaximumSuppressionParameters confidenceInputFeatureName](self->_parameters, "confidenceInputFeatureName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "featureValueForName:", v21);
  v225 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLNonMaximumSuppressionParameters coordinatesInputFeatureName](self->_parameters, "coordinatesInputFeatureName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "featureValueForName:", v22);
  v224 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v225, "multiArrayValue");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "multiArrayValue");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v228, "dataType") == 65600 && objc_msgSend(v227, "dataType") == 65600)
  {
    parameters = self->_parameters;
    v24 = -[MLModelEngine signpostID](self, "signpostID");
    v25 = objc_msgSend(v221, "parentSignpostID");
    v26 = v228;
    v216 = v227;
    v27 = parameters;
    v222 = v27;
    if (-[MLNonMaximumSuppressionParameters numClasses](v27, "numClasses"))
    {
      -[MLMultiArray shape](v26, "shape");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "unsignedLongValue");
      v31 = -[MLNonMaximumSuppressionParameters numClasses](v27, "numClasses");

      if (v30 != v31)
      {
        v220 = v26;
        if (a5)
        {
          -[MLMultiArray shape](v26, "shape");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "objectAtIndexedSubscript:", 1);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Dimension 1 of input confidence (%@) is not consistent with the number of classes (%lu)"), v79, -[MLNonMaximumSuppressionParameters numClasses](v27, "numClasses"));
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v60 = 0;
LABEL_147:

        goto LABEL_198;
      }
    }
    if (-[MLMultiArray isContiguousInOrder:](v26, "isContiguousInOrder:", 1))
    {
      kdebug_trace();
      aBlock = MEMORY[0x1E0C809B0];
      v261 = 3221225472;
      v262 = ___ZL10performNMSIddEP27MLDictionaryFeatureProviderP12MLMultiArrayS3_ddP33MLNonMaximumSuppressionParametersyyPU15__autoreleasingP7NSError_block_invoke;
      v263 = &__block_descriptor_40_e5_v8__0l;
      v264 = v24;
      v32 = (void (**)(_QWORD))_Block_copy(&aBlock);
      v33 = v26;
      v34 = [MLMultiArray alloc];
      -[MLMultiArray shape](v26, "shape");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[MLMultiArray initWithShape:dataType:storageOrder:error:](v34, "initWithShape:dataType:storageOrder:error:", v35, -[MLMultiArray dataType](v26, "dataType"), 0, a5);

      -[MLMultiArray vectorizeIntoMultiArray:storageOrder:error:](v33, "vectorizeIntoMultiArray:storageOrder:error:", v26, 0, a5);
      v32[2](v32);

    }
    if (objc_msgSend(v216, "isContiguousInOrder:", 1))
    {
      kdebug_trace();
      v255 = MEMORY[0x1E0C809B0];
      v256 = 3221225472;
      v257 = ___ZL10performNMSIddEP27MLDictionaryFeatureProviderP12MLMultiArrayS3_ddP33MLNonMaximumSuppressionParametersyyPU15__autoreleasingP7NSError_block_invoke_2;
      v258 = &__block_descriptor_40_e5_v8__0l;
      v259 = v24;
      v36 = (void (**)(_QWORD))_Block_copy(&v255);
      v37 = [MLMultiArray alloc];
      objc_msgSend(v216, "shape");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[MLMultiArray initWithShape:dataType:storageOrder:error:](v37, "initWithShape:dataType:storageOrder:error:", v38, objc_msgSend(v216, "dataType"), 0, a5);

      objc_msgSend(v216, "vectorizeIntoMultiArray:storageOrder:error:", v39, 0, a5);
      v36[2](v36);

    }
    else
    {
      v39 = (MLMultiArray *)v216;
    }
    v220 = objc_retainAutorelease(v26);
    __Aa = -[MLMultiArray bytes](v220, "bytes");
    v216 = objc_retainAutorelease(v39);
    v61 = (char *)objc_msgSend(v216, "bytes");
    -[MLMultiArray shape](v220, "shape");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "unsignedLongValue");

    -[MLMultiArray shape](v220, "shape");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectAtIndexedSubscript:", 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "unsignedLongValue");

    v68 = -[MLNonMaximumSuppressionParameters perClass](v27, "perClass");
    std::vector<double>::vector(&__C, v64);
    if (v68)
      v69 = v64;
    else
      v69 = 0;
    std::vector<unsigned long>::vector(&v251, v69);
    v248 = 0;
    v249 = 0;
    v250 = 0;
    v245 = 0;
    v246 = 0;
    v247 = 0;
    __src = 0;
    v243 = 0;
    v244 = 0;
    v239 = 0;
    v240 = 0;
    v241 = 0;
    kdebug_trace();
    v233 = MEMORY[0x1E0C809B0];
    v234 = 3221225472;
    v235 = ___ZL10performNMSIddEP27MLDictionaryFeatureProviderP12MLMultiArrayS3_ddP33MLNonMaximumSuppressionParametersyyPU15__autoreleasingP7NSError_block_invoke_3;
    v236 = &__block_descriptor_48_e5_v8__0l;
    v237 = v24;
    v238 = v25;
    v209 = (void (**)(_QWORD))_Block_copy(&v233);
    if (v64)
    {
      v70 = 0;
      v71 = __Aa;
      v72 = v64;
      do
      {
        v73 = &__C[v70];
        if (v68)
          vDSP_maxviD(v71, 1, v73, (vDSP_Length *)((char *)v251 + v70 * 8), v67);
        else
          vDSP_maxvD(v71, 1, v73, v67);
        ++v70;
        v71 += v67;
        --v72;
      }
      while (v72);
      if (v10 <= 0.0)
      {
LABEL_65:
        v74 = 0;
        v98 = 0;
LABEL_100:
        v271 = 0;
        std::vector<double>::resize((char **)&__src, v64 * v67, &v271);
        v271 = 0;
        std::vector<double>::resize((char **)&v239, 4 * v64, &v271);
        std::vector<unsigned long>::vector(&v271, v64);
        v112 = v271;
        if (v64)
        {
          for (i = 0; i != v64; ++i)
            v112[i] = i;
        }
        vDSP_vsortiD(__C, v112, 0, v64, -1);
        LOBYTE(v267) = 0;
        std::vector<BOOL>::vector(&v269, v64, (unsigned __int8 *)&v267);
        __p = v98;
        v207 = 8 * v67;
        if (v64)
        {
          v114 = 0;
          v115 = 0;
          v116 = (char *)__src;
          v117 = (char *)v239;
          __asm { FMOV            V0.2D, #0.5 }
          *(_OWORD *)v231 = _Q0;
          while (1)
          {
            if (((*(_QWORD *)&v269[(v114 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v114) & 1) != 0)
            {
              v123 = v114 + 1;
            }
            else
            {
              if ((-[MLNonMaximumSuppressionParameters maxBoxes](v222, "maxBoxes") & 0x8000000000000000) == 0
                && v115 >= -[MLNonMaximumSuppressionParameters maxBoxes](v222, "maxBoxes"))
              {
                goto LABEL_127;
              }
              v124 = v271[v114];
              v125 = v67 + v124 * v67;
              if (v125 != v124 * v67)
              {
                memmove(&v116[8 * v115 * v67], &__Aa[v124 * v67], 8 * v125 - 8 * v124 * v67);
                v124 = v271[v114];
              }
              memmove(&v117[32 * v115], &v61[32 * v124], 0x20uLL);
              if (v68)
                v126 = *((_QWORD *)v251 + v271[v114]);
              else
                v126 = 0;
              ++v115;
              v123 = v114 + 1;
              if (v114 + 1 < v64)
              {
                v127 = v271;
                v128 = v251;
                v129 = v114 + 1;
                v130 = v269;
                do
                {
                  v131 = v127[v129];
                  if (v68)
                    v132 = v128[v131];
                  else
                    v132 = 0;
                  v133 = *(_QWORD *)&v130[8 * (v129 >> 6)];
                  if ((v133 & (1 << v129)) == 0 && v126 == v132)
                  {
                    v134 = (float64x2_t *)&v61[32 * v127[v114]];
                    v135 = (float64x2_t *)&v61[32 * v131];
                    v136 = vmaxnmq_f64(v134[1], (float64x2_t)0);
                    v137 = vsubq_f64(*v134, vmulq_f64(v136, *(float64x2_t *)v231));
                    v138 = vmaxnmq_f64(v135[1], (float64x2_t)0);
                    v139 = vsubq_f64(*v135, vmulq_f64(v138, *(float64x2_t *)v231));
                    v140 = vmaxnmq_f64(vsubq_f64(vminnmq_f64(vaddq_f64(v136, v137), vaddq_f64(v138, v139)), vmaxnmq_f64(v137, v139)), (float64x2_t)0);
                    v140.f64[0] = vmulq_laneq_f64(v140, v140, 1).f64[0];
                    if (v140.f64[0]
                       / (vmlad_n_f64(vmulq_laneq_f64(v138, v138, 1).f64[0], v136.f64[1], v136.f64[0])
                        - v140.f64[0]
                        + 0.00001) > v8)
                      *(_QWORD *)&v130[8 * (v129 >> 6)] = v133 | (1 << v129);
                  }
                  ++v129;
                }
                while (v64 != v129);
              }
            }
            v114 = v123;
            if (v123 == v64)
              goto LABEL_127;
          }
        }
        v115 = 0;
LABEL_127:
        if (v269)
          operator delete(v269);
        if (v271)
        {
          v272 = v271;
          operator delete(v271);
        }
        v209[2](v209);

        v141 = v115;
        if (v115 <= -[MLNonMaximumSuppressionParameters minBoxes](v222, "minBoxes"))
          v141 = -[MLNonMaximumSuppressionParameters minBoxes](v222, "minBoxes");
        v142 = [MLMultiArray alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v141);
        v143 = (vDSP_Length *)objc_claimAutoreleasedReturnValue();
        v271 = v143;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v67);
        v144 = (vDSP_Length *)objc_claimAutoreleasedReturnValue();
        v272 = v144;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v271, 2);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v232 = -[MLMultiArray initWithShape:dataType:error:](v142, "initWithShape:dataType:error:", v145, -[MLMultiArray dataType](v220, "dataType"), a5);

        v146 = [MLMultiArray alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v141);
        v147 = (char *)objc_claimAutoreleasedReturnValue();
        v269 = v147;
        v270 = &unk_1E3DA24D0;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v269, 2);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = -[MLMultiArray initWithShape:dataType:error:](v146, "initWithShape:dataType:error:", v148, objc_msgSend(v216, "dataType"), a5);

        v150 = objc_retainAutorelease(v232);
        v151 = -[MLMultiArray mutableBytes](v150, "mutableBytes");
        v152 = objc_retainAutorelease(v149);
        __Ab = (double *)v150;
        v153 = -[MLMultiArray mutableBytes](v152, "mutableBytes");
        kdebug_trace();
        v154 = __src;
        memcpy(v151, __src, v115 * v207);
        v155 = v239;
        memcpy(v153, v239, 32 * v115);
        v156 = v141 - v115;
        if (v156)
        {
          bzero(&v151[8 * v115 * v67], v156 * v207);
          bzero(&v153[32 * v115], 32 * v156);
        }
        kdebug_trace();
        v157 = [MLDictionaryFeatureProvider alloc];
        -[MLNonMaximumSuppressionParameters confidenceOutputFeatureName](v222, "confidenceOutputFeatureName");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v265 = v158;
        v267 = __Ab;
        -[MLNonMaximumSuppressionParameters coordinatesOutputFeatureName](v222, "coordinatesOutputFeatureName");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v266 = v159;
        v268 = v152;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v267, &v265, 2);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v157, "initWithDictionary:error:", v160, a5);

        if (v155)
        {
          v240 = v155;
          operator delete(v155);
        }
        v27 = v222;
        if (v154)
          operator delete(v154);
        if (__p)
        {
          v246 = __p;
          operator delete(__p);
          v74 = v248;
        }
        if (v74)
        {
          v249 = v74;
          operator delete(v74);
        }
        if (v251)
        {
          v252 = v251;
          operator delete(v251);
        }
        if (__C)
        {
          v254 = __C;
          operator delete(__C);
        }
        goto LABEL_147;
      }
      v74 = 0;
      v75 = __C;
      v76 = v64;
      do
      {
        v77 = *v75++;
        if (v77 >= v10)
          ++v74;
        --v76;
      }
      while (v76);
    }
    else
    {
      v74 = 0;
      if (v10 <= 0.0)
      {
        v98 = 0;
        v64 = 0;
        goto LABEL_100;
      }
    }
    if (v74 != (char *)v64)
    {
      std::vector<double>::resize(&v248, v67 * v64);
      std::vector<double>::resize(&v245, 4 * v64);
      v74 = v248;
      v98 = v245;
      if (v64)
      {
        v102 = 0;
        v103 = 0;
        v104 = __C;
        do
        {
          if (v104[v102] >= v10)
          {
            if ((v102 + 1) * v67 != v102 * v67)
            {
              memmove(&v74[8 * v103 * v67], &__Aa[v102 * v67], 8 * v67);
              v104 = __C;
            }
            v105 = &v61[32 * v102];
            v106 = &v98[32 * v103];
            v107 = *((_OWORD *)v105 + 1);
            *(_OWORD *)v106 = *(_OWORD *)v105;
            *((_OWORD *)v106 + 1) = v107;
            v104[v103] = v104[v102];
            if (v68)
              *((_QWORD *)v251 + v103) = *((_QWORD *)v251 + v102);
            ++v103;
            ++v102;
          }
          else
          {
            ++v102;
          }
        }
        while (v102 != v64);
        v74 = v248;
        v98 = v245;
        v61 = v245;
        v64 = v103;
      }
      else
      {
        v61 = v245;
      }
      __Aa = (double *)v74;
      goto LABEL_100;
    }
    goto LABEL_65;
  }
  if (objc_msgSend(v228, "dataType") == 65568 && objc_msgSend(v227, "dataType") == 65568)
  {
    v40 = self->_parameters;
    v41 = -[MLModelEngine signpostID](self, "signpostID");
    v42 = objc_msgSend(v221, "parentSignpostID");
    v223 = v228;
    v219 = v227;
    v43 = v40;
    v230 = v43;
    if (-[MLNonMaximumSuppressionParameters numClasses](v43, "numClasses"))
    {
      objc_msgSend(v223, "shape");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectAtIndexedSubscript:", 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "unsignedLongValue");
      v47 = -[MLNonMaximumSuppressionParameters numClasses](v43, "numClasses");

      if (v46 != v47)
      {
        if (a5)
        {
          objc_msgSend(v223, "shape");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "objectAtIndexedSubscript:", 1);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Dimension 1 of input confidence (%@) is not consistent with the number of classes (%lu)"), v100, -[MLNonMaximumSuppressionParameters numClasses](v43, "numClasses"));
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v60 = 0;
LABEL_197:

        goto LABEL_198;
      }
    }
    v48 = objc_msgSend(v223, "isContiguousInOrder:", 1);
    v49 = MEMORY[0x1E0C809B0];
    __A = (double *)v41;
    if (v48)
    {
      kdebug_trace();
      aBlock = v49;
      v261 = 3221225472;
      v262 = ___ZL10performNMSIffEP27MLDictionaryFeatureProviderP12MLMultiArrayS3_ddP33MLNonMaximumSuppressionParametersyyPU15__autoreleasingP7NSError_block_invoke;
      v263 = &__block_descriptor_40_e5_v8__0l;
      v264 = v41;
      v50 = (void (**)(_QWORD))_Block_copy(&aBlock);
      v51 = [MLMultiArray alloc];
      objc_msgSend(v223, "shape");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[MLMultiArray initWithShape:dataType:storageOrder:error:](v51, "initWithShape:dataType:storageOrder:error:", v52, objc_msgSend(v223, "dataType"), 0, a5);

      objc_msgSend(v223, "vectorizeIntoMultiArray:storageOrder:error:", v53, 0, a5);
      v50[2](v50);

      v223 = (id)v53;
    }
    if (-[MLMultiArray isContiguousInOrder:](v219, "isContiguousInOrder:", 1))
    {
      kdebug_trace();
      v255 = v49;
      v256 = 3221225472;
      v257 = ___ZL10performNMSIffEP27MLDictionaryFeatureProviderP12MLMultiArrayS3_ddP33MLNonMaximumSuppressionParametersyyPU15__autoreleasingP7NSError_block_invoke_2;
      v258 = &__block_descriptor_40_e5_v8__0l;
      v259 = v41;
      v54 = (void (**)(_QWORD))_Block_copy(&v255);
      v55 = [MLMultiArray alloc];
      -[MLMultiArray shape](v219, "shape");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[MLMultiArray initWithShape:dataType:storageOrder:error:](v55, "initWithShape:dataType:storageOrder:error:", v56, -[MLMultiArray dataType](v219, "dataType"), 0, a5);

      -[MLMultiArray vectorizeIntoMultiArray:storageOrder:error:](v219, "vectorizeIntoMultiArray:storageOrder:error:", v57, 0, a5);
      v54[2](v54);

    }
    else
    {
      v57 = v219;
    }
    v223 = objc_retainAutorelease(v223);
    v217 = (float *)objc_msgSend(v223, "bytes");
    v219 = objc_retainAutorelease(v57);
    v80 = -[MLMultiArray bytes](v219, "bytes");
    objc_msgSend(v223, "shape");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "objectAtIndexedSubscript:", 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "unsignedLongValue");

    objc_msgSend(v223, "shape");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "objectAtIndexedSubscript:", 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "unsignedLongValue");

    v87 = -[MLNonMaximumSuppressionParameters perClass](v230, "perClass");
    std::vector<float>::vector(&__C, v83);
    if (v87)
      v88 = v83;
    else
      v88 = 0;
    std::vector<unsigned long>::vector(&v251, v88);
    v248 = 0;
    v249 = 0;
    v250 = 0;
    v245 = 0;
    v246 = 0;
    v247 = 0;
    __src = 0;
    v243 = 0;
    v244 = 0;
    v239 = 0;
    v240 = 0;
    v241 = 0;
    kdebug_trace();
    v233 = v49;
    v234 = 3221225472;
    v235 = ___ZL10performNMSIffEP27MLDictionaryFeatureProviderP12MLMultiArrayS3_ddP33MLNonMaximumSuppressionParametersyyPU15__autoreleasingP7NSError_block_invoke_3;
    v236 = &__block_descriptor_48_e5_v8__0l;
    v237 = (unint64_t)__A;
    v238 = v42;
    v211 = (void (**)(_QWORD))_Block_copy(&v233);
    if (v83)
    {
      v89 = 0;
      v90 = 0;
      v91 = v217;
      v92 = v83;
      do
      {
        v93 = (float *)((char *)__C + v89);
        if (v87)
          vDSP_maxvi(v91, 1, v93, (vDSP_Length *)((char *)v251 + v90), v86);
        else
          vDSP_maxv(v91, 1, v93, v86);
        v90 += 8;
        v89 += 4;
        v91 += v86;
        --v92;
      }
      while (v92);
      if (v10 <= 0.0)
      {
LABEL_71:
        v94 = 0;
        v101 = 0;
LABEL_150:
        LODWORD(v271) = 0;
        std::vector<float>::resize((char **)&__src, v83 * v86, &v271);
        LODWORD(v271) = 0;
        std::vector<float>::resize((char **)&v239, 4 * v83, &v271);
        std::vector<unsigned long>::vector(&v271, v83);
        v161 = v271;
        if (v83)
        {
          for (j = 0; j != v83; ++j)
            v161[j] = j;
        }
        vDSP_vsorti((const float *)__C, v161, 0, v83, -1);
        LOBYTE(v267) = 0;
        std::vector<BOOL>::vector(&v269, v83, (unsigned __int8 *)&v267);
        v210 = v101;
        if (v83)
        {
          v163 = 0;
          v164 = 0;
          v165 = (char *)__src;
          v166 = (char *)v239;
          while (1)
          {
            if (((*(_QWORD *)&v269[(v163 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v163) & 1) != 0)
            {
              v167 = v163 + 1;
            }
            else
            {
              if ((-[MLNonMaximumSuppressionParameters maxBoxes](v230, "maxBoxes") & 0x8000000000000000) == 0
                && v164 >= -[MLNonMaximumSuppressionParameters maxBoxes](v230, "maxBoxes"))
              {
                goto LABEL_177;
              }
              v168 = v271[v163];
              v169 = v86 + v168 * v86;
              if (v169 != v168 * v86)
              {
                memmove(&v165[4 * v164 * v86], &v217[v168 * v86], 4 * v169 - 4 * v168 * v86);
                v168 = v271[v163];
              }
              memmove(&v166[16 * v164], &v80[16 * v168], 0x10uLL);
              if (v87)
                v170 = *((_QWORD *)v251 + v271[v163]);
              else
                v170 = 0;
              ++v164;
              v167 = v163 + 1;
              if (v163 + 1 < v83)
              {
                v171 = v271;
                v172 = v251;
                v173 = v163 + 1;
                v174 = v269;
                do
                {
                  v175 = v171[v173];
                  if (v87)
                    v176 = v172[v175];
                  else
                    v176 = 0;
                  v177 = *(_QWORD *)&v174[8 * (v173 >> 6)];
                  if ((v177 & (1 << v173)) == 0 && v170 == v176)
                  {
                    v178 = (float32x2_t *)&v80[16 * v171[v163]];
                    v179 = (float32x2_t *)&v80[16 * v175];
                    v180 = vmaxnm_f32(v178[1], 0);
                    v181 = vsub_f32(*v178, vmul_f32(v180, (float32x2_t)0x3F0000003F000000));
                    v182 = vmaxnm_f32(v179[1], 0);
                    v183 = vsub_f32(*v179, vmul_f32(v182, (float32x2_t)0x3F0000003F000000));
                    v184 = vmaxnm_f32(vsub_f32(vminnm_f32(vadd_f32(v180, v181), vadd_f32(v182, v183)), vmaxnm_f32(v181, v183)), 0);
                    v184.f32[0] = vmul_lane_f32(v184, v184, 1).f32[0];
                    if (v184.f32[0]
                       / ((float)(vmlas_n_f32(vmul_lane_f32(v182, v182, 1).f32[0], v180.f32[1], v180.f32[0])
                                - v184.f32[0])
                        + 0.00001) > v8)
                      *(_QWORD *)&v174[8 * (v173 >> 6)] = v177 | (1 << v173);
                  }
                  ++v173;
                }
                while (v83 != v173);
              }
            }
            v163 = v167;
            if (v167 == v83)
              goto LABEL_177;
          }
        }
        v164 = 0;
LABEL_177:
        if (v269)
          operator delete(v269);
        if (v271)
        {
          v272 = v271;
          operator delete(v271);
        }
        v211[2](v211);

        v185 = v164;
        if (v164 <= -[MLNonMaximumSuppressionParameters minBoxes](v230, "minBoxes"))
          v185 = -[MLNonMaximumSuppressionParameters minBoxes](v230, "minBoxes");
        v186 = [MLMultiArray alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v185);
        v187 = (vDSP_Length *)objc_claimAutoreleasedReturnValue();
        v218 = (float *)v185;
        v271 = v187;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v86);
        v188 = (vDSP_Length *)objc_claimAutoreleasedReturnValue();
        v272 = v188;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v271, 2);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        v190 = -[MLMultiArray initWithShape:dataType:error:](v186, "initWithShape:dataType:error:", v189, objc_msgSend(v223, "dataType"), a5);

        v191 = [MLMultiArray alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v218);
        v192 = (char *)objc_claimAutoreleasedReturnValue();
        v269 = v192;
        v270 = &unk_1E3DA24D0;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v269, 2);
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        v212 = -[MLMultiArray initWithShape:dataType:error:](v191, "initWithShape:dataType:error:", v193, -[MLMultiArray dataType](v219, "dataType"), a5);

        v194 = objc_retainAutorelease(v190);
        v195 = -[MLMultiArray mutableBytes](v194, "mutableBytes");
        v196 = objc_retainAutorelease(v212);
        v208 = (double *)v194;
        v197 = -[MLMultiArray mutableBytes](v196, "mutableBytes");
        kdebug_trace();
        v198 = __src;
        memcpy(v195, __src, 4 * v164 * v86);
        v199 = v239;
        memcpy(v197, v239, 16 * v164);
        v200 = (char *)v218 - v164;
        if (v218 != (float *)v164)
        {
          bzero(&v195[4 * v164 * v86], 4 * v86 * (_QWORD)v200);
          bzero(&v197[16 * v164], 16 * (_QWORD)v200);
        }
        kdebug_trace();
        v201 = [MLDictionaryFeatureProvider alloc];
        -[MLNonMaximumSuppressionParameters confidenceOutputFeatureName](v230, "confidenceOutputFeatureName");
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        v265 = v202;
        v267 = v208;
        -[MLNonMaximumSuppressionParameters coordinatesOutputFeatureName](v230, "coordinatesOutputFeatureName");
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        v266 = v203;
        v268 = v196;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v267, &v265, 2);
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v201, "initWithDictionary:error:", v204, a5);

        if (v199)
        {
          v240 = v199;
          operator delete(v199);
        }
        if (v198)
          operator delete(v198);
        if (v210)
          operator delete(v210);
        if (v94)
          operator delete(v94);
        if (v251)
        {
          v252 = v251;
          operator delete(v251);
        }
        v43 = v230;
        if (__C)
        {
          v254 = __C;
          operator delete(__C);
        }
        goto LABEL_197;
      }
      v94 = 0;
      v95 = __C;
      v96 = v83;
      do
      {
        v97 = *(float *)v95;
        v95 = (double *)((char *)v95 + 4);
        if (v10 <= v97)
          ++v94;
        --v96;
      }
      while (v96);
    }
    else
    {
      v94 = 0;
      if (v10 <= 0.0)
      {
        v101 = 0;
        v83 = 0;
        goto LABEL_150;
      }
    }
    if (v94 != (char *)v83)
    {
      std::vector<float>::resize(&v248, v86 * v83);
      std::vector<float>::resize(&v245, 4 * v83);
      v94 = v248;
      v101 = v245;
      if (v83)
      {
        v108 = v245;
        v109 = 0;
        v110 = 0;
        v111 = __C;
        do
        {
          if (v10 <= *((float *)v111 + v109))
          {
            if ((v109 + 1) * v86 != v109 * v86)
              memmove(&v94[4 * v110 * v86], &v217[v109 * v86], 4 * v86);
            *(_OWORD *)&v108[16 * v110] = *(_OWORD *)&v80[16 * v109];
            v111 = __C;
            *((_DWORD *)__C + v110) = *((_DWORD *)__C + v109);
            if (v87)
              *((_QWORD *)v251 + v110) = *((_QWORD *)v251 + v109);
            ++v110;
            ++v109;
          }
          else
          {
            ++v109;
          }
        }
        while (v109 != v83);
        v101 = v108;
        v80 = v108;
        v83 = v110;
      }
      else
      {
        v80 = v245;
      }
      v217 = (float *)v94;
      goto LABEL_150;
    }
    goto LABEL_71;
  }
  if (a5)
  {
    +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", objc_msgSend(v228, "dataType"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", objc_msgSend(v227, "dataType"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Data type error for NonMaximumSuppression: confidence and coordinates must be MLMultiArray of a same type and it must be either DOUBLE or FLOAT32. However, confidence uses %@ and coordinates uses %@"), v58, v59);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v60 = 0;
LABEL_198:

  return v60;
}

- (unint64_t)predictionTypeForKTrace
{
  return 1;
}

- (MLNonMaximumSuppressionParameters)parameters
{
  return (MLNonMaximumSuppressionParameters *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  MLNonMaximumSuppressionParameters *v9;
  MLNonMaximumSuppressionParameters *v10;
  uint64_t *v11;
  MLNonMaximumSuppression *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CoreML::Specification::protobuf_NonMaximumSuppression_2eproto *v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  CoreML::Specification::StringVector *v31;
  CoreML::Specification::protobuf_DataStructures_2eproto *v32;
  const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *v33;
  CoreML::Specification::Int64Vector *v34;
  CoreML::Specification::protobuf_DataStructures_2eproto *v35;
  const CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t *inited;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  unsigned __int8 *v52;
  uint64_t v53;
  uint64_t v54;
  std::string::size_type v55;
  int v56;
  std::string *v57;
  uint64_t *v58;
  uint64_t *v59;
  unsigned __int8 *v60;
  uint64_t v61;
  uint64_t v62;
  std::string::size_type size;
  int v64;
  std::string *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  void *v69;
  CoreML::Specification::Int64Vector *v70;
  id v71;
  uint64_t v72;
  void *v73;
  CoreML::Specification::Int64Vector *v74;
  uint64_t v75;
  uint64_t *v76;
  void *v77;
  void *v78;
  id *v80;
  id v81;
  id v82;
  void (**v83)(CoreML::Specification::NonMaximumSuppression *__hidden);
  uint64_t v84;
  std::string *v85;
  std::string *v86;
  std::string *v87;
  std::string *v88;
  std::string *v89;
  std::string *v90;
  __int128 v91;
  uint64_t v92;
  CoreML::Specification::Int64Vector *v93;
  int v94;
  int v95;
  int v96;

  v7 = a4;
  v8 = v7;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) != 610)
  {
    if (a5)
    {
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Model type is not a NonMaximumSuppression"));
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    goto LABEL_149;
  }
  v81 = v7;
  v82 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
  v9 = objc_alloc_init(MLNonMaximumSuppressionParameters);
  v10 = v9;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 610)
  {
    v11 = *(uint64_t **)(*(_QWORD *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_NonMaximumSuppression_2eproto::InitDefaults((CoreML::Specification::protobuf_NonMaximumSuppression_2eproto *)v9);
    v11 = &CoreML::Specification::_NonMaximumSuppression_default_instance_;
  }
  v83 = &off_1E3D53428;
  v84 = 0;
  v94 = 0;
  v13 = v11[1];
  if ((v13 & 1) != 0)
    google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v84, v13 & 0xFFFFFFFFFFFFFFFELL);
  v85 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
  v14 = v11[2];
  if (*(char *)(v14 + 23) < 0)
    v15 = *(_QWORD *)(v14 + 8);
  else
    v15 = *(unsigned __int8 *)(v14 + 23);
  if ((__int128 *)v14 != &google::protobuf::internal::fixed_address_empty_string && v15)
    google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v85, v14);
  v86 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
  v16 = v11[3];
  if (*(char *)(v16 + 23) < 0)
    v17 = *(_QWORD *)(v16 + 8);
  else
    v17 = *(unsigned __int8 *)(v16 + 23);
  if ((__int128 *)v16 != &google::protobuf::internal::fixed_address_empty_string && v17)
    google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v86, v16);
  v87 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
  v18 = v11[4];
  if (*(char *)(v18 + 23) < 0)
    v19 = *(_QWORD *)(v18 + 8);
  else
    v19 = *(unsigned __int8 *)(v18 + 23);
  if ((__int128 *)v18 != &google::protobuf::internal::fixed_address_empty_string && v19)
    google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v87, v18);
  v88 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
  v20 = v11[5];
  if (*(char *)(v20 + 23) < 0)
    v21 = *(_QWORD *)(v20 + 8);
  else
    v21 = *(unsigned __int8 *)(v20 + 23);
  if ((__int128 *)v20 != &google::protobuf::internal::fixed_address_empty_string && v21)
    google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v88, v20);
  v89 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
  v22 = v11[6];
  if (*(char *)(v22 + 23) < 0)
    v23 = *(_QWORD *)(v22 + 8);
  else
    v23 = *(unsigned __int8 *)(v22 + 23);
  if ((__int128 *)v22 != &google::protobuf::internal::fixed_address_empty_string && v23)
    google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v89, v22);
  v90 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
  v24 = v11[7];
  if (*(char *)(v24 + 23) < 0)
    v25 = *(_QWORD *)(v24 + 8);
  else
    v25 = *(unsigned __int8 *)(v24 + 23);
  if ((__int128 *)v24 != &google::protobuf::internal::fixed_address_empty_string && v25)
    google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v90, v24);
  v91 = *((_OWORD *)v11 + 4);
  v95 = 0;
  if (*((_DWORD *)v11 + 25) == 1)
  {
    v95 = 1;
    v26 = operator new();
    v27 = CoreML::Specification::NonMaximumSuppression_PickTop::NonMaximumSuppression_PickTop((CoreML::Specification::NonMaximumSuppression_PickTop *)v26);
    v92 = v26;
    if (*((_DWORD *)v11 + 25) == 1)
    {
      v28 = (uint64_t *)v11[10];
    }
    else
    {
      CoreML::Specification::protobuf_NonMaximumSuppression_2eproto::InitDefaults(v27);
      v28 = &CoreML::Specification::_NonMaximumSuppression_PickTop_default_instance_;
    }
    v29 = v28[1];
    if ((v29 & 1) != 0)
      google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom((uint64_t *)(v26 + 8), v29 & 0xFFFFFFFFFFFFFFFELL);
    if (*((_BYTE *)v28 + 16))
      *(_BYTE *)(v26 + 16) = 1;
  }
  v96 = 0;
  v30 = *((_DWORD *)v11 + 26);
  if (v30 == 101)
  {
    v96 = 101;
    v34 = (CoreML::Specification::Int64Vector *)operator new();
    v35 = CoreML::Specification::Int64Vector::Int64Vector(v34);
    v93 = v34;
    if (*((_DWORD *)v11 + 26) == 101)
    {
      v36 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts *)v11[11];
    }
    else
    {
      CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(v35);
      v36 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts *)&CoreML::Specification::_Int64Vector_default_instance_;
    }
    CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts::MergeFrom((uint64_t *)v34, v36);
  }
  else if (v30 == 100)
  {
    v96 = 100;
    v31 = (CoreML::Specification::StringVector *)operator new();
    v32 = CoreML::Specification::StringVector::StringVector(v31);
    v93 = v31;
    if (*((_DWORD *)v11 + 26) == 100)
    {
      v33 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *)v11[11];
    }
    else
    {
      CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(v32);
      v33 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *)&CoreML::Specification::_StringVector_default_instance_;
    }
    CoreML::Specification::MILSpec::TensorValue_RepeatedStrings::MergeFrom((std::string *)v31, v33);
  }
  -[MLNonMaximumSuppressionParameters setIouThreshold:](v10, "setIouThreshold:", *(double *)&v91);
  -[MLNonMaximumSuppressionParameters setConfidenceThreshold:](v10, "setConfidenceThreshold:", *((double *)&v91 + 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNonMaximumSuppressionParameters setConfidenceInputFeatureName:](v10, "setConfidenceInputFeatureName:", v37);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNonMaximumSuppressionParameters setCoordinatesInputFeatureName:](v10, "setCoordinatesInputFeatureName:", v38);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNonMaximumSuppressionParameters setConfidenceOutputFeatureName:](v10, "setConfidenceOutputFeatureName:", v39);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNonMaximumSuppressionParameters setCoordinatesOutputFeatureName:](v10, "setCoordinatesOutputFeatureName:", v40);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNonMaximumSuppressionParameters setIouThresholdInputFeatureName:](v10, "setIouThresholdInputFeatureName:", v41);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNonMaximumSuppressionParameters setConfidenceThresholdInputFeatureName:](v10, "setConfidenceThresholdInputFeatureName:", v42);

  if (v95 == 1)
    inited = (unint64_t *)-[MLNonMaximumSuppressionParameters setPerClass:](v10, "setPerClass:", *(unsigned __int8 *)(v92 + 16));
  v80 = a5;
  if (*(_QWORD *)(*(_QWORD *)a3 + 16))
    v44 = *(uint64_t **)(*(_QWORD *)a3 + 16);
  else
    v44 = &CoreML::Specification::_ModelDescription_default_instance_;
  if (*((int *)v44 + 12) >= 1)
  {
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = -1;
    while (1)
    {
      v49 = *(uint64_t **)(*(_QWORD *)(v44[7] + 8 * v45 + 8) + 32);
      if (!v49)
        v49 = &CoreML::Specification::_FeatureType_default_instance_;
      if (*((_DWORD *)v49 + 9) == 5)
      {
        v50 = (uint64_t *)v49[3];
      }
      else
      {
        inited = CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
        v50 = &CoreML::Specification::_ArrayFeatureType_default_instance_;
      }
      if (*((_DWORD *)v50 + 4) == 2)
        break;
      if (*((_DWORD *)v50 + 15) == 31)
      {
        v58 = (uint64_t *)v50[5];
      }
      else
      {
        inited = CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
        v58 = &CoreML::Specification::_ArrayFeatureType_ShapeRange_default_instance_;
      }
      if (*((_DWORD *)v58 + 6) != 2)
        goto LABEL_103;
      if (*((_DWORD *)v50 + 15) == 31)
      {
        v59 = (uint64_t *)v50[5];
        v46 = *(_QWORD *)(*(_QWORD *)(v59[4] + 8) + 16);
      }
      else
      {
        inited = CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
        v46 = *(_QWORD *)(*(_QWORD *)(qword_1ED005BC8 + 8) + 16);
        if (*((_DWORD *)v50 + 15) == 31)
        {
          v59 = (uint64_t *)v50[5];
        }
        else
        {
          inited = CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
          v59 = &CoreML::Specification::_ArrayFeatureType_ShapeRange_default_instance_;
        }
      }
      v48 = *(_QWORD *)(*(_QWORD *)(v59[4] + 8) + 24);
      v60 = *(unsigned __int8 **)(*(_QWORD *)(v44[7] + 8 * v45 + 8) + 16);
      v61 = v60[23];
      if ((v61 & 0x80u) == 0)
        v62 = v60[23];
      else
        v62 = *((_QWORD *)v60 + 1);
      size = HIBYTE(v89->__r_.__value_.__r.__words[2]);
      v64 = (char)size;
      if ((size & 0x80u) != 0)
        size = v89->__r_.__value_.__l.__size_;
      if (v62 != size)
        goto LABEL_103;
      if (v64 >= 0)
        v65 = v89;
      else
        v65 = (std::string *)v89->__r_.__value_.__r.__words[0];
      if ((v61 & 0x80) == 0)
      {
        if (v60[23])
        {
          while (*v60 == v65->__r_.__value_.__s.__data_[0])
          {
            ++v60;
            v65 = (std::string *)((char *)v65 + 1);
            if (!--v61)
              goto LABEL_121;
          }
          goto LABEL_103;
        }
LABEL_121:
        if (*((_DWORD *)v50 + 15) == 31)
        {
          v66 = (uint64_t *)v50[5];
          v67 = *(_QWORD *)(*(_QWORD *)(v66[4] + 16) + 16);
        }
        else
        {
          inited = CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
          v67 = *(_QWORD *)(*(_QWORD *)(qword_1ED005BC8 + 16) + 16);
          if (*((_DWORD *)v50 + 15) == 31)
          {
            v66 = (uint64_t *)v50[5];
          }
          else
          {
            inited = CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
            v66 = &CoreML::Specification::_ArrayFeatureType_ShapeRange_default_instance_;
          }
        }
        if (v67 == *(_QWORD *)(*(_QWORD *)(v66[4] + 16) + 24))
        {
          if (*((_DWORD *)v50 + 15) == 31)
          {
            v68 = (uint64_t *)v50[5];
          }
          else
          {
            inited = CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
            v68 = &CoreML::Specification::_ArrayFeatureType_ShapeRange_default_instance_;
          }
          v47 = *(_QWORD *)(*(_QWORD *)(v68[4] + 16) + 16);
        }
        goto LABEL_103;
      }
      inited = (unint64_t *)memcmp(*(const void **)v60, v65, *((_QWORD *)v60 + 1));
      if (!(_DWORD)inited)
        goto LABEL_121;
LABEL_103:
      if (++v45 >= *((int *)v44 + 12))
        goto LABEL_132;
    }
    v51 = v50[3];
    v48 = *(_QWORD *)(v51 + 8);
    v52 = *(unsigned __int8 **)(*(_QWORD *)(v44[7] + 8 * v45 + 8) + 16);
    v53 = v52[23];
    if ((v53 & 0x80u) == 0)
      v54 = v52[23];
    else
      v54 = *((_QWORD *)v52 + 1);
    v55 = HIBYTE(v89->__r_.__value_.__r.__words[2]);
    v56 = (char)v55;
    if ((v55 & 0x80u) != 0)
      v55 = v89->__r_.__value_.__l.__size_;
    if (v54 == v55)
    {
      if (v56 >= 0)
        v57 = v89;
      else
        v57 = (std::string *)v89->__r_.__value_.__r.__words[0];
      if ((v53 & 0x80) == 0)
      {
        if (v52[23])
        {
          while (*v52 == v57->__r_.__value_.__s.__data_[0])
          {
            ++v52;
            v57 = (std::string *)((char *)v57 + 1);
            if (!--v53)
              goto LABEL_100;
          }
          goto LABEL_102;
        }
        goto LABEL_100;
      }
      inited = (unint64_t *)memcmp(*(const void **)v52, v57, *((_QWORD *)v52 + 1));
      if (!(_DWORD)inited)
      {
LABEL_100:
        if (*(uint64_t *)(v51 + 16) >= 0)
          v47 = *(_QWORD *)(v51 + 16);
      }
    }
LABEL_102:
    v46 = v48;
    goto LABEL_103;
  }
  v47 = 0;
  v46 = 0;
  v48 = -1;
LABEL_132:
  if (v96 != 100)
  {
    v8 = v81;
    v69 = v82;
    if (v96 != 101)
    {
      v71 = 0;
      goto LABEL_146;
    }
    v70 = v93;
    v47 = *((int *)v93 + 4);
    v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((int)v47 < 1)
    {
      v8 = v81;
      goto LABEL_146;
    }
    v72 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*((_QWORD *)v70 + 3) + v72 + 8));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "addObject:", v73);

      v72 += 8;
    }
    while (8 * v47 != v72);
    v8 = v81;
    goto LABEL_143;
  }
  v74 = v93;
  v47 = *((int *)v93 + 6);
  v8 = v81;
  v69 = v82;
  v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((int)v47 >= 1)
  {
    v75 = 0;
    do
    {
      v76 = *(uint64_t **)(*((_QWORD *)v74 + 4) + v75 + 8);
      if (*((char *)v76 + 23) < 0)
        v76 = (uint64_t *)*v76;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "addObject:", v77);

      v75 += 8;
    }
    while (8 * v47 != v75);
LABEL_143:
    v69 = v82;
  }
LABEL_146:
  -[MLNonMaximumSuppressionParameters setMinBoxes:](v10, "setMinBoxes:", v46);
  -[MLNonMaximumSuppressionParameters setMaxBoxes:](v10, "setMaxBoxes:", v48);
  -[MLNonMaximumSuppressionParameters setNumClasses:](v10, "setNumClasses:", v47);
  if (v71)
  {
    v78 = (void *)objc_msgSend(v71, "copy");
    -[MLNonMaximumSuppressionParameters setLabelNames:](v10, "setLabelNames:", v78);

    objc_msgSend(v69, "setClassLabels:", v71);
  }
  v12 = -[MLNonMaximumSuppression initWithParameters:modelDescription:configuration:error:]([MLNonMaximumSuppression alloc], "initWithParameters:modelDescription:configuration:error:", v10, v69, v8, v80);

  CoreML::Specification::NonMaximumSuppression::~NonMaximumSuppression((CoreML::Specification::NonMaximumSuppression *)&v83);
LABEL_149:

  return v12;
}

@end
