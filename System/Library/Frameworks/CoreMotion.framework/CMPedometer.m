@implementation CMPedometer

- (CMPedometer)init
{
  CMPedometer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMPedometer;
  v2 = -[CMPedometer init](&v4, sel_init);
  if (v2)
    v2->_pedometerProxy = objc_alloc_init(CMPedometerProxy);
  return v2;
}

- (void)dealloc
{
  CMPedometerProxy *pedometerProxy;
  NSObject *fAppQueue;
  objc_super v5;
  _QWORD block[5];

  pedometerProxy = self->_pedometerProxy;
  fAppQueue = pedometerProxy->fAppQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F209920;
  block[3] = &unk_1E2955938;
  block[4] = pedometerProxy;
  dispatch_async(fAppQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CMPedometer;
  -[CMPedometer dealloc](&v5, sel_dealloc);
}

+ (BOOL)isStepCountingAvailable
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  if ((sub_18F1F7BFC() & 0x2000000) != 0)
    return 1;
  return objc_msgSend_featureAvailability_(CMMotionUtils, v3, (uint64_t)"kCLConnectionMessageStartStepCountAvailable", v4, v5);
}

- (void)stopPedometerUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F2098BC;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

- (void)startPedometerUpdatesFromDate:(NSDate *)start withHandler:(CMPedometerHandler)handler
{
  uint64_t v4;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  _QWORD v13[7];

  if (!start)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)handler, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMPedometer.mm"), 675, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("start"));
    if (handler)
      goto LABEL_3;
LABEL_5:
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)start, (uint64_t)handler, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMPedometer.mm"), 676, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
    goto LABEL_3;
  }
  if (!handler)
    goto LABEL_5;
LABEL_3:
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F209584;
  v13[3] = &unk_1E2955BD8;
  v13[4] = self;
  v13[5] = start;
  v13[6] = handler;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v13, (uint64_t)handler, v4);
}

- (CMPedometerProxy)pedometerProxy
{
  return self->_pedometerProxy;
}

+ (BOOL)isPaceAvailable
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  if ((sub_18F1F7BFC() & 0x4000000) != 0)
    return 1;
  return objc_msgSend_featureAvailability_(CMMotionUtils, v3, (uint64_t)"kCLConnectionMessagePaceAndCadenceAPIAvailable", v4, v5);
}

+ (BOOL)isFloorCountingAvailable
{
  _BOOL8 v2;

  if ((sub_18F1F7758() & 1) != 0)
    LOBYTE(v2) = 0;
  else
    return ((unint64_t)sub_18F1F7BFC() >> 27) & 1;
  return v2;
}

+ (BOOL)isAllDayElevationAvailable
{
  _BOOL8 v2;

  if ((sub_18F1F7758() & 1) != 0)
    LOBYTE(v2) = 0;
  else
    return ((unint64_t)sub_18F1F7BFC() >> 37) & 1;
  return v2;
}

+ (BOOL)isDistanceAvailable
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  else
    return objc_msgSend_isStepCountingAvailable(CMPedometer, v2, v3, v4, v5);
}

+ (BOOL)isCadenceAvailable
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  else
    return objc_msgSend_isPaceAvailable(CMPedometer, v2, v3, v4, v5);
}

+ (BOOL)isPedometerEventTrackingAvailable
{
  _BOOL8 v2;

  if ((sub_18F1F7758() & 1) != 0)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    sub_18F1F77DC();
    return ((unint64_t)sub_18F1F7BFC() >> 32) & 1;
  }
  return v2;
}

+ (CMAuthorizationStatus)authorizationStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2, v3, v4);
}

- (void)queryPedometerDataFromDate:(NSDate *)start toDate:(NSDate *)end withHandler:(CMPedometerHandler)handler
{
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  _QWORD v16[8];

  if (start)
  {
    if (end)
      goto LABEL_3;
LABEL_6:
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)start, (uint64_t)end, (uint64_t)handler);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMPedometer.mm"), 662, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("end"));
    if (handler)
      goto LABEL_4;
LABEL_7:
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)start, (uint64_t)end, (uint64_t)handler);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMPedometer.mm"), 663, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
    goto LABEL_4;
  }
  v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)end, (uint64_t)handler);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMPedometer.mm"), 661, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("start"));
  if (!end)
    goto LABEL_6;
LABEL_3:
  if (!handler)
    goto LABEL_7;
LABEL_4:
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18F424994;
  v16[3] = &unk_1E2956778;
  v16[4] = self;
  v16[5] = start;
  v16[6] = end;
  v16[7] = handler;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v16, (uint64_t)end, (uint64_t)handler);
}

- (id)_pedometerDataWithRecordID:(int64_t)a3
{
  CMPedometerData *v4;
  const char *v5;
  int v7;

  v4 = [CMPedometerData alloc];
  v7 = 0;
  return objc_autorelease((id)objc_msgSend_initWithStartDate_endDate_steps_distance_floorsAscended_floorsDescended_recordID_currentPace_currentCadence_firstStepTime_activeTime_sourceId_isOdometerDistance_isOdometerPace_pushes_workoutType_elevationAscended_elevationDescended_distanceSource_(v4, v5, 0, 0, 0, a3, 0, 0, 0.0, 0.0, 0.0, 0.0, 0, 0, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0], 0, 0, 0,
                                v7));
}

- (void)_startPedometerUpdatesSinceDataRecord:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  void *v9;
  const char *v10;
  _QWORD v11[7];

  if (!a4)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, 0, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMPedometer.mm"), 715, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F424B48;
  v11[3] = &unk_1E2955BD8;
  v11[4] = a3;
  v11[5] = self;
  v11[6] = a4;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v11, (uint64_t)a4, v4);
}

- (void)queryPedometerDataSinceRecord:(int64_t)a3 withHandler:(id)a4
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;

  v7 = objc_msgSend__pedometerDataWithRecordID_(self, a2, a3, (uint64_t)a4, v4);
  MEMORY[0x1E0DE7D20](self, sel__queryPedometerDataSinceDataRecord_withHandler_, v7, a4, v8);
}

- (void)queryPedometerDataSinceDataRecord:(id)a3 withHandler:(id)a4
{
  uint64_t v4;

  if (!a3)
    a3 = (id)objc_msgSend__pedometerDataWithRecordID_(self, a2, 0, (uint64_t)a4, v4);
  MEMORY[0x1E0DE7D20](self, sel__queryPedometerDataSinceDataRecord_withHandler_, a3, a4, v4);
}

- (void)_queryPedometerDataSinceDataRecord:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  void *v8;
  const char *v9;
  NSObject *v10;
  char *v11;
  uint8_t buf[1640];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if (qword_1ECEDF968 != -1)
      dispatch_once(&qword_1ECEDF968, &unk_1E2953848);
    if (qword_1ECEDF960 == 3)
    {
      v8 = (void *)objc_msgSend_pedometerProxy(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
      objc_msgSend__queryPedometerDataSinceDataRecord_withHandler_shouldStartUpdates_(v8, v9, (uint64_t)a3, (uint64_t)a4, 0);
    }
  }
  else
  {
    if (qword_1EE16D478 != -1)
      dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
    v10 = qword_1EE16D470;
    if (os_log_type_enabled((os_log_t)qword_1EE16D470, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v10, OS_LOG_TYPE_FAULT, "handler not set.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D478 != -1)
        dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMPedometer _queryPedometerDataSinceDataRecord:withHandler:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf)
        free(v11);
    }
  }
}

- (void)startPedometerEventUpdatesWithHandler:(CMPedometerEventHandler)handler
{
  uint64_t v3;
  uint64_t v4;
  void *v8;
  const char *v9;
  _QWORD v10[6];

  if (!handler)
  {
    v8 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMPedometer.mm"), 759, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F424EF0;
  v10[3] = &unk_1E2955B38;
  v10[4] = self;
  v10[5] = handler;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v10, v3, v4);
}

- (void)stopPedometerEventUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F424F74;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

- (BOOL)sendStrideCalibrationHistoryToFile:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  BOOL result;
  NSObject *v27;
  int v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t j;
  void *v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t k;
  void *v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  const char *v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  const char *v274;
  void *v275;
  const char *v276;
  uint64_t v277;
  NSObject *v278;
  int v279;
  NSObject *v280;
  int v281;
  NSObject *v282;
  int v283;
  NSObject *v284;
  int v285;
  char *v286;
  id v287;
  void *v288;
  void *v289;
  id obj;
  void *v291;
  uint64_t v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  int v305;
  uint64_t v306;
  _QWORD v307[3];
  _QWORD v308[3];
  _QWORD v309[4];
  _QWORD v310[4];
  _BYTE v311[128];
  _QWORD v312[4];
  _QWORD v313[4];
  _BYTE v314[128];
  _QWORD v315[12];
  _QWORD v316[12];
  uint8_t v317[128];
  uint8_t buf[4];
  uint64_t v319;
  uint64_t v320;

  v320 = *MEMORY[0x1E0C80C00];
  if (a3 && (objc_msgSend_isFileURL(a3, a2, (uint64_t)a3, v3, v4) & 1) != 0)
  {
    v11 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v7, v8, v9, v10);
    v16 = objc_msgSend_path(a3, v12, v13, v14, v15);
    if (objc_msgSend_fileExistsAtPath_(v11, v17, v16, v18, v19))
    {
      if (qword_1EE16D478 != -1)
        dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
      v24 = qword_1EE16D470;
      if (os_log_type_enabled((os_log_t)qword_1EE16D470, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v24, OS_LOG_TYPE_ERROR, "File already exists at URL.", buf, 2u);
      }
      v25 = sub_18F1FCA08(115, 0);
      result = 0;
      if (v25)
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D478 != -1)
          dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
        LOWORD(v305) = 0;
LABEL_79:
        v286 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMPedometer sendStrideCalibrationHistoryToFile:]", "CoreLocation: %s\n", v286);
        if (v286 != (char *)buf)
          free(v286);
        return 0;
      }
    }
    else
    {
      v29 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v20, v21, v22, v23);
      v34 = objc_msgSend_path(a3, v30, v31, v32, v33);
      if ((objc_msgSend_createFileAtPath_contents_attributes_(v29, v35, v34, 0, 0) & 1) != 0)
      {
        v287 = a3;
        v40 = (void *)objc_msgSend_strideCalibrationDump(self, v36, v37, v38, v39);
        v45 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v41, v42, v43, v44);
        v289 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v46, v47, v48, v49);
        v291 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v50, v51, v52, v53);
        v301 = 0u;
        v302 = 0u;
        v303 = 0u;
        v304 = 0u;
        v288 = v40;
        obj = (id)objc_msgSend_calibrationTracks(v40, v54, v55, v56, v57);
        v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v58, (uint64_t)&v301, (uint64_t)v317, 16);
        if (v59)
        {
          v64 = v59;
          v65 = *(_QWORD *)v302;
          do
          {
            for (i = 0; i != v64; ++i)
            {
              if (*(_QWORD *)v302 != v65)
                objc_enumerationMutation(obj);
              v67 = *(void **)(*((_QWORD *)&v301 + 1) + 8 * i);
              v315[0] = CFSTR("startTime");
              v68 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_startTime(v67, v60, v61, v62, v63);
              v316[0] = objc_msgSend_numberWithDouble_(v68, v69, v70, v71, v72);
              v315[1] = CFSTR("pacebin");
              v73 = (void *)MEMORY[0x1E0CB37E8];
              v78 = objc_msgSend_pacebin(v67, v74, v75, v76, v77);
              v316[1] = objc_msgSend_numberWithUnsignedInt_(v73, v79, v78, v80, v81);
              v315[2] = CFSTR("kvalue");
              v82 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_kvalue(v67, v83, v84, v85, v86);
              v316[2] = objc_msgSend_numberWithDouble_(v82, v87, v88, v89, v90);
              v315[3] = CFSTR("kvalueTrack");
              v91 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_kvalueTrack(v67, v92, v93, v94, v95);
              v316[3] = objc_msgSend_numberWithDouble_(v91, v96, v97, v98, v99);
              v315[4] = CFSTR("score");
              v100 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_score(v67, v101, v102, v103, v104);
              v316[4] = objc_msgSend_numberWithDouble_(v100, v105, v106, v107, v108);
              v315[5] = CFSTR("endTime");
              v109 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_endTime(v67, v110, v111, v112, v113);
              v316[5] = objc_msgSend_numberWithDouble_(v109, v114, v115, v116, v117);
              v315[6] = CFSTR("distance");
              v118 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_distance(v67, v119, v120, v121, v122);
              v316[6] = objc_msgSend_numberWithDouble_(v118, v123, v124, v125, v126);
              v315[7] = CFSTR("steps");
              v127 = (void *)MEMORY[0x1E0CB37E8];
              v132 = objc_msgSend_steps(v67, v128, v129, v130, v131);
              v316[7] = objc_msgSend_numberWithInt_(v127, v133, v132, v134, v135);
              v315[8] = CFSTR("session");
              v136 = (void *)MEMORY[0x1E0CB37E8];
              v141 = objc_msgSend_session(v67, v137, v138, v139, v140);
              v316[8] = objc_msgSend_numberWithInt_(v136, v142, v141, v143, v144);
              v315[9] = CFSTR("speed");
              v145 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_speed(v67, v146, v147, v148, v149);
              v316[9] = objc_msgSend_numberWithDouble_(v145, v150, v151, v152, v153);
              v315[10] = CFSTR("percentGrade");
              v154 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_percentGrade(v67, v155, v156, v157, v158);
              v316[10] = objc_msgSend_numberWithDouble_(v154, v159, v160, v161, v162);
              v315[11] = CFSTR("gpsSource");
              v163 = (void *)MEMORY[0x1E0CB37E8];
              v168 = objc_msgSend_gpsSource(v67, v164, v165, v166, v167);
              v316[11] = objc_msgSend_numberWithInteger_(v163, v169, v168, v170, v171);
              v173 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v172, (uint64_t)v316, (uint64_t)v315, 12);
              objc_msgSend_addObject_(v45, v174, v173, v175, v176);
            }
            v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v60, (uint64_t)&v301, (uint64_t)v317, 16);
          }
          while (v64);
        }
        v299 = 0u;
        v300 = 0u;
        v297 = 0u;
        v298 = 0u;
        v177 = (void *)objc_msgSend_rawSpeedToKValueBins(v288, v60, v61, v62, v63);
        v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(v177, v178, (uint64_t)&v297, (uint64_t)v314, 16);
        if (v179)
        {
          v184 = v179;
          v185 = *(_QWORD *)v298;
          do
          {
            for (j = 0; j != v184; ++j)
            {
              if (*(_QWORD *)v298 != v185)
                objc_enumerationMutation(v177);
              v187 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * j);
              v312[0] = CFSTR("begin");
              v188 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_begin(v187, v180, v181, v182, v183);
              v313[0] = objc_msgSend_numberWithDouble_(v188, v189, v190, v191, v192);
              v312[1] = CFSTR("end");
              v193 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_end(v187, v194, v195, v196, v197);
              v313[1] = objc_msgSend_numberWithDouble_(v193, v198, v199, v200, v201);
              v312[2] = CFSTR("state");
              v202 = (void *)MEMORY[0x1E0CB37E8];
              v207 = objc_msgSend_state(v187, v203, v204, v205, v206);
              v313[2] = objc_msgSend_numberWithInteger_(v202, v208, v207, v209, v210);
              v312[3] = CFSTR("kValue");
              v211 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_kValue(v187, v212, v213, v214, v215);
              v313[3] = objc_msgSend_numberWithDouble_(v211, v216, v217, v218, v219);
              v221 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v220, (uint64_t)v313, (uint64_t)v312, 4);
              objc_msgSend_addObject_(v289, v222, v221, v223, v224);
            }
            v184 = objc_msgSend_countByEnumeratingWithState_objects_count_(v177, v180, (uint64_t)&v297, (uint64_t)v314, 16);
          }
          while (v184);
        }
        v295 = 0u;
        v296 = 0u;
        v293 = 0u;
        v294 = 0u;
        v225 = (void *)objc_msgSend_stepCadenceToStrideLengthBins(v288, v180, v181, v182, v183);
        v227 = objc_msgSend_countByEnumeratingWithState_objects_count_(v225, v226, (uint64_t)&v293, (uint64_t)v311, 16);
        if (v227)
        {
          v232 = v227;
          v233 = *(_QWORD *)v294;
          do
          {
            for (k = 0; k != v232; ++k)
            {
              if (*(_QWORD *)v294 != v233)
                objc_enumerationMutation(v225);
              v235 = *(void **)(*((_QWORD *)&v293 + 1) + 8 * k);
              v309[0] = CFSTR("begin");
              v236 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_begin(v235, v228, v229, v230, v231);
              v310[0] = objc_msgSend_numberWithDouble_(v236, v237, v238, v239, v240);
              v309[1] = CFSTR("end");
              v241 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_end(v235, v242, v243, v244, v245);
              v310[1] = objc_msgSend_numberWithDouble_(v241, v246, v247, v248, v249);
              v309[2] = CFSTR("state");
              v250 = (void *)MEMORY[0x1E0CB37E8];
              v255 = objc_msgSend_state(v235, v251, v252, v253, v254);
              v310[2] = objc_msgSend_numberWithInteger_(v250, v256, v255, v257, v258);
              v309[3] = CFSTR("strideLength");
              v259 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_kValue(v235, v260, v261, v262, v263);
              v310[3] = objc_msgSend_numberWithDouble_(v259, v264, v265, v266, v267);
              v269 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v268, (uint64_t)v310, (uint64_t)v309, 4);
              objc_msgSend_addObject_(v291, v270, v269, v271, v272);
            }
            v232 = objc_msgSend_countByEnumeratingWithState_objects_count_(v225, v228, (uint64_t)&v293, (uint64_t)v311, 16);
          }
          while (v232);
        }
        v307[0] = CFSTR("history");
        v307[1] = CFSTR("rawSpeedToKValueBins");
        v308[0] = v45;
        v308[1] = v289;
        v307[2] = CFSTR("stepCadenceToStrideLengthBins");
        v308[2] = v291;
        v273 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v228, (uint64_t)v308, (uint64_t)v307, 3);
        if (v273)
        {
          v292 = 0;
          v275 = (void *)objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E0CB36D8], v274, v273, 1, (uint64_t)&v292);
          if (v292)
          {
            if (qword_1EE16D478 != -1)
              dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
            v278 = qword_1EE16D470;
            if (os_log_type_enabled((os_log_t)qword_1EE16D470, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v319 = v292;
              _os_log_impl(&dword_18F1DC000, v278, OS_LOG_TYPE_ERROR, "Unable to serialize stride cal data to json. Error: %@", buf, 0xCu);
            }
            v279 = sub_18F1FCA08(115, 0);
            result = 0;
            if (v279)
            {
              bzero(buf, 0x65CuLL);
              if (qword_1EE16D478 != -1)
                dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
              v305 = 138412290;
              v306 = v292;
              goto LABEL_79;
            }
          }
          else
          {
            if ((objc_msgSend_writeToURL_atomically_(v275, v276, (uint64_t)v287, 0, v277) & 1) != 0)
              return 1;
            if (qword_1EE16D478 != -1)
              dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
            v284 = qword_1EE16D470;
            if (os_log_type_enabled((os_log_t)qword_1EE16D470, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18F1DC000, v284, OS_LOG_TYPE_ERROR, "Unable to write stride cal data to output file.", buf, 2u);
            }
            v285 = sub_18F1FCA08(115, 0);
            result = 0;
            if (v285)
            {
              bzero(buf, 0x65CuLL);
              if (qword_1EE16D478 != -1)
                dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
              LOWORD(v305) = 0;
              goto LABEL_79;
            }
          }
        }
        else
        {
          if (qword_1EE16D478 != -1)
            dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
          v282 = qword_1EE16D470;
          if (os_log_type_enabled((os_log_t)qword_1EE16D470, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18F1DC000, v282, OS_LOG_TYPE_ERROR, "Unable to dump stride calibration data.", buf, 2u);
          }
          v283 = sub_18F1FCA08(115, 0);
          result = 0;
          if (v283)
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EE16D478 != -1)
              dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
            LOWORD(v305) = 0;
            goto LABEL_79;
          }
        }
      }
      else
      {
        if (qword_1EE16D478 != -1)
          dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
        v280 = qword_1EE16D470;
        if (os_log_type_enabled((os_log_t)qword_1EE16D470, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F1DC000, v280, OS_LOG_TYPE_ERROR, "URL must point to a file path which you have access to write to.", buf, 2u);
        }
        v281 = sub_18F1FCA08(115, 0);
        result = 0;
        if (v281)
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D478 != -1)
            dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
          LOWORD(v305) = 0;
          goto LABEL_79;
        }
      }
    }
  }
  else
  {
    if (qword_1EE16D478 != -1)
      dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
    v27 = qword_1EE16D470;
    if (os_log_type_enabled((os_log_t)qword_1EE16D470, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v27, OS_LOG_TYPE_ERROR, "fileURL must be a valid fileURL.", buf, 2u);
    }
    v28 = sub_18F1FCA08(115, 0);
    result = 0;
    if (v28)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D478 != -1)
        dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
      LOWORD(v305) = 0;
      goto LABEL_79;
    }
  }
  return result;
}

- (id)strideCalibrationDump
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend_pedometerProxy(self, a2, v2, v3, v4);
  return (id)MEMORY[0x1E0DE7D20](v5, sel__strideCalibrationDump, v6, v7, v8);
}

- (void)queryRawSpeedToKValueBinsWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F425C30;
  v5[3] = &unk_1E2955B38;
  v5[4] = self;
  v5[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v5, v3, v4);
}

- (void)queryRemoteRawSpeedToKValueBinsWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F425CBC;
  v5[3] = &unk_1E2955B38;
  v5[4] = self;
  v5[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v5, v3, v4);
}

- (void)queryStepCadenceToStrideLengthBinsWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F425D48;
  v5[3] = &unk_1E2955B38;
  v5[4] = self;
  v5[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v5, v3, v4);
}

- (void)queryRemoteStepCadenceToStrideLengthBinsWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F425DD4;
  v5[3] = &unk_1E2955B38;
  v5[4] = self;
  v5[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v5, v3, v4);
}

@end
