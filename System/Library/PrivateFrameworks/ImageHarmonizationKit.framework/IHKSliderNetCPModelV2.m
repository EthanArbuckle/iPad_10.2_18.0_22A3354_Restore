@implementation IHKSliderNetCPModelV2

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

- (IHKSliderNetCPModelV2)initWithModel:(id)a3
{
  return (IHKSliderNetCPModelV2 *)objc_msgSend_initWithModel_options_error_(self, a2, (uint64_t)a3, 0, 0);
}

- (IHKSliderNetCPModelV2)initWithModel:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  IHKSliderNetCPModelV2 *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
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
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  int isEqualToString;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  id v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  _QWORD *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _QWORD *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  std::__shared_weak_count *v164;
  unint64_t *v165;
  unint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  int v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  _QWORD *v217;
  std::__shared_weak_count *v218;
  unint64_t *v219;
  unint64_t v220;
  __shared_weak_count *v221;
  EspressoNet *ptr;
  unint64_t *v223;
  unint64_t v224;
  unint64_t *v225;
  void *v226;
  id v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  _QWORD *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  std::__shared_weak_count *v237;
  unint64_t *v238;
  unint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  IHKFilterSequence *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  void *v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  const char *v292;
  objc_super v293;
  char v294;

  v8 = a3;
  v9 = a4;
  v293.receiver = self;
  v293.super_class = (Class)IHKSliderNetCPModelV2;
  v13 = -[IHKSliderNetCPModel initWithModel:options:error:](&v293, sel_initWithModel_options_error_, v8, v9, a5);
  if (!v13)
    goto LABEL_34;
  objc_msgSend_stringByAppendingPathComponent_(v8, v10, (uint64_t)CFSTR("net_info.json"), v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loadJSonFrom_(IHKSliderNetCPModel, v15, (uint64_t)v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInfo_(v13, v19, (uint64_t)v18, v20, v21);

  objc_msgSend_info(v13, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v26, v27, (uint64_t)CFSTR("input_image_shape"), v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v30, v31, 1, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v34, v35, v36, v37, v38);
  v40 = v39;
  objc_msgSend_objectAtIndexedSubscript_(v30, v41, 2, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v44, v45, v46, v47, v48);
  objc_msgSend_setImageSize_(v13, v49, v50, v51, v52, v40, v53);

  objc_msgSend_info(v13, v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v13->_colorSpace = (CGColorSpace *)objc_msgSend_extractColorSpaceFromInfo_(v13, v59, (uint64_t)v58, v60, v61);

  objc_msgSend_setStemType_(v13, v62, (uint64_t)CFSTR("dual_stem"), v63, v64);
  objc_msgSend_info(v13, v65, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v69, v70, (uint64_t)CFSTR("stem_type"), v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    objc_msgSend_info(v13, v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v78, v79, (uint64_t)CFSTR("stem_type"), v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStemType_(v13, v83, (uint64_t)v82, v84, v85);

  }
  objc_msgSend_stemType(v13, v74, v75, v76, v77);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v86, v87, (uint64_t)CFSTR("dual_stem"), v88, v89);

  if (isEqualToString)
  {
    objc_msgSend_info(v13, v91, v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v95, v96, (uint64_t)CFSTR("content_fvec_endpoint"), v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContentFVecEndpoint_(v13, v100, (uint64_t)v99, v101, v102);

    objc_msgSend_info(v13, v103, v104, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v107, v108, (uint64_t)CFSTR("style_fvec_endpoint"), v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStyleFVecEndpoint_(v13, v112, (uint64_t)v111, v113, v114);

    objc_msgSend_info(v13, v115, v116, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v119, v120, (uint64_t)CFSTR("content_vector_shape"), v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContentFVecShape_(v13, v124, (uint64_t)v123, v125, v126);

    objc_msgSend_info(v13, v127, v128, v129, v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v131, v132, (uint64_t)CFSTR("style_vector_shape"), v133, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStyleFVecShape_(v13, v136, (uint64_t)v135, v137, v138);

    objc_msgSend_stringByAppendingPathComponent_(v8, v139, (uint64_t)CFSTR("contentFVec.espresso.net"), v140, v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();

    v143 = objc_retainAutorelease(v142);
    v292 = (const char *)objc_msgSend_UTF8String(v143, v144, v145, v146, v147);
    v148 = operator new(0x30uLL);
    v148[1] = 0;
    v148[2] = 0;
    *v148 = &off_250F5D710;
    sub_23ECB9F8C((uint64_t)&v294, v148 + 3, &v292);
    cntrl = (std::__shared_weak_count *)v13->contentFVecNet.__cntrl_;
    v13->contentFVecNet.__ptr_ = (EspressoNet *)(v148 + 3);
    v13->contentFVecNet.__cntrl_ = (__shared_weak_count *)v148;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v154 = __ldaxr(p_shared_owners);
      while (__stlxr(v154 - 1, p_shared_owners));
      if (!v154)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    objc_msgSend_stringByAppendingPathComponent_(v8, v149, (uint64_t)CFSTR("styleFVec.espresso.net"), v150, v151, v292);
    v155 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_retainAutorelease(v155);
    v292 = (const char *)objc_msgSend_UTF8String(v14, v156, v157, v158, v159);
    v160 = operator new(0x30uLL);
    v160[1] = 0;
    v160[2] = 0;
    *v160 = &off_250F5D710;
    sub_23ECB9F8C((uint64_t)&v294, v160 + 3, &v292);
    v164 = (std::__shared_weak_count *)v13->styleFVecNet.__cntrl_;
    v13->styleFVecNet.__ptr_ = (EspressoNet *)(v160 + 3);
    v13->styleFVecNet.__cntrl_ = (__shared_weak_count *)v160;
    if (!v164)
      goto LABEL_28;
    v165 = (unint64_t *)&v164->__shared_owners_;
    do
      v166 = __ldaxr(v165);
    while (__stlxr(v166 - 1, v165));
  }
  else
  {
    objc_msgSend_stemType(v13, v91, v92, v93, v94);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = objc_msgSend_isEqualToString_(v167, v168, (uint64_t)CFSTR("unified_stem"), v169, v170);

    if (!v171)
      goto LABEL_28;
    objc_msgSend_info(v13, v161, v172, v162, v163);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v173, v174, (uint64_t)CFSTR("style_and_content_fvec_endpoint"), v175, v176);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContentFVecEndpoint_(v13, v178, (uint64_t)v177, v179, v180);

    objc_msgSend_contentFVecEndpoint(v13, v181, v182, v183, v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStyleFVecEndpoint_(v13, v186, (uint64_t)v185, v187, v188);

    objc_msgSend_info(v13, v189, v190, v191, v192);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v193, v194, (uint64_t)CFSTR("style_and_content_vector_shape"), v195, v196);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContentFVecShape_(v13, v198, (uint64_t)v197, v199, v200);

    objc_msgSend_contentFVecShape(v13, v201, v202, v203, v204);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStyleFVecShape_(v13, v206, (uint64_t)v205, v207, v208);

    objc_msgSend_stringByAppendingPathComponent_(v8, v209, (uint64_t)CFSTR("styleAndContentFVec.espresso.net"), v210, v211);
    v212 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_retainAutorelease(v212);
    v292 = (const char *)objc_msgSend_UTF8String(v14, v213, v214, v215, v216);
    v217 = operator new(0x30uLL);
    v217[1] = 0;
    v217[2] = 0;
    *v217 = &off_250F5D710;
    sub_23ECB9F8C((uint64_t)&v294, v217 + 3, &v292);
    v218 = (std::__shared_weak_count *)v13->contentFVecNet.__cntrl_;
    v13->contentFVecNet.__ptr_ = (EspressoNet *)(v217 + 3);
    v13->contentFVecNet.__cntrl_ = (__shared_weak_count *)v217;
    if (v218)
    {
      v219 = (unint64_t *)&v218->__shared_owners_;
      do
        v220 = __ldaxr(v219);
      while (__stlxr(v220 - 1, v219));
      if (!v220)
      {
        ((void (*)(std::__shared_weak_count *))v218->__on_zero_shared)(v218);
        std::__shared_weak_count::__release_weak(v218);
      }
    }
    ptr = v13->contentFVecNet.__ptr_;
    v221 = v13->contentFVecNet.__cntrl_;
    if (v221)
    {
      v223 = (unint64_t *)((char *)v221 + 8);
      do
        v224 = __ldxr(v223);
      while (__stxr(v224 + 1, v223));
    }
    v164 = (std::__shared_weak_count *)v13->styleFVecNet.__cntrl_;
    v13->styleFVecNet.__ptr_ = ptr;
    v13->styleFVecNet.__cntrl_ = v221;
    if (!v164)
      goto LABEL_28;
    v225 = (unint64_t *)&v164->__shared_owners_;
    do
      v166 = __ldaxr(v225);
    while (__stlxr(v166 - 1, v225));
  }
  if (!v166)
  {
    ((void (*)(std::__shared_weak_count *))v164->__on_zero_shared)(v164);
    std::__shared_weak_count::__release_weak(v164);
  }
LABEL_28:
  objc_msgSend_stringByAppendingPathComponent_(v8, v161, (uint64_t)CFSTR("styleTransfer.espresso.net"), v162, v163, v292);
  v226 = (void *)objc_claimAutoreleasedReturnValue();

  v227 = objc_retainAutorelease(v226);
  v292 = (const char *)objc_msgSend_UTF8String(v227, v228, v229, v230, v231);
  v232 = operator new(0x30uLL);
  v232[1] = 0;
  v232[2] = 0;
  *v232 = &off_250F5D710;
  sub_23ECB9F8C((uint64_t)&v294, v232 + 3, &v292);
  v237 = (std::__shared_weak_count *)v13->styleTransferNet.__cntrl_;
  v13->styleTransferNet.__ptr_ = (EspressoNet *)(v232 + 3);
  v13->styleTransferNet.__cntrl_ = (__shared_weak_count *)v232;
  if (v237)
  {
    v238 = (unint64_t *)&v237->__shared_owners_;
    do
      v239 = __ldaxr(v238);
    while (__stlxr(v239 - 1, v238));
    if (!v239)
    {
      ((void (*)(std::__shared_weak_count *))v237->__on_zero_shared)(v237);
      std::__shared_weak_count::__release_weak(v237);
    }
  }
  objc_msgSend_info(v13, v233, v234, v235, v236);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v240, v241, (uint64_t)CFSTR("adjustment_endpoints"), v242, v243);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAdjustmentEndpoints_(v13, v245, (uint64_t)v244, v246, v247);

  objc_msgSend_info(v13, v248, v249, v250, v251);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v252, v253, (uint64_t)CFSTR("ci_filter_sequence"), v254, v255);
  v256 = (void *)objc_claimAutoreleasedReturnValue();

  v257 = [IHKFilterSequence alloc];
  v261 = (void *)objc_msgSend_initWithFilterSpec_(v257, v258, (uint64_t)v256, v259, v260);
  objc_msgSend_setFilterSequence_(v13, v262, (uint64_t)v261, v263, v264);

  objc_msgSend_filterSequence(v13, v265, v266, v267, v268);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sliderOrder(v269, v270, v271, v272, v273);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSliderOrder_(v13, v275, (uint64_t)v274, v276, v277);

  objc_msgSend_filterSequence(v13, v278, v279, v280, v281);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sliderSpecs(v282, v283, v284, v285, v286);
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSliderSpecs_(v13, v288, (uint64_t)v287, v289, v290);

LABEL_34:
  return v13;
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
  v84.super_class = (Class)IHKSliderNetCPModelV2;
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
  sub_23ECB7740((uint64_t)&v85, "image", (uint64_t)v80);
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
  v84.super_class = (Class)IHKSliderNetCPModelV2;
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
  sub_23ECB7740((uint64_t)&v85, "image", (uint64_t)v80);
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

- (id)predictSlidersForStyleVector:(id)a3 contentVector:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  size_t v59;
  size_t v60;
  __int128 *p_dst;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  EspressoNet *ptr;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void **v73;
  void **v74;
  void *v75;
  std::__shared_weak_count *v76;
  unint64_t *p_shared_owners;
  unint64_t v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  std::__shared_weak_count *v82;
  unint64_t *v83;
  unint64_t v84;
  std::__shared_weak_count *v85;
  unint64_t *v86;
  unint64_t v87;
  uint64_t *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  unint64_t i;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  BOOL v100;
  void *v101;
  double v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  std::__shared_weak_count *v119;
  unint64_t *v120;
  unint64_t v121;
  std::runtime_error *exception;
  void *__p;
  void **v125;
  __int128 v126;
  void *v127[2];
  __int128 v128;
  std::__shared_weak_count *v129;
  __int128 v130;
  void *v131[2];
  __int128 v132;
  std::__shared_weak_count *v133;
  _BYTE v134[32];
  int v135;
  _BYTE v136[40];
  __int128 __dst;
  unint64_t v138;
  __int128 v139;
  unint64_t v140;
  __int128 v141;
  uint64_t (**v142)();
  uint64_t (**v143)();
  void *v144;
  std::__shared_weak_count *v145;
  std::__shared_weak_count *v146;
  void *v147[2];
  char v148;
  uint64_t (**v149)();
  void *v150;
  void *v151;
  std::__shared_weak_count *v152;
  uint64_t v153;

  v153 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend_useClipEmbedding(self, v9, v10, v11, v12))
  {
    v17 = objc_msgSend_size(v7, v13, v14, v15, v16);
    v22 = objc_msgSend_styleFVecSize(self, v18, v19, v20, v21);
    v27 = objc_msgSend_styleFVecSize(self, v23, v24, v25, v26);
    objc_msgSend_subFeatureVectorWithRange_(v7, v28, v17 - v22, v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = objc_msgSend_size(v8, v31, v32, v33, v34);
    v40 = objc_msgSend_contentFVecSize(self, v36, v37, v38, v39);
    v45 = objc_msgSend_contentFVecSize(self, v41, v42, v43, v44);
    objc_msgSend_subFeatureVectorWithRange_(v8, v46, v35 - v40, v45, v47);
    v48 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v48;
  }
  else
  {
    v30 = v7;
  }
  objc_msgSend_adjustmentEndpoints(self, v13, v14, v15, v16);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v49, v50, 0, v51, v52);
  v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v58 = (const char *)objc_msgSend_UTF8String(v53, v54, v55, v56, v57);
  v59 = strlen(v58);
  if (v59 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  v60 = v59;
  if (v59 >= 0x17)
  {
    v62 = (v59 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v59 | 7) != 0x17)
      v62 = v59 | 7;
    v63 = v62 + 1;
    p_dst = (__int128 *)operator new(v62 + 1);
    *((_QWORD *)&__dst + 1) = v60;
    v138 = v63 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_11;
  }
  HIBYTE(v138) = v59;
  p_dst = &__dst;
  if (v59)
LABEL_11:
    memmove(p_dst, v58, v60);
  *((_BYTE *)p_dst + v60) = 0;

  ptr = self->styleTransferNet.__ptr_;
  if (v30)
  {
    objc_msgSend_tensor(v30, v64, v65, v66, v67);
  }
  else
  {
    v133 = 0;
    *(_OWORD *)v131 = 0u;
    v132 = 0u;
    v130 = 0u;
  }
  sub_23ECB9058((uint64_t)&v141, "fvec_style", (uint64_t)&v130);
  if (v8)
  {
    objc_msgSend_tensor(v8, v69, v70, v71, v72);
  }
  else
  {
    v129 = 0;
    *(_OWORD *)v127 = 0u;
    v128 = 0u;
    v126 = 0u;
  }
  sub_23ECB91B4((uint64_t)v147, "fvec_content", (uint64_t)&v126);
  memset(v134, 0, sizeof(v134));
  v135 = 1065353216;
  sub_23ECB982C((uint64_t)v134, (uint64_t)&v141, &v141);
  sub_23ECB982C((uint64_t)v134, (uint64_t)v147, (__int128 *)v147);
  if (SHIBYTE(v138) < 0)
  {
    sub_23ECB9310(&v139, (void *)__dst, *((unint64_t *)&__dst + 1));
  }
  else
  {
    v139 = __dst;
    v140 = v138;
  }
  sub_23ECB9D80(&__p, (uint64_t)&v139, 1uLL);
  sub_23ECB5A28((uint64_t)ptr, (uint64_t)v134, (__int128 **)&__p, (uint64_t)v136);
  v73 = (void **)__p;
  if (__p)
  {
    v74 = v125;
    v75 = __p;
    if (v125 != __p)
    {
      do
      {
        if (*((char *)v74 - 1) < 0)
          operator delete(*(v74 - 3));
        v74 -= 3;
      }
      while (v74 != v73);
      v75 = __p;
    }
    v125 = v73;
    operator delete(v75);
  }
  if (SHIBYTE(v140) < 0)
    operator delete((void *)v139);
  sub_23ECB8F84((uint64_t)v134);
  v149 = &off_250F5D430;
  v76 = v152;
  if (v152)
  {
    p_shared_owners = (unint64_t *)&v152->__shared_owners_;
    do
      v78 = __ldaxr(p_shared_owners);
    while (__stlxr(v78 - 1, p_shared_owners));
    if (!v78)
    {
      ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
      std::__shared_weak_count::__release_weak(v76);
    }
  }
  if (v150)
  {
    v151 = v150;
    operator delete(v150);
  }
  if (v148 < 0)
    operator delete(v147[0]);
  v143 = &off_250F5D430;
  v79 = v146;
  if (v146)
  {
    v80 = (unint64_t *)&v146->__shared_owners_;
    do
      v81 = __ldaxr(v80);
    while (__stlxr(v81 - 1, v80));
    if (!v81)
    {
      ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
      std::__shared_weak_count::__release_weak(v79);
    }
  }
  if (v144)
  {
    v145 = (std::__shared_weak_count *)v144;
    operator delete(v144);
  }
  if (SHIBYTE(v142) < 0)
    operator delete((void *)v141);
  *(_QWORD *)&v126 = &off_250F5D430;
  v82 = v129;
  if (v129)
  {
    v83 = (unint64_t *)&v129->__shared_owners_;
    do
      v84 = __ldaxr(v83);
    while (__stlxr(v84 - 1, v83));
    if (!v84)
    {
      ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
      std::__shared_weak_count::__release_weak(v82);
    }
  }
  if (v127[0])
  {
    v127[1] = v127[0];
    operator delete(v127[0]);
  }
  *(_QWORD *)&v130 = &off_250F5D430;
  v85 = v133;
  if (v133)
  {
    v86 = (unint64_t *)&v133->__shared_owners_;
    do
      v87 = __ldaxr(v86);
    while (__stlxr(v87 - 1, v86));
    if (!v87)
    {
      ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
      std::__shared_weak_count::__release_weak(v85);
    }
  }
  if (v131[0])
  {
    v131[1] = v131[0];
    operator delete(v131[0]);
  }
  *(_QWORD *)&v130 = &__dst;
  v88 = sub_23ECB939C((uint64_t)v136, (uint64_t)&__dst, (uint64_t)&unk_23ECC7A21, (__int128 **)&v130);
  sub_23ECB4B60((uint64_t)(v88 + 5), (uint64_t)&v141);
  v93 = (void *)objc_opt_new();
  for (i = 0; ; ++i)
  {
    objc_msgSend_sliderOrder(self, v89, v90, v91, v92);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = i < objc_msgSend_count(v95, v96, v97, v98, v99);

    if (!v100)
      break;
    if (DWORD2(v141) != 4)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    v101 = (void *)MEMORY[0x24BDD16E0];
    LODWORD(v102) = *(_DWORD *)((*(uint64_t (**)(void *))(*(_QWORD *)v144 + 24))(v144) + 4 * i);
    objc_msgSend_numberWithFloat_(v101, v103, v104, v105, v106, v102);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sliderOrder(self, v108, v109, v110, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v112, v113, i, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v93, v117, (uint64_t)v107, (uint64_t)v116, v118);

  }
  *(_QWORD *)&v141 = &off_250F5D430;
  v119 = v145;
  if (v145)
  {
    v120 = (unint64_t *)&v145->__shared_owners_;
    do
      v121 = __ldaxr(v120);
    while (__stlxr(v121 - 1, v120));
    if (!v121)
    {
      ((void (*)(std::__shared_weak_count *))v119->__on_zero_shared)(v119);
      std::__shared_weak_count::__release_weak(v119);
    }
  }
  if (v142)
  {
    v143 = v142;
    operator delete(v142);
  }
  sub_23ECB8F84((uint64_t)v136);
  if (SHIBYTE(v138) < 0)
    operator delete((void *)__dst);

  return v93;
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

- (NSString)stemType
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setStemType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
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

  objc_storeStrong((id *)&self->_stemType, 0);
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
