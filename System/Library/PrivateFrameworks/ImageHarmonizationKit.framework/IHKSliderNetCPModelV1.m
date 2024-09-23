@implementation IHKSliderNetCPModelV1

- (unint64_t)contentFVecSize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  objc_msgSend_contentFVecShape(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_product_(self, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (unint64_t)styleFVecSize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  objc_msgSend_styleFVecShape(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_product_(self, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (IHKSliderNetCPModelV1)initWithModel:(id)a3
{
  return (IHKSliderNetCPModelV1 *)objc_msgSend_initWithModel_options_error_(self, a2, (uint64_t)a3, 0, 0);
}

- (IHKSliderNetCPModelV1)initWithModel:(id)a3 options:(id)a4 error:(id *)a5
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  _QWORD *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  std::__shared_weak_count *v139;
  unint64_t *v140;
  unint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  _QWORD *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  std::__shared_weak_count *v152;
  unint64_t *v153;
  unint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  __CFString *v159;
  const char *v160;
  uint64_t v161;
  char v162;
  int v163;
  char v164;
  int v165;
  int v166;
  uint64_t v167;
  _BOOL4 v169;
  _BOOL4 v171;
  _BOOL4 v173;
  _BOOL4 v175;
  _BOOL4 v177;
  id v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  size_t v184;
  void *v185;
  void **v186;
  uint64_t v187;
  uint64_t v188;
  void **v189;
  size_t v190;
  size_t v191;
  _BYTE *v192;
  int v193;
  _BOOL4 v196;
  unint64_t v197;
  unint64_t v198;
  int v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  BOOL v203;
  const char *v204;
  _BOOL4 v205;
  int v206;
  char *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  __CFString *v211;
  const __CFString *v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  id v218;
  const char *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  unint64_t v223;
  uint64_t v224;
  __CFString *v225;
  const __CFString *v226;
  __CFString *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t j;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  id v241;
  const char *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  unint64_t v246;
  uint64_t v247;
  __CFString *v248;
  const __CFString *v249;
  __CFString *v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t i;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  IHKFilterSequence *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  id v294;
  void *v295;
  id v296;
  void *v297;
  id v298;
  id v299;
  id v300;
  IHKSliderNetCPModelV1 *v301;
  __CFString *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  int v306;
  const __CFString *v307;
  const __CFString *v308;
  uint64_t v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  void *__dst[2];
  unint64_t v319;
  void *__p[2];
  char v321;
  _BYTE __s1[24];
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  objc_super v327;
  _BYTE v328[128];
  _BYTE v329[128];
  _BYTE v330[128];
  uint64_t v331;

  v331 = *MEMORY[0x24BDAC8D0];
  v327.receiver = self;
  v327.super_class = (Class)IHKSliderNetCPModelV1;
  v296 = a3;
  v294 = a4;
  v301 = -[IHKSliderNetCPModel initWithModel:options:error:](&v327, sel_initWithModel_options_error_, v296);
  if (!v301)
    goto LABEL_153;
  objc_msgSend_stringByAppendingPathComponent_(v296, v6, (uint64_t)CFSTR("net_info.json"), v7, v8);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loadJSonFrom_(IHKSliderNetCPModel, v9, (uint64_t)v297, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInfo_(v301, v13, (uint64_t)v12, v14, v15);

  objc_msgSend_info(v301, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v20, v21, (uint64_t)CFSTR("input_image_shape"), v22, v23);
  v295 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v295, v24, 1, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v27, v28, v29, v30, v31);
  v33 = v32;
  objc_msgSend_objectAtIndexedSubscript_(v295, v34, 2, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v37, v38, v39, v40, v41);
  objc_msgSend_setImageSize_(v301, v42, v43, v44, v45, v33, v46);

  objc_msgSend_info(v301, v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v51, v52, (uint64_t)CFSTR("adjustment_endpoints"), v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAdjustmentEndpoints_(v301, v56, (uint64_t)v55, v57, v58);

  objc_msgSend_info(v301, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v63, v64, (uint64_t)CFSTR("content_fvec_endpoint"), v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContentFVecEndpoint_(v301, v68, (uint64_t)v67, v69, v70);

  objc_msgSend_info(v301, v71, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v75, v76, (uint64_t)CFSTR("style_fvec_endpoint"), v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStyleFVecEndpoint_(v301, v80, (uint64_t)v79, v81, v82);

  objc_msgSend_info(v301, v83, v84, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v87, v88, (uint64_t)CFSTR("content_vector_shape"), v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContentFVecShape_(v301, v92, (uint64_t)v91, v93, v94);

  objc_msgSend_info(v301, v95, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v99, v100, (uint64_t)CFSTR("style_vector_shape"), v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStyleFVecShape_(v301, v104, (uint64_t)v103, v105, v106);

  objc_msgSend_info(v301, v107, v108, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v301->_colorSpace = (CGColorSpace *)objc_msgSend_extractColorSpaceFromInfo_(v301, v112, (uint64_t)v111, v113, v114);

  objc_msgSend_stringByAppendingPathComponent_(v296, v115, (uint64_t)CFSTR("contentFVec.espresso.net"), v116, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  v298 = objc_retainAutorelease(v118);
  *(_QWORD *)__s1 = objc_msgSend_UTF8String(v298, v119, v120, v121, v122);
  v123 = operator new(0x30uLL);
  v123[1] = 0;
  v123[2] = 0;
  *v123 = &off_250F5D710;
  sub_23ECB9F8C((uint64_t)__p, v123 + 3, (const char **)__s1);
  cntrl = (std::__shared_weak_count *)v301->contentFVecNet.__cntrl_;
  v301->contentFVecNet.__ptr_ = (EspressoNet *)(v123 + 3);
  v301->contentFVecNet.__cntrl_ = (__shared_weak_count *)v123;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v129 = __ldaxr(p_shared_owners);
    while (__stlxr(v129 - 1, p_shared_owners));
    if (!v129)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  objc_msgSend_stringByAppendingPathComponent_(v296, v124, (uint64_t)CFSTR("styleFVec.espresso.net"), v125, v126);
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  v299 = objc_retainAutorelease(v130);
  *(_QWORD *)__s1 = objc_msgSend_UTF8String(v299, v131, v132, v133, v134);
  v135 = operator new(0x30uLL);
  v135[1] = 0;
  v135[2] = 0;
  *v135 = &off_250F5D710;
  sub_23ECB9F8C((uint64_t)__p, v135 + 3, (const char **)__s1);
  v139 = (std::__shared_weak_count *)v301->styleFVecNet.__cntrl_;
  v301->styleFVecNet.__ptr_ = (EspressoNet *)(v135 + 3);
  v301->styleFVecNet.__cntrl_ = (__shared_weak_count *)v135;
  if (v139)
  {
    v140 = (unint64_t *)&v139->__shared_owners_;
    do
      v141 = __ldaxr(v140);
    while (__stlxr(v141 - 1, v140));
    if (!v141)
    {
      ((void (*)(std::__shared_weak_count *))v139->__on_zero_shared)(v139);
      std::__shared_weak_count::__release_weak(v139);
    }
  }
  objc_msgSend_stringByAppendingPathComponent_(v296, v136, (uint64_t)CFSTR("styleTransfer.espresso.net"), v137, v138);
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  v300 = objc_retainAutorelease(v142);
  *(_QWORD *)__s1 = objc_msgSend_UTF8String(v300, v143, v144, v145, v146);
  v147 = operator new(0x30uLL);
  v147[1] = 0;
  v147[2] = 0;
  *v147 = &off_250F5D710;
  sub_23ECB9F8C((uint64_t)__p, v147 + 3, (const char **)__s1);
  v152 = (std::__shared_weak_count *)v301->styleTransferNet.__cntrl_;
  v301->styleTransferNet.__ptr_ = (EspressoNet *)(v147 + 3);
  v301->styleTransferNet.__cntrl_ = (__shared_weak_count *)v147;
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
  v323 = 0u;
  v324 = 0u;
  v325 = 0u;
  v326 = 0u;
  objc_msgSend_info(v301, v148, v149, v150, v151);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v155, v156, (uint64_t)CFSTR("adjustment_endpoints"), v157, v158);
  v159 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v161 = objc_msgSend_countByEnumeratingWithState_objects_count_(v159, v160, (uint64_t)&v323, (uint64_t)v330, 16);
  if (!v161)
  {
    LOBYTE(v163) = 0;
    v164 = 0;
    LOBYTE(v165) = 0;
    LOBYTE(v166) = 0;
    v309 = 0;
    v211 = &stru_250F5DBC0;
    v212 = &stru_250F5DBC0;
LABEL_104:

    goto LABEL_105;
  }
  v162 = 0;
  v163 = 0;
  v164 = 0;
  v165 = 0;
  v166 = 0;
  v309 = 0;
  v306 = 0;
  v302 = v159;
  v303 = *(_QWORD *)v324;
  do
  {
    v167 = 0;
    v304 = v161;
    do
    {
      if (*(_QWORD *)v324 != v303)
        objc_enumerationMutation(v159);
      v305 = v167;
      v178 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v323 + 1) + 8 * v167));
      v183 = (const char *)objc_msgSend_UTF8String(v178, v179, v180, v181, v182);
      v184 = strlen(v183);
      if (v184 > 0x7FFFFFFFFFFFFFF7)
        sub_23ECB1D38();
      v185 = (void *)v184;
      if (v184 >= 0x17)
      {
        v187 = (v184 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v184 | 7) != 0x17)
          v187 = v184 | 7;
        v188 = v187 + 1;
        v186 = (void **)operator new(v187 + 1);
        __dst[1] = v185;
        v319 = v188 | 0x8000000000000000;
        __dst[0] = v186;
LABEL_61:
        memmove(v186, v183, (size_t)v185);
        goto LABEL_62;
      }
      HIBYTE(v319) = v184;
      v186 = __dst;
      if (v184)
        goto LABEL_61;
LABEL_62:
      *((_BYTE *)v185 + (_QWORD)v186) = 0;
      sub_23ECBDF7C(__dst, (uint64_t)__p);
      if (v321 >= 0)
        v189 = __p;
      else
        v189 = (void **)__p[0];
      v190 = strlen((const char *)v189);
      if (v190 > 0x7FFFFFFFFFFFFFF7)
        sub_23ECB1D38();
      v191 = v190;
      if (v190 >= 0x17)
      {
        v200 = (v190 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v190 | 7) != 0x17)
          v200 = v190 | 7;
        v201 = v200 + 1;
        v192 = operator new(v200 + 1);
        *(_QWORD *)&__s1[8] = v191;
        *(_QWORD *)&__s1[16] = v201 | 0x8000000000000000;
        *(_QWORD *)__s1 = v192;
      }
      else
      {
        __s1[23] = v190;
        v192 = __s1;
        if (!v190)
        {
          __s1[0] = 0;
          if ((v321 & 0x80000000) == 0)
            goto LABEL_69;
          goto LABEL_87;
        }
      }
      memmove(v192, v189, v191);
      v192[v191] = 0;
      if ((v321 & 0x80000000) == 0)
      {
LABEL_69:
        if ((SHIBYTE(v319) & 0x80000000) == 0)
          goto LABEL_70;
        goto LABEL_88;
      }
LABEL_87:
      operator delete(__p[0]);
      if ((SHIBYTE(v319) & 0x80000000) == 0)
      {
LABEL_70:
        v193 = __s1[23];
        if ((__s1[23] & 0x80000000) != 0)
          goto LABEL_89;
        goto LABEL_71;
      }
LABEL_88:
      operator delete(__dst[0]);
      v193 = __s1[23];
      if ((__s1[23] & 0x80000000) != 0)
      {
LABEL_89:
        v202 = *(const char **)__s1;
        v306 |= strcmp(*(const char **)__s1, "WhiteBalanceTempTintCI") == 0;
        v199 = strcmp(v202, "HighKeyCI");
        goto LABEL_95;
      }
LABEL_71:
      v196 = *(_QWORD *)__s1 == 0x6C61426574696857
          && *(_QWORD *)&__s1[8] == 0x706D655465636E61
          && *(_QWORD *)&__s1[15] == 0x4943746E695470;
      v306 |= v196;
      v197 = bswap64(*(unint64_t *)__s1);
      v198 = 0x486967684B657943;
      if (v197 != 0x486967684B657943)
        goto LABEL_91;
      v197 = bswap32(*(unsigned __int16 *)&__s1[8]) >> 16;
      if ((_DWORD)v197 != 18688)
      {
        v198 = 18688;
LABEL_91:
        if (v197 < v198)
          v199 = -1;
        else
          v199 = 1;
        goto LABEL_94;
      }
      v199 = 0;
LABEL_94:
      v202 = __s1;
LABEL_95:
      v203 = v199 == 0;
      v205 = strcmp(v202, "ExposureAndBlackPointCI") == 0;
      v206 = v205 | v163;
      if (v193 < 0)
      {
        v207 = *(char **)__s1;
        v163 = (strcmp(*(const char **)__s1, "ExposureCI") == 0) | v206;
        v165 |= strcmp(v207, "HighlightsCI") == 0;
        v166 |= strcmp(v207, "ContrastCI") == 0;
        LODWORD(v309) = (strcmp(v207, "ColorCastCI") == 0) | v309;
        HIDWORD(v309) |= strcmp(v207, "VibrancyCI") == 0;
        operator delete(v207);
      }
      else
      {
        v169 = *(_QWORD *)__s1 == 0x657275736F707845 && *(_QWORD *)&__s1[3] == 0x4943657275736FLL;
        v163 = v169 | v206;
        v171 = *(_QWORD *)__s1 == 0x6867696C68676948 && *(_QWORD *)&__s1[5] == 0x49437374686769;
        v165 |= v171;
        v173 = *(_QWORD *)__s1 == 0x74736172746E6F43 && *(_QWORD *)&__s1[3] == 0x49437473617274;
        v166 |= v173;
        v175 = *(_QWORD *)__s1 == 0x736143726F6C6F43 && *(_DWORD *)&__s1[8] == 4801396;
        v177 = *(_QWORD *)__s1 == 0x79636E6172626956 && *(_QWORD *)&__s1[3] == 0x494379636E6172;
        LODWORD(v309) = v175 | v309;
        HIDWORD(v309) |= v177;
      }
      v162 |= v203;
      v164 |= v205;
      v167 = v305 + 1;
      v159 = v302;
    }
    while (v304 != v305 + 1);
    v161 = objc_msgSend_countByEnumeratingWithState_objects_count_(v302, v204, (uint64_t)&v323, (uint64_t)v330, 16);
  }
  while (v161);

  if ((v306 & 1) == 0)
  {
    v212 = &stru_250F5DBC0;
    v159 = &stru_250F5DBC0;
    if ((v162 & 1) == 0)
    {
      v211 = &stru_250F5DBC0;
      if ((v163 & 1) == 0)
        goto LABEL_106;
      goto LABEL_129;
    }
    goto LABEL_103;
  }
  objc_msgSend_stringByAppendingString_(&stru_250F5DBC0, v208, (uint64_t)CFSTR("PITempTintFilter"), v209, v210);
  v211 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v212 = CFSTR("->");
  v159 = v211;
  if ((v162 & 1) != 0)
  {
LABEL_103:
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v208, (uint64_t)CFSTR("%@%@CIHighKey"), v209, v210, v159, v212);
    v211 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v212 = CFSTR("->");
    goto LABEL_104;
  }
LABEL_105:
  if ((v163 & 1) == 0)
  {
LABEL_106:
    if ((v164 & 1) == 0 && (v166 & 1) == 0 && (v165 & 1) == 0)
    {
      if (((v309 | HIDWORD(v309)) & 1) != 0)
        goto LABEL_110;
LABEL_151:
      v235 = v211;
      goto LABEL_152;
    }
  }
LABEL_129:
  v236 = (void *)objc_opt_new();
  v240 = v236;
  if ((v163 & 1) != 0)
    objc_msgSend_addObject_(v236, v237, (uint64_t)CFSTR("exposure"), v238, v239);
  if ((v164 & 1) != 0)
    objc_msgSend_addObject_(v240, v237, (uint64_t)CFSTR("black"), v238, v239);
  if ((v166 & 1) != 0)
    objc_msgSend_addObject_(v240, v237, (uint64_t)CFSTR("contrast"), v238, v239);
  if ((v165 & 1) != 0)
    objc_msgSend_addObject_(v240, v237, (uint64_t)CFSTR("highlights"), v238, v239);
  v316 = 0u;
  v317 = 0u;
  v314 = 0u;
  v315 = 0u;
  v241 = v240;
  v246 = objc_msgSend_countByEnumeratingWithState_objects_count_(v241, v242, (uint64_t)&v314, (uint64_t)v329, 16);
  v308 = v212;
  if (v246)
  {
    v247 = *(_QWORD *)v315;
    v248 = &stru_250F5DBC0;
    v249 = &stru_250F5DBC0;
    do
    {
      if (*(_QWORD *)v315 != v247)
        objc_enumerationMutation(v241);
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v243, (uint64_t)CFSTR("%@%@%@"), v244, v245, v248, v249, **((_QWORD **)&v314 + 1));
      v250 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v246 >= 2)
      {
        for (i = 1; i != v246; ++i)
        {
          if (*(_QWORD *)v315 != v247)
            objc_enumerationMutation(v241);
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v251, (uint64_t)CFSTR("%@%@%@"), v252, v253, v250, CFSTR(","), *(_QWORD *)(*((_QWORD *)&v314 + 1) + 8 * i));
          v248 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v250 = v248;
        }
      }
      else
      {
        v248 = v250;
      }
      v246 = objc_msgSend_countByEnumeratingWithState_objects_count_(v241, v251, (uint64_t)&v314, (uint64_t)v329, 16);
      v249 = CFSTR(",");
    }
    while (v246);
  }
  else
  {
    v248 = &stru_250F5DBC0;
  }

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v255, (uint64_t)CFSTR("%@%@CISmartToneFilter[%@]"), v256, v257, v211, v308, v248);
  v258 = objc_claimAutoreleasedReturnValue();

  v212 = CFSTR("->");
  v211 = (__CFString *)v258;
  if (((v309 | HIDWORD(v309)) & 1) == 0)
    goto LABEL_151;
LABEL_110:
  v213 = (void *)objc_opt_new();
  v217 = v213;
  if ((v309 & 1) != 0)
    objc_msgSend_addObject_(v213, v214, (uint64_t)CFSTR("cast"), v215, v216);
  if ((v309 & 0x100000000) != 0)
    objc_msgSend_addObject_(v217, v214, (uint64_t)CFSTR("vibrancy"), v215, v216);
  v312 = 0u;
  v313 = 0u;
  v310 = 0u;
  v311 = 0u;
  v218 = v217;
  v223 = objc_msgSend_countByEnumeratingWithState_objects_count_(v218, v219, (uint64_t)&v310, (uint64_t)v328, 16);
  v307 = v212;
  if (v223)
  {
    v224 = *(_QWORD *)v311;
    v225 = &stru_250F5DBC0;
    v226 = &stru_250F5DBC0;
    do
    {
      if (*(_QWORD *)v311 != v224)
        objc_enumerationMutation(v218);
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v220, (uint64_t)CFSTR("%@%@%@"), v221, v222, v225, v226, **((_QWORD **)&v310 + 1));
      v227 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v223 >= 2)
      {
        for (j = 1; j != v223; ++j)
        {
          if (*(_QWORD *)v311 != v224)
            objc_enumerationMutation(v218);
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v228, (uint64_t)CFSTR("%@%@%@"), v229, v230, v227, CFSTR(","), *(_QWORD *)(*((_QWORD *)&v310 + 1) + 8 * j));
          v225 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v227 = v225;
        }
      }
      else
      {
        v225 = v227;
      }
      v223 = objc_msgSend_countByEnumeratingWithState_objects_count_(v218, v228, (uint64_t)&v310, (uint64_t)v328, 16);
      v226 = CFSTR(",");
    }
    while (v223);
  }
  else
  {
    v225 = &stru_250F5DBC0;
  }

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v232, (uint64_t)CFSTR("%@%@CISmartColorFilter[%@]"), v233, v234, v211, v307, v225);
  v235 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_152:
  v259 = [IHKFilterSequence alloc];
  v263 = (void *)objc_msgSend_initWithFilterSpec_(v259, v260, (uint64_t)v235, v261, v262);
  objc_msgSend_setFilterSequence_(v301, v264, (uint64_t)v263, v265, v266);

  objc_msgSend_filterSequence(v301, v267, v268, v269, v270);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sliderOrder(v271, v272, v273, v274, v275);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSliderOrder_(v301, v277, (uint64_t)v276, v278, v279);

  objc_msgSend_filterSequence(v301, v280, v281, v282, v283);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sliderSpecs(v284, v285, v286, v287, v288);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSliderSpecs_(v301, v290, (uint64_t)v289, v291, v292);

LABEL_153:
  return v301;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (id)predictStyleVectorForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  __CVBuffer *v12;
  void *v13;
  EspressoNet *ptr;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  size_t v25;
  void *v26;
  void **v27;
  uint64_t v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *p_shared_owners;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  IHKFeatureVector *v39;
  void *v40;
  int64_t v41;
  unint64_t *v42;
  unint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  id v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  uint64_t (**v59)();
  uint64_t v60;
  void *v61;
  void *v62;
  char *v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  void *__dst[2];
  unint64_t v67;
  _OWORD v68[2];
  int v69;
  _QWORD v70[2];
  void *__p;
  void *v72;
  std::__shared_weak_count *v73;
  uint64_t (**v74)();
  int v75;
  void *v76;
  _BYTE *v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  _QWORD v80[2];
  void *v81;
  void *v82;
  std::__shared_weak_count *v83;
  objc_super v84;
  __int128 v85;
  char v86;
  uint64_t (**v87)();
  void *v88;
  void *v89;
  std::__shared_weak_count *v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v84.receiver = self;
  v84.super_class = (Class)IHKSliderNetCPModelV1;
  -[IHKSliderNetCPModel predictStyleVectorForPixelBuffer:scenePrint:error:](&v84, sel_predictStyleVectorForPixelBuffer_scenePrint_error_, a3, v8, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (a5 && *a5
    || (v12 = (__CVBuffer *)objc_msgSend_preprocessPixelBuffer_error_(self, v9, (uint64_t)a3, (uint64_t)a5, v10), a5)
    && *a5)
  {
    v13 = 0;
    goto LABEL_63;
  }
  sub_23ECB62BC((uint64_t)v80, v12);
  ptr = self->styleFVecNet.__ptr_;
  sub_23ECC1CD4((uint64_t)&v85, "style_image:0", (uint64_t)v80);
  memset(v68, 0, sizeof(v68));
  v69 = 1065353216;
  sub_23ECB982C((uint64_t)v68, (uint64_t)&v85, &v85);
  objc_msgSend_styleFVecEndpoint(self, v15, v16, v17, v18);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24 = (const char *)objc_msgSend_UTF8String(v19, v20, v21, v22, v23);
  v25 = strlen(v24);
  if (v25 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  v26 = (void *)v25;
  if (v25 >= 0x17)
  {
    v28 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v25 | 7) != 0x17)
      v28 = v25 | 7;
    v29 = v28 + 1;
    v27 = (void **)operator new(v28 + 1);
    __dst[1] = v26;
    v67 = v29 | 0x8000000000000000;
    __dst[0] = v27;
    goto LABEL_13;
  }
  HIBYTE(v67) = v25;
  v27 = __dst;
  if (v25)
LABEL_13:
    memmove(v27, v24, (size_t)v26);
  *((_BYTE *)v26 + (_QWORD)v27) = 0;
  sub_23ECB4894((uint64_t)ptr, (uint64_t)v68, (uint64_t)__dst, (uint64_t)v70);
  sub_23ECB4B60((uint64_t)v70, (uint64_t)&v74);
  v70[0] = &off_250F5D430;
  v30 = v73;
  if (v73)
  {
    p_shared_owners = (unint64_t *)&v73->__shared_owners_;
    do
      v32 = __ldaxr(p_shared_owners);
    while (__stlxr(v32 - 1, p_shared_owners));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  if (__p)
  {
    v72 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v67) < 0)
    operator delete(__dst[0]);

  sub_23ECB8F84((uint64_t)v68);
  v87 = &off_250F5D430;
  v33 = v90;
  if (v90)
  {
    v34 = (unint64_t *)&v90->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  if (v88)
  {
    v89 = v88;
    operator delete(v88);
  }
  if (v86 < 0)
    operator delete((void *)v85);
  v39 = [IHKFeatureVector alloc];
  v59 = &off_250F5D430;
  LODWORD(v60) = v75;
  v62 = 0;
  v63 = 0;
  v61 = 0;
  v40 = v76;
  v41 = v77 - (_BYTE *)v76;
  if (v77 != v76)
  {
    if (v41 < 0)
      sub_23ECB1668();
    v61 = operator new(v77 - (_BYTE *)v76);
    v63 = (char *)v61 + 8 * (v41 >> 3);
    memcpy(v61, v40, v41);
    v62 = v63;
  }
  v64 = v78;
  v65 = v79;
  if (v79)
  {
    v42 = (unint64_t *)&v79->__shared_owners_;
    do
      v43 = __ldxr(v42);
    while (__stxr(v43 + 1, v42));
  }
  v59 = &off_250F5D3E8;
  v47 = (void *)objc_msgSend_initWithTensor_(v39, v36, (uint64_t)&v59, v37, v38);
  v59 = &off_250F5D430;
  v48 = v65;
  if (v65)
  {
    v49 = (unint64_t *)&v65->__shared_owners_;
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }
  if (v61)
  {
    v62 = v61;
    operator delete(v61);
  }
  if (v11)
  {
    objc_msgSend_featureVectorByAppendingFeatureVector_(v11, v44, (uint64_t)v47, v45, v46, v59, v60);
    v51 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v51 = v47;
  }
  v11 = v51;

  v74 = &off_250F5D430;
  v52 = v79;
  if (v79)
  {
    v53 = (unint64_t *)&v79->__shared_owners_;
    do
      v54 = __ldaxr(v53);
    while (__stlxr(v54 - 1, v53));
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
  }
  if (v76)
  {
    v77 = v76;
    operator delete(v76);
  }
  v80[0] = &off_250F5D430;
  v55 = v83;
  if (v83)
  {
    v56 = (unint64_t *)&v83->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
  if (v81)
  {
    v82 = v81;
    operator delete(v81);
  }
  v13 = v11;
LABEL_63:

  return v13;
}

- (id)predictContentVectorForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  __CVBuffer *v12;
  void *v13;
  EspressoNet *ptr;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  size_t v25;
  void *v26;
  void **v27;
  uint64_t v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *p_shared_owners;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  IHKFeatureVector *v39;
  void *v40;
  int64_t v41;
  unint64_t *v42;
  unint64_t v43;
  void *v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  uint64_t (**v59)();
  uint64_t v60;
  void *v61;
  void *v62;
  char *v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  void *__dst[2];
  unint64_t v67;
  _OWORD v68[2];
  int v69;
  _QWORD v70[2];
  void *__p;
  void *v72;
  std::__shared_weak_count *v73;
  uint64_t (**v74)();
  int v75;
  void *v76;
  _BYTE *v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  _QWORD v80[2];
  void *v81;
  void *v82;
  std::__shared_weak_count *v83;
  objc_super v84;
  __int128 v85;
  char v86;
  uint64_t (**v87)();
  void *v88;
  void *v89;
  std::__shared_weak_count *v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v84.receiver = self;
  v84.super_class = (Class)IHKSliderNetCPModelV1;
  -[IHKSliderNetCPModel predictContentVectorForPixelBuffer:scenePrint:error:](&v84, sel_predictContentVectorForPixelBuffer_scenePrint_error_, a3, v8, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (a5 && *a5
    || (v12 = (__CVBuffer *)objc_msgSend_preprocessPixelBuffer_error_(self, v9, (uint64_t)a3, (uint64_t)a5, v10), a5)
    && *a5)
  {
    v13 = 0;
    goto LABEL_63;
  }
  sub_23ECB62BC((uint64_t)v80, v12);
  ptr = self->contentFVecNet.__ptr_;
  sub_23ECC1E30((uint64_t)&v85, "image:0", (uint64_t)v80);
  memset(v68, 0, sizeof(v68));
  v69 = 1065353216;
  sub_23ECB982C((uint64_t)v68, (uint64_t)&v85, &v85);
  objc_msgSend_contentFVecEndpoint(self, v15, v16, v17, v18);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24 = (const char *)objc_msgSend_UTF8String(v19, v20, v21, v22, v23);
  v25 = strlen(v24);
  if (v25 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  v26 = (void *)v25;
  if (v25 >= 0x17)
  {
    v28 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v25 | 7) != 0x17)
      v28 = v25 | 7;
    v29 = v28 + 1;
    v27 = (void **)operator new(v28 + 1);
    __dst[1] = v26;
    v67 = v29 | 0x8000000000000000;
    __dst[0] = v27;
    goto LABEL_13;
  }
  HIBYTE(v67) = v25;
  v27 = __dst;
  if (v25)
LABEL_13:
    memmove(v27, v24, (size_t)v26);
  *((_BYTE *)v26 + (_QWORD)v27) = 0;
  sub_23ECB4894((uint64_t)ptr, (uint64_t)v68, (uint64_t)__dst, (uint64_t)v70);
  sub_23ECB4B60((uint64_t)v70, (uint64_t)&v74);
  v70[0] = &off_250F5D430;
  v30 = v73;
  if (v73)
  {
    p_shared_owners = (unint64_t *)&v73->__shared_owners_;
    do
      v32 = __ldaxr(p_shared_owners);
    while (__stlxr(v32 - 1, p_shared_owners));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  if (__p)
  {
    v72 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v67) < 0)
    operator delete(__dst[0]);

  sub_23ECB8F84((uint64_t)v68);
  v87 = &off_250F5D430;
  v33 = v90;
  if (v90)
  {
    v34 = (unint64_t *)&v90->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  if (v88)
  {
    v89 = v88;
    operator delete(v88);
  }
  if (v86 < 0)
    operator delete((void *)v85);
  v39 = [IHKFeatureVector alloc];
  v59 = &off_250F5D430;
  LODWORD(v60) = v75;
  v62 = 0;
  v63 = 0;
  v61 = 0;
  v40 = v76;
  v41 = v77 - (_BYTE *)v76;
  if (v77 != v76)
  {
    if (v41 < 0)
      sub_23ECB1668();
    v61 = operator new(v77 - (_BYTE *)v76);
    v63 = (char *)v61 + 8 * (v41 >> 3);
    memcpy(v61, v40, v41);
    v62 = v63;
  }
  v64 = v78;
  v65 = v79;
  if (v79)
  {
    v42 = (unint64_t *)&v79->__shared_owners_;
    do
      v43 = __ldxr(v42);
    while (__stxr(v43 + 1, v42));
  }
  v59 = &off_250F5D3E8;
  v44 = (void *)objc_msgSend_initWithTensor_(v39, v36, (uint64_t)&v59, v37, v38);
  v59 = &off_250F5D430;
  v45 = v65;
  if (v65)
  {
    v46 = (unint64_t *)&v65->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  if (v61)
  {
    v62 = v61;
    operator delete(v61);
  }
  NSLog(CFSTR("DEBUG>> content fvec shape: [%ld, %ld, %ld, %ld]"), *(_QWORD *)v76, *((_QWORD *)v76 + 1), *((_QWORD *)v76 + 2), *((_QWORD *)v76 + 3), v59, v60);
  if (v11)
  {
    objc_msgSend_featureVectorByAppendingFeatureVector_(v11, v48, (uint64_t)v44, v49, v50);
    v51 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v51 = v44;
  }
  v11 = v51;

  v74 = &off_250F5D430;
  v52 = v79;
  if (v79)
  {
    v53 = (unint64_t *)&v79->__shared_owners_;
    do
      v54 = __ldaxr(v53);
    while (__stlxr(v54 - 1, v53));
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
  }
  if (v76)
  {
    v77 = v76;
    operator delete(v76);
  }
  v80[0] = &off_250F5D430;
  v55 = v83;
  if (v83)
  {
    v56 = (unint64_t *)&v83->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
  if (v81)
  {
    v82 = v81;
    operator delete(v81);
  }
  v13 = v11;
LABEL_63:

  return v13;
}

- (EspressoTensor)newTensorWithCorrectShape:(SEL)a3 shape:(EspressoTensor *)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  void *v67;
  const void *v68;
  EspressoTensor *result;
  void *__p;
  void *v71;
  char *v72;
  int v73;
  char *v74;
  char *v75;
  char *v76;

  v7 = a5;
  v12 = objc_msgSend_count(v7, v8, v9, v10, v11);
  v16 = v12;
  v74 = 0;
  v75 = 0;
  v76 = 0;
  if (v12)
  {
    if (v12 >> 61)
      sub_23ECB1668();
    v17 = 8 * v12;
    v18 = (char *)operator new(8 * v12);
    v74 = v18;
    v76 = &v18[8 * v16];
    bzero(v18, 8 * v16);
    v19 = &v18[v17];
    v75 = &v18[v17];
  }
  else
  {
    v19 = 0;
    v18 = 0;
  }
  objc_msgSend_objectAtIndexedSubscript_(v7, v13, 0, v14, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v18 = objc_msgSend_unsignedIntValue(v20, v21, v22, v23, v24);

  objc_msgSend_objectAtIndexedSubscript_(v7, v25, 3, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)v18 + 1) = objc_msgSend_unsignedIntValue(v28, v29, v30, v31, v32);

  objc_msgSend_objectAtIndexedSubscript_(v7, v33, 1, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)v18 + 2) = objc_msgSend_unsignedIntValue(v36, v37, v38, v39, v40);

  objc_msgSend_objectAtIndexedSubscript_(v7, v41, 2, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)v18 + 3) = objc_msgSend_unsignedIntValue(v44, v45, v46, v47, v48);

  v53 = 0;
  v54 = 1;
  while (v53 < objc_msgSend_count(v7, v49, v50, v51, v52))
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v55, v53, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend_unsignedIntValue(v58, v59, v60, v61, v62);

    v54 *= v63;
    ++v53;
  }
  v73 = 4;
  __p = 0;
  v71 = 0;
  v72 = 0;
  v64 = v19 - v18;
  if (v19 != v18)
  {
    if (v64 < 0)
      sub_23ECB1668();
    v65 = (char *)operator new(v19 - v18);
    v66 = &v65[8 * (v64 >> 3)];
    __p = v65;
    v72 = v66;
    memcpy(v65, v18, v19 - v18);
    v71 = v66;
  }
  sub_23ECB0EA8((uint64_t)retstr, &v73, (uint64_t)&__p);
  if (__p)
  {
    v71 = __p;
    operator delete(__p);
  }
  v67 = (void *)(*(uint64_t (**)(TensorStorage *))(*(_QWORD *)retstr->storage_.__ptr_ + 24))(retstr->storage_.__ptr_);
  v68 = (const void *)(*(uint64_t (**)(TensorStorage *))(*(_QWORD *)a4->storage_.__ptr_ + 24))(a4->storage_.__ptr_);
  memcpy(v67, v68, 4 * v54);
  operator delete(v18);

  return result;
}

- (id)predictSlidersForStyleVector:(id)a3 contentVector:(id)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  char *v53;
  char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  void *v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  int v69;
  char *v70;
  char *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  std::__shared_weak_count *v76;
  void *v77;
  unint64_t *v78;
  unint64_t v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  std::__shared_weak_count *v89;
  void *v90;
  unint64_t *p_shared_owners;
  unint64_t v92;
  std::__shared_weak_count *v93;
  unint64_t *v94;
  unint64_t v95;
  std::__shared_weak_count *v96;
  unint64_t *v97;
  unint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  std::__shared_weak_count *v103;
  unint64_t *v104;
  unint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  std::__shared_weak_count *v109;
  void *v110;
  unint64_t *v111;
  unint64_t v112;
  std::__shared_weak_count *v113;
  unint64_t *v114;
  unint64_t v115;
  std::__shared_weak_count *v116;
  unint64_t *v117;
  unint64_t v118;
  std::__shared_weak_count *v119;
  unint64_t *v120;
  unint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t i;
  __int128 v127;
  id v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  size_t v134;
  const char *v135;
  size_t v136;
  __int128 *v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  EspressoNet *ptr;
  std::__shared_weak_count *v142;
  unint64_t *v143;
  unint64_t v144;
  std::__shared_weak_count *v145;
  unint64_t *v146;
  unint64_t v147;
  void *v148;
  uint64_t *j;
  int v150;
  const char *v160;
  void *v161;
  double v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  double v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  double v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  double v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  double v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  void *v204;
  double v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  double v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  void *v220;
  double v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  void *v228;
  double v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  void *v236;
  double v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  id v244;
  char *v245;
  char *v246;
  void *v247;
  std::__shared_weak_count *v248;
  unint64_t *v249;
  unint64_t v250;
  std::__shared_weak_count *v251;
  unint64_t *v252;
  unint64_t v253;
  std::runtime_error *v255;
  std::runtime_error *v256;
  std::runtime_error *v257;
  std::runtime_error *exception;
  std::runtime_error *v259;
  std::runtime_error *v260;
  std::runtime_error *v261;
  std::runtime_error *v262;
  std::runtime_error *v263;
  std::runtime_error *v264;
  void *v265;
  id v266;
  void *v267;
  id v268;
  void *__s[2];
  uint64_t v270;
  _OWORD v271[2];
  int v272;
  _BYTE v273[16];
  uint64_t *v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  void *v279;
  char *v280;
  unint64_t v281;
  __int128 v282;
  void *v283[2];
  __int128 v284;
  std::__shared_weak_count *v285;
  __int128 v286;
  void *v287[2];
  __int128 v288;
  std::__shared_weak_count *v289;
  uint64_t (**v290)();
  int v291;
  void *v292[2];
  __int128 v293;
  std::__shared_weak_count *v294;
  uint64_t (**v295)();
  int v296;
  __int128 v297;
  __int128 v298;
  std::__shared_weak_count *v299;
  __int128 __dst[2];
  void *v301[2];
  std::__shared_weak_count *v302;
  std::__shared_weak_count *v303;
  void *v304[2];
  char v305;
  uint64_t (**v306)();
  void *v307;
  void *v308;
  std::__shared_weak_count *v309;
  _BYTE v310[128];
  uint64_t v311;

  v311 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v268 = a4;
  v296 = 4;
  v297 = 0u;
  v298 = 0u;
  v299 = 0;
  v294 = 0;
  v295 = &off_250F5D3E8;
  v291 = 4;
  *(_OWORD *)v292 = 0u;
  v293 = 0u;
  v290 = &off_250F5D3E8;
  if (objc_msgSend_useClipEmbedding(self, v8, v9, v10, v11))
  {
    v16 = objc_msgSend_size(v7, v12, v13, v14, v15);
    v21 = objc_msgSend_styleFVecSize(self, v17, v18, v19, v20);
    v26 = objc_msgSend_styleFVecSize(self, v22, v23, v24, v25);
    objc_msgSend_subFeatureVectorWithRange_(v7, v27, v16 - v21, v26, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_msgSend_size(v268, v30, v31, v32, v33);
    v39 = objc_msgSend_contentFVecSize(self, v35, v36, v37, v38);
    v44 = objc_msgSend_contentFVecSize(self, v40, v41, v42, v43);
    objc_msgSend_subFeatureVectorWithRange_(v268, v45, v34 - v39, v44, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v265 = v29;
    if (v29)
    {
      objc_msgSend_tensor(v29, v48, v49, v50, v51, v29);
    }
    else
    {
      v289 = 0;
      *(_OWORD *)v287 = 0u;
      v288 = 0u;
      v286 = 0u;
    }
    objc_msgSend_styleFVecShape(self, v48, v49, v50, v51, v265);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_newTensorWithCorrectShape_shape_(self, v87, (uint64_t)&v286, (uint64_t)v86, v88);
    v296 = DWORD2(__dst[0]);
    sub_23ECB18EC(&v297, *(char **)&__dst[1], *((char **)&__dst[1] + 1), (uint64_t)(*((_QWORD *)&__dst[1] + 1) - *(_QWORD *)&__dst[1]) >> 3);
    v90 = v301[1];
    v89 = v302;
    if (v302)
    {
      p_shared_owners = (unint64_t *)&v302->__shared_owners_;
      do
        v92 = __ldxr(p_shared_owners);
      while (__stxr(v92 + 1, p_shared_owners));
    }
    v93 = v299;
    *((_QWORD *)&v298 + 1) = v90;
    v299 = v89;
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
    *(_QWORD *)&__dst[0] = &off_250F5D430;
    v96 = v302;
    if (v302)
    {
      v97 = (unint64_t *)&v302->__shared_owners_;
      do
        v98 = __ldaxr(v97);
      while (__stlxr(v98 - 1, v97));
      if (!v98)
      {
        ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
        std::__shared_weak_count::__release_weak(v96);
      }
    }
    if (*(_QWORD *)&__dst[1])
    {
      *((_QWORD *)&__dst[1] + 1) = *(_QWORD *)&__dst[1];
      operator delete(*(void **)&__dst[1]);
    }

    *(_QWORD *)&v286 = &off_250F5D430;
    v103 = v289;
    if (v289)
    {
      v104 = (unint64_t *)&v289->__shared_owners_;
      do
        v105 = __ldaxr(v104);
      while (__stlxr(v105 - 1, v104));
      if (!v105)
      {
        ((void (*)(std::__shared_weak_count *))v103->__on_zero_shared)(v103);
        std::__shared_weak_count::__release_weak(v103);
      }
    }
    if (v287[0])
    {
      v287[1] = v287[0];
      operator delete(v287[0]);
    }
    if (v47)
    {
      objc_msgSend_tensor(v47, v99, v100, v101, v102);
    }
    else
    {
      v285 = 0;
      *(_OWORD *)v283 = 0u;
      v284 = 0u;
      v282 = 0u;
    }
    objc_msgSend_contentFVecShape(self, v99, v100, v101, v102);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_newTensorWithCorrectShape_shape_(self, v107, (uint64_t)&v282, (uint64_t)v106, v108);
    v291 = DWORD2(__dst[0]);
    sub_23ECB18EC(v292, *(char **)&__dst[1], *((char **)&__dst[1] + 1), (uint64_t)(*((_QWORD *)&__dst[1] + 1) - *(_QWORD *)&__dst[1]) >> 3);
    v110 = v301[1];
    v109 = v302;
    if (v302)
    {
      v111 = (unint64_t *)&v302->__shared_owners_;
      do
        v112 = __ldxr(v111);
      while (__stxr(v112 + 1, v111));
    }
    v113 = v294;
    *((_QWORD *)&v293 + 1) = v110;
    v294 = v109;
    if (v113)
    {
      v114 = (unint64_t *)&v113->__shared_owners_;
      do
        v115 = __ldaxr(v114);
      while (__stlxr(v115 - 1, v114));
      if (!v115)
      {
        ((void (*)(std::__shared_weak_count *))v113->__on_zero_shared)(v113);
        std::__shared_weak_count::__release_weak(v113);
      }
    }
    *(_QWORD *)&__dst[0] = &off_250F5D430;
    v116 = v302;
    if (v302)
    {
      v117 = (unint64_t *)&v302->__shared_owners_;
      do
        v118 = __ldaxr(v117);
      while (__stlxr(v118 - 1, v117));
      if (!v118)
      {
        ((void (*)(std::__shared_weak_count *))v116->__on_zero_shared)(v116);
        std::__shared_weak_count::__release_weak(v116);
      }
    }
    if (*(_QWORD *)&__dst[1])
    {
      *((_QWORD *)&__dst[1] + 1) = *(_QWORD *)&__dst[1];
      operator delete(*(void **)&__dst[1]);
    }

    *(_QWORD *)&v282 = &off_250F5D430;
    v119 = v285;
    if (v285)
    {
      v120 = (unint64_t *)&v285->__shared_owners_;
      do
        v121 = __ldaxr(v120);
      while (__stlxr(v121 - 1, v120));
      if (!v121)
      {
        ((void (*)(std::__shared_weak_count *))v119->__on_zero_shared)(v119);
        std::__shared_weak_count::__release_weak(v119);
      }
    }
    if (v283[0])
    {
      v283[1] = v283[0];
      operator delete(v283[0]);
    }
    v268 = v47;
  }
  else
  {
    if (v7)
    {
      objc_msgSend_tensor(v7, v12, v13, v14, v15);
      v52 = DWORD2(__dst[0]);
      v54 = (char *)*((_QWORD *)&__dst[1] + 1);
      v53 = *(char **)&__dst[1];
    }
    else
    {
      v54 = 0;
      v53 = 0;
      v52 = 0;
      v302 = 0;
      *(_OWORD *)v301 = 0u;
      memset(__dst, 0, sizeof(__dst));
    }
    v296 = v52;
    sub_23ECB18EC(&v297, v53, v54, (v54 - v53) >> 3);
    v60 = v301[1];
    v59 = v302;
    if (v302)
    {
      v61 = (unint64_t *)&v302->__shared_owners_;
      do
        v62 = __ldxr(v61);
      while (__stxr(v62 + 1, v61));
    }
    v63 = v299;
    *((_QWORD *)&v298 + 1) = v60;
    v299 = v59;
    if (v63)
    {
      v64 = (unint64_t *)&v63->__shared_owners_;
      do
        v65 = __ldaxr(v64);
      while (__stlxr(v65 - 1, v64));
      if (!v65)
      {
        ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
        std::__shared_weak_count::__release_weak(v63);
      }
    }
    *(_QWORD *)&__dst[0] = &off_250F5D430;
    v66 = v302;
    if (v302)
    {
      v67 = (unint64_t *)&v302->__shared_owners_;
      do
        v68 = __ldaxr(v67);
      while (__stlxr(v68 - 1, v67));
      if (!v68)
      {
        ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
        std::__shared_weak_count::__release_weak(v66);
      }
    }
    if (*(_QWORD *)&__dst[1])
    {
      *((_QWORD *)&__dst[1] + 1) = *(_QWORD *)&__dst[1];
      operator delete(*(void **)&__dst[1]);
    }
    if (v268)
    {
      objc_msgSend_tensor(v268, v55, v56, v57, v58);
      v69 = DWORD2(__dst[0]);
      v71 = (char *)*((_QWORD *)&__dst[1] + 1);
      v70 = *(char **)&__dst[1];
    }
    else
    {
      v71 = 0;
      v70 = 0;
      v69 = 0;
      v302 = 0;
      *(_OWORD *)v301 = 0u;
      memset(__dst, 0, sizeof(__dst));
    }
    v291 = v69;
    sub_23ECB18EC(v292, v70, v71, (v71 - v70) >> 3);
    v77 = v301[1];
    v76 = v302;
    if (v302)
    {
      v78 = (unint64_t *)&v302->__shared_owners_;
      do
        v79 = __ldxr(v78);
      while (__stxr(v79 + 1, v78));
    }
    v80 = v294;
    *((_QWORD *)&v293 + 1) = v77;
    v294 = v76;
    if (v80)
    {
      v81 = (unint64_t *)&v80->__shared_owners_;
      do
        v82 = __ldaxr(v81);
      while (__stlxr(v82 - 1, v81));
      if (!v82)
      {
        ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
        std::__shared_weak_count::__release_weak(v80);
      }
    }
    *(_QWORD *)&__dst[0] = &off_250F5D430;
    v83 = v302;
    if (v302)
    {
      v84 = (unint64_t *)&v302->__shared_owners_;
      do
        v85 = __ldaxr(v84);
      while (__stlxr(v85 - 1, v84));
      if (!v85)
      {
        ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
        std::__shared_weak_count::__release_weak(v83);
      }
    }
    if (*(_QWORD *)&__dst[1])
    {
      *((_QWORD *)&__dst[1] + 1) = *(_QWORD *)&__dst[1];
      operator delete(*(void **)&__dst[1]);
    }
    v266 = v7;
  }
  v279 = 0;
  v280 = 0;
  v281 = 0;
  v275 = 0u;
  v276 = 0u;
  v277 = 0u;
  v278 = 0u;
  objc_msgSend_adjustmentEndpoints(self, v72, v73, v74, v75, v266);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v122, v123, (uint64_t)&v275, (uint64_t)v310, 16);
  if (v124)
  {
    v125 = *(_QWORD *)v276;
    do
    {
      for (i = 0; i != v124; ++i)
      {
        if (*(_QWORD *)v276 != v125)
          objc_enumerationMutation(v122);
        v128 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v275 + 1) + 8 * i));
        v133 = (const char *)objc_msgSend_UTF8String(v128, v129, v130, v131, v132);
        v134 = strlen(v133);
        if (v134 >= 0x7FFFFFFFFFFFFFF8)
          sub_23ECB1D38();
        v136 = v134;
        if (v134 >= 0x17)
        {
          v139 = (v134 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v134 | 7) != 0x17)
            v139 = v134 | 7;
          v140 = v139 + 1;
          v137 = (__int128 *)operator new(v139 + 1);
          *((_QWORD *)&__dst[0] + 1) = v136;
          *(_QWORD *)&__dst[1] = v140 | 0x8000000000000000;
          *(_QWORD *)&__dst[0] = v137;
        }
        else
        {
          BYTE7(__dst[1]) = v134;
          v137 = __dst;
          if (!v134)
          {
            LOBYTE(__dst[0]) = 0;
            v138 = v280;
            if ((unint64_t)v280 < v281)
              goto LABEL_93;
            goto LABEL_106;
          }
        }
        memmove(v137, v133, v136);
        *((_BYTE *)v137 + v136) = 0;
        v138 = v280;
        if ((unint64_t)v280 < v281)
        {
LABEL_93:
          v127 = __dst[0];
          *((_QWORD *)v138 + 2) = *(_QWORD *)&__dst[1];
          *(_OWORD *)v138 = v127;
          v280 = v138 + 24;
          continue;
        }
LABEL_106:
        v280 = sub_23ECC2258(&v279, (uint64_t)__dst);
        if (SBYTE7(__dst[1]) < 0)
          operator delete(*(void **)&__dst[0]);
      }
      v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v122, v135, (uint64_t)&v275, (uint64_t)v310, 16);
    }
    while (v124);
  }

  ptr = self->styleTransferNet.__ptr_;
  sub_23ECC1F8C((uint64_t)__dst, "content_fvec:0", (uint64_t)&v290);
  sub_23ECC20E8((uint64_t)v304, "style_fvec:0", (uint64_t)&v295);
  memset(v271, 0, sizeof(v271));
  v272 = 1065353216;
  sub_23ECB982C((uint64_t)v271, (uint64_t)__dst, __dst);
  sub_23ECB982C((uint64_t)v271, (uint64_t)v304, (__int128 *)v304);
  sub_23ECB5A28((uint64_t)ptr, (uint64_t)v271, (__int128 **)&v279, (uint64_t)v273);
  sub_23ECB8F84((uint64_t)v271);
  v306 = &off_250F5D430;
  v142 = v309;
  if (v309)
  {
    v143 = (unint64_t *)&v309->__shared_owners_;
    do
      v144 = __ldaxr(v143);
    while (__stlxr(v144 - 1, v143));
    if (!v144)
    {
      ((void (*)(std::__shared_weak_count *))v142->__on_zero_shared)(v142);
      std::__shared_weak_count::__release_weak(v142);
    }
  }
  if (v307)
  {
    v308 = v307;
    operator delete(v307);
  }
  if (v305 < 0)
    operator delete(v304[0]);
  *((_QWORD *)&__dst[1] + 1) = &off_250F5D430;
  v145 = v303;
  if (v303)
  {
    v146 = (unint64_t *)&v303->__shared_owners_;
    do
      v147 = __ldaxr(v146);
    while (__stlxr(v147 - 1, v146));
    if (!v147)
    {
      ((void (*)(std::__shared_weak_count *))v145->__on_zero_shared)(v145);
      std::__shared_weak_count::__release_weak(v145);
    }
  }
  if (v301[1])
  {
    v302 = (std::__shared_weak_count *)v301[1];
    operator delete(v301[1]);
  }
  if (SBYTE7(__dst[1]) < 0)
    operator delete(*(void **)&__dst[0]);
  v148 = (void *)objc_opt_new();
  for (j = v274; j; j = (uint64_t *)*j)
  {
    if (*((char *)j + 39) < 0)
    {
      sub_23ECB9310(__s, (void *)j[2], j[3]);
    }
    else
    {
      *(_OWORD *)__s = *((_OWORD *)j + 1);
      v270 = j[4];
    }
    sub_23ECBDF7C(__s, (uint64_t)__dst);
    if (SHIBYTE(v270) < 0)
    {
      operator delete(__s[0]);
      v150 = SBYTE7(__dst[1]);
      if (SBYTE7(__dst[1]) < 0)
      {
LABEL_171:
        v160 = *(const char **)&__dst[0];
        if (!strcmp(*(const char **)&__dst[0], "WhiteBalanceTempTintCI"))
          goto LABEL_181;
        if (!strcmp(v160, "ExposureAndBlackPointCI"))
        {
LABEL_184:
          if (*((_DWORD *)j + 12) != 4)
          {
            exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
            __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
          }
          v187 = (void *)MEMORY[0x24BDD16E0];
          LODWORD(v188) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)j[10] + 24))(j[10]);
          objc_msgSend_numberWithFloat_(v187, v189, v190, v191, v192, v188);
          v193 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v148, v194, (uint64_t)v193, (uint64_t)CFSTR("Exposure"), v195);

          if (*((_DWORD *)j + 12) != 4)
          {
            v257 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(v257, "Incorrect data type requested.");
            __cxa_throw(v257, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
          }
          v196 = (void *)MEMORY[0x24BDD16E0];
          LODWORD(v197) = *(_DWORD *)((*(uint64_t (**)(uint64_t))(*(_QWORD *)j[10] + 24))(j[10]) + 4);
          objc_msgSend_numberWithFloat_(v196, v198, v199, v200, v201, v197);
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v148, v202, (uint64_t)v167, (uint64_t)CFSTR("Black"), v203);
          goto LABEL_197;
        }
        if (!strcmp(v160, "ExposureCI"))
          goto LABEL_187;
        if (!strcmp(v160, "ColorCastCI"))
        {
LABEL_189:
          if (*((_DWORD *)j + 12) != 4)
          {
            v260 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(v260, "Incorrect data type requested.");
            __cxa_throw(v260, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
          }
          v212 = (void *)MEMORY[0x24BDD16E0];
          LODWORD(v213) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)j[10] + 24))(j[10]);
          objc_msgSend_numberWithFloat_(v212, v214, v215, v216, v217, v213);
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v148, v218, (uint64_t)v167, (uint64_t)CFSTR("Cast"), v219);
          goto LABEL_197;
        }
        if (!strcmp(v160, "VibrancyCI"))
          goto LABEL_191;
        if (!strcmp(v160, "HighlightsCI"))
        {
LABEL_193:
          if (*((_DWORD *)j + 12) != 4)
          {
            v262 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(v262, "Incorrect data type requested.");
            __cxa_throw(v262, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
          }
          v228 = (void *)MEMORY[0x24BDD16E0];
          LODWORD(v229) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)j[10] + 24))(j[10]);
          objc_msgSend_numberWithFloat_(v228, v230, v231, v232, v233, v229);
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v148, v234, (uint64_t)v167, (uint64_t)CFSTR("Highlights"), v235);
          goto LABEL_197;
        }
        if (!strcmp(v160, "HighKeyCI"))
          goto LABEL_195;
        goto LABEL_178;
      }
    }
    else
    {
      v150 = SBYTE7(__dst[1]);
      if (SBYTE7(__dst[1]) < 0)
        goto LABEL_171;
    }
    if (*(_QWORD *)&__dst[0] == 0x6C61426574696857
      && *((_QWORD *)&__dst[0] + 1) == 0x706D655465636E61
      && *(_QWORD *)((char *)__dst + 15) == 0x4943746E695470)
    {
LABEL_181:
      if (*((_DWORD *)j + 12) != 4)
      {
        v255 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v255, "Incorrect data type requested.");
        __cxa_throw(v255, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      v170 = (void *)MEMORY[0x24BDD16E0];
      LODWORD(v171) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)j[10] + 24))(j[10]);
      objc_msgSend_numberWithFloat_(v170, v172, v173, v174, v175, v171);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v148, v177, (uint64_t)v176, (uint64_t)CFSTR("Temperature"), v178);

      if (*((_DWORD *)j + 12) != 4)
      {
        v256 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v256, "Incorrect data type requested.");
        __cxa_throw(v256, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      v179 = (void *)MEMORY[0x24BDD16E0];
      LODWORD(v180) = *(_DWORD *)((*(uint64_t (**)(uint64_t))(*(_QWORD *)j[10] + 24))(j[10]) + 4);
      objc_msgSend_numberWithFloat_(v179, v181, v182, v183, v184, v180);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v148, v185, (uint64_t)v167, (uint64_t)CFSTR("Tint"), v186);
      goto LABEL_197;
    }
    if (*(_QWORD *)&__dst[0] == 0x657275736F707845
      && *((_QWORD *)&__dst[0] + 1) == 0x6B63616C42646E41
      && *(_QWORD *)&__dst[1] == 0x4943746E696F50)
    {
      goto LABEL_184;
    }
    if (*(_QWORD *)&__dst[0] == 0x657275736F707845 && *(_QWORD *)((char *)__dst + 3) == 0x4943657275736FLL)
    {
LABEL_187:
      if (*((_DWORD *)j + 12) != 4)
      {
        v259 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v259, "Incorrect data type requested.");
        __cxa_throw(v259, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      v204 = (void *)MEMORY[0x24BDD16E0];
      LODWORD(v205) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)j[10] + 24))(j[10]);
      objc_msgSend_numberWithFloat_(v204, v206, v207, v208, v209, v205);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v148, v210, (uint64_t)v167, (uint64_t)CFSTR("Exposure"), v211);
      goto LABEL_197;
    }
    if (*(_QWORD *)&__dst[0] == 0x736143726F6C6F43 && DWORD2(__dst[0]) == 4801396)
      goto LABEL_189;
    if (*(_QWORD *)&__dst[0] == 0x79636E6172626956 && *(_QWORD *)((char *)__dst + 3) == 0x494379636E6172)
    {
LABEL_191:
      if (*((_DWORD *)j + 12) != 4)
      {
        v261 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v261, "Incorrect data type requested.");
        __cxa_throw(v261, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      v220 = (void *)MEMORY[0x24BDD16E0];
      LODWORD(v221) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)j[10] + 24))(j[10]);
      objc_msgSend_numberWithFloat_(v220, v222, v223, v224, v225, v221);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v148, v226, (uint64_t)v167, (uint64_t)CFSTR("Vibrancy"), v227);
      goto LABEL_197;
    }
    if (*(_QWORD *)&__dst[0] == 0x6867696C68676948 && *(_QWORD *)((char *)__dst + 5) == 0x49437374686769)
      goto LABEL_193;
    if (*(_QWORD *)&__dst[0] == 0x4379654B68676948 && WORD4(__dst[0]) == 73)
    {
LABEL_195:
      if (*((_DWORD *)j + 12) != 4)
      {
        v263 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v263, "Incorrect data type requested.");
        __cxa_throw(v263, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      v236 = (void *)MEMORY[0x24BDD16E0];
      LODWORD(v237) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)j[10] + 24))(j[10]);
      objc_msgSend_numberWithFloat_(v236, v238, v239, v240, v241, v237);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v148, v242, (uint64_t)v167, (uint64_t)CFSTR("High Key"), v243);
      goto LABEL_197;
    }
    v160 = (const char *)__dst;
LABEL_178:
    if (!strcmp(v160, "ContrastCI"))
    {
      if (*((_DWORD *)j + 12) != 4)
      {
        v264 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v264, "Incorrect data type requested.");
        __cxa_throw(v264, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      v161 = (void *)MEMORY[0x24BDD16E0];
      LODWORD(v162) = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)j[10] + 24))(j[10]);
      objc_msgSend_numberWithFloat_(v161, v163, v164, v165, v166, v162);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v148, v168, (uint64_t)v167, (uint64_t)CFSTR("Contrast"), v169);
LABEL_197:

    }
    if (v150 < 0)
      operator delete(*(void **)&__dst[0]);
  }
  v244 = v148;

  sub_23ECB8F84((uint64_t)v273);
  v245 = (char *)v279;
  if (v279)
  {
    v246 = v280;
    v247 = v279;
    if (v280 != v279)
    {
      do
      {
        if (*(v246 - 1) < 0)
          operator delete(*((void **)v246 - 3));
        v246 -= 24;
      }
      while (v246 != v245);
      v247 = v279;
    }
    v280 = v245;
    operator delete(v247);
  }
  v290 = &off_250F5D430;
  v248 = v294;
  if (v294)
  {
    v249 = (unint64_t *)&v294->__shared_owners_;
    do
      v250 = __ldaxr(v249);
    while (__stlxr(v250 - 1, v249));
    if (!v250)
    {
      ((void (*)(std::__shared_weak_count *))v248->__on_zero_shared)(v248);
      std::__shared_weak_count::__release_weak(v248);
    }
  }
  if (v292[0])
  {
    v292[1] = v292[0];
    operator delete(v292[0]);
  }
  v295 = &off_250F5D430;
  v251 = v299;
  if (v299)
  {
    v252 = (unint64_t *)&v299->__shared_owners_;
    do
      v253 = __ldaxr(v252);
    while (__stlxr(v253 - 1, v252));
    if (!v253)
    {
      ((void (*)(std::__shared_weak_count *))v251->__on_zero_shared)(v251);
      std::__shared_weak_count::__release_weak(v251);
    }
  }
  if ((_QWORD)v297)
  {
    *((_QWORD *)&v297 + 1) = v297;
    operator delete((void *)v297);
  }

  return v244;
}

- (id)getValueForAdjustment:(id)a3 adjustments:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a3;
  objc_msgSend_objectForKeyedSubscript_(a4, v7, (uint64_t)v6, v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_sliderSpecs(self, v10, v11, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v6, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identity(v20, v21, v22, v23, v24);
    objc_msgSend_numberWithDouble_(v15, v25, v26, v27, v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)applyAdjustments:(id)a3 toCIImage:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  objc_msgSend_filterSequence(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applySliders_image_error_(v14, v15, (uint64_t)v8, (uint64_t)v9, (uint64_t)a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_imageSize, &v3, 16, 1, 0);
}

- (NSArray)sliderOrder
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSliderOrder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSDictionary)sliderSpecs
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSliderSpecs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (IHKFilterSequence)filterSequence
{
  return (IHKFilterSequence *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFilterSequence:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  self->_colorSpace = a3;
}

- (NSArray)adjustmentEndpoints
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAdjustmentEndpoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)contentFVecEndpoint
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setContentFVecEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSString)styleFVecEndpoint
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setStyleFVecEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSArray)contentFVecShape
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setContentFVecShape:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSArray)styleFVecShape
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setStyleFVecShape:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;

  objc_storeStrong((id *)&self->_styleFVecShape, 0);
  objc_storeStrong((id *)&self->_contentFVecShape, 0);
  objc_storeStrong((id *)&self->_styleFVecEndpoint, 0);
  objc_storeStrong((id *)&self->_contentFVecEndpoint, 0);
  objc_storeStrong((id *)&self->_adjustmentEndpoints, 0);
  objc_storeStrong((id *)&self->_filterSequence, 0);
  objc_storeStrong((id *)&self->_sliderSpecs, 0);
  objc_storeStrong((id *)&self->_sliderOrder, 0);
  cntrl = self->styleFVecNet.__cntrl_;
  if (!cntrl)
    goto LABEL_5;
  v4 = (unint64_t *)((char *)cntrl + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (!v5)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    v6 = self->contentFVecNet.__cntrl_;
    if (!v6)
      goto LABEL_11;
  }
  else
  {
LABEL_5:
    v6 = self->contentFVecNet.__cntrl_;
    if (!v6)
      goto LABEL_11;
  }
  v7 = (unint64_t *)((char *)v6 + 8);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (!v8)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v6 + 16))(v6);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
  }
LABEL_11:
  v9 = self->styleTransferNet.__cntrl_;
  if (v9)
  {
    v10 = (unint64_t *)((char *)v9 + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v9 + 16))(v9);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v9);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  return self;
}

@end
