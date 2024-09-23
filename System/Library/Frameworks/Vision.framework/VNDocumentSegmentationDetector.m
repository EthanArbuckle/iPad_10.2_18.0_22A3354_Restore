@implementation VNDocumentSegmentationDetector

- (BOOL)configureImageAnalyzerOptions:(void *)a3 error:(id *)a4
{
  _BOOL4 v5;
  char *v6;
  char *v7;
  char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VNDocumentSegmentationDetector;
  v5 = -[VNImageAnalyzerBasedDetector configureImageAnalyzerOptions:error:](&v10, sel_configureImageAnalyzerOptions_error_, a3, a4);
  if (v5)
  {
    if (*((char *)a3 + 215) < 0)
    {
      *((_QWORD *)a3 + 25) = 7;
      v6 = (char *)*((_QWORD *)a3 + 24);
    }
    else
    {
      v6 = (char *)a3 + 192;
      *((_BYTE *)a3 + 215) = 7;
    }
    strcpy(v6, "sigmoid");
    if (*((char *)a3 + 335) < 0)
    {
      *((_QWORD *)a3 + 40) = 7;
      v7 = (char *)*((_QWORD *)a3 + 39);
    }
    else
    {
      v7 = (char *)a3 + 312;
      *((_BYTE *)a3 + 335) = 7;
    }
    strcpy(v7, "finalFC");
    if (*((char *)a3 + 311) < 0)
    {
      *((_QWORD *)a3 + 37) = 11;
      v8 = (char *)*((_QWORD *)a3 + 36);
    }
    else
    {
      v8 = (char *)a3 + 288;
      *((_BYTE *)a3 + 311) = 11;
    }
    strcpy(v8, "BL_BR_TR_TL");
    *((_BYTE *)a3 + 385) = 1;
  }
  return v5;
}

- (unsigned)analysisTypesForProcessOptions:(id)a3
{
  return 2096;
}

- (id)observationsForLastAnalysisOfImageAnalyzer:(void *)a3 processOptions:(id)a4 originatingRequestSpecifier:(id)a5 qosClass:(unsigned int)a6 error:(id *)a7
{
  char *v9;
  float v10;
  float v11;
  float v12;
  int v13;
  char *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  char *v24;
  uint64_t i;
  unint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  unint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float *v46;
  float *v47;
  uint64_t v48;
  float v49;
  float v50;
  uint64_t *v51;
  std::vector<int>::value_type *v52;
  std::vector<int>::value_type *v53;
  float v54;
  float *v55;
  float *v56;
  BOOL v57;
  float v58;
  void **v59;
  float32x2_t *v60;
  float32x2_t v61;
  uint64_t v62;
  float64x2_t v63;
  uint64_t v64;
  double v65;
  double v66;
  double *v67;
  float v68;
  uint64_t v69;
  uint64_t v70;
  CGFloat *v71;
  CGFloat *v72;
  uint64_t v73;
  uint64_t v74;
  float v75;
  uint64_t v76;
  CGFloat *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  char *data;
  vImagePixelCount height;
  vImagePixelCount width;
  size_t rowBytes;
  CGImage *v85;
  int ComponentType;
  CGColorSpace *ColorSpace;
  size_t PixelSize;
  _BOOL4 v89;
  _BOOL4 v90;
  unsigned int AlphaInfo;
  const __CFString *v92;
  signed int v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  char *v99;
  int v100;
  uint64_t v101;
  int v102;
  char *v103;
  float v104;
  float v105;
  float v106;
  float v107;
  uint64_t v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  uint64_t v114;
  int v115;
  int v116;
  int v117;
  int v118;
  float v119;
  uint64_t *v120;
  int v121;
  uint64_t *v122;
  uint64_t *v123;
  int v124;
  _QWORD *v125;
  float *v126;
  uint64_t *j;
  int v128;
  BOOL v129;
  uint64_t *v130;
  int *v131;
  int v132;
  int v133;
  uint64_t *v134;
  uint64_t *k;
  int v136;
  uint8x8_t v137;
  unint64_t v138;
  uint64_t **v139;
  uint64_t *m;
  unint64_t v141;
  void *v142;
  void *v143;
  int v144;
  int n;
  int v146;
  float *v147;
  uint64_t *v148;
  float *v149;
  float *v150;
  int v151;
  unint64_t v152;
  uint64_t v153;
  float v154;
  unint64_t v155;
  unint64_t ii;
  uint64_t v157;
  float v158;
  unint64_t v159;
  unint64_t jj;
  uint64_t v161;
  float v162;
  unint64_t v163;
  unint64_t kk;
  uint64_t v165;
  float v166;
  unint64_t mm;
  unsigned int v168;
  int v169;
  int v170;
  CGColorSpaceModel Model;
  int v172;
  int v173;
  _BOOL4 v175;
  unsigned int v176;
  int v177;
  uint64_t *v178;
  std::vector<int>::pointer begin;
  uint64_t v180;
  uint64_t v181;
  int v182;
  uint64_t v183;
  signed int v184;
  int *v185;
  uint64_t v186;
  int v187;
  int v188;
  int *v189;
  int *v190;
  uint64_t v191;
  uint64_t v192;
  int *v193;
  uint64_t v194;
  unint64_t v195;
  int v196;
  int v197;
  _BOOL4 v200;
  size_t v201;
  size_t v202;
  size_t v203;
  int v204;
  uint64_t v205;
  uint64_t v206;
  char *v207;
  __int128 v208;
  unint64_t v209;
  __int128 v210;
  vImagePixelCount v211;
  char *v212;
  char *v213;
  int v214;
  float v215;
  unint64_t v216;
  int v217;
  int v218;
  char *v219;
  char *v220;
  unint64_t nn;
  float v222;
  void *v223;
  id *v225;
  const __CFAllocator *v226;
  void *v227;
  void *v228;
  size_t v229;
  size_t v230;
  uint64_t v231;
  id v232;
  VNPixelBufferObservation *v233;
  VNPixelBufferObservation *v234;
  VNPixelBufferObservation *v235;
  VNRectangleObservation *v236;
  double v237;
  int v238;
  _QWORD *exception;
  signed int v240;
  int v241;
  int v242;
  int v243;
  int v244;
  id v245;
  unint64_t v246;
  unint64_t v247;
  unint64_t v248;
  uint64_t v249;
  unint64_t v250;
  void *v251;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  signed int v261;
  uint64_t v262;
  unint64_t v263;
  uint64_t v264;
  char *v265;
  int v266;
  uint64_t v267;
  uint64_t v268;
  int v269;
  uint64_t v270;
  char *v271;
  uint64_t v272;
  uint64_t v273;
  char *v274;
  uint64_t v275;
  uint64_t v276;
  size_t v277;
  uint64_t v278;
  int v279;
  __int16 BitmapInfo;
  int v281;
  uint64_t v282;
  unint64_t ptr;
  char *ptra;
  unint64_t ptrb;
  std::vector<int>::pointer ptrc;
  void *ptrd[2];
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  unint64_t v292;
  unint64_t v293;
  unint64_t v294;
  unint64_t v295;
  float v296;
  void *v297[2];
  __int128 v298;
  int v299;
  int v300;
  void *baseAddress[2];
  size_t bytesPerRow[2];
  void *v303;
  vImagePixelCount v304;
  vImagePixelCount v305;
  size_t v306;
  vImagePixelCount v307;
  __int128 *v308;
  void *v309;
  void *v310;
  __int128 v311;
  uint64_t v312;
  __int128 v313;
  uint64_t v314;
  __int128 v315;
  uint64_t v316;
  __int128 v317;
  uint64_t v318;
  int v319;
  float v320[2];
  vImage_CGImageFormat format;
  unint64_t v322;
  unint64_t v323;
  void *v324;
  void *v325;
  void *__p[3];
  vImage_Buffer buf;
  int v328;
  _OWORD v329[2];
  int v330;
  int v331;
  __int128 v332;
  __int128 v333;
  int v334;
  std::vector<int>::value_type __x[4];
  __int128 v336;
  int v337;
  std::vector<int> v338;
  _BYTE v339[4];
  int v340;
  CGFloat backgroundColor[2];
  __int128 v342;
  int v343;
  _QWORD v344[4];

  v344[1] = *MEMORY[0x1E0C80C00];
  v245 = a5;
  if (!self)
    goto LABEL_337;
  format.bitsPerComponent = 2048;
  if (!*((_BYTE *)std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>((uint64_t)a3 + 824, 0x800u, &format)+ 20))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 8574;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  format.bitsPerComponent = 2048;
  v9 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>((uint64_t)a3 + 784, 0x800u, &format);
  vision::mod::ImageAnalyzer_Tensor1D<float>::ImageAnalyzer_Tensor1D((uint64_t)&buf, (__int128 *)(v9 + 24), 1);
  vision::mod::ImageAnalyzer_Tensor1D<float>::getVectorFromTensor(__p, (unint64_t *)&buf);
  v10 = *(float *)__p[0];
  vision::mod::ImageAnalyzer::getSceneSegmentation((vision::mod::ImageAnalyzer *)&format, (uint64_t)a3);
  v11 = (float)v323;
  v12 = (float)v322;
  v320[0] = (float)v323;
  v320[1] = (float)v322;
  v319 = 0;
  vision::mod::ImageAnalyzer_Tensor3D::getVImageBufferFromTensorChannel(&v317, (uint64_t)&format, 0, v320, &v319);
  vision::mod::ImageAnalyzer_Tensor3D::getVImageBufferFromTensorChannel(&v315, (uint64_t)&format, 1uLL, v320, &v319);
  vision::mod::ImageAnalyzer_Tensor3D::getVImageBufferFromTensorChannel(&v313, (uint64_t)&format, 2uLL, v320, &v319);
  vision::mod::ImageAnalyzer_Tensor3D::getVImageBufferFromTensorChannel(&v311, (uint64_t)&format, 3uLL, v320, &v319);
  vision::mod::ImageAnalyzer::getSceneSaliency((vision::mod::ImageAnalyzer *)baseAddress, (uint64_t)a3);
  v300 = 0;
  vision::mod::ImageAnalyzer_Tensor2D::getVImageBufferFromTensor((uint64_t)v297, (int8x16_t *)baseAddress, &v300);
  v14 = (char *)v297[0];
  v13 = (int)v297[1];
  v15 = *((_QWORD *)&v298 + 1);
  v16 = v298;
  v17 = (v298 - 1);
  v18 = (int)v17;
  *(_OWORD *)v297 = 0u;
  v298 = 0u;
  v299 = 1065353216;
  *(_OWORD *)backgroundColor = 0u;
  v342 = 0u;
  v343 = 1065353216;
  v340 = 1;
  v19 = v13 - 1;
  v20 = v13 - 1;
  v251 = a3;
  if (v13 < 1)
    goto LABEL_12;
  v21 = 0;
  v22 = 0;
  v23 = v13;
  v24 = v14;
  do
  {
    if (v16 >= 1)
    {
      for (i = 0; i < v16; i += 4)
      {
        if (*(float *)&v24[4 * i] >= 0.5)
          ++v22;
      }
    }
    v21 += 4;
    v24 += 4 * v15;
  }
  while (v21 < v13);
  if (v22 >= 10)
  {
    if ((float)((float)(16 * v22) / (float)(v16 * v13)) >= 0.91)
    {
      v26 = 0;
      v27 = 0;
    }
    else
    {
      v243 = v17;
      v244 = v13 - 1;
      v241 = v13;
      v242 = v13 - 1;
      v247 = (int)v17;
      v249 = v19;
      v93 = vcvtps_s32_f32((float)v16 * 0.25);
      v240 = vcvtps_s32_f32((float)v13 * 0.25);
      __x[0] = 0;
      std::vector<int>::vector(&v338, v240 * v93, __x);
      v268 = 0;
      v94 = 0;
      v261 = v93;
      v262 = v93;
      v259 = v318;
      v260 = v317;
      v257 = v316;
      v258 = v315;
      v269 = v93 - 1;
      ptrb = (unint64_t)(v16 - 1) >> 2;
      v255 = v314;
      v256 = v313;
      v263 = (unint64_t)(v23 - 1) >> 2;
      v264 = v15;
      v95 = 1;
      v253 = v312;
      v254 = v311;
      v265 = v14;
      v266 = v16;
      do
      {
        v267 = v94;
        if (v16 >= 1)
        {
          v96 = 0;
          v97 = 0;
          v98 = v94;
          v99 = &v14[v15 * v94];
          v275 = v258 + v257 * v94;
          v278 = v260 + v259 * v94;
          v272 = v254 + v253 * v94;
          v273 = v256 + v255 * v94;
          v270 = v268 * v262;
          if ((int)v94 <= 1)
            v100 = 1;
          else
            v100 = v94;
          v101 = (v100 - 1);
          if ((int)v268 <= 1)
            v102 = 1;
          else
            v102 = v268;
          v103 = &v14[v15 * v101];
          v281 = (v102 - 1) * v261;
          v271 = &v14[v15 * v98];
          do
          {
            if (*(float *)&v99[4 * v96] >= 0.5)
            {
              v104 = *(float *)(v278 + 4 * v96);
              v105 = *(float *)(v275 + 4 * v96);
              v106 = *(float *)(v273 + 4 * v96);
              v107 = *(float *)(v272 + 4 * v96);
              v336 = 0u;
              *(_OWORD *)__x = 0u;
              v337 = 1065353216;
              v108 = v17;
              if ((int)(v96 | 1) >= (int)v17)
                v109 = v17;
              else
                v109 = v96 | 1;
              if ((int)v97 <= 1)
                v110 = 1;
              else
                v110 = v97;
              v111 = v110 - 1;
              if ((int)v97 + 1 < v269)
                v112 = v97 + 1;
              else
                v112 = v269;
              if ((int)v96 <= 1)
                v113 = 1;
              else
                v113 = v96;
              v114 = (v113 - 1);
              if (*(float *)&v103[4 * v114] >= 0.5)
              {
                v115 = v338.__begin_[v281 + v111];
                std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((float *)__x, v115, v115);
              }
              if (*(float *)&v103[4 * (int)v96] >= 0.5)
              {
                v116 = v338.__begin_[v281 + (int)v97];
                std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((float *)__x, v116, v116);
              }
              if (*(float *)&v103[4 * v109] >= 0.5)
              {
                v117 = v338.__begin_[v112 + v281];
                std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((float *)__x, v117, v117);
              }
              if (*(float *)&v271[4 * v114] >= 0.5)
              {
                v118 = v338.__begin_[v261 * (int)v268 + v111];
                std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((float *)__x, v118, v118);
              }
              v119 = (float)((float)(v104 + v105) + v106) + v107;
              v333 = 0u;
              v332 = 0u;
              v334 = 1065353216;
              v120 = (uint64_t *)v336;
              v17 = v108;
              if (!(_QWORD)v336)
                goto LABEL_122;
              do
              {
                v121 = *((_DWORD *)v120 + 4);
                if (v121 >= 1)
                  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((float *)&v332, v121, *((_DWORD *)v120 + 4));
                v120 = (uint64_t *)*v120;
              }
              while (v120);
              if (*((_QWORD *)&v333 + 1))
              {
                v122 = (uint64_t *)v333;
                v123 = *(uint64_t **)v333;
                if (*(_QWORD *)v333)
                {
                  do
                  {
                    if (*((_DWORD *)v123 + 4) < *((_DWORD *)v122 + 4))
                      v122 = v123;
                    v123 = (uint64_t *)*v123;
                  }
                  while (v123);
                }
                v124 = *((_DWORD *)v122 + 4);
                LODWORD(v329[0]) = v124;
                v338.__begin_[v97 + v270] = v124;
                v125 = std::__hash_table<std::__hash_value_type<int,std::pair<int,float>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<int,float>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<int,float>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<int,float>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)backgroundColor, v124, v329);
                ++*((_DWORD *)v125 + 5);
                v126 = (float *)std::__hash_table<std::__hash_value_type<int,std::pair<int,float>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<int,float>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<int,float>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<int,float>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)backgroundColor, v124, v329);
                v126[6] = v119 + v126[6];
                for (j = (uint64_t *)v333; j; j = (uint64_t *)*j)
                {
                  v331 = *((_DWORD *)j + 4);
                  v128 = v331;
                  if (v128 != *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)v297, v124, v329)+ 5))*((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)v297, v128, &v331)+ 5) = v124;
                }
              }
              else
              {
LABEL_122:
                *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)v297, v95, &v340)+ 5) = v95;
                v338.__begin_[v97 + v270] = v95;
                *((_DWORD *)std::__hash_table<std::__hash_value_type<int,std::pair<int,float>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<int,float>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<int,float>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<int,float>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)backgroundColor, v95, &v340)+ 5) = 1;
                *((float *)std::__hash_table<std::__hash_value_type<int,std::pair<int,float>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<int,float>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<int,float>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<int,float>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)backgroundColor, v95++, &v340)+ 6) = v119;
                v340 = v95;
              }
              std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&v332);
              std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)__x);
            }
            v96 += 4;
            v129 = v97++ == ptrb;
          }
          while (!v129);
        }
        v94 = v267 + 4;
        v15 = v264;
        v129 = v268++ == v263;
        v14 = v265;
        v16 = v266;
      }
      while (!v129);
      if (*((_QWORD *)&v298 + 1))
      {
        v336 = 0u;
        *(_OWORD *)__x = 0u;
        v337 = 1065353216;
        v333 = 0u;
        v332 = 0u;
        v334 = 1065353216;
        memset(v329, 0, sizeof(v329));
        v330 = 1065353216;
        v130 = (uint64_t *)v298;
        v19 = v242;
        if ((_QWORD)v298)
        {
          do
          {
            v132 = *((_DWORD *)v130 + 4);
            v131 = (int *)(v130 + 2);
            if (v132 == *((_DWORD *)v130 + 5))
            {
              *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)__x, *((_DWORD *)v130 + 4), (_DWORD *)v130 + 4)+ 5) = v132;
              v133 = *((_DWORD *)std::__hash_table<std::__hash_value_type<int,std::pair<int,float>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<int,float>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<int,float>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<int,float>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)backgroundColor, *v131, (_DWORD *)v130 + 4)+ 5);
              *((float *)std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v332, *v131, (_DWORD *)v130 + 4)+ 5) = (float)v133;
              v134 = std::__hash_table<std::__hash_value_type<int,std::unordered_set<int>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::unordered_set<int>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::unordered_set<int>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::unordered_set<int>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v329, *v131, (_DWORD *)v130 + 4);
              std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((float *)v134 + 6, *v131, *v131);
            }
            v130 = (uint64_t *)*v130;
          }
          while (v130);
          for (k = (uint64_t *)v298; k; k = (uint64_t *)*k)
          {
            v136 = *((_DWORD *)k + 4);
            v331 = v136;
            if (*(_QWORD *)&__x[2])
            {
              v137 = (uint8x8_t)vcnt_s8(*(int8x8_t *)&__x[2]);
              v137.i16[0] = vaddlv_u8(v137);
              if (v137.u32[0] > 1uLL)
              {
                v138 = v136;
                if (*(_QWORD *)&__x[2] <= (unint64_t)v136)
                  v138 = (unint64_t)v136 % *(_QWORD *)&__x[2];
              }
              else
              {
                v138 = (*(_QWORD *)&__x[2] - 1) & v136;
              }
              v139 = *(uint64_t ***)(*(_QWORD *)__x + 8 * v138);
              if (v139)
              {
                for (m = *v139; m; m = (uint64_t *)*m)
                {
                  v141 = m[1];
                  if (v141 == v136)
                  {
                    if (*((_DWORD *)m + 4) == v136)
                      goto LABEL_153;
                  }
                  else
                  {
                    if (v137.u32[0] > 1uLL)
                    {
                      if (v141 >= *(_QWORD *)&__x[2])
                        v141 %= *(_QWORD *)&__x[2];
                    }
                    else
                    {
                      v141 &= *(_QWORD *)&__x[2] - 1;
                    }
                    if (v141 != v138)
                      break;
                  }
                }
              }
            }
            v142 = v297[0];
            v143 = v297[1];
            v144 = *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>((uint64_t)v297[0], (unint64_t)v297[1], v136)+ 5);
            for (n = v136;
                  v144 != n;
                  v144 = *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>((uint64_t)v142, (unint64_t)v143, v144)+ 5))
            {
              n = v144;
            }
            v328 = n;
            *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)__x, v136, &v331)+ 5) = n;
            v146 = *((_DWORD *)std::__hash_table<std::__hash_value_type<int,std::pair<int,float>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<int,float>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<int,float>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<int,float>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)backgroundColor, v136, &v331)+ 5);
            v147 = (float *)std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v332, n, &v328);
            v147[5] = v147[5] + (float)v146;
            v148 = std::__hash_table<std::__hash_value_type<int,std::unordered_set<int>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::unordered_set<int>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::unordered_set<int>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::unordered_set<int>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v329, n, &v328);
            std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((float *)v148 + 6, v136, v136);
LABEL_153:
            ;
          }
        }
        v149 = (float *)v333;
        v150 = *(float **)v333;
        if (*(_QWORD *)v333)
        {
          v151 = v241;
          do
          {
            if (v149[5] < v150[5])
              v149 = v150;
            v150 = *(float **)v150;
          }
          while (v150);
        }
        else
        {
          v151 = v241;
        }
        v331 = *((_DWORD *)v149 + 4);
        v176 = 0;
        v177 = 0;
        v178 = std::__hash_table<std::__hash_value_type<int,std::unordered_set<int>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::unordered_set<int>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::unordered_set<int>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::unordered_set<int>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v329, v331, &v331)+ 3;
        begin = v338.__begin_;
        v180 = 4 * v262;
        ptrc = v338.__begin_;
        while (v266 < 1)
        {
LABEL_220:
          v177 += 4;
          ++v176;
          begin = (std::vector<int>::pointer)((char *)begin + v180);
          if (v177 >= v151)
          {
            v176 = 0;
            v183 = v249;
            goto LABEL_223;
          }
        }
        v181 = 0;
        while (1)
        {
          v182 = begin[v181];
          if (v182 >= 1)
          {
            if (std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(v178, v182))
              break;
          }
          if ((int)(++v181 * 4) >= v266)
            goto LABEL_220;
        }
        v183 = v177;
LABEL_223:
        v282 = v183;
        v184 = v240;
        v185 = &ptrc[(v240 - 1) * v262];
        while (1)
        {
          --v184;
          if (v266 >= 1)
            break;
LABEL_229:
          v185 -= v262;
          v57 = v244 <= 3;
          v244 -= 4;
          if (v57)
          {
            v250 = 0;
            v184 = 0;
            goto LABEL_233;
          }
        }
        v186 = 0;
        while (1)
        {
          v187 = v185[v186];
          if (v187 >= 1)
          {
            if (std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(v178, v187))
              break;
          }
          if ((int)(++v186 * 4) >= v266)
            goto LABEL_229;
        }
        v250 = v244;
LABEL_233:
        if (v266 < 1)
        {
          v195 = 0;
        }
        else
        {
          v279 = v17;
          v188 = 0;
          v276 = (v184 + 1);
          v189 = &ptrc[v262 * v176];
          while ((int)v176 > v184)
          {
LABEL_240:
            v188 += 4;
            ++v189;
            if (v188 >= v266)
              goto LABEL_243;
          }
          v190 = v189;
          v191 = v276 - v176;
          while (*v190 < 1
               || !std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(v178, *v190))
          {
            v190 = (int *)((char *)v190 + v180);
            if (!--v191)
              goto LABEL_240;
          }
          v247 = v188;
LABEL_243:
          v192 = (uint64_t)&ptrc[v262 - 1 + v262 * v176];
          v19 = v242;
          while ((int)v176 > v184)
          {
LABEL_249:
            v192 -= 4;
            v57 = v243 <= 3;
            v243 -= 4;
            if (v57)
            {
              v195 = 0;
              goto LABEL_253;
            }
          }
          v193 = (int *)v192;
          v194 = v276 - v176;
          while (*v193 < 1
               || !std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(v178, *v193))
          {
            v193 = (int *)((char *)v193 + v180);
            if (!--v194)
              goto LABEL_249;
          }
          v195 = v243;
LABEL_253:
          LODWORD(v17) = v279;
        }
        std::__hash_table<std::__hash_value_type<int,std::unordered_set<int>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::unordered_set<int>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::unordered_set<int>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::unordered_set<int>>>>::~__hash_table((uint64_t)v329);
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&v332);
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)__x);
        v26 = v247;
        v20 = v250;
        v18 = v195;
        v27 = v282;
      }
      else
      {
        v26 = v247;
        v27 = v249;
        v18 = 0;
        v20 = 0;
        v19 = v242;
      }
      if (v338.__begin_)
      {
        v338.__end_ = v338.__begin_;
        operator delete(v338.__begin_);
      }
    }
  }
  else
  {
LABEL_12:
    v26 = (int)v17;
    v27 = v19;
    v18 = 0;
    v20 = 0;
  }
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)backgroundColor);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v297);
  v246 = v18;
  v248 = v20;
  ptr = v26;
  if (!(v18 | v20))
    goto LABEL_25;
  if ((int)v26 <= 14)
    v28 = 14;
  else
    v28 = v26;
  v29 = v18 + 14;
  if ((int)v18 + 14 >= (int)v17)
    v29 = v17;
  if ((int)v27 <= 14)
    v30 = 14;
  else
    v30 = v27;
  v31 = (v30 - 14);
  v32 = v20 + 14;
  if ((int)v20 + 14 >= v19)
    v32 = v19;
  if (v31 > v32)
  {
LABEL_25:
    v33 = 0;
    v34 = 0;
LABEL_26:
    v35 = 0;
    v36 = 0;
LABEL_27:
    v37 = 0;
    v38 = 0;
LABEL_28:
    v39 = 0;
    v40 = 0;
    goto LABEL_29;
  }
  v33 = 0;
  v34 = 0;
  v152 = (v28 - 14);
  v153 = v317 + v318 * v31;
  v154 = -1000000.0;
  v155 = v31;
  do
  {
    for (ii = v152; ii <= v29; ++ii)
    {
      if (*(float *)(v153 + 4 * ii) > v154)
      {
        v33 = v155;
        v34 = ii;
        v154 = *(float *)(v153 + 4 * ii);
      }
    }
    ++v155;
    v153 += v318;
  }
  while (v155 <= v32);
  if (v31 > v32)
    goto LABEL_26;
  v35 = 0;
  v36 = 0;
  v157 = v315 + v316 * v31;
  v158 = -1000000.0;
  v159 = v31;
  do
  {
    for (jj = v152; jj <= v29; ++jj)
    {
      if (*(float *)(v157 + 4 * jj) > v158)
      {
        v35 = v159;
        v36 = jj;
        v158 = *(float *)(v157 + 4 * jj);
      }
    }
    ++v159;
    v157 += v316;
  }
  while (v159 <= v32);
  if (v31 > v32)
    goto LABEL_27;
  v37 = 0;
  v38 = 0;
  v161 = v313 + v314 * v31;
  v162 = -1000000.0;
  v163 = v31;
  do
  {
    for (kk = v152; kk <= v29; ++kk)
    {
      if (*(float *)(v161 + 4 * kk) > v162)
      {
        v37 = v163;
        v38 = kk;
        v162 = *(float *)(v161 + 4 * kk);
      }
    }
    ++v163;
    v161 += v314;
  }
  while (v163 <= v32);
  if (v31 > v32)
    goto LABEL_28;
  v39 = 0;
  v40 = 0;
  v165 = v311 + v312 * v31;
  v166 = -1000000.0;
  do
  {
    for (mm = v152; mm <= v29; ++mm)
    {
      if (*(float *)(v165 + 4 * mm) > v166)
      {
        v39 = v31;
        v40 = mm;
        v166 = *(float *)(v165 + 4 * mm);
      }
    }
    ++v31;
    v165 += v312;
  }
  while (v31 <= v32);
LABEL_29:
  v41 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)&format, v33, v34, 0);
  v42 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)&format, v35, v36, 1);
  v43 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)&format, v37, v38, 2);
  v44 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)&format, v39, v40, 3);
  *(_QWORD *)&v336 = 0;
  *(_QWORD *)&__x[2] = 0;
  *(_QWORD *)__x = &__x[2];
  LODWORD(v297[0]) = 0;
  std::vector<float>::vector(&v332, 8uLL, v297);
  v45 = (float)(unint64_t)(v34 + 1) / v12;
  v46 = (float *)v332;
  *(float *)v332 = v45;
  v46[1] = 1.0 - (float)((float)(unint64_t)(v33 + 1) / v11);
  v46[2] = (float)(unint64_t)(v36 + 1) / v12;
  v46[3] = 1.0 - (float)((float)(unint64_t)(v35 + 1) / v11);
  v46[4] = (float)(unint64_t)(v38 + 1) / v12;
  v46[5] = 1.0 - (float)((float)(unint64_t)(v37 + 1) / v11);
  v46[6] = (float)(unint64_t)(v40 + 1) / v12;
  v46[7] = 1.0 - (float)((float)(unint64_t)(v39 + 1) / v11);
  v47 = (float *)*((_QWORD *)&v332 + 1);
  if (v46 == *((float **)&v332 + 1))
  {
    v56 = v46;
    v48 = (uint64_t)v251;
  }
  else
  {
    v48 = (uint64_t)v251;
    do
    {
      v49 = *v46;
      if ((float)(1.0 - *v46) < *v46)
        v49 = 1.0 - *v46;
      v50 = -v49;
      v51 = *(uint64_t **)&__x[2];
      v52 = &__x[2];
      v53 = &__x[2];
      if (*(_QWORD *)&__x[2])
      {
        while (1)
        {
          while (1)
          {
            v53 = (std::vector<int>::value_type *)v51;
            v54 = *((float *)v51 + 7);
            if (v54 <= v50)
              break;
            v51 = (uint64_t *)*v51;
            v52 = v53;
            if (!*(_QWORD *)v53)
              goto LABEL_40;
          }
          if (v54 >= v50)
            break;
          v51 = (uint64_t *)v51[1];
          if (!v51)
          {
            v52 = v53 + 2;
            goto LABEL_40;
          }
        }
      }
      else
      {
LABEL_40:
        v55 = (float *)operator new(0x20uLL);
        v55[7] = v50;
        *(_QWORD *)v55 = 0;
        *((_QWORD *)v55 + 1) = 0;
        *((_QWORD *)v55 + 2) = v53;
        *(_QWORD *)v52 = v55;
        if (**(_QWORD **)__x)
        {
          *(_QWORD *)__x = **(_QWORD **)__x;
          v55 = *(float **)v52;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)&__x[2], (uint64_t *)v55);
        *(_QWORD *)&v336 = v336 + 1;
      }
      ++v46;
    }
    while (v46 != v47);
    v46 = (float *)*((_QWORD *)&v332 + 1);
    v56 = (float *)v332;
  }
  v57 = v10 > 0.06 && *(float *)(*(_QWORD *)__x + 28) < -0.025;
  if (v57)
    v58 = (float)((float)((float)(v41 + v42) + v43) + v44) * 0.25;
  else
    v58 = 0.0;
  if (v56 != v46)
  {
    v59 = v297;
    v60 = (float32x2_t *)v56;
    do
    {
      v61 = *v60++;
      *(float64x2_t *)v59 = vcvtq_f64_f32(v61);
      v59 += 2;
    }
    while (v60 != (float32x2_t *)v46);
  }
  v62 = 0;
  v63 = *(float64x2_t *)MEMORY[0x1E0C9D538];
  do
  {
    v63 = vaddq_f64(v63, *(float64x2_t *)&v297[v62]);
    v62 += 2;
  }
  while (v62 != 8);
  v64 = 0;
  v65 = 0.25 * v63.f64[0];
  v66 = vmuld_lane_f64(0.25, v63, 1);
  v67 = (double *)&v297[1];
  do
  {
    v68 = atan2(*v67 - v66, *(v67 - 1) - v65);
    *(float *)((char *)v329 + v64) = v68;
    v64 += 4;
    v67 += 2;
  }
  while (v64 != 16);
  v69 = 0;
  *(_OWORD *)backgroundColor = xmmword_1A15DD910;
  v342 = xmmword_1A15DD920;
  v70 = 1;
  v71 = backgroundColor;
  do
  {
    v72 = &backgroundColor[v70];
    v73 = *(_QWORD *)v72;
    v74 = *(_QWORD *)v71;
    v75 = *((float *)v329 + *(_QWORD *)v72);
    if (v75 < *((float *)v329 + v74))
    {
      v76 = v69;
      while (1)
      {
        v77 = backgroundColor;
        *(_QWORD *)((char *)&backgroundColor[1] + v76) = v74;
        if (!v76)
          break;
        v74 = *(_QWORD *)&v339[v76];
        v76 -= 8;
        if (v75 >= *((float *)v329 + v74))
        {
          v77 = (CGFloat *)((char *)&backgroundColor[1] + v76);
          break;
        }
      }
      *(_QWORD *)v77 = v73;
    }
    ++v70;
    v69 += 8;
    v71 = v72;
  }
  while (v70 != 4);
  v78 = *(_OWORD *)&v297[2 * *(_QWORD *)&backgroundColor[0]];
  v79 = *(_OWORD *)&v297[2 * *(_QWORD *)&backgroundColor[1]];
  v80 = *(_OWORD *)&v297[2 * *((_QWORD *)&v342 + 1)];
  v290 = *(_OWORD *)&v297[2 * v342];
  v291 = v80;
  v288 = v78;
  v289 = v79;
  v292 = ptr;
  v293 = v246;
  v294 = v27;
  v295 = v248;
  v296 = v58;
  if (v56)
  {
    *((_QWORD *)&v332 + 1) = v56;
    operator delete(v56);
  }
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(*(_QWORD **)&__x[2]);
  free(v309);
  free(v310);
  vision::mod::ImageAnalyzer_Tensor3D::~ImageAnalyzer_Tensor3D((vision::mod::ImageAnalyzer_Tensor3D *)&format);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&buf);
  __x[0] = 0;
  vision::mod::ImageAnalyzer::getSceneSaliency((vision::mod::ImageAnalyzer *)&format, v48);
  vision::mod::ImageAnalyzer_Tensor2D::getVImageBufferFromTensor((uint64_t)&buf, (int8x16_t *)&format, __x);
  data = (char *)buf.data;
  height = buf.height;
  width = buf.width;
  rowBytes = buf.rowBytes;
  free(v324);
  free(v325);
  if (data)
  {
    baseAddress[0] = (void *)MEMORY[0x1E0C809B0];
    baseAddress[1] = (void *)3221225472;
    bytesPerRow[0] = (size_t)__92__VNDocumentSegmentationDetector__calculateIoUWithImageAnalyzer_quadrilateral_bounds_error___block_invoke;
    bytesPerRow[1] = (size_t)&__block_descriptor_80_e15___CGImage__8__0l;
    v303 = data;
    v304 = height;
    v305 = width;
    v306 = rowBytes;
    v307 = width;
    v308 = &v288;
    v85 = __92__VNDocumentSegmentationDetector__calculateIoUWithImageAnalyzer_quadrilateral_bounds_error___block_invoke((uint64_t)baseAddress);
    if (v85)
    {
      std::vector<unsigned char>::vector(v297, width * height);
      v277 = rowBytes;
      ptra = (char *)v297[0];
      BitmapInfo = CGImageGetBitmapInfo(v85);
      v274 = data;
      if (CGImageGetImageProvider())
      {
        ComponentType = CGImageProviderGetComponentType();
        ColorSpace = (CGColorSpace *)CGImageProviderGetColorSpace();
        PixelSize = CGImageProviderGetPixelSize();
        v89 = ComponentType == 1;
        v90 = ComponentType == 4;
        AlphaInfo = CGImageProviderGetAlphaInfo();
      }
      else
      {
        ColorSpace = CGImageGetColorSpace(v85);
        PixelSize = CGImageGetBitsPerPixel(v85) >> 3;
        v89 = CGImageGetBitsPerComponent(v85) == 8;
        v90 = CGImageGetBitsPerComponent(v85) == 32;
        AlphaInfo = CGImageGetAlphaInfo(v85);
      }
      v168 = AlphaInfo;
      v169 = 0;
      v170 = 1;
      if (!v89 && !v90 || !ColorSpace)
        goto LABEL_299;
      Model = CGColorSpaceGetModel(ColorSpace);
      if (v168 <= 6 && ((1 << v168) & 0x54) != 0)
      {
        v172 = 0;
      }
      else
      {
        v172 = 1;
        if (v89 && PixelSize == 1 && !v168)
        {
          v169 = 1;
          if (Model != kCGColorSpaceModelRGB)
            goto LABEL_291;
        }
      }
      v173 = BitmapInfo & 0x7000;
      if (PixelSize == 4 && v89)
      {
        if (v168 <= 5 && ((1 << v168) & 0x2A) != 0)
        {
          v175 = Model != kCGColorSpaceModelRGB;
          if (Model == kCGColorSpaceModelRGB && (BitmapInfo & 0x7000) == 0)
          {
            v169 = 2;
LABEL_290:
            v172 = 1;
            goto LABEL_291;
          }
        }
        else
        {
          v175 = Model != kCGColorSpaceModelRGB;
        }
        v196 = v172 | v175;
        if (((v172 | v175) & 1) == 0 && (BitmapInfo & 0x7000) == 0)
        {
          v169 = 8;
          goto LABEL_290;
        }
        if (v168 <= 5 && ((1 << v168) & 0x2A) != 0)
        {
          if (v173 != 0x2000)
            v175 = 1;
          if (!v175)
          {
            v169 = 4;
            goto LABEL_290;
          }
        }
        if (v173 == 0x2000)
          v197 = v196;
        else
          v197 = 1;
        if (v197 != 1)
        {
          v169 = 16;
          goto LABEL_290;
        }
      }
      if (PixelSize == 4 && v90)
      {
        v169 = 0;
        v172 = 1;
        if (v168 <= 5 && ((1 << v168) & 0x2A) != 0)
          v169 = 32 * (Model != kCGColorSpaceModelRGB);
      }
      else
      {
        if (PixelSize != 16 || !v89)
        {
          v169 = 0;
          goto LABEL_290;
        }
        if (v168 <= 5 && ((1 << v168) & 0x2A) != 0)
        {
          v200 = Model != kCGColorSpaceModelRGB;
          if (Model == kCGColorSpaceModelRGB && (BitmapInfo & 0x7000) == 0)
          {
            v172 = 0;
            v169 = 64;
            goto LABEL_291;
          }
        }
        else
        {
          v200 = Model != kCGColorSpaceModelRGB;
        }
        v238 = v172 | v200;
        if (((v172 | v200) & 1) != 0 || (BitmapInfo & 0x7000) != 0)
        {
          if (v168 > 5 || ((1 << v168) & 0x2A) == 0)
            goto LABEL_366;
          if (v173 != 0x2000)
            v200 = 1;
          if (!v200)
          {
            v172 = 0;
            v169 = 128;
          }
          else
          {
LABEL_366:
            if (v173 == 0x2000)
              v172 = v238;
            else
              v172 = 1;
            if (v172)
              v169 = 0;
            else
              v169 = 512;
          }
        }
        else
        {
          v172 = 0;
          v169 = 256;
        }
      }
LABEL_291:
      v201 = CGImageGetWidth(v85);
      v202 = CGImageGetHeight(v85);
      v203 = CGImageGetBytesPerRow(v85);
      if ((v169 & 1) != 0)
      {
        v205 = 1;
      }
      else
      {
        if ((v169 & 0x3E) != 0)
          v204 = 0;
        else
          v204 = v172;
        v205 = 4;
        if ((v169 & 0x3E) == 0)
          v205 = 16;
        if (v204 == 1)
        {
          syslog(5, "ERROR: Invalid image type");
LABEL_299:
          v206 = (uint64_t)v251;
          v207 = ptra;
          goto LABEL_315;
        }
      }
      v207 = ptra;
      *(_QWORD *)&v208 = height;
      *((_QWORD *)&v208 + 1) = width;
      if (ptra
        && width
        && height
        && width >= 2
        && (*(_QWORD *)&v208 = v202, *((_QWORD *)&v208 + 1) = v201, height >= v202)
        && v203 >= width)
      {
        *(_OWORD *)ptrd = v208;
      }
      else
      {
        *(_OWORD *)ptrd = v208;
        v209 = (v205 * v201 + 15) & 0xFFFFFFFFFFFFFFF0;
        v207 = (char *)malloc_type_realloc(v207, v209 * v202, 0xA423628BuLL);
        if (v207)
        {
          *(_QWORD *)&v210 = v202;
          *((_QWORD *)&v210 + 1) = v201;
          *(_OWORD *)ptrd = v210;
          width = v209;
        }
      }
      *(_QWORD *)&format.renderingIntent = 0;
      format.bitsPerComponent = CGImageGetBitsPerComponent(v85);
      format.bitsPerPixel = CGImageGetBitsPerPixel(v85);
      format.colorSpace = CGImageGetColorSpace(v85);
      format.bitmapInfo = CGImageGetBitmapInfo(v85);
      *(_OWORD *)&format.version = 0uLL;
      backgroundColor[0] = 0.0;
      buf.data = v207;
      *(_OWORD *)&buf.height = *(_OWORD *)ptrd;
      buf.rowBytes = width;
      v206 = (uint64_t)v251;
      if (!vImageBuffer_InitWithCGImage(&buf, &format, backgroundColor, v85, 0x300u))
      {
        if (buf.height)
        {
          v211 = 0;
          v212 = (char *)buf.data;
          v213 = v207;
          do
          {
            memcpy(v213, v212, width);
            v213 += width;
            v212 += buf.rowBytes;
            ++v211;
          }
          while (v211 < buf.height);
          v170 = 0;
          v206 = (uint64_t)v251;
        }
        else
        {
          v170 = 0;
        }
      }
LABEL_315:
      CGImageRelease(v85);
      if (v169 == 1)
        v214 = v170;
      else
        v214 = 1;
      if (v214 == 1)
      {
        v215 = 0.0;
        if (a7)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("failed to create comparison image"));
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v216 = v294;
        if (v294 <= v295)
        {
          v218 = 0;
          v217 = 0;
          v219 = &v207[width * v294];
          v220 = &v274[4 * v294 * (v277 >> 2)];
          do
          {
            for (nn = v292; nn <= v293; ++nn)
            {
              v222 = *(float *)&v220[4 * nn];
              if (v219[nn])
              {
                ++v218;
                if (v222 > 0.45)
                  ++v217;
              }
              else if (v222 > 0.45)
              {
                ++v218;
              }
            }
            ++v216;
            v219 += width;
            v220 += 4 * (v277 >> 2);
          }
          while (v216 <= v295);
        }
        else
        {
          v217 = 0;
          v218 = 0;
        }
        v215 = (float)v217 / (float)((float)v218 + 0.0001);
      }
      if (v297[0])
      {
        v297[1] = v297[0];
        operator delete(v297[0]);
      }
      if ((v214 & 1) != 0)
        goto LABEL_337;
      v225 = (id *)v245;
      LODWORD(buf.data) = 0;
      *(_OWORD *)baseAddress = 0u;
      *(_OWORD *)bytesPerRow = 0u;
      vision::mod::ImageAnalyzer::getSceneSaliency((vision::mod::ImageAnalyzer *)&format, v206);
      vision::mod::ImageAnalyzer_Tensor2D::getVImageBufferFromTensor((uint64_t)baseAddress, (int8x16_t *)&format, (int *)&buf);
      free(v324);
      free(v325);
      if (LODWORD(buf.data) == 32)
      {
        *(_QWORD *)&format.bitsPerComponent = 0;
        v226 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v227 = baseAddress[1];
        v228 = baseAddress[0];
        v229 = bytesPerRow[0];
        v230 = bytesPerRow[1];
        if (VNIOSurfaceBackedPixelBufferAttributes::onceToken != -1)
          dispatch_once(&VNIOSurfaceBackedPixelBufferAttributes::onceToken, &__block_literal_global_26832);
        v231 = CVPixelBufferCreateWithBytes(v226, v229, (size_t)v227, 0x4C303066u, v228, v230, 0, 0, (CFDictionaryRef)VNIOSurfaceBackedPixelBufferAttributes::pixelBufferAttributes, (CVPixelBufferRef *)&format);
        if (!(_DWORD)v231)
        {
          v234 = [VNPixelBufferObservation alloc];
          v235 = -[VNPixelBufferObservation initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:](v234, "initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:", v225, 0, *(_QWORD *)&format.bitsPerComponent);
          CVPixelBufferRelease(*(CVPixelBufferRef *)&format.bitsPerComponent);

          if (!v235)
          {
            v233 = 0;
            v223 = 0;
            goto LABEL_350;
          }
          v236 = [VNRectangleObservation alloc];
          v225 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:](v236, "initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:", v225, v291, v290, v289, v288);
          *(float *)&v237 = fminf((float)(v215 * 1.1) * v296, 0.99);
          objc_msgSend(v225, "setConfidence:", v237);
          v233 = v235;
          if (v225)
            objc_storeStrong(v225 + 17, v235);

          v344[0] = v225;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v344, 1);
          v223 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_349:

LABEL_350:
          goto LABEL_338;
        }
        if (a7)
        {
          +[VNError errorForCVReturnCode:localizedDescription:](VNError, "errorForCVReturnCode:localizedDescription:", v231, CFSTR("failed to create pixel buffer"));
          v232 = (id)objc_claimAutoreleasedReturnValue();
LABEL_347:
          *a7 = v232;
        }
      }
      else if (a7)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("unsupported pixel format type"));
        v232 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_347;
      }
      v233 = 0;
      v223 = 0;
      goto LABEL_349;
    }
    if (a7)
    {
      v92 = CFSTR("failed to create comparison image");
      goto LABEL_190;
    }
  }
  else if (a7)
  {
    v92 = CFSTR("failed to get image from tensor");
LABEL_190:
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v92);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_337:
  v223 = 0;
LABEL_338:

  return v223;
}

CGImageRef __92__VNDocumentSegmentationDetector__calculateIoUWithImageAnalyzer_quadrilateral_bounds_error___block_invoke(uint64_t a1)
{
  CGColorSpace *v2;
  CGContext *v3;
  double v4;
  double v5;
  CGImageRef Image;

  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D978]);
  v3 = CGBitmapContextCreate(0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 8uLL, *(_QWORD *)(a1 + 64), v2, 0);
  CGColorSpaceRelease(v2);
  if (!v3)
    return 0;
  v4 = (double)*(unint64_t *)(a1 + 48);
  v5 = (double)*(unint64_t *)(a1 + 40);
  CGContextBeginPath(v3);
  CGContextMoveToPoint(v3, **(double **)(a1 + 72) * v4, *(double *)(*(_QWORD *)(a1 + 72) + 8) * v5);
  CGContextAddLineToPoint(v3, *(double *)(*(_QWORD *)(a1 + 72) + 16) * v4, *(double *)(*(_QWORD *)(a1 + 72) + 24) * v5);
  CGContextAddLineToPoint(v3, *(double *)(*(_QWORD *)(a1 + 72) + 32) * v4, *(double *)(*(_QWORD *)(a1 + 72) + 40) * v5);
  CGContextAddLineToPoint(v3, *(double *)(*(_QWORD *)(a1 + 72) + 48) * v4, *(double *)(*(_QWORD *)(a1 + 72) + 56) * v5);
  CGContextAddLineToPoint(v3, **(double **)(a1 + 72) * v4, *(double *)(*(_QWORD *)(a1 + 72) + 8) * v5);
  CGContextSetGrayFillColor(v3, 1.0, 1.0);
  CGContextFillPath(v3);
  Image = CGBitmapContextCreateImage(v3);
  CGContextRelease(v3);
  return Image;
}

+ (id)modelPathForConfiguration:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "docseg_segflow-xde2zmcdh5_64000_4ch_512x288_finalFC.espresso");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:error:](VNEspressoHelpers, "pathForEspressoNetworkModelFileWithName:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)inputImageBlobNameForConfiguration:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "image");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unsigned)analysisPixelFormatTypeForConfiguration:(id)a3
{
  return 1111970369;
}

+ (BOOL)providesSegmentationLabelsForConfiguration:(id)a3
{
  return 1;
}

+ (id)segmentationLabelsFilePathForConfiguration:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "docseg_segflow-xde2zmcdh5_64000_4ch.segmentation_labels.txt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNEspressoHelpers pathForEspressoResourceWithFilename:error:](VNEspressoHelpers, "pathForEspressoResourceWithFilename:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
