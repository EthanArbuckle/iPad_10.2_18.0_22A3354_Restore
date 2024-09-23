@implementation CLTripSegmentProcessorManager

- (CLTripSegmentProcessorManager)init
{
  CLTripSegmentProcessorManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLTripSegmentProcessorManager;
  v2 = -[CLTripSegmentProcessorManager init](&v4, sel_init);
  if (v2)
    v2->fQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreLocation.TripSegmentProcessor", 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fQueue);
  v3.receiver = self;
  v3.super_class = (Class)CLTripSegmentProcessorManager;
  -[CLTripSegmentProcessorManager dealloc](&v3, sel_dealloc);
}

- (id)errorObject:(int64_t)a3 description:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v14[0] = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("%@"), v8, a4, *MEMORY[0x1E0CB2D50]);
  v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v14, (uint64_t)&v13, 1);
  return (id)objc_msgSend_initWithDomain_code_userInfo_(v6, v11, (uint64_t)CFSTR("com.apple.locationd.TripSegmentProcessor"), a3, v10);
}

- (id)processTripSegmentData:(id)a3 withOptions:(id)a4 outputHandler:(id)a5
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const __CFString *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  char *v42;
  char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
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
  char *v62;
  char *v63;
  uint8_t buf[4];
  int v65;
  __int16 v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990630);
    v26 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v26, OS_LOG_TYPE_ERROR, "CLTSP,trip segment data is nil", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990630);
      v42 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLTripSegmentProcessorManager processTripSegmentData:withOptions:outputHandler:]", "CoreLocation: %s\n", v42);
      if (v42 != (char *)buf)
        free(v42);
    }
    v25 = CFSTR("CLTSP,trip segment data is nil");
    return (id)objc_msgSend_errorObject_description_(self, v24, 0, (uint64_t)v25);
  }
  if (!objc_msgSend_modeOfTransport(a3, a2, (uint64_t)a3, (uint64_t)a4))
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990630);
    v27 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v27, OS_LOG_TYPE_ERROR, "CLTSP,unknown mode of transport", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990630);
      v43 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLTripSegmentProcessorManager processTripSegmentData:withOptions:outputHandler:]", "CoreLocation: %s\n", v43);
      if (v43 != (char *)buf)
        free(v43);
    }
    v25 = CFSTR("CLTSP,invalid mode of transport");
    return (id)objc_msgSend_errorObject_description_(self, v24, 0, (uint64_t)v25);
  }
  v12 = (void *)objc_msgSend_tripLocations(a3, v9, v10, v11);
  if ((unint64_t)objc_msgSend_count(v12, v13, v14, v15) <= 1)
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990630);
    v16 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_msgSend_tripLocations(a3, v17, v18, v19);
      *(_DWORD *)buf = 67240192;
      v65 = objc_msgSend_count(v20, v21, v22, v23);
      _os_log_impl(&dword_18F5B3000, v16, OS_LOG_TYPE_ERROR, "CLTSP,location count less than two,count,%{public}d", buf, 8u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990630);
      v47 = (void *)objc_msgSend_tripLocations(a3, v44, v45, v46);
      objc_msgSend_count(v47, v48, v49, v50);
      v51 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLTripSegmentProcessorManager processTripSegmentData:withOptions:outputHandler:]", "CoreLocation: %s\n", v51);
      if (v51 != (char *)buf)
        free(v51);
    }
    v25 = CFSTR("CLTSP,location object has less than two entries");
    return (id)objc_msgSend_errorObject_description_(self, v24, 0, (uint64_t)v25);
  }
  if (qword_1EE172168 != -1)
    dispatch_once(&qword_1EE172168, &unk_1E2990630);
  v29 = qword_1EE172170;
  if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_msgSend_tripLocations(a3, v30, v31, v32);
    *(_DWORD *)buf = 67240450;
    v65 = objc_msgSend_count(v33, v34, v35, v36);
    v66 = 2114;
    v67 = objc_msgSend_tripSegmentID(a3, v37, v38, v39);
    _os_log_impl(&dword_18F5B3000, v29, OS_LOG_TYPE_DEFAULT, "CLTSP,processTripSegmentData called with locations count,%{public}d,tripSegmentID,%{public}@", buf, 0x12u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990630);
    v55 = (void *)objc_msgSend_tripLocations(a3, v52, v53, v54);
    objc_msgSend_count(v55, v56, v57, v58);
    objc_msgSend_tripSegmentID(a3, v59, v60, v61);
    v62 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLTripSegmentProcessorManager processTripSegmentData:withOptions:outputHandler:]", "CoreLocation: %s\n", v62);
    if (v62 != (char *)buf)
      free(v62);
  }
  if ((sub_18F75E6DC((uint64_t)&self->cltsp, a3, a4, (uint64_t)a5) & 1) != 0)
    return 0;
  if (qword_1EE172168 != -1)
    dispatch_once(&qword_1EE172168, &unk_1E2990630);
  v40 = qword_1EE172170;
  if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v40, OS_LOG_TYPE_ERROR, "CLTSP,trip segment processing failed", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990630);
    v63 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLTripSegmentProcessorManager processTripSegmentData:withOptions:outputHandler:]", "CoreLocation: %s\n", v63);
    if (v63 != (char *)buf)
      free(v63);
  }
  return (id)objc_msgSend_errorObject_description_(self, v41, 1, (uint64_t)CFSTR("CLTSP,trip segment processing failed"));
}

- (void)processTripSegmentData:(id)a3 outputHandler:(id)a4 completionHandler:(id)a5
{
  CLTripSegmentProcessorOptions *v7;

  v7 = objc_alloc_init(CLTripSegmentProcessorOptions);
  MEMORY[0x1E0DE7D20](self, sel_processTripSegmentData_withOptions_outputHandler_completionHandler_, a3, v7);
}

- (void)processTripSegmentData:(id)a3 withOptions:(id)a4 outputHandler:(id)a5 completionHandler:(id)a6
{
  NSObject *fQueue;
  _QWORD block[9];
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3052000000;
  v14[3] = sub_18F5CD80C;
  v14[4] = sub_18F5CD78C;
  v15 = 0;
  v15 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3052000000;
  v12[3] = sub_18F5CD80C;
  v12[4] = sub_18F5CD78C;
  v13 = 0;
  v13 = a4;
  fQueue = self->fQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F6890AC;
  block[3] = &unk_1E2991FB8;
  block[7] = v14;
  block[8] = v12;
  block[4] = self;
  block[5] = a5;
  block[6] = a6;
  dispatch_async(fQueue, block);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
}

- (void)clearMapHelperMemoryAndExitCleanly
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  char *v9;
  uint8_t buf[1640];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend_sharedInstance(CLMapsXPCServiceManager, a2, v2, v3);
  objc_msgSend_clearMemoryAndExitHelperProcessCleanly(v4, v5, v6, v7);
  if (qword_1EE172168 != -1)
    dispatch_once(&qword_1EE172168, &unk_1E2990630);
  v8 = qword_1EE172170;
  if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "CLTSP,tspManager,clearMemoryAndExitHelperProcessCleanly", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990630);
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLTripSegmentProcessorManager clearMapHelperMemoryAndExitCleanly]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf)
      free(v9);
  }
}

- (void)simulateSparseTrajectoryAndSubmitCoreAnalytics:(id)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *Object;
  const char *v23;
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
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  double v37;
  double v38;
  int v39;
  NSObject *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  id v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  uint64_t v53;
  double v54;
  uint64_t j;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  int v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  void *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  _QWORD *v116;
  uint64_t v117;
  id v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  CLTripSegmentInputData *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t isFinalPart;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t started;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  void *isFinalPart_modeOfTransport_tripLocations_startTripLocation_stopTripLocation_inertialData;
  NSObject *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  int v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  int v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  int v185;
  __objc2_class *v186;
  void *v187;
  CLTripSegmentProcessorOptions *v188;
  const char *v189;
  uint64_t v190;
  const char *v191;
  NSObject *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  double *v205;
  double v206;
  uint64_t v207;
  NSObject *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  double *v221;
  double v222;
  uint64_t v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  int v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  int v247;
  char *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  int v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  int v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  int v288;
  char *v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  double *v302;
  double v303;
  uint64_t v304;
  char *v305;
  char *v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  void *v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  void *v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  double *v319;
  double v320;
  uint64_t v321;
  char *v322;
  char *v323;
  int v324;
  id v325;
  _QWORD v327[7];
  uint64_t v328;
  uint64_t *v329;
  uint64_t v330;
  int v331;
  uint64_t v332;
  double *v333;
  uint64_t v334;
  uint64_t (*v335)(uint64_t, uint64_t);
  uint64_t (*v336)();
  const char *v337;
  double v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  int v343;
  double v344;
  __int16 v345;
  int v346;
  __int16 v347;
  int v348;
  uint8_t buf[4];
  uint64_t v350;
  __int16 v351;
  _BYTE v352[10];
  int v353;
  __int16 v354;
  int v355;
  __int16 v356;
  int v357;
  _OWORD v358[8];
  uint64_t v359;

  v359 = *MEMORY[0x1E0C80C00];
  v332 = 0;
  v333 = (double *)&v332;
  v334 = 0x3812000000;
  v335 = sub_18F68A500;
  v336 = nullsub_23;
  v337 = "";
  v338 = -1.0;
  v4 = mach_continuous_time();
  v338 = sub_18F6BDF00(v4);
  v328 = 0;
  v329 = &v328;
  v330 = 0x2020000000;
  v331 = 0;
  v327[0] = MEMORY[0x1E0C809B0];
  v327[1] = 3221225472;
  v327[2] = sub_18F68A510;
  v327[3] = &unk_1E2991FE0;
  v327[4] = a3;
  v327[5] = &v328;
  v327[6] = &v332;
  v8 = (void *)objc_msgSend_tripLocations(a3, v5, v6, v7);
  if ((unint64_t)objc_msgSend_count(v8, v9, v10, v11) < 2)
  {
LABEL_38:
    v44 = (void *)objc_msgSend_mutableCopy(v8, v12, v13, v14);
    goto LABEL_39;
  }
  v341 = 0u;
  v342 = 0u;
  v339 = 0u;
  v340 = 0u;
  v15 = 0;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v339, (uint64_t)v358, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v340;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v340 != v20)
          objc_enumerationMutation(v8);
        v15 += objc_msgSend_isGPSLocationType(*(void **)(*((_QWORD *)&v339 + 1) + 8 * i), v16, v17, v18);
      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v16, (uint64_t)&v339, (uint64_t)v358, 16);
    }
    while (v19);
  }
  Object = (void *)objc_msgSend_lastObject(v8, v16, v17, v18);
  v26 = (void *)objc_msgSend_timestamp(Object, v23, v24, v25);
  v30 = (void *)objc_msgSend_firstObject(v8, v27, v28, v29);
  v34 = objc_msgSend_timestamp(v30, v31, v32, v33);
  objc_msgSend_timeIntervalSinceDate_(v26, v35, v34, v36);
  v38 = v37;
  if (v15 < 2 || (v39 = (int)(v37 * 0.6), v15 <= v39))
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990630);
    v66 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      v350 = *(_QWORD *)&v38;
      v351 = 1026;
      *(_DWORD *)v352 = v15;
      _os_log_impl(&dword_18F5B3000, v66, OS_LOG_TYPE_INFO, "CLTSP,hasSubstantialGPSData,0,duration,%{public}.1lf,numberOfGPSLocations,%{public}d", buf, 0x12u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990630);
      v343 = 134349312;
      v344 = v38;
      v345 = 1026;
      v346 = v15;
      v324 = 18;
      v306 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "static BOOL CLTripSegmentUtilities::hasSubstantialGPSData(NSArray<CLTripSegmentLocation *> * _Nonnull, double)", "CoreLocation: %s\n", v306);
      if (v306 != (char *)buf)
        free(v306);
    }
    goto LABEL_38;
  }
  if (qword_1EE172168 != -1)
    dispatch_once(&qword_1EE172168, &unk_1E2990630);
  v40 = qword_1EE172170;
  if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349568;
    v350 = *(_QWORD *)&v38;
    v351 = 1026;
    *(_DWORD *)v352 = v15;
    *(_WORD *)&v352[4] = 1026;
    *(_DWORD *)&v352[6] = v39;
    _os_log_impl(&dword_18F5B3000, v40, OS_LOG_TYPE_INFO, "CLTSP,hasSubstantialGPSData,1,duration,%{public}.1lf,numberOfGPSLocations,%{public}d,threshold,%{public}d", buf, 0x18u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990630);
    v343 = 134349568;
    v344 = v38;
    v345 = 1026;
    v346 = v15;
    v347 = 1026;
    v348 = v39;
    v324 = 24;
    v323 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "static BOOL CLTripSegmentUtilities::hasSubstantialGPSData(NSArray<CLTripSegmentLocation *> * _Nonnull, double)", "CoreLocation: %s\n", v323);
    if (v323 != (char *)buf)
      free(v323);
  }
  v41 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v44 = (void *)objc_msgSend_initWithArray_(v41, v42, (uint64_t)v8, v43);
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(v358, 0, 64);
  v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v46, (uint64_t)v358, (uint64_t)buf, 16);
  v325 = a3;
  if (v50)
  {
    v51 = 0;
    v52 = 0;
    v53 = **(_QWORD **)&v358[1];
    v54 = -1.0;
    do
    {
      for (j = 0; j != v50; ++j)
      {
        if (**(_QWORD **)&v358[1] != v53)
          objc_enumerationMutation(v8);
        v56 = *(void **)(*((_QWORD *)&v358[0] + 1) + 8 * j);
        if (objc_msgSend_isGPSLocationType(v56, v47, v48, v49))
        {
          v57 = (void *)objc_msgSend_timestamp(v56, v47, v48, v49);
          objc_msgSend_timeIntervalSinceReferenceDate(v57, v58, v59, v60);
          v62 = v61;
          if (vabdd_f64(v61, v54) < 3.0)
            ++v51;
          else
            v51 = 1;
          if (v51 >= 11)
          {
            objc_msgSend_addObject_(v45, v47, (uint64_t)v56, v49);
            if (v52 <= 119)
            {
              ++v52;
            }
            else
            {
              v51 = 0;
              v52 = 0;
            }
          }
          v54 = v62;
        }
      }
      v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v47, (uint64_t)v358, (uint64_t)buf, 16);
    }
    while (v50);
  }
  objc_msgSend_removeObjectsInArray_(v44, v47, (uint64_t)v45, v49);
  a3 = v325;
LABEL_39:
  v67 = objc_msgSend_count(v44, v63, v64, v65);
  *((_DWORD *)v329 + 6) = v67;
  v71 = (void *)objc_msgSend_tripLocations(a3, v68, v69, v70);
  v75 = objc_msgSend_count(v71, v72, v73, v74);
  if (v75 == objc_msgSend_count(v44, v76, v77, v78))
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990630);
    v79 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
    {
      v83 = (void *)objc_msgSend_tripSegmentID(a3, v80, v81, v82);
      v87 = (void *)objc_msgSend_UUIDString(v83, v84, v85, v86);
      v91 = objc_msgSend_UTF8String(v87, v88, v89, v90);
      v95 = objc_msgSend_modeOfTransport(a3, v92, v93, v94);
      v99 = (void *)objc_msgSend_tripLocations(a3, v96, v97, v98);
      v103 = objc_msgSend_count(v99, v100, v101, v102);
      *(_DWORD *)buf = 136446722;
      v350 = v91;
      v351 = 1026;
      *(_DWORD *)v352 = v95;
      *(_WORD *)&v352[4] = 1026;
      *(_DWORD *)&v352[6] = v103;
      _os_log_impl(&dword_18F5B3000, v79, OS_LOG_TYPE_DEFAULT, "CLTSP,simulatedSparse,data not created,ID,%{public}s,modeOfTransport,%{public}d,locations,%{public}d", buf, 0x18u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990630);
      v227 = (void *)objc_msgSend_tripSegmentID(a3, v224, v225, v226);
      v231 = (void *)objc_msgSend_UUIDString(v227, v228, v229, v230);
      v235 = objc_msgSend_UTF8String(v231, v232, v233, v234);
      v239 = objc_msgSend_modeOfTransport(a3, v236, v237, v238);
      v243 = (void *)objc_msgSend_tripLocations(a3, v240, v241, v242);
      v247 = objc_msgSend_count(v243, v244, v245, v246);
      LODWORD(v358[0]) = 136446722;
      *(_QWORD *)((char *)v358 + 4) = v235;
      WORD6(v358[0]) = 1026;
      *(_DWORD *)((char *)v358 + 14) = v239;
      WORD1(v358[1]) = 1026;
      DWORD1(v358[1]) = v247;
      v248 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLTripSegmentProcessorManager simulateSparseTrajectoryAndSubmitCoreAnalytics:]", "CoreLocation: %s\n", v248);
      if (v248 != (char *)buf)
        free(v248);
    }
    if (objc_msgSend_isFinalPart(a3, v104, v105, v106))
    {
      v107 = sub_18F74911C();
      sub_18F749F9C(v107);
    }
  }
  else
  {
    if (*(int *)(sub_18F74911C() + 608) < 1)
    {
      v121 = objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v108, v109, v110);
      v111 = a3;
    }
    else
    {
      v111 = a3;
      v112 = (void *)MEMORY[0x1E0CB3940];
      v113 = sub_18F74911C();
      v116 = (_QWORD *)(v113 + 40);
      if (*(char *)(v113 + 63) < 0)
        v116 = (_QWORD *)*v116;
      v117 = objc_msgSend_stringWithFormat_(v112, v114, (uint64_t)CFSTR("%s"), v115, v116, v324);
      v118 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v121 = objc_msgSend_initWithUUIDString_(v118, v119, v117, v120);
    }
    v122 = [CLTripSegmentInputData alloc];
    isFinalPart = objc_msgSend_isFinalPart(v111, v123, v124, v125);
    v130 = objc_msgSend_modeOfTransport(v111, v127, v128, v129);
    started = objc_msgSend_startTripLocation(v111, v131, v132, v133);
    v138 = objc_msgSend_stopTripLocation(v111, v135, v136, v137);
    v142 = objc_msgSend_inertialData(v111, v139, v140, v141);
    isFinalPart_modeOfTransport_tripLocations_startTripLocation_stopTripLocation_inertialData = (void *)objc_msgSend_initWithTripSegmentID_isFinalPart_modeOfTransport_tripLocations_startTripLocation_stopTripLocation_inertialData_(v122, v143, v121, isFinalPart, v130, v44, started, v138, v142);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990630);
    v145 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
    {
      v149 = (void *)objc_msgSend_tripSegmentID(v111, v146, v147, v148);
      v153 = (void *)objc_msgSend_UUIDString(v149, v150, v151, v152);
      v157 = objc_msgSend_UTF8String(v153, v154, v155, v156);
      v161 = (void *)objc_msgSend_tripSegmentID(isFinalPart_modeOfTransport_tripLocations_startTripLocation_stopTripLocation_inertialData, v158, v159, v160);
      v165 = (void *)objc_msgSend_UUIDString(v161, v162, v163, v164);
      v169 = objc_msgSend_UTF8String(v165, v166, v167, v168);
      v173 = objc_msgSend_modeOfTransport(v111, v170, v171, v172);
      v177 = (void *)objc_msgSend_tripLocations(v111, v174, v175, v176);
      v181 = objc_msgSend_count(v177, v178, v179, v180);
      v185 = objc_msgSend_count(v44, v182, v183, v184);
      *(_DWORD *)buf = 136447234;
      v350 = v157;
      v351 = 2082;
      *(_QWORD *)v352 = v169;
      *(_WORD *)&v352[8] = 1026;
      v353 = v173;
      v354 = 1026;
      v355 = v181;
      v356 = 1026;
      v357 = v185;
      _os_log_impl(&dword_18F5B3000, v145, OS_LOG_TYPE_DEFAULT, "CLTSP,simulatedSparse,data created,origID,%{public}s,newID,%{public}s,modeOfTransport,%{public}d,origLocations,%{public}d,sparseLocations,%{public}d", buf, 0x28u);
    }
    v186 = &OBJC_METACLASS___CLHeadingInternal;
    v187 = v111;
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990630);
      v252 = (void *)objc_msgSend_tripSegmentID(v111, v249, v250, v251);
      v256 = (void *)objc_msgSend_UUIDString(v252, v253, v254, v255);
      v260 = objc_msgSend_UTF8String(v256, v257, v258, v259);
      v264 = (void *)objc_msgSend_tripSegmentID(isFinalPart_modeOfTransport_tripLocations_startTripLocation_stopTripLocation_inertialData, v261, v262, v263);
      v268 = (void *)objc_msgSend_UUIDString(v264, v265, v266, v267);
      v272 = objc_msgSend_UTF8String(v268, v269, v270, v271);
      v276 = objc_msgSend_modeOfTransport(v111, v273, v274, v275);
      v280 = (void *)objc_msgSend_tripLocations(v111, v277, v278, v279);
      v284 = objc_msgSend_count(v280, v281, v282, v283);
      v288 = objc_msgSend_count(v44, v285, v286, v287);
      LODWORD(v358[0]) = 136447234;
      *(_QWORD *)((char *)v358 + 4) = v260;
      WORD6(v358[0]) = 2082;
      *(_QWORD *)((char *)v358 + 14) = v272;
      WORD3(v358[1]) = 1026;
      DWORD2(v358[1]) = v276;
      WORD6(v358[1]) = 1026;
      *(_DWORD *)((char *)&v358[1] + 14) = v284;
      WORD1(v358[2]) = 1026;
      DWORD1(v358[2]) = v288;
      v289 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLTripSegmentProcessorManager simulateSparseTrajectoryAndSubmitCoreAnalytics:]", "CoreLocation: %s\n", v289);
      v187 = v111;
      v186 = &OBJC_METACLASS___CLHeadingInternal;
      if (v289 != (char *)buf)
        free(v289);
    }
    v188 = objc_alloc_init(CLTripSegmentProcessorOptions);
    objc_msgSend_setSimulatedSparseProcessing_(v188, v189, 1, v190);
    if (objc_msgSend_processTripSegmentData_withOptions_outputHandler_(self, v191, (uint64_t)isFinalPart_modeOfTransport_tripLocations_startTripLocation_stopTripLocation_inertialData, (uint64_t)v188, v327))
    {
      if (v186[9].isa != (__objc2_class *)-1)
        dispatch_once(&qword_1EE172168, &unk_1E2990630);
      v192 = qword_1EE172170;
      if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
      {
        v196 = (void *)objc_msgSend_tripSegmentID(v187, v193, v194, v195);
        v200 = (void *)objc_msgSend_UUIDString(v196, v197, v198, v199);
        v204 = objc_msgSend_UTF8String(v200, v201, v202, v203);
        v205 = v333;
        v206 = 0.0;
        if (v333[6] >= 0.0)
        {
          v207 = mach_continuous_time();
          v206 = vabdd_f64(sub_18F6BDF00(v207), v205[6]) * 1000.0;
        }
        *(_DWORD *)buf = 136446466;
        v350 = v204;
        v351 = 2050;
        *(double *)v352 = v206;
        _os_log_impl(&dword_18F5B3000, v192, OS_LOG_TYPE_DEFAULT, "CLTSP,simulatedSparse,failedtripID,%{public}s,processingTime,%{public}.2lf", buf, 0x16u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (v186[9].isa != (__objc2_class *)-1)
          dispatch_once(&qword_1EE172168, &unk_1E2990630);
        v310 = (void *)objc_msgSend_tripSegmentID(v187, v307, v308, v309);
        v314 = (void *)objc_msgSend_UUIDString(v310, v311, v312, v313);
        v318 = objc_msgSend_UTF8String(v314, v315, v316, v317);
        v319 = v333;
        v320 = 0.0;
        if (v333[6] >= 0.0)
        {
          v321 = mach_continuous_time();
          v320 = vabdd_f64(sub_18F6BDF00(v321), v319[6]) * 1000.0;
        }
        LODWORD(v358[0]) = 136446466;
        *(_QWORD *)((char *)v358 + 4) = v318;
        WORD6(v358[0]) = 2050;
        *(double *)((char *)v358 + 14) = v320;
        v322 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLTripSegmentProcessorManager simulateSparseTrajectoryAndSubmitCoreAnalytics:]", "CoreLocation: %s\n", v322);
        if (v322 != (char *)buf)
          free(v322);
      }
    }
    if (v186[9].isa != (__objc2_class *)-1)
      dispatch_once(&qword_1EE172168, &unk_1E2990630);
    v208 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
    {
      v212 = (void *)objc_msgSend_tripSegmentID(v187, v209, v210, v211);
      v216 = (void *)objc_msgSend_UUIDString(v212, v213, v214, v215);
      v220 = objc_msgSend_UTF8String(v216, v217, v218, v219);
      v221 = v333;
      v222 = 0.0;
      if (v333[6] >= 0.0)
      {
        v223 = mach_continuous_time();
        v222 = vabdd_f64(sub_18F6BDF00(v223), v221[6]) * 1000.0;
      }
      *(_DWORD *)buf = 136446466;
      v350 = v220;
      v351 = 2050;
      *(double *)v352 = v222;
      _os_log_impl(&dword_18F5B3000, v208, OS_LOG_TYPE_DEFAULT, "CLTSP,simulatedSparse,success,tripID,%{public}s,processingTime,%{public}.2lf", buf, 0x16u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (v186[9].isa != (__objc2_class *)-1)
        dispatch_once(&qword_1EE172168, &unk_1E2990630);
      v293 = (void *)objc_msgSend_tripSegmentID(v187, v290, v291, v292);
      v297 = (void *)objc_msgSend_UUIDString(v293, v294, v295, v296);
      v301 = objc_msgSend_UTF8String(v297, v298, v299, v300);
      v302 = v333;
      v303 = 0.0;
      if (v333[6] >= 0.0)
      {
        v304 = mach_continuous_time();
        v303 = vabdd_f64(sub_18F6BDF00(v304), v302[6]) * 1000.0;
      }
      LODWORD(v358[0]) = 136446466;
      *(_QWORD *)((char *)v358 + 4) = v301;
      WORD6(v358[0]) = 2050;
      *(double *)((char *)v358 + 14) = v303;
      v305 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLTripSegmentProcessorManager simulateSparseTrajectoryAndSubmitCoreAnalytics:]", "CoreLocation: %s\n", v305);
      if (v305 != (char *)buf)
        free(v305);
    }
  }
  _Block_object_dispose(&v328, 8);
  _Block_object_dispose(&v332, 8);
}

- (void).cxx_destruct
{
  sub_18F5D6004((uint64_t)&self[1]);
  sub_18F68E6B4((uint64_t)&self->cltsp.fOSTransaction);
}

- (id).cxx_construct
{
  CLOSTransactionWrapper *p_fOSTransaction;
  std::string __p;

  self->cltsp.fDistanceCalculator.fRefLatRads = 0.0;
  self->cltsp.fDistanceCalculator.fRefLatDegs = 0.0;
  *(_OWORD *)&self->cltsp.fDistanceCalculator.fM = xmmword_18F771F40;
  self->cltsp.fDistanceCalculator.fCosRefLat = 1.0;
  p_fOSTransaction = &self->cltsp.fOSTransaction;
  sub_18F5D5990(&__p, "CLTripSegmentProcessorOSTransaction");
  sub_18F68E64C(p_fOSTransaction, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  LOWORD(self->cltsp.fOSTransaction.name_.__r_.var0) = 1;
  self[1].super.isa = 0;
  self[1].fQueue = 0;
  self->cltsp.fOSTransaction.name_.var0 = (int64_t)CFSTR("/var/mobile/Library/Caches/com.apple.routined/tripSegments/");
  return self;
}

@end
