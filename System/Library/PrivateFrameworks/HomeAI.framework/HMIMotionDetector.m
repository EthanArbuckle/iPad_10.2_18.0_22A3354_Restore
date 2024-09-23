@implementation HMIMotionDetector

- (HMIMotionDetector)init
{
  HMIMotionDetector *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMIMotionDetector;
  v2 = -[HMIMotionDetector init](&v4, sel_init);
  if (v2)
    v2->_resizedSampleBuffers = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CFArrayRemoveAllValues(self->_resizedSampleBuffers);
  CFRelease(self->_resizedSampleBuffers);
  v3.receiver = self;
  v3.super_class = (Class)HMIMotionDetector;
  -[HMIMotionDetector dealloc](&v3, sel_dealloc);
}

- (id)_computeOpticalFlow:(__CVBuffer *)a3 with:(__CVBuffer *)a4 globalMotionScore:(float *)a5 activityZones:(id)a6 operationMode:(unint64_t)a7
{
  char v7;
  id v12;
  double Size;
  double v14;
  double v15;
  double v16;
  id v18;
  char *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  int v21;
  int v22;
  size_t v23;
  size_t v24;
  int v26;
  char *v27;
  size_t v28;
  size_t v29;
  size_t v30;
  int v32;
  void *v33;
  unsigned int *v34;
  unsigned int v35;
  unsigned int v36;
  uint64_t v37;
  _BYTE *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  cv *v46;
  uint64_t (***v47)(cv::_InputArray *__hidden, int);
  const cv::_InputArray *v48;
  cv *v49;
  uint64_t (***v50)(cv::_InputArray *__hidden, int);
  const cv::_InputArray *v51;
  float v52;
  void *v53;
  uint64_t v54;
  int v55;
  int v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  _BYTE *v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  void *v69;
  unsigned int *v70;
  unsigned int v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  double v76;
  void *v77;
  int v78;
  double v79;
  void *v80;
  void *v81;
  unsigned int *v82;
  unsigned int v83;
  unsigned int v84;
  uint64_t v85;
  _DWORD *v86;
  void *v87;
  unsigned int *v88;
  unsigned int v89;
  unsigned int v90;
  uint64_t v91;
  int32x2_t *v92;
  char v94;
  id v95;
  void *v96[3];
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109[3];
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t (**v123)(cv::_InputArray *__hidden, int);
  int v124;
  void **v125;
  uint64_t v126;
  void *__p;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  _QWORD v134[3];
  int32x2_t v135;
  _BYTE v136[64];
  _BYTE *v137;
  cv *v138;
  _QWORD v139[34];
  void (**v140[2])(uint64_t *__return_ptr, _QWORD, uint64_t);
  uint64_t v141;
  unsigned int *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  cv *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t (**v150)(cv::_InputArray *__hidden, int);
  int v151;
  void **v152;
  uint64_t v153;
  uint64_t (**v154)(cv::_InputArray *__hidden, int);
  int v155;
  void **p_p;
  uint64_t v157;
  void *v158;
  int v159[2];
  uint64_t v160;
  void *v161;
  _BYTE *v162;
  uint64_t v163;
  uint64_t (**v164)(cv::_InputArray *__hidden, int);
  int v165;
  void **v166;
  uint64_t v167;
  double v168;
  int v169;
  void **v170;
  uint64_t v171;
  void *v172;
  uint64_t *v173;
  uint64_t v174;
  void *v175;
  uint64_t *v176;
  uint64_t v177;
  uint64_t v178;
  cv::Mat *v179;
  cv::Mat *v180;
  uint64_t v181;
  int v182;
  int v183;
  _DWORD v184[2];
  char *v185;
  unsigned int *v186;
  char *v187;
  char *v188;
  char *v189;
  uint64_t v190;
  _DWORD *v191;
  cv *v192;
  _QWORD v193[2];
  uint64_t v194;
  _QWORD v195[3];
  int v196;
  int v197;
  int32x2_t v198;
  char *v199;
  unsigned int *v200;
  char *v201;
  char *v202;
  char *v203;
  uint64_t v204;
  int32x2_t *v205;
  void **v206;
  _QWORD v207[2];
  id v208[2];

  v7 = a7;
  v12 = a6;
  *a5 = 0.0;
  Size = HMICVPixelBufferGetSize(a4);
  v15 = v14;
  if (Size == HMICVPixelBufferGetSize(a3) && v15 == v16)
  {
    v95 = v12;
    v208[0] = -[HMISignpost initWithName:]([HMISignpost alloc], "initWithName:", CFSTR("Sparse Optical Flow"));
    CVPixelBufferLockBaseAddress(a4, 1uLL);
    v94 = v7;
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
    v21 = (int)v15;
    v22 = (int)Size;
    v198.i32[0] = (int)v15;
    v198.i32[1] = (int)Size;
    v199 = BaseAddressOfPlane;
    v200 = 0;
    if ((int)v15 == 1)
      v23 = v22;
    else
      v23 = BytesPerRowOfPlane;
    if (BytesPerRowOfPlane)
      v24 = v23;
    else
      v24 = v22;
    v205 = &v198;
    v206 = (void **)v207;
    if (v23 == v22 || BytesPerRowOfPlane == 0)
      v26 = 1124024320;
    else
      v26 = 1124007936;
    v196 = v26;
    v197 = 2;
    v207[0] = v24;
    v207[1] = 1;
    v203 = &BaseAddressOfPlane[v24 * v21];
    v204 = 0;
    v201 = BaseAddressOfPlane;
    v202 = &v203[v22 - v24];
    memset(v195, 0, sizeof(v195));
    cv::_InputArray::_InputArray((uint64_t)v136, (const cv::Mat *)&v196);
    cv::_OutputArray::_OutputArray((uint64_t)&v182, (uint64_t)v195);
    v194 = 0xA0000000ALL;
    cv::buildOpticalFlowPyramid((void (***)(uint64_t *__return_ptr, _QWORD, uint64_t))v136, (uint64_t)&v182, (int *)&v194, 2u, 1, 4, 0, 1);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    v27 = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    v28 = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    v184[0] = (int)v15;
    v184[1] = (int)Size;
    v185 = v27;
    v186 = 0;
    if (v21 == 1)
      v29 = v22;
    else
      v29 = v28;
    if (v28)
      v30 = v29;
    else
      v30 = v22;
    v191 = v184;
    v192 = (cv *)v193;
    if (v29 == v22 || v28 == 0)
      v32 = 1124024320;
    else
      v32 = 1124007936;
    v183 = 2;
    v182 = v32;
    v193[0] = v30;
    v193[1] = 1;
    v190 = 0;
    v189 = &v27[v30 * v21];
    v187 = v27;
    v188 = &v189[v22 - v30];
    v180 = 0;
    v179 = 0;
    v181 = 0;
    cv::_InputArray::_InputArray((uint64_t)v136, (const cv::Mat *)&v182);
    cv::_OutputArray::_OutputArray((uint64_t)v140, (uint64_t)&v179);
    v178 = 0xA0000000ALL;
    cv::buildOpticalFlowPyramid((void (***)(uint64_t *__return_ptr, _QWORD, uint64_t))v136, (uint64_t)v140, (int *)&v178, 2u, 1, 4, 0, 1);
    v176 = 0;
    v175 = 0;
    v177 = 0;
    v173 = 0;
    v172 = 0;
    v174 = 0;
    cv::_InputArray::_InputArray((uint64_t)v140, (const cv::Mat *)&v182);
    v169 = -2147287027;
    v170 = &v175;
    v171 = 0;
    v168 = COERCE_DOUBLE(&off_24DBF02F0);
    v137 = &v136[8];
    v138 = (cv *)v139;
    v139[0] = 0;
    v139[1] = 0;
    *(_DWORD *)v136 = 1124007936;
    memset(&v136[4], 0, 60);
    cv::_InputArray::_InputArray((uint64_t)&v164, (const cv::Mat *)v136);
    cv::goodFeaturesToTrack((cv *)v140, (const cv::_InputArray *)&v168, (const cv::_OutputArray *)0x1F4, (void (***)(uint64_t *__return_ptr, _QWORD, uint64_t))&v164, 0.0299999993, 5.0, (const cv::_InputArray *)5, 0, 0.04);
    v34 = *(unsigned int **)&v136[24];
    if (*(_QWORD *)&v136[24])
    {
      do
      {
        v35 = __ldaxr(v34);
        v36 = v35 - 1;
      }
      while (__stlxr(v36, v34));
      if (!v36)
        cv::Mat::deallocate((cv::Mat *)v136, v33);
    }
    *(_QWORD *)&v136[16] = 0;
    memset(&v136[32], 0, 24);
    if (*(int *)&v136[4] >= 1)
    {
      v37 = 0;
      v38 = v137;
      do
        *(_DWORD *)&v38[4 * v37++] = 0;
      while (v37 < *(int *)&v136[4]);
    }
    *(_QWORD *)&v136[24] = 0;
    if (v138 != (cv *)v139)
      cv::fastFree((void **)v138, v33);
    v162 = 0;
    v161 = 0;
    v163 = 0;
    *(_QWORD *)v159 = 0;
    v158 = 0;
    v160 = 0;
    if (v175 == v176)
    {
      v52 = 0.0;
    }
    else
    {
      cv::_InputArray::_InputArray((uint64_t)v136, (uint64_t)&v179);
      cv::_InputArray::_InputArray((uint64_t)v140, (uint64_t)v195);
      v168 = COERCE_DOUBLE(&off_24DBF0280);
      v169 = -2147287027;
      v170 = &v175;
      v171 = 0;
      v165 = -2147287027;
      v166 = &v172;
      v167 = 0;
      v164 = &off_24DBF02F0;
      v155 = -2147287040;
      p_p = &v158;
      v157 = 0;
      v154 = &off_24DBF02F0;
      v151 = -2147287035;
      v152 = &v161;
      v153 = 0;
      v150 = &off_24DBF02F0;
      v149 = 0xA0000000ALL;
      cv::calcOpticalFlowPyrLK((void (***)(uint64_t *__return_ptr, _QWORD, uint64_t))v136, v140, (void (***)(_QWORD *__return_ptr, _QWORD, uint64_t))&v168, (uint64_t)&v164, (uint64_t)&v154, (uint64_t)&v150, (int32x2_t *)&v149, 2, 0.00899999961, v39, v40, v41, v42, v43, v44, v45, 3u, 5, 0.05,
        8);
      v46 = (cv *)cv::_InputArray::_InputArray((uint64_t)v140, (const cv::Mat *)&v196);
      v47 = cv::noArray(v46);
      cv::mean((cv *)v140, (const cv::_InputArray *)v47, v48);
      v49 = (cv *)cv::_InputArray::_InputArray((uint64_t)&v164, (const cv::Mat *)&v182);
      v50 = cv::noArray(v49);
      cv::mean((cv *)&v164, (const cv::_InputArray *)v50, v51);
      v52 = *(double *)v136 - v168;
      if (fabsf(v52) > 2.0)
      {
        v135 = vrev64_s32(v198);
        cv::Mat::zeros((uint64_t *)&v135, 0, (uint64_t)v136);
        cv::MatExpr::operator cv::Mat(v136, (uint64_t)v140);
        cv::MatExpr::~MatExpr((cv::MatExpr *)v136, v53);
        if (v198.i32[0] * v198.i32[1] >= 1)
        {
          v54 = 0;
          v55 = (int)(float)-roundf(v52);
          do
          {
            v56 = (v199[v54] + v55) & ~((v199[v54] + v55) >> 31);
            if (v56 >= 255)
              LOBYTE(v56) = -1;
            *(_BYTE *)(v141 + v54++) = v56;
          }
          while (v54 < v198.i32[0] * (uint64_t)v198.i32[1]);
        }
        memset(v134, 0, sizeof(v134));
        cv::_InputArray::_InputArray((uint64_t)v136, (const cv::Mat *)v140);
        cv::_OutputArray::_OutputArray((uint64_t)&v168, (uint64_t)v134);
        v133 = 0xA0000000ALL;
        cv::buildOpticalFlowPyramid((void (***)(uint64_t *__return_ptr, _QWORD, uint64_t))v136, (uint64_t)&v168, (int *)&v133, 2u, 1, 4, 0, 1);
        v130 = 0;
        v131 = 0;
        v132 = 0;
        __p = 0;
        v128 = 0;
        v129 = 0;
        cv::_InputArray::_InputArray((uint64_t)v136, (uint64_t)&v179);
        cv::_InputArray::_InputArray((uint64_t)&v168, (uint64_t)v134);
        v164 = &off_24DBF0280;
        v165 = -2147287027;
        v166 = &v175;
        v167 = 0;
        v155 = -2147287027;
        p_p = &__p;
        v157 = 0;
        v154 = &off_24DBF02F0;
        v151 = -2147287040;
        v152 = &v130;
        v153 = 0;
        v150 = &off_24DBF02F0;
        v124 = -2147287035;
        v125 = &v161;
        v126 = 0;
        v123 = &off_24DBF02F0;
        v122 = 0xA0000000ALL;
        cv::calcOpticalFlowPyrLK((void (***)(uint64_t *__return_ptr, _QWORD, uint64_t))v136, (void (***)(uint64_t *__return_ptr, _QWORD, uint64_t))&v168, (void (***)(_QWORD *__return_ptr, _QWORD, uint64_t))&v164, (uint64_t)&v154, (uint64_t)&v150, (uint64_t)&v123, (int32x2_t *)&v122, 2, 0.00899999961, v57, v58, v59, v60, v61, v62, v63, 3u, 5, 0.05,
          8);
        v64 = v158;
        if (*(void **)v159 != v158)
        {
          v65 = 0;
          v66 = 0;
          do
          {
            v67 = v64[v66];
            v68 = *((_BYTE *)v130 + v66);
            if (v68)
              v68 = hypotf(*(float *)((char *)v172 + v65) - *(float *)((char *)__p + v65), *(float *)((char *)v172 + v65 + 4) - *(float *)((char *)__p + v65 + 4)) < 3.0;
            v64[v66++] = v67 & v68;
            v64 = v158;
            v65 += 8;
          }
          while (v66 < *(_QWORD *)v159 - (_QWORD)v158);
        }
        if (__p)
        {
          v128 = __p;
          operator delete(__p);
        }
        if (v130)
        {
          v131 = v130;
          operator delete(v130);
        }
        *(_QWORD *)v136 = v134;
        std::vector<cv::Mat>::__destroy_vector::operator()[abi:ne180100]((void ***)v136);
        v70 = v142;
        if (v142)
        {
          do
          {
            v71 = __ldaxr(v70);
            v72 = v71 - 1;
          }
          while (__stlxr(v72, v70));
          if (!v72)
            cv::Mat::deallocate((cv::Mat *)v140, v69);
        }
        v141 = 0;
        v143 = 0;
        v145 = 0;
        v144 = 0;
        if (SHIDWORD(v140[0]) >= 1)
        {
          v73 = 0;
          v74 = v146;
          do
            *(_DWORD *)(v74 + 4 * v73++) = 0;
          while (v73 < SHIDWORD(v140[0]));
        }
        v142 = 0;
        if (v147 != (cv *)&v148)
          cv::fastFree((void **)v147, v69);
      }
    }
    CVPixelBufferUnlockBaseAddress(a4, 1uLL);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = 0;
    v120 = 0;
    v121 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v119, v158, *(uint64_t *)v159, *(_QWORD *)v159 - (_QWORD)v158);
    v116 = 0;
    v117 = 0;
    v118 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v116, v161, (uint64_t)v162, (v162 - (_BYTE *)v161) >> 2);
    v113 = 0;
    v114 = 0;
    v115 = 0;
    std::vector<cv::Point_<float>>::__init_with_size[abi:ne180100]<cv::Point_<float>*,cv::Point_<float>*>((char *)&v113, (uint64_t *)v175, v176, ((char *)v176 - (_BYTE *)v175) >> 3);
    v110 = 0;
    v111 = 0;
    v112 = 0;
    std::vector<cv::Point_<float>>::__init_with_size[abi:ne180100]<cv::Point_<float>*,cv::Point_<float>*>((char *)&v110, (uint64_t *)v172, v173, ((char *)v173 - (_BYTE *)v172) >> 3);
    memset(v109, 0, sizeof(v109));
    std::vector<cv::Mat>::__init_with_size[abi:ne180100]<cv::Mat*,cv::Mat*>((cv::Mat *)v109, v179, v180, 0xAAAAAAAAAAAAAAABLL * ((v180 - v179) >> 5));
    v12 = v95;
    *(float *)&v76 = v52;
    -[HMIMotionDetector calculateMotionDetection:score:srcFeatureCVPoints:dstFeatreCVPoints:activityZones:operationMode:srcPyramid:frameSize:brightnessChange:](self, "calculateMotionDetection:score:srcFeatureCVPoints:dstFeatreCVPoints:activityZones:operationMode:srcPyramid:frameSize:brightnessChange:", &v119, &v116, &v113, &v110, v95, 2, Size, v15, v76, v109);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v136 = v109;
    std::vector<cv::Mat>::__destroy_vector::operator()[abi:ne180100]((void ***)v136);
    if (v110)
    {
      v111 = v110;
      operator delete(v110);
    }
    if (v113)
    {
      v114 = v113;
      operator delete(v113);
    }
    if (v116)
    {
      v117 = v116;
      operator delete(v116);
    }
    if (v119)
    {
      v120 = v119;
      operator delete(v119);
    }
    if (v77)
    {
      objc_msgSend(v75, "addObject:", v77);
      objc_msgSend(v77, "motionScore");
      *(_DWORD *)a5 = v78;
    }
    if ((v94 & 1) != 0)
    {
      v106 = 0;
      v107 = 0;
      v108 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v106, v158, *(uint64_t *)v159, *(_QWORD *)v159 - (_QWORD)v158);
      v103 = 0;
      v104 = 0;
      v105 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v103, v161, (uint64_t)v162, (v162 - (_BYTE *)v161) >> 2);
      v100 = 0;
      v101 = 0;
      v102 = 0;
      std::vector<cv::Point_<float>>::__init_with_size[abi:ne180100]<cv::Point_<float>*,cv::Point_<float>*>((char *)&v100, (uint64_t *)v175, v176, ((char *)v176 - (_BYTE *)v175) >> 3);
      v97 = 0;
      v98 = 0;
      v99 = 0;
      std::vector<cv::Point_<float>>::__init_with_size[abi:ne180100]<cv::Point_<float>*,cv::Point_<float>*>((char *)&v97, (uint64_t *)v172, v173, ((char *)v173 - (_BYTE *)v172) >> 3);
      memset(v96, 0, sizeof(v96));
      std::vector<cv::Mat>::__init_with_size[abi:ne180100]<cv::Mat*,cv::Mat*>((cv::Mat *)v96, v179, v180, 0xAAAAAAAAAAAAAAABLL * ((v180 - v179) >> 5));
      v12 = v95;
      *(float *)&v79 = v52;
      -[HMIMotionDetector calculateMotionDetection:score:srcFeatureCVPoints:dstFeatreCVPoints:activityZones:operationMode:srcPyramid:frameSize:brightnessChange:](self, "calculateMotionDetection:score:srcFeatureCVPoints:dstFeatreCVPoints:activityZones:operationMode:srcPyramid:frameSize:brightnessChange:", &v106, &v103, &v100, &v97, v95, 1, Size, v15, v79, v96);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v136 = v96;
      std::vector<cv::Mat>::__destroy_vector::operator()[abi:ne180100]((void ***)v136);
      if (v97)
      {
        v98 = v97;
        operator delete(v97);
      }
      if (v100)
      {
        v101 = v100;
        operator delete(v100);
      }
      if (v103)
      {
        v104 = v103;
        operator delete(v103);
      }
      if (v106)
      {
        v107 = v106;
        operator delete(v106);
      }
      if (v80)
        objc_msgSend(v75, "addObject:", v80);

    }
    v18 = v75;

    if (v158)
    {
      *(_QWORD *)v159 = v158;
      operator delete(v158);
    }
    if (v161)
    {
      v162 = v161;
      operator delete(v161);
    }
    if (v172)
    {
      v173 = (uint64_t *)v172;
      operator delete(v172);
    }
    if (v175)
    {
      v176 = (uint64_t *)v175;
      operator delete(v175);
    }
    *(_QWORD *)v136 = &v179;
    std::vector<cv::Mat>::__destroy_vector::operator()[abi:ne180100]((void ***)v136);
    v82 = v186;
    if (v186)
    {
      do
      {
        v83 = __ldaxr(v82);
        v84 = v83 - 1;
      }
      while (__stlxr(v84, v82));
      if (!v84)
        cv::Mat::deallocate((cv::Mat *)&v182, v81);
    }
    v185 = 0;
    v188 = 0;
    v189 = 0;
    v187 = 0;
    if (v183 >= 1)
    {
      v85 = 0;
      v86 = v191;
      do
        v86[v85++] = 0;
      while (v85 < v183);
    }
    v186 = 0;
    if (v192 != (cv *)v193)
      cv::fastFree((void **)v192, v81);
    *(_QWORD *)v136 = v195;
    std::vector<cv::Mat>::__destroy_vector::operator()[abi:ne180100]((void ***)v136);
    v88 = v200;
    if (v200)
    {
      do
      {
        v89 = __ldaxr(v88);
        v90 = v89 - 1;
      }
      while (__stlxr(v90, v88));
      if (!v90)
        cv::Mat::deallocate((cv::Mat *)&v196, v87);
    }
    v199 = 0;
    v202 = 0;
    v203 = 0;
    v201 = 0;
    if (v197 >= 1)
    {
      v91 = 0;
      v92 = v205;
      do
        v92->i32[v91++] = 0;
      while (v91 < v197);
    }
    v200 = 0;
    if (v206 != v207)
      cv::fastFree(v206, v87);
    __HMISignpostScopeLeave(v208);

  }
  else
  {
    v18 = (id)MEMORY[0x24BDBD1A8];
  }

  return v18;
}

- (id)calculateMotionDetection:(vector<unsigned)char score:(std:()vector<float :(std:()vector<cv:(std:()vector<cv:(std:(id)a7 :(unint64_t)a8 allocator<cv:()vector<cv:(std:(CGSize)a10 :(float)a11 allocator<cv::Mat>> *)a9 :Mat :Point_<float>>> *)a6 :Point_<float> :allocator<cv::Point_<float>>> *)a5 :Point_<float> :allocator<float>> *)a4 allocator<unsigned char>> *)a3 srcFeatureCVPoints:dstFeatreCVPoints:activityZones:operationMode:srcPyramid:frameSize:brightnessChange:
{
  double height;
  double width;
  vector<cv::Mat, std::allocator<cv::Mat>> *v20;
  id v21;
  char *var0;
  unint64_t v23;
  int v24;
  float v25;
  float v26;
  uint64_t v27;
  float v28;
  uint64_t v29;
  _BOOL4 v30;
  float *v32;
  float v33;
  float v34;
  float *v35;
  float v36;
  float v37;
  double v38;
  float v39;
  float v40;
  double v41;
  double *v42;
  double v43;
  double v44;
  double *v45;
  float v46;
  double v47;
  float v48;
  double v49;
  double *v50;
  double v51;
  double v52;
  double *v53;
  double *v54;
  double *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  float v68;
  float v69;
  double v70;
  double v71;
  int v72;
  double v73;
  int v74;
  double v75;
  double v76;
  double v77;
  float v78;
  float v79;
  long double v80;
  CGFloat x;
  CGFloat y;
  CGFloat v83;
  CGFloat v84;
  double v85;
  double v86;
  CGFloat v87;
  void *v88;
  int v89;
  uint64_t v90;
  double *v91;
  double *v92;
  HMIMotionVector *v93;
  float v95;
  HMIMotionDetection *v96;
  HMIMotionDetection *v97;
  double v98;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double *v105;
  double *v106;
  double v107;
  double v108;
  CGAffineTransform v109;
  CGAffineTransform v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;

  height = a10.height;
  width = a10.width;
  v20 = a9;
  v21 = a7;
  v117 = 9999.0;
  v118 = 9999.0;
  v115 = 9999.0;
  v116 = 9999.0;
  v113 = -9999.0;
  v114 = -9999.0;
  v111 = -9999.0;
  v112 = -9999.0;
  v106 = (double *)malloc_type_malloc(2 * ((char *)a5->var1 - (char *)a5->var0), 0x1000040451B5BE8uLL);
  v105 = (double *)malloc_type_malloc(2 * ((char *)a5->var1 - (char *)a5->var0), 0x1000040451B5BE8uLL);
  var0 = a3->var0;
  if (a3->var1 != a3->var0)
  {
    v23 = 0;
    v24 = 0;
    v25 = flt_219E9D5D0[(a8 & 1) == 0];
    v26 = 0.0;
    v27 = 4;
    while (1)
    {
      if (!var0[v23] || a4->__begin_[v23] <= v25)
        goto LABEL_53;
      v28 = hypotf(*(float *)((char *)a5->var0 + v27 - 4) - *(float *)((char *)a6->var0 + v27 - 4), *(float *)((char *)a5->var0 + v27) - *(float *)((char *)a6->var0 + v27));
      v29 = objc_msgSend(v21, "count");
      v30 = 1;
      if ((a8 & 1) != 0 && v29)
        v30 = -[HMIMotionDetector applyActivityZoneFilteringOnSourcePoint:destinationPoint:frameSize:activityZones:](self, "applyActivityZoneFilteringOnSourcePoint:destinationPoint:frameSize:activityZones:", v21, (double)(int)(uint64_t)rint(*(float *)((char *)a5->var0 + v27 - 4)), (double)(int)(uint64_t)rint(*(float *)((char *)a5->var0 + v27)), (double)(int)(uint64_t)rint(*(float *)((char *)a6->var0 + v27 - 4)), (double)(int)(uint64_t)rint(*(float *)((char *)a6->var0 + v27)), width, height);
      if (v28 <= 1.0 || !v30)
        goto LABEL_53;
      v32 = (float *)((char *)a5->var0 + v27);
      v33 = *(v32 - 1);
      v34 = *v32;
      v35 = (float *)((char *)a6->var0 + v27);
      v36 = *(v35 - 1);
      if (v33 >= v36)
        v37 = *(v35 - 1);
      else
        v37 = *(v32 - 1);
      v38 = v37;
      v39 = *v35;
      if (v34 >= *v35)
        v40 = *v35;
      else
        v40 = *v32;
      v41 = v118;
      if (v118 <= v38)
      {
        if (v116 <= v38)
          goto LABEL_25;
        v42 = &v116;
      }
      else
      {
        if (v118 >= 9998.0)
          v41 = v38;
        v116 = v41;
        v42 = &v118;
      }
      *v42 = v38;
LABEL_25:
      v43 = v40;
      v44 = v117;
      if (v117 <= v43)
      {
        if (v115 <= v43)
          goto LABEL_32;
        v45 = &v115;
      }
      else
      {
        if (v117 >= 9998.0)
          v44 = v43;
        v115 = v44;
        v45 = &v117;
      }
      *v45 = v43;
LABEL_32:
      if (v33 >= v36)
        v46 = v33;
      else
        v46 = v36;
      v47 = v46;
      if (v34 >= v39)
        v48 = v34;
      else
        v48 = v39;
      v49 = v114;
      if (v114 >= v47)
      {
        if (v112 >= v47)
          goto LABEL_45;
        v50 = &v112;
      }
      else
      {
        if (v114 <= -9998.0)
          v49 = v47;
        v112 = v49;
        v50 = &v114;
      }
      *v50 = v47;
LABEL_45:
      v51 = v48;
      v52 = v113;
      if (v113 < v51)
      {
        if (v113 <= -9998.0)
          v52 = v51;
        v111 = v52;
        v53 = &v113;
        goto LABEL_51;
      }
      if (v111 < v51)
      {
        v53 = &v111;
LABEL_51:
        *v53 = v51;
      }
      v26 = v26 + sqrtf(v28);
      v54 = &v106[2 * v24];
      *v54 = (double)(int)(uint64_t)rint(v33);
      v54[1] = (double)(int)(uint64_t)rint(v34);
      v55 = &v105[2 * v24];
      *v55 = (double)(int)(uint64_t)rint(v36);
      v55[1] = (double)(int)(uint64_t)rint(v39);
      ++v24;
LABEL_53:
      ++v23;
      var0 = a3->var0;
      v27 += 8;
      if (a3->var1 - a3->var0 <= v23)
      {
        v56 = v113;
        v57 = v114;
        v58 = v115;
        v59 = v116;
        v60 = v117;
        v61 = v118;
        v62 = v111;
        v63 = v112;
        v20 = a9;
        goto LABEL_56;
      }
    }
  }
  v24 = 0;
  v60 = 9999.0;
  v62 = -9999.0;
  v63 = -9999.0;
  v58 = 9999.0;
  v26 = 0.0;
  v56 = -9999.0;
  v61 = 9999.0;
  v59 = 9999.0;
  v57 = -9999.0;
LABEL_56:
  v64 = flt_219E9D5F8[v26 < 20.0];
  v65 = (v57 - v61 + 40.0) * v64;
  if (v57 - v59 + 40.0 >= v65)
    v59 = v61;
  v66 = (v56 - v60 + 40.0) * v64;
  if (v56 - v58 + 40.0 >= v66)
    v58 = v60;
  if (v63 - v61 + 40.0 >= v65)
    v63 = v57;
  if (v62 - v60 + 40.0 >= v66)
    v67 = v56;
  else
    v67 = v62;
  v68 = v63;
  v69 = v67;
  v70 = (float)(v68 + 20.0);
  v71 = (float)(v69 + 20.0);
  v72 = *((_DWORD *)v20->var0 + 3) - 1;
  if (v70 <= (double)v72)
    v73 = v70;
  else
    v73 = (double)v72;
  v74 = *((_DWORD *)v20->var0 + 2) - 1;
  if (v71 <= (double)v74)
    v75 = v71;
  else
    v75 = (double)v74;
  if (v26 == 0.0)
  {
    v73 = *MEMORY[0x24BDBEFB0];
    v75 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v76 = v75;
    v77 = *MEMORY[0x24BDBEFB0];
  }
  else
  {
    v78 = v59;
    v79 = v58;
    v77 = fmax((float)(v78 + -20.0), 0.0);
    v76 = fmax((float)(v79 + -20.0), 0.0);
  }
  v80 = pow((fabsf(a11) + 5.0) / 5.0, 3.0);
  v119.size.width = v73 - v77;
  v119.size.height = v75 - v76;
  v119.origin.x = v77;
  v119.origin.y = v76;
  v120 = CGRectStandardize(v119);
  x = v120.origin.x;
  y = v120.origin.y;
  v83 = v120.size.width;
  v84 = v120.size.height;
  v103 = height;
  v104 = v80;
  memset(&v110, 0, sizeof(v110));
  v102 = width;
  *(float *)&v120.origin.x = width;
  *(float *)&v120.size.width = height;
  CGAffineTransformMakeScale(&v110, (float)(1.0 / *(float *)&v120.origin.x), (float)(1.0 / *(float *)&v120.size.width));
  v109 = v110;
  v121.origin.x = x;
  v121.origin.y = y;
  v121.size.width = v83;
  v121.size.height = v84;
  v122 = CGRectApplyAffineTransform(v121, &v109);
  v85 = v122.origin.x;
  v86 = v122.origin.y;
  v87 = v122.size.width;
  v101 = v122.size.height;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v87;
  v89 = v24 - 1;
  if (v24 >= 1)
  {
    v90 = 0;
    v91 = v105 + 1;
    v92 = v106 + 1;
    do
    {
      v107 = *v92;
      v108 = *(v92 - 1);
      v93 = -[HMIMotionVector initWithOrigin:motion:]([HMIMotionVector alloc], "initWithOrigin:motion:", v110.tx + v107 * v110.c + v110.a * v108, v110.ty + v107 * v110.d + v110.b * v108, v110.tx + *v91 * v110.c + v110.a * *(v91 - 1) - (v110.tx + v107 * v110.c + v110.a * v108), v110.ty + *v91 * v110.d + v110.b * *(v91 - 1) - (v110.ty + v107 * v110.d + v110.b * v108));
      objc_msgSend(v88, "addObject:", v93);

      ++v90;
      v91 += 2;
      v92 += 2;
    }
    while (v90 < v89--);
  }
  v95 = v26 / v104;
  free(v106);
  free(v105);
  if (v95 >= 0.001)
  {
    v97 = [HMIMotionDetection alloc];
    *(float *)&v98 = v26 / v104;
    v96 = -[HMIMotionDetection initWithBoundingBox:size:motionVectors:motionScore:motionMode:](v97, "initWithBoundingBox:size:motionVectors:motionScore:motionMode:", v88, a8, v85, v86, v100, v101, v102, v103, v98);
  }
  else
  {
    v96 = 0;
  }

  return v96;
}

- (BOOL)applyActivityZoneFilteringOnSourcePoint:(CGPoint)a3 destinationPoint:(CGPoint)a4 frameSize:(CGSize)a5 activityZones:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  id v12;
  void *v13;
  char v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double b;
  double a;
  double c;
  double d;
  double ty;
  double tx;
  id v26;
  uint64_t v27;
  char v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  double v37;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CGAffineTransform v44;
  _BYTE v45[128];
  uint64_t v46;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v46 = *MEMORY[0x24BDAC8D0];
  v12 = a6;
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isInclusion");

  v15 = HMICGPointClampWithSize(v11, v10, width);
  v17 = v16;
  v39 = v15;
  v18 = HMICGPointClampWithSize(x, y, width);
  v37 = v19;
  v38 = v18;
  *(float *)&v18 = width;
  *(float *)&v19 = height;
  memset(&v44, 0, sizeof(v44));
  CGAffineTransformMakeScale(&v44, (float)(1.0 / *(float *)&v18), (float)(1.0 / *(float *)&v19));
  a = v44.a;
  b = v44.b;
  c = v44.c;
  d = v44.d;
  tx = v44.tx;
  ty = v44.ty;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v26 = v12;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  v28 = v14 ^ 1;
  if (v27)
  {
    v29 = tx + v17 * c + a * v39;
    v30 = ty + v17 * d + b * v39;
    v31 = tx + v37 * c + a * v38;
    v32 = ty + v37 * d + b * v38;
    v33 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v41 != v33)
          objc_enumerationMutation(v26);
        v35 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v35, "containsVectorWithSource:destination:", v29, v30, v31, v32))
        {
          v28 = objc_msgSend(v35, "isInclusion");
          goto LABEL_11;
        }
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v27)
        continue;
      break;
    }
  }
LABEL_11:

  return v28;
}

- (id)detectWithGlobalMotionScore:(float *)a3 referencePixelBuffer:(__CVBuffer *)a4 targetPixelBuffer:(__CVBuffer *)a5 activityZones:(id)a6 detectorMode:(unint64_t)a7
{
  -[HMIMotionDetector _computeOpticalFlow:with:globalMotionScore:activityZones:operationMode:](self, "_computeOpticalFlow:with:globalMotionScore:activityZones:operationMode:", a4, a5, a3, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)visualizeMotionDetections:(id)a3 frameSize:(CGSize)a4 timeStamp:(id *)a5
{
  double height;
  double width;
  void *v8;
  __CVBuffer *v9;
  void *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  void *v12;
  HMIVideoFrame *v13;
  HMIVideoFrame *v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16;
  _QWORD v17[8];

  height = a4.height;
  width = a4.width;
  +[HMIMotionDetection firstMotionDetectionInArray:withMode:](HMIMotionDetection, "firstMotionDetectionInArray:withMode:", a3, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[HMIVisionUtilities createPixelBufferWithSize:pixelFormat:useIOSurface:](HMIVisionUtilities, "createPixelBufferWithSize:pixelFormat:useIOSurface:", 875704422, 0, width, height);
  HMICVPixelBufferSetValue(v9, 0);
  CVPixelBufferLockBaseAddress(v9, 0);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(v9, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v9, 0);
  objc_msgSend(v8, "motionVectors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __67__HMIMotionDetector_visualizeMotionDetections_frameSize_timeStamp___block_invoke;
  v17[3] = &__block_descriptor_64_e25_v16__0__HMIMotionVector_8l;
  *(double *)&v17[4] = width;
  *(double *)&v17[5] = height;
  v17[6] = BaseAddressOfPlane;
  v17[7] = BytesPerRowOfPlane;
  objc_msgSend(v12, "na_each:", v17);

  CVPixelBufferUnlockBaseAddress(v9, 0);
  v13 = [HMIVideoFrame alloc];
  v16 = *a5;
  v14 = -[HMIVideoFrame initWithPixelBuffer:presentationTimeStamp:](v13, "initWithPixelBuffer:presentationTimeStamp:", v9, &v16);
  CVPixelBufferRelease(v9);

  return v14;
}

void __67__HMIMotionDetector_visualizeMotionDetections_frameSize_timeStamp___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  double v30;
  id v31;

  v31 = a2;
  objc_msgSend(v31, "origin");
  v4 = v3;
  v5 = *(double *)(a1 + 32);
  objc_msgSend(v31, "origin");
  v7 = v6;
  v8 = *(double *)(a1 + 40);
  objc_msgSend(v31, "target");
  v10 = v9;
  v11 = *(double *)(a1 + 32);
  objc_msgSend(v31, "target");
  v12 = v4 * v5;
  v13 = v7 * v8;
  v14 = v10 * v11;
  v16 = v15 * *(double *)(a1 + 40);
  if (v4 * v5 >= v10 * v11)
    v17 = v10 * v11;
  else
    v17 = v4 * v5;
  if (v4 * v5 >= v10 * v11)
    v18 = v16;
  else
    v18 = v7 * v8;
  v19 = 0.0;
  v20 = v14 - v12;
  v21 = (v16 - v13) / (v14 - v12);
  if (v14 == v12)
    v21 = 0.0;
  for (; (v17 - v12) * (v17 - v14) <= 0.0; v18 = v21 + v18)
  {
    v22 = *(double *)(a1 + 32);
    v23 = *(double *)(a1 + 40) + -1.0;
    if (v23 >= v18)
      v23 = v18;
    v24 = (unint64_t)fmax(v23, 0.0);
    v25 = v22 + -1.0;
    if (v22 + -1.0 >= v17)
      v25 = v17;
    *(_BYTE *)(*(_QWORD *)(a1 + 48) + (unint64_t)fmax(v25, 0.0) + *(_QWORD *)(a1 + 56) * v24) = -1;
    v17 = v17 + 1.0;
  }
  if (v13 < v16)
  {
    v26 = v7 * v8;
  }
  else
  {
    v12 = v10 * v11;
    v26 = v16;
  }
  if (v16 != v13)
    v19 = v20 / (v16 - v13);
  for (; (v26 - v13) * (v26 - v16) <= 0.0; v26 = v26 + 1.0)
  {
    v27 = *(double *)(a1 + 32);
    v28 = *(double *)(a1 + 40) + -1.0;
    if (v28 >= v26)
      v28 = v26;
    v29 = (unint64_t)fmax(v28, 0.0);
    v30 = v27 + -1.0;
    if (v27 + -1.0 >= v12)
      v30 = v12;
    *(_BYTE *)(*(_QWORD *)(a1 + 48) + (unint64_t)fmax(v30, 0.0) + *(_QWORD *)(a1 + 56) * v29) = -1;
    v12 = v19 + v12;
  }

}

- (__CFArray)resizedSampleBuffers
{
  return self->_resizedSampleBuffers;
}

@end
