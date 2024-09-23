@implementation CMSkiTrackerInternal

- (CMSkiTrackerInternal)init
{
  char *v2;
  uint64_t v3;
  void *__p[2];
  char v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMSkiTrackerInternal;
  v2 = -[CMSkiTrackerInternal init](&v12, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMSkiTracker", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, *((_QWORD *)v2 + 2));
    *((_QWORD *)v2 + 1) = v3;
    if (v11 < 0)
      operator delete(__p[0]);
    v2[24] = 0;
    *((_QWORD *)v2 + 5) = 0;
    *((_QWORD *)v2 + 6) = 0;
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v2 + 56) = _Q0;
    *((_QWORD *)v2 + 4) = 0;
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 1));
  }
  return (CMSkiTrackerInternal *)v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fInternalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMSkiTrackerInternal;
  -[CMSkiTrackerInternal dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  uint64_t v3;

  self->fHandler = 0;
  self->fLiveUpdateHandler = 0;

  self->fMostRecentRecord = 0;
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
  block[2] = sub_18F4871D4;
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
  block[2] = sub_18F4879CC;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);
}

- (void)_queryUpdatesFromRecord:(id)a3 handler:(id)a4
{
  NSObject *fInternalQueue;
  _QWORD block[7];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F487CDC;
  block[3] = &unk_1E2955BD8;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *Object;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  id v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double fRunDistanceOffset;
  uint64_t v51;
  uint64_t v52;
  double fRunElevationDescendedOffset;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  const char *v68;
  double v69;
  CMSkiData *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t started;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  double v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  double v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  double v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  double v118;
  double v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  double v124;
  const char *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  double v134;
  uint64_t v135;
  uint64_t v136;
  double v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  NSObject *v149;
  char *v150;
  id v151;
  id obj;
  uint64_t v153;
  uint64_t v154;
  _QWORD v155[5];
  _QWORD v156[6];
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _QWORD block[6];
  int v162;
  double v163;
  __int16 v164;
  uint64_t v165;
  __int16 v166;
  double v167;
  __int16 v168;
  uint64_t v169;
  uint8_t buf[4];
  double v171;
  __int16 v172;
  uint64_t v173;
  __int16 v174;
  double v175;
  __int16 v176;
  uint64_t v177;
  _BYTE v178[128];
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  v7 = (id)objc_msgSend_copy(self->fHandler, a2, (uint64_t)a3, v3, v4);
  v11 = objc_msgSend_objectForKeyedSubscript_(a3, v8, (uint64_t)CFSTR("CMErrorMessage"), v9, v10);
  v15 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v12, (uint64_t)CFSTR("CMSkiKeyDataArray"), v13, v14);
  if (v11)
  {
    self->fStartedUpdates = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F4889C8;
    block[3] = &unk_1E2955B60;
    block[4] = v11;
    block[5] = v7;
    v20 = MEMORY[0x1E0C80D38];
    v21 = block;
LABEL_3:
    dispatch_async(v20, v21);
    return;
  }
  if (!v15)
  {
    if (qword_1EE16D458 != -1)
      dispatch_once(&qword_1EE16D458, &unk_1E2958B78);
    v149 = qword_1EE16D450;
    if (os_log_type_enabled((os_log_t)qword_1EE16D450, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v149, OS_LOG_TYPE_FAULT, "Unable to parse kCLConnectionMessageSkiDataUpdate message.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D458 != -1)
        dispatch_once(&qword_1EE16D458, &unk_1E2958B78);
      LOWORD(v162) = 0;
      v150 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSkiTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v150);
      if (v150 != (char *)buf)
        free(v150);
    }
    v155[0] = MEMORY[0x1E0C809B0];
    v155[1] = 3221225472;
    v155[2] = sub_18F488A3C;
    v155[3] = &unk_1E2955B10;
    v155[4] = v7;
    v20 = MEMORY[0x1E0C80D38];
    v21 = v155;
    goto LABEL_3;
  }
  obj = v15;
  if (objc_msgSend_count(v15, v16, v17, v18, v19))
  {
    v151 = v7;
    if (self->fRunDistanceOffset == -1.0)
    {
      Object = (void *)objc_msgSend_firstObject(obj, v22, v23, v24, v25);
      objc_msgSend_runDistance(Object, v27, v28, v29, v30);
      self->fRunDistanceOffset = v31;
      objc_msgSend_runElevationDescent(Object, v32, v33, v34, v35);
      self->fRunElevationDescendedOffset = v36;
    }
    v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v154 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v157, (uint64_t)v178, 16);
    if (v154)
    {
      v153 = *(_QWORD *)v158;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v158 != v153)
            objc_enumerationMutation(obj);
          v44 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * v43);
          if (qword_1EE16D458 != -1)
            dispatch_once(&qword_1EE16D458, &unk_1E2958B78);
          v45 = qword_1EE16D450;
          if (os_log_type_enabled((os_log_t)qword_1EE16D450, OS_LOG_TYPE_DEFAULT))
          {
            fRunDistanceOffset = self->fRunDistanceOffset;
            objc_msgSend_runDistance(v44, v46, v47, v48, v49);
            v52 = v51;
            fRunElevationDescendedOffset = self->fRunElevationDescendedOffset;
            objc_msgSend_runElevationDescent(v44, v54, v55, v56, v57);
            *(_DWORD *)buf = 134218752;
            v171 = fRunDistanceOffset;
            v172 = 2048;
            v173 = v52;
            v174 = 2048;
            v175 = fRunElevationDescendedOffset;
            v176 = 2048;
            v177 = v58;
            _os_log_impl(&dword_18F1DC000, v45, OS_LOG_TYPE_DEFAULT, "Delivering update with distance offset %f for record distance %f, elevation offset %f for record elevation %f", buf, 0x2Au);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EE16D458 != -1)
              dispatch_once(&qword_1EE16D458, &unk_1E2958B78);
            v134 = self->fRunDistanceOffset;
            objc_msgSend_runDistance(v44, v130, v131, v132, v133);
            v136 = v135;
            v137 = self->fRunElevationDescendedOffset;
            objc_msgSend_runElevationDescent(v44, v138, v139, v140, v141);
            v162 = 134218752;
            v163 = v134;
            v164 = 2048;
            v165 = v136;
            v166 = 2048;
            v167 = v137;
            v168 = 2048;
            v169 = v142;
            v143 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMSkiTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v143);
            if (v143 != (char *)buf)
              free(v143);
          }
          objc_msgSend_runDistance(v44, v59, v60, v61, v62);
          if (v67 - self->fRunDistanceOffset > 0.0
            || (objc_msgSend_runElevationDescent(v44, v63, v64, v65, v66), v69 - self->fRunElevationDescendedOffset > 0.0))
          {
            v70 = [CMSkiData alloc];
            v75 = objc_msgSend_recordId(v44, v71, v72, v73, v74);
            v80 = objc_msgSend_sourceId(v44, v76, v77, v78, v79);
            v85 = objc_msgSend_sessionId(v44, v81, v82, v83, v84);
            started = objc_msgSend_startDate(v44, v86, v87, v88, v89);
            v95 = objc_msgSend_endDate(v44, v91, v92, v93, v94);
            objc_msgSend_runDistance(v44, v96, v97, v98, v99);
            v101 = v100 - self->fRunDistanceOffset;
            objc_msgSend_runAvgSpeed(v44, v102, v103, v104, v105);
            v107 = v106;
            objc_msgSend_runMaxSpeed(v44, v108, v109, v110, v111);
            v113 = v112;
            objc_msgSend_runSlope(v44, v114, v115, v116, v117);
            v119 = v118;
            objc_msgSend_runElevationDescent(v44, v120, v121, v122, v123);
            v126 = (void *)objc_msgSend_initWithRecordId_sourceId_sessionId_startDate_endDate_runDistance_runAvgSpeed_runMaxSpeed_runSlope_runElevationDescent_(v70, v125, v75, v80, v85, started, v95, v101, v107, v113, v119, v124 - self->fRunElevationDescendedOffset);
            objc_msgSend_addObject_(v37, v127, (uint64_t)v126, v128, v129);

          }
          ++v43;
        }
        while (v154 != v43);
        v144 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v68, (uint64_t)&v157, (uint64_t)v178, 16);
        v154 = v144;
      }
      while (v144);
    }
    if (objc_msgSend_count(v37, v39, v40, v41, v42))
    {
      v156[0] = MEMORY[0x1E0C809B0];
      v156[1] = 3221225472;
      v156[2] = sub_18F488A28;
      v156[3] = &unk_1E2955B60;
      v156[4] = v37;
      v156[5] = v151;
      dispatch_async(MEMORY[0x1E0C80D38], v156);
    }

    self->fMostRecentRecord = (CMSkiData *)(id)objc_msgSend_lastObject(obj, v145, v146, v147, v148);
  }
}

- (void)_startLiveUpdatesWithHandler:(id)a3
{
  NSObject *fInternalQueue;
  _QWORD v4[6];

  fInternalQueue = self->fInternalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F488AE0;
  v4[3] = &unk_1E2955B38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fInternalQueue, v4);
}

- (void)_stopLiveUpdates
{
  NSObject *v3;
  NSObject *fInternalQueue;
  char *v5;
  _QWORD block[5];
  __int16 v7;
  uint8_t buf[1640];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D458 != -1)
    dispatch_once(&qword_1EE16D458, &unk_1E2958B78);
  v3 = qword_1EE16D450;
  if (os_log_type_enabled((os_log_t)qword_1EE16D450, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "[live data] stopping updates", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D458 != -1)
      dispatch_once(&qword_1EE16D458, &unk_1E2958B78);
    v7 = 0;
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSkiTrackerInternal _stopLiveUpdates]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf)
      free(v5);
  }
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F489654;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);
}

@end
