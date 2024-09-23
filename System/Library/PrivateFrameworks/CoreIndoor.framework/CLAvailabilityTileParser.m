@implementation CLAvailabilityTileParser

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_storeStrong((id *)&self->_path, 0);
  cntrl = self->_avlTile.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (CLAvailabilityTileParser)initWithTilePathIncrementalIO:(id)a3
{
  id v5;
  CLAvailabilityTileParser *v6;
  CLAvailabilityTileParser *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CLAvailabilityTileParser *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLAvailabilityTileParser;
  v6 = -[CLAvailabilityTileParser init](&v14, sel_init);
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_path, a3),
        (objc_msgSend__openTileFileForIncrementalIO(v7, v8, v9, v10, v11) & 1) == 0))
  {
    v12 = 0;
  }
  else
  {
    v12 = v7;
  }

  return v12;
}

- (BOOL)_openTileFileForIncrementalIO
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSURL *path;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  size_t v12;
  std::string::size_type v13;
  std::string *p_dst;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v20;
  char v21;
  std::string __dst;

  path = self->_path;
  if (!path)
  {
    if (qword_253E5C3A8 == -1)
    {
      v15 = qword_253E5C3A0;
      if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_FAULT))
        return 0;
    }
    else
    {
      dispatch_once(&qword_253E5C3A8, &unk_24D570058);
      v15 = qword_253E5C3A0;
      if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_FAULT))
        return 0;
    }
    LOWORD(v20) = 0;
    _os_log_impl(&dword_216456000, v15, OS_LOG_TYPE_FAULT, "_openTileFileForIncrementalIO: Must specify a valid path to deserialize the availability tile!", (uint8_t *)&v20, 2u);
    return 0;
  }
  objc_msgSend_path(path, a2, v2, v3, v4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend_UTF8String(v6, v7, v8, v9, v10);
  v12 = strlen(v11);
  if (v12 >= 0x7FFFFFFFFFFFFFF8)
    sub_21646B134();
  v13 = v12;
  if (v12 >= 0x17)
  {
    v16 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17)
      v16 = v12 | 7;
    v17 = v16 + 1;
    p_dst = (std::string *)operator new(v16 + 1);
    __dst.__r_.__value_.__l.__size_ = v13;
    __dst.__r_.__value_.__r.__words[2] = v17 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_13;
  }
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v12;
  p_dst = &__dst;
  if (v12)
LABEL_13:
    memmove(p_dst, v11, v13);
  p_dst->__r_.__value_.__s.__data_[v13] = 0;

  sub_2164697A8((const char *)&__dst, 0, (int *)&v20);
  if (v20 > 1)
  {
    v21 = 1;
    sub_216466DA0(&__dst, &v21, (uint64_t)&v20);
  }
  if (qword_253E5C3A8 == -1)
  {
    v18 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    goto LABEL_18;
  }
  dispatch_once(&qword_253E5C3A8, &unk_24D570058);
  v18 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
  {
LABEL_18:
    LOWORD(v20) = 0;
    _os_log_impl(&dword_216456000, v18, OS_LOG_TYPE_ERROR, "_openTileFileForIncrementalIO: tile doesn't exist on-disk. attempting to deserialize will fail", (uint8_t *)&v20, 2u);
  }
LABEL_19:
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  return 0;
}

- (BOOL)tileIsOpenForIncrementalIO
{
  return *((_BYTE *)self->_avlTile.__ptr_ + 16);
}

- (BOOL)getNextVenueBoundsIncrementally:(void *)a3
{
  return sub_216467290((uint64_t)self->_avlTile.__ptr_, (uint64_t)a3);
}

- (int)numVenuesExpected
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (objc_msgSend_tileIsOpenForIncrementalIO(self, a2, v2, v3, v4))
    return *((_DWORD *)self->_avlTile.__ptr_ + 14);
  else
    return objc_msgSend_venuesCount(self, v6, v7, v8, v9);
}

- (int)numTotalExpectedExteriorsInVenues
{
  return sub_216468F58((uint64_t)self->_avlTile.__ptr_);
}

- (void)getAvlTile
{
  return self->_avlTile.__ptr_;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (CLAvailabilityTileParser)init
{
  CLAvailabilityTileParser *v2;
  CLAvailabilityTileParser *v3;
  NSURL *path;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLAvailabilityTileParser;
  v2 = -[CLAvailabilityTileParser init](&v9, sel_init);
  v3 = v2;
  if (!v2)
    return v3;
  path = v2->_path;
  v2->_path = 0;

  cntrl = (std::__shared_weak_count *)v3->_avlTile.__cntrl_;
  v3->_avlTile.__ptr_ = 0;
  v3->_avlTile.__cntrl_ = 0;
  if (!cntrl)
    return v3;
  p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
  do
    v7 = __ldaxr(p_shared_owners);
  while (__stlxr(v7 - 1, p_shared_owners));
  if (v7)
    return v3;
  ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
  std::__shared_weak_count::__release_weak(cntrl);
  return v3;
}

- (CLAvailabilityTileParser)initWithEmptyTile
{
  CLAvailabilityTileParser *v2;
  CLAvailabilityTileParser *v3;
  NSURL *path;
  __shared_weak_count *v5;
  uint64_t v6;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLAvailabilityTileParser;
  v2 = -[CLAvailabilityTileParser init](&v11, sel_init);
  v3 = v2;
  if (!v2)
    return v3;
  path = v2->_path;
  v2->_path = 0;

  v5 = (__shared_weak_count *)operator new(0x80uLL);
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 0;
  *(_QWORD *)v5 = &off_24D570088;
  v6 = sub_2164A5F74((uint64_t)v5 + 24);
  cntrl = (std::__shared_weak_count *)v3->_avlTile.__cntrl_;
  v3->_avlTile.__ptr_ = (AvailabilityTile *)v6;
  v3->_avlTile.__cntrl_ = v5;
  if (!cntrl)
    return v3;
  p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
  do
    v9 = __ldaxr(p_shared_owners);
  while (__stlxr(v9 - 1, p_shared_owners));
  if (v9)
    return v3;
  ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
  std::__shared_weak_count::__release_weak(cntrl);
  return v3;
}

- (unint64_t)venuesCount
{
  return (int)sub_2164A6014((uint64_t)self->_avlTile.__ptr_);
}

+ (void)_setParamOverrides:(void *)a3 fromDict:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unsigned int v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  int v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  int v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  int v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  int v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  char v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  char v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  int v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  char v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  int v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  int v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  int v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  int v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  NSObject *v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  NSObject *v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  NSObject *v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  NSObject *v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  NSObject *v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  NSObject *v288;
  void *v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  NSObject *v293;
  void *v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  NSObject *v298;
  void *v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  NSObject *v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  NSObject *v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  NSObject *v313;
  void *v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  NSObject *v318;
  void *v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  NSObject *v323;
  void *v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  NSObject *v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  NSObject *v333;
  void *v334;
  NSObject *v335;
  uint8_t v336[16];

  v5 = a4;
  objc_msgSend_valueForKey_(v5, v6, (uint64_t)CFSTR("notifyIntervalNanos"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v10, (uint64_t)CFSTR("notifyIntervalNanos"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_unsignedIntValue(v13, v14, v15, v16, v17);
    *((_DWORD *)a3 + 75) |= 1u;
    *((_QWORD *)a3 + 2) = v18;

  }
  objc_msgSend_valueForKey_(v5, v10, (uint64_t)CFSTR("numParticles"), v11, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v20, (uint64_t)CFSTR("numParticles"), v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_unsignedIntValue(v23, v24, v25, v26, v27);
    *((_DWORD *)a3 + 75) |= 2u;
    *((_DWORD *)a3 + 6) = v28;

  }
  objc_msgSend_valueForKey_(v5, v20, (uint64_t)CFSTR("localizerType"), v21, v22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v30, (uint64_t)CFSTR("localizerType"), v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_unsignedIntValue(v33, v34, v35, v36, v37);
    *((_DWORD *)a3 + 75) |= 4u;
    *((_DWORD *)a3 + 7) = v38;

  }
  objc_msgSend_valueForKey_(v5, v30, (uint64_t)CFSTR("modeEstimator"), v31, v32);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v40, (uint64_t)CFSTR("modeEstimator"), v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_unsignedIntValue(v43, v44, v45, v46, v47);
    *((_DWORD *)a3 + 75) |= 0x10u;
    *((_DWORD *)a3 + 9) = v48;

  }
  objc_msgSend_valueForKey_(v5, v40, (uint64_t)CFSTR("confidenceFactor"), v41, v42);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v50, (uint64_t)CFSTR("confidenceFactor"), v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v53, v54, v55, v56, v57);
    *((_DWORD *)a3 + 75) |= 0x20u;
    *((_DWORD *)a3 + 10) = v58;

  }
  objc_msgSend_valueForKey_(v5, v50, (uint64_t)CFSTR("motionPdrUnmodelledHeadingVariancePerSecond"), v51, v52);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v60, (uint64_t)CFSTR("motionPdrUnmodelledHeadingVariancePerSecond"), v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v63, v64, v65, v66, v67);
    *((_DWORD *)a3 + 75) |= 0x40u;
    *((_DWORD *)a3 + 11) = v68;

  }
  objc_msgSend_valueForKey_(v5, v60, (uint64_t)CFSTR("time2dMotionVariancePerSecond"), v61, v62);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v70, (uint64_t)CFSTR("time2dMotionVariancePerSecond"), v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v73, v74, v75, v76, v77);
    *((_DWORD *)a3 + 75) |= 0x800u;
    *((_DWORD *)a3 + 24) = v78;

  }
  objc_msgSend_valueForKey_(v5, v70, (uint64_t)CFSTR("secondsBetweenVenueTransitions"), v71, v72);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v80, (uint64_t)CFSTR("secondsBetweenVenueTransitions"), v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v83, v84, v85, v86, v87);
    *((_DWORD *)a3 + 75) |= 0x8000u;
    *((_QWORD *)a3 + 14) = v88;

  }
  objc_msgSend_valueForKey_(v5, v80, (uint64_t)CFSTR("coarseIndoorFloorSelection"), v81, v82);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v90, (uint64_t)CFSTR("coarseIndoorFloorSelection"), v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend_unsignedIntValue(v93, v94, v95, v96, v97);
    *((_DWORD *)a3 + 75) |= 1u;
    *((_QWORD *)a3 + 2) = v98;

  }
  objc_msgSend_valueForKey_(v5, v90, (uint64_t)CFSTR("gpsStrobeDistance"), v91, v92);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  if (v99)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v100, (uint64_t)CFSTR("gpsStrobeDistance"), v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v103, v104, v105, v106, v107);
    *((_DWORD *)a3 + 75) |= 0x20000u;
    *((_DWORD *)a3 + 30) = v108;

  }
  objc_msgSend_valueForKey_(v5, v100, (uint64_t)CFSTR("lifespanDeepIndoors"), v101, v102);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  if (v109)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v110, (uint64_t)CFSTR("lifespanDeepIndoors"), v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v113, v114, v115, v116, v117);
    *((_DWORD *)a3 + 75) |= 0x40000u;
    *((_DWORD *)a3 + 31) = v118;

  }
  objc_msgSend_valueForKey_(v5, v110, (uint64_t)CFSTR("lifespanNearVenueEdge"), v111, v112);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  if (v119)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v120, (uint64_t)CFSTR("lifespanNearVenueEdge"), v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v123, v124, v125, v126, v127);
    *((_DWORD *)a3 + 75) |= 0x80000u;
    *((_DWORD *)a3 + 32) = v128;

  }
  objc_msgSend_valueForKey_(v5, v120, (uint64_t)CFSTR("lifespanAuxiliary"), v121, v122);
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  if (v129)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v130, (uint64_t)CFSTR("lifespanAuxiliary"), v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v133, v134, v135, v136, v137);
    *((_DWORD *)a3 + 75) |= 0x100000u;
    *((_DWORD *)a3 + 33) = v138;

  }
  objc_msgSend_valueForKey_(v5, v130, (uint64_t)CFSTR("wifiLikelihoodOnMapPriorFactor"), v131, v132);
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  if (v139)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v140, (uint64_t)CFSTR("wifiLikelihoodOnMapPriorFactor"), v141, v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v143, v144, v145, v146, v147);
    *((_DWORD *)a3 + 75) |= 0x200000u;
    *((_DWORD *)a3 + 34) = v148;

  }
  objc_msgSend_valueForKey_(v5, v140, (uint64_t)CFSTR("coarseIndoorRadioOddsTransform"), v141, v142);
  v149 = (void *)objc_claimAutoreleasedReturnValue();

  if (v149)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v150, (uint64_t)CFSTR("coarseIndoorRadioOddsTransform"), v151, v152);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = objc_msgSend_unsignedIntValue(v153, v154, v155, v156, v157);
    *((_DWORD *)a3 + 75) |= 0x800000u;
    *((_DWORD *)a3 + 35) = v158;

  }
  objc_msgSend_valueForKey_(v5, v150, (uint64_t)CFSTR("feasibleLocationRequiredPrbIndoor"), v151, v152);
  v159 = (void *)objc_claimAutoreleasedReturnValue();

  if (v159)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v160, (uint64_t)CFSTR("feasibleLocationRequiredPrbIndoor"), v161, v162);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v163, v164, v165, v166, v167);
    *((_DWORD *)a3 + 75) |= 0x1000000u;
    *((_QWORD *)a3 + 19) = v168;

  }
  objc_msgSend_valueForKey_(v5, v160, (uint64_t)CFSTR("assignFloorWeightsByLikelihood"), v161, v162);
  v169 = (void *)objc_claimAutoreleasedReturnValue();

  if (v169)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v170, (uint64_t)CFSTR("assignFloorWeightsByLikelihood"), v171, v172);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = objc_msgSend_BOOLValue(v173, v174, v175, v176, v177);
    *((_DWORD *)a3 + 75) |= 0x10000000u;
    *((_BYTE *)a3 + 192) = v178;

  }
  objc_msgSend_valueForKey_(v5, v170, (uint64_t)CFSTR("priorOnMapWeightFraction"), v171, v172);
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  if (v179)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v180, (uint64_t)CFSTR("priorOnMapWeightFraction"), v181, v182);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v183, v184, v185, v186, v187);
    *((_DWORD *)a3 + 75) |= 0x20000000u;
    *((_QWORD *)a3 + 23) = v188;

  }
  objc_msgSend_valueForKey_(v5, v180, (uint64_t)CFSTR("enableBaroAidedFloorTransition"), v181, v182);
  v189 = (void *)objc_claimAutoreleasedReturnValue();

  if (v189)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v190, (uint64_t)CFSTR("enableBaroAidedFloorTransition"), v191, v192);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v198 = objc_msgSend_BOOLValue(v193, v194, v195, v196, v197);
    *((_DWORD *)a3 + 75) |= 0x40000000u;
    *((_BYTE *)a3 + 193) = v198;

  }
  objc_msgSend_valueForKey_(v5, v190, (uint64_t)CFSTR("time2dMotionVariancePerSecondWifi2"), v191, v192);
  v199 = (void *)objc_claimAutoreleasedReturnValue();

  if (v199)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v200, (uint64_t)CFSTR("time2dMotionVariancePerSecondWifi2"), v201, v202);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v203, v204, v205, v206, v207);
    *((_DWORD *)a3 + 75) |= 0x80000000;
    *((_DWORD *)a3 + 49) = v208;

  }
  objc_msgSend_valueForKey_(v5, v200, (uint64_t)CFSTR("bilinearObservations"), v201, v202);
  v209 = (void *)objc_claimAutoreleasedReturnValue();

  if (v209)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v210, (uint64_t)CFSTR("bilinearObservations"), v211, v212);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    v218 = objc_msgSend_BOOLValue(v213, v214, v215, v216, v217);
    *((_DWORD *)a3 + 76) |= 2u;
    *((_BYTE *)a3 + 194) = v218;

  }
  objc_msgSend_valueForKey_(v5, v210, (uint64_t)CFSTR("walkableBlueDotSearchRadius"), v211, v212);
  v219 = (void *)objc_claimAutoreleasedReturnValue();

  if (v219)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v220, (uint64_t)CFSTR("walkableBlueDotSearchRadius"), v221, v222);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v223, v224, v225, v226, v227);
    *((_DWORD *)a3 + 76) |= 0x10u;
    *((_DWORD *)a3 + 56) = v228;

  }
  objc_msgSend_valueForKey_(v5, v220, (uint64_t)CFSTR("motionPdrUnmodelledHeadingVariancePerSecondWifi2"), v221, v222);
  v229 = (void *)objc_claimAutoreleasedReturnValue();

  if (v229)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v230, (uint64_t)CFSTR("motionPdrUnmodelledHeadingVariancePerSecondWifi2"), v231, v232);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v233, v234, v235, v236, v237);
    *((_DWORD *)a3 + 76) |= 0x40u;
    *((_DWORD *)a3 + 57) = v238;

  }
  objc_msgSend_valueForKey_(v5, v230, (uint64_t)CFSTR("particleFilterOffMapProbabilityFloor"), v231, v232);
  v239 = (void *)objc_claimAutoreleasedReturnValue();

  if (v239)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v240, (uint64_t)CFSTR("particleFilterOffMapProbabilityFloor"), v241, v242);
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v243, v244, v245, v246, v247);
    *((_DWORD *)a3 + 76) |= 0x100u;
    *((_DWORD *)a3 + 62) = v248;

  }
  objc_msgSend_valueForKey_(v5, v240, (uint64_t)CFSTR("coarseOutdoorProbabilityFloor"), v241, v242);
  v249 = (void *)objc_claimAutoreleasedReturnValue();

  if (v249)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v250, (uint64_t)CFSTR("coarseOutdoorProbabilityFloor"), v251, v252);
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v253, v254, v255, v256, v257);
    *((_DWORD *)a3 + 76) |= 0x200u;
    *((_DWORD *)a3 + 63) = v258;

  }
  objc_msgSend_valueForKey_(v5, v250, (uint64_t)CFSTR("pdr"), v251, v252);
  v259 = (void *)objc_claimAutoreleasedReturnValue();

  if (v259)
  {
    if (qword_253E5C3A8 == -1)
    {
      v263 = (id)qword_253E5C3A0;
      if (!os_log_type_enabled(v263, OS_LOG_TYPE_DEFAULT))
      {
LABEL_55:

        goto LABEL_56;
      }
    }
    else
    {
      dispatch_once(&qword_253E5C3A8, &unk_24D570058);
      v263 = (id)qword_253E5C3A0;
      if (!os_log_type_enabled(v263, OS_LOG_TYPE_DEFAULT))
        goto LABEL_55;
    }
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v263, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning pdr is not currently supported", v336, 2u);
    goto LABEL_55;
  }
LABEL_56:
  objc_msgSend_valueForKey_(v5, v260, (uint64_t)CFSTR("pedomCompassMotionWifi2"), v261, v262);
  v264 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v264)
    goto LABEL_61;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570058);
    v268 = (id)qword_253E5C3A0;
    if (!os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
      goto LABEL_60;
    goto LABEL_59;
  }
  v268 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
  {
LABEL_59:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v268, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning pedomCompassMotionWifi2 is not currently supported", v336, 2u);
  }
LABEL_60:

LABEL_61:
  objc_msgSend_valueForKey_(v5, v265, (uint64_t)CFSTR("deadReckoning"), v266, v267);
  v269 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v269)
    goto LABEL_66;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570058);
    v273 = (id)qword_253E5C3A0;
    if (!os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    goto LABEL_64;
  }
  v273 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
  {
LABEL_64:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v273, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning deadReckoning is not currently supported", v336, 2u);
  }
LABEL_65:

LABEL_66:
  objc_msgSend_valueForKey_(v5, v270, (uint64_t)CFSTR("coarseIndoor"), v271, v272);
  v274 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v274)
    goto LABEL_71;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570058);
    v278 = (id)qword_253E5C3A0;
    if (!os_log_type_enabled(v278, OS_LOG_TYPE_DEFAULT))
      goto LABEL_70;
    goto LABEL_69;
  }
  v278 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v278, OS_LOG_TYPE_DEFAULT))
  {
LABEL_69:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v278, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning coarseIndoor is not currently supported", v336, 2u);
  }
LABEL_70:

LABEL_71:
  objc_msgSend_valueForKey_(v5, v275, (uint64_t)CFSTR("gpsFusionGlobalParams"), v276, v277);
  v279 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v279)
    goto LABEL_76;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570058);
    v283 = (id)qword_253E5C3A0;
    if (!os_log_type_enabled(v283, OS_LOG_TYPE_DEFAULT))
      goto LABEL_75;
    goto LABEL_74;
  }
  v283 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v283, OS_LOG_TYPE_DEFAULT))
  {
LABEL_74:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v283, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning gpsFusionGlobalParams is not currently supported", v336, 2u);
  }
LABEL_75:

LABEL_76:
  objc_msgSend_valueForKey_(v5, v280, (uint64_t)CFSTR("wifi"), v281, v282);
  v284 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v284)
    goto LABEL_81;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570058);
    v288 = (id)qword_253E5C3A0;
    if (!os_log_type_enabled(v288, OS_LOG_TYPE_DEFAULT))
      goto LABEL_80;
    goto LABEL_79;
  }
  v288 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v288, OS_LOG_TYPE_DEFAULT))
  {
LABEL_79:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v288, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning wifi is not currently supported", v336, 2u);
  }
LABEL_80:

LABEL_81:
  objc_msgSend_valueForKey_(v5, v285, (uint64_t)CFSTR("bodyFixed"), v286, v287);
  v289 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v289)
    goto LABEL_86;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570058);
    v293 = (id)qword_253E5C3A0;
    if (!os_log_type_enabled(v293, OS_LOG_TYPE_DEFAULT))
      goto LABEL_85;
    goto LABEL_84;
  }
  v293 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v293, OS_LOG_TYPE_DEFAULT))
  {
LABEL_84:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v293, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning bodyFixed is not currently supported", v336, 2u);
  }
LABEL_85:

LABEL_86:
  objc_msgSend_valueForKey_(v5, v290, (uint64_t)CFSTR("motionTruth"), v291, v292);
  v294 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v294)
    goto LABEL_91;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570058);
    v298 = (id)qword_253E5C3A0;
    if (!os_log_type_enabled(v298, OS_LOG_TYPE_DEFAULT))
      goto LABEL_90;
    goto LABEL_89;
  }
  v298 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v298, OS_LOG_TYPE_DEFAULT))
  {
LABEL_89:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v298, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning motionTruth is not currently supported", v336, 2u);
  }
LABEL_90:

LABEL_91:
  objc_msgSend_valueForKey_(v5, v295, (uint64_t)CFSTR("multiphoneDbm"), v296, v297);
  v299 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v299)
    goto LABEL_96;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570058);
    v303 = (id)qword_253E5C3A0;
    if (!os_log_type_enabled(v303, OS_LOG_TYPE_DEFAULT))
      goto LABEL_95;
    goto LABEL_94;
  }
  v303 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v303, OS_LOG_TYPE_DEFAULT))
  {
LABEL_94:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v303, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning multiphoneDbm is not currently supported", v336, 2u);
  }
LABEL_95:

LABEL_96:
  objc_msgSend_valueForKey_(v5, v300, (uint64_t)CFSTR("pedomCompassMotion"), v301, v302);
  v304 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v304)
    goto LABEL_101;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570058);
    v308 = (id)qword_253E5C3A0;
    if (!os_log_type_enabled(v308, OS_LOG_TYPE_DEFAULT))
      goto LABEL_100;
    goto LABEL_99;
  }
  v308 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v308, OS_LOG_TYPE_DEFAULT))
  {
LABEL_99:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v308, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning pedomCompassMotion is not currently supported", v336, 2u);
  }
LABEL_100:

LABEL_101:
  objc_msgSend_valueForKey_(v5, v305, (uint64_t)CFSTR("injection"), v306, v307);
  v309 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v309)
    goto LABEL_106;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570058);
    v313 = (id)qword_253E5C3A0;
    if (!os_log_type_enabled(v313, OS_LOG_TYPE_DEFAULT))
      goto LABEL_105;
    goto LABEL_104;
  }
  v313 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v313, OS_LOG_TYPE_DEFAULT))
  {
LABEL_104:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v313, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning injection is not currently supported", v336, 2u);
  }
LABEL_105:

LABEL_106:
  objc_msgSend_valueForKey_(v5, v310, (uint64_t)CFSTR("beacon"), v311, v312);
  v314 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v314)
    goto LABEL_111;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570058);
    v318 = (id)qword_253E5C3A0;
    if (!os_log_type_enabled(v318, OS_LOG_TYPE_DEFAULT))
      goto LABEL_110;
    goto LABEL_109;
  }
  v318 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v318, OS_LOG_TYPE_DEFAULT))
  {
LABEL_109:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v318, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning beacon is not currently supported", v336, 2u);
  }
LABEL_110:

LABEL_111:
  objc_msgSend_valueForKey_(v5, v315, (uint64_t)CFSTR("wallBehavior"), v316, v317);
  v319 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v319)
    goto LABEL_116;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570058);
    v323 = (id)qword_253E5C3A0;
    if (!os_log_type_enabled(v323, OS_LOG_TYPE_DEFAULT))
      goto LABEL_115;
    goto LABEL_114;
  }
  v323 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v323, OS_LOG_TYPE_DEFAULT))
  {
LABEL_114:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v323, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning wallBehavior is not currently supported", v336, 2u);
  }
LABEL_115:

LABEL_116:
  objc_msgSend_valueForKey_(v5, v320, (uint64_t)CFSTR("dynamicUniverseParameters"), v321, v322);
  v324 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v324)
    goto LABEL_121;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570058);
    v328 = (id)qword_253E5C3A0;
    if (!os_log_type_enabled(v328, OS_LOG_TYPE_DEFAULT))
      goto LABEL_120;
    goto LABEL_119;
  }
  v328 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v328, OS_LOG_TYPE_DEFAULT))
  {
LABEL_119:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v328, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning dynamicUniverseParameters is not currently supported", v336, 2u);
  }
LABEL_120:

LABEL_121:
  objc_msgSend_valueForKey_(v5, v325, (uint64_t)CFSTR("dynamicUniverseParameters"), v326, v327);
  v329 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v329)
    goto LABEL_126;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570058);
    v333 = (id)qword_253E5C3A0;
    if (!os_log_type_enabled(v333, OS_LOG_TYPE_DEFAULT))
      goto LABEL_125;
    goto LABEL_124;
  }
  v333 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v333, OS_LOG_TYPE_DEFAULT))
  {
LABEL_124:
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v333, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning dynamicUniverseParameters is not currently supported", v336, 2u);
  }
LABEL_125:

LABEL_126:
  objc_msgSend_valueForKey_(v5, v330, (uint64_t)CFSTR("altitude"), v331, v332);
  v334 = (void *)objc_claimAutoreleasedReturnValue();

  if (v334)
  {
    if (qword_253E5C3A8 == -1)
    {
      v335 = (id)qword_253E5C3A0;
      if (!os_log_type_enabled(v335, OS_LOG_TYPE_DEFAULT))
      {
LABEL_130:

        goto LABEL_131;
      }
    }
    else
    {
      dispatch_once(&qword_253E5C3A8, &unk_24D570058);
      v335 = (id)qword_253E5C3A0;
      if (!os_log_type_enabled(v335, OS_LOG_TYPE_DEFAULT))
        goto LABEL_130;
    }
    *(_WORD *)v336 = 0;
    _os_log_impl(&dword_216456000, v335, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning altitude is not currently supported", v336, 2u);
    goto LABEL_130;
  }
LABEL_131:

}

+ (BOOL)generateAvlTileFromJSON:(id)a3 atPath:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t k;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  const void *v91;
  int v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  const void *v105;
  int v106;
  void *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t m;
  id v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *v127;
  wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  id v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  int v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  id v161;
  const char *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t n;
  void *v170;
  int v171;
  int v172;
  const void *v173;
  int v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  BOOL v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  BOOL v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  BOOL v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  int v207;
  void *v208;
  BOOL v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  int v219;
  void *v220;
  BOOL v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  int v231;
  void *v232;
  BOOL v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  int v243;
  void *v244;
  BOOL v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  BOOL v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  int v265;
  void *v266;
  BOOL v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  int v276;
  void *v277;
  BOOL v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  void *v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  int v287;
  void *v288;
  BOOL v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  int v298;
  void *v299;
  BOOL v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  int v309;
  void *v310;
  BOOL v311;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  int v320;
  void *v321;
  BOOL v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  void *v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  int v331;
  void *v332;
  BOOL v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  int v342;
  void *v343;
  BOOL v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  void *v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  int v353;
  void *v354;
  BOOL v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  void *v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  int v364;
  void *v365;
  BOOL v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  void *v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  int v376;
  id v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  const char *v382;
  size_t v383;
  size_t v384;
  __int128 *p_dst;
  NSObject *v386;
  NSObject *v387;
  id v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  id v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  BOOL result;
  uint64_t v401;
  uint64_t v402;
  NSObject *v403;
  __int128 *v404;
  NSObject *v405;
  NSObject *v406;
  NSObject *v407;
  NSObject *v408;
  NSObject *v409;
  NSObject *v410;
  uint64_t v411;
  uint64_t v412;
  void *v413;
  void *v414;
  uint64_t i;
  id v416;
  NSObject *log;
  os_log_t loga;
  void *v419;
  id v420;
  void *v421;
  id obj;
  uint64_t v423;
  void *v424;
  unsigned int v425;
  void *__p[2];
  int64_t v427;
  __int128 __dst;
  int64_t v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  id v446;
  void *v447[10];
  _BYTE v448[128];
  _BYTE v449[128];
  _BYTE v450[128];
  _BYTE v451[128];
  _BYTE buf[28];
  _BYTE v453[10];
  uint64_t v454;
  uint64_t v455;
  int v456;
  int v457;
  int v458;
  int v459;
  int v460;
  int v461;
  int v462;
  int v463;
  int v464;
  int v465;
  uint64_t v466;
  int v467;
  int v468;
  uint64_t v469;

  v469 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v420 = v5;
  v414 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend_dataUsingEncoding_(v5, v7, 4, v8, v9);
      v446 = 0;
      v413 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v10, (uint64_t)v413, 0, (uint64_t)&v446);
      v421 = (void *)objc_claimAutoreleasedReturnValue();
      v416 = v446;
      if (v416)
      {
        if (qword_253E5C3A8 != -1)
          dispatch_once(&qword_253E5C3A8, &unk_24D570058);
        log = (id)qword_253E5C3A0;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_description(v416, v14, v15, v16, v17);
          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v23 = objc_msgSend_UTF8String(v18, v19, v20, v21, v22);
          v24 = objc_retainAutorelease(v420);
          v29 = objc_msgSend_UTF8String(v24, v25, v26, v27, v28);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v23;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v29;
          _os_log_impl(&dword_216456000, log, OS_LOG_TYPE_ERROR, "@IndoorAvl, generateAvlTileFromJSON, failed to generate, error=%s, str=\n%s\n", buf, 0x16u);

        }
        goto LABEL_160;
      }
      objc_msgSend_objectForKey_(v421, v11, (uint64_t)CFSTR("venues"), v12, v13);
      v30 = objc_claimAutoreleasedReturnValue();
      v35 = v30;
      if (v30)
      {
        if (objc_msgSend_count(v30, v31, v32, v33, v34))
        {
          sub_21646884C((uint64_t)buf);
          v410 = v35;
          if (qword_253E5C3A8 != -1)
            dispatch_once(&qword_253E5C3A8, &unk_24D570058);
          v36 = (id)qword_253E5C3A0;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            v41 = (void *)objc_msgSend_count(v410, v37, v38, v39, v40);
            LODWORD(v447[0]) = 134217984;
            *(void **)((char *)v447 + 4) = v41;
            _os_log_impl(&dword_216456000, v36, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, adding %lu venues", (uint8_t *)v447, 0xCu);
          }

          v444 = 0u;
          v445 = 0u;
          v442 = 0u;
          v443 = 0u;
          loga = v410;
          v411 = objc_msgSend_countByEnumeratingWithState_objects_count_(loga, v42, (uint64_t)&v442, (uint64_t)v451, 16);
          if (v411)
          {
            v412 = *(_QWORD *)v443;
            do
            {
              for (i = 0; i != v411; ++i)
              {
                if (*(_QWORD *)v443 != v412)
                  objc_enumerationMutation(loga);
                v419 = *(void **)(*((_QWORD *)&v442 + 1) + 8 * i);
                v46 = *(_DWORD *)v453;
                v47 = *(int *)&buf[24];
                if (*(int *)&buf[24] >= *(int *)v453)
                {
                  if (*(_DWORD *)v453 == *(_DWORD *)&v453[4])
                  {
                    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)&buf[16]);
                    v46 = *(_DWORD *)v453;
                  }
                  *(_DWORD *)v453 = v46 + 1;
                  v48 = operator new();
                  sub_216467224(v48);
                  v49 = *(int *)&buf[24];
                  ++*(_DWORD *)&buf[24];
                  *(_QWORD *)(*(_QWORD *)&buf[16] + 8 * v49) = v48;
                }
                else
                {
                  ++*(_DWORD *)&buf[24];
                  v48 = *(_QWORD *)(*(_QWORD *)&buf[16] + 8 * v47);
                }
                objc_msgSend_objectForKey_(v419, v43, (uint64_t)CFSTR("exteriors"), v44, v45);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v440 = 0u;
                v441 = 0u;
                v438 = 0u;
                v439 = 0u;
                obj = v50;
                v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v438, (uint64_t)v450, 16);
                if (v55)
                {
                  v423 = *(_QWORD *)v439;
                  do
                  {
                    for (j = 0; j != v55; ++j)
                    {
                      if (*(_QWORD *)v439 != v423)
                        objc_enumerationMutation(obj);
                      v57 = *(void **)(*((_QWORD *)&v438 + 1) + 8 * j);
                      v58 = *(_DWORD *)(v48 + 52);
                      v59 = *(int *)(v48 + 48);
                      if ((int)v59 >= v58)
                      {
                        if (v58 == *(_DWORD *)(v48 + 56))
                        {
                          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(v48 + 40));
                          v58 = *(_DWORD *)(v48 + 52);
                        }
                        *(_DWORD *)(v48 + 52) = v58 + 1;
                        v61 = operator new();
                        sub_2164A95C0((_QWORD *)v61);
                        v62 = *(_QWORD *)(v48 + 40);
                        v63 = *(int *)(v48 + 48);
                        *(_DWORD *)(v48 + 48) = v63 + 1;
                        *(_QWORD *)(v62 + 8 * v63) = v61;
                      }
                      else
                      {
                        v60 = *(_QWORD *)(v48 + 40);
                        *(_DWORD *)(v48 + 48) = v59 + 1;
                        v61 = *(_QWORD *)(v60 + 8 * v59);
                      }
                      objc_msgSend_objectForKey_(v57, v52, (uint64_t)CFSTR("latitude"), v53, v54);
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      v424 = v57;
                      objc_msgSend_objectForKey_(v57, v65, (uint64_t)CFSTR("longitude"), v66, v67);
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      if (qword_253E5C3A8 != -1)
                        dispatch_once(&qword_253E5C3A8, &unk_24D570058);
                      v69 = (id)qword_253E5C3A0;
                      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                      {
                        v74 = (void *)objc_msgSend_count(v64, v70, v71, v72, v73);
                        LODWORD(v447[0]) = 134217984;
                        *(void **)((char *)v447 + 4) = v74;
                        _os_log_impl(&dword_216456000, v69, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, adding %lu exterior points", (uint8_t *)v447, 0xCu);
                      }

                      for (k = 0; k < objc_msgSend_count(v64, v75, v76, v77, v78); ++k)
                      {
                        objc_msgSend_objectAtIndex_(v64, v80, k, v81, v82);
                        v83 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_doubleValue(v83, v84, v85, v86, v87);
                        v89 = v88;
                        v90 = *(_DWORD *)(v61 + 24);
                        v91 = *(const void **)(v61 + 16);
                        if (v90 == *(_DWORD *)(v61 + 28))
                        {
                          if (2 * v90 <= v90 + 1)
                            v92 = v90 + 1;
                          else
                            v92 = 2 * v90;
                          if (v92 <= 4)
                            v92 = 4;
                          *(_DWORD *)(v61 + 28) = v92;
                          v93 = (void *)operator new[]();
                          *(_QWORD *)(v61 + 16) = v93;
                          v90 = *(_DWORD *)(v61 + 24);
                          if (v91)
                          {
                            memcpy(v93, v91, 8 * v90);
                            MEMORY[0x2199F8F84](v91, 0x1000C8000313F17);
                            v93 = *(void **)(v61 + 16);
                            v90 = *(_DWORD *)(v61 + 24);
                          }
                        }
                        else
                        {
                          v93 = *(void **)(v61 + 16);
                        }
                        *(_DWORD *)(v61 + 24) = v90 + 1;
                        *((_QWORD *)v93 + v90) = v89;

                        objc_msgSend_objectAtIndex_(v68, v94, k, v95, v96);
                        v97 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_doubleValue(v97, v98, v99, v100, v101);
                        v103 = v102;
                        v104 = *(_DWORD *)(v61 + 48);
                        v105 = *(const void **)(v61 + 40);
                        if (v104 == *(_DWORD *)(v61 + 52))
                        {
                          if (2 * v104 <= v104 + 1)
                            v106 = v104 + 1;
                          else
                            v106 = 2 * v104;
                          if (v106 <= 4)
                            v106 = 4;
                          *(_DWORD *)(v61 + 52) = v106;
                          v107 = (void *)operator new[]();
                          *(_QWORD *)(v61 + 40) = v107;
                          v104 = *(_DWORD *)(v61 + 48);
                          if (v105)
                          {
                            memcpy(v107, v105, 8 * v104);
                            MEMORY[0x2199F8F84](v105, 0x1000C8000313F17);
                            v107 = *(void **)(v61 + 40);
                            v104 = *(_DWORD *)(v61 + 48);
                          }
                        }
                        else
                        {
                          v107 = *(void **)(v61 + 40);
                        }
                        *(_DWORD *)(v61 + 48) = v104 + 1;
                        *((_QWORD *)v107 + v104) = v103;

                      }
                      objc_msgSend_valueForKey_(v424, v80, (uint64_t)CFSTR("tolerance"), v81, v82);
                      v108 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_doubleValue(v108, v109, v110, v111, v112);
                      *(_DWORD *)(v61 + 76) |= 4u;
                      *(_QWORD *)(v61 + 64) = v113;

                    }
                    v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v438, (uint64_t)v450, 16);
                  }
                  while (v55);
                }

                v436 = 0u;
                v437 = 0u;
                v435 = 0u;
                v434 = 0u;
                objc_msgSend_objectForKey_(v419, v114, (uint64_t)CFSTR("ids"), v115, v116);
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(v117, v118, (uint64_t)&v434, (uint64_t)v449, 16);
                if (v119)
                {
                  v120 = *(_QWORD *)v435;
                  do
                  {
                    for (m = 0; m != v119; ++m)
                    {
                      if (*(_QWORD *)v435 != v120)
                        objc_enumerationMutation(v117);
                      v122 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v434 + 1) + 8 * m));
                      v127 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)objc_msgSend_UTF8String(v122, v123, v124, v125, v126);
                      v128 = v127;
                      v129 = *(_DWORD *)(v48 + 28);
                      v130 = *(int *)(v48 + 24);
                      if ((int)v130 >= v129)
                      {
                        if (v129 == *(_DWORD *)(v48 + 32))
                        {
                          v127 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(v48 + 16));
                          v129 = *(_DWORD *)(v48 + 28);
                        }
                        *(_DWORD *)(v48 + 28) = v129 + 1;
                        v132 = wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(v127);
                        v133 = *(_QWORD *)(v48 + 16);
                        v134 = *(int *)(v48 + 24);
                        *(_DWORD *)(v48 + 24) = v134 + 1;
                        *(_QWORD *)(v133 + 8 * v134) = v132;
                      }
                      else
                      {
                        v131 = *(_QWORD *)(v48 + 16);
                        *(_DWORD *)(v48 + 24) = v130 + 1;
                        v132 = *(_QWORD *)(v131 + 8 * v130);
                      }
                      MEMORY[0x2199F8ED0](v132, v128);
                      if (qword_253E5C3A8 != -1)
                        dispatch_once(&qword_253E5C3A8, &unk_24D570058);
                      v135 = (id)qword_253E5C3A0;
                      if (os_log_type_enabled(v135, OS_LOG_TYPE_DEBUG))
                      {
                        v136 = objc_retainAutorelease(v122);
                        v141 = (void *)objc_msgSend_UTF8String(v136, v137, v138, v139, v140);
                        LODWORD(v447[0]) = 136315138;
                        *(void **)((char *)v447 + 4) = v141;
                        _os_log_impl(&dword_216456000, v135, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, added venue ID %s", (uint8_t *)v447, 0xCu);
                      }

                    }
                    v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(v117, v142, (uint64_t)&v434, (uint64_t)v449, 16);
                  }
                  while (v119);
                }

                objc_msgSend_valueForKey_(v419, v143, (uint64_t)CFSTR("context"), v144, v145);
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                v151 = objc_msgSend_intValue(v146, v147, v148, v149, v150);

                if ((v151 - 1) < 2)
                {
                  *(_DWORD *)(v48 + 104) |= 8u;
                  *(_DWORD *)(v48 + 96) = v151;
                }
                objc_msgSend_objectForKey_(v419, v152, (uint64_t)CFSTR("tileDownloadConfiguration"), v153, v154);
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKey_(v155, v156, (uint64_t)CFSTR("floorIdxsForWifiDownloadOnly"), v157, v158);
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)(v48 + 104) |= 4u;
                v160 = *(_QWORD *)(v48 + 64);
                if (!v160)
                {
                  v160 = operator new();
                  sub_2164A9610((_QWORD *)v160);
                  *(_QWORD *)(v48 + 64) = v160;
                }
                v432 = 0u;
                v433 = 0u;
                v430 = 0u;
                v431 = 0u;
                v161 = v159;
                v167 = objc_msgSend_countByEnumeratingWithState_objects_count_(v161, v162, (uint64_t)&v430, (uint64_t)v448, 16);
                if (v167)
                {
                  v168 = *(_QWORD *)v431;
                  do
                  {
                    for (n = 0; n != v167; ++n)
                    {
                      if (*(_QWORD *)v431 != v168)
                        objc_enumerationMutation(v161);
                      v171 = objc_msgSend_unsignedIntValue(*(void **)(*((_QWORD *)&v430 + 1) + 8 * n), v163, v164, v165, v166);
                      v172 = *(_DWORD *)(v160 + 24);
                      v173 = *(const void **)(v160 + 16);
                      if (v172 == *(_DWORD *)(v160 + 28))
                      {
                        if (2 * v172 <= v172 + 1)
                          v174 = v172 + 1;
                        else
                          v174 = 2 * v172;
                        if (v174 <= 4)
                          v174 = 4;
                        *(_DWORD *)(v160 + 28) = v174;
                        v170 = (void *)operator new[]();
                        *(_QWORD *)(v160 + 16) = v170;
                        v172 = *(_DWORD *)(v160 + 24);
                        if (v173)
                        {
                          memcpy(v170, v173, 4 * v172);
                          MEMORY[0x2199F8F84](v173, 0x1000C8052888210);
                          v170 = *(void **)(v160 + 16);
                          v172 = *(_DWORD *)(v160 + 24);
                        }
                      }
                      else
                      {
                        v170 = *(void **)(v160 + 16);
                      }
                      *(_DWORD *)(v160 + 24) = v172 + 1;
                      *((_DWORD *)v170 + v172) = v171;
                    }
                    v167 = objc_msgSend_countByEnumeratingWithState_objects_count_(v161, v163, (uint64_t)&v430, (uint64_t)v448, 16);
                  }
                  while (v167);
                }

              }
              v411 = objc_msgSend_countByEnumeratingWithState_objects_count_(loga, v43, (uint64_t)&v442, (uint64_t)v451, 16);
            }
            while (v411);
          }

          objc_msgSend_valueForKey_(v421, v175, (uint64_t)CFSTR("parameterOverrides"), v176, v177);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          v179 = v178 == 0;

          if (!v179)
          {
            v468 |= 2u;
            v183 = v454;
            if (!v454)
            {
              v183 = operator new();
              sub_216459CFC(v183);
              v454 = v183;
            }
            objc_msgSend_objectForKeyedSubscript_(v421, v180, (uint64_t)CFSTR("parameterOverrides"), v181, v182);
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend__setParamOverrides_fromDict_(CLAvailabilityTileParser, v185, v183, (uint64_t)v184, v186);

          }
          objc_msgSend_objectForKey_(v421, v180, (uint64_t)CFSTR("motionActivityDebounceParameters"), v181, v182);
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          v188 = v187 == 0;

          if (!v188)
          {
            objc_msgSend_objectForKey_(v421, v189, (uint64_t)CFSTR("motionActivityDebounceParameters"), v190, v191);
            v192 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_valueForKey_(v192, v193, (uint64_t)CFSTR("nonFitnessToCyclingSeconds"), v194, v195);
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            v197 = v196 == 0;

            if (!v197)
            {
              v468 |= 0x4000u;
              v201 = v466;
              if (!v466)
              {
                v201 = operator new();
                sub_21647837C((_QWORD *)v201);
                v466 = v201;
              }
              objc_msgSend_valueForKey_(v192, v198, (uint64_t)CFSTR("nonFitnessToCyclingSeconds"), v199, v200);
              v202 = (void *)objc_claimAutoreleasedReturnValue();
              v207 = objc_msgSend_unsignedIntValue(v202, v203, v204, v205, v206);
              *(_DWORD *)(v201 + 36) |= 1u;
              *(_DWORD *)(v201 + 16) = v207;

            }
            objc_msgSend_valueForKey_(v192, v198, (uint64_t)CFSTR("nonFitnessToRunningSeconds"), v199, v200);
            v208 = (void *)objc_claimAutoreleasedReturnValue();
            v209 = v208 == 0;

            if (!v209)
            {
              v468 |= 0x4000u;
              v213 = v466;
              if (!v466)
              {
                v213 = operator new();
                sub_21647837C((_QWORD *)v213);
                v466 = v213;
              }
              objc_msgSend_valueForKey_(v192, v210, (uint64_t)CFSTR("nonFitnessToRunningSeconds"), v211, v212);
              v214 = (void *)objc_claimAutoreleasedReturnValue();
              v219 = objc_msgSend_unsignedIntValue(v214, v215, v216, v217, v218);
              *(_DWORD *)(v213 + 36) |= 2u;
              *(_DWORD *)(v213 + 20) = v219;

            }
            objc_msgSend_valueForKey_(v192, v210, (uint64_t)CFSTR("runningToNonFitnessSeconds"), v211, v212);
            v220 = (void *)objc_claimAutoreleasedReturnValue();
            v221 = v220 == 0;

            if (!v221)
            {
              v468 |= 0x4000u;
              v225 = v466;
              if (!v466)
              {
                v225 = operator new();
                sub_21647837C((_QWORD *)v225);
                v466 = v225;
              }
              objc_msgSend_valueForKey_(v192, v222, (uint64_t)CFSTR("runningToNonFitnessSeconds"), v223, v224);
              v226 = (void *)objc_claimAutoreleasedReturnValue();
              v231 = objc_msgSend_unsignedIntValue(v226, v227, v228, v229, v230);
              *(_DWORD *)(v225 + 36) |= 4u;
              *(_DWORD *)(v225 + 24) = v231;

            }
            objc_msgSend_valueForKey_(v192, v222, (uint64_t)CFSTR("cyclingToNonFitnessSeconds"), v223, v224);
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            v233 = v232 == 0;

            if (!v233)
            {
              v468 |= 0x4000u;
              v237 = v466;
              if (!v466)
              {
                v237 = operator new();
                sub_21647837C((_QWORD *)v237);
                v466 = v237;
              }
              objc_msgSend_valueForKey_(v192, v234, (uint64_t)CFSTR("cyclingToNonFitnessSeconds"), v235, v236);
              v238 = (void *)objc_claimAutoreleasedReturnValue();
              v243 = objc_msgSend_unsignedIntValue(v238, v239, v240, v241, v242);
              *(_DWORD *)(v237 + 36) |= 8u;
              *(_DWORD *)(v237 + 28) = v243;

            }
          }
          objc_msgSend_valueForKey_(v421, v189, (uint64_t)CFSTR("availabilityZScoreConfidenceInterval"), v190, v191);
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          v245 = v244 == 0;

          if (!v245)
          {
            objc_msgSend_valueForKey_(v421, v246, (uint64_t)CFSTR("availabilityZScoreConfidenceInterval"), v247, v248);
            v249 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_doubleValue(v249, v250, v251, v252, v253);
            v468 |= 4u;
            v455 = v254;

          }
          objc_msgSend_valueForKey_(v421, v246, (uint64_t)CFSTR("indoorPrefetchRadiusKM"), v247, v248);
          v255 = (void *)objc_claimAutoreleasedReturnValue();
          v256 = v255 == 0;

          if (!v256)
          {
            objc_msgSend_valueForKey_(v421, v257, (uint64_t)CFSTR("indoorPrefetchRadiusKM"), v258, v259);
            v260 = (void *)objc_claimAutoreleasedReturnValue();
            v265 = objc_msgSend_unsignedIntValue(v260, v261, v262, v263, v264);
            v468 |= 8u;
            v456 = v265;

          }
          objc_msgSend_valueForKey_(v421, v257, (uint64_t)CFSTR("regionalPrefetchRadiusKM"), v258, v259);
          v266 = (void *)objc_claimAutoreleasedReturnValue();
          v267 = v266 == 0;

          if (!v267)
          {
            objc_msgSend_valueForKey_(v421, v268, (uint64_t)CFSTR("regionalPrefetchRadiusKM"), v269, v270);
            v271 = (void *)objc_claimAutoreleasedReturnValue();
            v276 = objc_msgSend_unsignedIntValue(v271, v272, v273, v274, v275);
            v468 |= 0x10u;
            v457 = v276;

          }
          objc_msgSend_valueForKey_(v421, v268, (uint64_t)CFSTR("indoorPrefetchMaxFloorCount"), v269, v270);
          v277 = (void *)objc_claimAutoreleasedReturnValue();
          v278 = v277 == 0;

          if (!v278)
          {
            objc_msgSend_valueForKey_(v421, v279, (uint64_t)CFSTR("indoorPrefetchMaxFloorCount"), v280, v281);
            v282 = (void *)objc_claimAutoreleasedReturnValue();
            v287 = objc_msgSend_unsignedIntValue(v282, v283, v284, v285, v286);
            v468 |= 0x20u;
            v458 = v287;

          }
          objc_msgSend_valueForKey_(v421, v279, (uint64_t)CFSTR("regionalPrefetchMaxFloorCount"), v280, v281);
          v288 = (void *)objc_claimAutoreleasedReturnValue();
          v289 = v288 == 0;

          if (!v289)
          {
            objc_msgSend_valueForKey_(v421, v290, (uint64_t)CFSTR("regionalPrefetchMaxFloorCount"), v291, v292);
            v293 = (void *)objc_claimAutoreleasedReturnValue();
            v298 = objc_msgSend_unsignedIntValue(v293, v294, v295, v296, v297);
            v468 |= 0x40u;
            v459 = v298;

          }
          objc_msgSend_valueForKey_(v421, v290, (uint64_t)CFSTR("indoorPrefetchMaxTotalBytes"), v291, v292);
          v299 = (void *)objc_claimAutoreleasedReturnValue();
          v300 = v299 == 0;

          if (!v300)
          {
            objc_msgSend_valueForKey_(v421, v301, (uint64_t)CFSTR("indoorPrefetchMaxTotalBytes"), v302, v303);
            v304 = (void *)objc_claimAutoreleasedReturnValue();
            v309 = objc_msgSend_unsignedIntValue(v304, v305, v306, v307, v308);
            v468 |= 0x80u;
            v460 = v309;

          }
          objc_msgSend_valueForKey_(v421, v301, (uint64_t)CFSTR("regionalPrefetchMaxTotalBytes"), v302, v303);
          v310 = (void *)objc_claimAutoreleasedReturnValue();
          v311 = v310 == 0;

          if (!v311)
          {
            objc_msgSend_valueForKey_(v421, v312, (uint64_t)CFSTR("regionalPrefetchMaxTotalBytes"), v313, v314);
            v315 = (void *)objc_claimAutoreleasedReturnValue();
            v320 = objc_msgSend_unsignedIntValue(v315, v316, v317, v318, v319);
            v468 |= 0x100u;
            v461 = v320;

          }
          objc_msgSend_valueForKey_(v421, v312, (uint64_t)CFSTR("indoorLocationOfInterestMergeRadiusKM"), v313, v314);
          v321 = (void *)objc_claimAutoreleasedReturnValue();
          v322 = v321 == 0;

          if (!v322)
          {
            objc_msgSend_valueForKey_(v421, v323, (uint64_t)CFSTR("indoorLocationOfInterestMergeRadiusKM"), v324, v325);
            v326 = (void *)objc_claimAutoreleasedReturnValue();
            v331 = objc_msgSend_unsignedIntValue(v326, v327, v328, v329, v330);
            v468 |= 0x200u;
            v462 = v331;

          }
          objc_msgSend_valueForKey_(v421, v323, (uint64_t)CFSTR("regionalLocationOfInterestMergeRadiusKM"), v324, v325);
          v332 = (void *)objc_claimAutoreleasedReturnValue();
          v333 = v332 == 0;

          if (!v333)
          {
            objc_msgSend_valueForKey_(v421, v334, (uint64_t)CFSTR("regionalLocationOfInterestMergeRadiusKM"), v335, v336);
            v337 = (void *)objc_claimAutoreleasedReturnValue();
            v342 = objc_msgSend_unsignedIntValue(v337, v338, v339, v340, v341);
            v468 |= 0x400u;
            v463 = v342;

          }
          objc_msgSend_valueForKey_(v421, v334, (uint64_t)CFSTR("preferPredictionWithinNActivityCycles"), v335, v336);
          v343 = (void *)objc_claimAutoreleasedReturnValue();
          v344 = v343 == 0;

          if (!v344)
          {
            objc_msgSend_valueForKey_(v421, v345, (uint64_t)CFSTR("preferPredictionWithinNActivityCycles"), v346, v347);
            v348 = (void *)objc_claimAutoreleasedReturnValue();
            v353 = objc_msgSend_unsignedIntValue(v348, v349, v350, v351, v352);
            v468 |= 0x800u;
            v464 = v353;

          }
          objc_msgSend_valueForKey_(v421, v345, (uint64_t)CFSTR("indoorNumberOfDaysBeforeTileRedownload"), v346, v347);
          v354 = (void *)objc_claimAutoreleasedReturnValue();
          v355 = v354 == 0;

          if (!v355)
          {
            objc_msgSend_valueForKey_(v421, v356, (uint64_t)CFSTR("indoorNumberOfDaysBeforeTileRedownload"), v357, v358);
            v359 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v359, v360, v361, v362, v363);
            v468 |= 0x1000u;
            v465 = v364;

          }
          objc_msgSend_valueForKey_(v421, v356, (uint64_t)CFSTR("regionalNumberOfDaysBeforeTileRedownload"), v357, v358);
          v365 = (void *)objc_claimAutoreleasedReturnValue();
          v366 = v365 == 0;

          if (!v366)
          {
            objc_msgSend_valueForKey_(v421, v367, (uint64_t)CFSTR("regionalNumberOfDaysBeforeTileRedownload"), v369, v370);
            v371 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v371, v372, v373, v374, v375);
            v468 |= 0x2000u;
            v467 = v376;

          }
          objc_msgSend_path(v414, v367, v368, v369, v370);
          v377 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v382 = (const char *)objc_msgSend_UTF8String(v377, v378, v379, v380, v381);
          v383 = strlen(v382);
          if (v383 >= 0x7FFFFFFFFFFFFFF8)
            sub_21646B134();
          v384 = v383;
          if (v383 >= 0x17)
          {
            v401 = (v383 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v383 | 7) != 0x17)
              v401 = v383 | 7;
            v402 = v401 + 1;
            p_dst = (__int128 *)operator new(v401 + 1);
            *((_QWORD *)&__dst + 1) = v384;
            v429 = v402 | 0x8000000000000000;
            *(_QWORD *)&__dst = p_dst;
          }
          else
          {
            HIBYTE(v429) = v383;
            p_dst = &__dst;
            if (!v383)
            {
LABEL_165:
              *((_BYTE *)p_dst + v384) = 0;

              if (SHIBYTE(v429) < 0)
              {
                sub_21646B1E4(__p, (void *)__dst, *((unint64_t *)&__dst + 1));
              }
              else
              {
                *(_OWORD *)__p = __dst;
                v427 = v429;
              }
              HIBYTE(v447[2]) = 16;
              strcpy((char *)v447, ".protoToFile-tmp");
              sub_21646B804((uint64_t)__p, (uint64_t)v447);
              if (SHIBYTE(v447[2]) < 0)
                operator delete(v447[0]);
              sub_2164A7A50((uint64_t)__p, 2, (int *)&v425);
              MEMORY[0x2199F8C24](v447, v425, 0xFFFFFFFFLL);
              sub_2164A35EC((uint64_t)buf);
              MEMORY[0x2199F8C30](v447);
              sub_2164688D8((int *)&v425);
              sub_21646B614((uint64_t)__p, (uint64_t)&__dst, 0);
              if (qword_253E5C3A8 != -1)
                dispatch_once(&qword_253E5C3A8, &unk_24D570058);
              v403 = (id)qword_253E5C3A0;
              if (os_log_type_enabled(v403, OS_LOG_TYPE_DEBUG))
              {
                v404 = &__dst;
                if (v429 < 0)
                  v404 = (__int128 *)__dst;
                LODWORD(v447[0]) = 136315138;
                *(void **)((char *)v447 + 4) = v404;
                _os_log_impl(&dword_216456000, v403, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, find tile at %s", (uint8_t *)v447, 0xCu);
              }

              if (SHIBYTE(v427) < 0)
                operator delete(__p[0]);
              if (SHIBYTE(v429) < 0)
                operator delete((void *)__dst);
              sub_216469624((uint64_t)buf);
            }
          }
          memmove(p_dst, v382, v384);
          goto LABEL_165;
        }
        if (qword_253E5C3A8 != -1)
          dispatch_once(&qword_253E5C3A8, &unk_24D570058);
        v386 = v35;
        v387 = (id)qword_253E5C3A0;
        if (os_log_type_enabled(v387, OS_LOG_TYPE_ERROR))
        {
          v394 = objc_retainAutorelease(v420);
          v399 = objc_msgSend_UTF8String(v394, v395, v396, v397, v398);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v399;
          _os_log_impl(&dword_216456000, v387, OS_LOG_TYPE_ERROR, "@IndoorAvl, generateAvlTileFromJSON, expected at least one venue, str=\n%s\n", buf, 0xCu);
        }
      }
      else
      {
        if (qword_253E5C3A8 != -1)
          dispatch_once(&qword_253E5C3A8, &unk_24D570058);
        v386 = 0;
        v387 = (id)qword_253E5C3A0;
        if (os_log_type_enabled(v387, OS_LOG_TYPE_ERROR))
        {
          v388 = objc_retainAutorelease(v420);
          v393 = objc_msgSend_UTF8String(v388, v389, v390, v391, v392);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v393;
          _os_log_impl(&dword_216456000, v387, OS_LOG_TYPE_ERROR, "@IndoorAvl, generateAvlTileFromJSON, no venues given in avl tile json??, str=\n%s\n", buf, 0xCu);
        }
      }

      log = v386;
LABEL_160:

      return 0;
    }
    sub_2164A029C();
    v408 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v408, OS_LOG_TYPE_FAULT))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)v453 = 2081;
      *(_QWORD *)&v453[2] = "path != nullptr";
      _os_log_impl(&dword_216456000, v408, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_2164A029C();
    v409 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v409))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)v453 = 2081;
      *(_QWORD *)&v453[2] = "path != nullptr";
      _os_signpost_emit_with_name_impl(&dword_216456000, v409, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path", "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_2164A029C();
    v407 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v407, OS_LOG_TYPE_INFO))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)v453 = 2081;
      *(_QWORD *)&v453[2] = "path != nullptr";
      _os_log_impl(&dword_216456000, v407, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
  }
  else
  {
    sub_2164A029C();
    v405 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v405, OS_LOG_TYPE_FAULT))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)v453 = 2081;
      *(_QWORD *)&v453[2] = "jsonStr != nullptr";
      _os_log_impl(&dword_216456000, v405, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_2164A029C();
    v406 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v406))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)v453 = 2081;
      *(_QWORD *)&v453[2] = "jsonStr != nullptr";
      _os_signpost_emit_with_name_impl(&dword_216456000, v406, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string", "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_2164A029C();
    v407 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v407, OS_LOG_TYPE_INFO))
    {
      *(_QWORD *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)v453 = 2081;
      *(_QWORD *)&v453[2] = "jsonStr != nullptr";
      _os_log_impl(&dword_216456000, v407, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
  }

  result = abort_report_np();
  __break(1u);
  return result;
}

- (NSURL)path
{
  return self->_path;
}

@end
