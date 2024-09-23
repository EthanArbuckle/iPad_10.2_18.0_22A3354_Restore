@implementation AXShotflowNetwork

- (unint64_t)preferredSmallSide
{
  return (unint64_t)self->_input_height;
}

+ (id)cpuNetworkWithModelPath:(id)a3 configuration:(id)a4 version:(int)a5 modelType:(int64_t)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModelPath:espressoEngineID:espressoDeviceID:configuration:version:modelType:", v10, 0, 0xFFFFFFFFLL, v11, v7, a6);

  return v12;
}

+ (id)gpuNetworkWithModelPath:(id)a3 configuration:(id)a4 preferredMetalDeviceID:(int)a5 version:(int)a6 modelType:(int64_t)a7
{
  uint64_t v8;
  uint64_t v9;
  id v12;
  id v13;
  void *v14;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = a4;
  NSLog(CFSTR("Trying ANE backend: %@\n"), v12);
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModelPath:espressoEngineID:espressoDeviceID:configuration:version:modelType:", v12, 10007, v9, v13, v8, a7);

  return v14;
}

- (AXShotflowNetwork)initWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 configuration:(id)a6 version:(int)a7 modelType:(int64_t)a8
{
  char *v12;
  char *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void **v20;
  uint64_t v21;
  uint64_t j;
  int v23;
  int v24;
  unint64_t v25;
  char *v26;
  _DWORD *v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  int v42;
  int v43;
  unint64_t v44;
  char *v45;
  _DWORD *v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  int v54;
  float v55;
  float v56;
  unint64_t v57;
  float *v58;
  float *v59;
  float *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  float *v66;
  int v67;
  int IsPad;
  float v69;
  void *v70;
  void *v71;
  _QWORD *v72;
  int64x2_t *v73;
  unint64_t v74;
  void *v75;
  BOOL v76;
  unint64_t v77;
  _DWORD *v78;
  _DWORD *v79;
  _DWORD *v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  char *v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t *v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t *v98;
  char *v99;
  _QWORD *v100;
  _QWORD *v101;
  uint64_t v102;
  int64x2_t v103;
  uint64_t v104;
  uint64_t jj;
  uint64_t kk;
  uint64_t ii;
  uint64_t n;
  uint64_t m;
  uint64_t mm;
  uint64_t nn;
  uint64_t i2;
  uint64_t i1;
  int v114;
  uint64_t context;
  uint64_t plan;
  unint64_t v117;
  char *v118;
  id v119;
  char *v120;
  void *v121;
  id v122;
  std::__shared_weak_count *v123;
  unint64_t *v124;
  unint64_t v125;
  std::__shared_weak_count *v126;
  unint64_t *v127;
  unint64_t v128;
  char *v129;
  unint64_t *v130;
  char *v131;
  void *v132;
  id v133;
  char *v134;
  void *v135;
  id v136;
  char *v137;
  void *v138;
  std::__shared_weak_count *v139;
  unint64_t *v140;
  unint64_t v141;
  std::__shared_weak_count *v142;
  unint64_t *v143;
  unint64_t v144;
  uint64_t v145;
  float v146;
  unint64_t v147;
  float *v148;
  float *v149;
  uint64_t v150;
  float v151;
  float v152;
  int v153;
  float *v154;
  long double v155;
  long double v156;
  uint64_t v157;
  uint64_t v158;
  float *v159;
  uint64_t i5;
  double v161;
  long double v162;
  float v163;
  float *v164;
  float v165;
  float *v166;
  uint64_t v167;
  float v168;
  float v169;
  float v170;
  float *v171;
  uint64_t v172;
  float v173;
  float v174;
  std::__shared_weak_count *v175;
  unint64_t *v176;
  unint64_t v177;
  char *v178;
  void *v180;
  uint64_t v181;
  void **v182;
  uint64_t v183;
  uint64_t i3;
  int v185;
  int v186;
  unint64_t v187;
  char *v188;
  _DWORD *v189;
  char *v190;
  uint64_t v191;
  unint64_t v192;
  uint64_t v193;
  unint64_t v194;
  char *v195;
  char *v196;
  int v197;
  void *v198;
  void *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t i4;
  void *v203;
  int v204;
  int v205;
  unint64_t v206;
  char *v207;
  _DWORD *v208;
  char *v209;
  uint64_t v210;
  unint64_t v211;
  uint64_t v212;
  unint64_t v213;
  char *v214;
  char *v215;
  int v216;
  float v217;
  float v218;
  unint64_t v219;
  float *v220;
  float *v221;
  float *v222;
  uint64_t v223;
  unint64_t v224;
  uint64_t v225;
  unint64_t v226;
  char *v227;
  float *v228;
  int v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *exception;
  void *v237;
  void *v238;
  id v239;
  id v240;
  char *v241;
  char **v242;
  void **v243;
  char *v244;
  void **v245;
  float *v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  objc_super v266;
  _BYTE v267[128];
  _BYTE v268[128];
  void *v269[17];
  __CFString *v270;
  void *v271[16];
  _BYTE v272[128];
  void *v273[12];
  void *v274[7];
  void *v275[20];
  _OWORD __src[2];
  __int128 v277;
  __int128 v278;
  __int128 v279;
  uint64_t v280;
  void *v281[5];
  void *v282[5];
  void *v283[5];
  void *v284[3];
  void *v285[2];
  void *v286[3];
  __CFString *v287;
  void *v288;

  v288 = (void *)*MEMORY[0x1E0C80C00];
  v239 = a3;
  v240 = a6;
  v266.receiver = self;
  v266.super_class = (Class)AXShotflowNetwork;
  v12 = -[AXShotflowNetwork init](&v266, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v240, "networkThreshold");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v241 = v12;
    objc_msgSend(v14, "floatValue");
    *((_DWORD *)v12 + 341) = v15;

    *((_DWORD *)v12 + 46) = a7;
    *((_QWORD *)v12 + 1) = a8;
    v12[198] = 0;
    *((_WORD *)v12 + 98) = 1;
    *((_WORD *)v12 + 678) = 257;
    *((_DWORD *)v12 + 340) = 1140064256;
    __src[0] = xmmword_1B0EFFFF4;
    *(_QWORD *)&__src[1] = 0x43DB999943926667;
    v245 = (void **)(v12 + 288);
    std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 288, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
    __src[0] = xmmword_1B0F0000C;
    *(_QWORD *)&__src[1] = 0x3F6666663F19999ALL;
    v243 = (void **)(v12 + 312);
    std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 312, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
    if (a8 == 2)
    {
      v12[196] = 0;
      *((_DWORD *)v12 + 47) = 0;
      *((_DWORD *)v12 + 50) = 17;
      __src[0] = xmmword_1B0F001A8;
      __src[1] = unk_1B0F001B8;
      v277 = xmmword_1B0F001C8;
      v278 = unk_1B0F001D8;
      LODWORD(v279) = 17;
      std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)&v279 + 4, 0x11uLL);
      v269[0] = CFSTR("1");
      v269[1] = CFSTR("2");
      v269[2] = CFSTR("3");
      v269[3] = CFSTR("4");
      v269[4] = CFSTR("5");
      v269[5] = CFSTR("6");
      v269[6] = CFSTR("7");
      v269[7] = CFSTR("8");
      v269[8] = CFSTR("9");
      v269[9] = CFSTR("10");
      v269[10] = CFSTR("11");
      v269[11] = CFSTR("12");
      v269[12] = CFSTR("13");
      v269[13] = CFSTR("14");
      v269[14] = CFSTR("15");
      v269[15] = CFSTR("16");
      v269[16] = CFSTR("17");
      std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v269, (void **)&v270, 0x11uLL);
      for (i = 16; i != -1; --i)

      *((_QWORD *)v12 + 34) = *((_QWORD *)v12 + 33);
      v254 = 0u;
      v255 = 0u;
      v256 = 0u;
      v257 = 0u;
      objc_msgSend(v240, "ratios");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v254, v268, 16);
      if (v19)
      {
        v20 = (void **)(v12 + 264);
        v21 = *(_QWORD *)v255;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v255 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v254 + 1) + 8 * j), "floatValue");
            v24 = v23;
            v26 = (char *)*((_QWORD *)v13 + 34);
            v25 = *((_QWORD *)v13 + 35);
            if ((unint64_t)v26 >= v25)
            {
              v28 = (char *)*v20;
              v29 = (v26 - (_BYTE *)*v20) >> 2;
              v30 = v29 + 1;
              if ((unint64_t)(v29 + 1) >> 62)
                std::vector<BOOL>::__throw_length_error[abi:ne180100]();
              v31 = v25 - (_QWORD)v28;
              if (v31 >> 1 > v30)
                v30 = v31 >> 1;
              if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFFCLL)
                v32 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v32 = v30;
              if (v32)
              {
                v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v241 + 280), v32);
                v28 = (char *)*((_QWORD *)v13 + 33);
                v26 = (char *)*((_QWORD *)v13 + 34);
              }
              else
              {
                v33 = 0;
              }
              v34 = &v33[4 * v29];
              *(_DWORD *)v34 = v24;
              v27 = v34 + 4;
              while (v26 != v28)
              {
                v35 = *((_DWORD *)v26 - 1);
                v26 -= 4;
                *((_DWORD *)v34 - 1) = v35;
                v34 -= 4;
              }
              *((_QWORD *)v13 + 33) = v34;
              *((_QWORD *)v13 + 34) = v27;
              *((_QWORD *)v13 + 35) = &v33[4 * v32];
              if (v28)
                operator delete(v28);
            }
            else
            {
              *(_DWORD *)v26 = v23;
              v27 = v26 + 4;
            }
            *((_QWORD *)v13 + 34) = v27;
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v254, v268, 16);
        }
        while (v19);
      }

      objc_msgSend(v240, "ratios");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)v13 + 64) = objc_msgSend(v36, "count");

      *((_QWORD *)v13 + 37) = *((_QWORD *)v13 + 36);
      *((_QWORD *)v13 + 40) = *((_QWORD *)v13 + 39);
      v250 = 0u;
      v251 = 0u;
      v252 = 0u;
      v253 = 0u;
      objc_msgSend(v240, "defaultBoxesSidesNormalized");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v250, v267, 16);
      if (v38)
      {
        v39 = *(_QWORD *)v251;
        do
        {
          for (k = 0; k != v38; ++k)
          {
            if (*(_QWORD *)v251 != v39)
              objc_enumerationMutation(v37);
            v41 = *(void **)(*((_QWORD *)&v250 + 1) + 8 * k);
            objc_msgSend(v41, "floatValue");
            v43 = v42;
            v45 = (char *)*((_QWORD *)v13 + 40);
            v44 = *((_QWORD *)v13 + 41);
            if ((unint64_t)v45 >= v44)
            {
              v47 = (char *)*v243;
              v48 = (v45 - (_BYTE *)*v243) >> 2;
              v49 = v48 + 1;
              if ((unint64_t)(v48 + 1) >> 62)
                std::vector<BOOL>::__throw_length_error[abi:ne180100]();
              v50 = v44 - (_QWORD)v47;
              if (v50 >> 1 > v49)
                v49 = v50 >> 1;
              if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFFCLL)
                v51 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v51 = v49;
              if (v51)
              {
                v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v241 + 328), v51);
                v47 = (char *)*((_QWORD *)v13 + 39);
                v45 = (char *)*((_QWORD *)v13 + 40);
              }
              else
              {
                v52 = 0;
              }
              v53 = &v52[4 * v48];
              *(_DWORD *)v53 = v43;
              v46 = v53 + 4;
              while (v45 != v47)
              {
                v54 = *((_DWORD *)v45 - 1);
                v45 -= 4;
                *((_DWORD *)v53 - 1) = v54;
                v53 -= 4;
              }
              *((_QWORD *)v13 + 39) = v53;
              *((_QWORD *)v13 + 40) = v46;
              *((_QWORD *)v13 + 41) = &v52[4 * v51];
              if (v47)
                operator delete(v47);
            }
            else
            {
              *(_DWORD *)v45 = v42;
              v46 = v45 + 4;
            }
            *((_QWORD *)v13 + 40) = v46;
            objc_msgSend(v41, "floatValue");
            v56 = v55 * 488.0;
            v58 = (float *)*((_QWORD *)v13 + 37);
            v57 = *((_QWORD *)v13 + 38);
            if ((unint64_t)v58 >= v57)
            {
              v60 = (float *)*v245;
              v61 = ((char *)v58 - (_BYTE *)*v245) >> 2;
              v62 = v61 + 1;
              if ((unint64_t)(v61 + 1) >> 62)
                std::vector<BOOL>::__throw_length_error[abi:ne180100]();
              v63 = v57 - (_QWORD)v60;
              if (v63 >> 1 > v62)
                v62 = v63 >> 1;
              if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFFCLL)
                v64 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v64 = v62;
              if (v64)
              {
                v65 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v241 + 304), v64);
                v60 = (float *)*((_QWORD *)v13 + 36);
                v58 = (float *)*((_QWORD *)v13 + 37);
              }
              else
              {
                v65 = 0;
              }
              v66 = (float *)&v65[4 * v61];
              *v66 = v56;
              v59 = v66 + 1;
              while (v58 != v60)
              {
                v67 = *((_DWORD *)v58-- - 1);
                *((_DWORD *)v66-- - 1) = v67;
              }
              *((_QWORD *)v13 + 36) = v66;
              *((_QWORD *)v13 + 37) = v59;
              *((_QWORD *)v13 + 38) = &v65[4 * v64];
              if (v60)
                operator delete(v60);
            }
            else
            {
              *v58 = v56;
              v59 = v58 + 1;
            }
            *((_QWORD *)v13 + 37) = v59;
          }
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v250, v267, 16);
        }
        while (v38);
      }

      __src[0] = xmmword_1B0F001EC;
      *(_QWORD *)&__src[1] = 0x433F800042FF0000;
      std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v241 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
      __src[0] = xmmword_1B0F001EC;
      *(_QWORD *)&__src[1] = 0x433F800042FF0000;
      std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v241 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
      IsPad = AXDeviceIsPad();
LABEL_71:
      v69 = 0.5;
      if (IsPad)
        v69 = 1.0;
      *((float *)v13 + 338) = v69;
      *((_DWORD *)v13 + 340) = 1147142144;
LABEL_74:
      *((_WORD *)v13 + 678) = 0;
    }
    else if (a8 == 1)
    {
      switch(a7)
      {
        case 2:
          __src[0] = xmmword_1B0F00178;
          *(_QWORD *)&__src[1] = 0x432B800042D70000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B0F00190;
          *(_QWORD *)&__src[1] = 0x433B800042F70000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          *(_QWORD *)(v12 + 188) = 0x400000002;
          *((_DWORD *)v12 + 50) = 1;
          LODWORD(__src[0]) = 1;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)__src + 4, 1uLL);
          v287 = CFSTR("face");
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), (void **)&v287, &v288, 1uLL);

          LODWORD(__src[0]) = 1065353216;
          v16 = 1;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 264, (char *)__src, (uint64_t)__src + 4, 1uLL);
          goto LABEL_140;
        case 5:
          __src[0] = xmmword_1B0F00024;
          *(_QWORD *)&__src[1] = 0x4344800043048000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B0F0003C;
          *(_QWORD *)&__src[1] = 0x432F800042DF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          *(_QWORD *)(v12 + 188) = 0x400000002;
          v12[196] = 0;
          *((_DWORD *)v12 + 50) = 4;
          *(_QWORD *)&__src[0] = 0x200000001;
          DWORD2(__src[0]) = 3;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)__src + 12, 3uLL);
          v286[0] = CFSTR("human_body");
          v286[1] = CFSTR("cat");
          v286[2] = CFSTR("dog");
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v286, (void **)&v287, 3uLL);
          for (m = 2; m != -1; --m)

          goto LABEL_123;
        case 6:
          __src[0] = xmmword_1B0F00178;
          *(_QWORD *)&__src[1] = 0x432B800042D70000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B0F00190;
          *(_QWORD *)&__src[1] = 0x433B800042F70000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          *(_QWORD *)(v12 + 188) = 0x400000002;
          v12[196] = 0;
          *((_DWORD *)v12 + 50) = 2;
          *(_QWORD *)&__src[0] = 0x200000001;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)__src + 8, 2uLL);
          v285[0] = CFSTR("face");
          v285[1] = CFSTR("head");
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v285, v286, 2uLL);
          for (n = 1; n != -1; --n)

LABEL_123:
          LODWORD(__src[1]) = 1051372203;
          __src[0] = xmmword_1B0F00164;
          v16 = 5;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 264, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          goto LABEL_140;
        case 7:
          *(_QWORD *)(v12 + 188) = 0x400000002;
          v12[196] = 0;
          v12[198] = 1;
          *((_DWORD *)v12 + 50) = 4;
          *(_QWORD *)&__src[0] = 0x200000001;
          DWORD2(__src[0]) = 3;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)__src + 12, 3uLL);
          v284[0] = CFSTR("human_body");
          v284[1] = CFSTR("cat");
          v284[2] = CFSTR("dog");
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v284, v285, 3uLL);
          for (ii = 2; ii != -1; --ii)

          LODWORD(__src[1]) = 1051372203;
          __src[0] = xmmword_1B0F00164;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 264, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          *((_DWORD *)v12 + 64) = 5;
          __src[0] = xmmword_1B0F00054;
          *(_QWORD *)&__src[1] = 0x4307800041FC0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B0F0006C;
          *(_QWORD *)&__src[1] = 0x433F8000427E0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          goto LABEL_141;
        case 8:
          *(_QWORD *)(v12 + 188) = 0x500000002;
          v12[196] = 0;
          *((_DWORD *)v12 + 50) = 6;
          __src[0] = xmmword_1B0F0009C;
          LODWORD(__src[1]) = 5;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          v283[0] = CFSTR("face");
          v283[1] = CFSTR("head");
          v283[2] = CFSTR("human_body");
          v283[3] = CFSTR("cat");
          v283[4] = CFSTR("dog");
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v283, v284, 5uLL);
          for (jj = 4; jj != -1; --jj)

          LODWORD(__src[1]) = 1051372203;
          __src[0] = xmmword_1B0F00164;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 264, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          *((_DWORD *)v12 + 64) = 5;
          __src[0] = xmmword_1B0F00084;
          *(_QWORD *)&__src[1] = 0x4314800042A90000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B0F001EC;
          *(_QWORD *)&__src[1] = 0x433F800042FF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          goto LABEL_141;
        case 9:
          *((_DWORD *)v12 + 47) = 0;
          *((_DWORD *)v12 + 50) = 6;
          __src[0] = xmmword_1B0F0009C;
          LODWORD(__src[1]) = 5;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          v282[0] = CFSTR("face");
          v282[1] = CFSTR("head");
          v282[2] = CFSTR("human_body");
          v282[3] = CFSTR("cat");
          v282[4] = CFSTR("dog");
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v282, v283, 5uLL);
          for (kk = 4; kk != -1; --kk)

          goto LABEL_138;
        case 10:
          v12[197] = 1;
          *((_DWORD *)v12 + 47) = 0;
          *((_DWORD *)v12 + 50) = 6;
          __src[0] = xmmword_1B0F0009C;
          LODWORD(__src[1]) = 5;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          v281[0] = CFSTR("face");
          v281[1] = CFSTR("head");
          v281[2] = CFSTR("human_body");
          v281[3] = CFSTR("cat");
          v281[4] = CFSTR("dog");
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v281, v282, 5uLL);
          for (mm = 4; mm != -1; --mm)

          goto LABEL_138;
        case 11:
          v12[196] = 0;
          *((_DWORD *)v12 + 47) = 0;
          *((_DWORD *)v12 + 50) = 20;
          v277 = xmmword_1B0F000D0;
          v278 = unk_1B0F000E0;
          v279 = xmmword_1B0F000F0;
          __src[1] = unk_1B0F000C0;
          __src[0] = xmmword_1B0F000B0;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)&v280, 0x14uLL);
          v275[0] = CFSTR("aeroplane");
          v275[1] = CFSTR("bicycle");
          v275[2] = CFSTR("bird");
          v275[3] = CFSTR("boat");
          v275[4] = CFSTR("bottle");
          v275[5] = CFSTR("bus");
          v275[6] = CFSTR("car");
          v275[7] = CFSTR("cat");
          v275[8] = CFSTR("chair");
          v275[9] = CFSTR("cow");
          v275[10] = CFSTR("dining_table");
          v275[11] = CFSTR("dog");
          v275[12] = CFSTR("horse");
          v275[13] = CFSTR("motorbike");
          v275[14] = CFSTR("person");
          v275[15] = CFSTR("potted_plant");
          v275[16] = CFSTR("sheep");
          v275[17] = CFSTR("sofa");
          v275[18] = CFSTR("train");
          v275[19] = CFSTR("tv_monitor");
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v275, (void **)__src, 0x14uLL);
          for (nn = 19; nn != -1; --nn)

          goto LABEL_135;
        case 12:
          v12[197] = 1;
          *((_DWORD *)v12 + 47) = 0;
          *((_DWORD *)v12 + 50) = 8;
          __src[0] = xmmword_1B0F00100;
          *(_OWORD *)((char *)__src + 12) = *(__int128 *)((char *)&xmmword_1B0F00100 + 12);
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)&__src[1] + 12, 7uLL);
          v274[0] = CFSTR("face");
          v274[1] = CFSTR("head");
          v274[2] = CFSTR("human_body");
          v274[3] = CFSTR("cat");
          v274[4] = CFSTR("dog");
          v274[5] = CFSTR("food");
          v274[6] = CFSTR("drink");
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v274, v275, 7uLL);
          for (i1 = 6; i1 != -1; --i1)

LABEL_138:
          LODWORD(__src[1]) = 1051372203;
          __src[0] = xmmword_1B0F00164;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 264, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          *((_DWORD *)v12 + 64) = 5;
          __src[0] = xmmword_1B0F0011C;
          *(_QWORD *)&__src[1] = 0x431F800042BF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B0F001EC;
          *(_QWORD *)&__src[1] = 0x433F800042FF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          v114 = 1068349147;
          goto LABEL_142;
        case 13:
          v12[196] = 0;
          *((_DWORD *)v12 + 47) = 0;
          *((_DWORD *)v12 + 50) = 12;
          __src[0] = xmmword_1B0F00134;
          __src[1] = unk_1B0F00144;
          v277 = xmmword_1B0F00154;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)&v278, 0xCuLL);
          v273[0] = CFSTR("1");
          v273[1] = CFSTR("2");
          v273[2] = CFSTR("3");
          v273[3] = CFSTR("4");
          v273[4] = CFSTR("5");
          v273[5] = CFSTR("6");
          v273[6] = CFSTR("7");
          v273[7] = CFSTR("8");
          v273[8] = CFSTR("9");
          v273[9] = CFSTR("10");
          v273[10] = CFSTR("11");
          v273[11] = CFSTR("12");
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), v273, v274, 0xCuLL);
          for (i2 = 11; i2 != -1; --i2)

LABEL_135:
          LODWORD(__src[1]) = 1051372203;
          __src[0] = xmmword_1B0F00164;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 264, (char *)__src, (uint64_t)&__src[1] + 4, 5uLL);
          *((_DWORD *)v12 + 64) = 5;
          __src[0] = xmmword_1B0F001EC;
          *(_QWORD *)&__src[1] = 0x433F800042FF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B0F001EC;
          *(_QWORD *)&__src[1] = 0x433F800042FF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          *((_DWORD *)v12 + 338) = 1065353216;
          goto LABEL_74;
        case 14:
          v12[196] = 0;
          *((_DWORD *)v12 + 47) = 0;
          objc_msgSend(v240, "filterThresholds");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *((_DWORD *)v12 + 50) = objc_msgSend(v70, "count");

          v72 = v12 + 208;
          v71 = (void *)*((_QWORD *)v12 + 26);
          if (v71)
          {
            *((_QWORD *)v12 + 27) = v71;
            operator delete(v71);
            *v72 = 0;
            *((_QWORD *)v12 + 27) = 0;
            *((_QWORD *)v12 + 28) = 0;
          }
          *v72 = 0;
          *((_QWORD *)v12 + 27) = 0;
          *((_QWORD *)v12 + 28) = 0;
          memset(__src, 0, 24);
          v73 = (int64x2_t *)(v12 + 232);
          std::vector<NSString * {__strong}>::__vdeallocate((void **)v12 + 29);
          *((_QWORD *)v12 + 31) = *(_QWORD *)&__src[1];
          *(_OWORD *)(v12 + 232) = __src[0];
          memset(__src, 0, 24);
          *(_QWORD *)&v249 = __src;
          std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v249);
          v74 = 0;
          while (1)
          {
            objc_msgSend(v240, "filterThresholds");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = objc_msgSend(v75, "count") > v74;

            if (!v76)
              break;
            ++v74;
            v78 = (_DWORD *)*((_QWORD *)v12 + 27);
            v77 = *((_QWORD *)v12 + 28);
            if ((unint64_t)v78 >= v77)
            {
              v80 = (_DWORD *)*v72;
              v81 = ((uint64_t)v78 - *v72) >> 2;
              v82 = v81 + 1;
              if ((unint64_t)(v81 + 1) >> 62)
                std::vector<BOOL>::__throw_length_error[abi:ne180100]();
              v83 = v77 - (_QWORD)v80;
              if (v83 >> 1 > v82)
                v82 = v83 >> 1;
              if ((unint64_t)v83 >= 0x7FFFFFFFFFFFFFFCLL)
                v84 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v84 = v82;
              if (v84)
              {
                v85 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v12 + 224), v84);
                v80 = (_DWORD *)*((_QWORD *)v12 + 26);
                v78 = (_DWORD *)*((_QWORD *)v12 + 27);
              }
              else
              {
                v85 = 0;
              }
              v86 = &v85[4 * v81];
              *(_DWORD *)v86 = v74;
              v79 = v86 + 4;
              while (v78 != v80)
              {
                v87 = *--v78;
                *((_DWORD *)v86 - 1) = v87;
                v86 -= 4;
              }
              *((_QWORD *)v12 + 26) = v86;
              *((_QWORD *)v12 + 27) = v79;
              *((_QWORD *)v12 + 28) = &v85[4 * v84];
              if (v80)
                operator delete(v80);
            }
            else
            {
              *v78 = v74;
              v79 = v78 + 1;
            }
            *((_QWORD *)v12 + 27) = v79;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v74);
            v88 = objc_claimAutoreleasedReturnValue();
            v89 = v88;
            v91 = (uint64_t *)*((_QWORD *)v12 + 30);
            v90 = *((_QWORD *)v12 + 31);
            if ((unint64_t)v91 >= v90)
            {
              v93 = ((uint64_t)v91 - v73->i64[0]) >> 3;
              if ((unint64_t)(v93 + 1) >> 61)
                std::vector<BOOL>::__throw_length_error[abi:ne180100]();
              v94 = v90 - v73->i64[0];
              v95 = v94 >> 2;
              if (v94 >> 2 <= (unint64_t)(v93 + 1))
                v95 = v93 + 1;
              if ((unint64_t)v94 >= 0x7FFFFFFFFFFFFFF8)
                v96 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v96 = v95;
              *(_QWORD *)&v277 = v12 + 248;
              if (v96)
                v97 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v12 + 248), v96);
              else
                v97 = 0;
              v98 = (uint64_t *)&v97[8 * v93];
              v99 = &v97[8 * v96];
              *((_QWORD *)&__src[1] + 1) = v99;
              *v98 = v89;
              v92 = v98 + 1;
              *(_QWORD *)&__src[1] = v98 + 1;
              v101 = (_QWORD *)*((_QWORD *)v12 + 29);
              v100 = (_QWORD *)*((_QWORD *)v12 + 30);
              if (v100 == v101)
              {
                v103 = vdupq_n_s64((unint64_t)v100);
              }
              else
              {
                do
                {
                  v102 = *--v100;
                  *v100 = 0;
                  *--v98 = v102;
                }
                while (v100 != v101);
                v103 = *v73;
                v99 = (char *)*((_QWORD *)&__src[1] + 1);
                v92 = *(_QWORD **)&__src[1];
              }
              *((_QWORD *)v12 + 29) = v98;
              *((_QWORD *)v12 + 30) = v92;
              *(int64x2_t *)((char *)__src + 8) = v103;
              v104 = *((_QWORD *)v12 + 31);
              *((_QWORD *)v12 + 31) = v99;
              *((_QWORD *)&__src[1] + 1) = v104;
              *(_QWORD *)&__src[0] = v103.i64[0];
              std::__split_buffer<NSString * {__strong}>::~__split_buffer((uint64_t)__src);
            }
            else
            {
              *v91 = v88;
              v92 = v91 + 1;
            }
            *((_QWORD *)v12 + 30) = v92;
          }
          *((_QWORD *)v12 + 34) = *((_QWORD *)v12 + 33);
          v262 = 0u;
          v263 = 0u;
          v264 = 0u;
          v265 = 0u;
          objc_msgSend(v240, "ratios");
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          v181 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v262, v272, 16);
          if (v181)
          {
            v182 = (void **)(v12 + 264);
            v183 = *(_QWORD *)v263;
            do
            {
              for (i3 = 0; i3 != v181; ++i3)
              {
                if (*(_QWORD *)v263 != v183)
                  objc_enumerationMutation(v180);
                objc_msgSend(*(id *)(*((_QWORD *)&v262 + 1) + 8 * i3), "floatValue");
                v186 = v185;
                v188 = (char *)*((_QWORD *)v13 + 34);
                v187 = *((_QWORD *)v13 + 35);
                if ((unint64_t)v188 >= v187)
                {
                  v190 = (char *)*v182;
                  v191 = (v188 - (_BYTE *)*v182) >> 2;
                  v192 = v191 + 1;
                  if ((unint64_t)(v191 + 1) >> 62)
                    std::vector<BOOL>::__throw_length_error[abi:ne180100]();
                  v193 = v187 - (_QWORD)v190;
                  if (v193 >> 1 > v192)
                    v192 = v193 >> 1;
                  if ((unint64_t)v193 >= 0x7FFFFFFFFFFFFFFCLL)
                    v194 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v194 = v192;
                  if (v194)
                  {
                    v195 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v241 + 280), v194);
                    v190 = (char *)*((_QWORD *)v13 + 33);
                    v188 = (char *)*((_QWORD *)v13 + 34);
                  }
                  else
                  {
                    v195 = 0;
                  }
                  v196 = &v195[4 * v191];
                  *(_DWORD *)v196 = v186;
                  v189 = v196 + 4;
                  while (v188 != v190)
                  {
                    v197 = *((_DWORD *)v188 - 1);
                    v188 -= 4;
                    *((_DWORD *)v196 - 1) = v197;
                    v196 -= 4;
                  }
                  *((_QWORD *)v13 + 33) = v196;
                  *((_QWORD *)v13 + 34) = v189;
                  *((_QWORD *)v13 + 35) = &v195[4 * v194];
                  if (v190)
                    operator delete(v190);
                }
                else
                {
                  *(_DWORD *)v188 = v185;
                  v189 = v188 + 4;
                }
                *((_QWORD *)v13 + 34) = v189;
              }
              v181 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v262, v272, 16);
            }
            while (v181);
          }

          objc_msgSend(v240, "ratios");
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          *((_DWORD *)v13 + 64) = objc_msgSend(v198, "count");

          *((_QWORD *)v13 + 37) = *((_QWORD *)v13 + 36);
          *((_QWORD *)v13 + 40) = *((_QWORD *)v13 + 39);
          v258 = 0u;
          v259 = 0u;
          v260 = 0u;
          v261 = 0u;
          objc_msgSend(v240, "defaultBoxesSidesNormalized");
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          v200 = objc_msgSend(v199, "countByEnumeratingWithState:objects:count:", &v258, v271, 16);
          if (v200)
          {
            v201 = *(_QWORD *)v259;
            do
            {
              for (i4 = 0; i4 != v200; ++i4)
              {
                if (*(_QWORD *)v259 != v201)
                  objc_enumerationMutation(v199);
                v203 = *(void **)(*((_QWORD *)&v258 + 1) + 8 * i4);
                objc_msgSend(v203, "floatValue");
                v205 = v204;
                v207 = (char *)*((_QWORD *)v13 + 40);
                v206 = *((_QWORD *)v13 + 41);
                if ((unint64_t)v207 >= v206)
                {
                  v209 = (char *)*v243;
                  v210 = (v207 - (_BYTE *)*v243) >> 2;
                  v211 = v210 + 1;
                  if ((unint64_t)(v210 + 1) >> 62)
                    std::vector<BOOL>::__throw_length_error[abi:ne180100]();
                  v212 = v206 - (_QWORD)v209;
                  if (v212 >> 1 > v211)
                    v211 = v212 >> 1;
                  if ((unint64_t)v212 >= 0x7FFFFFFFFFFFFFFCLL)
                    v213 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v213 = v211;
                  if (v213)
                  {
                    v214 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v241 + 328), v213);
                    v209 = (char *)*((_QWORD *)v13 + 39);
                    v207 = (char *)*((_QWORD *)v13 + 40);
                  }
                  else
                  {
                    v214 = 0;
                  }
                  v215 = &v214[4 * v210];
                  *(_DWORD *)v215 = v205;
                  v208 = v215 + 4;
                  while (v207 != v209)
                  {
                    v216 = *((_DWORD *)v207 - 1);
                    v207 -= 4;
                    *((_DWORD *)v215 - 1) = v216;
                    v215 -= 4;
                  }
                  *((_QWORD *)v13 + 39) = v215;
                  *((_QWORD *)v13 + 40) = v208;
                  *((_QWORD *)v13 + 41) = &v214[4 * v213];
                  if (v209)
                    operator delete(v209);
                }
                else
                {
                  *(_DWORD *)v207 = v204;
                  v208 = v207 + 4;
                }
                *((_QWORD *)v13 + 40) = v208;
                objc_msgSend(v203, "floatValue");
                v218 = v217 * 488.0;
                v220 = (float *)*((_QWORD *)v13 + 37);
                v219 = *((_QWORD *)v13 + 38);
                if ((unint64_t)v220 >= v219)
                {
                  v222 = (float *)*v245;
                  v223 = ((char *)v220 - (_BYTE *)*v245) >> 2;
                  v224 = v223 + 1;
                  if ((unint64_t)(v223 + 1) >> 62)
                    std::vector<BOOL>::__throw_length_error[abi:ne180100]();
                  v225 = v219 - (_QWORD)v222;
                  if (v225 >> 1 > v224)
                    v224 = v225 >> 1;
                  if ((unint64_t)v225 >= 0x7FFFFFFFFFFFFFFCLL)
                    v226 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v226 = v224;
                  if (v226)
                  {
                    v227 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v241 + 304), v226);
                    v222 = (float *)*((_QWORD *)v13 + 36);
                    v220 = (float *)*((_QWORD *)v13 + 37);
                  }
                  else
                  {
                    v227 = 0;
                  }
                  v228 = (float *)&v227[4 * v223];
                  *v228 = v218;
                  v221 = v228 + 1;
                  while (v220 != v222)
                  {
                    v229 = *((_DWORD *)v220-- - 1);
                    *((_DWORD *)v228-- - 1) = v229;
                  }
                  *((_QWORD *)v13 + 36) = v228;
                  *((_QWORD *)v13 + 37) = v221;
                  *((_QWORD *)v13 + 38) = &v227[4 * v226];
                  if (v222)
                    operator delete(v222);
                }
                else
                {
                  *v220 = v218;
                  v221 = v220 + 1;
                }
                *((_QWORD *)v13 + 37) = v221;
              }
              v200 = objc_msgSend(v199, "countByEnumeratingWithState:objects:count:", &v258, v271, 16);
            }
            while (v200);
          }

          __src[0] = xmmword_1B0F001EC;
          *(_QWORD *)&__src[1] = 0x433F800042FF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v241 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B0F001EC;
          *(_QWORD *)&__src[1] = 0x433F800042FF0000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v241 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          IsPad = AXDeviceIsPad();
          goto LABEL_71;
        default:
          __src[0] = xmmword_1B0F00178;
          *(_QWORD *)&__src[1] = 0x432B800042D70000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1328, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          __src[0] = xmmword_1B0F00190;
          *(_QWORD *)&__src[1] = 0x433B800042F70000;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 1304, (char *)__src, (uint64_t)&__src[1] + 8, 6uLL);
          *((_DWORD *)v12 + 47) = 0;
          v12[196] = 1;
          v12[198] = 0;
          *((_DWORD *)v12 + 50) = 1;
          LODWORD(__src[0]) = 1;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 208, (char *)__src, (uint64_t)__src + 4, 1uLL);
          v270 = CFSTR("face");
          std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>((uint64_t)(v12 + 232), (void **)&v270, v271, 1uLL);

          LODWORD(__src[0]) = 1065353216;
          v16 = 1;
          std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v12 + 264, (char *)__src, (uint64_t)__src + 4, 1uLL);
LABEL_140:
          *((_DWORD *)v12 + 64) = v16;
LABEL_141:
          v114 = 1068149419;
LABEL_142:
          *((_DWORD *)v12 + 338) = v114;
          break;
      }
    }
    context = espresso_create_context();
    *((_QWORD *)v13 + 3) = context;
    if (!context || (plan = espresso_create_plan(), (*((_QWORD *)v13 + 2) = plan) == 0))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1B5E124B8](exception, "esp error");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
    objc_msgSend(objc_retainAutorelease(v239), "UTF8String");
    if (espresso_plan_add_network() || espresso_plan_build())
    {
      v237 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1B5E124B8](v237, "esp error");
      __cxa_throw(v237, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
    memset(__src, 0, sizeof(__src));
    if (espresso_network_query_blob_dimensions())
    {
      v238 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1B5E124B8](v238, "esp error");
      __cxa_throw(v238, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
    v117 = 0;
    v242 = (char **)(v241 + 48);
    v244 = v241 + 344;
    v246 = (float *)(v241 + 348);
    while (1)
    {
      if (v117 >= *((int *)v13 + 47))
      {
        v129 = (char *)operator new(0xC0uLL);
        *((_QWORD *)v129 + 1) = 0;
        *((_QWORD *)v129 + 2) = 0;
        *(_QWORD *)v129 = &unk_1E625BAA0;
        *(_OWORD *)(v129 + 40) = 0u;
        *(_OWORD *)(v129 + 56) = 0u;
        *(_OWORD *)(v129 + 72) = 0u;
        *(_OWORD *)(v129 + 88) = 0u;
        *(_OWORD *)(v129 + 104) = 0u;
        *(_OWORD *)(v129 + 120) = 0u;
        *(_OWORD *)(v129 + 136) = 0u;
        *(_OWORD *)(v129 + 152) = 0u;
        *(_OWORD *)(v129 + 168) = 0u;
        *((_QWORD *)v129 + 23) = 0;
        *(_OWORD *)(v129 + 24) = 0u;
        *(_QWORD *)&v249 = v129 + 24;
        *((_QWORD *)&v249 + 1) = v129;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logits_%ld"), v117);
        v122 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v122, "UTF8String");
        if (espresso_network_bind_buffer())
        {
          v235 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1B5E124B8](v235, "esp error");
          __cxa_throw(v235, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
        }
        std::vector<std::shared_ptr<espresso_buffer_t>>::push_back[abi:ne180100](v242, &v249);
        v126 = (std::__shared_weak_count *)*((_QWORD *)&v249 + 1);
        if (!*((_QWORD *)&v249 + 1))
          goto LABEL_167;
        v130 = (unint64_t *)(*((_QWORD *)&v249 + 1) + 8);
        do
          v128 = __ldaxr(v130);
        while (__stlxr(v128 - 1, v130));
      }
      else
      {
        v118 = (char *)operator new(0xC0uLL);
        *((_QWORD *)v118 + 1) = 0;
        *((_QWORD *)v118 + 2) = 0;
        *(_QWORD *)v118 = &unk_1E625BAA0;
        *(_OWORD *)(v118 + 40) = 0u;
        *(_OWORD *)(v118 + 56) = 0u;
        *(_OWORD *)(v118 + 72) = 0u;
        *(_OWORD *)(v118 + 88) = 0u;
        *(_OWORD *)(v118 + 104) = 0u;
        *(_OWORD *)(v118 + 120) = 0u;
        *(_OWORD *)(v118 + 136) = 0u;
        *(_OWORD *)(v118 + 152) = 0u;
        *(_OWORD *)(v118 + 168) = 0u;
        *((_QWORD *)v118 + 23) = 0;
        *(_OWORD *)(v118 + 24) = 0u;
        *(_QWORD *)&v249 = v118 + 24;
        *((_QWORD *)&v249 + 1) = v118;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logits_pos_%ld"), v117);
        v119 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v119, "UTF8String");
        if (espresso_network_bind_buffer())
        {
          v234 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1B5E124B8](v234, "esp error");
          __cxa_throw(v234, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
        }
        std::vector<std::shared_ptr<espresso_buffer_t>>::push_back[abi:ne180100](v242, &v249);
        v120 = (char *)operator new(0xC0uLL);
        *((_QWORD *)v120 + 1) = 0;
        *((_QWORD *)v120 + 2) = 0;
        *(_QWORD *)v120 = &unk_1E625BAA0;
        *(_OWORD *)(v120 + 40) = 0u;
        *(_OWORD *)(v120 + 56) = 0u;
        *(_OWORD *)(v120 + 72) = 0u;
        *(_OWORD *)(v120 + 88) = 0u;
        *(_OWORD *)(v120 + 104) = 0u;
        *(_OWORD *)(v120 + 120) = 0u;
        *(_OWORD *)(v120 + 136) = 0u;
        *(_OWORD *)(v120 + 152) = 0u;
        *(_OWORD *)(v120 + 168) = 0u;
        *((_QWORD *)v120 + 23) = 0;
        *(_OWORD *)(v120 + 24) = 0u;
        *(_QWORD *)&v248 = v120 + 24;
        *((_QWORD *)&v248 + 1) = v120;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logits_neg_%ld"), v117);
        v121 = (void *)objc_claimAutoreleasedReturnValue();

        v122 = objc_retainAutorelease(v121);
        objc_msgSend(v122, "UTF8String");
        if (espresso_network_bind_buffer())
        {
          v233 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1B5E124B8](v233, "esp error");
          __cxa_throw(v233, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
        }
        std::vector<std::shared_ptr<espresso_buffer_t>>::push_back[abi:ne180100]((char **)v241 + 9, &v248);
        v123 = (std::__shared_weak_count *)*((_QWORD *)&v248 + 1);
        if (*((_QWORD *)&v248 + 1))
        {
          v124 = (unint64_t *)(*((_QWORD *)&v248 + 1) + 8);
          do
            v125 = __ldaxr(v124);
          while (__stlxr(v125 - 1, v124));
          if (!v125)
          {
            ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
            std::__shared_weak_count::__release_weak(v123);
          }
        }
        v126 = (std::__shared_weak_count *)*((_QWORD *)&v249 + 1);
        if (!*((_QWORD *)&v249 + 1))
          goto LABEL_167;
        v127 = (unint64_t *)(*((_QWORD *)&v249 + 1) + 8);
        do
          v128 = __ldaxr(v127);
        while (__stlxr(v128 - 1, v127));
      }
      if (!v128)
      {
        ((void (*)(std::__shared_weak_count *))v126->__on_zero_shared)(v126);
        std::__shared_weak_count::__release_weak(v126);
      }
LABEL_167:
      v131 = (char *)operator new(0xC0uLL);
      *((_QWORD *)v131 + 1) = 0;
      *((_QWORD *)v131 + 2) = 0;
      *(_QWORD *)v131 = &unk_1E625BAA0;
      *(_OWORD *)(v131 + 40) = 0u;
      *(_OWORD *)(v131 + 56) = 0u;
      *(_OWORD *)(v131 + 72) = 0u;
      *(_OWORD *)(v131 + 88) = 0u;
      *(_OWORD *)(v131 + 104) = 0u;
      *(_OWORD *)(v131 + 120) = 0u;
      *(_OWORD *)(v131 + 136) = 0u;
      *(_OWORD *)(v131 + 152) = 0u;
      *(_OWORD *)(v131 + 168) = 0u;
      *((_QWORD *)v131 + 23) = 0;
      *(_OWORD *)(v131 + 24) = 0u;
      *(_QWORD *)&v249 = v131 + 24;
      *((_QWORD *)&v249 + 1) = v131;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("offsets_%ld"), v117);
      v132 = (void *)objc_claimAutoreleasedReturnValue();

      v133 = objc_retainAutorelease(v132);
      objc_msgSend(v133, "UTF8String");
      if (espresso_network_bind_buffer())
      {
        v230 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1B5E124B8](v230, "esp error");
        __cxa_throw(v230, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
      }
      std::vector<std::shared_ptr<espresso_buffer_t>>::push_back[abi:ne180100]((char **)v241 + 12, &v249);
      if (v13[196])
      {
        v134 = (char *)operator new(0xC0uLL);
        *((_QWORD *)v134 + 1) = 0;
        *((_QWORD *)v134 + 2) = 0;
        *(_QWORD *)v134 = &unk_1E625BAA0;
        *(_OWORD *)(v134 + 40) = 0u;
        *(_OWORD *)(v134 + 56) = 0u;
        *(_OWORD *)(v134 + 72) = 0u;
        *(_OWORD *)(v134 + 88) = 0u;
        *(_OWORD *)(v134 + 104) = 0u;
        *(_OWORD *)(v134 + 120) = 0u;
        *(_OWORD *)(v134 + 136) = 0u;
        *(_OWORD *)(v134 + 152) = 0u;
        *(_OWORD *)(v134 + 168) = 0u;
        *((_QWORD *)v134 + 23) = 0;
        *(_OWORD *)(v134 + 24) = 0u;
        *(_QWORD *)&v248 = v134 + 24;
        *((_QWORD *)&v248 + 1) = v134;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logits_roll_%ld"), v117);
        v135 = (void *)objc_claimAutoreleasedReturnValue();

        v136 = objc_retainAutorelease(v135);
        objc_msgSend(v136, "UTF8String");
        if (espresso_network_bind_buffer())
        {
          v231 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1B5E124B8](v231, "esp error");
          __cxa_throw(v231, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
        }
        std::vector<std::shared_ptr<espresso_buffer_t>>::push_back[abi:ne180100]((char **)v241 + 15, &v248);
        v137 = (char *)operator new(0xC0uLL);
        *((_QWORD *)v137 + 1) = 0;
        *((_QWORD *)v137 + 2) = 0;
        *(_QWORD *)v137 = &unk_1E625BAA0;
        *(_OWORD *)(v137 + 40) = 0u;
        *(_OWORD *)(v137 + 56) = 0u;
        *(_OWORD *)(v137 + 72) = 0u;
        *(_OWORD *)(v137 + 88) = 0u;
        *(_OWORD *)(v137 + 104) = 0u;
        *(_OWORD *)(v137 + 120) = 0u;
        *(_OWORD *)(v137 + 136) = 0u;
        *(_OWORD *)(v137 + 152) = 0u;
        *(_OWORD *)(v137 + 168) = 0u;
        *((_QWORD *)v137 + 23) = 0;
        *(_OWORD *)(v137 + 24) = 0u;
        *(_QWORD *)&v247 = v137 + 24;
        *((_QWORD *)&v247 + 1) = v137;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logits_yaw_%ld"), v117);
        v138 = (void *)objc_claimAutoreleasedReturnValue();

        v133 = objc_retainAutorelease(v138);
        objc_msgSend(v133, "UTF8String");
        if (espresso_network_bind_buffer())
        {
          v232 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1B5E124B8](v232, "esp error");
          __cxa_throw(v232, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
        }
        std::vector<std::shared_ptr<espresso_buffer_t>>::push_back[abi:ne180100]((char **)v241 + 18, &v247);
        v139 = (std::__shared_weak_count *)*((_QWORD *)&v247 + 1);
        if (*((_QWORD *)&v247 + 1))
        {
          v140 = (unint64_t *)(*((_QWORD *)&v247 + 1) + 8);
          do
            v141 = __ldaxr(v140);
          while (__stlxr(v141 - 1, v140));
          if (!v141)
          {
            ((void (*)(std::__shared_weak_count *))v139->__on_zero_shared)(v139);
            std::__shared_weak_count::__release_weak(v139);
          }
        }
        v142 = (std::__shared_weak_count *)*((_QWORD *)&v248 + 1);
        if (*((_QWORD *)&v248 + 1))
        {
          v143 = (unint64_t *)(*((_QWORD *)&v248 + 1) + 8);
          do
            v144 = __ldaxr(v143);
          while (__stlxr(v144 - 1, v143));
          if (!v144)
          {
            ((void (*)(std::__shared_weak_count *))v142->__on_zero_shared)(v142);
            std::__shared_weak_count::__release_weak(v142);
          }
        }
      }
      v145 = *((_QWORD *)v13 + 36);
      v146 = (float)(*(float *)(v145 + 4 * v117) * *((float *)v13 + 340)) / 488.0;
      v147 = *((int *)v13 + 64);
      if ((_DWORD)v147)
      {
        v148 = (float *)*((_QWORD *)v13 + 33);
        v149 = v246;
        v150 = *((int *)v13 + 64);
        do
        {
          v151 = *v148++;
          v152 = sqrtf(v151);
          *(v149 - 1) = v146 * v152;
          *v149 = v146 / v152;
          v149 += 2;
          --v150;
        }
        while (v150);
      }
      if (v117 < 5)
      {
        if (v13[198])
        {
          v153 = NUMBER_DEFAULT[v117];
          v154 = (float *)((char *)*v243 + 4 * v117);
          v155 = *v154;
          v156 = v154[1];
          if (v147 <= 1)
            v157 = 1;
          else
            v157 = v147;
          if (v153 <= 2)
            v158 = 2;
          else
            v158 = v153;
          v159 = (float *)&v244[8 * v147];
          for (i5 = 1; i5 != v158; ++i5)
          {
            if ((_DWORD)v147)
            {
              v161 = pow(v156, (double)(int)i5);
              v162 = pow(v155, (double)(v153 - (int)i5));
              v163 = pow(v161 * v162, 1.0 / (double)v153);
              v164 = (float *)*((_QWORD *)v13 + 33);
              v165 = v163 * 488.0;
              v166 = v159;
              v167 = v157;
              do
              {
                v168 = *v164++;
                v169 = sqrtf(v168);
                *v166 = v165 * v169;
                v166[1] = v165 / v169;
                v166 += 2;
                --v167;
              }
              while (v167);
            }
            v159 += 2 * v147;
          }
        }
        else if ((_DWORD)v147)
        {
          v170 = sqrtf((float)((float)(v146 * *(float *)(v145 + 4 * v117 + 4)) * *((float *)v13 + 340)) / 488.0);
          v171 = (float *)*((_QWORD *)v13 + 33);
          v172 = 2 * v147;
          do
          {
            v173 = *v171++;
            v174 = sqrtf(v173);
            *(float *)&v244[v172 * 4] = v170 * v174;
            v246[v172] = v170 / v174;
            v172 += 2;
            --v147;
          }
          while (v147);
        }
      }
      v175 = (std::__shared_weak_count *)*((_QWORD *)&v249 + 1);
      if (*((_QWORD *)&v249 + 1))
      {
        v176 = (unint64_t *)(*((_QWORD *)&v249 + 1) + 8);
        do
          v177 = __ldaxr(v176);
        while (__stlxr(v177 - 1, v176));
        if (!v177)
        {
          ((void (*)(std::__shared_weak_count *))v175->__on_zero_shared)(v175);
          std::__shared_weak_count::__release_weak(v175);
        }
      }

      ++v117;
      v244 += 160;
      v246 += 40;
      if (v117 == 6)
      {
        *(_OWORD *)(v13 + 168) = __src[0];
        v178 = v13;
        break;
      }
    }
  }

  return (AXShotflowNetwork *)v13;
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)AXShotflowNetwork;
  -[AXShotflowNetwork dealloc](&v3, sel_dealloc);
}

- (int)setInputShape:(unint64_t)a3 height:(unint64_t)a4
{
  int v4;
  int v5;
  int v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  if (*(_OWORD *)&self->_currentNetworkWidth == __PAIR128__(a4, a3))
    return 0;
  LODWORD(v19) = a4;
  HIDWORD(v19) = a3;
  v18 = 0x300000001;
  v17 = "image";
  v7 = espresso_plan_build_clean();
  if (!v7)
  {
    v7 = espresso_network_change_input_blob_shapes();
    if (!v7)
    {
      v7 = espresso_plan_build();
      if (!v7)
      {
        v8 = 0;
        v9 = 0;
        while (1)
        {
          if (v9 >= self->_maxout_layers)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logits_%ld"), v9, v17, v18, v19);
            v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v10, "UTF8String");
            v12 = espresso_network_bind_buffer();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logits_pos_%ld"), v9);
            v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v10, "UTF8String");
            v7 = espresso_network_bind_buffer();
            if (v7)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logits_neg_%ld"), v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = objc_retainAutorelease(v11);
            objc_msgSend(v10, "UTF8String");
            v12 = espresso_network_bind_buffer();
          }
          v7 = v12;
          if (v12)
            break;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("offsets_%ld"), v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = objc_retainAutorelease(v13);
          objc_msgSend(v10, "UTF8String");
          v7 = espresso_network_bind_buffer();
          if (v7)
            break;
          if (self->_has_pose)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logits_roll_%ld"), v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = objc_retainAutorelease(v14);
            objc_msgSend(v10, "UTF8String");
            v7 = espresso_network_bind_buffer();
            if (v7)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logits_yaw_%ld"), v9);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = objc_retainAutorelease(v15);
            objc_msgSend(v10, "UTF8String");
            v7 = espresso_network_bind_buffer();
            if (v7)
              break;
          }

          ++v9;
          v8 += 16;
          if (v9 == 6)
          {
            v7 = 0;
            self->_currentNetworkWidth = v5;
            self->_currentNetworkHeight = v4;
            return v7;
          }
        }

      }
    }
  }
  return v7;
}

- (void)runNetwork:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  void *exception;

  if (espresso_network_bind_input_vimagebuffer_bgra8() || espresso_plan_execute_sync())
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1B5E124B8](exception, "esp error");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
}

- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  _BOOL8 v4;
  vImagePixelCount width;
  vImagePixelCount height;
  __int128 v9;
  void *v10;
  double v11;
  double v12;
  float v13;
  float v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float *v18;
  uint64_t v19;
  float *v20;
  int num_ratios;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  float *v28;
  uint64_t v29;
  float *v30;
  unint64_t i;
  uint64_t bins_neg_maxout;
  float v33;
  float *v34;
  float *v35;
  int num_pos_classes;
  _DWORD *v37;
  uint64_t v38;
  float *v39;
  uint64_t v40;
  float v41;
  float v42;
  int *end;
  int *begin;
  unint64_t v45;
  uint64_t v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  AXElementDetection *v54;
  float v55;
  float v56;
  float v57;
  float v58;
  AXElementDetection *v59;
  float *v60;
  float *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *exception;
  void *v68;
  uint64_t v69;
  double v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  float v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  float v80;
  float v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  float *v85;
  float *v86;
  float v87;
  id v88;
  uint64_t v89;
  float v90;
  float v91;
  unint64_t v92;
  void *v93[3];
  _OWORD v94[3];

  v4 = a4;
  height = a3->height;
  width = a3->width;
  if (-[AXShotflowNetwork setInputShape:height:](self, "setInputShape:height:", width, height))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1B5E124B8](exception, "esp error");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)&a3->width;
  v94[0] = *(_OWORD *)&a3->data;
  v94[1] = v9;
  -[AXShotflowNetwork runNetwork:inputIsBGR:](self, "runNetwork:inputIsBGR:", v94, v4);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v71);
  v12 = v11;

  v88 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[AXShotflowNetwork threshold](self, "threshold");
  v14 = v13;
  if (v13 == 1.0)
  {
    v68 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1B5E124B8](v68, "esp error");
    __cxa_throw(v68, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  v15 = 0;
  v70 = v12 * 1000.0;
  v91 = (float)width;
  v90 = (float)height;
  v87 = v13;
  do
  {
    v16 = 16 * v15;
    v17 = *((_QWORD *)self->_logitsPosOutputs.__begin_ + 2 * v15);
    v18 = *(float **)v17;
    v92 = v15;
    if (v15 >= self->_maxout_layers)
    {
      v20 = &v18[*(_QWORD *)(v17 + 136)];
      v74 = *(_QWORD *)(v17 + 136);
      v75 = v74;
    }
    else
    {
      v19 = *((_QWORD *)self->_logitsNegOutputs.__begin_ + 2 * v15);
      v20 = *(float **)v17;
      v18 = *(float **)v19;
      v74 = *(_QWORD *)(v17 + 136);
      v75 = *(_QWORD *)(v19 + 136);
    }
    if (self->_has_pose)
    {
      v83 = **((_QWORD **)self->_rollOutputs.__begin_ + 2 * v15);
      v82 = **((_QWORD **)self->_yawOutputs.__begin_ + 2 * v15);
    }
    else
    {
      v82 = 0;
      v83 = 0;
    }
    num_ratios = self->_num_ratios;
    if (self->_extra_default_boxes)
    {
      v22 = 3 * num_ratios;
      if (v92 >= 5)
        v22 = self->_num_ratios;
      v23 = 4 * num_ratios;
      if (v92)
        v24 = v22;
      else
        v24 = v23;
      if (self->_has_pose)
      {
LABEL_17:
        v25 = *(_QWORD *)(*(_QWORD *)((char *)self->_rollOutputs.__begin_ + v16) + 136);
        v26 = *(_QWORD *)(*(_QWORD *)((char *)self->_yawOutputs.__begin_ + v16) + 136);
        goto LABEL_20;
      }
    }
    else
    {
      v24 = num_ratios << (v92 != 5);
      if (self->_has_pose)
        goto LABEL_17;
    }
    v25 = 0;
    v26 = 0;
LABEL_20:
    v27 = *(_QWORD *)((char *)self->_offsetsOutputs.__begin_ + v16);
    v28 = *(float **)v27;
    v84 = *(_QWORD *)(v17 + 80);
    v77 = *(_QWORD *)(v17 + 88);
    v76 = self->_cell_starts_y.__begin_[v92];
    v80 = self->_cell_starts_x.__begin_[v92];
    v81 = STRIDES[v92];
    v89 = *(_QWORD *)(v27 + 136);
    std::vector<float>::vector(v93, self->_num_pos_classes + 1);
    v73 = v24;
    if (v24)
    {
      v79 = 0;
      v72 = 4 * v26;
      v29 = 4 * v75;
      do
      {
        if (v77)
        {
          v78 = 0;
          v30 = self->_defaultBoxSizes[v92][v79];
          do
          {
            if (v84)
            {
              for (i = 0; i != v84; ++i)
              {
                v86 = v18;
                if (v92 >= self->_maxout_layers)
                {
                  v33 = *v18;
                }
                else
                {
                  bins_neg_maxout = self->_bins_neg_maxout;
                  if ((_DWORD)bins_neg_maxout)
                  {
                    v33 = 1.1755e-38;
                    v34 = v18;
                    do
                    {
                      v33 = fmaxf(v33, *v34);
                      v34 = (float *)((char *)v34 + v29);
                      --bins_neg_maxout;
                    }
                    while (bins_neg_maxout);
                  }
                  else
                  {
                    v33 = 1.1755e-38;
                  }
                }
                v35 = (float *)v93[0];
                *(float *)v93[0] = v33;
                num_pos_classes = self->_num_pos_classes;
                if (num_pos_classes >= 1)
                {
                  v37 = v35 + 1;
                  v38 = self->_num_pos_classes;
                  v39 = v20;
                  do
                  {
                    v33 = fmaxf(v33, *v39);
                    *v37++ = *(_DWORD *)v39;
                    v39 += v74;
                    --v38;
                  }
                  while (v38);
                }
                v85 = v20;
                if (num_pos_classes < 0)
                {
                  v41 = 0.0;
                }
                else
                {
                  v40 = (num_pos_classes + 1);
                  v41 = 0.0;
                  do
                  {
                    v42 = expf(*v35 - v33);
                    *v35++ = v42;
                    v41 = v41 + v42;
                    --v40;
                  }
                  while (v40);
                }
                begin = self->_important_classes.__begin_;
                end = self->_important_classes.__end_;
                if (end != begin)
                {
                  v45 = 0;
                  do
                  {
                    v46 = begin[v45];
                    v47 = *((float *)v93[0] + v46) / v41;
                    if (v47 > v14)
                    {
                      v48 = *v30;
                      v49 = v30[1];
                      v50 = v28[v89];
                      v51 = *v28;
                      v52 = v28[2 * v89];
                      v53 = v28[3 * v89];
                      v54 = [AXElementDetection alloc];
                      v55 = v49 / v90;
                      v56 = v48 / v91;
                      v57 = v55 * expf(v53);
                      v58 = v56 * expf(v52);
                      *(float *)&v69 = v47;
                      v59 = -[AXElementDetection initWithBox:defaultBox:confidence:scale:hasLabel:label:labelName:](v54, "initWithBox:defaultBox:confidence:scale:hasLabel:label:labelName:", v92, (int *)((char *)self->_important_classes.__end_ - (char *)self->_important_classes.__begin_) > (int *)4, v46, self->_model_labels.__begin_[v45], (float)((float)((float)((float)(v80 + (float)((float)i * v81)) / v91) + (float)(v51 * v56))- (float)(v58 * 0.5)), (float)((float)(1.0- (float)((float)((float)(v76 + (float)((float)v78 * v81)) / v90)+ (float)(v50 * v55)))- (float)(v57 * 0.5)), v58, v57, (float)((float)((float)(v80 + (float)((float)i * v81)) / v91) - (float)(v56 * 0.5)), (float)((float)(1.0 - (float)((float)(v76 + (float)((float)v78 * v81)) / v90))- (float)(v55 * 0.5)), v56, v55,
                              v69);
                      objc_msgSend(v88, "addObject:", v59);

                      begin = self->_important_classes.__begin_;
                      end = self->_important_classes.__end_;
                      v14 = v87;
                    }
                    ++v45;
                  }
                  while (v45 < end - begin);
                }
                if (self->_has_pose)
                {
                  v61 = v85;
                  v60 = v86;
                  v29 = 4 * v75;
                  if (!self->_pose_square || v79 == 5 || !v79)
                  {
                    v82 += 4;
                    v83 += 4;
                  }
                }
                else
                {
                  v61 = v85;
                  v60 = v86;
                  v29 = 4 * v75;
                }
                v20 = v61 + 1;
                v18 = v60 + 1;
                ++v28;
              }
            }
            ++v78;
          }
          while (v78 != v77);
        }
        if (v92 >= self->_maxout_layers)
        {
          v63 = self->_num_pos_classes;
          v62 = v63;
        }
        else
        {
          v62 = self->_bins_neg_maxout - 1;
          v63 = self->_num_pos_classes - 1;
        }
        if (self->_has_pose && (!self->_pose_square || v79 == 5 || !v79))
        {
          v83 += 44 * v25;
          v82 += 4 * v72;
        }
        v18 += v62 * v75;
        v20 += v63 * v74;
        v28 += 3 * v89;
        ++v79;
      }
      while (v79 != v73);
    }
    if (v93[0])
    {
      v93[1] = v93[0];
      operator delete(v93[0]);
    }
    v15 = v92 + 1;
  }
  while (v92 != 5);
  v64 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v64, "setValue:forKey:", v88, CFSTR("boxes"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v70);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setValue:forKey:", v65, CFSTR("timing"));

  return v64;
}

- (id)resizeAndProcessVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  vImagePixelCount width;
  vImagePixelCount height;
  BOOL v6;
  _BOOL8 v7;
  float v10;
  float v11;
  int v12;
  __int128 v13;
  float input_height;
  float input_aspect_ratio;
  vImagePixelCount v16;
  vImagePixelCount v17;
  vImagePixelCount v18;
  vImagePixelCount v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *exception;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  vImage_Buffer v61;
  uint8_t color[4];
  vImage_Buffer dest;
  vImage_Buffer backColor;
  vImage_Buffer buf;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  height = a3->height;
  width = a3->width;
  if (width)
    v6 = height == 0;
  else
    v6 = 1;
  if (v6)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1B5E124B8](exception, "Invalid input");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  v7 = a4;
  v10 = (float)width;
  v11 = (float)height;
  if (self->_can_rotate && v11 > v10)
  {
    LODWORD(backColor.data) = 0;
    if (vImageBuffer_Init(&buf, v10, v11, 0x20u, 0))
    {
      v56 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1B5E124B8](v56, "Intermediate buffer allocation failed");
      __cxa_throw(v56, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
    vImageRotate90_ARGB8888(a3, &buf, 1u, (const uint8_t *)&backColor, 0);
    v10 = (float)buf.width;
    v11 = (float)buf.height;
    v12 = 1;
  }
  else
  {
    v12 = 0;
    v13 = *(_OWORD *)&a3->width;
    *(_OWORD *)&buf.data = *(_OWORD *)&a3->data;
    *(_OWORD *)&buf.width = v13;
  }
  input_height = self->_input_height;
  input_aspect_ratio = self->_input_aspect_ratio;
  v16 = (unint64_t)(float)(input_height * input_aspect_ratio);
  v17 = (unint64_t)input_height;
  v18 = v16;
  v19 = (unint64_t)input_height;
  if (self->_keep_aspect_ratio)
  {
    if ((float)(v10 / v11) >= input_aspect_ratio)
    {
      v19 = (unint64_t)(float)((float)(v11 / v10) * (float)v16);
      v18 = (unint64_t)(float)(input_height * input_aspect_ratio);
    }
    else
    {
      v18 = (unint64_t)(float)((float)(v10 / v11) * (float)v17);
      v19 = (unint64_t)input_height;
    }
  }
  if (vImageBuffer_Init(&backColor, v19, v18, 0x20u, 0))
  {
    v53 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1B5E124B8](v53, "Intermediate buffer allocation failed");
    __cxa_throw(v53, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  vImageScale_ARGB8888(&buf, &backColor, 0, 0x20u);
  if (vImageBuffer_Init(&dest, v17, v16, 0x20u, 0))
  {
    v54 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1B5E124B8](v54, "Intermediate buffer allocation failed");
    __cxa_throw(v54, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  *(_DWORD *)color = -16777216;
  if (vImageBufferFill_ARGB8888(&dest, color, 0))
  {
    v55 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1B5E124B8](v55, "esp error");
    __cxa_throw(v55, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  if (SLODWORD(backColor.height) >= 1)
  {
    v20 = 0;
    do
    {
      memcpy((char *)dest.data + dest.rowBytes * v20, (char *)backColor.data + backColor.rowBytes * v20, 4 * backColor.width);
      ++v20;
    }
    while (v20 < SLODWORD(backColor.height));
  }
  if (v16 > 0x4000 || v17 > 0x4000)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  else
  {
    v61 = dest;
    -[AXShotflowNetwork processVImage:inputIsBGR:](self, "processVImage:inputIsBGR:", &v61, v7);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("boxes"));
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v58 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_msgSend(v26, "box", (_QWORD)v57);
          v29 = v28;
          v30 = (float)((float)dest.width / (float)backColor.width);
          v32 = v31 * v30;
          v33 = 1.0 - (1.0 - v27) * (float)dest.height / (float)backColor.height;
          v35 = v34 * v30;
          v36 = v29 * (float)((float)dest.height / (float)backColor.height);
          if (v12)
          {
            v37 = 1.0 - (v32 + v35);
            v38 = v36;
          }
          else
          {
            v38 = v35;
            v35 = v36;
            v37 = 1.0 - (1.0 - v27) * (float)dest.height / (float)backColor.height;
            v33 = v32;
          }
          objc_msgSend(v26, "setBox:", v33, v37, v38, v35);
          objc_msgSend(v26, "defaultBox");
          v41 = v40;
          v42 = (float)((float)dest.width / (float)backColor.width);
          v44 = v43 * v42;
          v45 = 1.0 - (1.0 - v39) * (float)dest.height / (float)backColor.height;
          v47 = v46 * v42;
          v48 = v41 * (float)((float)dest.height / (float)backColor.height);
          if (v12)
          {
            v49 = 1.0 - (v44 + v47);
            v50 = v48;
          }
          else
          {
            v50 = v47;
            v47 = v48;
            v49 = 1.0 - (1.0 - v39) * (float)dest.height / (float)backColor.height;
            v45 = v44;
          }
          objc_msgSend(v26, "setDefaultBox:", v45, v49, v50, v47);
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      }
      while (v23);
    }

    free(dest.data);
    dest.data = 0;
    free(backColor.data);
    backColor.data = 0;
    if (v12)
    {
      free(buf.data);
      buf.data = 0;
    }
  }
  return v21;
}

- (id)processCIImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  float v7;
  float v8;
  vImage_Buffer *v9;
  __int128 v10;
  void *v11;
  void *exception;
  _OWORD v14[2];

  v4 = a3;
  objc_msgSend(v4, "extent");
  v7 = v6;
  if (v7 == 0.0 || (v8 = v5, v8 == 0.0))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1B5E124B8](exception, "esp error");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  v9 = +[AXShotflowHelpers createVImageBuffer:](AXShotflowHelpers, "createVImageBuffer:", v4);
  v10 = *(_OWORD *)&v9->width;
  v14[0] = *(_OWORD *)&v9->data;
  v14[1] = v10;
  -[AXShotflowNetwork resizeAndProcessVImage:inputIsBGR:](self, "resizeAndProcessVImage:inputIsBGR:", v14, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9->data)
    free(v9->data);
  MEMORY[0x1B5E1250C](v9, 0x1080C40ABB4582ELL);

  return v11;
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (int64_t)modelType
{
  return self->_modelType;
}

- (void)setModelType:(int64_t)a3
{
  self->_modelType = a3;
}

- (void).cxx_destruct
{
  float *begin;
  float *v4;
  float *v5;
  float *v6;
  float *v7;
  int *v8;
  void **p_begin;

  begin = self->_cell_starts_y.__begin_;
  if (begin)
  {
    self->_cell_starts_y.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_cell_starts_x.__begin_;
  if (v4)
  {
    self->_cell_starts_x.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_filterThreshold, 0);
  v5 = self->_default_boxes_sides_normalized.__begin_;
  if (v5)
  {
    self->_default_boxes_sides_normalized.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_default_boxes_sides.__begin_;
  if (v6)
  {
    self->_default_boxes_sides.__end_ = v6;
    operator delete(v6);
  }
  v7 = self->_ratios.__begin_;
  if (v7)
  {
    self->_ratios.__end_ = v7;
    operator delete(v7);
  }
  p_begin = (void **)&self->_model_labels.__begin_;
  std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  v8 = self->_important_classes.__begin_;
  if (v8)
  {
    self->_important_classes.__end_ = v8;
    operator delete(v8);
  }
  p_begin = &self->_yawOutputs.__begin_;
  std::vector<std::shared_ptr<espresso_buffer_t>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->_rollOutputs.__begin_;
  std::vector<std::shared_ptr<espresso_buffer_t>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->_offsetsOutputs.__begin_;
  std::vector<std::shared_ptr<espresso_buffer_t>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->_logitsNegOutputs.__begin_;
  std::vector<std::shared_ptr<espresso_buffer_t>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->_logitsPosOutputs.__begin_;
  std::vector<std::shared_ptr<espresso_buffer_t>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 20) = 0;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_QWORD *)self + 41) = 0;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 1304) = 0u;
  *(_OWORD *)((char *)self + 1320) = 0u;
  *(_OWORD *)((char *)self + 1336) = 0u;
  return self;
}

@end
