@implementation CMSwimTrackerInternal

- (CMSwimTrackerInternal)init
{
  id v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *__p[2];
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMSwimTrackerInternal;
  v2 = -[CMSwimTrackerInternal init](&v11, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMSwimTracker", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, *((_QWORD *)v2 + 2));
    *((_QWORD *)v2 + 1) = v3;
    if (v10 < 0)
      operator delete(__p[0]);
    *((_QWORD *)v2 + 4) = 0;
    *((_BYTE *)v2 + 24) = 0;
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    objc_msgSend__resetOffsets(v2, v4, v5, v6, v7);
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 1));
  }
  return (CMSwimTrackerInternal *)v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fInternalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMSwimTrackerInternal;
  -[CMSwimTrackerInternal dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  uint64_t v3;

  self->fHandler = 0;
  if (self->fLocationdConnection)
  {
    v3 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v3, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_startUpdatesFromRecord:(id)a3 handler:(id)a4
{
  NSObject *fInternalQueue;
  _QWORD block[7];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4C9364;
  block[3] = &unk_1E2955C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)_stopUpdates
{
  NSObject *fInternalQueue;
  _QWORD block[5];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4C99E0;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);
}

- (void)_querySwimUpdatesFromRecord:(id)a3 handler:(id)a4
{
  NSObject *fInternalQueue;
  _QWORD block[7];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4C9D28;
  block[3] = &unk_1E2955BD8;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(fInternalQueue, block);
}

- (void)_querySWOLFSummaryWithSessionID:(id)a3 handler:(id)a4
{
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *fInternalQueue;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD block[7];
  int v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D7F8 != -1)
    dispatch_once(&qword_1EE16D7F8, &unk_1E2955408);
  v7 = qword_1EE16D800;
  if (os_log_type_enabled((os_log_t)qword_1EE16D800, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = objc_msgSend_UUIDString(a3, v8, v9, v10, v11);
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "SWOLF query for session: %@", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D7F8 != -1)
      dispatch_once(&qword_1EE16D7F8, &unk_1E2955408);
    v19 = 138412290;
    v20 = objc_msgSend_UUIDString(a3, v13, v14, v15, v16);
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSwimTrackerInternal _querySWOLFSummaryWithSessionID:handler:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4CA5A8;
  block[3] = &unk_1E2955C70;
  block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(fInternalQueue, block);
}

- (void)_handleUpdates:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void **p_vtable;
  CMSwimTrackerInternal *Object;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  NSObject *v67;
  double v68;
  double v69;
  char *v70;
  NSObject *v71;
  double v72;
  double v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  double v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *started;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t fStrokeCountOffset;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  double v124;
  double v125;
  double fDistanceOffset;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  double v140;
  double v141;
  double fActiveTime;
  double v143;
  unint64_t v144;
  unint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  NSObject *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  pid_t v172;
  NSObject *v173;
  NSObject *v174;
  char *v175;
  char *v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  pid_t v192;
  char *v193;
  id v194;
  void *v195;
  void *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  CMSwimData *v200;
  uint64_t v201;
  _QWORD v202[6];
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  _QWORD v207[5];
  _QWORD block[6];
  _BYTE v209[128];
  int v210;
  CMSwimTrackerInternal *v211;
  __int16 v212;
  uint64_t v213;
  __int16 v214;
  _QWORD v215[3];
  uint8_t buf[4];
  CMSwimTrackerInternal *v217;
  __int16 v218;
  uint64_t ExecutablePathFromPid;
  __int16 v220;
  _QWORD v221[205];

  v221[202] = *MEMORY[0x1E0C80C00];
  v7 = (id)objc_msgSend_copy(self->fHandler, a2, (uint64_t)a3, v3, v4);
  v11 = objc_msgSend_objectForKeyedSubscript_(a3, v8, (uint64_t)CFSTR("CMErrorMessage"), v9, v10);
  v15 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v12, (uint64_t)CFSTR("CMSwimKeyDataArray"), v13, v14);
  if (v11)
  {
    self->fStartedUpdates = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F4CB980;
    block[3] = &unk_1E2955B60;
    block[4] = v11;
    block[5] = v7;
    v20 = MEMORY[0x1E0C80D38];
    v21 = block;
LABEL_3:
    dispatch_async(v20, v21);
    return;
  }
  v22 = v15;
  if (!v15)
  {
    if (qword_1EE16D7F8 != -1)
      dispatch_once(&qword_1EE16D7F8, &unk_1E2955408);
    v173 = qword_1EE16D800;
    if (os_log_type_enabled((os_log_t)qword_1EE16D800, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v217 = self;
      _os_log_impl(&dword_18F1DC000, v173, OS_LOG_TYPE_FAULT, "Unable to parse update message, %p", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D7F8 != -1)
        dispatch_once(&qword_1EE16D7F8, &unk_1E2955408);
      v210 = 134217984;
      v211 = self;
      v176 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSwimTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v176);
      if (v176 != (char *)buf)
        free(v176);
    }
    v207[0] = MEMORY[0x1E0C809B0];
    v207[1] = 3221225472;
    v207[2] = sub_18F4CB9E0;
    v207[3] = &unk_1E2955B10;
    v207[4] = v7;
    v20 = MEMORY[0x1E0C80D38];
    v21 = v207;
    goto LABEL_3;
  }
  p_vtable = &OBJC_METACLASS___CMCardioFitnessSummary.vtable;
  if (objc_msgSend_count(v15, v16, v17, v18, v19))
  {
    v194 = v7;
    v195 = v22;
    if (self->fDistanceOffset == 1.79769313e308)
    {
      Object = (CMSwimTrackerInternal *)objc_msgSend_firstObject(v22, v23, v24, v25, v26);
      objc_msgSend_distance(Object, v29, v30, v31, v32);
      self->fDistanceOffset = v33;
      self->fStrokeCountOffset = objc_msgSend_strokeCount(Object, v34, v35, v36, v37);
      self->fLapCountOffset = objc_msgSend_lapCount(Object, v38, v39, v40, v41);
      self->fSegmentCountOffset = objc_msgSend_segment(Object, v42, v43, v44, v45);
      if (qword_1EE16D7F8 != -1)
        dispatch_once(&qword_1EE16D7F8, &unk_1E2955408);
      v46 = qword_1EE16D800;
      if (os_log_type_enabled((os_log_t)qword_1EE16D800, OS_LOG_TYPE_DEFAULT))
      {
        v47 = getpid();
        *(_DWORD *)buf = 138413058;
        v217 = Object;
        v218 = 2112;
        ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v48, v47, v49, v50);
        v220 = 1024;
        LODWORD(v221[0]) = getpid();
        WORD2(v221[0]) = 2048;
        *(_QWORD *)((char *)v221 + 6) = self;
        _os_log_impl(&dword_18F1DC000, v46, OS_LOG_TYPE_DEFAULT, "Setting offset record for live updates, %@, %@, %d, %p", buf, 0x26u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D7F8 != -1)
          dispatch_once(&qword_1EE16D7F8, &unk_1E2955408);
        v177 = getpid();
        v210 = 138413058;
        v211 = Object;
        v212 = 2112;
        v213 = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v178, v177, v179, v180);
        v214 = 1024;
        LODWORD(v215[0]) = getpid();
        WORD2(v215[0]) = 2048;
        *(_QWORD *)((char *)v215 + 6) = self;
        v181 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMSwimTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v181);
        if (v181 != (char *)buf)
          free(v181);
        p_vtable = (void **)(&OBJC_METACLASS___CMCardioFitnessSummary + 24);
      }
    }
    v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v203 = 0u;
    v204 = 0u;
    v205 = 0u;
    v206 = 0u;
    v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v52, (uint64_t)&v203, (uint64_t)v209, 16);
    v196 = v51;
    if (v53)
    {
      v58 = v53;
      v201 = *(_QWORD *)v204;
      do
      {
        v59 = 0;
        v197 = v58;
        do
        {
          if (*(_QWORD *)v204 != v201)
            objc_enumerationMutation(v22);
          v60 = *(void **)(*((_QWORD *)&v203 + 1) + 8 * v59);
          objc_msgSend_distance(v60, v54, v55, v56, v57);
          v66 = v65 - self->fDistanceOffset;
          if (v66 >= -2.22044605e-16)
          {
            if (v66 >= 2.22044605e-16)
            {
              v74 = (void *)objc_msgSend_endDate(v60, v61, v62, v63, v64);
              objc_msgSend_timeIntervalSinceReferenceDate(v74, v75, v76, v77, v78);
              v80 = v79;
              started = (void *)objc_msgSend_startDate(v60, v81, v82, v83, v84);
              objc_msgSend_timeIntervalSinceReferenceDate(started, v86, v87, v88, v89);
              self->fActiveTime = self->fActiveTime + v80 - v90;
              v200 = [CMSwimData alloc];
              v199 = objc_msgSend_recordId(v60, v91, v92, v93, v94);
              v198 = objc_msgSend_sourceId(v60, v95, v96, v97, v98);
              v103 = objc_msgSend_sessionId(v60, v99, v100, v101, v102);
              v108 = objc_msgSend_startDate(v60, v104, v105, v106, v107);
              v113 = objc_msgSend_endDate(v60, v109, v110, v111, v112);
              v118 = objc_msgSend_strokeCount(v60, v114, v115, v116, v117);
              fStrokeCountOffset = self->fStrokeCountOffset;
              objc_msgSend_distance(v60, v120, v121, v122, v123);
              v125 = v124;
              fDistanceOffset = self->fDistanceOffset;
              v131 = objc_msgSend_distanceTimestamp(v60, v127, v128, v129, v130);
              objc_msgSend_distance(v60, v132, v133, v134, v135);
              v141 = 0.0;
              if (v140 - self->fDistanceOffset > 0.0)
              {
                fActiveTime = self->fActiveTime;
                objc_msgSend_distance(v60, v136, v137, v138, v139);
                v141 = fActiveTime / (v143 - self->fDistanceOffset);
              }
              v144 = v118 - fStrokeCountOffset;
              v145 = objc_msgSend_lapCount(v60, v136, v137, v138, v139) - self->fLapCountOffset;
              v150 = objc_msgSend_strokeType(v60, v146, v147, v148, v149);
              v155 = objc_msgSend_segment(v60, v151, v152, v153, v154);
              v157 = (void *)objc_msgSend_initWithRecordId_sourceId_sessionId_startDate_endDate_strokeCount_distance_distanceTimestamp_avgPace_lapCount_strokeType_segment_SWOLF_segmentSWOLF_(v200, v156, v199, v198, v103, v108, v113, v144, v125 - fDistanceOffset, v141, 0.0, 0.0, v131, v145, v150, v155 - self->fSegmentCountOffset);
              v51 = v196;
              objc_msgSend_addObject_(v196, v158, (uint64_t)v157, v159, v160);

              p_vtable = &OBJC_METACLASS___CMCardioFitnessSummary.vtable;
              v22 = v195;
              v58 = v197;
            }
            else
            {
              if (qword_1EE16D7F8 != -1)
                dispatch_once(&qword_1EE16D7F8, &unk_1E2955408);
              v71 = p_vtable[256];
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                v72 = self->fDistanceOffset;
                *(_DWORD *)buf = 134218498;
                v217 = *(CMSwimTrackerInternal **)&v72;
                v218 = 2112;
                ExecutablePathFromPid = (uint64_t)v60;
                v220 = 2048;
                v221[0] = self;
                _os_log_impl(&dword_18F1DC000, v71, OS_LOG_TYPE_DEFAULT, "(Approximately) Zero distance from offset, %f, %@, %p", buf, 0x20u);
              }
              if (sub_18F1FCA08(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE16D7F8 != -1)
                  dispatch_once(&qword_1EE16D7F8, &unk_1E2955408);
                v73 = self->fDistanceOffset;
                v210 = 134218498;
                v211 = *(CMSwimTrackerInternal **)&v73;
                v212 = 2112;
                v213 = (uint64_t)v60;
                v214 = 2048;
                v215[0] = self;
                v70 = (char *)_os_log_send_and_compose_impl();
                sub_18F419700("Generic", 1, 0, 2, "-[CMSwimTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v70);
                goto LABEL_36;
              }
            }
          }
          else
          {
            if (qword_1EE16D7F8 != -1)
              dispatch_once(&qword_1EE16D7F8, &unk_1E2955408);
            v67 = p_vtable[256];
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              v68 = self->fDistanceOffset;
              *(_DWORD *)buf = 134218498;
              v217 = *(CMSwimTrackerInternal **)&v68;
              v218 = 2112;
              ExecutablePathFromPid = (uint64_t)v60;
              v220 = 2048;
              v221[0] = self;
              _os_log_impl(&dword_18F1DC000, v67, OS_LOG_TYPE_ERROR, "Negative distance from offset, %f, %@, %p", buf, 0x20u);
            }
            if (sub_18F1FCA08(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1EE16D7F8 != -1)
                dispatch_once(&qword_1EE16D7F8, &unk_1E2955408);
              v69 = self->fDistanceOffset;
              v210 = 134218498;
              v211 = *(CMSwimTrackerInternal **)&v69;
              v212 = 2112;
              v213 = (uint64_t)v60;
              v214 = 2048;
              v215[0] = self;
              v70 = (char *)_os_log_send_and_compose_impl();
              sub_18F419700("Generic", 1, 0, 0, "-[CMSwimTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v70);
LABEL_36:
              if (v70 != (char *)buf)
                free(v70);
            }
          }
          ++v59;
        }
        while (v58 != v59);
        v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v54, (uint64_t)&v203, (uint64_t)v209, 16);
      }
      while (v58);
    }
    if (objc_msgSend_count(v51, v54, v55, v56, v57))
    {
      v202[0] = MEMORY[0x1E0C809B0];
      v202[1] = 3221225472;
      v202[2] = sub_18F4CBA2C;
      v202[3] = &unk_1E2955B60;
      v202[4] = v51;
      v202[5] = v194;
      dispatch_async(MEMORY[0x1E0C80D38], v202);
      if (qword_1EE16D7F8 != -1)
        dispatch_once(&qword_1EE16D7F8, &unk_1E2955408);
      v161 = p_vtable[256];
      if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
      {
        v166 = objc_msgSend_lastObject(v51, v162, v163, v164, v165);
        v167 = getpid();
        v171 = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v168, v167, v169, v170);
        v172 = getpid();
        *(_DWORD *)buf = 138413058;
        v217 = (CMSwimTrackerInternal *)v166;
        v218 = 2112;
        ExecutablePathFromPid = v171;
        v220 = 1024;
        LODWORD(v221[0]) = v172;
        WORD2(v221[0]) = 2048;
        *(_QWORD *)((char *)v221 + 6) = self;
        _os_log_impl(&dword_18F1DC000, v161, OS_LOG_TYPE_DEFAULT, "%@, %@, %d, %p", buf, 0x26u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D7F8 != -1)
          dispatch_once(&qword_1EE16D7F8, &unk_1E2955408);
        v186 = objc_msgSend_lastObject(v196, v182, v183, v184, v185);
        v187 = getpid();
        v191 = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v188, v187, v189, v190);
        v192 = getpid();
        v210 = 138413058;
        v211 = (CMSwimTrackerInternal *)v186;
        v212 = 2112;
        v213 = v191;
        v214 = 1024;
        LODWORD(v215[0]) = v192;
        WORD2(v215[0]) = 2048;
        *(_QWORD *)((char *)v215 + 6) = self;
        v193 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMSwimTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v193);
        if (v193 != (char *)buf)
          free(v193);
        v51 = v196;
      }
    }

  }
  else
  {
    if (qword_1EE16D7F8 != -1)
      dispatch_once(&qword_1EE16D7F8, &unk_1E2955408);
    v174 = qword_1EE16D800;
    if (os_log_type_enabled((os_log_t)qword_1EE16D800, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v217 = self;
      _os_log_impl(&dword_18F1DC000, v174, OS_LOG_TYPE_DEFAULT, "#Warning Empty swim update, %p", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D7F8 != -1)
        dispatch_once(&qword_1EE16D7F8, &unk_1E2955408);
      v210 = 134217984;
      v211 = self;
      v175 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMSwimTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v175);
      if (v175 != (char *)buf)
        free(v175);
    }
  }
}

- (void)_resetOffsets
{
  self->fStrokeCountOffset = 0;
  self->fDistanceOffset = 1.79769313e308;
  self->fActiveTime = 0.0;
  self->fSegmentCountOffset = 0;
  self->fLapCountOffset = 0;
}

@end
