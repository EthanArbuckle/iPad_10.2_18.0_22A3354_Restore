@implementation CMFallStatsItemsIterator

- (CMFallStatsItemsIterator)initWithData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CMFallStatsItemsIterator *v7;
  objc_super v9;

  if (!objc_msgSend_length(a3, a2, (uint64_t)a3, v3, v4))
    return 0;
  v9.receiver = self;
  v9.super_class = (Class)CMFallStatsItemsIterator;
  v7 = -[CMFallStatsItemsIterator init](&v9, sel_init);
  if (v7)
  {
    v7->_data = (NSData *)a3;
    v7->_item = 0;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMFallStatsItemsIterator;
  -[CMFallStatsItemsIterator dealloc](&v3, sel_dealloc);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  __shared_weak_count *v19;
  __int128 v20;
  __shared_weak_count *cntrl;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  Item *ptr;
  _QWORD *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  int v53;
  const char *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  double v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  double v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  const char *v92;
  double v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  double v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  const char *v109;
  double v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  double v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  double v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  const char *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  const char *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  const char *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  double v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  double v161;
  const char *v162;
  const char *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  const char *v183;
  uint64_t v184;
  char *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  const char *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  const char *v212;
  const char *v213;
  std::__shared_weak_count *v214;
  unint64_t *p_shared_owners;
  unint64_t v216;
  NSObject *v217;
  uint64_t v218;
  uint64_t v219;
  unint64_t result;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  NSDictionary *v225;
  void *v226;
  const char *v227;
  _BYTE v228[16];
  std::__shared_weak_count *v229;
  int v230;
  uint64_t v231;
  uint8_t buf[16];
  uint64_t v233;
  _QWORD v234[5];
  _QWORD v235[5];
  const __CFString *v236;
  uint64_t v237;
  _QWORD v238[5];
  _QWORD v239[5];
  const __CFString *v240;
  uint64_t v241;
  _QWORD v242[7];
  _QWORD v243[7];
  const __CFString *v244;
  uint64_t v245;
  _QWORD v246[3];
  _QWORD v247[3];
  const __CFString *v248;
  uint64_t v249;
  _QWORD v250[2];
  _QWORD v251[2];
  const __CFString *v252;
  uint64_t v253;
  _QWORD v254[5];
  _QWORD v255[5];
  const __CFString *v256;
  uint64_t v257;
  _QWORD v258[4];
  _QWORD v259[4];
  const __CFString *v260;
  uint64_t v261;
  _QWORD v262[4];
  _QWORD v263[4];
  const __CFString *v264;
  uint64_t v265;
  _QWORD v266[4];
  _QWORD v267[4];
  const __CFString *v268;
  uint64_t v269;
  _QWORD v270[4];
  _QWORD v271[4];
  const __CFString *v272;
  uint64_t v273;
  _QWORD v274[8];
  _QWORD v275[8];
  const __CFString *v276;
  _QWORD v277[3];

  v277[1] = *MEMORY[0x1E0C80C00];
  a3->var1 = a4;
  a3->var2 = (unint64_t *)self;
  if (!self->_data)
    return 0;
  var0 = a3->var0;
  if (!a3->var0)
  {
    if (sub_18F2A80CC((uint64_t)&self->fMslReader))
    {
      v226 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11, v12);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v226, v227, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMFallStats.mm"), 66, CFSTR("A fast enumeration is already started"));
    }
    v13 = (char *)objc_msgSend_bytes(self->_data, v9, v10, v11, v12);
    v18 = objc_msgSend_length(self->_data, v14, v15, v16, v17);
    self->fMslReaderDelegate.fBuffer = v13;
    self->fMslReaderDelegate.fLength = v18;
    if (sub_18F2A8078((uint64_t)&self->fMslReader, (uint64_t)&self->fMslReaderDelegate))
    {
      sub_18F2A7EE4(buf, (uint64_t)&self->fMslReader);
      v19 = (__shared_weak_count *)v233;
      v20 = *(_OWORD *)buf;
      *(_QWORD *)&buf[8] = 0;
      v233 = 0;
      *(_OWORD *)&self->fMslIterator.fReader = v20;
      cntrl = self->fMslIterator.fItem.__cntrl_;
      self->fMslIterator.fItem.__cntrl_ = v19;
      if (cntrl)
      {
        v22 = (unint64_t *)((char *)cntrl + 8);
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
        }
      }
      v24 = (std::__shared_weak_count *)v233;
      if (v233)
      {
        v25 = (unint64_t *)(v233 + 8);
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      a3->var0 = 1;
      goto LABEL_19;
    }
    var0 = a3->var0;
  }
  if (var0 != 1)
    goto LABEL_20;
LABEL_19:
  if (!sub_18F2A80CC((uint64_t)&self->fMslReader))
    return 0;
  do
  {
    while (1)
    {
LABEL_20:
      if (!self->fMslIterator.fReader)
      {
        sub_18F2A7FB8((uint64_t)&self->fMslReader);
        result = 0;
        self->fMslReaderDelegate.fBuffer = 0;
        self->fMslReaderDelegate.fLength = 0;
        return result;
      }
      ptr = self->fMslIterator.fItem.__ptr_;
      v28 = (_QWORD *)*((_QWORD *)ptr + 125);
      if (!v28)
      {
        if (qword_1EE16D828 != -1)
          dispatch_once(&qword_1EE16D828, &unk_1E2952F28);
        v56 = qword_1EE16D830;
        if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_DEBUG))
        {
          v57 = *((_QWORD *)ptr + 77);
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v57;
          _os_log_impl(&dword_18F1DC000, v56, OS_LOG_TYPE_DEBUG, "Unknown Msl node in a fall snippet sequence [cftime=%f] - update CMFallStats", buf, 0xCu);
        }
        if (!sub_18F1FCA08(115, 2))
          goto LABEL_31;
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D828 != -1)
          dispatch_once(&qword_1EE16D828, &unk_1E2952F28);
        v184 = *((_QWORD *)ptr + 77);
        v230 = 134217984;
        v231 = v184;
        v185 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMFallStatsItemsIterator countByEnumeratingWithState:objects:count:]", "CoreLocation: %s\n", v185);
        goto LABEL_58;
      }
      if (!v28[11])
      {
        if (v28[1])
        {
          v272 = CFSTR("accel");
          v270[0] = CFSTR("timestamp");
          v271[0] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, (uint64_t)a3, (uint64_t)a4, a5, *((double *)ptr + 77));
          v270[1] = CFSTR("x");
          LODWORD(v58) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 8) + 20);
          v271[1] = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v59, v60, v61, v62, v58);
          v270[2] = CFSTR("y");
          LODWORD(v63) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 8) + 24);
          v271[2] = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v64, v65, v66, v67, v63);
          v270[3] = CFSTR("z");
          LODWORD(v68) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 8) + 28);
          v271[3] = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v69, v70, v71, v72, v68);
          v273 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v73, (uint64_t)v271, (uint64_t)v270, 4);
          v53 = 1;
          v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v74, (uint64_t)&v273, (uint64_t)&v272, 1);
LABEL_64:
          v55 = (void *)v75;
          goto LABEL_65;
        }
        if (v28[2])
        {
          v268 = CFSTR("fastAccel");
          v266[0] = CFSTR("timestamp");
          v267[0] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, (uint64_t)a3, (uint64_t)a4, a5, *((double *)ptr + 77));
          v266[1] = CFSTR("x");
          LODWORD(v76) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 16) + 20);
          v267[1] = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v77, v78, v79, v80, v76);
          v266[2] = CFSTR("y");
          LODWORD(v81) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 16) + 24);
          v267[2] = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v82, v83, v84, v85, v81);
          v266[3] = CFSTR("z");
          LODWORD(v86) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 16) + 28);
          v267[3] = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v87, v88, v89, v90, v86);
          v269 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v91, (uint64_t)v267, (uint64_t)v266, 4);
          v53 = 1;
          v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v92, (uint64_t)&v269, (uint64_t)&v268, 1);
          goto LABEL_64;
        }
        if (v28[8])
        {
          v264 = CFSTR("gyro");
          v262[0] = CFSTR("timestamp");
          v263[0] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, (uint64_t)a3, (uint64_t)a4, a5, *((double *)ptr + 77));
          v262[1] = CFSTR("x");
          LODWORD(v93) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 64) + 28);
          v263[1] = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v94, v95, v96, v97, v93);
          v262[2] = CFSTR("y");
          LODWORD(v98) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 64) + 32);
          v263[2] = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v99, v100, v101, v102, v98);
          v262[3] = CFSTR("z");
          LODWORD(v103) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 64) + 36);
          v263[3] = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v104, v105, v106, v107, v103);
          v265 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v108, (uint64_t)v263, (uint64_t)v262, 4);
          v53 = 1;
          v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v109, (uint64_t)&v265, (uint64_t)&v264, 1);
          goto LABEL_64;
        }
        if (v28[9])
        {
          v260 = CFSTR("fastGyro");
          v258[0] = CFSTR("timestamp");
          v259[0] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, (uint64_t)a3, (uint64_t)a4, a5, *((double *)ptr + 77));
          v258[1] = CFSTR("x");
          LODWORD(v110) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 72) + 28);
          v259[1] = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v111, v112, v113, v114, v110);
          v258[2] = CFSTR("y");
          LODWORD(v115) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 72) + 32);
          v259[2] = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v116, v117, v118, v119, v115);
          v258[3] = CFSTR("z");
          LODWORD(v120) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 72) + 36);
          v259[3] = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v121, v122, v123, v124, v120);
          v261 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v125, (uint64_t)v259, (uint64_t)v258, 4);
          v53 = 1;
          v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v126, (uint64_t)&v261, (uint64_t)&v260, 1);
          goto LABEL_64;
        }
        if (v28[4])
        {
          v256 = CFSTR("deviceMotion");
          v254[0] = CFSTR("timestamp");
          v255[0] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, (uint64_t)a3, (uint64_t)a4, a5, *((double *)ptr + 77));
          v254[1] = CFSTR("qx");
          v255[1] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v127, v128, v129, v130, *(double *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 32) + 16));
          v254[2] = CFSTR("qy");
          v255[2] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v131, v132, v133, v134, *(double *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 32) + 24));
          v254[3] = CFSTR("qz");
          v255[3] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v135, v136, v137, v138, *(double *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 32) + 32));
          v254[4] = CFSTR("qw");
          v255[4] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v139, v140, v141, v142, *(double *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 32) + 8));
          v257 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v143, (uint64_t)v255, (uint64_t)v254, 5);
          v53 = 1;
          v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v144, (uint64_t)&v257, (uint64_t)&v256, 1);
          goto LABEL_64;
        }
        if (v28[13])
        {
          v252 = CFSTR("pressure");
          v250[0] = CFSTR("timestamp");
          v251[0] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, (uint64_t)a3, (uint64_t)a4, a5, *((double *)ptr + 77));
          v250[1] = CFSTR("pressure");
          if ((*(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 104) + 16) & 0x7FFFFFFFu) >= 0x7F800000)
            v149 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v145, v146, v147, v148, -1.0);
          else
            v149 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v145, v146, v147, v148, *(float *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 104) + 16));
          v251[1] = v149;
          v253 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v150, (uint64_t)v251, (uint64_t)v250, 2);
          v53 = 1;
          v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v151, (uint64_t)&v253, (uint64_t)&v252, 1);
          goto LABEL_64;
        }
        if (v28[10])
        {
          v248 = CFSTR("heartRate");
          v246[0] = CFSTR("timestamp");
          v247[0] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, (uint64_t)a3, (uint64_t)a4, a5, *((double *)ptr + 77));
          v246[1] = CFSTR("heartRate");
          v156 = *(double *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 80) + 8) + 16);
          if ((*(_QWORD *)&v156 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
            v156 = -1.0;
          v247[1] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v152, v153, v154, v155, v156);
          v246[2] = CFSTR("confidence");
          v161 = *(double *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 80) + 8) + 8);
          if ((*(_QWORD *)&v161 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
            v161 = 0.0;
          v247[2] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v157, v158, v159, v160, v161);
          v249 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v162, (uint64_t)v247, (uint64_t)v246, 3);
          v53 = 1;
          v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v163, (uint64_t)&v249, (uint64_t)&v248, 1);
          goto LABEL_64;
        }
        if (v28[15])
        {
          v244 = CFSTR("wristState");
          v242[0] = CFSTR("timestamp");
          v243[0] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, (uint64_t)a3, (uint64_t)a4, a5, *((double *)ptr + 77));
          v242[1] = CFSTR("onWrist");
          v243[1] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v164, *(unsigned int *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 120) + 24), v165, v166);
          v242[2] = CFSTR("onWristSensor");
          v243[2] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v167, *(unsigned int *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 120) + 32), v168, v169);
          v242[3] = CFSTR("onWristConfidence");
          v243[3] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v170, *(unsigned int *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 120) + 28), v171, v172);
          v242[4] = CFSTR("isOnCharger");
          v243[4] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v173, *(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 120) + 37), v174, v175);
          v242[5] = CFSTR("isForcedOnWristEnabled");
          v243[5] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v176, *(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 120) + 36), v177, v178);
          v242[6] = CFSTR("isWristDetectionEnabled");
          v243[6] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v179, *(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 120) + 38), v180, v181);
          v245 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v182, (uint64_t)v243, (uint64_t)v242, 7);
          v53 = 1;
          v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v183, (uint64_t)&v245, (uint64_t)&v244, 1);
          goto LABEL_64;
        }
        if (v28[6])
        {
          v240 = CFSTR("state");
          v238[0] = CFSTR("timestamp");
          v239[0] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, (uint64_t)a3, (uint64_t)a4, a5, *((double *)ptr + 77));
          v238[1] = CFSTR("aopTsSensor");
          v239[1] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v186, *(_QWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 48) + 16), v187, v188);
          v238[2] = CFSTR("state");
          v239[2] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v189, *(unsigned int *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 48) + 40), v190, v191);
          v238[3] = CFSTR("response");
          v239[3] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v192, *(unsigned int *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 48) + 36), v193, v194);
          v238[4] = CFSTR("resolution");
          v239[4] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v195, *(unsigned int *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 48) + 32), v196, v197);
          v241 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v198, (uint64_t)v239, (uint64_t)v238, 5);
          v53 = 1;
          v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v199, (uint64_t)&v241, (uint64_t)&v240, 1);
          goto LABEL_64;
        }
        if (v28[7])
        {
          v236 = CFSTR("impact");
          v234[0] = CFSTR("timestamp");
          v235[0] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, (uint64_t)a3, (uint64_t)a4, a5, *((double *)ptr + 77));
          v234[1] = CFSTR("aopTsSensor");
          v235[1] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v200, *(_QWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 56) + 16), v201, v202);
          v234[2] = CFSTR("fallType");
          v235[2] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v203, *(unsigned int *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 56) + 68), v204, v205);
          v234[3] = CFSTR("isFall");
          v235[3] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v206, *(unsigned int *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 56) + 76), v207, v208);
          v234[4] = CFSTR("isNearFall");
          v235[4] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v209, *(unsigned int *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 56) + 80), v210, v211);
          v237 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v212, (uint64_t)v235, (uint64_t)v234, 5);
          v53 = 1;
          v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v213, (uint64_t)&v237, (uint64_t)&v236, 1);
          goto LABEL_64;
        }
        if (qword_1EE16D828 != -1)
          dispatch_once(&qword_1EE16D828, &unk_1E2952F28);
        v217 = qword_1EE16D830;
        if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_FAULT))
        {
          v218 = *((_QWORD *)ptr + 77);
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v218;
          _os_log_impl(&dword_18F1DC000, v217, OS_LOG_TYPE_FAULT, "Unknown fall snippet node [cftime=%f] - update CMFallStats", buf, 0xCu);
        }
        if (!sub_18F1FCA08(115, 0))
        {
LABEL_31:
          v53 = 0;
          v55 = 0;
          goto LABEL_65;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D828 != -1)
          dispatch_once(&qword_1EE16D828, &unk_1E2952F28);
        v219 = *((_QWORD *)ptr + 77);
        v230 = 134217984;
        v231 = v219;
        v185 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMFallStatsItemsIterator countByEnumeratingWithState:objects:count:]", "CoreLocation: %s\n", v185);
LABEL_58:
        if (v185 != (char *)buf)
          free(v185);
        goto LABEL_31;
      }
      v276 = CFSTR("meta");
      v274[0] = CFSTR("timestamp");
      v275[0] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, (uint64_t)a3, (uint64_t)a4, a5, *((double *)ptr + 77));
      v274[1] = CFSTR("crownUpDown");
      v275[1] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v29, *(unsigned int *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 88) + 8), v30, v31);
      v274[2] = CFSTR("isNearFall");
      v275[2] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v32, *(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 88) + 70), v33, v34);
      v274[3] = CFSTR("fallType");
      v275[3] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v35, *(unsigned int *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 88) + 12), v36, v37);
      v274[4] = CFSTR("userAgeBucket");
      v275[4] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v38, *(unsigned int *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 88) + 60), v39, v40);
      v274[5] = CFSTR("workoutType");
      v275[5] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v41, *(unsigned int *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 88) + 64), v42, v43);
      v274[6] = CFSTR("activityLevel");
      LODWORD(v48) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 88) + 44);
      if ((LODWORD(v48) & 0x7FFFFFFFu) >= 0x7F800000)
        *(float *)&v48 = -1.0;
      v275[6] = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v44, v45, v46, v47, v48);
      v274[7] = CFSTR("isADLImpact");
      v275[7] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v49, *(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)ptr + 125) + 88) + 68), v50, v51);
      v277[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v52, (uint64_t)v275, (uint64_t)v274, 8);
      v53 = 1;
      v55 = (void *)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v54, (uint64_t)v277, (uint64_t)&v276, 1);
LABEL_65:
      sub_18F374854((uint64_t)v228, (uint64_t)&self->fMslIterator);
      v214 = v229;
      if (v229)
      {
        p_shared_owners = (unint64_t *)&v229->__shared_owners_;
        do
          v216 = __ldaxr(p_shared_owners);
        while (__stlxr(v216 - 1, p_shared_owners));
        if (!v216)
          break;
      }
      if (v53)
        goto LABEL_83;
    }
    ((void (*)(std::__shared_weak_count *))v214->__on_zero_shared)(v214);
    std::__shared_weak_count::__release_weak(v214);
  }
  while (!v53);
LABEL_83:

  v225 = (NSDictionary *)objc_msgSend_copy(v55, v221, v222, v223, v224);
  self->_item = v225;
  *a3->var1 = v225;
  return 1;
}

- (void).cxx_destruct
{
  sub_18F2A8438((uint64_t)&self->fMslIterator.fItem);
  sub_18F2A7FB4((uint64_t)&self->fMslReader);
}

- (id).cxx_construct
{
  sub_18F2A7F74(&self->fMslReader, a2);
  self->fMslReaderDelegate._vptr$Delegate = (void **)&off_1E2951C80;
  *(_OWORD *)&self->fMslReaderDelegate.fBuffer = 0u;
  *(_OWORD *)&self->fMslIterator.fReader = 0u;
  self->fMslIterator.fItem.__cntrl_ = 0;
  return self;
}

@end
